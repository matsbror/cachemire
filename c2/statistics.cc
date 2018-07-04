#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "statistics.h"
#include "cachemire-2.h"

int    footprint = 0;
FILE  *foot_fp;
int    jump_distr = 0;
FILE  *jump_fp;
int    sb_base = 0;
FILE  *sb_base_fp;

  /************************************************************************
   * 
   *  Common statistic data structures
   *
   ************************************************************************/
  
  typedef struct _StatisticsRec {
    int instruction_refs;
    int shared_reads;
    int shared_writes;
    int private_reads;
    int private_writes;
    int test_set_ops;
  } StatisticsRec;

static StatisticsRec *stats = NULL;
static no_mem_refs = 0;

unsigned long last_instr_addr[MAX_PROCS];
unsigned long last_data_addr[MAX_PROCS];

  int instruction_refs = 0;
  int data_refs = 0;
  int shared_reads = 0;
  int shared_writes = 0;
  int private_reads = 0;
  int private_writes = 0;
  int test_set_ops = 0;

/************************************************************************
 * 
 *  Data structures used to collect statistics regarding 
 *  shared memory.
 *
 ************************************************************************/

int start_stat = 0;
static int no_shared_refs = 0;


/**********************************************************************/
/**********************************************************************/




/************************************************************************
 * 
 *  Routines used for collecting common statistics.
 *
 ************************************************************************/


/**********************************************************************/
/**********************************************************************/


void ClearStatistics(){
  int i;
  
  if (stats != NULL){
    for (i=0; i<no_procs; i++){
      stats[i].instruction_refs = 0;
      stats[i].shared_reads = 0;
      stats[i].shared_writes = 0;
      stats[i].private_reads = 0;
      stats[i].private_writes = 0;
      stats[i].test_set_ops = 0;
    }
  }
} /* end ClearStatistics */


/**********************************************************************/
/**********************************************************************/

void InitStatistics(int bs, char *pf, char *cs){

  if (stats == NULL){
    stats = (StatisticsRec *) malloc(no_procs*sizeof(StatisticsRec));
    
    ClearStatistics();

      for (int i = 0; i < no_procs; i++) {
	last_instr_addr[i] = 0;
	last_data_addr[i] = 0;
      }

  }
} /* end InitStatistics */


/**********************************************************************/
/**********************************************************************/

/**********************************************************************/
/**********************************************************************/


void GatherStatistics(int pid, MemOpType op, unsigned long addr, 
		      unsigned long address_space, 
		      unsigned long attributes){
    no_mem_refs++;
  
    if (address_space == USER_INSTR_AS) {
    
	last_instr_addr[pid] = addr;
	stats[pid].instruction_refs++;
    
    } else {
	last_instr_addr[pid] = addr;

	if (attributes & SHARED){
      
	    if (op == READ_OP){
		stats[pid].shared_reads++;
	    } else if (op == WRITE_OP) {
		stats[pid].shared_writes++;
	    } else {
		stats[pid].test_set_ops++;
	    }
      
	} else if ((attributes & PRIVATE) || (attributes & REPLICATED)) {
	    if (op == READ_OP)
		stats[pid].private_reads++;
	    else
		stats[pid].private_writes++;
	} else {
	    fprintf(stderr,"Something's strange!!!\n");
	    fprintf(stderr,"pid = %d\n", pid);
	    fprintf(stderr,"op = %d\n", op);
	    fprintf(stderr,"addr = 0x%x\n", addr);
	    fprintf(stderr,"address space = %d\n", address_space);
	    fprintf(stderr,"attributes = %d\n", attributes);
	}
    }
  
} /* end GatherStatistics */


/**********************************************************************/
/**********************************************************************/

void PrintStatistics(){
  int i;
  int sum;
  unsigned t_time = 0;
  
  fprintf(stderr,"Reference composition\n");
  fprintf(stderr,"pid\tinstr\tprivate \tshared\n");
  fprintf(stderr,"\t\treads \twrites \treads \twrites\ttest and set\n");
  fprintf(stderr,"______________________________________________________________________________\n");
  
  for (i=0; i<no_procs; i++){
    
    sum = stats[i].instruction_refs + stats[i].private_reads + 
      stats[i].private_writes + stats[i].shared_reads +
	stats[i].shared_writes + stats[i].test_set_ops;
    instruction_refs += stats[i].instruction_refs;
    private_reads += stats[i].private_reads;
    private_writes += stats[i].private_writes;
    shared_reads += stats[i].shared_reads;
    shared_writes += stats[i].shared_writes;
    test_set_ops += stats[i].test_set_ops;
    
    fprintf(stderr,"%d\t%u\t%u\t%u\t%u\t%u\t%u\n", i,
	   stats[i].instruction_refs,
	   stats[i].private_reads, 
	   stats[i].private_writes, 
	   stats[i].shared_reads, 
	   stats[i].shared_writes,
	   stats[i].test_set_ops);
  }
  
  sum = instruction_refs + private_reads + shared_reads +
    private_writes + shared_writes + test_set_ops;
  data_refs = sum-instruction_refs;
  
  fprintf(stderr,"______________________________________________________________________________\n");
  
  fprintf(stderr,"all\t%u\t%u\t%u\t%u\t%u\t%u\n", 
	 instruction_refs, 
	 private_reads, 
	 private_writes, 
	 shared_reads, 
	 shared_writes,
	 test_set_ops);
  fprintf(stderr,"______________________________________________________________________________\n");
  fprintf(stderr,"Total: %u\n", no_mem_refs);
  fprintf(stderr,"______________________________________________________________________________\n");

  no_shared_refs = shared_reads + shared_writes + test_set_ops;

  fprintf(stderr,"Instruction references: \t %u = %2.2f%% of all references\n", 
	 instruction_refs, 100.0*((float)instruction_refs/(float)sum));
  fprintf(stderr,"Data references: \t\t %u = %2.2f%% of all references\n", 
	 data_refs, 100.0*((float)data_refs/(float)sum));
  fprintf(stderr,"Data reads: \t\t\t %u = %2.2f%% of data references\n", 
	 private_reads+shared_reads, 
	 100.0*((float)(private_reads+shared_reads)/(float)data_refs));
  fprintf(stderr,"Data writes: \t\t\t %u = %2.2f%% of data references\n", 
	 private_writes+shared_writes, 
	 100.0*((float)(private_writes+shared_writes)/(float)data_refs));
  fprintf(stderr,"Shared data reads: \t\t %u = %2.2f%% of data references\n", 
	 shared_reads, 
	 100.0*((float)(shared_reads)/(float)data_refs));
  fprintf(stderr,"Shared data writes: \t\t %u = %2.2f%% of data references\n", 
	 shared_writes, 
	 100.0*((float)(shared_writes)/(float)data_refs));
  fprintf(stderr,"Test and set operations: \t %u = %2.2f%% of data references\n", 
	 test_set_ops, 
	 100.0*((float)(test_set_ops)/(float)data_refs));
    

} /* end PrintStatistics */
