/* assert.h standard header */
#pragma begin abi
#undef assert	/* remove existing definition */

#ifdef NDEBUG
	#define assert(test)	((void)0)
#else			/* NDEBUG not defined */
	void _Assert(char*, int, char *);
		/* macros */
	#define _STR(x)	_VAL(x)
	#define _VAL(x)	#x
	#define assert(test)	((test) ? (void)0 \
		: _Assert(__FILE__, __LINE__,  #test))
#endif
#pragma end abi
