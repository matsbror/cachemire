#include <stdio.h>
#include "p4.h"
#include "shmem.h"
#include "trap.h"
#include "p4_util.h"

extern void _end;
int       no_procs;
int       lock_model;
int       p4_pg_ret_addr;

typedef struct _sysglob {
  int       end_lock;
  int       max_proc;
  int       proc_started;
  int       stat_started;
  int     (*slave_fxn)();
} sysglob_t;

sysglob_t *sysglob;

inline static PS(char *s) {
  trap(TRAP_PRINT_STRING, s, strlen(s));
}

inline static PI(int i) {
  trap(TRAP_PRINT_INT, i);
}

char *p4_initenv(int *argc, char **argv) {
  int sh_mem_size;
  int page_size;
  int       pid;

  /* Ignore any arguments for now */

  pid = getpid();

  if (pid == 0) {
    unsigned int pagesize = trap(PAGE_SIZE_TRAP);
    unsigned int start = (unsigned int)(&_end) + 2*pagesize;
    unsigned int end =  trap(HEAP_END_TRAP);
    /* Master thread */
    
    /* Reserve half of the heap as shared memory */
    sh_mem_size = (end - start)/2;
    xx_mem(0, sh_mem_size);
				   
    sysglob = (sysglob_t *) p4_shmalloc(sizeof(sysglob_t *));

    no_procs = trap(GET_NOPROCS);
    lock_model = trap(GET_LOCK_MODEL);

    sysglob->end_lock = 0;
    sysglob->max_proc = 0;
    sysglob->proc_started = 0;
    sysglob->stat_started = 0;
    sysglob->slave_fxn = 0;

    p4_util_init();

  } else {

    /* Slave threads */

    while (!(sysglob->slave_fxn)) ;

    /* Call slave function which has to be initialised */
    (*(sysglob->slave_fxn))();
    
    cm_lock(&(sysglob->end_lock));
    sysglob->proc_started--;
    cm_unlock(&(sysglob->end_lock));

    exit(0);

  }

}


int p4_create(int (*fxn)()) {

#if 0
  if (!sysglob->stat_started) {
    sysglob->stat_started = 1;
    trap(START_STAT); 
  }
#endif

  sysglob->slave_fxn = fxn;
  
  sysglob->proc_started++ ;
  if (sysglob->proc_started < MAX_PROCS) {
    sysglob->max_proc = sysglob->proc_started;
    trap(TRAP_REPLICATE, sysglob->proc_started);
    trap(TRAP_START_PROC, sysglob->proc_started, p4_initenv);
  } else {
    printf("Attempt to create more processors than allowed max %d\n", 
	   MAX_PROCS);
  }

} /* end p4_create */


int p4_create_procgroup() {
    FILE* pg_file;
    char type[80];
    char no_slaves;
    int i;

    if (getpid() == 0) {

	if ((pg_file = fopen("procgroup", "r")) == NULL) {
	    p4_dprintf("Could not find file 'procgroup', exiting\n");
	    exit(-1);
	}
    
	fscanf(pg_file, "%s %d", type, &no_slaves);
	
	if (!strcmp("local,", type)) {
	    p4_dprintf("Don't know how to handle type: %s, exiting\n", 
		       type);
	}

	printf("File procgroup read. Starting %d slaves\n", no_slaves);

	sysglob->slave_fxn = p4_create_procgroup;
	p4_pg_ret_addr = geti7reg();

	for (i = 0; i < no_slaves; i++) {
	    sysglob->proc_started++ ;
	    if (sysglob->proc_started < MAX_PROCS) {
		sysglob->max_proc = sysglob->proc_started;
		trap(TRAP_REPLICATE, sysglob->proc_started);
		trap(TRAP_START_PROC, sysglob->proc_started, p4_initenv);
	    } else {
		printf("Attempt to create more processors than allowed max %d\n", 
		       MAX_PROCS);
	    }
	}

    } /* end if (getpid() == 0... */
    else {
	seti7reg(p4_pg_ret_addr);
	p4_dprintf("Starting slave %d\n", getpid());
    }

} /* end p4_create_procgroup */


P4VOID p4_wait_for_end() {
  int i=getpid(); 

  while (sysglob->proc_started) ;

  trap(END_STAT);
  
}


int p4_get_my_id() {

  return getpid();

}

/* The following routines assume a 100 MHz clock frequency */

int p4_clock() {

  return trap(TRAP_GET_TIME) / 100000;

}

p4_usc_time_t p4_ustimer() {

  return trap(TRAP_GET_TIME) / 100;

}


char *p4_shmalloc(int size) {

  return (char *)xx_mem(1, size);

}

P4VOID p4_shfree(char *mem) {

}


char *p4_malloc(int size) {

  return (char *) malloc(size);

}

P4VOID p4_free(char *mem) {
    free(mem);
}

/* Error management */
P4VOID p4_error(char *str, int val) {
    char error_message[80];
    sprintf(error_message, "Error '%s' (%d)\n", str, val);
    p4_dprintf(error_message);
}

/* Other non-p4 functions */

void dump_registers() {
  trap(TRAP_PRINT_REG);
}
