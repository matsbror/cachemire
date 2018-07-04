#ifndef _ATTR_H_
#define _ATTR_H_

/* Address spaces */
#define USER_INSTR_AS        0x8      /* User Instructions */
#define SUPER_INSTR_AS       0x9      /* System instructions */ 
#define USER_DATA_AS         0xA      /* User data */
#define SUPER_DATA_AS        0xB      /* System data */

/* Page attributes */
#define PRIVATE          1      /* This is default */
#define REPLICATED       2      /* Permit several copies of a page */
#define SHARED           4      /* Denotes that this memory area is shared */

#endif

