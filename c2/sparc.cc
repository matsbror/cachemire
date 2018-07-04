/*
 * sparc.c - source code for sparc simulator
 *
 * Author: Håkan Nilsson, nesse@dit.lth.se
 * 
 * Date: 920227
 *
 * Floating Point by Fredrik Dahlgren, fredrik@dit.lth.se
 *
 * Date: 920312
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "sparcp.h"
#include "cm_memory.h"
#include "cachemire-2.h"
#include "syscall.h"
#include "attr.h"
#include "trap.h"

/*#define printError() fprintf(stderr,"%s\n",errStr)*/
#define printError() fprintf(stderr,"%s\n",errStr)

extern void printSparc(Sparc sparcPtr, unsigned long ins);

static BitVector nbl_reg_int[32];
static BitVector nbl_reg_flt[32];

/* variable declarations */
static char errStr[120];
/* Debug variables */
/* Keep the latest sparcPtr and instruction here */
static Sparc latest_sparcPtr;
static unsigned long latest_instruction;
static unsigned long macro_n;

// Copy the return address from one processor to another
int CopyRetAddr(Sparc fromProc, Sparc toProc) {

    // Copy %i7 which contains the return address from processor
    // from_pid to processor to_pid
    // %i7 == %r31
    printSparc(fromProc, 0);
    printSparc(toProc, 0);
    toProc->R[(31-8 + PSR_CWP(toProc)<<4) % (NWINDOWS<<4)] = 
	fromProc->R[(31-8 + PSR_CWP(fromProc)<<4) % (NWINDOWS<<4)];

    return 1;
}

Sparc
InitSparc(int pid,  /* processor identifier */
	  unsigned long pc,   /* initvalue for program counter */
	  unsigned long sp,   /* initvalue for stack pointer */
	  int argc, /* to be stored in %i0 */
	  unsigned long argv  /* to be stored in %i1 */
	  )
{
  register Sparc newSparc;
  register int   i;

  if ((newSparc = (Sparc) malloc(sizeof(sparcRec))) == NULL) {
    sprintf(errStr,"InitSparc: malloc failed");
    printError();
    return NULL;
  }

  /*
   * init the processor identifier
   */
  newSparc->PID = pid;

  /*
   * init interrupts and traps
   */
  CLEAR_PSR_ET(newSparc);                     /* disable interrupts */
  newSparc->trap = 0;                   /* zero indicates no interrupt */

  /*
   * init the global registers
   */
  for (i=0; i<8; i++)
    newSparc->G[i] = 0;
  
  /*
   * init the windowed registers
   */
  for (i=0; i<(16*NWINDOWS); i++)
    newSparc->R[i] = 0;

  /*
   * init the Y register
   */
  newSparc->Y = 0;

  /*
   * init the floating point registers
   */
  for (i=0; i<32; i++)
    newSparc->f[i] = 0;
  newSparc->d = (double *) &newSparc->f[0];
  newSparc->fi = (long *) &newSparc->f[0];
  /*
   * init current window pointer, and the window invalid mask register
   */
  SET_PSR_CWP(newSparc, 31);
  newSparc->WIM = 0x00000001;

  /*
   * init the condition codes
   */
  CLEAR_PSR_N(newSparc);
  CLEAR_PSR_Z(newSparc);
  CLEAR_PSR_V(newSparc);
  CLEAR_PSR_C(newSparc);

  /*
   * init the user state (usual user)
   */
  CLEAR_PSR_S(newSparc);

  /*
   * init the program counter and the next program counter
   */
  newSparc->PC = pc;
  newSparc->nPC = pc+4;

  /*
   * init the stack pointer and the frame pointer
   */
  newSparc->R[6+31*16] = sp; /* %sp */
  newSparc->R[22+31*16] = sp; /* %fp */

  /*
   * init registers %i0 and %i1
   */

  newSparc->R[0+31*16] = argc; /* %o0 */
  newSparc->R[1+31*16] = argv; /* %o1 */

  /*
   * init the internal state
   */
  newSparc->internalState = INIT_STATE;
  newSparc->annul = 0;
  newSparc->FPop1 = 0;
  newSparc->FPop2 = 0;
  
  /*
   * init statistics
   */
  newSparc->instructionCount = 0;
  newSparc->no_saves = 0;
  newSparc->no_restores = 0;

  return newSparc;
}

unsigned long SparcCycle(Sparc sparcPtr,    /* the processor to simulate */
	   unsigned long *data,         /* the data (in/out) to/from the processor */
	   unsigned long *addressOut,   /* the next address issued by the processor */
	   unsigned long *addressSpace, /* used to define different address spaces */
	   unsigned long *byteMask,     /* byte mask used during store operation */
	   MemOpType *memOp   /* the issued type of operation */
	   ) {
    unsigned long instruction, address;
    unsigned long rs1, rs2, rd, op2, tmpPC;
    unsigned long result;
    float f1,f2,fr;
    double d1,d2;
    unsigned long eadd;
    union {
	int i[2];
	double d;
    } d_convert;
    union {
	int i;
	float f;
    } f_convert;
    unsigned long Rcode = SC_NORMAL;
    int pid = sparcPtr->PID;
  
  latest_sparcPtr = sparcPtr;

    if (sparcPtr->nPC < 1000)
	dumpSparc(sparcPtr, instruction);

  if (sparcPtr->internalState == WAIT_INSTRUCTION) {
    sparcPtr->instructionCount++;
    if (sparcPtr->annul == 0) {
      goto Decode;
    } else {
      sparcPtr->annul = 0;
      updatePC;
      /* issue a new instruction request */
#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 8 : 9);
#else
      *addressSpace = 8;
#endif
      *addressOut = sparcPtr->PC;
      *memOp = READ_OP;
      sparcPtr->internalState = WAIT_INSTRUCTION;
      return Rcode;
    }
  } else {

    switch (sparcPtr->internalState) {
    case INIT_STATE:
#ifdef USERSTATES
      *addressSpace = (PSR_S(sparcPtr) == 0 ? 8 : 9);
#else
      *addressSpace = 8;
#endif
      *addressOut = sparcPtr->PC;
      *memOp = READ_OP;
      sparcPtr->internalState = WAIT_INSTRUCTION;
      return Rcode;

      
    case WAIT_LD: goto Wait_LD;
    case WAIT_LDUB: goto Wait_LDUB;
    case WAIT_LDUH: goto Wait_LDUH;
    case WAIT_LDD1: goto Wait_LDD1;
    case WAIT_LDD2: goto Wait_LDD2;
    case WAIT_ST: goto Wait_ST;
    case WAIT_STB: goto Wait_STB;
    case WAIT_STH: goto Wait_STH;
    case WAIT_STD1: goto Wait_STD1;
    case WAIT_STD2: goto Wait_STD2;
    case WAIT_LDSB: goto Wait_LDSB;
    case WAIT_LDSH: goto Wait_LDSH;
    case WAIT_LDSTUB: goto Wait_LDSTUB;
    case WAIT_SWAP: goto Wait_SWAP;
    case WAIT_LDF: goto Wait_LDF;
    case WAIT_LDFSR: goto Wait_LDFSR;
    case WAIT_LDDF1: goto Wait_LDDF1;
    case WAIT_LDDF2: goto Wait_LDDF2;
    case WAIT_STF: goto Wait_STF;
    case WAIT_STFSR: goto Wait_STFSR;
    case WAIT_STDF1: goto Wait_STDF1;
    case WAIT_STDF2: goto Wait_STDF2;
    default:
      sprintf(errStr,"Unknown internal state...");
      printError();
      return SC_ERROR;

    }
  }

 Decode:
  instruction = *data;
  latest_instruction = instruction;
#if DEBUGLEVEL >= 3
  /* print something about the instruction */
  fprintf(stderr,"PID=%d, PC=0x%x, ifetch=0x%x\n",
	 sparcPtr->PID, sparcPtr->PC, instruction);
#endif

    rs1 = S_RS1(instruction);
    rs2 = S_RS2(instruction);
    rd = S_RD(instruction);
    op2 = operand2(instruction);

  if (S_OP(instruction) == OP_FORMAT_3A)
    goto Format_3a;
  else if (S_OP(instruction) == OP_FORMAT_3B)
    goto Format_3b;
  else if (S_OP(instruction) == OP_CALL)
    goto Call;
  else if (S_OP(instruction) == OP_FORMAT_2)
    goto Format_2;
  else {
    sprintf(errStr,"Unknown bitfield detected during instruction decoding");
    printError();
    sprintf(errStr,"instruction=0x%x, op=0x%x",instruction,S_OP(instruction));
    printError();
    dumpSparc(sparcPtr, instruction);

    return SC_ERROR;
  }    

#if 0
  switch(S_OP(instruction)) {
  case OP_CALL: goto Call;
  case OP_FORMAT_2: goto Format_2;
  case OP_FORMAT_3A: goto Format_3a;
  case OP_FORMAT_3B: goto Format_3b;
  default:
    sprintf(errStr,"Unknown bitfield detected during instruction decoding");
    printError();
    sprintf(errStr,"instruction=0x%x, op=0x%x",instruction,S_OP(instruction));
    printError();
    dumpSparc(sparcPtr, instruction);

    return SC_ERROR;
    break;
  }
#endif

 Call:
  tmpPC = sparcPtr->PC; /* temporary store of the old PC */
  S_RWR(15,tmpPC);
  sparcPtr->PC = sparcPtr->nPC;
  sparcPtr->nPC = tmpPC + (S_DISP30(instruction) << 2);
  goto TheEnd;

 Format_2:
  switch(S_OP2(instruction)) {

  case OP2_UNIMP:
    sprintf(errStr,"UNIMP instruction, op2_UNIMP");
    printError();
    dumpSparc(sparcPtr, instruction);
    return SC_ERROR;


  case OP2_Bicc:

    switch(S_COND(instruction)) {

    case CC_BN:
      updatePC;
      sparcPtr->annul = (unsigned short) S_A(instruction);
      break;

    case CC_BE:
      if (PSR_Z(sparcPtr)) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_BLE:
      if (PSR_Z(sparcPtr) || ((PSR_N(sparcPtr) && !PSR_V(sparcPtr)) || 
			  (!PSR_N(sparcPtr) && PSR_V(sparcPtr)))) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_BL:
      if ((PSR_N(sparcPtr) && !PSR_V(sparcPtr)) || 
	  (!PSR_N(sparcPtr) && PSR_V(sparcPtr))) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_BLEU:
      if (PSR_C(sparcPtr) || PSR_Z(sparcPtr)) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_BCS:
      if (PSR_C(sparcPtr)) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_BNEG:
      if (PSR_N(sparcPtr)) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_BVS:
      if (PSR_V(sparcPtr)) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_BA:
      tmpPC = sparcPtr->PC; /* temporary store of the old PC */
      sparcPtr->PC = sparcPtr->nPC;
      sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			    (0xff000000|(S_DISP22(instruction)<<2)):
			    (S_DISP22(instruction)<<2));
      sparcPtr->annul = (unsigned short) S_A(instruction);
      break;

    case CC_BNE:
      if (!PSR_Z(sparcPtr)) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_BG:
      if ((PSR_Z(sparcPtr) || ((PSR_N(sparcPtr) && !PSR_V(sparcPtr)) || 
			   (!PSR_N(sparcPtr) && PSR_V(sparcPtr)))) == 0) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_BGE:
      if ((!PSR_N(sparcPtr) && !PSR_V(sparcPtr)) || 
	  (PSR_N(sparcPtr) && PSR_V(sparcPtr))) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_BGU:
      if (!PSR_C(sparcPtr) && !PSR_Z(sparcPtr)) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_BCC:
      if (!PSR_C(sparcPtr)) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_BPOS:
      if (!PSR_N(sparcPtr)) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_BVC:
      if (!PSR_V(sparcPtr)) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    default:
      sprintf(errStr,"unimplemented condition code, op2_Bicc");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;

    }
    goto TheEnd;


  case OP2_SETHI:
    result = (S_IMM22(instruction) << 10);
    S_RWR(rd, result);
    updatePC;
    goto TheEnd;


  case OP2_FBfcc:

    switch(S_COND(instruction)) {

    case CC_FBN:
      updatePC;
      sparcPtr->annul = (unsigned short) S_A(instruction);
      break;

    case CC_FBNE:
      if (S_FCC_L || S_FCC_G || S_FCC_U) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_FBLG:
      if (S_FCC_L || S_FCC_G) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_FBUL:
      if (S_FCC_L || S_FCC_U) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_FBL:
      if (S_FCC_L) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_FBUG:
      if (S_FCC_G || S_FCC_U) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_FBG:
      if (S_FCC_G) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_FBU:
      if (S_FCC_U) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_FBA:
      tmpPC = sparcPtr->PC; /* temporary store of the old PC */
      sparcPtr->PC = sparcPtr->nPC;
      sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			    (0xff000000|(S_DISP22(instruction)<<2)):
			    (S_DISP22(instruction)<<2));
      sparcPtr->annul = (unsigned short) S_A(instruction);
      break;

    case CC_FBE:
      if (S_FCC_E) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_FBUE:
      if (S_FCC_U || S_FCC_E) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_FBGE:
      if (S_FCC_G || S_FCC_E) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_FBUGE:
      if (S_FCC_E || S_FCC_G || S_FCC_U) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_FBLE:
      if (S_FCC_L || S_FCC_E) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_FBULE:
      if (S_FCC_E || S_FCC_L || S_FCC_U) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    case CC_FBO:
      if (S_FCC_E || S_FCC_L || S_FCC_G) {
	tmpPC = sparcPtr->PC; /* temporary store of the old PC */
	sparcPtr->PC = sparcPtr->nPC;
	sparcPtr->nPC = tmpPC + (S_SIGN22(instruction) ?
			      (0xff000000|(S_DISP22(instruction)<<2)):
			      (S_DISP22(instruction)<<2));
      } else {
	updatePC;
	sparcPtr->annul = (unsigned short) S_A(instruction);
      }
      break;

    default:
      sprintf(errStr,"unimplemented condition code, op2_FBfcc");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;

    }
    goto TheEnd;



  case OP2_CBccc:
    sprintf(errStr,"unimplemented instruction, op2_CBccc");
    printError();
    dumpSparc(sparcPtr, instruction);

    return SC_ERROR;


  default:
    sprintf(errStr,"Unknown bitfield: op2");
    printError();
    dumpSparc(sparcPtr, instruction);

    return SC_ERROR;

  }

 Format_3a:
  switch(S_OP3(instruction)) {
    register unsigned long new_cwp;

  case OP3_ADD:
    if (nbl_reg_int[pid] == rs1) {
	nbl_reg_int[pid] -= rs1;
	Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }
	


    result = S_R(rs1) + op2;
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_AND:
    if (nbl_reg_int[pid] == rs1) {
	nbl_reg_int[pid] -= rs1;
	Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) & op2;
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_OR:
    if (nbl_reg_int[pid] == rs1) {
	nbl_reg_int[pid] -= rs1;
	Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) | op2;
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_XOR:
    if (nbl_reg_int[pid] == rs1) {
	nbl_reg_int[pid] -= rs1;
	Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) ^ op2;
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_SUB:
    if (nbl_reg_int[pid] == rs1) {
	nbl_reg_int[pid] -= rs1;
	Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) - op2;
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_ANDN:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) & ~op2;
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_ORN:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) | ~op2;
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_XNOR:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) ^ ~op2;
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_ADDX:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) + op2 + (PSR_C(sparcPtr)?1:0);
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_UMUL: 
    printf("Not implemented yet!\n");       
    dumpSparc(sparcPtr, instruction);
    exit(-1);

  case OP3_SMUL: 
    fprintf(stderr,"Not implemented yet!\n");       
    dumpSparc(sparcPtr, instruction);
    exit(-1);

  case OP3_SUBX:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) - op2 - (PSR_C(sparcPtr)?1:0);
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_UDIV: 
    fprintf(stderr,"Not implemented yet!\n");       
    dumpSparc(sparcPtr, instruction);
    exit(-1);

  case OP3_SDIV: 
    fprintf(stderr,"Not implemented yet!\n");       
    dumpSparc(sparcPtr, instruction);
    exit(-1);

  case OP3_ADDcc:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) + op2;
    /* update the flags ... */
    {
      register unsigned long r1, res, o2;
      r1 = S_SIGN31(S_R(rs1));
      res = S_SIGN31(result);
      o2 = S_SIGN31(op2);

      /* Set N */
      if (res) {
	  SET_PSR_N(sparcPtr);
      } else {
	  CLEAR_PSR_N(sparcPtr);
      }
      /* Set Z */
      if (result==0) {
	  SET_PSR_Z(sparcPtr);
      } else {
	  CLEAR_PSR_Z(sparcPtr);
      }
      /* Set V */
      if ((r1 && o2 && !res) || (!r1 && !o2 && res)) {
	  SET_PSR_V(sparcPtr);
      } else {
	  CLEAR_PSR_V(sparcPtr);
      }
      /* Set C */
      if ( (r1 && o2) || (!res && (r1 || o2))) {
	  SET_PSR_C(sparcPtr);
      } else {
	  CLEAR_PSR_C(sparcPtr);
      }

    }

    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_ANDcc:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) & op2;
    S_RWR(rd,result);
    /* update the flags ... */
    /* Set N */
    if (S_SIGN31(result)) {
	SET_PSR_N(sparcPtr);
    } else {
	CLEAR_PSR_N(sparcPtr);
    }
    /* Set Z */
    if (result==0) {
	SET_PSR_Z(sparcPtr);
    } else {
	CLEAR_PSR_Z(sparcPtr);
    }
    /* Set V */
    CLEAR_PSR_V(sparcPtr);
    /* Set C */
    CLEAR_PSR_C(sparcPtr);

    updatePC;
    break;

  case OP3_ORcc:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) | op2;
    S_RWR(rd,result);
    /* update the flags ... */
    /* Set N */
    if (S_SIGN31(result)) {
	SET_PSR_N(sparcPtr);
    } else {
	CLEAR_PSR_N(sparcPtr);
    }
    /* Set Z */
    if (result==0) {
	SET_PSR_Z(sparcPtr);
    } else {
	CLEAR_PSR_Z(sparcPtr);
    }
    /* Set V */
    CLEAR_PSR_V(sparcPtr);
    /* Set C */
    CLEAR_PSR_C(sparcPtr);

    updatePC;
    break;

  case OP3_XORcc:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) ^ op2;
    S_RWR(rd,result);
    /* update the flags ... */
    /* Set N */
    if (S_SIGN31(result)) {
	SET_PSR_N(sparcPtr);
    } else {
	CLEAR_PSR_N(sparcPtr);
    }
    /* Set Z */
    if (result==0) {
	SET_PSR_Z(sparcPtr);
    } else {
	CLEAR_PSR_Z(sparcPtr);
    }
    /* Set V */
    CLEAR_PSR_V(sparcPtr);
    /* Set C */
    CLEAR_PSR_C(sparcPtr);

    updatePC;
    break;

  case OP3_SUBcc:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) - op2;
    /* update the flags ... */
    {
      register unsigned long r1, res, o2;
      r1 = S_SIGN31(S_R(rs1));
      res = S_SIGN31(result);
      o2 = S_SIGN31(op2);

      /* Set N */
      if (res) {
	  SET_PSR_N(sparcPtr);
      } else {
	  CLEAR_PSR_N(sparcPtr);
      }
      /* Set Z */
      if (result==0) {
	  SET_PSR_Z(sparcPtr);
      } else {
	  CLEAR_PSR_Z(sparcPtr);
      }
      /* Set V */
      if ((r1 && !o2 && !res) || (!r1 && o2 && res)) {
	  SET_PSR_V(sparcPtr);
      } else {
	  CLEAR_PSR_V(sparcPtr);
      }
      /* Set C */
      if ( (!r1 && o2) || (res && (!r1 || o2))) {
	  SET_PSR_C(sparcPtr);
      } else {
	  CLEAR_PSR_C(sparcPtr);
      }

    }
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_ANDNcc:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) & ~(op2);
    S_RWR(rd,result);
    /* update the flags ... */
    /* Set N */
    if (S_SIGN31(result)) {
	SET_PSR_N(sparcPtr);
    } else {
	CLEAR_PSR_N(sparcPtr);
    }
    /* Set Z */
    if (result==0) {
	SET_PSR_Z(sparcPtr);
    } else {
	CLEAR_PSR_Z(sparcPtr);
    }
    /* Set V */
    CLEAR_PSR_V(sparcPtr);
    /* Set C */
    CLEAR_PSR_C(sparcPtr);

    updatePC;
    break;

  case OP3_ORNcc:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) | ~(op2);
    /* update the flags ... */
    /* Set N */
    if (S_SIGN31(result)) {
	SET_PSR_N(sparcPtr);
    } else {
	CLEAR_PSR_N(sparcPtr);
    }
    /* Set Z */
    if (result==0) {
	SET_PSR_Z(sparcPtr);
    } else {
	CLEAR_PSR_Z(sparcPtr);
    }
    /* Set V */
    CLEAR_PSR_V(sparcPtr);
    /* Set C */
    CLEAR_PSR_C(sparcPtr);
    S_RWR(rd,result);

    updatePC;
    break;

  case OP3_XNORcc:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) ^ ~(op2);
    /* update the flags ... */
    /* Set N */
    if (S_SIGN31(result)) {
	SET_PSR_N(sparcPtr);
    } else {
	CLEAR_PSR_N(sparcPtr);
    }
    /* Set Z */
    if (result==0) {
	SET_PSR_Z(sparcPtr);
    } else {
	CLEAR_PSR_Z(sparcPtr);
    }
    /* Set V */
    CLEAR_PSR_V(sparcPtr);
    /* Set C */
    CLEAR_PSR_C(sparcPtr);
    S_RWR(rd,result);

    updatePC;
    break;

  case OP3_ADDXcc:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) + op2 + (PSR_C(sparcPtr)?1:0);
    /* update the flags ... */
    {
      register unsigned long r1, res, o2;
      r1 = S_SIGN31(S_R(rs1));
      res = S_SIGN31(result);
      o2 = S_SIGN31(op2);

      /* Set N */
      if (res) {
	  SET_PSR_N(sparcPtr);
      } else {
	  CLEAR_PSR_N(sparcPtr);
      }
      /* Set Z */
      if (result==0) {
	  SET_PSR_Z(sparcPtr);
      } else {
	  CLEAR_PSR_Z(sparcPtr);
      }
      /* Set V */
      if ((r1 && o2 && !res) || (!r1 && !o2 && res)) {
	  SET_PSR_V(sparcPtr);
      } else {
	  CLEAR_PSR_V(sparcPtr);
      }
      /* Set C */
      if ( (r1 && o2) || (!res && (r1 || o2))) {
	  SET_PSR_C(sparcPtr);
      } else {
	  CLEAR_PSR_C(sparcPtr);
      }

    }
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_UMULcc: 
    fprintf(stderr,"Not implemented yet!\n");       
    dumpSparc(sparcPtr, instruction);
    exit(-1);


  case OP3_SMULcc: 
    fprintf(stderr,"Not implemented yet!\n");       
    dumpSparc(sparcPtr, instruction);
    exit(-1);


  case OP3_SUBXcc:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) - op2 - (PSR_C(sparcPtr)?1:0);
    /* update the flags ... */
    {
      register unsigned long r1, res, o2;
      r1 = S_SIGN31(S_R(rs1));
      res = S_SIGN31(result);
      o2 = S_SIGN31(op2);

      /* Set N */
      if (res) {
	  SET_PSR_N(sparcPtr);
      } else {
	  CLEAR_PSR_N(sparcPtr);
      }
      /* Set Z */
      if (result==0) {
	  SET_PSR_Z(sparcPtr);
      } else {
	  CLEAR_PSR_Z(sparcPtr);
      }
      /* Set V */
      if ((r1 && !o2 && !res) || (!r1 && o2 && res)) {
	  SET_PSR_V(sparcPtr);
      } else {
	  CLEAR_PSR_V(sparcPtr);
      }
      /* Set C */
      if ( (!r1 && o2) || (res && (!r1 || o2))) {
	  SET_PSR_C(sparcPtr);
      } else {
	  CLEAR_PSR_C(sparcPtr);
      }

    }
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_UDIVcc: 
    fprintf(stderr,"Not implemented yet!\n");       
    dumpSparc(sparcPtr, instruction);
    exit(-1);

  case OP3_SDIVcc: 
    fprintf(stderr,"Not implemented yet!\n");       
    dumpSparc(sparcPtr, instruction);
    exit(-1);

  case OP3_TADDcc:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) + op2;
    /* update the flags ... */
    {
      register unsigned long r1, res, o2;
      r1 = S_SIGN31(S_R(rs1));
      res = S_SIGN31(result);
      o2 = S_SIGN31(op2);

      /* Set N */
      if (res) {
	  SET_PSR_N(sparcPtr);
      } else {
	  CLEAR_PSR_N(sparcPtr);
      }
      /* Set Z */
      if (result==0) {
	  SET_PSR_Z(sparcPtr);
      } else {
	  CLEAR_PSR_Z(sparcPtr);
      }
      /* Set V */
      if ((r1 && o2 && !res) || (!r1 && !o2 && res) ||
	  ((S_R(rs1) & 0x3) || 
	   (op2 & 0x3))) {
	  SET_PSR_V(sparcPtr);
      } else {
	  CLEAR_PSR_V(sparcPtr);
      }
      /* Set C */
      if ( (r1 && o2) || (!res && (r1 || o2))) {
	  SET_PSR_C(sparcPtr);
      } else {
	  CLEAR_PSR_C(sparcPtr);
      }

    }
    S_RWR(rd,result);
    updatePC;
    break;


  case OP3_TSUBcc:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) - op2;
    /* update the flags ... */
    {
      register unsigned long r1, res, o2;
      r1 = S_SIGN31(S_R(rs1));
      res = S_SIGN31(result);
      o2 = S_SIGN31(op2);

      /* Set N */
      if (res) {
	  SET_PSR_N(sparcPtr);
      } else {
	  CLEAR_PSR_N(sparcPtr);
      }
      /* Set Z */
      if (result==0) {
	  SET_PSR_Z(sparcPtr);
      } else {
	  CLEAR_PSR_Z(sparcPtr);
      }
      /* Set V */
      if ((r1 && !o2 && !res) || (!r1 && o2 && res) ||
	  ((S_R(rs1) & 0x3) || 
	   (op2 & 0x3))) {
	  SET_PSR_V(sparcPtr);
      } else {
	  CLEAR_PSR_V(sparcPtr);
      }
      /* Set C */
      if ( (!r1 && o2) || (res && (!r1 || o2))) {
	  SET_PSR_C(sparcPtr);
      } else {
	  CLEAR_PSR_C(sparcPtr);
      }

    }
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_TADDccTV:
    fprintf(stderr,"Not implemented yet!\n");       
    dumpSparc(sparcPtr, instruction);
    exit(-1);


  case OP3_TSUBccTV:
    fprintf(stderr,"Not implemented yet!\n");       
    dumpSparc(sparcPtr, instruction);
    exit(-1);




  case OP3_MULScc:
    {
	unsigned long res;
	unsigned long op1;
	unsigned long tmp_op2 = op2;

    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

	op1 = S_R(rs1) >> 1;

#if 0
	    fprintf(stderr,"mulscc: S_R(%d) = 0x%.8x, Y = 0x%.8x, op2 = 0x%.8x\n",
		    rs1, S_R(rs1), sparcPtr->Y, op2);
	    fprintf(stderr,"PSR = 0x%x = ", GET_PSR_FLAGS(sparcPtr));
	    if (PSR_N(sparcPtr))
		fprintf(stderr,"N");
	    else
		fprintf(stderr,".");
	    if (PSR_Z(sparcPtr))
		fprintf(stderr,"Z");
	    else
		fprintf(stderr,".");
	    if (PSR_V(sparcPtr))
		fprintf(stderr,"V");
	    else
		fprintf(stderr,".");
	    if (PSR_C(sparcPtr))
		fprintf(stderr,"C");
	    else
		fprintf(stderr,".");
	    fprintf(stderr,"\n");
#endif

	if ((PSR_N(sparcPtr) && !PSR_V(sparcPtr)) ||
	    (!PSR_N(sparcPtr) && PSR_V(sparcPtr))) {
	    /* fprintf(stderr,"set sign!\n"); */
	    op1 = 0x80000000 | op1;
	}

	if (sparcPtr->Y & 1) {
	    res = op1 + tmp_op2;
	} else {
	    tmp_op2 = 0;
	    res = op1;
	}

	sparcPtr->Y = sparcPtr->Y >> 1;
	if (S_R(rs1) & 1) {
	    sparcPtr->Y = sparcPtr->Y | 0x80000000;
	}

      /* update the flags ... */
      {
	unsigned long r, o1, o2;
	r = S_SIGN31(res);
	o1 = S_SIGN31(op1);
	o2 = S_SIGN31(tmp_op2);

	if (r) {
	    SET_PSR_N(sparcPtr);
	} else { 
	    CLEAR_PSR_N(sparcPtr);
	}
	if (res==0) {
	    SET_PSR_Z(sparcPtr);
	} else { 
	    CLEAR_PSR_Z(sparcPtr);
	}
	if ((o1 && o2 && !r) || (!o1 && !o2 && r)) {
	    SET_PSR_V(sparcPtr);
	} else {
	    CLEAR_PSR_V(sparcPtr);
	}
	if ((o1 && o2) || (!r && (o1 || o2))) {
	    SET_PSR_C(sparcPtr);
	} else {
	    CLEAR_PSR_C(sparcPtr);
	}

      }

#if 0
	    fprintf(stderr,"PSR = 0x%x = ", GET_PSR_FLAGS(sparcPtr));
	    if (PSR_N(sparcPtr))
		fprintf(stderr,"N");
	    else
		fprintf(stderr,".");
	    if (PSR_Z(sparcPtr))
		fprintf(stderr,"Z");
	    else
		fprintf(stderr,".");
	    if (PSR_V(sparcPtr))
		fprintf(stderr,"V");
	    else
		fprintf(stderr,".");
	    if (PSR_C(sparcPtr))
		fprintf(stderr,"C");
	    else
		fprintf(stderr,".");
	    fprintf(stderr,"\n");
	    fflush(stderr);
#endif

      S_RWR(rd,res);
      updatePC;
    }
    break;



  case OP3_SLL:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    result = S_R(rs1) << shift_count(instruction);
    S_RWR(rd,result);
    updatePC;
    break;

  case OP3_SRL:
    {
      unsigned long mask = 0xffffffff;
      mask = mask >> shift_count(instruction);

    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

      result = (S_R(rs1) >> shift_count(instruction)) & mask;
      S_RWR(rd, result);
      updatePC;
    }
    break;

  case OP3_SRA:
    {
      register unsigned long mask;

    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

      if ((S_R(rs1) & 0x80000000) != 0) {
	/* sign extention */
	mask = 0xffffffff >> shift_count(instruction);
	result = (S_R(rs1) >> shift_count(instruction)) | ~mask;
	S_RWR(rd, result);
      } else {
	mask = 0xffffffff >> shift_count(instruction);
	result = (S_R(rs1) >> shift_count(instruction)) & mask;
	S_RWR(rd, result);
      }

      updatePC;
    }
    break;

  case OP3_RDASR: /* same opcode as RDY and STBAR */
    if (nbl_reg_int[pid] == rs1) {
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }

    if (rs1 == 0) {
      /* RDY instruction */
      S_RWR(rd, sparcPtr->Y);
    } else {
      sprintf(errStr,"Unimplemented instruction, RDASR or STBAR");
      printError();
      sprintf(errStr,"instruction=0x%x,op3=0x%x",
	      instruction,S_OP3(instruction));
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
    updatePC;
    break;


  case OP3_RDPSR: 

    S_RWR(rd, sparcPtr->PSR);

    updatePC;
    break;


  case OP3_RDWIM: 

    S_RWR(rd, sparcPtr->WIM);

    updatePC;
    break;


  case OP3_RDTBR:
    fprintf(stderr,"Not implemented yet!\n");       
    dumpSparc(sparcPtr, instruction);
    exit(-1);


  case OP3_WRASR: /* same opcode as WRY */
    if (rd == 0) {
      /* WRY instruction */
	if (nbl_reg_int[pid] == rs1){
	    nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

      sparcPtr->Y =  S_R(rs1) ^ op2;
    } else {
      sprintf(errStr,"Unimplemented instruction, WRASR");
      printError();
      sprintf(errStr,"instruction=0x%x,op3=0x%x",
	      instruction,S_OP3(instruction));
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
    updatePC;
    break;

  case OP3_WRPSR: 
    {

	if (nbl_reg_int[pid] == rs1){
	    nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }
	
	sparcPtr->PSR = (S_R(rs1) ^ op2);
    }

    updatePC;
    break;

  case OP3_WRWIM: 
    {
	if (nbl_reg_int[pid] == rs1){
	    nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

      sparcPtr->WIM = (S_R(rs1) ^ op2);
    }

    updatePC;
    break;

  case OP3_WRTBR:
    fprintf(stderr,"Not implemented yet!\n");       
    dumpSparc(sparcPtr, instruction);
    exit(-1);


/*------------Start OP3_FPop1-----------*/

  case OP3_FPop1:

    switch(S_OPF(instruction)) {

    case OPF_FMOVs:
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      f2 = S_F(rs2);
      S_FWR(rd, f2);
#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FMOVs: rs2=%d, rd=%d: %f := %f\n",
	     rs2, rd, S_F(rd), S_F(rs2));
#endif
      updatePC;
      break;

    case OPF_FNEGs:
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
#ifdef FP_DEBUG
      f2 = S_F(rs2);
#endif
      f_convert.f = S_F(rs2);
      f_convert.i = (f_convert.i ^ 0x80000000);
      S_FWR(rd, f_convert.f);
#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FNEGs: rs2=%d, rd=%d: %f := - %f\n",
	     rs2, rd, S_F(rd), f_convert.f);
#endif
      updatePC;
      break;

    case OPF_FABSs:
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
#ifdef FP_DEBUG
      f2 = S_F(rs2);
#endif

      f_convert.f = S_F(rs2);
      f_convert.i = (f_convert.i & 0x7FFFFFFF);
      S_FWR(rd, f_convert.f);
#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FABSs: rs2=%d, rd=%d: %f := abs(%f)\n",
	     rs2, rd, S_F(rd), f_convert.f);
#endif
      updatePC;
      break;

    case OPF_FSQRTs:
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
      f2 = S_F(rs2);
      fr = (float) sqrt(f2);
      S_FWR(rd, fr);
#ifdef FP_DEBUG
      {
	  unsigned long i2, ir;
	  fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
	  fprintf(stderr,"OPF_FSRTQs: rs2=%d, rd=%d: sqrt(%f) = %f\n",
		 rs2, rd, f2, S_F(rd));
	  f_convert.f = f2;
	  i2 = f_convert.i;
	  f_convert.f = fr;
	  ir = f_convert.i;
	  fprintf(stderr,"f%d = 0x%x, f%d = 0x%x\n", rs2 , i2,
		 rd, ir);
      }
#endif
      updatePC;
      break;

    case OPF_FSQRTd:
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      sparcPtr->d[rd>>1] = sqrt(sparcPtr->d[rs2>>1]);

#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_SQRTd: rs2=%d, rd=%d: sqrt(%f) = %f\n",
	     rs2, rd, sparcPtr->d[rs2>>1], sparcPtr->d[rd>>1]);
#endif
      updatePC;
      break;

    case OPF_FSQRTq:
      sprintf(errStr,"OPF_FSQRTq not yet implemented");
      printError();
      dumpSparc(sparcPtr, instruction);
      return SC_ERROR;


    case OPF_FADDs:
	if (nbl_reg_flt[pid] == rs1){
	    nbl_reg_flt[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      f1 = S_F(rs1);
      f2 = S_F(rs2);
      fr = f1 + f2;
      S_FWR(rd,fr);
#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FADDs: rs1=%d, rs2=%d, rd=%d: %f + %f = %f\n",
	     rs1, rs2, rd,
	     f1, f2, S_F(rd));
#endif
      updatePC;
      break;

    case OPF_FADDd:
	if (nbl_reg_flt[pid] == rs1){
	    nbl_reg_flt[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

#ifdef FP_DEBUG
      d1 = sparcPtr->d[rs1>>1];
      d2 = sparcPtr->d[rs2>>1];
#endif

      sparcPtr->d[rd>>1] = sparcPtr->d[rs1>>1] + sparcPtr->d[rs2>>1];

#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FADDd: rs1=%d, rs2=%d, rd=%d: %f + %f = %f\n",
	     rs1, rs2, rd,
	     d1, d2, sparcPtr->d[rd>>1]);
#endif
      updatePC;
      break;

    case OPF_FADDq:
      sprintf(errStr,"OPF_FADDq not yet implemented\n");
      printError();
      sprintf(errStr,"instruction=0x%x",
	      instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;


    case OPF_FSUBs:
	if (nbl_reg_flt[pid] == rs1){
	    nbl_reg_flt[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      f1 = S_F(rs1);
      f2 = S_F(rs2);
      fr = f1 - f2;
      S_FWR(rd,fr);
#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FSUBs: rs1=%d, rs2=%d, rd=%d: %f - %f = %f\n",
	     rs1, rs2, rd,
	     S_F(rs1), S_F(rs2),
	     S_F(rd));
#endif
      updatePC;
      break;

    case OPF_FSUBd:
#ifdef FP_DEBUG
      d1 = sparcPtr->d[rs1>>1];
      d2 = sparcPtr->d[rs2>>1];
#endif

	if (nbl_reg_flt[pid] == rs1){
	    nbl_reg_flt[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      sparcPtr->d[rd>>1] = sparcPtr->d[rs1>>1] - sparcPtr->d[rs2>>1];

#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FSUBd: rs1=%d, rs2=%d, rd=%d: %f - %f = %f\n",
	     rs1, rs2, rd,
	     d1, d2, sparcPtr->d[rd>>1]);
#endif
      updatePC;
      break;

    case OPF_FSUBq:
      sprintf(errStr,"OPF_FSUBq not yet implemented\n");
      printError();
      sprintf(errStr,"instruction=0x%x",
	      instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;


    case OPF_FMULs:
	if (nbl_reg_flt[pid] == rs1){
	    nbl_reg_flt[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      f1 = S_F(rs1);
      f2 = S_F(rs2);
      fr = f1 * f2;

      S_FWR(rd,fr);
#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FMULs: rs1=%d, rs2=%d, rd=%d: %f * %f = %f\n",
	     rs1, rs2, rd,
	     f1, f2, S_F(rd));
#endif
      updatePC;
      break;

    case OPF_FMULd:
#ifdef FP_DEBUG
      d1 = sparcPtr->d[rs1>>1];
      d2 = sparcPtr->d[rs2>>1];
#endif

	if (nbl_reg_flt[pid] == rs1){
	    nbl_reg_flt[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      sparcPtr->d[rd>>1] = sparcPtr->d[rs1>>1] * sparcPtr->d[rs2>>1];

#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FMULd: rs1=%d, rs2=%d, rd=%d: %f * %f = %f\n",
	     rs1, rs2, rd,
	     d1, d2, sparcPtr->d[rd>>1]);
#endif
      updatePC;
      break;

    case OPF_FMULq:
      sprintf(errStr,"OPF_FMULq not yet implemented\n");
      printError();
      sprintf(errStr,"instruction=0x%x",
	      instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;


    case OPF_FDIVs:
	if (nbl_reg_flt[pid] == rs1){
	    nbl_reg_flt[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      f1 = S_F(rs1);
      f2 = S_F(rs2);
      fr = f1 / f2;
      S_FWR(rd,fr);
#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FDIVs: rs1=%d, rs2=%d, rd=%d: %f / %f = %f\n",
	     rs1, rs2, rd,
	     f1, f2, S_F(rd));
#endif
      updatePC;
      break;

    case OPF_FDIVd:
#ifdef FP_DEBUG
      d1 = sparcPtr->d[rs1>>1];
      d2 = sparcPtr->d[rs2>>1];
#endif

	if (nbl_reg_flt[pid] == rs1){
	    nbl_reg_flt[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      sparcPtr->d[rd>>1] = sparcPtr->d[rs1>>1] / sparcPtr->d[rs2>>1];

#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FDIVd: rs1=%d, rs2=%d, rd=%d: %f / %f = %f\n",
	     rs1, rs2, rd,
	     d1, d2, sparcPtr->d[rd>>1]);
#endif
      updatePC;
      break;

    case OPF_FDIVq:
      sprintf(errStr,"OPF_FDIVq not yet implemented\n");
      printError();
      sprintf(errStr,"instruction=0x%x",
	      instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;


    case OPF_FsMULd:
#ifdef FP_DEBUG
      f1 = S_F(rs1);
      f2 = S_F(rs2);
#endif

	if (nbl_reg_flt[pid] == rs1){
	    nbl_reg_flt[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      sparcPtr->d[rd>>1] = (double) ((double) S_F(rs1) * (double) S_F(rs2));

#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FsMULd: rs1=%d, rs2=%d, rd=%d: %f * %f = %f\n",
	     rs1, rs2, rd,
	     f1, f2, sparcPtr->d[rd>>1]);
#endif
      updatePC;
      break;

    case OPF_FdMULq:
      sprintf(errStr,"OPF_FdMULq not yet implemented\n");
      printError();
      sprintf(errStr,"instruction=0x%x",
	      instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;


    case OPF_FiTOs:
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
      f_convert.f = S_F(rs2);
      f1 = (float) f_convert.i;
      S_FWR(rd, f1);

#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FiTOs: rs2=%d, rd=%d: (double) %f(%f) := (int) %d\n",
	     rs2, rd, sparcPtr->f[rd], f1, f_convert.i);
#endif      

      updatePC;
      break;

    case OPF_FdTOs:

	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
      f1 = (float) sparcPtr->d[rs2>>1];
      S_FWR(rd, f1);

#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FdTOs: rs2=%d, rd=%d: (float) %f := (double) %f\n",
	     rs2, rd, sparcPtr->f[rd], sparcPtr->d[rs2>>1]);
#endif      

      updatePC;
      break;

    case OPF_FqTOs:
      sprintf(errStr,"OPF_FqTOs not yet implemented\n");
      printError();
      sprintf(errStr,"instruction=0x%x",
	      instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;


    case OPF_FiTOd:
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
	f_convert.f = S_F(rs2);
	d1 = (double) f_convert.i;
	sparcPtr->d[rd>>1] = d1;

#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FiTOd: rs2=%d, rd=%d: (double) %f(%f) := (int) %d\n",
	     rs2, rd, sparcPtr->d[rd>>1], d1, f_convert.i);
#endif      

      updatePC;
      break;

    case OPF_FsTOd:
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
      f1 = S_F(rs2);
      sparcPtr->d[rd>>1] = (double) f1;

#ifdef FP_DEBUG
      fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
      fprintf(stderr,"OPF_FsTOd: rs2=%d, rd=%d: (double) %f := (float) %f\n",
	     rs2, rd,
	     sparcPtr->d[rd>>1], f1);
#endif      

      updatePC;
      break;

    case OPF_FqTOd:
      sprintf(errStr,"OPF_FqTOd not yet implemented\n");
      printError();
      sprintf(errStr,"instruction=0x%x",
	      instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;


    case OPF_FiTOq:
      sprintf(errStr,"OPF_FiTOq not yet implemented\n");
      printError();
      sprintf(errStr,"instruction=0x%x",
	      instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;


    case OPF_FsTOq:
      sprintf(errStr,"OPF_FsTOq not yet implemented\n");
      printError();
      sprintf(errStr,"instruction=0x%x",
	      instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;


    case OPF_FdTOq:
      sprintf(errStr,"OPF_FdTOq not yet implemented\n");
      printError();
      sprintf(errStr,"instruction=0x%x",
	      instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;


    case OPF_FsTOi:
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
      f_convert.i = S_F(rs2);
      S_FWR(rd, f_convert.f);

      updatePC;
      break;

    case OPF_FdTOi:
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
      f_convert.i = sparcPtr->d[rs2>>1];
      S_FWR(rd, f_convert.f);

      updatePC;
      break;

    case OPF_FqTOi:
      sprintf(errStr,"OPF_FqTOi not yet implemented\n");
      printError();
      sprintf(errStr,"instruction=0x%x",
	      instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;


    default:
      sprintf(errStr,"Unimplemented FPop1");
      printError();
      sprintf(errStr,"instruction=0x%x",
	      instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;

    }
    break; /* OP3_FPop1 */

/*------------End OP3_FPop1-----------*/

/*------------Start OP3_FPop2-----------*/

  case OP3_FPop2:

    switch(S_OPF(instruction)) {

    case OPF_FCMPs:
	if (nbl_reg_flt[pid] == rs1) {
	    nbl_reg_flt[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      f1 = S_F(rs1);
      f2 = S_F(rs2);
      if (f1 == f2) sparcPtr->fcc = 0;
      else if (f1 < f2) sparcPtr->fcc = 1;
      else if (f1 > f2) sparcPtr->fcc = 2;
      else sparcPtr->fcc = 3;
      updatePC;
      break;

    case OPF_FCMPd:
	if (nbl_reg_flt[pid] == rs1){
	    nbl_reg_flt[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      d1 = sparcPtr->d[rs1>>1];
      d2 = sparcPtr->d[rs2>>1];
      if (d1 == d2) sparcPtr->fcc = 0;
      else if (d1 < d2) sparcPtr->fcc = 1;
      else if (d1 > d2) sparcPtr->fcc = 2;
      else sparcPtr->fcc = 3;
      updatePC;
      break;

    case OPF_FCMPq:
      sprintf(errStr,"OPF_FCMPq not yet implemented");
      printError();
      sprintf(errStr,"instruction=0x%x", instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;


    case OPF_FCMPEs:
	if (nbl_reg_flt[pid] == rs1){
	    nbl_reg_flt[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      f1 = S_F(rs1);
      f2 = S_F(rs2);
      if (f1 == f2) sparcPtr->fcc = 0;
      else if (f1 < f2) sparcPtr->fcc = 1;
      else if (f1 > f2) sparcPtr->fcc = 2;
      else {
	sparcPtr->fcc = 3;
	sprintf(errStr,"floatingpoint exception: OPF_FCMPEs");
	printError();
	dumpSparc(sparcPtr, instruction);

	return SC_ERROR;
      }
      updatePC;
      break;

    case OPF_FCMPEd:

	if (nbl_reg_flt[pid] == rs1){
	    nbl_reg_flt[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
	if (nbl_reg_flt[pid] == rs2) {
	    nbl_reg_flt[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}

      d1 = sparcPtr->d[rs1>>1];
      d2 = sparcPtr->d[rs2>>1];
      if (d1 == d2) sparcPtr->fcc = 0;
      else if (d1 < d2) sparcPtr->fcc = 1;
      else if (d1 > d2) sparcPtr->fcc = 2;
      else {
	sparcPtr->fcc = 3;
	sprintf(errStr,"floatingpoint exception: OPF_FCMPEd");
	printError();
	dumpSparc(sparcPtr, instruction);
	return SC_ERROR;
      }
      updatePC;
      break;

    case OPF_FCMPEq: 
      sprintf(errStr,"OPF_FCMPEq not yet implemented");
      printError();
      sprintf(errStr,"instruction=0x%x", instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;


    default:
      sprintf(errStr,"Unimplemented FPop2");
      printError();
      sprintf(errStr,"instruction=0x%x",
	      instruction);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;

    }
    break; /* OP3_FPop2 */

/*------------End OP3_FPop2-----------*/

/*------------Start OP3_JMPL-----------*/

  case OP3_JMPL:
	if (nbl_reg_int[pid] == rs1){
	    nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
	}
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    address = S_R(rs1) + op2;
#ifdef CHECK
    if ((address % 4) != 0) {
      sprintf(errStr,"Memory address not 4-aligned, JMPL");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
    S_RWR(rd, sparcPtr->PC);
    sparcPtr->PC = sparcPtr->nPC;
    sparcPtr->nPC = address;
    break;

/*------------Start OP3_RETT-----------*/

  case OP3_RETT:
    fprintf(stderr,"Not implemented yet!\n");       
    dumpSparc(sparcPtr, instruction);

    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    address = S_R(rs1) + op2;

#ifdef CHECK
    if ((address % 4) != 0) {
      sprintf(errStr,"Memory address not 4-aligned, RETT");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
    break;

      /*------------Start OP3_Ticc-----------*/
      
  case OP3_Ticc:

    switch(S_COND(instruction)) {

    case CC_TE:

      if (PSR_Z(sparcPtr)) {
	sparcPtr->instruction = instruction;
	trap(sparcPtr, 0);
      }
      updatePC;
      break;
      

    case CC_TA:
      {
        int trapno = (int) S_SIMM13(instruction);
        sparcPtr->instruction = instruction;
#if DEBUGLEVEL >= 3
        fprintf(stderr,"TA: trapno = %d\n", trapno);
#endif

	trap(sparcPtr, trapno);

        updatePC;
        break;
      }
      break;
      

    default:
      sprintf(errStr,"Unimplemented trap condition, CC_Ticc");
      printError();
      sprintf(errStr,"instruction=0x%x,cond=0x%x",
	      instruction,S_COND(instruction));
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;

    }
    break; /* OP3_Ticc */

/*------------End OP3_Ticc-----------*/

  case OP3_SAVE:
    new_cwp =  (PSR_CWP(sparcPtr) - 1) % NWINDOWS;
#if DEBUGLEVEL >=3
    fprintf(stderr,"SAVE, CWP=%d, WIM=0x%x, new_cwp=%d, test=0x%x, sp=0x%x, fp=0x%x\n",
	   PSR_CWP(sparcPtr), sparcPtr->WIM, new_cwp,
	   ((sparcPtr->WIM &
	     (1 << (unsigned) ((new_cwp-1) % NWINDOWS) )) != 0) ||
	   ((sparcPtr->WIM == (1 << (NWINDOWS - 1))) && (new_cwp == 0)),
	   S_R(14), S_R(30));
#endif
    if (((sparcPtr->WIM & (1 << ((new_cwp-1) % NWINDOWS) )) != 0) ||
	((sparcPtr->WIM == (1 << (NWINDOWS - 1))) && (new_cwp == 0))) {
      register unsigned long i, tmp_sp, tmp_res;
      /* handle the window overflow */
#if DEBUGLEVEL >= 3
      sprintf(errStr,"Window overflow during SAVE");
      printError();
#endif
#if DEBUGLEVEL >=2
      if ((++(sparcPtr->no_saves) % 50) == 0) {
	sprintf(errStr,
		"50 Window overflow during SAVE since last msg, PID=%d",
		sparcPtr->PID);
	printError();
      }
#endif
      /* change the window invalid mask register */
      if (new_cwp == 0)
	sparcPtr->WIM = 1<<(NWINDOWS-2);
      else if (new_cwp == 1)
	sparcPtr->WIM = 1<<(NWINDOWS-1);
      else 
	sparcPtr->WIM = 1<<(new_cwp-2);
      /* get the stack pointer, so we can find the right place in memory */
      if (new_cwp == 0) {
	tmp_sp = sparcPtr->R[(6+((NWINDOWS-2)*16)) % (16*NWINDOWS)];
	tmp_res = (8+((NWINDOWS-2)*16)) % (16*NWINDOWS);
      } else if (new_cwp == 1) {
	tmp_sp = sparcPtr->R[(6+((NWINDOWS-1)*16)) % (16*NWINDOWS)];
	tmp_res = (8+((NWINDOWS-1)*16)) % (16*NWINDOWS);
      } else {
	tmp_sp = sparcPtr->R[(6+((new_cwp-2)*16)) % (16*NWINDOWS)];
	tmp_res = (8+((new_cwp-2)*16)) % (16*NWINDOWS);
      }
      /* save the window ... beginning with the local-registers */
      for (i=0; i<8; i++) {
#if DEBUGLEVEL >= 3
	fprintf(stderr,"write: reg=%d, addr=0x%x, data=0x%x\n",
	       tmp_res, tmp_sp, sparcPtr->R[tmp_res]);
#endif
	GlobalMemoryOp(INVALID, WRITE_OP, tmp_sp,
		       &(sparcPtr->R[tmp_res]), 0xffffffff);
	tmp_sp = tmp_sp + 4; tmp_res++;
      }
      /* ... and continue with the in-registers */
      if (tmp_res >= 16*NWINDOWS) tmp_res = 0;
      for (i=0; i<8; i++) {
#if DEBUGLEVEL >= 3
	fprintf(stderr,"write: reg=%d, addr=0x%x, data=0x%x\n",
	       tmp_res, tmp_sp, sparcPtr->R[tmp_res]);
#endif
	GlobalMemoryOp(INVALID, WRITE_OP, tmp_sp,
		       &(sparcPtr->R[tmp_res]), 0xffffffff);
	tmp_sp = tmp_sp + 4; tmp_res++;
      }
      
      /* operands from old window */
      tmp_res = (unsigned) (S_R(rs1) + op2);
      SET_PSR_CWP(sparcPtr, new_cwp);
      /* destination in new window */
      S_RWR(rd,tmp_res);
#if DEBUGLEVEL >= 3
      printSparc(sparcPtr, instruction);
#endif
      updatePC;

    } else {
      register unsigned long tmp_res;
      /* operands from old window */
      tmp_res = (unsigned) (S_R(rs1) + op2);
      SET_PSR_CWP(sparcPtr, new_cwp);
      /* destination in new window */
      S_RWR(rd,tmp_res);
      updatePC;
    }
    break;

  case OP3_RESTORE:
    new_cwp = (PSR_CWP(sparcPtr) + 1) % NWINDOWS;
#if DEBUGLEVEL >=3
    fprintf(stderr,"RESTORE, CWP=%d, WIM=0x%x, new_cwp=%d, test=0x%x, sp=0x%x, fp=0x%x\n",
	   PSR_CWP(sparcPtr), sparcPtr->WIM, new_cwp,
	   (sparcPtr->WIM & (0x00000001 << new_cwp)),
	   S_R(14), S_R(30));
#endif
    if ((sparcPtr->WIM & (0x00000001<<new_cwp)) != 0) {
      register unsigned long i, tmp_fp, tmp_res;
      /* handle the window underflow */
#if DEBUGLEVEL >= 3
      sprintf(errStr,"Window overflow during RESTORE");
      printError();
#endif
#if DEBUGLEVEL >=2
      if ((++(sparcPtr->no_restores) % 50) == 0) {
	sprintf(errStr,
		"50 Window underflow during RESTORE since last msg, PID=%d",
		sparcPtr->PID);
	printError();
      }
#endif
      /* change the window invalid mask register */
      if (new_cwp == (NWINDOWS-1))
	sparcPtr->WIM = 1;
      else
	sparcPtr->WIM = 1<<(new_cwp+1);
      /* get the frame pointer, so we can find the right place in memory */
      tmp_fp = sparcPtr->R[(22+(PSR_CWP(sparcPtr)*16)) % (16*NWINDOWS)];
      tmp_res = (unsigned) (8+(new_cwp*16)) % (16*NWINDOWS);
      /* restore the window ... beginning with the local-registers */
      for (i=0; i<8; i++) {
	GlobalMemoryOp(INVALID, READ_OP, tmp_fp,
		       &(sparcPtr->R[tmp_res]), 0xffffffff);
#if DEBUGLEVEL >= 3
	fprintf(stderr,"read: reg=%d, addr=0x%x, data=0x%x\n",
	       tmp_res, tmp_fp, sparcPtr->R[tmp_res]);
#endif
	tmp_fp = tmp_fp + 4; tmp_res++;
      }
      /* ... and continue with the in-registers */
      if (tmp_res >= 16*NWINDOWS) tmp_res = 0;
      for (i=0; i<8; i++) {
	GlobalMemoryOp(INVALID, READ_OP, tmp_fp,
		       &(sparcPtr->R[tmp_res]), 0xffffffff);
#if DEBUGLEVEL >= 3
	fprintf(stderr,"read: reg=%d, addr=0x%x, data=0x%x\n",
	       tmp_res, tmp_fp, sparcPtr->R[tmp_res]);
#endif
	tmp_fp = tmp_fp + 4; tmp_res++;
      }
      /* operands from old window */
      tmp_res = (unsigned) (S_R(rs1) + op2);
      SET_PSR_CWP(sparcPtr, new_cwp);
      /* destination in new window */
      S_RWR(rd,tmp_res);
#if DEBUGLEVEL >= 3
      printSparc(sparcPtr, instruction);
#endif
      updatePC;

    } else {
      register unsigned long tmp_res;
      /* operands from old window */
      tmp_res = S_R(rs1) + op2;
      SET_PSR_CWP(sparcPtr, new_cwp);
      /* destination in new window */
      S_RWR(rd,tmp_res);
      updatePC;
    }
    break;

  default:
    sprintf(errStr,"Unimplemented instruction, field op3");
    printError();
    sprintf(errStr,"instruction=0x%x,op3=0x%x",instruction,S_OP3(instruction));
    printError();
    dumpSparc(sparcPtr, instruction);

    return SC_ERROR;

  }
  goto TheEnd;

 Format_3b:
  switch (S_OP3(instruction)) {

  case OP3_LD:
    /* calculate the address */
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    *addressOut = S_R(rs1) + op2;

#if DEBUGLEVEL>=3
    /* temporary printing */
    if (*addressOut == 0)
      fprintf(stderr,"instructionCount=%d\n", sparcPtr->instructionCount);
#endif
#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif
    
#ifdef CHECK
    if ((*addressOut % 4) != 0) {
      sprintf(errStr,"Memory address 0x%x not 4-aligned, LD", *addressOut);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
    sparcPtr->internalState = WAIT_LD;
    sparcPtr->loadReg1 = rd;

    nbl_reg_int[pid] += rd;
    
    *memOp = READ_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_LD:
    instruction = sparcPtr->instruction;
    S_RWR(sparcPtr->loadReg1, *data);
    updatePC;
    break;

  case OP3_LDUB:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    *addressOut = S_R(rs1) + op2;

#if DEBUGLEVEL>=3
    /* temporary printing */
    if (*addressOut == 0)
      fprintf(stderr,"instructionCount=%d\n", sparcPtr->instructionCount);
#endif
#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif
    
    sparcPtr->internalState = WAIT_LDUB;
    sparcPtr->loadReg1 = rd;

    nbl_reg_int[pid] += rd;

    *memOp = READ_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_LDUB:
    instruction = sparcPtr->instruction;

    if ((*addressOut & 0x00000003)== 0){
	result = ((*data >> 24) & 0x000000ff);
	S_RWR(sparcPtr->loadReg1, result);
    } else if ((*addressOut & 0x00000003)== 2){
	result = ((*data >> 8 ) & 0x000000ff);
	S_RWR(sparcPtr->loadReg1, result);
    } else if ((*addressOut & 0x00000003)== 1){
	result = ((*data >> 16) & 0x000000ff);
	S_RWR(sparcPtr->loadReg1, result);
    } else {
	result = (*data & 0x000000ff);
	S_RWR(sparcPtr->loadReg1, result);
    }

    updatePC;
    break;

  case OP3_LDUH:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    *addressOut = S_R(rs1) + op2;

#if DEBUGLEVEL>=3
    /* temporary printing */
    if (*addressOut == 0)
      fprintf(stderr,"instructionCount=%d\n", sparcPtr->instructionCount);
#endif
#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif
    
#ifdef CHECK
    if ((*addressOut % 2) != 0) {
      sprintf(errStr,"Memory address not 2-aligned, LDUH");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
    sparcPtr->internalState = WAIT_LDUH;
    sparcPtr->loadReg1 = rd;

    nbl_reg_int[pid] += rd;

    *memOp = READ_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_LDUH:
    instruction = sparcPtr->instruction;

    if ((*addressOut & 0x00000003)== 0){
	result = ((*data >> 16) & 0x0000ffff);
	S_RWR(sparcPtr->loadReg1, result);
    } else {
	result = (*data & 0x0000ffff);
	S_RWR(sparcPtr->loadReg1, result);
    }

    updatePC;
    break;

  case OP3_LDD:
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    *addressOut = S_R(rs1) + op2;
#ifdef FP_DEBUG
    eadd = *addressOut;
#endif

#if DEBUGLEVEL>=3
    /* temporary printing */
    if (*addressOut == 0)
      fprintf(stderr,"instructionCount=%d\n", sparcPtr->instructionCount);
    if ((*addressOut % 8) != 0) {
      sprintf(errStr,"Memory address not 8-aligned, LDD");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif

    sparcPtr->internalState = WAIT_LDD1;
    sparcPtr->loadReg1 = rd & 0x1e;
    sparcPtr->loadReg2 = rd | 0x01;

    nbl_reg_int[pid] += rd;

    *memOp = READ_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_LDD1:
    S_RWR(sparcPtr->loadReg1, *data);
    *addressOut = *addressOut + 4;

    sparcPtr->internalState = WAIT_LDD2;
    *memOp = READ_OP;
    return Rcode;
  Wait_LDD2:
    instruction = sparcPtr->instruction;
    S_RWR(sparcPtr->loadReg2, *data);

#ifdef FP_DEBUG
    fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
    sparcPtr->d_convert.i[0] = S_R(sparcPtr->loadReg1);
    sparcPtr->d_convert.i[1] = S_R(sparcPtr->loadReg2);
    fprintf(stderr,"OPF_LDD: rs1=%d, op2=%d: rd=%d, loading (double) %f\n",
	     rs1, op2,
	     sparcPtr->loadReg1, sparcPtr->d_convert.d);    
    fprintf(stderr,"eadd: 0x%.8x\n", eadd);
#endif

    updatePC;
    break;

  case OP3_ST:
    if (nbl_reg_int[pid] == rd) {
	nbl_reg_int[pid] -= rd;
	    Rcode = SC_NBL_DEP;
    }
    if (nbl_reg_int[pid] == rs1){
	nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
    }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    *addressOut = S_R(rs1) + op2;

#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif
#ifdef CHECK
    if ((*addressOut % 4) != 0) {
      sprintf(errStr,"Memory address not 4-aligned, ST");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
    sparcPtr->internalState = WAIT_ST;
    *byteMask = 0xffffffff;


    *data = S_R(rd);

    *memOp = WRITE_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_ST:
    instruction = sparcPtr->instruction;
    updatePC;
    break;

  case OP3_STB:
      if (nbl_reg_int[pid] == rd){
	  nbl_reg_int[pid] -= rd;
	    Rcode = SC_NBL_DEP;
      }
      if (nbl_reg_int[pid] == rs1){
	  nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
      }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    *addressOut = S_R(rs1) + op2;

#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif
    sparcPtr->internalState = WAIT_STB;

    if ((*addressOut & 0x00000003)== 0){
      *byteMask = 0xff000000;
      *data = ((S_R(rd) & 0x000000ff) << 24);
    } else if ((*addressOut & 0x00000003)== 2){
      *byteMask = 0x0000ff00;
      *data = ((S_R(rd) & 0x000000ff) << 8);
    } else if ((*addressOut & 0x00000003)== 1){
      *byteMask = 0x00ff0000;
      *data = ((S_R(rd) & 0x000000ff) << 16);
    } else {
      *byteMask = 0x000000ff;
      *data = (S_R(rd) & 0x000000ff);
    }

#if 0
    switch(*addressOut & 0x00000003) {
    case 0:
      *byteMask = 0xff000000;
      *data = ((S_R(rd) & 0x000000ff) << 24);
      break;
    case 1:
      *byteMask = 0x00ff0000;
      *data = ((S_R(rd) & 0x000000ff) << 16);
      break;
    case 2:
      *byteMask = 0x0000ff00;
      *data = ((S_R(rd) & 0x000000ff) << 8);
      break;
    case 3:
      *byteMask = 0x000000ff;
      *data = (S_R(rd) & 0x000000ff);
      break;
    }
#endif

    *memOp = WRITE_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_STB:
    instruction = sparcPtr->instruction;
    updatePC;
    break;

  case OP3_STH:
      if (nbl_reg_int[pid] == rd){
	  nbl_reg_int[pid] -= rd;
	    Rcode = SC_NBL_DEP;
      }
      if (nbl_reg_int[pid] == rs1){
	  nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
      }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    *addressOut = S_R(rs1) + op2;

#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif
    
#ifdef CHECK
    if ((*addressOut % 2) != 0) {
      sprintf(errStr,"Memory address not 2-aligned, STH");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
    sparcPtr->internalState = WAIT_STH;

    if ((*addressOut & 0x00000003)== 0){
      *byteMask = 0xffff0000;
      *data = ((S_R(rd) & 0x0000ffff) << 16);
    } else {
      *byteMask = 0x0000ffff;
      *data = (S_R(rd) & 0x0000ffff);
    }

#if 0
    switch(*addressOut & 0x00000003) {
    case 0:
      *byteMask = 0xffff0000;
      *data = ((S_R(rd) & 0x0000ffff) << 16);
      break;
    case 2:
      *byteMask = 0x0000ffff;
      *data = (S_R(rd) & 0x0000ffff);
      break;
    }
#endif

    *memOp = WRITE_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_STH:
    instruction = sparcPtr->instruction;
    updatePC;
    break;

  case OP3_STD:
      if (nbl_reg_int[pid] == rd){
	  nbl_reg_int[pid] -= rd;
	    Rcode = SC_NBL_DEP;
      }
      if (nbl_reg_int[pid] == rs1){
	  nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
      }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    *addressOut = S_R(rs1) + op2;
#ifdef FP_DEBUG
    eadd = *addressOut;
#endif
#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif
#ifdef CHECK
    if ((*addressOut % 8) != 0) {
      sprintf(errStr,"Memory address not 8-aligned, STD");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
    sparcPtr->internalState = WAIT_STD1;
    *byteMask = 0xffffffff;
    *data = S_R((rd & 0x1e));
    *memOp = WRITE_OP;
    sparcPtr->instruction = instruction;

#ifdef FP_DEBUG
    sparcPtr->d_convert.i[0] = *data;
#endif

    return Rcode;
  Wait_STD1:
    *addressOut = *addressOut + 4;
    sparcPtr->internalState = WAIT_STD2;
    *byteMask = 0xffffffff;
    *data = S_R((S_RD(sparcPtr->instruction) | 0x1));
    *memOp = WRITE_OP;

#ifdef FP_DEBUG
    sparcPtr->d_convert.i[1] = *data;
    fprintf(stderr,"OPF_STD: rs1=%d, op2=%d: rd=%d, storing (double) %f\n",
	     rs1, op2,
	     S_RD(sparcPtr->instruction), sparcPtr->d_convert.d);    
    fprintf(stderr,"eadd: 0x%.8x\n", eadd);
#endif
    return Rcode;

  Wait_STD2:
    instruction = sparcPtr->instruction;

    updatePC;
    break;

  case OP3_LDSB:
      if (nbl_reg_int[pid] == rs1){
	  nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
      }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    *addressOut = S_R(rs1) + op2;

#if DEBUGLEVEL>=3
    /* temporary printing */
    if (*addressOut == 0)
      fprintf(stderr,"instructionCount=%d\n", sparcPtr->instructionCount);
#endif
#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif

    sparcPtr->internalState = WAIT_LDSB;
    sparcPtr->loadReg1 = rd;

    nbl_reg_int[pid] += rd;

    *memOp = READ_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_LDSB:
    instruction = sparcPtr->instruction;

    if ((*addressOut & 0x00000003)== 0){
      result = (*data >> 24) & 0x000000ff;
    } else if ((*addressOut & 0x00000003)== 2){
      result = (*data >> 8 ) & 0x000000ff;
    } else if ((*addressOut & 0x00000003)== 1){
      result = (*data >> 16) & 0x000000ff;
    } else {
      result = (*data & 0x000000ff);
    }

    if ((result & 0x00000080) != 0)
      result = result | ~0xff;
    S_RWR(sparcPtr->loadReg1,result);
    updatePC;
    break;

  case OP3_LDSH:
      if (nbl_reg_int[pid] == rs1){
	  nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
      }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    *addressOut = S_R(rs1) + op2;

#if DEBUGLEVEL>=3
    /* temporary printing */
    if (*addressOut == 0)
      fprintf(stderr,"instructionCount=%d\n", sparcPtr->instructionCount);
#endif
#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif

#ifdef CHECK
    if ((*addressOut % 2) != 0) {
      sprintf(errStr,"Memory address not 2-aligned, LDSH");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
    sparcPtr->internalState = WAIT_LDSH;
    sparcPtr->loadReg1 = rd;

    nbl_reg_int[pid] += rd;

    *memOp = READ_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_LDSH:
    instruction = sparcPtr->instruction;

    if ((*addressOut & 0x00000003)== 0){
      result = ((*data >> 16) & 0x0000ffff);
    } else {
      result = (*data & 0x0000ffff);
    }

    if ((result & 0x00008000) != 0)
      result = result | ~0xffff;
    S_RWR(sparcPtr->loadReg1, result);
    updatePC;
    break;

  case OP3_LDSTUB:
    *addressOut = S_R(rs1) + op2;

#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif

    sparcPtr->internalState = WAIT_LDSTUB;
    sparcPtr->loadReg1 = rd;

    if ((*addressOut & 0x00000003)== 0){
      *byteMask = 0xff000000;
    } else if ((*addressOut & 0x00000003)== 2){
      *byteMask = 0x0000ff00;
    } else if ((*addressOut & 0x00000003)== 1){
      *byteMask = 0x00ff0000;
    } else {
      *byteMask = 0x000000ff;
    }

    *data = 0xffffffff;
    *memOp = TESTANDSET_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_LDSTUB:
    instruction = sparcPtr->instruction;

    if ((*addressOut & 0x00000003)== 0){
	result = ((*data >> 24) & 0x000000ff);
	S_RWR(sparcPtr->loadReg1, result);
    } else if ((*addressOut & 0x00000003)== 2){
	result = ((*data >> 8 ) & 0x000000ff);
	S_RWR(sparcPtr->loadReg1, result);
    } else if ((*addressOut & 0x00000003)== 1){
	result = ((*data >> 16) & 0x000000ff);
	S_RWR(sparcPtr->loadReg1, result);
    } else {
	result = (*data & 0x000000ff);
	S_RWR(sparcPtr->loadReg1, result);
    }

    updatePC;
    break;

  case OP3_SWAP:
    *addressOut = S_R(rs1) + op2;

#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif
    sparcPtr->internalState = WAIT_SWAP;
    sparcPtr->loadReg1 = rd;
    *byteMask = 0xffffffff;
    *data = S_R(rd);
    *memOp = TESTANDSET_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_SWAP:
    instruction = sparcPtr->instruction;
    S_RWR(sparcPtr->loadReg1, *data);
    updatePC;
    break;

  case OP3_LDSTUBA:
    /* BARRIER instruction */
    *memOp = BAR_OP;
    /* calculate the address space, used to pass the number of processors*/
    *addressSpace = S_R(rs1);
    updatePC;
    break;
 
  case OP3_LDF:
      if (nbl_reg_int[pid] == rs1){
	  nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
      }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }
    *addressOut = S_R(rs1) + op2;

#if DEBUGLEVEL>=3
    /* temporary printing */
    if (*addressOut == 0)
      fprintf(stderr,"instructionCount=%d\n", sparcPtr->instructionCount);
    if ((*addressOut % 4) != 0) {
      sprintf(errStr,"Memory address not 4-aligned, LDF");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif

    sparcPtr->internalState = WAIT_LDF;
    sparcPtr->loadReg1 = rd;

    nbl_reg_flt[pid] += rd;

    *memOp = READ_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_LDF:
    instruction = sparcPtr->instruction;
    sparcPtr->f_convert.i = *data;
    S_FWR(sparcPtr->loadReg1, sparcPtr->f_convert.f);

#ifdef FP_DEBUG
    fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
    fprintf(stderr,"OPF_LDF: rs1=%d, op2=%d: rd=%d, loading %f\n",
	     rs1, op2,
	     sparcPtr->loadReg1, S_F(sparcPtr->loadReg1));    
    fprintf(stderr,"eadd: 0x%.8x\n", S_R(rs1) + op2);
    if (sparcPtr->loadReg1%2) {
	/* Check double registers */
	fprintf(stderr,"sparcPtr->d[%d] = %f\n", (sparcPtr->loadReg1>>1),
	       sparcPtr->d[(sparcPtr->loadReg1>>1)]);
    }
#endif
    updatePC;
    break;

  case OP3_LDFSR:
      if (nbl_reg_int[pid] == rs1){
	  nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
      }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }
    *addressOut = S_R(rs1) + op2;

#if DEBUGLEVEL>=3
    /* temporary printing */
    if (*addressOut == 0)
      fprintf(stderr,"instructionCount=%d\n", sparcPtr->instructionCount);
#endif
#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif
    
#ifdef CHECK
    if ((*addressOut % 4) != 0) {
      sprintf(errStr,"Memory address 0x%x not 4-aligned, LD", *addressOut);
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
    sparcPtr->internalState = WAIT_LDFSR;
    *memOp = READ_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_LDFSR:
    instruction = sparcPtr->instruction;
    sparcPtr->FSR = *data;
    sparcPtr->fcc = (unsigned short) GET_FCC;
    updatePC;

    break;

  case OP3_LDDF:
      if (nbl_reg_int[pid] == rs1){
	  nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
      }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }

    *addressOut = S_R(rs1) + op2;
#ifdef FP_DEBUG
    eadd = *addressOut;
#endif

#if DEBUGLEVEL>=3
    /* temporary printing */
    if (*addressOut == 0)
      fprintf(stderr,"instructionCount=%d\n", sparcPtr->instructionCount);
    if ((*addressOut % 8) != 0) {
      sprintf(errStr,"Memory address not 8-aligned, LDDF");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif

    sparcPtr->internalState = WAIT_LDDF1;
    sparcPtr->loadReg1 = rd & 0x1e;
    sparcPtr->loadReg2 = rd | 0x01;

    nbl_reg_flt[pid] += rd;

    *memOp = READ_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_LDDF1:
    sparcPtr->d_convert.i[0] = *data;
    *addressOut = *addressOut + 4;

    sparcPtr->internalState = WAIT_LDDF2;
    *memOp = READ_OP;
    return Rcode;
  Wait_LDDF2:
    instruction = sparcPtr->instruction;
    sparcPtr->d_convert.i[1] = *data;
    sparcPtr->d[(sparcPtr->loadReg1>>1)] = sparcPtr->d_convert.d;

#ifdef FP_DEBUG
    fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
    fprintf(stderr,"OPF_LDDF: rs1=%d, op2=%d: rd=%d, loading %f (0x%.8x, 0x%.8x)\n",
	     rs1, op2,
	     sparcPtr->loadReg1, sparcPtr->d_convert.d, 
	   sparcPtr->d_convert.i[0], sparcPtr->d_convert.i[1]);
    fprintf(stderr,"eadd: 0x%.8x\n", eadd);
#endif

    updatePC;
    break;

  case OP3_STF:
      if (nbl_reg_flt[pid] == rd){
	  nbl_reg_flt[pid] -= rd;
	    Rcode = SC_NBL_DEP;
      }
      if (nbl_reg_int[pid] == rs1){
	  nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
      }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }
    *addressOut = S_R(rs1) + op2;
#ifdef FP_DEBUG
    eadd = *addressOut;
    fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
    fprintf(stderr,"OPF_STF: rs1=%d, op2=%d: rd=%d, storing %f\n",
	     rs1, op2,
	     sparcPtr->loadReg1, S_F(sparcPtr->loadReg1));    
    fprintf(stderr,"eadd: 0x%.8x\n", eadd);
    if (sparcPtr->loadReg1%2) {
	/* Check double registers */
	fprintf(stderr,"sparcPtr->d[%d] = %f\n", (sparcPtr->loadReg1>>1),
	       sparcPtr->d[(sparcPtr->loadReg1>>1)]);
    }
#endif

#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif
#ifdef CHECK
    if ((*addressOut % 4) != 0) {
      sprintf(errStr,"Memory address not 4-aligned, STF");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
    sparcPtr->internalState = WAIT_STF;
    *byteMask = 0xffffffff;

    f1 = S_F(rd);
    sparcPtr->f_convert.f = f1;
    *data = sparcPtr->f_convert.i;
    *memOp = WRITE_OP;
    sparcPtr->instruction = instruction;
    return Rcode;
  Wait_STF:
    instruction = sparcPtr->instruction;


    updatePC;
    break;

  case OP3_STFSR:
      if (nbl_reg_int[pid] == rs1){
	  nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
      }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }
    *addressOut = S_R(rs1) + op2;

#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif

    SET_FSR(sparcPtr->fcc);
    *data = sparcPtr->FSR;
    *byteMask = 0xffffffff;
    *memOp = WRITE_OP;

    sparcPtr->internalState = WAIT_STFSR;
    sparcPtr->instruction = instruction;
    return Rcode;

  Wait_STFSR:
    instruction = sparcPtr->instruction;
    updatePC;
    break;

  case OP3_STDFQ:
    sprintf(errStr,"STDFQ not yet implemented");
    printError();
    dumpSparc(sparcPtr, instruction);
    return SC_ERROR;


  case OP3_STDF:
      if (nbl_reg_flt[pid] == rd){
	  nbl_reg_flt[pid] -= rd;
	    Rcode = SC_NBL_DEP;
      }
      if (nbl_reg_int[pid] == rs1){
	  nbl_reg_int[pid] -= rs1;
	    Rcode = SC_NBL_DEP;
      }
    if (S_I(instruction) == 0) {
	if (nbl_reg_int[pid] == rs2) {
	    nbl_reg_int[pid] -= rs2;
	    Rcode = SC_NBL_DEP;
	}
    }
    *addressOut = S_R(rs1) + op2;

#ifdef FP_DEBUG
    eadd = *addressOut;
#endif

#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 10 : 11);
#else
    *addressSpace = 10;
#endif
    
#ifdef CHECK
    if ((*addressOut % 8) != 0) {
      sprintf(errStr,"Memory address not 8-aligned, STDF");
      printError();
      dumpSparc(sparcPtr, instruction);

      return SC_ERROR;
    }
#endif
    sparcPtr->internalState = WAIT_STDF1;
    *byteMask = 0xffffffff;

    sparcPtr->d_convert.d = sparcPtr->d[((rd & 0x1e)>>1)];
    *data = sparcPtr->d_convert.i[0];
    *memOp = WRITE_OP;
    sparcPtr->instruction = instruction;
    return Rcode;

  Wait_STDF1:
    *addressOut = *addressOut + 4;
    sparcPtr->internalState = WAIT_STDF2;
    *byteMask = 0xffffffff;
    *data = sparcPtr->d_convert.i[1];
    *memOp = WRITE_OP;

      return Rcode;

  Wait_STDF2:
    instruction = sparcPtr->instruction;

#ifdef FP_DEBUG
    fprintf(stderr,"PC = 0x%x\n", sparcPtr->PC);
    fprintf(stderr,"OPF_STDF: rs1=%d, op2=%d: rd=%d, storing %f (0x%.8x,0x%.8x)\n",
	     rs1, op2,
	     sparcPtr->loadReg1, sparcPtr->d_convert.d, 
	   sparcPtr->d_convert.i[0], sparcPtr->d_convert.i[1]); 
    fprintf(stderr,"eadd: 0x%.8x\n", eadd);
#endif
    updatePC;
    break;

  default:
    sprintf(errStr,"Unimplemented instruction");
    printError();
    dumpSparc(sparcPtr, instruction);

    return SC_ERROR;
  }
  goto TheEnd;

 TheEnd:
  if (end_simulation)
    EndOfSimulation();

#if 0
  if (sparcPtr->FPop1 || sparcPtr->FPop2) {
    /* complete the floating point instruction, not implemented yet */
  }
#endif

  if (*memOp != BAR_OP) {
    /* not a BARRIER 'instruction' */
#ifdef USERSTATES
    *addressSpace = (PSR_S(sparcPtr) == 0 ? 8 : 9);
#else
    *addressSpace = 8;
#endif
    *addressOut = sparcPtr->PC;
    *memOp = READ_OP;
    sparcPtr->internalState = WAIT_INSTRUCTION;

    return Rcode;
  } else {
    /* a BARRIER 'instruction' */
    *addressOut = sparcPtr->PC;
    sparcPtr->internalState = WAIT_INSTRUCTION;

    return Rcode;
  }
}

int
ExitSparc(Sparc sparcPtr /* the machine to do exit on */)
{
  free(sparcPtr);
  sparcPtr = NULL;
  return 0;
}

void printSparc(Sparc sparcPtr, unsigned long ins)
{
  int i;
  fprintf(stderr,"\nProcessordata: PID=0x%x, PC=0x%x, nPC=0x%x, sp=0x%x, fp=0x%x\n",
	 sparcPtr->PID, sparcPtr->PC, sparcPtr->nPC,
	 S_R(14), S_R(30));

#if 1 /* debug global regs */
  for (i=0; i<8; i++)
    fprintf(stderr,"G[%d]=0x%x ", i, sparcPtr->G[i]);
  fprintf(stderr,"\n");
#endif

#if DEBUGLEVEL >= 4
  for (i=0; i<(16*NWINDOWS); i++)
    fprintf(stderr,"R[%d]=0x%x ", i, sparcPtr->R[i]);
  fprintf(stderr,"\n");
#else
  for (i=8; i<=31; i++)
    fprintf(stderr,"R[%d]=0x%x ", i, S_R(i));
  fprintf(stderr,"\n");
#endif

#if 1 /* debug floating point regs */
  for (i=0; i<32; i++)
    fprintf(stderr,"f[%d]=%f ", i, sparcPtr->f[i]);
  fprintf(stderr,"\n");
  for (i=0; i<16; i++)
    fprintf(stderr,"d[%d]=%f ", i, sparcPtr->d[i]);
  fprintf(stderr,"\n");
  fprintf(stderr,"fcc=%d\n", sparcPtr->fcc);
#endif

  fprintf(stderr,"WIM = 0x%x\n", sparcPtr->WIM);
  fprintf(stderr,"PSR = 0x%x\n", sparcPtr->PSR);
  fprintf(stderr,"CWP=0x%x N=%d Z=%d V=%d C=%d S=%d Y=0x%x\n",
	 PSR_CWP(sparcPtr), PSR_N(sparcPtr)>>23, PSR_Z(sparcPtr)>>22, 
	 PSR_V(sparcPtr)>>21, PSR_C(sparcPtr)>>20, 
	 PSR_S(sparcPtr)>>7, sparcPtr->Y);

  fprintf(stderr,"instruction=0x%x\n", ins);
  fprintf(stderr,"op=0x%x op2=0x%x op3=0x%x opf=0x%x opc=0x%x\n",
	 S_OP(ins), S_OP2(ins), S_OP3(ins), S_OPF(ins), S_OPC(ins));
  fprintf(stderr,"asi=0x%x i=%d rd=%d a=%d cond=0x%x rs1=%d rs2=%d\n",
	 S_ASI(ins), S_I(ins), S_RD(ins), (unsigned short) S_A(ins),
	 S_COND(ins), S_RS1(ins), S_RS2(ins));
  fprintf(stderr,"simm13=0x%x imm22=0x%x shcnt=%d trapno=%d disp30=0x%x disp22=0x%x\n",
	 S_SIMM13(ins), S_IMM22(ins), S_SHCNT(ins), S_TRAPNO(ins),
	 S_DISP30(ins), S_DISP22(ins));
  
  fprintf(stderr,"instructionCount=%d\n", sparcPtr->instructionCount);
}

void dumpSparc(Sparc sparcPtr, unsigned long ins)
{
  printSparc(sparcPtr, ins);
  exit(123);
}

void external_dump(){
  printSparc(latest_sparcPtr, latest_instruction);
}
