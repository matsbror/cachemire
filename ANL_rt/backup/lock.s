gcc_compiled.:
.text
	.align 4
.global cm_lock
	.proc 1
cm_lock:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
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
.global cm_lock2
	.proc 1
cm_lock2:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
retry2:	ldstub 	[%i0], %l1
	tst	%l1
	bne	retry2
	nop

	ret
	restore
	nop

	.align 4
.global cm_unlock
	.proc 1
cm_unlock:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	mov	%g0,%l1
	swap	[%i0],%l1
	ret
	restore
	nop

	.align 4
	.global barrier
	.proc 1
barrier:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ldstuba [%i0]1, %i0
L1:
	ret
	restore

