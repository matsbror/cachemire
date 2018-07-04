/* setjmp.h standard header */
#ifndef _SETJMP
#define _SETJMP
#ifndef _YVALS
#include <yvals.h>
#endif
		/* type definitions */
typedef int jmp_buf[_NSETJMP];
		/* declarations */
void longjmp(jmp_buf, int);
int setjmp(jmp_buf);
		/* macro overrides */
#define setjmp(env)	setjmp(env)
#endif
