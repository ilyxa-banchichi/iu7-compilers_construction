	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	sub	sp, sp, #128
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	w20, #26661                     ; =0x6825
	sub	x8, x29, #34
	mov	w9, #5                          ; =0x5
	movk	w20, #100, lsl #16
	stur	x8, [x29, #-120]
	sub	x0, x29, #124
	stur	x8, [x29, #-96]
	sturh	w9, [x29, #-34]
	stur	w20, [x29, #-124]
	str	x9, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
Lloh0:
	adrp	x19, _end_line_str@PAGE
Lloh1:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	ldur	x8, [x29, #-96]
	mov	w21, #10                        ; =0xa
	sub	x0, x29, #128
	strh	w21, [x8]
	stur	w20, [x29, #-128]
	str	x21, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	sub	x8, x29, #88
	sturh	w21, [x29, #-88]
	sub	x0, x29, #147
	stp	x8, x8, [x29, #-144]
	stur	x8, [x29, #-112]
	stur	x8, [x29, #-96]
	mov	w8, #1106247680                 ; =0x41f00000
	stur	w8, [x29, #-84]
	mov	w8, #26149                      ; =0x6625
	ldur	s0, [x29, #-84]
	sturh	w8, [x29, #-147]
	sturb	wzr, [x29, #-145]
	fcvt	d0, s0
	str	d0, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	ldur	x8, [x29, #-96]
	sub	x0, x29, #151
	ldrh	w8, [x8]
	stur	w20, [x29, #-151]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	cbnz	wzr, LBB0_9
; %bb.1:                                ; %entry
	cbnz	wzr, LBB0_9
; %bb.2:                                ; %access_ok
	mov	w8, #99                         ; =0x63
	sturh	w8, [x29, #-54]
	cbnz	wzr, LBB0_9
; %bb.3:                                ; %access_ok
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_9
; %bb.4:                                ; %access_ok.1
	mov	x8, sp
	sub	x9, x8, #16
	mov	sp, x9
	sub	x9, x29, #54
	ldurh	w10, [x29, #-54]
	stur	x9, [x8, #-16]
	mov	x8, sp
	sub	x0, x8, #16
	stur	x9, [x29, #-96]
	mov	sp, x0
	mov	w9, #26661                      ; =0x6825
	movk	w9, #100, lsl #16
	stur	w9, [x8, #-16]
	str	x10, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
Lloh2:
	adrp	x0, _end_line_str@PAGE
Lloh3:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	ldur	x8, [x29, #-96]
	mov	w9, #9999                       ; =0x270f
	strh	w9, [x8]
	cbnz	wzr, LBB0_9
; %bb.5:                                ; %access_ok.1
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_9
; %bb.6:                                ; %access_ok.2
	mov	x9, sp
	ldurh	w8, [x29, #-54]
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
	mov	x8, #25928                      ; =0x6548
	mov	w9, #27762                      ; =0x6c72
	stur	wzr, [x29, #-58]
	movk	x8, #27756, lsl #16
	movk	w9, #100, lsl #16
	movk	x8, #8303, lsl #32
	stur	x9, [x29, #-66]
	movk	x8, #28535, lsl #48
	stur	x8, [x29, #-74]
	cbnz	wzr, LBB0_9
; %bb.7:                                ; %access_ok.2
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_9
; %bb.8:                                ; %access_ok.3
	mov	x9, sp
	sub	x8, x29, #74
	sub	x10, x9, #16
	add	x8, x8, #1
	mov	sp, x10
	stur	x8, [x9, #-16]
	ldurb	w9, [x29, #-73]
	stur	x8, [x29, #-104]
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w10, #25381                     ; =0x6325
	sturb	wzr, [x8, #-14]
	sturh	w10, [x8, #-16]
	str	x9, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	ldur	x8, [x29, #-104]
	mov	w9, #74                         ; =0x4a
	strb	w9, [x8]
	mov	x9, sp
	ldur	q0, [x29, #-74]
	ldur	w8, [x29, #-58]
	sub	x0, x9, #32
	mov	sp, x0
	stur	w8, [x9, #-16]
	stur	q0, [x9, #-32]
	bl	_printf
	mov	x0, x19
	bl	_printf
	sub	sp, x29, #32
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB0_9:                                 ; %access_fail
Lloh6:
	adrp	x0, _out_of_bounds_err_str@PAGE
Lloh7:
	add	x0, x0, _out_of_bounds_err_str@PAGEOFF
	bl	_puts
	brk	#0x1
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh6, Lloh7
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

	.p2align	4, 0x0                          ; @out_of_bounds_err_str
_out_of_bounds_err_str:
	.asciz	"Out of bounds error"

.subsections_via_symbols
