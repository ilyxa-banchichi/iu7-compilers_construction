	.build_version macos, 15, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	stp	d11, d10, [sp, #-128]!          ; 16-byte Folded Spill
	stp	d9, d8, [sp, #16]               ; 16-byte Folded Spill
	stp	x28, x27, [sp, #32]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #48]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	sub	sp, sp, #112
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
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	cbnz	wzr, LBB0_23
; %bb.1:                                ; %entry
	cbnz	wzr, LBB0_23
; %bb.2:                                ; %access_ok
	fmov	s0, #10.00000000
	fmov	s1, #5.00000000
	fmov	s2, #10.00000000
	bl	_Vector3
	fmov	s8, s0
	fmov	s9, s1
	fmov	s10, s2
	fmov	s0, #1.00000000
	fmov	s1, #1.00000000
	fmov	s2, #1.00000000
	bl	_Vector3
	fmov	s3, s0
	fmov	s4, s1
	fmov	s5, s2
	fmov	s0, s8
	fmov	s1, s9
	fmov	s2, s10
	bl	_AABB
	stp	s0, s1, [x29, #-192]
	stp	s2, s3, [x29, #-184]
	stp	s4, s5, [x29, #-176]
	cbnz	wzr, LBB0_23
; %bb.3:                                ; %access_ok
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_23
; %bb.4:                                ; %access_ok.1
	movi	d0, #0000000000000000
	movi	d1, #0000000000000000
	movi	d2, #0000000000000000
	bl	_Vector3
	fmov	s8, s0
	fmov	s9, s1
	fmov	s10, s2
	fmov	s0, #2.00000000
	fmov	s1, #2.00000000
	fmov	s2, #2.00000000
	bl	_Vector3
	fmov	s3, s0
	fmov	s4, s1
	fmov	s5, s2
	fmov	s0, s8
	fmov	s1, s9
	fmov	s2, s10
	bl	_AABB
	stp	s0, s1, [x29, #-168]
	stp	s2, s3, [x29, #-160]
	stp	s4, s5, [x29, #-152]
	cbnz	wzr, LBB0_23
; %bb.5:                                ; %access_ok.1
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_23
; %bb.6:                                ; %access_ok.2
	movi	d1, #0000000000000000
	fmov	s0, #1.00000000
	fmov	s2, #1.00000000
	bl	_Vector3
	fmov	s8, s0
	fmov	s9, s1
	fmov	s10, s2
	fmov	s0, #2.00000000
	fmov	s1, #2.00000000
	fmov	s2, #2.00000000
	bl	_Vector3
	fmov	s3, s0
	fmov	s4, s1
	fmov	s5, s2
	fmov	s0, s8
	fmov	s1, s9
	fmov	s2, s10
	bl	_AABB
	stp	s0, s1, [x29, #-144]
	stp	s2, s3, [x29, #-136]
	stp	s4, s5, [x29, #-128]
	cbnz	wzr, LBB0_23
; %bb.7:                                ; %access_ok.2
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_23
; %bb.8:                                ; %access_ok.3
	ldp	s4, s5, [x29, #-176]
	ldp	s2, s3, [x29, #-184]
	ldp	s0, s1, [x29, #-192]
	bl	_PrintAABB
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
	cbnz	wzr, LBB0_23
; %bb.9:                                ; %access_ok.3
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_23
; %bb.10:                               ; %access_ok.4
	ldp	s4, s5, [x29, #-152]
	ldp	s2, s3, [x29, #-160]
	ldp	s0, s1, [x29, #-168]
	bl	_PrintAABB
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	sturb	wzr, [x8, #-16]
	bl	_printf
Lloh2:
	adrp	x0, _end_line_str@PAGE
Lloh3:
	add	x0, x0, _end_line_str@PAGEOFF
	bl	_printf
	cbnz	wzr, LBB0_23
; %bb.11:                               ; %access_ok.4
	mov	w8, #1                          ; =0x1
	cbz	w8, LBB0_23
; %bb.12:                               ; %access_ok.5
	ldp	s4, s5, [x29, #-128]
	ldp	s2, s3, [x29, #-136]
	ldp	s0, s1, [x29, #-144]
	bl	_PrintAABB
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	sturb	wzr, [x8, #-16]
	bl	_printf
Lloh4:
	adrp	x19, _end_line_str@PAGE
Lloh5:
	add	x19, x19, _end_line_str@PAGEOFF
	mov	x0, x19
	bl	_printf
	sub	x0, x29, #210
	sub	x1, x29, #192
	sub	x20, x29, #210
	bl	_FillCollisionMatrix
	mov	x21, #8308                      ; =0x2074
	mov	x22, #28233                     ; =0x6e49
	mov	w23, #26661                     ; =0x6825
	movk	x21, #16705, lsl #16
	movk	x22, #25972, lsl #16
	mov	w24, #30240                     ; =0x7620
	movk	x21, #16962, lsl #32
	movk	x22, #29554, lsl #32
	mov	w8, #1                          ; =0x1
	movk	x21, #32, lsl #48
	movk	x22, #25445, lsl #48
	movk	w23, #100, lsl #16
	movk	w24, #8307, lsl #16
	mov	w25, #8250                      ; =0x203a
	mov	w26, #6                         ; =0x6
	b	LBB0_14
LBB0_13:                                ; %for_exit.1
                                        ;   in Loop: Header=BB0_14 Depth=1
	add	w8, w27, #1
LBB0_14:                                ; %for_cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_16 Depth 2
	sxth	w27, w8
	sturh	w8, [x29, #-114]
	cmp	w27, #3
	b.gt	LBB0_22
; %bb.15:                               ; %for_body
                                        ;   in Loop: Header=BB0_14 Depth=1
	mov	w8, #1                          ; =0x1
LBB0_16:                                ; %for_cond.1
                                        ;   Parent Loop BB0_14 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sxth	w28, w8
	sturh	w8, [x29, #-116]
	cmp	w28, #3
	b.gt	LBB0_13
; %bb.17:                               ; %for_body.1
                                        ;   in Loop: Header=BB0_16 Depth=2
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	stp	x22, x21, [x8, #-16]
	bl	_printf
	ldurh	w8, [x29, #-114]
	mov	x9, sp
	sub	x0, x9, #16
	mov	sp, x0
	stur	w23, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	sturb	wzr, [x8, #-12]
	stur	w24, [x8, #-16]
	bl	_printf
	ldurh	w8, [x29, #-116]
	mov	x9, sp
	sub	x0, x9, #16
	mov	sp, x0
	stur	w23, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x8, sp
	sub	x0, x8, #16
	mov	sp, x0
	sturb	wzr, [x8, #-14]
	sturh	w25, [x8, #-16]
	bl	_printf
	ldurh	w8, [x29, #-114]
	cbz	w8, LBB0_23
; %bb.18:                               ; %for_body.1
                                        ;   in Loop: Header=BB0_16 Depth=2
	cmp	w8, #3
	b.hi	LBB0_23
; %bb.19:                               ; %for_body.1
                                        ;   in Loop: Header=BB0_16 Depth=2
	ldurh	w9, [x29, #-116]
	cbz	w9, LBB0_23
; %bb.20:                               ; %for_body.1
                                        ;   in Loop: Header=BB0_16 Depth=2
	cmp	w9, #4
	b.hs	LBB0_23
; %bb.21:                               ; %access_ok.6
                                        ;   in Loop: Header=BB0_16 Depth=2
	sub	w8, w8, #1
	sub	w9, w9, #1
	sxth	x8, w8
	sxth	x9, w9
	smaddl	x8, w8, w26, x20
	ldrh	w8, [x8, x9, lsl #1]
	mov	x9, sp
	sub	x0, x9, #16
	mov	sp, x0
	stur	w23, [x9, #-16]
	str	x8, [sp, #-16]!
	bl	_printf
	add	sp, sp, #16
	mov	x0, x19
	bl	_printf
	add	w8, w28, #1
	b	LBB0_16
LBB0_22:                                ; %for_exit
	sub	sp, x29, #112
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #16]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp], #128            ; 16-byte Folded Reload
	ret
LBB0_23:                                ; %access_fail
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
	.globl	_Vector3                        ; -- Begin function Vector3
	.p2align	2
_Vector3:                               ; @Vector3
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	s1, s0, [sp, #8]
	str	s2, [sp, #4]
	stp	s0, s1, [sp, #16]
	str	s2, [sp, #24]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_PrintVector3                   ; -- Begin function PrintVector3
	.p2align	2
_PrintVector3:                          ; @PrintVector3
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #96
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 96
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	w19, #25381                     ; =0x6325
	mov	w8, #40                         ; =0x28
	add	x0, sp, #29
	stp	s1, s2, [sp, #36]
	str	s0, [sp, #32]
	sturh	w19, [sp, #29]
	strb	wzr, [sp, #31]
	str	x8, [sp]
	bl	_printf
	ldr	s0, [sp, #32]
	mov	w20, #26149                     ; =0x6625
	add	x0, sp, #26
	strh	w20, [sp, #26]
	fcvt	d0, s0
	strb	wzr, [sp, #28]
	str	d0, [sp]
	bl	_printf
	mov	w21, #8236                      ; =0x202c
	add	x0, sp, #23
	strb	wzr, [sp, #25]
	sturh	w21, [sp, #23]
	bl	_printf
	ldr	s0, [sp, #36]
	add	x0, sp, #20
	strh	w20, [sp, #20]
	strb	wzr, [sp, #22]
	fcvt	d0, s0
	str	d0, [sp]
	bl	_printf
	add	x0, sp, #17
	sturh	w21, [sp, #17]
	strb	wzr, [sp, #19]
	bl	_printf
	ldr	s0, [sp, #40]
	add	x0, sp, #14
	strh	w20, [sp, #14]
	strb	wzr, [sp, #16]
	fcvt	d0, s0
	str	d0, [sp]
	bl	_printf
	mov	w8, #41                         ; =0x29
	add	x0, sp, #11
	sturh	w19, [sp, #11]
	strb	wzr, [sp, #13]
	str	x8, [sp]
	bl	_printf
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_Mul                            ; -- Begin function Mul
	.p2align	2
_Mul:                                   ; @Mul
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	s0, s1, [sp, #16]
	fmul	s4, s0, s3
	fmul	s1, s1, s3
	str	s2, [sp, #24]
	fmul	s2, s2, s3
	str	s3, [sp, #12]
	stp	s4, s1, [sp, #32]
	fmov	s0, s4
	str	s2, [sp, #40]
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_Add                            ; -- Begin function Add
	.p2align	2
_Add:                                   ; @Add
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	s1, s2, [sp, #20]
	fadd	s1, s1, s4
	fadd	s2, s2, s5
	str	s0, [sp, #16]
	fadd	s0, s0, s3
	stp	s3, s4, [sp]
	str	s5, [sp, #8]
	str	s2, [sp, #40]
	stp	s0, s1, [sp, #32]
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_Sub                            ; -- Begin function Sub
	.p2align	2
_Sub:                                   ; @Sub
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	s1, s2, [sp, #20]
	fsub	s1, s1, s4
	fsub	s2, s2, s5
	str	s0, [sp, #16]
	fsub	s0, s0, s3
	stp	s3, s4, [sp]
	str	s5, [sp, #8]
	str	s2, [sp, #40]
	stp	s0, s1, [sp, #32]
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_PrintAABB                      ; -- Begin function PrintAABB
	.p2align	2
_PrintAABB:                             ; @PrintAABB
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stp	s4, s5, [sp, #24]
	stp	s2, s3, [sp, #16]
	stp	s0, s1, [sp, #8]
	bl	_PrintVector3
	mov	w8, #8236                       ; =0x202c
	add	x0, sp, #5
	strb	wzr, [sp, #7]
	sturh	w8, [sp, #5]
	bl	_printf
	ldp	s0, s1, [sp, #20]
	ldr	s2, [sp, #28]
	bl	_PrintVector3
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_AABB                           ; -- Begin function AABB
	.p2align	2
_AABB:                                  ; @AABB
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 96
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	fmov	s6, s3
	stp	s1, s2, [sp, #44]
	fmov	s1, s4
	str	s0, [sp, #40]
	fmov	s2, s5
	stp	s3, s4, [sp, #24]
	fmov	s3, #0.50000000
	str	s5, [sp, #32]
	fmov	s0, s6
	bl	_Mul
	fmov	s3, s0
	fmov	s4, s1
	stp	s0, s1, [sp, #8]
	fmov	s5, s2
	ldp	s0, s1, [sp, #40]
	ldr	s2, [sp, #48]
	str	s5, [sp, #16]
	bl	_Sub
	ldr	s6, [sp, #48]
	str	s2, [sp, #64]
	ldr	s5, [sp, #16]
	stp	s0, s1, [sp, #56]
	ldp	s0, s1, [sp, #40]
	fmov	s2, s6
	ldp	s3, s4, [sp, #8]
	bl	_Add
	fmov	s3, s0
	fmov	s4, s1
	fmov	s5, s2
	ldp	s0, s1, [sp, #56]
	ldr	s2, [sp, #64]
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	stp	s3, s4, [sp, #68]
	str	s5, [sp, #76]
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_IntersectAABB                  ; -- Begin function IntersectAABB
	.p2align	2
_IntersectAABB:                         ; @IntersectAABB
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	s2, s3, [sp, #40]
	stp	s0, s1, [sp, #32]
	ldp	s1, s2, [sp, #64]
	stp	s4, s5, [sp, #48]
	stp	s6, s7, [sp, #8]
	fcmp	s0, s2
	stp	s1, s2, [sp, #16]
	ldp	s0, s1, [sp, #72]
	cset	w0, ls
	strb	w0, [sp, #7]
	strh	w0, [sp, #62]
	stp	s0, s1, [sp, #24]
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_FillCollisionMatrix            ; -- Begin function FillCollisionMatrix
	.p2align	2
_FillCollisionMatrix:                   ; @FillCollisionMatrix
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #112
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 112
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
	mov	x19, x1
	mov	x20, x0
	mov	w8, #1                          ; =0x1
	mov	w21, #6                         ; =0x6
	mov	w22, #24                        ; =0x18
	b	LBB9_2
LBB9_1:                                 ; %for_exit.1
                                        ;   in Loop: Header=BB9_2 Depth=1
	add	w8, w23, #1
LBB9_2:                                 ; %for_cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB9_4 Depth 2
	sxth	w23, w8
	strh	w8, [sp, #30]
	cmp	w23, #3
	b.gt	LBB9_14
; %bb.3:                                ; %for_body
                                        ;   in Loop: Header=BB9_2 Depth=1
	mov	w8, #1                          ; =0x1
LBB9_4:                                 ; %for_cond.1
                                        ;   Parent Loop BB9_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sxth	w24, w8
	strh	w8, [sp, #28]
	cmp	w24, #3
	b.gt	LBB9_1
; %bb.5:                                ; %for_body.1
                                        ;   in Loop: Header=BB9_4 Depth=2
	ldrh	w9, [sp, #30]
	cbz	w9, LBB9_15
; %bb.6:                                ; %for_body.1
                                        ;   in Loop: Header=BB9_4 Depth=2
	cmp	w9, #3
	b.hi	LBB9_15
; %bb.7:                                ; %for_body.1
                                        ;   in Loop: Header=BB9_4 Depth=2
	ldrh	w8, [sp, #28]
	cbz	w8, LBB9_15
; %bb.8:                                ; %for_body.1
                                        ;   in Loop: Header=BB9_4 Depth=2
	cmp	w8, #4
	b.hs	LBB9_15
; %bb.9:                                ; %access_ok
                                        ;   in Loop: Header=BB9_4 Depth=2
	ldrh	w11, [sp, #30]
	cbz	w11, LBB9_15
; %bb.10:                               ; %access_ok
                                        ;   in Loop: Header=BB9_4 Depth=2
	cmp	w11, #4
	b.hs	LBB9_15
; %bb.11:                               ; %access_ok.1
                                        ;   in Loop: Header=BB9_4 Depth=2
	ldrh	w10, [sp, #28]
	cbz	w10, LBB9_15
; %bb.12:                               ; %access_ok.1
                                        ;   in Loop: Header=BB9_4 Depth=2
	cmp	w10, #4
	b.hs	LBB9_15
; %bb.13:                               ; %access_ok.2
                                        ;   in Loop: Header=BB9_4 Depth=2
	sub	w11, w11, #1
	sub	w10, w10, #1
	sub	w9, w9, #1
	sxth	x11, w11
	sxth	x10, w10
	sxth	x9, w9
	sub	w8, w8, #1
	smaddl	x11, w11, w22, x19
	smaddl	x10, w10, w22, x19
	smaddl	x9, w9, w21, x20
	ldp	s4, s5, [x11, #16]
	ldp	s2, s3, [x11, #8]
	ldur	q16, [x10, #8]
	ldp	s0, s1, [x11]
	add	x25, x9, w8, sxth #1
	ldp	s6, s7, [x10]
	str	q16, [sp]
	bl	_IntersectAABB
	add	w8, w24, #1
	strh	w0, [x25]
	b	LBB9_4
LBB9_14:                                ; %for_exit
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB9_15:                                ; %access_fail
Lloh8:
	adrp	x0, _out_of_bounds_err_str@PAGE
Lloh9:
	add	x0, x0, _out_of_bounds_err_str@PAGEOFF
	bl	_puts
	brk	#0x1
	.loh AdrpAdd	Lloh8, Lloh9
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
	.p2align	4, 0x0                          ; @out_of_bounds_err_str
_out_of_bounds_err_str:
	.asciz	"Out of bounds error"

_end_line_str:                          ; @end_line_str
	.asciz	"\n"

.subsections_via_symbols
