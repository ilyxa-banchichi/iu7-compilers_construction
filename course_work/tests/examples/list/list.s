	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	sub	sp, sp, #224
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	cbnz	wzr, LBB0_11
; %bb.1:                                ; %entry
	cbnz	wzr, LBB0_11
; %bb.2:                                ; %access_ok
	mov	x9, sp
	sub	x8, x9, #16
	mov	sp, x8
	sub	x8, x29, #208
	mov	w10, #1                         ; =0x1
	sturh	wzr, [x29, #-200]
	stur	x8, [x9, #-16]
	stp	x8, x8, [x29, #-16]
	sxth	w9, w10
	sturh	w10, [x29, #-26]
	cmp	w9, #10
	b.gt	LBB0_6
LBB0_3:                                 ; %for_body
                                        ; =>This Inner Loop Header: Depth=1
	cbnz	wzr, LBB0_11
; %bb.4:                                ; %for_body
                                        ;   in Loop: Header=BB0_3 Depth=1
	ldurh	w10, [x29, #-26]
	cmp	w10, #11
	b.hs	LBB0_11
; %bb.5:                                ; %access_ok.1
                                        ;   in Loop: Header=BB0_3 Depth=1
	add	x10, x8, w10, sxth #4
	mov	x12, sp
	ldur	x11, [x29, #-16]
	sub	x13, x12, #16
	mov	sp, x13
	ldur	x13, [x29, #-16]
	str	x10, [x11]
	ldurh	w14, [x29, #-26]
	stur	x10, [x12, #-16]
	add	w10, w9, #1
	ldr	x11, [x13]
	str	xzr, [x11]
	ldr	x11, [x13]
	strh	w14, [x11, #8]
	ldr	x11, [x13]
	stur	x11, [x29, #-16]
	sxth	w9, w10
	sturh	w10, [x29, #-26]
	cmp	w9, #10
	b.le	LBB0_3
LBB0_6:                                 ; %for_exit
	ldur	x8, [x29, #-8]
	stur	x8, [x29, #-16]
	cbz	x8, LBB0_8
LBB0_7:                                 ; %while_body
                                        ; =>This Inner Loop Header: Depth=1
	ldur	x0, [x29, #-16]
	stur	x0, [x29, #-216]
	bl	_printNode
	ldur	x8, [x29, #-16]
	ldr	x8, [x8]
	stur	x8, [x29, #-16]
	cbnz	x8, LBB0_7
LBB0_8:                                 ; %while_exit
	ldur	x8, [x29, #-8]
	sub	x0, x29, #216
	stur	x8, [x29, #-216]
	bl	_reverse
	ldur	x8, [x29, #-216]
	stur	x8, [x29, #-8]
	mov	x8, sp
	sub	x0, x8, #32
	mov	sp, x0
	mov	x9, #25974                      ; =0x6576
	mov	x10, #24415                     ; =0x5f5f
	sturb	wzr, [x8, #-16]
	movk	x9, #24420, lsl #16
	movk	x10, #21087, lsl #16
	movk	x9, #24415, lsl #32
	movk	x10, #29541, lsl #32
	movk	x9, #24415, lsl #48
	movk	x10, #29285, lsl #48
	stp	x10, x9, [x8, #-32]
	bl	_printf
Lloh0:
	adrp	x0, _end_line_str@PAGE
Lloh1:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	ldur	x8, [x29, #-8]
	stur	x8, [x29, #-16]
	cbz	x8, LBB0_10
LBB0_9:                                 ; %while_body.1
                                        ; =>This Inner Loop Header: Depth=1
	ldur	x0, [x29, #-16]
	stur	x0, [x29, #-216]
	bl	_printNode
	ldur	x8, [x29, #-16]
	ldr	x8, [x8]
	stur	x8, [x29, #-16]
	cbnz	x8, LBB0_9
LBB0_10:                                ; %while_exit.1
	mov	sp, x29
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB0_11:                                ; %access_fail
Lloh2:
	adrp	x0, _out_of_bounds_err_str@PAGE
Lloh3:
	add	x0, x0, _out_of_bounds_err_str@PAGEOFF
	bl	_puts
	brk	#0x1
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
	.globl	_printNode                      ; -- Begin function printNode
	.p2align	2
_printNode:                             ; @printNode
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #26661                      ; =0x6825
	ldrh	w9, [x0, #8]
	str	x0, [sp, #24]
	movk	w8, #100, lsl #16
	add	x0, sp, #20
	str	w8, [sp, #20]
	str	x9, [sp]
	bl	_printf
Lloh4:
	adrp	x0, _end_line_str@PAGE
Lloh5:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.loh AdrpAdd	Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
	.globl	_reverse                        ; -- Begin function reverse
	.p2align	2
_reverse:                               ; @reverse
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	ldr	x8, [x0]
	stp	x8, xzr, [sp, #16]
	cbz	x8, LBB2_2
LBB2_1:                                 ; %while_body
                                        ; =>This Inner Loop Header: Depth=1
	ldp	x9, x10, [sp, #16]
	ldr	x8, [x9]
	str	x10, [x9]
	stp	x8, x9, [sp, #16]
	str	x8, [sp, #8]
	cbnz	x8, LBB2_1
LBB2_2:                                 ; %while_exit
	ldr	x8, [sp, #24]
	str	x8, [x0]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

	.p2align	4, 0x0                          ; @out_of_bounds_err_str
_out_of_bounds_err_str:
	.asciz	"Out of bounds error"

.subsections_via_symbols
