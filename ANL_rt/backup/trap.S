#include "trap.h"
	.file	"trap.c"
.section	".text"
	.align 4
	.global trap
	.type	 trap,#function
	.proc	04
trap:
	!#PROLOGUE# 0
!	save %sp,-112,%sp
	!#PROLOGUE# 1
	ta ST_USER
	retl
	nop
!	ret
!	restore
.LLfe1:
	.size	 trap,.LLfe1-trap
	.ident	"GCC: (GNU) 2.5.8"
