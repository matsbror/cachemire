#ifndef _CACHE_H_
#define _CACHE_H_

extern void cache_init(int, int, int, int);
extern void reset_stats();
extern void cache_stats();
extern int cache_read(int, unsigned long);
extern int cache_write(int, unsigned long);
extern int cache_synch(int, unsigned long, unsigned long);
extern void cache_cycle();

#endif
