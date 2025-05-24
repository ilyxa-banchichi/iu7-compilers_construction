	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #176
	stp	x22, x21, [sp, #128]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #144]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #160]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 176
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x8, #29285                      ; =0x7265
	mov	x9, #24415                      ; =0x5f5f
	add	x0, sp, #108
	movk	x8, #29728, lsl #16
	movk	x9, #18783, lsl #16
	strb	wzr, [sp, #124]
	movk	x8, #29541, lsl #32
	movk	x9, #29806, lsl #32
	movk	x8, #29556, lsl #48
	movk	x9, #26469, lsl #48
	stur	x8, [sp, #116]
	stur	x9, [sp, #108]
	bl	_printf
Lloh0:
	adrp	x19, _end_line_str@PAGE
Lloh1:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	mov	w20, #26661                     ; =0x6825
	mov	w8, #101                        ; =0x65
	add	x0, sp, #104
	movk	w20, #100, lsl #16
	strh	w8, [sp, #126]
	str	w20, [sp, #104]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28265                      ; =0x6e69
	mov	w9, #8306                       ; =0x2072
	add	x0, sp, #92
	movk	x8, #22132, lsl #16
	movk	w9, #50, lsl #16
	movk	x8, #29281, lsl #32
	str	w9, [sp, #100]
	movk	x8, #28448, lsl #48
	stur	x8, [sp, #92]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrh	w8, [sp, #126]
	add	x0, sp, #88
	str	w20, [sp, #88]
	orr	w8, w8, #0x2
	strh	w8, [sp, #126]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28265                      ; =0x6e69
	mov	w9, #25710                      ; =0x646e
	add	x0, sp, #74
	movk	x8, #22132, lsl #16
	movk	w9, #14368, lsl #16
	movk	x8, #29281, lsl #32
	stur	w9, [sp, #82]
	movk	x8, #24864, lsl #48
	stur	x8, [sp, #74]
	mov	w8, #51                         ; =0x33
	strh	w8, [sp, #86]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrh	w8, [sp, #126]
	mov	w9, #83                         ; =0x53
	add	x0, sp, #70
	stur	w20, [sp, #70]
	and	w8, w8, w9
	strh	w8, [sp, #126]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x21, #28265                     ; =0x6e69
	mov	w8, #27752                      ; =0x6c68
	add	x0, sp, #57
	movk	x21, #22132, lsl #16
	movk	w8, #12832, lsl #16
	strb	wzr, [sp, #69]
	movk	x21, #29281, lsl #32
	stur	w8, [sp, #65]
	movk	x21, #29472, lsl #48
	stur	x21, [sp, #57]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrh	w8, [sp, #126]
	add	x0, sp, #53
	stur	w20, [sp, #53]
	lsl	w8, w8, #2
	strh	w8, [sp, #126]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	w8, #29288                      ; =0x7268
	add	x0, sp, #40
	str	x21, [sp, #40]
	movk	w8, #12832, lsl #16
	strb	wzr, [sp, #52]
	str	w8, [sp, #48]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrh	w8, [sp, #126]
	add	x0, sp, #36
	str	w20, [sp, #36]
	lsr	w8, w8, #2
	strh	w8, [sp, #126]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	mov	x8, #28526                      ; =0x6f6e
	mov	w9, #29281                      ; =0x7261
	add	x0, sp, #25
	movk	x8, #8308, lsl #16
	sturh	w9, [sp, #33]
	movk	x8, #28265, lsl #32
	strb	wzr, [sp, #35]
	movk	x8, #22132, lsl #48
	stur	x8, [sp, #25]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldrh	w8, [sp, #126]
	add	x0, sp, #21
	stur	w20, [sp, #21]
	str	x8, [sp]
	bl	_printf
	mov	x0, x19
	bl	_printf
	ldp	x29, x30, [sp, #160]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #128]            ; 16-byte Folded Reload
	add	sp, sp, #176
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

.subsections_via_symbols
