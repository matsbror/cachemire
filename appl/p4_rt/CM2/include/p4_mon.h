#ifndef _P4_MON_H_
#define _P4_MON_H_

#include "p4_sys.h"


typedef int p4_lock_t;

struct p4_mon_queue {
    int count;
    p4_lock_t delay_lock;
    /* The pad ensures that a p4_mon_queue occupies at least one block */ 
    int pad[14];
};

struct p4_monitor {
    p4_lock_t mon_lock;
    struct p4_mon_queue *qs;
};

typedef struct p4_monitor p4_monitor_t;



struct p4_getsub_monitor {
    struct p4_monitor m;
    int sub;
};

typedef struct p4_getsub_monitor p4_getsub_monitor_t;

#define p4_getsub(gs,s,max,nprocs) p4_getsubs(gs,s,max,nprocs,1)

struct p4_barrier_monitor {
    int count;
    struct p4_monitor m;
};

typedef struct p4_barrier_monitor p4_barrier_monitor_t;

struct p4_askfor_monitor {
    struct p4_monitor m;
    int pgdone;
    int pbdone;
};

typedef struct p4_askfor_monitor p4_askfor_monitor_t;



/* Locks */

extern P4VOID p4_lock_init(p4_lock_t *l);
extern P4VOID p4_lock(p4_lock_t *l);
extern P4VOID p4_unlock(p4_lock_t *l);



/* Monitor building primitives */

extern int    p4_moninit(p4_monitor_t *m, int i);
extern P4VOID p4_menter(p4_monitor_t *m);
extern P4VOID p4_mexit(p4_monitor_t *m);
extern P4VOID p4_mcontinue(p4_monitor_t *m, int i);
extern P4VOID p4_mdelay(p4_monitor_t *m, int i);

extern P4VOID p4_getsubs(p4_getsub_monitor_t *gs, int *s, int max, int nprocs,
		      int stride);
extern int    p4_getsub_init(p4_getsub_monitor_t *gs);


extern P4VOID p4_barrier(p4_barrier_monitor_t *b, int nprocs);
extern int    p4_barrier_init(p4_barrier_monitor_t *b);

extern int    p4_askfor(p4_askfor_monitor_t *af, int nprocs,
			int (*putprob_fxn)(), P4VOID *problem,
			P4VOID (*reset_fxn)());
extern P4VOID p4_update(p4_askfor_monitor_t *af, int (*putprob_fxn)(), 
			P4VOID *problem);
extern int    p4_askfor_init(p4_askfor_monitor_t *af);
extern P4VOID p4_probend(p4_askfor_monitor_t *af, int code);
extern P4VOID p4_progend(p4_askfor_monitor_t *af);

#endif
