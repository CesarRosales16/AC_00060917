org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	mov 	bx,100d	; Lleva el control de cuando parar

	mov 	si, 25d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_h

	mov 	si, 25d  ; X -> Columna
	mov 	di, 125d ; Y -> Fila
	call 	linea_h

	mov 	bx,125d
	mov	si, 25d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_v

	mov 	bx, 45d 
	mov	si, 100d ; X -> Columna
	mov 	di, 25d  ; Y -> Fila
	call 	linea_v

	mov 	bx, 126d ; Originalmente es hasta 125d, el +1 es por el cringe dle punto faltante
	mov	si, 100d ; X -> Columna
	mov 	di, 105d ; Y -> Fila
	call 	linea_v

	mov 	bx, 101d ; Originalmente es hasta 100d, el +1 es por el cringe dle punto faltante
	mov 	si, 45d ; X -> Columna
	mov 	di, 45d ; Y -> Fila
	call 	linea_h

	mov 	si, 45d  ; X -> Columna
	mov 	di, 105d ; Y -> Fila
	call 	linea_h

	mov 	bx, 105d 
	mov	si, 45d ; X -> Columna
	mov 	di, 45d ; Y -> Fila
	call 	linea_v

	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

linea_h: 
lupi_h:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, bx
	jne 	lupi_h
	ret

linea_v:
lupi_v:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, bx
	jne 	lupi_v
	ret


kb: 	mov	ah, 00h
	int 	16h
	ret