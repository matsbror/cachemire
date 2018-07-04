#include <stdio.h>
#include "p4.h"

typedef struct _utilglob {
    p4_lock_t io_lock;
    int       p4_dbg_level;
} utilglob_t;

utilglob_t *util_glob = 0;

P4VOID p4_util_init() {
    util_glob = (utilglob_t *) p4_shmalloc(4);
    p4_lock_init(&(util_glob->io_lock));
    util_glob->p4_dbg_level = 0;
}

P4VOID p4_dprintf(fmt, a, b, c, d, e, f, g, h, i)
{
    p4_lock(&(util_glob->io_lock));
    printf("(%d): ", getpid());
    printf((char *)fmt,a,b,c,d,e,f,g,h,i);
    fflush(stdout);
    p4_unlock(&(util_glob->io_lock));
}

P4VOID p4_dprintfl(level, fmt, a, b, c, d, e, f, g, h, i)
{
    if (level <= util_glob->p4_dbg_level) {
	p4_lock(&(util_glob->io_lock));
	printf("(%d): ", getpid());
	printf((char *)fmt,a,b,c,d,e,f,g,h,i);
	fflush(stdout);
	p4_unlock(&(util_glob->io_lock));
    }
}

int p4_get_dbg_level() {
    return util_glob->p4_dbg_level;
}

P4VOID p4_set_dbg_level(int level) {
    printf("&(util_glob->p4_dbg_level) = 0x%x\n", &(util_glob->p4_dbg_level));
    util_glob->p4_dbg_level = level;
}


