
INCLUDE Irvine32.inc

.data

DOWNARROW BYTE 50h
LEFTARROW BYTE 4Bh
RIGHTARROW BYTE 4Dh
UPARROW BYTE 48h

r1 BYTE "--",0
r2 BYTE "||",0
r3 BYTE "||",0
r4 BYTE "|     |   ",0
r5 BYTE "|     |   ",0
r6 BYTE "|     |   ",0
r7 BYTE "|     |   ",0
r8 BYTE " ---------",0

RboardArray db  '---------',
				'|       |',
				'|       |',
				'|     |   ',
				'|     |   ',
				'|     |   ',

row1 db "---------",0
row2 db "|       |",0
row3 db "|       |",0

;row1  db "# # # # # # # # # # # # # # # # # # # # # # # # # # # #",0
;row2  db "# . . . . . . . . . . . . # # . . . . . . . . . . . . #",0  
;row3  db "# . # # # # . # # # # # . # # . # # # # # . # # # # . #",0  
row4  db "# o # # # # . # # # # # . # # . # # # # # . # # # # o #",0  
row5  db "# . # # # # . # # # # # . # # . # # # # # . # # # # . #   |    -              |",0  ;64 for current score
row6  db "# . . . . . . . . . . . . . . . . . . . . . . . . . . #   |___________________|",0  
row7  db "# . # # # # . # # . # # # # # # # # . # # . # # # # . #   |                   |",0  
row8  db "# . # # # # . # # . # # # # # # # # . # # . # # # # . #   |  <Level Scores>   |",0  
row9  db "# . . . . . . # # . . . . # # . . . . # # . . . . . . #   |                   |",0  
row10 db "# # # # # # . # # # # #   # #   # # # # # . # # # # # #   |   1:              |",0  ;64 for past scores
row11 db "# # # # # # . # # # # #   # #   # # # # # . # # # # # #   |   2:              |",0  
row12 db "# # # # # # . # #                     # # . # # # # # #   |   3:              |",0  
row13 db "# # # # # # . # #   # # # - - # # #   # # . # # # # # #   |   4:              |",0  
row14 db "# # # # # # . # #   #             #   # # . # # # # # #   |   5:              |",0  
row15 db "            .       #             #       .               |   6:              |",0  
row16 db "# # # # # # . # #   #             #   # # . # # # # # #   |   7:              |",0  
row17 db "# # # # # # . # #   # # # # # # # #   # # . # # # # # #   |   8:              |",0  
row18 db "# # # # # # . # #                     # # . # # # # # #   |   9:              |",0  
row19 db "# # # # # # . # #   # # # # # # # #   # # . # # # # # #   |  10:              |",0 
row20 db "# # # # # # . # #   # # # # # # # #   # # . # # # # # #   |  11:              |",0  
row21 db "# . . . . . . . . . . . . # # . . . . . . . . . . . . #   |  12:              |",0  
row22 db "# . # # # # . # # # # # . # # . # # # # # . # # # # . #   |  13:              |",0  
row23 db "# . # # # # . # # # # # . # # . # # # # # . # # # # . #   |  14:              |",0  
row24 db "# o . . # # . . . . . . .     . . . . . . . # # . . o #   |  15:              |",0  
row25 db "# # # . # # . # # . # # # # # # # # . # # . # # . # # #   |___________________|",0  
row26 db "# # # . # # . # # . # # # # # # # # . # # . # # . # # #   |      <Lives>      |",0  
row27 db "# . . . . . . # # . . . . . . . . . . # # . . . . . . #   |       < < <       |",0 
row28 db "# . # # # # # # # # # # . # # . # # # # # # # # # # . #   |___________________|",0 
row29 db "# . # # # # # # # # # # . # # . # # # # # # # # # # . #   |   <High Score>    |",0  ;64 for High score
row30 db "# . . . . . . . . . . . . . . . . . . . . . . . . . . #   |    -              |",0 
row31 db "# # # # # # # # # # # # # # # # # # # # # # # # # # # #   |___________________|",0 

				

wall BYTE "|",0
lastposx db 1
lastposy db 0

outofboundsy db 5 dup(?) 
outofboundsx db 5 dup(?) 



strScore BYTE "Your score is: ",0
score BYTE 0

xPos BYTE 20
yPos BYTE 20

   MIN_X equ 1
    MIN_Y equ 1
    MAX_X equ 80 ; Assuming a console width of 80 characters
    MAX_Y equ 25

xCoinPos BYTE ?
yCoinPos BYTE ?

inputChar BYTE ?

.code
PrintBoard PROC
	mov eax, 15
	CALL SetTextColor
	mov ecx, 31
	mov edx, OFFSET row1 - 10

	BoardLoop:
		ADD edx, 10
		CALL writestring
 		CALL CRLF

		Loop BoardLoop

	RET 
PrintBoard ENDP
;DrawBoundry PROC
;mov dl, al
;mov dh, ah
;call Gotoxy
;mov edx, OFFSET vertical
;call WriteString
;ret
;DrawBoundry ENDP


OutOfBound PROC
xor esi, esi
mov ecx, Lengthof outofboundsy
mov bh, ypos
dec bh
OutLoop1:
mov dl, outofboundsy[esi]
mov ah, outofboundsx[esi]
cmp bh, ah
je BoundryHitYInitial
inc esi
Loop OutLoop1
jmp ReturnFromOutOfBound
BoundryHitYInitial:
mov ah, outofboundsy[esi]
mov dl, xpos
cmp xpos, ah
je BoundryHitYFinal
jmp ReturnFromOutOfBound
BoundryHitYFinal:
inc bl
jmp ReturnFromOutOfBound
ReturnFromOutOfBound:
ret
OutOfBound endp
main PROC
	call PrintBoard
    ; Set text color
    mov eax, Black + (White * 16)
    call SetTextColor

    ; Clear the screen
    call clrscr

    ; Draw ground at (0,29)
    mov dl, 0
    mov dh, 0
    call Gotoxy
   ; mov edx, OFFSET ground
    call WriteString
    mov al, 0
    mov ecx, 29
;LOOP1:
 ;   inc ah
  ;  mov bl, vertical
   ; call DrawBoundry
;loop LOOP1

	mov ecx, 5
	xor esi, esi
	xor edi, edi
Loop2:
	mov eax, 80
	call RandomRange
	mov dl, al
	mov outofboundsy[esi], dl
	mov eax, 25
	call RandomRange
	mov dh, BYTE PTR al
	mov outofboundsx[esi], dh

    call Gotoxy
    mov edx, OFFSET wall
    call WriteString
	inc esi
	inc edi
loop Loop2

    
	call DrawPlayer

	call CreateRandomCoin
	call DrawCoin

	call Randomize

	gameLoop:
	mov eax, 500
	call delay
			
	
	mov dl, xPos
	mov dh, yPos
	CALL GoToXY
	mov eax, 0
	push edx
	CALL ReadKey	;This is what causes continuous movement
	pop edx

	CMP ah, UPARROW
	je DeltaUp
	CMP ah, DOWNARROW
	je DeltaDown
	CMP ah, LEFTARROW
	je DeltaLeft
	CMP ah, RIGHTARROW
	je DeltaRight
	jmp DeltaLast

	DeltaUp:
		
		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
				CALL UpdatePlayer

		dec yPos
		mov dh, yPos
		CALL GoToXY
		mov lastposy, -1
		mov lastposx, 0


		call DrawPlayer
	call gameloop

	
	DeltaDown:
		
		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
				CALL UpdatePlayer

		inc yPos
		mov dh, yPos
		CALL GoToXY
		mov lastposy, 1
		mov lastposx, 0


		call DrawPlayer
	call gameloop
				

	

	DeltaLeft:

		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
				CALL UpdatePlayer

		SUB xPos, 2
		mov dl, xPos
		CALL GoToXY
		mov lastposy, -1
		mov lastposx, 0
		call DrawPlayer

	call gameloop
	
	
	DeltaRight:
		
		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
				CALL UpdatePlayer

		ADD xPos,2
		mov dl, xPos
		CALL GoToXY
		mov lastposy, 0
		mov lastposx, 1
		call DrawPlayer
	call gameloop
		
	
	DeltaLast:
	
		mov dl, xPos
		mov dh, yPos
		CALL GoToXY

				CALL UpdatePlayer

		mov dl, lastposy
		mov dh, lastposx
		add xPos, dh
		add yPos, dl
		mov dl, xPos
		mov dh, yPos
		CALL GoToXY
		call DrawPlayer
				


	

	call gameloop

	exitGame:
	exit
main ENDP

DrawPlayer PROC
	; draw player at (xPos,yPos):
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	mov al,"O"
	call WriteChar
	ret
DrawPlayer ENDP

UpdatePlayer PROC
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	 mov eax, Black + (White * 16)
    call SetTextColor
	mov al," "
	call WriteChar
	ret
UpdatePlayer ENDP

DrawCoin PROC
	mov eax,yellow+(red * 16)
	call SetTextColor
	mov dl,xCoinPos
	mov dh,yCoinPos
	call Gotoxy
	mov al,"X"
	call WriteChar
	ret
DrawCoin ENDP

CreateRandomCoin PROC
	mov eax,55
	inc eax
	call RandomRange
	mov xCoinPos,al
	mov yCoinPos,27
	ret
CreateRandomCoin ENDP
	
END main

