/*
 *  fio.s - the library with trap-routines
 *
 *  Compile with the trapC.h file using cpp:
 * 
 *  cpp fio.s > fio2.s      ,       gcc -c fio2.s -o fio.o
 *  
 *  Author: Fredrik Dahlgren, fredrik@dit.lth.se
 *
 *  Date: 920303
 */

#include "trapC.h"

gcc_compiled.:
.text


	.align 4
.global get_time
	.proc 1
get_time:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ta TRAP_GET_TIME
	ret
	restore

	.align 4
.global start_proc
	.proc 1
start_proc:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ta TRAP_START_PROC
	ret
	restore


	.align 4
.global exit_proc
	.proc 1
exit_proc:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ta TRAP_EXIT_PROC
	ret
	restore


	.align 4
.global resume_proc
	.proc 1
resume_proc:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ta TRAP_RESUME_PROC
	ret
	restore


	.align 4
.global stop_proc
	.proc 1
stop_proc:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ta TRAP_STOP_PROC
	ret
	restore


	.align 4
.global trap
	.proc 1
trap:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	ta TRAP_TRAP
	ret
	restore



        .align 4
.global do_stop
        .proc 1
do_stop:
	st %l0,[%g0]
	ret
	nop

	.align 4
	.global CMexit
	.proc 1
CMexit:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	call _exit,0
	mov %i0,%o0
	ret
	restore
	.align 4
	.global _start
	.proc 1

	.align 4
	.global start
	.proc 1
start:
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
	sethi %hi(_stdglob),%o0
	ld [%o0+%lo(_stdglob)],%o1
	ld [%o1+28],%o0
	add %o0,1,%o0
	st %o0,[%o1+28]
	call _start_proc,0
	mov %i0,%o0
	ret
	restore
	.align 4
	.proc 1
