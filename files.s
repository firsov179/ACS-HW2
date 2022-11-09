	.file	"files.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"%c"
	.text
	.globl	input
	.type	input, @function
input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -48[rbp], rsi
	mov	QWORD PTR -56[rbp], rdx
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	rax, QWORD PTR -56[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	DWORD PTR [rax], 0
	lea	rdx, -21[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	DWORD PTR -20[rbp], 0
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -20[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rdx, rax
	movzx	eax, BYTE PTR -21[rbp]
	mov	BYTE PTR [rdx], al
	add	DWORD PTR -20[rbp], 1
	lea	rdx, -21[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
.L2:
	movzx	eax, BYTE PTR -21[rbp]
	cmp	al, 10
	jne	.L3
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR -20[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leave
	ret
	.size	input, .-input
	.section	.rodata
.LC2:
	.string	"%c\n"
.LC3:
	.string	"Correct!"
.LC4:
	.string	"Something wrong!"
	.align 8
.LC5:
	.string	"Minimal sign is \"%c\", but your \"%c\".\n"
	.align 8
.LC6:
	.string	"Maximal sign is \"%c\", but your \"%c\".\n"
	.text
	.globl	print
	.type	print, @function
print:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -48[rbp], rsi
	mov	QWORD PTR -56[rbp], rdx
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	rax, QWORD PTR -56[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	lea	rdx, -18[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	lea	rdx, -17[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -40[rbp]
	movzx	edx, BYTE PTR [rax]
	movzx	eax, BYTE PTR -18[rbp]
	cmp	dl, al
	jne	.L6
	mov	rax, QWORD PTR -48[rbp]
	movzx	edx, BYTE PTR [rax]
	movzx	eax, BYTE PTR -17[rbp]
	cmp	dl, al
	jne	.L6
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L10
.L6:
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -40[rbp]
	movzx	edx, BYTE PTR [rax]
	movzx	eax, BYTE PTR -18[rbp]
	cmp	dl, al
	je	.L8
	mov	rax, QWORD PTR -40[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	edx, al
	movzx	eax, BYTE PTR -18[rbp]
	movsx	eax, al
	mov	esi, eax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L8:
	mov	rax, QWORD PTR -48[rbp]
	movzx	edx, BYTE PTR [rax]
	movzx	eax, BYTE PTR -17[rbp]
	cmp	dl, al
	je	.L10
	mov	rax, QWORD PTR -48[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	edx, al
	movzx	eax, BYTE PTR -17[rbp]
	movsx	eax, al
	mov	esi, eax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L10:
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	ret
	.size	print, .-print
	.globl	find
	.type	find, @function
find:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	DWORD PTR -44[rbp], ecx
	mov	rax, QWORD PTR -24[rbp]
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	BYTE PTR [rax], dl
	mov	rax, QWORD PTR -24[rbp]
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	BYTE PTR [rax], dl
	mov	DWORD PTR -4[rbp], 1
	jmp	.L12
.L15:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jge	.L13
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	BYTE PTR [rax], dl
.L13:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jle	.L14
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	BYTE PTR [rax], dl
.L14:
	add	DWORD PTR -4[rbp], 1
.L12:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L15
	nop
	nop
	pop	rbp
	ret
	.size	find, .-find
	.section	.rodata
	.align 8
.LC7:
	.string	"Something wrong!\n You should set names of two files."
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 1856
	mov	DWORD PTR -10036[rbp], edi
	mov	QWORD PTR -10048[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	cmp	DWORD PTR -10036[rbp], 3
	je	.L17
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L18
.L17:
	mov	rdx, QWORD PTR -10048[rbp]
	lea	rcx, -10020[rbp]
	lea	rax, -10016[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	input
	mov	ecx, DWORD PTR -10020[rbp]
	lea	rdx, -10021[rbp]
	lea	rsi, -10022[rbp]
	lea	rax, -10016[rbp]
	mov	rdi, rax
	call	find
	mov	rdx, QWORD PTR -10048[rbp]
	lea	rcx, -10021[rbp]
	lea	rax, -10022[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	print
	mov	eax, 0
.L18:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
