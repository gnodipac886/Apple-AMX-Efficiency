	.arch armv8-a
	.text
	.align	2
	.p2align 4,,11
	.globl __amx_set
__amx_set:
LFB14:
; 125 "amx.h" 1
	nop
nop
nop
.word (0x201000 + (17 << 5) + 0)
; 0 "" 2
	ret
LFE14:
	.align	2
	.p2align 4,,11
	.globl __amx_clr
__amx_clr:
LFB15:
; 130 "amx.h" 1
	nop
nop
nop
.word (0x201000 + (17 << 5) + 1)
; 0 "" 2
	ret
LFE15:
	.align	2
	.p2align 4,,11
	.globl __amx_ldx
__amx_ldx:
LFB16:
; 135 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE16:
	.align	2
	.p2align 4,,11
	.globl __amx_ldy
__amx_ldy:
LFB17:
; 136 "amx.h" 1
	.word (0x201000 + (1 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE17:
	.align	2
	.p2align 4,,11
	.globl __amx_stx
__amx_stx:
LFB18:
; 137 "amx.h" 1
	.word (0x201000 + (2 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE18:
	.align	2
	.p2align 4,,11
	.globl __amx_sty
__amx_sty:
LFB19:
; 138 "amx.h" 1
	.word (0x201000 + (3 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE19:
	.align	2
	.p2align 4,,11
	.globl __amx_ldz
__amx_ldz:
LFB20:
; 139 "amx.h" 1
	.word (0x201000 + (4 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE20:
	.align	2
	.p2align 4,,11
	.globl __amx_stz
__amx_stz:
LFB21:
; 140 "amx.h" 1
	.word (0x201000 + (5 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE21:
	.align	2
	.p2align 4,,11
	.globl __amx_ldzi
__amx_ldzi:
LFB22:
; 141 "amx.h" 1
	.word (0x201000 + (6 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE22:
	.align	2
	.p2align 4,,11
	.globl __amx_stzi
__amx_stzi:
LFB23:
; 142 "amx.h" 1
	.word (0x201000 + (7 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE23:
	.align	2
	.p2align 4,,11
	.globl __amx_extrx
__amx_extrx:
LFB24:
; 143 "amx.h" 1
	.word (0x201000 + (8 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE24:
	.align	2
	.p2align 4,,11
	.globl __amx_extry
__amx_extry:
LFB25:
; 144 "amx.h" 1
	.word (0x201000 + (9 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE25:
	.align	2
	.p2align 4,,11
	.globl __amx_fma64
__amx_fma64:
LFB26:
; 145 "amx.h" 1
	.word (0x201000 + (10 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE26:
	.align	2
	.p2align 4,,11
	.globl __amx_fms64
__amx_fms64:
LFB27:
; 146 "amx.h" 1
	.word (0x201000 + (11 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE27:
	.align	2
	.p2align 4,,11
	.globl __amx_fma32
__amx_fma32:
LFB28:
; 147 "amx.h" 1
	.word (0x201000 + (12 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE28:
	.align	2
	.p2align 4,,11
	.globl __amx_fms32
__amx_fms32:
LFB29:
; 148 "amx.h" 1
	.word (0x201000 + (13 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE29:
	.align	2
	.p2align 4,,11
	.globl __amx_mac16
__amx_mac16:
LFB30:
; 149 "amx.h" 1
	.word (0x201000 + (14 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE30:
	.align	2
	.p2align 4,,11
	.globl __amx_fma16
__amx_fma16:
LFB31:
; 150 "amx.h" 1
	.word (0x201000 + (15 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE31:
	.align	2
	.p2align 4,,11
	.globl __amx_fms16
__amx_fms16:
LFB32:
; 151 "amx.h" 1
	.word (0x201000 + (16 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE32:
	.align	2
	.p2align 4,,11
	.globl __amx_vecint
__amx_vecint:
LFB33:
; 152 "amx.h" 1
	.word (0x201000 + (18 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE33:
	.align	2
	.p2align 4,,11
	.globl __amx_vecfp
__amx_vecfp:
LFB34:
; 153 "amx.h" 1
	.word (0x201000 + (19 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE34:
	.align	2
	.p2align 4,,11
	.globl __amx_matint
__amx_matint:
LFB35:
; 154 "amx.h" 1
	.word (0x201000 + (20 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE35:
	.align	2
	.p2align 4,,11
	.globl __amx_matfp
__amx_matfp:
LFB36:
; 155 "amx.h" 1
	.word (0x201000 + (21 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE36:
	.align	2
	.p2align 4,,11
	.globl __amx_genlut
__amx_genlut:
LFB37:
; 156 "amx.h" 1
	.word (0x201000 + (22 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ret
LFE37:
	.align	2
	.p2align 4,,11
	.globl __amx_ldx_align
__amx_ldx_align:
LFB38:
	stp	x29, x30, [sp, -32]!
LCFI0:
	mov	x29, sp
	stp	x19, x20, [sp, 16]
LCFI1:
	mov	x20, x1
	mov	x19, x0
	mov	x0, 128
	bl	_aligned_alloc
	mov	x2, x20
	mov	x1, x19
	mov	x20, x0
	bl	_memcpy
; 161 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x19 - ((0x19 >> 4) * 6))
; 0 "" 2
	mov	x0, x20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
LCFI2:
	b	_free
LFE38:
	.align	2
	.p2align 4,,11
	.globl __amx_ldy_align
__amx_ldy_align:
LFB39:
	stp	x29, x30, [sp, -32]!
LCFI3:
	mov	x29, sp
	stp	x19, x20, [sp, 16]
LCFI4:
	mov	x20, x1
	mov	x19, x0
	mov	x0, 128
	bl	_aligned_alloc
	mov	x2, x20
	mov	x1, x19
	mov	x20, x0
	bl	_memcpy
; 168 "amx.h" 1
	.word (0x201000 + (1 << 5) + 0x19 - ((0x19 >> 4) * 6))
; 0 "" 2
	mov	x0, x20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
LCFI5:
	b	_free
LFE39:
	.align	2
	.p2align 4,,11
	.globl _amx_store_z
_amx_store_z:
LFB40:
	stp	x29, x30, [sp, -48]!
LCFI6:
	mov	x29, sp
	stp	x19, x20, [sp, 16]
LCFI7:
	mov	x19, x0
	mov	w20, w2
	mov	x0, 128
	str	x21, [sp, 32]
LCFI8:
	mov	w21, w1
	mov	x1, 4096
	bl	_aligned_alloc
	mov	x4, x0
	mov	x3, x0
	mov	x1, 0
	mov	x6, 144115188075855872
	mov	x5, 4611686018427387904
	.p2align 3,,7
L31:
	orr	x2, x1, x3
	orr	x2, x2, 4611686018427387904
; 177 "amx.h" 1
	.word (0x201000 + (5 << 5) + 0x2 - ((0x2 >> 4) * 6))
; 0 "" 2
	add	x1, x1, x6
	add	x3, x3, 128
	cmp	x1, x5
	bne	L31
	cbz	w21, L32
	mov	x1, x19
	add	x3, x19, 4096
	mov	x2, x0
	.p2align 3,,7
L33:
	ldp	q3, q2, [x2]
	ldp	q7, q6, [x2, 64]
	ldp	q1, q0, [x2, 32]
	ldp	q5, q4, [x2, 96]
	add	x2, x2, 128
	zip1	v16.4s, v3.4s, v7.4s
	zip2	v3.4s, v3.4s, v7.4s
	zip1	v7.4s, v2.4s, v6.4s
	zip2	v2.4s, v2.4s, v6.4s
	zip1	v6.4s, v1.4s, v5.4s
	zip2	v1.4s, v1.4s, v5.4s
	stp	q16, q3, [x1]
	zip1	v3.4s, v0.4s, v4.4s
	stp	q7, q2, [x1, 32]
	zip2	v0.4s, v0.4s, v4.4s
	stp	q6, q1, [x1, 64]
	stp	q3, q0, [x1, 96]
	add	x1, x1, 128
	cmp	x1, x3
	bne	L33
L32:
	cbz	w20, L34
	mov	w5, 64
	sdiv	w3, w5, w20
	cmp	w3, 0
	ble	L34
	lsl	w2, w20, 6
	smaddl	x3, w3, w5, x19
	mov	x1, x19
	sxtw	x2, w2
	.p2align 3,,7
L35:
	ldp	q0, q1, [x4]
	ldp	q4, q5, [x4, 32]
	ldp	q2, q3, [x4, 64]
	stp	q0, q1, [x1]
	ldp	q0, q1, [x4, 96]
	stp	q4, q5, [x1, 32]
	add	x4, x4, x2
	stp	q2, q3, [x1, 64]
	stp	q0, q1, [x1, 96]
	add	x1, x1, 64
	cmp	x3, x1
	bne	L35
L34:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
LCFI9:
	b	_free
LFE40:
	.align	2
	.p2align 4,,11
	.globl _amx_load_xy_reg
_amx_load_xy_reg:
LFB41:
	stp	x29, x30, [sp, -48]!
LCFI10:
	mov	x29, sp
	stp	x19, x20, [sp, 16]
LCFI11:
	mov	w19, w1
	mov	w20, w2
	str	x21, [sp, 32]
LCFI12:
	mov	x1, x0
	sbfiz	x5, x19, 6, 32
	mov	x21, x4
	cbnz	w3, L47
	adrp	x0, _amx_x_reg@PAGE
	add	x0, x0, _amx_x_reg@PAGEOFF;momd
	add	x5, x5, x0
	lsl	w2, w2, 6
	mov	x0, x5
	sxtw	x2, w2
	bl	_memcpy
	cmp	w20, 0
	ble	L46
	sub	w6, w20, #1
	add	w2, w19, 2
	and	w6, w6, -2
	mov	w1, w19
	add	w6, w6, w2
	add	w2, w20, w19
	.p2align 3,,7
L56:
	orr	x4, x0, x21
	ubfiz	x3, x1, 56, 3
	orr	x3, x3, x4
	sub	w5, w2, w1
	orr	x4, x3, 4611686018427387904
	cmp	w5, 1
	csel	x3, x4, x3, ne
; 221 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x3 - ((0x3 >> 4) * 6))
; 0 "" 2
	add	w1, w1, 2
	add	x0, x0, 128
	cmp	w1, w6
	bne	L56
L46:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
LCFI13:
	ret
	.p2align 2,,3
L47:
LCFI14:
	adrp	x0, _amx_y_reg@PAGE
	add	x0, x0, _amx_y_reg@PAGEOFF;momd
	add	x5, x5, x0
	lsl	w2, w2, 6
	mov	x0, x5
	sxtw	x2, w2
	bl	_memcpy
	cmp	w20, 0
	ble	L46
	sub	w6, w20, #1
	add	w2, w19, 2
	and	w6, w6, -2
	mov	w1, w19
	add	w6, w6, w2
	add	w2, w20, w19
	.p2align 3,,7
L52:
	orr	x4, x21, x0
	ubfiz	x3, x1, 56, 3
	orr	x3, x3, x4
	sub	w5, w2, w1
	orr	x4, x3, 4611686018427387904
	cmp	w5, 1
	csel	x3, x4, x3, ne
; 223 "amx.h" 1
	.word (0x201000 + (1 << 5) + 0x3 - ((0x3 >> 4) * 6))
; 0 "" 2
	add	w1, w1, 2
	add	x0, x0, 128
	cmp	w1, w6
	bne	L52
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
LCFI15:
	ret
LFE41:
	.cstring
	.align	3
lC0:
	.ascii "%.3f  \0"
	.text
	.align	2
	.p2align 4,,11
	.globl _print_fpmatrix
_print_fpmatrix:
LFB42:
	cmp	w1, 0
	ble	L81
	sub	sp, sp, #112
LCFI16:
	stp	x29, x30, [sp, 16]
LCFI17:
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
LCFI18:
	mov	w22, w2
	stp	x23, x24, [sp, 64]
LCFI19:
	mov	w23, w1
	mov	x24, x0
	cmp	x3, 4
	beq	L85
	cmp	x3, 8
	beq	L66
	mov	w19, 0
	.p2align 3,,7
L67:
	mov	w0, 10
	add	w19, w19, 1
	bl	_putchar
	cmp	w23, w19
	bne	L67
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldp	x21, x22, [sp, 48]
	ldp	x23, x24, [sp, 64]
	add	sp, sp, 112
LCFI20:
	ret
L85:
LCFI21:
	adrp	x21, lC0@PAGE
	add	x21, x21, lC0@PAGEOFF;momd
	str	x27, [sp, 96]
LCFI22:
	sxtw	x27, w2
	stp	x25, x26, [sp, 80]
LCFI23:
	mov	w25, 0
	mov	w26, 0
	.p2align 3,,7
L65:
	cmp	w22, 0
	ble	L74
	add	x20, x27, w25, sxtw
	add	x19, x24, w25, sxtw 2
	add	x20, x24, x20, lsl 2
	.p2align 3,,7
L72:
	ldr	s0, [x19], 4
	mov	x0, x21
	fcvt	d0, s0
	str	d0, [sp]
	bl	_printf
	cmp	x20, x19
	bne	L72
L74:
	mov	w0, 10
	add	w26, w26, 1
	bl	_putchar
	add	w25, w25, w22
	cmp	w23, w26
	bne	L65
	ldp	x25, x26, [sp, 80]
LCFI24:
	ldr	x27, [sp, 96]
LCFI25:
L86:
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldp	x21, x22, [sp, 48]
	ldp	x23, x24, [sp, 64]
	add	sp, sp, 112
LCFI26:
	ret
L66:
LCFI27:
	adrp	x21, lC0@PAGE
	add	x21, x21, lC0@PAGEOFF;momd
	str	x27, [sp, 96]
LCFI28:
	sxtw	x27, w2
	stp	x25, x26, [sp, 80]
LCFI29:
	mov	w25, 0
	mov	w26, 0
	.p2align 3,,7
L71:
	cmp	w22, 0
	ble	L69
	add	x20, x27, w25, sxtw
	add	x19, x24, w25, sxtw 3
	add	x20, x24, x20, lsl 3
	.p2align 3,,7
L70:
	ldr	d0, [x19], 8
	mov	x0, x21
	str	d0, [sp]
	bl	_printf
	cmp	x19, x20
	bne	L70
L69:
	mov	w0, 10
	add	w26, w26, 1
	bl	_putchar
	add	w25, w25, w22
	cmp	w23, w26
	bne	L71
	ldp	x25, x26, [sp, 80]
LCFI30:
	ldr	x27, [sp, 96]
LCFI31:
	b	L86
L81:
LCFI32:
	ret
LFE42:
	.align	2
	.p2align 4,,11
	.globl _set_random_matrix_fp32
_set_random_matrix_fp32:
LFB43:
	stp	x29, x30, [sp, -64]!
LCFI33:
	mov	x29, sp
	stp	x19, x20, [sp, 16]
LCFI34:
	mov	x20, x0
	mov	x0, 0
	stp	x21, x22, [sp, 32]
LCFI35:
	mov	w22, w2
	str	x23, [sp, 48]
LCFI36:
	mov	w23, w1
	bl	_time
	bl	_srand
	cmp	w23, 0
	ble	L87
	cmp	w22, 0
	ble	L87
	sbfiz	x22, x22, 2, 32
	mov	w21, 0
	add	x20, x20, x22
	.p2align 3,,7
L89:
	sub	x19, x20, x22
	.p2align 3,,7
L90:
	bl	_rand
	scvtf	s0, w0
	str	s0, [x19], 4
	cmp	x19, x20
	bne	L90
	add	w21, w21, 1
	add	x20, x20, x22
	cmp	w23, w21
	bne	L89
L87:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
LCFI37:
	ret
LFE43:
	.align	2
	.p2align 4,,11
	.globl _set_random_vector_fp32
_set_random_vector_fp32:
LFB44:
	stp	x29, x30, [sp, -32]!
LCFI38:
	mov	x29, sp
	stp	x19, x20, [sp, 16]
LCFI39:
	mov	w20, w1
	mov	x19, x0
	mov	x0, 0
	bl	_time
	bl	_srand
	cmp	w20, 0
	ble	L93
	add	x20, x19, w20, sxtw 2
	.p2align 3,,7
L95:
	bl	_rand
	scvtf	s0, w0
	str	s0, [x19], 4
	cmp	x19, x20
	bne	L95
L93:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
LCFI40:
	ret
LFE44:
	.align	2
	.p2align 4,,11
	.globl _set_matrix_fp32
_set_matrix_fp32:
LFB45:
	cmp	w1, 0
	ble	L98
	cmp	w2, 0
	ble	L98
	lsr	w9, w2, 2
	sbfiz	x11, x2, 2, 32
	dup	v1.4s, v0.s[0]
	mov	x6, x0
	sub	w10, w2, #1
	lsl	x9, x9, 4
	and	w13, w2, -4
	and	w12, w2, 3
	mov	w5, 0
	mov	w7, 0
	.p2align 3,,7
L100:
	add	x4, x9, x6
	mov	x3, x6
	cmp	w10, 2
	bls	L111
	.p2align 3,,7
L101:
	str	q1, [x3], 16
	cmp	x3, x4
	bne	L101
	mov	w3, w13
	cbz	w12, L102
L103:
	add	w8, w5, w3
	add	w4, w3, 1
	str	s0, [x0, w8, sxtw 2]
	cmp	w2, w4
	ble	L102
	add	w4, w5, w4
	add	w3, w3, 2
	str	s0, [x0, w4, sxtw 2]
	cmp	w2, w3
	ble	L102
	add	w3, w5, w3
	str	s0, [x0, w3, sxtw 2]
L102:
	add	w7, w7, 1
	add	w5, w5, w2
	add	x6, x6, x11
	cmp	w1, w7
	bne	L100
L98:
	ret
L111:
	mov	w3, 0
	b	L103
LFE45:
	.align	2
	.p2align 4,,11
	.globl _set_vector_fp32
_set_vector_fp32:
LFB46:
	cmp	w1, 0
	ble	L112
	sub	w2, w1, #1
	cmp	w2, 2
	bls	L117
	lsr	w3, w1, 2
	mov	x2, x0
	dup	v1.4s, v0.s[0]
	add	x3, x0, w3, uxtw 4
	.p2align 3,,7
L115:
	str	q1, [x2], 16
	cmp	x2, x3
	bne	L115
	and	w2, w1, -4
	cmp	w1, w2
	beq	L112
L114:
	add	w3, w2, 1
	str	s0, [x0, w2, sxtw 2]
	sbfiz	x4, x2, 2, 32
	cmp	w1, w3
	ble	L112
	add	x0, x0, x4
	add	w2, w2, 2
	str	s0, [x0, 4]
	cmp	w1, w2
	ble	L112
	str	s0, [x0, 8]
L112:
	ret
L117:
	mov	w2, 0
	b	L114
LFE46:
	.align	2
	.p2align 4,,11
	.globl _set_eye_matrix_fp32
_set_eye_matrix_fp32:
LFB47:
	cmp	w1, 0
	ble	L119
	cmp	w2, 0
	ble	L119
	lsr	w10, w2, 2
	sub	w11, w2, #1
	and	w8, w2, -4
	lsl	x10, x10, 4
	cmp	w11, 2
	bls	L132
	mov	w7, 0
	mov	w5, 0
	mov	w6, 0
	.p2align 3,,7
L129:
	movi	v4.4s, 0x4
	fmov	v3.4s, 1.0e+0
L128:
	adrp	x9, lC1@PAGE
	add	x3, x0, w6, sxtw 2
	dup	v2.4s, w5
	add	x4, x10, x3
	ldr	q1, [x9, #lC1@PAGEOFF]
	.p2align 3,,7
L122:
	mov	v0.16b, v1.16b
	add	v1.4s, v1.4s, v4.4s
	cmeq	v0.4s, v0.4s, v2.4s
	and	v0.16b, v0.16b, v3.16b
	str	q0, [x3], 16
	cmp	x3, x4
	bne	L122
	cmp	w2, w8
	beq	L123
	add	w9, w6, w8
	add	x9, x0, w9, sxtw 2
	cmp	w5, w8
	beq	L133
	mov	w3, w8
L130:
	add	w4, w3, 1
	str	wzr, [x9]
	cmp	w2, w4
	ble	L124
	movi	v1.2s, #0
	cmp	w4, w5
	fmov	s0, 1.0e+0
	add	w4, w6, w4
	add	x4, x0, w4, sxtw 2
	fcsel	s0, s0, s1, eq
L125:
	add	w3, w3, 2
	str	s0, [x4]
	cmp	w3, w2
	bge	L124
	movi	v1.2s, #0
	cmp	w3, w5
	fmov	s0, 1.0e+0
	add	w3, w3, w6
	fcsel	s0, s0, s1, eq
	str	s0, [x0, w3, sxtw 2]
L124:
	add	w5, w5, 1
	add	w7, w7, w2
	cmp	w5, w1
	beq	L119
	mov	w6, w7
	cmp	w11, 2
	bhi	L129
	add	x9, x0, w7, sxtw 2
	mov	w3, 0
	b	L130
	.p2align 2,,3
L123:
	add	w5, w5, 1
	add	w7, w7, w2
	cmp	w1, w5
	beq	L119
	mov	w6, w7
	b	L128
	.p2align 2,,3
L133:
	mov	w3, w5
L121:
	fmov	s0, 1.0e+0
	add	w4, w3, 1
	str	s0, [x9]
	cmp	w2, w4
	ble	L124
	add	w4, w6, w4
	movi	v0.2s, #0
	add	x4, x0, w4, sxtw 2
	b	L125
	.p2align 2,,3
L119:
	ret
L132:
	mov	x9, x0
	mov	w3, 0
	mov	w7, 0
	mov	w5, 0
	mov	w6, 0
	b	L121
LFE47:
	.align	2
	.p2align 4,,11
	.globl _gemm_fp32
_gemm_fp32:
LFB48:
	cmp	w3, 0
	ble	L146
	mov	w13, w5
	cmp	w5, 0
	ble	L146
	mov	w14, w4
	cmp	w4, 0
	ble	L146
	stp	x29, x30, [sp, -16]!
LCFI41:
	sxtw	x8, w5
	mov	w15, w3
	mov	x12, x0
	mov	x16, x1
	mov	x17, x2
	sbfiz	x5, x5, 2, 32
	sxtw	x30, w4
	mov	w11, 0
	mov	w9, 0
	mov	w10, 0
	mov	x29, sp
	.p2align 3,,7
L139:
	add	x4, x30, w9, sxtw
	mov	x6, x16
	add	x3, x17, w11, sxtw 2
	add	x7, x12, w9, sxtw 2
	add	x4, x12, x4, lsl 2
	mov	x2, 0
	.p2align 3,,7
L142:
	ldr	s0, [x3, x2, lsl 2]
	mov	x1, x6
	mov	x0, x7
	.p2align 3,,7
L140:
	ldr	s1, [x1]
	add	x1, x1, x5
	ldr	s2, [x0], 4
	fmadd	s0, s2, s1, s0
	str	s0, [x3, x2, lsl 2]
	cmp	x4, x0
	bne	L140
	add	x2, x2, 1
	add	x6, x6, 4
	cmp	x2, x8
	bne	L142
	add	w10, w10, 1
	add	w9, w9, w14
	add	w11, w11, w13
	cmp	w15, w10
	bne	L139
	ldp	x29, x30, [sp], 16
LCFI42:
	ret
L146:
	ret
LFE48:
	.align	2
	.p2align 4,,11
	.globl _compare_matrix_fp32
_compare_matrix_fp32:
LFB49:
	cmp	w2, 0
	ble	L167
	lsr	w10, w3, 2
	and	w17, w3, -4
	movi	v5.2s, #0
	add	w12, w17, 1
	fmov	v16.4s, 1.0e+0
	add	w13, w17, 2
	movi	v7.4s, 0x4
	lsl	x10, x10, 4
	sub	w16, w3, #1
	sxtw	x15, w3
	and	w14, w3, 3
	mov	x5, x0
	mov	w9, 0
	mov	w11, 0
	mov	w0, 1
	fmov	s6, 1.0e+0
L183:
	cmp	w3, 0
	ble	L188
	stp	x29, x30, [sp, -16]!
LCFI43:
	mov	x29, sp
	.p2align 3,,7
L165:
	sxtw	x4, w9
	cmp	w16, 4
	bls	L152
	add	x8, x4, 4
	lsl	x8, x8, 2
	sub	x6, x8, #16
	add	x30, x5, x8
	add	x7, x1, x6
	add	x8, x1, x8
	add	x6, x5, x6
	cmp	x30, x7
	ccmp	x8, x6, 0, hi
	bls	L189
L152:
	add	x6, x15, x4
	lsl	x4, x4, 2
	lsl	x6, x6, 2
	.p2align 3,,7
L163:
	ldr	s1, [x5, x4]
	ldr	s0, [x1, x4]
	fcmp	s1, s0
	fcsel	s0, s6, s5, eq
	str	s0, [x1, x4]
	ldr	s1, [x5, x4]
	add	x4, x4, 4
	fcmp	s0, s1
	csel	w0, w0, wzr, eq
	cmp	x6, x4
	bne	L163
L166:
	add	w11, w11, 1
	add	w9, w9, w3
	cmp	w2, w11
	beq	L149
L190:
	cmp	w3, 0
	bgt	L165
	add	w11, w11, 1
	add	w9, w9, w3
	cmp	w2, w11
	bne	L190
L149:
	ldp	x29, x30, [sp], 16
LCFI44:
	ret
	.p2align 2,,3
L189:
LCFI45:
	dup	v3.4s, w0
	adrp	x0, lC2@PAGE
	movi	v2.4s, 0
	mov	x4, 0
	ldr	q4, [x0, #lC2@PAGEOFF]
L153:
	ldr	q0, [x7, x4]
	ldr	q1, [x6, x4]
	fcmeq	v1.4s, v1.4s, v0.4s
	and	v1.16b, v1.16b, v16.16b
	str	q1, [x7, x4]
	ldr	q0, [x6, x4]
	add	x4, x4, 16
	fcmeq	v0.4s, v0.4s, v1.4s
	not	v0.16b, v0.16b
	bit	v2.16b, v4.16b, v0.16b
	bic	v3.16b, v3.16b, v0.16b
	add	v4.4s, v4.4s, v7.4s
	cmp	x10, x4
	bne	L153
	umaxv	s0, v2.4s
	dup	v0.4s, v0.s[0]
	cmeq	v2.4s, v2.4s, v0.4s
	and	v3.16b, v3.16b, v2.16b
	umaxv	s3, v3.4s
	fmov	w0, s3
	cbz	w14, L166
	add	w4, w9, w17
	sxtw	x4, w4
	ldr	s1, [x5, x4, lsl 2]
	ldr	s0, [x1, x4, lsl 2]
	fcmp	s1, s0
	fcsel	s0, s6, s5, eq
	str	s0, [x1, x4, lsl 2]
	ldr	s1, [x5, x4, lsl 2]
	fcmp	s1, s0
	csel	w0, w0, wzr, eq
	cmp	w12, w3
	bge	L166
	add	w4, w9, w12
	sxtw	x4, w4
	ldr	s1, [x5, x4, lsl 2]
	ldr	s0, [x1, x4, lsl 2]
	fcmp	s1, s0
	fcsel	s0, s6, s5, eq
	str	s0, [x1, x4, lsl 2]
	ldr	s1, [x5, x4, lsl 2]
	fcmp	s0, s1
	csel	w0, w0, wzr, eq
	cmp	w3, w13
	ble	L166
	add	w4, w9, w13
	sxtw	x4, w4
	ldr	s1, [x5, x4, lsl 2]
	ldr	s0, [x1, x4, lsl 2]
	fcmp	s1, s0
	fcsel	s0, s6, s5, eq
	str	s0, [x1, x4, lsl 2]
	ldr	s1, [x5, x4, lsl 2]
	fcmp	s0, s1
	csel	w0, w0, wzr, eq
	b	L166
L188:
LCFI46:
	add	w11, w11, 1
	add	w9, w9, w3
	cmp	w2, w11
	bne	L183
	ret
L167:
	mov	w0, 1
	ret
LFE49:
	.align	2
	.p2align 4,,11
	.globl _matrix_transpose_fp32
_matrix_transpose_fp32:
LFB50:
	cmp	w2, 0
	ble	L191
	cmp	w3, 0
	ble	L191
	cmp	x4, 4
	beq	L204
	cmp	x4, 8
	beq	L205
L191:
	ret
L204:
	mov	x8, x1
	sbfiz	x7, x2, 2, 32
	sxtw	x11, w3
	mov	w9, 0
	mov	w10, 0
	.p2align 3,,7
L195:
	add	x6, x11, w9, sxtw
	add	x4, x0, w9, sxtw 2
	mov	x1, x8
	add	x6, x0, x6, lsl 2
	.p2align 3,,7
L198:
	ldr	w5, [x4], 4
	str	w5, [x1]
	add	x1, x1, x7
	cmp	x6, x4
	bne	L198
	add	w10, w10, 1
	add	w9, w9, w3
	add	x8, x8, 4
	cmp	w2, w10
	bne	L195
	ret
L205:
	mov	x7, x1
	sbfiz	x8, x2, 3, 32
	sxtw	x11, w3
	mov	w9, 0
	mov	w10, 0
	.p2align 3,,7
L197:
	add	x6, x11, w9, sxtw
	add	x4, x0, w9, sxtw 3
	mov	x1, x7
	add	x6, x0, x6, lsl 3
	.p2align 3,,7
L196:
	ldr	x5, [x4], 8
	str	x5, [x1]
	add	x1, x1, x8
	cmp	x6, x4
	bne	L196
	add	w10, w10, 1
	add	w9, w9, w3
	add	x7, x7, 8
	cmp	w2, w10
	bne	L197
	ret
LFE50:
	.cstring
	.align	3
lC3:
	.ascii "Dumping AMX x reg[%d]: \0"
	.align	3
lC4:
	.ascii "%.3f \0"
	.text
	.align	2
	.p2align 4,,11
	.globl _amx_fp32_dump_x_reg
_amx_fp32_dump_x_reg:
LFB51:
	sub	sp, sp, #192
LCFI47:
	ubfiz	x1, x0, 56, 3
	stp	x29, x30, [sp, 16]
LCFI48:
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
LCFI49:
	add	x19, sp, 64
	orr	x1, x1, x19
	str	x21, [sp, 48]
LCFI50:
; 8 "amx_fp32.h" 1
	.word (0x201000 + (2 << 5) + 0x1 - ((0x1 >> 4) * 6))
; 0 "" 2
	str	w0, [sp]
	adrp	x20, lC4@PAGE
	adrp	x0, lC3@PAGE
	add	x21, sp, 128
	add	x20, x20, lC4@PAGEOFF;momd
	add	x0, x0, lC3@PAGEOFF;momd
	bl	_printf
	.p2align 3,,7
L207:
	ldr	s0, [x19], 4
	mov	x0, x20
	fcvt	d0, s0
	str	d0, [sp]
	bl	_printf
	cmp	x21, x19
	bne	L207
	mov	w0, 10
	bl	_putchar
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldr	x21, [sp, 48]
	add	sp, sp, 192
LCFI51:
	ret
LFE51:
	.cstring
	.align	3
lC5:
	.ascii "Dumping AMX y reg[%d]: \0"
	.text
	.align	2
	.p2align 4,,11
	.globl _amx_fp32_dump_y_reg
_amx_fp32_dump_y_reg:
LFB52:
	sub	sp, sp, #192
LCFI52:
	ubfiz	x1, x0, 56, 3
	stp	x29, x30, [sp, 16]
LCFI53:
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
LCFI54:
	add	x19, sp, 64
	orr	x1, x1, x19
	str	x21, [sp, 48]
LCFI55:
; 19 "amx_fp32.h" 1
	.word (0x201000 + (3 << 5) + 0x1 - ((0x1 >> 4) * 6))
; 0 "" 2
	str	w0, [sp]
	adrp	x20, lC4@PAGE
	adrp	x0, lC5@PAGE
	add	x21, sp, 128
	add	x20, x20, lC4@PAGEOFF;momd
	add	x0, x0, lC5@PAGEOFF;momd
	bl	_printf
	.p2align 3,,7
L211:
	ldr	s0, [x19], 4
	mov	x0, x20
	fcvt	d0, s0
	str	d0, [sp]
	bl	_printf
	cmp	x21, x19
	bne	L211
	mov	w0, 10
	bl	_putchar
	ldp	x29, x30, [sp, 16]
	ldp	x19, x20, [sp, 32]
	ldr	x21, [sp, 48]
	add	sp, sp, 192
LCFI56:
	ret
LFE52:
	.cstring
	.align	3
lC6:
	.ascii "Dumping AMX z reg: \0"
	.align	3
lC7:
	.ascii "DONE PRINTING\0"
	.text
	.align	2
	.p2align 4,,11
	.globl __amx_fp32_dump_z_reg
__amx_fp32_dump_z_reg:
LFB53:
	sub	sp, sp, #80
LCFI57:
	mov	x1, 4096
	mov	x0, 128
	stp	x29, x30, [sp, 16]
LCFI58:
	add	x29, sp, 16
	stp	x19, x20, [sp, 32]
	stp	x21, x22, [sp, 48]
	str	x23, [sp, 64]
LCFI59:
	bl	_aligned_alloc
	mov	x22, x0
	adrp	x0, lC6@PAGE
	add	x0, x0, lC6@PAGEOFF;momd
	bl	_puts
	mov	x1, 4096
	mov	x0, 128
	bl	_aligned_alloc
	mov	x4, x0
	mov	x3, x0
	mov	x1, 0
	mov	x6, 144115188075855872
	mov	x5, 4611686018427387904
	.p2align 3,,7
L215:
	orr	x2, x3, x1
	orr	x2, x2, 4611686018427387904
; 177 "amx.h" 1
	.word (0x201000 + (5 << 5) + 0x2 - ((0x2 >> 4) * 6))
; 0 "" 2
	add	x1, x1, x6
	add	x3, x3, 128
	cmp	x1, x5
	bne	L215
	mov	x20, x22
	add	x23, x22, 1024
	mov	x1, x22
	.p2align 3,,7
L216:
	ldp	q0, q1, [x4]
	ldp	q4, q5, [x4, 32]
	ldp	q2, q3, [x4, 64]
	stp	q0, q1, [x1]
	ldp	q0, q1, [x4, 96]
	stp	q4, q5, [x1, 32]
	add	x4, x4, 256
	stp	q2, q3, [x1, 64]
	stp	q0, q1, [x1, 96]
	add	x1, x1, 64
	cmp	x23, x1
	bne	L216
	adrp	x21, lC0@PAGE
	add	x21, x21, lC0@PAGEOFF;momd
	bl	_free
	.p2align 3,,7
L217:
	mov	x19, 0
	.p2align 3,,7
L218:
	ldr	s0, [x20, x19, lsl 2]
	mov	x0, x21
	add	x19, x19, 1
	fcvt	d0, s0
	str	d0, [sp]
	bl	_printf
	cmp	x19, 16
	bne	L218
	mov	w0, 10
	add	x20, x20, 64
	bl	_putchar
	cmp	x23, x20
	bne	L217
	adrp	x0, lC7@PAGE
	add	x0, x0, lC7@PAGEOFF;momd
	bl	_puts
	ldp	x29, x30, [sp, 16]
	mov	x0, x22
	ldp	x19, x20, [sp, 32]
	ldp	x21, x22, [sp, 48]
	ldr	x23, [sp, 64]
	add	sp, sp, 80
LCFI60:
	b	_free
LFE53:
	.align	2
	.p2align 4,,11
	.globl _amx_perform_n_fouter_product
_amx_perform_n_fouter_product:
LFB54:
	cmp	w0, 0
	ble	L224
	sbfiz	x5, x0, 16, 32
	mov	w4, 0
	mov	x2, 0
	.p2align 3,,7
L226:
	and	x0, x2, 523264
	and	x3, x4, 511
	orr	x3, x3, x1
	orr	x0, x0, 17592186044416
	orr	x0, x0, x3
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	add	x2, x2, 65536
	add	w4, w4, 64
	cmp	x5, x2
	bne	L226
L224:
	ret
LFE54:
	.align	2
	.p2align 4,,11
	.globl _amx_fp32_gemm_16x16
_amx_fp32_gemm_16x16:
LFB55:
	stp	x29, x30, [sp, -112]!
LCFI61:
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	str	x2, [sp, 104]
	cmp	w3, 0
LCFI62:
	ble	L249
	mov	x19, x0
	sub	w0, w3, #1
	stp	x23, x24, [sp, 48]
LCFI63:
	mov	x24, 256
	and	w0, w0, -8
	movk	x24, 0x4, lsl 16
	stp	x21, x22, [sp, 32]
LCFI64:
	sub	w21, w3, #8
	movk	x24, 0x1000, lsl 32
	sub	w21, w21, w0
	sub	x23, x24, #262144
	sub	x0, x24, #131072
	stp	x25, x26, [sp, 64]
LCFI65:
	sub	x25, x24, #196608
	sub	x0, x0, #128
	sub	x23, x23, #256
	sub	x25, x25, #192
	adrp	x22, _amx_y_reg@PAGE
	adrp	x20, _amx_x_reg@PAGE
	stp	x27, x28, [sp, 80]
LCFI66:
	mov	w27, w3
	mov	x28, x1
	str	x0, [sp, 96]
	b	L248
	.p2align 2,,3
L231:
	orr	x5, x0, 4611686018427387904
; 223 "amx.h" 1
	.word (0x201000 + (1 << 5) + 0x5 - ((0x5 >> 4) * 6))
; 0 "" 2
	cmp	w27, 2
	ble	L233
	adrp	x0, _amx_y_reg@PAGE+128
	add	x0, x0, _amx_y_reg@PAGEOFF+128;momd
	cmp	w27, 3
	beq	L259
	mov	x1, 4755801206503243776
	orr	x0, x0, x1
; 223 "amx.h" 1
	.word (0x201000 + (1 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	cmp	w27, 4
	ble	L237
	adrp	x0, _amx_y_reg@PAGE+256
	add	x0, x0, _amx_y_reg@PAGEOFF+256;momd
	orr	x0, x0, 288230376151711744
	cmp	w27, 5
	beq	L260
	orr	x0, x0, 4611686018427387904
; 223 "amx.h" 1
	.word (0x201000 + (1 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	cmp	w27, 6
	ble	L240
	adrp	x0, _amx_y_reg@PAGE+384
	add	x0, x0, _amx_y_reg@PAGEOFF+384;momd
	orr	x0, x0, 432345564227567616
	cmp	w27, 7
	orr	x1, x0, 4611686018427387904
	csel	x0, x1, x0, ne
; 223 "amx.h" 1
	.word (0x201000 + (1 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	add	x5, x20, _amx_x_reg@PAGEOFF;momd
	mov	x2, x26
L258:
	mov	x0, x5
	mov	x1, x28
	bl	_memcpy
	orr	x5, x0, 4611686018427387904
; 221 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x5 - ((0x5 >> 4) * 6))
; 0 "" 2
L251:
	adrp	x0, _amx_x_reg@PAGE+128
	add	x0, x0, _amx_x_reg@PAGEOFF+128;momd
	cmp	w27, 3
	beq	L261
L242:
	mov	x1, 4755801206503243776
	orr	x0, x0, x1
; 221 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	cmp	w27, 4
	ble	L243
	adrp	x0, _amx_x_reg@PAGE+256
	add	x0, x0, _amx_x_reg@PAGEOFF+256;momd
	orr	x0, x0, 288230376151711744
	cmp	w27, 5
	beq	L262
	orr	x0, x0, 4611686018427387904
; 221 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	cmp	w27, 6
	ble	L243
	adrp	x0, _amx_x_reg@PAGE+384
	add	x0, x0, _amx_x_reg@PAGEOFF+384;momd
	orr	x0, x0, 432345564227567616
	cmp	w27, 7
	beq	L263
	orr	x0, x0, 4611686018427387904
; 221 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x23 - ((0x23 >> 4) * 6))
; 0 "" 2
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x25 - ((0x25 >> 4) * 6))
; 0 "" 2
	ldr	x0, [sp, 96]
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
L247:
	mov	x0, 192
	movk	x0, 0x3, lsl 16
	movk	x0, 0x1000, lsl 32
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	cmp	w27, 4
	ble	L232
L246:
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x24 - ((0x24 >> 4) * 6))
; 0 "" 2
	cmp	w27, 5
	ble	L232
	mov	x0, 320
	movk	x0, 0x5, lsl 16
	movk	x0, 0x1000, lsl 32
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	cmp	w27, 6
	ble	L232
	add	x0, x0, 65536
	add	x0, x0, 64
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	cmp	w27, 7
	ble	L232
	add	x0, x0, 65536
	add	x0, x0, 64
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
L232:
	sub	w27, w27, #8
	add	x19, x19, 512
	add	x28, x28, 512
	cmp	w21, w27
	beq	L264
L248:
	cmp	w27, 8
	mov	w2, 8
	csel	w2, w27, w2, le
	add	x5, x22, _amx_y_reg@PAGEOFF;momd
	mov	x0, x5
	mov	x1, x19
	lsl	w2, w2, 6
	sxtw	x26, w2
	mov	x2, x26
	bl	_memcpy
	cmp	w27, 1
	bne	L231
; 223 "amx.h" 1
	.word (0x201000 + (1 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ldp	q0, q1, [x28]
	add	x0, x20, _amx_x_reg@PAGEOFF;momd
	stp	q0, q1, [x0]
	ldp	q0, q1, [x28, 32]
	stp	q0, q1, [x0, 32]
; 221 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x23 - ((0x23 >> 4) * 6))
; 0 "" 2
	sub	w27, w27, #8
	add	x19, x19, 512
	add	x28, x28, 512
	cmp	w21, w27
	bne	L248
L264:
	ldp	x21, x22, [sp, 32]
LCFI67:
	ldp	x23, x24, [sp, 48]
LCFI68:
	ldp	x25, x26, [sp, 64]
LCFI69:
	ldp	x27, x28, [sp, 80]
LCFI70:
L249:
	mov	x1, 4096
	mov	x0, 128
	bl	_aligned_alloc
	mov	x4, x0
	mov	x3, x0
	mov	x1, 0
	mov	x6, 144115188075855872
	mov	x5, 4611686018427387904
	.p2align 3,,7
L230:
	orr	x2, x1, x3
	orr	x2, x2, 4611686018427387904
; 177 "amx.h" 1
	.word (0x201000 + (5 << 5) + 0x2 - ((0x2 >> 4) * 6))
; 0 "" 2
	add	x1, x1, x6
	add	x3, x3, 128
	cmp	x1, x5
	bne	L230
	adrp	x19, _amx_z_reg@PAGE
	add	x2, x19, _amx_z_reg@PAGEOFF;momd
	add	x3, x2, 1024
	.p2align 3,,7
L250:
	ldp	q0, q1, [x4]
	ldp	q4, q5, [x4, 32]
	ldp	q2, q3, [x4, 64]
	stp	q0, q1, [x2]
	ldp	q0, q1, [x4, 96]
	stp	q4, q5, [x2, 32]
	add	x4, x4, 256
	stp	q2, q3, [x2, 64]
	stp	q0, q1, [x2, 96]
	add	x2, x2, 64
	cmp	x2, x3
	bne	L250
	bl	_free
	ldr	x0, [sp, 104]
	add	x1, x19, _amx_z_reg@PAGEOFF;momd
	ldp	x19, x20, [sp, 16]
	mov	x2, 1024
	ldp	x29, x30, [sp], 112
LCFI71:
	b	_memcpy
	.p2align 2,,3
L259:
LCFI72:
	orr	x0, x0, 144115188075855872
; 223 "amx.h" 1
	.word (0x201000 + (1 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	ldp	q0, q1, [x28]
	add	x0, x20, _amx_x_reg@PAGEOFF;momd
	orr	x1, x0, 4611686018427387904
	stp	q0, q1, [x0]
	ldp	q0, q1, [x28, 32]
	stp	q0, q1, [x0, 32]
	ldp	q0, q1, [x28, 64]
	stp	q0, q1, [x0, 64]
	ldp	q0, q1, [x28, 96]
	stp	q0, q1, [x0, 96]
	ldp	q0, q1, [x28, 128]
	stp	q0, q1, [x0, 128]
	ldp	q0, q1, [x28, 160]
	stp	q0, q1, [x0, 160]
; 221 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x1 - ((0x1 >> 4) * 6))
; 0 "" 2
	adrp	x0, _amx_x_reg@PAGE+128
	add	x0, x0, _amx_x_reg@PAGEOFF+128;momd
	cmp	w27, 3
	bne	L242
L261:
	orr	x0, x0, 144115188075855872
; 221 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
L243:
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x23 - ((0x23 >> 4) * 6))
; 0 "" 2
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x25 - ((0x25 >> 4) * 6))
; 0 "" 2
	ldr	x0, [sp, 96]
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	cmp	w27, 3
	bgt	L247
	b	L232
	.p2align 2,,3
L260:
; 223 "amx.h" 1
	.word (0x201000 + (1 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	add	x5, x20, _amx_x_reg@PAGEOFF;momd
	mov	x1, x28
	mov	x0, x5
	mov	x2, 320
	bl	_memcpy
	orr	x5, x0, 4611686018427387904
; 221 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x5 - ((0x5 >> 4) * 6))
; 0 "" 2
	b	L251
	.p2align 2,,3
L262:
; 221 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	b	L243
	.p2align 2,,3
L263:
; 221 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x23 - ((0x23 >> 4) * 6))
; 0 "" 2
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x25 - ((0x25 >> 4) * 6))
; 0 "" 2
	ldr	x0, [sp, 96]
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	add	x0, x25, 131072
	add	x0, x0, 128
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	b	L246
L233:
	ldp	q0, q1, [x28]
	add	x0, x20, _amx_x_reg@PAGEOFF;momd
	orr	x1, x0, 4611686018427387904
	stp	q0, q1, [x0]
	ldp	q0, q1, [x28, 32]
	stp	q0, q1, [x0, 32]
	ldp	q0, q1, [x28, 64]
	stp	q0, q1, [x0, 64]
	ldp	q0, q1, [x28, 96]
	stp	q0, q1, [x0, 96]
; 221 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x1 - ((0x1 >> 4) * 6))
; 0 "" 2
	mov	x0, 17592186044416
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	add	x0, x0, 65536
	add	x0, x0, 64
; 47 "amx_fp32.h" 1
	.word (0x201000 + (21 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	b	L232
L237:
	ldp	q0, q1, [x28]
	add	x0, x20, _amx_x_reg@PAGEOFF;momd
	orr	x1, x0, 4611686018427387904
	stp	q0, q1, [x0]
	ldp	q0, q1, [x28, 32]
	stp	q0, q1, [x0, 32]
	ldp	q0, q1, [x28, 64]
	stp	q0, q1, [x0, 64]
	ldp	q0, q1, [x28, 96]
	stp	q0, q1, [x0, 96]
	ldp	q0, q1, [x28, 128]
	stp	q0, q1, [x0, 128]
	ldp	q0, q1, [x28, 160]
	stp	q0, q1, [x0, 160]
	ldp	q0, q1, [x28, 192]
	stp	q0, q1, [x0, 192]
	ldp	q0, q1, [x28, 224]
	stp	q0, q1, [x0, 224]
; 221 "amx.h" 1
	.word (0x201000 + (0 << 5) + 0x1 - ((0x1 >> 4) * 6))
; 0 "" 2
	b	L251
L240:
	add	x5, x20, _amx_x_reg@PAGEOFF;momd
	mov	x2, 384
	b	L258
LFE55:
	.align	2
	.p2align 4,,11
	.globl _amx_raw_thread
_amx_raw_thread:
LFB56:
	stp	x29, x30, [sp, -16]!
LCFI73:
	mov	x29, sp
; 125 "amx.h" 1
	nop
nop
nop
.word (0x201000 + (17 << 5) + 0)
; 0 "" 2
	mov	w1, 16960
	movk	w1, 0xf, lsl 16
	mul	w0, w0, w1
	bl	_usleep
	adrp	x0, _stop@PAGE
	adrp	x5, _iter@PAGE
	add	x4, x0, _stop@PAGEOFF;momd
	add	x2, x5, _iter@PAGEOFF;momd
	ldr	w1, [x0, #_stop@PAGEOFF]
	mov	x0, 17592186044416
	cbnz	w1, L267
L266:
	mov	w1, 10000
	.p2align 3,,7
L268:
; 66 "amx_power.c" 1
	.word (0x201000 + (14 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
; 67 "amx_power.c" 1
	.word (0x201000 + (14 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
; 68 "amx_power.c" 1
	.word (0x201000 + (14 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
; 69 "amx_power.c" 1
	.word (0x201000 + (14 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
; 70 "amx_power.c" 1
	.word (0x201000 + (14 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
; 71 "amx_power.c" 1
	.word (0x201000 + (14 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
; 72 "amx_power.c" 1
	.word (0x201000 + (14 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
; 73 "amx_power.c" 1
	.word (0x201000 + (14 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
; 74 "amx_power.c" 1
	.word (0x201000 + (14 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
; 75 "amx_power.c" 1
	.word (0x201000 + (14 << 5) + 0x0 - ((0x0 >> 4) * 6))
; 0 "" 2
	subs	w1, w1, #1
	bne	L268
	ldr	w1, [x2]
	ldr	w3, [x4]
	add	w1, w1, 1
	str	w1, [x2]
	cbz	w3, L266
L267:
; 130 "amx.h" 1
	nop
nop
nop
.word (0x201000 + (17 << 5) + 1)
; 0 "" 2
	ldr	w0, [x5, #_iter@PAGEOFF]
	ldp	x29, x30, [sp], 16
LCFI74:
	ret
LFE56:
	.cstring
	.align	3
lC8:
	.ascii "sudo powermetrics -i %d -n %d --show-process-energy --hide-cpu-duty-cycle > power.txt &\0"
	.align	3
lC9:
	.ascii "sudo killall powermetrics\0"
	.align	3
lC10:
	.ascii "Iterations: %d\12\0"
	.text
	.align	2
	.p2align 4,,11
	.globl _power_thread
_power_thread:
LFB57:
	mov	w4, 1000
	mov	w5, w0
	sub	sp, sp, #160
LCFI75:
	adrp	x3, lC8@PAGE
	mul	w4, w1, w4
	add	x3, x3, lC8@PAGEOFF;momd
	mov	x2, 100
	stp	x29, x30, [sp, 16]
LCFI76:
	add	x29, sp, 16
	sdiv	w4, w4, w5
	str	w5, [sp]
	stp	x19, x20, [sp, 32]
LCFI77:
	add	x20, sp, 56
	mov	w19, w1
	str	w4, [sp, 8]
	mov	w1, 0
	mov	x0, x20
	add	w19, w19, 2
	bl	___sprintf_chk
	mov	x0, x20
	bl	_system
	mov	w0, 16960
	movk	w0, 0xf, lsl 16
	mul	w0, w19, w0
	bl	_usleep
	adrp	x0, lC9@PAGE
	add	x0, x0, lC9@PAGEOFF;momd
	bl	_system
	adrp	x1, _iter@PAGE
	adrp	x0, lC10@PAGE
	add	x0, x0, lC10@PAGEOFF;momd
	ldr	w1, [x1, #_iter@PAGEOFF]
	str	w1, [sp]
	bl	_printf
	adrp	x0, _stop@PAGE
	mov	w1, 1
	ldp	x29, x30, [sp, 16]
	str	w1, [x0, #_stop@PAGEOFF]
	ldp	x19, x20, [sp, 32]
	add	sp, sp, 160
LCFI78:
	ret
LFE57:
	.section __TEXT,__text_startup,regular,pure_instructions
	.align	2
	.p2align 4,,11
	.globl _main
_main:
LFB58:
	stp	x29, x30, [sp, -64]!
LCFI79:
	mov	x29, sp
	str	x1, [sp, 32]
	add	x1, sp, 32
	str	w0, [sp, 44]
	add	x0, sp, 44
	bl	_MPI_Init
	adrp	x0, _ompi_mpi_comm_world@GOTPAGE
	ldr	x0, [x0, _ompi_mpi_comm_world@GOTPAGEOFF]
	add	x1, sp, 60
	bl	_MPI_Comm_rank
	ldr	w0, [sp, 60]
	cbnz	w0, L277
	ldr	w0, [sp, 44]
	cmp	w0, 2
	bgt	L280
L278:
	bl	_MPI_Finalize
	mov	w0, 0
	ldp	x29, x30, [sp], 64
LCFI80:
	ret
L280:
LCFI81:
	ldr	x0, [sp, 32]
	ldr	x0, [x0, 8]
	str	x19, [sp, 16]
LCFI82:
	bl	_atoi
	mov	w19, w0
	ldr	x1, [sp, 32]
	ldr	x0, [x1, 16]
	bl	_atoi
	mov	w1, w0
	mov	w0, w19
	bl	_power_thread
	ldr	x19, [sp, 16]
LCFI83:
	b	L278
L277:
	ldr	x0, [sp, 32]
	ldr	x0, [x0, 24]
	bl	_atoi
	bl	_amx_raw_thread
	b	L278
LFE58:
	.globl _stop
	.zerofill __DATA,__common,_stop,4,2
	.globl _iter
	.zerofill __DATA,__common,_iter,4,2
	.globl _amx_started
	.zerofill __DATA,__common,_amx_started,4,2
	.globl _amx_z_reg
	.zerofill __DATA,__common,_amx_z_reg,4096,7
	.globl _amx_y_reg
	.zerofill __DATA,__common,_amx_y_reg,512,7
	.globl _amx_x_reg
	.zerofill __DATA,__common,_amx_x_reg,512,7
	.const
	.align	4
lC1:
	.word	0
	.word	1
	.word	2
	.word	3
	.align	4
lC2:
	.word	1
	.word	2
	.word	3
	.word	4
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x3
	.ascii "zR\0"
	.uleb128 0x1
	.sleb128 -8
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x10
	.byte	0xc
	.uleb128 0x1f
	.uleb128 0
	.align	3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB14-.
	.set L$set$2,LFE14-LFB14
	.quad L$set$2
	.uleb128 0
	.align	3
LEFDE1:
LSFDE3:
	.set L$set$3,LEFDE3-LASFDE3
	.long L$set$3
LASFDE3:
	.long	LASFDE3-EH_frame1
	.quad	LFB15-.
	.set L$set$4,LFE15-LFB15
	.quad L$set$4
	.uleb128 0
	.align	3
LEFDE3:
LSFDE5:
	.set L$set$5,LEFDE5-LASFDE5
	.long L$set$5
LASFDE5:
	.long	LASFDE5-EH_frame1
	.quad	LFB16-.
	.set L$set$6,LFE16-LFB16
	.quad L$set$6
	.uleb128 0
	.align	3
LEFDE5:
LSFDE7:
	.set L$set$7,LEFDE7-LASFDE7
	.long L$set$7
LASFDE7:
	.long	LASFDE7-EH_frame1
	.quad	LFB17-.
	.set L$set$8,LFE17-LFB17
	.quad L$set$8
	.uleb128 0
	.align	3
LEFDE7:
LSFDE9:
	.set L$set$9,LEFDE9-LASFDE9
	.long L$set$9
LASFDE9:
	.long	LASFDE9-EH_frame1
	.quad	LFB18-.
	.set L$set$10,LFE18-LFB18
	.quad L$set$10
	.uleb128 0
	.align	3
LEFDE9:
LSFDE11:
	.set L$set$11,LEFDE11-LASFDE11
	.long L$set$11
LASFDE11:
	.long	LASFDE11-EH_frame1
	.quad	LFB19-.
	.set L$set$12,LFE19-LFB19
	.quad L$set$12
	.uleb128 0
	.align	3
LEFDE11:
LSFDE13:
	.set L$set$13,LEFDE13-LASFDE13
	.long L$set$13
LASFDE13:
	.long	LASFDE13-EH_frame1
	.quad	LFB20-.
	.set L$set$14,LFE20-LFB20
	.quad L$set$14
	.uleb128 0
	.align	3
LEFDE13:
LSFDE15:
	.set L$set$15,LEFDE15-LASFDE15
	.long L$set$15
LASFDE15:
	.long	LASFDE15-EH_frame1
	.quad	LFB21-.
	.set L$set$16,LFE21-LFB21
	.quad L$set$16
	.uleb128 0
	.align	3
LEFDE15:
LSFDE17:
	.set L$set$17,LEFDE17-LASFDE17
	.long L$set$17
LASFDE17:
	.long	LASFDE17-EH_frame1
	.quad	LFB22-.
	.set L$set$18,LFE22-LFB22
	.quad L$set$18
	.uleb128 0
	.align	3
LEFDE17:
LSFDE19:
	.set L$set$19,LEFDE19-LASFDE19
	.long L$set$19
LASFDE19:
	.long	LASFDE19-EH_frame1
	.quad	LFB23-.
	.set L$set$20,LFE23-LFB23
	.quad L$set$20
	.uleb128 0
	.align	3
LEFDE19:
LSFDE21:
	.set L$set$21,LEFDE21-LASFDE21
	.long L$set$21
LASFDE21:
	.long	LASFDE21-EH_frame1
	.quad	LFB24-.
	.set L$set$22,LFE24-LFB24
	.quad L$set$22
	.uleb128 0
	.align	3
LEFDE21:
LSFDE23:
	.set L$set$23,LEFDE23-LASFDE23
	.long L$set$23
LASFDE23:
	.long	LASFDE23-EH_frame1
	.quad	LFB25-.
	.set L$set$24,LFE25-LFB25
	.quad L$set$24
	.uleb128 0
	.align	3
LEFDE23:
LSFDE25:
	.set L$set$25,LEFDE25-LASFDE25
	.long L$set$25
LASFDE25:
	.long	LASFDE25-EH_frame1
	.quad	LFB26-.
	.set L$set$26,LFE26-LFB26
	.quad L$set$26
	.uleb128 0
	.align	3
LEFDE25:
LSFDE27:
	.set L$set$27,LEFDE27-LASFDE27
	.long L$set$27
LASFDE27:
	.long	LASFDE27-EH_frame1
	.quad	LFB27-.
	.set L$set$28,LFE27-LFB27
	.quad L$set$28
	.uleb128 0
	.align	3
LEFDE27:
LSFDE29:
	.set L$set$29,LEFDE29-LASFDE29
	.long L$set$29
LASFDE29:
	.long	LASFDE29-EH_frame1
	.quad	LFB28-.
	.set L$set$30,LFE28-LFB28
	.quad L$set$30
	.uleb128 0
	.align	3
LEFDE29:
LSFDE31:
	.set L$set$31,LEFDE31-LASFDE31
	.long L$set$31
LASFDE31:
	.long	LASFDE31-EH_frame1
	.quad	LFB29-.
	.set L$set$32,LFE29-LFB29
	.quad L$set$32
	.uleb128 0
	.align	3
LEFDE31:
LSFDE33:
	.set L$set$33,LEFDE33-LASFDE33
	.long L$set$33
LASFDE33:
	.long	LASFDE33-EH_frame1
	.quad	LFB30-.
	.set L$set$34,LFE30-LFB30
	.quad L$set$34
	.uleb128 0
	.align	3
LEFDE33:
LSFDE35:
	.set L$set$35,LEFDE35-LASFDE35
	.long L$set$35
LASFDE35:
	.long	LASFDE35-EH_frame1
	.quad	LFB31-.
	.set L$set$36,LFE31-LFB31
	.quad L$set$36
	.uleb128 0
	.align	3
LEFDE35:
LSFDE37:
	.set L$set$37,LEFDE37-LASFDE37
	.long L$set$37
LASFDE37:
	.long	LASFDE37-EH_frame1
	.quad	LFB32-.
	.set L$set$38,LFE32-LFB32
	.quad L$set$38
	.uleb128 0
	.align	3
LEFDE37:
LSFDE39:
	.set L$set$39,LEFDE39-LASFDE39
	.long L$set$39
LASFDE39:
	.long	LASFDE39-EH_frame1
	.quad	LFB33-.
	.set L$set$40,LFE33-LFB33
	.quad L$set$40
	.uleb128 0
	.align	3
LEFDE39:
LSFDE41:
	.set L$set$41,LEFDE41-LASFDE41
	.long L$set$41
LASFDE41:
	.long	LASFDE41-EH_frame1
	.quad	LFB34-.
	.set L$set$42,LFE34-LFB34
	.quad L$set$42
	.uleb128 0
	.align	3
LEFDE41:
LSFDE43:
	.set L$set$43,LEFDE43-LASFDE43
	.long L$set$43
LASFDE43:
	.long	LASFDE43-EH_frame1
	.quad	LFB35-.
	.set L$set$44,LFE35-LFB35
	.quad L$set$44
	.uleb128 0
	.align	3
LEFDE43:
LSFDE45:
	.set L$set$45,LEFDE45-LASFDE45
	.long L$set$45
LASFDE45:
	.long	LASFDE45-EH_frame1
	.quad	LFB36-.
	.set L$set$46,LFE36-LFB36
	.quad L$set$46
	.uleb128 0
	.align	3
LEFDE45:
LSFDE47:
	.set L$set$47,LEFDE47-LASFDE47
	.long L$set$47
LASFDE47:
	.long	LASFDE47-EH_frame1
	.quad	LFB37-.
	.set L$set$48,LFE37-LFB37
	.quad L$set$48
	.uleb128 0
	.align	3
LEFDE47:
LSFDE49:
	.set L$set$49,LEFDE49-LASFDE49
	.long L$set$49
LASFDE49:
	.long	LASFDE49-EH_frame1
	.quad	LFB38-.
	.set L$set$50,LFE38-LFB38
	.quad L$set$50
	.uleb128 0
	.byte	0x4
	.set L$set$51,LCFI0-LFB38
	.long L$set$51
	.byte	0xe
	.uleb128 0x20
	.byte	0x9d
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x3
	.byte	0x4
	.set L$set$52,LCFI1-LCFI0
	.long L$set$52
	.byte	0x93
	.uleb128 0x2
	.byte	0x94
	.uleb128 0x1
	.byte	0x4
	.set L$set$53,LCFI2-LCFI1
	.long L$set$53
	.byte	0xde
	.byte	0xdd
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE49:
LSFDE51:
	.set L$set$54,LEFDE51-LASFDE51
	.long L$set$54
LASFDE51:
	.long	LASFDE51-EH_frame1
	.quad	LFB39-.
	.set L$set$55,LFE39-LFB39
	.quad L$set$55
	.uleb128 0
	.byte	0x4
	.set L$set$56,LCFI3-LFB39
	.long L$set$56
	.byte	0xe
	.uleb128 0x20
	.byte	0x9d
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x3
	.byte	0x4
	.set L$set$57,LCFI4-LCFI3
	.long L$set$57
	.byte	0x93
	.uleb128 0x2
	.byte	0x94
	.uleb128 0x1
	.byte	0x4
	.set L$set$58,LCFI5-LCFI4
	.long L$set$58
	.byte	0xde
	.byte	0xdd
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE51:
LSFDE53:
	.set L$set$59,LEFDE53-LASFDE53
	.long L$set$59
LASFDE53:
	.long	LASFDE53-EH_frame1
	.quad	LFB40-.
	.set L$set$60,LFE40-LFB40
	.quad L$set$60
	.uleb128 0
	.byte	0x4
	.set L$set$61,LCFI6-LFB40
	.long L$set$61
	.byte	0xe
	.uleb128 0x30
	.byte	0x9d
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x5
	.byte	0x4
	.set L$set$62,LCFI7-LCFI6
	.long L$set$62
	.byte	0x93
	.uleb128 0x4
	.byte	0x94
	.uleb128 0x3
	.byte	0x4
	.set L$set$63,LCFI8-LCFI7
	.long L$set$63
	.byte	0x95
	.uleb128 0x2
	.byte	0x4
	.set L$set$64,LCFI9-LCFI8
	.long L$set$64
	.byte	0xde
	.byte	0xdd
	.byte	0xd5
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE53:
LSFDE55:
	.set L$set$65,LEFDE55-LASFDE55
	.long L$set$65
LASFDE55:
	.long	LASFDE55-EH_frame1
	.quad	LFB41-.
	.set L$set$66,LFE41-LFB41
	.quad L$set$66
	.uleb128 0
	.byte	0x4
	.set L$set$67,LCFI10-LFB41
	.long L$set$67
	.byte	0xe
	.uleb128 0x30
	.byte	0x9d
	.uleb128 0x6
	.byte	0x9e
	.uleb128 0x5
	.byte	0x4
	.set L$set$68,LCFI11-LCFI10
	.long L$set$68
	.byte	0x93
	.uleb128 0x4
	.byte	0x94
	.uleb128 0x3
	.byte	0x4
	.set L$set$69,LCFI12-LCFI11
	.long L$set$69
	.byte	0x95
	.uleb128 0x2
	.byte	0x4
	.set L$set$70,LCFI13-LCFI12
	.long L$set$70
	.byte	0xa
	.byte	0xde
	.byte	0xdd
	.byte	0xd5
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.set L$set$71,LCFI14-LCFI13
	.long L$set$71
	.byte	0xb
	.byte	0x4
	.set L$set$72,LCFI15-LCFI14
	.long L$set$72
	.byte	0xde
	.byte	0xdd
	.byte	0xd5
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE55:
LSFDE57:
	.set L$set$73,LEFDE57-LASFDE57
	.long L$set$73
LASFDE57:
	.long	LASFDE57-EH_frame1
	.quad	LFB42-.
	.set L$set$74,LFE42-LFB42
	.quad L$set$74
	.uleb128 0
	.byte	0x4
	.set L$set$75,LCFI16-LFB42
	.long L$set$75
	.byte	0xe
	.uleb128 0x70
	.byte	0x4
	.set L$set$76,LCFI17-LCFI16
	.long L$set$76
	.byte	0x9d
	.uleb128 0xc
	.byte	0x9e
	.uleb128 0xb
	.byte	0x4
	.set L$set$77,LCFI18-LCFI17
	.long L$set$77
	.byte	0x93
	.uleb128 0xa
	.byte	0x94
	.uleb128 0x9
	.byte	0x95
	.uleb128 0x8
	.byte	0x96
	.uleb128 0x7
	.byte	0x4
	.set L$set$78,LCFI19-LCFI18
	.long L$set$78
	.byte	0x97
	.uleb128 0x6
	.byte	0x98
	.uleb128 0x5
	.byte	0x4
	.set L$set$79,LCFI20-LCFI19
	.long L$set$79
	.byte	0xa
	.byte	0xdd
	.byte	0xde
	.byte	0xd7
	.byte	0xd8
	.byte	0xd5
	.byte	0xd6
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.set L$set$80,LCFI21-LCFI20
	.long L$set$80
	.byte	0xb
	.byte	0x4
	.set L$set$81,LCFI22-LCFI21
	.long L$set$81
	.byte	0x9b
	.uleb128 0x2
	.byte	0x4
	.set L$set$82,LCFI23-LCFI22
	.long L$set$82
	.byte	0x9a
	.uleb128 0x3
	.byte	0x99
	.uleb128 0x4
	.byte	0x4
	.set L$set$83,LCFI24-LCFI23
	.long L$set$83
	.byte	0xda
	.byte	0xd9
	.byte	0x4
	.set L$set$84,LCFI25-LCFI24
	.long L$set$84
	.byte	0xdb
	.byte	0x4
	.set L$set$85,LCFI26-LCFI25
	.long L$set$85
	.byte	0xa
	.byte	0xdd
	.byte	0xde
	.byte	0xd7
	.byte	0xd8
	.byte	0xd5
	.byte	0xd6
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.set L$set$86,LCFI27-LCFI26
	.long L$set$86
	.byte	0xb
	.byte	0x4
	.set L$set$87,LCFI28-LCFI27
	.long L$set$87
	.byte	0x9b
	.uleb128 0x2
	.byte	0x4
	.set L$set$88,LCFI29-LCFI28
	.long L$set$88
	.byte	0x9a
	.uleb128 0x3
	.byte	0x99
	.uleb128 0x4
	.byte	0x4
	.set L$set$89,LCFI30-LCFI29
	.long L$set$89
	.byte	0xda
	.byte	0xd9
	.byte	0x4
	.set L$set$90,LCFI31-LCFI30
	.long L$set$90
	.byte	0xdb
	.byte	0x4
	.set L$set$91,LCFI32-LCFI31
	.long L$set$91
	.byte	0xe
	.uleb128 0
	.byte	0xd3
	.byte	0xd4
	.byte	0xd5
	.byte	0xd6
	.byte	0xd7
	.byte	0xd8
	.byte	0xdd
	.byte	0xde
	.align	3
LEFDE57:
LSFDE59:
	.set L$set$92,LEFDE59-LASFDE59
	.long L$set$92
LASFDE59:
	.long	LASFDE59-EH_frame1
	.quad	LFB43-.
	.set L$set$93,LFE43-LFB43
	.quad L$set$93
	.uleb128 0
	.byte	0x4
	.set L$set$94,LCFI33-LFB43
	.long L$set$94
	.byte	0xe
	.uleb128 0x40
	.byte	0x9d
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x7
	.byte	0x4
	.set L$set$95,LCFI34-LCFI33
	.long L$set$95
	.byte	0x93
	.uleb128 0x6
	.byte	0x94
	.uleb128 0x5
	.byte	0x4
	.set L$set$96,LCFI35-LCFI34
	.long L$set$96
	.byte	0x95
	.uleb128 0x4
	.byte	0x96
	.uleb128 0x3
	.byte	0x4
	.set L$set$97,LCFI36-LCFI35
	.long L$set$97
	.byte	0x97
	.uleb128 0x2
	.byte	0x4
	.set L$set$98,LCFI37-LCFI36
	.long L$set$98
	.byte	0xde
	.byte	0xdd
	.byte	0xd7
	.byte	0xd5
	.byte	0xd6
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE59:
LSFDE61:
	.set L$set$99,LEFDE61-LASFDE61
	.long L$set$99
LASFDE61:
	.long	LASFDE61-EH_frame1
	.quad	LFB44-.
	.set L$set$100,LFE44-LFB44
	.quad L$set$100
	.uleb128 0
	.byte	0x4
	.set L$set$101,LCFI38-LFB44
	.long L$set$101
	.byte	0xe
	.uleb128 0x20
	.byte	0x9d
	.uleb128 0x4
	.byte	0x9e
	.uleb128 0x3
	.byte	0x4
	.set L$set$102,LCFI39-LCFI38
	.long L$set$102
	.byte	0x93
	.uleb128 0x2
	.byte	0x94
	.uleb128 0x1
	.byte	0x4
	.set L$set$103,LCFI40-LCFI39
	.long L$set$103
	.byte	0xde
	.byte	0xdd
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE61:
LSFDE63:
	.set L$set$104,LEFDE63-LASFDE63
	.long L$set$104
LASFDE63:
	.long	LASFDE63-EH_frame1
	.quad	LFB45-.
	.set L$set$105,LFE45-LFB45
	.quad L$set$105
	.uleb128 0
	.align	3
LEFDE63:
LSFDE65:
	.set L$set$106,LEFDE65-LASFDE65
	.long L$set$106
LASFDE65:
	.long	LASFDE65-EH_frame1
	.quad	LFB46-.
	.set L$set$107,LFE46-LFB46
	.quad L$set$107
	.uleb128 0
	.align	3
LEFDE65:
LSFDE67:
	.set L$set$108,LEFDE67-LASFDE67
	.long L$set$108
LASFDE67:
	.long	LASFDE67-EH_frame1
	.quad	LFB47-.
	.set L$set$109,LFE47-LFB47
	.quad L$set$109
	.uleb128 0
	.align	3
LEFDE67:
LSFDE69:
	.set L$set$110,LEFDE69-LASFDE69
	.long L$set$110
LASFDE69:
	.long	LASFDE69-EH_frame1
	.quad	LFB48-.
	.set L$set$111,LFE48-LFB48
	.quad L$set$111
	.uleb128 0
	.byte	0x4
	.set L$set$112,LCFI41-LFB48
	.long L$set$112
	.byte	0xe
	.uleb128 0x10
	.byte	0x9d
	.uleb128 0x2
	.byte	0x9e
	.uleb128 0x1
	.byte	0x4
	.set L$set$113,LCFI42-LCFI41
	.long L$set$113
	.byte	0xde
	.byte	0xdd
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE69:
LSFDE71:
	.set L$set$114,LEFDE71-LASFDE71
	.long L$set$114
LASFDE71:
	.long	LASFDE71-EH_frame1
	.quad	LFB49-.
	.set L$set$115,LFE49-LFB49
	.quad L$set$115
	.uleb128 0
	.byte	0x4
	.set L$set$116,LCFI43-LFB49
	.long L$set$116
	.byte	0xe
	.uleb128 0x10
	.byte	0x9d
	.uleb128 0x2
	.byte	0x9e
	.uleb128 0x1
	.byte	0x4
	.set L$set$117,LCFI44-LCFI43
	.long L$set$117
	.byte	0xa
	.byte	0xde
	.byte	0xdd
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.set L$set$118,LCFI45-LCFI44
	.long L$set$118
	.byte	0xb
	.byte	0x4
	.set L$set$119,LCFI46-LCFI45
	.long L$set$119
	.byte	0xe
	.uleb128 0
	.byte	0xdd
	.byte	0xde
	.align	3
LEFDE71:
LSFDE73:
	.set L$set$120,LEFDE73-LASFDE73
	.long L$set$120
LASFDE73:
	.long	LASFDE73-EH_frame1
	.quad	LFB50-.
	.set L$set$121,LFE50-LFB50
	.quad L$set$121
	.uleb128 0
	.align	3
LEFDE73:
LSFDE75:
	.set L$set$122,LEFDE75-LASFDE75
	.long L$set$122
LASFDE75:
	.long	LASFDE75-EH_frame1
	.quad	LFB51-.
	.set L$set$123,LFE51-LFB51
	.quad L$set$123
	.uleb128 0
	.byte	0x4
	.set L$set$124,LCFI47-LFB51
	.long L$set$124
	.byte	0xe
	.uleb128 0xc0
	.byte	0x4
	.set L$set$125,LCFI48-LCFI47
	.long L$set$125
	.byte	0x9d
	.uleb128 0x16
	.byte	0x9e
	.uleb128 0x15
	.byte	0x4
	.set L$set$126,LCFI49-LCFI48
	.long L$set$126
	.byte	0x93
	.uleb128 0x14
	.byte	0x94
	.uleb128 0x13
	.byte	0x4
	.set L$set$127,LCFI50-LCFI49
	.long L$set$127
	.byte	0x95
	.uleb128 0x12
	.byte	0x4
	.set L$set$128,LCFI51-LCFI50
	.long L$set$128
	.byte	0xdd
	.byte	0xde
	.byte	0xd5
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE75:
LSFDE77:
	.set L$set$129,LEFDE77-LASFDE77
	.long L$set$129
LASFDE77:
	.long	LASFDE77-EH_frame1
	.quad	LFB52-.
	.set L$set$130,LFE52-LFB52
	.quad L$set$130
	.uleb128 0
	.byte	0x4
	.set L$set$131,LCFI52-LFB52
	.long L$set$131
	.byte	0xe
	.uleb128 0xc0
	.byte	0x4
	.set L$set$132,LCFI53-LCFI52
	.long L$set$132
	.byte	0x9d
	.uleb128 0x16
	.byte	0x9e
	.uleb128 0x15
	.byte	0x4
	.set L$set$133,LCFI54-LCFI53
	.long L$set$133
	.byte	0x93
	.uleb128 0x14
	.byte	0x94
	.uleb128 0x13
	.byte	0x4
	.set L$set$134,LCFI55-LCFI54
	.long L$set$134
	.byte	0x95
	.uleb128 0x12
	.byte	0x4
	.set L$set$135,LCFI56-LCFI55
	.long L$set$135
	.byte	0xdd
	.byte	0xde
	.byte	0xd5
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE77:
LSFDE79:
	.set L$set$136,LEFDE79-LASFDE79
	.long L$set$136
LASFDE79:
	.long	LASFDE79-EH_frame1
	.quad	LFB53-.
	.set L$set$137,LFE53-LFB53
	.quad L$set$137
	.uleb128 0
	.byte	0x4
	.set L$set$138,LCFI57-LFB53
	.long L$set$138
	.byte	0xe
	.uleb128 0x50
	.byte	0x4
	.set L$set$139,LCFI58-LCFI57
	.long L$set$139
	.byte	0x9d
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x7
	.byte	0x4
	.set L$set$140,LCFI59-LCFI58
	.long L$set$140
	.byte	0x93
	.uleb128 0x6
	.byte	0x94
	.uleb128 0x5
	.byte	0x95
	.uleb128 0x4
	.byte	0x96
	.uleb128 0x3
	.byte	0x97
	.uleb128 0x2
	.byte	0x4
	.set L$set$141,LCFI60-LCFI59
	.long L$set$141
	.byte	0xdd
	.byte	0xde
	.byte	0xd7
	.byte	0xd5
	.byte	0xd6
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE79:
LSFDE81:
	.set L$set$142,LEFDE81-LASFDE81
	.long L$set$142
LASFDE81:
	.long	LASFDE81-EH_frame1
	.quad	LFB54-.
	.set L$set$143,LFE54-LFB54
	.quad L$set$143
	.uleb128 0
	.align	3
LEFDE81:
LSFDE83:
	.set L$set$144,LEFDE83-LASFDE83
	.long L$set$144
LASFDE83:
	.long	LASFDE83-EH_frame1
	.quad	LFB55-.
	.set L$set$145,LFE55-LFB55
	.quad L$set$145
	.uleb128 0
	.byte	0x4
	.set L$set$146,LCFI61-LFB55
	.long L$set$146
	.byte	0xe
	.uleb128 0x70
	.byte	0x9d
	.uleb128 0xe
	.byte	0x9e
	.uleb128 0xd
	.byte	0x4
	.set L$set$147,LCFI62-LCFI61
	.long L$set$147
	.byte	0x93
	.uleb128 0xc
	.byte	0x94
	.uleb128 0xb
	.byte	0x4
	.set L$set$148,LCFI63-LCFI62
	.long L$set$148
	.byte	0x98
	.uleb128 0x7
	.byte	0x97
	.uleb128 0x8
	.byte	0x4
	.set L$set$149,LCFI64-LCFI63
	.long L$set$149
	.byte	0x96
	.uleb128 0x9
	.byte	0x95
	.uleb128 0xa
	.byte	0x4
	.set L$set$150,LCFI65-LCFI64
	.long L$set$150
	.byte	0x9a
	.uleb128 0x5
	.byte	0x99
	.uleb128 0x6
	.byte	0x4
	.set L$set$151,LCFI66-LCFI65
	.long L$set$151
	.byte	0x9c
	.uleb128 0x3
	.byte	0x9b
	.uleb128 0x4
	.byte	0x4
	.set L$set$152,LCFI67-LCFI66
	.long L$set$152
	.byte	0xd6
	.byte	0xd5
	.byte	0x4
	.set L$set$153,LCFI68-LCFI67
	.long L$set$153
	.byte	0xd8
	.byte	0xd7
	.byte	0x4
	.set L$set$154,LCFI69-LCFI68
	.long L$set$154
	.byte	0xda
	.byte	0xd9
	.byte	0x4
	.set L$set$155,LCFI70-LCFI69
	.long L$set$155
	.byte	0xdc
	.byte	0xdb
	.byte	0x4
	.set L$set$156,LCFI71-LCFI70
	.long L$set$156
	.byte	0xde
	.byte	0xdd
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.set L$set$157,LCFI72-LCFI71
	.long L$set$157
	.byte	0xe
	.uleb128 0x70
	.byte	0x93
	.uleb128 0xc
	.byte	0x94
	.uleb128 0xb
	.byte	0x95
	.uleb128 0xa
	.byte	0x96
	.uleb128 0x9
	.byte	0x97
	.uleb128 0x8
	.byte	0x98
	.uleb128 0x7
	.byte	0x99
	.uleb128 0x6
	.byte	0x9a
	.uleb128 0x5
	.byte	0x9b
	.uleb128 0x4
	.byte	0x9c
	.uleb128 0x3
	.byte	0x9d
	.uleb128 0xe
	.byte	0x9e
	.uleb128 0xd
	.align	3
LEFDE83:
LSFDE85:
	.set L$set$158,LEFDE85-LASFDE85
	.long L$set$158
LASFDE85:
	.long	LASFDE85-EH_frame1
	.quad	LFB56-.
	.set L$set$159,LFE56-LFB56
	.quad L$set$159
	.uleb128 0
	.byte	0x4
	.set L$set$160,LCFI73-LFB56
	.long L$set$160
	.byte	0xe
	.uleb128 0x10
	.byte	0x9d
	.uleb128 0x2
	.byte	0x9e
	.uleb128 0x1
	.byte	0x4
	.set L$set$161,LCFI74-LCFI73
	.long L$set$161
	.byte	0xde
	.byte	0xdd
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE85:
LSFDE87:
	.set L$set$162,LEFDE87-LASFDE87
	.long L$set$162
LASFDE87:
	.long	LASFDE87-EH_frame1
	.quad	LFB57-.
	.set L$set$163,LFE57-LFB57
	.quad L$set$163
	.uleb128 0
	.byte	0x4
	.set L$set$164,LCFI75-LFB57
	.long L$set$164
	.byte	0xe
	.uleb128 0xa0
	.byte	0x4
	.set L$set$165,LCFI76-LCFI75
	.long L$set$165
	.byte	0x9d
	.uleb128 0x12
	.byte	0x9e
	.uleb128 0x11
	.byte	0x4
	.set L$set$166,LCFI77-LCFI76
	.long L$set$166
	.byte	0x93
	.uleb128 0x10
	.byte	0x94
	.uleb128 0xf
	.byte	0x4
	.set L$set$167,LCFI78-LCFI77
	.long L$set$167
	.byte	0xdd
	.byte	0xde
	.byte	0xd3
	.byte	0xd4
	.byte	0xe
	.uleb128 0
	.align	3
LEFDE87:
LSFDE89:
	.set L$set$168,LEFDE89-LASFDE89
	.long L$set$168
LASFDE89:
	.long	LASFDE89-EH_frame1
	.quad	LFB58-.
	.set L$set$169,LFE58-LFB58
	.quad L$set$169
	.uleb128 0
	.byte	0x4
	.set L$set$170,LCFI79-LFB58
	.long L$set$170
	.byte	0xe
	.uleb128 0x40
	.byte	0x9d
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x7
	.byte	0x4
	.set L$set$171,LCFI80-LCFI79
	.long L$set$171
	.byte	0xa
	.byte	0xde
	.byte	0xdd
	.byte	0xe
	.uleb128 0
	.byte	0x4
	.set L$set$172,LCFI81-LCFI80
	.long L$set$172
	.byte	0xb
	.byte	0x4
	.set L$set$173,LCFI82-LCFI81
	.long L$set$173
	.byte	0x93
	.uleb128 0x6
	.byte	0x4
	.set L$set$174,LCFI83-LCFI82
	.long L$set$174
	.byte	0xd3
	.align	3
LEFDE89:
	.ident	"GCC: (Homebrew GCC 13.1.0) 13.1.0"
	.subsections_via_symbols
