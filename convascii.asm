segment .data

segment .bss
	regimp resb 8
	regout resb 16
segment .text

global _start

_start:

	

primero:
	mov rbx,[regimp]
	and rbx, 0x0000000f;mascara, para extraer los ultimos bits
	cmp rbx, 0x00000009
	jbe esn1;  salta si es numero
	ja ess1; salta si es string

esn1:
	add rbx, 0x30 
	jmp segundo
 ess1:
	add rbx, 0x37 
	

;_______________________________________________________________________
segundo:
	shl rbx, 56
	mov [regout], rbx
	mov rbx,[regimp]
	shr rbx, 4
	and rbx, 0x0000000f;mascara, para extraer los ultimos bits
	cmp rbx, 0x00000009
	jbe esn2;  salta si es numero
	ja ess2; salta si es string

esn2:
	add rbx, 0x30 
	jmp tercero
 ess2:
	add rbx, 0x37
	
;________________________________________
tercero:
	shl rbx, 48
	or [regout], rbx
	mov rbx,[regimp]
	shr rbx, 8
	and rbx, 0x0000000f;mascara, para extraer los ultimos bits
	cmp rbx, 0x00000009
	jbe esn3;  salta si es numero
	ja ess3; salta si es string

esn3:
	add rbx, 0x30 
	jmp cuarto
 ess3:
	add rbx, 0x37

cuarto:
	shl rbx, 40
	or [regout], rbx
	mov rbx,[regimp]
	shr rbx, 12
	and rbx, 0x0000000f;mascara, para extraer los ultimos bits
	cmp rbx, 0x00000009
	jbe esn4;  salta si es numero
	ja ess4; salta si es string

esn4:
	add rbx, 0x30 
	jmp quinto
 ess4:
	add rbx, 0x37

quinto:
	shl rbx, 32
	or [regout], rbx
	mov rbx,[regimp]
	shr rbx, 16
	and rbx, 0x0000000f;mascara, para extraer los ultimos bits
	cmp rbx, 0x00000009
	jbe esn5;  salta si es numero
	ja ess5; salta si es string

esn5:
	add rbx, 0x30 
	jmp sexto
 ess5:
	add rbx, 0x37
sexto:
	shl rbx, 24
	or [regout], rbx
	mov rbx,[regimp]
	shr rbx, 20
	and rbx, 0x0000000f;mascara, para extraer los ultimos bits
	cmp rbx, 0x00000009
	jbe esn6;  salta si es numero
	ja ess6; salta si es string

esn6:
	add rbx, 0x30 
	jmp setimo
 ess6:
	add rbx, 0x37

setimo:
	shl rbx, 16
	or [regout], rbx
	mov rbx,[regimp]
	shr rbx, 24
	and rbx, 0x0000000f;mascara, para extraer los ultimos bits
	cmp rbx, 0x00000009
	jbe esn7;  salta si es numero
	ja ess7; salta si es string

esn7:
	add rbx, 0x30 
	jmp octavo
 ess7:
	add rbx, 0x37
octavo:

	shl rbx, 8
	or [regout], rbx
	mov rbx,[regimp]
	shr rbx, 28
	and rbx, 0x0000000f;mascara, para extraer los ultimos bits
	cmp rbx, 0x00000009
	jbe esn8;  salta si es numero
	ja ess8; salta si es string

esn8:
	add rbx, 0x00000030; lo convierte en numero ascii
	jmp saledec
 ess8:
	add rbx, 0x00000037; lo conv en letra
;________________________________________
saledec:
	
	;shl rbx, 8
	or [regout], rbx
	;ret
	 mov eax, 1
 	xor ebx, ebx
 	int 0x80
 	ret; se debe agregaral final

;devuelve texout 64bits en ascii

