#ifndef _P4_SYS_H_
#define _P4_SYS_H_

/* p4 system type definitions */

#define TRUE  1
#define FALSE 0

#define MAX_PROCS 32

extern int        no_procs;
extern int        lock_model;

typedef  void           P4VOID;
typedef  unsigned long  p4_usc_time_t;

#endif
