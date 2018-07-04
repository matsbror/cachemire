/**********************************************************************
*
*    Title:             Main.cc
*    Creation Date:     92-02-21
*    Author:            Mats Brorsson
*    Function:          Main module for CacheMire-2
*
*    Change log:       94-06-21        Rewritten to work with a c++ compiler
* 
**********************************************************************/
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <cachemire-2.h>
#include <cm_memory.h>
#include <loadfile.h>
#include <sparc.h>
#include "statistics.h"
#include <syscall.h>
#include "cache.h"

/*
* Initialise system parameters to default values 
*/
static int sd = 1;              // Sampling distance
int lock_model = SW_LOCKS_BACKOFF;
int no_procs = NO_PROCS;
int cur_procs = 1;
int stack_size = STACK_SIZE;
int block_size = BLOCK_SIZE;
static int cache_size = 0;  /* 0 means infinite caches */
// Degree of associativity
static int deg_ass    = 1;           // 1 means direct mapping
// -1 means fully associative
char out_dir[80] = ".";

static FILE *tfd;
static char tracefilename[80] = "";
static int do_trace = 0;
static int no_trace = 0;

/* The global time variable. It is reachable from all files
and holds the current global time. */
unsigned long global_time = 0;
unsigned long instruction_count = 0;
unsigned long start_time = 0;
unsigned long end_time = 0;
time_t real_start_time;
time_t real_end_time;

// Various addresses
unsigned long max_text_addr = 0;
unsigned long min_text_addr = 0xffffffff;
unsigned long max_data_addr = 0;
unsigned long min_data_addr = 0xffffffff;

unsigned long text_start;  // read-only start   .text
unsigned long text_end;    // read-only end     .rodata1
unsigned long data_start;  // read/write start  .data
unsigned long data_end;    // read/write end    .bss

unsigned long heap_start;
unsigned long heap_end;

/* This struct describes the state of each processor between 
memory references */
typedef struct _ProcessorStateRec {
  Sparc         sparcPtr;                 /* machine descriptor */
  unsigned long data;
  unsigned long addressOut;
  unsigned long addressSpace;
  unsigned long byteMask;
  unsigned long physical_address;
  unsigned long attributes;
  MemOpType    memOp;
  unsigned long time;
  
  int       no_wait_cycles;
  unsigned long  cycles_in_state[end_stall_state];
  int       StallStatus;
  unsigned long lock_addr;

  int           simulate : 1;       // Signals a lock stall or exit stall
  int           not_stalled  : 1;   // Signals a memory access stall
} ProcessorStateRec;

/* An array with an entry for each processor holding state information
according to the struct above. */
ProcessorStateRec *p_stat;  /* contains state of a processor */
unsigned long      *sp;               /* Array with stack pointers */

int    end_simulation = 0;    /* flag which is 1 as long as the simulation 
goes on */

static  unsigned long             start_addr;

static unsigned long trace_addr = 0;
static int do_stat = 0;

int  state;
int  sim_latency = 1;
char command_string[256] = "";

// These parameters can be overridden by the -m switch
unsigned long npages = NPAGES;
unsigned long mem_size = MEM_SIZ;

main(int argc, char **argv) {
  char            programfilename[80] = "";
  char            tmp_str[80];
  int             i;
  int             user_argc = 0;
  char          **user_argv = 0;
  int             intr_proc = 0;
  int             no_procs_waiting = 0;
  int            *instr_count = NULL;
  int             stall;
  unsigned long   ppage;
  unsigned long   ul;
   
  fprintf(stderr, "******************** NEW RUN ******************************\n");

 /* Process command line args.  */

  for (i = 0; i < argc; i++) {
    strcat(command_string, argv[i]);
    strcat(command_string, " ");
  }

  argv++;
  while( --argc > 0 )
    {
      if( **argv == '-' )
	switch( (*argv)[1] )
	  {
	  case 'p':  /* Read number of processors */
	    if (--argc <= 0)  
	      goto usage;
	    no_procs = atoi(*(++argv));
	    break;
	    
	  case 'm':  /* Read number of MB in memory */
	    if (--argc <= 0)  
	      goto usage;
	    ul = strtoul(*(++argv), (char **)NULL, 10);
	    if (ul > 2048) {
		fprintf(stderr,"Main memory cannot be more than 2048 MB!\n");
	    }
	    mem_size = 0x100000 * ul;

	    npages = mem_size >> LOGMEM;
	    break;

	  case 's':
	    do_stat = 1;
	    break;

	    
	  case 't':
	    if (--argc <= 0)
	      goto usage;
	    do_trace = 1;
	    
	    sprintf(tracefilename, "%s/%s", out_dir, *(++argv));
	    tfd = fopen(tracefilename, "w");
	    
	    break;
	    
	  case 'F':
	    if (--argc <= 0)
	      goto usage;
	    sprintf(tmp_str, "%s/%s", out_dir, *(++argv));
	    foot_fp = fopen(tmp_str, "w");
	    footprint = 1;
	    break;
	    
	  case 'l':	
	    sim_latency = 0;
	    break;
	    
	  case 'B':	
	    if (--argc <= 0)
	      goto usage;
	    block_size = atoi(*(++argv));
	    break;
	    
	  case 'S':	
	    if (--argc <= 0)
	      goto usage;
	    sd = atoi(*(++argv));
	    break;
	    
	  case 'c':	
	    if (--argc <= 0)
	      goto usage;
	    cache_size = int(atof(*(++argv)) * 1024);
	    break;
	    
	  case 'd':	
	    if (--argc <= 0)
	      goto usage;
	    deg_ass = atoi(*(++argv));
	    break;

	  case 'D':
	    do_stat = 1;
	    sb_base = 1;
	    break;

	  case 'O':	
	      // Determine output directory
	    if (--argc <= 0)
	      goto usage;
	    strcpy(out_dir, *(++argv));
	    break;
	    
	  case 'L':

	    if (--argc <= 0)
	      goto usage;
	    lock_model = atoi(*(++argv));

	    if (lock_model == HW_QLOCKS) {
	      fprintf(stderr, "Hardware based queueing locks not available\n");
	      goto usage;
	    }

	    break;

	  case '?':
	    goto usage;
	    break;

	  case 'f':	/* process command line arguments for user programs */
	    
	    if (--argc <= 0)
	      goto usage;
	    strcpy(programfilename, *(++argv));
	    
	    user_argc = argc;
	    user_argv = argv;
	    
	    goto start_init;
	    break;
	  default:
	    fprintf(stderr, "CacheMire-2: unknown option: %s\n", *argv );
	    goto usage;
	  }
      else
	goto usage;
      
      argv++;
    }
  
 start_init: 
  
  if (!strcmp(programfilename, "")){
    strcpy(programfilename, "a.out");
  }
  
  fputs("InitMemory ... ", stderr);
  
  if (CM_ERROR == InitMemory()){
    fprintf(stderr, "Could not initialise memory.\n");
    exit(1);
  }
  
  fprintf(stderr,"Memory size = %d MB\n", mem_size/0x100000);
  fputs("done\n", stderr);
  fflush(stderr);
  
  cache_init(cache_size, block_size, sim_latency, deg_ass);
  
  sprintf(tmp_str, "Read %s ... ", programfilename);
  fputs(tmp_str, stderr);
  fflush(stderr);
  
  if (load_file(programfilename, &start_addr) != CM_OK)
    exit(-1);
  
  fputs("done\n", stderr);
  fflush(stderr);
  
  fputs("Init processors ... ", stderr);
  fflush(stderr);
  
  p_stat = 
    (ProcessorStateRec *)malloc(no_procs*sizeof(ProcessorStateRec));
  sp = new unsigned long [no_procs];
  
  if (do_trace)
    instr_count = (int *)calloc(no_procs, sizeof(int));
  
  // calculate end of heap
  heap_end = (unsigned long)  mem_size - (no_procs+1)*stack_size - 2*PAGE_SIZE;

  for (i = 0; i < no_procs; i++) {
      unsigned long stack_start = (unsigned long) mem_size-(i+1)*stack_size;
      unsigned long stack_end   = 
	  (unsigned long) ((mem_size-i*stack_size-PAGE_SIZE+7) & ~007);

      sp[i] = stack_end;

      if (user_argc){
	  int j;
	  unsigned long next_free_addr = sp[i]+68;
	  unsigned long start = next_free_addr;
	  
	  GlobalMemoryOp(INVALID, WRITE_OP, sp[i]+64, 
			 (unsigned long *) &user_argc,  S_WORD);

	  CopyMemSun2CM(INVALID, (unsigned long) user_argv, next_free_addr, 
			4*user_argc);
	  next_free_addr += 4*user_argc;

	  for (j = 0; j < user_argc; j++){
	      GlobalMemoryOp(INVALID, WRITE_OP, start+j*4, 
			     (&next_free_addr), S_WORD);
	      CopyMemSun2CM(INVALID, (unsigned long) user_argv[j], 
			    next_free_addr, 
			    strlen(user_argv[j])+1);
	      next_free_addr += strlen(user_argv[j])+1;
	  } 
      }
  }

  for (i = 0; i < no_procs; i++){
    p_stat[i].sparcPtr = 
      InitSparc(i, start_addr, sp[i], user_argc, sp[i]+68);
    p_stat[i].simulate = 0;
    p_stat[i].not_stalled = 0;
    p_stat[i].time = 0;
    p_stat[i].lock_addr = 0;

    if (do_trace)
      instr_count[i] = 0;

    p_stat[i].no_wait_cycles = 0;
    for (state = Busy; state < end_stall_state; state++) {
	p_stat[i].cycles_in_state[state] = 0;
    }
    p_stat[i].StallStatus = Busy;
  }
  p_stat[0].simulate = 1;
  p_stat[0].not_stalled = 1;

  fputs("done\n", stderr);
  fflush(stderr);

  switch (lock_model) {
  case SW_LOCKS:
      fprintf(stderr, "Use simple spin-lock software locks\n");
      break;
  case SW_LOCKS_BACKOFF:
      fprintf(stderr, "Use spin-lock software locks with backoff\n");
      break;
  case HW_QLOCKS:
      fprintf(stderr, "Use hardware based queuing locks\n");
      break;
  case IDEAL_LOCKS:
      fprintf(stderr, "Use ideal locks\n");
      break;
  default:
      fprintf(stderr, "No such locking model\n");
      goto usage;
  }
  fflush(stderr);

  if (do_stat) {
    fputs("Init Statistics ... ", stderr);
    fflush(stderr);
    InitStatistics(block_size, programfilename, command_string);
    fputs("done\n", stderr);
  }
  fflush(stderr);
  
  initdone = 1;
  
  //  Start simulation

  fprintf(stderr, "Simulation parameters:\n");
  fprintf(stderr, "Number of processors: %d\n", no_procs);
  fprintf(stderr, "Program: ");
  for (i = 0; i < user_argc; i++){
      fprintf(stderr,"%s ", user_argv[i]);
  }
  fprintf(stderr,"\n");
  
  
  fprintf(stderr,"Start Simulation...\n");
  fflush(stderr);
  
  /* Main simulation loop */
  while (1){
    
      for (i = 0; i < cur_procs; i++){
      
	  if (p_stat[i].simulate && p_stat[i].not_stalled){

	      do {

		  SparcCycle(p_stat[i].sparcPtr,
			     &p_stat[i].data,
			     &p_stat[i].addressOut,
			     &p_stat[i].addressSpace,
			     &p_stat[i].byteMask,
			     &p_stat[i].memOp);
	  
		  ppage =
		      AddressTranslation(i,
					 p_stat[i].addressOut>>LOGMEM,
					 &p_stat[i].attributes);
		  
	      
		  p_stat[i].physical_address = (ppage<<LOGMEM) |
		      (p_stat[i].addressOut & OFFSET_MASK);


		  //**********************************************************
		  //  
		  // This is the place to enter calls to your own memory 
		  // simulator.
		  //
		  //**********************************************************
	  

		  if (start_stat && (p_stat[i].attributes & SHARED)) {
		      if (p_stat[i].memOp == READ_OP) {

			  stall = cache_read(i, p_stat[i].addressOut);
			  
			  MemoryOp(p_stat[i].memOp, 
				   p_stat[i].physical_address,
				   &p_stat[i].data,
				   p_stat[i].byteMask);
		      
		      } else if (p_stat[i].memOp == WRITE_OP) {

			  stall = cache_write(i,p_stat[i].addressOut);
		      
			  MemoryOp(p_stat[i].memOp, 
				   p_stat[i].physical_address,
				   &p_stat[i].data,
				   p_stat[i].byteMask);
			  
		      } else { // TESTANDSET_OP

			stall = cache_synch(i, p_stat[i].addressOut,
					    p_stat[i].data);
			

			  MemoryOp(p_stat[i].memOp, 
				   p_stat[i].physical_address,
				   &p_stat[i].data,
				   p_stat[i].byteMask);

		      }
		    } else {
		      // Assume a hit in the cache for instructions
		      // Allow private data references to be fetched
		      // simultaneously with an instruction
		      // Harvard architecture!
		      if (p_stat[i].addressSpace == USER_INSTR_AS) {
			  stall = 1;
		      } else {
			  stall = 0;
		      }

		      MemoryOp(p_stat[i].memOp, 
			       p_stat[i].physical_address,
			       &p_stat[i].data,
			       p_stat[i].byteMask);
		      
		  }
	      
		  if (start_stat && do_stat) {
		      GatherStatistics(i, p_stat[i].memOp, 
				       p_stat[i].addressOut,
				       p_stat[i].addressSpace,
				       p_stat[i].attributes);
		      
		      if (p_stat[i].addressSpace == USER_INSTR_AS)
			  instruction_count++;

		  }
	    
	  
		  // Repeat if no stall
	      } while (!stall);
	      
	  } // end simulate 
		  	  
	  
	  if (start_stat) {
	      p_stat[i].cycles_in_state[p_stat[i].StallStatus]++;
	  }
      }

      // Perform system wide actions 
      cache_cycle();
      
      // Advance time 
      global_time++;
      
  }
    
 usage:
  fprintf(stderr, "The following switches exist:\n");
  fprintf(stderr, "-p n\tUse n processors\n");
  fprintf(stderr, "-f prog\tRun application prog\n");
  fprintf(stderr, "-m m\tUse m MB of main memory\n");
  fprintf(stderr, "-l\tSimulate 0 latency\n");
  fprintf(stderr, "-B b\tUse block size b\n");
  fprintf(stderr, "-c c\tCache size c KB, (c = 0 => Infinite cache)\n");
  fprintf(stderr, "-d d\tUse d-way set associative address mapping\n");
  fprintf(stderr, "\t(d = -1 => Fully associative)\n");
  fprintf(stderr, "-s\tGenerate cache statistics\n");
  
  
  exit(1);
}

void EndOfSimulation(){
  unsigned exe_time = end_time - start_time;
  time_t  wc_time = real_end_time - real_start_time;
  int i;
  float contr[end_stall_state];
  float t_contr[end_stall_state];

  
  /*
   *
   *   End of simulation
   * 
   */

  fprintf(stderr, "Number of processor cycles: %u\n", global_time);

  if (do_trace){
    fclose(tfd);
    fprintf(stderr, "Trace file is: %s\n", tracefilename);
  }

  fprintf(stderr, "Measured execution time: %f seconds\n", (double)exe_time/100e6);
  fprintf(stderr, "(assuming 100MHz clock cycle)\n");
  fprintf(stderr, "Wall clock time = %d seconds\n", (int) wc_time);

  if (do_stat)
    PrintStatistics();

  cache_stats();

  if (sim_latency) {
    fprintf(stderr, "\n\nFraction of execution time spent in different states.\n");
  
    for (state = Busy; state < end_stall_state; state++) {
      t_contr[state] = 0.0;
    }
  
    fprintf(stderr, "pid\tBusy\tSynch\tRead\tWrite\n");
    fprintf(stderr, "   \t    \tstall\tstall\tstall\n");
    fprintf(stderr, "----------------------------------------\n");
    for (i = 0; i < no_procs; i++){
    
      fprintf(stderr, "%d\t", i);
      for (state = Busy; state < end_stall_state; state++) {
        contr[state] = 
              (float)p_stat[i].cycles_in_state[state]/exe_time;
        t_contr[state] += contr[state];
        fprintf(stderr, "%.3f\t", contr[state]);
      }
      fprintf(stderr, "\n");
    }
  
    fprintf(stderr, "----------------------------------------\n");
    fprintf(stderr, "mean\t%.3f\t%.3f\t%.3f\t%.3f\n",
	   t_contr[Busy]/no_procs, 
	   t_contr[SynchStall]/no_procs,
  	   t_contr[ReadStall]/no_procs, 
	   t_contr[WriteStall]/no_procs);
  
    fprintf(stderr, "\n\nExecution time spent in different states.\n");
  
    for (state = Busy; state < end_stall_state; state++ ) {
      t_contr[state] = 0.0;
    }
  
    fprintf(stderr, "pid\tBusy\tSynch\tRead\tWrite\n");
    fprintf(stderr, "   \t    \tstall\tstall\tstall\n");
    fprintf(stderr, "----------------------------------------\n");
    for (i = 0; i < no_procs; i++){
      fprintf(stderr, "%d\t", i);
      for (state = Busy; state < end_stall_state; state++) {
        t_contr[state] += (float)p_stat[i].cycles_in_state[state];
        fprintf(stderr, "%u\t", p_stat[i].cycles_in_state[state]);
      }
      fprintf(stderr, "\n");
    }
    fprintf(stderr, "----------------------------------------\n");
    fprintf(stderr, "mean\t%.0f\t%.0f\t%.0f\t%.0f\n",
	   t_contr[Busy]/no_procs, 
  	   t_contr[SynchStall]/no_procs,
	   t_contr[ReadStall]/no_procs, 
	   t_contr[WriteStall]/no_procs);
  }

  exit(0);
}

void StartProc(int ProcToStart, unsigned long start_addr){
  procs_running++;
  cur_procs = no_procs;
  p_stat[ProcToStart].simulate = 1;
  p_stat[ProcToStart].not_stalled = 1;
  p_stat[ProcToStart].StallStatus = Busy;

  if (ProcToStart != 0) {
    p_stat[ProcToStart].sparcPtr->PC = start_addr;
    p_stat[ProcToStart].sparcPtr->nPC = start_addr+4;
  }
  
} /* end StartProc */

void ExitProc(int ProcToExit){
  procs_running--;

  p_stat[ProcToExit].simulate = 0;
  p_stat[ProcToExit].not_stalled = 0;
  if (ProcToExit == 0){
    end_simulation = 1;
  }
}

void ResumeProc(int ProcToStart){

    p_stat[ProcToStart].simulate = 1;
    if (p_stat[ProcToStart].StallStatus != SynchStall) 
	p_stat[ProcToStart].StallStatus = Busy;
    
}

void StopProc(int ProcToStop, int stall_status){

    p_stat[ProcToStop].simulate = 0;

    if (p_stat[ProcToStop].StallStatus != SynchStall) 
	p_stat[ProcToStop].StallStatus = stall_status;
    
}

void LockProc(int p, unsigned long lock_addr){
  p_stat[p].not_stalled = 0;
  p_stat[p].lock_addr = lock_addr;
}

// Unlock one of the processors waiting for a lock
// Return the identity of the unlocked processor
int UnLockProc(unsigned long lock_addr){
    static int np;

    for (int i = 0; i < no_procs; i++) {
	np++;
	if (np >= no_procs) {
	    np = 0;
	}
	if (p_stat[np].lock_addr == lock_addr) {
	    p_stat[np].not_stalled = 1;
	    p_stat[np].lock_addr = 0;
	    return np;
	}
    }
    return INVALID;
}

// Unlock all the processors waiting for a lock
void UnLockAllProcs(unsigned long lock_addr){
  for (int i = 0;i < no_procs; i++) {
    if (p_stat[i].lock_addr == lock_addr) {
      p_stat[i].not_stalled = 1;
      p_stat[i].lock_addr = 0;
    }
  }
}


void EnterAcquire(int p){
  p_stat[p].StallStatus = SynchStall;
}

void ExitAcquire(int p){
  p_stat[p].StallStatus = Busy;
}

void EnterRelease(int p){
}

void EnterBarrier(int p){
  p_stat[p].StallStatus = SynchStall;
}

void ExitBarrier(int p){
  p_stat[p].StallStatus = Busy;
}

Sparc get_sparc(int pid) {
    return p_stat[pid].sparcPtr;
}

