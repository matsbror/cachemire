/**********************************************************************
 *
 *    Title:             Memory.c
 *    Creation Date:     92-02-21
 *    Authour:           Mats Brorsson
 *    Function:          Functions for the Memory in CacheMire-2
 *
 *    Change log:
 * 
 **********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "memory.h"
#include "lists.h"
#include "statistics.h"
#include "pagetable.h"
#include "sparse_array.h"

#ifndef INVALID
#define INVALID     -1
#endif

/********************************************
 *   Global variables and definitions       *
 ********************************************/
int memory_references = 0;
int initdone = 0;
static unsigned long new_free_page;



SparseArray<PageTableRec> PageTable;

SparseArray<unsigned long> Memory;

unsigned ReadMem(unsigned long addr){
  int data;
  GlobalMemoryOp(INVALID, READ_OP, addr, (unsigned long *) &data, S_WORD);
  return(data);
}


char *GetSunMemAddr(int pid, unsigned long addr){
  unsigned long attributes;
  unsigned long paddr = AddressTranslation(pid, addr >> LOGMEM, &attributes);
  paddr = (paddr << LOGMEM) + (addr & OFFSET_MASK);
  return (char *)(&Memory[paddr/4]) + (paddr%4);
}


/**********************************************************************
 *
 *  int InitMemory();
 *
 *  Parameters:
 *
 *  Function: Allocates and initialises the memory. 
 * 
 **********************************************************************/
int InitMemory(){

  new_free_page = npages;

  return(CM_OK);

} /* end InitMemory */




/**********************************************************************
 *
 *  int MemoryOp(MemOpType op, 
 *                       unsigned long phys_addr, 
 *                       unsigned long dataref, unsigned long mask);
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
int MemoryOp(MemOpType op,	
	     unsigned long phys_addr, 
	     unsigned long * dataref, unsigned long mask){
    unsigned long temp;


   if (op == READ_OP){
      *dataref = Memory[phys_addr/4];
    } else if (op == WRITE_OP){
      /* mask specifies which byte(s) are going to be written */
      Memory[phys_addr/4] = 
	(*dataref & mask) | (Memory[phys_addr/4] & ~mask);
    } else if (op == TESTANDSET_OP){
      temp = Memory[phys_addr/4];
      Memory[phys_addr/4] = 
	(*dataref & mask) | (Memory[phys_addr/4] & ~mask);
      *dataref = temp;
    }

#if 0
    if ((phys_addr == 0x3c030) || (phys_addr == 0x3c034)) {
	fprintf(stderr,"memop: %d, data = 0x%.8x\n", op, *dataref);
	fflush(stderr);
    }
#endif

  return(CM_OK);

} /* end MemoryOp */



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
int DumpMemory(int start_address, 
		       int end_address, 
		       char *file_name, char *type){
  FILE *fd;
  unsigned long addr;
  unsigned long data;

  /* Check if file exists, otherwise exit */
  if ((fd = fopen(file_name, type)) == NULL) {
#if DEBUGLEVEL >= 0
    printf("File %s doesn't exist.\n", file_name);
#endif
    return(CM_ERROR);
  }
  

  for (addr = start_address; addr < end_address; addr += 4){
    
    GlobalMemoryOp(INVALID, READ_OP, addr, &data, S_WORD);

    /* Print byte addresses */
    fprintf(fd, "%x\t%x\n", addr, data);
    
  }
  
  fclose(fd);

  return(CM_OK);

} /* end DumpMemory */


/**********************************************************************
 *
 *  int PageTableLookup(int pid, int vpage);
 *
 *  Parameters:
 *            pid      processor id
 *            vpage    virtual page
 *
 *  Function: Makes a lookup in the page table
 *
 **********************************************************************/
inline int PageTableLookUp(int pid, unsigned long vpage){
  unsigned long page_frame;
  PageTableRec *ptr;
  
  ptr = &(PageTable[vpage]);
  if (!(ptr->init)){
      ptr->init = 1;
      ptr->page_frame = vpage;
  }

  page_frame = ptr->page_frame;

  if (ptr->attributes & REPLICATED){
    page_frame = ptr->rmap[pid];
    if (page_frame == INVALID){
      page_frame = CopyPage(ptr->page_frame);
      ptr->rmap[pid] = page_frame;
    }
  }
  
  return(page_frame);
  
} /* end PageTableLookUp */


/**********************************************************************
 *
 *  unsigned long AddressTranslation(int pid, unsigned long virt_page, 
 *                       unsigned long *attributes);
 *
 *  Parameters:
 *        pid            processor id
 *        virt_page      virtual page number
 *        attributes     specifies instructions, private data or shared data
 *
 *  Returns the physical page number
 *
 *  Function: Performs address translation from virtual addresses to physical
 *            addresses.
 *
 **********************************************************************/
unsigned long  AddressTranslation(int pid, unsigned long virt_page,
			unsigned long *attributes){
  unsigned long page_nr;

  /* Check the page table */
  page_nr = PageTableLookUp((pid==INVALID?0:pid), virt_page);

  *attributes = PageTable[virt_page].attributes;

  return(page_nr);
  
} /* end AddressTranslation */





/**********************************************************************
 *
 *  int GlobalMemoryOp(int pid, MemOpType op, unsigned long addr, 
 *                       DataWordPtr dataref, int mask);
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
extern int GlobalMemoryOp(int pid, MemOpType op, unsigned long addr, 
		     unsigned long *dataref, unsigned long mask){
  unsigned long phys_addr;
  unsigned long attributes;
  int rc;

#if DEBUGLEVEL >=4
  if ((initdone)){
    printf("GMOp: op: %d, addr: 0x%x, data: 0x%x, mask: 0x%x\n",
	   op, addr, *dataref, mask);
    fflush(stdout);
  }
#endif

  phys_addr = AddressTranslation(pid, addr>>LOGMEM, &attributes);
  phys_addr = (phys_addr << LOGMEM) | (addr & OFFSET_MASK);

  rc = MemoryOp(op, phys_addr, dataref, mask);

  return(rc);

} /* end GlobalMemoryOp */



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
int CopyMemSun2CM(int pid, unsigned long from_address, 
		       unsigned long to_address, 
		       int length){

  char *tmp_from_address;
  char *tmp_to_address;
  int i, tmp;
  unsigned long data=0;
  int byte;
  int mask = S_WORD;

  tmp_from_address = (char *) from_address;
  tmp_to_address =   (char *) to_address;
  tmp = (int) to_address;

  for (i = 0; i < length; i++){
    byte = (tmp & 3);    /* which byte is it? */
    switch (byte)
      {
      case 0: 
	mask = S_BYTE_0;
	break;
      case 1:
	mask = S_BYTE_1;
	break;
      case 2:
	mask = S_BYTE_2;
	break;
      case 3:
	mask = S_BYTE_3;
	break;
      }

    data = (*tmp_from_address) << (3-byte)*8; 
    GlobalMemoryOp(pid, WRITE_OP, (unsigned long) tmp_to_address, 
                   &data, mask);
    tmp_to_address++;
    tmp_from_address++;
    tmp++;
  }
  
  return(CM_OK);

} /* end CopyMemSun2CM */






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
int CopyMemCM2Sun(int pid, unsigned long from_address, 
		       unsigned long to_address, 
		       int length){

  char *tmp_from_address;
  char *tmp_to_address;
  int i, tmp;
  unsigned long data=0;
  int byte;
  int mask = S_WORD;

  tmp_from_address = (char *) from_address;
  tmp_to_address =   (char *) to_address;
  tmp = (int) from_address;

  for (i = 0; i < length; i++){
    byte = (tmp & 3);    /* which byte is it? */

    GlobalMemoryOp(pid, READ_OP, (unsigned long)tmp_from_address, 
                   &data, mask);
    
    (*tmp_to_address) = (char)(data >> (3-byte)*8);
    tmp_to_address++;
    tmp_from_address++;
    tmp++;
  }
  
  return(CM_OK);

} /* end CopyMemCM2Sun */






/**********************************************************************
 *
 *  int CopyStringCM2Sun(int pid, unsigned long from_address, 
 *                         unsigned long to_address)
 *
 *  Parameters:
 *           from_address address in the sun memory
 *           to_address   address in the CacheMire-2 memory
 *
 *  Function: Copies a string from CacheMire-2 memory to sun memory
 * 
 **********************************************************************/
int CopyStringCM2Sun(int pid, unsigned long from_address, 
		       unsigned long to_address){

  char *tmp_from_address;
  char *tmp_to_address;
  int tmp;
  unsigned long data=0;
  int byte;
  int mask = S_WORD;
  char c;

  tmp_from_address = (char *) from_address;
  tmp_to_address =   (char *) to_address;
  tmp = (int) from_address;

  do {
    byte = (tmp & 3);    /* which byte is it? */

    GlobalMemoryOp(pid, READ_OP, (unsigned long)tmp_from_address, 
                   &data, mask);
    
    c = (*tmp_to_address) = (char)(data >> (3-byte)*8);
    tmp_to_address++;
    tmp_from_address++;
    tmp++;
  } while (c != '\0');
  
  return(CM_OK);

} /* end CopyStringCM2Sun */






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
unsigned long CopyPage(unsigned long from_page_frame){
  unsigned long end_word_addr;
  unsigned long from_word_addr;  
  unsigned long to_word_addr;
  unsigned long to_page_frame;

#if DEBUGLEVEL >= 3
  printf("Copy page frame %d for processor %d\n", from_page_frame, to_pid);
#endif

  to_page_frame = new_free_page++;

  to_word_addr = to_page_frame * PAGE_SIZE / 4;
  from_word_addr = from_page_frame * PAGE_SIZE / 4;
  end_word_addr = (from_page_frame+1) * PAGE_SIZE / 4;

  if (Memory.exist(from_word_addr)) {
      while (from_word_addr < end_word_addr) {
	  Memory[to_word_addr] = Memory[from_word_addr];
	  from_word_addr++;
	  to_word_addr++;
      }
  }

  return(to_page_frame);
} /* end CopyPage */




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
 *            (declared in attr.h)
 *
 *
 *  Return a 0 if succesful, a 1 if it failed
 *
 *
 **********************************************************************/
extern int SetMemoryAttributes(int pid, unsigned mem_attr, 
			       int start_addr, int end_addr){
  int i;
  int rc = 0;
  int start_vpage;
  int end_vpage;
  int vpage;
  PageTableRec *ptr;
  
  start_vpage = start_addr/PAGE_SIZE;
  end_vpage = end_addr/PAGE_SIZE;


  if (mem_attr & REPLICATED){
    for (vpage = start_vpage; vpage <= end_vpage; vpage++){

      ptr = &(PageTable[vpage]);
      if (!(ptr->init)){
	  ptr->init = 1;
	  ptr->page_frame = vpage;
      }
      ptr->attributes |= REPLICATED;

      if (!ptr->rmap){

	  // Allocate an rmap for this page 
        ptr->rmap = new unsigned long[no_procs];
        if (!ptr->rmap)
          printf("Could not allocate rmap\n");
        for (i = 0; i < no_procs; i++){
          ptr->rmap[i] = INVALID;
        }

        // Processor 0 is the original holder of the page
        ptr->rmap[0] = 
          ptr->page_frame;
      }

      // Copy the page for the processor specified
      // in the parameters 
      ptr->rmap[pid] = CopyPage(ptr->page_frame);

    }
    rc = 1;
  }


  if (mem_attr & SHARED){
#if DEBUGLEVEL >= 1
    printf("Pages %d to %d declared shared.\n", start_vpage, end_vpage);
#endif
    /* The shared memory attribute only means that it is noted
       in the page table */
    for (vpage = start_vpage; vpage <= end_vpage; vpage++){
	if (!PageTable[vpage].init){
	    PageTable[vpage].init = 1;
	    PageTable[vpage].page_frame = vpage;
	}

	PageTable[vpage].attributes |= SHARED;
	PageTable[vpage].attributes &= ~PRIVATE;
	if (PageTable[vpage].attributes & PRIVATE){
	    printf("shared page declared as private: %x\n", 
		   PageTable[vpage].attributes);
	}
    }
  }

  if (mem_attr & PRIVATE){
#if DEBUGLEVEL >= 3
    printf("Pages %d to %d declared private data.\n", start_vpage, end_vpage);
#endif
    /* This memory attribute only means that it is noted
       in the page table */
    for (vpage = start_vpage; vpage <= end_vpage; vpage++){
	if (!PageTable[vpage].init){
	    PageTable[vpage].init = 1;
	    PageTable[vpage].page_frame = vpage;
	}
      PageTable[vpage].attributes |= PRIVATE;
      PageTable[vpage].attributes &= ~SHARED;
      if (PageTable[vpage].attributes & SHARED) {
	 printf("private page declared as shared or instructions\n");
         }
    }
  }


  return (rc);

} /* End SetMemoryAttributes */

