
/*
 * sparcP.h - private definitions for sparc simulator
 *
 * Author: H…kan Nilsson, nesse@dit.lth.se
 *
 * Date: 920227
 */

#ifndef _SPARCP_H_
#define _SPARCP_H_

#include "sparc.h"
#include "codes.h"


/*
 * define macros for the process state register PSR
 */
/* Set bit n in PSR */
#define SET_PSR(__sparcPtr, n)        (__sparcPtr->PSR |= (1<<n))
/* Get bit n in PSR */
#define GET_PSR(__sparcPtr,n)        (__sparcPtr->PSR & ~(1 << n))

#define SET_PSR_CWP(__sparcPtr,n)    {\
                              __sparcPtr->PSR &= ~0x1f;\
                              __sparcPtr->PSR |= n;\
                           }
#define PSR_CWP(__sparcPtr)           (__sparcPtr->PSR & 0x1f)

#define SET_PSR_ET(__sparcPtr)        (__sparcPtr->PSR |= 0x20)
#define CLEAR_PSR_ET(__sparcPtr)      (__sparcPtr->PSR &= ~0x20)
#define PSR_ET(__sparcPtr)            (__sparcPtr->PSR & 0x20)

#define SET_PSR_PS(__sparcPtr)        (__sparcPtr->PSR |= 0x40)
#define CLEAR_PSR_PS(__sparcPtr)      (__sparcPtr->PSR &= ~0x40)
#define PSR_PS(__sparcPtr)            (__sparcPtr->PSR & 0x40)

#define SET_PSR_S(__sparcPtr)         (__sparcPtr->PSR |= 0x80)
#define CLEAR_PSR_S(__sparcPtr)       (__sparcPtr->PSR &= ~0x80)
#define PSR_S(__sparcPtr)             (__sparcPtr->PSR & 0x80)

#define SET_PSR_PIL(__sparcPtr,n)    {\
                              __sparcPtr->PSR &= ~0xf00;\
                              __sparcPtr->PSR |= (n<<8);\
                           }
#define PSR_PIL(__sparcPtr)           ((__sparcPtr->PSR & 0xf00)>>8)

#define SET_PSR_EF(__sparcPtr)        (__sparcPtr->PSR |= 0x1000)
#define CLEAR_PSR_EF(__sparcPtr)      (__sparcPtr->PSR &= ~0x1000)
#define PSR_EF(__sparcPtr)            (__sparcPtr->PSR & 0x1000)

#define SET_PSR_EC(__sparcPtr)        (__sparcPtr->PSR |= 0x2000)
#define CLEAR_PSR_EC(__sparcPtr)      (__sparcPtr->PSR &= ~0x2000)
#define PSR_EC(__sparcPtr)            (__sparcPtr->PSR & 0x2000)

#define GET_PSR_FLAGS(__sparcPtr)     ((__sparcPtr->PSR >> 20) & 15)

#define SET_PSR_C(__sparcPtr)         (__sparcPtr->PSR |= 0x100000)
#define CLEAR_PSR_C(__sparcPtr)       (__sparcPtr->PSR &= ~0x100000)
#define PSR_C(__sparcPtr)             (__sparcPtr->PSR & 0x100000)

#define SET_PSR_V(__sparcPtr)         (__sparcPtr->PSR |= 0x200000)
#define CLEAR_PSR_V(__sparcPtr)       (__sparcPtr->PSR &= ~0x200000)
#define PSR_V(__sparcPtr)             (__sparcPtr->PSR & 0x200000)

#define SET_PSR_Z(__sparcPtr)         (__sparcPtr->PSR |= 0x400000)
#define CLEAR_PSR_Z(__sparcPtr)       (__sparcPtr->PSR &= ~0x400000)
#define PSR_Z(__sparcPtr)             (__sparcPtr->PSR & 0x400000)

#define SET_PSR_N(__sparcPtr)         (__sparcPtr->PSR |= 0x800000)
#define CLEAR_PSR_N(__sparcPtr)       (__sparcPtr->PSR &= ~0x800000)
#define PSR_N(__sparcPtr)             (__sparcPtr->PSR & 0x800000)

#define SET_PSR_VER(__sparcPtr,n)    {\
                              __sparcPtr->PSR &= ~0xf000000;\
                              __sparcPtr->PSR |= (n<<24);\
                           }
#define PSR_VER(__sparcPtr)           ((__sparcPtr->PSR & 0xf000000)>>24)


/*
 * define the different states the processor simulation can be in
 */
#define INIT_STATE       0
#define WAIT_INSTRUCTION 1
#define WAIT_LD          2
#define WAIT_ST          3
#define WAIT_LDSTUB      4
#define WAIT_SWAP        5
#define WAIT_LDUB        6
#define WAIT_STB         7
#define WAIT_LDSB        8

#define WAIT_LDUH        9
#define WAIT_LDD1        10
#define WAIT_LDD2        11
#define WAIT_STH         12
#define WAIT_STD1        13
#define WAIT_STD2        14
#define WAIT_LDSH        15

#define WAIT_LDF           16
#define WAIT_LDFSR         17
#define WAIT_LDDF1         18
#define WAIT_LDDF2         19
#define WAIT_STF           20
#define WAIT_STFSR         21
#define WAIT_STDFQ         22
#define WAIT_STDF1         23
#define WAIT_STDF2         24


/*
 * define some macros for masking the different fields of an intruction
 */
#if 0
  /* change the macros for performance reason, the SPARC don't allow
   * immediates larger than 12 bits in logical AND operations.
   */
#define S_OP(x)      (((x >> 30)) & 0x00000003)
#define S_OP2(x)     (((x >> 22)) & 0x00000007)
#define S_OP3(x)     (((x >> 19)) & 0x0000003f)
#define S_OPF(x)     (((x >>  5)) & 0x000001ff)
#define S_OPC(x)     (((x >>  5)) & 0x000001ff)
#define S_ASI(x)     (((x >>  5)) & 0x000000ff)
#define S_I(x)       (((x >> 13)) & 0x00000001)
#define S_RD(x)      (((x >> 25)) & 0x0000001f)
#define S_A(x)       (((x >> 29)) & 0x00000001)
#define S_COND(x)    (((x >> 25)) & 0x0000000f)
#define S_RS1(x)     (((x >> 14)) & 0x0000001f)
#define S_RS2(x)     (x & 0x0000001f)
#define S_SIMM13(x)  (x & 0x00001fff)
#define S_IMM22(x)   (x & 0x003fffff)
#define S_SHCNT(x)   (x & 0x0000001f)
#define S_TRAPNO(x)  (x & 0x0000003f)
#define S_DISP30(x)  (x & 0x3fffffff)
#define S_DISP22(x)  (x & 0x003fffff)

#define S_SIGN13(x)  (((x >> 13)) & 0x00000001)
#define S_SIGN22(x)  (((x >> 22)) & 0x00000001)
#define S_SIGN31(x)  (((x >> 31)) & 0x00000001)
#else

  /* here is the old definitions of the macros ... */
#define S_OP(x)      ((x & 0xc0000000) >> 30)
#define S_OP2(x)     ((x & 0x01c00000) >> 22)
#define S_OP3(x)     ((x & 0x01f80000) >> 19)
#define S_OPF(x)     ((x & 0x00003fe0) >> 5)
#define S_OPC(x)     ((x & 0x00003fe0) >> 5)
#define S_ASI(x)     ((x & 0x00001fe0) >> 5)
#define S_I(x)       ((x & 0x00002000) >> 13)
#define S_RD(x)      ((x & 0x3e000000) >> 25)
#define S_A(x)       ((x & 0x20000000) >> 29)
#define S_COND(x)    ((x & 0x1e000000) >> 25)
#define S_RS1(x)     ((x & 0x0007c000) >> 14)
#define S_RS2(x)     (x & 0x0000001f)
#define S_SIMM13(x)  (x & 0x00001fff)
#define S_IMM22(x)   (x & 0x003fffff)
#define S_SHCNT(x)   (x & 0x0000001f)
#define S_TRAPNO(x)  (x & 0x0000003f)
#define S_DISP30(x)  (x & 0x3fffffff)
#define S_DISP22(x)  (x & 0x003fffff)

#define S_SIGN13(x)  (x & 0x00001000)
#define S_SIGN22(x)  (x & 0x00200000)
#define S_SIGN31(x)  ((x & 0x80000000) >> 31)
#endif

/*
 * define a macro to read from a correct register
 */
#if 1
#define S_R(rs_x) ( \
		   ((macro_n=rs_x)>=8) ? \
		   /* windowed registers */ \
		   sparcPtr->R[((macro_n-8)+(PSR_CWP(sparcPtr)<<4/* *16 */)) % (NWINDOWS<<4)] \
		   : ( (macro_n!=0) ? \
		      /* global registers */ \
		      sparcPtr->G[macro_n] \
		      : \
		      0 \
		      ) \
		   )
#else
#define S_R(n) ( (n>=8) ? \
                 /* windowed registers */ \
                 sparcPtr->R[((n-8)+(PSR_CWP(sparcPtr)*16)) % (16*NWINDOWS)] \
               : ( (n!=0) ? \
                 /* global registers */ \
                 sparcPtr->G[n] \
               : \
                 0 \
               ) \
             )
#endif

/*
 * define a macro to write to a correct register
 */
#if 1
#define S_RWR(rd_x,data)  { \
  if ((macro_n=rd_x)>=8) \
    /* windowed registers */ \
    sparcPtr->R[((macro_n-8)+((PSR_CWP(sparcPtr))<<4/* *16*/)) % (NWINDOWS<<4)] =\
      data; \
  else if (macro_n!=0) \
    sparcPtr->G[macro_n] = data; \
}
#else
#define S_RWR(n,data)  { \
  if (n>=8) \
    sparcPtr->R[((n-8)+(PSR_CWP(sparcPtr)*16)) % (16*NWINDOWS)] = data; \
  else if (n!=0) \
    sparcPtr->G[n] = data; \
}
#endif

/*
 * define a macro to read from a correct floating-point register
 */
#define S_F(n)  ( \
  sparcPtr->f[n] \
)

/*
 * define a macro to write to a correct floating-point register
 */
#define S_FWR(n,data)  ( \
  sparcPtr->f[n] = data \
)

/*
 * define macros for the floating-point fcc
 */
#define SET_FSR(n) { \
		       sparcPtr->FSR &= 0xFFFFF3FF; \
		       sparcPtr->FSR |= (n<<10); \
					 }

#define GET_FCC      (sparcPtr->FSR >> 10) & 3

#define S_FCC_E ( \
  (sparcPtr->fcc == 0) \
)

#define S_FCC_L ( \
  (sparcPtr->fcc == 1) \
)

#define S_FCC_G ( \
  (sparcPtr->fcc  == 2) \
)

#define S_FCC_U ( \
  (sparcPtr->fcc  == 3) \
)

/*
 * define a macro to find the correct operand2
 */
#define operand2(x) ( (S_I(x) == 0) ? \
		     /* no immediate */ \
		     S_R(S_RS2(x)) \
		     : ( (S_SIGN13(x)) ? \
			/* sign extended immediate */ \
			(0xffffe000 | S_SIMM13(x)) \
			: \
			/* no sign extention */ \
			S_SIMM13(x) \
			) \
		     )

/*
 * define a macro to calculate shift count
 */
#define shift_count(x) ( (S_I(x) == 0) ? \
			/* no immediate */ \
			(0x0000001f & S_R(S_RS2(x))) \
			: S_SHCNT(x) \
			)

/*
 * define a macro to find the correct operands for MULScc instruction
 */
#define MULScc_operand1(x) ((((PSR_N(sparcPtr)>>23)&1) ^ \
			     ((PSR_V(sparcPtr)>>21)&1)) ? \
			    0x80000000 | (S_R(S_RS1(x)) >> 1) : \
			    0x7fffffff & (S_R(S_RS1(x)) >> 1) \
			    )
#define MULScc_operand2(x) ((sparcPtr->Y & 0x00000001) == 0 ? 0 : operand2(x))

/*
 * define a macro to update PC and nPC
 */
#define updatePC  { sparcPtr->PC = sparcPtr->nPC; \
                    sparcPtr->nPC = sparcPtr->nPC + 4; }



#endif /* _SPARCP_H_ */


