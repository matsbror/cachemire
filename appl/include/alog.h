#ifndef _ALOG_H_
#define _ALOG_H_

#ifdef ALOG_TRACE

#else

#define ALOG_DEC 
#define ALOG_STATUS(a)
#define ALOG_ENABLE
#define ALOG_DISABLE
#define ALOG_SETDIR(a)
#define ALOG_SETUP(a,b)
#define ALOG_MASTER(a,b)
#define ALOG_DEFINE(a,b,c)
#define ALOG_LOG(a,b,c,d)
#define ALOG_OUTPUT

#endif

#define BEGIN_USER      101
#define END_USER        102
#define BEGIN_SEND      103
#define END_SEND        104
#define BEGIN_RECV      105
#define END_RECV        106
#define BEGIN_WAIT      107
#define END_WAIT        108

#define UPDATE_NUM_SUBPROBS     200
#define REQUEST_MONITOR_ENTRY   201
#define ENTER_MONITOR           202
#define EXIT_MONITOR            203
#define OPEN_DOOR               204
#define ENTER_DELAY_QUEUE       205
#define EXIT_DELAY_QUEUE        206
#define SECRET_EXIT_MONITOR     207
#define PBDONE                  208
#define PGDONE                  209



#endif
