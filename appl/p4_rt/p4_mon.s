	.file	"p4_mon.c"

	.pushsection	".text"
.L_text_b:
	.popsection

	.pushsection	".data"
.L_data_b:
	.popsection

	.pushsection	".rodata"
.L_rodata_b:
	.popsection

	.pushsection	".bss"
.L_bss_b:
	.popsection

	.pushsection	".debug_sfnames"
.L_sfnames_b:
	.asciz	"/usr/dit/matsbror/research/CacheMire-2/appl/p4_rt/"
	.popsection

	.pushsection	".line"
.L_line_b:
	.uaword	.L_line_e-.L_line_b
	.uaword	.L_text_b
	.popsection

	.pushsection	".debug_srcinfo"
.L_srcinfo_b:
	.uaword	.L_line_b
	.uaword	.L_sfnames_b
	.uaword	.L_text_b
	.uaword	.L_text_e
	.uaword	0xffffffff
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_debug_b
	.popsection

	.pushsection	".debug_aranges"
	.uaword	.L_debug_b
	.popsection

	.pushsection	".debug"
.L_debug_b:
.L_D1:
	.uaword	.L_D1_e-.L_D1
	.uahalf	0x11
	.uahalf	0x12
	.uaword	.L_D2
	.uahalf	0x38
	.asciz	"p4_mon.c"
	.uahalf	0x258
	.asciz	"GNU C 2.5.8"
	.uahalf	0x136
	.uaword	0x1
	.uahalf	0x111
	.uaword	.L_text_b
	.uahalf	0x121
	.uaword	.L_text_e
	.uahalf	0x106
	.uaword	.L_line_b
	.uahalf	0x1b8
	.asciz	"/usr/dit/matsbror/research/CacheMire-2/appl/p4_rt"
	.uahalf	0x8006
	.uaword	.L_sfnames_b
	.uahalf	0x8016
	.uaword	.L_srcinfo_b
.L_D1_e:
	.popsection


	.pushsection	".debug"
.L_D3:
	.uaword	.L_D3_e-.L_D3
	.uahalf	0x14
	.uahalf	0x12
	.uaword	.L_D4
	.uahalf	0x38
	.asciz	"PS"
	.uahalf	0x208
	.asciz	""
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.L_E157 = .L_D3
.L_D3_e:
.L_D5:
	.uaword	.L_D5_e-.L_D5
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D6
	.uahalf	0x38
	.asciz	"s"
	.uahalf	0x63
	.uahalf	.L_t5_e-.L_t5
.L_t5:
	.byte	0x1
	.uahalf	0x1
.L_t5_e:
	.L_E156 = .L_D5
.L_D5_e:
.L_D6:
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_D4:
	.uaword	.L_D4_e-.L_D4
	.uahalf	0x14
	.uahalf	0x12
	.uaword	.L_D7
	.uahalf	0x38
	.asciz	"PI"
	.uahalf	0x208
	.asciz	""
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.L_E163 = .L_D4
.L_D4_e:
.L_D8:
	.uaword	.L_D8_e-.L_D8
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D9
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.L_E162 = .L_D8
.L_D8_e:
.L_D9:
	.uaword	0x4
	.popsection
	.global .umul

	.pushsection	".debug"
.L_D7:
	.uaword	.L_D7_e-.L_D7
	.uahalf	0x14
	.uahalf	0x12
	.uaword	.L_D10
	.uahalf	0x38
	.asciz	"delay"
	.uahalf	0x208
	.asciz	""
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.L_E169 = .L_D7
.L_D7_e:
.L_D11:
	.uaword	.L_D11_e-.L_D11
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D12
	.uahalf	0x38
	.asciz	"n"
	.uahalf	0x55
	.uahalf	0x7
	.L_E168 = .L_D11
.L_D11_e:
.L_D12:
	.uaword	.L_D12_e-.L_D12
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D13
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.L_E173 = .L_D12
.L_D12_e:
.L_D13:
	.uaword	.L_D13_e-.L_D13
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D14
	.uahalf	0x38
	.asciz	"j"
	.uahalf	0x55
	.uahalf	0x7
	.L_E174 = .L_D13
.L_D13_e:
.L_D14:
	.uaword	0x4
	.popsection
.section	".text"
	.align 4
	.global backoff
	.type	 backoff,#function
	.proc	020
backoff:

	.pushsection	".debug_sfnames"
.L_F0:
	.asciz	"p4_mon.c"
	.popsection
.L_LC1:

	.pushsection	".line"
.L_LE1:
	.uaword	25	! p4_mon.c:25
	.uahalf	0xffff
	.uaword	.L_LC1-.L_text_b
	.popsection

	.pushsection	".debug_srcinfo"
	.uaword	.L_LE1-.L_line_b
	.uaword	.L_F0-.L_sfnames_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b4:
.L_LC2:

	.pushsection	".line"
	.uaword	26	! p4_mon.c:26
	.uahalf	0xffff
	.uaword	.L_LC2-.L_text_b
	.popsection
	sethi %hi(lock_model),%o0
	ld [%o0+%lo(lock_model)],%o0
	cmp %o0,1
	bne .LL9
	nop
.L_LC3:

	.pushsection	".line"
	.uaword	27	! p4_mon.c:27
	.uahalf	0xffff
	.uaword	.L_LC3-.L_text_b
	.popsection
.L_B3:
.L_B4:
.L_B5:
	call getpid,0
	nop
.L_LC4:

	.pushsection	".line"
	.uaword	17	! p4_mon.c:17
	.uahalf	0xffff
	.uaword	.L_LC4-.L_text_b
	.popsection
	sll %o0,2,%o1
	add %o1,%o0,%o1
	sll %o1,3,%o1
	sub %o1,%o0,%o1
	sll %o1,4,%o1
	add %o1,%o0,%o1
.L_LC5:

	.pushsection	".line"
	.uaword	19	! p4_mon.c:19
	.uahalf	0xffff
	.uaword	.L_LC5-.L_text_b
	.popsection
	mov 0,%o0
.L_LC6:

	.pushsection	".line"
	.uaword	17	! p4_mon.c:17
	.uahalf	0xffff
	.uaword	.L_LC6-.L_text_b
	.popsection
	sll %o1,3,%o1
.L_LC7:

	.pushsection	".line"
	.uaword	19	! p4_mon.c:19
	.uahalf	0xffff
	.uaword	.L_LC7-.L_text_b
	.popsection
	cmp %o0,%o1
	bge .LL9
	add %o0,1,%o0
.LL15:
	cmp %o0,%o1
	bl .LL15
	add %o0,1,%o0
.L_LC8:

	.pushsection	".line"
	.uaword	21	! p4_mon.c:21
	.uahalf	0xffff
	.uaword	.L_LC8-.L_text_b
	.popsection
.L_B5_e:
.L_B4_e:
.L_LC9:

	.pushsection	".line"
	.uaword	29	! p4_mon.c:29
	.uahalf	0xffff
	.uaword	.L_LC9-.L_text_b
	.popsection
.L_B3_e:
.LL9:
.L_LC10:

	.pushsection	".line"
	.uaword	30	! p4_mon.c:30
	.uahalf	0xffff
	.uaword	.L_LC10-.L_text_b
	.popsection
.L_b4_e:
	ret
	restore
.L_f4_e:
.LLfe1:
	.size	 backoff,.LLfe1-backoff

	.pushsection	".debug_pubnames"
	.uaword	.L_P0
	.asciz	"backoff"
	.popsection

	.pushsection	".debug"
.L_P0:
.L_D10:
	.uaword	.L_D10_e-.L_D10
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D15
	.uahalf	0x38
	.asciz	"backoff"
	.uahalf	0x111
	.uaword	backoff
	.uahalf	0x121
	.uaword	.L_f4_e
	.uahalf	0x8041
	.uaword	.L_b4
	.uahalf	0x8051
	.uaword	.L_b4_e
.L_D10_e:
.L_D16:
	.uaword	.L_D16_e-.L_D16
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D17
	.uahalf	0x111
	.uaword	.L_B3
	.uahalf	0x121
	.uaword	.L_B3_e
.L_D16_e:
.L_D18:
	.uaword	.L_D18_e-.L_D18
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D19
	.uahalf	0x38
	.asciz	"p"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l18_e-.L_l18
.L_l18:
	.byte	0x1
	.uaword	0x8
.L_l18_e:
.L_D18_e:
.L_D19:
	.uaword	.L_D19_e-.L_D19
	.uahalf	0x1d
	.uahalf	0x12
	.uaword	.L_D20
	.uahalf	0x2b2
	.uaword	.L_E169
	.uahalf	0x111
	.uaword	.L_B4
	.uahalf	0x121
	.uaword	.L_B4_e
.L_D19_e:
.L_D21:
	.uaword	.L_D21_e-.L_D21
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D22
	.uahalf	0x2b2
	.uaword	.L_E168
	.uahalf	0x23
	.uahalf	.L_l21_e-.L_l21
.L_l21:
	.byte	0x1
	.uaword	0x9
.L_l21_e:
.L_D21_e:
.L_D22:
	.uaword	.L_D22_e-.L_D22
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D23
	.uahalf	0x2b2
	.uaword	.L_E174
	.uahalf	0x23
	.uahalf	.L_l22_e-.L_l22
.L_l22:
.L_l22_e:
.L_D22_e:
.L_D23:
	.uaword	.L_D23_e-.L_D23
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D24
	.uahalf	0x2b2
	.uaword	.L_E173
	.uahalf	0x23
	.uahalf	.L_l23_e-.L_l23
.L_l23:
	.byte	0x1
	.uaword	0x8
.L_l23_e:
.L_D23_e:
.L_D24:
	.uaword	0x4
.L_D20:
	.uaword	0x4
.L_D17:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_lock_init
	.type	 p4_lock_init,#function
	.proc	020
p4_lock_init:
.L_LC11:

	.pushsection	".line"
	.uaword	32	! p4_mon.c:32
	.uahalf	0xffff
	.uaword	.L_LC11-.L_text_b
	.popsection
	!#PROLOGUE# 0
	!#PROLOGUE# 1
.L_b5:
.L_LC12:

	.pushsection	".line"
	.uaword	33	! p4_mon.c:33
	.uahalf	0xffff
	.uaword	.L_LC12-.L_text_b
	.popsection
	st %g0,[%o0]
.L_b5_e:
	retl
	nop
.L_f5_e:
.LLfe2:
	.size	 p4_lock_init,.LLfe2-p4_lock_init

	.pushsection	".debug_pubnames"
	.uaword	.L_P1
	.asciz	"p4_lock_init"
	.popsection

	.pushsection	".debug"
.L_P1:
.L_D15:
	.uaword	.L_D15_e-.L_D15
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D25
	.uahalf	0x38
	.asciz	"p4_lock_init"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	p4_lock_init
	.uahalf	0x121
	.uaword	.L_f5_e
	.uahalf	0x8041
	.uaword	.L_b5
	.uahalf	0x8051
	.uaword	.L_b5_e
.L_D15_e:
.L_D26:
	.uaword	.L_D26_e-.L_D26
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D27
	.uahalf	0x38
	.asciz	"l"
	.uahalf	0x63
	.uahalf	.L_t26_e-.L_t26
.L_t26:
	.byte	0x1
	.uahalf	0x7
.L_t26_e:
	.uahalf	0x23
	.uahalf	.L_l26_e-.L_l26
.L_l26:
	.byte	0x1
	.uaword	0x8
.L_l26_e:
.L_D26_e:
.L_D27:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_lock
	.type	 p4_lock,#function
	.proc	020
p4_lock:
.L_LC13:

	.pushsection	".line"
	.uaword	36	! p4_mon.c:36
	.uahalf	0xffff
	.uaword	.L_LC13-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b6:
.L_LC14:

	.pushsection	".line"
	.uaword	37	! p4_mon.c:37
	.uahalf	0xffff
	.uaword	.L_LC14-.L_text_b
	.popsection
	mov 13,%o0
	call trap,0
	mov %i0,%o1
.L_LC15:

	.pushsection	".line"
	.uaword	39	! p4_mon.c:39
	.uahalf	0xffff
	.uaword	.L_LC15-.L_text_b
	.popsection
	sethi %hi(lock_model),%o0
	ld [%o0+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL19
	mov 8,%o0
.L_LC16:

	.pushsection	".line"
	.uaword	40	! p4_mon.c:40
	.uahalf	0xffff
	.uaword	.L_LC16-.L_text_b
	.popsection
	call cm_lock_backoff,0
	mov %i0,%o0
.L_LC17:

	.pushsection	".line"
	.uaword	42	! p4_mon.c:42
	.uahalf	0xffff
	.uaword	.L_LC17-.L_text_b
	.popsection
	mov 8,%o0
.LL19:
	call trap,0
	mov %i0,%o1
.L_LC18:

	.pushsection	".line"
	.uaword	43	! p4_mon.c:43
	.uahalf	0xffff
	.uaword	.L_LC18-.L_text_b
	.popsection
.L_b6_e:
	ret
	restore
.L_f6_e:
.LLfe3:
	.size	 p4_lock,.LLfe3-p4_lock

	.pushsection	".debug_pubnames"
	.uaword	.L_P2
	.asciz	"p4_lock"
	.popsection

	.pushsection	".debug"
.L_P2:
.L_D25:
	.uaword	.L_D25_e-.L_D25
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D28
	.uahalf	0x38
	.asciz	"p4_lock"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	p4_lock
	.uahalf	0x121
	.uaword	.L_f6_e
	.uahalf	0x8041
	.uaword	.L_b6
	.uahalf	0x8051
	.uaword	.L_b6_e
.L_D25_e:
.L_D29:
	.uaword	.L_D29_e-.L_D29
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D30
	.uahalf	0x38
	.asciz	"l"
	.uahalf	0x63
	.uahalf	.L_t29_e-.L_t29
.L_t29:
	.byte	0x1
	.uahalf	0x7
.L_t29_e:
	.uahalf	0x23
	.uahalf	.L_l29_e-.L_l29
.L_l29:
	.byte	0x1
	.uaword	0x18
.L_l29_e:
.L_D29_e:
.L_D30:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_unlock
	.type	 p4_unlock,#function
	.proc	020
p4_unlock:
.L_LC19:

	.pushsection	".line"
	.uaword	45	! p4_mon.c:45
	.uahalf	0xffff
	.uaword	.L_LC19-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b7:
.L_LC20:

	.pushsection	".line"
	.uaword	46	! p4_mon.c:46
	.uahalf	0xffff
	.uaword	.L_LC20-.L_text_b
	.popsection
.L_LC21:

	.pushsection	".line"
	.uaword	48	! p4_mon.c:48
	.uahalf	0xffff
	.uaword	.L_LC21-.L_text_b
	.popsection
	mov 14,%o0
	call trap,0
	mov %i0,%o1
.L_LC22:

	.pushsection	".line"
	.uaword	50	! p4_mon.c:50
	.uahalf	0xffff
	.uaword	.L_LC22-.L_text_b
	.popsection
	sethi %hi(lock_model),%o0
	ld [%o0+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL21
	nop
.L_LC23:

	.pushsection	".line"
	.uaword	51	! p4_mon.c:51
	.uahalf	0xffff
	.uaword	.L_LC23-.L_text_b
	.popsection
	call cm_unlock,0
	mov %i0,%o0
.LL21:
.L_LC24:

	.pushsection	".line"
	.uaword	53	! p4_mon.c:53
	.uahalf	0xffff
	.uaword	.L_LC24-.L_text_b
	.popsection
.L_b7_e:
	ret
	restore
.L_f7_e:
.LLfe4:
	.size	 p4_unlock,.LLfe4-p4_unlock

	.pushsection	".debug_pubnames"
	.uaword	.L_P3
	.asciz	"p4_unlock"
	.popsection

	.pushsection	".debug"
.L_P3:
.L_D28:
	.uaword	.L_D28_e-.L_D28
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D31
	.uahalf	0x38
	.asciz	"p4_unlock"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	p4_unlock
	.uahalf	0x121
	.uaword	.L_f7_e
	.uahalf	0x8041
	.uaword	.L_b7
	.uahalf	0x8051
	.uaword	.L_b7_e
.L_D28_e:
.L_D32:
	.uaword	.L_D32_e-.L_D32
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D33
	.uahalf	0x38
	.asciz	"l"
	.uahalf	0x63
	.uahalf	.L_t32_e-.L_t32
.L_t32:
	.byte	0x1
	.uahalf	0x7
.L_t32_e:
	.uahalf	0x23
	.uahalf	.L_l32_e-.L_l32
.L_l32:
	.byte	0x1
	.uaword	0x18
.L_l32_e:
.L_D32_e:
.L_D33:
	.uaword	.L_D33_e-.L_D33
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D34
	.uahalf	0x38
	.asciz	"lock_val"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l33_e-.L_l33
.L_l33:
.L_l33_e:
.L_D33_e:
.L_D34:
	.uaword	0x4
	.popsection
.section	".rodata"
	.align 8
.LLC0:
	.asciz	"OOPS! p4_moninit: p4_shmalloc failed ***\n"
.section	".text"
	.align 4
	.global p4_moninit
	.type	 p4_moninit,#function
	.proc	04
p4_moninit:
.L_LC25:

	.pushsection	".line"
	.uaword	56	! p4_mon.c:56
	.uahalf	0xffff
	.uaword	.L_LC25-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b8:
.L_LC26:

	.pushsection	".line"
	.uaword	57	! p4_mon.c:57
	.uahalf	0xffff
	.uaword	.L_LC26-.L_text_b
	.popsection
.L_LC27:

	.pushsection	".line"
	.uaword	60	! p4_mon.c:60
	.uahalf	0xffff
	.uaword	.L_LC27-.L_text_b
	.popsection
	call p4_lock_init,0
	mov %i0,%o0
.L_LC28:

	.pushsection	".line"
	.uaword	62	! p4_mon.c:62
	.uahalf	0xffff
	.uaword	.L_LC28-.L_text_b
	.popsection
	cmp %i1,0
	be .LL23
	nop
.L_LC29:

	.pushsection	".line"
	.uaword	64	! p4_mon.c:64
	.uahalf	0xffff
	.uaword	.L_LC29-.L_text_b
	.popsection
	call p4_shmalloc,0
	sll %i1,6,%o0
	st %o0,[%i0+4]
.L_LC30:

	.pushsection	".line"
	.uaword	65	! p4_mon.c:65
	.uahalf	0xffff
	.uaword	.L_LC30-.L_text_b
	.popsection
	ld [%i0+4],%o0
	cmp %o0,0
	bne .LL24
	mov 0,%l1
.L_LC31:

	.pushsection	".line"
	.uaword	67	! p4_mon.c:67
	.uahalf	0xffff
	.uaword	.L_LC31-.L_text_b
	.popsection
.L_B9:
	sethi %hi(.LLC0),%o0
	call p4_dprintf,0
	or %o0,%lo(.LLC0),%o0
.L_LC32:

	.pushsection	".line"
	.uaword	68	! p4_mon.c:68
	.uahalf	0xffff
	.uaword	.L_LC32-.L_text_b
	.popsection
	b .LL30
	mov -1,%i0
.L_LC33:

	.pushsection	".line"
	.uaword	69	! p4_mon.c:69
	.uahalf	0xffff
	.uaword	.L_LC33-.L_text_b
	.popsection
.L_B9_e:
.LL24:
.L_LC34:

	.pushsection	".line"
	.uaword	70	! p4_mon.c:70
	.uahalf	0xffff
	.uaword	.L_LC34-.L_text_b
	.popsection
	cmp %l1,%i1
	bge,a .LL30
	mov 0,%i0
.L_LC35:

	.pushsection	".line"
	.uaword	72	! p4_mon.c:72
	.uahalf	0xffff
	.uaword	.L_LC35-.L_text_b
	.popsection
	sll %l1,6,%l0
.LL31:
	ld [%i0+4],%o0
.L_LC36:

	.pushsection	".line"
	.uaword	70	! p4_mon.c:70
	.uahalf	0xffff
	.uaword	.L_LC36-.L_text_b
	.popsection
	add %l1,1,%l1
.L_LC37:

	.pushsection	".line"
	.uaword	72	! p4_mon.c:72
	.uahalf	0xffff
	.uaword	.L_LC37-.L_text_b
	.popsection
	add %l0,%o0,%l0
.L_LC38:

	.pushsection	".line"
	.uaword	73	! p4_mon.c:73
	.uahalf	0xffff
	.uaword	.L_LC38-.L_text_b
	.popsection
	st %g0,[%l0]
.L_LC39:

	.pushsection	".line"
	.uaword	75	! p4_mon.c:75
	.uahalf	0xffff
	.uaword	.L_LC39-.L_text_b
	.popsection
	add %l0,4,%l0
	call p4_lock_init,0
	mov %l0,%o0
.L_LC40:

	.pushsection	".line"
	.uaword	76	! p4_mon.c:76
	.uahalf	0xffff
	.uaword	.L_LC40-.L_text_b
	.popsection
	call p4_lock,0
	mov %l0,%o0
.L_LC41:

	.pushsection	".line"
	.uaword	70	! p4_mon.c:70
	.uahalf	0xffff
	.uaword	.L_LC41-.L_text_b
	.popsection
	cmp %l1,%i1
	bl .LL31
	sll %l1,6,%l0
.L_LC42:

	.pushsection	".line"
	.uaword	78	! p4_mon.c:78
	.uahalf	0xffff
	.uaword	.L_LC42-.L_text_b
	.popsection
	b .LL30
	mov 0,%i0
.LL23:
.L_LC43:

	.pushsection	".line"
	.uaword	80	! p4_mon.c:80
	.uahalf	0xffff
	.uaword	.L_LC43-.L_text_b
	.popsection
	st %g0,[%i0+4]
.L_LC44:

	.pushsection	".line"
	.uaword	81	! p4_mon.c:81
	.uahalf	0xffff
	.uaword	.L_LC44-.L_text_b
	.popsection
	mov 0,%i0
.LL30:
.L_LC45:

	.pushsection	".line"
	.uaword	82	! p4_mon.c:82
	.uahalf	0xffff
	.uaword	.L_LC45-.L_text_b
	.popsection
.L_b8_e:
	ret
	restore
.L_f8_e:
.LLfe5:
	.size	 p4_moninit,.LLfe5-p4_moninit

	.pushsection	".debug_pubnames"
	.uaword	.L_P4
	.asciz	"p4_moninit"
	.popsection

	.pushsection	".debug"
.L_P4:
.L_D31:
	.uaword	.L_D31_e-.L_D31
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D35
	.uahalf	0x38
	.asciz	"p4_moninit"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	p4_moninit
	.uahalf	0x121
	.uaword	.L_f8_e
	.uahalf	0x8041
	.uaword	.L_b8
	.uahalf	0x8051
	.uaword	.L_b8_e
.L_D31_e:
.L_D36:
	.uaword	.L_D36_e-.L_D36
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D37
	.uahalf	0x38
	.asciz	"m"
	.uahalf	0x83
	.uahalf	.L_t36_e-.L_t36
.L_t36:
	.byte	0x1
	.uaword	.L_T72
.L_t36_e:
	.uahalf	0x23
	.uahalf	.L_l36_e-.L_l36
.L_l36:
	.byte	0x1
	.uaword	0x18
.L_l36_e:
.L_D36_e:
.L_D37:
	.uaword	.L_D37_e-.L_D37
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D38
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l37_e-.L_l37
.L_l37:
	.byte	0x1
	.uaword	0x19
.L_l37_e:
.L_D37_e:
.L_D38:
	.uaword	.L_D38_e-.L_D38
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D39
	.uahalf	0x38
	.asciz	"j"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l38_e-.L_l38
.L_l38:
	.byte	0x1
	.uaword	0x11
.L_l38_e:
.L_D38_e:
.L_D39:
	.uaword	.L_D39_e-.L_D39
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D40
	.uahalf	0x38
	.asciz	"q"
	.uahalf	0x83
	.uahalf	.L_t39_e-.L_t39
.L_t39:
	.byte	0x1
	.uaword	.L_T69
.L_t39_e:
	.uahalf	0x23
	.uahalf	.L_l39_e-.L_l39
.L_l39:
	.byte	0x1
	.uaword	0x10
.L_l39_e:
.L_D39_e:
.L_D40:
	.uaword	.L_D40_e-.L_D40
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D41
	.uahalf	0x111
	.uaword	.L_B9
	.uahalf	0x121
	.uaword	.L_B9_e
.L_D40_e:
.L_D42:
	.uaword	0x4
.L_D41:
	.uaword	0x4
.L_D35:
	.uaword	.L_D35_e-.L_D35
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D43
	.L_T72 = .L_D35
	.uahalf	0x38
	.asciz	"p4_monitor"
	.uahalf	0xb6
	.uaword	0x8
.L_D35_e:
.L_D44:
	.uaword	.L_D44_e-.L_D44
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D45
	.uahalf	0x38
	.asciz	"mon_lock"
	.uahalf	0x142
	.uaword	.L_T72
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l44_e-.L_l44
.L_l44:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l44_e:
.L_D44_e:
.L_D45:
	.uaword	.L_D45_e-.L_D45
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D46
	.uahalf	0x38
	.asciz	"qs"
	.uahalf	0x142
	.uaword	.L_T72
	.uahalf	0x83
	.uahalf	.L_t45_e-.L_t45
.L_t45:
	.byte	0x1
	.uaword	.L_T69
.L_t45_e:
	.uahalf	0x23
	.uahalf	.L_l45_e-.L_l45
.L_l45:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l45_e:
.L_D45_e:
.L_D46:
	.uaword	0x4
.L_D43:
	.uaword	.L_D43_e-.L_D43
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D47
	.L_T69 = .L_D43
	.uahalf	0x38
	.asciz	"p4_mon_queue"
	.uahalf	0xb6
	.uaword	0x40
.L_D43_e:
.L_D48:
	.uaword	.L_D48_e-.L_D48
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D49
	.uahalf	0x38
	.asciz	"count"
	.uahalf	0x142
	.uaword	.L_T69
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l48_e-.L_l48
.L_l48:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l48_e:
.L_D48_e:
.L_D49:
	.uaword	.L_D49_e-.L_D49
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D50
	.uahalf	0x38
	.asciz	"delay_lock"
	.uahalf	0x142
	.uaword	.L_T69
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l49_e-.L_l49
.L_l49:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l49_e:
.L_D49_e:
.L_D50:
	.uaword	.L_D50_e-.L_D50
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D51
	.uahalf	0x38
	.asciz	"pad"
	.uahalf	0x142
	.uaword	.L_T69
	.uahalf	0x72
	.uaword	.L_T71
	.uahalf	0x23
	.uahalf	.L_l50_e-.L_l50
.L_l50:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l50_e:
.L_D50_e:
.L_D51:
	.uaword	0x4
.L_D47:
	.uaword	.L_D47_e-.L_D47
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D52
	.L_T71 = .L_D47
	.uahalf	0xa3
	.uahalf	.L_s47_e-.L_s47
.L_s47:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0xd
	.byte	0x8
	.uahalf	0x55
	.uahalf	0x7
.L_s47_e:
.L_D47_e:
	.popsection
	.align 4
	.global p4_menter
	.type	 p4_menter,#function
	.proc	020
p4_menter:
.L_LC46:

	.pushsection	".line"
	.uaword	85	! p4_mon.c:85
	.uahalf	0xffff
	.uaword	.L_LC46-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b9:
.L_LC47:

	.pushsection	".line"
	.uaword	87	! p4_mon.c:87
	.uahalf	0xffff
	.uaword	.L_LC47-.L_text_b
	.popsection
	call p4_lock,0
	mov %i0,%o0
.L_b9_e:
	ret
	restore
.L_f9_e:
.LLfe6:
	.size	 p4_menter,.LLfe6-p4_menter

	.pushsection	".debug_pubnames"
	.uaword	.L_P5
	.asciz	"p4_menter"
	.popsection

	.pushsection	".debug"
.L_P5:
.L_D52:
	.uaword	.L_D52_e-.L_D52
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D53
	.uahalf	0x38
	.asciz	"p4_menter"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	p4_menter
	.uahalf	0x121
	.uaword	.L_f9_e
	.uahalf	0x8041
	.uaword	.L_b9
	.uahalf	0x8051
	.uaword	.L_b9_e
.L_D52_e:
.L_D54:
	.uaword	.L_D54_e-.L_D54
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D55
	.uahalf	0x38
	.asciz	"m"
	.uahalf	0x83
	.uahalf	.L_t54_e-.L_t54
.L_t54:
	.byte	0x1
	.uaword	.L_T72
.L_t54_e:
	.uahalf	0x23
	.uahalf	.L_l54_e-.L_l54
.L_l54:
	.byte	0x1
	.uaword	0x18
.L_l54_e:
.L_D54_e:
.L_D55:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_mexit
	.type	 p4_mexit,#function
	.proc	020
p4_mexit:
.L_LC48:

	.pushsection	".line"
	.uaword	92	! p4_mon.c:92
	.uahalf	0xffff
	.uaword	.L_LC48-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b10:
.L_LC49:

	.pushsection	".line"
	.uaword	95	! p4_mon.c:95
	.uahalf	0xffff
	.uaword	.L_LC49-.L_text_b
	.popsection
	call p4_unlock,0
	mov %i0,%o0
.L_b10_e:
	ret
	restore
.L_f10_e:
.LLfe7:
	.size	 p4_mexit,.LLfe7-p4_mexit

	.pushsection	".debug_pubnames"
	.uaword	.L_P6
	.asciz	"p4_mexit"
	.popsection

	.pushsection	".debug"
.L_P6:
.L_D53:
	.uaword	.L_D53_e-.L_D53
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D56
	.uahalf	0x38
	.asciz	"p4_mexit"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	p4_mexit
	.uahalf	0x121
	.uaword	.L_f10_e
	.uahalf	0x8041
	.uaword	.L_b10
	.uahalf	0x8051
	.uaword	.L_b10_e
.L_D53_e:
.L_D57:
	.uaword	.L_D57_e-.L_D57
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D58
	.uahalf	0x38
	.asciz	"m"
	.uahalf	0x83
	.uahalf	.L_t57_e-.L_t57
.L_t57:
	.byte	0x1
	.uaword	.L_T72
.L_t57_e:
	.uahalf	0x23
	.uahalf	.L_l57_e-.L_l57
.L_l57:
	.byte	0x1
	.uaword	0x18
.L_l57_e:
.L_D57_e:
.L_D58:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_mdelay
	.type	 p4_mdelay,#function
	.proc	020
p4_mdelay:
.L_LC50:

	.pushsection	".line"
	.uaword	99	! p4_mon.c:99
	.uahalf	0xffff
	.uaword	.L_LC50-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b11:
	mov %i0,%o0
.L_LC51:

	.pushsection	".line"
	.uaword	102	! p4_mon.c:102
	.uahalf	0xffff
	.uaword	.L_LC51-.L_text_b
	.popsection
	ld [%o0+4],%o1
	sll %i1,6,%i1
	add %i1,%o1,%i1
.L_LC52:

	.pushsection	".line"
	.uaword	103	! p4_mon.c:103
	.uahalf	0xffff
	.uaword	.L_LC52-.L_text_b
	.popsection
	ld [%i1],%o1
	add %o1,1,%o1
	st %o1,[%i1]
	ld [%i1],%o1
.L_LC53:

	.pushsection	".line"
	.uaword	106	! p4_mon.c:106
	.uahalf	0xffff
	.uaword	.L_LC53-.L_text_b
	.popsection
	call p4_unlock,0
	nop
.L_LC54:

	.pushsection	".line"
	.uaword	108	! p4_mon.c:108
	.uahalf	0xffff
	.uaword	.L_LC54-.L_text_b
	.popsection
	call p4_lock,0
	add %i1,4,%o0
.L_LC55:

	.pushsection	".line"
	.uaword	112	! p4_mon.c:112
	.uahalf	0xffff
	.uaword	.L_LC55-.L_text_b
	.popsection
.L_b11_e:
	ret
	restore
.L_f11_e:
.LLfe8:
	.size	 p4_mdelay,.LLfe8-p4_mdelay

	.pushsection	".debug_pubnames"
	.uaword	.L_P7
	.asciz	"p4_mdelay"
	.popsection

	.pushsection	".debug"
.L_P7:
.L_D56:
	.uaword	.L_D56_e-.L_D56
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D59
	.uahalf	0x38
	.asciz	"p4_mdelay"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	p4_mdelay
	.uahalf	0x121
	.uaword	.L_f11_e
	.uahalf	0x8041
	.uaword	.L_b11
	.uahalf	0x8051
	.uaword	.L_b11_e
.L_D56_e:
.L_D60:
	.uaword	.L_D60_e-.L_D60
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D61
	.uahalf	0x38
	.asciz	"m"
	.uahalf	0x83
	.uahalf	.L_t60_e-.L_t60
.L_t60:
	.byte	0x1
	.uaword	.L_T72
.L_t60_e:
	.uahalf	0x23
	.uahalf	.L_l60_e-.L_l60
.L_l60:
	.byte	0x1
	.uaword	0x8
.L_l60_e:
.L_D60_e:
.L_D61:
	.uaword	.L_D61_e-.L_D61
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D62
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l61_e-.L_l61
.L_l61:
	.byte	0x1
	.uaword	0x19
.L_l61_e:
.L_D61_e:
.L_D62:
	.uaword	.L_D62_e-.L_D62
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D63
	.uahalf	0x38
	.asciz	"q"
	.uahalf	0x83
	.uahalf	.L_t62_e-.L_t62
.L_t62:
	.byte	0x1
	.uaword	.L_T69
.L_t62_e:
	.uahalf	0x23
	.uahalf	.L_l62_e-.L_l62
.L_l62:
	.byte	0x1
	.uaword	0x19
.L_l62_e:
.L_D62_e:
.L_D63:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_mcontinue
	.type	 p4_mcontinue,#function
	.proc	020
p4_mcontinue:
.L_LC56:

	.pushsection	".line"
	.uaword	115	! p4_mon.c:115
	.uahalf	0xffff
	.uaword	.L_LC56-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b12:
.L_LC57:

	.pushsection	".line"
	.uaword	116	! p4_mon.c:116
	.uahalf	0xffff
	.uaword	.L_LC57-.L_text_b
	.popsection
.L_LC58:

	.pushsection	".line"
	.uaword	118	! p4_mon.c:118
	.uahalf	0xffff
	.uaword	.L_LC58-.L_text_b
	.popsection
	ld [%i0+4],%o0
	sll %i1,6,%i1
	add %i1,%o0,%i1
.L_LC59:

	.pushsection	".line"
	.uaword	119	! p4_mon.c:119
	.uahalf	0xffff
	.uaword	.L_LC59-.L_text_b
	.popsection
	ld [%i1],%o0
	cmp %o0,0
	be .LL36
	nop
.L_LC60:

	.pushsection	".line"
	.uaword	121	! p4_mon.c:121
	.uahalf	0xffff
	.uaword	.L_LC60-.L_text_b
	.popsection
	ld [%i1],%o0
	add %o0,-1,%o0
	st %o0,[%i1]
	ld [%i1],%o0
.L_LC61:

	.pushsection	".line"
	.uaword	124	! p4_mon.c:124
	.uahalf	0xffff
	.uaword	.L_LC61-.L_text_b
	.popsection
	call p4_unlock,0
	add %i1,4,%o0
.L_LC62:

	.pushsection	".line"
	.uaword	125	! p4_mon.c:125
	.uahalf	0xffff
	.uaword	.L_LC62-.L_text_b
	.popsection
	b,a .LL37
.LL36:
.L_LC63:

	.pushsection	".line"
	.uaword	130	! p4_mon.c:130
	.uahalf	0xffff
	.uaword	.L_LC63-.L_text_b
	.popsection
	call p4_unlock,0
	mov %i0,%o0
.LL37:
.L_LC64:

	.pushsection	".line"
	.uaword	133	! p4_mon.c:133
	.uahalf	0xffff
	.uaword	.L_LC64-.L_text_b
	.popsection
.L_b12_e:
	ret
	restore
.L_f12_e:
.LLfe9:
	.size	 p4_mcontinue,.LLfe9-p4_mcontinue

	.pushsection	".debug_pubnames"
	.uaword	.L_P8
	.asciz	"p4_mcontinue"
	.popsection

	.pushsection	".debug"
.L_P8:
.L_D59:
	.uaword	.L_D59_e-.L_D59
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D64
	.uahalf	0x38
	.asciz	"p4_mcontinue"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	p4_mcontinue
	.uahalf	0x121
	.uaword	.L_f12_e
	.uahalf	0x8041
	.uaword	.L_b12
	.uahalf	0x8051
	.uaword	.L_b12_e
.L_D59_e:
.L_D65:
	.uaword	.L_D65_e-.L_D65
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D66
	.uahalf	0x38
	.asciz	"m"
	.uahalf	0x83
	.uahalf	.L_t65_e-.L_t65
.L_t65:
	.byte	0x1
	.uaword	.L_T72
.L_t65_e:
	.uahalf	0x23
	.uahalf	.L_l65_e-.L_l65
.L_l65:
	.byte	0x1
	.uaword	0x18
.L_l65_e:
.L_D65_e:
.L_D66:
	.uaword	.L_D66_e-.L_D66
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D67
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l66_e-.L_l66
.L_l66:
	.byte	0x1
	.uaword	0x19
.L_l66_e:
.L_D66_e:
.L_D67:
	.uaword	.L_D67_e-.L_D67
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D68
	.uahalf	0x38
	.asciz	"q"
	.uahalf	0x83
	.uahalf	.L_t67_e-.L_t67
.L_t67:
	.byte	0x1
	.uaword	.L_T69
.L_t67_e:
	.uahalf	0x23
	.uahalf	.L_l67_e-.L_l67
.L_l67:
	.byte	0x1
	.uaword	0x19
.L_l67_e:
.L_D67_e:
.L_D68:
	.uaword	0x4
	.popsection
	.align 4
	.global num_in_mon_queue
	.type	 num_in_mon_queue,#function
	.proc	04
num_in_mon_queue:
.L_LC65:

	.pushsection	".line"
	.uaword	136	! p4_mon.c:136
	.uahalf	0xffff
	.uaword	.L_LC65-.L_text_b
	.popsection
	!#PROLOGUE# 0
	!#PROLOGUE# 1
.L_b13:
.L_LC66:

	.pushsection	".line"
	.uaword	137	! p4_mon.c:137
	.uahalf	0xffff
	.uaword	.L_LC66-.L_text_b
	.popsection
.L_LC67:

	.pushsection	".line"
	.uaword	139	! p4_mon.c:139
	.uahalf	0xffff
	.uaword	.L_LC67-.L_text_b
	.popsection
	ld [%o0+4],%g2
	sll %o1,6,%o1
.L_LC68:

	.pushsection	".line"
	.uaword	140	! p4_mon.c:140
	.uahalf	0xffff
	.uaword	.L_LC68-.L_text_b
	.popsection
	ld [%o1+%g2],%o0
.L_LC69:

	.pushsection	".line"
	.uaword	141	! p4_mon.c:141
	.uahalf	0xffff
	.uaword	.L_LC69-.L_text_b
	.popsection
.L_b13_e:
	retl
	nop
.L_f13_e:
.LLfe10:
	.size	 num_in_mon_queue,.LLfe10-num_in_mon_queue

	.pushsection	".debug_pubnames"
	.uaword	.L_P9
	.asciz	"num_in_mon_queue"
	.popsection

	.pushsection	".debug"
.L_P9:
.L_D64:
	.uaword	.L_D64_e-.L_D64
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D69
	.uahalf	0x38
	.asciz	"num_in_mon_queue"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	num_in_mon_queue
	.uahalf	0x121
	.uaword	.L_f13_e
	.uahalf	0x8041
	.uaword	.L_b13
	.uahalf	0x8051
	.uaword	.L_b13_e
.L_D64_e:
.L_D70:
	.uaword	.L_D70_e-.L_D70
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D71
	.uahalf	0x38
	.asciz	"m"
	.uahalf	0x83
	.uahalf	.L_t70_e-.L_t70
.L_t70:
	.byte	0x1
	.uaword	.L_T72
.L_t70_e:
	.uahalf	0x23
	.uahalf	.L_l70_e-.L_l70
.L_l70:
	.byte	0x1
	.uaword	0x8
.L_l70_e:
.L_D70_e:
.L_D71:
	.uaword	.L_D71_e-.L_D71
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D72
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l71_e-.L_l71
.L_l71:
	.byte	0x1
	.uaword	0x9
.L_l71_e:
.L_D71_e:
.L_D72:
	.uaword	.L_D72_e-.L_D72
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D73
	.uahalf	0x38
	.asciz	"q"
	.uahalf	0x83
	.uahalf	.L_t72_e-.L_t72
.L_t72:
	.byte	0x1
	.uaword	.L_T69
.L_t72_e:
	.uahalf	0x23
	.uahalf	.L_l72_e-.L_l72
.L_l72:
.L_l72_e:
.L_D72_e:
.L_D73:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_getsub_init
	.type	 p4_getsub_init,#function
	.proc	04
p4_getsub_init:
.L_LC70:

	.pushsection	".line"
	.uaword	147	! p4_mon.c:147
	.uahalf	0xffff
	.uaword	.L_LC70-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b14:
	mov %i0,%o0
.L_LC71:

	.pushsection	".line"
	.uaword	149	! p4_mon.c:149
	.uahalf	0xffff
	.uaword	.L_LC71-.L_text_b
	.popsection
	st %g0,[%o0+8]
.L_LC72:

	.pushsection	".line"
	.uaword	150	! p4_mon.c:150
	.uahalf	0xffff
	.uaword	.L_LC72-.L_text_b
	.popsection
	call p4_moninit,0
	mov 1,%o1
.L_b14_e:
	ret
	restore %g0,%o0,%o0
.L_f14_e:
.LLfe11:
	.size	 p4_getsub_init,.LLfe11-p4_getsub_init

	.pushsection	".debug_pubnames"
	.uaword	.L_P10
	.asciz	"p4_getsub_init"
	.popsection

	.pushsection	".debug"
.L_P10:
.L_D69:
	.uaword	.L_D69_e-.L_D69
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D74
	.uahalf	0x38
	.asciz	"p4_getsub_init"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	p4_getsub_init
	.uahalf	0x121
	.uaword	.L_f14_e
	.uahalf	0x8041
	.uaword	.L_b14
	.uahalf	0x8051
	.uaword	.L_b14_e
.L_D69_e:
.L_D75:
	.uaword	.L_D75_e-.L_D75
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D76
	.uahalf	0x38
	.asciz	"gs"
	.uahalf	0x83
	.uahalf	.L_t75_e-.L_t75
.L_t75:
	.byte	0x1
	.uaword	.L_T75
.L_t75_e:
	.uahalf	0x23
	.uahalf	.L_l75_e-.L_l75
.L_l75:
	.byte	0x1
	.uaword	0x8
.L_l75_e:
.L_D75_e:
.L_D76:
	.uaword	0x4
.L_D74:
	.uaword	.L_D74_e-.L_D74
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D77
	.L_T75 = .L_D74
	.uahalf	0x38
	.asciz	"p4_getsub_monitor"
	.uahalf	0xb6
	.uaword	0xc
.L_D74_e:
.L_D78:
	.uaword	.L_D78_e-.L_D78
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D79
	.uahalf	0x38
	.asciz	"m"
	.uahalf	0x142
	.uaword	.L_T75
	.uahalf	0x72
	.uaword	.L_T72
	.uahalf	0x23
	.uahalf	.L_l78_e-.L_l78
.L_l78:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l78_e:
.L_D78_e:
.L_D79:
	.uaword	.L_D79_e-.L_D79
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D80
	.uahalf	0x38
	.asciz	"sub"
	.uahalf	0x142
	.uaword	.L_T75
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l79_e-.L_l79
.L_l79:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l79_e:
.L_D79_e:
.L_D80:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_getsubs
	.type	 p4_getsubs,#function
	.proc	020
p4_getsubs:
.L_LC73:

	.pushsection	".line"
	.uaword	155	! p4_mon.c:155
	.uahalf	0xffff
	.uaword	.L_LC73-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b15:
.L_LC74:

	.pushsection	".line"
	.uaword	156	! p4_mon.c:156
	.uahalf	0xffff
	.uaword	.L_LC74-.L_text_b
	.popsection
	call p4_menter,0
	mov %i0,%o0
.L_LC75:

	.pushsection	".line"
	.uaword	157	! p4_mon.c:157
	.uahalf	0xffff
	.uaword	.L_LC75-.L_text_b
	.popsection
	ld [%i0+8],%o0
	cmp %o0,%i2
	bg .LL41
	mov -1,%o0
.L_LC76:

	.pushsection	".line"
	.uaword	159	! p4_mon.c:159
	.uahalf	0xffff
	.uaword	.L_LC76-.L_text_b
	.popsection
	ld [%i0+8],%o0
	st %o0,[%i1]
.L_LC77:

	.pushsection	".line"
	.uaword	160	! p4_mon.c:160
	.uahalf	0xffff
	.uaword	.L_LC77-.L_text_b
	.popsection
	ld [%i0+8],%o1
.L_LC78:

	.pushsection	".line"
	.uaword	161	! p4_mon.c:161
	.uahalf	0xffff
	.uaword	.L_LC78-.L_text_b
	.popsection
	mov %i0,%o0
.L_LC79:

	.pushsection	".line"
	.uaword	160	! p4_mon.c:160
	.uahalf	0xffff
	.uaword	.L_LC79-.L_text_b
	.popsection
	add %i4,%o1,%o1
	st %o1,[%o0+8]
.L_LC80:

	.pushsection	".line"
	.uaword	161	! p4_mon.c:161
	.uahalf	0xffff
	.uaword	.L_LC80-.L_text_b
	.popsection
.L_LC81:

	.pushsection	".line"
	.uaword	162	! p4_mon.c:162
	.uahalf	0xffff
	.uaword	.L_LC81-.L_text_b
	.popsection
	call p4_mexit,0
	add %o7,(.LL42-.-4),%o7
.LL41:
.L_LC82:

	.pushsection	".line"
	.uaword	165	! p4_mon.c:165
	.uahalf	0xffff
	.uaword	.L_LC82-.L_text_b
	.popsection
	st %o0,[%i1]
.L_LC83:

	.pushsection	".line"
	.uaword	166	! p4_mon.c:166
	.uahalf	0xffff
	.uaword	.L_LC83-.L_text_b
	.popsection
	mov %i0,%o0
	call num_in_mon_queue,0
	mov 0,%o1
	add %i3,-1,%o1
	cmp %o0,%o1
	bge .LL43
	mov %i0,%o0
.L_LC84:

	.pushsection	".line"
	.uaword	167	! p4_mon.c:167
	.uahalf	0xffff
	.uaword	.L_LC84-.L_text_b
	.popsection
	call p4_mdelay,0
	mov 0,%o1
	b .LL45
	mov %i0,%o0
.LL43:
.L_LC85:

	.pushsection	".line"
	.uaword	169	! p4_mon.c:169
	.uahalf	0xffff
	.uaword	.L_LC85-.L_text_b
	.popsection
	st %g0,[%i0+8]
.L_LC86:

	.pushsection	".line"
	.uaword	170	! p4_mon.c:170
	.uahalf	0xffff
	.uaword	.L_LC86-.L_text_b
	.popsection
	mov %i0,%o0
.LL45:
	call p4_mcontinue,0
	mov 0,%o1
.L_LC87:

	.pushsection	".line"
	.uaword	171	! p4_mon.c:171
	.uahalf	0xffff
	.uaword	.L_LC87-.L_text_b
	.popsection
.LL42:
.L_b15_e:
	ret
	restore
.L_f15_e:
.LLfe12:
	.size	 p4_getsubs,.LLfe12-p4_getsubs

	.pushsection	".debug_pubnames"
	.uaword	.L_P11
	.asciz	"p4_getsubs"
	.popsection

	.pushsection	".debug"
.L_P11:
.L_D77:
	.uaword	.L_D77_e-.L_D77
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D81
	.uahalf	0x38
	.asciz	"p4_getsubs"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	p4_getsubs
	.uahalf	0x121
	.uaword	.L_f15_e
	.uahalf	0x8041
	.uaword	.L_b15
	.uahalf	0x8051
	.uaword	.L_b15_e
.L_D77_e:
.L_D82:
	.uaword	.L_D82_e-.L_D82
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D83
	.uahalf	0x38
	.asciz	"gs"
	.uahalf	0x83
	.uahalf	.L_t82_e-.L_t82
.L_t82:
	.byte	0x1
	.uaword	.L_T75
.L_t82_e:
	.uahalf	0x23
	.uahalf	.L_l82_e-.L_l82
.L_l82:
	.byte	0x1
	.uaword	0x18
.L_l82_e:
.L_D82_e:
.L_D83:
	.uaword	.L_D83_e-.L_D83
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D84
	.uahalf	0x38
	.asciz	"s"
	.uahalf	0x63
	.uahalf	.L_t83_e-.L_t83
.L_t83:
	.byte	0x1
	.uahalf	0x7
.L_t83_e:
	.uahalf	0x23
	.uahalf	.L_l83_e-.L_l83
.L_l83:
	.byte	0x1
	.uaword	0x19
.L_l83_e:
.L_D83_e:
.L_D84:
	.uaword	.L_D84_e-.L_D84
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D85
	.uahalf	0x38
	.asciz	"max"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l84_e-.L_l84
.L_l84:
	.byte	0x1
	.uaword	0x1a
.L_l84_e:
.L_D84_e:
.L_D85:
	.uaword	.L_D85_e-.L_D85
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D86
	.uahalf	0x38
	.asciz	"nprocs"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l85_e-.L_l85
.L_l85:
	.byte	0x1
	.uaword	0x1b
.L_l85_e:
.L_D85_e:
.L_D86:
	.uaword	.L_D86_e-.L_D86
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D87
	.uahalf	0x38
	.asciz	"stride"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l86_e-.L_l86
.L_l86:
	.byte	0x1
	.uaword	0x1c
.L_l86_e:
.L_D86_e:
.L_D87:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_barrier_init
	.type	 p4_barrier_init,#function
	.proc	04
p4_barrier_init:
.L_LC88:

	.pushsection	".line"
	.uaword	178	! p4_mon.c:178
	.uahalf	0xffff
	.uaword	.L_LC88-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b16:
.L_LC89:

	.pushsection	".line"
	.uaword	179	! p4_mon.c:179
	.uahalf	0xffff
	.uaword	.L_LC89-.L_text_b
	.popsection
	mov 30,%o0
	call trap,0
	mov %i0,%o1
.L_LC90:

	.pushsection	".line"
	.uaword	180	! p4_mon.c:180
	.uahalf	0xffff
	.uaword	.L_LC90-.L_text_b
	.popsection
	sethi %hi(no_procs),%o0
	ld [%o0+%lo(no_procs)],%o1
	call p4_moninit,0
	add %i0,4,%o0
.L_LC91:

	.pushsection	".line"
	.uaword	181	! p4_mon.c:181
	.uahalf	0xffff
	.uaword	.L_LC91-.L_text_b
	.popsection
.L_b16_e:
	ret
	restore %g0,%o0,%o0
.L_f16_e:
.LLfe13:
	.size	 p4_barrier_init,.LLfe13-p4_barrier_init

	.pushsection	".debug_pubnames"
	.uaword	.L_P12
	.asciz	"p4_barrier_init"
	.popsection

	.pushsection	".debug"
.L_P12:
.L_D81:
	.uaword	.L_D81_e-.L_D81
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D88
	.uahalf	0x38
	.asciz	"p4_barrier_init"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	p4_barrier_init
	.uahalf	0x121
	.uaword	.L_f16_e
	.uahalf	0x8041
	.uaword	.L_b16
	.uahalf	0x8051
	.uaword	.L_b16_e
.L_D81_e:
.L_D89:
	.uaword	.L_D89_e-.L_D89
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D90
	.uahalf	0x38
	.asciz	"b"
	.uahalf	0x83
	.uahalf	.L_t89_e-.L_t89
.L_t89:
	.byte	0x1
	.uaword	.L_T77
.L_t89_e:
	.uahalf	0x23
	.uahalf	.L_l89_e-.L_l89
.L_l89:
	.byte	0x1
	.uaword	0x18
.L_l89_e:
.L_D89_e:
.L_D90:
	.uaword	0x4
.L_D88:
	.uaword	.L_D88_e-.L_D88
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D91
	.L_T77 = .L_D88
	.uahalf	0x38
	.asciz	"p4_barrier_monitor"
	.uahalf	0xb6
	.uaword	0xc
.L_D88_e:
.L_D92:
	.uaword	.L_D92_e-.L_D92
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D93
	.uahalf	0x38
	.asciz	"count"
	.uahalf	0x142
	.uaword	.L_T77
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l92_e-.L_l92
.L_l92:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l92_e:
.L_D92_e:
.L_D93:
	.uaword	.L_D93_e-.L_D93
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D94
	.uahalf	0x38
	.asciz	"m"
	.uahalf	0x142
	.uaword	.L_T77
	.uahalf	0x72
	.uaword	.L_T72
	.uahalf	0x23
	.uahalf	.L_l93_e-.L_l93
.L_l93:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l93_e:
.L_D93_e:
.L_D94:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_barrier
	.type	 p4_barrier,#function
	.proc	020
p4_barrier:
.L_LC92:

	.pushsection	".line"
	.uaword	183	! p4_mon.c:183
	.uahalf	0xffff
	.uaword	.L_LC92-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b17:
.L_LC93:

	.pushsection	".line"
	.uaword	185	! p4_mon.c:185
	.uahalf	0xffff
	.uaword	.L_LC93-.L_text_b
	.popsection
	mov 9,%o0
	mov %i0,%o1
	call trap,0
	mov %i1,%o2
.L_LC94:

	.pushsection	".line"
	.uaword	187	! p4_mon.c:187
	.uahalf	0xffff
	.uaword	.L_LC94-.L_text_b
	.popsection
	sethi %hi(lock_model),%o0
	ld [%o0+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL55
	mov 10,%o0
.L_LC95:

	.pushsection	".line"
	.uaword	189	! p4_mon.c:189
	.uahalf	0xffff
	.uaword	.L_LC95-.L_text_b
	.popsection
	add %i0,4,%l0
	call p4_menter,0
	mov %l0,%o0
.L_LC96:

	.pushsection	".line"
	.uaword	190	! p4_mon.c:190
	.uahalf	0xffff
	.uaword	.L_LC96-.L_text_b
	.popsection
	ld [%i0],%o0
	add %o0,1,%o0
	st %o0,[%i0]
	ld [%i0],%o0
.L_LC97:

	.pushsection	".line"
	.uaword	192	! p4_mon.c:192
	.uahalf	0xffff
	.uaword	.L_LC97-.L_text_b
	.popsection
	ld [%i0],%o0
	cmp %o0,%i1
	bge,a .LL49
	mov 0,%l0
.L_LC98:

	.pushsection	".line"
	.uaword	194	! p4_mon.c:194
	.uahalf	0xffff
	.uaword	.L_LC98-.L_text_b
	.popsection
.L_B15:
.L_B15_e:
	call getpid,0
	nop
	mov %o0,%o1
	call p4_mdelay,0
	mov %l0,%o0
.L_LC99:

	.pushsection	".line"
	.uaword	196	! p4_mon.c:196
	.uahalf	0xffff
	.uaword	.L_LC99-.L_text_b
	.popsection
	b .LL55
	mov 10,%o0
.LL49:
.L_LC100:

	.pushsection	".line"
	.uaword	197	! p4_mon.c:197
	.uahalf	0xffff
	.uaword	.L_LC100-.L_text_b
	.popsection
.L_B16:
.L_LC101:

	.pushsection	".line"
	.uaword	199	! p4_mon.c:199
	.uahalf	0xffff
	.uaword	.L_LC101-.L_text_b
	.popsection
	cmp %l0,%i1
	bge .LL52
	add %i0,4,%o0
.L_LC102:

	.pushsection	".line"
	.uaword	200	! p4_mon.c:200
	.uahalf	0xffff
	.uaword	.L_LC102-.L_text_b
	.popsection
.LL56:
	call p4_mcontinue,0
	mov %l0,%o1
.L_LC103:

	.pushsection	".line"
	.uaword	199	! p4_mon.c:199
	.uahalf	0xffff
	.uaword	.L_LC103-.L_text_b
	.popsection
	add %l0,1,%l0
	cmp %l0,%i1
	bl .LL56
	add %i0,4,%o0
.LL52:
.L_LC104:

	.pushsection	".line"
	.uaword	202	! p4_mon.c:202
	.uahalf	0xffff
	.uaword	.L_LC104-.L_text_b
	.popsection
	st %g0,[%i0]
.L_LC105:

	.pushsection	".line"
	.uaword	203	! p4_mon.c:203
	.uahalf	0xffff
	.uaword	.L_LC105-.L_text_b
	.popsection
.L_B16_e:
.L_LC106:

	.pushsection	".line"
	.uaword	207	! p4_mon.c:207
	.uahalf	0xffff
	.uaword	.L_LC106-.L_text_b
	.popsection
	mov 10,%o0
.LL55:
	mov %i0,%o1
	call trap,0
	mov %i1,%o2
.L_LC107:

	.pushsection	".line"
	.uaword	208	! p4_mon.c:208
	.uahalf	0xffff
	.uaword	.L_LC107-.L_text_b
	.popsection
.L_b17_e:
	ret
	restore
.L_f17_e:
.LLfe14:
	.size	 p4_barrier,.LLfe14-p4_barrier

	.pushsection	".debug_pubnames"
	.uaword	.L_P13
	.asciz	"p4_barrier"
	.popsection

	.pushsection	".debug"
.L_P13:
.L_D91:
	.uaword	.L_D91_e-.L_D91
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D95
	.uahalf	0x38
	.asciz	"p4_barrier"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	p4_barrier
	.uahalf	0x121
	.uaword	.L_f17_e
	.uahalf	0x8041
	.uaword	.L_b17
	.uahalf	0x8051
	.uaword	.L_b17_e
.L_D91_e:
.L_D96:
	.uaword	.L_D96_e-.L_D96
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D97
	.uahalf	0x38
	.asciz	"b"
	.uahalf	0x83
	.uahalf	.L_t96_e-.L_t96
.L_t96:
	.byte	0x1
	.uaword	.L_T77
.L_t96_e:
	.uahalf	0x23
	.uahalf	.L_l96_e-.L_l96
.L_l96:
	.byte	0x1
	.uaword	0x18
.L_l96_e:
.L_D96_e:
.L_D97:
	.uaword	.L_D97_e-.L_D97
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D98
	.uahalf	0x38
	.asciz	"nprocs"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l97_e-.L_l97
.L_l97:
	.byte	0x1
	.uaword	0x19
.L_l97_e:
.L_D97_e:
.L_D98:
	.uaword	.L_D98_e-.L_D98
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D99
	.uahalf	0x111
	.uaword	.L_B15
	.uahalf	0x121
	.uaword	.L_B15_e
.L_D98_e:
.L_D100:
	.uaword	0x4
.L_D99:
	.uaword	.L_D99_e-.L_D99
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D101
	.uahalf	0x111
	.uaword	.L_B16
	.uahalf	0x121
	.uaword	.L_B16_e
.L_D99_e:
.L_D102:
	.uaword	.L_D102_e-.L_D102
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D103
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l102_e-.L_l102
.L_l102:
	.byte	0x1
	.uaword	0x10
.L_l102_e:
.L_D102_e:
.L_D103:
	.uaword	0x4
.L_D101:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_askfor_init
	.type	 p4_askfor_init,#function
	.proc	04
p4_askfor_init:
.L_LC108:

	.pushsection	".line"
	.uaword	214	! p4_mon.c:214
	.uahalf	0xffff
	.uaword	.L_LC108-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b18:
	mov %i0,%o0
.L_LC109:

	.pushsection	".line"
	.uaword	216	! p4_mon.c:216
	.uahalf	0xffff
	.uaword	.L_LC109-.L_text_b
	.popsection
	st %g0,[%o0+8]
.L_LC110:

	.pushsection	".line"
	.uaword	217	! p4_mon.c:217
	.uahalf	0xffff
	.uaword	.L_LC110-.L_text_b
	.popsection
	st %g0,[%o0+12]
.L_LC111:

	.pushsection	".line"
	.uaword	222	! p4_mon.c:222
	.uahalf	0xffff
	.uaword	.L_LC111-.L_text_b
	.popsection
	call p4_moninit,0
	mov 1,%o1
.L_b18_e:
	ret
	restore %g0,%o0,%o0
.L_f18_e:
.LLfe15:
	.size	 p4_askfor_init,.LLfe15-p4_askfor_init

	.pushsection	".debug_pubnames"
	.uaword	.L_P14
	.asciz	"p4_askfor_init"
	.popsection

	.pushsection	".debug"
.L_P14:
.L_D95:
	.uaword	.L_D95_e-.L_D95
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D104
	.uahalf	0x38
	.asciz	"p4_askfor_init"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	p4_askfor_init
	.uahalf	0x121
	.uaword	.L_f18_e
	.uahalf	0x8041
	.uaword	.L_b18
	.uahalf	0x8051
	.uaword	.L_b18_e
.L_D95_e:
.L_D105:
	.uaword	.L_D105_e-.L_D105
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D106
	.uahalf	0x38
	.asciz	"af"
	.uahalf	0x83
	.uahalf	.L_t105_e-.L_t105
.L_t105:
	.byte	0x1
	.uaword	.L_T79
.L_t105_e:
	.uahalf	0x23
	.uahalf	.L_l105_e-.L_l105
.L_l105:
	.byte	0x1
	.uaword	0x8
.L_l105_e:
.L_D105_e:
.L_D106:
	.uaword	0x4
.L_D104:
	.uaword	.L_D104_e-.L_D104
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D107
	.L_T79 = .L_D104
	.uahalf	0x38
	.asciz	"p4_askfor_monitor"
	.uahalf	0xb6
	.uaword	0x10
.L_D104_e:
.L_D108:
	.uaword	.L_D108_e-.L_D108
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D109
	.uahalf	0x38
	.asciz	"m"
	.uahalf	0x142
	.uaword	.L_T79
	.uahalf	0x72
	.uaword	.L_T72
	.uahalf	0x23
	.uahalf	.L_l108_e-.L_l108
.L_l108:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l108_e:
.L_D108_e:
.L_D109:
	.uaword	.L_D109_e-.L_D109
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D110
	.uahalf	0x38
	.asciz	"pgdone"
	.uahalf	0x142
	.uaword	.L_T79
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l109_e-.L_l109
.L_l109:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l109_e:
.L_D109_e:
.L_D110:
	.uaword	.L_D110_e-.L_D110
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D111
	.uahalf	0x38
	.asciz	"pbdone"
	.uahalf	0x142
	.uaword	.L_T79
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l110_e-.L_l110
.L_l110:
	.byte	0x4
	.uaword	0xc
	.byte	0x7
.L_l110_e:
.L_D110_e:
.L_D111:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_askfor
	.type	 p4_askfor,#function
	.proc	04
p4_askfor:
.L_LC112:

	.pushsection	".line"
	.uaword	228	! p4_mon.c:228
	.uahalf	0xffff
	.uaword	.L_LC112-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b19:
.L_LC113:

	.pushsection	".line"
	.uaword	229	! p4_mon.c:229
	.uahalf	0xffff
	.uaword	.L_LC113-.L_text_b
	.popsection
.L_LC114:

	.pushsection	".line"
	.uaword	231	! p4_mon.c:231
	.uahalf	0xffff
	.uaword	.L_LC114-.L_text_b
	.popsection
	call p4_menter,0
	mov %i0,%o0
.L_LC115:

	.pushsection	".line"
	.uaword	232	! p4_mon.c:232
	.uahalf	0xffff
	.uaword	.L_LC115-.L_text_b
	.popsection
	ld [%i0+8],%o0
	cmp %o0,0
	bne .LL59
	nop
	ld [%i0+12],%o0
	cmp %o0,0
	be .LL59
	mov %i0,%o0
.L_LC116:

	.pushsection	".line"
	.uaword	234	! p4_mon.c:234
	.uahalf	0xffff
	.uaword	.L_LC116-.L_text_b
	.popsection
	call num_in_mon_queue,0
	mov 0,%o1
	add %i1,-1,%o1
	cmp %o0,%o1
	bge .LL61
	mov %i0,%o0
.L_LC117:

	.pushsection	".line"
	.uaword	236	! p4_mon.c:236
	.uahalf	0xffff
	.uaword	.L_LC117-.L_text_b
	.popsection
	call p4_mdelay,0
	mov 0,%o1
.L_LC118:

	.pushsection	".line"
	.uaword	238	! p4_mon.c:238
	.uahalf	0xffff
	.uaword	.L_LC118-.L_text_b
	.popsection
	b,a .LL61
.LL59:
.L_LC119:

	.pushsection	".line"
	.uaword	241	! p4_mon.c:241
	.uahalf	0xffff
	.uaword	.L_LC119-.L_text_b
	.popsection
	ld [%i0+8],%o0
	cmp %o0,0
	bne .LL61
	nop
	ld [%i0+12],%o0
	cmp %o0,0
	bne .LL61
	nop
	add %i1,-1,%i1
	mov 1,%l0
.LL68:
.L_LC120:

	.pushsection	".line"
	.uaword	243	! p4_mon.c:243
	.uahalf	0xffff
	.uaword	.L_LC120-.L_text_b
	.popsection
	call %i2,0
	mov %i3,%o0
	cmp %o0,0
	be .LL73
	mov %i0,%o0
.L_LC121:

	.pushsection	".line"
	.uaword	250	! p4_mon.c:250
	.uahalf	0xffff
	.uaword	.L_LC121-.L_text_b
	.popsection
	call num_in_mon_queue,0
	mov 0,%o1
	cmp %o0,%i1
	bne .LL66
	mov %i0,%o0
.L_LC122:

	.pushsection	".line"
	.uaword	252	! p4_mon.c:252
	.uahalf	0xffff
	.uaword	.L_LC122-.L_text_b
	.popsection
	st %l0,[%i0+12]
.L_LC123:

	.pushsection	".line"
	.uaword	254	! p4_mon.c:254
	.uahalf	0xffff
	.uaword	.L_LC123-.L_text_b
	.popsection
	b,a .LL62
.LL66:
.L_LC124:

	.pushsection	".line"
	.uaword	257	! p4_mon.c:257
	.uahalf	0xffff
	.uaword	.L_LC124-.L_text_b
	.popsection
	call p4_mdelay,0
	mov 0,%o1
.L_LC125:

	.pushsection	".line"
	.uaword	260	! p4_mon.c:260
	.uahalf	0xffff
	.uaword	.L_LC125-.L_text_b
	.popsection
.LL62:
	ld [%i0+8],%o0
	cmp %o0,0
	bne .LL61
	nop
	ld [%i0+12],%o0
	cmp %o0,0
	be .LL68
	nop
.LL61:
.L_LC126:

	.pushsection	".line"
	.uaword	262	! p4_mon.c:262
	.uahalf	0xffff
	.uaword	.L_LC126-.L_text_b
	.popsection
	ld [%i0+8],%o0
	cmp %o0,0
	be .LL69
	mov -1,%i1
.L_LC127:

	.pushsection	".line"
	.uaword	266	! p4_mon.c:266
	.uahalf	0xffff
	.uaword	.L_LC127-.L_text_b
	.popsection
	b .LL75
	mov %i0,%o0
.LL73:
.L_LC128:

	.pushsection	".line"
	.uaword	245	! p4_mon.c:245
	.uahalf	0xffff
	.uaword	.L_LC128-.L_text_b
	.popsection
	call p4_mcontinue,0
	mov 0,%o1
.L_LC129:

	.pushsection	".line"
	.uaword	246	! p4_mon.c:246
	.uahalf	0xffff
	.uaword	.L_LC129-.L_text_b
	.popsection
	b .LL72
	mov 0,%i0
.LL69:
.L_LC130:

	.pushsection	".line"
	.uaword	269	! p4_mon.c:269
	.uahalf	0xffff
	.uaword	.L_LC130-.L_text_b
	.popsection
	ld [%i0+12],%i1
.L_LC131:

	.pushsection	".line"
	.uaword	270	! p4_mon.c:270
	.uahalf	0xffff
	.uaword	.L_LC131-.L_text_b
	.popsection
	mov %i0,%o0
	call num_in_mon_queue,0
	mov 0,%o1
	cmp %o0,0
	bne .LL75
	mov %i0,%o0
.L_LC132:

	.pushsection	".line"
	.uaword	272	! p4_mon.c:272
	.uahalf	0xffff
	.uaword	.L_LC132-.L_text_b
	.popsection
	call %i4,0
	nop
.L_LC133:

	.pushsection	".line"
	.uaword	273	! p4_mon.c:273
	.uahalf	0xffff
	.uaword	.L_LC133-.L_text_b
	.popsection
	st %g0,[%i0+12]
.L_LC134:

	.pushsection	".line"
	.uaword	275	! p4_mon.c:275
	.uahalf	0xffff
	.uaword	.L_LC134-.L_text_b
	.popsection
	mov %i0,%o0
.LL75:
	call p4_mcontinue,0
	mov 0,%o1
.L_LC135:

	.pushsection	".line"
	.uaword	277	! p4_mon.c:277
	.uahalf	0xffff
	.uaword	.L_LC135-.L_text_b
	.popsection
	mov %i1,%i0
.LL72:
.L_LC136:

	.pushsection	".line"
	.uaword	278	! p4_mon.c:278
	.uahalf	0xffff
	.uaword	.L_LC136-.L_text_b
	.popsection
.L_b19_e:
	ret
	restore
.L_f19_e:
.LLfe16:
	.size	 p4_askfor,.LLfe16-p4_askfor

	.pushsection	".debug_pubnames"
	.uaword	.L_P15
	.asciz	"p4_askfor"
	.popsection

	.pushsection	".debug"
.L_P15:
.L_D107:
	.uaword	.L_D107_e-.L_D107
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D112
	.uahalf	0x38
	.asciz	"p4_askfor"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	p4_askfor
	.uahalf	0x121
	.uaword	.L_f19_e
	.uahalf	0x8041
	.uaword	.L_b19
	.uahalf	0x8051
	.uaword	.L_b19_e
.L_D107_e:
.L_D113:
	.uaword	.L_D113_e-.L_D113
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D114
	.uahalf	0x38
	.asciz	"af"
	.uahalf	0x83
	.uahalf	.L_t113_e-.L_t113
.L_t113:
	.byte	0x1
	.uaword	.L_T79
.L_t113_e:
	.uahalf	0x23
	.uahalf	.L_l113_e-.L_l113
.L_l113:
	.byte	0x1
	.uaword	0x18
.L_l113_e:
.L_D113_e:
.L_D114:
	.uaword	.L_D114_e-.L_D114
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D115
	.uahalf	0x38
	.asciz	"nprocs"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l114_e-.L_l114
.L_l114:
	.byte	0x1
	.uaword	0x19
.L_l114_e:
.L_D114_e:
.L_D115:
	.uaword	.L_D115_e-.L_D115
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D116
	.uahalf	0x38
	.asciz	"getprob_fxn"
	.uahalf	0x83
	.uahalf	.L_t115_e-.L_t115
.L_t115:
	.byte	0x1
	.uaword	.L_T38
.L_t115_e:
	.uahalf	0x23
	.uahalf	.L_l115_e-.L_l115
.L_l115:
	.byte	0x1
	.uaword	0x1a
.L_l115_e:
.L_D115_e:
.L_D116:
	.uaword	.L_D116_e-.L_D116
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D117
	.uahalf	0x38
	.asciz	"problem"
	.uahalf	0x63
	.uahalf	.L_t116_e-.L_t116
.L_t116:
	.byte	0x1
	.uahalf	0x14
.L_t116_e:
	.uahalf	0x23
	.uahalf	.L_l116_e-.L_l116
.L_l116:
	.byte	0x1
	.uaword	0x1b
.L_l116_e:
.L_D116_e:
.L_D117:
	.uaword	.L_D117_e-.L_D117
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D118
	.uahalf	0x38
	.asciz	"reset_fxn"
	.uahalf	0x83
	.uahalf	.L_t117_e-.L_t117
.L_t117:
	.byte	0x1
	.uaword	.L_T101
.L_t117_e:
	.uahalf	0x23
	.uahalf	.L_l117_e-.L_l117
.L_l117:
	.byte	0x1
	.uaword	0x1c
.L_l117_e:
.L_D117_e:
.L_D118:
	.uaword	.L_D118_e-.L_D118
	.uahalf	0x15
	.uahalf	0x12
	.uaword	.L_D119
	.L_T38 = .L_D118
	.uahalf	0x55
	.uahalf	0x7
.L_D118_e:
.L_D120:
	.uaword	.L_D120_e-.L_D120
	.uahalf	0x18
	.uahalf	0x12
	.uaword	.L_D121
.L_D120_e:
.L_D121:
	.uaword	0x4
.L_D119:
	.uaword	.L_D119_e-.L_D119
	.uahalf	0x15
	.uahalf	0x12
	.uaword	.L_D122
	.L_T101 = .L_D119
.L_D119_e:
.L_D123:
	.uaword	.L_D123_e-.L_D123
	.uahalf	0x18
	.uahalf	0x12
	.uaword	.L_D124
.L_D123_e:
.L_D124:
	.uaword	0x4
.L_D122:
	.uaword	.L_D122_e-.L_D122
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D125
	.uahalf	0x38
	.asciz	"rc"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l122_e-.L_l122
.L_l122:
	.byte	0x1
	.uaword	0x19
.L_l122_e:
.L_D122_e:
.L_D125:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_update
	.type	 p4_update,#function
	.proc	020
p4_update:
.L_LC137:

	.pushsection	".line"
	.uaword	282	! p4_mon.c:282
	.uahalf	0xffff
	.uaword	.L_LC137-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b20:
.L_LC138:

	.pushsection	".line"
	.uaword	283	! p4_mon.c:283
	.uahalf	0xffff
	.uaword	.L_LC138-.L_text_b
	.popsection
	call p4_menter,0
	mov %i0,%o0
.L_LC139:

	.pushsection	".line"
	.uaword	284	! p4_mon.c:284
	.uahalf	0xffff
	.uaword	.L_LC139-.L_text_b
	.popsection
	call %i1,0
	mov %i2,%o0
	cmp %o0,0
	be .LL77
	mov %i0,%o0
.L_LC140:

	.pushsection	".line"
	.uaword	285	! p4_mon.c:285
	.uahalf	0xffff
	.uaword	.L_LC140-.L_text_b
	.popsection
	call p4_mcontinue,0
	mov 0,%o1
	b,a .LL78
.LL77:
.L_LC141:

	.pushsection	".line"
	.uaword	287	! p4_mon.c:287
	.uahalf	0xffff
	.uaword	.L_LC141-.L_text_b
	.popsection
	call p4_mexit,0
	nop
.LL78:
.L_b20_e:
	ret
	restore
.L_f20_e:
.LLfe17:
	.size	 p4_update,.LLfe17-p4_update

	.pushsection	".debug_pubnames"
	.uaword	.L_P16
	.asciz	"p4_update"
	.popsection

	.pushsection	".debug"
.L_P16:
.L_D112:
	.uaword	.L_D112_e-.L_D112
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D126
	.uahalf	0x38
	.asciz	"p4_update"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	p4_update
	.uahalf	0x121
	.uaword	.L_f20_e
	.uahalf	0x8041
	.uaword	.L_b20
	.uahalf	0x8051
	.uaword	.L_b20_e
.L_D112_e:
.L_D127:
	.uaword	.L_D127_e-.L_D127
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D128
	.uahalf	0x38
	.asciz	"af"
	.uahalf	0x83
	.uahalf	.L_t127_e-.L_t127
.L_t127:
	.byte	0x1
	.uaword	.L_T79
.L_t127_e:
	.uahalf	0x23
	.uahalf	.L_l127_e-.L_l127
.L_l127:
	.byte	0x1
	.uaword	0x18
.L_l127_e:
.L_D127_e:
.L_D128:
	.uaword	.L_D128_e-.L_D128
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D129
	.uahalf	0x38
	.asciz	"putprob_fxn"
	.uahalf	0x83
	.uahalf	.L_t128_e-.L_t128
.L_t128:
	.byte	0x1
	.uaword	.L_T38
.L_t128_e:
	.uahalf	0x23
	.uahalf	.L_l128_e-.L_l128
.L_l128:
	.byte	0x1
	.uaword	0x19
.L_l128_e:
.L_D128_e:
.L_D129:
	.uaword	.L_D129_e-.L_D129
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D130
	.uahalf	0x38
	.asciz	"problem"
	.uahalf	0x63
	.uahalf	.L_t129_e-.L_t129
.L_t129:
	.byte	0x1
	.uahalf	0x14
.L_t129_e:
	.uahalf	0x23
	.uahalf	.L_l129_e-.L_l129
.L_l129:
	.byte	0x1
	.uaword	0x1a
.L_l129_e:
.L_D129_e:
.L_D130:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_probend
	.type	 p4_probend,#function
	.proc	020
p4_probend:
.L_LC142:

	.pushsection	".line"
	.uaword	291	! p4_mon.c:291
	.uahalf	0xffff
	.uaword	.L_LC142-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b21:
.L_LC143:

	.pushsection	".line"
	.uaword	292	! p4_mon.c:292
	.uahalf	0xffff
	.uaword	.L_LC143-.L_text_b
	.popsection
	call p4_menter,0
	mov %i0,%o0
.L_LC144:

	.pushsection	".line"
	.uaword	293	! p4_mon.c:293
	.uahalf	0xffff
	.uaword	.L_LC144-.L_text_b
	.popsection
	st %i1,[%i0+12]
.L_LC145:

	.pushsection	".line"
	.uaword	295	! p4_mon.c:295
	.uahalf	0xffff
	.uaword	.L_LC145-.L_text_b
	.popsection
	call p4_mexit,0
	mov %i0,%o0
.L_b21_e:
	ret
	restore
.L_f21_e:
.LLfe18:
	.size	 p4_probend,.LLfe18-p4_probend

	.pushsection	".debug_pubnames"
	.uaword	.L_P17
	.asciz	"p4_probend"
	.popsection

	.pushsection	".debug"
.L_P17:
.L_D126:
	.uaword	.L_D126_e-.L_D126
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D131
	.uahalf	0x38
	.asciz	"p4_probend"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	p4_probend
	.uahalf	0x121
	.uaword	.L_f21_e
	.uahalf	0x8041
	.uaword	.L_b21
	.uahalf	0x8051
	.uaword	.L_b21_e
.L_D126_e:
.L_D132:
	.uaword	.L_D132_e-.L_D132
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D133
	.uahalf	0x38
	.asciz	"af"
	.uahalf	0x83
	.uahalf	.L_t132_e-.L_t132
.L_t132:
	.byte	0x1
	.uaword	.L_T79
.L_t132_e:
	.uahalf	0x23
	.uahalf	.L_l132_e-.L_l132
.L_l132:
	.byte	0x1
	.uaword	0x18
.L_l132_e:
.L_D132_e:
.L_D133:
	.uaword	.L_D133_e-.L_D133
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D134
	.uahalf	0x38
	.asciz	"code"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l133_e-.L_l133
.L_l133:
	.byte	0x1
	.uaword	0x19
.L_l133_e:
.L_D133_e:
.L_D134:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_progend
	.type	 p4_progend,#function
	.proc	020
p4_progend:
.L_LC146:

	.pushsection	".line"
	.uaword	299	! p4_mon.c:299
	.uahalf	0xffff
	.uaword	.L_LC146-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b22:
.L_LC147:

	.pushsection	".line"
	.uaword	300	! p4_mon.c:300
	.uahalf	0xffff
	.uaword	.L_LC147-.L_text_b
	.popsection
	call p4_menter,0
	mov %i0,%o0
.L_LC148:

	.pushsection	".line"
	.uaword	301	! p4_mon.c:301
	.uahalf	0xffff
	.uaword	.L_LC148-.L_text_b
	.popsection
	mov 1,%o0
	st %o0,[%i0+8]
.L_LC149:

	.pushsection	".line"
	.uaword	303	! p4_mon.c:303
	.uahalf	0xffff
	.uaword	.L_LC149-.L_text_b
	.popsection
	mov %i0,%o0
	call p4_mcontinue,0
	mov 0,%o1
.L_b22_e:
	ret
	restore
.L_f22_e:
.LLfe19:
	.size	 p4_progend,.LLfe19-p4_progend

	.pushsection	".debug_pubnames"
	.uaword	.L_P18
	.asciz	"p4_progend"
	.popsection

	.pushsection	".debug"
.L_P18:
.L_D131:
	.uaword	.L_D131_e-.L_D131
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D135
	.uahalf	0x38
	.asciz	"p4_progend"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	p4_progend
	.uahalf	0x121
	.uaword	.L_f22_e
	.uahalf	0x8041
	.uaword	.L_b22
	.uahalf	0x8051
	.uaword	.L_b22_e
.L_D131_e:
.L_D136:
	.uaword	.L_D136_e-.L_D136
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D137
	.uahalf	0x38
	.asciz	"af"
	.uahalf	0x83
	.uahalf	.L_t136_e-.L_t136
.L_t136:
	.byte	0x1
	.uaword	.L_T79
.L_t136_e:
	.uahalf	0x23
	.uahalf	.L_l136_e-.L_l136
.L_l136:
	.byte	0x1
	.uaword	0x18
.L_l136_e:
.L_D136_e:
.L_D137:
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P19:
.L_D135:
	.uaword	.L_D135_e-.L_D135
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D138
	.uahalf	0x38
	.asciz	"no_procs"
	.uahalf	0x55
	.uahalf	0x7
.L_D135_e:
	.popsection

	.pushsection	".debug"
.L_P20:
.L_D138:
	.uaword	.L_D138_e-.L_D138
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D139
	.uahalf	0x38
	.asciz	"lock_model"
	.uahalf	0x55
	.uahalf	0x7
.L_D138_e:
	.popsection

	.pushsection	".debug"
.L_D139:
	.uaword	.L_D139_e-.L_D139
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D140
	.uahalf	0x38
	.asciz	"P4VOID"
.L_D139_e:
	.popsection

	.pushsection	".debug"
.L_D140:
	.uaword	.L_D140_e-.L_D140
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D141
	.uahalf	0x38
	.asciz	"p4_usc_time_t"
	.uahalf	0x55
	.uahalf	0x9
.L_D140_e:
	.popsection

	.pushsection	".debug"
.L_D141:
	.uaword	.L_D141_e-.L_D141
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D142
	.uahalf	0x38
	.asciz	"p4_lock_t"
	.uahalf	0x55
	.uahalf	0x7
.L_D141_e:
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
.L_D142:
	.uaword	.L_D142_e-.L_D142
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D143
	.uahalf	0x38
	.asciz	"p4_monitor_t"
	.uahalf	0x72
	.uaword	.L_T72
.L_D142_e:
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
.L_D143:
	.uaword	.L_D143_e-.L_D143
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D144
	.uahalf	0x38
	.asciz	"p4_getsub_monitor_t"
	.uahalf	0x72
	.uaword	.L_T75
.L_D143_e:
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
.L_D144:
	.uaword	.L_D144_e-.L_D144
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D145
	.uahalf	0x38
	.asciz	"p4_barrier_monitor_t"
	.uahalf	0x72
	.uaword	.L_T77
.L_D144_e:
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
.L_D145:
	.uaword	.L_D145_e-.L_D145
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D146
	.uahalf	0x38
	.asciz	"p4_askfor_monitor_t"
	.uahalf	0x72
	.uaword	.L_T79
.L_D145_e:
	.popsection

	.pushsection	".debug"
.L_D146:
	.uaword	.L_D146_e-.L_D146
	.align 4
.L_D146_e:
.L_D2:
	.popsection

	.pushsection	".text"
.L_text_e:
	.popsection

	.pushsection	".data"
.L_data_e:
	.popsection

	.pushsection	".rodata"
.L_rodata_e:
	.popsection

	.pushsection	".bss"
.L_bss_e:
	.popsection

	.pushsection	".line"
.L_line_last:
	.uaword	0x0
	.uahalf	0xffff
	.uaword	.L_text_e-.L_text_b
.L_line_e:
	.popsection

	.pushsection	".debug_srcinfo"
	.uaword	.L_line_last-.L_line_b
	.uaword	0xffffffff
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	0x0
	.asciz	""
	.popsection

	.pushsection	".debug_aranges"
	.uaword	.L_text_b
	.uaword	.L_text_e-.L_text_b
	.uaword	.L_data_b
	.uaword	.L_data_e-.L_data_b
	.uaword	.L_rodata_b
	.uaword	.L_rodata_e-.L_rodata_b
	.uaword	.L_bss_b
	.uaword	.L_bss_e-.L_bss_b
	.uaword	0x0
	.uaword	0x0
	.popsection
	.ident	"GCC: (GNU) 2.5.8"
