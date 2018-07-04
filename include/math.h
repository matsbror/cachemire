#pragma begin abi
/* math.h standard header */
#ifndef _MATH
#define _MATH
#include <limits.h>

		/* macros */
#define HUGE_VAL	_Hugeval._D
#define HUGE            FLT_MAX

#define	M_E		2.7182818284590452354
#define	M_LOG2E		1.4426950408889634074
#define	M_LOG10E	0.43429448190325182765
#define	M_LN2		0.69314718055994530942
#define	M_LN10		2.30258509299404568402
#define	M_PI		3.14159265358979323846
#define	M_PI_2		1.57079632679489661923
#define	M_PI_4		0.78539816339744830962
#define	M_1_PI		0.31830988618379067154
#define	M_2_PI		0.63661977236758134308
#define	M_2_SQRTPI	1.12837916709551257390
#define	M_SQRT2		1.41421356237309504880
#define	M_SQRT1_2	0.70710678118654752440

		/* type definitions */
typedef const union {
	unsigned short _W[4];
	double _D;
	} _Dconst;
		/* declarations */
double acos(double);
double asin(double);
double atan(double);
double atan2(double, double);
double ceil(double);
double cos(double);
double cosh(double);
double exp(double);
double fabs(double);
double floor(double);
double fmod(double, double);
double frexp(double, int *);
double ldexp(double, int);
double log(double);
double log10(double);
double modf(double, double *);
double pow(double, double);
double sin(double);
double sinh(double);
double sqrt(double);
double tan(double);
double tanh(double);
double _Asin(double, int);
double _Log(double, int);
double _Sin(double, unsigned int);
extern _Dconst _Hugeval;
		/* macro overrides */
#define acos(x)	_Asin(x, 1)
#define asin(x)	_Asin(x, 0)
#define cos(x)	_Sin(x, 1)
#define log(x)	_Log(x, 0)
#define log10(x)	_Log(x, 1)
#define sin(x)	_Sin(x, 0)
#endif
#pragma end abi
