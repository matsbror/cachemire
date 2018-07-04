#ifndef _TRAP_H_
#define _TRAP_H_

#define	ST_OSYSCALL		0x00
#define	ST_BREAKPOINT		0x01
#define	ST_DIV0			0x02
#define	ST_FLUSH_WINDOWS	0x03
#define	ST_CLEAN_WINDOWS	0x04
#define	ST_RANGE_CHECK		0x05
#define	ST_FIX_ALIGN		0x06
#define	ST_INT_OVERFLOW		0x07
#define	ST_SYSCALL		0x08
#define ST_USER                 0x10

/* stdlib functions */

/* Codes for the ST_USER trap */

#define GET_NOPROCS           	1     
#define SET_MEM_ATTR      	2    
#define START_STAT        	3   
#define END_STAT          	4  
#define START_SHARED_STAT 	5 
#define END_SHARED_STAT   	6      
#define STEP_DONE_STAT    	7      
#define EXIT_ACQUIRE        	8     
#define ENTER_BARRIER   	9    
#define EXIT_BARRIER     	10  
#define DISABLE_TRACE     	11
#define ENABLE_TRACE     	12
#define ENTER_ACQUIRE		13
#define ENTER_RELEASE           14
#define BLOCK_SIZE_TRAP		15
#define HEAP_END_TRAP		16
#define PAGE_SIZE_TRAP		17
#define SHARED_PAGES_TRAP	18
#define BREAKPOINT_TRAP		19
#define TRAP_START_PROC         20
#define TRAP_EXIT_PROC          21
#define TRAP_RESUME_PROC        22
#define TRAP_STOP_PROC          23
#define TRAP_GET_TIME           24
#define TRAP_PRINT_REG          25
#define TRAP_PRINT_STRING       26
#define TRAP_PRINT_INT          27
#define TRAP_REPLICATE          28
#define GET_LOCK_MODEL          29
#define BARRIER_INIT            30
#define TRAP_COPY_RETADDR       31
#define TRAP_GET_NOPROCS        32

#endif


