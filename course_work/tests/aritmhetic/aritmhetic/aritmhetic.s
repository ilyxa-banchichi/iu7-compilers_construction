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
	sub	sp, sp, #416
	.cfi_def_cfa_offset 528
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
	mov	x8, #29285                      ; =0x7265
	mov	x9, #24415                      ; =0x5f5f
	add	x20, sp, #148
	movk	x8, #29728, lsl #16
	movk	x9, #18783, lsl #16
	mov	w21, #10                        ; =0xa
	movk	x8, #29541, lsl #32
	movk	x9, #29806, lsl #32
	add	x0, sp, #374
	movk	x8, #29556, lsl #48
	movk	x9, #26469, lsl #48
	strh	w21, [x20, #242]
	stur	x8, [x20, #234]
	stur	x9, [x20, #226]
	bl	_printf
Lloh0:
	adrp	x19, _end_line_str@PAGE
Lloh1:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	mov	w28, #26661                     ; =0x6825
	mov	w22, #101                       ; =0x65
	add	x0, sp, #370
	movk	w28, #100, lsl #16
	strh	w22, [x20, #266]
	stur	w28, [x20, #222]
	str	x22, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x23, #28265                     ; =0x6e69
	mov	w24, #12832                     ; =0x3220
	add	x0, sp, #358
	movk	x23, #22132, lsl #16
	movk	w24, #10, lsl #16
	movk	x23, #29281, lsl #32
	stur	w24, [x20, #218]
	movk	x23, #11040, lsl #48
	stur	x23, [x20, #210]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrh	w8, [x20, #266]
	add	x0, sp, #354
	stur	w28, [x20, #206]
	add	w8, w8, #2
	strh	w8, [x20, #266]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28265                      ; =0x6e69
	mov	w9, #12576                      ; =0x3120
	add	x0, sp, #342
	movk	x8, #22132, lsl #16
	movk	w9, #10, lsl #16
	movk	x8, #29281, lsl #32
	stur	w9, [x20, #202]
	movk	x8, #11552, lsl #48
	stur	x8, [x20, #194]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrh	w8, [x20, #266]
	add	x0, sp, #338
	stur	w28, [x20, #190]
	sub	w8, w8, #1
	strh	w8, [x20, #266]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28265                      ; =0x6e69
	mov	w9, #12832                      ; =0x3220
	add	x0, sp, #325
	movk	x8, #22132, lsl #16
	movk	w9, #2610, lsl #16
	strb	wzr, [sp, #337]
	movk	x8, #29281, lsl #32
	stur	w9, [x20, #185]
	movk	x8, #10784, lsl #48
	stur	x8, [x20, #177]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrh	w8, [x20, #266]
	mov	w9, #22                         ; =0x16
	add	x0, sp, #321
	stur	w28, [x20, #173]
	mul	w8, w8, w9
	strh	w8, [x20, #266]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28265                      ; =0x6e69
	mov	w9, #12576                      ; =0x3120
	add	x0, sp, #308
	movk	x8, #22132, lsl #16
	movk	w9, #2611, lsl #16
	strb	wzr, [sp, #320]
	movk	x8, #29281, lsl #32
	str	w9, [x20, #168]
	movk	x8, #12064, lsl #48
	str	x8, [x20, #160]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrsh	w8, [x20, #266]
	fmov	s8, #13.00000000
	mov	w25, #26149                     ; =0x6625
	add	x0, sp, #305
	strb	wzr, [sp, #307]
	scvtf	s0, w8
	add	x8, sp, #50
	sturh	w25, [x8, #255]
	fdiv	s0, s0, s8
	fcvt	d1, s0
	str	s0, [x20, #252]
	str	d1, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28265                      ; =0x6e69
	mov	w9, #30313                      ; =0x7669
	mov	w27, #2611                      ; =0xa33
	movk	x8, #22132, lsl #16
	movk	w9, #12576, lsl #16
	add	x0, sp, #290
	movk	x8, #29281, lsl #32
	stur	w9, [x20, #150]
	movk	x8, #25632, lsl #48
	strh	w27, [x20, #154]
	stur	x8, [x20, #142]
	strb	wzr, [sp, #304]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrsh	w8, [x20, #266]
	mov	w26, #20165                     ; =0x4ec5
	add	x0, sp, #286
	stur	w28, [x20, #138]
	mul	w8, w8, w26
	asr	w9, w8, #18
	add	w8, w9, w8, lsr #31
	strh	w8, [x20, #266]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28265                      ; =0x6e69
	mov	w9, #25711                      ; =0x646f
	add	x10, sp, #16
	movk	x8, #22132, lsl #16
	movk	w9, #12576, lsl #16
	add	x0, sp, #271
	movk	x8, #29281, lsl #32
	strb	wzr, [sp, #285]
	movk	x8, #27936, lsl #48
	stur	x8, [x10, #255]
	add	x8, sp, #24
	stur	w9, [x8, #255]
	add	x8, sp, #28
	sturh	w27, [x8, #255]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrsh	w8, [x20, #266]
	add	x0, sp, #267
	mul	w9, w8, w26
	mov	w26, #13                        ; =0xd
	asr	w10, w9, #18
	add	w9, w10, w9, lsr #31
	msub	w8, w9, w26, w8
	add	x9, sp, #12
	stur	w28, [x9, #255]
	strh	w8, [x20, #266]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #24415                      ; =0x5f5f
	mov	x9, #29728                      ; =0x7420
	add	x0, sp, #251
	movk	x8, #18015, lsl #16
	movk	x9, #29541, lsl #16
	movk	x8, #28524, lsl #32
	movk	x9, #29556, lsl #32
	movk	x8, #29793, lsl #48
	movk	x9, #10, lsl #48
	stur	x8, [x20, #103]
	stur	x9, [x20, #111]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #1120534528                 ; =0x42ca0000
	add	x0, sp, #248
	strh	w25, [x20, #100]
	str	w8, [x20, #252]
	mov	x8, #70368744177664             ; =0x400000000000
	movk	x8, #16473, lsl #48
	strb	wzr, [sp, #250]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x28, #27750                     ; =0x6c66
	mov	w8, #11040                      ; =0x2b20
	add	x0, sp, #234
	movk	x28, #24943, lsl #16
	movk	w8, #12832, lsl #16
	strh	w21, [x20, #98]
	movk	x28, #22132, lsl #32
	stur	w8, [x20, #94]
	movk	x28, #29281, lsl #48
	stur	x28, [x20, #86]
	bl	_printf
	mov	x0, x19
	bl	_printf
	fmov	s0, #2.00000000
	ldr	s1, [x20, #252]
	add	x0, sp, #231
	sturh	w25, [sp, #231]
	strb	wzr, [sp, #233]
	fadd	s0, s1, s0
	fcvt	d1, s0
	str	s0, [x20, #252]
	str	d1, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #11552                      ; =0x2d20
	add	x0, sp, #217
	stur	x28, [x20, #69]
	movk	w8, #12576, lsl #16
	sturh	w21, [sp, #229]
	stur	w8, [x20, #77]
	bl	_printf
	mov	x0, x19
	bl	_printf
	fmov	s0, #-1.00000000
	ldr	s1, [x20, #252]
	add	x0, sp, #214
	strh	w25, [x20, #66]
	strb	wzr, [sp, #216]
	fadd	s0, s1, s0
	fcvt	d1, s0
	str	s0, [x20, #252]
	str	d1, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #10784                      ; =0x2a20
	mov	w9, #2610                       ; =0xa32
	add	x0, sp, #199
	movk	w8, #12832, lsl #16
	stur	x28, [sp, #199]
	stur	w8, [sp, #207]
	sturh	w9, [sp, #211]
	strb	wzr, [sp, #213]
	bl	_printf
	mov	x0, x19
	bl	_printf
	fmov	s0, #22.00000000
	ldr	s1, [x20, #252]
	add	x0, sp, #196
	strh	w25, [x20, #48]
	strb	wzr, [sp, #198]
	fmul	s0, s1, s0
	fcvt	d1, s0
	str	s0, [x20, #252]
	str	d1, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #12064                      ; =0x2f20
	add	x0, sp, #181
	stur	x28, [x20, #33]
	movk	w8, #12576, lsl #16
	sturh	w27, [sp, #193]
	stur	w8, [x20, #41]
	strb	wzr, [sp, #195]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldr	s0, [x20, #252]
	add	x0, sp, #178
	strh	w25, [x20, #30]
	strb	wzr, [sp, #180]
	fdiv	s0, s0, s8
	fcvt	d1, s0
	str	s0, [x20, #252]
	str	d1, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #24415                      ; =0x5f5f
	mov	x9, #29992                      ; =0x7528
	add	x0, sp, #148
	movk	x8, #16991, lsl #16
	movk	x9, #29550, lsl #16
	strh	w21, [x20, #28]
	movk	x8, #29817, lsl #32
	movk	x9, #26473, lsl #32
	movk	x8, #8293, lsl #48
	movk	x9, #25966, lsl #48
	stur	x8, [sp, #148]
	mov	x8, #8292                       ; =0x2064
	movk	x8, #28265, lsl #16
	stur	x9, [sp, #156]
	movk	x8, #10612, lsl #32
	movk	x8, #29728, lsl #48
	str	x8, [x20, #16]
	mov	w8, #29541                      ; =0x7365
	movk	w8, #29556, lsl #16
	str	w8, [x20, #24]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w27, #26661                     ; =0x6825
	add	x0, sp, #143
	strb	w22, [sp, #407]
	movk	w27, #30056, lsl #16
	strb	wzr, [sp, #147]
	stur	w27, [sp, #143]
	str	x22, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	add	x0, sp, #131
	stur	x23, [sp, #131]
	stur	w24, [sp, #139]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #407]
	add	x0, sp, #126
	stur	w27, [sp, #126]
	strb	wzr, [sp, #130]
	add	w8, w8, #2
	strb	w8, [sp, #407]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x22, #31074                     ; =0x7962
	mov	w8, #8237                       ; =0x202d
	add	x0, sp, #113
	movk	x22, #25972, lsl #16
	movk	w8, #2609, lsl #16
	strb	wzr, [sp, #125]
	movk	x22, #24918, lsl #32
	stur	w8, [sp, #121]
	movk	x22, #8306, lsl #48
	stur	x22, [sp, #113]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #407]
	add	x0, sp, #108
	str	w27, [sp, #108]
	strb	wzr, [sp, #112]
	sub	w8, w8, #1
	strb	w8, [sp, #407]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #8234                       ; =0x202a
	add	x0, sp, #95
	stur	x22, [sp, #95]
	movk	w8, #2610, lsl #16
	strb	wzr, [sp, #107]
	stur	w8, [sp, #103]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #407]
	add	x0, sp, #90
	stur	w27, [sp, #90]
	strb	wzr, [sp, #94]
	lsl	w8, w8, #1
	strb	w8, [sp, #407]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #8239                       ; =0x202f
	add	x0, sp, #76
	stur	x22, [sp, #76]
	movk	w8, #13105, lsl #16
	strh	w21, [sp, #88]
	str	w8, [sp, #84]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldr	b0, [sp, #407]
	add	x0, sp, #73
	sturh	w25, [sp, #73]
	strb	wzr, [sp, #75]
	ucvtf	s0, s0
	fdiv	s0, s0, s8
	fcvt	d1, s0
	str	s0, [x20, #252]
	str	d1, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #26980                      ; =0x6964
	add	x0, sp, #57
	stur	x22, [sp, #57]
	movk	x8, #8310, lsl #16
	movk	x8, #13105, lsl #32
	movk	x8, #10, lsl #48
	stur	x8, [sp, #65]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #407]
	mov	w20, #79                        ; =0x4f
	add	x0, sp, #52
	str	w27, [sp, #52]
	mul	w8, w8, w20
	strb	wzr, [sp, #56]
	lsr	w8, w8, #10
	strb	w8, [sp, #407]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28525                      ; =0x6f6d
	add	x0, sp, #36
	stur	x22, [sp, #36]
	movk	x8, #8292, lsl #16
	movk	x8, #13105, lsl #32
	movk	x8, #10, lsl #48
	stur	x8, [sp, #44]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #407]
	add	x0, sp, #31
	stur	w27, [sp, #31]
	strb	wzr, [sp, #35]
	mul	w9, w8, w20
	lsr	w9, w9, #10
	msub	w8, w9, w26, w8
	strb	w8, [sp, #407]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	add	sp, sp, #416
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp], #112              ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

.subsections_via_symbols
