	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	x28, x27, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	sub	sp, sp, #1104
	.cfi_def_cfa_offset 1184
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w27, -72
	.cfi_offset w28, -80
	mov	w20, #26661                     ; =0x6825
	add	x21, sp, #824
	mov	w8, #32767                      ; =0x7fff
	movk	w20, #100, lsl #16
	add	x9, sp, #564
	add	x0, sp, #819
	add	x24, sp, #536
	strh	w8, [x21, #278]
	add	x23, sp, #281
	add	x22, sp, #26
	stur	w20, [x9, #255]
	str	x8, [sp]
	bl	_printf
Lloh0:
	adrp	x19, _end_line_str@PAGE
Lloh1:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	mov	w8, #32768                      ; =0x8000
	add	x9, sp, #560
	add	x0, sp, #815
	strh	w8, [x21, #278]
	stur	w20, [x9, #255]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #7                          ; =0x7
	add	x9, sp, #556
	add	x0, sp, #811
	strh	w8, [x21, #278]
	stur	w20, [x9, #255]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #2147483647                 ; =0x7fffffff
	mov	w20, #25637                     ; =0x6425
	add	x0, sp, #808
	str	w8, [x21, #272]
	strh	w20, [x24, #272]
	strb	wzr, [sp, #810]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #-2147483648                ; =0x80000000
	add	x9, sp, #550
	add	x0, sp, #805
	sturh	w20, [x9, #255]
	str	w8, [x21, #272]
	strb	wzr, [sp, #807]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w9, #26661                      ; =0x6825
	mov	w8, #255                        ; =0xff
	add	x0, sp, #800
	movk	w9, #30056, lsl #16
	strb	w8, [sp, #1095]
	str	w9, [x24, #264]
	strb	wzr, [sp, #804]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #18350                      ; =0x47ae
	mov	w20, #26149                     ; =0x6625
	add	x0, sp, #797
	movk	w8, #16257, lsl #16
	strb	wzr, [sp, #799]
	str	w8, [x21, #264]
	add	x8, sp, #542
	sturh	w20, [x8, #255]
	mov	x8, #3221225472                 ; =0xc0000000
	movk	x8, #10485, lsl #32
	movk	x8, #16368, lsl #48
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #1084227584                 ; =0x40a00000
	add	x0, sp, #794
	strh	w20, [x24, #258]
	str	w8, [x21, #264]
	mov	x8, #4617315517961601024        ; =0x4014000000000000
	strb	wzr, [sp, #796]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #1610612736                 ; =0x60000000
	add	x9, sp, #536
	add	x0, sp, #791
	movk	x8, #41971, lsl #32
	sturh	w20, [x9, #255]
	movk	x8, #16494, lsl #48
	strb	wzr, [sp, #793]
	str	x8, [x21, #256]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #1                          ; =0x1
Lloh2:
	adrp	x0, _true_value_str@PAGE
Lloh3:
	add	x0, x0, _true_value_str@PAGEOFF
	strb	w8, [sp, #1079]
Lloh4:
	adrp	x20, _false_value_str@PAGE
Lloh5:
	add	x20, x20, _false_value_str@PAGEOFF
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x0, x20
	strb	wzr, [sp, #1079]
	bl	_printf
	mov	x0, x19
	bl	_printf
	movi.2d	v0, #0000000000000000
	mov	w8, #66                         ; =0x42
	str	xzr, [x21, #56]
	str	x8, [x24, #288]
	lsr	x9, xzr, #32
	add	x0, sp, #536
	str	xzr, [x21, #240]
	stp	wzr, w9, [x24, #56]
	stp	q0, q0, [x21, #64]
	ldrh	w8, [x21, #64]
	stur	q0, [x21, #40]
	ldur	x9, [x21, #68]
	stur	q0, [x21, #8]
	ldr	w10, [x21, #76]
	strh	w8, [x24, #64]
	ldr	x8, [x21, #48]
	ldr	q2, [x21]
	stur	q0, [x21, #24]
	stp	q0, q0, [x21, #96]
	stp	q0, q0, [x21, #128]
	stp	q0, q0, [x21, #160]
	stp	q0, q0, [x21, #192]
	str	q0, [x21, #224]
	ldp	q1, q0, [x21, #16]
	str	x8, [x24, #48]
	ldrh	w8, [x21, #66]
	stur	x9, [x24, #68]
	ldr	w9, [x21, #88]
	strh	w8, [x24, #66]
	ldr	x8, [x21, #80]
	stp	q1, q0, [x24, #16]
	ldp	q1, q0, [x21, #160]
	str	x8, [x24, #80]
	ldr	w8, [x21, #100]
	str	w9, [x24, #88]
	ldr	x9, [x21, #104]
	str	q2, [x24]
	str	w10, [x24, #76]
	ldur	x10, [x21, #92]
	str	w8, [x24, #100]
	ldur	x8, [x21, #116]
	str	x9, [x24, #104]
	ldr	w9, [x21, #124]
	stp	q1, q0, [x24, #160]
	ldp	q0, q2, [x21, #128]
	stur	x10, [x24, #92]
	ldr	w10, [x21, #112]
	stur	x8, [x24, #116]
	ldr	w8, [x21, #240]
	str	w9, [x24, #124]
	ldrh	w9, [x21, #244]
	str	wzr, [x21, #248]
	strh	wzr, [x21, #252]
	strb	wzr, [sp, #1078]
	stp	q0, q2, [x24, #128]
	ldp	q1, q2, [x21, #192]
	str	w10, [x24, #112]
	ldr	q0, [x21, #224]
	ldrb	w10, [sp, #1070]
	str	w8, [x24, #240]
	ldur	w8, [x21, #247]
	strh	w9, [x24, #244]
	ldur	w9, [x21, #251]
	stp	q1, q2, [x24, #192]
	str	q0, [x24, #224]
	strb	w10, [sp, #782]
	stur	w8, [x24, #247]
	stur	w9, [x24, #251]
	bl	_printf
	mov	x0, x19
	bl	_printf
	movi.2d	v0, #0000000000000000
	mov	x8, #25928                      ; =0x6548
	mov	w9, #27762                      ; =0x6c72
	movk	x8, #27756, lsl #16
	movk	w9, #100, lsl #16
	str	xzr, [x21, #240]
	movk	x8, #8303, lsl #32
	str	wzr, [x21, #248]
	add	x0, sp, #281
	movk	x8, #28535, lsl #48
	strh	wzr, [x21, #252]
	stp	q0, q0, [x21, #16]
	stp	x8, x9, [x21]
	ldr	q2, [x21, #32]
	ldur	x9, [x21, #243]
	stp	q0, q0, [x21, #48]
	stp	q0, q0, [x21, #80]
	stp	q0, q0, [x21, #112]
	stp	q0, q0, [x21, #144]
	stp	q0, q0, [x21, #176]
	stp	q0, q0, [x21, #208]
	ldp	q0, q1, [x21]
	strb	wzr, [sp, #1078]
	ldur	w10, [x21, #239]
	ldur	w8, [x21, #251]
	stur	x9, [x23, #243]
	ldur	w9, [x21, #227]
	stur	q0, [x22, #255]
	stp	q1, q2, [x23, #16]
	ldp	q0, q1, [x21, #128]
	stur	w8, [x23, #251]
	ldur	x8, [x21, #231]
	ldr	q2, [x21, #112]
	stur	w10, [x23, #239]
	ldur	x10, [x21, #219]
	stp	q0, q1, [x23, #128]
	ldp	q3, q0, [x21, #160]
	stur	x8, [x23, #231]
	ldur	w8, [x21, #215]
	stur	w9, [x23, #227]
	ldur	x9, [x21, #207]
	stp	q3, q0, [x23, #160]
	ldp	q1, q0, [x21, #80]
	stur	x10, [x23, #219]
	ldur	w10, [x21, #203]
	stur	w8, [x23, #215]
	ldur	x8, [x21, #195]
	stp	q0, q2, [x23, #96]
	ldp	q2, q0, [x21, #48]
	stur	x9, [x23, #207]
	ldurh	w9, [x21, #193]
	stur	w10, [x23, #203]
	ldrb	w10, [sp, #1016]
	stur	x8, [x23, #195]
	sturh	w9, [x23, #193]
	strb	w10, [sp, #473]
	stp	q0, q1, [x23, #64]
	str	q2, [x23, #48]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #6944656592455360608        ; =0x6060606060606060
	mov	w9, #24929                      ; =0x6161
	strb	wzr, [sp, #1078]
	orr	x8, x8, #0x101010101010101
	strh	w9, [x21, #252]
	mov	w9, #24929                      ; =0x6161
	stp	x8, x8, [x21, #48]
	movk	w9, #24929, lsl #16
	add	x0, sp, #26
	stp	x8, x8, [x21]
	ldur	x10, [x21, #50]
	stp	x8, x8, [x21, #16]
	stp	x8, x8, [x21, #32]
	ldur	q2, [x21, #2]
	stp	x8, x8, [x21, #64]
	ldur	q0, [x21, #34]
	ldur	q1, [x21, #18]
	stp	x8, x8, [x21, #80]
	stp	x8, x8, [x21, #96]
	stp	x8, x8, [x21, #112]
	stp	x8, x8, [x21, #128]
	stp	x8, x8, [x21, #144]
	stp	x8, x8, [x21, #160]
	stp	x8, x8, [x21, #176]
	stp	x8, x8, [x21, #232]
	stp	x8, x8, [x21, #216]
	stp	x8, x8, [x21, #200]
	str	x8, [x21, #192]
	ldur	w8, [x21, #58]
	str	w9, [x21, #248]
	ldrh	w9, [x21, #62]
	stur	w8, [sp, #84]
	ldrh	w8, [x21]
	strh	w9, [sp, #88]
	ldr	w9, [x21, #64]
	stur	x10, [sp, #76]
	ldur	x10, [x21, #68]
	strh	w8, [sp, #26]
	ldr	w8, [x21, #76]
	stur	q0, [sp, #60]
	stur	q1, [sp, #44]
	ldp	q1, q0, [x21, #160]
	stur	w9, [sp, #90]
	ldr	x9, [x21, #80]
	stur	x10, [sp, #94]
	ldr	w10, [x21, #88]
	stur	w8, [sp, #102]
	ldur	x8, [x21, #92]
	stur	q2, [sp, #28]
	stur	x9, [sp, #106]
	ldr	w9, [x21, #100]
	stur	w10, [sp, #114]
	ldr	x10, [x21, #104]
	stur	x8, [sp, #118]
	ldr	w8, [x21, #112]
	stp	q1, q0, [x22, #160]
	ldp	q0, q2, [x21, #128]
	stur	w9, [sp, #126]
	ldur	x9, [x21, #116]
	stur	x10, [sp, #130]
	ldr	w10, [x21, #124]
	stur	w8, [sp, #138]
	ldrb	w8, [sp, #1078]
	stp	q0, q2, [x22, #128]
	ldp	q1, q0, [x21, #192]
	stur	x9, [sp, #142]
	ldr	q2, [x21, #224]
	ldr	w9, [x21, #248]
	stur	w10, [sp, #150]
	ldrh	w10, [x21, #252]
	strb	w8, [sp, #280]
	ldr	x8, [x21, #240]
	stp	q1, q0, [x22, #192]
	str	q2, [x22, #224]
	str	x8, [x22, #240]
	str	w9, [x22, #248]
	strh	w10, [x22, #252]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #90                         ; =0x5a
	mov	w9, #37                         ; =0x25
	mov	w10, #99                        ; =0x63
	add	x0, sp, #23
	strb	w8, [sp, #823]
	strb	w9, [sp, #23]
	strb	w10, [sp, #24]
	strb	wzr, [sp, #25]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	add	sp, sp, #1104
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #80             ; 16-byte Folded Reload
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
