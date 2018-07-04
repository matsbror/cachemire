/* BARRIER(<monitor>,<nprocs>)
*/


/* BARDEC(<monitor>)
*/


/* BARINIT(<monitor>)
*/




/* GSDEC(<monitor>)
*/


/* GSINIT(<monitor>)
*/


/* GETSUB($1<monitor>,$2<subscript>,$3<max_sub>,$4<nprocs>,$5<chunk>)
*/




/* nlockdec(<monitor>)
*/


/* nlockinit(<monitor>)
*/


/* nlock(<monitor>)
*/


/* nunlock(<monitor>)
*/



































 
 


/*  delay(<monitor>,<queue>,<-1>)
*/


/*  continue(<monitor>,<queue>,<-1>)
*/


/*  menter(<monitor>,<-1>)
*/


/*  mexit(<monitor>,<-1>)
*/


/*  decvar(<monitor>,<queues>,<-1>,<extra_code_for_more_variables>)
*/


/*  moninit(<monitor>,<queues>,<-1>)
*/

	  
    
/*  create(<procedure>)
*/


/* clock(<clock_val>)
*/



/* main_end()
*/



/* MAIN_ENV(<max_procs>,<sh_mem>,<sr_buffs>)) */


/* EXTERN_ENV */



/* EXTERN_INITENV */



/* MAIN_INITENV(<global_memory>)

*/


/* INITENV(<global_memory>)

*/



/* who_am_i(<proc_id>) */



/* char *G_MALLOC(<size>)
*/























/*
 * macros to support tracing the synchronization behavior of programs
 * written with the Argonne c.st.monmacs and c.st.smacs.  There is a
 * separate trace output file for each thread.  
 */





/* constant for data structure sizes in synchronization trace */
/* may be overridden in mAIN_INITENV */


/* ids for types of locks */







/* trace vars associated with each lock */




/* st_log(<operation> <lock address>)
   logs event with time stamp into threads event log buffer.
   event = op addr time.  can use s_TRACE_LOG_ENTRY and s_TRACE_LOG_EXIT now.
*/









#ifndef _STDLIB_H_
#define _STDLIB_H_

#include <sys/stdtypes.h>

#define NULL         0
#define HEAP_SIZE    0x100000   /* 1 Mbyte */

#define RAND_MAX                32767

#define MMAX(a,b) (a>b?a:b)
#define MMIN(a,b) (a<b?a:b)

extern void *malloc();
extern void  free();
extern void *calloc();
extern void  cfree();

extern int    atoi();
extern double atof();
extern size_t strlen();
extern int    strcmp();
extern int    strncmp();
extern char  *strcpy();

extern double drand48();

#endif
