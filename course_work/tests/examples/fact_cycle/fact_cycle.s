	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #10                         ; =0xa
	mov	w0, #10                         ; =0xa
	str	w8, [sp, #12]
	bl	_fact
	mov	w8, w0
	mov	w9, #25637                      ; =0x6425
	add	x0, sp, #9
	sturh	w9, [sp, #9]
	strb	wzr, [sp, #11]
	str	x8, [sp]
	bl	_printf
Lloh0:
	adrp	x0, _end_line_str@PAGE
Lloh1:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_fact                           ; -- Begin function fact
	.p2align	2
_fact:                                  ; @fact
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w8, #1                          ; =0x1
	stp	w0, w8, [sp, #8]
LBB1_1:                                 ; %while_cond
                                        ; =>This Inner Loop Header: Depth=1
	ldp	w8, w0, [sp, #8]
	cmp	w8, #2
	b.lt	LBB1_3
; %bb.2:                                ; %while_body
                                        ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #8]
	mul	w9, w0, w8
	sub	w8, w8, #1
	stp	w8, w9, [sp, #8]
	b	LBB1_1
LBB1_3:                                 ; %while_exit
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

.subsections_via_symbols
