#include <assert.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <signal.h>
#include <stropts.h>
#include <termio.h>
#include <math.h>
#include <sys/utsname.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/time.h>
#include "sparcp.h"
#include "sparc.h"
#include "syscall.h"
#include "loadfile.h"
#include "cm_memory.h"
#include "statistics.h"
#include "trap.h"
#include "sparse_array.h"

extern Sparc get_sparc(int pid);
static unsigned long macro_n;

#define TRACE_LOCK 0
#define TRACE_BARRIER 0

#ifdef __cplusplus
extern "C" {
#endif

typedef enum { false = 0, true = 1 } bool;

#define N_FD		(20)
#define RETREG		(8)

int 			print_sys = 0;
int			shared_pages;
int                     procs_running = 1;
extern int		block_size;
extern bool		in_parallel_section;
extern bool		do_classifications;

static char tmp_string[80];
static init = 0;
static FILE *dbf;

SparseArray<int> BarrierCount;

/*
 * define number of file descriptors
 */
#define FD_SIZE 89



/*********************************************************
 * 
 * Get the argument no. argNum, the first 6 in 
 * in-reg(0 .. 5) = r(24 .. 29),
 * the rest on stack, sp = r(30), next argument at 
 * sp + 92, growing upwards.
 * 
 */

#define ARG(argNum) ( (argNum <= 5) ? \
		     /* Argument in register */ \
		     S_R(24+argNum) /* Inregisters begins at r(24) */ \
		     : \
		     /* Argument is on stack */ \
		     ArgFromStack(argNum,sparcPtr) \
		     )



int
ArgFromStack(int argNum, Sparc sparcPtr)
{
  unsigned long data,addr;
  int RC;

  /* FramePtr i i-reg(6) = S_R(30) */
  addr = S_R(30) + 92 + 4*(argNum-6);
  RC = GlobalMemoryOp(INVALID, READ_OP,addr,&data,S_WORD);
  return data;
}

/* variables used during MathHandleTrap */
static double tmp_d;
static union {
  unsigned long i[2];
  double d;
} d_convert;

/*********************************************************
 *
 * Sparc return value: returns in in-reg(0) = r(24)
 * 
 */

#define SPARC_RETURN(num) ( S_RWR(24,num) )


/*********************************************************/


void
GetString(unsigned long addr, char *s)
{
  char ch[4],*str;
  unsigned long *data = (unsigned long *)&(ch[0]);
  unsigned long i, Stop;
  int RC;

/*  str = (char *)malloc(80*sizeof(char));*/
  str = s;
  Stop = 0;
  while (!Stop) {
    RC = GlobalMemoryOp(INVALID, READ_OP,addr,data,S_WORD);
    for (i=addr%4;i<4;i++) {
      *str = ch[i];
      str++;
      Stop = Stop || (ch[i] == 0);
    }
    addr += 4-(addr%4);            /* align to word */
  }
/*  return s;*/
}

/*********************************************************/


void 
PutString(char *str, unsigned long addr, int nbytes)
{
  char ch[4];
  unsigned long *data = (unsigned long *)&(ch[0]);
  unsigned long i;
  int Stop, n;
  int RC;

  Stop = 0;
  n = nbytes;
  while (!Stop) {
    RC = GlobalMemoryOp(INVALID, READ_OP,addr,data,S_WORD);
    for (i=addr%4;i<4;i++) {
      ch[i] = *str;
      str++;
      if (--n == 0) break;
    }
    Stop = Stop || (n == 0);
    RC = GlobalMemoryOp(INVALID, WRITE_OP,addr,data,S_WORD);
    addr += 4-(addr%4);            /* align to word */
  }

}

/*********************************************************/







void trap(Sparc	sparcPtr, int trapcode)
{
  char	buf1[8192];
  char	buf2[8192];
  
  int		out[8];
  int		i;
  int		x;
  int		n;
  unsigned long 	vaddr;
  int		fd;
  int		proc;
  int		syscall;
  int           ret;

  proc = sparcPtr->PID;
  
  if (!init) {
    init = 1;
    if (print_sys)
      dbf = fopen("debug", "w");
  }

  out[0] = (int)S_R(0+8);
  out[1] = (int)S_R(1+8);
  out[2] = (int)S_R(2+8);
  out[3] = (int)S_R(3+8);
  out[4] = (int)S_R(4+8);
  out[5] = (int)S_R(5+8);
  
  switch (trapcode) {
  case ST_OSYSCALL:
    syscall = (int)S_R(1);
    goto do_syscall;

  case ST_BREAKPOINT:
    fprintf(stderr, "Trap %d not implemented yet\n", trapcode);
    // perror(tmp_string);
    goto done;

  case ST_DIV0:
    sprintf(tmp_string, "Divide by zero!");
    perror(tmp_string);
    goto done;

  case ST_FLUSH_WINDOWS:
  case ST_CLEAN_WINDOWS:
  case ST_RANGE_CHECK:
  case ST_FIX_ALIGN:
  case ST_INT_OVERFLOW:
    sprintf(tmp_string, "Trap %d not implemented yet", trapcode);
    perror(tmp_string);
    goto done;

  case ST_SYSCALL:        /* System call trap */
    syscall = (int)S_R(1);
    goto do_syscall;
    break;
    
  case ST_USER:           /* user defined trap */
    switch (out[0]) {
    case GET_NOPROCS:
      S_RWR(RETREG, no_procs);
      goto done;
      
    case SET_MEM_ATTR:
      SetMemoryAttributes(out[1], out[2], out[3], out[4]);
      goto done;
      
    case TRAP_START_PROC:
      StartProc(out[1], out[2]);
      goto done;
      
    case START_STAT:
    case START_SHARED_STAT:
      if (!start_stat){
	start_stat = 1;
	start_time = global_time;
	ClearStatistics();
      }
      goto done;

    case END_STAT:
    case END_SHARED_STAT:
      if (start_stat){
	start_stat = 0;
	end_time = global_time;
      }
      goto done;

    case GET_LOCK_MODEL:
      S_RWR(RETREG, lock_model);

      goto done;
      
    case ENTER_ACQUIRE:
#if TRACE_LOCK==1
	fprintf(stderr, "pid %d enter lock 0x%x\n", proc, out[1]);
	fflush(stderr);
#endif

      EnterAcquire(proc);

      if (lock_model ==  IDEAL_LOCKS) {
	unsigned long data;
	GlobalMemoryOp(proc, READ_OP, out[1], &data, S_WORD);
 	if (data) {
	  // Lock is taken
	  LockProc(proc, out[1]);
	}
      }

      goto done;
      
    case EXIT_ACQUIRE:
#if TRACE_LOCK==1
	fprintf(stderr, "pid %d exit lock 0x%x\n", proc, out[1]);
	fflush(stderr);
#endif

      ExitAcquire(proc);

      if (lock_model ==  IDEAL_LOCKS) {
	unsigned long data = 0xFFFFFFFF;
	GlobalMemoryOp(proc, WRITE_OP, out[1], &data, S_WORD);
      }
      goto done;
      
    case ENTER_RELEASE:
#if TRACE_LOCK==1
	fprintf(stderr, "pid %d release lock 0x%x\n", proc, out[1]);
	fflush(stderr);
#endif

      EnterRelease(proc);

      if (lock_model == IDEAL_LOCKS) {
	unsigned long data;
	GlobalMemoryOp(proc, READ_OP, out[1], &data, S_WORD);
	if (data) {
	  // Lock is taken
	  UnLockProc(out[1]);
	}
	data = 0;
	GlobalMemoryOp(proc, WRITE_OP, out[1], &data, S_WORD);
      }

      goto done;
      
    case BARRIER_INIT:
	BarrierCount[out[1]] = 0;
	goto done;

    case ENTER_BARRIER:
#if TRACE_BARRIER==1
      if (lock_model != IDEAL_LOCKS) 
	BarrierCount[out[1]]++;
	fprintf(stderr, "pid %d enter barrier 0x%x, wait for %d procs\n", \
		proc, out[1], out[2]);
	fprintf(stderr, "procs waiting = %d, lock_model = %d\n", \
		BarrierCount[out[1]], lock_model);
	fflush(stderr);
#endif

      EnterBarrier(proc);

      if (lock_model == IDEAL_LOCKS) {
	BarrierCount[out[1]]++;
	if (BarrierCount[out[1]] < out[2]) {
	  LockProc(proc, out[1]);
	} else {
	  UnLockAllProcs(out[1]);
	}
      }

      goto done;
      
    case EXIT_BARRIER:
#if TRACE_BARRIER==1
	BarrierCount[out[1]] = 0;
	fprintf(stderr, "pid %d exit barrier 0x%x, wait for %d procs\n", \
		proc, out[1], out[2]);
	fflush(stderr);
#endif

	if (lock_model == IDEAL_LOCKS)
	    BarrierCount[out[1]] = 0;

	ExitBarrier(proc);

      goto done;
      
    case PAGE_SIZE_TRAP:
      S_RWR(RETREG, PAGE_SIZE);
      goto done;
      
    case SHARED_PAGES_TRAP:
	fprintf(stderr,"ERROR! This system call is obsolete!\n");
      exit(-1);
      goto done;
      
    case HEAP_END_TRAP:
      // returns the end address of the heap
      S_RWR(RETREG, heap_end);
      goto done;
      
    case TRAP_GET_TIME:
      S_RWR(RETREG, global_time);
      goto done;
      
    case TRAP_EXIT_PROC:
      ExitProc(proc);
      goto done;
     
    case TRAP_PRINT_REG:
      printSparc(sparcPtr, sparcPtr->instruction);
      goto done;
     
    case TRAP_PRINT_STRING:
      vaddr = out[1];
      CopyMemCM2Sun(proc, vaddr, (unsigned long) buf1, out[2]);
      buf1[out[2]] = '\0';
      fprintf(stderr,"%s", buf1);
      goto done;
     
    case TRAP_PRINT_INT:
	fprintf(stderr,"%d", out[1]);
      goto done;
     
    case TRAP_REPLICATE:
      /* Inherit memory from processor 0 */
      SetMemoryAttributes(out[1], REPLICATED, data_start, data_end);
      goto done;
     
    case TRAP_COPY_RETADDR:
    {
	Sparc to_sparcPtr = get_sparc(out[1]);
	fprintf(stderr, "Copy return adresses from pid %d to pid %d\n",
		proc, out[1]);
	CopyRetAddr(sparcPtr, to_sparcPtr);

	goto done;
    }

    case TRAP_GET_NOPROCS:
	S_RWR(RETREG, no_procs);
	goto done;


    default:
      sprintf(tmp_string, 
	      "WARNING, user trap %d not defined", out[0]);
      perror(tmp_string);
      goto done;
    }
    break;
  }
    
 do_syscall:;

  switch (syscall) {

  case SYS_syscall :
      fprintf(stderr,"WARNING, SYS_syscall not implemented!\n");
    goto done;

  case SYS_exit:
    ExitProc(proc);
    if (proc == 0) {
      EndOfSimulation();
    } else {
      ResumeProc(0);
    }
    goto done;
    
  case SYS_read:
    fd = out[0];

    vaddr = out[1];
    n = out[2];
    
    x = read(fd, buf1, n);
    CopyMemSun2CM(proc, (unsigned long) buf1, vaddr, n);

    if (x == -1) {
      perror("read failed");
    }

    ( x==-1 ? SET_PSR_C(sparcPtr) : CLEAR_PSR_C(sparcPtr));

    S_RWR(RETREG, x);
    goto done;
    
  case SYS_write:
    fd = out[0];
    vaddr = out[1];
    n = out[2];

    CopyMemCM2Sun(proc, vaddr, (unsigned long) buf1, n);
    if (print_sys) {
      fprintf(dbf, "P: %d, SYS_write fd=%d p=%x n=%d\n", proc, fd, vaddr, n);
      fprintf(dbf, "buf = %s\n", buf1);
    }
    x = write(fd, buf1, n);

    if (x == -1)
      perror("write failed");

    ( x==-1 ? SET_PSR_C(sparcPtr) : CLEAR_PSR_C(sparcPtr));

    S_RWR(RETREG, x);
    goto done;
    
  case SYS_close:
    fd = out[0];

    if (print_sys)
      fprintf(dbf, "SYS_close %d\n", fd);

    if (fd <= 2) 
      x = 0;	/* success. */
    else {
      x = close(fd);

      if (x == -1)
	perror("close failed");

      ( x==-1 ? CLEAR_PSR_C(sparcPtr) : SET_PSR_C(sparcPtr));

    }
    S_RWR(RETREG, x);
    goto done;
    
  case SYS_wait:
    if (proc != 0) {
      perror("Child process is calling wait()");
    } else if (out[0] != 0) {
      perror("wait(int *stat_loc) not implemented");
    } else {
      if (procs_running > 1) 
	StopProc(proc, UnknownStall);
    }

    goto done;

  case SYS_lseek:

    x = lseek(out[0], out[1], out[2]);
    if (x == -1)
      perror("lseek failed");

    ( x==-1 ? CLEAR_PSR_C(sparcPtr) : SET_PSR_C(sparcPtr));

    S_RWR(RETREG, x);
    goto done;
    
  case SYS_open:
    if (print_sys)
      fprintf(dbf, "SYS_open\n");
    vaddr = out[0];
    i = 0;

    CopyStringCM2Sun(proc, vaddr, (unsigned long) buf1);
    x = open(buf1, out[1], out[2]);

    if (x == -1) 
      perror("open failed");

    CLEAR_PSR_C(sparcPtr);

    S_RWR(RETREG, x);
    goto done;
    
  case SYS_creat:
  case SYS_link:

    vaddr = out[0];

    CopyStringCM2Sun(proc, vaddr, (unsigned long) buf1);
    x = link(buf1, buf2);
    vaddr = out[1];
    CopyMemSun2CM(proc, (unsigned long) buf2, vaddr, strlen(buf1));    

    if (x == -1)
      perror("link failed");

    CLEAR_PSR_C(sparcPtr);
    S_RWR(RETREG, x);
    goto done;
    
  case SYS_unlink:
    vaddr = out[0];

    CopyStringCM2Sun(proc, vaddr, (unsigned long) buf1);
    x = unlink(buf1);

    if (x == -1)
      perror("unlink failed");

    CLEAR_PSR_C(sparcPtr);
    S_RWR(RETREG, x);
    goto done;
    
  case SYS_getpid:
    S_RWR(RETREG, sparcPtr->PID);
    goto done;
    
  case SYS_fstat: {
    int fd = out[0];

    int vaddr = out[1];

    x = fstat(fd, (struct stat*)buf1);
    CopyMemSun2CM(proc, (unsigned long) buf1, vaddr, sizeof(struct stat));

    if (x == -1)
      perror("fstat failed");
    
    S_RWR(RETREG, x);
    goto done;
  }
    
  case SYS_brk:
    n = out[0];
    CLEAR_PSR_C(sparcPtr);   /* this means success */
    S_RWR(RETREG, n);
    goto done;
    
  case SYS_time:
  case SYS_times: 
    S_RWR(RETREG, global_time);
    goto done;
    
  case SYS_ioctl : {
    int fd = out[0];
    int req = out[1];

    vaddr = out[2];

    switch (req) {
    case TCGETA:
      CopyMemCM2Sun(proc, vaddr, (unsigned long) buf1, sizeof(struct termio));
      x = ioctl(fd, req, buf1);

      if (x == -1) {
	sprintf(tmp_string, "ioctl(%d, 0x%x, 0x%x) failed", 
		fd, req, vaddr);
	perror(tmp_string);
      }

      S_RWR(RETREG, x);
      break;
      
    default:
      printf("WARNING, ioctl 0x%x not implemented\n", req);
      break;
    }

    goto done;
  }

  case SYS_uname: {

    vaddr = out[0];
    x = uname((struct utsname *)buf1);
    CopyMemSun2CM(proc, (unsigned long) buf1, vaddr, sizeof(struct utsname));

    if (x == -1)
      perror("uname failed");
    
    S_RWR(RETREG, x);
    goto done;
  }

  case SYS_sigpending :
    vaddr = out[1];

    if (out[0] == 1) {

      x = sigpending((sigset_t *)buf1);
      CopyMemSun2CM(proc, (unsigned long) buf1, vaddr, sizeof(sigset_t));

      if (x == -1)
	perror("sigpending failed");

      S_RWR(RETREG, x);

    } else if (out[0] == 2) {

      x = sigfillset((sigset_t *)buf1);
      CopyMemSun2CM(proc, (unsigned long) buf1, vaddr, sizeof(sigset_t));

      if (x == -1)
	perror("sigfillset failed");

      S_RWR(RETREG, x);

    } else {
	fprintf(stderr,"ERROR, Wrong parameter to SYS_sigpending\n");
    }
      
    goto done;

  case SYS_sysconfig:
      fprintf(stderr, "SYS_sysconfig: out[0] = %d, out[1] = %d, out[2] = %d, out[3] = %d, out[4] = %d, out[5] = %d\n", out[0], out[1], out[2], out[3], out[4], out[5]);
      /* +++ */
      goto done;

  case SYS_gettimeofday: {
      extern int gettimeofday(struct timeval *, struct timezone *);
      unsigned long tp = out[0];
      unsigned long tzp = out[1];

      x = gettimeofday((struct timeval *) buf1, (struct timezone *) buf2);
      CopyMemSun2CM(proc, (unsigned long) buf1, tp, sizeof(struct timeval)); 
      CopyMemSun2CM(proc, (unsigned long) buf2, tzp, sizeof(struct timezone));      
      if (x == -1)
	  perror("gettimeofday failed");
      
      S_RWR(RETREG, x);
      
      goto done;
  }
    
  case SYS_fork:
  case SYS_chdir:
  case SYS_mknod:
  case SYS_chmod:
  case SYS_chown:
  case SYS_getuid:
  case SYS_ptrace:
  case SYS_access:
  case SYS_sync:
  case SYS_kill:
  case SYS_stat:
  case SYS_dup:
  case SYS_pipe:
  case SYS_profil:
  case SYS_getgid:
  case SYS_acct:
  case SYS_semsys:
  case SYS_uadmin:
  case SYS_execve:
  case SYS_umask:
  case SYS_chroot:
  case SYS_vhangup:
  case SYS_getgroups:
  case SYS_setgroups:
  case SYS_getdents:
  case SYS_setitimer:
  case SYS_getitimer:
  case SYS_lstat:
  case SYS_symlink:
  case SYS_readlink:
  case SYS_fcntl:
  case SYS_fchmod:
  case SYS_fchown:
  case SYS_sigprocmask:
  case SYS_sigsuspend:
  case SYS_sigaltstack:
  case SYS_sigaction:
  case SYS_context:
  case SYS_evsys:
  case SYS_evtrapret:
  case SYS_statvfs:
  case SYS_fstatvfs:
  case SYS_nfssys:
  case SYS_waitsys:
  case SYS_sigsendsys:
  case SYS_hrtsys:
  case SYS_acancel:
  case SYS_async:
  case SYS_priocntlsys:
  case SYS_pathconf:
  case SYS_mincore:
  case SYS_mmap:
  case SYS_mprotect:
  case SYS_munmap:
  case SYS_fpathconf:
  case SYS_fchdir:
  case SYS_readv:
  case SYS_writev:
  case SYS_xstat:
  case SYS_lxstat:
  case SYS_fxstat:
  case SYS_xmknod:
  case SYS_clocal:
  case SYS_setrlimit:
  case SYS_getrlimit:
  case SYS_lchown:
  case SYS_memcntl:
  case SYS_getpmsg:
  case SYS_putpmsg:
  case SYS_rename:
  case SYS_setegid:
  case SYS_adjtime:
  case SYS_systeminfo:
  case SYS_seteuid:
  case SYS_vtrace:
  case SYS_yield:
  case SYS_getmsg:
  case SYS_putmsg:
  case SYS_poll:
  case SYS_statfs:
  case SYS_fstatfs:
  case SYS_lwp_create:
  case SYS_lwp_exit:
  case SYS_lwp_suspend:
  case SYS_lwp_continue:
  case SYS_lwp_kill:
  case SYS_lwp_setprivate:
  case SYS_lwp_getprivate:
  case SYS_mount:
  case SYS_lwp_mutex_unlock:
  case SYS_msgsys:
  case SYS_shmsys:
  case SYS_auditsys:
  case SYS_pread:
  case SYS_llseek:
  case SYS_fchroot:
  case SYS_processor_bind:
  case SYS_processor_info:
  case SYS_p_online:
    break;
  }
  
  fprintf(stderr, "WARNING, unsupported system call: %d\n", syscall);

 done:
  if (print_sys)
    fflush(dbf);
  return;

}






#ifdef __cplusplus
}
#endif

