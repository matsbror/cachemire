#ifndef _CM_UTIL_H_
#define _CM_UTIL_H_

#include "trap.h"

__inline__ static void dump_registers() {
  trap(TRAP_PRINT_REG);
}

#endif
