/*	Copyright (c) 1988 AT&T	*/
/*	  All Rights Reserved  	*/

/*	THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF AT&T	*/
/*	The copyright notice above does not evidence any   	*/
/*	actual or intended publication of such source code.	*/

#ifndef _VARARGS_H
#define	_VARARGS_H

#pragma ident	"@(#)varargs.h	1.12	92/07/14 SMI"	/* SVr4.0 1.4.1.5 */

#ifdef	__cplusplus
extern "C" {
#endif

typedef char *va_list;
#if 0 /* MB 950503 defined(sparc) */
#define	va_alist __builtin_va_alist
#endif

#define	va_dcl int va_alist;
#define	va_start(list) list = (char *) &va_alist
#define	va_end(list)
#if 0 /* MB 950503 defined(sparc) && !defined(lint)*/
#define	va_arg(list, mode) ((mode*)__builtin_va_arg_incr((mode *)list))[0]
#else
#define	va_arg(list, mode) ((mode *)(list += sizeof (mode)))[-1]
#endif

#ifdef	__cplusplus
}
#endif

#endif	/* _VARARGS_H */
