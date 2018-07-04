#include "p4.h"
#include "trap.h"
#include "attr.h"

#define NULL 0

#define PAGE_SIZE 4096

/* xx_mem is a memory allocation routine.  It is called in three
   ways:
	if typ == 0, then n is the number of bytes to claim as
	    globally-shared memory (from which routines can
	    ask for shared memory).  In this case the routine
	    returns the address of the allocated block (NULL,
	    if an allocation failure occurs).

	else if typ == 1, then n is taken to be the amount
	    of shared memory requested.  In this case, the
	    routine returns the address of a block of at least
	    n charecters in length.

	else if typ == 2, then the routine is being asked
	    to return the address of the globally-
	    shared block of memory.  

The view of shared memory supported by xx_mem is that a single
massive chunk of memory is acquired (and handed out by 
xx_mem(1,...) calls).
*/

struct mem_blk {
    char *next;
    int   l_mem;
    int   memlock;
} *glob_mem;

char *xx_mem(typ,n)
int typ,n;
{
  char *rc;
  int i;
  char *c;
  int pid;
  
  switch (typ) {
  case 0:  /* initialize */
    /* pad & malloc */
    if ((c = (char *) malloc((n+sizeof(struct mem_blk))+2*PAGE_SIZE)) 
	== NULL) {
      printf("*** malloc failed during shared memory initialization ***\n");
      exit(3);
    } else {
      /* Make sure that the shared memory is allocated on a 
	 separate page */
      c += PAGE_SIZE;
      
      glob_mem = (struct mem_blk *) c;
      glob_mem->next=(char *)((int)(c + sizeof(struct mem_blk) + 
				    (PAGE_SIZE-1)) &(~(PAGE_SIZE-1)));
      glob_mem->l_mem = n;
#ifdef DEBUG
      printf("Init 0x%x bytes of shared memory from 0x%x to 0x%x\n", 
	     n, glob_mem->next, glob_mem->next+glob_mem->l_mem);
      printf("glob_mem = 0x%x\n", glob_mem);
#endif

      /* Notify the simulator that this memory area is shared */
      SetMemoryAttributes(0, SHARED, glob_mem->next, 
			  glob_mem->next+glob_mem->l_mem-1);

      glob_mem->memlock = 0;
      rc = (char *) glob_mem->next;
    }
    break;
    
  case 1:
    i = (n+(511)) & (~(511));

    cm_lock(&(glob_mem->memlock));

    if (glob_mem->l_mem < i)
      {
	printf("*** global allocation failure ***\n");
	printf("*** attempted %d bytes, %d left\n",
	       i,glob_mem->l_mem);
	rc = NULL;
      }
    else
      {
	rc = (char *) glob_mem->next;
	glob_mem->next += i; 
	glob_mem->l_mem -= i; 
      }
    

    cm_unlock(&(glob_mem->memlock));
    break;
    
  case 2:
    rc = (char *) glob_mem;
    break;
    
  default:
    printf("*** illegal call to xx_mem *** typ=%d\n",typ);
  }
  return(rc);
}




int SetMemoryAttributes(int proc_id, int mem_attr, int start_addr, 
			int end_addr)
{
  return(trap(SET_MEM_ATTR, proc_id, mem_attr, start_addr, end_addr));
}

