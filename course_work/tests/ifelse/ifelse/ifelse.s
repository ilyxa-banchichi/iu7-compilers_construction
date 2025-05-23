	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	x26, x25, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	sub	sp, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	w8, #62441                      ; =0xf3e9
	mov	w20, #5                         ; =0x5
	sub	x0, x29, #84
	movk	w8, #16547, lsl #16
	sturh	w20, [x29, #-66]
	stur	w8, [x29, #-72]
	mov	x8, #28265                      ; =0x6e69
	movk	x8, #22132, lsl #16
	movk	x8, #29281, lsl #32
	movk	x8, #15648, lsl #48
	stur	x8, [x29, #-84]
	mov	w8, #13600                      ; =0x3520
	movk	w8, #10, lsl #16
	stur	w8, [x29, #-76]
	bl	_printf
Lloh0:
	adrp	x19, _end_line_str@PAGE
Lloh1:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	mov	w21, #26661                     ; =0x6825
	ldurh	w8, [x29, #-66]
	sub	x0, x29, #88
	movk	w21, #100, lsl #16
	stur	w21, [x29, #-88]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	mov	x22, #26963                     ; =0x6953
	mov	x8, #28265                      ; =0x6e69
	mov	x23, #26912                     ; =0x6920
	movk	x22, #26478, lsl #16
	movk	x8, #8293, lsl #16
	movk	x23, #29806, lsl #16
	movk	x22, #25964, lsl #32
	movk	x8, #26740, lsl #32
	movk	x23, #24918, lsl #32
	mov	w24, #8234                      ; =0x202a
	movk	x22, #27680, lsl #48
	movk	x8, #28261, lsl #48
	movk	x23, #8306, lsl #48
	movk	w24, #2610, lsl #16
	sub	x0, x29, #117
	stur	x22, [x29, #-117]
	stur	x8, [x29, #-109]
	stur	x23, [x29, #-101]
	stur	w24, [x29, #-93]
	sturb	wzr, [x29, #-89]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldursh	w8, [x29, #-66]
	ldur	s1, [x29, #-72]
	scvtf	s0, w8
	fcmp	s0, s1
	b.pl	LBB0_2
; %bb.1:                                ; %then
	ldurh	w8, [x29, #-66]
	lsl	w8, w8, #1
	sturh	w8, [x29, #-66]
LBB0_2:                                 ; %end
	mov	x9, sp
	ldurh	w8, [x29, #-66]
	sub	x0, x9, #16
	mov	sp, x0
	stur	w21, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #32
	mov	sp, x0
	mov	x9, #28265                      ; =0x6e69
	sturb	wzr, [x8, #-4]
	movk	x9, #8293, lsl #16
	stur	w24, [x8, #-8]
	movk	x9, #27749, lsl #32
	stur	x22, [x8, #-32]
	movk	x9, #25971, lsl #48
	stp	x9, x23, [x8, #-24]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldursh	w8, [x29, #-66]
	ldur	s1, [x29, #-72]
	mov	w9, #2                          ; =0x2
	scvtf	s0, w8
	fcmp	s0, s1
	csel	w9, w20, w9, mi
	mul	w8, w8, w9
	mov	x9, sp
	sub	x0, x9, #16
	sturh	w8, [x29, #-66]
	mov	sp, x0
	stur	w21, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	x21, #8293                      ; =0x2065
	mov	x22, #30029                     ; =0x754d
	movk	x21, #25972, lsl #16
	movk	x22, #29804, lsl #16
	movk	x21, #29811, lsl #32
	movk	x22, #27753, lsl #32
	movk	x21, #10, lsl #48
	movk	x22, #28265, lsl #48
	stp	x22, x21, [x8, #-16]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldursh	w8, [x29, #-66]
	scvtf	s0, w8
	mov	w8, #1112145920                 ; =0x424a0000
	fmov	s1, w8
	stur	w8, [x29, #-72]
	fcmp	s0, s1
	b.pl	LBB0_4
; %bb.3:                                ; %then.2
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w10, #26740                     ; =0x6874
	mov	w9, #10                         ; =0xa
	movk	w10, #28261, lsl #16
	sturh	w9, [x8, #-12]
	stur	w10, [x8, #-16]
	bl	_printf
Lloh2:
	adrp	x0, _end_line_str@PAGE
Lloh3:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	ldurh	w8, [x29, #-66]
	add	w8, w8, w8, lsl #2
	sturh	w8, [x29, #-66]
LBB0_4:                                 ; %end.2
	mov	x9, sp
	ldurh	w8, [x29, #-66]
	sub	x0, x9, #16
	mov	sp, x0
	mov	w20, #26661                     ; =0x6825
	movk	w20, #100, lsl #16
	stur	w20, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	stp	x22, x21, [x8, #-16]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldursh	w8, [x29, #-66]
	ldur	s1, [x29, #-72]
	scvtf	s0, w8
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	fcmp	s0, s1
	mov	w9, #101                        ; =0x65
	mov	w11, #110                       ; =0x6e
	mov	w12, #10                        ; =0xa
	mov	w10, #108                       ; =0x6c
	mov	w13, #115                       ; =0x73
	sturh	w12, [x8, #-12]
	mov	w12, #104                       ; =0x68
	csel	w11, w11, w9, mi
	csel	w13, w9, w13, mi
	csel	w10, w12, w10, mi
	sturb	w11, [x8, #-13]
	mov	w11, #116                       ; =0x74
	csel	w9, w11, w9, mi
	sturb	w13, [x8, #-14]
	sturb	w10, [x8, #-15]
	sturb	w9, [x8, #-16]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldurh	w8, [x29, #-66]
	mov	x9, sp
	sub	x0, x9, #16
	lsl	w8, w8, #1
	sturh	w8, [x29, #-66]
	mov	sp, x0
	stur	w20, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #32
	mov	sp, x0
	mov	x26, #26988                     ; =0x696c
	mov	x9, #8293                       ; =0x2065
	mov	x21, #26740                     ; =0x6874
	movk	x26, #25966, lsl #16
	movk	x9, #26995, lsl #16
	movk	x21, #28261, lsl #16
	movk	x26, #29728, lsl #32
	movk	x9, #26478, lsl #32
	movk	x21, #25888, lsl #32
	mov	w25, #2676                      ; =0xa74
	movk	x26, #29541, lsl #48
	movk	x9, #25964, lsl #48
	movk	x21, #29548, lsl #48
	sturb	wzr, [x8, #-6]
	sturh	w25, [x8, #-8]
	stp	x9, x26, [x8, #-24]
	stur	x21, [x8, #-32]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldursh	w8, [x29, #-66]
	mov	w22, #-5                        ; =0xfffffffb
	mov	w23, #-10000                    ; =0xffffd8f0
	mov	w24, #10000                     ; =0x2710
	cmp	w8, #1
	csel	w9, w23, w22, lt
	csinc	w10, w24, wzr, lt
	cmp	w8, #1000
	csel	w8, w10, w9, lt
	mov	x9, sp
	sub	x0, x9, #16
	sturh	w8, [x29, #-66]
	mov	sp, x0
	stur	w20, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #32
	mov	sp, x0
	mov	x9, #8302                       ; =0x206e
	mov	x10, #27749                     ; =0x6c65
	sturb	wzr, [x8, #-6]
	movk	x9, #26995, lsl #16
	movk	x10, #25971, lsl #16
	sturh	w25, [x8, #-8]
	movk	x9, #26478, lsl #32
	movk	x10, #29728, lsl #32
	movk	x9, #25964, lsl #48
	movk	x10, #25960, lsl #48
	stp	x9, x26, [x8, #-24]
	stur	x10, [x8, #-32]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldursh	w8, [x29, #-66]
	mov	w9, #1                          ; =0x1
	cmp	w8, w9
	tbz	w8, #31, LBB0_6
; %bb.5:                                ; %then.7
	csinc	w8, w24, wzr, lt
	b	LBB0_7
LBB0_6:                                 ; %else.7
	csel	w8, w23, w22, eq
LBB0_7:                                 ; %end.7
	mov	x9, sp
	sturh	w8, [x29, #-66]
	sub	x0, x9, #16
	mov	sp, x0
	mov	w10, #26661                     ; =0x6825
	movk	w10, #100, lsl #16
	stur	w10, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #32
	mov	sp, x0
	mov	w9, #2676                       ; =0xa74
	mov	w10, #29728                     ; =0x7420
	sturb	wzr, [x8, #-2]
	sturh	w9, [x8, #-4]
	mov	x9, #27765                      ; =0x6c75
	movk	w10, #29541, lsl #16
	movk	x9, #26996, lsl #16
	stur	w10, [x8, #-8]
	movk	x9, #26988, lsl #32
	movk	x9, #25966, lsl #48
	stur	x9, [x8, #-16]
	mov	x9, #8293                       ; =0x2065
	movk	x9, #26740, lsl #16
	movk	x9, #28261, lsl #32
	movk	x9, #27936, lsl #48
	stp	x21, x9, [x8, #-32]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldursh	w8, [x29, #-66]
	tbz	w8, #31, LBB0_10
; %bb.8:                                ; %then.10
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w21, #26740                     ; =0x6874
	mov	w20, #10                        ; =0xa
	movk	w21, #28261, lsl #16
	sturh	w20, [x8, #-12]
	stur	w21, [x8, #-16]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldursh	w8, [x29, #-66]
	sub	x0, sp, #16
	mov	sp, x0
	mov	w9, #-20000                     ; =0xffffb1e0
	cmp	w8, w9
	b.ge	LBB0_12
; %bb.9:                                ; %then.11
	strh	w20, [x0, #4]
	str	w21, [x0]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #10000                      ; =0x2710
	b	LBB0_11
LBB0_10:                                ; %else.10
	ldurh	w8, [x29, #-66]
	mov	w9, #-10000                     ; =0xffffd8f0
	cmp	w8, #1
	mov	w8, #-5                         ; =0xfffffffb
	csel	w8, w9, w8, eq
LBB0_11:                                ; %end.10
	mov	x9, sp
	sturh	w8, [x29, #-66]
	sub	x0, x9, #16
	mov	sp, x0
	mov	w10, #26661                     ; =0x6825
	movk	w10, #100, lsl #16
	stur	w10, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
Lloh4:
	adrp	x0, _end_line_str@PAGE
Lloh5:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	sub	sp, x29, #64
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
LBB0_12:                                ; %else.11
	strh	w20, [x0, #4]
	mov	w20, #27749                     ; =0x6c65
	movk	w20, #25971, lsl #16
	str	w20, [x0]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldursh	w8, [x29, #-66]
	mov	w9, #-14999                     ; =0xffffc569
	cmp	w8, w9
	b.lt	LBB0_14
; %bb.13:                               ; %then.12
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w10, #26740                     ; =0x6874
	mov	w9, #10                         ; =0xa
	movk	w10, #28261, lsl #16
	sturh	w9, [x8, #-12]
	stur	w10, [x8, #-16]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #1                          ; =0x1
	b	LBB0_11
LBB0_14:                                ; %else.12
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	sturb	wzr, [x8, #-12]
	stur	w20, [x8, #-16]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #65535                      ; =0xffff
	b	LBB0_11
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

.subsections_via_symbols
