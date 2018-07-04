#pragma begin abi
/* yvals.h values header -- Rama C Compiler Sparc Solaris version */

#ifndef _YVALS
#define _YVALS
		/* errno properties */
#define _EDOM	33
#define _ERANGE	34
#define _EFPOS	152
#define _ERRMAX	153

		/* float properties
		 * set to values according to page 449 of Plauger book.
		 * Jonas Skeppstedt, 930126.
		 */
		 
#define _D0		0
#define _DBIAS	0x3fe
#define _DLONG	0
#define _DOFF	4
#define _FBIAS	0x7e
#define _FOFF	7
#define _FRND	1
#define _LBIAS	0x3fe
#define _LOFF	4
		/* integer properties */
#define _C2		1
#define _CSIGN	1
#define _ILONG	1
#define _MBMAX	8
typedef unsigned short _Wchart;
		/* pointer properties */
#define _NULL	(void *)0
typedef int _Ptrdifft;
typedef unsigned int _Sizet;
		/* setjmp properties */
#define _NSETJMP	12
		/* signal properties */
#define _SIGABRT	6
#define _SIGMAX		32
		/* stdio properties */
#define _FNAMAX	64
#define _FOPMAX	16
#define _TNAMAX	16
		/* stdlib properties */
#define _EXFAIL	1
		/* storage alignment properties */
#define _AUPBND 3U
#define _ADNBND 3U
#define _MEMBND	7U
		/* time properties */
#define _CPS	(1000000UL) /* set 930621 by Jonas Skeppstedt */
#define _TBIAS  0





#define _JBFP	0
#define _JBOFF	0
#define _JBMOV	0

#if 0
typedef	int		sigset_t;	/* signal mask - may change */
typedef	unsigned int	speed_t;	/* tty speeds */
typedef	unsigned long	tcflag_t;	/* tty line disc modes */
typedef	unsigned char	cc_t;		/* tty control char */
typedef	int		pid_t;		/* process id */
typedef	unsigned short	mode_t;		/* file mode bits */
typedef	short		nlink_t;	/* links to a file */
typedef unsigned int	clock_t;	/* moved from time.h */
typedef unsigned long	time_t;		/* moved from time.h */
#endif

#ifndef O_APPEND
#define O_APPEND	(0x08)
#endif

#ifndef O_NONBLOCK	
#define O_NONBLOCK	(0x80)
#endif

#ifndef O_SYNC
#define O_SYNC		(0x10)
#endif

#ifndef O_CREAT
#define O_CREAT		(0x100)
#endif

#ifndef O_TRUNC
#define O_TRUNC		(0x200)
#endif

#ifndef O_EXCL		
#define O_EXCL		(0x400)
#endif

#ifndef O_NOCTTY
#define O_NOCTTY	(0x800)
#endif

#ifndef O_RDONLY
#define O_RDONLY	(0)
#endif

#ifndef O_WRONLY
#define O_WRONLY	(1)
#endif

#ifndef O_RDWR
#define O_RDWR		(2)
#endif

#ifndef O_NDELAY
#define O_NDELAY	(0x04)
#endif

#endif
#pragma end abi
