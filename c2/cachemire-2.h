/**********************************************************************
 *
 *    Title:             CacheMire-2.h
 *    Creation Date:     92-02-21
 *    Authour:           Mats Brorsson
 *    Function:          Types and constants for CacheMire-2
 *
 *    Change log:
 * 
 **********************************************************************/

#ifndef _CACHEMIRE_H_
#define _CACHEMIRE_H_

#include <stdio.h>
#include <sys/types.h>
#include <time.h>

#define MAX(a,b) (a>b?a:b)
#define MIN(a,b) (a<b?a:b)

#define TRUE  1
#define FALSE 0

#define INVALID  0xFFFFFFFF
#define INFINITY 0xFFFFFFFF

#define CM_OK           0
#define CM_ERROR    -1

/* default values that cannot be overridden */
#define PAGE_SIZE               4096                /* 4 kbyte pages */
#define LOGMEM                  12
#define PAGE_MASK               0xFFFFF000
#define OFFSET_MASK             0x00000FFF

#define MAX_PROCS               32

/* default values that can be overridden */
#define NPAGES                  0x10000UL;         /* Number of 4k pages in a */
#define MEM_SIZ                 0x10000000UL        /* 28 bits address range */
#define NO_PROCS                16
#define STACK_SIZE              256 * 0x400           /* 256 Kbyte */
#define BLOCK_SIZE              4

#define Busy            0
#define SynchStall      1
#define ReadStall       2
#define WriteStall      3
#define UnknownStall    4
#define end_stall_state 5

/* Define lock models */
#include "locks.h"
extern  int lock_model;

extern int no_procs;                 /* Specifies number of processors */
extern int stack_size;               /* size of each processors stack */
extern int debug_level; 

extern int procs_running;
extern unsigned long instruction_in_process;
extern unsigned long global_time;
extern unsigned long instruction_count;
extern unsigned long start_time;
extern unsigned long end_time;
extern clock_t real_start_time;
extern clock_t real_end_time;

extern unsigned long max_text_addr;
extern unsigned long min_text_addr;
extern unsigned long max_data_addr;
extern unsigned long min_data_addr;

extern unsigned long text_start;  // read-only start   .text
extern unsigned long text_end;    // read-only end     .rodata1
extern unsigned long data_start;  // read/write start  .data
extern unsigned long data_end;    // read/write end    .bss

extern unsigned long heap_start;
extern unsigned long heap_end;

extern int end_simulation;

extern char out_dir[80];
extern int    footprint;
extern FILE  *foot_fp;
extern int    jump_distr;
extern FILE  *jump_fp;
extern int    sb_base;
extern FILE  *sb_base_fp;

extern unsigned long npages;
extern unsigned long mem_size;

extern void StartProc(int, unsigned long);
extern void ExitProc(int);
extern void ResumeProc(int);
extern void StopProc(int, int);
extern void EnterAcquire(int);
extern void ExitAcquire(int);
extern void EnterRelease(int);
extern void EnterBarrier(int);
extern void ExitBarrier(int);
extern void LockProc(int, unsigned long);
extern void UnLockAllProcs(unsigned long);
extern int  UnLockProc(unsigned long);
extern void external_dump();

extern void step_done();

extern void EndOfSimulation();

#endif

