	.file	"files.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
	.text
	.globl	input
	.type	input, @function
input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	rax, QWORD PTR -40[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR [rax], 0
	mov	DWORD PTR -12[rbp], 0
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -12[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rdx, rax
	movzx	eax, BYTE PTR -13[rbp]
	mov	BYTE PTR [rdx], al
	add	DWORD PTR -12[rbp], 1
.L2:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fgetc@PLT
	mov	BYTE PTR -13[rbp], al
	cmp	BYTE PTR -13[rbp], -1
	jne	.L3
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR -12[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	leave
	ret
	.size	input, .-input
	.section	.rodata
.LC1:
	.string	"The minimal sign is \"%c\".\n"
.LC2:
	.string	"The maximal sign is \"%c\".\n"
	.text
	.globl	print
	.type	print, @function
print:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	rax, QWORD PTR -40[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	edx, al
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -32[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	edx, al
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	nop
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
	mov	DWORD PTR -8[rbp], 0
	jmp	.L6
.L7:
	add	DWORD PTR -8[rbp], 1
.L6:
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 10
	je	.L7
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	BYTE PTR [rax], dl
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	BYTE PTR [rax], dl
	mov	eax, DWORD PTR -8[rbp]
	add	eax, 1
	mov	DWORD PTR -4[rbp], eax
	jmp	.L8
.L11:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jge	.L9
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 10
	je	.L9
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	BYTE PTR [rax], dl
.L9:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jle	.L10
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	BYTE PTR [rax], dl
.L10:
	add	DWORD PTR -4[rbp], 1
.L8:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L11
	nop
	nop
	pop	rbp
	ret
	.size	find, .-find
	.section	.rodata
	.align 8
.LC3:
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
	je	.L13
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L14
.L13:
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
.L14:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
