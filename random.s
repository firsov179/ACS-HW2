	.file	"random.c"
	.intel_syntax noprefix
	.text
	.globl	generate
	.type	generate, @function
generate:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 5
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 500
	sub	eax, ecx
	mov	edx, eax
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR [rax], edx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L2
.L3:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, -1401515643
	shr	rdx, 32
	add	edx, eax
	sar	edx, 6
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 95
	sub	eax, ecx
	mov	edx, eax
	mov	eax, edx
	lea	ecx, 32[rax]
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L3
	nop
	nop
	leave
	ret
	.size	generate, .-generate
	.section	.rodata
.LC0:
	.string	"The minimal sign is \"%c\".\n"
.LC1:
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
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	esi, eax
	lea	rax, .LC1[rip]
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
	jmp	.L6
.L9:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jge	.L7
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	BYTE PTR [rax], dl
.L7:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jle	.L8
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	BYTE PTR [rax], dl
.L8:
	add	DWORD PTR -4[rbp], 1
.L6:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L9
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
	call	generate
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
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
