	.file	"p4.c"
gcc2_compiled.:

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
	.asciz	"p4.c"
	.uahalf	0x258
	.asciz	"GNU C 2.6.3"
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
	.L_E342 = .L_D3
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
	.L_E341 = .L_D5
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
	.L_E348 = .L_D4
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
	.L_E347 = .L_D8
.L_D8_e:
.L_D9:
	.uaword	0x4
	.popsection
.section	".text"
	.align 4
	.global p4_initenv
	.type	 p4_initenv,#function
	.proc	0102
p4_initenv:

	.pushsection	".debug_sfnames"
.L_F0:
	.asciz	"p4.c"
	.popsection
.L_LC1:

	.pushsection	".line"
.L_LE1:
	.uaword	29	! p4.c:29
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
.L_b3:
.L_LC2:

	.pushsection	".line"
	.uaword	30	! p4.c:30
	.uahalf	0xffff
	.uaword	.L_LC2-.L_text_b
	.popsection
.L_LC3:

	.pushsection	".line"
	.uaword	36	! p4.c:36
	.uahalf	0xffff
	.uaword	.L_LC3-.L_text_b
	.popsection
	call getpid,0
	nop
.L_LC4:

	.pushsection	".line"
	.uaword	38	! p4.c:38
	.uahalf	0xffff
	.uaword	.L_LC4-.L_text_b
	.popsection
	cmp %o0,0
	bne .LL4
	sethi %hi(sysglob),%o0
.L_LC5:

	.pushsection	".line"
	.uaword	39	! p4.c:39
	.uahalf	0xffff
	.uaword	.L_LC5-.L_text_b
	.popsection
.L_B3:
.L_B3_e:
	call trap,0
	mov 17,%o0
.L_LC6:

	.pushsection	".line"
	.uaword	40	! p4.c:40
	.uahalf	0xffff
	.uaword	.L_LC6-.L_text_b
	.popsection
	sll %o0,1,%l0
.L_LC7:

	.pushsection	".line"
	.uaword	41	! p4.c:41
	.uahalf	0xffff
	.uaword	.L_LC7-.L_text_b
	.popsection
	mov 16,%o0
.L_LC8:

	.pushsection	".line"
	.uaword	40	! p4.c:40
	.uahalf	0xffff
	.uaword	.L_LC8-.L_text_b
	.popsection
	sethi %hi(_end),%o1
	or %o1,%lo(_end),%o1
.L_LC9:

	.pushsection	".line"
	.uaword	41	! p4.c:41
	.uahalf	0xffff
	.uaword	.L_LC9-.L_text_b
	.popsection
	call trap,0
	add %l0,%o1,%l0
.L_LC10:

	.pushsection	".line"
	.uaword	45	! p4.c:45
	.uahalf	0xffff
	.uaword	.L_LC10-.L_text_b
	.popsection
	sub %o0,%l0,%o1
.L_LC11:

	.pushsection	".line"
	.uaword	46	! p4.c:46
	.uahalf	0xffff
	.uaword	.L_LC11-.L_text_b
	.popsection
	mov 0,%o0
	call xx_mem,0
	srl %o1,1,%o1
.L_LC12:

	.pushsection	".line"
	.uaword	48	! p4.c:48
	.uahalf	0xffff
	.uaword	.L_LC12-.L_text_b
	.popsection
	call p4_shmalloc,0
	mov 4,%o0
	sethi %hi(sysglob),%l0
	st %o0,[%l0+%lo(sysglob)]
.L_LC13:

	.pushsection	".line"
	.uaword	50	! p4.c:50
	.uahalf	0xffff
	.uaword	.L_LC13-.L_text_b
	.popsection
	call trap,0
	mov 1,%o0
	sethi %hi(no_procs),%o1
	st %o0,[%o1+%lo(no_procs)]
.L_LC14:

	.pushsection	".line"
	.uaword	51	! p4.c:51
	.uahalf	0xffff
	.uaword	.L_LC14-.L_text_b
	.popsection
	call trap,0
	mov 29,%o0
	sethi %hi(lock_model),%o2
.L_LC15:

	.pushsection	".line"
	.uaword	53	! p4.c:53
	.uahalf	0xffff
	.uaword	.L_LC15-.L_text_b
	.popsection
	ld [%l0+%lo(sysglob)],%o1
.L_LC16:

	.pushsection	".line"
	.uaword	51	! p4.c:51
	.uahalf	0xffff
	.uaword	.L_LC16-.L_text_b
	.popsection
	st %o0,[%o2+%lo(lock_model)]
.L_LC17:

	.pushsection	".line"
	.uaword	53	! p4.c:53
	.uahalf	0xffff
	.uaword	.L_LC17-.L_text_b
	.popsection
	st %g0,[%o1]
.L_LC18:

	.pushsection	".line"
	.uaword	54	! p4.c:54
	.uahalf	0xffff
	.uaword	.L_LC18-.L_text_b
	.popsection
	st %g0,[%o1+4]
.L_LC19:

	.pushsection	".line"
	.uaword	55	! p4.c:55
	.uahalf	0xffff
	.uaword	.L_LC19-.L_text_b
	.popsection
	st %g0,[%o1+8]
.L_LC20:

	.pushsection	".line"
	.uaword	56	! p4.c:56
	.uahalf	0xffff
	.uaword	.L_LC20-.L_text_b
	.popsection
	st %g0,[%o1+12]
.L_LC21:

	.pushsection	".line"
	.uaword	57	! p4.c:57
	.uahalf	0xffff
	.uaword	.L_LC21-.L_text_b
	.popsection
	st %g0,[%o1+16]
.L_LC22:

	.pushsection	".line"
	.uaword	59	! p4.c:59
	.uahalf	0xffff
	.uaword	.L_LC22-.L_text_b
	.popsection
.L_LC23:

	.pushsection	".line"
	.uaword	61	! p4.c:61
	.uahalf	0xffff
	.uaword	.L_LC23-.L_text_b
	.popsection
	call p4_util_init,0
	add %o7,(.LL5-.-4),%o7
.LL4:
.L_LC24:

	.pushsection	".line"
	.uaword	65	! p4.c:65
	.uahalf	0xffff
	.uaword	.L_LC24-.L_text_b
	.popsection
.L_B4:
	ld [%o0+%lo(sysglob)],%o1
.LL6:
	ld [%o1+16],%o0
	cmp %o0,0
	be .LL6
	sethi %hi(sysglob),%l0
.L_LC25:

	.pushsection	".line"
	.uaword	68	! p4.c:68
	.uahalf	0xffff
	.uaword	.L_LC25-.L_text_b
	.popsection
	ld [%l0+%lo(sysglob)],%o0
	ld [%o0+16],%o0
	call %o0,0
	nop
.L_LC26:

	.pushsection	".line"
	.uaword	70	! p4.c:70
	.uahalf	0xffff
	.uaword	.L_LC26-.L_text_b
	.popsection
	call cm_lock,0
	ld [%l0+%lo(sysglob)],%o0
.L_LC27:

	.pushsection	".line"
	.uaword	71	! p4.c:71
	.uahalf	0xffff
	.uaword	.L_LC27-.L_text_b
	.popsection
	ld [%l0+%lo(sysglob)],%o0
	ld [%o0+8],%o1
	add %o1,-1,%o1
	st %o1,[%o0+8]
	ld [%o0+8],%o1
.L_LC28:

	.pushsection	".line"
	.uaword	72	! p4.c:72
	.uahalf	0xffff
	.uaword	.L_LC28-.L_text_b
	.popsection
	call cm_unlock,0
	nop
.L_LC29:

	.pushsection	".line"
	.uaword	74	! p4.c:74
	.uahalf	0xffff
	.uaword	.L_LC29-.L_text_b
	.popsection
	call exit,0
	mov 0,%o0
.L_LC30:

	.pushsection	".line"
	.uaword	76	! p4.c:76
	.uahalf	0xffff
	.uaword	.L_LC30-.L_text_b
	.popsection
.L_B4_e:
.LL5:
.L_LC31:

	.pushsection	".line"
	.uaword	78	! p4.c:78
	.uahalf	0xffff
	.uaword	.L_LC31-.L_text_b
	.popsection
.L_b3_e:
	ret
	restore
.L_f3_e:
.LLfe1:
	.size	 p4_initenv,.LLfe1-p4_initenv

	.pushsection	".debug_pubnames"
	.uaword	.L_P0
	.asciz	"p4_initenv"
	.popsection

	.pushsection	".debug"
.L_P0:
.L_D7:
	.uaword	.L_D7_e-.L_D7
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D10
	.uahalf	0x38
	.asciz	"p4_initenv"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x63
	.uahalf	.L_t7_e-.L_t7
.L_t7:
	.byte	0x1
	.uahalf	0x1
.L_t7_e:
	.uahalf	0x111
	.uaword	p4_initenv
	.uahalf	0x121
	.uaword	.L_f3_e
	.uahalf	0x8041
	.uaword	.L_b3
	.uahalf	0x8051
	.uaword	.L_b3_e
.L_D7_e:
.L_D11:
	.uaword	.L_D11_e-.L_D11
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D12
	.uahalf	0x38
	.asciz	"argc"
	.uahalf	0x63
	.uahalf	.L_t11_e-.L_t11
.L_t11:
	.byte	0x1
	.uahalf	0x7
.L_t11_e:
	.uahalf	0x23
	.uahalf	.L_l11_e-.L_l11
.L_l11:
	.byte	0x1
	.uaword	0x18
.L_l11_e:
.L_D11_e:
.L_D12:
	.uaword	.L_D12_e-.L_D12
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D13
	.uahalf	0x38
	.asciz	"argv"
	.uahalf	0x63
	.uahalf	.L_t12_e-.L_t12
.L_t12:
	.byte	0x1
	.byte	0x1
	.uahalf	0x1
.L_t12_e:
	.uahalf	0x23
	.uahalf	.L_l12_e-.L_l12
.L_l12:
	.byte	0x1
	.uaword	0x19
.L_l12_e:
.L_D12_e:
.L_D13:
	.uaword	.L_D13_e-.L_D13
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D14
	.uahalf	0x38
	.asciz	"sh_mem_size"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l13_e-.L_l13
.L_l13:
.L_l13_e:
.L_D13_e:
.L_D14:
	.uaword	.L_D14_e-.L_D14
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D15
	.uahalf	0x38
	.asciz	"page_size"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l14_e-.L_l14
.L_l14:
.L_l14_e:
.L_D14_e:
.L_D15:
	.uaword	.L_D15_e-.L_D15
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D16
	.uahalf	0x38
	.asciz	"pid"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l15_e-.L_l15
.L_l15:
.L_l15_e:
.L_D15_e:
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
	.asciz	"pagesize"
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l18_e-.L_l18
.L_l18:
.L_l18_e:
.L_D18_e:
.L_D19:
	.uaword	.L_D19_e-.L_D19
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D20
	.uahalf	0x38
	.asciz	"start"
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l19_e-.L_l19
.L_l19:
	.byte	0x1
	.uaword	0x10
.L_l19_e:
.L_D19_e:
.L_D20:
	.uaword	.L_D20_e-.L_D20
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D21
	.uahalf	0x38
	.asciz	"end"
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l20_e-.L_l20
.L_l20:
.L_l20_e:
.L_D20_e:
.L_D21:
	.uaword	0x4
.L_D17:
	.uaword	.L_D17_e-.L_D17
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D22
	.uahalf	0x111
	.uaword	.L_B4
	.uahalf	0x121
	.uaword	.L_B4_e
.L_D17_e:
.L_D23:
	.uaword	0x4
.L_D22:
	.uaword	0x4
	.popsection
.section	".rodata"
	.align 8
.LLC0:
	.asciz	"Attempt to create more processors than allowed max %d\n"
.section	".text"
	.align 4
	.global p4_create
	.type	 p4_create,#function
	.proc	04
p4_create:
.L_LC32:

	.pushsection	".line"
	.uaword	81	! p4.c:81
	.uahalf	0xffff
	.uaword	.L_LC32-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b4:
.L_LC33:

	.pushsection	".line"
	.uaword	90	! p4.c:90
	.uahalf	0xffff
	.uaword	.L_LC33-.L_text_b
	.popsection
	sethi %hi(sysglob),%l0
	ld [%l0+%lo(sysglob)],%o1
	st %i0,[%o1+16]
.L_LC34:

	.pushsection	".line"
	.uaword	92	! p4.c:92
	.uahalf	0xffff
	.uaword	.L_LC34-.L_text_b
	.popsection
	ld [%o1+8],%o0
	add %o0,1,%o0
	st %o0,[%o1+8]
	ld [%o1+8],%o0
.L_LC35:

	.pushsection	".line"
	.uaword	93	! p4.c:93
	.uahalf	0xffff
	.uaword	.L_LC35-.L_text_b
	.popsection
	ld [%o1+8],%o0
	cmp %o0,31
	bg .LL11
	sethi %hi(.LLC0),%o0
.L_LC36:

	.pushsection	".line"
	.uaword	94	! p4.c:94
	.uahalf	0xffff
	.uaword	.L_LC36-.L_text_b
	.popsection
.L_B6:
.L_B6_e:
	ld [%o1+8],%o0
	st %o0,[%o1+4]
.L_LC37:

	.pushsection	".line"
	.uaword	95	! p4.c:95
	.uahalf	0xffff
	.uaword	.L_LC37-.L_text_b
	.popsection
	ld [%o1+8],%o1
	call trap,0
	mov 28,%o0
.L_LC38:

	.pushsection	".line"
	.uaword	96	! p4.c:96
	.uahalf	0xffff
	.uaword	.L_LC38-.L_text_b
	.popsection
	mov 20,%o0
	ld [%l0+%lo(sysglob)],%o1
	sethi %hi(p4_initenv),%o2
	ld [%o1+8],%o1
	call trap,0
	or %o2,%lo(p4_initenv),%o2
.L_LC39:

	.pushsection	".line"
	.uaword	97	! p4.c:97
	.uahalf	0xffff
	.uaword	.L_LC39-.L_text_b
	.popsection
	b,a .LL12
.LL11:
.L_LC40:

	.pushsection	".line"
	.uaword	98	! p4.c:98
	.uahalf	0xffff
	.uaword	.L_LC40-.L_text_b
	.popsection
	or %o0,%lo(.LLC0),%o0
	call printf,0
	mov 32,%o1
.LL12:
.L_LC41:

	.pushsection	".line"
	.uaword	102	! p4.c:102
	.uahalf	0xffff
	.uaword	.L_LC41-.L_text_b
	.popsection
.L_b4_e:
	ret
	restore
.L_f4_e:
.LLfe2:
	.size	 p4_create,.LLfe2-p4_create

	.pushsection	".debug_pubnames"
	.uaword	.L_P1
	.asciz	"p4_create"
	.popsection

	.pushsection	".debug"
.L_P1:
.L_D10:
	.uaword	.L_D10_e-.L_D10
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D24
	.uahalf	0x38
	.asciz	"p4_create"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	p4_create
	.uahalf	0x121
	.uaword	.L_f4_e
	.uahalf	0x8041
	.uaword	.L_b4
	.uahalf	0x8051
	.uaword	.L_b4_e
.L_D10_e:
.L_D25:
	.uaword	.L_D25_e-.L_D25
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D26
	.uahalf	0x38
	.asciz	"fxn"
	.uahalf	0x83
	.uahalf	.L_t25_e-.L_t25
.L_t25:
	.byte	0x1
	.uaword	.L_T38
.L_t25_e:
	.uahalf	0x23
	.uahalf	.L_l25_e-.L_l25
.L_l25:
	.byte	0x1
	.uaword	0x18
.L_l25_e:
.L_D25_e:
.L_D26:
	.uaword	.L_D26_e-.L_D26
	.uahalf	0x15
	.uahalf	0x12
	.uaword	.L_D27
	.L_T38 = .L_D26
	.uahalf	0x55
	.uahalf	0x7
.L_D26_e:
.L_D28:
	.uaword	.L_D28_e-.L_D28
	.uahalf	0x18
	.uahalf	0x12
	.uaword	.L_D29
.L_D28_e:
.L_D29:
	.uaword	0x4
.L_D27:
	.uaword	.L_D27_e-.L_D27
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D30
	.uahalf	0x111
	.uaword	.L_B6
	.uahalf	0x121
	.uaword	.L_B6_e
.L_D27_e:
.L_D31:
	.uaword	0x4
.L_D30:
	.uaword	0x4
	.popsection
.section	".rodata"
	.align 8
.LLC1:
	.asciz	"procgroup"
	.align 8
.LLC2:
	.asciz	"r"
	.align 8
.LLC3:
	.asciz	"Could not find file 'procgroup', exiting\n"
	.align 8
.LLC4:
	.asciz	"%s %d"
	.align 8
.LLC5:
	.asciz	"local"
	.align 8
.LLC6:
	.asciz	"Don't know how to handle type: %s, exiting\n"
.section	".text"
	.align 4
	.global p4_create_procgroup
	.type	 p4_create_procgroup,#function
	.proc	04
p4_create_procgroup:
.L_LC42:

	.pushsection	".line"
	.uaword	105	! p4.c:105
	.uahalf	0xffff
	.uaword	.L_LC42-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-200,%sp
	!#PROLOGUE# 1
.L_b5:
.L_LC43:

	.pushsection	".line"
	.uaword	106	! p4.c:106
	.uahalf	0xffff
	.uaword	.L_LC43-.L_text_b
	.popsection
.L_LC44:

	.pushsection	".line"
	.uaword	111	! p4.c:111
	.uahalf	0xffff
	.uaword	.L_LC44-.L_text_b
	.popsection
	call getpid,0
	nop
	cmp %o0,0
	bne .LL14
	sethi %hi(.LLC1),%o0
.L_LC45:

	.pushsection	".line"
	.uaword	113	! p4.c:113
	.uahalf	0xffff
	.uaword	.L_LC45-.L_text_b
	.popsection
	or %o0,%lo(.LLC1),%o0
	sethi %hi(.LLC2),%o1
	call fopen,0
	or %o1,%lo(.LLC2),%o1
	cmp %o0,0
	bne,a .LL15
	sethi %hi(.LLC4),%o1
.L_LC46:

	.pushsection	".line"
	.uaword	114	! p4.c:114
	.uahalf	0xffff
	.uaword	.L_LC46-.L_text_b
	.popsection
	sethi %hi(.LLC3),%o0
	call p4_dprintf,0
	or %o0,%lo(.LLC3),%o0
.L_LC47:

	.pushsection	".line"
	.uaword	115	! p4.c:115
	.uahalf	0xffff
	.uaword	.L_LC47-.L_text_b
	.popsection
	call exit,0
	mov -1,%o0
.LL15:
.L_LC48:

	.pushsection	".line"
	.uaword	118	! p4.c:118
	.uahalf	0xffff
	.uaword	.L_LC48-.L_text_b
	.popsection
	or %o1,%lo(.LLC4),%o1
	add %fp,-96,%l0
	mov %l0,%o2
	call fscanf,0
	add %fp,-97,%o3
.L_LC49:

	.pushsection	".line"
	.uaword	120	! p4.c:120
	.uahalf	0xffff
	.uaword	.L_LC49-.L_text_b
	.popsection
	sethi %hi(.LLC5),%o0
	or %o0,%lo(.LLC5),%o0
	call strcmp,0
	mov %l0,%o1
	cmp %o0,0
	bne,a .LL24
	mov 0,%l0
.L_LC50:

	.pushsection	".line"
	.uaword	121	! p4.c:121
	.uahalf	0xffff
	.uaword	.L_LC50-.L_text_b
	.popsection
	sethi %hi(.LLC6),%o0
	or %o0,%lo(.LLC6),%o0
	call p4_dprintf,0
	mov %l0,%o1
.L_LC51:

	.pushsection	".line"
	.uaword	123	! p4.c:123
	.uahalf	0xffff
	.uaword	.L_LC51-.L_text_b
	.popsection
.L_LC52:

	.pushsection	".line"
	.uaword	129	! p4.c:129
	.uahalf	0xffff
	.uaword	.L_LC52-.L_text_b
	.popsection
	mov 0,%l0
.L_LC53:

	.pushsection	".line"
	.uaword	127	! p4.c:127
	.uahalf	0xffff
	.uaword	.L_LC53-.L_text_b
	.popsection
.LL24:
	sethi %hi(sysglob),%o3
	sethi %hi(p4_create_procgroup),%o0
	ld [%o3+%lo(sysglob)],%o2
	or %o0,%lo(p4_create_procgroup),%o0
.L_LC54:

	.pushsection	".line"
	.uaword	129	! p4.c:129
	.uahalf	0xffff
	.uaword	.L_LC54-.L_text_b
	.popsection
	ldsb [%fp-97],%o1
.L_LC55:

	.pushsection	".line"
	.uaword	127	! p4.c:127
	.uahalf	0xffff
	.uaword	.L_LC55-.L_text_b
	.popsection
	st %o0,[%o2+16]
.L_LC56:

	.pushsection	".line"
	.uaword	129	! p4.c:129
	.uahalf	0xffff
	.uaword	.L_LC56-.L_text_b
	.popsection
	cmp %l0,%o1
	bge .LL14
	mov %o3,%l1
	sethi %hi(p4_initenv),%l3
	sethi %hi(.LLC0),%l2
.L_LC57:

	.pushsection	".line"
	.uaword	130	! p4.c:130
	.uahalf	0xffff
	.uaword	.L_LC57-.L_text_b
	.popsection
	ld [%l1+%lo(sysglob)],%o1
.LL26:
	ld [%o1+8],%o0
	add %o0,1,%o0
	st %o0,[%o1+8]
	ld [%o1+8],%o0
.L_LC58:

	.pushsection	".line"
	.uaword	131	! p4.c:131
	.uahalf	0xffff
	.uaword	.L_LC58-.L_text_b
	.popsection
	ld [%o1+8],%o0
	cmp %o0,31
	bg .LL21
	or %l2,%lo(.LLC0),%o0
.L_LC59:

	.pushsection	".line"
	.uaword	132	! p4.c:132
	.uahalf	0xffff
	.uaword	.L_LC59-.L_text_b
	.popsection
.L_B8:
.L_B8_e:
	ld [%o1+8],%o0
	st %o0,[%o1+4]
.L_LC60:

	.pushsection	".line"
	.uaword	133	! p4.c:133
	.uahalf	0xffff
	.uaword	.L_LC60-.L_text_b
	.popsection
	ld [%o1+8],%o1
	call trap,0
	mov 28,%o0
.L_LC61:

	.pushsection	".line"
	.uaword	134	! p4.c:134
	.uahalf	0xffff
	.uaword	.L_LC61-.L_text_b
	.popsection
	ld [%l1+%lo(sysglob)],%o1
	mov 20,%o0
	ld [%o1+8],%o1
	call trap,0
	or %l3,%lo(p4_initenv),%o2
.L_LC62:

	.pushsection	".line"
	.uaword	137	! p4.c:137
	.uahalf	0xffff
	.uaword	.L_LC62-.L_text_b
	.popsection
	ld [%l1+%lo(sysglob)],%o0
	ld [%o0+8],%o1
	call trap,0
	mov 31,%o0
.L_LC63:

	.pushsection	".line"
	.uaword	138	! p4.c:138
	.uahalf	0xffff
	.uaword	.L_LC63-.L_text_b
	.popsection
	b .LL25
	ldsb [%fp-97],%o0
.LL21:
.L_LC64:

	.pushsection	".line"
	.uaword	139	! p4.c:139
	.uahalf	0xffff
	.uaword	.L_LC64-.L_text_b
	.popsection
	call printf,0
	mov 32,%o1
.L_LC65:

	.pushsection	".line"
	.uaword	129	! p4.c:129
	.uahalf	0xffff
	.uaword	.L_LC65-.L_text_b
	.popsection
	ldsb [%fp-97],%o0
.LL25:
	add %l0,1,%l0
	cmp %l0,%o0
	bl .LL26
	ld [%l1+%lo(sysglob)],%o1
.LL14:
.L_LC66:

	.pushsection	".line"
	.uaword	147	! p4.c:147
	.uahalf	0xffff
	.uaword	.L_LC66-.L_text_b
	.popsection
.L_b5_e:
	ret
	restore
.L_f5_e:
.LLfe3:
	.size	 p4_create_procgroup,.LLfe3-p4_create_procgroup

	.pushsection	".debug_pubnames"
	.uaword	.L_P2
	.asciz	"p4_create_procgroup"
	.popsection

	.pushsection	".debug"
.L_P2:
.L_D24:
	.uaword	.L_D24_e-.L_D24
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D32
	.uahalf	0x38
	.asciz	"p4_create_procgroup"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	p4_create_procgroup
	.uahalf	0x121
	.uaword	.L_f5_e
	.uahalf	0x8041
	.uaword	.L_b5
	.uahalf	0x8051
	.uaword	.L_b5_e
.L_D24_e:
.L_D33:
	.uaword	.L_D33_e-.L_D33
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D34
	.uahalf	0x38
	.asciz	"pg_file"
	.uahalf	0x83
	.uahalf	.L_t33_e-.L_t33
.L_t33:
	.byte	0x1
	.uaword	.L_T69
.L_t33_e:
	.uahalf	0x23
	.uahalf	.L_l33_e-.L_l33
.L_l33:
	.byte	0x1
	.uaword	0x8
.L_l33_e:
.L_D33_e:
.L_D34:
	.uaword	.L_D34_e-.L_D34
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D35
	.L_T218 = .L_D34
	.uahalf	0xa3
	.uahalf	.L_s34_e-.L_s34
.L_s34:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0x4f
	.byte	0x8
	.uahalf	0x55
	.uahalf	0x1
.L_s34_e:
.L_D34_e:
.L_D35:
	.uaword	.L_D35_e-.L_D35
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D36
	.uahalf	0x38
	.asciz	"type"
	.uahalf	0x72
	.uaword	.L_T218
	.uahalf	0x23
	.uahalf	.L_l35_e-.L_l35
.L_l35:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffa0
	.byte	0x7
.L_l35_e:
.L_D35_e:
.L_D36:
	.uaword	.L_D36_e-.L_D36
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D37
	.uahalf	0x38
	.asciz	"no_slaves"
	.uahalf	0x55
	.uahalf	0x1
	.uahalf	0x23
	.uahalf	.L_l36_e-.L_l36
.L_l36:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffff9f
	.byte	0x7
.L_l36_e:
.L_D36_e:
.L_D37:
	.uaword	.L_D37_e-.L_D37
	.uahalf	0xc
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
	.uaword	0x10
.L_l37_e:
.L_D37_e:
.L_D38:
	.uaword	.L_D38_e-.L_D38
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D39
	.uahalf	0x111
	.uaword	.L_B8
	.uahalf	0x121
	.uaword	.L_B8_e
.L_D38_e:
.L_D40:
	.uaword	0x4
.L_D39:
	.uaword	0x4
.L_D32:
	.uaword	.L_D32_e-.L_D32
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D41
	.L_T69 = .L_D32
	.uahalf	0xb6
	.uaword	0x10
.L_D32_e:
.L_D42:
	.uaword	.L_D42_e-.L_D42
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D43
	.uahalf	0x38
	.asciz	"_cnt"
	.uahalf	0x142
	.uaword	.L_T69
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l42_e-.L_l42
.L_l42:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l42_e:
.L_D42_e:
.L_D43:
	.uaword	.L_D43_e-.L_D43
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D44
	.uahalf	0x38
	.asciz	"_ptr"
	.uahalf	0x142
	.uaword	.L_T69
	.uahalf	0x63
	.uahalf	.L_t43_e-.L_t43
.L_t43:
	.byte	0x1
	.uahalf	0x3
.L_t43_e:
	.uahalf	0x23
	.uahalf	.L_l43_e-.L_l43
.L_l43:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l43_e:
.L_D43_e:
.L_D44:
	.uaword	.L_D44_e-.L_D44
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D45
	.uahalf	0x38
	.asciz	"_base"
	.uahalf	0x142
	.uaword	.L_T69
	.uahalf	0x63
	.uahalf	.L_t44_e-.L_t44
.L_t44:
	.byte	0x1
	.uahalf	0x3
.L_t44_e:
	.uahalf	0x23
	.uahalf	.L_l44_e-.L_l44
.L_l44:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l44_e:
.L_D44_e:
.L_D45:
	.uaword	.L_D45_e-.L_D45
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D46
	.uahalf	0x38
	.asciz	"_flag"
	.uahalf	0x142
	.uaword	.L_T69
	.uahalf	0x55
	.uahalf	0x3
	.uahalf	0x23
	.uahalf	.L_l45_e-.L_l45
.L_l45:
	.byte	0x4
	.uaword	0xc
	.byte	0x7
.L_l45_e:
.L_D45_e:
.L_D46:
	.uaword	.L_D46_e-.L_D46
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D47
	.uahalf	0x38
	.asciz	"_file"
	.uahalf	0x142
	.uaword	.L_T69
	.uahalf	0x55
	.uahalf	0x3
	.uahalf	0x23
	.uahalf	.L_l46_e-.L_l46
.L_l46:
	.byte	0x4
	.uaword	0xd
	.byte	0x7
.L_l46_e:
.L_D46_e:
.L_D47:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_wait_for_end
	.type	 p4_wait_for_end,#function
	.proc	020
p4_wait_for_end:
.L_LC67:

	.pushsection	".line"
	.uaword	150	! p4.c:150
	.uahalf	0xffff
	.uaword	.L_LC67-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b6:
.L_LC68:

	.pushsection	".line"
	.uaword	151	! p4.c:151
	.uahalf	0xffff
	.uaword	.L_LC68-.L_text_b
	.popsection
	call getpid,0
	nop
.L_LC69:

	.pushsection	".line"
	.uaword	153	! p4.c:153
	.uahalf	0xffff
	.uaword	.L_LC69-.L_text_b
	.popsection
	sethi %hi(sysglob),%o0
	ld [%o0+%lo(sysglob)],%o1
.LL28:
	ld [%o1+8],%o0
	cmp %o0,0
	bne .LL28
	nop
.L_LC70:

	.pushsection	".line"
	.uaword	155	! p4.c:155
	.uahalf	0xffff
	.uaword	.L_LC70-.L_text_b
	.popsection
	call trap,0
	mov 4,%o0
.L_LC71:

	.pushsection	".line"
	.uaword	157	! p4.c:157
	.uahalf	0xffff
	.uaword	.L_LC71-.L_text_b
	.popsection
.L_b6_e:
	ret
	restore
.L_f6_e:
.LLfe4:
	.size	 p4_wait_for_end,.LLfe4-p4_wait_for_end

	.pushsection	".debug_pubnames"
	.uaword	.L_P3
	.asciz	"p4_wait_for_end"
	.popsection

	.pushsection	".debug"
.L_P3:
.L_D41:
	.uaword	.L_D41_e-.L_D41
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D48
	.uahalf	0x38
	.asciz	"p4_wait_for_end"
	.uahalf	0x111
	.uaword	p4_wait_for_end
	.uahalf	0x121
	.uaword	.L_f6_e
	.uahalf	0x8041
	.uaword	.L_b6
	.uahalf	0x8051
	.uaword	.L_b6_e
.L_D41_e:
.L_D49:
	.uaword	.L_D49_e-.L_D49
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D50
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l49_e-.L_l49
.L_l49:
.L_l49_e:
.L_D49_e:
.L_D50:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_get_my_id
	.type	 p4_get_my_id,#function
	.proc	04
p4_get_my_id:
.L_LC72:

	.pushsection	".line"
	.uaword	160	! p4.c:160
	.uahalf	0xffff
	.uaword	.L_LC72-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b7:
.L_LC73:

	.pushsection	".line"
	.uaword	162	! p4.c:162
	.uahalf	0xffff
	.uaword	.L_LC73-.L_text_b
	.popsection
	call getpid,0
	nop
	mov %o0,%i0
.L_LC74:

	.pushsection	".line"
	.uaword	164	! p4.c:164
	.uahalf	0xffff
	.uaword	.L_LC74-.L_text_b
	.popsection
.L_b7_e:
	ret
	restore
.L_f7_e:
.LLfe5:
	.size	 p4_get_my_id,.LLfe5-p4_get_my_id

	.pushsection	".debug_pubnames"
	.uaword	.L_P4
	.asciz	"p4_get_my_id"
	.popsection

	.pushsection	".debug"
.L_P4:
.L_D48:
	.uaword	.L_D48_e-.L_D48
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D51
	.uahalf	0x38
	.asciz	"p4_get_my_id"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	p4_get_my_id
	.uahalf	0x121
	.uaword	.L_f7_e
	.uahalf	0x8041
	.uaword	.L_b7
	.uahalf	0x8051
	.uaword	.L_b7_e
.L_D48_e:
.L_D52:
	.uaword	0x4
	.popsection
	.global .div
	.align 4
	.global p4_clock
	.type	 p4_clock,#function
	.proc	04
p4_clock:
.L_LC75:

	.pushsection	".line"
	.uaword	168	! p4.c:168
	.uahalf	0xffff
	.uaword	.L_LC75-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b8:
.L_LC76:

	.pushsection	".line"
	.uaword	170	! p4.c:170
	.uahalf	0xffff
	.uaword	.L_LC76-.L_text_b
	.popsection
	call trap,0
	mov 24,%o0
	sethi %hi(100000),%o1
	call .div,0
	or %o1,%lo(100000),%o1
	mov %o0,%i0
.L_LC77:

	.pushsection	".line"
	.uaword	172	! p4.c:172
	.uahalf	0xffff
	.uaword	.L_LC77-.L_text_b
	.popsection
.L_b8_e:
	ret
	restore
.L_f8_e:
.LLfe6:
	.size	 p4_clock,.LLfe6-p4_clock

	.pushsection	".debug_pubnames"
	.uaword	.L_P5
	.asciz	"p4_clock"
	.popsection

	.pushsection	".debug"
.L_P5:
.L_D51:
	.uaword	.L_D51_e-.L_D51
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D53
	.uahalf	0x38
	.asciz	"p4_clock"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	p4_clock
	.uahalf	0x121
	.uaword	.L_f8_e
	.uahalf	0x8041
	.uaword	.L_b8
	.uahalf	0x8051
	.uaword	.L_b8_e
.L_D51_e:
.L_D54:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_ustimer
	.type	 p4_ustimer,#function
	.proc	016
p4_ustimer:
.L_LC78:

	.pushsection	".line"
	.uaword	174	! p4.c:174
	.uahalf	0xffff
	.uaword	.L_LC78-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b9:
.L_LC79:

	.pushsection	".line"
	.uaword	176	! p4.c:176
	.uahalf	0xffff
	.uaword	.L_LC79-.L_text_b
	.popsection
	call trap,0
	mov 24,%o0
	call .div,0
	mov 100,%o1
	mov %o0,%i0
.L_LC80:

	.pushsection	".line"
	.uaword	178	! p4.c:178
	.uahalf	0xffff
	.uaword	.L_LC80-.L_text_b
	.popsection
.L_b9_e:
	ret
	restore
.L_f9_e:
.LLfe7:
	.size	 p4_ustimer,.LLfe7-p4_ustimer

	.pushsection	".debug_pubnames"
	.uaword	.L_P6
	.asciz	"p4_ustimer"
	.popsection

	.pushsection	".debug"
.L_P6:
.L_D53:
	.uaword	.L_D53_e-.L_D53
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D55
	.uahalf	0x38
	.asciz	"p4_ustimer"
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x111
	.uaword	p4_ustimer
	.uahalf	0x121
	.uaword	.L_f9_e
	.uahalf	0x8041
	.uaword	.L_b9
	.uahalf	0x8051
	.uaword	.L_b9_e
.L_D53_e:
.L_D56:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_shmalloc
	.type	 p4_shmalloc,#function
	.proc	0102
p4_shmalloc:
.L_LC81:

	.pushsection	".line"
	.uaword	181	! p4.c:181
	.uahalf	0xffff
	.uaword	.L_LC81-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b10:
.L_LC82:

	.pushsection	".line"
	.uaword	183	! p4.c:183
	.uahalf	0xffff
	.uaword	.L_LC82-.L_text_b
	.popsection
	mov 1,%o0
	call xx_mem,0
	mov %i0,%o1
	mov %o0,%i0
.L_b10_e:
	ret
	restore
.L_f10_e:
.LLfe8:
	.size	 p4_shmalloc,.LLfe8-p4_shmalloc

	.pushsection	".debug_pubnames"
	.uaword	.L_P7
	.asciz	"p4_shmalloc"
	.popsection

	.pushsection	".debug"
.L_P7:
.L_D55:
	.uaword	.L_D55_e-.L_D55
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D57
	.uahalf	0x38
	.asciz	"p4_shmalloc"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x63
	.uahalf	.L_t55_e-.L_t55
.L_t55:
	.byte	0x1
	.uahalf	0x1
.L_t55_e:
	.uahalf	0x111
	.uaword	p4_shmalloc
	.uahalf	0x121
	.uaword	.L_f10_e
	.uahalf	0x8041
	.uaword	.L_b10
	.uahalf	0x8051
	.uaword	.L_b10_e
.L_D55_e:
.L_D58:
	.uaword	.L_D58_e-.L_D58
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D59
	.uahalf	0x38
	.asciz	"size"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l58_e-.L_l58
.L_l58:
	.byte	0x1
	.uaword	0x18
.L_l58_e:
.L_D58_e:
.L_D59:
	.uaword	0x4
	.popsection
	.align 4
	.global p4_shfree
	.type	 p4_shfree,#function
	.proc	020
p4_shfree:
.L_LC83:

	.pushsection	".line"
	.uaword	187	! p4.c:187
	.uahalf	0xffff
	.uaword	.L_LC83-.L_text_b
	.popsection
	!#PROLOGUE# 0
	!#PROLOGUE# 1
.L_b11:
.L_LC84:

	.pushsection	".line"
	.uaword	189	! p4.c:189
	.uahalf	0xffff
	.uaword	.L_LC84-.L_text_b
	.popsection
.L_b11_e:
	retl
	nop
.L_f11_e:
.LLfe9:
	.size	 p4_shfree,.LLfe9-p4_shfree

	.pushsection	".debug_pubnames"
	.uaword	.L_P8
	.asciz	"p4_shfree"
	.popsection

	.pushsection	".debug"
.L_P8:
.L_D57:
	.uaword	.L_D57_e-.L_D57
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D60
	.uahalf	0x38
	.asciz	"p4_shfree"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	p4_shfree
	.uahalf	0x121
	.uaword	.L_f11_e
	.uahalf	0x8041
	.uaword	.L_b11
	.uahalf	0x8051
	.uaword	.L_b11_e
.L_D57_e:
.L_D61:
	.uaword	.L_D61_e-.L_D61
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D62
	.uahalf	0x38
	.asciz	"mem"
	.uahalf	0x63
	.uahalf	.L_t61_e-.L_t61
.L_t61:
	.byte	0x1
	.uahalf	0x1
.L_t61_e:
	.uahalf	0x23
	.uahalf	.L_l61_e-.L_l61
.L_l61:
	.byte	0x1
	.uaword	0x18
.L_l61_e:
.L_D61_e:
.L_D62:
	.uaword	0x4
	.popsection
	.align 4
	.global dump_registers
	.type	 dump_registers,#function
	.proc	020
dump_registers:
.L_LC85:

	.pushsection	".line"
	.uaword	195	! p4.c:195
	.uahalf	0xffff
	.uaword	.L_LC85-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b12:
.L_LC86:

	.pushsection	".line"
	.uaword	196	! p4.c:196
	.uahalf	0xffff
	.uaword	.L_LC86-.L_text_b
	.popsection
	call trap,0
	mov 25,%o0
.L_LC87:

	.pushsection	".line"
	.uaword	197	! p4.c:197
	.uahalf	0xffff
	.uaword	.L_LC87-.L_text_b
	.popsection
.L_b12_e:
	ret
	restore
.L_f12_e:
.LLfe10:
	.size	 dump_registers,.LLfe10-dump_registers

	.pushsection	".debug_pubnames"
	.uaword	.L_P9
	.asciz	"dump_registers"
	.popsection

	.pushsection	".debug"
.L_P9:
.L_D60:
	.uaword	.L_D60_e-.L_D60
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D63
	.uahalf	0x38
	.asciz	"dump_registers"
	.uahalf	0x111
	.uaword	dump_registers
	.uahalf	0x121
	.uaword	.L_f12_e
	.uahalf	0x8041
	.uaword	.L_b12
	.uahalf	0x8051
	.uaword	.L_b12_e
.L_D60_e:
.L_D64:
	.uaword	0x4
	.popsection
		.common	no_procs,4,4
		.common	lock_model,4,4
		.common	sysglob,4,4

	.pushsection	".debug"
.L_D63:
	.uaword	.L_D63_e-.L_D63
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D65
	.uahalf	0x38
	.asciz	"size_t"
	.uahalf	0x55
	.uahalf	0x9
.L_D63_e:
	.popsection

	.pushsection	".debug"
.L_D65:
	.uaword	.L_D65_e-.L_D65
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D66
	.uahalf	0x38
	.asciz	"fpos_t"
	.uahalf	0x55
	.uahalf	0x7
.L_D65_e:
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
.L_D66:
	.uaword	.L_D66_e-.L_D66
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D67
	.uahalf	0x38
	.asciz	"FILE"
	.uahalf	0x72
	.uaword	.L_T69
.L_D66_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P10
	.asciz	"no_procs"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	no_procs
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P10:
.L_D67:
	.uaword	.L_D67_e-.L_D67
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D68
	.uahalf	0x38
	.asciz	"no_procs"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l67_e-.L_l67
.L_l67:
	.byte	0x3
	.uaword	no_procs
.L_l67_e:
.L_D67_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P11
	.asciz	"lock_model"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	lock_model
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P11:
.L_D68:
	.uaword	.L_D68_e-.L_D68
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D69
	.uahalf	0x38
	.asciz	"lock_model"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l68_e-.L_l68
.L_l68:
	.byte	0x3
	.uaword	lock_model
.L_l68_e:
.L_D68_e:
	.popsection

	.pushsection	".debug"
.L_D69:
	.uaword	.L_D69_e-.L_D69
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D70
	.uahalf	0x38
	.asciz	"P4VOID"
.L_D69_e:
	.popsection

	.pushsection	".debug"
.L_D70:
	.uaword	.L_D70_e-.L_D70
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D71
	.uahalf	0x38
	.asciz	"p4_usc_time_t"
	.uahalf	0x55
	.uahalf	0x9
.L_D70_e:
	.popsection

	.pushsection	".debug"
.L_D71:
	.uaword	.L_D71_e-.L_D71
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D72
	.uahalf	0x38
	.asciz	"p4_lock_t"
	.uahalf	0x55
	.uahalf	0x7
.L_D71_e:
	.popsection

	.pushsection	".debug"
.L_D72:
	.uaword	.L_D72_e-.L_D72
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D73
	.L_T141 = .L_D72
	.uahalf	0x38
	.asciz	"p4_mon_queue"
	.uahalf	0xb6
	.uaword	0x40
.L_D72_e:
.L_D74:
	.uaword	.L_D74_e-.L_D74
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D75
	.uahalf	0x38
	.asciz	"count"
	.uahalf	0x142
	.uaword	.L_T141
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l74_e-.L_l74
.L_l74:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l74_e:
.L_D74_e:
.L_D75:
	.uaword	.L_D75_e-.L_D75
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D76
	.uahalf	0x38
	.asciz	"delay_lock"
	.uahalf	0x142
	.uaword	.L_T141
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l75_e-.L_l75
.L_l75:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l75_e:
.L_D75_e:
.L_D76:
	.uaword	.L_D76_e-.L_D76
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D77
	.uahalf	0x38
	.asciz	"pad"
	.uahalf	0x142
	.uaword	.L_T141
	.uahalf	0x72
	.uaword	.L_T143
	.uahalf	0x23
	.uahalf	.L_l76_e-.L_l76
.L_l76:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l76_e:
.L_D76_e:
.L_D77:
	.uaword	0x4
.L_D73:
	.uaword	.L_D73_e-.L_D73
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D78
	.L_T143 = .L_D73
	.uahalf	0xa3
	.uahalf	.L_s73_e-.L_s73
.L_s73:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0xd
	.byte	0x8
	.uahalf	0x55
	.uahalf	0x7
.L_s73_e:
.L_D73_e:
	.popsection

	.pushsection	".debug"
.L_D78:
	.uaword	.L_D78_e-.L_D78
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D79
	.L_T144 = .L_D78
	.uahalf	0x38
	.asciz	"p4_monitor"
	.uahalf	0xb6
	.uaword	0x8
.L_D78_e:
.L_D80:
	.uaword	.L_D80_e-.L_D80
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D81
	.uahalf	0x38
	.asciz	"mon_lock"
	.uahalf	0x142
	.uaword	.L_T144
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l80_e-.L_l80
.L_l80:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l80_e:
.L_D80_e:
.L_D81:
	.uaword	.L_D81_e-.L_D81
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D82
	.uahalf	0x38
	.asciz	"qs"
	.uahalf	0x142
	.uaword	.L_T144
	.uahalf	0x83
	.uahalf	.L_t81_e-.L_t81
.L_t81:
	.byte	0x1
	.uaword	.L_T141
.L_t81_e:
	.uahalf	0x23
	.uahalf	.L_l81_e-.L_l81
.L_l81:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l81_e:
.L_D81_e:
.L_D82:
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_D79:
	.uaword	.L_D79_e-.L_D79
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D83
	.uahalf	0x38
	.asciz	"p4_monitor_t"
	.uahalf	0x72
	.uaword	.L_T144
.L_D79_e:
	.popsection

	.pushsection	".debug"
.L_D83:
	.uaword	.L_D83_e-.L_D83
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D84
	.L_T147 = .L_D83
	.uahalf	0x38
	.asciz	"p4_getsub_monitor"
	.uahalf	0xb6
	.uaword	0xc
.L_D83_e:
.L_D85:
	.uaword	.L_D85_e-.L_D85
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D86
	.uahalf	0x38
	.asciz	"m"
	.uahalf	0x142
	.uaword	.L_T147
	.uahalf	0x72
	.uaword	.L_T144
	.uahalf	0x23
	.uahalf	.L_l85_e-.L_l85
.L_l85:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l85_e:
.L_D85_e:
.L_D86:
	.uaword	.L_D86_e-.L_D86
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D87
	.uahalf	0x38
	.asciz	"sub"
	.uahalf	0x142
	.uaword	.L_T147
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l86_e-.L_l86
.L_l86:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l86_e:
.L_D86_e:
.L_D87:
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_D84:
	.uaword	.L_D84_e-.L_D84
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D88
	.uahalf	0x38
	.asciz	"p4_getsub_monitor_t"
	.uahalf	0x72
	.uaword	.L_T147
.L_D84_e:
	.popsection

	.pushsection	".debug"
.L_D88:
	.uaword	.L_D88_e-.L_D88
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D89
	.L_T149 = .L_D88
	.uahalf	0x38
	.asciz	"p4_barrier_monitor"
	.uahalf	0xb6
	.uaword	0xc
.L_D88_e:
.L_D90:
	.uaword	.L_D90_e-.L_D90
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D91
	.uahalf	0x38
	.asciz	"count"
	.uahalf	0x142
	.uaword	.L_T149
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l90_e-.L_l90
.L_l90:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l90_e:
.L_D90_e:
.L_D91:
	.uaword	.L_D91_e-.L_D91
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D92
	.uahalf	0x38
	.asciz	"m"
	.uahalf	0x142
	.uaword	.L_T149
	.uahalf	0x72
	.uaword	.L_T144
	.uahalf	0x23
	.uahalf	.L_l91_e-.L_l91
.L_l91:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l91_e:
.L_D91_e:
.L_D92:
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_D89:
	.uaword	.L_D89_e-.L_D89
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D93
	.uahalf	0x38
	.asciz	"p4_barrier_monitor_t"
	.uahalf	0x72
	.uaword	.L_T149
.L_D89_e:
	.popsection

	.pushsection	".debug"
.L_D93:
	.uaword	.L_D93_e-.L_D93
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D94
	.L_T151 = .L_D93
	.uahalf	0x38
	.asciz	"p4_askfor_monitor"
	.uahalf	0xb6
	.uaword	0x10
.L_D93_e:
.L_D95:
	.uaword	.L_D95_e-.L_D95
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D96
	.uahalf	0x38
	.asciz	"m"
	.uahalf	0x142
	.uaword	.L_T151
	.uahalf	0x72
	.uaword	.L_T144
	.uahalf	0x23
	.uahalf	.L_l95_e-.L_l95
.L_l95:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l95_e:
.L_D95_e:
.L_D96:
	.uaword	.L_D96_e-.L_D96
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D97
	.uahalf	0x38
	.asciz	"pgdone"
	.uahalf	0x142
	.uaword	.L_T151
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l96_e-.L_l96
.L_l96:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l96_e:
.L_D96_e:
.L_D97:
	.uaword	.L_D97_e-.L_D97
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D98
	.uahalf	0x38
	.asciz	"pbdone"
	.uahalf	0x142
	.uaword	.L_T151
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l97_e-.L_l97
.L_l97:
	.byte	0x4
	.uaword	0xc
	.byte	0x7
.L_l97_e:
.L_D97_e:
.L_D98:
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_D94:
	.uaword	.L_D94_e-.L_D94
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D99
	.uahalf	0x38
	.asciz	"p4_askfor_monitor_t"
	.uahalf	0x72
	.uaword	.L_T151
.L_D94_e:
	.popsection

	.pushsection	".debug"
.L_P12:
.L_D99:
	.uaword	.L_D99_e-.L_D99
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D100
	.uahalf	0x38
	.asciz	"_end"
.L_D99_e:
	.popsection

	.pushsection	".debug"
.L_D100:
	.uaword	.L_D100_e-.L_D100
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D101
	.L_T195 = .L_D100
	.uahalf	0x38
	.asciz	"_sysglob"
	.uahalf	0xb6
	.uaword	0x14
.L_D100_e:
.L_D102:
	.uaword	.L_D102_e-.L_D102
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D103
	.uahalf	0x38
	.asciz	"end_lock"
	.uahalf	0x142
	.uaword	.L_T195
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l102_e-.L_l102
.L_l102:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l102_e:
.L_D102_e:
.L_D103:
	.uaword	.L_D103_e-.L_D103
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D104
	.uahalf	0x38
	.asciz	"max_proc"
	.uahalf	0x142
	.uaword	.L_T195
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l103_e-.L_l103
.L_l103:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l103_e:
.L_D103_e:
.L_D104:
	.uaword	.L_D104_e-.L_D104
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D105
	.uahalf	0x38
	.asciz	"proc_started"
	.uahalf	0x142
	.uaword	.L_T195
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l104_e-.L_l104
.L_l104:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l104_e:
.L_D104_e:
.L_D105:
	.uaword	.L_D105_e-.L_D105
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D106
	.uahalf	0x38
	.asciz	"stat_started"
	.uahalf	0x142
	.uaword	.L_T195
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l105_e-.L_l105
.L_l105:
	.byte	0x4
	.uaword	0xc
	.byte	0x7
.L_l105_e:
.L_D105_e:
.L_D106:
	.uaword	.L_D106_e-.L_D106
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D107
	.uahalf	0x38
	.asciz	"slave_fxn"
	.uahalf	0x142
	.uaword	.L_T195
	.uahalf	0x83
	.uahalf	.L_t106_e-.L_t106
.L_t106:
	.byte	0x1
	.uaword	.L_T38
.L_t106_e:
	.uahalf	0x23
	.uahalf	.L_l106_e-.L_l106
.L_l106:
	.byte	0x4
	.uaword	0x10
	.byte	0x7
.L_l106_e:
.L_D106_e:
.L_D107:
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_D101:
	.uaword	.L_D101_e-.L_D101
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D108
	.uahalf	0x38
	.asciz	"sysglob_t"
	.uahalf	0x72
	.uaword	.L_T195
.L_D101_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P13
	.asciz	"sysglob"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	sysglob
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P13:
.L_D108:
	.uaword	.L_D108_e-.L_D108
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D109
	.uahalf	0x38
	.asciz	"sysglob"
	.uahalf	0x83
	.uahalf	.L_t108_e-.L_t108
.L_t108:
	.byte	0x1
	.uaword	.L_T195
.L_t108_e:
	.uahalf	0x23
	.uahalf	.L_l108_e-.L_l108
.L_l108:
	.byte	0x3
	.uaword	sysglob
.L_l108_e:
.L_D108_e:
	.popsection

	.pushsection	".debug"
.L_D109:
	.uaword	.L_D109_e-.L_D109
	.align 4
.L_D109_e:
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
	.ident	"GCC: (GNU) 2.6.3"
