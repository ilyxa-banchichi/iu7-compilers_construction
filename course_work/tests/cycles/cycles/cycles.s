	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	d9, d8, [sp, #-64]!             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	sub	sp, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset b8, -56
	.cfi_offset b9, -64
	mov	w8, #10                         ; =0xa
	mov	w9, #1065353216                 ; =0x3f800000
	sub	x0, x29, #72
	sturh	w8, [x29, #-52]
	mov	x8, #29779                      ; =0x7453
	stur	w9, [x29, #-56]
	mov	x9, #8306                       ; =0x2072
	movk	x8, #29281, lsl #16
	movk	x9, #8241, lsl #16
	movk	x8, #8308, lsl #32
	movk	x9, #28532, lsl #32
	movk	x8, #28518, lsl #48
	movk	x9, #32, lsl #48
	stp	x8, x9, [x29, #-72]
	bl	_printf
	mov	w8, #26661                      ; =0x6825
	ldurh	w9, [x29, #-52]
	sub	x0, x29, #76
	movk	w8, #100, lsl #16
	stur	w8, [x29, #-76]
	str	x9, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
Lloh0:
	adrp	x19, _end_line_str@PAGE
Lloh1:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	mov	w20, #8294                      ; =0x2066
	mov	w8, #1                          ; =0x1
	mov	w21, #26149                     ; =0x6625
	movk	w20, #8253, lsl #16
	sxth	w22, w8
	ldursh	w9, [x29, #-52]
	sturh	w8, [x29, #-50]
	cmp	w22, w9
	b.gt	LBB0_2
LBB0_1:                                 ; %for_body
                                        ; =>This Inner Loop Header: Depth=1
	ldurh	w8, [x29, #-50]
	ldur	s1, [x29, #-56]
	sxth	w9, w8
	scvtf	s0, w9
	add	w9, w8, w8, lsr #15
	and	w9, w9, #0xfffe
	sub	w8, w8, w9
	fdiv	s2, s1, s0
	fmul	s0, s1, s0
	tst	w8, #0xffff
	mov	x8, sp
	sub	x0, x8, #16
	fcsel	s0, s0, s2, eq
	stur	s0, [x29, #-56]
	mov	sp, x0
	sturb	wzr, [x8, #-12]
	stur	w20, [x8, #-16]
	bl	_printf
	mov	x8, sp
	ldur	s0, [x29, #-56]
	sub	x0, x8, #16
	mov	sp, x0
	fcvt	d0, s0
	sturb	wzr, [x8, #-14]
	sturh	w21, [x8, #-16]
	str	d0, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	add	w8, w22, #1
	sxth	w22, w8
	ldursh	w9, [x29, #-52]
	sturh	w8, [x29, #-50]
	cmp	w22, w9
	b.le	LBB0_1
LBB0_2:                                 ; %for_exit
	mov	w9, #1120403456                 ; =0x42c80000
	mov	w20, #8297                      ; =0x2069
	mov	w21, #26661                     ; =0x6825
	fmov	s8, w9
	mov	w8, #1                          ; =0x1
	movk	w20, #8253, lsl #16
	movk	w21, #100, lsl #16
Lloh2:
	adrp	x19, _end_line_str@PAGE
Lloh3:
	add	x19, x19, _end_line_str@PAGEOFF
	stur	wzr, [x29, #-56]
	sturh	w8, [x29, #-50]
	ldur	s0, [x29, #-56]
	fcmp	s0, s8
	b.pl	LBB0_4
LBB0_3:                                 ; %while_body
                                        ; =>This Inner Loop Header: Depth=1
	ldurh	w8, [x29, #-50]
	ldur	s1, [x29, #-56]
	lsl	w8, w8, #1
	sxth	w9, w8
	sturh	w8, [x29, #-50]
	mov	x8, sp
	sub	x0, x8, #16
	scvtf	s0, w9
	fadd	s0, s1, s0
	stur	s0, [x29, #-56]
	mov	sp, x0
	sturb	wzr, [x8, #-12]
	stur	w20, [x8, #-16]
	bl	_printf
	mov	x9, sp
	ldurh	w8, [x29, #-50]
	sub	x0, x9, #16
	mov	sp, x0
	stur	w21, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	ldur	s0, [x29, #-56]
	fcmp	s0, s8
	b.mi	LBB0_3
LBB0_4:                                 ; %while_exit
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w10, #30035                     ; =0x7553
	mov	w9, #8253                       ; =0x203d
	sturb	wzr, [x8, #-10]
	movk	w10, #8301, lsl #16
	sturh	w9, [x8, #-12]
	stur	w10, [x8, #-16]
	bl	_printf
	mov	x8, sp
	ldur	s0, [x29, #-56]
	sub	x0, x8, #16
	mov	sp, x0
	fcvt	d0, s0
	mov	w9, #26149                      ; =0x6625
	sturb	wzr, [x8, #-14]
	sturh	w9, [x8, #-16]
	str	d0, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
Lloh4:
	adrp	x19, _end_line_str@PAGE
Lloh5:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w9, #10                         ; =0xa
	mov	w10, #12576                     ; =0x3120
	sturh	w9, [x8, #-4]
	mov	x9, #30789                      ; =0x7845
	movk	w10, #13874, lsl #16
	movk	x9, #25968, lsl #16
	stur	w10, [x8, #-8]
	movk	x9, #29795, lsl #32
	movk	x9, #15648, lsl #48
	stur	x9, [x8, #-16]
	bl	_printf
	mov	x0, x19
	bl	_printf
	sub	sp, x29, #48
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp], #64               ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

.subsections_via_symbols
