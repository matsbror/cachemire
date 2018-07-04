#ifndef unistd_h
#define unistd_h

#include <stdio.h>
#include <stddef.h>

/* command names for POSIX sysconf */
 
#define _SC_ARG_MAX     1
#define _SC_CHILD_MAX   2
#define _SC_CLK_TCK     3
#define _SC_NGROUPS_MAX 4
#define _SC_OPEN_MAX    5
#define _SC_JOB_CONTROL 6
#define _SC_SAVED_IDS   7
#define _SC_VERSION     8
#define _SC_PASS_MAX    9
#define _SC_LOGNAME_MAX 10
#define _SC_PAGESIZE    11
#define _SC_XOPEN_VERSION 12
/* 13 reserved for SVr4-ES/MP _SC_NACLS_MAX */
#define _SC_NPROCESSORS_CONF    14
#define _SC_NPROCESSORS_ONLN    15
#define _SC_STREAM_MAX  16
#define _SC_TZNAME_MAX  17
 
/* command names for POSIX pathconf */
 
#define _PC_LINK_MAX    1
#define _PC_MAX_CANON   2
#define _PC_MAX_INPUT   3
#define _PC_NAME_MAX    4
#define _PC_PATH_MAX    5
#define _PC_PIPE_BUF    6
#define _PC_NO_TRUNC    7
#define _PC_VDISABLE    8
#define _PC_CHOWN_RESTRICTED    9
#define _PC_LAST        9
 
#ifndef _POSIX_VERSION
#define _POSIX_VERSION  199009L
#endif
 
#ifndef _XOPEN_VERSION
#define _XOPEN_VERSION 3
#endif
 

#endif
