	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	d9, d8, [sp, #-112]!            ; 16-byte Folded Spill
	stp	x28, x27, [sp, #16]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	sub	sp, sp, #464
	.cfi_def_cfa_offset 576
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
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	mov	w9, #10                         ; =0xa
	add	x10, sp, #198
	mov	x8, #29285                      ; =0x7265
	sturh	w9, [x10, #255]
	mov	x9, #24415                      ; =0x5f5f
	movk	x8, #29728, lsl #16
	movk	x9, #18783, lsl #16
	movk	x8, #29541, lsl #32
	add	x21, sp, #405
	movk	x9, #29806, lsl #32
	movk	x8, #29556, lsl #48
	add	x0, sp, #437
	movk	x9, #26469, lsl #48
	mov	w20, #10                        ; =0xa
	add	x24, sp, #139
	stp	x9, x8, [x21, #32]
	bl	_printf
Lloh0:
	adrp	x19, _end_line_str@PAGE
Lloh1:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	mov	x27, #28265                     ; =0x6e69
	mov	x26, #8253                      ; =0x203d
	mov	w8, #5                          ; =0x5
	movk	x27, #22132, lsl #16
	movk	x26, #28265, lsl #16
	mov	w25, #1                         ; =0x1
	movk	x27, #29281, lsl #32
	movk	x26, #22132, lsl #32
	sturh	w8, [x21, #57]
	movk	x27, #15648, lsl #48
	movk	x26, #29281, lsl #48
	add	x8, sp, #180
	add	x0, sp, #419
	strb	w25, [sp, #455]
	stur	x27, [x21, #14]
	stur	x26, [x21, #22]
	sturh	w20, [x8, #255]
	mov	w20, #10                        ; =0xa
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
Lloh2:
	adrp	x22, _true_value_str@PAGE
Lloh3:
	add	x22, x22, _true_value_str@PAGEOFF
Lloh4:
	adrp	x23, _false_value_str@PAGE
Lloh5:
	add	x23, x23, _false_value_str@PAGEOFF
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldurh	w8, [x21, #57]
	str	x27, [x21]
	mov	w27, #8253                      ; =0x203d
	movk	w27, #12337, lsl #16
	add	x0, sp, #405
	cmp	w8, #10
	str	w27, [x21, #8]
	cset	w8, eq
	strb	w8, [sp, #455]
	add	x8, sp, #162
	sturh	w20, [x8, #255]
	mov	w20, #10                        ; =0xa
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x9, #28265                      ; =0x6e69
	ldurh	w8, [x21, #57]
	add	x10, sp, #144
	movk	x9, #22132, lsl #16
	add	x0, sp, #391
	stur	w27, [x10, #255]
	movk	x9, #29281, lsl #32
	cmp	w8, #10
	add	x8, sp, #136
	movk	x9, #8480, lsl #48
	stur	x9, [x8, #255]
	cset	w8, ne
	strb	w8, [sp, #455]
	add	x8, sp, #148
	sturh	w20, [x8, #255]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x27, #28265                     ; =0x6e69
	mov	x28, #26912                     ; =0x6920
	add	x0, sp, #374
	movk	x27, #22132, lsl #16
	movk	x28, #29806, lsl #16
	strb	wzr, [sp, #455]
	movk	x27, #29281, lsl #32
	movk	x28, #24918, lsl #32
	strb	wzr, [sp, #390]
	movk	x27, #15904, lsl #48
	movk	x28, #2674, lsl #48
	stur	x27, [x24, #235]
	stur	x28, [x24, #243]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x20, #28265                     ; =0x6e69
	add	x0, sp, #357
	strb	wzr, [sp, #455]
	movk	x20, #22132, lsl #16
	stur	x28, [x24, #226]
	movk	x20, #29281, lsl #32
	strb	wzr, [sp, #373]
	movk	x20, #15392, lsl #48
	stur	x20, [x24, #218]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	stp	x27, x26, [x24, #200]
	mov	w27, #10                        ; =0xa
	add	x8, sp, #100
	add	x0, sp, #339
	strb	w25, [sp, #455]
	sturh	w27, [x8, #255]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	add	x8, sp, #82
	add	x0, sp, #321
	strb	w25, [sp, #455]
	stur	x20, [x24, #182]
	stur	x26, [x24, #190]
	sturh	w27, [x8, #255]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #24415                      ; =0x5f5f
	mov	x26, #29728                     ; =0x7420
	add	x0, sp, #305
	movk	x8, #16991, lsl #16
	movk	x26, #29541, lsl #16
	movk	x8, #29817, lsl #32
	movk	x26, #29556, lsl #32
	movk	x8, #29541, lsl #48
	movk	x26, #10, lsl #48
	stur	x8, [x24, #166]
	stur	x26, [x24, #174]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #200                        ; =0xc8
	mov	x27, #31074                     ; =0x7962
	mov	w28, #29281                     ; =0x7261
	strb	w8, [sp, #461]
	mov	x8, #15677                      ; =0x3d3d
	movk	x27, #25972, lsl #16
	movk	x8, #25120, lsl #16
	movk	x27, #24918, lsl #32
	movk	w28, #10, lsl #16
	movk	x8, #29817, lsl #32
	movk	x27, #8306, lsl #48
	add	x0, sp, #285
	movk	x8, #22117, lsl #48
	strb	w25, [sp, #455]
	stur	x27, [x24, #146]
	stur	x8, [x24, #154]
	stur	w28, [x24, #162]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #461]
	mov	w9, #15677                      ; =0x3d3d
	mov	w20, #2608                      ; =0xa30
	movk	w9, #12576, lsl #16
	add	x0, sp, #270
	stur	x27, [x24, #131]
	cmp	w8, #10
	stur	w9, [x24, #139]
	cset	w8, eq
	sturh	w20, [x24, #143]
	strb	w8, [sp, #455]
	strb	wzr, [sp, #284]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #461]
	mov	w9, #15649                      ; =0x3d21
	add	x10, sp, #12
	movk	w9, #12576, lsl #16
	add	x0, sp, #255
	stur	x27, [sp, #255]
	cmp	w8, #10
	add	x8, sp, #8
	sturh	w20, [x10, #255]
	stur	w9, [x8, #255]
	cset	w8, ne
	strb	w8, [sp, #455]
	strb	wzr, [sp, #269]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #8254                       ; =0x203e
	mov	w20, #2674                      ; =0xa72
	add	x0, sp, #236
	movk	x8, #31074, lsl #16
	strb	wzr, [sp, #455]
	movk	x8, #25972, lsl #32
	stur	x27, [x24, #97]
	movk	x8, #24918, lsl #48
	sturh	w20, [x24, #113]
	stur	x8, [x24, #105]
	strb	wzr, [sp, #254]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #8252                       ; =0x203c
	add	x0, sp, #217
	strb	wzr, [sp, #455]
	movk	x8, #31074, lsl #16
	stur	x27, [x24, #78]
	movk	x8, #25972, lsl #32
	sturh	w20, [sp, #233]
	movk	x8, #24918, lsl #48
	strb	wzr, [sp, #235]
	stur	x8, [x24, #86]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #15678                      ; =0x3d3e
	add	x0, sp, #197
	strb	w25, [sp, #455]
	movk	x8, #25120, lsl #16
	stur	x27, [x24, #58]
	movk	x8, #29817, lsl #32
	stur	w28, [x24, #74]
	movk	x8, #22117, lsl #48
	stur	x8, [x24, #66]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #15676                      ; =0x3d3c
	add	x0, sp, #177
	strb	w25, [sp, #455]
	movk	x8, #25120, lsl #16
	stur	x27, [x24, #38]
	movk	x8, #29817, lsl #32
	stur	w28, [x24, #54]
	movk	x8, #22117, lsl #48
	stur	x8, [x24, #46]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #24415                      ; =0x5f5f
	add	x0, sp, #161
	stur	x26, [x24, #30]
	movk	x8, #18015, lsl #16
	movk	x8, #28524, lsl #32
	movk	x8, #29793, lsl #48
	stur	x8, [x24, #22]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #6449                       ; =0x1931
	strb	w25, [sp, #455]
	mov	x25, #27750                     ; =0x6c66
	movk	w8, #16800, lsl #16
	movk	x25, #24943, lsl #16
	add	x0, sp, #139
	stur	w8, [x21, #51]
	mov	x8, #15648                      ; =0x3d20
	movk	x25, #22132, lsl #32
	movk	x8, #8253, lsl #16
	movk	x25, #29281, lsl #48
	movk	x8, #27750, lsl #32
	stur	x25, [sp, #139]
	movk	x8, #24943, lsl #48
	str	x8, [x24, #8]
	mov	w24, #22132                     ; =0x5674
	mov	w8, #10                         ; =0xa
	movk	w24, #29281, lsl #16
	sturh	w8, [sp, #159]
	stur	w24, [sp, #155]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #1092878336                 ; =0x41240000
	ldur	s0, [x21, #51]
	mov	w20, #2613                      ; =0xa35
	fmov	s8, w8
	mov	x8, #15648                      ; =0x3d20
	add	x0, sp, #120
	movk	x8, #8253, lsl #16
	strh	w20, [sp, #136]
	movk	x8, #12337, lsl #32
	strb	wzr, [sp, #138]
	fcmp	s0, s8
	movk	x8, #12846, lsl #48
	stp	x25, x8, [sp, #120]
	cset	w8, eq
	strb	w8, [sp, #455]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldur	s0, [x21, #51]
	mov	x8, #8480                       ; =0x2120
	add	x0, sp, #101
	movk	x8, #8253, lsl #16
	sturh	w20, [sp, #117]
	fcmp	s0, s8
	movk	x8, #12337, lsl #32
	stur	x25, [sp, #101]
	movk	x8, #12846, lsl #48
	strb	wzr, [sp, #119]
	stur	x8, [sp, #109]
	cset	w9, mi
	csinc	w8, w9, wzr, le
	strb	w8, [sp, #455]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #15904                      ; =0x3e20
	mov	w20, #24918                     ; =0x6156
	add	x0, sp, #80
	movk	x8, #26144, lsl #16
	movk	w20, #2674, lsl #16
	strb	wzr, [sp, #455]
	movk	x8, #28524, lsl #32
	str	w20, [sp, #96]
	movk	x8, #29793, lsl #48
	strb	wzr, [sp, #100]
	stp	x25, x8, [sp, #80]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #15392                      ; =0x3c20
	add	x0, sp, #59
	strb	wzr, [sp, #455]
	movk	x8, #26144, lsl #16
	stur	x25, [sp, #59]
	movk	x8, #28524, lsl #32
	stur	w20, [sp, #75]
	movk	x8, #29793, lsl #48
	strb	wzr, [sp, #79]
	stur	x8, [sp, #67]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldur	s0, [x21, #51]
	mov	x8, #15904                      ; =0x3e20
	mov	w20, #10                        ; =0xa
	movk	x8, #8253, lsl #16
	add	x0, sp, #37
	stur	w24, [sp, #53]
	fcmp	s0, s0
	movk	x8, #27750, lsl #32
	stur	x25, [sp, #37]
	movk	x8, #24943, lsl #48
	sturh	w20, [sp, #57]
	stur	x8, [sp, #45]
	cset	w8, vc
	strb	w8, [sp, #455]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldur	s0, [x21, #51]
	mov	x8, #15392                      ; =0x3c20
	add	x0, sp, #15
	movk	x8, #8253, lsl #16
	stur	w24, [sp, #31]
	fcmp	s0, s0
	movk	x8, #27750, lsl #32
	stur	x25, [sp, #15]
	movk	x8, #24943, lsl #48
	sturh	w20, [sp, #35]
	stur	x8, [sp, #23]
	cset	w8, vc
	strb	w8, [sp, #455]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #455]
	cmp	w8, #0
	csel	x0, x22, x23, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	add	sp, sp, #464
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp], #112              ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

_true_value_str:                        ; @true_value_str
	.asciz	"true"

_false_value_str:                       ; @false_value_str
	.asciz	"false"

.subsections_via_symbols
