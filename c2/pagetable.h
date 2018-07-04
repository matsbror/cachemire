#ifndef _PAGETABLE_H_
#define _PAGETABLE_H_

#include "attr.h"

/* Page table with virtual pages */
class PageTableRec {
public:
    PageTableRec() {
	init = 0;
	rmap = NULL;
	attributes = PRIVATE;
    }
    unsigned short init;
    unsigned long page_frame;
    unsigned long *rmap;
    unsigned attributes;
} ;

#endif
