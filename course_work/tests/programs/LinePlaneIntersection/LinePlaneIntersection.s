	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	sub	sp, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	fmov	s1, #6.00000000
	mov	w8, #1073741824                 ; =0x40000000
	mov	w9, #1065353216                 ; =0x3f800000
	movi	d0, #0000000000000000
	stp	w8, w9, [x29, #-24]
	mov	w10, #1077936128                ; =0x40400000
	mov	w8, #-1061158912                ; =0xc0c00000
	stur	w9, [x29, #-40]
	fcmp	s1, #0.0
	stp	w8, w10, [x29, #-32]
	mov	x8, #4575657222473777152        ; =0x3f8000003f800000
	stur	x8, [x29, #-48]
	stur	x8, [x29, #-64]
	mov	w8, #1086324736                 ; =0x40c00000
	stur	w9, [x29, #-56]
	stp	wzr, w8, [x29, #-88]
	b.ne	LBB0_3
; %bb.1:                                ; %then
	mov	x8, sp
Lloh0:
	adrp	x19, _end_line_str@PAGE
Lloh1:
	add	x19, x19, _end_line_str@PAGEOFF
	sub	x0, x8, #16
	fcmp	s0, #0.0
	mov	sp, x0
	b.ne	LBB0_4
; %bb.2:                                ; %then.1
	mov	w10, #25932                     ; =0x654c
	mov	w9, #116                        ; =0x74
	movk	w10, #26983, lsl #16
	sturh	w9, [x8, #-12]
	stur	w10, [x8, #-16]
	b	LBB0_5
LBB0_3:                                 ; %else
	ldur	s1, [x29, #-84]
	ldur	s3, [x29, #-56]
	mov	x8, sp
	ldp	s4, s5, [x29, #-48]
	sub	x0, x8, #32
	fdiv	s0, s0, s1
	ldp	s1, s2, [x29, #-64]
	fmul	s1, s0, s1
	fmul	s2, s0, s2
	fmul	s3, s0, s3
	fadd	s1, s4, s1
	ldur	s4, [x29, #-40]
	fadd	s2, s5, s2
	fadd	s3, s4, s3
	stp	s1, s2, [x29, #-80]
	stp	s3, s0, [x29, #-72]
	mov	sp, x0
	mov	w9, #29806                      ; =0x746e
	mov	x10, #26996                     ; =0x6974
	sturb	wzr, [x8, #-12]
	movk	w9, #2618, lsl #16
	movk	x10, #28271, lsl #16
	stur	w9, [x8, #-16]
	mov	x9, #28233                      ; =0x6e49
	movk	x10, #28704, lsl #32
	movk	x9, #25972, lsl #16
	movk	x10, #26991, lsl #48
	movk	x9, #29554, lsl #32
	movk	x9, #25445, lsl #48
	stp	x9, x10, [x8, #-32]
	bl	_printf
Lloh2:
	adrp	x19, _end_line_str@PAGE
Lloh3:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	mov	x8, sp
	ldur	s0, [x29, #-80]
	sub	x0, x8, #16
	mov	sp, x0
	fcvt	d0, s0
	mov	w20, #26149                     ; =0x6625
	sturb	wzr, [x8, #-14]
	sturh	w20, [x8, #-16]
	str	d0, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	mov	x8, sp
	ldur	s0, [x29, #-76]
	sub	x0, x8, #16
	mov	sp, x0
	fcvt	d0, s0
	sturb	wzr, [x8, #-14]
	sturh	w20, [x8, #-16]
	str	d0, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	mov	x8, sp
	ldur	s0, [x29, #-72]
	sub	x0, x8, #16
	mov	sp, x0
	fcvt	d0, s0
	sturb	wzr, [x8, #-14]
	sturh	w20, [x8, #-16]
	str	d0, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	b	LBB0_6
LBB0_4:                                 ; %else.1
	mov	x10, #29513                     ; =0x7349
	mov	w9, #27756                      ; =0x6c6c
	sturb	wzr, [x8, #-4]
	movk	x10, #28704, lsl #16
	movk	w9, #27749, lsl #16
	movk	x10, #29281, lsl #32
	stur	w9, [x8, #-8]
	movk	x10, #24946, lsl #48
	stur	x10, [x8, #-16]
LBB0_5:                                 ; %end
	bl	_printf
LBB0_6:                                 ; %end
	mov	x0, x19
	bl	_printf
	sub	sp, x29, #16
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

.subsections_via_symbols
