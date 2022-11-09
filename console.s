	.file	"console.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%c"
	.text
	.globl	input
	.type	input, @function
input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR [rax], 0
	lea	rax, -13[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
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
	lea	rax, -13[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
.L2:
	movzx	eax, BYTE PTR -13[rbp]
	cmp	al, 10
	jne	.L3
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR -12[rbp]
	mov	DWORD PTR [rax], edx
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
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	esi, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
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
	mov	rax, QWORD PTR -24[rbp]
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	BYTE PTR [rax], dl
	mov	rax, QWORD PTR -24[rbp]
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	BYTE PTR [rax], dl
	mov	DWORD PTR -4[rbp], 1
	jmp	.L7
.L10:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jge	.L8
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	BYTE PTR [rax], dl
.L8:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jle	.L9
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	BYTE PTR [rax], dl
.L9:
	add	DWORD PTR -4[rbp], 1
.L7:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L10
	nop
	nop
	pop	rbp
	ret
	.size	find, .-find
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 1840
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rdx, -10020[rbp]
	lea	rax, -10016[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	input
	mov	ecx, DWORD PTR -10020[rbp]
	lea	rdx, -10021[rbp]
	lea	rsi, -10022[rbp]
	lea	rax, -10016[rbp]
	mov	rdi, rax
	call	find
	lea	rdx, -10021[rbp]
	lea	rax, -10022[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	print
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
