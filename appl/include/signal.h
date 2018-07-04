/* signal.h standard header */
#ifndef _SIGNAL
#define _SIGNAL
#ifndef _YVALS
#include <yvals.h>
#endif
		/* type definitions */
typedef int sig_atomic_t;
typedef void _Sigfun(int);
		/* signal codes */
#define SIGABRT	_SIGABRT
#define SIGHUP		1
#define SIGINT		2
#define SIGQUIT		3
#define SIGILL		4
#define SIGTRAP		5
#define SIGIOT		6
#define SIGEMT		7
#define SIGFPE		8
#define SIGKILL		9
#define SIGBUS		10
#define SIGSEGV		11
#define SIGSYS		12
#define SIGPIPE		13
#define SIGALRM		14
#define SIGTERM		15
#define SIGURG		16
#define SIGSTOP		17
#define SIGTSTP		18
#define SIGCONT		19
#define SIGCHLD		20
#define SIGTTIN		21
#define SIGTTOU		22
#define SIGIO		23
#define SIGXCPU		24
#define SIGXFSZ		25
#define SIGVTALRM	26
#define SIGPROF		27
#define SIGWINCH	28
#define SIGLOST		29
#define SIGUSR1		30
#define SIGUSR2		31
#define _NSIG	_SIGMAX	/* one more than last code */
		/* signal return values */
#define SIG_DFL	(_Sigfun *)0
#define SIG_ERR	(_Sigfun *)-1
#define SIG_IGN	(_Sigfun *)1
		/* declarations */
int raise(int);
_Sigfun *signal(int, _Sigfun *);
#endif
