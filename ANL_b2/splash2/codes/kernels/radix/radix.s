	.file	"radix.c"
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
	.asciz	"/usr/dit/matsbror/research/CacheMire-2/appl/ANL_benchmarks/splash2/codes/kernels/radix/"
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
	.asciz	"radix.c"
	.uahalf	0x258
	.asciz	"GNU C 2.7.0"
	.uahalf	0x136
	.uaword	0x1
	.uahalf	0x111
	.uaword	.L_text_b
	.uahalf	0x121
	.uaword	.L_text_e
	.uahalf	0x106
	.uaword	.L_line_b
	.uahalf	0x1b8
	.asciz	"/usr/dit/matsbror/research/CacheMire-2/appl/ANL_benchmarks/splash2/codes/kernels/radix"
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
	.asciz	"ANL_PS"
	.uahalf	0x208
	.asciz	""
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.L_E440 = .L_D3
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
	.L_E439 = .L_D5
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
	.asciz	"ANL_PI"
	.uahalf	0x208
	.asciz	""
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.L_E446 = .L_D4
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
	.L_E445 = .L_D8
.L_D8_e:
.L_D9:
	.uaword	0x4
	.popsection
.section	".text"
	.align 4
	.global ANL_delay
	.type	 ANL_delay,#function
	.proc	020
ANL_delay:

	.pushsection	".debug_sfnames"
.L_F0:
	.asciz	"radix.C"
	.popsection
.L_LC1:

	.pushsection	".line"
.L_LE1:
	.uaword	56	! radix.C:56
	.uahalf	0xffff
	.uaword	.L_LC1-.L_text_b
	.popsection

	.pushsection	".debug_srcinfo"
	.uaword	.L_LE1-.L_line_b
	.uaword	.L_F0-.L_sfnames_b
	.popsection
	!#PROLOGUE# 0
	!#PROLOGUE# 1
.L_b3:
.L_LC2:

	.pushsection	".line"
	.uaword	56	! radix.C:56
	.uahalf	0xffff
	.uaword	.L_LC2-.L_text_b
	.popsection
	mov 0,%g2
	cmp %g2,%o0
	bge .LL5
	add %g2,1,%g2
.LL9:
	cmp %g2,%o0
	bl .LL9
	add %g2,1,%g2
.LL5:
.L_b3_e:
	retl
	nop
.L_f3_e:
.LLfe1:
	.size	 ANL_delay,.LLfe1-ANL_delay

	.pushsection	".debug_pubnames"
	.uaword	.L_P0
	.asciz	"ANL_delay"
	.popsection

	.pushsection	".debug"
.L_P0:
.L_D7:
	.uaword	.L_D7_e-.L_D7
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D10
	.uahalf	0x38
	.asciz	"ANL_delay"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	ANL_delay
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
	.asciz	"n"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l11_e-.L_l11
.L_l11:
	.byte	0x1
	.uaword	0x8
.L_l11_e:
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
	.uahalf	0x23
	.uahalf	.L_l12_e-.L_l12
.L_l12:
	.byte	0x1
	.uaword	0x2
.L_l12_e:
.L_D12_e:
.L_D13:
	.uaword	0x4
	.popsection
	.align 4
	.global backoff
	.type	 backoff,#function
	.proc	020
backoff:
.L_LC3:

	.pushsection	".line"
	.uaword	56	! radix.C:56
	.uahalf	0xffff
	.uaword	.L_LC3-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b4:
.L_LC4:

	.pushsection	".line"
	.uaword	56	! radix.C:56
	.uahalf	0xffff
	.uaword	.L_LC4-.L_text_b
	.popsection
	sethi %hi(lock_model),%o1
	ld [%o1+%lo(lock_model)],%o0
	cmp %o0,1
	bg .LL11
	mov 1,%l0
	ld [%i0],%o0
	cmp %o0,0
	be .LL11
	mov %o1,%l1
	ld [%l1+%lo(lock_model)],%o0
.LL18:
	cmp %o0,1
	bne .LL12
	nop
	call ANL_delay,0
	mov %l0,%o0
	sll %l0,1,%l0
	cmp %l0,100
	bg,a .LL12
	mov 100,%l0
.LL12:
	ld [%i0],%o0
	cmp %o0,0
	bne .LL18
	ld [%l1+%lo(lock_model)],%o0
.LL11:
.L_b4_e:
	ret
	restore
.L_f4_e:
.LLfe2:
	.size	 backoff,.LLfe2-backoff

	.pushsection	".debug_pubnames"
	.uaword	.L_P1
	.asciz	"backoff"
	.popsection

	.pushsection	".debug"
.L_P1:
.L_D10:
	.uaword	.L_D10_e-.L_D10
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D14
	.uahalf	0x38
	.asciz	"backoff"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	backoff
	.uahalf	0x121
	.uaword	.L_f4_e
	.uahalf	0x8041
	.uaword	.L_b4
	.uahalf	0x8051
	.uaword	.L_b4_e
.L_D10_e:
.L_D15:
	.uaword	.L_D15_e-.L_D15
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D16
	.uahalf	0x38
	.asciz	"l"
	.uahalf	0x63
	.uahalf	.L_t15_e-.L_t15
.L_t15:
	.byte	0x1
	.uahalf	0x7
.L_t15_e:
	.uahalf	0x23
	.uahalf	.L_l15_e-.L_l15
.L_l15:
	.byte	0x1
	.uaword	0x18
.L_l15_e:
.L_D15_e:
.L_D16:
	.uaword	.L_D16_e-.L_D16
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D17
	.uahalf	0x38
	.asciz	"d"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l16_e-.L_l16
.L_l16:
	.byte	0x1
	.uaword	0x10
.L_l16_e:
.L_D16_e:
.L_D17:
	.uaword	0x4
	.popsection
	.align 4
	.global ZZZ_slave
	.type	 ZZZ_slave,#function
	.proc	04
ZZZ_slave:
.L_LC5:

	.pushsection	".line"
	.uaword	56	! radix.C:56
	.uahalf	0xffff
	.uaword	.L_LC5-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-120,%sp
	!#PROLOGUE# 1
.L_b5:
.L_LC6:

	.pushsection	".line"
	.uaword	56	! radix.C:56
	.uahalf	0xffff
	.uaword	.L_LC6-.L_text_b
	.popsection
	call getpid,0
	nop
	st %o0,[%fp-20]
	sethi %hi(ANLglob),%l0
.L_B5:
.L_B5_e:
	ld [%l0+%lo(ANLglob)],%o0
.LL23:
	ld [%o0+12],%o0
	call %o0,0
	nop
	call cm_lock,0
	ld [%l0+%lo(ANLglob)],%o0
	ld [%l0+%lo(ANLglob)],%o0
	ld [%o0+8],%o1
	add %o1,-1,%o1
	st %o1,[%o0+8]
	ld [%o0+8],%o1
	call cm_unlock,0
	nop
	call CMexit,0
	mov 0,%o0
	b .LL23
	ld [%l0+%lo(ANLglob)],%o0
.L_b5_e:
	ret
	restore
.L_f5_e:
.LLfe3:
	.size	 ZZZ_slave,.LLfe3-ZZZ_slave

	.pushsection	".debug_pubnames"
	.uaword	.L_P2
	.asciz	"ZZZ_slave"
	.popsection

	.pushsection	".debug"
.L_P2:
.L_D14:
	.uaword	.L_D14_e-.L_D14
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D18
	.uahalf	0x38
	.asciz	"ZZZ_slave"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	ZZZ_slave
	.uahalf	0x121
	.uaword	.L_f5_e
	.uahalf	0x8041
	.uaword	.L_b5
	.uahalf	0x8051
	.uaword	.L_b5_e
.L_D14_e:
.L_D19:
	.uaword	.L_D19_e-.L_D19
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D20
	.uahalf	0x38
	.asciz	"pid"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l19_e-.L_l19
.L_l19:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffec
	.byte	0x7
.L_l19_e:
.L_D19_e:
.L_D20:
	.uaword	.L_D20_e-.L_D20
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D21
	.uahalf	0x111
	.uaword	.L_B5
	.uahalf	0x121
	.uaword	.L_B5_e
.L_D20_e:
.L_D22:
	.uaword	0x4
.L_D21:
	.uaword	0x4
	.popsection
	.global number_of_processors
.section	".data"
	.align 4
	.type	 number_of_processors,#object
	.size	 number_of_processors,4
number_of_processors:
	.word	1
	.global radix
	.align 4
	.type	 radix,#object
	.size	 radix,4
radix:
	.word	1024
	.global num_keys
	.align 4
	.type	 num_keys,#object
	.size	 num_keys,4
num_keys:
	.word	262144
	.global max_key
	.align 4
	.type	 max_key,#object
	.size	 max_key,4
max_key:
	.word	524288
	.global dostats
	.align 4
	.type	 dostats,#object
	.size	 dostats,4
dostats:
	.word	0
	.global test_result
	.align 4
	.type	 test_result,#object
	.size	 test_result,4
test_result:
	.word	0
	.global doprint
	.align 4
	.type	 doprint,#object
	.size	 doprint,4
doprint:
	.word	0
.section	".rodata"
	.align 8
.LLC0:
	.asciz	"p:r:n:m:stoh"
	.align 8
.LLC1:
	.asciz	"P must be >= 1\n"
	.align 8
.LLC2:
	.asciz	"Maximum processors (MAX_PROCESSORS) exceeded\n"
	.align 8
.LLC3:
	.asciz	"Radix must be a power of 2 greater than 0\n"
	.align 8
.LLC4:
	.asciz	"Radix must be a power of 2\n"
	.align 8
.LLC5:
	.asciz	"Number of keys must be >= 1\n"
	.align 8
.LLC6:
	.asciz	"Maximum key must be >= 1\n"
	.align 8
.LLC7:
	.asciz	"Usage: RADIX <options>\n\n"
	.align 8
.LLC8:
	.asciz	"   -pP : P = number of processors.\n"
	.align 8
.LLC9:
	.asciz	"   -rR : R = radix for sorting.  Must be power of 2.\n"
	.align 8
.LLC10:
	.asciz	"   -nN : N = number of keys to sort.\n"
	.align 8
.LLC11:
	.asciz	"   -mM : M = maximum key value.  Integer keys k will be generated such\n"
	.align 8
.LLC12:
	.asciz	"         that 0 <= k <= M.\n"
	.align 8
.LLC13:
	.asciz	"   -s  : Print individual processor timing statistics.\n"
	.align 8
.LLC14:
	.asciz	"   -t  : Check to make sure all keys are sorted correctly.\n"
	.align 8
.LLC15:
	.asciz	"   -o  : Print out sorted keys.\n"
	.align 8
.LLC16:
	.asciz	"   -h  : Print out command line options.\n\n"
	.align 8
.LLC17:
	.asciz	"Default: RADIX -p%1d -n%1d -r%1d -m%1d\n"
	.global .umul
	.align 8
.LLC18:
	.asciz	"ERROR: Cannot malloc enough memory\n"
	.align 8
.LLC19:
	.asciz	"\n"
	.align 8
.LLC20:
	.asciz	"Integer Radix Sort\n"
	.align 8
.LLC21:
	.asciz	"     %d Keys\n"
	.align 8
.LLC22:
	.asciz	"     %d Processors\n"
	.align 8
.LLC23:
	.asciz	"     Radix = %d\n"
	.align 8
.LLC24:
	.asciz	"     Max key = %d\n"
	.global .div
	.global .rem
	.align 8
.LLC25:
	.asciz	"Attempt to create more processors than allowed max %d\n"
	.align 8
.LLC26:
	.asciz	"                 PROCESS STATISTICS\n"
	.align 8
.LLC27:
	.asciz	"               Total            Rank            Sort\n"
	.align 8
.LLC28:
	.asciz	" Proc          Time             Time            Time\n"
	.align 8
.LLC29:
	.asciz	"    0     %10.0f      %10.0f      %10.0f\n"
	.align 8
.LLC30:
	.asciz	"  %3d     %10.0f      %10.0f      %10.0f\n"
	.align 8
.LLC31:
	.asciz	"  Avg     %10.0f      %10.0f      %10.0f\n"
	.align 8
.LLC32:
	.asciz	"  Min     %10.0f      %10.0f      %10.0f\n"
	.align 8
.LLC33:
	.asciz	"  Max     %10.0f      %10.0f      %10.0f\n"
	.align 8
.LLC34:
	.asciz	"                 TIMING INFORMATION\n"
	.align 8
.LLC35:
	.asciz	"Start time                        : %16d\n"
	.align 8
.LLC36:
	.asciz	"Initialization finish time        : %16d\n"
	.align 8
.LLC37:
	.asciz	"Overall finish time               : %16d\n"
	.align 8
.LLC38:
	.asciz	"Total time with initialization    : %16d\n"
	.align 8
.LLC39:
	.asciz	"Total time without initialization : %16d\n"
.section	".text"
	.align 4
	.global main
	.type	 main,#function
	.proc	04
main:
.L_LC7:

	.pushsection	".line"
	.uaword	120	! radix.C:120
	.uahalf	0xffff
	.uaword	.L_LC7-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-192,%sp
	!#PROLOGUE# 1
.L_b6:
.L_LC8:

	.pushsection	".line"
	.uaword	121	! radix.C:121
	.uahalf	0xffff
	.uaword	.L_LC8-.L_text_b
	.popsection
.L_LC9:

	.pushsection	".line"
	.uaword	149	! radix.C:149
	.uahalf	0xffff
	.uaword	.L_LC9-.L_text_b
	.popsection
	call trap,0
	mov 24,%o0
	mov %o0,%i5
.L_LC10:

	.pushsection	".line"
	.uaword	151	! radix.C:151
	.uahalf	0xffff
	.uaword	.L_LC10-.L_text_b
	.popsection
	sethi %hi(.LL43),%o0
	or %o0,%lo(.LL43),%l5
	sethi %hi(number_of_processors),%l4
	sethi %hi(optarg),%l0
	sethi %hi(radix),%l3
	sethi %hi(num_keys),%l2
	sethi %hi(max_key),%l1
.LL25:
	mov %i0,%o0
.LL146:
	mov %i1,%o1
	sethi %hi(.LLC0),%o2
	call getopt,0
	or %o2,%lo(.LLC0),%o2
	cmp %o0,-1
	be .LL26
	add %o0,-104,%o0
.L_LC11:

	.pushsection	".line"
	.uaword	152	! radix.C:152
	.uahalf	0xffff
	.uaword	.L_LC11-.L_text_b
	.popsection
	cmp %o0,12
	bgu,a .LL146
	mov %i0,%o0
	sll %o0,2,%o0
	ld [%o0+%l5],%o0
	jmp %o0
	nop
	.align 4
.LL43:
	.word	.LL42
	.word	.LL25
	.word	.LL25
	.word	.LL25
	.word	.LL25
	.word	.LL37
	.word	.LL35
	.word	.LL41
	.word	.LL29
	.word	.LL25
	.word	.LL32
	.word	.LL39
	.word	.LL40
.L_LC12:

	.pushsection	".line"
	.uaword	153	! radix.C:153
	.uahalf	0xffff
	.uaword	.L_LC12-.L_text_b
	.popsection
.LL29:
	ld [%l0+%lo(optarg)],%o0
	mov 0,%o1
	call _Stoul,0
	mov 10,%o2
.L_LC13:

	.pushsection	".line"
	.uaword	154	! radix.C:154
	.uahalf	0xffff
	.uaword	.L_LC13-.L_text_b
	.popsection
	cmp %o0,0
	bg .LL30
	st %o0,[%l4+%lo(number_of_processors)]
.L_LC14:

	.pushsection	".line"
	.uaword	155	! radix.C:155
	.uahalf	0xffff
	.uaword	.L_LC14-.L_text_b
	.popsection
	sethi %hi(.LLC1),%o0
	call printerr,0
	or %o0,%lo(.LLC1),%o0
.L_LC15:

	.pushsection	".line"
	.uaword	156	! radix.C:156
	.uahalf	0xffff
	.uaword	.L_LC15-.L_text_b
	.popsection
	call exit,0
	mov -1,%o0
.LL30:
.L_LC16:

	.pushsection	".line"
	.uaword	158	! radix.C:158
	.uahalf	0xffff
	.uaword	.L_LC16-.L_text_b
	.popsection
	cmp %o0,64
	ble,a .LL146
	mov %i0,%o0
.L_LC17:

	.pushsection	".line"
	.uaword	159	! radix.C:159
	.uahalf	0xffff
	.uaword	.L_LC17-.L_text_b
	.popsection
	sethi %hi(.LLC2),%o0
	call printerr,0
	or %o0,%lo(.LLC2),%o0
.L_LC18:

	.pushsection	".line"
	.uaword	160	! radix.C:160
	.uahalf	0xffff
	.uaword	.L_LC18-.L_text_b
	.popsection
	call exit,0
	mov -1,%o0
.LL32:
.L_LC19:

	.pushsection	".line"
	.uaword	163	! radix.C:163
	.uahalf	0xffff
	.uaword	.L_LC19-.L_text_b
	.popsection
	ld [%l0+%lo(optarg)],%o0
	mov 0,%o1
	call _Stoul,0
	mov 10,%o2
.L_LC20:

	.pushsection	".line"
	.uaword	164	! radix.C:164
	.uahalf	0xffff
	.uaword	.L_LC20-.L_text_b
	.popsection
	cmp %o0,0
	bg .LL33
	st %o0,[%l3+%lo(radix)]
.L_LC21:

	.pushsection	".line"
	.uaword	165	! radix.C:165
	.uahalf	0xffff
	.uaword	.L_LC21-.L_text_b
	.popsection
	sethi %hi(.LLC3),%o0
	call printerr,0
	or %o0,%lo(.LLC3),%o0
.L_LC22:

	.pushsection	".line"
	.uaword	166	! radix.C:166
	.uahalf	0xffff
	.uaword	.L_LC22-.L_text_b
	.popsection
	call exit,0
	mov -1,%o0
.LL33:
.L_LC23:

	.pushsection	".line"
	.uaword	168	! radix.C:168
	.uahalf	0xffff
	.uaword	.L_LC23-.L_text_b
	.popsection
	call log_2,0
	nop
	sethi %hi(log2_radix),%o1
.L_LC24:

	.pushsection	".line"
	.uaword	169	! radix.C:169
	.uahalf	0xffff
	.uaword	.L_LC24-.L_text_b
	.popsection
	cmp %o0,-1
	bne .LL25
	st %o0,[%o1+%lo(log2_radix)]
.L_LC25:

	.pushsection	".line"
	.uaword	170	! radix.C:170
	.uahalf	0xffff
	.uaword	.L_LC25-.L_text_b
	.popsection
	sethi %hi(.LLC4),%o0
	call printerr,0
	or %o0,%lo(.LLC4),%o0
.L_LC26:

	.pushsection	".line"
	.uaword	171	! radix.C:171
	.uahalf	0xffff
	.uaword	.L_LC26-.L_text_b
	.popsection
	call exit,0
	mov -1,%o0
.LL35:
.L_LC27:

	.pushsection	".line"
	.uaword	174	! radix.C:174
	.uahalf	0xffff
	.uaword	.L_LC27-.L_text_b
	.popsection
	ld [%l0+%lo(optarg)],%o0
	mov 0,%o1
	call _Stoul,0
	mov 10,%o2
.L_LC28:

	.pushsection	".line"
	.uaword	175	! radix.C:175
	.uahalf	0xffff
	.uaword	.L_LC28-.L_text_b
	.popsection
	cmp %o0,0
	bg .LL25
	st %o0,[%l2+%lo(num_keys)]
.L_LC29:

	.pushsection	".line"
	.uaword	176	! radix.C:176
	.uahalf	0xffff
	.uaword	.L_LC29-.L_text_b
	.popsection
	sethi %hi(.LLC5),%o0
	call printerr,0
	or %o0,%lo(.LLC5),%o0
.L_LC30:

	.pushsection	".line"
	.uaword	177	! radix.C:177
	.uahalf	0xffff
	.uaword	.L_LC30-.L_text_b
	.popsection
	call exit,0
	mov -1,%o0
.LL37:
.L_LC31:

	.pushsection	".line"
	.uaword	180	! radix.C:180
	.uahalf	0xffff
	.uaword	.L_LC31-.L_text_b
	.popsection
	ld [%l0+%lo(optarg)],%o0
	mov 0,%o1
	call _Stoul,0
	mov 10,%o2
.L_LC32:

	.pushsection	".line"
	.uaword	181	! radix.C:181
	.uahalf	0xffff
	.uaword	.L_LC32-.L_text_b
	.popsection
	cmp %o0,0
	bg .LL25
	st %o0,[%l1+%lo(max_key)]
.L_LC33:

	.pushsection	".line"
	.uaword	182	! radix.C:182
	.uahalf	0xffff
	.uaword	.L_LC33-.L_text_b
	.popsection
	sethi %hi(.LLC6),%o0
	call printerr,0
	or %o0,%lo(.LLC6),%o0
.L_LC34:

	.pushsection	".line"
	.uaword	183	! radix.C:183
	.uahalf	0xffff
	.uaword	.L_LC34-.L_text_b
	.popsection
	call exit,0
	mov -1,%o0
.LL39:
.L_LC35:

	.pushsection	".line"
	.uaword	186	! radix.C:186
	.uahalf	0xffff
	.uaword	.L_LC35-.L_text_b
	.popsection
	sethi %hi(dostats),%o0
	ld [%o0+%lo(dostats)],%o1
	subcc %g0,%o1,%g0
	subx %g0,-1,%o1
.L_LC36:

	.pushsection	".line"
	.uaword	187	! radix.C:187
	.uahalf	0xffff
	.uaword	.L_LC36-.L_text_b
	.popsection
	b .LL25
	st %o1,[%o0+%lo(dostats)]
.LL40:
.L_LC37:

	.pushsection	".line"
	.uaword	188	! radix.C:188
	.uahalf	0xffff
	.uaword	.L_LC37-.L_text_b
	.popsection
	sethi %hi(test_result),%o0
	ld [%o0+%lo(test_result)],%o1
	subcc %g0,%o1,%g0
	subx %g0,-1,%o1
.L_LC38:

	.pushsection	".line"
	.uaword	189	! radix.C:189
	.uahalf	0xffff
	.uaword	.L_LC38-.L_text_b
	.popsection
	b .LL25
	st %o1,[%o0+%lo(test_result)]
.LL41:
.L_LC39:

	.pushsection	".line"
	.uaword	190	! radix.C:190
	.uahalf	0xffff
	.uaword	.L_LC39-.L_text_b
	.popsection
	sethi %hi(doprint),%o0
	ld [%o0+%lo(doprint)],%o1
	subcc %g0,%o1,%g0
	subx %g0,-1,%o1
.L_LC40:

	.pushsection	".line"
	.uaword	191	! radix.C:191
	.uahalf	0xffff
	.uaword	.L_LC40-.L_text_b
	.popsection
	b .LL25
	st %o1,[%o0+%lo(doprint)]
.LL42:
.L_LC41:

	.pushsection	".line"
	.uaword	192	! radix.C:192
	.uahalf	0xffff
	.uaword	.L_LC41-.L_text_b
	.popsection
	sethi %hi(.LLC7),%o0
	call printf,0
	or %o0,%lo(.LLC7),%o0
.L_LC42:

	.pushsection	".line"
	.uaword	193	! radix.C:193
	.uahalf	0xffff
	.uaword	.L_LC42-.L_text_b
	.popsection
	sethi %hi(.LLC8),%o0
	call printf,0
	or %o0,%lo(.LLC8),%o0
.L_LC43:

	.pushsection	".line"
	.uaword	194	! radix.C:194
	.uahalf	0xffff
	.uaword	.L_LC43-.L_text_b
	.popsection
	sethi %hi(.LLC9),%o0
	call printf,0
	or %o0,%lo(.LLC9),%o0
.L_LC44:

	.pushsection	".line"
	.uaword	195	! radix.C:195
	.uahalf	0xffff
	.uaword	.L_LC44-.L_text_b
	.popsection
	sethi %hi(.LLC10),%o0
	call printf,0
	or %o0,%lo(.LLC10),%o0
.L_LC45:

	.pushsection	".line"
	.uaword	196	! radix.C:196
	.uahalf	0xffff
	.uaword	.L_LC45-.L_text_b
	.popsection
	sethi %hi(.LLC11),%o0
	call printf,0
	or %o0,%lo(.LLC11),%o0
.L_LC46:

	.pushsection	".line"
	.uaword	197	! radix.C:197
	.uahalf	0xffff
	.uaword	.L_LC46-.L_text_b
	.popsection
	sethi %hi(.LLC12),%o0
	call printf,0
	or %o0,%lo(.LLC12),%o0
.L_LC47:

	.pushsection	".line"
	.uaword	198	! radix.C:198
	.uahalf	0xffff
	.uaword	.L_LC47-.L_text_b
	.popsection
	sethi %hi(.LLC13),%o0
	call printf,0
	or %o0,%lo(.LLC13),%o0
.L_LC48:

	.pushsection	".line"
	.uaword	199	! radix.C:199
	.uahalf	0xffff
	.uaword	.L_LC48-.L_text_b
	.popsection
	sethi %hi(.LLC14),%o0
	call printf,0
	or %o0,%lo(.LLC14),%o0
.L_LC49:

	.pushsection	".line"
	.uaword	200	! radix.C:200
	.uahalf	0xffff
	.uaword	.L_LC49-.L_text_b
	.popsection
	sethi %hi(.LLC15),%o0
	call printf,0
	or %o0,%lo(.LLC15),%o0
.L_LC50:

	.pushsection	".line"
	.uaword	201	! radix.C:201
	.uahalf	0xffff
	.uaword	.L_LC50-.L_text_b
	.popsection
	sethi %hi(.LLC16),%o0
	call printf,0
	or %o0,%lo(.LLC16),%o0
.L_LC51:

	.pushsection	".line"
	.uaword	202	! radix.C:202
	.uahalf	0xffff
	.uaword	.L_LC51-.L_text_b
	.popsection
	sethi %hi(.LLC17),%o0
	or %o0,%lo(.LLC17),%o0
	mov 1,%o1
	sethi %hi(262144),%o2
	mov 1024,%o3
	call printf,0
	sethi %hi(524288),%o4
.L_LC52:

	.pushsection	".line"
	.uaword	204	! radix.C:204
	.uahalf	0xffff
	.uaword	.L_LC52-.L_text_b
	.popsection
	call exit,0
	mov 0,%o0
.LL26:
.L_LC53:

	.pushsection	".line"
	.uaword	208	! radix.C:208
	.uahalf	0xffff
	.uaword	.L_LC53-.L_text_b
	.popsection
.L_B7:
	call getpid,0
	nop
	sethi %hi(proc_id),%o1
	st %o0,[%o1+%lo(proc_id)]
	ld [%o1+%lo(proc_id)],%o0
	cmp %o0,0
	bne .LL45
	nop
	call trap,0
	mov 1,%o0
	sethi %hi(ANLno_procs),%o1
	st %o0,[%o1+%lo(ANLno_procs)]
	call trap,0
	mov 29,%o0
	sethi %hi(lock_model),%o1
	st %o0,[%o1+%lo(lock_model)]
	mov 0,%o0
	call xx_mem,0
	sethi %hi(80000000),%o1
	mov 1,%o0
	call xx_mem,0
	mov 16,%o1
	sethi %hi(ANLglob),%o1
	st %o0,[%o1+%lo(ANLglob)]
	st %g0,[%o0]
	st %g0,[%o0+4]
	st %g0,[%o0+8]
	b .LL147
	sethi %hi(radix),%l3
.LL45:
	call ZZZ_slave,0
	sethi %hi(radix),%l3
.L_B7_e:
.L_LC54:

	.pushsection	".line"
	.uaword	210	! radix.C:210
	.uahalf	0xffff
	.uaword	.L_LC54-.L_text_b
	.popsection
.LL147:
	call log_2,0
	ld [%l3+%lo(radix)],%o0
	sethi %hi(log2_radix),%o1
	st %o0,[%o1+%lo(log2_radix)]
.L_LC55:

	.pushsection	".line"
	.uaword	211	! radix.C:211
	.uahalf	0xffff
	.uaword	.L_LC55-.L_text_b
	.popsection
	sethi %hi(num_keys),%l0
	call log_2,0
	ld [%l0+%lo(num_keys)],%o0
	sethi %hi(log2_keys),%o1
	st %o0,[%o1+%lo(log2_keys)]
.L_LC56:

	.pushsection	".line"
	.uaword	212	! radix.C:212
	.uahalf	0xffff
	.uaword	.L_LC56-.L_text_b
	.popsection
	mov 1,%o0
	sethi %hi(4721984),%o1
	call xx_mem,0
	or %o1,%lo(4721984),%o1
	sethi %hi(global),%l1
	st %o0,[%l1+%lo(global)]
.L_LC57:

	.pushsection	".line"
	.uaword	213	! radix.C:213
	.uahalf	0xffff
	.uaword	.L_LC57-.L_text_b
	.popsection
	ld [%l0+%lo(num_keys)],%o1
	mov 1,%o0
	call xx_mem,0
	sll %o1,2,%o1
	sethi %hi(key),%l2
	st %o0,[%l2+%lo(key)]
.L_LC58:

	.pushsection	".line"
	.uaword	214	! radix.C:214
	.uahalf	0xffff
	.uaword	.L_LC58-.L_text_b
	.popsection
	ld [%l0+%lo(num_keys)],%o1
	mov 1,%o0
	call xx_mem,0
	sll %o1,2,%o1
.L_LC59:

	.pushsection	".line"
	.uaword	213	! radix.C:213
	.uahalf	0xffff
	.uaword	.L_LC59-.L_text_b
	.popsection
	or %l2,%lo(key),%l6
.L_LC60:

	.pushsection	".line"
	.uaword	214	! radix.C:214
	.uahalf	0xffff
	.uaword	.L_LC60-.L_text_b
	.popsection
	st %o0,[%l6+4]
.L_LC61:

	.pushsection	".line"
	.uaword	215	! radix.C:215
	.uahalf	0xffff
	.uaword	.L_LC61-.L_text_b
	.popsection
	sethi %hi(number_of_processors),%l0
	ld [%l0+%lo(number_of_processors)],%o1
	mov 1,%o0
	add %o1,1,%o1
	call xx_mem,0
	sll %o1,2,%o1
	sethi %hi(key_partition),%l5
	st %o0,[%l5+%lo(key_partition)]
.L_LC62:

	.pushsection	".line"
	.uaword	216	! radix.C:216
	.uahalf	0xffff
	.uaword	.L_LC62-.L_text_b
	.popsection
	ld [%l0+%lo(number_of_processors)],%o1
	mov 1,%o0
	add %o1,1,%o1
	call xx_mem,0
	sll %o1,2,%o1
	sethi %hi(rank_partition),%l4
	st %o0,[%l4+%lo(rank_partition)]
.L_LC63:

	.pushsection	".line"
	.uaword	217	! radix.C:217
	.uahalf	0xffff
	.uaword	.L_LC63-.L_text_b
	.popsection
	ld [%l0+%lo(number_of_processors)],%o1
	mov 1,%o0
	call xx_mem,0
	sll %o1,3,%o1
	mov %o0,%o3
	ld [%l1+%lo(global)],%o2
.L_LC64:

	.pushsection	".line"
	.uaword	218	! radix.C:218
	.uahalf	0xffff
	.uaword	.L_LC64-.L_text_b
	.popsection
	mov 1,%o0
	ld [%l0+%lo(number_of_processors)],%o1
.L_LC65:

	.pushsection	".line"
	.uaword	217	! radix.C:217
	.uahalf	0xffff
	.uaword	.L_LC65-.L_text_b
	.popsection
	st %o3,[%o2+292]
.L_LC66:

	.pushsection	".line"
	.uaword	218	! radix.C:218
	.uahalf	0xffff
	.uaword	.L_LC66-.L_text_b
	.popsection
	call xx_mem,0
	sll %o1,3,%o1
	mov %o0,%o3
	ld [%l1+%lo(global)],%o2
.L_LC67:

	.pushsection	".line"
	.uaword	219	! radix.C:219
	.uahalf	0xffff
	.uaword	.L_LC67-.L_text_b
	.popsection
	mov 1,%o0
	ld [%l0+%lo(number_of_processors)],%o1
.L_LC68:

	.pushsection	".line"
	.uaword	218	! radix.C:218
	.uahalf	0xffff
	.uaword	.L_LC68-.L_text_b
	.popsection
	st %o3,[%o2+296]
.L_LC69:

	.pushsection	".line"
	.uaword	219	! radix.C:219
	.uahalf	0xffff
	.uaword	.L_LC69-.L_text_b
	.popsection
	call xx_mem,0
	sll %o1,3,%o1
	ld [%l1+%lo(global)],%o1
.L_LC70:

	.pushsection	".line"
	.uaword	220	! radix.C:220
	.uahalf	0xffff
	.uaword	.L_LC70-.L_text_b
	.popsection
	ld [%l0+%lo(number_of_processors)],%o2
.L_LC71:

	.pushsection	".line"
	.uaword	219	! radix.C:219
	.uahalf	0xffff
	.uaword	.L_LC71-.L_text_b
	.popsection
	st %o0,[%o1+300]
.L_LC72:

	.pushsection	".line"
	.uaword	220	! radix.C:220
	.uahalf	0xffff
	.uaword	.L_LC72-.L_text_b
	.popsection
	ld [%l3+%lo(radix)],%o1
	mov %o2,%o0
	sll %o1,2,%o1
	call .umul,0
	add %o1,4,%o1
	mov %o0,%o1
.L_LC73:

	.pushsection	".line"
	.uaword	221	! radix.C:221
	.uahalf	0xffff
	.uaword	.L_LC73-.L_text_b
	.popsection
	call xx_mem,0
	mov 1,%o0
	sethi %hi(rank_me),%o1
	mov %o0,%o2
.L_LC74:

	.pushsection	".line"
	.uaword	222	! radix.C:222
	.uahalf	0xffff
	.uaword	.L_LC74-.L_text_b
	.popsection
	ld [%l1+%lo(global)],%o0
.L_LC75:

	.pushsection	".line"
	.uaword	222	! radix.C:222
	.uahalf	0xffff
	.uaword	.L_LC75-.L_text_b
	.popsection
	cmp %o0,0
	be .LL48
	st %o2,[%o1+%lo(rank_me)]
	ld [%l2+%lo(key)],%o0
	cmp %o0,0
	be .LL148
	sethi %hi(_Files+8),%o0
	ld [%l6+4],%o0
	cmp %o0,0
	be .LL148
	sethi %hi(_Files+8),%o0
	ld [%l5+%lo(key_partition)],%o0
	cmp %o0,0
	be .LL148
	sethi %hi(_Files+8),%o0
	ld [%l4+%lo(rank_partition)],%o0
	cmp %o0,0
	be .LL48
	cmp %o2,0
	bne,a .LL47
	ld [%l0+%lo(number_of_processors)],%o1
.LL48:
.L_LC76:

	.pushsection	".line"
	.uaword	225	! radix.C:225
	.uahalf	0xffff
	.uaword	.L_LC76-.L_text_b
	.popsection
	sethi %hi(_Files+8),%o0
.LL148:
	ld [%o0+%lo(_Files+8)],%o0
	sethi %hi(.LLC18),%o1
	call fprintf,0
	or %o1,%lo(.LLC18),%o1
.L_LC77:

	.pushsection	".line"
	.uaword	226	! radix.C:226
	.uahalf	0xffff
	.uaword	.L_LC77-.L_text_b
	.popsection
	call exit,0
	mov -1,%o0
.LL47:
.L_LC78:

	.pushsection	".line"
	.uaword	232	! radix.C:232
	.uahalf	0xffff
	.uaword	.L_LC78-.L_text_b
	.popsection
	mov 0,%l2
.L_LC79:

	.pushsection	".line"
	.uaword	230	! radix.C:230
	.uahalf	0xffff
	.uaword	.L_LC79-.L_text_b
	.popsection
	sll %o1,2,%o0
.L_LC80:

	.pushsection	".line"
	.uaword	232	! radix.C:232
	.uahalf	0xffff
	.uaword	.L_LC80-.L_text_b
	.popsection
	cmp %l2,%o1
	bge .LL50
	add %o2,%o0,%o3
	mov %l3,%o5
	mov %l0,%o4
.LL52:
.L_LC81:

	.pushsection	".line"
	.uaword	233	! radix.C:233
	.uahalf	0xffff
	.uaword	.L_LC81-.L_text_b
	.popsection
	st %o3,[%o2]
.L_LC82:

	.pushsection	".line"
	.uaword	234	! radix.C:234
	.uahalf	0xffff
	.uaword	.L_LC82-.L_text_b
	.popsection
	add %o2,4,%o2
.L_LC83:

	.pushsection	".line"
	.uaword	235	! radix.C:235
	.uahalf	0xffff
	.uaword	.L_LC83-.L_text_b
	.popsection
	ld [%o5+%lo(radix)],%o0
.L_LC84:

	.pushsection	".line"
	.uaword	232	! radix.C:232
	.uahalf	0xffff
	.uaword	.L_LC84-.L_text_b
	.popsection
	add %l2,1,%l2
	ld [%o4+%lo(number_of_processors)],%o1
.L_LC85:

	.pushsection	".line"
	.uaword	235	! radix.C:235
	.uahalf	0xffff
	.uaword	.L_LC85-.L_text_b
	.popsection
	sll %o0,2,%o0
.L_LC86:

	.pushsection	".line"
	.uaword	232	! radix.C:232
	.uahalf	0xffff
	.uaword	.L_LC86-.L_text_b
	.popsection
	cmp %l2,%o1
	bl .LL52
	add %o3,%o0,%o3
.LL50:
.L_LC87:

	.pushsection	".line"
	.uaword	237	! radix.C:237
	.uahalf	0xffff
	.uaword	.L_LC87-.L_text_b
	.popsection
	sethi %hi(number_of_processors),%o1
	ld [%o1+%lo(number_of_processors)],%o0
	mov 0,%l2
	cmp %l2,%o0
	bge .LL149
	sethi %hi(global),%o0
	sethi %hi(radix),%l4
	sethi %hi(4096),%l1
	mov %o1,%l3
	sethi %hi(gp),%o0
	or %o0,%lo(gp),%l0
.LL57:
.L_LC88:

	.pushsection	".line"
	.uaword	238	! radix.C:238
	.uahalf	0xffff
	.uaword	.L_LC88-.L_text_b
	.popsection
	mov 1,%o0
	ld [%l4+%lo(radix)],%o1
.L_LC89:

	.pushsection	".line"
	.uaword	237	! radix.C:237
	.uahalf	0xffff
	.uaword	.L_LC89-.L_text_b
	.popsection
	add %l2,1,%l2
.L_LC90:

	.pushsection	".line"
	.uaword	238	! radix.C:238
	.uahalf	0xffff
	.uaword	.L_LC90-.L_text_b
	.popsection
	sll %o1,2,%o1
	call xx_mem,0
	add %o1,%l1,%o1
	st %o0,[%l0+%l1]
.L_LC91:

	.pushsection	".line"
	.uaword	237	! radix.C:237
	.uahalf	0xffff
	.uaword	.L_LC91-.L_text_b
	.popsection
	sethi %hi(4100),%o0
	or %o0,%lo(4100),%o0
	ld [%l3+%lo(number_of_processors)],%o1
	cmp %l2,%o1
	bl .LL57
	add %l0,%o0,%l0
.L_LC92:

	.pushsection	".line"
	.uaword	240	! radix.C:240
	.uahalf	0xffff
	.uaword	.L_LC92-.L_text_b
	.popsection
.L_B8:
	sethi %hi(global),%o0
.LL149:
	ld [%o0+%lo(global)],%o0
.L_LC93:

	.pushsection	".line"
	.uaword	242	! radix.C:242
	.uahalf	0xffff
	.uaword	.L_LC93-.L_text_b
	.popsection
	mov 0,%o1
.L_LC94:

	.pushsection	".line"
	.uaword	240	! radix.C:240
	.uahalf	0xffff
	.uaword	.L_LC94-.L_text_b
	.popsection
	st %g0,[%o0+4]
.L_LC95:

	.pushsection	".line"
	.uaword	241	! radix.C:241
	.uahalf	0xffff
	.uaword	.L_LC95-.L_text_b
	.popsection
	st %g0,[%o0+8]
.L_LC96:

	.pushsection	".line"
	.uaword	242	! radix.C:242
	.uahalf	0xffff
	.uaword	.L_LC96-.L_text_b
	.popsection
.LL62:
	st %g0,[%o0+12]
	add %o1,1,%o1
	cmp %o1,63
	ble .LL62
	add %o0,4,%o0
.L_B8_e:
.L_LC97:

	.pushsection	".line"
	.uaword	243	! radix.C:243
	.uahalf	0xffff
	.uaword	.L_LC97-.L_text_b
	.popsection
.L_B9:
	mov 30,%o0
	sethi %hi(global),%o1
	mov %o1,%l5
	sethi %hi(lock_model),%l7
	mov 0,%l4
	ld [%l5+%lo(global)],%o1
	mov 268,%l3
	call trap,0
	add %o1,268,%o1
.LL67:
	mov 0,%l1
	mov %l4,%l6
	mov %l3,%l2
	mov 8,%l0
.LL71:
	mov 13,%o0
	ld [%l5+%lo(global)],%o1
	sll %l1,2,%o3
	add %o1,%l6,%o2
	add %o3,%o2,%o3
	st %g0,[%o3+272]
	st %g0,[%o3+276]
	add %o1,%l2,%o1
	call trap,0
	add %o1,%l0,%o1
	ld [%l7+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL72
	add %l1,1,%l1
.L_B10:
	ld [%l5+%lo(global)],%o0
	add %o0,%l2,%o0
	call cm_lock_backoff,0
	add %o0,%l0,%o0
.L_B10_e:
.LL72:
	mov 8,%o0
	ld [%l5+%lo(global)],%o1
	add %o1,%l2,%o1
	call trap,0
	add %o1,%l0,%o1
	cmp %l1,0
	ble .LL71
	add %l0,4,%l0
	add %l3,12,%l3
	ld [%l5+%lo(global)],%o0
	cmp %l3,268
	add %o0,%l4,%o0
	st %g0,[%o0+268]
	ble .LL67
	add %l4,12,%l4
.L_B9_e:
.L_LC98:

	.pushsection	".line"
	.uaword	244	! radix.C:244
	.uahalf	0xffff
	.uaword	.L_LC98-.L_text_b
	.popsection
.L_B11:
	mov 30,%o0
	sethi %hi(global),%o1
	mov %o1,%l5
	sethi %hi(lock_model),%l7
	mov 0,%l4
	ld [%l5+%lo(global)],%o1
	mov 280,%l3
	call trap,0
	add %o1,280,%o1
.LL78:
	mov 0,%l1
	mov %l4,%l6
	mov %l3,%l2
	mov 8,%l0
.LL82:
	mov 13,%o0
	ld [%l5+%lo(global)],%o1
	sll %l1,2,%o3
	add %o1,%l6,%o2
	add %o3,%o2,%o3
	st %g0,[%o3+284]
	st %g0,[%o3+288]
	add %o1,%l2,%o1
	call trap,0
	add %o1,%l0,%o1
	ld [%l7+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL83
	add %l1,1,%l1
.L_B12:
	ld [%l5+%lo(global)],%o0
	add %o0,%l2,%o0
	call cm_lock_backoff,0
	add %o0,%l0,%o0
.L_B12_e:
.LL83:
	mov 8,%o0
	ld [%l5+%lo(global)],%o1
	add %o1,%l2,%o1
	call trap,0
	add %o1,%l0,%o1
	cmp %l1,0
	ble .LL82
	add %l0,4,%l0
	add %l3,12,%l3
	ld [%l5+%lo(global)],%o0
	cmp %l3,280
	add %o0,%l4,%o0
	st %g0,[%o0+280]
	ble .LL78
	add %l4,12,%l4
.L_B11_e:
.L_LC99:

	.pushsection	".line"
	.uaword	246	! radix.C:246
	.uahalf	0xffff
	.uaword	.L_LC99-.L_text_b
	.popsection
	sethi %hi(number_of_processors),%o0
	ld [%o0+%lo(number_of_processors)],%o0
	mov 0,%l2
	sll %o0,1,%o0
	cmp %l2,%o0
	bge .LL150
	sethi %hi(global),%o0
	sethi %hi(global),%l6
	mov 0,%i2
.LL89:
.L_LC100:

	.pushsection	".line"
	.uaword	247	! radix.C:247
	.uahalf	0xffff
	.uaword	.L_LC100-.L_text_b
	.popsection
.L_B13:
	mov 0,%o2
	ld [%l6+%lo(global)],%o3
	sethi %hi(33108),%o0
	or %o0,%lo(33108),%o4
	mov %i2,%o1
.LL93:
	add %o3,%o1,%o0
	st %g0,[%o0+%o4]
	add %o2,1,%o2
	cmp %o2,0
	ble .LL93
	add %o1,24,%o1
.L_B14:
	sethi %hi(33092),%o0
	or %o0,%lo(33092),%i4
	sethi %hi(33100),%o0
	or %o0,%lo(33100),%i3
	mov 0,%l4
	mov 0,%l5
	mov 320,%l3
.LL98:
	mov 0,%l1
	mov %l4,%l7
	mov %l3,%i1
	sethi %hi(32768),%o0
	add %l5,%o0,%i0
	mov 12,%l0
.LL102:
	mov 13,%o0
	ld [%l6+%lo(global)],%o1
	sll %l1,2,%o3
	add %o1,%l7,%o2
	add %o3,%o2,%o3
	st %g0,[%o3+%i4]
	st %g0,[%o3+%i3]
	add %o1,%i1,%o1
	add %o1,%i0,%o1
	call trap,0
	add %o1,%l0,%o1
	sethi %hi(lock_model),%o0
	ld [%o0+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL103
	add %l1,1,%l1
.L_B15:
	ld [%l6+%lo(global)],%o0
	add %o0,%i1,%o0
	add %o0,%i0,%o0
	call cm_lock_backoff,0
	add %o0,%l0,%o0
.L_B15_e:
.LL103:
	mov 8,%o0
	ld [%l6+%lo(global)],%o1
	add %o1,%i1,%o1
	add %o1,%i0,%o1
	call trap,0
	add %o1,%l0,%o1
	cmp %l1,1
	ble .LL102
	add %l0,4,%l0
	add %l5,24,%l5
	sethi %hi(36888),%o0
	or %o0,%lo(36888),%o2
	add %l3,%o2,%l3
	ld [%l6+%lo(global)],%o1
	cmp %l3,320
	sethi %hi(33088),%o0
	or %o0,%lo(33088),%o0
	add %o1,%l4,%o1
	st %g0,[%o1+%o0]
	sethi %hi(36912),%o0
	or %o0,%lo(36912),%o0
	ble .LL98
	add %l4,%o0,%l4
.L_B14_e:
.L_B13_e:
.L_LC101:

	.pushsection	".line"
	.uaword	246	! radix.C:246
	.uahalf	0xffff
	.uaword	.L_LC101-.L_text_b
	.popsection
	sethi %hi(number_of_processors),%o0
	ld [%o0+%lo(number_of_processors)],%o0
	add %l2,1,%l2
	sll %o0,1,%o0
	cmp %l2,%o0
	bl .LL89
	add %i2,%o2,%i2
.L_LC102:

	.pushsection	".line"
	.uaword	262	! radix.C:262
	.uahalf	0xffff
	.uaword	.L_LC102-.L_text_b
	.popsection
	mov 0,%l2
.L_LC103:

	.pushsection	".line"
	.uaword	250	! radix.C:250
	.uahalf	0xffff
	.uaword	.L_LC103-.L_text_b
	.popsection
	sethi %hi(global),%o0
.LL150:
	ld [%o0+%lo(global)],%o1
.L_LC104:

	.pushsection	".line"
	.uaword	251	! radix.C:251
	.uahalf	0xffff
	.uaword	.L_LC104-.L_text_b
	.popsection
	sethi %hi(max_key),%l1
	ld [%l1+%lo(max_key)],%o0
.L_LC105:

	.pushsection	".line"
	.uaword	250	! radix.C:250
	.uahalf	0xffff
	.uaword	.L_LC105-.L_text_b
	.popsection
	st %g0,[%o1]
.L_LC106:

	.pushsection	".line"
	.uaword	251	! radix.C:251
	.uahalf	0xffff
	.uaword	.L_LC106-.L_text_b
	.popsection
	call get_max_digits,0
	sethi %hi(.LLC19),%l0
	sethi %hi(max_num_digits),%o1
	st %o0,[%o1+%lo(max_num_digits)]
.L_LC107:

	.pushsection	".line"
	.uaword	252	! radix.C:252
	.uahalf	0xffff
	.uaword	.L_LC107-.L_text_b
	.popsection
	or %l0,%lo(.LLC19),%l0
	call printf,0
	mov %l0,%o0
.L_LC108:

	.pushsection	".line"
	.uaword	253	! radix.C:253
	.uahalf	0xffff
	.uaword	.L_LC108-.L_text_b
	.popsection
	sethi %hi(.LLC20),%o0
	call printf,0
	or %o0,%lo(.LLC20),%o0
.L_LC109:

	.pushsection	".line"
	.uaword	254	! radix.C:254
	.uahalf	0xffff
	.uaword	.L_LC109-.L_text_b
	.popsection
	sethi %hi(num_keys),%l6
	sethi %hi(.LLC21),%o0
	ld [%l6+%lo(num_keys)],%o1
	call printf,0
	or %o0,%lo(.LLC21),%o0
.L_LC110:

	.pushsection	".line"
	.uaword	255	! radix.C:255
	.uahalf	0xffff
	.uaword	.L_LC110-.L_text_b
	.popsection
	sethi %hi(number_of_processors),%l5
	sethi %hi(.LLC22),%o0
	ld [%l5+%lo(number_of_processors)],%o1
	call printf,0
	or %o0,%lo(.LLC22),%o0
.L_LC111:

	.pushsection	".line"
	.uaword	256	! radix.C:256
	.uahalf	0xffff
	.uaword	.L_LC111-.L_text_b
	.popsection
	sethi %hi(radix),%o0
	ld [%o0+%lo(radix)],%o1
.L_LC112:

	.pushsection	".line"
	.uaword	263	! radix.C:263
	.uahalf	0xffff
	.uaword	.L_LC112-.L_text_b
	.popsection
	mov 0,%l3
.L_LC113:

	.pushsection	".line"
	.uaword	256	! radix.C:256
	.uahalf	0xffff
	.uaword	.L_LC113-.L_text_b
	.popsection
	sethi %hi(.LLC23),%o0
	call printf,0
	or %o0,%lo(.LLC23),%o0
.L_LC114:

	.pushsection	".line"
	.uaword	257	! radix.C:257
	.uahalf	0xffff
	.uaword	.L_LC114-.L_text_b
	.popsection
	sethi %hi(.LLC24),%o0
	ld [%l1+%lo(max_key)],%o1
	call printf,0
	or %o0,%lo(.LLC24),%o0
.L_LC115:

	.pushsection	".line"
	.uaword	258	! radix.C:258
	.uahalf	0xffff
	.uaword	.L_LC115-.L_text_b
	.popsection
	call printf,0
	mov %l0,%o0
.L_LC116:

	.pushsection	".line"
	.uaword	260	! radix.C:260
	.uahalf	0xffff
	.uaword	.L_LC116-.L_text_b
	.popsection
	ld [%l6+%lo(num_keys)],%l0
.L_LC117:

	.pushsection	".line"
	.uaword	264	! radix.C:264
	.uahalf	0xffff
	.uaword	.L_LC117-.L_text_b
	.popsection
	mov 0,%i0
.L_LC118:

	.pushsection	".line"
	.uaword	260	! radix.C:260
	.uahalf	0xffff
	.uaword	.L_LC118-.L_text_b
	.popsection
	ld [%l5+%lo(number_of_processors)],%l1
	mov %l0,%o0
	call .div,0
	mov %l1,%o1
	mov %o0,%l4
.L_LC119:

	.pushsection	".line"
	.uaword	261	! radix.C:261
	.uahalf	0xffff
	.uaword	.L_LC119-.L_text_b
	.popsection
	mov %l0,%o0
	call .rem,0
	mov %l1,%o1
.L_LC120:

	.pushsection	".line"
	.uaword	265	! radix.C:265
	.uahalf	0xffff
	.uaword	.L_LC120-.L_text_b
	.popsection
	cmp %i0,%l0
	bge .LL108
	mov %o0,%l1
	sethi %hi(key_partition),%i1
	mov %l5,%l7
	mov %l6,%l5
.LL109:
.L_LC121:

	.pushsection	".line"
	.uaword	266	! radix.C:266
	.uahalf	0xffff
	.uaword	.L_LC121-.L_text_b
	.popsection
	sll %i0,2,%o2
.L_LC122:

	.pushsection	".line"
	.uaword	267	! radix.C:267
	.uahalf	0xffff
	.uaword	.L_LC122-.L_text_b
	.popsection
	add %i0,1,%i0
.L_LC123:

	.pushsection	".line"
	.uaword	269	! radix.C:269
	.uahalf	0xffff
	.uaword	.L_LC123-.L_text_b
	.popsection
	add %l3,%l1,%l3
.L_LC124:

	.pushsection	".line"
	.uaword	266	! radix.C:266
	.uahalf	0xffff
	.uaword	.L_LC124-.L_text_b
	.popsection
	ld [%i1+%lo(key_partition)],%o1
.L_LC125:

	.pushsection	".line"
	.uaword	270	! radix.C:270
	.uahalf	0xffff
	.uaword	.L_LC125-.L_text_b
	.popsection
	mov %l3,%o0
	ld [%l7+%lo(number_of_processors)],%l0
.L_LC126:

	.pushsection	".line"
	.uaword	266	! radix.C:266
	.uahalf	0xffff
	.uaword	.L_LC126-.L_text_b
	.popsection
	st %l2,[%o1+%o2]
.L_LC127:

	.pushsection	".line"
	.uaword	268	! radix.C:268
	.uahalf	0xffff
	.uaword	.L_LC127-.L_text_b
	.popsection
	add %l2,%l4,%l2
.L_LC128:

	.pushsection	".line"
	.uaword	270	! radix.C:270
	.uahalf	0xffff
	.uaword	.L_LC128-.L_text_b
	.popsection
	call .div,0
	mov %l0,%o1
	add %l2,%o0,%l2
.L_LC129:

	.pushsection	".line"
	.uaword	271	! radix.C:271
	.uahalf	0xffff
	.uaword	.L_LC129-.L_text_b
	.popsection
	mov %l3,%o0
	call .rem,0
	mov %l0,%o1
.L_LC130:

	.pushsection	".line"
	.uaword	272	! radix.C:272
	.uahalf	0xffff
	.uaword	.L_LC130-.L_text_b
	.popsection
	ld [%l5+%lo(num_keys)],%o1
.L_LC131:

	.pushsection	".line"
	.uaword	272	! radix.C:272
	.uahalf	0xffff
	.uaword	.L_LC131-.L_text_b
	.popsection
	cmp %l2,%o1
	bl .LL109
	mov %o0,%l3
.LL108:
.L_LC132:

	.pushsection	".line"
	.uaword	277	! radix.C:277
	.uahalf	0xffff
	.uaword	.L_LC132-.L_text_b
	.popsection
	mov 0,%l2
.L_LC133:

	.pushsection	".line"
	.uaword	278	! radix.C:278
	.uahalf	0xffff
	.uaword	.L_LC133-.L_text_b
	.popsection
	mov 0,%l3
.L_LC134:

	.pushsection	".line"
	.uaword	273	! radix.C:273
	.uahalf	0xffff
	.uaword	.L_LC134-.L_text_b
	.popsection
	sethi %hi(key_partition),%o0
	sll %i0,2,%o2
.L_LC135:

	.pushsection	".line"
	.uaword	279	! radix.C:279
	.uahalf	0xffff
	.uaword	.L_LC135-.L_text_b
	.popsection
	mov 0,%i0
.L_LC136:

	.pushsection	".line"
	.uaword	273	! radix.C:273
	.uahalf	0xffff
	.uaword	.L_LC136-.L_text_b
	.popsection
	ld [%o0+%lo(key_partition)],%o1
.L_LC137:

	.pushsection	".line"
	.uaword	275	! radix.C:275
	.uahalf	0xffff
	.uaword	.L_LC137-.L_text_b
	.popsection
	sethi %hi(radix),%l6
	ld [%l6+%lo(radix)],%l0
.L_LC138:

	.pushsection	".line"
	.uaword	273	! radix.C:273
	.uahalf	0xffff
	.uaword	.L_LC138-.L_text_b
	.popsection
	sethi %hi(num_keys),%o0
	ld [%o0+%lo(num_keys)],%o0
.L_LC139:

	.pushsection	".line"
	.uaword	275	! radix.C:275
	.uahalf	0xffff
	.uaword	.L_LC139-.L_text_b
	.popsection
	sethi %hi(number_of_processors),%l5
	ld [%l5+%lo(number_of_processors)],%l1
.L_LC140:

	.pushsection	".line"
	.uaword	273	! radix.C:273
	.uahalf	0xffff
	.uaword	.L_LC140-.L_text_b
	.popsection
	st %o0,[%o1+%o2]
.L_LC141:

	.pushsection	".line"
	.uaword	275	! radix.C:275
	.uahalf	0xffff
	.uaword	.L_LC141-.L_text_b
	.popsection
	mov %l0,%o0
	call .div,0
	mov %l1,%o1
	mov %o0,%l4
.L_LC142:

	.pushsection	".line"
	.uaword	276	! radix.C:276
	.uahalf	0xffff
	.uaword	.L_LC142-.L_text_b
	.popsection
	mov %l0,%o0
	call .rem,0
	mov %l1,%o1
.L_LC143:

	.pushsection	".line"
	.uaword	280	! radix.C:280
	.uahalf	0xffff
	.uaword	.L_LC143-.L_text_b
	.popsection
	cmp %i0,%l0
	bge .LL112
	mov %o0,%l1
	sethi %hi(rank_partition),%i1
	mov %l5,%l7
	mov %l6,%l5
.LL113:
.L_LC144:

	.pushsection	".line"
	.uaword	281	! radix.C:281
	.uahalf	0xffff
	.uaword	.L_LC144-.L_text_b
	.popsection
	sll %i0,2,%o2
.L_LC145:

	.pushsection	".line"
	.uaword	282	! radix.C:282
	.uahalf	0xffff
	.uaword	.L_LC145-.L_text_b
	.popsection
	add %i0,1,%i0
.L_LC146:

	.pushsection	".line"
	.uaword	284	! radix.C:284
	.uahalf	0xffff
	.uaword	.L_LC146-.L_text_b
	.popsection
	add %l3,%l1,%l3
.L_LC147:

	.pushsection	".line"
	.uaword	281	! radix.C:281
	.uahalf	0xffff
	.uaword	.L_LC147-.L_text_b
	.popsection
	ld [%i1+%lo(rank_partition)],%o1
.L_LC148:

	.pushsection	".line"
	.uaword	285	! radix.C:285
	.uahalf	0xffff
	.uaword	.L_LC148-.L_text_b
	.popsection
	mov %l3,%o0
	ld [%l7+%lo(number_of_processors)],%l0
.L_LC149:

	.pushsection	".line"
	.uaword	281	! radix.C:281
	.uahalf	0xffff
	.uaword	.L_LC149-.L_text_b
	.popsection
	st %l2,[%o1+%o2]
.L_LC150:

	.pushsection	".line"
	.uaword	283	! radix.C:283
	.uahalf	0xffff
	.uaword	.L_LC150-.L_text_b
	.popsection
	add %l2,%l4,%l2
.L_LC151:

	.pushsection	".line"
	.uaword	285	! radix.C:285
	.uahalf	0xffff
	.uaword	.L_LC151-.L_text_b
	.popsection
	call .div,0
	mov %l0,%o1
	add %l2,%o0,%l2
.L_LC152:

	.pushsection	".line"
	.uaword	286	! radix.C:286
	.uahalf	0xffff
	.uaword	.L_LC152-.L_text_b
	.popsection
	mov %l3,%o0
	call .rem,0
	mov %l0,%o1
.L_LC153:

	.pushsection	".line"
	.uaword	287	! radix.C:287
	.uahalf	0xffff
	.uaword	.L_LC153-.L_text_b
	.popsection
	ld [%l5+%lo(radix)],%o1
.L_LC154:

	.pushsection	".line"
	.uaword	287	! radix.C:287
	.uahalf	0xffff
	.uaword	.L_LC154-.L_text_b
	.popsection
	cmp %l2,%o1
	bl .LL113
	mov %o0,%l3
.LL112:
.L_LC155:

	.pushsection	".line"
	.uaword	326	! radix.C:326
	.uahalf	0xffff
	.uaword	.L_LC155-.L_text_b
	.popsection
	mov 1,%l2
.L_LC156:

	.pushsection	".line"
	.uaword	288	! radix.C:288
	.uahalf	0xffff
	.uaword	.L_LC156-.L_text_b
	.popsection
	sethi %hi(rank_partition),%o0
	ld [%o0+%lo(rank_partition)],%o2
	sll %i0,2,%o3
	sethi %hi(radix),%o0
	ld [%o0+%lo(radix)],%o1
.L_LC157:

	.pushsection	".line"
	.uaword	326	! radix.C:326
	.uahalf	0xffff
	.uaword	.L_LC157-.L_text_b
	.popsection
	sethi %hi(number_of_processors),%o4
	ld [%o4+%lo(number_of_processors)],%o0
.L_LC158:

	.pushsection	".line"
	.uaword	288	! radix.C:288
	.uahalf	0xffff
	.uaword	.L_LC158-.L_text_b
	.popsection
	st %o1,[%o2+%o3]
.L_LC159:

	.pushsection	".line"
	.uaword	326	! radix.C:326
	.uahalf	0xffff
	.uaword	.L_LC159-.L_text_b
	.popsection
	cmp %l2,%o0
	bge .LL116
	sethi %hi(slave_sort),%o0
	sethi %hi(ANLglob),%l5
	or %o0,%lo(slave_sort),%l4
	sethi %hi(ZZZ_slave),%l3
	sethi %hi(.LLC25),%l1
	mov %o4,%l0
.L_LC160:

	.pushsection	".line"
	.uaword	327	! radix.C:327
	.uahalf	0xffff
	.uaword	.L_LC160-.L_text_b
	.popsection
	ld [%l5+%lo(ANLglob)],%o2
.LL152:
	st %l4,[%o2+12]
	ld [%o2+8],%o1
	add %o1,1,%o0
	st %o0,[%o2+8]
	cmp %o1,31
	bg .LL119
	or %l1,%lo(.LLC25),%o0
.L_B16:
.L_B16_e:
	ld [%o2+8],%o0
	st %o0,[%o2+4]
	ld [%o2+8],%o0
	call ANL_start_p,0
	or %l3,%lo(ZZZ_slave),%o1
	b .LL151
	ld [%l0+%lo(number_of_processors)],%o0
.LL119:
	call printf,0
	mov 32,%o1
.L_LC161:

	.pushsection	".line"
	.uaword	326	! radix.C:326
	.uahalf	0xffff
	.uaword	.L_LC161-.L_text_b
	.popsection
	ld [%l0+%lo(number_of_processors)],%o0
.LL151:
	add %l2,1,%l2
	cmp %l2,%o0
	bl .LL152
	ld [%l5+%lo(ANLglob)],%o2
.LL116:
.L_LC162:

	.pushsection	".line"
	.uaword	330	! radix.C:330
	.uahalf	0xffff
	.uaword	.L_LC162-.L_text_b
	.popsection
.L_B17:
	call slave_sort,0
	mov 1,%l0
.L_LC163:

	.pushsection	".line"
	.uaword	332	! radix.C:332
	.uahalf	0xffff
	.uaword	.L_LC163-.L_text_b
	.popsection
	sethi %hi(number_of_processors),%o1
	ld [%o1+%lo(number_of_processors)],%o0
	add %o0,-1,%o0
	cmp %l0,%o0
	bg .LL123
	nop
	mov %o1,%l1
.LL125:
	call wait,0
	mov 0,%o0
	ld [%l1+%lo(number_of_processors)],%o0
	add %l0,1,%l0
	add %o0,-1,%o0
	cmp %l0,%o0
	ble .LL125
	nop
.LL123:
.L_B17_e:
	call trap,0
	mov 4,%o0
.L_LC164:

	.pushsection	".line"
	.uaword	334	! radix.C:334
	.uahalf	0xffff
	.uaword	.L_LC164-.L_text_b
	.popsection
	sethi %hi(.LLC19),%o0
	call printf,0
	or %o0,%lo(.LLC19),%o0
.L_LC165:

	.pushsection	".line"
	.uaword	335	! radix.C:335
	.uahalf	0xffff
	.uaword	.L_LC165-.L_text_b
	.popsection
	sethi %hi(.LLC26),%o0
	call printf,0
	or %o0,%lo(.LLC26),%o0
.L_LC166:

	.pushsection	".line"
	.uaword	336	! radix.C:336
	.uahalf	0xffff
	.uaword	.L_LC166-.L_text_b
	.popsection
	sethi %hi(.LLC27),%o0
	call printf,0
	or %o0,%lo(.LLC27),%o0
.L_LC167:

	.pushsection	".line"
	.uaword	337	! radix.C:337
	.uahalf	0xffff
	.uaword	.L_LC167-.L_text_b
	.popsection
	sethi %hi(.LLC28),%o0
	call printf,0
	or %o0,%lo(.LLC28),%o0
.L_LC168:

	.pushsection	".line"
	.uaword	338	! radix.C:338
	.uahalf	0xffff
	.uaword	.L_LC168-.L_text_b
	.popsection
	sethi %hi(global),%l0
	ld [%l0+%lo(global)],%o1
	ld [%o1+300],%o0
	ld [%o1+292],%o2
	ld [%o1+296],%o3
	ldd [%o0],%g2
	ldd [%o2],%o4
	sethi %hi(.LLC29),%o0
	mov %g2,%o1
	mov %g3,%o2
	ldd [%o3],%g2
	or %o0,%lo(.LLC29),%o0
	mov %o4,%o3
	mov %o5,%o4
	st %g3,[%sp+92]
	call printf,0
	mov %g2,%o5
.L_LC169:

	.pushsection	".line"
	.uaword	341	! radix.C:341
	.uahalf	0xffff
	.uaword	.L_LC169-.L_text_b
	.popsection
	sethi %hi(dostats),%o0
	ld [%o0+%lo(dostats)],%o0
	cmp %o0,0
	be,a .LL153
	sethi %hi(.LLC19),%l0
.L_LC170:

	.pushsection	".line"
	.uaword	342	! radix.C:342
	.uahalf	0xffff
	.uaword	.L_LC170-.L_text_b
	.popsection
	ld [%l0+%lo(global)],%o1
	ld [%o1+300],%o2
	ldd [%o2],%f12
.L_LC171:

	.pushsection	".line"
	.uaword	343	! radix.C:343
	.uahalf	0xffff
	.uaword	.L_LC171-.L_text_b
	.popsection
	ld [%o1+292],%o0
.L_LC172:

	.pushsection	".line"
	.uaword	342	! radix.C:342
	.uahalf	0xffff
	.uaword	.L_LC172-.L_text_b
	.popsection
	std %f12,[%fp-24]
	std %f12,[%fp-32]
.L_LC173:

	.pushsection	".line"
	.uaword	343	! radix.C:343
	.uahalf	0xffff
	.uaword	.L_LC173-.L_text_b
	.popsection
	ldd [%o0],%f12
.L_LC174:

	.pushsection	".line"
	.uaword	342	! radix.C:342
	.uahalf	0xffff
	.uaword	.L_LC174-.L_text_b
	.popsection
	ldd [%fp-24],%f10
.L_LC175:

	.pushsection	".line"
	.uaword	343	! radix.C:343
	.uahalf	0xffff
	.uaword	.L_LC175-.L_text_b
	.popsection
	std %f12,[%fp-40]
.L_LC176:

	.pushsection	".line"
	.uaword	344	! radix.C:344
	.uahalf	0xffff
	.uaword	.L_LC176-.L_text_b
	.popsection
	ld [%o1+296],%o0
.L_LC177:

	.pushsection	".line"
	.uaword	343	! radix.C:343
	.uahalf	0xffff
	.uaword	.L_LC177-.L_text_b
	.popsection
	std %f12,[%fp-48]
.L_LC178:

	.pushsection	".line"
	.uaword	344	! radix.C:344
	.uahalf	0xffff
	.uaword	.L_LC178-.L_text_b
	.popsection
	ldd [%o0],%f6
.L_LC179:

	.pushsection	".line"
	.uaword	345	! radix.C:345
	.uahalf	0xffff
	.uaword	.L_LC179-.L_text_b
	.popsection
	mov 1,%l2
.L_LC180:

	.pushsection	".line"
	.uaword	343	! radix.C:343
	.uahalf	0xffff
	.uaword	.L_LC180-.L_text_b
	.popsection
	ldd [%fp-40],%f8
.L_LC181:

	.pushsection	".line"
	.uaword	344	! radix.C:344
	.uahalf	0xffff
	.uaword	.L_LC181-.L_text_b
	.popsection
	fmovs %f6,%f4
	fmovs %f7,%f5
.L_LC182:

	.pushsection	".line"
	.uaword	345	! radix.C:345
	.uahalf	0xffff
	.uaword	.L_LC182-.L_text_b
	.popsection
	sethi %hi(number_of_processors),%o0
	ld [%o0+%lo(number_of_processors)],%o0
.L_LC183:

	.pushsection	".line"
	.uaword	345	! radix.C:345
	.uahalf	0xffff
	.uaword	.L_LC183-.L_text_b
	.popsection
	cmp %l2,%o0
	bge .LL129
	std %f6,[%fp-56]
	mov %o1,%o4
	mov %o2,%o3
	mov %o0,%o5
.LL131:
.L_LC184:

	.pushsection	".line"
	.uaword	346	! radix.C:346
	.uahalf	0xffff
	.uaword	.L_LC184-.L_text_b
	.popsection
	sll %l2,3,%o0
	ldd [%o3+%o0],%f2
	ldd [%fp-32],%f12
	fcmped %f2,%f12
	nop
	fbule .LL132
	nop
.L_LC185:

	.pushsection	".line"
	.uaword	347	! radix.C:347
	.uahalf	0xffff
	.uaword	.L_LC185-.L_text_b
	.popsection
	ldd [%o3+%o0],%f12
	std %f12,[%fp-32]
.LL132:
.L_LC186:

	.pushsection	".line"
	.uaword	349	! radix.C:349
	.uahalf	0xffff
	.uaword	.L_LC186-.L_text_b
	.popsection
	ldd [%o3+%o0],%f2
	ldd [%fp-24],%f12
	fcmped %f2,%f12
	nop
	fbuge,a .LL154
	ld [%o4+292],%o2
.L_LC187:

	.pushsection	".line"
	.uaword	350	! radix.C:350
	.uahalf	0xffff
	.uaword	.L_LC187-.L_text_b
	.popsection
	ldd [%o3+%o0],%f12
	std %f12,[%fp-24]
.L_LC188:

	.pushsection	".line"
	.uaword	352	! radix.C:352
	.uahalf	0xffff
	.uaword	.L_LC188-.L_text_b
	.popsection
	ld [%o4+292],%o2
.LL154:
	ldd [%fp-48],%f12
	ldd [%o2+%o0],%f2
	fcmped %f2,%f12
	nop
	fbule .LL134
	nop
.L_LC189:

	.pushsection	".line"
	.uaword	353	! radix.C:353
	.uahalf	0xffff
	.uaword	.L_LC189-.L_text_b
	.popsection
	ldd [%o2+%o0],%f12
	std %f12,[%fp-48]
.LL134:
.L_LC190:

	.pushsection	".line"
	.uaword	355	! radix.C:355
	.uahalf	0xffff
	.uaword	.L_LC190-.L_text_b
	.popsection
	ldd [%o2+%o0],%f2
	ldd [%fp-40],%f12
	fcmped %f2,%f12
	nop
	fbuge,a .LL155
	ld [%o4+296],%o1
.L_LC191:

	.pushsection	".line"
	.uaword	356	! radix.C:356
	.uahalf	0xffff
	.uaword	.L_LC191-.L_text_b
	.popsection
	ldd [%o2+%o0],%f12
	std %f12,[%fp-40]
.L_LC192:

	.pushsection	".line"
	.uaword	358	! radix.C:358
	.uahalf	0xffff
	.uaword	.L_LC192-.L_text_b
	.popsection
	ld [%o4+296],%o1
.LL155:
	ldd [%fp-56],%f12
	ldd [%o1+%o0],%f2
	fcmped %f2,%f12
	nop
	fbule .LL136
	nop
.L_LC193:

	.pushsection	".line"
	.uaword	359	! radix.C:359
	.uahalf	0xffff
	.uaword	.L_LC193-.L_text_b
	.popsection
	ldd [%o1+%o0],%f12
	std %f12,[%fp-56]
.LL136:
.L_LC194:

	.pushsection	".line"
	.uaword	361	! radix.C:361
	.uahalf	0xffff
	.uaword	.L_LC194-.L_text_b
	.popsection
	ldd [%o1+%o0],%f2
	fcmped %f2,%f6
	nop
	fbl,a .LL137
	ldd [%o1+%o0],%f6
.LL137:
.L_LC195:

	.pushsection	".line"
	.uaword	364	! radix.C:364
	.uahalf	0xffff
	.uaword	.L_LC195-.L_text_b
	.popsection
	ldd [%o3+%o0],%f2
	faddd %f10,%f2,%f10
.L_LC196:

	.pushsection	".line"
	.uaword	365	! radix.C:365
	.uahalf	0xffff
	.uaword	.L_LC196-.L_text_b
	.popsection
	ldd [%o2+%o0],%f2
	faddd %f8,%f2,%f8
.L_LC197:

	.pushsection	".line"
	.uaword	366	! radix.C:366
	.uahalf	0xffff
	.uaword	.L_LC197-.L_text_b
	.popsection
	ldd [%o1+%o0],%f2
.L_LC198:

	.pushsection	".line"
	.uaword	345	! radix.C:345
	.uahalf	0xffff
	.uaword	.L_LC198-.L_text_b
	.popsection
	add %l2,1,%l2
	cmp %l2,%o5
	bl .LL131
	faddd %f4,%f2,%f4
.LL129:
.L_LC199:

	.pushsection	".line"
	.uaword	368	! radix.C:368
	.uahalf	0xffff
	.uaword	.L_LC199-.L_text_b
	.popsection
	sethi %hi(number_of_processors),%o1
	ld [%o1+%lo(number_of_processors)],%o0
	st %o0,[%fp-16]
	ld [%fp-16],%f13
	fitod %f13,%f2
	fdivd %f10,%f2,%f10
.L_LC200:

	.pushsection	".line"
	.uaword	369	! radix.C:369
	.uahalf	0xffff
	.uaword	.L_LC200-.L_text_b
	.popsection
	fdivd %f8,%f2,%f8
.L_LC201:

	.pushsection	".line"
	.uaword	371	! radix.C:371
	.uahalf	0xffff
	.uaword	.L_LC201-.L_text_b
	.popsection
	mov 1,%l2
	cmp %l2,%o0
	bge .LL140
	fdivd %f4,%f2,%f4
	sethi %hi(.LLC30),%l3
	sethi %hi(global),%l1
	mov %o1,%l0
.LL142:
.L_LC202:

	.pushsection	".line"
	.uaword	372	! radix.C:372
	.uahalf	0xffff
	.uaword	.L_LC202-.L_text_b
	.popsection
	ld [%l1+%lo(global)],%g2
	ld [%g2+300],%o0
	ld [%g2+292],%o1
	sll %l2,3,%g3
	ldd [%o0+%g3],%o2
	ld [%g2+296],%g2
	ldd [%o1+%g3],%o4
	or %l3,%lo(.LLC30),%o0
	ldd [%g2+%g3],%g2
	mov %l2,%o1
	st %g2,[%sp+92]
	st %g3,[%sp+96]
	std %f4,[%fp-64]
	std %f6,[%fp-72]
	std %f8,[%fp-80]
	call printf,0
	std %f10,[%fp-88]
.L_LC203:

	.pushsection	".line"
	.uaword	371	! radix.C:371
	.uahalf	0xffff
	.uaword	.L_LC203-.L_text_b
	.popsection
	ld [%l0+%lo(number_of_processors)],%o0
	ldd [%fp-64],%f4
	ldd [%fp-72],%f6
	ldd [%fp-80],%f8
	add %l2,1,%l2
	cmp %l2,%o0
	bl .LL142
	ldd [%fp-88],%f10
.LL140:
.L_LC204:

	.pushsection	".line"
	.uaword	376	! radix.C:376
	.uahalf	0xffff
	.uaword	.L_LC204-.L_text_b
	.popsection
	st %f5,[%sp+92]
	st %f4,[%fp-16]
	sethi %hi(.LLC31),%o0
	ld [%fp-16],%g1
	or %o0,%lo(.LLC31),%o0
	std %f10,[%fp-16]
	ld [%fp-16],%o1
	ld [%fp-12],%o2
	std %f6,[%fp-72]
	std %f8,[%fp-16]
	ld [%fp-16],%o3
	ld [%fp-12],%o4
	call printf,0
	mov %g1,%o5
.L_LC205:

	.pushsection	".line"
	.uaword	377	! radix.C:377
	.uahalf	0xffff
	.uaword	.L_LC205-.L_text_b
	.popsection
	ldd [%fp-72],%f6
	st %f7,[%sp+92]
	st %f6,[%fp-16]
	ld [%fp-16],%g1
	sethi %hi(.LLC32),%o0
	ld [%fp-24],%o1
	ld [%fp-20],%o2
	or %o0,%lo(.LLC32),%o0
	ld [%fp-40],%o3
	ld [%fp-36],%o4
	call printf,0
	mov %g1,%o5
.L_LC206:

	.pushsection	".line"
	.uaword	378	! radix.C:378
	.uahalf	0xffff
	.uaword	.L_LC206-.L_text_b
	.popsection
	ld [%fp-52],%g1
	st %g1,[%sp+92]
	ld [%fp-56],%o5
	ld [%fp-32],%o1
	ld [%fp-28],%o2
	sethi %hi(.LLC33),%o0
	ld [%fp-48],%o3
	ld [%fp-44],%o4
	call printf,0
	or %o0,%lo(.LLC33),%o0
.L_LC207:

	.pushsection	".line"
	.uaword	379	! radix.C:379
	.uahalf	0xffff
	.uaword	.L_LC207-.L_text_b
	.popsection
	sethi %hi(.LLC19),%o0
	call printf,0
	or %o0,%lo(.LLC19),%o0
.L_LC208:

	.pushsection	".line"
	.uaword	382	! radix.C:382
	.uahalf	0xffff
	.uaword	.L_LC208-.L_text_b
	.popsection
	sethi %hi(.LLC19),%l0
.LL153:
	or %l0,%lo(.LLC19),%l0
	call printf,0
	mov %l0,%o0
.L_LC209:

	.pushsection	".line"
	.uaword	383	! radix.C:383
	.uahalf	0xffff
	.uaword	.L_LC209-.L_text_b
	.popsection
	sethi %hi(global),%l1
.L_LC210:

	.pushsection	".line"
	.uaword	384	! radix.C:384
	.uahalf	0xffff
	.uaword	.L_LC210-.L_text_b
	.popsection
	sethi %hi(.LLC34),%o0
.L_LC211:

	.pushsection	".line"
	.uaword	383	! radix.C:383
	.uahalf	0xffff
	.uaword	.L_LC211-.L_text_b
	.popsection
	ld [%l1+%lo(global)],%o1
.L_LC212:

	.pushsection	".line"
	.uaword	384	! radix.C:384
	.uahalf	0xffff
	.uaword	.L_LC212-.L_text_b
	.popsection
	or %o0,%lo(.LLC34),%o0
.L_LC213:

	.pushsection	".line"
	.uaword	383	! radix.C:383
	.uahalf	0xffff
	.uaword	.L_LC213-.L_text_b
	.popsection
	st %i5,[%o1+308]
.L_LC214:

	.pushsection	".line"
	.uaword	384	! radix.C:384
	.uahalf	0xffff
	.uaword	.L_LC214-.L_text_b
	.popsection
	call printf,0
	nop
.L_LC215:

	.pushsection	".line"
	.uaword	385	! radix.C:385
	.uahalf	0xffff
	.uaword	.L_LC215-.L_text_b
	.popsection
	ld [%l1+%lo(global)],%o0
	ld [%o0+308],%o1
	sethi %hi(.LLC35),%o0
	call printf,0
	or %o0,%lo(.LLC35),%o0
.L_LC216:

	.pushsection	".line"
	.uaword	387	! radix.C:387
	.uahalf	0xffff
	.uaword	.L_LC216-.L_text_b
	.popsection
	ld [%l1+%lo(global)],%o0
	ld [%o0+312],%o1
	sethi %hi(.LLC36),%o0
	call printf,0
	or %o0,%lo(.LLC36),%o0
.L_LC217:

	.pushsection	".line"
	.uaword	389	! radix.C:389
	.uahalf	0xffff
	.uaword	.L_LC217-.L_text_b
	.popsection
	ld [%l1+%lo(global)],%o0
	ld [%o0+316],%o1
	sethi %hi(.LLC37),%o0
	call printf,0
	or %o0,%lo(.LLC37),%o0
.L_LC218:

	.pushsection	".line"
	.uaword	391	! radix.C:391
	.uahalf	0xffff
	.uaword	.L_LC218-.L_text_b
	.popsection
	ld [%l1+%lo(global)],%o1
	ld [%o1+316],%o2
	sethi %hi(.LLC38),%o0
	ld [%o1+308],%o1
	or %o0,%lo(.LLC38),%o0
	call printf,0
	sub %o2,%o1,%o1
.L_LC219:

	.pushsection	".line"
	.uaword	393	! radix.C:393
	.uahalf	0xffff
	.uaword	.L_LC219-.L_text_b
	.popsection
	ld [%l1+%lo(global)],%o1
	ld [%o1+316],%o2
	sethi %hi(.LLC39),%o0
	ld [%o1+312],%o1
	or %o0,%lo(.LLC39),%o0
	call printf,0
	sub %o2,%o1,%o1
.L_LC220:

	.pushsection	".line"
	.uaword	395	! radix.C:395
	.uahalf	0xffff
	.uaword	.L_LC220-.L_text_b
	.popsection
	call printf,0
	mov %l0,%o0
.L_LC221:

	.pushsection	".line"
	.uaword	397	! radix.C:397
	.uahalf	0xffff
	.uaword	.L_LC221-.L_text_b
	.popsection
	sethi %hi(doprint),%o0
	ld [%o0+%lo(doprint)],%o0
	cmp %o0,0
	be .LL156
	sethi %hi(test_result),%o0
.L_LC222:

	.pushsection	".line"
	.uaword	398	! radix.C:398
	.uahalf	0xffff
	.uaword	.L_LC222-.L_text_b
	.popsection
	call printout,0
	nop
.L_LC223:

	.pushsection	".line"
	.uaword	400	! radix.C:400
	.uahalf	0xffff
	.uaword	.L_LC223-.L_text_b
	.popsection
	sethi %hi(test_result),%o0
.LL156:
	ld [%o0+%lo(test_result)],%o0
	cmp %o0,0
	be .LL145
	ld [%l1+%lo(global)],%o0
.L_LC224:

	.pushsection	".line"
	.uaword	401	! radix.C:401
	.uahalf	0xffff
	.uaword	.L_LC224-.L_text_b
	.popsection
	ld [%o0+304],%o0
	call test_sort,0
	nop
.LL145:
.L_LC225:

	.pushsection	".line"
	.uaword	404	! radix.C:404
	.uahalf	0xffff
	.uaword	.L_LC225-.L_text_b
	.popsection
	call exit,0
	mov 0,%o0
.L_LC226:

	.pushsection	".line"
	.uaword	405	! radix.C:405
	.uahalf	0xffff
	.uaword	.L_LC226-.L_text_b
	.popsection
.L_b6_e:
	ret
	restore
.L_f6_e:
.LLfe4:
	.size	 main,.LLfe4-main

	.pushsection	".debug_pubnames"
	.uaword	.L_P3
	.asciz	"main"
	.popsection

	.pushsection	".debug"
.L_P3:
.L_D18:
	.uaword	.L_D18_e-.L_D18
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D23
	.uahalf	0x38
	.asciz	"main"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	main
	.uahalf	0x121
	.uaword	.L_f6_e
	.uahalf	0x8041
	.uaword	.L_b6
	.uahalf	0x8051
	.uaword	.L_b6_e
.L_D18_e:
.L_D24:
	.uaword	.L_D24_e-.L_D24
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D25
	.uahalf	0x38
	.asciz	"argc"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l24_e-.L_l24
.L_l24:
	.byte	0x1
	.uaword	0x18
.L_l24_e:
.L_D24_e:
.L_D25:
	.uaword	.L_D25_e-.L_D25
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D26
	.uahalf	0x38
	.asciz	"argv"
	.uahalf	0x63
	.uahalf	.L_t25_e-.L_t25
.L_t25:
	.byte	0x1
	.uahalf	0x1
.L_t25_e:
	.uahalf	0x23
	.uahalf	.L_l25_e-.L_l25
.L_l25:
	.byte	0x1
	.uaword	0x19
.L_l25_e:
.L_D25_e:
.L_D26:
	.uaword	.L_D26_e-.L_D26
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D27
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l26_e-.L_l26
.L_l26:
	.byte	0x1
	.uaword	0x12
.L_l26_e:
.L_D26_e:
.L_D27:
	.uaword	.L_D27_e-.L_D27
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D28
	.uahalf	0x38
	.asciz	"p"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l27_e-.L_l27
.L_l27:
	.byte	0x1
	.uaword	0x18
.L_l27_e:
.L_D27_e:
.L_D28:
	.uaword	.L_D28_e-.L_D28
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D29
	.uahalf	0x38
	.asciz	"quotient"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l28_e-.L_l28
.L_l28:
	.byte	0x1
	.uaword	0x14
.L_l28_e:
.L_D28_e:
.L_D29:
	.uaword	.L_D29_e-.L_D29
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D30
	.uahalf	0x38
	.asciz	"remainder"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l29_e-.L_l29
.L_l29:
	.byte	0x1
	.uaword	0x11
.L_l29_e:
.L_D29_e:
.L_D30:
	.uaword	.L_D30_e-.L_D30
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D31
	.uahalf	0x38
	.asciz	"sum_i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l30_e-.L_l30
.L_l30:
	.byte	0x1
	.uaword	0x12
.L_l30_e:
.L_D30_e:
.L_D31:
	.uaword	.L_D31_e-.L_D31
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D32
	.uahalf	0x38
	.asciz	"sum_f"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l31_e-.L_l31
.L_l31:
	.byte	0x1
	.uaword	0x13
.L_l31_e:
.L_D31_e:
.L_D32:
	.uaword	.L_D32_e-.L_D32
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D33
	.uahalf	0x38
	.asciz	"mistake"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l32_e-.L_l32
.L_l32:
.L_l32_e:
.L_D32_e:
.L_D33:
	.uaword	.L_D33_e-.L_D33
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D34
	.uahalf	0x38
	.asciz	"size"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l33_e-.L_l33
.L_l33:
.L_l33_e:
.L_D33_e:
.L_D34:
	.uaword	.L_D34_e-.L_D34
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D35
	.uahalf	0x38
	.asciz	"temp"
	.uahalf	0x63
	.uahalf	.L_t34_e-.L_t34
.L_t34:
	.byte	0x1
	.byte	0x1
	.uahalf	0x7
.L_t34_e:
	.uahalf	0x23
	.uahalf	.L_l34_e-.L_l34
.L_l34:
	.byte	0x1
	.uaword	0xa
.L_l34_e:
.L_D34_e:
.L_D35:
	.uaword	.L_D35_e-.L_D35
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D36
	.uahalf	0x38
	.asciz	"temp2"
	.uahalf	0x63
	.uahalf	.L_t35_e-.L_t35
.L_t35:
	.byte	0x1
	.byte	0x1
	.uahalf	0x7
.L_t35_e:
	.uahalf	0x23
	.uahalf	.L_l35_e-.L_l35
.L_l35:
.L_l35_e:
.L_D35_e:
.L_D36:
	.uaword	.L_D36_e-.L_D36
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D37
	.uahalf	0x38
	.asciz	"a"
	.uahalf	0x63
	.uahalf	.L_t36_e-.L_t36
.L_t36:
	.byte	0x1
	.uahalf	0x7
.L_t36_e:
	.uahalf	0x23
	.uahalf	.L_l36_e-.L_l36
.L_l36:
	.byte	0x1
	.uaword	0xb
.L_l36_e:
.L_D36_e:
.L_D37:
	.uaword	.L_D37_e-.L_D37
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D38
	.uahalf	0x38
	.asciz	"c"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l37_e-.L_l37
.L_l37:
	.byte	0x1
	.uaword	0x8
.L_l37_e:
.L_D37_e:
.L_D38:
	.uaword	.L_D38_e-.L_D38
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D39
	.uahalf	0x38
	.asciz	"n1"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l38_e-.L_l38
.L_l38:
.L_l38_e:
.L_D38_e:
.L_P4:
.L_D39:
	.uaword	.L_D39_e-.L_D39
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D40
	.uahalf	0x38
	.asciz	"optarg"
	.uahalf	0x63
	.uahalf	.L_t39_e-.L_t39
.L_t39:
	.byte	0x1
	.uahalf	0x1
.L_t39_e:
.L_D39_e:
.L_D40:
	.uaword	.L_D40_e-.L_D40
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D41
	.uahalf	0x38
	.asciz	"mint"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l40_e-.L_l40
.L_l40:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffe8
	.byte	0x7
.L_l40_e:
.L_D40_e:
.L_D41:
	.uaword	.L_D41_e-.L_D41
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D42
	.uahalf	0x38
	.asciz	"maxt"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l41_e-.L_l41
.L_l41:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffe0
	.byte	0x7
.L_l41_e:
.L_D41_e:
.L_D42:
	.uaword	.L_D42_e-.L_D42
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D43
	.uahalf	0x38
	.asciz	"avgt"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l42_e-.L_l42
.L_l42:
	.byte	0x1
	.uaword	0x2a
.L_l42_e:
.L_D42_e:
.L_D43:
	.uaword	.L_D43_e-.L_D43
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D44
	.uahalf	0x38
	.asciz	"minrank"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l43_e-.L_l43
.L_l43:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffd8
	.byte	0x7
.L_l43_e:
.L_D43_e:
.L_D44:
	.uaword	.L_D44_e-.L_D44
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D45
	.uahalf	0x38
	.asciz	"maxrank"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l44_e-.L_l44
.L_l44:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffd0
	.byte	0x7
.L_l44_e:
.L_D44_e:
.L_D45:
	.uaword	.L_D45_e-.L_D45
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D46
	.uahalf	0x38
	.asciz	"avgrank"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l45_e-.L_l45
.L_l45:
	.byte	0x1
	.uaword	0x28
.L_l45_e:
.L_D45_e:
.L_D46:
	.uaword	.L_D46_e-.L_D46
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D47
	.uahalf	0x38
	.asciz	"minsort"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l46_e-.L_l46
.L_l46:
	.byte	0x1
	.uaword	0x26
.L_l46_e:
.L_D46_e:
.L_D47:
	.uaword	.L_D47_e-.L_D47
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D48
	.uahalf	0x38
	.asciz	"maxsort"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l47_e-.L_l47
.L_l47:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffc8
	.byte	0x7
.L_l47_e:
.L_D47_e:
.L_D48:
	.uaword	.L_D48_e-.L_D48
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D49
	.uahalf	0x38
	.asciz	"avgsort"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l48_e-.L_l48
.L_l48:
	.byte	0x1
	.uaword	0x24
.L_l48_e:
.L_D48_e:
.L_D49:
	.uaword	.L_D49_e-.L_D49
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D50
	.uahalf	0x38
	.asciz	"start"
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l49_e-.L_l49
.L_l49:
	.byte	0x1
	.uaword	0x1d
.L_l49_e:
.L_D49_e:
.L_D50:
	.uaword	.L_D50_e-.L_D50
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D51
	.uahalf	0x38
	.asciz	"done"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l50_e-.L_l50
.L_l50:
.L_l50_e:
.L_D50_e:
.L_D51:
	.uaword	.L_D51_e-.L_D51
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D52
	.uahalf	0x38
	.asciz	"start_p"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l51_e-.L_l51
.L_l51:
.L_l51_e:
.L_D51_e:
.L_D52:
	.uaword	.L_D52_e-.L_D52
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D53
	.uahalf	0x38
	.asciz	"end_p"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l52_e-.L_l52
.L_l52:
.L_l52_e:
.L_D52_e:
.L_D53:
	.uaword	.L_D53_e-.L_D53
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D54
	.uahalf	0x38
	.asciz	"level"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l53_e-.L_l53
.L_l53:
.L_l53_e:
.L_D53_e:
.L_D54:
	.uaword	.L_D54_e-.L_D54
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D55
	.uahalf	0x38
	.asciz	"index"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l54_e-.L_l54
.L_l54:
.L_l54_e:
.L_D54_e:
.L_D55:
	.uaword	.L_D55_e-.L_D55
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D56
	.uahalf	0x38
	.asciz	"base"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l55_e-.L_l55
.L_l55:
.L_l55_e:
.L_D55_e:
.L_D56:
	.uaword	.L_D56_e-.L_D56
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D57
	.uahalf	0x38
	.asciz	"offset"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l56_e-.L_l56
.L_l56:
.L_l56_e:
.L_D56_e:
.L_D57:
	.uaword	.L_D57_e-.L_D57
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D58
	.uahalf	0x38
	.asciz	"toffset"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l57_e-.L_l57
.L_l57:
.L_l57_e:
.L_D57_e:
.L_D58:
	.uaword	.L_D58_e-.L_D58
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D59
	.uahalf	0x111
	.uaword	.L_B7
	.uahalf	0x121
	.uaword	.L_B7_e
.L_D58_e:
.L_D60:
	.uaword	0x4
.L_D59:
	.uaword	.L_D59_e-.L_D59
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D61
	.uahalf	0x111
	.uaword	.L_B8
	.uahalf	0x121
	.uaword	.L_B8_e
.L_D59_e:
.L_D62:
	.uaword	.L_D62_e-.L_D62
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D63
	.uahalf	0x38
	.asciz	"q_num"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l62_e-.L_l62
.L_l62:
.L_l62_e:
.L_D62_e:
.L_D63:
	.uaword	.L_D63_e-.L_D63
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D64
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l63_e-.L_l63
.L_l63:
	.byte	0x1
	.uaword	0x9
.L_l63_e:
.L_D63_e:
.L_D64:
	.uaword	0x4
.L_D61:
	.uaword	.L_D61_e-.L_D61
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D65
	.uahalf	0x111
	.uaword	.L_B9
	.uahalf	0x121
	.uaword	.L_B9_e
.L_D61_e:
.L_D66:
	.uaword	.L_D66_e-.L_D66
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D67
	.uahalf	0x38
	.asciz	"q_num"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l66_e-.L_l66
.L_l66:
	.byte	0x1
	.uaword	0x11
.L_l66_e:
.L_D66_e:
.L_D67:
	.uaword	.L_D67_e-.L_D67
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D68
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l67_e-.L_l67
.L_l67:
.L_l67_e:
.L_D67_e:
.L_D68:
	.uaword	.L_D68_e-.L_D68
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D69
	.uahalf	0x111
	.uaword	.L_B10
	.uahalf	0x121
	.uaword	.L_B10_e
.L_D68_e:
.L_D70:
	.uaword	0x4
.L_D69:
	.uaword	0x4
.L_D65:
	.uaword	.L_D65_e-.L_D65
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D71
	.uahalf	0x111
	.uaword	.L_B11
	.uahalf	0x121
	.uaword	.L_B11_e
.L_D65_e:
.L_D72:
	.uaword	.L_D72_e-.L_D72
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D73
	.uahalf	0x38
	.asciz	"q_num"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l72_e-.L_l72
.L_l72:
	.byte	0x1
	.uaword	0x11
.L_l72_e:
.L_D72_e:
.L_D73:
	.uaword	.L_D73_e-.L_D73
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D74
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l73_e-.L_l73
.L_l73:
.L_l73_e:
.L_D73_e:
.L_D74:
	.uaword	.L_D74_e-.L_D74
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D75
	.uahalf	0x111
	.uaword	.L_B12
	.uahalf	0x121
	.uaword	.L_B12_e
.L_D74_e:
.L_D76:
	.uaword	0x4
.L_D75:
	.uaword	0x4
.L_D71:
	.uaword	.L_D71_e-.L_D71
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D77
	.uahalf	0x111
	.uaword	.L_B13
	.uahalf	0x121
	.uaword	.L_B13_e
.L_D71_e:
.L_D78:
	.uaword	.L_D78_e-.L_D78
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D79
	.uahalf	0x38
	.asciz	"p_dummy"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l78_e-.L_l78
.L_l78:
	.byte	0x1
	.uaword	0xa
.L_l78_e:
.L_D78_e:
.L_D79:
	.uaword	.L_D79_e-.L_D79
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D80
	.uahalf	0x111
	.uaword	.L_B14
	.uahalf	0x121
	.uaword	.L_B14_e
.L_D79_e:
.L_D81:
	.uaword	.L_D81_e-.L_D81
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D82
	.uahalf	0x38
	.asciz	"q_num"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l81_e-.L_l81
.L_l81:
	.byte	0x1
	.uaword	0x11
.L_l81_e:
.L_D81_e:
.L_D82:
	.uaword	.L_D82_e-.L_D82
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D83
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l82_e-.L_l82
.L_l82:
.L_l82_e:
.L_D82_e:
.L_D83:
	.uaword	.L_D83_e-.L_D83
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D84
	.uahalf	0x111
	.uaword	.L_B15
	.uahalf	0x121
	.uaword	.L_B15_e
.L_D83_e:
.L_D85:
	.uaword	0x4
.L_D84:
	.uaword	0x4
.L_D80:
	.uaword	0x4
.L_D77:
	.uaword	.L_D77_e-.L_D77
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D86
	.uahalf	0x111
	.uaword	.L_B16
	.uahalf	0x121
	.uaword	.L_B16_e
.L_D77_e:
.L_D87:
	.uaword	0x4
.L_D86:
	.uaword	.L_D86_e-.L_D86
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D88
	.uahalf	0x111
	.uaword	.L_B17
	.uahalf	0x121
	.uaword	.L_B17_e
.L_D86_e:
.L_D89:
	.uaword	.L_D89_e-.L_D89
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D90
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l89_e-.L_l89
.L_l89:
	.byte	0x1
	.uaword	0x10
.L_l89_e:
.L_D89_e:
.L_D90:
	.uaword	0x4
.L_D88:
	.uaword	0x4
	.popsection
.section	".rodata"
	.align 8
.LLC40:
	.long	0x0
	.long	0x0
	.align 8
.LLC41:
	.long	0x41f00000
	.long	0x0
.section	".text"
	.align 4
	.global slave_sort
	.type	 slave_sort,#function
	.proc	020
slave_sort:
.L_LC227:

	.pushsection	".line"
	.uaword	408	! radix.C:408
	.uahalf	0xffff
	.uaword	.L_LC227-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-264,%sp
	!#PROLOGUE# 1
.L_b7:
.L_LC228:

	.pushsection	".line"
	.uaword	409	! radix.C:409
	.uahalf	0xffff
	.uaword	.L_LC228-.L_text_b
	.popsection
.L_LC229:

	.pushsection	".line"
	.uaword	424	! radix.C:424
	.uahalf	0xffff
	.uaword	.L_LC229-.L_text_b
	.popsection
.L_B19:
	st %g0,[%fp-60]
.L_LC230:

	.pushsection	".line"
	.uaword	454	! radix.C:454
	.uahalf	0xffff
	.uaword	.L_LC230-.L_text_b
	.popsection
	mov 13,%o0
.L_LC231:

	.pushsection	".line"
	.uaword	433	! radix.C:433
	.uahalf	0xffff
	.uaword	.L_LC231-.L_text_b
	.popsection
	st %g0,[%fp-144]
	st %g0,[%fp-140]
.L_LC232:

	.pushsection	".line"
	.uaword	452	! radix.C:452
	.uahalf	0xffff
	.uaword	.L_LC232-.L_text_b
	.popsection
	sethi %hi(dostats),%o2
	ld [%o2+%lo(dostats)],%o2
.L_LC233:

	.pushsection	".line"
	.uaword	454	! radix.C:454
	.uahalf	0xffff
	.uaword	.L_LC233-.L_text_b
	.popsection
	sethi %hi(global),%l1
	ld [%l1+%lo(global)],%o1
.L_LC234:

	.pushsection	".line"
	.uaword	452	! radix.C:452
	.uahalf	0xffff
	.uaword	.L_LC234-.L_text_b
	.popsection
	st %o2,[%fp-164]
.L_LC235:

	.pushsection	".line"
	.uaword	454	! radix.C:454
	.uahalf	0xffff
	.uaword	.L_LC235-.L_text_b
	.popsection
	call trap,0
	add %o1,4,%o1
	sethi %hi(lock_model),%l2
.L_LC236:

	.pushsection	".line"
	.uaword	425	! radix.C:425
	.uahalf	0xffff
	.uaword	.L_LC236-.L_text_b
	.popsection
	mov 1,%g1
.L_LC237:

	.pushsection	".line"
	.uaword	434	! radix.C:434
	.uahalf	0xffff
	.uaword	.L_LC237-.L_text_b
	.popsection
	ldd [%fp-144],%f6
.L_LC238:

	.pushsection	".line"
	.uaword	425	! radix.C:425
	.uahalf	0xffff
	.uaword	.L_LC238-.L_text_b
	.popsection
	st %g1,[%fp-68]
.L_LC239:

	.pushsection	".line"
	.uaword	454	! radix.C:454
	.uahalf	0xffff
	.uaword	.L_LC239-.L_text_b
	.popsection
	ld [%l2+%lo(lock_model)],%o0
.L_LC240:

	.pushsection	".line"
	.uaword	434	! radix.C:434
	.uahalf	0xffff
	.uaword	.L_LC240-.L_text_b
	.popsection
.L_LC241:

	.pushsection	".line"
	.uaword	454	! radix.C:454
	.uahalf	0xffff
	.uaword	.L_LC241-.L_text_b
	.popsection
	cmp %o0,3
	be .LL158
	std %f6,[%fp-136]
.L_B20:
	ld [%l1+%lo(global)],%o0
	call cm_lock_backoff,0
	add %o0,4,%o0
.L_B20_e:
.LL158:
.L_B19_e:
.L_B21:
	ld [%l1+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,4,%o1
.L_LC242:

	.pushsection	".line"
	.uaword	455	! radix.C:455
	.uahalf	0xffff
	.uaword	.L_LC242-.L_text_b
	.popsection
	ld [%l1+%lo(global)],%o1
	ld [%o1],%i2
.L_LC243:

	.pushsection	".line"
	.uaword	456	! radix.C:456
	.uahalf	0xffff
	.uaword	.L_LC243-.L_text_b
	.popsection
	ld [%o1],%o2
	add %o2,1,%o2
	st %o2,[%o1]
	ld [%o1],%o2
.L_LC244:

	.pushsection	".line"
	.uaword	457	! radix.C:457
	.uahalf	0xffff
	.uaword	.L_LC244-.L_text_b
	.popsection
	mov 14,%o0
	call trap,0
	add %o1,4,%o1
	ld [%l2+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL159
	sethi %hi(radix),%l0
	ld [%l1+%lo(global)],%o0
	call cm_unlock,0
	add %o0,4,%o0
.LL159:
.L_B21_e:
.L_LC245:

	.pushsection	".line"
	.uaword	462	! radix.C:462
	.uahalf	0xffff
	.uaword	.L_LC245-.L_text_b
	.popsection
	ld [%l0+%lo(radix)],%o0
	call malloc,0
	sll %o0,2,%o0
.L_LC246:

	.pushsection	".line"
	.uaword	466	! radix.C:466
	.uahalf	0xffff
	.uaword	.L_LC246-.L_text_b
	.popsection
	sethi %hi(key_partition),%o1
	ld [%o1+%lo(key_partition)],%o3
	sll %i2,2,%o2
	ld [%o3+%o2],%g4
.L_LC247:

	.pushsection	".line"
	.uaword	467	! radix.C:467
	.uahalf	0xffff
	.uaword	.L_LC247-.L_text_b
	.popsection
	add %o2,%o3,%o3
	ld [%o3+4],%o3
.L_LC248:

	.pushsection	".line"
	.uaword	468	! radix.C:468
	.uahalf	0xffff
	.uaword	.L_LC248-.L_text_b
	.popsection
	sethi %hi(rank_partition),%o1
	ld [%o1+%lo(rank_partition)],%o1
.L_LC249:

	.pushsection	".line"
	.uaword	467	! radix.C:467
	.uahalf	0xffff
	.uaword	.L_LC249-.L_text_b
	.popsection
	st %o3,[%fp-52]
.L_LC250:

	.pushsection	".line"
	.uaword	468	! radix.C:468
	.uahalf	0xffff
	.uaword	.L_LC250-.L_text_b
	.popsection
	ld [%o1+%o2],%o3
.L_LC251:

	.pushsection	".line"
	.uaword	462	! radix.C:462
	.uahalf	0xffff
	.uaword	.L_LC251-.L_text_b
	.popsection
	st %o0,[%fp-76]
.L_LC252:

	.pushsection	".line"
	.uaword	466	! radix.C:466
	.uahalf	0xffff
	.uaword	.L_LC252-.L_text_b
	.popsection
	st %g4,[%fp-44]
.L_LC253:

	.pushsection	".line"
	.uaword	474	! radix.C:474
	.uahalf	0xffff
	.uaword	.L_LC253-.L_text_b
	.popsection
.L_B22:
	ld [%fp-44],%o0
	ld [%fp-52],%o1
	call init,0
	mov 0,%o2
.L_LC254:

	.pushsection	".line"
	.uaword	476	! radix.C:476
	.uahalf	0xffff
	.uaword	.L_LC254-.L_text_b
	.popsection
	mov 9,%o0
	ld [%l1+%lo(global)],%o1
	sethi %hi(number_of_processors),%l0
	ld [%l0+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,280,%o1
	ld [%l2+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL422
	mov 10,%o0
	ld [%l1+%lo(global)],%o1
	mov 13,%o0
	call trap,0
	add %o1,280,%o1
	ld [%l2+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL162
	ld [%l1+%lo(global)],%o0
.L_B23:
	call cm_lock_backoff,0
	add %o0,280,%o0
.L_B23_e:
.LL162:
	ld [%l1+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,280,%o1
	ld [%l1+%lo(global)],%o2
	ld [%l0+%lo(number_of_processors)],%o0
	ld [%o2+284],%o1
	add %o0,-1,%o0
	cmp %o1,%o0
	bge,a .LL423
	sethi %hi(global),%l0
.L_B24:
	ld [%o2+284],%o1
	add %o1,1,%o1
	st %o1,[%o2+284]
	ld [%o2+284],%o1
	mov 14,%o0
	call trap,0
	add %o2,280,%o1
	ld [%l2+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL164
	ld [%l1+%lo(global)],%o0
	call cm_unlock,0
	add %o0,280,%o0
.LL164:
.L_B24_e:
	ld [%l1+%lo(global)],%o1
	mov 13,%o0
	call trap,0
	add %o1,288,%o1
	ld [%l2+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL165
	ld [%l1+%lo(global)],%o0
.L_B25:
	call cm_lock_backoff,0
	add %o0,288,%o0
.L_B25_e:
.LL165:
	ld [%l1+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,288,%o1
	sethi %hi(global),%l0
.LL423:
	ld [%l0+%lo(global)],%o2
	ld [%o2+284],%o0
	cmp %o0,0
	bne .LL167
	mov 14,%o0
.L_B26:
	call trap,0
	add %o2,280,%o1
	sethi %hi(lock_model),%o0
	ld [%o0+%lo(lock_model)],%o0
	cmp %o0,3
	be,a .LL422
	mov 10,%o0
.L_B26_e:
	ld [%l0+%lo(global)],%o0
	b .LL408
	add %o0,280,%o0
.LL167:
.L_B27:
	ld [%o2+284],%o1
	add %o1,-1,%o1
	st %o1,[%o2+284]
	ld [%o2+284],%o1
	mov 14,%o0
	call trap,0
	add %o2,288,%o1
	sethi %hi(lock_model),%o0
	ld [%o0+%lo(lock_model)],%o0
	cmp %o0,3
	be,a .LL422
	mov 10,%o0
	ld [%l0+%lo(global)],%o0
	add %o0,288,%o0
.LL408:
	call cm_unlock,0
	nop
.L_B27_e:
.L_B28:
.L_B28_e:
.L_I7_508:
.L_B22_e:
.L_B29:
	mov 10,%o0
.LL422:
	sethi %hi(global),%l0
	ld [%l0+%lo(global)],%o1
	sethi %hi(number_of_processors),%l1
	ld [%l1+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,280,%o1
.L_LC255:

	.pushsection	".line"
	.uaword	480	! radix.C:480
	.uahalf	0xffff
	.uaword	.L_LC255-.L_text_b
	.popsection
	call trap,0
	mov 3,%o0
.L_LC256:

	.pushsection	".line"
	.uaword	482	! radix.C:482
	.uahalf	0xffff
	.uaword	.L_LC256-.L_text_b
	.popsection
	ld [%l0+%lo(global)],%o1
	mov 9,%o0
	ld [%l1+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,280,%o1
	sethi %hi(lock_model),%l2
	ld [%l2+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL173
	mov 13,%o0
	ld [%l0+%lo(global)],%o1
	call trap,0
	add %o1,280,%o1
	ld [%l2+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL174
	ld [%l0+%lo(global)],%o0
.L_B30:
	call cm_lock_backoff,0
	add %o0,280,%o0
.L_B30_e:
.LL174:
	ld [%l0+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,280,%o1
	ld [%l0+%lo(global)],%o2
	ld [%l1+%lo(number_of_processors)],%o0
	ld [%o2+284],%o1
	add %o0,-1,%o0
	cmp %o1,%o0
	bge,a .LL424
	sethi %hi(global),%l0
.L_B31:
	ld [%o2+284],%o1
	add %o1,1,%o1
	st %o1,[%o2+284]
	ld [%o2+284],%o1
	mov 14,%o0
	call trap,0
	add %o2,280,%o1
	ld [%l2+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL176
	ld [%l0+%lo(global)],%o0
	call cm_unlock,0
	add %o0,280,%o0
.LL176:
.L_B31_e:
	ld [%l0+%lo(global)],%o1
	mov 13,%o0
	call trap,0
	add %o1,288,%o1
	ld [%l2+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL177
	ld [%l0+%lo(global)],%o0
.L_B32:
	call cm_lock_backoff,0
	add %o0,288,%o0
.L_B32_e:
.LL177:
	ld [%l0+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,288,%o1
	sethi %hi(global),%l0
.LL424:
	ld [%l0+%lo(global)],%o2
	ld [%o2+284],%o0
	cmp %o0,0
	bne .LL179
	mov 14,%o0
.L_B33:
	call trap,0
	add %o2,280,%o1
	sethi %hi(lock_model),%o0
	ld [%o0+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL173
	ld [%l0+%lo(global)],%o0
.L_B33_e:
	b .LL409
	add %o0,280,%o0
.LL179:
.L_B34:
	ld [%o2+284],%o1
	add %o1,-1,%o1
	st %o1,[%o2+284]
	ld [%o2+284],%o1
	mov 14,%o0
	call trap,0
	add %o2,288,%o1
	sethi %hi(lock_model),%o0
	ld [%o0+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL173
	ld [%l0+%lo(global)],%o0
	add %o0,288,%o0
.LL409:
	call cm_unlock,0
	nop
.L_B34_e:
.L_B35:
.L_B35_e:
.L_I7_834:
.LL173:
.L_B29_e:
	mov 10,%o0
	sethi %hi(global),%o1
	ld [%o1+%lo(global)],%o1
	sethi %hi(number_of_processors),%o2
	ld [%o2+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,280,%o1
.L_LC257:

	.pushsection	".line"
	.uaword	484	! radix.C:484
	.uahalf	0xffff
	.uaword	.L_LC257-.L_text_b
	.popsection
	cmp %i2,0
	be .LL186
	ld [%fp-164],%g1
	cmp %g1,0
	be .LL425
	sethi %hi(rank_me),%o2
.LL186:
.L_LC258:

	.pushsection	".line"
	.uaword	485	! radix.C:485
	.uahalf	0xffff
	.uaword	.L_LC258-.L_text_b
	.popsection
	call trap,0
	mov 24,%o0
	st %o0,[%fp-84]
.L_LC259:

	.pushsection	".line"
	.uaword	490	! radix.C:490
	.uahalf	0xffff
	.uaword	.L_LC259-.L_text_b
	.popsection
	sethi %hi(rank_me),%o2
.LL425:
	sll %i2,2,%o3
.L_LC260:

	.pushsection	".line"
	.uaword	491	! radix.C:491
	.uahalf	0xffff
	.uaword	.L_LC260-.L_text_b
	.popsection
	sll %i2,10,%o1
	add %o1,%i2,%o1
	sll %o1,2,%o1
	sethi %hi(gp),%o0
	or %o0,%lo(gp),%o0
.L_LC261:

	.pushsection	".line"
	.uaword	490	! radix.C:490
	.uahalf	0xffff
	.uaword	.L_LC261-.L_text_b
	.popsection
	ld [%o2+%lo(rank_me)],%o2
.L_LC262:

	.pushsection	".line"
	.uaword	491	! radix.C:491
	.uahalf	0xffff
	.uaword	.L_LC262-.L_text_b
	.popsection
	add %o1,%o0,%o1
.L_LC263:

	.pushsection	".line"
	.uaword	490	! radix.C:490
	.uahalf	0xffff
	.uaword	.L_LC263-.L_text_b
	.popsection
	ld [%o2+%o3],%i5
.L_LC264:

	.pushsection	".line"
	.uaword	492	! radix.C:492
	.uahalf	0xffff
	.uaword	.L_LC264-.L_text_b
	.popsection
	sethi %hi(max_num_digits),%o0
	ld [%o0+%lo(max_num_digits)],%o2
	st %g0,[%fp-20]
	ld [%fp-20],%g4
.L_LC265:

	.pushsection	".line"
	.uaword	491	! radix.C:491
	.uahalf	0xffff
	.uaword	.L_LC265-.L_text_b
	.popsection
	sethi %hi(4096),%o0
.L_LC266:

	.pushsection	".line"
	.uaword	492	! radix.C:492
	.uahalf	0xffff
	.uaword	.L_LC266-.L_text_b
	.popsection
	cmp %g4,%o2
	bge .LL188
	ld [%o1+%o0],%i4
	sethi %hi(global),%l6
	sethi %hi(lock_model),%i1
	sethi %hi(32768),%i3
.LL190:
.L_LC267:

	.pushsection	".line"
	.uaword	493	! radix.C:493
	.uahalf	0xffff
	.uaword	.L_LC267-.L_text_b
	.popsection
	sethi %hi(log2_radix),%o0
	ld [%o0+%lo(log2_radix)],%o1
	call .umul,0
	ld [%fp-20],%o0
.L_LC268:

	.pushsection	".line"
	.uaword	498	! radix.C:498
	.uahalf	0xffff
	.uaword	.L_LC268-.L_text_b
	.popsection
	cmp %i2,0
.L_LC269:

	.pushsection	".line"
	.uaword	494	! radix.C:494
	.uahalf	0xffff
	.uaword	.L_LC269-.L_text_b
	.popsection
	sethi %hi(radix),%g1
	ld [%g1+%lo(radix)],%o1
.L_LC270:

	.pushsection	".line"
	.uaword	493	! radix.C:493
	.uahalf	0xffff
	.uaword	.L_LC270-.L_text_b
	.popsection
	st %o0,[%fp-28]
.L_LC271:

	.pushsection	".line"
	.uaword	494	! radix.C:494
	.uahalf	0xffff
	.uaword	.L_LC271-.L_text_b
	.popsection
	add %o1,-1,%o1
	sll %o1,%o0,%o1
.L_LC272:

	.pushsection	".line"
	.uaword	498	! radix.C:498
	.uahalf	0xffff
	.uaword	.L_LC272-.L_text_b
	.popsection
	be .LL192
	st %o1,[%fp-36]
	ld [%fp-164],%g4
	cmp %g4,0
	be .LL426
	ld [%g1+%lo(radix)],%o1
.LL192:
.L_LC273:

	.pushsection	".line"
	.uaword	499	! radix.C:499
	.uahalf	0xffff
	.uaword	.L_LC273-.L_text_b
	.popsection
	call trap,0
	mov 24,%o0
	st %o0,[%fp-92]
.L_LC274:

	.pushsection	".line"
	.uaword	502	! radix.C:502
	.uahalf	0xffff
	.uaword	.L_LC274-.L_text_b
	.popsection
	sethi %hi(radix),%g1
	ld [%g1+%lo(radix)],%o1
.LL426:
	cmp %o1,0
	ble .LL194
	mov 0,%o0
	sll %o1,2,%o1
.LL196:
.L_LC275:

	.pushsection	".line"
	.uaword	503	! radix.C:503
	.uahalf	0xffff
	.uaword	.L_LC275-.L_text_b
	.popsection
	st %g0,[%i5+%o0]
.L_LC276:

	.pushsection	".line"
	.uaword	502	! radix.C:502
	.uahalf	0xffff
	.uaword	.L_LC276-.L_text_b
	.popsection
	add %o0,4,%o0
	cmp %o0,%o1
	bl .LL196
	nop
.LL194:
.L_LC277:

	.pushsection	".line"
	.uaword	507	! radix.C:507
	.uahalf	0xffff
	.uaword	.L_LC277-.L_text_b
	.popsection
	ld [%fp-44],%o3
.L_LC278:

	.pushsection	".line"
	.uaword	505	! radix.C:505
	.uahalf	0xffff
	.uaword	.L_LC278-.L_text_b
	.popsection
	sethi %hi(key),%o0
	ld [%fp-60],%g4
	or %o0,%lo(key),%o0
.L_LC279:

	.pushsection	".line"
	.uaword	506	! radix.C:506
	.uahalf	0xffff
	.uaword	.L_LC279-.L_text_b
	.popsection
	ld [%fp-68],%g1
.L_LC280:

	.pushsection	".line"
	.uaword	505	! radix.C:505
	.uahalf	0xffff
	.uaword	.L_LC280-.L_text_b
	.popsection
	sll %g4,2,%o1
	ld [%o1+%o0],%o1
.L_LC281:

	.pushsection	".line"
	.uaword	507	! radix.C:507
	.uahalf	0xffff
	.uaword	.L_LC281-.L_text_b
	.popsection
	ld [%fp-52],%g4
.L_LC282:

	.pushsection	".line"
	.uaword	505	! radix.C:505
	.uahalf	0xffff
	.uaword	.L_LC282-.L_text_b
	.popsection
	st %o1,[%fp-148]
.L_LC283:

	.pushsection	".line"
	.uaword	506	! radix.C:506
	.uahalf	0xffff
	.uaword	.L_LC283-.L_text_b
	.popsection
	sll %g1,2,%o1
	ld [%o1+%o0],%o1
.L_LC284:

	.pushsection	".line"
	.uaword	507	! radix.C:507
	.uahalf	0xffff
	.uaword	.L_LC284-.L_text_b
	.popsection
	cmp %o3,%g4
.L_LC285:

	.pushsection	".line"
	.uaword	507	! radix.C:507
	.uahalf	0xffff
	.uaword	.L_LC285-.L_text_b
	.popsection
	bge .LL199
	st %o1,[%fp-156]
	sll %o3,2,%o2
	sll %g4,2,%o3
.L_LC286:

	.pushsection	".line"
	.uaword	508	! radix.C:508
	.uahalf	0xffff
	.uaword	.L_LC286-.L_text_b
	.popsection
	ld [%fp-148],%g1
.LL427:
	ld [%fp-36],%g4
	ld [%o2+%g1],%o0
.L_LC287:

	.pushsection	".line"
	.uaword	509	! radix.C:509
	.uahalf	0xffff
	.uaword	.L_LC287-.L_text_b
	.popsection
	ld [%fp-28],%g1
.L_LC288:

	.pushsection	".line"
	.uaword	508	! radix.C:508
	.uahalf	0xffff
	.uaword	.L_LC288-.L_text_b
	.popsection
	and %o0,%g4,%o0
.L_LC289:

	.pushsection	".line"
	.uaword	509	! radix.C:509
	.uahalf	0xffff
	.uaword	.L_LC289-.L_text_b
	.popsection
	sra %o0,%g1,%o0
.L_LC290:

	.pushsection	".line"
	.uaword	510	! radix.C:510
	.uahalf	0xffff
	.uaword	.L_LC290-.L_text_b
	.popsection
	sll %o0,2,%o0
	ld [%i5+%o0],%o1
.L_LC291:

	.pushsection	".line"
	.uaword	507	! radix.C:507
	.uahalf	0xffff
	.uaword	.L_LC291-.L_text_b
	.popsection
	add %o2,4,%o2
.L_LC292:

	.pushsection	".line"
	.uaword	510	! radix.C:510
	.uahalf	0xffff
	.uaword	.L_LC292-.L_text_b
	.popsection
	add %o1,1,%o1
	st %o1,[%i5+%o0]
	ld [%i5+%o0],%o0
.L_LC293:

	.pushsection	".line"
	.uaword	507	! radix.C:507
	.uahalf	0xffff
	.uaword	.L_LC293-.L_text_b
	.popsection
	cmp %o2,%o3
	bl .LL427
	ld [%fp-148],%g1
.LL199:
.L_LC294:

	.pushsection	".line"
	.uaword	512	! radix.C:512
	.uahalf	0xffff
	.uaword	.L_LC294-.L_text_b
	.popsection
	ld [%i5],%o0
	ld [%fp-76],%g4
.L_LC295:

	.pushsection	".line"
	.uaword	513	! radix.C:513
	.uahalf	0xffff
	.uaword	.L_LC295-.L_text_b
	.popsection
	sethi %hi(radix),%g1
.L_LC296:

	.pushsection	".line"
	.uaword	512	! radix.C:512
	.uahalf	0xffff
	.uaword	.L_LC296-.L_text_b
	.popsection
	st %o0,[%g4]
.L_LC297:

	.pushsection	".line"
	.uaword	513	! radix.C:513
	.uahalf	0xffff
	.uaword	.L_LC297-.L_text_b
	.popsection
	ld [%g1+%lo(radix)],%o0
	mov 1,%o3
	cmp %o3,%o0
	bge,a .LL428
	mov 9,%o0
	mov %o0,%o5
	add %g4,4,%o4
	mov 4,%o2
.LL206:
.L_LC298:

	.pushsection	".line"
	.uaword	514	! radix.C:514
	.uahalf	0xffff
	.uaword	.L_LC298-.L_text_b
	.popsection
	ld [%o4-4],%o0
.L_LC299:

	.pushsection	".line"
	.uaword	513	! radix.C:513
	.uahalf	0xffff
	.uaword	.L_LC299-.L_text_b
	.popsection
	add %o3,1,%o3
.L_LC300:

	.pushsection	".line"
	.uaword	514	! radix.C:514
	.uahalf	0xffff
	.uaword	.L_LC300-.L_text_b
	.popsection
	ld [%fp-76],%g4
.L_LC301:

	.pushsection	".line"
	.uaword	513	! radix.C:513
	.uahalf	0xffff
	.uaword	.L_LC301-.L_text_b
	.popsection
	cmp %o3,%o5
.L_LC302:

	.pushsection	".line"
	.uaword	514	! radix.C:514
	.uahalf	0xffff
	.uaword	.L_LC302-.L_text_b
	.popsection
	ld [%o2+%i5],%o1
.L_LC303:

	.pushsection	".line"
	.uaword	513	! radix.C:513
	.uahalf	0xffff
	.uaword	.L_LC303-.L_text_b
	.popsection
	add %o4,4,%o4
.L_LC304:

	.pushsection	".line"
	.uaword	514	! radix.C:514
	.uahalf	0xffff
	.uaword	.L_LC304-.L_text_b
	.popsection
	add %o0,%o1,%o0
	st %o0,[%g4+%o2]
.L_LC305:

	.pushsection	".line"
	.uaword	513	! radix.C:513
	.uahalf	0xffff
	.uaword	.L_LC305-.L_text_b
	.popsection
	bl .LL206
	add %o2,4,%o2
.L_LC306:

	.pushsection	".line"
	.uaword	517	! radix.C:517
	.uahalf	0xffff
	.uaword	.L_LC306-.L_text_b
	.popsection
.L_B36:
	mov 9,%o0
.LL428:
	ld [%l6+%lo(global)],%o1
	sethi %hi(number_of_processors),%g1
	ld [%g1+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL208
	mov 13,%o0
	ld [%l6+%lo(global)],%o1
	call trap,0
	add %o1,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL209
	ld [%l6+%lo(global)],%o0
.L_B37:
	call cm_lock_backoff,0
	add %o0,268,%o0
.L_B37_e:
.LL209:
	ld [%l6+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,268,%o1
	ld [%l6+%lo(global)],%o2
	sethi %hi(number_of_processors),%g4
	ld [%g4+%lo(number_of_processors)],%o0
	ld [%o2+272],%o1
	add %o0,-1,%o0
	cmp %o1,%o0
	bge .LL429
	nop
.L_B38:
	ld [%o2+272],%o1
	add %o1,1,%o1
	st %o1,[%o2+272]
	ld [%o2+272],%o1
	mov 14,%o0
	call trap,0
	add %o2,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL211
	ld [%l6+%lo(global)],%o0
	call cm_unlock,0
	add %o0,268,%o0
.LL211:
.L_B38_e:
	ld [%l6+%lo(global)],%o1
	mov 13,%o0
	call trap,0
	add %o1,276,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL212
	ld [%l6+%lo(global)],%o0
.L_B39:
	call cm_lock_backoff,0
	add %o0,276,%o0
.L_B39_e:
.LL212:
	ld [%l6+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,276,%o1
	ld [%l6+%lo(global)],%o2
.LL429:
	ld [%o2+272],%o0
	cmp %o0,0
	bne .LL214
	mov 14,%o0
.L_B40:
	call trap,0
	add %o2,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL208
	ld [%l6+%lo(global)],%o0
.L_B40_e:
	b .LL410
	add %o0,268,%o0
.LL214:
.L_B41:
	ld [%o2+272],%o1
	add %o1,-1,%o1
	st %o1,[%o2+272]
	ld [%o2+272],%o1
	mov 14,%o0
	call trap,0
	add %o2,276,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL208
	ld [%l6+%lo(global)],%o0
	add %o0,276,%o0
.LL410:
	call cm_unlock,0
	nop
.L_B41_e:
.L_B42:
.L_B42_e:
.L_I7_1398:
.LL208:
.L_B36_e:
	mov 10,%o0
	ld [%l6+%lo(global)],%o1
	sethi %hi(number_of_processors),%g1
	ld [%g1+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,268,%o1
.L_LC307:

	.pushsection	".line"
	.uaword	520	! radix.C:520
	.uahalf	0xffff
	.uaword	.L_LC307-.L_text_b
	.popsection
	mov 0,%o3
.L_LC308:

	.pushsection	".line"
	.uaword	519	! radix.C:519
	.uahalf	0xffff
	.uaword	.L_LC308-.L_text_b
	.popsection
	sll %i2,3,%o0
	add %o0,%i2,%o0
	sll %o0,7,%o0
	add %o0,%i2,%o0
	sll %o0,2,%o0
	sub %o0,%i2,%o0
	sll %o0,3,%o0
	add %o0,320,%o0
	ld [%l6+%lo(global)],%o1
.L_LC309:

	.pushsection	".line"
	.uaword	520	! radix.C:520
	.uahalf	0xffff
	.uaword	.L_LC309-.L_text_b
	.popsection
	sethi %hi(radix),%g4
	ld [%g4+%lo(radix)],%o2
.L_LC310:

	.pushsection	".line"
	.uaword	520	! radix.C:520
	.uahalf	0xffff
	.uaword	.L_LC310-.L_text_b
	.popsection
	cmp %o3,%o2
	bge .LL221
	add %o1,%o0,%l1
	mov %o2,%o4
	mov %l1,%o2
	mov 0,%o1
.LL223:
.L_LC311:

	.pushsection	".line"
	.uaword	521	! radix.C:521
	.uahalf	0xffff
	.uaword	.L_LC311-.L_text_b
	.popsection
	ld [%fp-76],%g1
.L_LC312:

	.pushsection	".line"
	.uaword	520	! radix.C:520
	.uahalf	0xffff
	.uaword	.L_LC312-.L_text_b
	.popsection
	add %o3,1,%o3
.L_LC313:

	.pushsection	".line"
	.uaword	521	! radix.C:521
	.uahalf	0xffff
	.uaword	.L_LC313-.L_text_b
	.popsection
	ld [%o1+%g1],%o0
.L_LC314:

	.pushsection	".line"
	.uaword	520	! radix.C:520
	.uahalf	0xffff
	.uaword	.L_LC314-.L_text_b
	.popsection
	cmp %o3,%o4
.L_LC315:

	.pushsection	".line"
	.uaword	521	! radix.C:521
	.uahalf	0xffff
	.uaword	.L_LC315-.L_text_b
	.popsection
	st %o0,[%l1+%o1]
.L_LC316:

	.pushsection	".line"
	.uaword	522	! radix.C:522
	.uahalf	0xffff
	.uaword	.L_LC316-.L_text_b
	.popsection
	ld [%o1+%i5],%o0
	sethi %hi(16384),%g4
	st %o0,[%o2+%g4]
.L_LC317:

	.pushsection	".line"
	.uaword	520	! radix.C:520
	.uahalf	0xffff
	.uaword	.L_LC317-.L_text_b
	.popsection
	add %o2,4,%o2
	bl .LL223
	add %o1,4,%o1
.LL221:
.L_LC318:

	.pushsection	".line"
	.uaword	524	! radix.C:524
	.uahalf	0xffff
	.uaword	.L_LC318-.L_text_b
	.popsection
	mov %i2,%l3
.L_LC319:

	.pushsection	".line"
	.uaword	525	! radix.C:525
	.uahalf	0xffff
	.uaword	.L_LC319-.L_text_b
	.popsection
	sethi %hi(number_of_processors),%g1
	ld [%g1+%lo(number_of_processors)],%o0
.L_LC320:

	.pushsection	".line"
	.uaword	527	! radix.C:527
	.uahalf	0xffff
	.uaword	.L_LC320-.L_text_b
	.popsection
	andcc %i2,1,%g0
.L_LC321:

	.pushsection	".line"
	.uaword	525	! radix.C:525
	.uahalf	0xffff
	.uaword	.L_LC321-.L_text_b
	.popsection
	sra %o0,1,%l4
.L_LC322:

	.pushsection	".line"
	.uaword	527	! radix.C:527
	.uahalf	0xffff
	.uaword	.L_LC322-.L_text_b
	.popsection
	bne .LL225
	mov %o0,%l5
.L_LC323:

	.pushsection	".line"
	.uaword	528	! radix.C:528
	.uahalf	0xffff
	.uaword	.L_LC323-.L_text_b
	.popsection
.L_B43:
	mov 13,%o0
	sra %i2,1,%o2
	add %l5,%o2,%o2
	sll %o2,3,%o1
	add %o1,%o2,%o1
	sll %o1,7,%o1
	add %o1,%o2,%o1
	sll %o1,2,%o1
	sub %o1,%o2,%o1
	sll %o1,3,%l2
	ld [%l6+%lo(global)],%o1
	add %l2,320,%l0
	add %o1,%l0,%o1
	call trap,0
	add %o1,%i3,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL226
	ld [%l6+%lo(global)],%o0
.L_B44:
	add %o0,%l0,%o0
	call cm_lock_backoff,0
	add %o0,%i3,%o0
.L_B44_e:
.LL226:
	ld [%l6+%lo(global)],%o1
	mov 8,%o0
	add %o1,%l0,%o1
	call trap,0
	add %o1,%i3,%o1
	mov 1,%o0
	sethi %hi(33108),%g4
	or %g4,%lo(33108),%g4
	sethi %hi(33092),%g1
	ld [%l6+%lo(global)],%o3
	or %g1,%lo(33092),%g1
	add %o3,%l2,%o2
	st %o0,[%o2+%g4]
	ld [%o2+%g1],%o0
	cmp %o0,0
	bne .LL227
	sethi %hi(33092),%g4
.L_B45:
	mov 14,%o0
	add %o3,%l0,%o1
	call trap,0
	add %o1,%i3,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL225
	ld [%l6+%lo(global)],%o0
.L_B45_e:
	add %o0,%l0,%o0
	b .LL411
	add %o0,%i3,%o0
.LL227:
.L_B46:
	or %g4,%lo(33092),%g4
	mov 14,%o0
	ld [%o2+%g4],%o1
	sethi %hi(32780),%g1
	add %o1,-1,%o1
	st %o1,[%o2+%g4]
	ld [%o2+%g4],%o1
	or %g1,%lo(32780),%g1
	add %o3,%l0,%o1
	call trap,0
	add %o1,%g1,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL225
	ld [%l6+%lo(global)],%o0
	sethi %hi(32780),%g4
	or %g4,%lo(32780),%g4
	add %o0,%l0,%o0
	add %o0,%g4,%o0
.LL411:
	call cm_unlock,0
	nop
.L_B46_e:
.L_B47:
.L_B47_e:
.L_I7_1903:
.L_B43_e:
.LL225:
.L_LC324:

	.pushsection	".line"
	.uaword	530	! radix.C:530
	.uahalf	0xffff
	.uaword	.L_LC324-.L_text_b
	.popsection
	andcc %l3,1,%g0
	be .LL406
	sethi %hi(32772),%o0
	or %o0,%lo(32772),%i0
.L_LC325:

	.pushsection	".line"
	.uaword	531	! radix.C:531
	.uahalf	0xffff
	.uaword	.L_LC325-.L_text_b
	.popsection
.L_B48:
	sra %l3,1,%l3
.L_LC326:

	.pushsection	".line"
	.uaword	533	! radix.C:533
	.uahalf	0xffff
	.uaword	.L_LC326-.L_text_b
	.popsection
.LL438:
	sethi %hi(-36888),%o0
	or %o0,%lo(-36888),%o0
	add %l1,%o0,%l7
.L_LC327:

	.pushsection	".line"
	.uaword	536	! radix.C:536
	.uahalf	0xffff
	.uaword	.L_LC327-.L_text_b
	.popsection
	mov 13,%o0
.L_LC328:

	.pushsection	".line"
	.uaword	532	! radix.C:532
	.uahalf	0xffff
	.uaword	.L_LC328-.L_text_b
	.popsection
	mov %l1,%l2
.L_LC329:

	.pushsection	".line"
	.uaword	534	! radix.C:534
	.uahalf	0xffff
	.uaword	.L_LC329-.L_text_b
	.popsection
	add %l5,%l3,%o2
.L_LC330:

	.pushsection	".line"
	.uaword	535	! radix.C:535
	.uahalf	0xffff
	.uaword	.L_LC330-.L_text_b
	.popsection
	sll %o2,3,%o1
	add %o1,%o2,%o1
	sll %o1,7,%o1
	add %o1,%o2,%o1
	sll %o1,2,%o1
	sub %o1,%o2,%o1
	sll %o1,3,%o1
	ld [%l6+%lo(global)],%o2
	add %o1,320,%o1
	add %o2,%o1,%l1
.L_LC331:

	.pushsection	".line"
	.uaword	536	! radix.C:536
	.uahalf	0xffff
	.uaword	.L_LC331-.L_text_b
	.popsection
	add %l1,%i3,%l0
	call trap,0
	mov %l0,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL430
	mov 8,%o0
.L_B49:
	call cm_lock_backoff,0
	mov %l0,%o0
.L_B49_e:
	mov 8,%o0
.LL430:
	call trap,0
	mov %l0,%o1
	sethi %hi(32788),%g1
	or %g1,%lo(32788),%g1
	ld [%l1+%g1],%o0
	cmp %o0,0
	bne .LL237
	nop
.L_B50:
	ld [%l1+%i0],%o1
	add %o1,1,%o1
	st %o1,[%l1+%i0]
	ld [%l1+%i0],%o1
	mov 14,%o0
	call trap,0
	mov %l0,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL431
	mov 13,%o0
	call cm_unlock,0
	mov %l0,%o0
.L_B50_e:
	mov 13,%o0
.LL431:
	sethi %hi(32780),%g4
	or %g4,%lo(32780),%g4
	add %l1,%g4,%l0
	call trap,0
	mov %l0,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL432
	mov 8,%o0
.L_B51:
	call cm_lock_backoff,0
	mov %l0,%o0
.L_B51_e:
	mov 8,%o0
.LL432:
	call trap,0
	mov %l0,%o1
.LL237:
	ld [%l1+%i0],%o0
	cmp %o0,0
	bne .LL240
	mov 14,%o0
.L_B52:
.L_B52_e:
	b .LL412
	add %l1,%i3,%l0
.LL240:
.L_B53:
	sethi %hi(32780),%g1
	ld [%l1+%i0],%o1
	or %g1,%lo(32780),%g1
	add %o1,-1,%o1
	st %o1,[%l1+%i0]
	ld [%l1+%i0],%o1
	add %l1,%g1,%l0
.LL412:
	call trap,0
	mov %l0,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL433
	mov 13,%o0
	call cm_unlock,0
	mov %l0,%o0
.L_B53_e:
.L_B54:
.L_B54_e:
.L_I7_2171:
.L_B48_e:
.L_LC332:

	.pushsection	".line"
	.uaword	537	! radix.C:537
	.uahalf	0xffff
	.uaword	.L_LC332-.L_text_b
	.popsection
.L_B55:
	mov 13,%o0
.LL433:
	add %l1,%i3,%l0
	call trap,0
	mov %l0,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL434
	mov 8,%o0
.L_B56:
	call cm_lock_backoff,0
	mov %l0,%o0
.L_B56_e:
	mov 8,%o0
.LL434:
	call trap,0
	mov %l0,%o1
	sethi %hi(32788),%g4
	or %g4,%lo(32788),%g4
	st %g0,[%l1+%g4]
	ld [%l1+%i0],%o0
	cmp %o0,0
	be .LL413
	mov 14,%o0
.L_B57:
.L_B57_e:
.L_B58:
	sethi %hi(32780),%g1
	ld [%l1+%i0],%o1
	or %g1,%lo(32780),%g1
	add %o1,-1,%o1
	st %o1,[%l1+%i0]
	ld [%l1+%i0],%o1
	add %l1,%g1,%l0
.LL413:
	call trap,0
	mov %l0,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL435
	add %l4,-1,%o0
	call cm_unlock,0
	mov %l0,%o0
.L_B58_e:
.L_B59:
.L_B59_e:
.L_I7_2322:
.L_B55_e:
.L_LC333:

	.pushsection	".line"
	.uaword	538	! radix.C:538
	.uahalf	0xffff
	.uaword	.L_LC333-.L_text_b
	.popsection
	add %l4,-1,%o0
.LL435:
	cmp %l3,%o0
	be .LL253
	sethi %hi(radix),%g4
.L_LC334:

	.pushsection	".line"
	.uaword	539	! radix.C:539
	.uahalf	0xffff
	.uaword	.L_LC334-.L_text_b
	.popsection
	ld [%g4+%lo(radix)],%o0
	mov 0,%o3
	cmp %o3,%o0
	bge,a .LL436
	add %l5,%l4,%l5
	mov %o0,%g3
	mov %l7,%o5
	mov %l2,%o4
	mov %l1,%g2
.LL257:
.L_LC335:

	.pushsection	".line"
	.uaword	540	! radix.C:540
	.uahalf	0xffff
	.uaword	.L_LC335-.L_text_b
	.popsection
	sll %o3,2,%o2
	ld [%o4],%o0
.L_LC336:

	.pushsection	".line"
	.uaword	539	! radix.C:539
	.uahalf	0xffff
	.uaword	.L_LC336-.L_text_b
	.popsection
	add %o3,1,%o3
.L_LC337:

	.pushsection	".line"
	.uaword	540	! radix.C:540
	.uahalf	0xffff
	.uaword	.L_LC337-.L_text_b
	.popsection
	ld [%o5],%o1
.L_LC338:

	.pushsection	".line"
	.uaword	541	! radix.C:541
	.uahalf	0xffff
	.uaword	.L_LC338-.L_text_b
	.popsection
	sethi %hi(16384),%g1
.L_LC339:

	.pushsection	".line"
	.uaword	540	! radix.C:540
	.uahalf	0xffff
	.uaword	.L_LC339-.L_text_b
	.popsection
	add %o0,%o1,%o0
	st %o0,[%l1+%o2]
.L_LC340:

	.pushsection	".line"
	.uaword	541	! radix.C:541
	.uahalf	0xffff
	.uaword	.L_LC340-.L_text_b
	.popsection
	ld [%o4+%g1],%o0
.L_LC341:

	.pushsection	".line"
	.uaword	539	! radix.C:539
	.uahalf	0xffff
	.uaword	.L_LC341-.L_text_b
	.popsection
	cmp %o3,%g3
.L_LC342:

	.pushsection	".line"
	.uaword	541	! radix.C:541
	.uahalf	0xffff
	.uaword	.L_LC342-.L_text_b
	.popsection
	ld [%o5+%g1],%o1
.L_LC343:

	.pushsection	".line"
	.uaword	539	! radix.C:539
	.uahalf	0xffff
	.uaword	.L_LC343-.L_text_b
	.popsection
	add %o4,4,%o4
.L_LC344:

	.pushsection	".line"
	.uaword	541	! radix.C:541
	.uahalf	0xffff
	.uaword	.L_LC344-.L_text_b
	.popsection
	add %o0,%o1,%o0
	st %o0,[%g2+%g1]
.L_LC345:

	.pushsection	".line"
	.uaword	539	! radix.C:539
	.uahalf	0xffff
	.uaword	.L_LC345-.L_text_b
	.popsection
	add %o5,4,%o5
	bl .LL257
	add %g2,4,%g2
.L_LC346:

	.pushsection	".line"
	.uaword	543	! radix.C:543
	.uahalf	0xffff
	.uaword	.L_LC346-.L_text_b
	.popsection
	b .LL436
	add %l5,%l4,%l5
.LL253:
.L_LC347:

	.pushsection	".line"
	.uaword	544	! radix.C:544
	.uahalf	0xffff
	.uaword	.L_LC347-.L_text_b
	.popsection
	ld [%g4+%lo(radix)],%o0
	mov 0,%o3
	cmp %o3,%o0
	bge,a .LL436
	add %l5,%l4,%l5
	mov %o0,%o4
	mov 0,%o2
.LL263:
.L_LC348:

	.pushsection	".line"
	.uaword	545	! radix.C:545
	.uahalf	0xffff
	.uaword	.L_LC348-.L_text_b
	.popsection
	ld [%o2+%l2],%o0
.L_LC349:

	.pushsection	".line"
	.uaword	544	! radix.C:544
	.uahalf	0xffff
	.uaword	.L_LC349-.L_text_b
	.popsection
	add %o3,1,%o3
.L_LC350:

	.pushsection	".line"
	.uaword	545	! radix.C:545
	.uahalf	0xffff
	.uaword	.L_LC350-.L_text_b
	.popsection
	ld [%o2+%l7],%o1
.L_LC351:

	.pushsection	".line"
	.uaword	544	! radix.C:544
	.uahalf	0xffff
	.uaword	.L_LC351-.L_text_b
	.popsection
	cmp %o3,%o4
.L_LC352:

	.pushsection	".line"
	.uaword	545	! radix.C:545
	.uahalf	0xffff
	.uaword	.L_LC352-.L_text_b
	.popsection
	add %o0,%o1,%o0
	st %o0,[%l1+%o2]
.L_LC353:

	.pushsection	".line"
	.uaword	544	! radix.C:544
	.uahalf	0xffff
	.uaword	.L_LC353-.L_text_b
	.popsection
	bl .LL263
	add %o2,4,%o2
.L_LC354:

	.pushsection	".line"
	.uaword	548	! radix.C:548
	.uahalf	0xffff
	.uaword	.L_LC354-.L_text_b
	.popsection
	add %l5,%l4,%l5
.L_LC355:

	.pushsection	".line"
	.uaword	550	! radix.C:550
	.uahalf	0xffff
	.uaword	.L_LC355-.L_text_b
	.popsection
.LL436:
	andcc %l3,1,%g0
	bne .LL437
	sra %l4,1,%l4
.L_LC356:

	.pushsection	".line"
	.uaword	551	! radix.C:551
	.uahalf	0xffff
	.uaword	.L_LC356-.L_text_b
	.popsection
.L_B60:
	mov 13,%o0
	sra %l3,1,%o2
	add %l5,%o2,%o2
	sll %o2,3,%o1
	add %o1,%o2,%o1
	sll %o1,7,%o1
	add %o1,%o2,%o1
	sll %o1,2,%o1
	sub %o1,%o2,%o1
	sll %o1,3,%l2
	ld [%l6+%lo(global)],%o1
	add %l2,320,%l0
	add %o1,%l0,%o1
	call trap,0
	add %o1,%i3,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL266
	ld [%l6+%lo(global)],%o0
.L_B61:
	add %o0,%l0,%o0
	call cm_lock_backoff,0
	add %o0,%i3,%o0
.L_B61_e:
.LL266:
	ld [%l6+%lo(global)],%o1
	mov 8,%o0
	add %o1,%l0,%o1
	call trap,0
	add %o1,%i3,%o1
	mov 1,%o0
	sethi %hi(33108),%g1
	or %g1,%lo(33108),%g1
	sethi %hi(33092),%g4
	ld [%l6+%lo(global)],%o3
	or %g4,%lo(33092),%g4
	add %o3,%l2,%o2
	st %o0,[%o2+%g1]
	ld [%o2+%g4],%o0
	cmp %o0,0
	bne .LL267
	sethi %hi(33092),%g1
.L_B62:
	mov 14,%o0
	add %o3,%l0,%o1
	call trap,0
	add %o1,%i3,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL437
	andcc %l3,1,%g0
.L_B62_e:
	ld [%l6+%lo(global)],%o0
	add %o0,%l0,%o0
	b .LL414
	add %o0,%i3,%o0
.LL267:
.L_B63:
	or %g1,%lo(33092),%g1
	mov 14,%o0
	ld [%o2+%g1],%o1
	sethi %hi(32780),%g4
	add %o1,-1,%o1
	st %o1,[%o2+%g1]
	ld [%o2+%g1],%o1
	or %g4,%lo(32780),%g4
	add %o3,%l0,%o1
	call trap,0
	add %o1,%g4,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL437
	andcc %l3,1,%g0
	ld [%l6+%lo(global)],%o0
	sethi %hi(32780),%g1
	or %g1,%lo(32780),%g1
	add %o0,%l0,%o0
	add %o0,%g1,%o0
.LL414:
	call cm_unlock,0
	nop
.L_B63_e:
.L_B64:
.L_B64_e:
.L_I7_2859:
.L_B60_e:
.L_LC357:

	.pushsection	".line"
	.uaword	553	! radix.C:553
	.uahalf	0xffff
	.uaword	.L_LC357-.L_text_b
	.popsection
	andcc %l3,1,%g0
.LL437:
	bne,a .LL438
	sra %l3,1,%l3
.LL406:
.L_LC358:

	.pushsection	".line"
	.uaword	554	! radix.C:554
	.uahalf	0xffff
	.uaword	.L_LC358-.L_text_b
	.popsection
.L_B65:
	mov 9,%o0
	ld [%l6+%lo(global)],%o1
	sethi %hi(number_of_processors),%g4
	ld [%g4+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL274
	mov 13,%o0
	ld [%l6+%lo(global)],%o1
	call trap,0
	add %o1,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL275
	ld [%l6+%lo(global)],%o0
.L_B66:
	call cm_lock_backoff,0
	add %o0,268,%o0
.L_B66_e:
.LL275:
	ld [%l6+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,268,%o1
	ld [%l6+%lo(global)],%o2
	sethi %hi(number_of_processors),%g1
	ld [%g1+%lo(number_of_processors)],%o0
	ld [%o2+272],%o1
	add %o0,-1,%o0
	cmp %o1,%o0
	bge .LL439
	nop
.L_B67:
	ld [%o2+272],%o1
	add %o1,1,%o1
	st %o1,[%o2+272]
	ld [%o2+272],%o1
	mov 14,%o0
	call trap,0
	add %o2,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL277
	ld [%l6+%lo(global)],%o0
	call cm_unlock,0
	add %o0,268,%o0
.LL277:
.L_B67_e:
	ld [%l6+%lo(global)],%o1
	mov 13,%o0
	call trap,0
	add %o1,276,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL278
	ld [%l6+%lo(global)],%o0
.L_B68:
	call cm_lock_backoff,0
	add %o0,276,%o0
.L_B68_e:
.LL278:
	ld [%l6+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,276,%o1
	ld [%l6+%lo(global)],%o2
.LL439:
	ld [%o2+272],%o0
	cmp %o0,0
	bne .LL280
	mov 14,%o0
.L_B69:
	call trap,0
	add %o2,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL274
	ld [%l6+%lo(global)],%o0
.L_B69_e:
	b .LL415
	add %o0,268,%o0
.LL280:
.L_B70:
	ld [%o2+272],%o1
	add %o1,-1,%o1
	st %o1,[%o2+272]
	ld [%o2+272],%o1
	mov 14,%o0
	call trap,0
	add %o2,276,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL274
	ld [%l6+%lo(global)],%o0
	add %o0,276,%o0
.LL415:
	call cm_unlock,0
	nop
.L_B70_e:
.L_B71:
.L_B71_e:
.L_I7_3173:
.LL274:
.L_B65_e:
	mov 10,%o0
	ld [%l6+%lo(global)],%o1
	sethi %hi(number_of_processors),%g4
	ld [%g4+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,268,%o1
.L_LC359:

	.pushsection	".line"
	.uaword	556	! radix.C:556
	.uahalf	0xffff
	.uaword	.L_LC359-.L_text_b
	.popsection
	sethi %hi(number_of_processors),%g1
	ld [%g1+%lo(number_of_processors)],%o1
	add %o1,-1,%o0
	cmp %i2,%o0
	be .LL286
	mov %i2,%l3
.L_LC360:

	.pushsection	".line"
	.uaword	558	! radix.C:558
	.uahalf	0xffff
	.uaword	.L_LC360-.L_text_b
	.popsection
	mov %o1,%l4
.L_LC361:

	.pushsection	".line"
	.uaword	560	! radix.C:560
	.uahalf	0xffff
	.uaword	.L_LC361-.L_text_b
	.popsection
	andcc %i2,1,%g0
	be .LL288
	mov 0,%l5
.LL289:
.L_LC362:

	.pushsection	".line"
	.uaword	561	! radix.C:561
	.uahalf	0xffff
	.uaword	.L_LC362-.L_text_b
	.popsection
	sra %l3,1,%l3
.L_LC363:

	.pushsection	".line"
	.uaword	562	! radix.C:562
	.uahalf	0xffff
	.uaword	.L_LC363-.L_text_b
	.popsection
	add %l5,%l4,%l5
.L_LC364:

	.pushsection	".line"
	.uaword	564	! radix.C:564
	.uahalf	0xffff
	.uaword	.L_LC364-.L_text_b
	.popsection
	andcc %l3,1,%g0
	bne .LL289
	sra %l4,1,%l4
.LL288:
.L_LC365:

	.pushsection	".line"
	.uaword	565	! radix.C:565
	.uahalf	0xffff
	.uaword	.L_LC365-.L_text_b
	.popsection
	add %l5,%l3,%o0
.L_LC366:

	.pushsection	".line"
	.uaword	566	! radix.C:566
	.uahalf	0xffff
	.uaword	.L_LC366-.L_text_b
	.popsection
	sra %l3,1,%l3
.L_LC367:

	.pushsection	".line"
	.uaword	567	! radix.C:567
	.uahalf	0xffff
	.uaword	.L_LC367-.L_text_b
	.popsection
	add %l5,%l4,%l5
.L_LC368:

	.pushsection	".line"
	.uaword	568	! radix.C:568
	.uahalf	0xffff
	.uaword	.L_LC368-.L_text_b
	.popsection
	sra %l4,1,%l4
.L_LC369:

	.pushsection	".line"
	.uaword	569	! radix.C:569
	.uahalf	0xffff
	.uaword	.L_LC369-.L_text_b
	.popsection
	andcc %l3,1,%g0
.L_LC370:

	.pushsection	".line"
	.uaword	565	! radix.C:565
	.uahalf	0xffff
	.uaword	.L_LC370-.L_text_b
	.popsection
	sll %o0,3,%o1
	add %o1,%o0,%o1
	sll %o1,7,%o1
	add %o1,%o0,%o1
	sll %o1,2,%o1
	sub %o1,%o0,%o1
	sll %o1,3,%o1
	ld [%l6+%lo(global)],%o0
	add %o1,320,%o1
.L_LC371:

	.pushsection	".line"
	.uaword	569	! radix.C:569
	.uahalf	0xffff
	.uaword	.L_LC371-.L_text_b
	.popsection
	be .LL292
	add %o0,%o1,%l2
.LL293:
.L_LC372:

	.pushsection	".line"
	.uaword	570	! radix.C:570
	.uahalf	0xffff
	.uaword	.L_LC372-.L_text_b
	.popsection
	sra %l3,1,%l3
.L_LC373:

	.pushsection	".line"
	.uaword	571	! radix.C:571
	.uahalf	0xffff
	.uaword	.L_LC373-.L_text_b
	.popsection
	add %l5,%l4,%l5
.L_LC374:

	.pushsection	".line"
	.uaword	573	! radix.C:573
	.uahalf	0xffff
	.uaword	.L_LC374-.L_text_b
	.popsection
	andcc %l3,1,%g0
	bne .LL293
	sra %l4,1,%l4
.LL292:
.L_LC375:

	.pushsection	".line"
	.uaword	574	! radix.C:574
	.uahalf	0xffff
	.uaword	.L_LC375-.L_text_b
	.popsection
.L_B72:
.L_LC376:

	.pushsection	".line"
	.uaword	575	! radix.C:575
	.uahalf	0xffff
	.uaword	.L_LC376-.L_text_b
	.popsection
	mov 13,%o0
	add %l2,%i3,%l0
	mov %l0,%o1
.L_LC377:

	.pushsection	".line"
	.uaword	574	! radix.C:574
	.uahalf	0xffff
	.uaword	.L_LC377-.L_text_b
	.popsection
	add %l5,%l3,%o3
	sll %o3,3,%o2
	add %o2,%o3,%o2
	sll %o2,7,%o2
	add %o2,%o3,%o2
	sll %o2,2,%o2
	sub %o2,%o3,%o2
	sll %o2,3,%o2
	ld [%l6+%lo(global)],%o3
	add %o2,320,%o2
.L_LC378:

	.pushsection	".line"
	.uaword	575	! radix.C:575
	.uahalf	0xffff
	.uaword	.L_LC378-.L_text_b
	.popsection
	call trap,0
	add %o3,%o2,%l1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL440
	mov 8,%o0
.L_B73:
	call cm_lock_backoff,0
	mov %l0,%o0
.L_B73_e:
	mov 8,%o0
.LL440:
	call trap,0
	mov %l0,%o1
	sethi %hi(32788),%g4
	or %g4,%lo(32788),%g4
	ld [%l2+%g4],%o0
	cmp %o0,0
	bne .LL441
	sethi %hi(32772),%g1
.L_B74:
	or %g1,%lo(32772),%o2
	ld [%l2+%o2],%o1
	add %o1,1,%o1
	st %o1,[%l2+%o2]
	ld [%l2+%o2],%o1
	mov 14,%o0
	call trap,0
	mov %l0,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL442
	mov 13,%o0
	call cm_unlock,0
	mov %l0,%o0
.L_B74_e:
	mov 13,%o0
.LL442:
	sethi %hi(32780),%g4
	or %g4,%lo(32780),%g4
	add %l2,%g4,%l0
	call trap,0
	mov %l0,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL443
	mov 8,%o0
.L_B75:
	call cm_lock_backoff,0
	mov %l0,%o0
.L_B75_e:
	mov 8,%o0
.LL443:
	call trap,0
	mov %l0,%o1
	sethi %hi(32772),%g1
.LL441:
	or %g1,%lo(32772),%o2
	ld [%l2+%o2],%o0
	cmp %o0,0
	bne .LL299
	mov 14,%o0
.L_B76:
.L_B76_e:
	b .LL416
	add %l2,%i3,%l0
.LL299:
.L_B77:
	sethi %hi(32780),%g4
	ld [%l2+%o2],%o1
	or %g4,%lo(32780),%g4
	add %o1,-1,%o1
	st %o1,[%l2+%o2]
	ld [%l2+%o2],%o1
	add %l2,%g4,%l0
.LL416:
	call trap,0
	mov %l0,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL444
	mov 13,%o0
	call cm_unlock,0
	mov %l0,%o0
.L_B77_e:
.L_B78:
.L_B78_e:
.L_I7_3530:
.L_B72_e:
.L_LC379:

	.pushsection	".line"
	.uaword	576	! radix.C:576
	.uahalf	0xffff
	.uaword	.L_LC379-.L_text_b
	.popsection
.L_B79:
	mov 13,%o0
.LL444:
	add %l2,%i3,%l0
	call trap,0
	mov %l0,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL445
	mov 8,%o0
.L_B80:
	call cm_lock_backoff,0
	mov %l0,%o0
.L_B80_e:
	mov 8,%o0
.LL445:
	call trap,0
	mov %l0,%o1
	sethi %hi(32788),%g1
	or %g1,%lo(32788),%g1
	st %g0,[%l2+%g1]
	sethi %hi(32772),%g4
	or %g4,%lo(32772),%o2
	ld [%l2+%o2],%o0
	cmp %o0,0
	be .LL417
	mov 14,%o0
.L_B81:
.L_B81_e:
.L_B82:
	sethi %hi(32780),%g1
	ld [%l2+%o2],%o1
	or %g1,%lo(32780),%g1
	add %o1,-1,%o1
	st %o1,[%l2+%o2]
	ld [%l2+%o2],%o1
	add %l2,%g1,%l0
.LL417:
	call trap,0
	mov %l0,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL446
	sethi %hi(radix),%g4
	call cm_unlock,0
	mov %l0,%o0
.L_B82_e:
.L_B83:
.L_B83_e:
.L_I7_3681:
.L_B79_e:
.L_LC380:

	.pushsection	".line"
	.uaword	577	! radix.C:577
	.uahalf	0xffff
	.uaword	.L_LC380-.L_text_b
	.popsection
	sethi %hi(radix),%g4
.LL446:
	ld [%g4+%lo(radix)],%o0
	mov 0,%o3
	cmp %o3,%o0
	bge .LL447
	mov %i2,%l3
	mov %o0,%o2
	mov 0,%o1
.LL315:
.L_LC381:

	.pushsection	".line"
	.uaword	577	! radix.C:577
	.uahalf	0xffff
	.uaword	.L_LC381-.L_text_b
	.popsection
	add %o3,1,%o3
.L_LC382:

	.pushsection	".line"
	.uaword	578	! radix.C:578
	.uahalf	0xffff
	.uaword	.L_LC382-.L_text_b
	.popsection
	ld [%o1+%l1],%o0
.L_LC383:

	.pushsection	".line"
	.uaword	577	! radix.C:577
	.uahalf	0xffff
	.uaword	.L_LC383-.L_text_b
	.popsection
	cmp %o3,%o2
.L_LC384:

	.pushsection	".line"
	.uaword	578	! radix.C:578
	.uahalf	0xffff
	.uaword	.L_LC384-.L_text_b
	.popsection
	st %o0,[%l2+%o1]
.L_LC385:

	.pushsection	".line"
	.uaword	577	! radix.C:577
	.uahalf	0xffff
	.uaword	.L_LC385-.L_text_b
	.popsection
	bl .LL315
	add %o1,4,%o1
.L_LC386:

	.pushsection	".line"
	.uaword	580	! radix.C:580
	.uahalf	0xffff
	.uaword	.L_LC386-.L_text_b
	.popsection
	b .LL447
	mov %i2,%l3
.LL286:
.L_LC387:

	.pushsection	".line"
	.uaword	581	! radix.C:581
	.uahalf	0xffff
	.uaword	.L_LC387-.L_text_b
	.popsection
	sll %o1,3,%o0
	add %o0,%o1,%o0
	sll %o0,7,%o0
	add %o0,%o1,%o0
	sll %o0,2,%o0
	sub %o0,%o1,%o0
	sll %o0,4,%o0
	sethi %hi(-73456),%o1
	or %o1,%lo(-73456),%o1
	ld [%l6+%lo(global)],%o2
	add %o0,%o1,%o0
	add %o2,%o0,%l2
.L_LC388:

	.pushsection	".line"
	.uaword	584	! radix.C:584
	.uahalf	0xffff
	.uaword	.L_LC388-.L_text_b
	.popsection
.LL447:
	sethi %hi(number_of_processors),%g1
	ld [%g1+%lo(number_of_processors)],%l4
.L_LC389:

	.pushsection	".line"
	.uaword	586	! radix.C:586
	.uahalf	0xffff
	.uaword	.L_LC389-.L_text_b
	.popsection
	andcc %i2,1,%g0
	be .LL319
	mov 0,%l5
	sethi %hi(-36568),%o0
	or %o0,%lo(-36568),%l7
.LL320:
.L_LC390:

	.pushsection	".line"
	.uaword	587	! radix.C:587
	.uahalf	0xffff
	.uaword	.L_LC390-.L_text_b
	.popsection
.L_B84:
	mov 13,%o0
	add %l5,%l3,%l0
	sll %l0,3,%o2
	add %o2,%l0,%o2
	sll %o2,7,%o2
	add %o2,%l0,%o2
	sll %o2,2,%o2
	sub %o2,%l0,%o2
	sll %o2,3,%o2
	ld [%l6+%lo(global)],%o1
	add %o2,%l7,%l1
	add %o1,%l1,%o1
	call trap,0
	add %o1,%i3,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL321
	ld [%l6+%lo(global)],%o0
.L_B85:
	add %o0,%l1,%o0
	call cm_lock_backoff,0
	add %o0,%i3,%o0
.L_B85_e:
.LL321:
	ld [%l6+%lo(global)],%o1
	mov 8,%o0
	add %o1,%l1,%o1
	call trap,0
	add %o1,%i3,%o1
	add %l0,-1,%o1
	sll %o1,3,%o0
	add %o0,%o1,%o0
	sll %o0,7,%o0
	add %o0,%o1,%o0
	sll %o0,2,%o0
	sub %o0,%o1,%o0
	sll %o0,3,%o0
	sethi %hi(33108),%g4
	or %g4,%lo(33108),%g4
	sethi %hi(33092),%g1
	ld [%l6+%lo(global)],%o3
	or %g1,%lo(33092),%g1
	add %o3,%o0,%o2
	mov 1,%o0
	st %o0,[%o2+%g4]
	ld [%o2+%g1],%o0
	cmp %o0,0
	bne .LL322
	sethi %hi(33092),%g4
.L_B86:
	mov 14,%o0
	add %o3,%l1,%o1
	call trap,0
	add %o1,%i3,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL326
	ld [%l6+%lo(global)],%o0
.L_B86_e:
	add %o0,%l1,%o0
	b .LL418
	add %o0,%i3,%o0
.LL322:
.L_B87:
	or %g4,%lo(33092),%g4
	mov 14,%o0
	ld [%o2+%g4],%o1
	sethi %hi(32780),%g1
	add %o1,-1,%o1
	st %o1,[%o2+%g4]
	ld [%o2+%g4],%o1
	or %g1,%lo(32780),%g1
	add %o3,%l1,%o1
	call trap,0
	add %o1,%g1,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL326
	ld [%l6+%lo(global)],%o0
	sethi %hi(32780),%g4
	or %g4,%lo(32780),%g4
	add %o0,%l1,%o0
	add %o0,%g4,%o0
.LL418:
	call cm_unlock,0
	nop
.L_B87_e:
.L_B88:
.L_B88_e:
.L_I7_4180:
.LL326:
.L_B84_e:
.L_LC391:

	.pushsection	".line"
	.uaword	588	! radix.C:588
	.uahalf	0xffff
	.uaword	.L_LC391-.L_text_b
	.popsection
	sra %l3,1,%l3
.L_LC392:

	.pushsection	".line"
	.uaword	589	! radix.C:589
	.uahalf	0xffff
	.uaword	.L_LC392-.L_text_b
	.popsection
	add %l5,%l4,%l5
.L_LC393:

	.pushsection	".line"
	.uaword	591	! radix.C:591
	.uahalf	0xffff
	.uaword	.L_LC393-.L_text_b
	.popsection
	andcc %l3,1,%g0
	bne .LL320
	sra %l4,1,%l4
.LL319:
.L_LC394:

	.pushsection	".line"
	.uaword	592	! radix.C:592
	.uahalf	0xffff
	.uaword	.L_LC394-.L_text_b
	.popsection
	mov %i2,%l3
.L_LC395:

	.pushsection	".line"
	.uaword	594	! radix.C:594
	.uahalf	0xffff
	.uaword	.L_LC395-.L_text_b
	.popsection
	mov 0,%l5
.L_LC396:

	.pushsection	".line"
	.uaword	595	! radix.C:595
	.uahalf	0xffff
	.uaword	.L_LC396-.L_text_b
	.popsection
	sethi %hi(radix),%g1
	mov 0,%o3
	ld [%g1+%lo(radix)],%o0
.L_LC397:

	.pushsection	".line"
	.uaword	593	! radix.C:593
	.uahalf	0xffff
	.uaword	.L_LC397-.L_text_b
	.popsection
	sethi %hi(number_of_processors),%g4
.L_LC398:

	.pushsection	".line"
	.uaword	595	! radix.C:595
	.uahalf	0xffff
	.uaword	.L_LC398-.L_text_b
	.popsection
	cmp %o3,%o0
	bge .LL330
	ld [%g4+%lo(number_of_processors)],%l4
	mov %o0,%o1
	mov 0,%o0
.LL332:
.L_LC399:

	.pushsection	".line"
	.uaword	596	! radix.C:596
	.uahalf	0xffff
	.uaword	.L_LC399-.L_text_b
	.popsection
	st %g0,[%i4+%o0]
.L_LC400:

	.pushsection	".line"
	.uaword	595	! radix.C:595
	.uahalf	0xffff
	.uaword	.L_LC400-.L_text_b
	.popsection
	add %o3,1,%o3
	cmp %o3,%o1
	bl .LL332
	add %o0,4,%o0
.LL330:
.L_LC401:

	.pushsection	".line"
	.uaword	598	! radix.C:598
	.uahalf	0xffff
	.uaword	.L_LC401-.L_text_b
	.popsection
	cmp %l3,0
	be .LL407
	sethi %hi(-36568),%o0
	or %o0,%lo(-36568),%l0
	ld [%l6+%lo(global)],%o7
	sethi %hi(radix),%g1
	ld [%g1+%lo(radix)],%g3
.LL336:
.L_LC402:

	.pushsection	".line"
	.uaword	599	! radix.C:599
	.uahalf	0xffff
	.uaword	.L_LC402-.L_text_b
	.popsection
	andcc %l3,1,%g0
	be .LL337
	add %l5,%l3,%o1
.L_LC403:

	.pushsection	".line"
	.uaword	601	! radix.C:601
	.uahalf	0xffff
	.uaword	.L_LC403-.L_text_b
	.popsection
	sll %o1,3,%o0
	add %o0,%o1,%o0
	sll %o0,7,%o0
	add %o0,%o1,%o0
	sll %o0,2,%o0
	sub %o0,%o1,%o0
	sll %o0,3,%o0
	add %o0,%l0,%o0
.L_LC404:

	.pushsection	".line"
	.uaword	602	! radix.C:602
	.uahalf	0xffff
	.uaword	.L_LC404-.L_text_b
	.popsection
	mov 0,%o3
	cmp %o3,%g3
	bge .LL337
	add %o7,%o0,%l7
	sethi %hi(radix),%g4
	ld [%g4+%lo(radix)],%g2
	mov %i4,%o5
	mov %l7,%o4
.LL341:
.L_LC405:

	.pushsection	".line"
	.uaword	603	! radix.C:603
	.uahalf	0xffff
	.uaword	.L_LC405-.L_text_b
	.popsection
	sll %o3,2,%o0
.L_LC406:

	.pushsection	".line"
	.uaword	602	! radix.C:602
	.uahalf	0xffff
	.uaword	.L_LC406-.L_text_b
	.popsection
	add %o3,1,%o3
	cmp %o3,%g2
.L_LC407:

	.pushsection	".line"
	.uaword	603	! radix.C:603
	.uahalf	0xffff
	.uaword	.L_LC407-.L_text_b
	.popsection
	ld [%o5],%o1
	sethi %hi(16384),%g1
	ld [%o4+%g1],%o2
.L_LC408:

	.pushsection	".line"
	.uaword	602	! radix.C:602
	.uahalf	0xffff
	.uaword	.L_LC408-.L_text_b
	.popsection
	add %o5,4,%o5
.L_LC409:

	.pushsection	".line"
	.uaword	603	! radix.C:603
	.uahalf	0xffff
	.uaword	.L_LC409-.L_text_b
	.popsection
	add %o1,%o2,%o1
	st %o1,[%i4+%o0]
.L_LC410:

	.pushsection	".line"
	.uaword	602	! radix.C:602
	.uahalf	0xffff
	.uaword	.L_LC410-.L_text_b
	.popsection
	bl .LL341
	add %o4,4,%o4
.LL337:
.L_LC411:

	.pushsection	".line"
	.uaword	606	! radix.C:606
	.uahalf	0xffff
	.uaword	.L_LC411-.L_text_b
	.popsection
	add %l5,%l4,%l5
.L_LC412:

	.pushsection	".line"
	.uaword	608	! radix.C:608
	.uahalf	0xffff
	.uaword	.L_LC412-.L_text_b
	.popsection
	sra %l3,1,%l3
.L_LC413:

	.pushsection	".line"
	.uaword	609	! radix.C:609
	.uahalf	0xffff
	.uaword	.L_LC413-.L_text_b
	.popsection
	cmp %l3,0
	bne .LL336
	sra %l4,1,%l4
.LL407:
.L_LC414:

	.pushsection	".line"
	.uaword	610	! radix.C:610
	.uahalf	0xffff
	.uaword	.L_LC414-.L_text_b
	.popsection
	sethi %hi(radix),%g4
	ld [%g4+%lo(radix)],%o0
	mov 1,%o3
	cmp %o3,%o0
	bge .LL448
	cmp %i2,0
	mov %o0,%g2
	add %i4,4,%o5
	add %l2,4,%o4
.LL347:
.L_LC415:

	.pushsection	".line"
	.uaword	611	! radix.C:611
	.uahalf	0xffff
	.uaword	.L_LC415-.L_text_b
	.popsection
	sll %o3,2,%o0
.L_LC416:

	.pushsection	".line"
	.uaword	610	! radix.C:610
	.uahalf	0xffff
	.uaword	.L_LC416-.L_text_b
	.popsection
	add %o3,1,%o3
.L_LC417:

	.pushsection	".line"
	.uaword	611	! radix.C:611
	.uahalf	0xffff
	.uaword	.L_LC417-.L_text_b
	.popsection
	ld [%o5],%o1
.L_LC418:

	.pushsection	".line"
	.uaword	610	! radix.C:610
	.uahalf	0xffff
	.uaword	.L_LC418-.L_text_b
	.popsection
	cmp %o3,%g2
.L_LC419:

	.pushsection	".line"
	.uaword	611	! radix.C:611
	.uahalf	0xffff
	.uaword	.L_LC419-.L_text_b
	.popsection
	ld [%o4-4],%o2
.L_LC420:

	.pushsection	".line"
	.uaword	610	! radix.C:610
	.uahalf	0xffff
	.uaword	.L_LC420-.L_text_b
	.popsection
	add %o5,4,%o5
.L_LC421:

	.pushsection	".line"
	.uaword	611	! radix.C:611
	.uahalf	0xffff
	.uaword	.L_LC421-.L_text_b
	.popsection
	add %o1,%o2,%o1
	st %o1,[%i4+%o0]
.L_LC422:

	.pushsection	".line"
	.uaword	610	! radix.C:610
	.uahalf	0xffff
	.uaword	.L_LC422-.L_text_b
	.popsection
	bl .LL347
	add %o4,4,%o4
.L_LC423:

	.pushsection	".line"
	.uaword	614	! radix.C:614
	.uahalf	0xffff
	.uaword	.L_LC423-.L_text_b
	.popsection
	cmp %i2,0
.LL448:
	be .LL350
	ld [%fp-164],%g1
	cmp %g1,0
	be .LL449
	mov 9,%o0
.LL350:
.L_LC424:

	.pushsection	".line"
	.uaword	615	! radix.C:615
	.uahalf	0xffff
	.uaword	.L_LC424-.L_text_b
	.popsection
	call trap,0
	mov 24,%o0
	st %o0,[%fp-100]
.L_LC425:

	.pushsection	".line"
	.uaword	618	! radix.C:618
	.uahalf	0xffff
	.uaword	.L_LC425-.L_text_b
	.popsection
.L_B89:
	mov 9,%o0
.LL449:
	ld [%l6+%lo(global)],%o1
	sethi %hi(number_of_processors),%g4
	ld [%g4+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL351
	mov 13,%o0
	ld [%l6+%lo(global)],%o1
	call trap,0
	add %o1,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL352
	ld [%l6+%lo(global)],%o0
.L_B90:
	call cm_lock_backoff,0
	add %o0,268,%o0
.L_B90_e:
.LL352:
	ld [%l6+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,268,%o1
	ld [%l6+%lo(global)],%o2
	sethi %hi(number_of_processors),%g1
	ld [%g1+%lo(number_of_processors)],%o0
	ld [%o2+272],%o1
	add %o0,-1,%o0
	cmp %o1,%o0
	bge .LL450
	nop
.L_B91:
	ld [%o2+272],%o1
	add %o1,1,%o1
	st %o1,[%o2+272]
	ld [%o2+272],%o1
	mov 14,%o0
	call trap,0
	add %o2,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL354
	ld [%l6+%lo(global)],%o0
	call cm_unlock,0
	add %o0,268,%o0
.LL354:
.L_B91_e:
	ld [%l6+%lo(global)],%o1
	mov 13,%o0
	call trap,0
	add %o1,276,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL355
	ld [%l6+%lo(global)],%o0
.L_B92:
	call cm_lock_backoff,0
	add %o0,276,%o0
.L_B92_e:
.LL355:
	ld [%l6+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,276,%o1
	ld [%l6+%lo(global)],%o2
.LL450:
	ld [%o2+272],%o0
	cmp %o0,0
	bne .LL357
	mov 14,%o0
.L_B93:
	call trap,0
	add %o2,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL351
	ld [%l6+%lo(global)],%o0
.L_B93_e:
	b .LL419
	add %o0,268,%o0
.LL357:
.L_B94:
	ld [%o2+272],%o1
	add %o1,-1,%o1
	st %o1,[%o2+272]
	ld [%o2+272],%o1
	mov 14,%o0
	call trap,0
	add %o2,276,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL351
	ld [%l6+%lo(global)],%o0
	add %o0,276,%o0
.LL419:
	call cm_unlock,0
	nop
.L_B94_e:
.L_B95:
.L_B95_e:
.L_I7_4702:
.LL351:
.L_B89_e:
	mov 10,%o0
	ld [%l6+%lo(global)],%o1
	sethi %hi(number_of_processors),%g4
	ld [%g4+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,268,%o1
.L_LC426:

	.pushsection	".line"
	.uaword	620	! radix.C:620
	.uahalf	0xffff
	.uaword	.L_LC426-.L_text_b
	.popsection
	cmp %i2,0
	be .LL364
	ld [%fp-164],%g1
	cmp %g1,0
	be .LL451
	ld [%fp-44],%o3
.LL364:
.L_LC427:

	.pushsection	".line"
	.uaword	621	! radix.C:621
	.uahalf	0xffff
	.uaword	.L_LC427-.L_text_b
	.popsection
	call trap,0
	mov 24,%o0
	st %o0,[%fp-108]
.L_LC428:

	.pushsection	".line"
	.uaword	626	! radix.C:626
	.uahalf	0xffff
	.uaword	.L_LC428-.L_text_b
	.popsection
	ld [%fp-44],%o3
.LL451:
	ld [%fp-52],%g4
	cmp %o3,%g4
	bge .LL452
	cmp %i2,0
	ld [%fp-148],%g1
	sll %o3,2,%o0
	add %o0,%g1,%o4
.LL368:
.L_LC429:

	.pushsection	".line"
	.uaword	627	! radix.C:627
	.uahalf	0xffff
	.uaword	.L_LC429-.L_text_b
	.popsection
	ld [%o4],%o0
	ld [%fp-36],%g4
.L_LC430:

	.pushsection	".line"
	.uaword	628	! radix.C:628
	.uahalf	0xffff
	.uaword	.L_LC430-.L_text_b
	.popsection
	ld [%fp-28],%g1
.L_LC431:

	.pushsection	".line"
	.uaword	627	! radix.C:627
	.uahalf	0xffff
	.uaword	.L_LC431-.L_text_b
	.popsection
	and %o0,%g4,%o0
.L_LC432:

	.pushsection	".line"
	.uaword	628	! radix.C:628
	.uahalf	0xffff
	.uaword	.L_LC432-.L_text_b
	.popsection
	sra %o0,%g1,%o0
.L_LC433:

	.pushsection	".line"
	.uaword	629	! radix.C:629
	.uahalf	0xffff
	.uaword	.L_LC433-.L_text_b
	.popsection
	sll %o0,2,%o0
	ld [%i4+%o0],%o1
.L_LC434:

	.pushsection	".line"
	.uaword	630	! radix.C:630
	.uahalf	0xffff
	.uaword	.L_LC434-.L_text_b
	.popsection
	ld [%fp-156],%g4
.L_LC435:

	.pushsection	".line"
	.uaword	626	! radix.C:626
	.uahalf	0xffff
	.uaword	.L_LC435-.L_text_b
	.popsection
	ld [%fp-52],%g1
	add %o3,1,%o3
.L_LC436:

	.pushsection	".line"
	.uaword	630	! radix.C:630
	.uahalf	0xffff
	.uaword	.L_LC436-.L_text_b
	.popsection
	ld [%o4],%o2
	sll %o1,2,%o1
	st %o2,[%g4+%o1]
.L_LC437:

	.pushsection	".line"
	.uaword	631	! radix.C:631
	.uahalf	0xffff
	.uaword	.L_LC437-.L_text_b
	.popsection
	ld [%i4+%o0],%o1
.L_LC438:

	.pushsection	".line"
	.uaword	626	! radix.C:626
	.uahalf	0xffff
	.uaword	.L_LC438-.L_text_b
	.popsection
	cmp %o3,%g1
.L_LC439:

	.pushsection	".line"
	.uaword	631	! radix.C:631
	.uahalf	0xffff
	.uaword	.L_LC439-.L_text_b
	.popsection
	add %o1,1,%o1
	st %o1,[%i4+%o0]
	ld [%i4+%o0],%o0
.L_LC440:

	.pushsection	".line"
	.uaword	626	! radix.C:626
	.uahalf	0xffff
	.uaword	.L_LC440-.L_text_b
	.popsection
	bl .LL368
	add %o4,4,%o4
.L_LC441:

	.pushsection	".line"
	.uaword	634	! radix.C:634
	.uahalf	0xffff
	.uaword	.L_LC441-.L_text_b
	.popsection
	cmp %i2,0
.LL452:
	be .LL371
	ld [%fp-164],%g4
	cmp %g4,0
	be .LL453
	sethi %hi(max_num_digits),%o0
.LL371:
.L_LC442:

	.pushsection	".line"
	.uaword	635	! radix.C:635
	.uahalf	0xffff
	.uaword	.L_LC442-.L_text_b
	.popsection
	call trap,0
	mov 24,%o0
	st %o0,[%fp-116]
.L_LC443:

	.pushsection	".line"
	.uaword	638	! radix.C:638
	.uahalf	0xffff
	.uaword	.L_LC443-.L_text_b
	.popsection
	sethi %hi(max_num_digits),%o0
.LL453:
	ld [%o0+%lo(max_num_digits)],%o0
	ld [%fp-20],%g1
	add %o0,-1,%o0
	cmp %g1,%o0
	be .LL372
	mov 9,%o0
.L_LC444:

	.pushsection	".line"
	.uaword	639	! radix.C:639
	.uahalf	0xffff
	.uaword	.L_LC444-.L_text_b
	.popsection
	ld [%fp-60],%g4
	xor %g4,1,%g4
.L_LC445:

	.pushsection	".line"
	.uaword	640	! radix.C:640
	.uahalf	0xffff
	.uaword	.L_LC445-.L_text_b
	.popsection
	ld [%fp-68],%g1
.L_LC446:

	.pushsection	".line"
	.uaword	639	! radix.C:639
	.uahalf	0xffff
	.uaword	.L_LC446-.L_text_b
	.popsection
	st %g4,[%fp-60]
.L_LC447:

	.pushsection	".line"
	.uaword	640	! radix.C:640
	.uahalf	0xffff
	.uaword	.L_LC447-.L_text_b
	.popsection
	xor %g1,1,%g1
	st %g1,[%fp-68]
.LL372:
.L_LC448:

	.pushsection	".line"
	.uaword	643	! radix.C:643
	.uahalf	0xffff
	.uaword	.L_LC448-.L_text_b
	.popsection
.L_B96:
	ld [%l6+%lo(global)],%o1
	sethi %hi(number_of_processors),%g4
	ld [%g4+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL373
	mov 13,%o0
	ld [%l6+%lo(global)],%o1
	call trap,0
	add %o1,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL374
	ld [%l6+%lo(global)],%o0
.L_B97:
	call cm_lock_backoff,0
	add %o0,268,%o0
.L_B97_e:
.LL374:
	ld [%l6+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,268,%o1
	ld [%l6+%lo(global)],%o2
	sethi %hi(number_of_processors),%g1
	ld [%g1+%lo(number_of_processors)],%o0
	ld [%o2+272],%o1
	add %o0,-1,%o0
	cmp %o1,%o0
	bge .LL454
	nop
.L_B98:
	ld [%o2+272],%o1
	add %o1,1,%o1
	st %o1,[%o2+272]
	ld [%o2+272],%o1
	mov 14,%o0
	call trap,0
	add %o2,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL376
	ld [%l6+%lo(global)],%o0
	call cm_unlock,0
	add %o0,268,%o0
.LL376:
.L_B98_e:
	ld [%l6+%lo(global)],%o1
	mov 13,%o0
	call trap,0
	add %o1,276,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL377
	ld [%l6+%lo(global)],%o0
.L_B99:
	call cm_lock_backoff,0
	add %o0,276,%o0
.L_B99_e:
.LL377:
	ld [%l6+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,276,%o1
	ld [%l6+%lo(global)],%o2
.LL454:
	ld [%o2+272],%o0
	cmp %o0,0
	bne .LL379
	mov 14,%o0
.L_B100:
	call trap,0
	add %o2,268,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL373
	ld [%l6+%lo(global)],%o0
.L_B100_e:
	b .LL420
	add %o0,268,%o0
.LL379:
.L_B101:
	ld [%o2+272],%o1
	add %o1,-1,%o1
	st %o1,[%o2+272]
	ld [%o2+272],%o1
	mov 14,%o0
	call trap,0
	add %o2,276,%o1
	ld [%i1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL373
	ld [%l6+%lo(global)],%o0
	add %o0,276,%o0
.LL420:
	call cm_unlock,0
	nop
.L_B101_e:
.L_B102:
.L_B102_e:
.L_I7_5139:
.LL373:
.L_B96_e:
	mov 10,%o0
	ld [%l6+%lo(global)],%o1
	sethi %hi(number_of_processors),%g4
	ld [%g4+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,268,%o1
.L_LC449:

	.pushsection	".line"
	.uaword	645	! radix.C:645
	.uahalf	0xffff
	.uaword	.L_LC449-.L_text_b
	.popsection
	cmp %i2,0
	be .LL386
	ld [%fp-164],%g1
	cmp %g1,0
	be .LL455
	ld [%fp-20],%g1
.LL386:
.L_LC450:

	.pushsection	".line"
	.uaword	646	! radix.C:646
	.uahalf	0xffff
	.uaword	.L_LC450-.L_text_b
	.popsection
	ld [%fp-100],%g4
	ld [%fp-92],%g1
	sub %g4,%g1,%o0
	st %o0,[%fp-16]
	ld [%fp-16],%f6
	cmp %o0,0
	bge .LL387
	fitod %f6,%f4
	sethi %hi(.LLC41),%g1
	ldd [%g1+%lo(.LLC41)],%f2
	faddd %f4,%f2,%f4
.LL387:
	ldd [%fp-136],%f6
.L_LC451:

	.pushsection	".line"
	.uaword	647	! radix.C:647
	.uahalf	0xffff
	.uaword	.L_LC451-.L_text_b
	.popsection
	ld [%fp-116],%g1
.L_LC452:

	.pushsection	".line"
	.uaword	646	! radix.C:646
	.uahalf	0xffff
	.uaword	.L_LC452-.L_text_b
	.popsection
	faddd %f6,%f4,%f6
.L_LC453:

	.pushsection	".line"
	.uaword	647	! radix.C:647
	.uahalf	0xffff
	.uaword	.L_LC453-.L_text_b
	.popsection
	ld [%fp-108],%g4
	sub %g1,%g4,%o0
	st %o0,[%fp-16]
.L_LC454:

	.pushsection	".line"
	.uaword	646	! radix.C:646
	.uahalf	0xffff
	.uaword	.L_LC454-.L_text_b
	.popsection
	std %f6,[%fp-136]
.L_LC455:

	.pushsection	".line"
	.uaword	647	! radix.C:647
	.uahalf	0xffff
	.uaword	.L_LC455-.L_text_b
	.popsection
	ld [%fp-16],%f6
	cmp %o0,0
	bge .LL388
	fitod %f6,%f4
	sethi %hi(.LLC41),%g1
	ldd [%g1+%lo(.LLC41)],%f2
	faddd %f4,%f2,%f4
.LL388:
	ldd [%fp-144],%f6
	faddd %f6,%f4,%f6
	std %f6,[%fp-144]
.L_LC456:

	.pushsection	".line"
	.uaword	492	! radix.C:492
	.uahalf	0xffff
	.uaword	.L_LC456-.L_text_b
	.popsection
	ld [%fp-20],%g1
.LL455:
	sethi %hi(max_num_digits),%o0
	ld [%o0+%lo(max_num_digits)],%o0
	add %g1,1,%g1
	cmp %g1,%o0
	bl .LL190
	st %g1,[%fp-20]
.LL188:
.L_LC457:

	.pushsection	".line"
	.uaword	651	! radix.C:651
	.uahalf	0xffff
	.uaword	.L_LC457-.L_text_b
	.popsection
.L_B103:
	mov 9,%o0
	sethi %hi(global),%l0
	ld [%l0+%lo(global)],%o1
	sethi %hi(number_of_processors),%l2
	ld [%l2+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,268,%o1
	sethi %hi(lock_model),%l1
	ld [%l1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL390
	mov 13,%o0
	ld [%l0+%lo(global)],%o1
	call trap,0
	add %o1,268,%o1
	ld [%l1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL391
	ld [%l0+%lo(global)],%o0
.L_B104:
	call cm_lock_backoff,0
	add %o0,268,%o0
.L_B104_e:
.LL391:
	ld [%l0+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,268,%o1
	ld [%l0+%lo(global)],%o2
	ld [%l2+%lo(number_of_processors)],%o0
	ld [%o2+272],%o1
	add %o0,-1,%o0
	cmp %o1,%o0
	bge,a .LL456
	sethi %hi(global),%l0
.L_B105:
	ld [%o2+272],%o1
	add %o1,1,%o1
	st %o1,[%o2+272]
	ld [%o2+272],%o1
	mov 14,%o0
	call trap,0
	add %o2,268,%o1
	ld [%l1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL393
	ld [%l0+%lo(global)],%o0
	call cm_unlock,0
	add %o0,268,%o0
.LL393:
.L_B105_e:
	ld [%l0+%lo(global)],%o1
	mov 13,%o0
	call trap,0
	add %o1,276,%o1
	ld [%l1+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL394
	ld [%l0+%lo(global)],%o0
.L_B106:
	call cm_lock_backoff,0
	add %o0,276,%o0
.L_B106_e:
.LL394:
	ld [%l0+%lo(global)],%o1
	mov 8,%o0
	call trap,0
	add %o1,276,%o1
	sethi %hi(global),%l0
.LL456:
	ld [%l0+%lo(global)],%o2
	ld [%o2+272],%o0
	cmp %o0,0
	bne .LL396
	mov 14,%o0
.L_B107:
	call trap,0
	add %o2,268,%o1
	sethi %hi(lock_model),%o0
	ld [%o0+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL390
	ld [%l0+%lo(global)],%o0
.L_B107_e:
	b .LL421
	add %o0,268,%o0
.LL396:
.L_B108:
	ld [%o2+272],%o1
	add %o1,-1,%o1
	st %o1,[%o2+272]
	ld [%o2+272],%o1
	mov 14,%o0
	call trap,0
	add %o2,276,%o1
	sethi %hi(lock_model),%o0
	ld [%o0+%lo(lock_model)],%o0
	cmp %o0,3
	be .LL390
	ld [%l0+%lo(global)],%o0
	add %o0,276,%o0
.LL421:
	call cm_unlock,0
	nop
.L_B108_e:
.L_B109:
.L_B109_e:
.L_I7_5507:
.LL390:
.L_B103_e:
	mov 10,%o0
	sethi %hi(global),%l0
	ld [%l0+%lo(global)],%o1
	sethi %hi(number_of_processors),%o2
	ld [%o2+%lo(number_of_processors)],%o2
	call trap,0
	add %o1,268,%o1
.L_LC458:

	.pushsection	".line"
	.uaword	652	! radix.C:652
	.uahalf	0xffff
	.uaword	.L_LC458-.L_text_b
	.popsection
	cmp %i2,0
	be .LL403
	ld [%fp-164],%g4
	cmp %g4,0
	be .LL457
	cmp %i2,0
.LL403:
.L_LC459:

	.pushsection	".line"
	.uaword	653	! radix.C:653
	.uahalf	0xffff
	.uaword	.L_LC459-.L_text_b
	.popsection
	call trap,0
	mov 24,%o0
.L_LC460:

	.pushsection	".line"
	.uaword	656	! radix.C:656
	.uahalf	0xffff
	.uaword	.L_LC460-.L_text_b
	.popsection
	ld [%fp-84],%g1
.L_LC461:

	.pushsection	".line"
	.uaword	653	! radix.C:653
	.uahalf	0xffff
	.uaword	.L_LC461-.L_text_b
	.popsection
	st %o0,[%fp-124]
.L_LC462:

	.pushsection	".line"
	.uaword	656	! radix.C:656
	.uahalf	0xffff
	.uaword	.L_LC462-.L_text_b
	.popsection
	sub %o0,%g1,%o2
	st %o2,[%fp-16]
	ld [%fp-16],%f6
	fitod %f6,%f4
.L_LC463:

	.pushsection	".line"
	.uaword	654	! radix.C:654
	.uahalf	0xffff
	.uaword	.L_LC463-.L_text_b
	.popsection
	ld [%l0+%lo(global)],%o1
	ld [%o1+292],%o0
	ldd [%fp-136],%f6
	sll %i2,3,%o3
	std %f6,[%o0+%o3]
.L_LC464:

	.pushsection	".line"
	.uaword	655	! radix.C:655
	.uahalf	0xffff
	.uaword	.L_LC464-.L_text_b
	.popsection
	ld [%o1+296],%o0
	ldd [%fp-144],%f6
	std %f6,[%o0+%o3]
.L_LC465:

	.pushsection	".line"
	.uaword	656	! radix.C:656
	.uahalf	0xffff
	.uaword	.L_LC465-.L_text_b
	.popsection
	cmp %o2,0
	bge .LL404
	ld [%o1+300],%o0
	sethi %hi(.LLC41),%g1
	ldd [%g1+%lo(.LLC41)],%f2
	faddd %f4,%f2,%f4
.LL404:
	std %f4,[%o0+%o3]
.L_LC466:

	.pushsection	".line"
	.uaword	658	! radix.C:658
	.uahalf	0xffff
	.uaword	.L_LC466-.L_text_b
	.popsection
	cmp %i2,0
.LL457:
	bne .LL405
	sethi %hi(global),%o0
.L_LC467:

	.pushsection	".line"
	.uaword	659	! radix.C:659
	.uahalf	0xffff
	.uaword	.L_LC467-.L_text_b
	.popsection
	ld [%o0+%lo(global)],%o0
	ld [%fp-84],%g4
.L_LC468:

	.pushsection	".line"
	.uaword	660	! radix.C:660
	.uahalf	0xffff
	.uaword	.L_LC468-.L_text_b
	.popsection
	ld [%fp-124],%g1
.L_LC469:

	.pushsection	".line"
	.uaword	659	! radix.C:659
	.uahalf	0xffff
	.uaword	.L_LC469-.L_text_b
	.popsection
	st %g4,[%o0+312]
.L_LC470:

	.pushsection	".line"
	.uaword	661	! radix.C:661
	.uahalf	0xffff
	.uaword	.L_LC470-.L_text_b
	.popsection
	ld [%fp-68],%g4
.L_LC471:

	.pushsection	".line"
	.uaword	660	! radix.C:660
	.uahalf	0xffff
	.uaword	.L_LC471-.L_text_b
	.popsection
	st %g1,[%o0+316]
.L_LC472:

	.pushsection	".line"
	.uaword	661	! radix.C:661
	.uahalf	0xffff
	.uaword	.L_LC472-.L_text_b
	.popsection
	st %g4,[%o0+304]
.LL405:
.L_LC473:

	.pushsection	".line"
	.uaword	664	! radix.C:664
	.uahalf	0xffff
	.uaword	.L_LC473-.L_text_b
	.popsection
.L_b7_e:
	ret
	restore
.L_f7_e:
.LLfe5:
	.size	 slave_sort,.LLfe5-slave_sort

	.pushsection	".debug_pubnames"
	.uaword	.L_P5
	.asciz	"slave_sort"
	.popsection

	.pushsection	".debug"
.L_P5:
.L_D23:
	.uaword	.L_D23_e-.L_D23
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D91
	.uahalf	0x38
	.asciz	"slave_sort"
	.uahalf	0x111
	.uaword	slave_sort
	.uahalf	0x121
	.uaword	.L_f7_e
	.uahalf	0x8041
	.uaword	.L_b7
	.uahalf	0x8051
	.uaword	.L_b7_e
.L_D23_e:
.L_D92:
	.uaword	.L_D92_e-.L_D92
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D93
	.uahalf	0x38
	.asciz	"L5283"
.L_D92_e:
.L_D93:
	.uaword	.L_D93_e-.L_D93
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D94
	.uahalf	0x38
	.asciz	"L5284"
.L_D93_e:
.L_D94:
	.uaword	.L_D94_e-.L_D94
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D95
	.uahalf	0x38
	.asciz	"L5285"
.L_D94_e:
.L_D95:
	.uaword	.L_D95_e-.L_D95
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D96
	.uahalf	0x38
	.asciz	"L5286"
.L_D95_e:
.L_D96:
	.uaword	.L_D96_e-.L_D96
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D97
	.uahalf	0x38
	.asciz	"L5287"
.L_D96_e:
.L_D97:
	.uaword	.L_D97_e-.L_D97
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D98
	.uahalf	0x38
	.asciz	"L5288"
.L_D97_e:
.L_D98:
	.uaword	.L_D98_e-.L_D98
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D99
	.uahalf	0x38
	.asciz	"L5289"
.L_D98_e:
.L_D99:
	.uaword	.L_D99_e-.L_D99
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D100
	.uahalf	0x38
	.asciz	"L5290"
.L_D99_e:
.L_D100:
	.uaword	.L_D100_e-.L_D100
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D101
	.uahalf	0x38
	.asciz	"L5291"
.L_D100_e:
.L_D101:
	.uaword	.L_D101_e-.L_D101
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D102
	.uahalf	0x38
	.asciz	"L5292"
.L_D101_e:
.L_D102:
	.uaword	.L_D102_e-.L_D102
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D103
	.uahalf	0x38
	.asciz	"L5293"
	.uahalf	0x111
	.uaword	.L_I7_4180
.L_D102_e:
.L_D103:
	.uaword	.L_D103_e-.L_D103
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D104
	.uahalf	0x38
	.asciz	"L5294"
.L_D103_e:
.L_D104:
	.uaword	.L_D104_e-.L_D104
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D105
	.uahalf	0x38
	.asciz	"L5295"
.L_D104_e:
.L_D105:
	.uaword	.L_D105_e-.L_D105
	.uahalf	0xa
	.uahalf	0x12
	.uaword	.L_D106
	.uahalf	0x38
	.asciz	"L5296"
.L_D105_e:
.L_D106:
	.uaword	.L_D106_e-.L_D106
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D107
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l106_e-.L_l106
.L_l106:
	.byte	0x1
	.uaword	0xb
.L_l106_e:
.L_D106_e:
.L_D107:
	.uaword	.L_D107_e-.L_D107
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D108
	.uahalf	0x38
	.asciz	"j"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l107_e-.L_l107
.L_l107:
.L_l107_e:
.L_D107_e:
.L_D108:
	.uaword	.L_D108_e-.L_D108
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D109
	.uahalf	0x38
	.asciz	"k"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l108_e-.L_l108
.L_l108:
.L_l108_e:
.L_D108_e:
.L_D109:
	.uaword	.L_D109_e-.L_D109
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D110
	.uahalf	0x38
	.asciz	"kk"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l109_e-.L_l109
.L_l109:
.L_l109_e:
.L_D109_e:
.L_D110:
	.uaword	.L_D110_e-.L_D110
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D111
	.uahalf	0x38
	.asciz	"Ind"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l110_e-.L_l110
.L_l110:
.L_l110_e:
.L_D110_e:
.L_D111:
	.uaword	.L_D111_e-.L_D111
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D112
	.uahalf	0x38
	.asciz	"MyNum"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l111_e-.L_l111
.L_l111:
	.byte	0x1
	.uaword	0x1a
.L_l111_e:
.L_D111_e:
.L_D112:
	.uaword	.L_D112_e-.L_D112
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D113
	.uahalf	0x38
	.asciz	"this_key"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l112_e-.L_l112
.L_l112:
	.byte	0x1
	.uaword	0x8
.L_l112_e:
.L_D112_e:
.L_D113:
	.uaword	.L_D113_e-.L_D113
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D114
	.uahalf	0x38
	.asciz	"tmp"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l113_e-.L_l113
.L_l113:
	.byte	0x1
	.uaword	0x9
.L_l113_e:
.L_D113_e:
.L_D114:
	.uaword	.L_D114_e-.L_D114
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D115
	.uahalf	0x38
	.asciz	"last_key"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l114_e-.L_l114
.L_l114:
.L_l114_e:
.L_D114_e:
.L_D115:
	.uaword	.L_D115_e-.L_D115
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D116
	.uahalf	0x38
	.asciz	"loopnum"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l115_e-.L_l115
.L_l115:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffec
	.byte	0x7
.L_l115_e:
.L_D115_e:
.L_D116:
	.uaword	.L_D116_e-.L_D116
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D117
	.uahalf	0x38
	.asciz	"ran_num"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l116_e-.L_l116
.L_l116:
.L_l116_e:
.L_D116_e:
.L_D117:
	.uaword	.L_D117_e-.L_D117
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D118
	.uahalf	0x38
	.asciz	"sum"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l117_e-.L_l117
.L_l117:
.L_l117_e:
.L_D117_e:
.L_D118:
	.uaword	.L_D118_e-.L_D118
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D119
	.uahalf	0x38
	.asciz	"shiftnum"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l118_e-.L_l118
.L_l118:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffe4
	.byte	0x7
.L_l118_e:
.L_D118_e:
.L_D119:
	.uaword	.L_D119_e-.L_D119
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D120
	.uahalf	0x38
	.asciz	"bb"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l119_e-.L_l119
.L_l119:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffdc
	.byte	0x7
.L_l119_e:
.L_D119_e:
.L_D120:
	.uaword	.L_D120_e-.L_D120
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D121
	.uahalf	0x38
	.asciz	"my_key"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l120_e-.L_l120
.L_l120:
	.byte	0x1
	.uaword	0x8
.L_l120_e:
.L_D120_e:
.L_D121:
	.uaword	.L_D121_e-.L_D121
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D122
	.uahalf	0x38
	.asciz	"key_start"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l121_e-.L_l121
.L_l121:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffd4
	.byte	0x7
.L_l121_e:
.L_D121_e:
.L_D122:
	.uaword	.L_D122_e-.L_D122
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D123
	.uahalf	0x38
	.asciz	"key_stop"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l122_e-.L_l122
.L_l122:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffcc
	.byte	0x7
.L_l122_e:
.L_D122_e:
.L_D123:
	.uaword	.L_D123_e-.L_D123
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D124
	.uahalf	0x38
	.asciz	"rank_start"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l123_e-.L_l123
.L_l123:
	.byte	0x1
	.uaword	0xb
.L_l123_e:
.L_D123_e:
.L_D124:
	.uaword	.L_D124_e-.L_D124
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D125
	.uahalf	0x38
	.asciz	"rank_stop"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l124_e-.L_l124
.L_l124:
	.byte	0x1
	.uaword	0xa
.L_l124_e:
.L_D124_e:
.L_D125:
	.uaword	.L_D125_e-.L_D125
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D126
	.uahalf	0x38
	.asciz	"from"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l125_e-.L_l125
.L_l125:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffc4
	.byte	0x7
.L_l125_e:
.L_D125_e:
.L_D126:
	.uaword	.L_D126_e-.L_D126
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D127
	.uahalf	0x38
	.asciz	"to"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l126_e-.L_l126
.L_l126:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffbc
	.byte	0x7
.L_l126_e:
.L_D126_e:
.L_D127:
	.uaword	.L_D127_e-.L_D127
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D128
	.uahalf	0x38
	.asciz	"key_density"
	.uahalf	0x63
	.uahalf	.L_t127_e-.L_t127
.L_t127:
	.byte	0x1
	.uahalf	0x7
.L_t127_e:
	.uahalf	0x23
	.uahalf	.L_l127_e-.L_l127
.L_l127:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffb4
	.byte	0x7
.L_l127_e:
.L_D127_e:
.L_D128:
	.uaword	.L_D128_e-.L_D128
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D129
	.uahalf	0x38
	.asciz	"time1"
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l128_e-.L_l128
.L_l128:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffac
	.byte	0x7
.L_l128_e:
.L_D128_e:
.L_D129:
	.uaword	.L_D129_e-.L_D129
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D130
	.uahalf	0x38
	.asciz	"time2"
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l129_e-.L_l129
.L_l129:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffffa4
	.byte	0x7
.L_l129_e:
.L_D129_e:
.L_D130:
	.uaword	.L_D130_e-.L_D130
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D131
	.uahalf	0x38
	.asciz	"time3"
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l130_e-.L_l130
.L_l130:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffff9c
	.byte	0x7
.L_l130_e:
.L_D130_e:
.L_D131:
	.uaword	.L_D131_e-.L_D131
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D132
	.uahalf	0x38
	.asciz	"time4"
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l131_e-.L_l131
.L_l131:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffff94
	.byte	0x7
.L_l131_e:
.L_D131_e:
.L_D132:
	.uaword	.L_D132_e-.L_D132
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D133
	.uahalf	0x38
	.asciz	"time5"
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l132_e-.L_l132
.L_l132:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffff8c
	.byte	0x7
.L_l132_e:
.L_D132_e:
.L_D133:
	.uaword	.L_D133_e-.L_D133
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D134
	.uahalf	0x38
	.asciz	"time6"
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l133_e-.L_l133
.L_l133:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffff84
	.byte	0x7
.L_l133_e:
.L_D133_e:
.L_D134:
	.uaword	.L_D134_e-.L_D134
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D135
	.uahalf	0x38
	.asciz	"ranktime"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l134_e-.L_l134
.L_l134:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffff78
	.byte	0x7
.L_l134_e:
.L_D134_e:
.L_D135:
	.uaword	.L_D135_e-.L_D135
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D136
	.uahalf	0x38
	.asciz	"sorttime"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l135_e-.L_l135
.L_l135:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffff70
	.byte	0x7
.L_l135_e:
.L_D135_e:
.L_D136:
	.uaword	.L_D136_e-.L_D136
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D137
	.uahalf	0x38
	.asciz	"key_from"
	.uahalf	0x63
	.uahalf	.L_t136_e-.L_t136
.L_t136:
	.byte	0x1
	.uahalf	0x7
.L_t136_e:
	.uahalf	0x23
	.uahalf	.L_l136_e-.L_l136
.L_l136:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffff6c
	.byte	0x7
.L_l136_e:
.L_D136_e:
.L_D137:
	.uaword	.L_D137_e-.L_D137
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D138
	.uahalf	0x38
	.asciz	"key_to"
	.uahalf	0x63
	.uahalf	.L_t137_e-.L_t137
.L_t137:
	.byte	0x1
	.uahalf	0x7
.L_t137_e:
	.uahalf	0x23
	.uahalf	.L_l137_e-.L_l137
.L_l137:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffff64
	.byte	0x7
.L_l137_e:
.L_D137_e:
.L_D138:
	.uaword	.L_D138_e-.L_D138
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D139
	.uahalf	0x38
	.asciz	"rank_me_mynum"
	.uahalf	0x63
	.uahalf	.L_t138_e-.L_t138
.L_t138:
	.byte	0x1
	.uahalf	0x7
.L_t138_e:
	.uahalf	0x23
	.uahalf	.L_l138_e-.L_l138
.L_l138:
	.byte	0x1
	.uaword	0x1d
.L_l138_e:
.L_D138_e:
.L_D139:
	.uaword	.L_D139_e-.L_D139
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D140
	.uahalf	0x38
	.asciz	"rank_me_i"
	.uahalf	0x63
	.uahalf	.L_t139_e-.L_t139
.L_t139:
	.byte	0x1
	.uahalf	0x7
.L_t139_e:
	.uahalf	0x23
	.uahalf	.L_l139_e-.L_l139
.L_l139:
.L_l139_e:
.L_D139_e:
.L_D140:
	.uaword	.L_D140_e-.L_D140
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D141
	.uahalf	0x38
	.asciz	"rank_ff_mynum"
	.uahalf	0x63
	.uahalf	.L_t140_e-.L_t140
.L_t140:
	.byte	0x1
	.uahalf	0x7
.L_t140_e:
	.uahalf	0x23
	.uahalf	.L_l140_e-.L_l140
.L_l140:
	.byte	0x1
	.uaword	0x1c
.L_l140_e:
.L_D140_e:
.L_D141:
	.uaword	.L_D141_e-.L_D141
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D142
	.uahalf	0x38
	.asciz	"stats"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l141_e-.L_l141
.L_l141:
	.byte	0x2
	.uaword	0x1e
	.byte	0x4
	.uaword	0xffffff5c
	.byte	0x7
.L_l141_e:
.L_D141_e:
.L_D142:
	.uaword	.L_D142_e-.L_D142
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D143
	.uahalf	0x38
	.asciz	"n"
	.uahalf	0x83
	.uahalf	.L_t142_e-.L_t142
.L_t142:
	.byte	0x1
	.uaword	.L_T236
.L_t142_e:
	.uahalf	0x23
	.uahalf	.L_l142_e-.L_l142
.L_l142:
	.byte	0x1
	.uaword	0x11
.L_l142_e:
.L_D142_e:
.L_D143:
	.uaword	.L_D143_e-.L_D143
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D144
	.uahalf	0x38
	.asciz	"r"
	.uahalf	0x83
	.uahalf	.L_t143_e-.L_t143
.L_t143:
	.byte	0x1
	.uaword	.L_T236
.L_t143_e:
	.uahalf	0x23
	.uahalf	.L_l143_e-.L_l143
.L_l143:
	.byte	0x1
	.uaword	0x12
.L_l143_e:
.L_D143_e:
.L_D144:
	.uaword	.L_D144_e-.L_D144
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D145
	.uahalf	0x38
	.asciz	"l"
	.uahalf	0x83
	.uahalf	.L_t144_e-.L_t144
.L_t144:
	.byte	0x1
	.uaword	.L_T236
.L_t144_e:
	.uahalf	0x23
	.uahalf	.L_l144_e-.L_l144
.L_l144:
	.byte	0x1
	.uaword	0x17
.L_l144_e:
.L_D144_e:
.L_D145:
	.uaword	.L_D145_e-.L_D145
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D146
	.uahalf	0x38
	.asciz	"my_node"
	.uahalf	0x83
	.uahalf	.L_t145_e-.L_t145
.L_t145:
	.byte	0x1
	.uaword	.L_T236
.L_t145_e:
	.uahalf	0x23
	.uahalf	.L_l145_e-.L_l145
.L_l145:
	.byte	0x1
	.uaword	0x12
.L_l145_e:
.L_D145_e:
.L_D146:
	.uaword	.L_D146_e-.L_D146
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D147
	.uahalf	0x38
	.asciz	"their_node"
	.uahalf	0x83
	.uahalf	.L_t146_e-.L_t146
.L_t146:
	.byte	0x1
	.uaword	.L_T236
.L_t146_e:
	.uahalf	0x23
	.uahalf	.L_l146_e-.L_l146
.L_l146:
	.byte	0x1
	.uaword	0x11
.L_l146_e:
.L_D146_e:
.L_D147:
	.uaword	.L_D147_e-.L_D147
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D148
	.uahalf	0x38
	.asciz	"prefx"
	.uahalf	0x63
	.uahalf	.L_t147_e-.L_t147
.L_t147:
	.byte	0x1
	.byte	0x4
	.uahalf	0x7
.L_t147_e:
	.uahalf	0x23
	.uahalf	.L_l147_e-.L_l147
.L_l147:
.L_l147_e:
.L_D147_e:
.L_D148:
	.uaword	.L_D148_e-.L_D148
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D149
	.uahalf	0x38
	.asciz	"index"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l148_e-.L_l148
.L_l148:
	.byte	0x1
	.uaword	0xa
.L_l148_e:
.L_D148_e:
.L_D149:
	.uaword	.L_D149_e-.L_D149
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D150
	.uahalf	0x38
	.asciz	"level"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l149_e-.L_l149
.L_l149:
	.byte	0x1
	.uaword	0x14
.L_l149_e:
.L_D149_e:
.L_D150:
	.uaword	.L_D150_e-.L_D150
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D151
	.uahalf	0x38
	.asciz	"base"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l150_e-.L_l150
.L_l150:
	.byte	0x1
	.uaword	0x15
.L_l150_e:
.L_D150_e:
.L_D151:
	.uaword	.L_D151_e-.L_D151
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D152
	.uahalf	0x38
	.asciz	"offset"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l151_e-.L_l151
.L_l151:
	.byte	0x1
	.uaword	0x13
.L_l151_e:
.L_D151_e:
.L_D152:
	.uaword	.L_D152_e-.L_D152
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D153
	.uahalf	0x111
	.uaword	.L_B19
	.uahalf	0x121
	.uaword	.L_B19_e
.L_D152_e:
.L_D154:
	.uaword	.L_D154_e-.L_D154
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D155
	.uahalf	0x111
	.uaword	.L_B20
	.uahalf	0x121
	.uaword	.L_B20_e
.L_D154_e:
.L_D156:
	.uaword	0x4
.L_D155:
	.uaword	0x4
.L_D153:
	.uaword	.L_D153_e-.L_D153
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D157
	.uahalf	0x111
	.uaword	.L_B21
	.uahalf	0x121
	.uaword	.L_B21_e
.L_D153_e:
.L_D158:
	.uaword	0x4
.L_D157:
	.uaword	.L_D157_e-.L_D157
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D159
	.uahalf	0x111
	.uaword	.L_B22
	.uahalf	0x121
	.uaword	.L_B22_e
.L_D157_e:
.L_D160:
	.uaword	.L_D160_e-.L_D160
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D161
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t160_e-.L_t160
.L_t160:
	.byte	0x1
	.uahalf	0x7
.L_t160_e:
	.uahalf	0x23
	.uahalf	.L_l160_e-.L_l160
.L_l160:
.L_l160_e:
.L_D160_e:
.L_D161:
	.uaword	.L_D161_e-.L_D161
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D162
	.uahalf	0x111
	.uaword	.L_B23
	.uahalf	0x121
	.uaword	.L_B23_e
.L_D161_e:
.L_D163:
	.uaword	0x4
.L_D162:
	.uaword	.L_D162_e-.L_D162
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D164
	.uahalf	0x111
	.uaword	.L_B24
	.uahalf	0x121
	.uaword	.L_B24_e
.L_D162_e:
.L_D165:
	.uaword	0x4
.L_D164:
	.uaword	.L_D164_e-.L_D164
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D166
	.uahalf	0x111
	.uaword	.L_B25
	.uahalf	0x121
	.uaword	.L_B25_e
.L_D164_e:
.L_D167:
	.uaword	0x4
.L_D166:
	.uaword	.L_D166_e-.L_D166
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D168
	.uahalf	0x111
	.uaword	.L_B26
	.uahalf	0x121
	.uaword	.L_B26_e
.L_D166_e:
.L_D169:
	.uaword	0x4
.L_D168:
	.uaword	.L_D168_e-.L_D168
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D170
	.uahalf	0x111
	.uaword	.L_B27
	.uahalf	0x121
	.uaword	.L_B27_e
.L_D168_e:
.L_D171:
	.uaword	0x4
.L_D170:
	.uaword	.L_D170_e-.L_D170
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D172
	.uahalf	0x111
	.uaword	.L_B28
	.uahalf	0x121
	.uaword	.L_B28_e
.L_D170_e:
.L_D173:
	.uaword	0x4
.L_D172:
	.uaword	0x4
.L_D159:
	.uaword	.L_D159_e-.L_D159
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D174
	.uahalf	0x111
	.uaword	.L_B29
	.uahalf	0x121
	.uaword	.L_B29_e
.L_D159_e:
.L_D175:
	.uaword	.L_D175_e-.L_D175
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D176
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t175_e-.L_t175
.L_t175:
	.byte	0x1
	.uahalf	0x7
.L_t175_e:
	.uahalf	0x23
	.uahalf	.L_l175_e-.L_l175
.L_l175:
.L_l175_e:
.L_D175_e:
.L_D176:
	.uaword	.L_D176_e-.L_D176
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D177
	.uahalf	0x111
	.uaword	.L_B30
	.uahalf	0x121
	.uaword	.L_B30_e
.L_D176_e:
.L_D178:
	.uaword	0x4
.L_D177:
	.uaword	.L_D177_e-.L_D177
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D179
	.uahalf	0x111
	.uaword	.L_B31
	.uahalf	0x121
	.uaword	.L_B31_e
.L_D177_e:
.L_D180:
	.uaword	0x4
.L_D179:
	.uaword	.L_D179_e-.L_D179
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D181
	.uahalf	0x111
	.uaword	.L_B32
	.uahalf	0x121
	.uaword	.L_B32_e
.L_D179_e:
.L_D182:
	.uaword	0x4
.L_D181:
	.uaword	.L_D181_e-.L_D181
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D183
	.uahalf	0x111
	.uaword	.L_B33
	.uahalf	0x121
	.uaword	.L_B33_e
.L_D181_e:
.L_D184:
	.uaword	0x4
.L_D183:
	.uaword	.L_D183_e-.L_D183
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D185
	.uahalf	0x111
	.uaword	.L_B34
	.uahalf	0x121
	.uaword	.L_B34_e
.L_D183_e:
.L_D186:
	.uaword	0x4
.L_D185:
	.uaword	.L_D185_e-.L_D185
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D187
	.uahalf	0x111
	.uaword	.L_B35
	.uahalf	0x121
	.uaword	.L_B35_e
.L_D185_e:
.L_D188:
	.uaword	0x4
.L_D187:
	.uaword	0x4
.L_D174:
	.uaword	.L_D174_e-.L_D174
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D189
	.uahalf	0x111
	.uaword	.L_B36
	.uahalf	0x121
	.uaword	.L_B36_e
.L_D174_e:
.L_D190:
	.uaword	.L_D190_e-.L_D190
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D191
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t190_e-.L_t190
.L_t190:
	.byte	0x1
	.uahalf	0x7
.L_t190_e:
	.uahalf	0x23
	.uahalf	.L_l190_e-.L_l190
.L_l190:
.L_l190_e:
.L_D190_e:
.L_D191:
	.uaword	.L_D191_e-.L_D191
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D192
	.uahalf	0x111
	.uaword	.L_B37
	.uahalf	0x121
	.uaword	.L_B37_e
.L_D191_e:
.L_D193:
	.uaword	0x4
.L_D192:
	.uaword	.L_D192_e-.L_D192
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D194
	.uahalf	0x111
	.uaword	.L_B38
	.uahalf	0x121
	.uaword	.L_B38_e
.L_D192_e:
.L_D195:
	.uaword	0x4
.L_D194:
	.uaword	.L_D194_e-.L_D194
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D196
	.uahalf	0x111
	.uaword	.L_B39
	.uahalf	0x121
	.uaword	.L_B39_e
.L_D194_e:
.L_D197:
	.uaword	0x4
.L_D196:
	.uaword	.L_D196_e-.L_D196
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D198
	.uahalf	0x111
	.uaword	.L_B40
	.uahalf	0x121
	.uaword	.L_B40_e
.L_D196_e:
.L_D199:
	.uaword	0x4
.L_D198:
	.uaword	.L_D198_e-.L_D198
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D200
	.uahalf	0x111
	.uaword	.L_B41
	.uahalf	0x121
	.uaword	.L_B41_e
.L_D198_e:
.L_D201:
	.uaword	0x4
.L_D200:
	.uaword	.L_D200_e-.L_D200
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D202
	.uahalf	0x111
	.uaword	.L_B42
	.uahalf	0x121
	.uaword	.L_B42_e
.L_D200_e:
.L_D203:
	.uaword	0x4
.L_D202:
	.uaword	0x4
.L_D189:
	.uaword	.L_D189_e-.L_D189
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D204
	.uahalf	0x111
	.uaword	.L_B43
	.uahalf	0x121
	.uaword	.L_B43_e
.L_D189_e:
.L_D205:
	.uaword	.L_D205_e-.L_D205
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D206
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t205_e-.L_t205
.L_t205:
	.byte	0x1
	.uahalf	0x7
.L_t205_e:
	.uahalf	0x23
	.uahalf	.L_l205_e-.L_l205
.L_l205:
.L_l205_e:
.L_D205_e:
.L_D206:
	.uaword	.L_D206_e-.L_D206
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D207
	.uahalf	0x111
	.uaword	.L_B44
	.uahalf	0x121
	.uaword	.L_B44_e
.L_D206_e:
.L_D208:
	.uaword	0x4
.L_D207:
	.uaword	.L_D207_e-.L_D207
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D209
	.uahalf	0x111
	.uaword	.L_B45
	.uahalf	0x121
	.uaword	.L_B45_e
.L_D207_e:
.L_D210:
	.uaword	0x4
.L_D209:
	.uaword	.L_D209_e-.L_D209
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D211
	.uahalf	0x111
	.uaword	.L_B46
	.uahalf	0x121
	.uaword	.L_B46_e
.L_D209_e:
.L_D212:
	.uaword	0x4
.L_D211:
	.uaword	.L_D211_e-.L_D211
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D213
	.uahalf	0x111
	.uaword	.L_B47
	.uahalf	0x121
	.uaword	.L_B47_e
.L_D211_e:
.L_D214:
	.uaword	0x4
.L_D213:
	.uaword	0x4
.L_D204:
	.uaword	.L_D204_e-.L_D204
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D215
	.uahalf	0x111
	.uaword	.L_B48
	.uahalf	0x121
	.uaword	.L_B48_e
.L_D204_e:
.L_D216:
	.uaword	.L_D216_e-.L_D216
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D217
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t216_e-.L_t216
.L_t216:
	.byte	0x1
	.uahalf	0x7
.L_t216_e:
	.uahalf	0x23
	.uahalf	.L_l216_e-.L_l216
.L_l216:
.L_l216_e:
.L_D216_e:
.L_D217:
	.uaword	.L_D217_e-.L_D217
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D218
	.uahalf	0x111
	.uaword	.L_B49
	.uahalf	0x121
	.uaword	.L_B49_e
.L_D217_e:
.L_D219:
	.uaword	0x4
.L_D218:
	.uaword	.L_D218_e-.L_D218
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D220
	.uahalf	0x111
	.uaword	.L_B50
	.uahalf	0x121
	.uaword	.L_B50_e
.L_D218_e:
.L_D221:
	.uaword	0x4
.L_D220:
	.uaword	.L_D220_e-.L_D220
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D222
	.uahalf	0x111
	.uaword	.L_B51
	.uahalf	0x121
	.uaword	.L_B51_e
.L_D220_e:
.L_D223:
	.uaword	0x4
.L_D222:
	.uaword	.L_D222_e-.L_D222
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D224
	.uahalf	0x111
	.uaword	.L_B52
	.uahalf	0x121
	.uaword	.L_B52_e
.L_D222_e:
.L_D225:
	.uaword	0x4
.L_D224:
	.uaword	.L_D224_e-.L_D224
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D226
	.uahalf	0x111
	.uaword	.L_B53
	.uahalf	0x121
	.uaword	.L_B53_e
.L_D224_e:
.L_D227:
	.uaword	0x4
.L_D226:
	.uaword	.L_D226_e-.L_D226
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D228
	.uahalf	0x111
	.uaword	.L_B54
	.uahalf	0x121
	.uaword	.L_B54_e
.L_D226_e:
.L_D229:
	.uaword	0x4
.L_D228:
	.uaword	0x4
.L_D215:
	.uaword	.L_D215_e-.L_D215
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D230
	.uahalf	0x111
	.uaword	.L_B55
	.uahalf	0x121
	.uaword	.L_B55_e
.L_D215_e:
.L_D231:
	.uaword	.L_D231_e-.L_D231
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D232
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t231_e-.L_t231
.L_t231:
	.byte	0x1
	.uahalf	0x7
.L_t231_e:
	.uahalf	0x23
	.uahalf	.L_l231_e-.L_l231
.L_l231:
.L_l231_e:
.L_D231_e:
.L_D232:
	.uaword	.L_D232_e-.L_D232
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D233
	.uahalf	0x111
	.uaword	.L_B56
	.uahalf	0x121
	.uaword	.L_B56_e
.L_D232_e:
.L_D234:
	.uaword	0x4
.L_D233:
	.uaword	.L_D233_e-.L_D233
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D235
	.uahalf	0x111
	.uaword	.L_B57
	.uahalf	0x121
	.uaword	.L_B57_e
.L_D233_e:
.L_D236:
	.uaword	0x4
.L_D235:
	.uaword	.L_D235_e-.L_D235
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D237
	.uahalf	0x111
	.uaword	.L_B58
	.uahalf	0x121
	.uaword	.L_B58_e
.L_D235_e:
.L_D238:
	.uaword	0x4
.L_D237:
	.uaword	.L_D237_e-.L_D237
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D239
	.uahalf	0x111
	.uaword	.L_B59
	.uahalf	0x121
	.uaword	.L_B59_e
.L_D237_e:
.L_D240:
	.uaword	0x4
.L_D239:
	.uaword	0x4
.L_D230:
	.uaword	.L_D230_e-.L_D230
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D241
	.uahalf	0x111
	.uaword	.L_B60
	.uahalf	0x121
	.uaword	.L_B60_e
.L_D230_e:
.L_D242:
	.uaword	.L_D242_e-.L_D242
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D243
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t242_e-.L_t242
.L_t242:
	.byte	0x1
	.uahalf	0x7
.L_t242_e:
	.uahalf	0x23
	.uahalf	.L_l242_e-.L_l242
.L_l242:
.L_l242_e:
.L_D242_e:
.L_D243:
	.uaword	.L_D243_e-.L_D243
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D244
	.uahalf	0x111
	.uaword	.L_B61
	.uahalf	0x121
	.uaword	.L_B61_e
.L_D243_e:
.L_D245:
	.uaword	0x4
.L_D244:
	.uaword	.L_D244_e-.L_D244
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D246
	.uahalf	0x111
	.uaword	.L_B62
	.uahalf	0x121
	.uaword	.L_B62_e
.L_D244_e:
.L_D247:
	.uaword	0x4
.L_D246:
	.uaword	.L_D246_e-.L_D246
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D248
	.uahalf	0x111
	.uaword	.L_B63
	.uahalf	0x121
	.uaword	.L_B63_e
.L_D246_e:
.L_D249:
	.uaword	0x4
.L_D248:
	.uaword	.L_D248_e-.L_D248
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D250
	.uahalf	0x111
	.uaword	.L_B64
	.uahalf	0x121
	.uaword	.L_B64_e
.L_D248_e:
.L_D251:
	.uaword	0x4
.L_D250:
	.uaword	0x4
.L_D241:
	.uaword	.L_D241_e-.L_D241
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D252
	.uahalf	0x111
	.uaword	.L_B65
	.uahalf	0x121
	.uaword	.L_B65_e
.L_D241_e:
.L_D253:
	.uaword	.L_D253_e-.L_D253
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D254
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t253_e-.L_t253
.L_t253:
	.byte	0x1
	.uahalf	0x7
.L_t253_e:
	.uahalf	0x23
	.uahalf	.L_l253_e-.L_l253
.L_l253:
.L_l253_e:
.L_D253_e:
.L_D254:
	.uaword	.L_D254_e-.L_D254
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D255
	.uahalf	0x111
	.uaword	.L_B66
	.uahalf	0x121
	.uaword	.L_B66_e
.L_D254_e:
.L_D256:
	.uaword	0x4
.L_D255:
	.uaword	.L_D255_e-.L_D255
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D257
	.uahalf	0x111
	.uaword	.L_B67
	.uahalf	0x121
	.uaword	.L_B67_e
.L_D255_e:
.L_D258:
	.uaword	0x4
.L_D257:
	.uaword	.L_D257_e-.L_D257
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D259
	.uahalf	0x111
	.uaword	.L_B68
	.uahalf	0x121
	.uaword	.L_B68_e
.L_D257_e:
.L_D260:
	.uaword	0x4
.L_D259:
	.uaword	.L_D259_e-.L_D259
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D261
	.uahalf	0x111
	.uaword	.L_B69
	.uahalf	0x121
	.uaword	.L_B69_e
.L_D259_e:
.L_D262:
	.uaword	0x4
.L_D261:
	.uaword	.L_D261_e-.L_D261
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D263
	.uahalf	0x111
	.uaword	.L_B70
	.uahalf	0x121
	.uaword	.L_B70_e
.L_D261_e:
.L_D264:
	.uaword	0x4
.L_D263:
	.uaword	.L_D263_e-.L_D263
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D265
	.uahalf	0x111
	.uaword	.L_B71
	.uahalf	0x121
	.uaword	.L_B71_e
.L_D263_e:
.L_D266:
	.uaword	0x4
.L_D265:
	.uaword	0x4
.L_D252:
	.uaword	.L_D252_e-.L_D252
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D267
	.uahalf	0x111
	.uaword	.L_B72
	.uahalf	0x121
	.uaword	.L_B72_e
.L_D252_e:
.L_D268:
	.uaword	.L_D268_e-.L_D268
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D269
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t268_e-.L_t268
.L_t268:
	.byte	0x1
	.uahalf	0x7
.L_t268_e:
	.uahalf	0x23
	.uahalf	.L_l268_e-.L_l268
.L_l268:
.L_l268_e:
.L_D268_e:
.L_D269:
	.uaword	.L_D269_e-.L_D269
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D270
	.uahalf	0x111
	.uaword	.L_B73
	.uahalf	0x121
	.uaword	.L_B73_e
.L_D269_e:
.L_D271:
	.uaword	0x4
.L_D270:
	.uaword	.L_D270_e-.L_D270
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D272
	.uahalf	0x111
	.uaword	.L_B74
	.uahalf	0x121
	.uaword	.L_B74_e
.L_D270_e:
.L_D273:
	.uaword	0x4
.L_D272:
	.uaword	.L_D272_e-.L_D272
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D274
	.uahalf	0x111
	.uaword	.L_B75
	.uahalf	0x121
	.uaword	.L_B75_e
.L_D272_e:
.L_D275:
	.uaword	0x4
.L_D274:
	.uaword	.L_D274_e-.L_D274
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D276
	.uahalf	0x111
	.uaword	.L_B76
	.uahalf	0x121
	.uaword	.L_B76_e
.L_D274_e:
.L_D277:
	.uaword	0x4
.L_D276:
	.uaword	.L_D276_e-.L_D276
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D278
	.uahalf	0x111
	.uaword	.L_B77
	.uahalf	0x121
	.uaword	.L_B77_e
.L_D276_e:
.L_D279:
	.uaword	0x4
.L_D278:
	.uaword	.L_D278_e-.L_D278
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D280
	.uahalf	0x111
	.uaword	.L_B78
	.uahalf	0x121
	.uaword	.L_B78_e
.L_D278_e:
.L_D281:
	.uaword	0x4
.L_D280:
	.uaword	0x4
.L_D267:
	.uaword	.L_D267_e-.L_D267
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D282
	.uahalf	0x111
	.uaword	.L_B79
	.uahalf	0x121
	.uaword	.L_B79_e
.L_D267_e:
.L_D283:
	.uaword	.L_D283_e-.L_D283
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D284
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t283_e-.L_t283
.L_t283:
	.byte	0x1
	.uahalf	0x7
.L_t283_e:
	.uahalf	0x23
	.uahalf	.L_l283_e-.L_l283
.L_l283:
.L_l283_e:
.L_D283_e:
.L_D284:
	.uaword	.L_D284_e-.L_D284
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D285
	.uahalf	0x111
	.uaword	.L_B80
	.uahalf	0x121
	.uaword	.L_B80_e
.L_D284_e:
.L_D286:
	.uaword	0x4
.L_D285:
	.uaword	.L_D285_e-.L_D285
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D287
	.uahalf	0x111
	.uaword	.L_B81
	.uahalf	0x121
	.uaword	.L_B81_e
.L_D285_e:
.L_D288:
	.uaword	0x4
.L_D287:
	.uaword	.L_D287_e-.L_D287
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D289
	.uahalf	0x111
	.uaword	.L_B82
	.uahalf	0x121
	.uaword	.L_B82_e
.L_D287_e:
.L_D290:
	.uaword	0x4
.L_D289:
	.uaword	.L_D289_e-.L_D289
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D291
	.uahalf	0x111
	.uaword	.L_B83
	.uahalf	0x121
	.uaword	.L_B83_e
.L_D289_e:
.L_D292:
	.uaword	0x4
.L_D291:
	.uaword	0x4
.L_D282:
	.uaword	.L_D282_e-.L_D282
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D293
	.uahalf	0x111
	.uaword	.L_B84
	.uahalf	0x121
	.uaword	.L_B84_e
.L_D282_e:
.L_D294:
	.uaword	.L_D294_e-.L_D294
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D295
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t294_e-.L_t294
.L_t294:
	.byte	0x1
	.uahalf	0x7
.L_t294_e:
	.uahalf	0x23
	.uahalf	.L_l294_e-.L_l294
.L_l294:
.L_l294_e:
.L_D294_e:
.L_D295:
	.uaword	.L_D295_e-.L_D295
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D296
	.uahalf	0x111
	.uaword	.L_B85
	.uahalf	0x121
	.uaword	.L_B85_e
.L_D295_e:
.L_D297:
	.uaword	0x4
.L_D296:
	.uaword	.L_D296_e-.L_D296
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D298
	.uahalf	0x111
	.uaword	.L_B86
	.uahalf	0x121
	.uaword	.L_B86_e
.L_D296_e:
.L_D299:
	.uaword	0x4
.L_D298:
	.uaword	.L_D298_e-.L_D298
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D300
	.uahalf	0x111
	.uaword	.L_B87
	.uahalf	0x121
	.uaword	.L_B87_e
.L_D298_e:
.L_D301:
	.uaword	0x4
.L_D300:
	.uaword	.L_D300_e-.L_D300
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D302
	.uahalf	0x111
	.uaword	.L_B88
	.uahalf	0x121
	.uaword	.L_B88_e
.L_D300_e:
.L_D303:
	.uaword	0x4
.L_D302:
	.uaword	0x4
.L_D293:
	.uaword	.L_D293_e-.L_D293
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D304
	.uahalf	0x111
	.uaword	.L_B89
	.uahalf	0x121
	.uaword	.L_B89_e
.L_D293_e:
.L_D305:
	.uaword	.L_D305_e-.L_D305
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D306
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t305_e-.L_t305
.L_t305:
	.byte	0x1
	.uahalf	0x7
.L_t305_e:
	.uahalf	0x23
	.uahalf	.L_l305_e-.L_l305
.L_l305:
.L_l305_e:
.L_D305_e:
.L_D306:
	.uaword	.L_D306_e-.L_D306
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D307
	.uahalf	0x111
	.uaword	.L_B90
	.uahalf	0x121
	.uaword	.L_B90_e
.L_D306_e:
.L_D308:
	.uaword	0x4
.L_D307:
	.uaword	.L_D307_e-.L_D307
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D309
	.uahalf	0x111
	.uaword	.L_B91
	.uahalf	0x121
	.uaword	.L_B91_e
.L_D307_e:
.L_D310:
	.uaword	0x4
.L_D309:
	.uaword	.L_D309_e-.L_D309
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D311
	.uahalf	0x111
	.uaword	.L_B92
	.uahalf	0x121
	.uaword	.L_B92_e
.L_D309_e:
.L_D312:
	.uaword	0x4
.L_D311:
	.uaword	.L_D311_e-.L_D311
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D313
	.uahalf	0x111
	.uaword	.L_B93
	.uahalf	0x121
	.uaword	.L_B93_e
.L_D311_e:
.L_D314:
	.uaword	0x4
.L_D313:
	.uaword	.L_D313_e-.L_D313
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D315
	.uahalf	0x111
	.uaword	.L_B94
	.uahalf	0x121
	.uaword	.L_B94_e
.L_D313_e:
.L_D316:
	.uaword	0x4
.L_D315:
	.uaword	.L_D315_e-.L_D315
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D317
	.uahalf	0x111
	.uaword	.L_B95
	.uahalf	0x121
	.uaword	.L_B95_e
.L_D315_e:
.L_D318:
	.uaword	0x4
.L_D317:
	.uaword	0x4
.L_D304:
	.uaword	.L_D304_e-.L_D304
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D319
	.uahalf	0x111
	.uaword	.L_B96
	.uahalf	0x121
	.uaword	.L_B96_e
.L_D304_e:
.L_D320:
	.uaword	.L_D320_e-.L_D320
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D321
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t320_e-.L_t320
.L_t320:
	.byte	0x1
	.uahalf	0x7
.L_t320_e:
	.uahalf	0x23
	.uahalf	.L_l320_e-.L_l320
.L_l320:
.L_l320_e:
.L_D320_e:
.L_D321:
	.uaword	.L_D321_e-.L_D321
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D322
	.uahalf	0x111
	.uaword	.L_B97
	.uahalf	0x121
	.uaword	.L_B97_e
.L_D321_e:
.L_D323:
	.uaword	0x4
.L_D322:
	.uaword	.L_D322_e-.L_D322
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D324
	.uahalf	0x111
	.uaword	.L_B98
	.uahalf	0x121
	.uaword	.L_B98_e
.L_D322_e:
.L_D325:
	.uaword	0x4
.L_D324:
	.uaword	.L_D324_e-.L_D324
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D326
	.uahalf	0x111
	.uaword	.L_B99
	.uahalf	0x121
	.uaword	.L_B99_e
.L_D324_e:
.L_D327:
	.uaword	0x4
.L_D326:
	.uaword	.L_D326_e-.L_D326
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D328
	.uahalf	0x111
	.uaword	.L_B100
	.uahalf	0x121
	.uaword	.L_B100_e
.L_D326_e:
.L_D329:
	.uaword	0x4
.L_D328:
	.uaword	.L_D328_e-.L_D328
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D330
	.uahalf	0x111
	.uaword	.L_B101
	.uahalf	0x121
	.uaword	.L_B101_e
.L_D328_e:
.L_D331:
	.uaword	0x4
.L_D330:
	.uaword	.L_D330_e-.L_D330
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D332
	.uahalf	0x111
	.uaword	.L_B102
	.uahalf	0x121
	.uaword	.L_B102_e
.L_D330_e:
.L_D333:
	.uaword	0x4
.L_D332:
	.uaword	0x4
.L_D319:
	.uaword	.L_D319_e-.L_D319
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D334
	.uahalf	0x111
	.uaword	.L_B103
	.uahalf	0x121
	.uaword	.L_B103_e
.L_D319_e:
.L_D335:
	.uaword	.L_D335_e-.L_D335
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D336
	.uahalf	0x38
	.asciz	"lockAddr"
	.uahalf	0x63
	.uahalf	.L_t335_e-.L_t335
.L_t335:
	.byte	0x1
	.uahalf	0x7
.L_t335_e:
	.uahalf	0x23
	.uahalf	.L_l335_e-.L_l335
.L_l335:
.L_l335_e:
.L_D335_e:
.L_D336:
	.uaword	.L_D336_e-.L_D336
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D337
	.uahalf	0x111
	.uaword	.L_B104
	.uahalf	0x121
	.uaword	.L_B104_e
.L_D336_e:
.L_D338:
	.uaword	0x4
.L_D337:
	.uaword	.L_D337_e-.L_D337
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D339
	.uahalf	0x111
	.uaword	.L_B105
	.uahalf	0x121
	.uaword	.L_B105_e
.L_D337_e:
.L_D340:
	.uaword	0x4
.L_D339:
	.uaword	.L_D339_e-.L_D339
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D341
	.uahalf	0x111
	.uaword	.L_B106
	.uahalf	0x121
	.uaword	.L_B106_e
.L_D339_e:
.L_D342:
	.uaword	0x4
.L_D341:
	.uaword	.L_D341_e-.L_D341
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D343
	.uahalf	0x111
	.uaword	.L_B107
	.uahalf	0x121
	.uaword	.L_B107_e
.L_D341_e:
.L_D344:
	.uaword	0x4
.L_D343:
	.uaword	.L_D343_e-.L_D343
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D345
	.uahalf	0x111
	.uaword	.L_B108
	.uahalf	0x121
	.uaword	.L_B108_e
.L_D343_e:
.L_D346:
	.uaword	0x4
.L_D345:
	.uaword	.L_D345_e-.L_D345
	.uahalf	0xb
	.uahalf	0x12
	.uaword	.L_D347
	.uahalf	0x111
	.uaword	.L_B109
	.uahalf	0x121
	.uaword	.L_B109_e
.L_D345_e:
.L_D348:
	.uaword	0x4
.L_D347:
	.uaword	0x4
.L_D334:
	.uaword	0x4
.L_D91:
	.uaword	.L_D91_e-.L_D91
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D349
	.L_T236 = .L_D91
	.uahalf	0x38
	.asciz	"prefix_node"
	.uahalf	0xb6
	.uaword	0x9018
.L_D91_e:
.L_D350:
	.uaword	.L_D350_e-.L_D350
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D351
	.uahalf	0x38
	.asciz	"densities"
	.uahalf	0x142
	.uaword	.L_T236
	.uahalf	0x72
	.uaword	.L_T238
	.uahalf	0x23
	.uahalf	.L_l350_e-.L_l350
.L_l350:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l350_e:
.L_D350_e:
.L_D351:
	.uaword	.L_D351_e-.L_D351
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D352
	.uahalf	0x38
	.asciz	"ranks"
	.uahalf	0x142
	.uaword	.L_T236
	.uahalf	0x72
	.uaword	.L_T238
	.uahalf	0x23
	.uahalf	.L_l351_e-.L_l351
.L_l351:
	.byte	0x4
	.uaword	0x4000
	.byte	0x7
.L_l351_e:
.L_D351_e:
.L_D352:
	.uaword	.L_D352_e-.L_D352
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D353
	.uahalf	0x38
	.asciz	"done"
	.uahalf	0x142
	.uaword	.L_T236
	.uahalf	0x83
	.uahalf	.L_t352_e-.L_t352
.L_t352:
	.byte	0x4
	.uaword	.L_T251
.L_t352_e:
	.uahalf	0x23
	.uahalf	.L_l352_e-.L_l352
.L_l352:
	.byte	0x4
	.uaword	0x8000
	.byte	0x7
.L_l352_e:
.L_D352_e:
.L_D353:
	.uaword	.L_D353_e-.L_D353
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D354
	.uahalf	0x38
	.asciz	"pad"
	.uahalf	0x142
	.uaword	.L_T236
	.uahalf	0x72
	.uaword	.L_T258
	.uahalf	0x23
	.uahalf	.L_l353_e-.L_l353
.L_l353:
	.byte	0x4
	.uaword	0x8018
	.byte	0x7
.L_l353_e:
.L_D353_e:
.L_D354:
	.uaword	0x4
.L_D349:
	.uaword	.L_D349_e-.L_D349
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D355
	.L_T238 = .L_D349
	.uahalf	0xa3
	.uahalf	.L_s349_e-.L_s349
.L_s349:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0xfff
	.byte	0x8
	.uahalf	0x55
	.uahalf	0x7
.L_s349_e:
.L_D349_e:
.L_D355:
	.uaword	.L_D355_e-.L_D355
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D356
	.L_T241 = .L_D355
	.uahalf	0x38
	.asciz	"doneTYP"
	.uahalf	0xb6
	.uaword	0x18
.L_D355_e:
.L_D357:
	.uaword	.L_D357_e-.L_D357
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D358
	.uahalf	0x38
	.asciz	"lock"
	.uahalf	0x142
	.uaword	.L_T241
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l357_e-.L_l357
.L_l357:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l357_e:
.L_D357_e:
.L_D358:
	.uaword	.L_D358_e-.L_D358
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D359
	.uahalf	0x38
	.asciz	"count"
	.uahalf	0x142
	.uaword	.L_T241
	.uahalf	0x83
	.uahalf	.L_t358_e-.L_t358
.L_t358:
	.byte	0x4
	.uaword	.L_T243
.L_t358_e:
	.uahalf	0x23
	.uahalf	.L_l358_e-.L_l358
.L_l358:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l358_e:
.L_D358_e:
.L_D359:
	.uaword	.L_D359_e-.L_D359
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D360
	.uahalf	0x38
	.asciz	"queue"
	.uahalf	0x142
	.uaword	.L_T241
	.uahalf	0x72
	.uaword	.L_T243
	.uahalf	0x23
	.uahalf	.L_l359_e-.L_l359
.L_l359:
	.byte	0x4
	.uaword	0xc
	.byte	0x7
.L_l359_e:
.L_D359_e:
.L_D360:
	.uaword	.L_D360_e-.L_D360
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D361
	.uahalf	0x38
	.asciz	"flag"
	.uahalf	0x142
	.uaword	.L_T241
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l360_e-.L_l360
.L_l360:
	.byte	0x4
	.uaword	0x14
	.byte	0x7
.L_l360_e:
.L_D360_e:
.L_D361:
	.uaword	0x4
.L_D356:
	.uaword	.L_D356_e-.L_D356
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D362
	.L_T251 = .L_D356
	.uahalf	0xa3
	.uahalf	.L_s356_e-.L_s356
.L_s356:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0x0
	.byte	0x8
	.uahalf	0x72
	.uaword	.L_T241
.L_s356_e:
.L_D356_e:
.L_D362:
	.uaword	.L_D362_e-.L_D362
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D363
	.L_T258 = .L_D362
	.uahalf	0xa3
	.uahalf	.L_s362_e-.L_s362
.L_s362:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0xfff
	.byte	0x8
	.uahalf	0x55
	.uahalf	0x1
.L_s362_e:
.L_D362_e:
.L_D363:
	.uaword	.L_D363_e-.L_D363
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D364
	.L_T243 = .L_D363
	.uahalf	0xa3
	.uahalf	.L_s363_e-.L_s363
.L_s363:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0x1
	.byte	0x8
	.uahalf	0x55
	.uahalf	0x7
.L_s363_e:
.L_D363_e:
	.popsection
.section	".rodata"
	.align 8
.LLC42:
	.long	0x41600000
	.long	0x0
	.align 8
.LLC43:
	.long	0x42d00000
	.long	0x0
.section	".text"
	.align 4
	.global product_mod_46
	.type	 product_mod_46,#function
	.proc	07
product_mod_46:
.L_LC474:

	.pushsection	".line"
	.uaword	671	! radix.C:671
	.uahalf	0xffff
	.uaword	.L_LC474-.L_text_b
	.popsection
	!#PROLOGUE# 0
	add %sp,-120,%sp
	!#PROLOGUE# 1
	std %o0,[%sp+96]
	ldd [%sp+96],%f16
.L_b8:
	fmovs %f16,%f14
	fmovs %f17,%f15
	std %o2,[%sp+96]
	ldd [%sp+96],%f16
	fmovs %f16,%f12
	fmovs %f17,%f13
.L_LC475:

	.pushsection	".line"
	.uaword	677	! radix.C:677
	.uahalf	0xffff
	.uaword	.L_LC475-.L_text_b
	.popsection
	sethi %hi(.LLC42),%g2
	ldd [%g2+%lo(.LLC42)],%f4
.L_LC476:

	.pushsection	".line"
	.uaword	679	! radix.C:679
	.uahalf	0xffff
	.uaword	.L_LC476-.L_text_b
	.popsection
	fdivd %f12,%f4,%f2
.L_LC477:

	.pushsection	".line"
	.uaword	677	! radix.C:677
	.uahalf	0xffff
	.uaword	.L_LC477-.L_text_b
	.popsection
	fdivd %f14,%f4,%f8
.L_LC478:

	.pushsection	".line"
	.uaword	679	! radix.C:679
	.uahalf	0xffff
	.uaword	.L_LC478-.L_text_b
	.popsection
	fdtoi %f2,%f2
	fitod %f2,%f6
.L_LC479:

	.pushsection	".line"
	.uaword	677	! radix.C:677
	.uahalf	0xffff
	.uaword	.L_LC479-.L_text_b
	.popsection
	fdtoi %f8,%f2
.L_LC480:

	.pushsection	".line"
	.uaword	680	! radix.C:680
	.uahalf	0xffff
	.uaword	.L_LC480-.L_text_b
	.popsection
	fmuld %f6,%f4,%f10
.L_LC481:

	.pushsection	".line"
	.uaword	677	! radix.C:677
	.uahalf	0xffff
	.uaword	.L_LC481-.L_text_b
	.popsection
	fitod %f2,%f2
.L_LC482:

	.pushsection	".line"
	.uaword	678	! radix.C:678
	.uahalf	0xffff
	.uaword	.L_LC482-.L_text_b
	.popsection
	fmuld %f2,%f4,%f8
.L_LC483:

	.pushsection	".line"
	.uaword	680	! radix.C:680
	.uahalf	0xffff
	.uaword	.L_LC483-.L_text_b
	.popsection
	fsubd %f12,%f10,%f10
.L_LC484:

	.pushsection	".line"
	.uaword	681	! radix.C:681
	.uahalf	0xffff
	.uaword	.L_LC484-.L_text_b
	.popsection
	fmuld %f2,%f10,%f2
.L_LC485:

	.pushsection	".line"
	.uaword	678	! radix.C:678
	.uahalf	0xffff
	.uaword	.L_LC485-.L_text_b
	.popsection
	fsubd %f14,%f8,%f8
.L_LC486:

	.pushsection	".line"
	.uaword	681	! radix.C:681
	.uahalf	0xffff
	.uaword	.L_LC486-.L_text_b
	.popsection
	fmuld %f8,%f6,%f6
	faddd %f2,%f6,%f14
.L_LC487:

	.pushsection	".line"
	.uaword	682	! radix.C:682
	.uahalf	0xffff
	.uaword	.L_LC487-.L_text_b
	.popsection
	fdivd %f14,%f4,%f2
	fdtoi %f2,%f2
	fitod %f2,%f12
.L_LC488:

	.pushsection	".line"
	.uaword	683	! radix.C:683
	.uahalf	0xffff
	.uaword	.L_LC488-.L_text_b
	.popsection
	fmuld %f12,%f4,%f2
.L_LC489:

	.pushsection	".line"
	.uaword	684	! radix.C:684
	.uahalf	0xffff
	.uaword	.L_LC489-.L_text_b
	.popsection
	fmuld %f8,%f10,%f8
.L_LC490:

	.pushsection	".line"
	.uaword	683	! radix.C:683
	.uahalf	0xffff
	.uaword	.L_LC490-.L_text_b
	.popsection
	fsubd %f14,%f2,%f12
.L_LC491:

	.pushsection	".line"
	.uaword	684	! radix.C:684
	.uahalf	0xffff
	.uaword	.L_LC491-.L_text_b
	.popsection
	fmuld %f12,%f4,%f4
	faddd %f4,%f8,%f14
.L_LC492:

	.pushsection	".line"
	.uaword	685	! radix.C:685
	.uahalf	0xffff
	.uaword	.L_LC492-.L_text_b
	.popsection
	sethi %hi(.LLC43),%g2
	ldd [%g2+%lo(.LLC43)],%f0
	fdivd %f14,%f0,%f2
	fdtoi %f2,%f2
	fitod %f2,%f12
.L_LC493:

	.pushsection	".line"
	.uaword	687	! radix.C:687
	.uahalf	0xffff
	.uaword	.L_LC493-.L_text_b
	.popsection
	fmuld %f12,%f0,%f0
	fsubd %f14,%f0,%f0
.L_LC494:

	.pushsection	".line"
	.uaword	688	! radix.C:688
	.uahalf	0xffff
	.uaword	.L_LC494-.L_text_b
	.popsection
.L_b8_e:
	retl
	sub %sp,-120,%sp
.L_f8_e:
.LLfe6:
	.size	 product_mod_46,.LLfe6-product_mod_46

	.pushsection	".debug_pubnames"
	.uaword	.L_P6
	.asciz	"product_mod_46"
	.popsection

	.pushsection	".debug"
.L_P6:
.L_D364:
	.uaword	.L_D364_e-.L_D364
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D365
	.uahalf	0x38
	.asciz	"product_mod_46"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x111
	.uaword	product_mod_46
	.uahalf	0x121
	.uaword	.L_f8_e
	.uahalf	0x8041
	.uaword	.L_b8
	.uahalf	0x8051
	.uaword	.L_b8_e
.L_D364_e:
.L_D366:
	.uaword	.L_D366_e-.L_D366
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D367
	.uahalf	0x38
	.asciz	"t1"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l366_e-.L_l366
.L_l366:
	.byte	0x1
	.uaword	0x2e
.L_l366_e:
.L_D366_e:
.L_D367:
	.uaword	.L_D367_e-.L_D367
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D368
	.uahalf	0x38
	.asciz	"t2"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l367_e-.L_l367
.L_l367:
	.byte	0x1
	.uaword	0x2c
.L_l367_e:
.L_D367_e:
.L_D368:
	.uaword	.L_D368_e-.L_D368
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D369
	.uahalf	0x38
	.asciz	"a1"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l368_e-.L_l368
.L_l368:
	.byte	0x1
	.uaword	0x22
.L_l368_e:
.L_D368_e:
.L_D369:
	.uaword	.L_D369_e-.L_D369
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D370
	.uahalf	0x38
	.asciz	"b1"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l369_e-.L_l369
.L_l369:
	.byte	0x1
	.uaword	0x26
.L_l369_e:
.L_D369_e:
.L_D370:
	.uaword	.L_D370_e-.L_D370
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D371
	.uahalf	0x38
	.asciz	"a2"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l370_e-.L_l370
.L_l370:
	.byte	0x1
	.uaword	0x28
.L_l370_e:
.L_D370_e:
.L_D371:
	.uaword	.L_D371_e-.L_D371
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D372
	.uahalf	0x38
	.asciz	"b2"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l371_e-.L_l371
.L_l371:
	.byte	0x1
	.uaword	0x2a
.L_l371_e:
.L_D371_e:
.L_D372:
	.uaword	0x4
	.popsection
	.align 4
	.global ran_num_init
	.type	 ran_num_init,#function
	.proc	07
ran_num_init:
.L_LC495:

	.pushsection	".line"
	.uaword	696	! radix.C:696
	.uahalf	0xffff
	.uaword	.L_LC495-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-120,%sp
	!#PROLOGUE# 1
.L_b9:
	mov %i1,%l2
	mov %i2,%l3
	mov %i3,%l0
.L_LC496:

	.pushsection	".line"
	.uaword	699	! radix.C:699
	.uahalf	0xffff
	.uaword	.L_LC496-.L_text_b
	.popsection
	cmp %i0,0
	be .LL461
	mov %i4,%l1
.LL462:
.L_LC497:

	.pushsection	".line"
	.uaword	701	! radix.C:701
	.uahalf	0xffff
	.uaword	.L_LC497-.L_text_b
	.popsection
	srl %i0,1,%i1
.L_LC498:

	.pushsection	".line"
	.uaword	702	! radix.C:702
	.uahalf	0xffff
	.uaword	.L_LC498-.L_text_b
	.popsection
	sll %i1,1,%o0
	cmp %o0,%i0
	be .LL463
	mov %i1,%i0
.L_LC499:

	.pushsection	".line"
	.uaword	703	! radix.C:703
	.uahalf	0xffff
	.uaword	.L_LC499-.L_text_b
	.popsection
	mov %l2,%o0
	mov %l3,%o1
	mov %l0,%o2
	call product_mod_46,0
	mov %l1,%o3
	std %f0,[%fp-24]
	ldd [%fp-24],%l2
.LL463:
.L_LC500:

	.pushsection	".line"
	.uaword	705	! radix.C:705
	.uahalf	0xffff
	.uaword	.L_LC500-.L_text_b
	.popsection
	mov %l0,%o0
	mov %l1,%o1
	mov %o0,%o2
	call product_mod_46,0
	mov %o1,%o3
	std %f0,[%fp-24]
.L_LC501:

	.pushsection	".line"
	.uaword	707	! radix.C:707
	.uahalf	0xffff
	.uaword	.L_LC501-.L_text_b
	.popsection
	cmp %i0,0
	bne .LL462
	ldd [%fp-24],%l0
.LL461:
.L_LC502:

	.pushsection	".line"
	.uaword	709	! radix.C:709
	.uahalf	0xffff
	.uaword	.L_LC502-.L_text_b
	.popsection
	std %l2,[%fp-24]
	ldd [%fp-24],%f2
	fmovs %f2,%f0
	fmovs %f3,%f1
.L_LC503:

	.pushsection	".line"
	.uaword	710	! radix.C:710
	.uahalf	0xffff
	.uaword	.L_LC503-.L_text_b
	.popsection
.L_b9_e:
	ret
	restore
.L_f9_e:
.LLfe7:
	.size	 ran_num_init,.LLfe7-ran_num_init

	.pushsection	".debug_pubnames"
	.uaword	.L_P7
	.asciz	"ran_num_init"
	.popsection

	.pushsection	".debug"
.L_P7:
.L_D365:
	.uaword	.L_D365_e-.L_D365
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D373
	.uahalf	0x38
	.asciz	"ran_num_init"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x111
	.uaword	ran_num_init
	.uahalf	0x121
	.uaword	.L_f9_e
	.uahalf	0x8041
	.uaword	.L_b9
	.uahalf	0x8051
	.uaword	.L_b9_e
.L_D365_e:
.L_D374:
	.uaword	.L_D374_e-.L_D374
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D375
	.uahalf	0x38
	.asciz	"k"
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l374_e-.L_l374
.L_l374:
	.byte	0x1
	.uaword	0x18
.L_l374_e:
.L_D374_e:
.L_D375:
	.uaword	.L_D375_e-.L_D375
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D376
	.uahalf	0x38
	.asciz	"b"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l375_e-.L_l375
.L_l375:
	.byte	0x1
	.uaword	0x12
.L_l375_e:
.L_D375_e:
.L_D376:
	.uaword	.L_D376_e-.L_D376
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D377
	.uahalf	0x38
	.asciz	"t"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l376_e-.L_l376
.L_l376:
	.byte	0x1
	.uaword	0x10
.L_l376_e:
.L_D376_e:
.L_D377:
	.uaword	.L_D377_e-.L_D377
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D378
	.uahalf	0x38
	.asciz	"j"
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l377_e-.L_l377
.L_l377:
	.byte	0x1
	.uaword	0x19
.L_l377_e:
.L_D377_e:
.L_D378:
	.uaword	0x4
	.popsection
	.align 4
	.global get_max_digits
	.type	 get_max_digits,#function
	.proc	04
get_max_digits:
.L_LC504:

	.pushsection	".line"
	.uaword	716	! radix.C:716
	.uahalf	0xffff
	.uaword	.L_LC504-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b10:
.L_LC505:

	.pushsection	".line"
	.uaword	717	! radix.C:717
	.uahalf	0xffff
	.uaword	.L_LC505-.L_text_b
	.popsection
	mov 0,%l1
.L_LC506:

	.pushsection	".line"
	.uaword	718	! radix.C:718
	.uahalf	0xffff
	.uaword	.L_LC506-.L_text_b
	.popsection
	mov 1,%l0
.L_LC507:

	.pushsection	".line"
	.uaword	721	! radix.C:721
	.uahalf	0xffff
	.uaword	.L_LC507-.L_text_b
	.popsection
	mov %i0,%o0
.L_LC508:

	.pushsection	".line"
	.uaword	722	! radix.C:722
	.uahalf	0xffff
	.uaword	.L_LC508-.L_text_b
	.popsection
	sethi %hi(radix),%i0
.LL468:
.L_LC509:

	.pushsection	".line"
	.uaword	723	! radix.C:723
	.uahalf	0xffff
	.uaword	.L_LC509-.L_text_b
	.popsection
	call .div,0
	ld [%i0+%lo(radix)],%o1
.L_LC510:

	.pushsection	".line"
	.uaword	724	! radix.C:724
	.uahalf	0xffff
	.uaword	.L_LC510-.L_text_b
	.popsection
	cmp %o0,0
	bne,a .LL469
	add %l0,1,%l0
.L_LC511:

	.pushsection	".line"
	.uaword	726	! radix.C:726
	.uahalf	0xffff
	.uaword	.L_LC511-.L_text_b
	.popsection
	mov 1,%l1
.LL469:
.L_LC512:

	.pushsection	".line"
	.uaword	729	! radix.C:729
	.uahalf	0xffff
	.uaword	.L_LC512-.L_text_b
	.popsection
	cmp %l1,0
	be .LL468
	nop
.L_LC513:

	.pushsection	".line"
	.uaword	730	! radix.C:730
	.uahalf	0xffff
	.uaword	.L_LC513-.L_text_b
	.popsection
.L_LC514:

	.pushsection	".line"
	.uaword	731	! radix.C:731
	.uahalf	0xffff
	.uaword	.L_LC514-.L_text_b
	.popsection
.L_b10_e:
	ret
	restore %g0,%l0,%o0
.L_f10_e:
.LLfe8:
	.size	 get_max_digits,.LLfe8-get_max_digits

	.pushsection	".debug_pubnames"
	.uaword	.L_P8
	.asciz	"get_max_digits"
	.popsection

	.pushsection	".debug"
.L_P8:
.L_D373:
	.uaword	.L_D373_e-.L_D373
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D379
	.uahalf	0x38
	.asciz	"get_max_digits"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	get_max_digits
	.uahalf	0x121
	.uaword	.L_f10_e
	.uahalf	0x8041
	.uaword	.L_b10
	.uahalf	0x8051
	.uaword	.L_b10_e
.L_D373_e:
.L_D380:
	.uaword	.L_D380_e-.L_D380
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D381
	.uahalf	0x38
	.asciz	"max_key"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l380_e-.L_l380
.L_l380:
	.byte	0x1
	.uaword	0x18
.L_l380_e:
.L_D380_e:
.L_D381:
	.uaword	.L_D381_e-.L_D381
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D382
	.uahalf	0x38
	.asciz	"done"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l381_e-.L_l381
.L_l381:
	.byte	0x1
	.uaword	0x11
.L_l381_e:
.L_D381_e:
.L_D382:
	.uaword	.L_D382_e-.L_D382
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D383
	.uahalf	0x38
	.asciz	"temp"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l382_e-.L_l382
.L_l382:
	.byte	0x1
	.uaword	0x10
.L_l382_e:
.L_D382_e:
.L_D383:
	.uaword	.L_D383_e-.L_D383
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D384
	.uahalf	0x38
	.asciz	"key_val"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l383_e-.L_l383
.L_l383:
	.byte	0x1
	.uaword	0x8
.L_l383_e:
.L_D383_e:
.L_D384:
	.uaword	0x4
	.popsection
.section	".rodata"
	.align 8
.LLC44:
	.asciz	"ERROR: Radix %d not a power of 2\n"
.section	".text"
	.align 4
	.global get_log2_radix
	.type	 get_log2_radix,#function
	.proc	04
get_log2_radix:
.L_LC515:

	.pushsection	".line"
	.uaword	737	! radix.C:737
	.uahalf	0xffff
	.uaword	.L_LC515-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b11:
	mov %i0,%o2
.L_LC516:

	.pushsection	".line"
	.uaword	738	! radix.C:738
	.uahalf	0xffff
	.uaword	.L_LC516-.L_text_b
	.popsection
	mov 1,%o0
.L_LC517:

	.pushsection	".line"
	.uaword	741	! radix.C:741
	.uahalf	0xffff
	.uaword	.L_LC517-.L_text_b
	.popsection
	mov 0,%i0
.LL476:
.L_LC518:

	.pushsection	".line"
	.uaword	742	! radix.C:742
	.uahalf	0xffff
	.uaword	.L_LC518-.L_text_b
	.popsection
	cmp %o0,%o2
	be .LL481
	nop
.L_LC519:

	.pushsection	".line"
	.uaword	741	! radix.C:741
	.uahalf	0xffff
	.uaword	.L_LC519-.L_text_b
	.popsection
	add %i0,1,%i0
	cmp %i0,19
	ble .LL476
	sll %o0,1,%o0
.L_LC520:

	.pushsection	".line"
	.uaword	748	! radix.C:748
	.uahalf	0xffff
	.uaword	.L_LC520-.L_text_b
	.popsection
	sethi %hi(_Files+8),%o0
	ld [%o0+%lo(_Files+8)],%o0
	sethi %hi(.LLC44),%o1
	call fprintf,0
	or %o1,%lo(.LLC44),%o1
.L_LC521:

	.pushsection	".line"
	.uaword	749	! radix.C:749
	.uahalf	0xffff
	.uaword	.L_LC521-.L_text_b
	.popsection
	call exit,0
	mov -1,%o0
.LL481:
.L_LC522:

	.pushsection	".line"
	.uaword	750	! radix.C:750
	.uahalf	0xffff
	.uaword	.L_LC522-.L_text_b
	.popsection
.L_b11_e:
	ret
	restore
.L_f11_e:
.LLfe9:
	.size	 get_log2_radix,.LLfe9-get_log2_radix

	.pushsection	".debug_pubnames"
	.uaword	.L_P9
	.asciz	"get_log2_radix"
	.popsection

	.pushsection	".debug"
.L_P9:
.L_D379:
	.uaword	.L_D379_e-.L_D379
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D385
	.uahalf	0x38
	.asciz	"get_log2_radix"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	get_log2_radix
	.uahalf	0x121
	.uaword	.L_f11_e
	.uahalf	0x8041
	.uaword	.L_b11
	.uahalf	0x8051
	.uaword	.L_b11_e
.L_D379_e:
.L_D386:
	.uaword	.L_D386_e-.L_D386
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D387
	.uahalf	0x38
	.asciz	"rad"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l386_e-.L_l386
.L_l386:
	.byte	0x1
	.uaword	0xa
.L_l386_e:
.L_D386_e:
.L_D387:
	.uaword	.L_D387_e-.L_D387
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D388
	.uahalf	0x38
	.asciz	"cumulative"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l387_e-.L_l387
.L_l387:
	.byte	0x1
	.uaword	0x8
.L_l387_e:
.L_D387_e:
.L_D388:
	.uaword	.L_D388_e-.L_D388
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D389
	.uahalf	0x38
	.asciz	"out"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l388_e-.L_l388
.L_l388:
	.byte	0x1
	.uaword	0x18
.L_l388_e:
.L_D388_e:
.L_D389:
	.uaword	0x4
	.popsection
.section	".rodata"
	.align 8
.LLC45:
	.asciz	"ERROR: Number of keys %d not a power of 2\n"
.section	".text"
	.align 4
	.global get_log2_keys
	.type	 get_log2_keys,#function
	.proc	04
get_log2_keys:
.L_LC523:

	.pushsection	".line"
	.uaword	756	! radix.C:756
	.uahalf	0xffff
	.uaword	.L_LC523-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b12:
	mov %i0,%o2
.L_LC524:

	.pushsection	".line"
	.uaword	757	! radix.C:757
	.uahalf	0xffff
	.uaword	.L_LC524-.L_text_b
	.popsection
	mov 1,%o0
.L_LC525:

	.pushsection	".line"
	.uaword	760	! radix.C:760
	.uahalf	0xffff
	.uaword	.L_LC525-.L_text_b
	.popsection
	mov 0,%i0
.LL486:
.L_LC526:

	.pushsection	".line"
	.uaword	761	! radix.C:761
	.uahalf	0xffff
	.uaword	.L_LC526-.L_text_b
	.popsection
	cmp %o0,%o2
	be .LL491
	nop
.L_LC527:

	.pushsection	".line"
	.uaword	760	! radix.C:760
	.uahalf	0xffff
	.uaword	.L_LC527-.L_text_b
	.popsection
	add %i0,1,%i0
	cmp %i0,29
	ble .LL486
	sll %o0,1,%o0
.L_LC528:

	.pushsection	".line"
	.uaword	767	! radix.C:767
	.uahalf	0xffff
	.uaword	.L_LC528-.L_text_b
	.popsection
	sethi %hi(_Files+8),%o0
	ld [%o0+%lo(_Files+8)],%o0
	sethi %hi(.LLC45),%o1
	call fprintf,0
	or %o1,%lo(.LLC45),%o1
.L_LC529:

	.pushsection	".line"
	.uaword	768	! radix.C:768
	.uahalf	0xffff
	.uaword	.L_LC529-.L_text_b
	.popsection
	call exit,0
	mov -1,%o0
.LL491:
.L_LC530:

	.pushsection	".line"
	.uaword	769	! radix.C:769
	.uahalf	0xffff
	.uaword	.L_LC530-.L_text_b
	.popsection
.L_b12_e:
	ret
	restore
.L_f12_e:
.LLfe10:
	.size	 get_log2_keys,.LLfe10-get_log2_keys

	.pushsection	".debug_pubnames"
	.uaword	.L_P10
	.asciz	"get_log2_keys"
	.popsection

	.pushsection	".debug"
.L_P10:
.L_D385:
	.uaword	.L_D385_e-.L_D385
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D390
	.uahalf	0x38
	.asciz	"get_log2_keys"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	get_log2_keys
	.uahalf	0x121
	.uaword	.L_f12_e
	.uahalf	0x8041
	.uaword	.L_b12
	.uahalf	0x8051
	.uaword	.L_b12_e
.L_D385_e:
.L_D391:
	.uaword	.L_D391_e-.L_D391
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D392
	.uahalf	0x38
	.asciz	"num_keys"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l391_e-.L_l391
.L_l391:
	.byte	0x1
	.uaword	0xa
.L_l391_e:
.L_D391_e:
.L_D392:
	.uaword	.L_D392_e-.L_D392
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D393
	.uahalf	0x38
	.asciz	"cumulative"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l392_e-.L_l392
.L_l392:
	.byte	0x1
	.uaword	0x8
.L_l392_e:
.L_D392_e:
.L_D393:
	.uaword	.L_D393_e-.L_D393
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D394
	.uahalf	0x38
	.asciz	"out"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l393_e-.L_l393
.L_l393:
	.byte	0x1
	.uaword	0x18
.L_l393_e:
.L_D393_e:
.L_D394:
	.uaword	0x4
	.popsection
	.align 4
	.global log_2
	.type	 log_2,#function
	.proc	04
log_2:
.L_LC531:

	.pushsection	".line"
	.uaword	775	! radix.C:775
	.uahalf	0xffff
	.uaword	.L_LC531-.L_text_b
	.popsection
	!#PROLOGUE# 0
	!#PROLOGUE# 1
.L_b13:
	mov %o0,%g3
.L_LC532:

	.pushsection	".line"
	.uaword	776	! radix.C:776
	.uahalf	0xffff
	.uaword	.L_LC532-.L_text_b
	.popsection
	mov 1,%g2
.L_LC533:

	.pushsection	".line"
	.uaword	777	! radix.C:777
	.uahalf	0xffff
	.uaword	.L_LC533-.L_text_b
	.popsection
	mov 0,%o0
.L_LC534:

	.pushsection	".line"
	.uaword	780	! radix.C:780
	.uahalf	0xffff
	.uaword	.L_LC534-.L_text_b
	.popsection
	cmp %g2,%g3
	bge .LL504
	mov 0,%o1
	cmp %o0,49
.LL503:
	bg .LL494
	cmp %g2,%g3
.L_LC535:

	.pushsection	".line"
	.uaword	781	! radix.C:781
	.uahalf	0xffff
	.uaword	.L_LC535-.L_text_b
	.popsection
	bne,a .LL497
	sll %g2,1,%g2
.L_LC536:

	.pushsection	".line"
	.uaword	783	! radix.C:783
	.uahalf	0xffff
	.uaword	.L_LC536-.L_text_b
	.popsection
	b .LL505
	mov 1,%o1
.LL497:
.L_LC537:

	.pushsection	".line"
	.uaword	785	! radix.C:785
	.uahalf	0xffff
	.uaword	.L_LC537-.L_text_b
	.popsection
	add %o0,1,%o0
.L_LC538:

	.pushsection	".line"
	.uaword	787	! radix.C:787
	.uahalf	0xffff
	.uaword	.L_LC538-.L_text_b
	.popsection
	cmp %g2,%g3
.LL505:
	bge .LL494
	cmp %o1,0
	be .LL503
	cmp %o0,49
.LL494:
.L_LC539:

	.pushsection	".line"
	.uaword	789	! radix.C:789
	.uahalf	0xffff
	.uaword	.L_LC539-.L_text_b
	.popsection
	cmp %g2,%g3
.LL504:
	bne,a .LL500
	mov -1,%o0
.L_LC540:

	.pushsection	".line"
	.uaword	791	! radix.C:791
	.uahalf	0xffff
	.uaword	.L_LC540-.L_text_b
	.popsection
.LL500:
.L_LC541:

	.pushsection	".line"
	.uaword	794	! radix.C:794
	.uahalf	0xffff
	.uaword	.L_LC541-.L_text_b
	.popsection
.L_b13_e:
	retl
	nop
.L_f13_e:
.LLfe11:
	.size	 log_2,.LLfe11-log_2

	.pushsection	".debug_pubnames"
	.uaword	.L_P11
	.asciz	"log_2"
	.popsection

	.pushsection	".debug"
.L_P11:
.L_D390:
	.uaword	.L_D390_e-.L_D390
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D395
	.uahalf	0x38
	.asciz	"log_2"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x111
	.uaword	log_2
	.uahalf	0x121
	.uaword	.L_f13_e
	.uahalf	0x8041
	.uaword	.L_b13
	.uahalf	0x8051
	.uaword	.L_b13_e
.L_D390_e:
.L_D396:
	.uaword	.L_D396_e-.L_D396
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D397
	.uahalf	0x38
	.asciz	"number"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l396_e-.L_l396
.L_l396:
	.byte	0x1
	.uaword	0x3
.L_l396_e:
.L_D396_e:
.L_D397:
	.uaword	.L_D397_e-.L_D397
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D398
	.uahalf	0x38
	.asciz	"cumulative"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l397_e-.L_l397
.L_l397:
	.byte	0x1
	.uaword	0x2
.L_l397_e:
.L_D397_e:
.L_D398:
	.uaword	.L_D398_e-.L_D398
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D399
	.uahalf	0x38
	.asciz	"out"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l398_e-.L_l398
.L_l398:
	.byte	0x1
	.uaword	0x8
.L_l398_e:
.L_D398_e:
.L_D399:
	.uaword	.L_D399_e-.L_D399
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D400
	.uahalf	0x38
	.asciz	"done"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l399_e-.L_l399
.L_l399:
	.byte	0x1
	.uaword	0x9
.L_l399_e:
.L_D399_e:
.L_D400:
	.uaword	0x4
	.popsection
.section	".rodata"
	.align 8
.LLC46:
	.asciz	"ERROR: %s\n"
.section	".text"
	.align 4
	.global printerr
	.type	 printerr,#function
	.proc	020
printerr:
.L_LC542:

	.pushsection	".line"
	.uaword	800	! radix.C:800
	.uahalf	0xffff
	.uaword	.L_LC542-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b14:
.L_LC543:

	.pushsection	".line"
	.uaword	801	! radix.C:801
	.uahalf	0xffff
	.uaword	.L_LC543-.L_text_b
	.popsection
	sethi %hi(_Files+8),%o0
	ld [%o0+%lo(_Files+8)],%o0
	sethi %hi(.LLC46),%o1
	or %o1,%lo(.LLC46),%o1
	call fprintf,0
	mov %i0,%o2
.L_b14_e:
	ret
	restore
.L_f14_e:
.LLfe12:
	.size	 printerr,.LLfe12-printerr

	.pushsection	".debug_pubnames"
	.uaword	.L_P12
	.asciz	"printerr"
	.popsection

	.pushsection	".debug"
.L_P12:
.L_D395:
	.uaword	.L_D395_e-.L_D395
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D401
	.uahalf	0x38
	.asciz	"printerr"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	printerr
	.uahalf	0x121
	.uaword	.L_f14_e
	.uahalf	0x8041
	.uaword	.L_b14
	.uahalf	0x8051
	.uaword	.L_b14_e
.L_D395_e:
.L_D402:
	.uaword	.L_D402_e-.L_D402
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D403
	.uahalf	0x38
	.asciz	"s"
	.uahalf	0x63
	.uahalf	.L_t402_e-.L_t402
.L_t402:
	.byte	0x1
	.uahalf	0x1
.L_t402_e:
	.uahalf	0x23
	.uahalf	.L_l402_e-.L_l402
.L_l402:
	.byte	0x1
	.uaword	0x18
.L_l402_e:
.L_D402_e:
.L_D403:
	.uaword	0x4
	.popsection
.section	".rodata"
	.align 8
.LLC47:
	.long	0x41b2b9b0
	.long	0xa1000000
	.align 8
.LLC48:
	.long	0x41d2309c
	.long	0xe5400000
	.align 8
.LLC49:
	.long	0x42d00000
	.long	0x0
	.align 8
.LLC50:
	.long	0x40100000
	.long	0x0
.section	".text"
	.align 4
	.global init
	.type	 init,#function
	.proc	020
init:
.L_LC544:

	.pushsection	".line"
	.uaword	810	! radix.C:810
	.uahalf	0xffff
	.uaword	.L_LC544-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-128,%sp
	!#PROLOGUE# 1
.L_b15:
.L_LC545:

	.pushsection	".line"
	.uaword	811	! radix.C:811
	.uahalf	0xffff
	.uaword	.L_LC545-.L_text_b
	.popsection
.L_LC546:

	.pushsection	".line"
	.uaword	817	! radix.C:817
	.uahalf	0xffff
	.uaword	.L_LC546-.L_text_b
	.popsection
	sll %i0,2,%l3
	sethi %hi(1102231984),%o2
	or %o2,%lo(1102231984),%o2
	sethi %hi(-1593835520),%o3
	or %l3,1,%o0
	sethi %hi(1104294044),%l0
	or %l0,%lo(1104294044),%l0
	sethi %hi(-448790528),%l1
	mov %o2,%o1
	mov %o3,%o2
	mov %l0,%o3
	call ran_num_init,0
	mov %l1,%o4
.L_LC547:

	.pushsection	".line"
	.uaword	818	! radix.C:818
	.uahalf	0xffff
	.uaword	.L_LC547-.L_text_b
	.popsection
	sethi %hi(.LLC49),%o5
	ldd [%o5+%lo(.LLC49)],%f2
	fdivd %f0,%f2,%f4
.L_LC548:

	.pushsection	".line"
	.uaword	819	! radix.C:819
	.uahalf	0xffff
	.uaword	.L_LC548-.L_text_b
	.popsection
	sethi %hi(key),%o0
	or %o0,%lo(key),%o0
	sll %i2,2,%i2
	ld [%i2+%o0],%l2
.L_LC549:

	.pushsection	".line"
	.uaword	820	! radix.C:820
	.uahalf	0xffff
	.uaword	.L_LC549-.L_text_b
	.popsection
	cmp %i0,%i1
	bge .LL509
	sethi %hi(max_key),%l4
	add %l3,%l2,%i2
.LL511:
.L_LC550:

	.pushsection	".line"
	.uaword	821	! radix.C:821
	.uahalf	0xffff
	.uaword	.L_LC550-.L_text_b
	.popsection
	std %f0,[%fp-24]
	mov %l0,%o2
	mov %l1,%o3
	ldd [%fp-24],%o0
	call product_mod_46,0
	std %f4,[%fp-32]
.L_LC551:

	.pushsection	".line"
	.uaword	822	! radix.C:822
	.uahalf	0xffff
	.uaword	.L_LC551-.L_text_b
	.popsection
	sethi %hi(.LLC49),%o5
	ldd [%o5+%lo(.LLC49)],%f6
	fdivd %f0,%f6,%f2
	ldd [%fp-32],%f4
	faddd %f4,%f2,%f4
.L_LC552:

	.pushsection	".line"
	.uaword	823	! radix.C:823
	.uahalf	0xffff
	.uaword	.L_LC552-.L_text_b
	.popsection
	mov %l0,%o2
	mov %l1,%o3
	std %f0,[%fp-24]
	ldd [%fp-24],%o0
	call product_mod_46,0
	std %f4,[%fp-32]
.L_LC553:

	.pushsection	".line"
	.uaword	824	! radix.C:824
	.uahalf	0xffff
	.uaword	.L_LC553-.L_text_b
	.popsection
	sethi %hi(.LLC49),%o5
	ldd [%o5+%lo(.LLC49)],%f6
	fdivd %f0,%f6,%f2
	ldd [%fp-32],%f4
	faddd %f4,%f2,%f4
.L_LC554:

	.pushsection	".line"
	.uaword	825	! radix.C:825
	.uahalf	0xffff
	.uaword	.L_LC554-.L_text_b
	.popsection
	mov %l0,%o2
	mov %l1,%o3
	std %f0,[%fp-24]
	ldd [%fp-24],%o0
	call product_mod_46,0
	std %f4,[%fp-32]
.L_LC555:

	.pushsection	".line"
	.uaword	826	! radix.C:826
	.uahalf	0xffff
	.uaword	.L_LC555-.L_text_b
	.popsection
	sethi %hi(.LLC49),%o5
	ldd [%o5+%lo(.LLC49)],%f6
	fdivd %f0,%f6,%f2
	ldd [%fp-32],%f4
	faddd %f4,%f2,%f4
.L_LC556:

	.pushsection	".line"
	.uaword	827	! radix.C:827
	.uahalf	0xffff
	.uaword	.L_LC556-.L_text_b
	.popsection
	sethi %hi(.LLC50),%o5
	ldd [%o5+%lo(.LLC50)],%f6
	fdivd %f4,%f6,%f4
	ld [%l4+%lo(max_key)],%f2
	fitod %f2,%f2
	fmuld %f4,%f2,%f4
	fdtoi %f4,%f2
	sll %i0,2,%o0
	st %f2,[%l2+%o0]
.L_LC557:

	.pushsection	".line"
	.uaword	828	! radix.C:828
	.uahalf	0xffff
	.uaword	.L_LC557-.L_text_b
	.popsection
	ld [%i2],%o0
.L_LC558:

	.pushsection	".line"
	.uaword	829	! radix.C:829
	.uahalf	0xffff
	.uaword	.L_LC558-.L_text_b
	.popsection
	std %f0,[%fp-24]
	ldd [%fp-24],%o0
	mov %l0,%o2
	call product_mod_46,0
	mov %l1,%o3
.L_LC559:

	.pushsection	".line"
	.uaword	830	! radix.C:830
	.uahalf	0xffff
	.uaword	.L_LC559-.L_text_b
	.popsection
	sethi %hi(.LLC49),%o5
	ldd [%o5+%lo(.LLC49)],%f6
	fdivd %f0,%f6,%f4
.L_LC560:

	.pushsection	".line"
	.uaword	820	! radix.C:820
	.uahalf	0xffff
	.uaword	.L_LC560-.L_text_b
	.popsection
	add %i0,1,%i0
	cmp %i0,%i1
	bl .LL511
	add %i2,4,%i2
.LL509:
.L_LC561:

	.pushsection	".line"
	.uaword	832	! radix.C:832
	.uahalf	0xffff
	.uaword	.L_LC561-.L_text_b
	.popsection
.L_b15_e:
	ret
	restore
.L_f15_e:
.LLfe13:
	.size	 init,.LLfe13-init

	.pushsection	".debug_pubnames"
	.uaword	.L_P13
	.asciz	"init"
	.popsection

	.pushsection	".debug"
.L_P13:
.L_D401:
	.uaword	.L_D401_e-.L_D401
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D404
	.uahalf	0x38
	.asciz	"init"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	init
	.uahalf	0x121
	.uaword	.L_f15_e
	.uahalf	0x8041
	.uaword	.L_b15
	.uahalf	0x8051
	.uaword	.L_b15_e
.L_D401_e:
.L_D405:
	.uaword	.L_D405_e-.L_D405
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D406
	.uahalf	0x38
	.asciz	"key_start"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l405_e-.L_l405
.L_l405:
	.byte	0x1
	.uaword	0x18
.L_l405_e:
.L_D405_e:
.L_D406:
	.uaword	.L_D406_e-.L_D406
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D407
	.uahalf	0x38
	.asciz	"key_stop"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l406_e-.L_l406
.L_l406:
	.byte	0x1
	.uaword	0x19
.L_l406_e:
.L_D406_e:
.L_D407:
	.uaword	.L_D407_e-.L_D407
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D408
	.uahalf	0x38
	.asciz	"from"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l407_e-.L_l407
.L_l407:
	.byte	0x1
	.uaword	0x1a
.L_l407_e:
.L_D407_e:
.L_D408:
	.uaword	.L_D408_e-.L_D408
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D409
	.uahalf	0x38
	.asciz	"ran_num"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l408_e-.L_l408
.L_l408:
	.byte	0x1
	.uaword	0x20
.L_l408_e:
.L_D408_e:
.L_D409:
	.uaword	.L_D409_e-.L_D409
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D410
	.uahalf	0x38
	.asciz	"sum"
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l409_e-.L_l409
.L_l409:
	.byte	0x1
	.uaword	0x24
.L_l409_e:
.L_D409_e:
.L_D410:
	.uaword	.L_D410_e-.L_D410
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D411
	.uahalf	0x38
	.asciz	"tmp"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l410_e-.L_l410
.L_l410:
.L_l410_e:
.L_D410_e:
.L_D411:
	.uaword	.L_D411_e-.L_D411
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D412
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l411_e-.L_l411
.L_l411:
	.byte	0x1
	.uaword	0x18
.L_l411_e:
.L_D411_e:
.L_D412:
	.uaword	.L_D412_e-.L_D412
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D413
	.uahalf	0x38
	.asciz	"key_from"
	.uahalf	0x63
	.uahalf	.L_t412_e-.L_t412
.L_t412:
	.byte	0x1
	.uahalf	0x7
.L_t412_e:
	.uahalf	0x23
	.uahalf	.L_l412_e-.L_l412
.L_l412:
	.byte	0x1
	.uaword	0x12
.L_l412_e:
.L_D412_e:
.L_D413:
	.uaword	0x4
	.popsection
.section	".rodata"
	.align 8
.LLC51:
	.asciz	"                  TESTING RESULTS\n"
	.align 8
.LLC52:
	.asciz	"error with key %d, value %d %d \n"
	.align 8
.LLC53:
	.asciz	"FAILED: %d keys out of place.\n"
	.align 8
.LLC54:
	.asciz	"PASSED: All keys in place.\n"
.section	".text"
	.align 4
	.global test_sort
	.type	 test_sort,#function
	.proc	020
test_sort:
.L_LC562:

	.pushsection	".line"
	.uaword	838	! radix.C:838
	.uahalf	0xffff
	.uaword	.L_LC562-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b16:
.L_LC563:

	.pushsection	".line"
	.uaword	839	! radix.C:839
	.uahalf	0xffff
	.uaword	.L_LC563-.L_text_b
	.popsection
.L_LC564:

	.pushsection	".line"
	.uaword	840	! radix.C:840
	.uahalf	0xffff
	.uaword	.L_LC564-.L_text_b
	.popsection
	mov 0,%l1
.L_LC565:

	.pushsection	".line"
	.uaword	843	! radix.C:843
	.uahalf	0xffff
	.uaword	.L_LC565-.L_text_b
	.popsection
	sethi %hi(.LLC19),%o0
	call printf,0
	or %o0,%lo(.LLC19),%o0
.L_LC566:

	.pushsection	".line"
	.uaword	844	! radix.C:844
	.uahalf	0xffff
	.uaword	.L_LC566-.L_text_b
	.popsection
	sethi %hi(.LLC51),%o0
	call printf,0
	or %o0,%lo(.LLC51),%o0
.L_LC567:

	.pushsection	".line"
	.uaword	845	! radix.C:845
	.uahalf	0xffff
	.uaword	.L_LC567-.L_text_b
	.popsection
	sethi %hi(key),%o1
	or %o1,%lo(key),%o1
.L_LC568:

	.pushsection	".line"
	.uaword	846	! radix.C:846
	.uahalf	0xffff
	.uaword	.L_LC568-.L_text_b
	.popsection
	sethi %hi(num_keys),%o2
	ld [%o2+%lo(num_keys)],%o0
.L_LC569:

	.pushsection	".line"
	.uaword	845	! radix.C:845
	.uahalf	0xffff
	.uaword	.L_LC569-.L_text_b
	.popsection
	sll %i0,2,%i0
	ld [%i0+%o1],%o1
.L_LC570:

	.pushsection	".line"
	.uaword	846	! radix.C:846
	.uahalf	0xffff
	.uaword	.L_LC570-.L_text_b
	.popsection
	add %o0,-1,%o0
	cmp %l1,%o0
	bge .LL515
	mov 0,%l0
	sethi %hi(_Files+8),%l4
	sethi %hi(.LLC52),%l3
	mov %o2,%l2
	mov %o1,%i0
.LL517:
.L_LC571:

	.pushsection	".line"
	.uaword	847	! radix.C:847
	.uahalf	0xffff
	.uaword	.L_LC571-.L_text_b
	.popsection
	ld [%i0],%o1
	ld [%i0+4],%o0
	cmp %o1,%o0
	ble .LL522
	ld [%l2+%lo(num_keys)],%o0
.L_LC572:

	.pushsection	".line"
	.uaword	848	! radix.C:848
	.uahalf	0xffff
	.uaword	.L_LC572-.L_text_b
	.popsection
	ld [%l4+%lo(_Files+8)],%o0
	or %l3,%lo(.LLC52),%o1
	ld [%i0],%o3
.L_LC573:

	.pushsection	".line"
	.uaword	850	! radix.C:850
	.uahalf	0xffff
	.uaword	.L_LC573-.L_text_b
	.popsection
	add %l1,1,%l1
.L_LC574:

	.pushsection	".line"
	.uaword	848	! radix.C:848
	.uahalf	0xffff
	.uaword	.L_LC574-.L_text_b
	.popsection
	ld [%i0+4],%o4
	call fprintf,0
	mov %l0,%o2
.L_LC575:

	.pushsection	".line"
	.uaword	846	! radix.C:846
	.uahalf	0xffff
	.uaword	.L_LC575-.L_text_b
	.popsection
	ld [%l2+%lo(num_keys)],%o0
.LL522:
	add %l0,1,%l0
	add %o0,-1,%o0
	cmp %l0,%o0
	bl .LL517
	add %i0,4,%i0
.LL515:
.L_LC576:

	.pushsection	".line"
	.uaword	854	! radix.C:854
	.uahalf	0xffff
	.uaword	.L_LC576-.L_text_b
	.popsection
	cmp %l1,0
	be,a .LL520
	sethi %hi(.LLC54),%o0
.L_LC577:

	.pushsection	".line"
	.uaword	855	! radix.C:855
	.uahalf	0xffff
	.uaword	.L_LC577-.L_text_b
	.popsection
	sethi %hi(.LLC53),%o0
	or %o0,%lo(.LLC53),%o0
	call printf,0
	mov %l1,%o1
.L_LC578:

	.pushsection	".line"
	.uaword	856	! radix.C:856
	.uahalf	0xffff
	.uaword	.L_LC578-.L_text_b
	.popsection
	b .LL523
	sethi %hi(.LLC19),%o0
.LL520:
.L_LC579:

	.pushsection	".line"
	.uaword	857	! radix.C:857
	.uahalf	0xffff
	.uaword	.L_LC579-.L_text_b
	.popsection
	call printf,0
	or %o0,%lo(.LLC54),%o0
.L_LC580:

	.pushsection	".line"
	.uaword	859	! radix.C:859
	.uahalf	0xffff
	.uaword	.L_LC580-.L_text_b
	.popsection
	sethi %hi(.LLC19),%o0
.LL523:
	call printf,0
	or %o0,%lo(.LLC19),%o0
.L_LC581:

	.pushsection	".line"
	.uaword	860	! radix.C:860
	.uahalf	0xffff
	.uaword	.L_LC581-.L_text_b
	.popsection
.L_b16_e:
	ret
	restore
.L_f16_e:
.LLfe14:
	.size	 test_sort,.LLfe14-test_sort

	.pushsection	".debug_pubnames"
	.uaword	.L_P14
	.asciz	"test_sort"
	.popsection

	.pushsection	".debug"
.L_P14:
.L_D404:
	.uaword	.L_D404_e-.L_D404
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D414
	.uahalf	0x38
	.asciz	"test_sort"
	.uahalf	0x278
	.asciz	""
	.uahalf	0x111
	.uaword	test_sort
	.uahalf	0x121
	.uaword	.L_f16_e
	.uahalf	0x8041
	.uaword	.L_b16
	.uahalf	0x8051
	.uaword	.L_b16_e
.L_D404_e:
.L_D415:
	.uaword	.L_D415_e-.L_D415
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D416
	.uahalf	0x38
	.asciz	"final"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l415_e-.L_l415
.L_l415:
	.byte	0x1
	.uaword	0x18
.L_l415_e:
.L_D415_e:
.L_D416:
	.uaword	.L_D416_e-.L_D416
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D417
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l416_e-.L_l416
.L_l416:
	.byte	0x1
	.uaword	0x10
.L_l416_e:
.L_D416_e:
.L_D417:
	.uaword	.L_D417_e-.L_D417
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D418
	.uahalf	0x38
	.asciz	"mistake"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l417_e-.L_l417
.L_l417:
	.byte	0x1
	.uaword	0x11
.L_l417_e:
.L_D417_e:
.L_D418:
	.uaword	.L_D418_e-.L_D418
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D419
	.uahalf	0x38
	.asciz	"key_final"
	.uahalf	0x63
	.uahalf	.L_t418_e-.L_t418
.L_t418:
	.byte	0x1
	.uahalf	0x7
.L_t418_e:
	.uahalf	0x23
	.uahalf	.L_l418_e-.L_l418
.L_l418:
	.byte	0x1
	.uaword	0x9
.L_l418_e:
.L_D418_e:
.L_D419:
	.uaword	0x4
	.popsection
.section	".rodata"
	.align 8
.LLC55:
	.asciz	"                 SORTED KEY VALUES\n"
	.align 8
.LLC56:
	.asciz	"%8d "
.section	".text"
	.align 4
	.global printout
	.type	 printout,#function
	.proc	020
printout:
.L_LC582:

	.pushsection	".line"
	.uaword	864	! radix.C:864
	.uahalf	0xffff
	.uaword	.L_LC582-.L_text_b
	.popsection
	!#PROLOGUE# 0
	save %sp,-112,%sp
	!#PROLOGUE# 1
.L_b17:
.L_LC583:

	.pushsection	".line"
	.uaword	865	! radix.C:865
	.uahalf	0xffff
	.uaword	.L_LC583-.L_text_b
	.popsection
.L_LC584:

	.pushsection	".line"
	.uaword	869	! radix.C:869
	.uahalf	0xffff
	.uaword	.L_LC584-.L_text_b
	.popsection
	sethi %hi(global),%o0
	ld [%o0+%lo(global)],%o0
	sethi %hi(key),%o1
	ld [%o0+304],%o0
	or %o1,%lo(key),%o1
	sll %o0,2,%o0
	ld [%o0+%o1],%l1
.L_LC585:

	.pushsection	".line"
	.uaword	870	! radix.C:870
	.uahalf	0xffff
	.uaword	.L_LC585-.L_text_b
	.popsection
	sethi %hi(.LLC19),%l3
	call printf,0
	or %l3,%lo(.LLC19),%o0
.L_LC586:

	.pushsection	".line"
	.uaword	871	! radix.C:871
	.uahalf	0xffff
	.uaword	.L_LC586-.L_text_b
	.popsection
	sethi %hi(.LLC55),%o0
	call printf,0
	or %o0,%lo(.LLC55),%o0
.L_LC587:

	.pushsection	".line"
	.uaword	872	! radix.C:872
	.uahalf	0xffff
	.uaword	.L_LC587-.L_text_b
	.popsection
	sethi %hi(.LLC56),%l2
	ld [%l1],%o1
	call printf,0
	or %l2,%lo(.LLC56),%o0
.L_LC588:

	.pushsection	".line"
	.uaword	873	! radix.C:873
	.uahalf	0xffff
	.uaword	.L_LC588-.L_text_b
	.popsection
	sethi %hi(num_keys),%o1
	ld [%o1+%lo(num_keys)],%o0
	mov 0,%l0
	add %o0,-1,%o0
	cmp %l0,%o0
	bge .LL531
	sethi %hi(.LLC19),%o0
	mov %l2,%l4
	mov %o1,%l2
.LL528:
.L_LC589:

	.pushsection	".line"
	.uaword	874	! radix.C:874
	.uahalf	0xffff
	.uaword	.L_LC589-.L_text_b
	.popsection
	ld [%l1+4],%o1
	call printf,0
	or %l4,%lo(.LLC56),%o0
.L_LC590:

	.pushsection	".line"
	.uaword	875	! radix.C:875
	.uahalf	0xffff
	.uaword	.L_LC590-.L_text_b
	.popsection
	add %l0,2,%o0
	call .rem,0
	mov 5,%o1
	cmp %o0,0
	bne .LL527
	add %l1,4,%l1
.L_LC591:

	.pushsection	".line"
	.uaword	876	! radix.C:876
	.uahalf	0xffff
	.uaword	.L_LC591-.L_text_b
	.popsection
	call printf,0
	or %l3,%lo(.LLC19),%o0
.L_LC592:

	.pushsection	".line"
	.uaword	873	! radix.C:873
	.uahalf	0xffff
	.uaword	.L_LC592-.L_text_b
	.popsection
.LL527:
	ld [%l2+%lo(num_keys)],%o0
	add %l0,1,%l0
	add %o0,-1,%o0
	cmp %l0,%o0
	bl .LL528
	sethi %hi(.LLC19),%o0
.L_LC593:

	.pushsection	".line"
	.uaword	879	! radix.C:879
	.uahalf	0xffff
	.uaword	.L_LC593-.L_text_b
	.popsection
.LL531:
	call printf,0
	or %o0,%lo(.LLC19),%o0
.L_LC594:

	.pushsection	".line"
	.uaword	880	! radix.C:880
	.uahalf	0xffff
	.uaword	.L_LC594-.L_text_b
	.popsection
.L_b17_e:
	ret
	restore
.L_f17_e:
.LLfe15:
	.size	 printout,.LLfe15-printout

	.pushsection	".debug_pubnames"
	.uaword	.L_P15
	.asciz	"printout"
	.popsection

	.pushsection	".debug"
.L_P15:
.L_D414:
	.uaword	.L_D414_e-.L_D414
	.uahalf	0x6
	.uahalf	0x12
	.uaword	.L_D420
	.uahalf	0x38
	.asciz	"printout"
	.uahalf	0x111
	.uaword	printout
	.uahalf	0x121
	.uaword	.L_f17_e
	.uahalf	0x8041
	.uaword	.L_b17
	.uahalf	0x8051
	.uaword	.L_b17_e
.L_D414_e:
.L_D421:
	.uaword	.L_D421_e-.L_D421
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D422
	.uahalf	0x38
	.asciz	"i"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l421_e-.L_l421
.L_l421:
	.byte	0x1
	.uaword	0x10
.L_l421_e:
.L_D421_e:
.L_D422:
	.uaword	.L_D422_e-.L_D422
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D423
	.uahalf	0x38
	.asciz	"mistake"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l422_e-.L_l422
.L_l422:
.L_l422_e:
.L_D422_e:
.L_D423:
	.uaword	.L_D423_e-.L_D423
	.uahalf	0xc
	.uahalf	0x12
	.uaword	.L_D424
	.uahalf	0x38
	.asciz	"key_final"
	.uahalf	0x63
	.uahalf	.L_t423_e-.L_t423
.L_t423:
	.byte	0x1
	.uahalf	0x7
.L_t423_e:
	.uahalf	0x23
	.uahalf	.L_l423_e-.L_l423
.L_l423:
	.byte	0x1
	.uaword	0x11
.L_l423_e:
.L_D423_e:
.L_D424:
	.uaword	0x4
	.popsection
		.common	ANLglob,4,4
		.common	lock_model,4,4
		.common	ANLno_procs,4,4
		.common	proc_id,4,4
		.common	global,4,4
		.common	gp,262400,4
		.common	key,8,4
		.common	rank_me,4,4
		.common	key_partition,4,4
		.common	rank_partition,4,4
		.common	max_num_digits,4,4
		.common	log2_radix,4,4
		.common	log2_keys,4,4

	.pushsection	".debug"
.L_D420:
	.uaword	.L_D420_e-.L_D420
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D425
	.uahalf	0x38
	.asciz	"_Wchart"
	.uahalf	0x55
	.uahalf	0x6
.L_D420_e:
	.popsection

	.pushsection	".debug"
.L_D425:
	.uaword	.L_D425_e-.L_D425
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D426
	.uahalf	0x38
	.asciz	"_Ptrdifft"
	.uahalf	0x55
	.uahalf	0x7
.L_D425_e:
	.popsection

	.pushsection	".debug"
.L_D426:
	.uaword	.L_D426_e-.L_D426
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D427
	.uahalf	0x38
	.asciz	"_Sizet"
	.uahalf	0x55
	.uahalf	0x9
.L_D426_e:
	.popsection

	.pushsection	".debug"
.L_D427:
	.uaword	.L_D427_e-.L_D427
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D428
	.uahalf	0x38
	.asciz	"clock_t"
	.uahalf	0x55
	.uahalf	0x7
.L_D427_e:
	.popsection

	.pushsection	".debug"
.L_D428:
	.uaword	.L_D428_e-.L_D428
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D429
	.uahalf	0x38
	.asciz	"size_t"
	.uahalf	0x55
	.uahalf	0x9
.L_D428_e:
	.popsection

	.pushsection	".debug"
.L_D429:
	.uaword	.L_D429_e-.L_D429
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D430
	.L_T73 = .L_D429
	.uahalf	0x38
	.asciz	"tms"
	.uahalf	0xb6
	.uaword	0x10
.L_D429_e:
.L_D431:
	.uaword	.L_D431_e-.L_D431
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D432
	.uahalf	0x38
	.asciz	"tms_utime"
	.uahalf	0x142
	.uaword	.L_T73
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l431_e-.L_l431
.L_l431:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l431_e:
.L_D431_e:
.L_D432:
	.uaword	.L_D432_e-.L_D432
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D433
	.uahalf	0x38
	.asciz	"tms_stime"
	.uahalf	0x142
	.uaword	.L_T73
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l432_e-.L_l432
.L_l432:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l432_e:
.L_D432_e:
.L_D433:
	.uaword	.L_D433_e-.L_D433
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D434
	.uahalf	0x38
	.asciz	"tms_cutime"
	.uahalf	0x142
	.uaword	.L_T73
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l433_e-.L_l433
.L_l433:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l433_e:
.L_D433_e:
.L_D434:
	.uaword	.L_D434_e-.L_D434
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D435
	.uahalf	0x38
	.asciz	"tms_cstime"
	.uahalf	0x142
	.uaword	.L_T73
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l434_e-.L_l434
.L_l434:
	.byte	0x4
	.uaword	0xc
	.byte	0x7
.L_l434_e:
.L_D434_e:
.L_D435:
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_D430:
	.uaword	.L_D430_e-.L_D430
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D436
	.L_T74 = .L_D430
	.uahalf	0x38
	.asciz	"timeval"
	.uahalf	0xb6
	.uaword	0x8
.L_D430_e:
.L_D437:
	.uaword	.L_D437_e-.L_D437
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D438
	.uahalf	0x38
	.asciz	"tv_sec"
	.uahalf	0x142
	.uaword	.L_T74
	.uahalf	0x55
	.uahalf	0xa
	.uahalf	0x23
	.uahalf	.L_l437_e-.L_l437
.L_l437:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l437_e:
.L_D437_e:
.L_D438:
	.uaword	.L_D438_e-.L_D438
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D439
	.uahalf	0x38
	.asciz	"tv_usec"
	.uahalf	0x142
	.uaword	.L_T74
	.uahalf	0x55
	.uahalf	0xa
	.uahalf	0x23
	.uahalf	.L_l438_e-.L_l438
.L_l438:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l438_e:
.L_D438_e:
.L_D439:
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_D436:
	.uaword	.L_D436_e-.L_D436
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D440
	.L_T75 = .L_D436
	.uahalf	0x38
	.asciz	"timezone"
	.uahalf	0xb6
	.uaword	0x8
.L_D436_e:
.L_D441:
	.uaword	.L_D441_e-.L_D441
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D442
	.uahalf	0x38
	.asciz	"tz_minuteswest"
	.uahalf	0x142
	.uaword	.L_T75
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l441_e-.L_l441
.L_l441:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l441_e:
.L_D441_e:
.L_D442:
	.uaword	.L_D442_e-.L_D442
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D443
	.uahalf	0x38
	.asciz	"tz_dsttime"
	.uahalf	0x142
	.uaword	.L_T75
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l442_e-.L_l442
.L_l442:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l442_e:
.L_D442_e:
.L_D443:
	.uaword	0x4
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
.L_D440:
	.uaword	.L_D440_e-.L_D440
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D444
	.L_T76 = .L_D440
	.uahalf	0xb6
	.uaword	0x4
.L_D440_e:
.L_D445:
	.uaword	.L_D445_e-.L_D445
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D446
	.uahalf	0x38
	.asciz	"_Off"
	.uahalf	0x142
	.uaword	.L_T76
	.uahalf	0x55
	.uahalf	0xc
	.uahalf	0x23
	.uahalf	.L_l445_e-.L_l445
.L_l445:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l445_e:
.L_D445_e:
.L_D446:
	.uaword	0x4
.L_D444:
	.uaword	.L_D444_e-.L_D444
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D447
	.uahalf	0x38
	.asciz	"fpos_t"
	.uahalf	0x72
	.uaword	.L_T76
.L_D444_e:
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
.L_D447:
	.uaword	.L_D447_e-.L_D447
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D448
	.L_T81 = .L_D447
	.uahalf	0xb6
	.uaword	0x24
.L_D447_e:
.L_D449:
	.uaword	.L_D449_e-.L_D449
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D450
	.uahalf	0x38
	.asciz	"_Mode"
	.uahalf	0x142
	.uaword	.L_T81
	.uahalf	0x55
	.uahalf	0x6
	.uahalf	0x23
	.uahalf	.L_l449_e-.L_l449
.L_l449:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l449_e:
.L_D449_e:
.L_D450:
	.uaword	.L_D450_e-.L_D450
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D451
	.uahalf	0x38
	.asciz	"_Handle"
	.uahalf	0x142
	.uaword	.L_T81
	.uahalf	0x55
	.uahalf	0x4
	.uahalf	0x23
	.uahalf	.L_l450_e-.L_l450
.L_l450:
	.byte	0x4
	.uaword	0x2
	.byte	0x7
.L_l450_e:
.L_D450_e:
.L_D451:
	.uaword	.L_D451_e-.L_D451
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D452
	.uahalf	0x38
	.asciz	"_Buf"
	.uahalf	0x142
	.uaword	.L_T81
	.uahalf	0x63
	.uahalf	.L_t451_e-.L_t451
.L_t451:
	.byte	0x1
	.uahalf	0x3
.L_t451_e:
	.uahalf	0x23
	.uahalf	.L_l451_e-.L_l451
.L_l451:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l451_e:
.L_D451_e:
.L_D452:
	.uaword	.L_D452_e-.L_D452
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D453
	.uahalf	0x38
	.asciz	"_Bend"
	.uahalf	0x142
	.uaword	.L_T81
	.uahalf	0x63
	.uahalf	.L_t452_e-.L_t452
.L_t452:
	.byte	0x1
	.uahalf	0x3
.L_t452_e:
	.uahalf	0x23
	.uahalf	.L_l452_e-.L_l452
.L_l452:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l452_e:
.L_D452_e:
.L_D453:
	.uaword	.L_D453_e-.L_D453
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D454
	.uahalf	0x38
	.asciz	"_Next"
	.uahalf	0x142
	.uaword	.L_T81
	.uahalf	0x63
	.uahalf	.L_t453_e-.L_t453
.L_t453:
	.byte	0x1
	.uahalf	0x3
.L_t453_e:
	.uahalf	0x23
	.uahalf	.L_l453_e-.L_l453
.L_l453:
	.byte	0x4
	.uaword	0xc
	.byte	0x7
.L_l453_e:
.L_D453_e:
.L_D454:
	.uaword	.L_D454_e-.L_D454
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D455
	.uahalf	0x38
	.asciz	"_Rend"
	.uahalf	0x142
	.uaword	.L_T81
	.uahalf	0x63
	.uahalf	.L_t454_e-.L_t454
.L_t454:
	.byte	0x1
	.uahalf	0x3
.L_t454_e:
	.uahalf	0x23
	.uahalf	.L_l454_e-.L_l454
.L_l454:
	.byte	0x4
	.uaword	0x10
	.byte	0x7
.L_l454_e:
.L_D454_e:
.L_D455:
	.uaword	.L_D455_e-.L_D455
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D456
	.uahalf	0x38
	.asciz	"_Rsave"
	.uahalf	0x142
	.uaword	.L_T81
	.uahalf	0x63
	.uahalf	.L_t455_e-.L_t455
.L_t455:
	.byte	0x1
	.uahalf	0x3
.L_t455_e:
	.uahalf	0x23
	.uahalf	.L_l455_e-.L_l455
.L_l455:
	.byte	0x4
	.uaword	0x14
	.byte	0x7
.L_l455_e:
.L_D455_e:
.L_D456:
	.uaword	.L_D456_e-.L_D456
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D457
	.uahalf	0x38
	.asciz	"_Wend"
	.uahalf	0x142
	.uaword	.L_T81
	.uahalf	0x63
	.uahalf	.L_t456_e-.L_t456
.L_t456:
	.byte	0x1
	.uahalf	0x3
.L_t456_e:
	.uahalf	0x23
	.uahalf	.L_l456_e-.L_l456
.L_l456:
	.byte	0x4
	.uaword	0x18
	.byte	0x7
.L_l456_e:
.L_D456_e:
.L_D457:
	.uaword	.L_D457_e-.L_D457
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D458
	.uahalf	0x38
	.asciz	"_Back"
	.uahalf	0x142
	.uaword	.L_T81
	.uahalf	0x72
	.uaword	.L_T80
	.uahalf	0x23
	.uahalf	.L_l457_e-.L_l457
.L_l457:
	.byte	0x4
	.uaword	0x1c
	.byte	0x7
.L_l457_e:
.L_D457_e:
.L_D458:
	.uaword	.L_D458_e-.L_D458
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D459
	.uahalf	0x38
	.asciz	"_Cbuf"
	.uahalf	0x142
	.uaword	.L_T81
	.uahalf	0x55
	.uahalf	0x3
	.uahalf	0x23
	.uahalf	.L_l458_e-.L_l458
.L_l458:
	.byte	0x4
	.uaword	0x1e
	.byte	0x7
.L_l458_e:
.L_D458_e:
.L_D459:
	.uaword	.L_D459_e-.L_D459
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D460
	.uahalf	0x38
	.asciz	"_Nback"
	.uahalf	0x142
	.uaword	.L_T81
	.uahalf	0x55
	.uahalf	0x3
	.uahalf	0x23
	.uahalf	.L_l459_e-.L_l459
.L_l459:
	.byte	0x4
	.uaword	0x1f
	.byte	0x7
.L_l459_e:
.L_D459_e:
.L_D460:
	.uaword	.L_D460_e-.L_D460
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D461
	.uahalf	0x38
	.asciz	"_Tmpnam"
	.uahalf	0x142
	.uaword	.L_T81
	.uahalf	0x63
	.uahalf	.L_t460_e-.L_t460
.L_t460:
	.byte	0x1
	.uahalf	0x1
.L_t460_e:
	.uahalf	0x23
	.uahalf	.L_l460_e-.L_l460
.L_l460:
	.byte	0x4
	.uaword	0x20
	.byte	0x7
.L_l460_e:
.L_D460_e:
.L_D461:
	.uaword	0x4
.L_D448:
	.uaword	.L_D448_e-.L_D448
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D462
	.uahalf	0x38
	.asciz	"FILE"
	.uahalf	0x72
	.uaword	.L_T81
.L_D448_e:
.L_D462:
	.uaword	.L_D462_e-.L_D462
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D463
	.L_T80 = .L_D462
	.uahalf	0xa3
	.uahalf	.L_s462_e-.L_s462
.L_s462:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0x1
	.byte	0x8
	.uahalf	0x55
	.uahalf	0x3
.L_s462_e:
.L_D462_e:
	.popsection

	.pushsection	".debug"
.L_D463:
	.uaword	.L_D463_e-.L_D463
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D464
	.L_T132 = .L_D463
	.uahalf	0xa3
	.uahalf	.L_s463_e-.L_s463
.L_s463:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0xf
	.byte	0x8
	.uahalf	0x83
	.uahalf	.L_t463_e-.L_t463
.L_t463:
	.byte	0x1
	.uaword	.L_T81
.L_t463_e:
.L_s463_e:
.L_D463_e:
.L_P16:
.L_D464:
	.uaword	.L_D464_e-.L_D464
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D465
	.uahalf	0x38
	.asciz	"_Files"
	.uahalf	0x72
	.uaword	.L_T132
.L_D464_e:
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
.L_D465:
	.uaword	.L_D465_e-.L_D465
	.uahalf	0x17
	.uahalf	0x12
	.uaword	.L_D466
	.L_T136 = .L_D465
	.uahalf	0xb6
	.uaword	0x8
.L_D465_e:
.L_D467:
	.uaword	.L_D467_e-.L_D467
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D468
	.uahalf	0x38
	.asciz	"_W"
	.uahalf	0x142
	.uaword	.L_T136
	.uahalf	0x72
	.uaword	.L_T135
	.uahalf	0x23
	.uahalf	.L_l467_e-.L_l467
.L_l467:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l467_e:
.L_D467_e:
.L_D468:
	.uaword	.L_D468_e-.L_D468
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D469
	.uahalf	0x38
	.asciz	"_D"
	.uahalf	0x142
	.uaword	.L_T136
	.uahalf	0x55
	.uahalf	0xf
	.uahalf	0x23
	.uahalf	.L_l468_e-.L_l468
.L_l468:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l468_e:
.L_D468_e:
.L_D469:
	.uaword	0x4
.L_D466:
	.uaword	.L_D466_e-.L_D466
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D470
	.uahalf	0x38
	.asciz	"_Dconst"
	.uahalf	0x83
	.uahalf	.L_t466_e-.L_t466
.L_t466:
	.byte	0x3
	.uaword	.L_T136
.L_t466_e:
.L_D466_e:
.L_D470:
	.uaword	.L_D470_e-.L_D470
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D471
	.L_T135 = .L_D470
	.uahalf	0xa3
	.uahalf	.L_s470_e-.L_s470
.L_s470:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0x3
	.byte	0x8
	.uahalf	0x55
	.uahalf	0x6
.L_s470_e:
.L_D470_e:
	.popsection

	.pushsection	".debug"
.L_D471:
	.uaword	.L_D471_e-.L_D471
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D472
	.uahalf	0x38
	.asciz	"wchar_t"
	.uahalf	0x55
	.uahalf	0x6
.L_D471_e:
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
.L_D472:
	.uaword	.L_D472_e-.L_D472
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D473
	.L_T169 = .L_D472
	.uahalf	0xb6
	.uaword	0x8
.L_D472_e:
.L_D474:
	.uaword	.L_D474_e-.L_D474
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D475
	.uahalf	0x38
	.asciz	"quot"
	.uahalf	0x142
	.uaword	.L_T169
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l474_e-.L_l474
.L_l474:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l474_e:
.L_D474_e:
.L_D475:
	.uaword	.L_D475_e-.L_D475
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D476
	.uahalf	0x38
	.asciz	"rem"
	.uahalf	0x142
	.uaword	.L_T169
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l475_e-.L_l475
.L_l475:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l475_e:
.L_D475_e:
.L_D476:
	.uaword	0x4
.L_D473:
	.uaword	.L_D473_e-.L_D473
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D477
	.uahalf	0x38
	.asciz	"div_t"
	.uahalf	0x72
	.uaword	.L_T169
.L_D473_e:
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
.L_D477:
	.uaword	.L_D477_e-.L_D477
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D478
	.L_T171 = .L_D477
	.uahalf	0xb6
	.uaword	0x8
.L_D477_e:
.L_D479:
	.uaword	.L_D479_e-.L_D479
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D480
	.uahalf	0x38
	.asciz	"quot"
	.uahalf	0x142
	.uaword	.L_T171
	.uahalf	0x55
	.uahalf	0xa
	.uahalf	0x23
	.uahalf	.L_l479_e-.L_l479
.L_l479:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l479_e:
.L_D479_e:
.L_D480:
	.uaword	.L_D480_e-.L_D480
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D481
	.uahalf	0x38
	.asciz	"rem"
	.uahalf	0x142
	.uaword	.L_T171
	.uahalf	0x55
	.uahalf	0xa
	.uahalf	0x23
	.uahalf	.L_l480_e-.L_l480
.L_l480:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l480_e:
.L_D480_e:
.L_D481:
	.uaword	0x4
.L_D478:
	.uaword	.L_D478_e-.L_D478
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D482
	.uahalf	0x38
	.asciz	"ldiv_t"
	.uahalf	0x72
	.uaword	.L_T171
.L_D478_e:
	.popsection

	.pushsection	".debug"
.L_D482:
	.uaword	.L_D482_e-.L_D482
	.uahalf	0x15
	.uahalf	0x12
	.uaword	.L_D483
	.L_T173 = .L_D482
	.uahalf	0x278
	.asciz	""
	.uahalf	0x55
	.uahalf	0x7
.L_D482_e:
.L_D484:
	.uaword	.L_D484_e-.L_D484
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D485
	.uahalf	0x63
	.uahalf	.L_t484_e-.L_t484
.L_t484:
	.byte	0x1
	.byte	0x3
	.uahalf	0x14
.L_t484_e:
.L_D484_e:
.L_D485:
	.uaword	.L_D485_e-.L_D485
	.uahalf	0x5
	.uahalf	0x12
	.uaword	.L_D486
	.uahalf	0x63
	.uahalf	.L_t485_e-.L_t485
.L_t485:
	.byte	0x1
	.byte	0x3
	.uahalf	0x14
.L_t485_e:
.L_D485_e:
.L_D486:
	.uaword	0x4
.L_D483:
	.uaword	.L_D483_e-.L_D483
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D487
	.uahalf	0x38
	.asciz	"_Cmpfun"
	.uahalf	0x72
	.uaword	.L_T173
.L_D483_e:
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
.L_D487:
	.uaword	.L_D487_e-.L_D487
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D488
	.L_T175 = .L_D487
	.uahalf	0xb6
	.uaword	0x4
.L_D487_e:
.L_D489:
	.uaword	.L_D489_e-.L_D489
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D490
	.uahalf	0x38
	.asciz	"_State"
	.uahalf	0x142
	.uaword	.L_T175
	.uahalf	0x55
	.uahalf	0x3
	.uahalf	0x23
	.uahalf	.L_l489_e-.L_l489
.L_l489:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l489_e:
.L_D489_e:
.L_D490:
	.uaword	.L_D490_e-.L_D490
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D491
	.uahalf	0x38
	.asciz	"_Wchar"
	.uahalf	0x142
	.uaword	.L_T175
	.uahalf	0x55
	.uahalf	0x6
	.uahalf	0x23
	.uahalf	.L_l490_e-.L_l490
.L_l490:
	.byte	0x4
	.uaword	0x2
	.byte	0x7
.L_l490_e:
.L_D490_e:
.L_D491:
	.uaword	0x4
.L_D488:
	.uaword	.L_D488_e-.L_D488
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D492
	.uahalf	0x38
	.asciz	"_Mbsave"
	.uahalf	0x72
	.uaword	.L_T175
.L_D488_e:
	.popsection

	.pushsection	".debug"
.L_D492:
	.uaword	.L_D492_e-.L_D492
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D493
	.L_T217 = .L_D492
	.uahalf	0x38
	.asciz	"_ANLglobTYPE"
	.uahalf	0xb6
	.uaword	0x10
.L_D492_e:
.L_D494:
	.uaword	.L_D494_e-.L_D494
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D495
	.uahalf	0x38
	.asciz	"end_lock"
	.uahalf	0x142
	.uaword	.L_T217
	.uahalf	0x63
	.uahalf	.L_t494_e-.L_t494
.L_t494:
	.byte	0x4
	.uahalf	0x7
.L_t494_e:
	.uahalf	0x23
	.uahalf	.L_l494_e-.L_l494
.L_l494:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l494_e:
.L_D494_e:
.L_D495:
	.uaword	.L_D495_e-.L_D495
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D496
	.uahalf	0x38
	.asciz	"max_proc"
	.uahalf	0x142
	.uaword	.L_T217
	.uahalf	0x63
	.uahalf	.L_t495_e-.L_t495
.L_t495:
	.byte	0x4
	.uahalf	0x7
.L_t495_e:
	.uahalf	0x23
	.uahalf	.L_l495_e-.L_l495
.L_l495:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l495_e:
.L_D495_e:
.L_D496:
	.uaword	.L_D496_e-.L_D496
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D497
	.uahalf	0x38
	.asciz	"proc_started"
	.uahalf	0x142
	.uaword	.L_T217
	.uahalf	0x63
	.uahalf	.L_t496_e-.L_t496
.L_t496:
	.byte	0x4
	.uahalf	0x7
.L_t496_e:
	.uahalf	0x23
	.uahalf	.L_l496_e-.L_l496
.L_l496:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l496_e:
.L_D496_e:
.L_D497:
	.uaword	.L_D497_e-.L_D497
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D498
	.uahalf	0x38
	.asciz	"slave_func"
	.uahalf	0x142
	.uaword	.L_T217
	.uahalf	0x83
	.uahalf	.L_t497_e-.L_t497
.L_t497:
	.byte	0x1
	.uaword	.L_T41
.L_t497_e:
	.uahalf	0x23
	.uahalf	.L_l497_e-.L_l497
.L_l497:
	.byte	0x4
	.uaword	0xc
	.byte	0x7
.L_l497_e:
.L_D497_e:
.L_D498:
	.uaword	0x4
.L_D493:
	.uaword	.L_D493_e-.L_D493
	.uahalf	0x15
	.uahalf	0x12
	.uaword	.L_D499
	.L_T41 = .L_D493
.L_D493_e:
.L_D500:
	.uaword	.L_D500_e-.L_D500
	.uahalf	0x18
	.uahalf	0x12
	.uaword	.L_D501
.L_D500_e:
.L_D501:
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_D499:
	.uaword	.L_D499_e-.L_D499
	.uahalf	0x16
	.uahalf	0x12
	.uaword	.L_D502
	.uahalf	0x38
	.asciz	"ANLglobTYPE"
	.uahalf	0x72
	.uaword	.L_T217
.L_D499_e:
	.popsection

	.pushsection	".debug"
.L_D502:
	.uaword	.L_D502_e-.L_D502
	.uahalf	0x4
	.uahalf	0x12
	.uaword	.L_D503
	.L_T220 = .L_D502
	.uahalf	0x38
	.asciz	"error_type"
	.uahalf	0xb6
	.uaword	0x4
	.uahalf	0xf4
	.uaword	.L_e502_e-.L_e502
.L_e502:
	.uaword	0x2
	.asciz	"OUT_OF_RANGE"
	.uaword	0x1
	.asciz	"OUT_OF_HEAP_MEMORY"
	.uaword	0x0
	.asciz	"OUT_OF_SHARED_MEMORY"
.L_e502_e:
.L_D502_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P17
	.asciz	"ANLglob"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	ANLglob
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P17:
.L_D503:
	.uaword	.L_D503_e-.L_D503
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D504
	.uahalf	0x38
	.asciz	"ANLglob"
	.uahalf	0x83
	.uahalf	.L_t503_e-.L_t503
.L_t503:
	.byte	0x1
	.byte	0x4
	.uaword	.L_T217
.L_t503_e:
	.uahalf	0x23
	.uahalf	.L_l503_e-.L_l503
.L_l503:
	.byte	0x3
	.uaword	ANLglob
.L_l503_e:
.L_D503_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P18
	.asciz	"lock_model"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	lock_model
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P18:
.L_D504:
	.uaword	.L_D504_e-.L_D504
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D505
	.uahalf	0x38
	.asciz	"lock_model"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l504_e-.L_l504
.L_l504:
	.byte	0x3
	.uaword	lock_model
.L_l504_e:
.L_D504_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P19
	.asciz	"ANLno_procs"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	ANLno_procs
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P19:
.L_D505:
	.uaword	.L_D505_e-.L_D505
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D506
	.uahalf	0x38
	.asciz	"ANLno_procs"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l505_e-.L_l505
.L_l505:
	.byte	0x3
	.uaword	ANLno_procs
.L_l505_e:
.L_D505_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P20
	.asciz	"proc_id"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	proc_id
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P20:
.L_D506:
	.uaword	.L_D506_e-.L_D506
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D507
	.uahalf	0x38
	.asciz	"proc_id"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l506_e-.L_l506
.L_l506:
	.byte	0x3
	.uaword	proc_id
.L_l506_e:
.L_D506_e:
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
.L_D507:
	.uaword	.L_D507_e-.L_D507
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D508
	.L_T259 = .L_D507
	.uahalf	0x38
	.asciz	"global_memory"
	.uahalf	0xb6
	.uaword	0x480d40
.L_D507_e:
.L_D509:
	.uaword	.L_D509_e-.L_D509
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D510
	.uahalf	0x38
	.asciz	"Index"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l509_e-.L_l509
.L_l509:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l509_e:
.L_D509_e:
.L_D510:
	.uaword	.L_D510_e-.L_D510
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D511
	.uahalf	0x38
	.asciz	"lock_Index"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l510_e-.L_l510
.L_l510:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l510_e:
.L_D510_e:
.L_D511:
	.uaword	.L_D511_e-.L_D511
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D512
	.uahalf	0x38
	.asciz	"rank_lock"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l511_e-.L_l511
.L_l511:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l511_e:
.L_D511_e:
.L_D512:
	.uaword	.L_D512_e-.L_D512
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D513
	.uahalf	0x38
	.asciz	"section_lock"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x83
	.uahalf	.L_t512_e-.L_t512
.L_t512:
	.byte	0x4
	.uaword	.L_T263
.L_t512_e:
	.uahalf	0x23
	.uahalf	.L_l512_e-.L_l512
.L_l512:
	.byte	0x4
	.uaword	0xc
	.byte	0x7
.L_l512_e:
.L_D512_e:
.L_D513:
	.uaword	.L_D513_e-.L_D513
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D514
	.uahalf	0x38
	.asciz	"barrier_rank"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x83
	.uahalf	.L_t513_e-.L_t513
.L_t513:
	.byte	0x4
	.uaword	.L_T279
.L_t513_e:
	.uahalf	0x23
	.uahalf	.L_l513_e-.L_l513
.L_l513:
	.byte	0x4
	.uaword	0x10c
	.byte	0x7
.L_l513_e:
.L_D513_e:
.L_D514:
	.uaword	.L_D514_e-.L_D514
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D515
	.uahalf	0x38
	.asciz	"barrier_key"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x83
	.uahalf	.L_t514_e-.L_t514
.L_t514:
	.byte	0x4
	.uaword	.L_T294
.L_t514_e:
	.uahalf	0x23
	.uahalf	.L_l514_e-.L_l514
.L_l514:
	.byte	0x4
	.uaword	0x118
	.byte	0x7
.L_l514_e:
.L_D514_e:
.L_D515:
	.uaword	.L_D515_e-.L_D515
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D516
	.uahalf	0x38
	.asciz	"ranktime"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x63
	.uahalf	.L_t515_e-.L_t515
.L_t515:
	.byte	0x1
	.uahalf	0xf
.L_t515_e:
	.uahalf	0x23
	.uahalf	.L_l515_e-.L_l515
.L_l515:
	.byte	0x4
	.uaword	0x124
	.byte	0x7
.L_l515_e:
.L_D515_e:
.L_D516:
	.uaword	.L_D516_e-.L_D516
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D517
	.uahalf	0x38
	.asciz	"sorttime"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x63
	.uahalf	.L_t516_e-.L_t516
.L_t516:
	.byte	0x1
	.uahalf	0xf
.L_t516_e:
	.uahalf	0x23
	.uahalf	.L_l516_e-.L_l516
.L_l516:
	.byte	0x4
	.uaword	0x128
	.byte	0x7
.L_l516_e:
.L_D516_e:
.L_D517:
	.uaword	.L_D517_e-.L_D517
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D518
	.uahalf	0x38
	.asciz	"totaltime"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x63
	.uahalf	.L_t517_e-.L_t517
.L_t517:
	.byte	0x1
	.uahalf	0xf
.L_t517_e:
	.uahalf	0x23
	.uahalf	.L_l517_e-.L_l517
.L_l517:
	.byte	0x4
	.uaword	0x12c
	.byte	0x7
.L_l517_e:
.L_D517_e:
.L_D518:
	.uaword	.L_D518_e-.L_D518
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D519
	.uahalf	0x38
	.asciz	"final"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l518_e-.L_l518
.L_l518:
	.byte	0x4
	.uaword	0x130
	.byte	0x7
.L_l518_e:
.L_D518_e:
.L_D519:
	.uaword	.L_D519_e-.L_D519
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D520
	.uahalf	0x38
	.asciz	"starttime"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l519_e-.L_l519
.L_l519:
	.byte	0x4
	.uaword	0x134
	.byte	0x7
.L_l519_e:
.L_D519_e:
.L_D520:
	.uaword	.L_D520_e-.L_D520
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D521
	.uahalf	0x38
	.asciz	"rs"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l520_e-.L_l520
.L_l520:
	.byte	0x4
	.uaword	0x138
	.byte	0x7
.L_l520_e:
.L_D520_e:
.L_D521:
	.uaword	.L_D521_e-.L_D521
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D522
	.uahalf	0x38
	.asciz	"rf"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x55
	.uahalf	0x9
	.uahalf	0x23
	.uahalf	.L_l521_e-.L_l521
.L_l521:
	.byte	0x4
	.uaword	0x13c
	.byte	0x7
.L_l521_e:
.L_D521_e:
.L_D522:
	.uaword	.L_D522_e-.L_D522
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D523
	.uahalf	0x38
	.asciz	"prefix_tree"
	.uahalf	0x142
	.uaword	.L_T259
	.uahalf	0x72
	.uaword	.L_T302
	.uahalf	0x23
	.uahalf	.L_l522_e-.L_l522
.L_l522:
	.byte	0x4
	.uaword	0x140
	.byte	0x7
.L_l522_e:
.L_D522_e:
.L_D523:
	.uaword	0x4
.L_D508:
	.uaword	.L_D508_e-.L_D508
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D524
	.L_T260 = .L_D508
	.uahalf	0x38
	.asciz	"section_lockTYP"
	.uahalf	0xb6
	.uaword	0x4
.L_D508_e:
.L_D525:
	.uaword	.L_D525_e-.L_D525
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D526
	.uahalf	0x38
	.asciz	"lock"
	.uahalf	0x142
	.uaword	.L_T260
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l525_e-.L_l525
.L_l525:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l525_e:
.L_D525_e:
.L_D526:
	.uaword	0x4
.L_D524:
	.uaword	.L_D524_e-.L_D524
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D527
	.L_T263 = .L_D524
	.uahalf	0xa3
	.uahalf	.L_s524_e-.L_s524
.L_s524:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0x3f
	.byte	0x8
	.uahalf	0x72
	.uaword	.L_T260
.L_s524_e:
.L_D524_e:
.L_D527:
	.uaword	.L_D527_e-.L_D527
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D528
	.L_T269 = .L_D527
	.uahalf	0x38
	.asciz	"barrier_rankTYP"
	.uahalf	0xb6
	.uaword	0xc
.L_D527_e:
.L_D529:
	.uaword	.L_D529_e-.L_D529
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D530
	.uahalf	0x38
	.asciz	"lock"
	.uahalf	0x142
	.uaword	.L_T269
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l529_e-.L_l529
.L_l529:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l529_e:
.L_D529_e:
.L_D530:
	.uaword	.L_D530_e-.L_D530
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D531
	.uahalf	0x38
	.asciz	"count"
	.uahalf	0x142
	.uaword	.L_T269
	.uahalf	0x83
	.uahalf	.L_t530_e-.L_t530
.L_t530:
	.byte	0x4
	.uaword	.L_T271
.L_t530_e:
	.uahalf	0x23
	.uahalf	.L_l530_e-.L_l530
.L_l530:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l530_e:
.L_D530_e:
.L_D531:
	.uaword	.L_D531_e-.L_D531
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D532
	.uahalf	0x38
	.asciz	"queue"
	.uahalf	0x142
	.uaword	.L_T269
	.uahalf	0x72
	.uaword	.L_T271
	.uahalf	0x23
	.uahalf	.L_l531_e-.L_l531
.L_l531:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l531_e:
.L_D531_e:
.L_D532:
	.uaword	0x4
.L_D528:
	.uaword	.L_D528_e-.L_D528
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D533
	.L_T279 = .L_D528
	.uahalf	0xa3
	.uahalf	.L_s528_e-.L_s528
.L_s528:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0x0
	.byte	0x8
	.uahalf	0x72
	.uaword	.L_T269
.L_s528_e:
.L_D528_e:
.L_D533:
	.uaword	.L_D533_e-.L_D533
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D534
	.L_T285 = .L_D533
	.uahalf	0x38
	.asciz	"barrier_keyTYP"
	.uahalf	0xb6
	.uaword	0xc
.L_D533_e:
.L_D535:
	.uaword	.L_D535_e-.L_D535
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D536
	.uahalf	0x38
	.asciz	"lock"
	.uahalf	0x142
	.uaword	.L_T285
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l535_e-.L_l535
.L_l535:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l535_e:
.L_D535_e:
.L_D536:
	.uaword	.L_D536_e-.L_D536
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D537
	.uahalf	0x38
	.asciz	"count"
	.uahalf	0x142
	.uaword	.L_T285
	.uahalf	0x83
	.uahalf	.L_t536_e-.L_t536
.L_t536:
	.byte	0x4
	.uaword	.L_T271
.L_t536_e:
	.uahalf	0x23
	.uahalf	.L_l536_e-.L_l536
.L_l536:
	.byte	0x4
	.uaword	0x4
	.byte	0x7
.L_l536_e:
.L_D536_e:
.L_D537:
	.uaword	.L_D537_e-.L_D537
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D538
	.uahalf	0x38
	.asciz	"queue"
	.uahalf	0x142
	.uaword	.L_T285
	.uahalf	0x72
	.uaword	.L_T271
	.uahalf	0x23
	.uahalf	.L_l537_e-.L_l537
.L_l537:
	.byte	0x4
	.uaword	0x8
	.byte	0x7
.L_l537_e:
.L_D537_e:
.L_D538:
	.uaword	0x4
.L_D534:
	.uaword	.L_D534_e-.L_D534
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D539
	.L_T294 = .L_D534
	.uahalf	0xa3
	.uahalf	.L_s534_e-.L_s534
.L_s534:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0x0
	.byte	0x8
	.uahalf	0x72
	.uaword	.L_T285
.L_s534_e:
.L_D534_e:
.L_D539:
	.uaword	.L_D539_e-.L_D539
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D540
	.L_T302 = .L_D539
	.uahalf	0xa3
	.uahalf	.L_s539_e-.L_s539
.L_s539:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0x7f
	.byte	0x8
	.uahalf	0x72
	.uaword	.L_T236
.L_s539_e:
.L_D539_e:
.L_D540:
	.uaword	.L_D540_e-.L_D540
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D541
	.L_T271 = .L_D540
	.uahalf	0xa3
	.uahalf	.L_s540_e-.L_s540
.L_s540:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0x0
	.byte	0x8
	.uahalf	0x55
	.uahalf	0x7
.L_s540_e:
.L_D540_e:
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug"
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P21
	.asciz	"global"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	global
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P21:
.L_D541:
	.uaword	.L_D541_e-.L_D541
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D542
	.uahalf	0x38
	.asciz	"global"
	.uahalf	0x83
	.uahalf	.L_t541_e-.L_t541
.L_t541:
	.byte	0x1
	.uaword	.L_T259
.L_t541_e:
	.uahalf	0x23
	.uahalf	.L_l541_e-.L_l541
.L_l541:
	.byte	0x3
	.uaword	global
.L_l541_e:
.L_D541_e:
	.popsection

	.pushsection	".debug"
.L_D542:
	.uaword	.L_D542_e-.L_D542
	.uahalf	0x13
	.uahalf	0x12
	.uaword	.L_D543
	.L_T304 = .L_D542
	.uahalf	0x38
	.asciz	"global_private"
	.uahalf	0xb6
	.uaword	0x1004
.L_D542_e:
.L_D544:
	.uaword	.L_D544_e-.L_D544
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D545
	.uahalf	0x38
	.asciz	"pad"
	.uahalf	0x142
	.uaword	.L_T304
	.uahalf	0x72
	.uaword	.L_T258
	.uahalf	0x23
	.uahalf	.L_l544_e-.L_l544
.L_l544:
	.byte	0x4
	.uaword	0x0
	.byte	0x7
.L_l544_e:
.L_D544_e:
.L_D545:
	.uaword	.L_D545_e-.L_D545
	.uahalf	0xd
	.uahalf	0x12
	.uaword	.L_D546
	.uahalf	0x38
	.asciz	"rank_ff"
	.uahalf	0x142
	.uaword	.L_T304
	.uahalf	0x63
	.uahalf	.L_t545_e-.L_t545
.L_t545:
	.byte	0x1
	.uahalf	0x7
.L_t545_e:
	.uahalf	0x23
	.uahalf	.L_l545_e-.L_l545
.L_l545:
	.byte	0x4
	.uaword	0x1000
	.byte	0x7
.L_l545_e:
.L_D545_e:
.L_D546:
	.uaword	0x4
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P22
	.asciz	"gp"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	gp
	.uaword	0x40100
	.popsection

	.pushsection	".debug"
.L_D543:
	.uaword	.L_D543_e-.L_D543
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D547
	.L_T309 = .L_D543
	.uahalf	0xa3
	.uahalf	.L_s543_e-.L_s543
.L_s543:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0x3f
	.byte	0x8
	.uahalf	0x72
	.uaword	.L_T304
.L_s543_e:
.L_D543_e:
.L_P22:
.L_D547:
	.uaword	.L_D547_e-.L_D547
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D548
	.uahalf	0x38
	.asciz	"gp"
	.uahalf	0x72
	.uaword	.L_T309
	.uahalf	0x23
	.uahalf	.L_l547_e-.L_l547
.L_l547:
	.byte	0x3
	.uaword	gp
.L_l547_e:
.L_D547_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P23
	.asciz	"key"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	key
	.uaword	0x8
	.popsection

	.pushsection	".debug"
.L_D548:
	.uaword	.L_D548_e-.L_D548
	.uahalf	0x1
	.uahalf	0x12
	.uaword	.L_D549
	.L_T312 = .L_D548
	.uahalf	0xa3
	.uahalf	.L_s548_e-.L_s548
.L_s548:
	.byte	0x0
	.uahalf	0x7
	.uaword	0x0
	.uaword	0x1
	.byte	0x8
	.uahalf	0x63
	.uahalf	.L_t548_e-.L_t548
.L_t548:
	.byte	0x1
	.uahalf	0x7
.L_t548_e:
.L_s548_e:
.L_D548_e:
.L_P23:
.L_D549:
	.uaword	.L_D549_e-.L_D549
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D550
	.uahalf	0x38
	.asciz	"key"
	.uahalf	0x72
	.uaword	.L_T312
	.uahalf	0x23
	.uahalf	.L_l549_e-.L_l549
.L_l549:
	.byte	0x3
	.uaword	key
.L_l549_e:
.L_D549_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P24
	.asciz	"rank_me"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	rank_me
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P24:
.L_D550:
	.uaword	.L_D550_e-.L_D550
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D551
	.uahalf	0x38
	.asciz	"rank_me"
	.uahalf	0x63
	.uahalf	.L_t550_e-.L_t550
.L_t550:
	.byte	0x1
	.byte	0x1
	.uahalf	0x7
.L_t550_e:
	.uahalf	0x23
	.uahalf	.L_l550_e-.L_l550
.L_l550:
	.byte	0x3
	.uaword	rank_me
.L_l550_e:
.L_D550_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P25
	.asciz	"key_partition"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	key_partition
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P25:
.L_D551:
	.uaword	.L_D551_e-.L_D551
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D552
	.uahalf	0x38
	.asciz	"key_partition"
	.uahalf	0x63
	.uahalf	.L_t551_e-.L_t551
.L_t551:
	.byte	0x1
	.uahalf	0x7
.L_t551_e:
	.uahalf	0x23
	.uahalf	.L_l551_e-.L_l551
.L_l551:
	.byte	0x3
	.uaword	key_partition
.L_l551_e:
.L_D551_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P26
	.asciz	"rank_partition"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	rank_partition
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P26:
.L_D552:
	.uaword	.L_D552_e-.L_D552
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D553
	.uahalf	0x38
	.asciz	"rank_partition"
	.uahalf	0x63
	.uahalf	.L_t552_e-.L_t552
.L_t552:
	.byte	0x1
	.uahalf	0x7
.L_t552_e:
	.uahalf	0x23
	.uahalf	.L_l552_e-.L_l552
.L_l552:
	.byte	0x3
	.uaword	rank_partition
.L_l552_e:
.L_D552_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P27
	.asciz	"number_of_processors"
	.popsection

	.pushsection	".debug"
.L_P27:
.L_D553:
	.uaword	.L_D553_e-.L_D553
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D554
	.uahalf	0x38
	.asciz	"number_of_processors"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l553_e-.L_l553
.L_l553:
	.byte	0x3
	.uaword	number_of_processors
.L_l553_e:
.L_D553_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P28
	.asciz	"max_num_digits"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	max_num_digits
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P28:
.L_D554:
	.uaword	.L_D554_e-.L_D554
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D555
	.uahalf	0x38
	.asciz	"max_num_digits"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l554_e-.L_l554
.L_l554:
	.byte	0x3
	.uaword	max_num_digits
.L_l554_e:
.L_D554_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P29
	.asciz	"radix"
	.popsection

	.pushsection	".debug"
.L_P29:
.L_D555:
	.uaword	.L_D555_e-.L_D555
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D556
	.uahalf	0x38
	.asciz	"radix"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l555_e-.L_l555
.L_l555:
	.byte	0x3
	.uaword	radix
.L_l555_e:
.L_D555_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P30
	.asciz	"num_keys"
	.popsection

	.pushsection	".debug"
.L_P30:
.L_D556:
	.uaword	.L_D556_e-.L_D556
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D557
	.uahalf	0x38
	.asciz	"num_keys"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l556_e-.L_l556
.L_l556:
	.byte	0x3
	.uaword	num_keys
.L_l556_e:
.L_D556_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P31
	.asciz	"max_key"
	.popsection

	.pushsection	".debug"
.L_P31:
.L_D557:
	.uaword	.L_D557_e-.L_D557
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D558
	.uahalf	0x38
	.asciz	"max_key"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l557_e-.L_l557
.L_l557:
	.byte	0x3
	.uaword	max_key
.L_l557_e:
.L_D557_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P32
	.asciz	"log2_radix"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	log2_radix
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P32:
.L_D558:
	.uaword	.L_D558_e-.L_D558
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D559
	.uahalf	0x38
	.asciz	"log2_radix"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l558_e-.L_l558
.L_l558:
	.byte	0x3
	.uaword	log2_radix
.L_l558_e:
.L_D558_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P33
	.asciz	"log2_keys"
	.popsection

	.pushsection	".debug_aranges"
	.uaword	log2_keys
	.uaword	0x4
	.popsection

	.pushsection	".debug"
.L_P33:
.L_D559:
	.uaword	.L_D559_e-.L_D559
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D560
	.uahalf	0x38
	.asciz	"log2_keys"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l559_e-.L_l559
.L_l559:
	.byte	0x3
	.uaword	log2_keys
.L_l559_e:
.L_D559_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P34
	.asciz	"dostats"
	.popsection

	.pushsection	".debug"
.L_P34:
.L_D560:
	.uaword	.L_D560_e-.L_D560
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D561
	.uahalf	0x38
	.asciz	"dostats"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l560_e-.L_l560
.L_l560:
	.byte	0x3
	.uaword	dostats
.L_l560_e:
.L_D560_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P35
	.asciz	"test_result"
	.popsection

	.pushsection	".debug"
.L_P35:
.L_D561:
	.uaword	.L_D561_e-.L_D561
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D562
	.uahalf	0x38
	.asciz	"test_result"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l561_e-.L_l561
.L_l561:
	.byte	0x3
	.uaword	test_result
.L_l561_e:
.L_D561_e:
	.popsection

	.pushsection	".debug_pubnames"
	.uaword	.L_P36
	.asciz	"doprint"
	.popsection

	.pushsection	".debug"
.L_P36:
.L_D562:
	.uaword	.L_D562_e-.L_D562
	.uahalf	0x7
	.uahalf	0x12
	.uaword	.L_D563
	.uahalf	0x38
	.asciz	"doprint"
	.uahalf	0x55
	.uahalf	0x7
	.uahalf	0x23
	.uahalf	.L_l562_e-.L_l562
.L_l562:
	.byte	0x3
	.uaword	doprint
.L_l562_e:
.L_D562_e:
	.popsection

	.pushsection	".debug"
.L_D563:
	.uaword	.L_D563_e-.L_D563
	.align 4
.L_D563_e:
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
	.ident	"GCC: (GNU) 2.7.0"
