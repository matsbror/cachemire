/**********************************************************************
 *
 *    Title:             Memory.h
 *    Creation Date:     92-02-21
 *    Authour:           Mats Brorsson
 *    Function:          Prototypes for the Memory in CacheMire-2
 *
 *    Change log:
 * 
 **********************************************************************/

#ifndef _MEMORY_H_
#define _MEMORY_H_

#include "cachemire-2.h"
#include "attr.h"

/* Masks */
#define S_WORD    0xFFFFFFFF
#define S_BYTE_3  0x000000FF
#define S_BYTE_2  0x0000FF00
#define S_BYTE_1  0x00FF0000
#define S_BYTE_0  0xFF000000
#define S_HWORD_1 0x0000FFFF
#define S_HWORD_0 0xFFFF0000
#define S_NOP     0x0

typedef enum _MemOpType {
  READ_OP, 
  WRITE_OP, 
  TESTANDSET_OP, 
  BAR_OP, 
  NO_OP
  } MemOpType;

extern int memory_references;
extern int initdone;

/**********************************************************************
 *
 *  int InitMemory();
 *
 *  Parameters:
 *            memory_size       size of physical memory
 *
 *  Function: Allocates and initialises the memory. 
 * 
 **********************************************************************/
int InitMemory();


/**********************************************************************
 *
 *  int MemoryOp(MemOpType op, 
 *                       unsigned long phys_addr, 
 *                       DataWordPtr dataref, int mask);
 *
 *  Parameters:
 *        op             Type of operation
 *        phys_addr      Physical byte address
 *        dataref        Reference to data (in or out parameter)
 *        mask           a byte mask determining which byte(s) the operation
 *                       concerns
 *
 *  Function: Performs memory operation on a memory WORD
 *            For the moment, three types of operations are provided:
 *              - READ_OP
 *              - WRITE_OP
 *              - TESTANDSET_OP
 *
 *  The following operations are defined for different values of mask:
 *  S_WORD    FFFFFFFF  Word operation
 *  S_BYTE_3  000000FF  Byte 3 (big endian notation) operation
 *  S_BYTE_2  0000FF00  Byte 2 operation
 *  S_BYTE_1  00FF0000  Byte 1 operation
 *  S_BYTE_0  FF000000  Byte 0 operation
 *  S_HWORD_1 0000FFFF  Halfword 1 operation
 *  S_HWORD_0 FFFF0000  Halfword 0 operation
 *  S_NOP     00000000  No operation or read
 *
 **********************************************************************/
int MemoryOp(MemOpType,	unsigned long, unsigned long *, unsigned long);


/**********************************************************************
 *
 *  int DumpMemory(int start_address, 
 *                         int end_address, 
 *                         char *file_name,
 *                         char *type);
 *
 *  Parameters:
 *        start_address  byte start address to be dumped on file.
 *        end_address    byte end address to be dumped on file.
 *        file_name      name of file to which to dump.
 *        type           "w" if create new file, "a" if append to existing
 *
 *  Function: Dumps memory locations as words to a file.
 * 
 **********************************************************************/
extern int DumpMemory(int, 
		       int, 
		       char *, char *);


/**********************************************************************
 *
 *  unsigned long AddressTranslation(int pid, unsigned long virt_page, 
 *                        unsigned long *attributes);
 *
 *  Parameters:
 *        pid            processor id
 *        virt_page      virtual page number
 *        attributes     specifies instructions, private data or shared data
 *
 *  Returns the physical page frame number
 *
 *  Function: Performs address translation from virtual addresses to physical
 *            addresses.
 *
 **********************************************************************/
unsigned long AddressTranslation(int, unsigned long, unsigned long *);


/**********************************************************************
 *
 *  int GlobalMemoryOp(int pid ,MemOpType op, unsigned long addr, 
 *                       unsigend long * dataref, unsigned long mask);
 *
 *  Parameters:
 *        pid            processor making the memory op
 *        op             Type of operation
 *        addr           Byte address in memory
 *        dataref        Reference to data (in or out parameter)
 *        mask           a byte mask determining which byte(s) the operation
 *                       concerns
 *
 *  Function: Performs memory operation on a memory WORD
 *            For the moment, three types of operations are provided:
 *              - READ_OP
 *              - WRITE_OP
 *              - TESTANDSET_OP
 *
 *  The following operations are defined for different values of mask:
 *  FFFFFFFF  Word operation
 *  000000FF  Byte 3 (big endian notation) operation
 *  0000FF00  Byte 2 operation
 *  00FF0000  Byte 1 operation
 *  FF000000  Byte 0 operation
 *  0000FFFF  Halfword 1 operation
 *  FFFF0000  Halfword 0 operation
 *  00000000  No operation 
 *
 *  NOTE: THIS ROUTINE IS MEMORY IMPLEMENTATION DEPENDENT
 *        but you can always call this routine to access memory if you 
 *        don't know how the memory is implemented. Calls to this routine 
 *        will bypass eventual networks.
 *
 **********************************************************************/
extern int GlobalMemoryOp(int, MemOpType, unsigned long, 
		     unsigned long *, unsigned long);


/**********************************************************************
 *
 *  int CopyMemSun2CM(int pid, unsigned long from_address, 
 *                         unsigned long to_address, 
 *                         int length);
 *
 *  Parameters:
 *           from_address address in the sun memory
 *           to_address   address in the CacheMire-2 memory
 *           length       number of bytes to copy
 *
 *  Function: Copies memory location from sun memory to CacheMire-2 memory
 * 
 **********************************************************************/
extern int CopyMemSun2CM(int, unsigned long, unsigned long, int);


/**********************************************************************
 *
 *  int CopyMemCM2Sun(int pid, unsigned long from_address, 
 *                         unsigned long to_address, 
 *                         int length);
 *
 *  Parameters:
 *           from_address address in the sun memory
 *           to_address   address in the CacheMire-2 memory
 *           length       number of bytes to copy
 *
 *  Function: Copies memory location from CacheMire-2 memory to sun memory 
 * 
 **********************************************************************/
extern int CopyMemCM2Sun(int, unsigned long, unsigned long, int);


int CopyStringCM2Sun(int pid, unsigned long from_address, 
		       unsigned long to_address);

/**********************************************************************
 *
 *  unsigned long CopyPage(unsigned long from_page_frame);
 *
 *  Parameters:
 *            from_page_frame   page frame to copy from
 *
 *  Returns:
 *            new page frame
 *
 *  Function: Copies a page frame from one memory module to another
 * 
 **********************************************************************/
unsigned long CopyPage(unsigned long);




/**********************************************************************
 *
 *  int SetMemoryAttributes(int pid, unsigned mem_attr, int start_addr, 
 *                          int end_addr);
 *
 *  Parameters:
 *            pid            Processor for which this is applicable
 *            mem_attr       Code for memory attribute
 *            start_addr     Start address for memory area
 *            end_addr       End address for memory area (exclusive)
 *
 *  Function: Sets memory attributes for a memory area.
 *            You can choose among the following attributes
 *            (declared in generics.h)
 *
 *       NORMAL           0      This is default 
 *       REPLICATED       1      Permit several copies of a page 
 *       READ_ONLY        2      Make this area read only
 *       NON_CACHEABLE    4      Do not permit this area to be cached 
 *       LOCAL            8      Migrate this page to the specified mem mod
 *       INHERITED       16      Inherit this memory area from proc 0
 *  
 *  Attributes are combined by "oring" them together, eg.
 *    REPLICATED | NON_CACHEABLE
 *
 *  Return a 0 if succesful, a 1 if it failed
 *
 *
 **********************************************************************/
extern int SetMemoryAttributes(int, unsigned, 
			       int, int);

char *GetSunMemAddr(int pid, unsigned long addr);

#endif

