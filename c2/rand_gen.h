

#ifndef _RAND_GEN_H_
#define _RAND_GEN_H_

int init_rand(int);

/* Implements uniform random generation between 0 and 1 */
/* from stream s */
double get_random(int);

/* Return uniformly distributed random number between min and max */
int minmaxrand(int, int, int);



#endif
