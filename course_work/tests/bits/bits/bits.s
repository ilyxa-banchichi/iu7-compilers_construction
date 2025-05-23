	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #336
	stp	x26, x25, [sp, #256]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #272]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #288]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #304]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #320]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 336
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
	mov	x8, #29285                      ; =0x7265
	mov	x9, #24415                      ; =0x5f5f
	add	x22, sp, #113
	movk	x8, #29728, lsl #16
	movk	x9, #18783, lsl #16
	mov	w20, #10                        ; =0xa
	movk	x8, #29541, lsl #32
	movk	x9, #29806, lsl #32
	add	x0, sp, #235
	movk	x8, #29556, lsl #48
	movk	x9, #26469, lsl #48
	strh	w20, [x22, #138]
	stur	x8, [x22, #130]
	stur	x9, [x22, #122]
	bl	_printf
Lloh0:
	adrp	x19, _end_line_str@PAGE
Lloh1:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	mov	w24, #26661                     ; =0x6825
	mov	w21, #101                       ; =0x65
	add	x0, sp, #231
	movk	w24, #100, lsl #16
	strh	w21, [sp, #254]
	stur	w24, [x22, #118]
	str	x21, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28265                      ; =0x6e69
	mov	w9, #8306                       ; =0x2072
	add	x0, sp, #218
	movk	x8, #22132, lsl #16
	movk	w9, #2610, lsl #16
	strb	wzr, [sp, #230]
	movk	x8, #29281, lsl #32
	stur	w9, [sp, #226]
	movk	x8, #28448, lsl #48
	stur	x8, [sp, #218]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrh	w8, [sp, #254]
	add	x0, sp, #214
	stur	w24, [sp, #214]
	orr	w8, w8, #0x2
	strh	w8, [sp, #254]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28265                      ; =0x6e69
	mov	w9, #25710                      ; =0x646e
	add	x0, sp, #199
	movk	x8, #22132, lsl #16
	movk	w9, #14368, lsl #16
	strb	wzr, [sp, #213]
	movk	x8, #29281, lsl #32
	stur	w9, [x22, #94]
	movk	x8, #24864, lsl #48
	stur	x8, [x22, #86]
	mov	w8, #2611                       ; =0xa33
	strh	w8, [x22, #98]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrh	w8, [sp, #254]
	mov	w23, #83                        ; =0x53
	add	x0, sp, #195
	stur	w24, [x22, #82]
	and	w8, w8, w23
	strh	w8, [sp, #254]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x25, #28265                     ; =0x6e69
	mov	w8, #27752                      ; =0x6c68
	add	x0, sp, #181
	movk	x25, #22132, lsl #16
	movk	w8, #12832, lsl #16
	strh	w20, [x22, #80]
	movk	x25, #29281, lsl #32
	str	w8, [x22, #76]
	movk	x25, #29472, lsl #48
	stur	x25, [x22, #68]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrh	w8, [sp, #254]
	add	x0, sp, #177
	str	w24, [x22, #64]
	lsl	w8, w8, #2
	strh	w8, [sp, #254]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #29288                      ; =0x7268
	add	x0, sp, #163
	stur	x25, [x22, #50]
	movk	w8, #12832, lsl #16
	strh	w20, [x22, #62]
	stur	w8, [x22, #58]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrh	w8, [sp, #254]
	add	x0, sp, #159
	stur	w24, [x22, #46]
	lsr	w8, w8, #2
	strh	w8, [sp, #254]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28526                      ; =0x6f6e
	mov	w9, #29281                      ; =0x7261
	add	x0, sp, #147
	movk	x8, #8308, lsl #16
	movk	w9, #10, lsl #16
	movk	x8, #28265, lsl #32
	stur	w9, [x22, #42]
	movk	x8, #22132, lsl #48
	stur	x8, [x22, #34]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrh	w8, [sp, #254]
	add	x0, sp, #143
	stur	w24, [x22, #30]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #24415                      ; =0x5f5f
	mov	x9, #29992                      ; =0x7528
	add	x0, sp, #113
	movk	x8, #16991, lsl #16
	movk	x9, #29550, lsl #16
	strh	w20, [x22, #28]
	movk	x8, #29817, lsl #32
	movk	x9, #26473, lsl #32
	movk	x8, #8293, lsl #48
	movk	x9, #25966, lsl #48
	stur	x8, [sp, #113]
	mov	x8, #8292                       ; =0x2064
	movk	x8, #28265, lsl #16
	stur	x9, [sp, #121]
	movk	x8, #10612, lsl #32
	movk	x8, #29728, lsl #48
	stur	x8, [sp, #129]
	mov	w8, #29541                      ; =0x7365
	movk	w8, #29556, lsl #16
	stur	w8, [sp, #137]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w22, #26661                     ; =0x6825
	add	x0, sp, #108
	strb	w21, [sp, #253]
	movk	w22, #30056, lsl #16
	strb	wzr, [sp, #112]
	str	w22, [sp, #108]
	str	x21, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x21, #31074                     ; =0x7962
	mov	w8, #29295                      ; =0x726f
	add	x0, sp, #94
	movk	x21, #25972, lsl #16
	movk	w8, #12832, lsl #16
	strh	w20, [sp, #106]
	movk	x21, #24918, lsl #32
	stur	w8, [sp, #102]
	movk	x21, #8306, lsl #48
	stur	x21, [sp, #94]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #253]
	add	x0, sp, #89
	stur	w22, [sp, #89]
	strb	wzr, [sp, #93]
	orr	w8, w8, #0x2
	strb	w8, [sp, #253]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28257                      ; =0x6e61
	add	x0, sp, #73
	stur	x21, [sp, #73]
	movk	x8, #8292, lsl #16
	movk	x8, #13112, lsl #32
	movk	x8, #10, lsl #48
	stur	x8, [sp, #81]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #253]
	add	x0, sp, #68
	str	w22, [sp, #68]
	strb	wzr, [sp, #72]
	and	w8, w8, w23
	strb	w8, [sp, #253]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #26739                      ; =0x6873
	mov	w9, #2609                       ; =0xa31
	add	x0, sp, #53
	movk	w8, #8300, lsl #16
	stur	x21, [sp, #53]
	stur	w8, [sp, #61]
	sturh	w9, [sp, #65]
	strb	wzr, [sp, #67]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #253]
	add	x0, sp, #48
	str	w22, [sp, #48]
	strb	wzr, [sp, #52]
	lsl	w8, w8, #1
	strb	w8, [sp, #253]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #26739                      ; =0x6873
	mov	w9, #2610                       ; =0xa32
	add	x0, sp, #33
	movk	w8, #8306, lsl #16
	stur	x21, [sp, #33]
	stur	w8, [sp, #41]
	sturh	w9, [sp, #45]
	strb	wzr, [sp, #47]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #253]
	add	x0, sp, #28
	str	w22, [sp, #28]
	strb	wzr, [sp, #32]
	lsr	w8, w8, #1
	strb	w8, [sp, #253]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28526                      ; =0x6f6e
	mov	w9, #24918                      ; =0x6156
	add	x0, sp, #15
	movk	x8, #8308, lsl #16
	movk	w9, #2674, lsl #16
	strb	wzr, [sp, #27]
	movk	x8, #31074, lsl #32
	stur	w9, [sp, #23]
	movk	x8, #25972, lsl #48
	stur	x8, [sp, #15]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #253]
	add	x0, sp, #10
	stur	w22, [sp, #10]
	strb	wzr, [sp, #14]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldp	x29, x30, [sp, #320]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #304]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #288]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #272]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #256]            ; 16-byte Folded Reload
	add	sp, sp, #336
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

.subsections_via_symbols
