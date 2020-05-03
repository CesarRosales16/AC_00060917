	org 100h

	;Ejercicio 1

	;Carné: 00060917  ,  digitos a usar: 60917
	mov ax, 6d
	mov bx, 0d
	ADD ax, bx
	mov bx, 9d
	ADD ax, bx
	mov bx, 1d
	ADD ax, bx
	mov bx, 7d
	ADD ax, bx

	mov bx, 5d
	DIV bx

section .data
msg db "Me recupero"	
len equ $-msg

section	.text
	mov di, 0d
	mov cx, len

msgloop:mov bl, [msg+di]
	mov [di+200h], bl
	inc di
	loop msgloop

	;Ejercicio 2

	mov ax, 4d
	mov [210h], ax
	mov bx, 1d
	mov cx, 2d

main:	MUL cx
	CMP ax, 255d
	JBE lower
	JA higher

lower:	mov [210h+bx], ax
	INC bx
	cmp bx, 16d
	JB main

higher: mov [210h+bx], ax
	ADD bx, 2d
	cmp bx, 16d
	JB main
	
	;Ejercicio 3

	mov ax, 0d
	mov [220h], ax
	mov cx, 1d
	mov [221h], cx

	mov bx, 2d	


fibo:	MOV dx, cx
	ADD cx, ax
	MOV ax, dx
	CMP cx, 255d		; CX <=255?lowerF:higherF
	JBE lowerf
	JA higherf

lowerf:	mov [220h+bx],cx
	INC bx
	cmp bx, 16d		;bx<16?fibo:NADA
	jb fibo

higherf:mov [220h+bx],cx
	ADD bx, 2d
	cmp bx, 16d
	jb fibo			;bx<16?fibo:NADA

	int 20h