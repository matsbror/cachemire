#line 1 "-"
#line 1 "c.m4.smacs"
/* barrier(<monitor>,<nprocs>)
*/

#line 21

/* bardec(<monitor>)
*/

#line 27

/* barinit(<monitor>)
*/

#line 37


#line 41

/* gsdec(<monitor>)
*/

#line 47

/* gsinit(<monitor>)
*/

#line 54

/* getsub($1<monitor>,$2<subscript>,$3<max_sub>,$4<nprocs>,$5<chunk>)
*/

#line 77



/* nlockdec(<monitor>)
*/

#line 85

/* nlockinit(<monitor>)
*/

#line 91

/* nlock(<monitor>)
*/

#line 97

/* nunlock(<monitor>)
*/

#line 103


#line 107


#line 111


#line 115


#line 119



#line 125




#line 132


#line 182


#line 188


#line 196




#line 207


#line 220


#line 233


#line 248


#line 263
#line 1 "c.m4.monmacs"

 
 
#line 5


/*  delay(<monitor>,<queue>,<-1>)
*/

#line 14

/*  continue(<monitor>,<queue>,<-1>)
*/

#line 29

/*  menter(<monitor>,<-1>)
*/

#line 37

/*  mexit(<monitor>,<-1>)
*/

#line 45

/*  decvar(<monitor>,<queues>,<-1>,<extra_code_for_more_variables>)
*/

#line 56

/*  moninit(<monitor>,<queues>,<-1>)
*/

#line 76
	  
    
/*  create(<procedure>)
*/

#line 91


#line 104

/* clock(<clock_val>)
*/



/* main_end()
*/

#line 115


/* main_env(<max_procs>,<sh_mem>,<sr_buffs>)) */

#line 167

/* extern_env */

#line 178


/* extern_INITENV */

#line 186


/* main_INITENV(<max_processors>,<global_memory>,<max_locks>)

*/

#line 216

/* initenv(<global_memory>)

*/



/* who_am_i(<proc_id>) */

#line 227


/* char *g_malloc(<size>)
*/

#line 234


#line 242




#line 281


#line 285


#line 289


#line 295



#line 308



#line 320



/*
 * macros to support tracing the synchronization behavior of programs
 * written with the Argonne c.st.monmacs and c.st.smacs.  There is a
 * separate trace output file for each thread.  
 */





/* constant for data structure sizes in synchronization trace */
/* may be overridden in mAIN_INITENV */


/* ids for types of locks */







/* trace vars associated with each lock */



#line 356

/* st_log(<operation> <lock address>)
   logs event with time stamp into threads event log buffer.
   event = op addr time.  can use s_TRACE_LOG_ENTRY and s_TRACE_LOG_EXIT now.
*/

#line 371




#line 377


#line 381


#line 1 "shmem.C"


#line 2
    extern int lock_model;
#line 2
    extern int ANLno_procs;
#line 2
    extern void ANL_delay();
#line 2
    extern void backoff();
#line 2
    
#line 2
#include "shmem.h"
#line 2
#include "stdio.h"
#line 2
#include "stdlib.h"
#line 2
#include "trap.h"
#line 2
#include "locks.h"
#line 2

#line 2
#define PAGE_SIZE		4096
#line 2

#line 2
typedef struct _ANLglobTYPE {
#line 2
      volatile int end_lock;
#line 2
      volatile int max_proc;
#line 2
      volatile int proc_started;
#line 2
      void (*slave_func)(); 
#line 2
      } ANLglobTYPE;
#line 2

#line 2
    
#line 2
      
#line 2
    
#line 2

#line 2
enum error_type {OUT_OF_SHARED_MEMORY, 
#line 2
			OUT_OF_HEAP_MEMORY, OUT_OF_RANGE};
#line 2

#line 2
extern void mdlx_error();
#line 2
extern char *xx_mem();
#line 2
extern volatile ANLglobTYPE *ANLglob;
#line 2

#line 2
inline static ANL_PS(char *s) {
#line 2
  trap(TRAP_PRINT_STRING, s, strlen(s));
#line 2
}
#line 2

#line 2
inline static ANL_PI(int i) {
#line 2
  trap(TRAP_PRINT_INT, i);
#line 2
}
#line 2

#line 2
	 
#line 2

#line 2

#line 2

#ifndef NULL
#define NULL 0
#endif

/*  Supporting routines */

void mdlx_error(func, message)
     char *func;
     char *message;
{
  printf("ERROR in %s!!! %s\n", func, message);
  exit(-1);
}


/* xx_mem is a memory allocation routine.  It is called in three
   ways:
	if typ == 0, then n is the number of bytes to claim as
	    globally-shared memory (from which routines can
	    ask for shared memory).  In this case the routine
	    returns the address of the allocated block (NULL,
	    if an allocation failure occurs).

	else if typ == 1, then n is taken to be the amount
	    of shared memory requested.  In this case, the
	    routine returns the address of a block of at least
	    n charecters in length.

	else if typ == 2, then the routine is being asked
	    to return the address of the globally-
	    shared block of memory.  

The view of shared memory supported by xx_mem is that a single
massive chunk of memory is acquired (and handed out by 
xx_mem(1,...) calls).
*/

struct mem_blk {
     volatile char *next;
     volatile int l_mem;
     volatile int memlock;
};

char *xx_mem(int typ, int n)
{
static struct mem_blk *glob_mem;
char *rc;
int i;
char *c;
int pid;

    switch (typ)
    {
    case 0:  /* initialize */
	/* pad & malloc */
	if ((c = malloc((n+sizeof(struct mem_blk))+2*PAGE_SIZE)) == NULL)
	{
	    printf("*** malloc failed during shared memory initialization ***\n");
	    exit(3);
	}
	else
	{
	    /* Make sure that the shared memory is allocated on a 
	       separate page */
	    c += PAGE_SIZE;

#if 0
	    if (share (c, n) < (c - PAGE_SIZE))
	    {
		printf("*** share failed during shared memory initialization ***\n");
		exit(3);
	    }
#endif
	    glob_mem = (struct mem_blk *) c;
	    glob_mem->next=(char *)((int)(c + sizeof(struct mem_blk) + (PAGE_SIZE-1)) &(~(PAGE_SIZE-1)));
	    glob_mem->l_mem = n;
#ifdef DEBUG
	    printf("Init %d bytes of shared memory from 0x%x to 0x%x\n", 
		   n, glob_mem->next, glob_mem->next+glob_mem->l_mem);
#endif
#if 1
            /* Notify the simulator that this memory area is shared */
            SetMemoryAttributes(0, SHARED, glob_mem->next, 
                                glob_mem->next+glob_mem->l_mem-1);
#endif
	    glob_mem->memlock = 0;
	    rc = (char *) glob_mem->next;
	}
	break;

    case 1:
	i = (n+(511)) & (~(511));
#ifdef DEBUG
	printf("Allocate shared memory from 0x%x to 0x%x. left: %d\n", 
		   glob_mem->next, glob_mem->next+i, glob_mem->l_mem);
#endif
	cm_lock(&(glob_mem->memlock));

	if (glob_mem->l_mem < i)
	{
	    printf("*** global allocation failure ***\n");
	    printf("*** attempted %d bytes, %d left\n",
		   i,glob_mem->l_mem);
	    rc = NULL;
	}
	else
	{
	    rc = (char *) glob_mem->next;
	    glob_mem->next += i; 
	    glob_mem->l_mem -= i; 
#if 0
            /* Notify the simulator that this memory area is shared */
            SetMemoryAttributes(0, SHARED, rc, 
                                glob_mem->next-1);
#endif
	    /* B
	    printf("allocated %d bytes of shared memory\n",i);
	    printf("at %d\n",rc);
	    E */
	}

	glob_mem->memlock = 0;
	break;

    case 2:
#ifdef DEBUG
	printf("get glob_mem: 0x%x\n", glob_mem);
#endif
	rc = (char *) glob_mem;
	break;
	
    default:
	printf("*** illegal call to xx_mem *** typ=%d\n",typ);
    }
    return(rc);
}




int SetMemoryAttributes(int proc_id, int mem_attr, int start_addr, 
	int end_addr)
{
   return(trap(SET_MEM_ATTR, proc_id, mem_attr, start_addr, end_addr));
}
