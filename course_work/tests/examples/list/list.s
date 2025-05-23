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
	sub	sp, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	w0, #16                         ; =0x10
	bl	_malloc
	mov	w8, #1                          ; =0x1
	stp	x0, x0, [x29, #-32]
	strh	wzr, [x0, #8]
	sxth	w19, w8
	sturh	w8, [x29, #-42]
	cmp	w19, #10
	b.gt	LBB0_2
LBB0_1:                                 ; %for_body
                                        ; =>This Inner Loop Header: Depth=1
	ldur	x20, [x29, #-32]
	mov	w0, #16                         ; =0x10
	bl	_malloc
	ldur	x8, [x29, #-32]
	str	x0, [x20]
	ldurh	w10, [x29, #-42]
	ldr	x9, [x8]
	str	xzr, [x9]
	ldr	x9, [x8]
	strh	w10, [x9, #8]
	ldr	x8, [x8]
	stur	x8, [x29, #-32]
	add	w8, w19, #1
	sxth	w19, w8
	sturh	w8, [x29, #-42]
	cmp	w19, #10
	b.le	LBB0_1
LBB0_2:                                 ; %for_exit
	ldur	x8, [x29, #-24]
	stur	x8, [x29, #-32]
	cbz	x8, LBB0_4
LBB0_3:                                 ; %while_body
                                        ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-32]
	sub	x0, x29, #56
	stur	x8, [x29, #-56]
	bl	_printNode
	ldur	x8, [x29, #-32]
	ldr	x8, [x8]
	stur	x8, [x29, #-32]
	cbnz	x8, LBB0_3
LBB0_4:                                 ; %while_exit
	ldur	x8, [x29, #-24]
	sub	x0, x29, #56
	stur	x8, [x29, #-56]
	bl	_reverse
	ldur	x8, [x29, #-56]
	stur	x8, [x29, #-24]
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
	ldur	x8, [x29, #-24]
	stur	x8, [x29, #-32]
	cbz	x8, LBB0_6
LBB0_5:                                 ; %while_body.1
                                        ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-32]
	sub	x0, x29, #56
	stur	x8, [x29, #-56]
	bl	_printNode
	ldur	x8, [x29, #-32]
	ldr	x8, [x8]
	stur	x8, [x29, #-32]
	cbnz	x8, LBB0_5
LBB0_6:                                 ; %while_cond.2.preheader
	sub	x8, x29, #24
	ldr	x8, [x8]
	stur	x8, [x29, #-32]
	cbz	x8, LBB0_8
LBB0_7:                                 ; %while_body.2
                                        ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-32]
	mov	w0, #16                         ; =0x10
	ldr	x8, [x8]
	stur	x8, [x29, #-40]
	bl	_malloc
	sub	x8, x29, #40
	stur	x0, [x29, #-32]
	ldr	x8, [x8]
	stur	x8, [x29, #-32]
	cbnz	x8, LBB0_7
LBB0_8:                                 ; %while_exit.2
	sub	sp, x29, #16
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_printNode                      ; -- Begin function printNode
	.p2align	2
_printNode:                             ; @printNode
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	ldr	x9, [x0]
	mov	w8, #26661                      ; =0x6825
	add	x0, sp, #12
	movk	w8, #100, lsl #16
	ldrh	w9, [x9, #8]
	str	w8, [sp, #12]
	str	x9, [sp]
	bl	_printf
Lloh2:
	adrp	x0, _end_line_str@PAGE
Lloh3:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.loh AdrpAdd	Lloh2, Lloh3
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

.subsections_via_symbols
