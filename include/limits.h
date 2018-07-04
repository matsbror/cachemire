/* limits.h standard header -- 8-bit version */
#ifndef _LIMITS
#define _LIMITS
#ifndef _YVALS
#include <yvals.h>
#endif
		/* char properties */
#define CHAR_BIT	8
#if _CSIGN
#define CHAR_MAX	127
#define CHAR_MIN	(-127-_C2)
#else
#define CHAR_MAX	255
#define CHAR_MIN	0
#endif
		/* int properties */
#if _ILONG
#define INT_MAX		2147483647
#define INT_MIN		(-2147483647-_C2)
#define UINT_MAX	4294967295U
#else
#define INT_MAX		32767
#define INT_MIN		(-32767-_C2)
#define UINT_MAX	65535U
#endif
		/* long properties */
#define LONG_MAX	2147483647
#define LONG_MIN	(-2147483647-_C2)
		/* multibyte properties */
#define MB_LEN_MAX	_MBMAX
		/* signed char properties */
#define SCHAR_MAX	127
#define SCHAR_MIN	(-127-_C2)
		/* short properties */
#define SHRT_MAX	32767
#define SHRT_MIN	(-32767-_C2)
		/* unsigned properties */
#define UCHAR_MAX	255
#define ULONG_MAX	4294967295
#define USHRT_MAX	65535U

#define	DBL_DIG		15	/* digits of precision of a "double" */
#define	DBL_MAX		1.7976931348623157E+308	/* max decimal value of a */
						/* "double" */
#define	DBL_MIN		2.2250738585072014E-308	/* min decimal value of a */
						/* "double" */
#define	FLT_DIG		6		/* digits of precision of a "float" */
#define	FLT_MAX		3.402823466E+38F  /* max decimal value of a "float" */
#define	FLT_MIN		1.175494351E-38F  /* min decimal value of a "float" */


#endif
