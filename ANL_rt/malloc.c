#line 1 "-"
#line 1 "c.m4.smacs"
/* barrier(<monitor>,<nprocs>)
*/

#line 21

/* bardec(<monitor>)
*/

#line 27

/* barinit(<monitor>)
*/

#line 37


#line 41

/* gsdec(<monitor>)
*/

#line 47

/* gsinit(<monitor>)
*/

#line 54

/* getsub($1<monitor>,$2<subscript>,$3<max_sub>,$4<nprocs>,$5<chunk>)
*/

#line 77



/* nlockdec(<monitor>)
*/

#line 85

/* nlockinit(<monitor>)
*/

#line 91

/* nlock(<monitor>)
*/

#line 97

/* nunlock(<monitor>)
*/

#line 103


#line 107


#line 111


#line 115


#line 119



#line 125




#line 132


#line 182


#line 188


#line 196




#line 207


#line 220


#line 233


#line 248


#line 263
#line 1 "c.m4.monmacs"

 
 
#line 5


/*  delay(<monitor>,<queue>,<-1>)
*/

#line 14

/*  continue(<monitor>,<queue>,<-1>)
*/

#line 29

/*  menter(<monitor>,<-1>)
*/

#line 37

/*  mexit(<monitor>,<-1>)
*/

#line 45

/*  decvar(<monitor>,<queues>,<-1>,<extra_code_for_more_variables>)
*/

#line 56

/*  moninit(<monitor>,<queues>,<-1>)
*/

#line 76
	  
    
/*  create(<procedure>)
*/

#line 91


#line 104

/* clock(<clock_val>)
*/



/* main_end()
*/

#line 115


/* main_env(<max_procs>,<sh_mem>,<sr_buffs>)) */

#line 167

/* extern_env */

#line 178


/* extern_INITENV */

#line 186


/* main_INITENV(<max_processors>,<global_memory>,<max_locks>)

*/

#line 217

/* initenv(<global_memory>)

*/



/* who_am_i(<proc_id>) */

#line 228


/* char *g_malloc(<size>)
*/

#line 235


#line 243




#line 282


#line 286


#line 290


#line 296



#line 309



#line 321



/*
 * macros to support tracing the synchronization behavior of programs
 * written with the Argonne c.st.monmacs and c.st.smacs.  There is a
 * separate trace output file for each thread.  
 */





/* constant for data structure sizes in synchronization trace */
/* may be overridden in mAIN_INITENV */


/* ids for types of locks */







/* trace vars associated with each lock */



#line 357

/* st_log(<operation> <lock address>)
   logs event with time stamp into threads event log buffer.
   event = op addr time.  can use s_TRACE_LOG_ENTRY and s_TRACE_LOG_EXIT now.
*/

#line 372




#line 378


#line 382


#line 1 "malloc.C"


#line 2
    extern int lock_model;
#line 2
    extern int ANLno_procs;
#line 2
    extern void ANL_delay();
#line 2
    extern void backoff();
#line 2
    
#line 2
#include "shmem.h"
#line 2
#include "stdio.h"
#line 2
#include "stdlib.h"
#line 2
#include "trap.h"
#line 2
#include "locks.h"
#line 2

#line 2
#define PAGE_SIZE		4096
#line 2

#line 2
typedef struct _ANLglobTYPE {
#line 2
      volatile int end_lock;
#line 2
      volatile int max_proc;
#line 2
      volatile int proc_started;
#line 2
      void (*slave_func)(); 
#line 2
      } ANLglobTYPE;
#line 2

#line 2
    
#line 2
      
#line 2
    
#line 2

#line 2
enum error_type {OUT_OF_SHARED_MEMORY, 
#line 2
			OUT_OF_HEAP_MEMORY, OUT_OF_RANGE};
#line 2

#line 2
extern void mdlx_error();
#line 2
extern char *xx_mem();
#line 2
extern volatile ANLglobTYPE *ANLglob;
#line 2

#line 2
inline static ANL_PS(char *s) {
#line 2
  trap(TRAP_PRINT_STRING, s, strlen(s));
#line 2
}
#line 2

#line 2
inline static ANL_PI(int i) {
#line 2
  trap(TRAP_PRINT_INT, i);
#line 2
}
#line 2

#line 2
	 
#line 2

#line 2

#line 2

#include <stdio.h>
#include <stdlib.h>
#include "trap.h"

extern void _end;

/* type definitions for linked list types */
typedef struct {
  int address;
  int size;
} typeofdata;

typedef enum {
  headkind, 
  linkkind 
  } kindtype;

typedef struct element{
  kindtype          kind;
  struct element   *pre;
  struct element   *suc;
  typeofdata        data;
} el_type;

typedef el_type *link;
typedef link    *head;
/* end of type definitions for linked lists */



/* Global definitions in this file */

static struct _stdglob {
    volatile int *next_to_alloc;
    volatile int *current_to_alloc;
    volatile head free_list; /* free memory chunks sorted in size, smallest first */
    volatile head alloc_list;/* allocated memory chunks sorted by address */
    volatile int heap_lock;
    volatile int start_heap;
    volatile int end_heap;
    volatile int slaves_left;
   } *stdglob=0;

static void inline newhead(head *h_r);
static void inline newlink(link *e_r);
static void inline intoasfirst(link e, head h);
static int inline empty(head h);
static void inline out(link e);
static link inline first(head h);
static link inline  lsucc(link e);
static void inline into(link e, head h);
static void inline precede(link e, link x);
static void inline reg_alloc(link new_allocation);
static void inline reg_free(link chunk);



/*
 * Initialisation of the dynamic memory structures 
 */
void init_malloc(){
  unsigned int start;
  unsigned int end;
  int pagesize;

#ifdef DEBUG
  ANL_PS("Init malloc\n");
#endif

  stdglob = (struct _stdglob *) 0x800;  /* Let's hope it's not used */
  stdglob->next_to_alloc = NULL;
  stdglob->current_to_alloc = NULL;

  stdglob->heap_lock = 0;

  pagesize = trap(PAGE_SIZE_TRAP);
  start = (unsigned int)(&_end) + 2*pagesize;
  end = trap(HEAP_END_TRAP);

  stdglob->start_heap = start;
  stdglob->end_heap = end;
  
  stdglob->next_to_alloc = (int *)stdglob->start_heap;

#ifdef DEBUG
   ANL_PS("Init heap from ");
   ANL_PI(stdglob->next_to_alloc);
   ANL_PS(" to ");
   ANL_PI(stdglob->end_heap);
   ANL_PS("\n");
#endif

  /* create the free_list and the alloc_list */
  newhead((head *)&(stdglob->free_list));
  newhead((head *)&(stdglob->alloc_list));
 
} /* end init_malloc */




/*
 * Internal function for allocating memory on the heap. 
 * This routine just grabs space on the statically allocated
 * heap without looking in the free list which contains chunks
 * of memory which have been returned to the heap.
 * It is mostly used internally for allocating data structures neede
 * for maintaining the free and allocated lists, and when the 
 * free list does not contain a memory chunk large enough.
 */
void *int_malloc(size_t size){
  void *return_pointer;
 
#ifdef DEBUG
  ANL_PS("int_malloc: allocating ");
  ANL_PI(size);
  ANL_PS(" bytes\n");
#endif

  /* Assume that the heap is locked and initialised */

  if (!size){
    return(NULL);
  }

  stdglob->current_to_alloc = stdglob->next_to_alloc;
  stdglob->next_to_alloc += size/4;
  /* Align to 8 */
  stdglob->next_to_alloc = (int *)(((int)stdglob->next_to_alloc+7)&(~007));

#ifdef DEBUG
  ANL_PS("int_malloc: Allocate mem at: ");
  ANL_PI(stdglob->current_to_alloc);
  ANL_PS(" next free ");
  ANL_PI(stdglob->next_to_alloc);
  ANL_PS("\n");
#endif
  if (stdglob->next_to_alloc >= (int *)stdglob->end_heap) {
    mdlx_error("int_malloc\0", "Out of heap memory\0");
  }

  return_pointer = (void *)stdglob->current_to_alloc;
  return(return_pointer);
} /* end int_malloc */






/*
 * The real malloc.
 * We first look in the free list if there is some returned
 * memory chunk large enough which we will use in that case.
 * If not, then we take new space from the heap.
 */
void *malloc(size_t size){
  void *return_pointer;
  link tmp;
  link new_allocation;
  int pid;

  if (!size){
    return(NULL);
  }

#ifdef DEBUG
  
#line 170
   *&pid = getpid();
#line 170
;
  ANL_PS("pid: ");
  ANL_PI(pid);
  ANL_PS(", malloc: allocating ");
  ANL_PI(size);
  ANL_PS(" bytes\n");
#endif

  if (!stdglob) init_malloc();

  cm_lock(&(stdglob->heap_lock));

  /* First, try to find a suitable memory chunk on the free list */
  /* search the free list and grab the first chunk large
     enough to fit our size */
  tmp = first(stdglob->free_list);
  while (tmp != NULL){

    if (tmp->data.size >= size)
      break;

    tmp = lsucc(tmp);
  }
  
  if (tmp != NULL){
    return_pointer = (void *) tmp->data.address;
    reg_alloc(tmp);
  } else {
    /*
     * If we couldn't find space from the free list, use the
     * int_malloc routine instead.
     */
    return_pointer = int_malloc(size);

    /* register the new allocation in the alloc_list */

    /* Try to get a link element by reclaiming one of 
       the used ones which are zero in the free list. */
    tmp = first(stdglob->free_list);
    if (tmp != NULL){
      if (tmp->data.size == 0)
        new_allocation = tmp;
      else 
        newlink(&new_allocation);
    } else
      newlink(&new_allocation);

    new_allocation->data.address = (int) return_pointer;
    new_allocation->data.size = size;
    reg_alloc(new_allocation);
  }

#ifdef DEBUGxx
  check_malloc();
#endif
  cm_unlock(&(stdglob->heap_lock));
  return(return_pointer);
} /* end malloc */




/* 
 * Return space to the heap. If it is close to "next_to_alloc" then
 * just decrement next_to_alloc and put the link element with size 0
 * onto the free list. If not just move the chunk from the allocated
 * list to the free list without modification.
 */
void free(P)
     void *P;
{
  link tmp;
#ifdef DEBUG
  ANL_PS("free: Returning memory at address ");
  ANL_PI(P);
  ANL_PS(" to the heap \n");
#endif

  cm_lock(&(stdglob->heap_lock));

  /* Search in the alloc list to find this particular chunk of memory */
  tmp = first(stdglob->alloc_list);
  while (tmp != NULL) {
    if (tmp->data.address == (int)P)
      break;
    
    tmp = lsucc(tmp);
  }

  /* if tmp == NULL then do nothing bcause then we didn't
     find this chunk in the alloc_list. This shouldn't happen,
     but you never know... */
  if (tmp != NULL){
    /* Check if we are next to "next_to_alloc" */
    if (((int)tmp->data.address + tmp->data.size) >= (int) stdglob->next_to_alloc){
      stdglob->next_to_alloc = stdglob->next_to_alloc - tmp->data.size;

      /* Make this link element available by zeroing the size 
	 and address and then putting it onto the free list. */
      tmp->data.size = 0;
      tmp->data.address = 0;
    }

    /* Take this chunk and register it as free in the free list. */
    reg_free(tmp);
  }
#ifdef DEBUGxx
  check_malloc();
#endif

  cm_unlock(&(stdglob->heap_lock));
}


void *calloc(size_t num, size_t size)
{
  int *pointer;
  int i;

  if (!num) return(NULL);

#ifdef DEBUG
  ANL_PS("calloc: ");
#endif
  pointer = (int *) malloc(size * num);
  /* calloc requires that the memory is zeroed, so let's do it */
  for (i = 0; i < size/4+1; i++){
    pointer[i] = 0;
  }
#ifdef DEBUG
  ANL_PS("end calloc: \n");
#endif

  return(pointer);

}

void   cfree(P)
     void *P;
{
#ifdef DEBUG
  ANL_PS("cfree: Returning memory at address ");
  ANL_PI(P);
  ANL_PS(" to the heap...\n");
#endif
  free(P);
}

/***********************************************************************
 *
 *   Internal linked list routines
 *
 ***********************************************************************/
/* Creates a new empty list 'h' */
static void inline newhead(head *h_r)
{
  link hp;

  (*h_r)  = (head) int_malloc(sizeof(link));
  (**h_r) = (link) int_malloc(sizeof(el_type));
  hp = **h_r;
  
  (*hp).kind = headkind;
  (*hp).pre  = hp;
  (*hp).suc  = hp;
}


/* Creates a new element 'e' */
static void inline newlink(link *e_r)
{
  *e_r = (link) int_malloc(sizeof(el_type));

  (**e_r).kind = linkkind;
  (**e_r).pre  = NULL;
  (**e_r).suc  = NULL;
}


/* Puts 'e' first in list 'h' */
static void inline intoasfirst(link e, head h)
{
  out(e);
  (*(**h).suc).pre = e;
  (*e).pre = *h;
  (*e).suc = (**h).suc;
  (**h).suc = e;
}

/* Returns 1 if list 'h' is empty, 0 otherwise. */
static int inline empty(head h)
{
  return(((*(**h).suc).kind == headkind)?1:0);
}


/* If e is an element of a list it is taken out of that list. */
static void inline out(link e)
{
  if ((*e).pre != NULL){
    (*(*e).pre).suc = (*e).suc;
    (*(*e).suc).pre = (*e).pre;
    (*e).pre = NULL;
    (*e).suc = NULL;
  }
}


/* Return pointer to the first element in list 'h' */
static link inline first(head h)
{
  if (!empty(h)) {
    return((**h).suc);
  } else {
    return(NULL);
  }
}



/* Returns the element following 'e' */
static link inline  lsucc(link e)
{
  return(((*(*e).suc).kind == linkkind)?((*e).suc):NULL);
}



/* Puts 'e' last in list 'h' */
static void inline into(link e, head h)
{
  out(e);
  (*(**h).pre).suc = e;
  (*e).pre = (**h).pre;
  (*e).suc = *h;
  (**h).pre = e;
}


/* Puts 'e' in front of 'x' in the same list as 'x' */
static void inline precede(link e, link x)
{
  out(e);
  (*(*x).pre).suc = e;
  (*e).pre = (*x).pre;
  (*e).suc = x;
  (*x).pre = e;
}



/* registers the allocation of new memory in the alloc list */
/* elements in the list are sorted by address value. */
/* lower addresses first */
static void inline reg_alloc(link new_allocation)
{
  link tmp;

#ifdef DEBUG
  ANL_PS("reg_alloc");
#endif
  if (empty(stdglob->alloc_list)){
    /* if the allocation list is empty, then put the new
       (and only) element first in list */
#ifdef DEBUG
    ANL_PS("reg_alloc: put first in list...\n");
#endif
    intoasfirst(new_allocation, stdglob->alloc_list);
  } else {
    /* we have to find the first element with an address which is 
       larger than ours, and put our element in front of it. */
    tmp = first(stdglob->alloc_list);
    if (tmp != NULL)
      while (tmp->data.address < new_allocation->data.address){
	tmp = lsucc(tmp);
	if (tmp == NULL) break;
      }

    if (tmp == NULL){
      /* In this case, we have the largest address and put our element
	 last in the list */
#ifdef DEBUG
      ANL_PS("reg_alloc: put last in list...\n");
#endif
      into(new_allocation, stdglob->alloc_list);
    } else {
#ifdef DEBUG
      ANL_PS("reg_alloc: put in middle of list...\n");
#endif
      precede(new_allocation, tmp);
    }
  }
#ifdef DEBUG
  ANL_PS("reg_alloc: end\n");
#endif
} /* end reg_alloc */




/* registers the disposition of a memory chunk in the free list */
/* elements in the list are sorted by size */
/* smaller sizes first */
static void inline reg_free(link chunk)
{
  link tmp;

  if (empty(stdglob->free_list)){
    /* if the free list is empty, then put the new
       (and only) element first in list */
    intoasfirst(chunk, stdglob->free_list);
  } else {
    /* we have to find the first element with a size which is 
       larger than ours, and put our element in front of it. */
    tmp = first(stdglob->free_list);
    if (tmp != NULL)
      while (tmp->data.size < chunk->data.size){
	tmp = lsucc(tmp);
	if (tmp == NULL) break;
      }

    if (tmp == NULL){
      /* In this case, we have the largest chunk and put our element
	 last in the list */
      into(chunk, stdglob->free_list);
    } else {
      precede(chunk, tmp);
    }
  }
} /* end reg_free */







