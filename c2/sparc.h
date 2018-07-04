
/*
 * sparc.h - public definitions for sparc simulator
 *
 * Author: H…kan Nilsson, nesse@dit.lth.se
 *
 * Date: 920227
 */

#ifndef _SPARC_H_
#define _SPARC_H_

#include "cm_memory.h"
#include "bitvec.h"

/*
 * defines for handling the register windows
 */
#define NWINDOWS 32UL /* the maximum number of register windows is 32 */


/*
 * define the struct for a machine description
 */
typedef struct _PSR_type {

  unsigned long impl : 4;
  unsigned long ver : 4;
  /* condition codes */
  unsigned long N : 1;      /* negative flag */
  unsigned long Z : 1;      /* zero flag */
  unsigned long V : 1;      /* overflow flag */
  unsigned long C : 1;      /* carry flag */
  unsigned long reserved : 6;
  unsigned long EC : 1;
  unsigned long EF : 1;
  unsigned long PIL : 4;
  unsigned long S : 1;
  unsigned long PS : 1;
  unsigned long ET : 1;
  unsigned long CWP : 5;

} PSR_type;

typedef struct _FSR_type {

  unsigned long RD : 2;
  unsigned long unised0 : 2;
  unsigned long NVM : 1;   
  unsigned long OFM : 1; 
  unsigned long UFM : 1;  
  unsigned long DZM : 1; 
  unsigned long NXM : 1; 
  unsigned long NS : 1;
  unsigned long reserved_FSR : 2;
  unsigned long ver : 3;
  unsigned long ftt : 3;
  unsigned long qne : 1;
  unsigned long unused1 : 1;
  unsigned long fcc : 2;
  unsigned long nva : 1;
  unsigned long ofa : 1;
  unsigned long ufa : 1;
  unsigned long dza : 1;
  unsigned long nxa : 1;
  unsigned long nvc : 1;
  unsigned long ofc : 1;
  unsigned long ufc : 1;
  unsigned long dzc : 1;
  unsigned long nxc : 1;

} FSR_type;

typedef struct _sparcRec {
  int PID;          /* processor identifier */
  
  unsigned long G[8];                  /* global registers */
  unsigned long R[(16*NWINDOWS)];      /* windowed registers */
  unsigned long Y;                 /* Y register, used during multiplication */
  float f[32];               /* floating point registers */
  long *fi;
  double *d;                 /* dummy registers to handle double numbers */
  

  unsigned long WIM;          /* window invalid mask register */
  

  unsigned long PSR;       /* Processor state register */


  unsigned long PC;                    /* program counter, words not bytes */
  unsigned long nPC;                   /* next program counter, words not bytes */
  unsigned long FSR;              /* Floating point status register */

  unsigned long instruction;

  int FPop1, FPop2;
  unsigned long loadReg1, loadReg2;

  /* for type convertions */
  union{
    float f;
    unsigned long i;
  } f_convert;
  union {
    unsigned long i[2];
    double d;
  } d_convert;
  
  /* statistics */
  unsigned long instructionCount;      /* incremented when a new intruction is fetched */
  unsigned long no_saves;
  unsigned long no_restores;

  unsigned short int trap;   /* trap number */

  unsigned short fcc;


  /* save the internal state of the processor */
  unsigned short internalState;
  unsigned short annul;
} sparcRec, *Sparc;


/* fill in the types later ... (nesse) */
extern int CopyRetAddr(Sparc fromProc, Sparc toProc);

extern Sparc
InitSparc(int /* pid   processor identifier */, 
	  unsigned long /* pc    initvalue for program counter */,  
	  unsigned long /* sp    initvalue for stack pointer */,  
	  int /* argc  to be stored in %i0 */,
	  unsigned long /* argv  to be stored in %i1 */
	  );

// Define return codes for SparcCycle
#define SC_NORMAL      0     // Normal
#define SC_NBL         1     // Non blocking load
#define SC_NBL_DEP     2     // non blocking load value needed
#define SC_ERROR       3     // Error condition

extern unsigned long
SparcCycle(Sparc /* sparcPtr      the processor to simulate */,
	   unsigned long * /* data          the data (in/out) to/from the processor */,
	   unsigned long * /* addressOut    the next address issued by the processor */,
	   unsigned long * /* addressSpace  used to define different address spaces */,
	   unsigned long * /* byteMask      byte mask used during store operation */,
	   MemOpType * /* memOp   the issued type of operation */
	   );

extern int
ExitSparc(Sparc /* sparcPtr  the machine to do exit on */);


/* forward declaration */
extern void printSparc(Sparc, unsigned long);
extern void dumpSparc(Sparc, unsigned long);

#endif /* _SPARC_H_ */
