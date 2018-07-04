/***************************************************************************

  Author:  Mats Brorsson
  Date:    93-01-24
  Change log:  94-06-29 
               Added support for limited sized caches with 
	       direct address mapping.


  Description:

  This module implements a simple limited directory cache coherence protocol
  with an NUMA architecture. The timing is entirely based on latencies.
  No contention is modelled whatsoever.

 ***************************************************************************/


#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>

#include "cm_memory.h"
#include "bitvec.h"
#include "cachemire-2.h"
#include "rand_gen.h"
#include "cache.h"
#include "sparse_array.h"  

/********************************************************************/
/*                  ARCHITECTURE PARAMETERS                         */
/********************************************************************/

static int sim_latency = 1;

#define BLOCK_SIZE 4
#define NET_WIDTH  4
#define DIR_LIMIT  2       /* The directory is limited to 2 pointers */

static int block_size = BLOCK_SIZE;
static int cache_size = 0;
// Degree of associativity
static int deg_ass    = 1;           // 1 means direct mapping
                                     // -1 means fully associative
int dir_limit = DIR_LIMIT;

FILE *cm_parameters;

/* Default timing parameters measured in pclocks */

#define T_c_def      0      /* Access cache access time*/
#define T_bus_def    4      /* Average local bus latency */
#define T_mem_def    20      /* Average memory access time */
#define T_net_def    20     /* Average net hop latency */
#define T_i2_def     1      /* The latency for submitting subsequent 
			       invalidations */
#define NET_WIDTH    4      /* flit size in bytes */
#define BUS_WIDTH    4      /* Bus transfer size */

static int T_c    = T_c_def;
static int T_bus  = T_bus_def;
static int T_mem  = T_mem_def;
static int T_net  = T_net_def;
static int T_i2   = T_i2_def;

static int T_bus_block;
static int T_net_block;
static int T_fill_local;
static int T_fill_remote;
static int T_replacement_dirty;
static int T_dir_lookup;


/********************************************************************/
/*                  GLOBAL DATA STRUCTURES                          */
/********************************************************************/

/***************************************************************************

   REFERNCE COUNTING DATA STRUCTURES

 ***************************************************************************/

static unsigned no_shared_refs[MAX_PROCS];
static unsigned no_hits[MAX_PROCS];
static unsigned no_cold_misses[MAX_PROCS];
static unsigned no_coh_misses[MAX_PROCS];
static unsigned no_cap_misses[MAX_PROCS];
static unsigned no_dir_repl_misses[MAX_PROCS];
static unsigned no_writes[MAX_PROCS];
static unsigned no_inv_writes[MAX_PROCS];
static unsigned no_invalidations[MAX_PROCS];
static unsigned no_overflows[MAX_PROCS];
static unsigned no_free_blocks[MAX_PROCS];
static unsigned no_bumps[MAX_PROCS];

static int cache_bits;
static int deg_ass_bits;
// Assume that the page size is 4092 bytes
// pagebits contain the log_2 of pagesize in blocks
static int pagebits = 10;
int memory_module(int memory_block) {
    return (memory_block>>pagebits) & (no_procs-1);
}

// Calculate the latency to invalidate a copy in the cache of cache_PE
// under the assumption that mem_PE is the home of the block
int T_inv_one(int mem_PE, int cache_PE) {
    if (mem_PE == cache_PE) {
	return 2*T_bus;
    } else {
	return 2*(T_bus + T_net + T_bus);
    }
}

// A simple max function
int max(int a, int b) {
    return ( a > b ? a : b);
}

/***************************************************************************

  MEMORY DATA STRUCTURES

  We need first of all data structures for the state information of
  the memory. 

  Each block in the memory has a state field attached to it. This
  field the follwing bit vector:
  copies      A bit array stating the memory modules having a copy 
  exclusive   states if this block contains the exclusive copy
  valid       states if this block contains valid information

  ***************************************************************************/

class MemoryBlockStateRecLi {
public:
  MemoryBlockStateRecLi() {
    has_touched = new BitVector(MAX_PROCS);
    modified    = new BitVector(MAX_PROCS);
    evicted     = new BitVector(MAX_PROCS);
    copies      = new unsigned long [dir_limit];

    for (int i = 0; i < dir_limit; i++)
      copies[i] = INVALID;

    valid = 1;
    no_copies = 0;
  }

  unsigned long *copies;
  BitVector *has_touched;
  BitVector *modified;
  BitVector *evicted;

  unsigned short no_copies;
  unsigned int valid : 1;

};



/***************************************************************************

  CACHE DATA STRUCTURES

  Each block in the cache has a state field attached to it. This
  field the following bits:
  valid       states if this block contains valid information
  exclusive   states if this block contains the exclusive copy


 ***************************************************************************/

class CacheBlockStateRecLi {
public:
  CacheBlockStateRecLi() {
    valid = 0;
    dirty = 0;
    exclusive = 0;
    tag = INVALID;
#ifdef LRU_REPL
    time_stamp = global_time;
#endif
  }

  int tag;
#ifdef LRU_REPL
  unsigned long time_stamp;
#endif
  unsigned int valid     : 1;
  unsigned int dirty     : 1;
  unsigned int exclusive : 1;
};


// Array of caches, one for each processing element 
// Initialised in cache_init */
static SparseArray<CacheBlockStateRecLi> *Cache;
static unsigned long                     *CacheTiming;

// Memory module 
static SparseArray<MemoryBlockStateRecLi> Memory;


/********************************************************************/
/*           INTERNAL   FUNCTIONS                                   */
/********************************************************************/


//*******************************************************************
//                  ADDRESS_MAPPING
//*******************************************************************
// This routine returns 1 if there is a hit, 0 otherwise.
// block_state contains a pointer to the block if it is 
// a hit and a pointer to the block that will hold the 
// new memory block if it is a miss
inline int address_mapping(int c_num, int mem_block,
			   CacheBlockStateRecLi **block_state) {
  register int i, set, repl_val;
  CacheBlockStateRecLi *free_block = NULL;
  
  if (cache_size) {

    // associative address mappping
    // degree of associativity: deg_ass
    // deg_ass == 1 -> direct mapping
    // deg_ass == 2 -> 2-way set associative address mapping
    // deg_ass == cache_size -> fully associative address mapping
    
    // A smarter algorithm is needed!
    // set = (mem_block % cache_size) / deg_ass;
    set = (mem_block & cache_bits) >> deg_ass_bits;
	   
    for (i = 0; i < deg_ass; i++) {
      *block_state = &Cache[c_num][i+set*deg_ass];

      if ((*block_state)->valid && ((*block_state)->tag == mem_block)) {
	return 1;
      } else {
	if (!(*block_state)->valid)
	  free_block = *block_state;	    
      }
    }
    
    // Block is not valid, find a free block if possible
    if (free_block != NULL) {
      *block_state = free_block;
      no_free_blocks[c_num]++;
    } else {
      // No free block in cache. Select a block to be replaced
      // at random
      no_bumps[c_num]++;

#ifdef LRU_REPL

      // LRU replacement algorithm
      unsigned long min_time = 0xFFFFFFFF;
      CacheBlockStateRecLi *victim;
      for (i = set * deg_ass; i < (set + 1) * deg_ass; i++) {
	*block_state = &Cache[c_num][i];
	if ((*block_state)->time_stamp < min_time) {
	  victim = *block_state;
	  min_time = victim->time_stamp;
	}
      }
      *block_state = victim;

#else

      // Random replacement algorithm
      repl_val = minmaxrand(1, 0, deg_ass-1);
      *block_state = &Cache[c_num][set * deg_ass + repl_val];

#endif
    }
    return 0;
      
  } else {

    *block_state = &Cache[c_num][mem_block];
    return (*block_state)->valid;

  }
}


//********************************************************************
//               CACHE_INIT
//********************************************************************

/* Perform general initiations */
void cache_init(int cs, int bs, int nl, int da){

  fprintf(stderr, "INIT %d caches\n", no_procs);
  
  cm_parameters = fopen("cm_data", "r");
  if (cm_parameters != NULL) {
    fscanf(cm_parameters, "dir_limit = %d\n", &dir_limit);
    fscanf(cm_parameters, "T_c = %d\n", &T_c);
    fscanf(cm_parameters, "T_bus = %d\n", &T_bus);
    fscanf(cm_parameters, "T_mem = %d\n", &T_mem);
    fscanf(cm_parameters, "T_net = %d\n", &T_net);
    fscanf(cm_parameters, "T_i2 = %d\n", &T_i2);
    fclose(cm_parameters);
  }

  fprintf(stderr, "Architectural characteristics:\n");
  fprintf(stderr, "Cache coherence protocol directory limit: %d\n", dir_limit);
  fprintf(stderr, "T_c = %d\n", T_c);
  fprintf(stderr, "T_bus = %d\n", T_bus);
  fprintf(stderr, "T_mem = %d\n", T_mem);
  fprintf(stderr, "T_net = %d\n", T_net);
  fprintf(stderr, "T_i2 = %d\n", T_i2);

  // Calculate latencies
  T_bus_block = T_bus*(block_size / BUS_WIDTH);
  T_net_block = T_net*(1 + block_size / NET_WIDTH);
  T_fill_local = T_bus + T_mem + T_bus_block;
  T_fill_remote = T_bus + T_net + T_net_block + 2*T_bus_block + T_mem;
  T_replacement_dirty = T_bus_block;
  T_dir_lookup = T_bus + T_mem + T_bus + T_net;

  fprintf(stderr, "Fill from local memory = %d\n", T_fill_local);
  fprintf(stderr, "Fill from remote memory = %d\n", T_fill_remote);
  fprintf(stderr, "Min invalidation latency = %d\n", T_inv_one(0, 0));
  fprintf(stderr, "Max invalidation latency = %d\n", T_inv_one(0, 1));

  block_size = bs;
  pagebits -= (int) (log((double) bs) / log(2.0));
  fprintf(stderr, "Block size = %d bytes\n", block_size);

  cache_size = cs;
  if (cache_size)
    fprintf(stderr, "Cache size = %d bytes\n", cache_size);
  else 
    fprintf(stderr, "Cache size = infinite\n");

  /* Ensure that there is an integral number of blocks
     in the cache */
  assert((cache_size % block_size) == 0);
  /* cache_size is now expressed in the number of blocks */
  cache_size = cache_size / block_size;

  deg_ass = da;
  if (deg_ass) {
    if (deg_ass == INVALID) {
      fprintf(stderr, "Fully associative address mapping\n");
      deg_ass = cache_size;
    } else {
      fprintf(stderr, "%d-way set-associative address mapping\n", deg_ass);
    }
  } else {
    fprintf(stderr, "Direct address mapping\n");
    deg_ass = 1;
  }
  cache_bits = (int) pow(2.0, log((double) cache_size)/log(2.0));
  cache_bits--;
  deg_ass_bits = (int) (log((double) deg_ass)/log(2.0));
  

  sim_latency = nl;
  if (nl)
    fprintf(stderr, "Simulate latencies\n");
  else 
    fprintf(stderr, "Do not simulate latencies\n");

  Cache = new SparseArray<CacheBlockStateRecLi> [no_procs];
  CacheTiming = new unsigned long [no_procs];
  

  /* Reset reference counting variables */
  reset_stats();

  init_rand(1);

  fflush(stderr);

}

// Perform a cache read but postpone the latency calculation
// return the latency in clock cycles
static int do_cache_read(int PE, unsigned long addr){
  int latency = T_c;
  CacheBlockStateRecLi *block_state_ptr;
  MemoryBlockStateRecLi *mem_state_ptr;
  MemoryBlockStateRecLi *mem2_state_ptr;
  CacheBlockStateRecLi *remote_state_ptr;
  int mblock, cblock;
  int i;
  int home;
  int remote, repl_local, repl_remote, home_clean, T_inv;

  no_shared_refs[PE]++;

  mblock = addr / block_size;
  home = memory_module(mblock);

  if (address_mapping(PE, mblock, &block_state_ptr)){
    /* Hit! */
    no_hits[PE]++;

  } else {
    /* Miss in local cache */

    mem_state_ptr = &Memory[mblock];
    if (home == PE)
	remote = 0;
    else
	remote = 1;

    if (*(mem_state_ptr->has_touched) == PE){
      if (*(mem_state_ptr->modified) == PE){
	no_coh_misses[PE]++;
      } else if (*(mem_state_ptr->evicted) == PE) {
	no_cap_misses[PE]++;
	*(mem_state_ptr->evicted) -= PE;
      } else {
	no_dir_repl_misses[PE]++;
      }
    } else {
      no_cold_misses[PE]++;
      *(mem_state_ptr->has_touched) += PE;
    }
    

    repl_local = 0;
    repl_remote = 0;
    // Check if replacement
    if (block_state_ptr->valid) {
      // Invalidate local copy, write to memory if
      // necessary.
      mem2_state_ptr = &Memory[block_state_ptr->tag];

      // Add latency only if the replaced block was dirty
      if (block_state_ptr->dirty)
	  if (memory_module(block_state_ptr->tag) == PE)
	      repl_local = 1;
	  else
	      repl_remote = 1;

      *(mem2_state_ptr->modified) -= PE;
      *(mem2_state_ptr->evicted) += PE;
      mem2_state_ptr->valid = 1;
      mem2_state_ptr->no_copies--;
      for (i = 0; i < dir_limit; i++) {
	if (mem2_state_ptr->copies[i] == PE) {
	  mem2_state_ptr->copies[i] = INVALID;
	  break;
	}
      }
      assert(i < dir_limit);

    }

    /* Check to see if the copy in the memory is valid. */
    /* If not, get a valid copy from some other place */
    if (!mem_state_ptr->valid){
	home_clean = 0;
	assert(mem_state_ptr->no_copies);

	/* Search for a processing element with a valid copy */
	for (i = 0; i < dir_limit; i++){
	    if (mem_state_ptr->copies[i] != INVALID){
		assert(address_mapping(mem_state_ptr->copies[i], 
				       mblock, &remote_state_ptr));
		remote_state_ptr->exclusive = 0;
		break;
	    }
	}
	assert(i < dir_limit);
      
	mem_state_ptr->valid = 1;

    } else {
	home_clean = 1;
    }

    /* Update memory directory information */
    mem_state_ptr->no_copies++;

    if (mem_state_ptr->no_copies > dir_limit){

      /* The number of pointers are exhausted in the directory */
      /* Select a copy to be removed */
      no_overflows[PE]++;

      /* Select one on of the dir_limit copies on random and invalidate */
      i = minmaxrand(1, 0, dir_limit-1);

      assert(mem_state_ptr->copies[i] != INVALID);

      assert(address_mapping(mem_state_ptr->copies[i], 
			     mblock, &remote_state_ptr));
      remote_state_ptr->valid = 0;
      remote_state_ptr->exclusive = 0;

      mem_state_ptr->no_copies--;
      *(mem_state_ptr->modified) -= mem_state_ptr->copies[i];
      mem_state_ptr->copies[i] = PE;

      /* Add latency for the invalidation of this copy */
      T_inv = T_inv_one(home, mem_state_ptr->copies[i]);  

    } else {
	T_inv = 0;
      /* Register this PE as having a copy */
      /* Find an empty entry in the directory */
      for (i = 0; i < dir_limit; i++){
	if (mem_state_ptr->copies[i] == INVALID){
	  mem_state_ptr->copies[i] = PE;
	  break;
	}
      }
      assert(i < dir_limit);
      
    }

    /* Update local information */
    block_state_ptr->exclusive = 0;
    block_state_ptr->valid = 1;
    block_state_ptr->tag = mblock;

    // Calculate latency
    if (remote)
	latency += T_fill_remote;
    else
	latency += T_fill_local;

    if (repl_local)
	latency += T_replacement_dirty + T_mem;
    else if (repl_remote)
	latency += T_replacement_dirty;

    if (!home_clean)
	latency += T_dir_lookup;

    latency += T_inv;
  }

#ifdef LRU_REPL
  block_state_ptr->time_stamp = global_time;
#endif

      return latency;

}

/***************************************************************************/
/*                         CACHE_READ                                   */
/***************************************************************************/
/***************************************************************************
  Perform actions on read operations 

  Parameters:
  PE            Number of processing element reading
  addr          address of read operation

  Return value:
  1 if the processor has to  stall
  0 if there is no stall

 ***************************************************************************/
int cache_read(int PE, unsigned long addr){
  int latency;

  latency = do_cache_read(PE, addr);

  if (sim_latency) {
      if (latency) {
	  CacheTiming[PE] = latency + global_time;
	  StopProc(PE, ReadStall);
	  return latency;
      } else 
	  return 0;
  } else {
      // no stall
      return 0;
  }
}

      
// The same as cache_write except for the latency caclulation
// at the end. This function returns the latency in clock cycles.
static int do_cache_write(int PE, unsigned long addr){
  int latency = T_c;
  CacheBlockStateRecLi  *block_state_ptr;
  MemoryBlockStateRecLi *mem_state_ptr;
  MemoryBlockStateRecLi *mem2_state_ptr;
  CacheBlockStateRecLi  *remote_state_ptr;
  int cblock, mblock;
  int i;
  int home;
  int inv = 0;
  int remote, excl, repl_local, repl_remote, home_clean;
  int T_inv = 0;

  no_shared_refs[PE]++;
  no_writes[PE]++;

  mblock = addr / block_size;

  if (address_mapping(PE, mblock, &block_state_ptr)){
    /* Hit! */
    no_hits[PE]++;

    if (!block_state_ptr->exclusive){
	excl = 0;
	no_inv_writes[PE]++;

	/* We have to invalidate the other copies */
	mem_state_ptr = &Memory[mblock];
	home = memory_module(mblock);
	if (home == PE)
	    remote = 0;
	else
	    remote = 1;

	for (i = 0; i < dir_limit; i++){
	    if ((mem_state_ptr->copies[i] != INVALID) && 
		(mem_state_ptr->copies[i] != PE)){
		/* Count the number of invalidations
		   on each write operation */
		no_invalidations[PE]++;
		inv++;
		
		assert(address_mapping(mem_state_ptr->copies[i], 
				       mblock, &remote_state_ptr));

		T_inv = max(T_inv, 
			    T_inv_one(home, mem_state_ptr->copies[i]));

		remote_state_ptr->valid = 0;
		remote_state_ptr->exclusive = 0;

		mem_state_ptr->no_copies--;
		mem_state_ptr->copies[i] = INVALID;
	    }
	}
      
	assert(mem_state_ptr->no_copies == 1);
	mem_state_ptr->valid = 0;

	for (i = 0; i < no_procs; i++){
	    *(mem_state_ptr->modified) += i;
	}

    } else {
	excl = 1;
    }

    // Calculate latency
    if (!excl) {
	latency += T_bus + T_mem + T_inv + (inv-1)*T_i2;
	if (remote)
	    latency += T_net + T_bus;
    }


  } else {
      /* Miss in local cache */
    
      /* We first have to invalidate the eventual other copies */
      mem_state_ptr = &Memory[mblock];
      home = memory_module(mblock);
      if (home == PE)
	  remote = 0;
      else
	  remote = 1;

      if (*(mem_state_ptr->has_touched) == PE){
	  if (*(mem_state_ptr->modified) == PE){
	      no_coh_misses[PE]++;
	  } else if (*(mem_state_ptr->evicted) == PE) {
	      no_cap_misses[PE]++;
	      *(mem_state_ptr->evicted) -= PE;
	  } else {
	      no_dir_repl_misses[PE]++;
	  }
      } else {
	  no_cold_misses[PE]++;
	  *(mem_state_ptr->has_touched) += PE;
      }
    

      repl_local = 0;
      repl_remote = 0;
      // Check if replacement
      if (block_state_ptr->valid) {
	  // Invalidate local copy, write to memory if
	  // necessary.
	  mem2_state_ptr = &Memory[block_state_ptr->tag];

	  // Add latency only if the replaced block was dirty
	  if (block_state_ptr->dirty)
	      if (memory_module(block_state_ptr->tag) == PE)
		  repl_local = 1;
	      else
		  repl_remote = 1;


	  *(mem2_state_ptr->modified) -= PE;
	  mem2_state_ptr->valid = 1;	  
	  mem2_state_ptr->no_copies--;
	  for (i = 0; i < dir_limit; i++) {
	      if (mem2_state_ptr->copies[i] == PE) {
		  mem2_state_ptr->copies[i] = INVALID;
		  break;
	      }
	  }
	  assert(i < dir_limit);

	  
      }


      /* Check to see if the copy in the memory is valid. */
      /* If not, get a valid copy from some other place */
      if (!mem_state_ptr->valid){
	  home_clean = 0;
      } else {
	  home_clean = 1;
      }

      // Invalidate all copies
      for (i = 0; i < dir_limit; i++){
	  if (mem_state_ptr->copies[i] != INVALID){
	      /* Count the number of invalidations
		 on each write operation */
	      no_invalidations[PE]++;
	      inv++;
	
	      assert(address_mapping(mem_state_ptr->copies[i], 
				     mblock, &remote_state_ptr));
	      
	      T_inv = max(T_inv, 
			  T_inv_one(home, mem_state_ptr->copies[i]));
	      
	      remote_state_ptr->valid = 0;
	      remote_state_ptr->exclusive = 0;
	
	      mem_state_ptr->copies[i] = INVALID;
	      mem_state_ptr->no_copies--;
	  }
      }
    
      assert(mem_state_ptr->no_copies == 0);
      mem_state_ptr->valid = 0;

      /* Register this PE as having a copy */
      /* Find an empty entry in the directory */
      mem_state_ptr->no_copies = 1;
      for (i = 0; i < dir_limit; i++){
	  if (mem_state_ptr->copies[i] == INVALID){
	      mem_state_ptr->copies[i] = PE;
	      break;
	  }
      }
      assert(i != dir_limit);

      for (i = 0; i < no_procs; i++){
	  *(mem_state_ptr->modified) += i;
      }

      // Calculate latency
      if (remote)
	  latency += T_fill_remote;
      else
	  latency += T_fill_local;

      if (repl_local)
	  latency += T_replacement_dirty + T_mem;
      else if (repl_remote)
	  latency += T_replacement_dirty;
      
      if (!home_clean)
	  latency += T_dir_lookup;

      latency += T_inv + (inv-1)*T_i2;
      

  }  

  /* Update the local state information */
  block_state_ptr->valid = 1;
  block_state_ptr->exclusive = 1;
  block_state_ptr->tag = mblock;
  block_state_ptr->dirty = 1;

#ifdef LRU_REPL
  block_state_ptr->time_stamp = global_time;
#endif

  return latency;

}

/***************************************************************************/
/*                         CACHE_WRITE                                  */
/***************************************************************************/
/***************************************************************************
  Perform actions on write operations 

  Parameters:
  PE            Number of processing element writing
  addr          address of write operation

  Return value:
  1 if the processor has to  stall
  0 if there is no stall

 ***************************************************************************/
int cache_write(int PE, unsigned long addr){
  int latency;

  latency = do_cache_write(PE, addr);

  if (sim_latency) {
      if (latency) {
	  CacheTiming[PE] = latency + global_time;
	  StopProc(PE, WriteStall);
	  return latency;
      } else 
	  return 0;
  } else {
      // no stall
      return 0;
  }
}

//////////////////////////////////////////////////////////////////////
//                         CACHE_SYNCH
//////////////////////////////////////////////////////////////////////
//
//  Perform actions on synch operations 
//
//  Parameters:
//  PE            Number of processing element writing
//  addr          address of synch operation
//  data          data that is written
//
//  Return value:
//  1 if the processor has to  stall
//  0 if there is no stall
//
//////////////////////////////////////////////////////////////////////
int cache_synch(int PE, unsigned long addr, unsigned long data) {
    int latency;

    latency = do_cache_write(PE, addr);
    
    // Exactly the same as cache_write
    if (sim_latency) {
      if (latency) {
	CacheTiming[PE] = latency + global_time;
	StopProc(PE, WriteStall);
	return latency;
      } else 
	return 0;
    } else {
	  // no stall
      return 0;
    }
  }


//////////////////////////////////////////////////////////////////////
//
//          cache_cycle
//////////////////////////////////////////////////////////////////////
//
// Cycle through all caches and wake up the processors that are 
// waiting for cache accesses as necessary
//
//////////////////////////////////////////////////////////////////////
void cache_cycle() {
    int i;

    for (i = 0; i < no_procs; i++) {

	if (global_time > CacheTiming[i])
	    ResumeProc(i);

    }
}

//////////////////////////////////////////////////////////////////////
//
// Reset statistics
//
//////////////////////////////////////////////////////////////////////
void reset_stats(){
  int i;

  for (i = 0; i < no_procs; i++){
    no_shared_refs[i] = 0;
    no_hits[i] = 0;
    no_cold_misses[i] = 0;
    no_coh_misses[i] = 0;
    no_cap_misses[i] = 0;
    no_dir_repl_misses[i] = 0;
    no_writes[i] = 0;
    no_inv_writes[i] = 0;
    no_invalidations[i] = 0;
    no_overflows[i] = 0;
    no_free_blocks[i] = 0;
    no_bumps[i] = 0;
  }
}


void cache_stats(){
  int i;
  float hit_ratio = 0.0;
  unsigned int all_writes = 0;
  unsigned int all_inv_writes = 0;
  unsigned int all_invalidations = 0;
  unsigned int all_hits = 0;
  unsigned int all_cold_misses = 0;
  unsigned int all_coh_misses = 0;
  unsigned int all_cap_misses = 0;
  unsigned int all_repl_misses = 0;
  unsigned int all_shared_refs = 0;
  unsigned int all_overflows = 0;
  unsigned int all_free_blocks = 0;
  unsigned int all_bumps = 0;

  fprintf(stderr, "\n========================\n");
  fprintf(stderr, "        CACHE DATA\n");
  fprintf(stderr, "========================\n\n");

  fprintf(stderr, "\n=========================\n");
  fprintf(stderr, "    Hits and misses\n");
  fprintf(stderr, "=========================\n\n");

  fprintf(stderr, "\t#H\t#ColdM\t#CohM\t#CapM\t#RM\t#ref\tH\n");
  fprintf(stderr, "__________________________________________________________________\n");
  for (i = 0; i < no_procs; i++){
    fprintf(stderr, "P %d: \t%u\t%u\t%u\t%u\t%u\t%u\t%.3f\n", i,
	   no_hits[i], no_cold_misses[i], no_coh_misses[i], no_cap_misses[i], 
	   no_dir_repl_misses[i], no_shared_refs[i],
	   (float)no_hits[i]/(float)no_shared_refs[i]);

    all_hits += no_hits[i];
    all_cold_misses += no_cold_misses[i];
    all_coh_misses += no_coh_misses[i];
    all_cap_misses += no_cap_misses[i];
    all_repl_misses += no_dir_repl_misses[i];
    all_shared_refs += no_shared_refs[i];
    hit_ratio += (float)no_hits[i]/(float)no_shared_refs[i];
  }

  fprintf(stderr, "__________________________________________________________________\n");
  fprintf(stderr, "Mean: \t%2.2f\t%2.2f\t%2.2f\t%2.2f\t%2.2f\t%2.2f\t%1.3f\n", 
	 (float) all_hits/no_procs, (float)all_cold_misses/no_procs, 
	 (float) all_coh_misses/no_procs, (float) all_cap_misses/no_procs, 
	 (float) all_repl_misses/no_procs, (float) all_shared_refs/no_procs,
	 (float) hit_ratio/no_procs);


  fprintf(stderr, "\n===========================\n");
  fprintf(stderr, "       Invalidations\n");
  fprintf(stderr, "============================\n\n");

  fprintf(stderr, "\tI\tIW/AW\tI/IW\tOF\n");
  fprintf(stderr, "__________________________________________________________________\n");
  for (i = 0; i < no_procs; i++){
    fprintf(stderr, "P %d: \t%u\t%2.2f\t%2.2f\t%u\n", i,
	   no_invalidations[i], (float)no_inv_writes[i]/(float)no_writes[i],
	   (float)no_invalidations[i]/(float)no_inv_writes[i],
	   no_overflows[i]);

    all_writes += no_writes[i];
    all_inv_writes += no_inv_writes[i];
    all_invalidations += no_invalidations[i];
    all_overflows += no_overflows[i];
  }

  fprintf(stderr, "__________________________________________________________________\n");
  fprintf(stderr, "Mean: \t%u\t%2.2f\t%2.2f\t%u\n", 
	 all_invalidations,
	 (float)all_inv_writes/(float)all_writes,
	 (float)all_invalidations/(float)all_inv_writes,
	 all_overflows);

  fprintf(stderr, "\n===========================\n");
  fprintf(stderr, "      Other statistics\n");
  fprintf(stderr, "============================\n\n");

  fprintf(stderr, "\tFree\tBumps\n");
  fprintf(stderr, "__________________________________________________________________\n");
  for (i = 0; i < no_procs; i++){
    fprintf(stderr, "C %d: \t%u\t%u\n", i,
	   no_free_blocks[i], no_bumps[i]);

    all_free_blocks += no_free_blocks[i];
    all_bumps += no_bumps[i];
  }

  fprintf(stderr, "__________________________________________________________________\n");
  fprintf(stderr, "Mean: \t%2.2f\t%2.2f\n", 
	 (float)all_free_blocks/no_procs,
	 (float)all_bumps/(float)no_procs);

  fflush(stderr);


}


