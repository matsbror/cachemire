/*
 * codes.h - define the different opcodes that sparc uses
 *
 * Author: Fredrik Dahlgren, fredrik@dit.lth.se
 *
 * Date: 920227
 */

#ifndef _CODES_H_
#define _CODES_H_

/* Formats, op[1:0] */
#define OP_CALL         1
#define OP_FORMAT_2     0
#define OP_FORMAT_3A    2
#define OP_FORMAT_3B    3

/* Format 2: op2[2:0] */
#define OP2_UNIMP       0
#define OP2_Bicc        2
#define OP2_SETHI       4
#define OP2_FBfcc       6
#define OP2_CBccc       7

/* Format 3A: op3[5:0] */

#define OP3_ADD       0x0
#define OP3_AND       0x1
#define OP3_OR        0x2
#define OP3_XOR       0x3
#define OP3_SUB       0x4
#define OP3_ANDN      0x5
#define OP3_ORN       0x6         
#define OP3_XNOR      0x7
#define OP3_ADDX      0x8
#define OP3_UMUL      0xA
#define OP3_SMUL      0xB
#define OP3_SUBX      0xC 
#define OP3_UDIV      0xE
#define OP3_SDIV      0xF

#define OP3_ADDcc    0x10
#define OP3_ANDcc    0x11
#define OP3_ORcc     0x12
#define OP3_XORcc    0x13
#define OP3_SUBcc    0x14
#define OP3_ANDNcc   0x15
#define OP3_ORNcc    0x16        
#define OP3_XNORcc   0x17   
#define OP3_ADDXcc   0x18   
#define OP3_UMULcc   0x1A
#define OP3_SMULcc   0x1B
#define OP3_SUBXcc   0x1C 
#define OP3_UDIVcc   0x1E
#define OP3_SDIVcc   0x1F

#define OP3_TADDcc     0x20
#define OP3_TSUBcc     0x21
#define OP3_TADDccTV   0x22
#define OP3_TSUBccTV   0x23
#define OP3_MULScc     0x24
#define OP3_SLL        0x25
#define OP3_SRL        0x26
#define OP3_SRA        0x27
#define OP3_RDASR      0x28
#define OP3_RDPSR      0x29
#define OP3_RDWIM      0x2A
#define OP3_RDTBR      0x2B


#define OP3_WRASR     0x30
#define OP3_WRPSR     0x31
#define OP3_WRWIM     0x32
#define OP3_WRTBR     0x33
#define OP3_FPop1     0x34
#define OP3_FPop2     0x35
#define OP3_CPop1     0x36
#define OP3_CPop2     0x37
#define OP3_JMPL      0x38
#define OP3_RETT      0x39
#define OP3_Ticc      0x3A
#define OP3_FLUSH     0x3B
#define OP3_SAVE      0x3C
#define OP3_RESTORE   0x3D


/* Format 3B: op3[5:0] */

#define OP3_LD        0x0
#define OP3_LDUB      0x1
#define OP3_LDUH      0x2
#define OP3_LDD       0x3
#define OP3_ST        0x4
#define OP3_STB       0x5
#define OP3_STH       0x6
#define OP3_STD       0x7
#define OP3_LDSB      0x9
#define OP3_LDSH      0xA
#define OP3_LDSTUB    0xD
#define OP3_SWAP      0xF

#define OP3_LDA        0x10
#define OP3_LDUBA      0x11
#define OP3_LDUHA      0x12
#define OP3_LDDA       0x13
#define OP3_STA        0x14
#define OP3_STBA       0x15
#define OP3_STHA       0x16
#define OP3_STDA       0x17
#define OP3_LDSBA      0x19
#define OP3_LDSHA      0x1A
#define OP3_LDSTUBA    0x1D
#define OP3_SWAPA      0x1F

#define OP3_LDF        0x20
#define OP3_LDFSR      0x21
#define OP3_LDDF       0x23
#define OP3_STF        0x24
#define OP3_STFSR      0x25
#define OP3_STDFQ      0x26
#define OP3_STDF       0x27

#define OP3_LDC        0x30
#define OP3_LDCSR      0x31
#define OP3_LDDC       0x33
#define OP3_STC        0x34
#define OP3_STCSR      0x35
#define OP3_STDCQ      0x36
#define OP3_STDC       0x37


/* FPop1, opfl[8:0] (op=2,op3=0x34=FPop1) */

#define OPF_FMOVs     0x01
#define OPF_FNEGs     0x05
#define OPF_FABSs     0x09
#define OPF_FSQRTs    0x29
#define OPF_FSQRTd    0x2A
#define OPF_FSQRTq    0x2B
#define OPF_FADDs     0x41
#define OPF_FADDd     0x42
#define OPF_FADDq     0x43
#define OPF_FSUBs     0x45
#define OPF_FSUBd     0x46
#define OPF_FSUBq     0x47
#define OPF_FMULs     0x49
#define OPF_FMULd     0x4A
#define OPF_FMULq     0x4B
#define OPF_FDIVs     0x4D
#define OPF_FDIVd     0x4E
#define OPF_FDIVq     0x4F
#define OPF_FsMULd    0x69
#define OPF_FdMULq    0x6E
#define OPF_FiTOs     0xC4
#define OPF_FdTOs     0xC6
#define OPF_FqTOs     0xC7
#define OPF_FiTOd     0xC8
#define OPF_FsTOd     0xC9
#define OPF_FqTOd     0xCB
#define OPF_FiTOq     0xCC
#define OPF_FsTOq     0xCD
#define OPF_FdTOq     0xCE
#define OPF_FsTOi     0xD1
#define OPF_FdTOi     0xD2
#define OPF_FqTOi     0xD3


/* FPop2, opfl[8:0] (op=2,op3=0x35=FPop2) */

#define OPF_FCMPs     0x51
#define OPF_FCMPd     0x52
#define OPF_FCMPq     0x53
#define OPF_FCMPEs    0x55
#define OPF_FCMPEd    0x56
#define OPF_FCMPEq    0x57



/* Condition codes, Bicc, cond[3:0] */

#define CC_BN         0x0
#define CC_BE         0x1
#define CC_BLE        0x2
#define CC_BL         0x3
#define CC_BLEU       0x4
#define CC_BCS        0x5
#define CC_BNEG       0x6
#define CC_BVS        0x7
#define CC_BA         0x8
#define CC_BNE        0x9
#define CC_BG         0xA
#define CC_BGE        0xB
#define CC_BGU        0xC
#define CC_BCC        0xD
#define CC_BPOS       0xE
#define CC_BVC        0xF

/* Condition codes, FBfcc, cond[3:0] */

#define CC_FBN        0x0
#define CC_FBNE       0x1
#define CC_FBLG       0x2
#define CC_FBUL       0x3
#define CC_FBL        0x4
#define CC_FBUG       0x5
#define CC_FBG        0x6
#define CC_FBU        0x7
#define CC_FBA        0x8
#define CC_FBE        0x9
#define CC_FBUE       0xA
#define CC_FBGE       0xB
#define CC_FBUGE      0xC
#define CC_FBLE       0xD
#define CC_FBULE      0xE
#define CC_FBO        0xF

/* Condition codes, CBccc, cond[3:0] */

#define CC_CBN        0x0
#define CC_CB123      0x1
#define CC_CB12       0x2
#define CC_CB13       0x3
#define CC_CB1        0x4
#define CC_CB23       0x5
#define CC_CB2        0x6
#define CC_CB3        0x7
#define CC_CBA        0x8
#define CC_CB0        0x9
#define CC_CB03       0xA
#define CC_CB02       0xB
#define CC_CB023      0xC
#define CC_CB01       0xD
#define CC_CB013      0xE
#define CC_CB012      0xF

/* Condition codes, Ticc, cond[3:0] */

#define CC_TN         0x0
#define CC_TE         0x1
#define CC_TLE        0x2
#define CC_TL         0x3
#define CC_TLEU       0x4
#define CC_TCS        0x5
#define CC_TNEG       0x6
#define CC_TVS        0x7
#define CC_TA         0x8
#define CC_TNE        0x9
#define CC_TG         0xA
#define CC_TGE        0xB
#define CC_TGU        0xC
#define CC_TCC        0xD
#define CC_TPOS       0xE
#define CC_TVC        0xF


#endif
