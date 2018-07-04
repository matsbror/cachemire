#ifndef _STATISTICS_H_
#define _STATISTICS_H_

#include "generics.h"
#include "cm_memory.h"

extern unsigned long last_instr_addr[];
extern unsigned long last_data_addr[];

extern int space_granularity;
extern int use_random;
extern int sampling_period;
extern int synch_process;

extern char parameterfilename[80];
extern int start_stat;
extern int sb_base;
extern FILE *sb_base_fp;

void ClearStatistics();

void InitStatistics(int, char *, char *);

void GatherStatistics(int, MemOpType, unsigned long, unsigned long, 
		      unsigned long);

void PrintStatistics();

#endif
