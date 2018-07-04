#ifndef _P4_UTIL_H_
#define _P4_UTIL_H_

#include "p4_sys.h"

extern P4VOID p4_util_init();
extern P4VOID p4_dprintf(char *fmt, ...);
extern P4VOID p4_dprintfl(int, char *fmt, ...);
extern int    p4_get_dbg_level();
extern P4VOID p4_set_dbg_level(int level);

#endif
