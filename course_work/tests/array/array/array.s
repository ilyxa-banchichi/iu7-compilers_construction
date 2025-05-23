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
	add	x29, sp, #64
	sub	sp, sp, #384
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
	.cfi_offset w27, -72
	.cfi_offset w28, -80
	mov	w8, #10                         ; =0xa
	mov	w9, #5                          ; =0x5
	add	x0, x19, #14
	sturb	w8, [x29, #-68]
	mov	w8, #29249                      ; =0x7241
	movk	w8, #24946, lsl #16
	sturb	w9, [x29, #-69]
	stur	w8, [x19, #14]
	mov	w8, #121                        ; =0x79
	strh	w8, [x19, #18]
	bl	_printf
Lloh0:
	adrp	x20, _end_line_str@PAGE
Lloh1:
	add	x20, x20, _end_line_str@PAGEOFF
	mov	x0, x20
	bl	_printf
	mov	w8, #28233                      ; =0x6e49
	add	x0, x19, #10
	movk	w8, #116, lsl #16
	stur	w8, [x19, #10]
	bl	_printf
	mov	x0, x20
	bl	_printf
	mov	w10, #1                         ; =0x1
	sub	x8, x29, #96
	sxtb	w9, w10
	ldursb	w11, [x29, #-68]
	sturb	w10, [x29, #-65]
	cmp	w9, w11
	b.gt	LBB0_4
LBB0_1:                                 ; %for_body
                                        ; =>This Inner Loop Header: Depth=1
	ldurb	w10, [x29, #-65]
	cbz	w10, LBB0_79
; %bb.2:                                ; %for_body
                                        ;   in Loop: Header=BB0_1 Depth=1
	cmp	w10, #10
	b.hi	LBB0_79
; %bb.3:                                ; %access_ok
                                        ;   in Loop: Header=BB0_1 Depth=1
	ldurb	w11, [x29, #-65]
	sub	w10, w10, #1
	sxtb	x10, w10
	sub	w11, w11, #1
	sxtb	w11, w11
	strh	w11, [x8, x10, lsl #1]
	add	w10, w9, #1
	sxtb	w9, w10
	ldursb	w11, [x29, #-68]
	sturb	w10, [x29, #-65]
	cmp	w9, w11
	b.le	LBB0_1
LBB0_4:                                 ; %for_cond.1.preheader
	mov	w22, #26661                     ; =0x6825
	mov	w8, #1                          ; =0x1
	sub	x21, x29, #96
	movk	w22, #100, lsl #16
Lloh2:
	adrp	x20, _end_line_str@PAGE
Lloh3:
	add	x20, x20, _end_line_str@PAGEOFF
	sxtb	w23, w8
	ldursb	w9, [x29, #-68]
	sturb	w8, [x29, #-65]
	cmp	w23, w9
	b.gt	LBB0_8
LBB0_5:                                 ; %for_body.1
                                        ; =>This Inner Loop Header: Depth=1
	ldurb	w8, [x29, #-65]
	cbz	w8, LBB0_79
; %bb.6:                                ; %for_body.1
                                        ;   in Loop: Header=BB0_5 Depth=1
	cmp	w8, #11
	b.hs	LBB0_79
; %bb.7:                                ; %access_ok.1
                                        ;   in Loop: Header=BB0_5 Depth=1
	sub	w8, w8, #1
	mov	x9, sp
	sxtb	x8, w8
	sub	x0, x9, #16
	ldrh	w8, [x21, x8, lsl #1]
	mov	sp, x0
	stur	w22, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	add	w8, w23, #1
	sxtb	w23, w8
	ldursb	w9, [x29, #-68]
	sturb	w8, [x29, #-65]
	cmp	w23, w9
	b.le	LBB0_5
LBB0_8:                                 ; %for_exit.1
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w10, #27718                     ; =0x6c46
	mov	w9, #116                        ; =0x74
	movk	w10, #24943, lsl #16
	sturh	w9, [x8, #-12]
	stur	w10, [x8, #-16]
	bl	_printf
Lloh4:
	adrp	x0, _end_line_str@PAGE
Lloh5:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	mov	w10, #1                         ; =0x1
	sub	x8, x29, #136
	sxtb	w9, w10
	ldursb	w11, [x29, #-68]
	sturb	w10, [x29, #-65]
	cmp	w9, w11
	b.gt	LBB0_12
LBB0_9:                                 ; %for_body.2
                                        ; =>This Inner Loop Header: Depth=1
	ldurb	w10, [x29, #-65]
	cbz	w10, LBB0_79
; %bb.10:                               ; %for_body.2
                                        ;   in Loop: Header=BB0_9 Depth=1
	cmp	w10, #10
	b.hi	LBB0_79
; %bb.11:                               ; %access_ok.2
                                        ;   in Loop: Header=BB0_9 Depth=1
	ldurb	w11, [x29, #-65]
	sub	w10, w10, #1
	sxtb	x10, w10
	sub	w11, w11, #1
	sxtb	w11, w11
	scvtf	s0, w11
	str	s0, [x8, x10, lsl #2]
	add	w10, w9, #1
	sxtb	w9, w10
	ldursb	w11, [x29, #-68]
	sturb	w10, [x29, #-65]
	cmp	w9, w11
	b.le	LBB0_9
LBB0_12:                                ; %for_cond.3.preheader
	mov	w8, #1                          ; =0x1
	sub	x21, x29, #136
	mov	w22, #26149                     ; =0x6625
Lloh6:
	adrp	x20, _end_line_str@PAGE
Lloh7:
	add	x20, x20, _end_line_str@PAGEOFF
	sxtb	w23, w8
	ldursb	w9, [x29, #-68]
	sturb	w8, [x29, #-65]
	cmp	w23, w9
	b.gt	LBB0_16
LBB0_13:                                ; %for_body.3
                                        ; =>This Inner Loop Header: Depth=1
	ldurb	w8, [x29, #-65]
	cbz	w8, LBB0_79
; %bb.14:                               ; %for_body.3
                                        ;   in Loop: Header=BB0_13 Depth=1
	cmp	w8, #11
	b.hs	LBB0_79
; %bb.15:                               ; %access_ok.3
                                        ;   in Loop: Header=BB0_13 Depth=1
	sub	w8, w8, #1
	sxtb	x8, w8
	ldr	s0, [x21, x8, lsl #2]
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	fcvt	d0, s0
	sturb	wzr, [x8, #-14]
	sturh	w22, [x8, #-16]
	str	d0, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	add	w8, w23, #1
	sxtb	w23, w8
	ldursb	w9, [x29, #-68]
	sturb	w8, [x29, #-65]
	cmp	w23, w9
	b.le	LBB0_13
LBB0_16:                                ; %for_exit.3
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w10, #26691                     ; =0x6843
	mov	w9, #10                         ; =0xa
	movk	w10, #29281, lsl #16
	sturh	w9, [x8, #-12]
	stur	w10, [x8, #-16]
	bl	_printf
Lloh8:
	adrp	x0, _end_line_str@PAGE
Lloh9:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	mov	w10, #1                         ; =0x1
	sub	x8, x29, #146
	sxtb	w9, w10
	ldursb	w11, [x29, #-68]
	sturb	w10, [x29, #-65]
	cmp	w9, w11
	b.gt	LBB0_20
LBB0_17:                                ; %for_body.4
                                        ; =>This Inner Loop Header: Depth=1
	ldurb	w10, [x29, #-65]
	cbz	w10, LBB0_79
; %bb.18:                               ; %for_body.4
                                        ;   in Loop: Header=BB0_17 Depth=1
	cmp	w10, #10
	b.hi	LBB0_79
; %bb.19:                               ; %access_ok.4
                                        ;   in Loop: Header=BB0_17 Depth=1
	sub	w10, w10, #1
	ldurb	w11, [x29, #-65]
	sxtb	x10, w10
	add	w11, w11, #60
	strb	w11, [x8, x10]
	add	w10, w9, #1
	sxtb	w9, w10
	ldursb	w11, [x29, #-68]
	sturb	w10, [x29, #-65]
	cmp	w9, w11
	b.le	LBB0_17
LBB0_20:                                ; %for_cond.5.preheader
	mov	w8, #1                          ; =0x1
	sub	x21, x29, #146
	mov	w22, #25381                     ; =0x6325
Lloh10:
	adrp	x20, _end_line_str@PAGE
Lloh11:
	add	x20, x20, _end_line_str@PAGEOFF
	sxtb	w23, w8
	ldursb	w9, [x29, #-68]
	sturb	w8, [x29, #-65]
	cmp	w23, w9
	b.gt	LBB0_24
LBB0_21:                                ; %for_body.5
                                        ; =>This Inner Loop Header: Depth=1
	ldurb	w8, [x29, #-65]
	cbz	w8, LBB0_79
; %bb.22:                               ; %for_body.5
                                        ;   in Loop: Header=BB0_21 Depth=1
	cmp	w8, #11
	b.hs	LBB0_79
; %bb.23:                               ; %access_ok.5
                                        ;   in Loop: Header=BB0_21 Depth=1
	sub	w8, w8, #1
	mov	x9, sp
	sxtb	x8, w8
	sub	x0, x9, #16
	ldrb	w8, [x21, x8]
	mov	sp, x0
	sturb	wzr, [x9, #-14]
	sturh	w22, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	add	w8, w23, #1
	sxtb	w23, w8
	ldursb	w9, [x29, #-68]
	sturb	w8, [x29, #-65]
	cmp	w23, w9
	b.le	LBB0_21
LBB0_24:                                ; %for_exit.5
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w10, #24909                     ; =0x614d
	mov	w9, #30825                      ; =0x7869
	sturb	wzr, [x8, #-10]
	movk	w10, #29300, lsl #16
	sturh	w9, [x8, #-12]
	stur	w10, [x8, #-16]
	bl	_printf
Lloh12:
	adrp	x20, _end_line_str@PAGE
Lloh13:
	add	x20, x20, _end_line_str@PAGEOFF
	mov	x0, x20
	bl	_printf
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w9, #28233                      ; =0x6e49
	movk	w9, #116, lsl #16
	stur	w9, [x8, #-16]
	bl	_printf
	mov	x0, x20
	bl	_printf
	mov	w10, #1                         ; =0x1
	add	x8, x19, #222
	sturb	wzr, [x29, #-67]
	b	LBB0_26
LBB0_25:                                ; %for_exit.7
                                        ;   in Loop: Header=BB0_26 Depth=1
	add	w10, w9, #1
LBB0_26:                                ; %for_cond.6
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_28 Depth 2
	sxtb	w9, w10
	ldursb	w11, [x29, #-68]
	sturb	w10, [x29, #-65]
	cmp	w9, w11
	b.gt	LBB0_33
; %bb.27:                               ; %for_cond.7.preheader
                                        ;   in Loop: Header=BB0_26 Depth=1
	mov	w11, #2                         ; =0x2
	sxtb	w10, w11
	ldursb	w12, [x29, #-69]
	sturb	w11, [x29, #-66]
	cmp	w10, w12
	b.gt	LBB0_25
LBB0_28:                                ; %for_body.7
                                        ;   Parent Loop BB0_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldurb	w11, [x29, #-65]
	cbz	w11, LBB0_79
; %bb.29:                               ; %for_body.7
                                        ;   in Loop: Header=BB0_28 Depth=2
	cmp	w11, #10
	b.hi	LBB0_79
; %bb.30:                               ; %for_body.7
                                        ;   in Loop: Header=BB0_28 Depth=2
	ldurb	w13, [x29, #-66]
	subs	w12, w13, #2
	b.lo	LBB0_79
; %bb.31:                               ; %for_body.7
                                        ;   in Loop: Header=BB0_28 Depth=2
	cmp	w13, #6
	b.hs	LBB0_79
; %bb.32:                               ; %access_ok.6
                                        ;   in Loop: Header=BB0_28 Depth=2
	sub	w11, w11, #1
	ldursb	w13, [x29, #-67]
	sxtb	x12, w12
	add	x11, x8, w11, sxtb #3
	add	w14, w13, #1
	strh	w13, [x11, x12, lsl #1]
	add	w11, w10, #1
	sturb	w14, [x29, #-67]
	sxtb	w10, w11
	ldursb	w12, [x29, #-69]
	sturb	w11, [x29, #-66]
	cmp	w10, w12
	b.le	LBB0_28
	b	LBB0_25
LBB0_33:                                ; %for_cond.8.preheader
	mov	w22, #26661                     ; =0x6825
	mov	w8, #1                          ; =0x1
	add	x21, x19, #222
	movk	w22, #100, lsl #16
Lloh14:
	adrp	x20, _end_line_str@PAGE
Lloh15:
	add	x20, x20, _end_line_str@PAGEOFF
	b	LBB0_35
LBB0_34:                                ; %for_exit.9
                                        ;   in Loop: Header=BB0_35 Depth=1
	add	w8, w23, #1
LBB0_35:                                ; %for_cond.8
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_37 Depth 2
	sxtb	w23, w8
	ldursb	w9, [x29, #-68]
	sturb	w8, [x29, #-65]
	cmp	w23, w9
	b.gt	LBB0_42
; %bb.36:                               ; %for_cond.9.preheader
                                        ;   in Loop: Header=BB0_35 Depth=1
	mov	w8, #2                          ; =0x2
	sxtb	w24, w8
	ldursb	w9, [x29, #-69]
	sturb	w8, [x29, #-66]
	cmp	w24, w9
	b.gt	LBB0_34
LBB0_37:                                ; %for_body.9
                                        ;   Parent Loop BB0_35 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldurb	w8, [x29, #-65]
	cbz	w8, LBB0_79
; %bb.38:                               ; %for_body.9
                                        ;   in Loop: Header=BB0_37 Depth=2
	cmp	w8, #10
	b.hi	LBB0_79
; %bb.39:                               ; %for_body.9
                                        ;   in Loop: Header=BB0_37 Depth=2
	ldurb	w10, [x29, #-66]
	subs	w9, w10, #2
	b.lo	LBB0_79
; %bb.40:                               ; %for_body.9
                                        ;   in Loop: Header=BB0_37 Depth=2
	cmp	w10, #6
	b.hs	LBB0_79
; %bb.41:                               ; %access_ok.7
                                        ;   in Loop: Header=BB0_37 Depth=2
	sub	w8, w8, #1
	sxtb	x9, w9
	add	x8, x21, w8, sxtb #3
	ldrh	w8, [x8, x9, lsl #1]
	mov	x9, sp
	sub	x0, x9, #16
	mov	sp, x0
	stur	w22, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	add	w8, w24, #1
	sxtb	w24, w8
	ldursb	w9, [x29, #-69]
	sturb	w8, [x29, #-66]
	cmp	w24, w9
	b.le	LBB0_37
	b	LBB0_34
LBB0_42:                                ; %for_exit.8
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w10, #27718                     ; =0x6c46
	mov	w9, #116                        ; =0x74
	movk	w10, #24943, lsl #16
	sturh	w9, [x8, #-12]
	stur	w10, [x8, #-16]
	bl	_printf
Lloh16:
	adrp	x0, _end_line_str@PAGE
Lloh17:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	mov	w10, #1                         ; =0x1
	add	x8, x19, #60
	sturb	wzr, [x29, #-67]
	b	LBB0_44
LBB0_43:                                ; %for_exit.11
                                        ;   in Loop: Header=BB0_44 Depth=1
	add	w10, w9, #1
LBB0_44:                                ; %for_cond.10
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_46 Depth 2
	sxtb	w9, w10
	ldursb	w11, [x29, #-68]
	sturb	w10, [x29, #-65]
	cmp	w9, w11
	b.gt	LBB0_51
; %bb.45:                               ; %for_cond.11.preheader
                                        ;   in Loop: Header=BB0_44 Depth=1
	mov	w11, #2                         ; =0x2
	sxtb	w10, w11
	ldursb	w12, [x29, #-69]
	sturb	w11, [x29, #-66]
	cmp	w10, w12
	b.gt	LBB0_43
LBB0_46:                                ; %for_body.11
                                        ;   Parent Loop BB0_44 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldurb	w11, [x29, #-65]
	cbz	w11, LBB0_79
; %bb.47:                               ; %for_body.11
                                        ;   in Loop: Header=BB0_46 Depth=2
	cmp	w11, #10
	b.hi	LBB0_79
; %bb.48:                               ; %for_body.11
                                        ;   in Loop: Header=BB0_46 Depth=2
	ldurb	w13, [x29, #-66]
	subs	w12, w13, #2
	b.lo	LBB0_79
; %bb.49:                               ; %for_body.11
                                        ;   in Loop: Header=BB0_46 Depth=2
	cmp	w13, #6
	b.hs	LBB0_79
; %bb.50:                               ; %access_ok.8
                                        ;   in Loop: Header=BB0_46 Depth=2
	ldursb	w13, [x29, #-67]
	sub	w11, w11, #1
	sxtb	x12, w12
	add	x11, x8, w11, sxtb #4
	scvtf	s0, w13
	add	w13, w13, #1
	sturb	w13, [x29, #-67]
	str	s0, [x11, x12, lsl #2]
	add	w11, w10, #1
	sxtb	w10, w11
	ldursb	w12, [x29, #-69]
	sturb	w11, [x29, #-66]
	cmp	w10, w12
	b.le	LBB0_46
	b	LBB0_43
LBB0_51:                                ; %for_cond.12.preheader
	mov	w8, #1                          ; =0x1
	add	x21, x19, #60
	mov	w22, #26149                     ; =0x6625
Lloh18:
	adrp	x20, _end_line_str@PAGE
Lloh19:
	add	x20, x20, _end_line_str@PAGEOFF
	b	LBB0_53
LBB0_52:                                ; %for_exit.13
                                        ;   in Loop: Header=BB0_53 Depth=1
	add	w8, w23, #1
LBB0_53:                                ; %for_cond.12
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_55 Depth 2
	sxtb	w23, w8
	ldursb	w9, [x29, #-68]
	sturb	w8, [x29, #-65]
	cmp	w23, w9
	b.gt	LBB0_60
; %bb.54:                               ; %for_cond.13.preheader
                                        ;   in Loop: Header=BB0_53 Depth=1
	mov	w8, #2                          ; =0x2
	sxtb	w24, w8
	ldursb	w9, [x29, #-69]
	sturb	w8, [x29, #-66]
	cmp	w24, w9
	b.gt	LBB0_52
LBB0_55:                                ; %for_body.13
                                        ;   Parent Loop BB0_53 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldurb	w8, [x29, #-65]
	cbz	w8, LBB0_79
; %bb.56:                               ; %for_body.13
                                        ;   in Loop: Header=BB0_55 Depth=2
	cmp	w8, #10
	b.hi	LBB0_79
; %bb.57:                               ; %for_body.13
                                        ;   in Loop: Header=BB0_55 Depth=2
	ldurb	w10, [x29, #-66]
	subs	w9, w10, #2
	b.lo	LBB0_79
; %bb.58:                               ; %for_body.13
                                        ;   in Loop: Header=BB0_55 Depth=2
	cmp	w10, #6
	b.hs	LBB0_79
; %bb.59:                               ; %access_ok.9
                                        ;   in Loop: Header=BB0_55 Depth=2
	sub	w8, w8, #1
	sxtb	x9, w9
	add	x8, x21, w8, sxtb #4
	ldr	s0, [x8, x9, lsl #2]
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	fcvt	d0, s0
	sturb	wzr, [x8, #-14]
	sturh	w22, [x8, #-16]
	str	d0, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	add	w8, w24, #1
	sxtb	w24, w8
	ldursb	w9, [x29, #-69]
	sturb	w8, [x29, #-66]
	cmp	w24, w9
	b.le	LBB0_55
	b	LBB0_52
LBB0_60:                                ; %for_exit.12
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	mov	w9, #26691                      ; =0x6843
	sturb	wzr, [x8, #-12]
	movk	w9, #29281, lsl #16
	stur	w9, [x8, #-16]
	bl	_printf
Lloh20:
	adrp	x0, _end_line_str@PAGE
Lloh21:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	mov	w8, #60                         ; =0x3c
	mov	w10, #1                         ; =0x1
	sturb	w8, [x29, #-67]
	add	x8, x19, #20
	b	LBB0_62
LBB0_61:                                ; %for_exit.15
                                        ;   in Loop: Header=BB0_62 Depth=1
	add	w10, w9, #1
LBB0_62:                                ; %for_cond.14
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_64 Depth 2
	sxtb	w9, w10
	ldursb	w11, [x29, #-68]
	sturb	w10, [x29, #-65]
	cmp	w9, w11
	b.gt	LBB0_69
; %bb.63:                               ; %for_cond.15.preheader
                                        ;   in Loop: Header=BB0_62 Depth=1
	mov	w11, #2                         ; =0x2
	sxtb	w10, w11
	ldursb	w12, [x29, #-69]
	sturb	w11, [x29, #-66]
	cmp	w10, w12
	b.gt	LBB0_61
LBB0_64:                                ; %for_body.15
                                        ;   Parent Loop BB0_62 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldurb	w11, [x29, #-65]
	cbz	w11, LBB0_79
; %bb.65:                               ; %for_body.15
                                        ;   in Loop: Header=BB0_64 Depth=2
	cmp	w11, #10
	b.hi	LBB0_79
; %bb.66:                               ; %for_body.15
                                        ;   in Loop: Header=BB0_64 Depth=2
	ldurb	w13, [x29, #-66]
	subs	w12, w13, #2
	b.lo	LBB0_79
; %bb.67:                               ; %for_body.15
                                        ;   in Loop: Header=BB0_64 Depth=2
	cmp	w13, #6
	b.hs	LBB0_79
; %bb.68:                               ; %access_ok.10
                                        ;   in Loop: Header=BB0_64 Depth=2
	sub	w11, w11, #1
	ldurb	w13, [x29, #-67]
	sxtb	x12, w12
	add	x11, x8, w11, sxtb #2
	add	w14, w13, #1
	strb	w13, [x11, x12]
	add	w11, w10, #1
	sturb	w14, [x29, #-67]
	sxtb	w10, w11
	ldursb	w12, [x29, #-69]
	sturb	w11, [x29, #-66]
	cmp	w10, w12
	b.le	LBB0_64
	b	LBB0_61
LBB0_69:                                ; %for_cond.16.preheader
	mov	w8, #1                          ; =0x1
	add	x21, x19, #20
	mov	w22, #25381                     ; =0x6325
Lloh22:
	adrp	x20, _end_line_str@PAGE
Lloh23:
	add	x20, x20, _end_line_str@PAGEOFF
	b	LBB0_71
LBB0_70:                                ; %for_exit.17
                                        ;   in Loop: Header=BB0_71 Depth=1
	add	w8, w23, #1
LBB0_71:                                ; %for_cond.16
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_73 Depth 2
	sxtb	w23, w8
	ldursb	w9, [x29, #-68]
	sturb	w8, [x29, #-65]
	cmp	w23, w9
	b.gt	LBB0_78
; %bb.72:                               ; %for_cond.17.preheader
                                        ;   in Loop: Header=BB0_71 Depth=1
	mov	w8, #2                          ; =0x2
	sxtb	w24, w8
	ldursb	w9, [x29, #-69]
	sturb	w8, [x29, #-66]
	cmp	w24, w9
	b.gt	LBB0_70
LBB0_73:                                ; %for_body.17
                                        ;   Parent Loop BB0_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldurb	w8, [x29, #-65]
	cbz	w8, LBB0_79
; %bb.74:                               ; %for_body.17
                                        ;   in Loop: Header=BB0_73 Depth=2
	cmp	w8, #10
	b.hi	LBB0_79
; %bb.75:                               ; %for_body.17
                                        ;   in Loop: Header=BB0_73 Depth=2
	ldurb	w10, [x29, #-66]
	subs	w9, w10, #2
	b.lo	LBB0_79
; %bb.76:                               ; %for_body.17
                                        ;   in Loop: Header=BB0_73 Depth=2
	cmp	w10, #6
	b.hs	LBB0_79
; %bb.77:                               ; %access_ok.11
                                        ;   in Loop: Header=BB0_73 Depth=2
	sub	w8, w8, #1
	sxtb	x9, w9
	add	x8, x21, w8, sxtb #2
	ldrb	w8, [x8, x9]
	mov	x9, sp
	sub	x0, x9, #16
	mov	sp, x0
	sturb	wzr, [x9, #-14]
	sturh	w22, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x20
	bl	_printf
	add	w8, w24, #1
	sxtb	w24, w8
	ldursb	w9, [x29, #-69]
	sturb	w8, [x29, #-66]
	cmp	w24, w9
	b.le	LBB0_73
	b	LBB0_70
LBB0_78:                                ; %for_exit.16
	sub	sp, x29, #64
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #80             ; 16-byte Folded Reload
	ret
LBB0_79:                                ; %access_fail
Lloh24:
	adrp	x0, _out_of_bounds_err_str@PAGE
Lloh25:
	add	x0, x0, _out_of_bounds_err_str@PAGEOFF
	bl	_puts
	brk	#0x1
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh12, Lloh13
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh24, Lloh25
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
_end_line_str:                          ; @end_line_str
	.asciz	"\n"

	.p2align	4, 0x0                          ; @out_of_bounds_err_str
_out_of_bounds_err_str:
	.asciz	"Out of bounds error"

.subsections_via_symbols
