	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #80
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 80
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	w8, #1092616192                 ; =0x41200000
	mov	w9, #1084227584                 ; =0x40a00000
	mov	w20, #26149                     ; =0x6625
	stp	w9, w8, [sp, #40]
	mov	x8, #4621819117588971520        ; =0x4024000000000000
	add	x0, sp, #34
	strh	w20, [sp, #34]
	strb	wzr, [sp, #36]
	str	x8, [sp]
	bl	_printf
Lloh0:
	adrp	x19, _end_line_str@PAGE
Lloh1:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	ldr	s0, [sp, #40]
	add	x0, sp, #31
	sturh	w20, [sp, #31]
	strb	wzr, [sp, #33]
	fcvt	d0, s0
	str	d0, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	add	x0, sp, #44
	add	x1, sp, #40
	bl	_swap
	ldr	s0, [sp, #44]
	add	x0, sp, #28
	strh	w20, [sp, #28]
	strb	wzr, [sp, #30]
	fcvt	d0, s0
	str	d0, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldr	s0, [sp, #40]
	add	x0, sp, #25
	sturh	w20, [sp, #25]
	strb	wzr, [sp, #27]
	fcvt	d0, s0
	str	d0, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldp	s1, s0, [sp, #40]
	bl	_add
	fcvt	d0, s0
	add	x0, sp, #22
	strh	w20, [sp, #22]
	strb	wzr, [sp, #24]
	str	d0, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #1120403456                 ; =0x42c80000
	ldr	s0, [sp, #44]
	fmov	s1, w8
	bl	_add
	fcvt	d0, s0
	add	x0, sp, #19
	sturh	w20, [sp, #19]
	strb	wzr, [sp, #21]
	str	d0, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.globl	_swap                           ; -- Begin function swap
	.p2align	2
_swap:                                  ; @swap
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	ldr	s0, [x0]
	ldr	s1, [x1]
	str	s0, [sp, #12]
	str	s1, [x0]
	str	s0, [x1]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_add                            ; -- Begin function add
	.p2align	2
_add:                                   ; @add
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	fadd	s2, s0, s1
	stp	s1, s0, [sp, #4]
	fmov	s0, s2
	str	s2, [sp, #12]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

.subsections_via_symbols
