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


#line 1 "cm2.C"


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

#include <stdio.h>
#include <stdlib.h>

#include "trap.h"
#include "limits.h"


/* Global definitions in this file */

int *slaves_left = (int *)0x800;



void CMexit(int n){
  exit(n);
}

void resume_proc(int n){
  trap(TRAP_RESUME_PROC, n);
}

void stop_proc(int n){
  trap(TRAP_STOP_PROC, n);
}

unsigned long get_time(){
  return trap(TRAP_GET_TIME);
}

void ANL_start_p(int n, void f()) {
  int pid;
  
#line 34
   *&pid = getpid();
#line 34
;
#ifdef DEBUG
  printf("Proc %d calls ANL_start_p, Slaves left: %d\n", pid, *slaves_left);
#endif
  *slaves_left++;
  trap(TRAP_START_PROC, n, f);
}



