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


	.align 4
	.global geti7reg
	.type	 geti7reg,#function
geti7reg:
	mov	%i7,%o0
	retl
	nop

	.align 4
	.global seti7reg
	.type	 seti7reg,#function
seti7reg:
	mov	%o0,%i7
	retl
	nop



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



	.align 4
.global cm_unlock
	.type	 cm_unlock,#function
cm_unlock:
	save %sp,-112,%sp
	mov	%g0,%l1
	swap	[%i0],%l1
	ret
	restore
	nop



	.align 4
.global do_ldstub
	.type	do_ldstub,#function
do_ldstub:
	ldstub	[%o0],%o0
	retl
	nop

	.align 4
.global do_swap
	.type	do_swap,#function
do_swap:
	swap	[%o1],%o0
	retl
	nop
