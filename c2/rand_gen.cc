#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <math.h>
#include <assert.h>
#include "rand_gen.h"

#ifndef RAND_MAX
#define RAND_MAX 32767
/* Valid for solaris and PC's */
/* #define RAND_MAX 2147483647*/
#endif

static initiated=0;

/* Initiate n streams of random numbers */
int init_rand(int n){
  if (!initiated) {
    srand(26517953 % RAND_MAX);
    initiated = 1;
  }
  return 0;
}

/* Implements uniform random generation between 0 and 1 */
/* Stream number s */
double get_random(int n){
  double dd;
  dd = (double)rand()/(double)(RAND_MAX+1);
  return dd;

} /* end get_random */

/* Return uniformly distributed random number between min and max inclusive */
int minmaxrand(int n, int min, int max){
  int i;
  double dd;
  if (max==min)
    return (max);
  assert((max-min)>0);
  dd = get_random(n);
  i = (int)(dd * (float)(max-min) + 0.5) + min;
  assert((min <= i) && (i <= max));
  return i;
}
