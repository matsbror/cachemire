#include <stdio.h>
#include "p4.h"

#define ALIGNMENT  128
#define N_MAX      256

static inline int min(int a,int b){
  return ((a)<(b)?a:b);
}


struct globmem {

  p4_barrier_monitor_t BA;

  int nprocs;
} *glob;

typedef struct _matris {
    float M[N_MAX][N_MAX];
} matris;

matris *A_mat;
matris *B_mat;
matris *S_mat;



int version = 0;
int blocked = 0;        /* is 1 if algorithm is blocked */
int printMatrix = 0;
int no_procs = 1;
int B = 4;
int N = 8;

inline static PS(char *s) {
  trap(TRAP_PRINT_STRING, s, strlen(s));
}

inline static PI(int i) {
  trap(TRAP_PRINT_INT, i);
}

/*
|| GLOBAL_ALLOC:  Allocates aligned global memory.
*/
char *global_alloc(unsigned int bytes) {
  unsigned temp;

  temp = (unsigned) p4_shmalloc(bytes + ALIGNMENT - 1);

  if (temp == (unsigned)NULL) {
    fflush(stdout);
    fprintf(stderr, 
      "ERROR: unable to allocate %d bytes shared memory\n", bytes);
    
    exit(-1);
  }
  if (temp % ALIGNMENT) {
    temp += ALIGNMENT;
    temp -= temp % ALIGNMENT;
  }
  return (char *)temp;
} /* global_alloc() */



void slave(){
  work();
}

/* Calculate S=A*B */

main(int argc, char **argv)
{
  int i, j;
  int timestart, timeend;

  p4_initenv(&argc, argv);

  /* Process command line args.  */
  argv++;
  while( --argc > 0 )
    {
      if( **argv == '-' ){
	switch( (*argv)[1] )
	  {
	  case 'v':  
	    if (--argc <= 0)  
	      goto usage;
	    version = atoi(*(++argv));
	    break;

	  case 'h':  
	    goto usage;

	  case 'P':  
	    printMatrix = 1;
	    break;
	  case 'p':  
	    if (--argc <= 0)  
	      goto usage;
	    no_procs = atoi(*(++argv));
	    break;
	  case 'n':  
	    if (--argc <= 0)  
	      goto usage;
	    N = atoi(*(++argv));
	    if (N > N_MAX)
	      exit(0);
	    break;
	  case 'b':  
	    if (--argc <= 0)  
	      goto usage;
	    B = atoi(*(++argv));
	    break;
          default:
	    goto usage;
          }
      }

      argv++;
    }


  printf("Matrix size %d x %d\n", N, N);
  printf("Number of processors: %d\n", no_procs);

  glob = (struct globmem *) global_alloc(sizeof(struct globmem));
  A_mat = (matris *) global_alloc(sizeof(matris));
  B_mat = (matris *) global_alloc(sizeof(matris));
  S_mat = (matris *) global_alloc(sizeof(matris));
  
#if 0
  printf("&(A[0][0]) = 0x%x\t&(A[0][1]) = 0x%x\n", &(A_mat->M[0][0]), &(A_mat->M[0][1]));
  printf("&(A[1][0]) = 0x%x\t&(A[1][1]) = 0x%x\n", &(A_mat->M[1][0]), &(A_mat->M[1][1]));
  printf("&(B[0][0]) = 0x%x\t&(B[0][1]) = 0x%x\n", &(B_mat->M[0][0]), &(B_mat->M[0][1]));
  printf("&(B[1][0]) = 0x%x\t&(B[1][1]) = 0x%x\n", &(B_mat->M[1][0]), &(B_mat->M[1][1]));
  printf("&(S[0][0]) = 0x%x\t&(S[0][1]) = 0x%x\n", &(S_mat->M[0][0]), &(S_mat->M[0][1]));
  printf("&(S[1][0]) = 0x%x\t&(S[1][1]) = 0x%x\n", &(S_mat->M[1][0]), &(S_mat->M[1][1]));
#endif

  printf("Init matrixes...\n");
  
  p4_barrier_init(&(glob->BA));

  for (i = 0; i < N; i++){
    for (j = 0; j < N; j++){
      S_mat->M[i][j] = 0.0;
      B_mat->M[i][j] = 4.6*(i+1)*(j+1);
      A_mat->M[i][j] = 2.3*(j+1)/(i+1);
    }
  }

#if 0
  if (printMatrix){
    printf("Matrix A ...\n");
    for (i = 0; i < N; i++){
      printf("[");
      for (j = 0; j < N; j++)
	printf(" %.2f ", A_mat->M[i][j]);
      printf("]\n");
    }
    printf("Matrix B ...\n");
    for (i = 0; i < N; i++){
      printf("[");
      for (j = 0; j < N; j++)
	printf(" %.2f ", B_mat->M[i][j]);
      printf("]\n");
    }
  }
#endif
  
  glob->nprocs = no_procs;
  
  /* create the other processes */
  for (i = 1; i < glob->nprocs; i++){
    p4_create(slave);
  }
  
  timestart = p4_clock();
  work();
  timeend = p4_clock();
  
  p4_wait_for_end(glob->nprocs - 1);

  if (printMatrix){
    printf("Resulting matrix...\n");
    for (i = 0; i < N; i++){
      printf("[");
      for (j = 0; j < N; j++)
	printf(" %.2f ", S_mat->M[i][j]);
      printf("]\n");
    }
  }
  
  printf("total time = %d\n", timeend - timestart);

  exit(0);

 usage: 
  printf("Usage: mult [-n #] [-p #] [-P] [-v #] [-b #]\n");
  printf("\t-n N\tMatrix size = N\n");
  printf("\t-p P\tNumber of processors = P\n");
  printf("\t-P\tPrint matrices\n");
  printf("\t-v V\tUse algorithm version = V\n");
  printf("\t-b B\tUse block size = B in blocked algorithm\n");


}



void do_mult(int i, int r, int k, int j) {

  float t = r * B_mat->M[k][j];   
  S_mat->M[i][j] += t;                     

}

void do_mult2(int i, int r, int k, int j) {
  

  S_mat->M[i][j] += r * B_mat->M[k][j];

}


/* There are two versions of matric multiplication. On naive
   and one blocking algorithm. Controlled by the variable VERSION */

work(){
  int k, i, j;
  int kk, ii, jj;
  register float r, t;
  register int min_k, min_j;
  int p;
  int nprocs = glob->nprocs;
  int start, end, rest;
  p = getpid();

  rest = N % nprocs;
  start = (N / nprocs) * p;
  end = (N / nprocs) * (p+1);
  
  if (rest) {
    if (p < rest) {
      start += p;
      end += p + 1;
    } else {
      start += rest;
      end += rest;
    }
  }
      
  switch (version) {
  case 0:

    if (p == 0) {
      printf("Unblocked matrix multiplication\n");
      printf("Parallelised across the outermost loop\n");
    }

    p4_barrier(&(glob->BA), glob->nprocs);
    trap(START_STAT);
  
    for (i = start; i < end; i++){                
      for (k = 0; k < N; k++) {                   
	r = A_mat->M[i][k];                        
        for (j = 0; j < N; j++) {                 
	  float t = r * B_mat->M[k][j];   
	  S_mat->M[i][j] += t;                     
	}
      }
    }
    break;

  case 1:

    if (p == 0) {
      printf("Unblocked matrix multiplication\n");
      printf("Parallelised across the third loop\n");
    }

    p4_barrier(&(glob->BA), glob->nprocs);
    trap(START_STAT);

    for (i = 0; i < N; i++){                
      for (k = 0; k < N; k++) {                   
	r = A_mat->M[i][k];                        
        for (j = start; j < end; j++) {                 
	  float t = r * B_mat->M[k][j];   
	  S_mat->M[i][j] += t;                     
	}
      }
    }
    break;

  case 2:
   
    if (p == 0) {
      printf("Blocked matrix multiplication\n");
      printf("Parallelised across the second loop\n");
      blocked = 1;
    }
    
    p4_barrier(&(glob->BA), glob->nprocs);
    trap(START_STAT);
      
    for (kk = 0; kk < N; kk += B) {
      min_k =  min(kk+B, N);
      
      for (jj = start; jj < end; jj += B){	
	min_j =  min(jj+B, end);
	
	for (i = 0; i < N; i++){
	  for (k = kk; k < min_k; k++){
	    r = A_mat->M[i][k];
	    for (j = jj; j < min_j; j++){
	      register float t = r * B_mat->M[k][j];
	      S_mat->M[i][j] += t;
	    }
	  }
	}
      }
    }
    
    break;

  case 3:
   
    if (p == 0) {
      printf("Blocked matrix multiplication\n");
      printf("Parallelised across the third loop\n");
      blocked = 1;
    }

    p4_barrier(&(glob->BA), glob->nprocs);
    trap(START_STAT);

    for (kk = 0; kk < N; kk += B) {
      min_k =  min(kk+B, N);
      for (jj = 0; jj < N; jj += B) {
	min_j =  min(jj+B, N);

	for (i = start; i < end; i++){
	  for (k = kk; k < min_k; k++){
            r = A_mat->M[i][k];
            for (j = jj; j < min_j; j++) {
	      float t = r * B_mat->M[k][j];
	      S_mat->M[i][j] += t;
	    }
          }
        }
      }
    }
    
    break;

  case 4:
   
    if (p == 0) {
      printf("Blocked matrix multiplication\n");
      printf("Parallelised across the fifth loop\n");
      blocked = 1;
    }

    rest = B % nprocs;
    start = (B / nprocs) * p;
    end = (B / nprocs) * (p+1);
    
    if (rest) {
	if (p < rest) {
	    start += p;
	    end += p + 1;
	} else {
	    start += rest;
	    end += rest;
	}
    }


    p4_barrier(&(glob->BA), glob->nprocs);
    trap(START_STAT);

    for (kk = 0; kk < N; kk += B) {
      min_k =  min(kk+B, N);
      for (jj = 0; jj < N; jj += B) {
	min_j =  min(jj+B, N);

	for (i = 0; i < N; i++){
	  for (k = kk; k < min_k; k++){
            r = A_mat->M[i][k];
            for (j = jj+start; j < jj+end; j++) {
	      float t = r * B_mat->M[k][j];
	      S_mat->M[i][j] += t;
	    }
          }
        }
      }
    }
    
    break;

  case 10:

    if (p == 0) {
      printf("Unblocked matrix multiplication\n");
      printf("Parallelised across the outermost loop\n");
      printf("Reversed loop order\n");
    }

    p4_barrier(&(glob->BA), glob->nprocs);
    trap(START_STAT);
  
    for (j = 0; j < N; j++) {                 
	for (i = start; i < end; i++){                
	    t = 0;
	    for (k = 0; k < N; k++) {                   
		r = A_mat->M[i][k];
		t += r * B_mat->M[k][j];   
	    }
	    S_mat->M[i][j] = t;
	}
    }
    break;

  case 11:

    if (p == 0) {
      printf("Unblocked matrix multiplication\n");
      printf("Parallelised across the third loop\n");
      printf("Reversed loop order\n");
    }

    p4_barrier(&(glob->BA), glob->nprocs);
    trap(START_STAT);

    for (j = start; j < end; j++) {                 
	for (i = 0; i < N; i++){                
	    t = 0;
	    for (k = 0; k < N; k++) {                   
		r = A_mat->M[i][k];
		t += r * B_mat->M[k][j];   
	    }
	    S_mat->M[i][j] = t;               
	}
    }
    break;

  default:
    printf("Unknown version of matrix multiplication: %d\n", version);
    exit(-1);

  }

  p4_barrier(&(glob->BA), glob->nprocs);

} /* end work */
