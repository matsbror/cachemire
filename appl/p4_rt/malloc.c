#include "trap.h"
#include "attr.h"
#include <stdlib.h>
#include <sys/types.h>
#include "p4.h"


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
    int *next_to_alloc;
    int *current_to_alloc;
    head free_list; /* free memory chunks sorted in size, smallest first */
    head alloc_list;/* allocated memory chunks sorted by address */
    int  heap_lock;
    int start_heap;
    int end_heap;
    int slaves_left;
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


inline static PS(char *s) {
  trap(TRAP_PRINT_STRING, s, strlen(s));
}

inline static PI(int i) {
  trap(TRAP_PRINT_INT, i);
}


/*
 * Initialisation of the dynamic memory structures 
 */
void init_malloc(){
  unsigned int start;
  unsigned int end;
  int pagesize;

#ifdef DEBUG
  PS("Init malloc\n");
#endif

  stdglob = (struct _stdglob *) 0x800;  /* Let's hope it's not used */
  stdglob->next_to_alloc = NULL;
  stdglob->current_to_alloc = NULL;

  stdglob->heap_lock = 0;

  pagesize = trap(PAGE_SIZE_TRAP);
  start = (unsigned int)(&_end) + 2*pagesize;
  end = trap(HEAP_END_TRAP)*pagesize;

  stdglob->start_heap = start;
  stdglob->end_heap = end;
  
  stdglob->next_to_alloc = (int *)stdglob->start_heap;

#ifdef DEBUG
   PS("Init heap from ");
   PI(stdglob->next_to_alloc);
   PS(" to ");
   PI(stdglob->end_heap);
   PS("\n");
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
  PS("int_malloc: allocating ");
  PI(size);
  PS(" bytes\n");
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
  PS("int_malloc: Allocate mem at: ");
  PI(stdglob->current_to_alloc);
  PS(" next free ");
  PI(stdglob->next_to_alloc);
  PS("\n");
#endif
  if (stdglob->next_to_alloc >= (int *)stdglob->end_heap) {
    printf("int_malloc\0", "Out of heap memory\0");
    exit(-1);
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
  pid = getpid();
  PS("pid: ");
  PI(pid);
  PS(", malloc: allocating ");
  PI(size);
  PS(" bytes\n");
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
  PS("free: Returning memory at address ");
  PI(P);
  PS(" to the heap \n");
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
  PS("calloc: ");
#endif
  pointer = (int *) malloc(size * num);
  /* calloc requires that the memory is zeroed, so let's do it */
  for (i = 0; i < size/4+1; i++){
    pointer[i] = 0;
  }
#ifdef DEBUG
  PS("end calloc: \n");
#endif

  return(pointer);

}

void   cfree(P)
     void *P;
{
#ifdef DEBUG
  PS("cfree: Returning memory at address ");
  PI(P);
  PS(" to the heap...\n");
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
  PS("reg_alloc");
#endif
  if (empty(stdglob->alloc_list)){
    /* if the allocation list is empty, then put the new
       (and only) element first in list */
#ifdef DEBUG
    PS("reg_alloc: put first in list...\n");
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
      PS("reg_alloc: put last in list...\n");
#endif
      into(new_allocation, stdglob->alloc_list);
    } else {
#ifdef DEBUG
      PS("reg_alloc: put in middle of list...\n");
#endif
      precede(new_allocation, tmp);
    }
  }
#ifdef DEBUG
  PS("reg_alloc: end\n");
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







