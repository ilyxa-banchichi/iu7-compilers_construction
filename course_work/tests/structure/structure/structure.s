	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	sub	sp, sp, #512
	mov	x19, sp
	.cfi_def_cfa w29, 16
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
	mov	x8, #27713                      ; =0x6c41
	mov	x9, #5044031582654955520        ; =0x4600000000000000
	add	x20, x19, #256
	movk	x8, #25449, lsl #16
	add	x0, x20, #30
	mov	w1, #7                          ; =0x7
	movk	x8, #101, lsl #32
	strb	wzr, [x19, #284]
	stp	x8, x9, [x19, #256]
	mov	w8, #30                         ; =0x1e
	add	x9, x19, #21
	strh	w8, [x19, #272]
	mov	x8, #1071644672                 ; =0x3fe00000
	movk	x8, #52429, lsl #32
	movk	x8, #16990, lsl #48
	stur	x8, [x9, #255]
	bl	_FillPhoneNumber
	cbnz	wzr, LBB0_33
; %bb.1:                                ; %entry
	cbnz	wzr, LBB0_33
; %bb.2:                                ; %access_ok
	movi.2d	v0, #0000000000000000
	mov	x8, #28493                      ; =0x6f4d
	sturh	wzr, [x20, #100]
	movk	x8, #25459, lsl #16
	stur	xzr, [x20, #92]
	movk	x8, #30575, lsl #32
	stur	x8, [x20, #52]
	stur	q0, [x20, #76]
	stur	q0, [x20, #60]
	cbnz	wzr, LBB0_33
; %bb.3:                                ; %access_ok
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_33
; %bb.4:                                ; %access_ok.1
	mov	x9, #29300                      ; =0x7274
	add	x8, x19, #256
	movk	x9, #25957, lsl #16
	sturh	wzr, [x8, #150]
	movk	x9, #116, lsl #32
	stur	q0, [x8, #134]
	stur	x9, [x8, #110]
	mov	x9, #24898                      ; =0x6142
	movk	x9, #28021, lsl #16
	stur	q0, [x8, #118]
	movk	x9, #28257, lsl #32
	movk	x9, #21280, lsl #48
	stur	x9, [x8, #102]
	cbnz	wzr, LBB0_33
; %bb.5:                                ; %access_ok.1
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_33
; %bb.6:                                ; %access_ok.2
	mov	x9, #28488                      ; =0x6f48
	add	x8, x19, #256
	movk	x9, #29557, lsl #16
	sturh	wzr, [x8, #200]
	movk	x9, #8293, lsl #32
	stur	xzr, [x8, #192]
	movk	x9, #12341, lsl #48
	stp	q0, q0, [x8, #160]
	stur	x9, [x8, #152]
	cbnz	wzr, LBB0_33
; %bb.7:                                ; %access_ok.2
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_33
; %bb.8:                                ; %access_ok.3
	add	x8, x19, #256
	mov	w9, #65437                      ; =0xff9d
	sturh	w9, [x8, #232]
	cbnz	wzr, LBB0_33
; %bb.9:                                ; %access_ok.3
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_33
; %bb.10:                               ; %access_ok.4
	add	x8, x19, #256
	mov	w9, #99                         ; =0x63
	sturh	w9, [x8, #240]
	cbnz	wzr, LBB0_33
; %bb.11:                               ; %access_ok.4
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_33
; %bb.12:                               ; %access_ok.5
	ldr	x8, [x19, #488]
	ldrh	w10, [x19, #496]
	add	x9, x19, #256
	stur	x8, [x9, #202]
	sturh	w10, [x9, #210]
	cbnz	wzr, LBB0_33
; %bb.13:                               ; %access_ok.5
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_33
; %bb.14:                               ; %access_ok.6
	cbnz	wzr, LBB0_33
; %bb.15:                               ; %access_ok.6
	cbz	w8, LBB0_33
; %bb.16:                               ; %access_ok.7
	add	x8, x19, #256
	mov	x9, sp
	ldurh	w8, [x8, #202]
	sub	x0, x9, #16
	mov	sp, x0
	mov	w10, #26661                     ; =0x6825
	movk	w10, #100, lsl #16
	stur	w10, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
Lloh0:
	adrp	x0, _end_line_str@PAGE
Lloh1:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	cbnz	wzr, LBB0_33
; %bb.17:                               ; %access_ok.7
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_33
; %bb.18:                               ; %access_ok.8
	cbnz	wzr, LBB0_33
; %bb.19:                               ; %access_ok.8
	cbz	w8, LBB0_33
; %bb.20:                               ; %access_ok.9
	add	x8, x19, #256
	mov	x9, sp
	ldurh	w8, [x8, #210]
	sub	x0, x9, #16
	mov	sp, x0
	mov	w10, #26661                     ; =0x6825
	movk	w10, #100, lsl #16
	stur	w10, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
Lloh2:
	adrp	x0, _end_line_str@PAGE
Lloh3:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	cbnz	wzr, LBB0_33
; %bb.21:                               ; %access_ok.9
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_33
; %bb.22:                               ; %access_ok.10
	add	x9, x19, #256
	sturh	w8, [x9, #232]
	cbnz	wzr, LBB0_33
; %bb.23:                               ; %access_ok.10
	cbz	w8, LBB0_33
; %bb.24:                               ; %access_ok.11
	add	x8, x19, #256
	mov	w9, #2                          ; =0x2
	sturh	w9, [x8, #240]
	cbnz	wzr, LBB0_33
; %bb.25:                               ; %access_ok.11
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_33
; %bb.26:                               ; %access_ok.12
	cbnz	wzr, LBB0_33
; %bb.27:                               ; %access_ok.12
	cbz	w8, LBB0_33
; %bb.28:                               ; %access_ok.13
	add	x8, x19, #256
	mov	x9, sp
	ldurh	w8, [x8, #202]
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
	cbnz	wzr, LBB0_33
; %bb.29:                               ; %access_ok.13
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_33
; %bb.30:                               ; %access_ok.14
	cbnz	wzr, LBB0_33
; %bb.31:                               ; %access_ok.14
	mov	w21, #1                         ; =0x1
	cbz	w21, LBB0_33
; %bb.32:                               ; %access_ok.15
	add	x8, x19, #256
	mov	x9, sp
	ldurh	w8, [x8, #210]
	sub	x0, x9, #16
	mov	sp, x0
	mov	w10, #26661                     ; =0x6825
	mov	w23, #26661                     ; =0x6825
	movk	w10, #100, lsl #16
	movk	w23, #100, lsl #16
	stur	w10, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
Lloh6:
	adrp	x20, _end_line_str@PAGE
Lloh7:
	add	x20, x20, _end_line_str@PAGEOFF
	mov	x0, x20
	bl	_printf
	mov	w8, #28482                      ; =0x6f42
	mov	x9, #5548434740920451072        ; =0x4d00000000000000
	mov	w1, #4                          ; =0x4
	movk	w8, #98, lsl #16
	strb	w21, [x19, #36]
	stp	x8, x9, [x19, #8]
	mov	w8, #22                         ; =0x16
	strh	w8, [x19, #24]
	mov	x8, #10486                      ; =0x28f6
	movk	x8, #16380, lsl #16
	movk	x8, #17027, lsl #48
	stur	x8, [x19, #28]
	add	x8, x19, #8
	add	x0, x8, #30
	bl	_FillPhoneNumber
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w10, #24910                     ; =0x614e
	mov	w9, #8250                       ; =0x203a
	sturb	wzr, [x8, #-10]
	movk	w10, #25965, lsl #16
	sturh	w9, [x8, #-12]
	stur	w10, [x8, #-16]
	bl	_printf
	mov	x12, sp
	ldr	x8, [x19, #256]
	ldr	w9, [x19, #264]
	ldrh	w10, [x19, #268]
	ldrb	w11, [x19, #270]
	sub	x0, x12, #16
	mov	sp, x0
	sturb	w11, [x12, #-2]
	sturh	w10, [x12, #-4]
	stur	w9, [x12, #-8]
	stur	x8, [x12, #-16]
	bl	_printf
	mov	x0, x20
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w9, #25939                      ; =0x6553
	mov	w22, #32                        ; =0x20
	movk	w9, #14968, lsl #16
	sturh	w22, [x8, #-12]
	stur	w9, [x8, #-16]
	bl	_printf
	mov	x9, sp
	ldrb	w8, [x19, #271]
	sub	x0, x9, #16
	mov	sp, x0
	mov	w27, #25381                     ; =0x6325
	sturb	wzr, [x9, #-14]
	sturh	w27, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w9, #26433                      ; =0x6741
	sturh	w22, [x8, #-12]
	movk	w9, #14949, lsl #16
	stur	w9, [x8, #-16]
	bl	_printf
	mov	x9, sp
	ldrh	w8, [x19, #272]
	sub	x0, x9, #16
	mov	sp, x0
	stur	w23, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	x9, #25928                      ; =0x6548
	sturb	wzr, [x8, #-8]
	movk	x9, #26473, lsl #16
	movk	x9, #29800, lsl #32
	movk	x9, #8250, lsl #48
	stur	x9, [x8, #-16]
	bl	_printf
	mov	x8, sp
	ldr	s0, [x19, #276]
	sub	x0, x8, #16
	mov	sp, x0
	fcvt	d0, s0
	mov	w23, #26149                     ; =0x6625
	sturb	wzr, [x8, #-14]
	sturh	w23, [x8, #-16]
	str	d0, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	x24, #25943                     ; =0x6557
	sturb	wzr, [x8, #-8]
	movk	x24, #26473, lsl #16
	movk	x24, #29800, lsl #32
	movk	x24, #8250, lsl #48
	stur	x24, [x8, #-16]
	bl	_printf
	mov	x8, sp
	ldr	s0, [x19, #276]
	sub	x0, x8, #16
	mov	sp, x0
	fcvt	d0, s0
	sturb	wzr, [x8, #-14]
	sturh	w23, [x8, #-16]
	str	d0, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	x26, #29513                     ; =0x7349
	mov	w25, #29806                     ; =0x746e
	sturb	wzr, [x8, #-4]
	movk	x26, #21280, lsl #16
	movk	w25, #8250, lsl #16
	movk	x26, #30068, lsl #32
	stur	w25, [x8, #-8]
	movk	x26, #25956, lsl #48
	stur	x26, [x8, #-16]
	bl	_printf
	ldrb	w8, [x19, #284]
Lloh8:
	adrp	x28, _true_value_str@PAGE
Lloh9:
	add	x28, x28, _true_value_str@PAGEOFF
Lloh10:
	adrp	x21, _false_value_str@PAGE
Lloh11:
	add	x21, x21, _false_value_str@PAGEOFF
	cmp	w8, #0
	csel	x0, x28, x21, ne
	bl	_printf
	mov	x0, x20
	bl	_printf
	ldrh	w7, [x19, #300]
	ldrh	w6, [x19, #298]
	ldrh	w5, [x19, #296]
	ldrh	w4, [x19, #294]
	ldrh	w3, [x19, #292]
	ldrh	w2, [x19, #290]
	ldrh	w1, [x19, #288]
	ldrh	w0, [x19, #286]
	ldrh	w8, [x19, #302]
	ldrh	w9, [x19, #304]
	ldrh	w10, [x19, #306]
	sub	sp, sp, #16
	stp	w9, w10, [sp, #4]
	str	w8, [sp]
	bl	_PrintPhoneNumber
	add	sp, sp, #16
	add	x8, x19, #256
	add	x0, x8, #52
	bl	_PrintAddress
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	sturb	wzr, [x8, #-14]
	sturh	w27, [x8, #-16]
	mov	w8, #10                         ; =0xa
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w9, #8250                       ; =0x203a
	sturb	wzr, [x8, #-10]
	sturh	w9, [x8, #-12]
	mov	w9, #24910                      ; =0x614e
	movk	w9, #25965, lsl #16
	stur	w9, [x8, #-16]
	bl	_printf
	mov	x12, sp
	ldr	x8, [x19, #8]
	ldr	w9, [x19, #16]
	ldrh	w10, [x19, #20]
	ldrb	w11, [x19, #22]
	sub	x0, x12, #16
	mov	sp, x0
	sturb	w11, [x12, #-2]
	sturh	w10, [x12, #-4]
	stur	w9, [x12, #-8]
	stur	x8, [x12, #-16]
	bl	_printf
	mov	x0, x20
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w9, #25939                      ; =0x6553
	sturh	w22, [x8, #-12]
	movk	w9, #14968, lsl #16
	stur	w9, [x8, #-16]
	bl	_printf
	mov	x9, sp
	ldrb	w8, [x19, #23]
	sub	x0, x9, #16
	mov	sp, x0
	sturb	wzr, [x9, #-14]
	sturh	w27, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w9, #26433                      ; =0x6741
	sturh	w22, [x8, #-12]
	movk	w9, #14949, lsl #16
	stur	w9, [x8, #-16]
	bl	_printf
	mov	x9, sp
	ldrh	w8, [x19, #24]
	sub	x0, x9, #16
	mov	sp, x0
	mov	w10, #26661                     ; =0x6825
	movk	w10, #100, lsl #16
	stur	w10, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	x9, #25928                      ; =0x6548
	sturb	wzr, [x8, #-8]
	movk	x9, #26473, lsl #16
	movk	x9, #29800, lsl #32
	movk	x9, #8250, lsl #48
	stur	x9, [x8, #-16]
	bl	_printf
	mov	x8, sp
	ldr	s0, [x19, #28]
	sub	x0, x8, #16
	mov	sp, x0
	fcvt	d0, s0
	sturb	wzr, [x8, #-14]
	sturh	w23, [x8, #-16]
	str	d0, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	sturb	wzr, [x8, #-8]
	stur	x24, [x8, #-16]
	bl	_printf
	mov	x8, sp
	ldr	s0, [x19, #28]
	sub	x0, x8, #16
	mov	sp, x0
	fcvt	d0, s0
	sturb	wzr, [x8, #-14]
	sturh	w23, [x8, #-16]
	str	d0, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	sturb	wzr, [x8, #-4]
	stur	w25, [x8, #-8]
	stur	x26, [x8, #-16]
	bl	_printf
	ldrb	w8, [x19, #36]
	cmp	w8, #0
	csel	x0, x28, x21, ne
	bl	_printf
	mov	x0, x20
	bl	_printf
	ldrh	w7, [x19, #52]
	ldrh	w6, [x19, #50]
	ldrh	w5, [x19, #48]
	ldrh	w4, [x19, #46]
	ldrh	w3, [x19, #44]
	ldrh	w2, [x19, #42]
	ldrh	w1, [x19, #40]
	ldrh	w0, [x19, #38]
	ldrh	w8, [x19, #54]
	ldrh	w9, [x19, #56]
	ldrh	w10, [x19, #58]
	sub	sp, sp, #16
	stp	w9, w10, [sp, #4]
	str	w8, [sp]
	bl	_PrintPhoneNumber
	add	sp, sp, #16
	sub	sp, x29, #80
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
LBB0_33:                                ; %access_fail
Lloh12:
	adrp	x0, _out_of_bounds_err_str@PAGE
Lloh13:
	add	x0, x0, _out_of_bounds_err_str@PAGEOFF
	bl	_puts
	brk	#0x1
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh12, Lloh13
	.cfi_endproc
                                        ; -- End function
	.globl	_FillPhoneNumber                ; -- Begin function FillPhoneNumber
	.p2align	2
_FillPhoneNumber:                       ; @FillPhoneNumber
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w11, #1                         ; =0x1
	mov	w8, #26215                      ; =0x6667
	mov	w9, #10                         ; =0xa
	strh	w1, [sp, #14]
	sxth	w10, w11
	strh	w11, [sp, #12]
	cmp	w10, #11
	b.gt	LBB1_4
LBB1_1:                                 ; %for_body
                                        ; =>This Inner Loop Header: Depth=1
	ldrh	w11, [sp, #12]
	cbz	w11, LBB1_5
; %bb.2:                                ; %for_body
                                        ;   in Loop: Header=BB1_1 Depth=1
	cmp	w11, #12
	b.hs	LBB1_5
; %bb.3:                                ; %access_ok
                                        ;   in Loop: Header=BB1_1 Depth=1
	ldrsh	w12, [sp, #14]
	sub	w11, w11, #1
	sxth	x11, w11
	mul	w13, w12, w8
	asr	w14, w13, #18
	add	w13, w14, w13, lsr #31
	msub	w13, w13, w9, w12
	add	w12, w12, #1
	strh	w12, [sp, #14]
	strh	w13, [x0, x11, lsl #1]
	add	w11, w10, #1
	sxth	w10, w11
	strh	w11, [sp, #12]
	cmp	w10, #11
	b.le	LBB1_1
LBB1_4:                                 ; %for_exit
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
LBB1_5:                                 ; %access_fail
Lloh14:
	adrp	x0, _out_of_bounds_err_str@PAGE
Lloh15:
	add	x0, x0, _out_of_bounds_err_str@PAGEOFF
	bl	_puts
	brk	#0x1
	.loh AdrpAdd	Lloh14, Lloh15
	.cfi_endproc
                                        ; -- End function
	.globl	_PrintPhoneNumber               ; -- Begin function PrintPhoneNumber
	.p2align	2
_PrintPhoneNumber:                      ; @PrintPhoneNumber
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	sub	sp, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	ldp	w9, w8, [x29, #20]
	ldr	w10, [x29, #16]
	sturh	w0, [x29, #-54]
	sub	x0, x29, #72
	sturh	w7, [x29, #-40]
	sturh	w8, [x29, #-34]
	mov	x8, #26704                      ; =0x6850
	sturh	w9, [x29, #-36]
	mov	x9, #25197                      ; =0x626d
	movk	x8, #28271, lsl #16
	movk	x9, #29285, lsl #16
	movk	x8, #8293, lsl #32
	sturh	w10, [x29, #-38]
	movk	x9, #8250, lsl #32
	movk	x8, #30062, lsl #48
	sturh	w6, [x29, #-42]
	movk	x9, #43, lsl #48
	sturh	w5, [x29, #-44]
	sturh	w4, [x29, #-46]
	sturh	w3, [x29, #-48]
	sturh	w2, [x29, #-50]
	sturh	w1, [x29, #-52]
	stp	x8, x9, [x29, #-72]
	bl	_printf
	mov	w20, #26661                     ; =0x6825
	mov	w8, #1                          ; =0x1
	sub	x19, x29, #54
	movk	w20, #100, lsl #16
	sxth	w21, w8
	sturh	w8, [x29, #-56]
	cmp	w21, #11
	b.gt	LBB2_4
LBB2_1:                                 ; %for_body
                                        ; =>This Inner Loop Header: Depth=1
	ldurh	w8, [x29, #-56]
	cbz	w8, LBB2_5
; %bb.2:                                ; %for_body
                                        ;   in Loop: Header=BB2_1 Depth=1
	cmp	w8, #12
	b.hs	LBB2_5
; %bb.3:                                ; %access_ok
                                        ;   in Loop: Header=BB2_1 Depth=1
	sub	w8, w8, #1
	mov	x9, sp
	sxth	x8, w8
	sub	x0, x9, #16
	ldrh	w8, [x19, x8, lsl #1]
	mov	sp, x0
	stur	w20, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	add	w8, w21, #1
	sxth	w21, w8
	sturh	w8, [x29, #-56]
	cmp	w21, #11
	b.le	LBB2_1
LBB2_4:                                 ; %for_exit
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w9, #25381                      ; =0x6325
	sturb	wzr, [x8, #-14]
	sturh	w9, [x8, #-16]
	mov	w8, #10                         ; =0xa
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	sub	sp, x29, #32
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB2_5:                                 ; %access_fail
Lloh16:
	adrp	x0, _out_of_bounds_err_str@PAGE
Lloh17:
	add	x0, x0, _out_of_bounds_err_str@PAGEOFF
	bl	_puts
	brk	#0x1
	.loh AdrpAdd	Lloh16, Lloh17
	.cfi_endproc
                                        ; -- End function
	.globl	_PrintAddress                   ; -- Begin function PrintAddress
	.p2align	2
_PrintAddress:                          ; @PrintAddress
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	sub	sp, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	cbnz	wzr, LBB3_7
; %bb.1:                                ; %entry
	cbnz	wzr, LBB3_7
; %bb.2:                                ; %access_ok
	ldp	q0, q1, [x0]
	mov	x9, sp
	mov	x19, x0
	ldr	q2, [x0, #32]
	ldrh	w8, [x0, #48]
	sub	x0, x9, #64
	mov	sp, x0
	sturh	w8, [x9, #-16]
	stp	q1, q2, [x9, #-48]
	stur	q0, [x9, #-64]
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w9, #8236                       ; =0x202c
	sturb	wzr, [x8, #-14]
	sturh	w9, [x8, #-16]
	bl	_printf
	cbnz	wzr, LBB3_7
; %bb.3:                                ; %access_ok
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB3_7
; %bb.4:                                ; %access_ok.1
	mov	x9, sp
	ldur	q0, [x19, #50]
	ldur	q1, [x19, #66]
	ldur	q2, [x19, #82]
	ldrh	w8, [x19, #98]
	sub	x0, x9, #64
	mov	sp, x0
	sturh	w8, [x9, #-16]
	stp	q1, q2, [x9, #-48]
	stur	q0, [x9, #-64]
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w9, #8236                       ; =0x202c
	sturb	wzr, [x8, #-14]
	sturh	w9, [x8, #-16]
	bl	_printf
	cbnz	wzr, LBB3_7
; %bb.5:                                ; %access_ok.1
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB3_7
; %bb.6:                                ; %access_ok.2
	mov	x9, sp
	ldur	q0, [x19, #100]
	ldur	q1, [x19, #116]
	ldur	q2, [x19, #132]
	ldrh	w8, [x19, #148]
	sub	x0, x9, #64
	mov	sp, x0
	sturh	w8, [x9, #-16]
	stp	q1, q2, [x9, #-48]
	stur	q0, [x9, #-64]
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w9, #25381                      ; =0x6325
	sturb	wzr, [x8, #-14]
	sturh	w9, [x8, #-16]
	mov	w8, #10                         ; =0xa
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	sub	sp, x29, #16
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB3_7:                                 ; %access_fail
Lloh18:
	adrp	x0, _out_of_bounds_err_str@PAGE
Lloh19:
	add	x0, x0, _out_of_bounds_err_str@PAGEOFF
	bl	_puts
	brk	#0x1
	.loh AdrpAdd	Lloh18, Lloh19
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
	.p2align	4, 0x0                          ; @out_of_bounds_err_str
_out_of_bounds_err_str:
	.asciz	"Out of bounds error"

_end_line_str:                          ; @end_line_str
	.asciz	"\n"

_true_value_str:                        ; @true_value_str
	.asciz	"true"

_false_value_str:                       ; @false_value_str
	.asciz	"false"

.subsections_via_symbols
