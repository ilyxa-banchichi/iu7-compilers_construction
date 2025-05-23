	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #272
	stp	x28, x27, [sp, #176]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #192]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #208]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #224]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #240]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #256]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 272
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
	add	x8, sp, #151
	mov	w9, #10                         ; =0xa
	mov	x23, #8241                      ; =0x2031
	strh	w9, [x8, #20]
	mov	x9, #2661                       ; =0xa65
	movk	x23, #15677, lsl #16
	movk	x9, #8242, lsl #16
	mov	w10, #27745                     ; =0x6c61
	movk	x23, #29728, lsl #32
	movk	x9, #15677, lsl #32
	movk	w10, #25971, lsl #16
	movk	x23, #30066, lsl #48
	movk	x9, #26144, lsl #48
	add	x0, sp, #151
	str	w10, [x8, #16]
	stp	x23, x9, [x8]
	bl	_printf
Lloh0:
	adrp	x19, _end_line_str@PAGE
Lloh1:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	mov	w28, #28257                     ; =0x6e61
	mov	w22, #1                         ; =0x1
	add	x0, sp, #146
	movk	w28, #2660, lsl #16
	strb	wzr, [sp, #174]
	strb	w22, [sp, #175]
	strb	wzr, [sp, #173]
	stur	w28, [sp, #146]
	strb	wzr, [sp, #150]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #173]
Lloh2:
	adrp	x20, _true_value_str@PAGE
Lloh3:
	add	x20, x20, _true_value_str@PAGEOFF
Lloh4:
	adrp	x21, _false_value_str@PAGE
Lloh5:
	add	x21, x21, _false_value_str@PAGEOFF
	cmp	w8, #0
	csel	x0, x20, x21, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #2661                       ; =0xa65
	mov	w9, #30066                      ; =0x7572
	add	x0, sp, #125
	movk	x8, #8242, lsl #16
	movk	w9, #2661, lsl #16
	stur	x23, [sp, #125]
	movk	x8, #15677, lsl #32
	stur	w9, [sp, #141]
	movk	x8, #29728, lsl #48
	strb	wzr, [sp, #145]
	stur	x8, [sp, #133]
	bl	_printf
	mov	x0, x19
	bl	_printf
	add	x0, sp, #120
	strb	w22, [sp, #175]
	strb	w22, [sp, #174]
	strb	w22, [sp, #173]
	str	w28, [sp, #120]
	strb	wzr, [sp, #124]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #173]
	cmp	w8, #0
	csel	x0, x20, x21, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x24, #8241                      ; =0x2031
	mov	x25, #25971                     ; =0x6573
	mov	w26, #24934                     ; =0x6166
	movk	x24, #15677, lsl #16
	movk	x25, #12810, lsl #16
	movk	w26, #29548, lsl #16
	movk	x24, #26144, lsl #32
	movk	x25, #15648, lsl #32
	mov	w27, #2661                      ; =0xa65
	movk	x24, #27745, lsl #48
	movk	x25, #8253, lsl #48
	add	x0, sp, #97
	stur	x24, [sp, #97]
	stur	x25, [sp, #105]
	stur	w26, [sp, #113]
	sturh	w27, [sp, #117]
	strb	wzr, [sp, #119]
	bl	_printf
	mov	x0, x19
	bl	_printf
	add	x0, sp, #92
	strh	wzr, [sp, #174]
	strb	wzr, [sp, #173]
	str	w28, [sp, #92]
	strb	wzr, [sp, #96]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #173]
	cmp	w8, #0
	csel	x0, x20, x21, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #2661                       ; =0xa65
	add	x0, sp, #70
	stur	x23, [sp, #70]
	movk	x8, #8242, lsl #16
	movk	x8, #15677, lsl #32
	movk	x8, #26144, lsl #48
	stur	x8, [sp, #78]
	mov	w8, #27745                      ; =0x6c61
	movk	w8, #25971, lsl #16
	stur	w8, [sp, #86]
	mov	w8, #10                         ; =0xa
	strh	w8, [sp, #90]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w28, #29295                     ; =0x726f
	add	x0, sp, #66
	strb	w22, [sp, #175]
	movk	w28, #10, lsl #16
	strb	wzr, [sp, #174]
	strb	w22, [sp, #173]
	stur	w28, [sp, #66]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #173]
	cmp	w8, #0
	csel	x0, x20, x21, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #2661                       ; =0xa65
	add	x0, sp, #45
	stur	x23, [sp, #45]
	movk	x8, #8242, lsl #16
	strb	wzr, [sp, #65]
	movk	x8, #15677, lsl #32
	movk	x8, #29728, lsl #48
	stur	x8, [sp, #53]
	mov	w8, #30066                      ; =0x7572
	movk	w8, #2661, lsl #16
	stur	w8, [sp, #61]
	bl	_printf
	mov	x0, x19
	bl	_printf
	add	x0, sp, #41
	strb	w22, [sp, #175]
	strb	w22, [sp, #174]
	strb	w22, [sp, #173]
	stur	w28, [sp, #41]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #173]
	cmp	w8, #0
	csel	x0, x20, x21, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	add	x0, sp, #18
	stur	x24, [sp, #18]
	stur	x25, [sp, #26]
	stur	w26, [sp, #34]
	strh	w27, [sp, #38]
	strb	wzr, [sp, #40]
	bl	_printf
	mov	x0, x19
	bl	_printf
	add	x0, sp, #14
	strh	wzr, [sp, #174]
	strb	wzr, [sp, #173]
	stur	w28, [sp, #14]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrb	w8, [sp, #173]
	cmp	w8, #0
	csel	x0, x20, x21, ne
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldp	x29, x30, [sp, #256]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #240]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #224]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #208]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #192]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #176]            ; 16-byte Folded Reload
	add	sp, sp, #272
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
