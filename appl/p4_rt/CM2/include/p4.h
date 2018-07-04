#ifndef _P4_H_
#define _P4_H_

#include "p4_sys.h"
#include "p4_mon.h"
#include "alog.h"
#include "trap.h"

/* Process management */

extern char          *p4_initenv(int* argc, char **argv);
extern int            p4_create(int(*fxn)());
extern P4VOID         p4_wait_for_end();

/* Timing functions */

extern int            p4_clock();
extern p4_usc_time_t  p4_ustimer();



/* Memory management */

extern char          *p4_shmalloc(int n);
extern P4VOID         p4_shfree(char *mem);

extern char          *p4_malloc(int n);
extern P4VOID         p4_free(char *mem);


/* Error management */
extern P4VOID         p4_error(char *str, int val);

/* Other non-p4 functions */

extern void           dump_registers();

#endif
