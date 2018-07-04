#ifndef _GENERICS_H_
#define _GENERICS_H_

#define GET_PID           	1     
#define SET_MEM_ATTR      	2    
#define START_STAT        	3   
#define END_STAT          	4  
#define START_SHARED_STAT 	5 
#define END_SHARED_STAT   	6      
#define STEP_DONE_STAT    	7      
#define GET_RANDOM        	8     
#define REACHED_BARRIER   	9    
#define PASSED_BARRIER    	10  
#define DISABLE_TRACE     	11
#define ENABLE_TRACE     	12
#define ACQUIRE_TRAP		13
#define RELEASE_TRAP		14
#define BLOCK_SIZE_TRAP		15
#define HEAP_PAGES_TRAP		16
#define PAGE_SIZE_TRAP		17
#define SHARED_PAGES_TRAP	18
#define BREAKPOINT_TRAP		19

#define NORMAL           0      /* This is default */
#define REPLICATED       1      /* Permit several copies of a page */
#define READ_ONLY        2      /* Make this area read only */
#define NON_CACHEABLE    4      /* Do not permit this area to be cached */
#define LOCAL            8      /* Migrate this page to the specified mem mod*/
#define INHERITED       16      /* Inherit this memory area from proc 0 */
#define SHARED          32      /* Denotes that this memory area is shared */
#define INSTRUCTIONS	64
#define PRIVATE		128
#define MIGRATORY       256
#define MOSTLY_READ     512

#endif
