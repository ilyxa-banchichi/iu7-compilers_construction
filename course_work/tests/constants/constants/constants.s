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
	mov	w8, #26661                      ; =0x6825
	add	x0, sp, #43
	strb	wzr, [sp, #47]
	movk	w8, #30056, lsl #16
	stur	w8, [sp, #43]
	mov	w8, #3                          ; =0x3
	str	x8, [sp]
	bl	_printf
Lloh0:
	adrp	x19, _end_line_str@PAGE
Lloh1:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	mov	w8, #26661                      ; =0x6825
	add	x0, sp, #39
	movk	w8, #100, lsl #16
	stur	w8, [sp, #39]
	mov	w8, #65533                      ; =0xfffd
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #3221225472                 ; =0xc0000000
	mov	w20, #26149                     ; =0x6625
	add	x0, sp, #36
	movk	x8, #19660, lsl #32
	strh	w20, [sp, #36]
	movk	x8, #16420, lsl #48
	strb	wzr, [sp, #38]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #3221225472                 ; =0xc0000000
	add	x0, sp, #33
	sturh	w20, [sp, #33]
	movk	x8, #19660, lsl #32
	strb	wzr, [sp, #35]
	movk	x8, #49188, lsl #48
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #29537                      ; =0x7361
	add	x0, sp, #25
	movk	x8, #26468, lsl #16
	movk	x8, #25697, lsl #32
	movk	x8, #103, lsl #48
	stur	x8, [sp, #25]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #25381                      ; =0x6325
	add	x0, sp, #22
	strb	wzr, [sp, #24]
	strh	w8, [sp, #22]
	mov	w8, #97                         ; =0x61
	str	x8, [sp]
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
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

.subsections_via_symbols
