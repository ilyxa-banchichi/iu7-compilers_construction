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
	sub	sp, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	w19, #26661                     ; =0x6825
	mov	w20, #25381                     ; =0x6325
	movk	w19, #100, lsl #16
	mov	w21, #32                        ; =0x20
	sxth	w22, wzr
	sturh	wzr, [x29, #-34]
	cmp	w22, #10
	b.gt	LBB0_2
LBB0_1:                                 ; %for_body
                                        ; =>This Inner Loop Header: Depth=1
	ldurh	w0, [x29, #-34]
	bl	_Fibonacci
	mov	x9, sp
	mov	w8, w0
	sub	x0, x9, #16
	mov	sp, x0
	stur	w19, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	sturb	wzr, [x8, #-14]
	sturh	w20, [x8, #-16]
	str	x21, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	add	w8, w22, #1
	sxth	w22, w8
	sturh	w8, [x29, #-34]
	cmp	w22, #10
	b.le	LBB0_1
LBB0_2:                                 ; %for_exit
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	sturb	wzr, [x8, #-16]
	bl	_printf
Lloh0:
	adrp	x0, _end_line_str@PAGE
Lloh1:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	sub	sp, x29, #32
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_Fibonacci                      ; -- Begin function Fibonacci
	.p2align	2
_Fibonacci:                             ; @Fibonacci
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	tst	w0, #0xffff
	strh	w0, [sp, #12]
	b.ne	LBB1_2
; %bb.1:                                ; %then
	mov	w0, wzr
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	strh	wzr, [sp, #14]
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB1_2:                                 ; %else
	ldrh	w8, [sp, #12]
	cmp	w8, #1
	b.ne	LBB1_4
; %bb.3:                                ; %then.1
	mov	w0, #1                          ; =0x1
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	strh	w0, [sp, #14]
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB1_4:                                 ; %else.1
	ldrh	w8, [sp, #12]
	sub	w0, w8, #1
	bl	_Fibonacci
	ldrh	w8, [sp, #12]
	mov	w19, w0
	sub	w0, w8, #2
	bl	_Fibonacci
	add	w0, w19, w0
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	strh	w0, [sp, #14]
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

.subsections_via_symbols
