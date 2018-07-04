#include "trap.h"

	.file	"asm.S"

.section	".text"

	.align 4
	.global trap
	.type	 trap,#function
trap:
	ta ST_USER
	retl
	nop
.LLfe1:
	.size	 trap,.LLfe1-trap


	.align 4
.global cm_lock
	.type	 cm_lock,#function
cm_lock:
	save %sp,-112,%sp
retry:	ldstub 	[%i0], %l1
	tst	%l1
	be	out
	nop
loop:	ldub	[%i0], %l1
	tst	%l1
	bne	loop
	nop
	ba,a	retry
out:	nop
	ret
	restore
	nop
.LLfe2:
	.size	 cm_lock,.LLfe2-cm_lock


	.align 4
.global cm_lock_backoff
	.type	 cm_lock_backoff,#function
cm_lock_backoff:
	save %sp,-112,%sp
boretr:	ldstub 	[%i0], %l1
	tst	%l1
	be	boout
	nop
boloop:	call    backoff,0
	mov	%i0,%o0
!	ldub	[%i0], %l1
!	tst	%l1
!	bne	boloop
!	nop
	ba,a	boretr
boout:	nop
	ret
	restore
	nop
.LLfe3:
	.size	 cm_lock_backoff,.LLfe3-cm_lock_backoff


	.align 4
.global cm_lock2
	.type	 cm_lock2,#function
cm_lock2:
	save %sp,-112,%sp
retry2:	ldstub 	[%i0], %l1
	tst	%l1
	bne	retry2
	nop

	ret
	restore
	nop
.LLfe4:
	.size	 cm_lock2,.LLfe4-cm_lock2



	.align 4
.global cm_unlock
	.type	 cm_unlock,#function
cm_unlock:
	save %sp,-112,%sp
	mov	%g0,%l1
	swap	[%i0],%l1
	st	%g0,[%i0]
	ret
	restore
	nop
.LLfe5:
	.size	 cm_unlock,.LLfe5-cm_unlock

