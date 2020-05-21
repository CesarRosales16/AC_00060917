	org 	100h

section .text

	call 	init
	call 	texto	
	call 	cursor
	call 	phrase1
	call 	phrase2
	call 	phrase2
	call	kbwait

	int 	20h

init:	mov 	al, 0d
	mov 	[200h], al
	mov 	[210h], al
	mov 	al, 0d	
	ret

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, [200h] ; fila
	mov 	bh, 0h
	int 	10h
	ret

m_row:	mov 	[210h],	ax
	mov	ax, [200h]
        add     ax,5d
        mov	[200h],ax
	mov	ax, [210h]
        ret

phrase1:mov 	di, 10d
loop1:	mov 	cl, [msg1+di-10d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	loop1
	call 	m_row
	ret

phrase2:mov 	di, 33d
loop2:	mov 	cl, [msg2+di-33d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	loop2
	call 	m_row
	ret

phrase3:mov 	di, 33d
loop3:	mov 	cl, [msg3+di-33d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	loop3
	call 	m_row
	ret

section .data
msg1	db 	"Real Hasta la muerte  "
len1 	equ	$-msg1+10d

msg2	db 	"En este infierno (Oh-oh)"
len2 	equ	$-msg2+33d

msg3	db 	"Vi un angel pasar (Pasar)"
len3 	equ	$-msg3+33d

msg4	db 	"Que iluminaba mi camino en medio de la oscuridad"
len4 	equ	$-msg4+15d

msg5	db 	"Y le dije: Hola, te vi caminando en lo oscuro sola..."
len5 	equ	$-msg5+12d