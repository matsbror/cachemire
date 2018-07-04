#ifndef _SYSCALL_H_
#define _SYSCALL_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <sys/syscall.h>

void trap(Sparc, int);

#ifdef __cplusplus
}
#endif

#endif
