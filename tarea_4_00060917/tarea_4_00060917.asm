org 	100h

section .text

	mov 	dx, m_input
	call 	w_strng

	xor 	si, si 	;lo mimso que: mov si, 0000h
lupi:	call 	kb
	cmp 	si, 5d
	jae	initavg
        sub     al, 48d
	mov	[300h+si], al ; CS:0300h en adelante
	inc 	si
	jmp 	lupi

initavg:mov     bx, 0000h
        mov     ax, 0000h
avg:    add     al, [300h+bx]
        inc     bx
        cmp     bx, 5d
        jb      avg
        mov     [310h], al
        mov     [320h], bl
        mov     cl, bl
        div     cl
        mov     [330h], al

shw_out:mov 	dx, nl
	call	w_strng
	cmp     al, 0Ah
        je      txt10
        cmp     al, 09h
        je      txt9
        cmp     al, 08h
        je      txt8
        cmp     al, 07h
        je      txt7
        cmp     al, 06h
        je      txt6
        cmp     al, 05h
        je      txt5
        cmp     al, 04h
        je      txt4
        cmp     al, 03h
        je      txt3
        cmp     al, 02h
        je      txt2
        cmp     al, 01h
        je      txt1
txt10:	mov 	dx, msg10
        jmp     w_out
txt9:	mov 	dx, msg9
        jmp     w_out
txt8:	mov 	dx, msg8
        jmp     w_out
txt7:	mov 	dx, msg7
        jmp     w_out
txt6:	mov 	dx, msg6
        jmp     w_out
txt5:	mov 	dx, msg5
        jmp     w_out
txt4:	mov 	dx, msg4
        jmp     w_out
txt3:	mov 	dx, msg3
        jmp     w_out
txt2:	mov 	dx, msg1
        jmp     w_out
txt1:	mov 	dx, msg1
        jmp     w_out
	
w_out:  call 	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h

kb: 	mov	ah, 1h
	int 	21h
	ret

w_strng:mov	ah, 09h
	int 	21h
	ret

section .data

m_input db 	"Ingrese los ultimos 5 digitos de su carne: $"
msg10 	db 	"Perfecto solo Dios$"
msg9 	db 	"Siempre me esfuerzo$"
msg8 	db 	"Colocho$"
msg7 	db 	"Muy bien$"
msg6 	db 	"Peor es nada$"
msg5 	db 	"En el segundo$"
msg4 	db 	"Me recupero$"
msg3 	db 	"Hay salud$"
msg2 	db 	"Aun se pasa$"
msg1 	db 	"Solo necesito el 0$"
nl	db 	0xA, 0xD, "$"