
INCLUDE Irvine32.inc

.data

DOWNARROW BYTE 50h
LEFTARROW BYTE 4Bh
RIGHTARROW BYTE 4Dh
UPARROW BYTE 48h

boolWallCollison db 0

;		  1	2 3 4 5 6 7 8 9 101112131415161718
row1  db "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #", 0
row2  db "#                                                                                   #", 0
row3  db "#       # # # # # # # # # # # # #                 # # # # # # # # # # # # #         #", 0
row4  db "#       # . . . . . # . . . . . #                 # . . . . . . . . . . . #         #", 0
row5  db "#       # . . . . . # . . . . . #                 # . . . . . . . . . . . #         #", 0
row6  db "#       # . . . . . # . . . . . #                 # . . # # # # # # # . . #         #", 0
row7  db "#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #", 0
row8  db "#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #", 0
row9  db "#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #", 0
row10 db "#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #", 0
row11 db "#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #", 0
row12 db "#                                                                                   #", 0
row13 db "#                                                                                   #", 0
row14 db "#                            # .   . #  . .  # .   . #                              #", 0
row15 db "#                            # .   . #  . .  # .   . #                              #", 0
row16 db "#                            # .   . #  . .  # .   . #                              #", 0
row17 db "#                            # .   . #  . .  # .   . #                              #", 0
row18 db "#                            # .   . #  . .  # .   . #                              #", 0
row19 db "#                            # .   . #  . .  # .   . #                              #", 0
row20 db "#                            # .   . #  . .  # .   . #                              #", 0
row21 db "#                            # .   . #  . .  # .   . #                              #", 0
row22 db "#                            # .   . #  . .  # .   . #                              #", 0
row23 db "#                            # # # # # # # # # # # # #                              #", 0
row24 db "#                                                                                   #", 0
row25 db "# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #", 0
dot db ".", 0

foodx1 db 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
foodx2 db 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6
foodx3 db 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9
foodx4 db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 13, 13, 13, 13
foodx5 db 13, 13, 14, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 19, 19, 19 
foodx6 db 19, 19, 19, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 21

foody1 db 10, 12, 14, 16, 18, 22, 24, 26, 28, 30, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70
foody2 db 72, 10, 12, 14, 16, 18, 22, 24, 26, 28, 30, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 10, 12, 14, 16, 18, 22, 24, 26, 28, 30, 52, 54, 70
foody3 db 72, 10, 12, 14, 16, 18, 22, 24, 26, 28, 30, 52, 54, 61, 63, 70, 72, 10, 12, 14, 16, 18, 22, 24, 26, 28, 30, 52, 54, 61, 63, 70, 72, 10, 12
foody4 db 14, 16, 18, 22, 24, 26, 28, 30, 52, 54, 61, 63, 70, 72, 10, 12, 14, 16, 18, 22, 24, 26, 28, 30, 52, 54, 61, 63, 70, 72, 10, 12, 14, 16, 18 
foody5 db 22, 24, 26, 28, 30, 52, 54, 61, 63, 70, 72, 31, 35, 40, 42, 47, 51, 31, 35, 40, 42, 47, 51, 31, 35, 40, 42, 47, 51, 31, 35, 40, 42, 47, 51
foody6 db 31, 35, 40, 42, 47, 51, 31, 35, 40, 42, 47, 51, 31, 35, 40, 42, 47, 51, 31, 35, 40, 42, 47, 51, 31, 35, 40, 42, 47, 51

foodcountlv1 db 190
wall BYTE "|",0
lastposx db 1
lastposy db 0
boolLastMove db 4

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

PrintBoard PROC
	mov eax, 15
	CALL SetTextColor
	mov ecx, 25
	mov edx, OFFSET row1 - 86

	BoardLoop:
		ADD edx, 86
		CALL writestring
		CALL CRLF

		Loop BoardLoop

		
	
		

	RET 

PrintBoard ENDP
PrintDots PROC
xor esi, esi
mov cl,foodcountlv1
push Offset foodx1 - 1
push Offset foody1 - 1
mov eax, yellow+ (black* 16)
    call SetTextColor
DotsLoop:
pop eax
add eax, 1
mov dl, [eax]
mov ebx, eax
pop eax
add eax, 1
mov dh, [eax]
call gotoxy
mov edx, Offset dot
CALL writestring
push eax
push ebx
cmp ecx, 0
je yes
Loop DotsLoop

yes:
pop eax
pop eax
ret 
Loop DotsLoop
ret - 8
PrintDots endp

main PROC
	call PrintBoard
	call PrintDots

    
	call DrawPlayer


	gameLoop:
	mov eax, 100
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
		mov boolLastMove, 1
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
		mov boolLastMove, 3
		
		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
		CALL UpdatePlayer
		cmp ypos, 23
		jge temp
		inc yPos
		temp:
		mov dh, yPos
		CALL GoToXY
		mov lastposy, 1
		mov lastposx, 0


		call DrawPlayer
	call gameloop
				

	

	DeltaLeft:
		mov boolLastMove, 2
		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
				CALL UpdatePlayer

		SUB xPos, 2
		mov dl, xPos
		CALL GoToXY
		mov lastposy, 0
		mov lastposx, -1
		call DrawPlayer

	call gameloop
	
	
	DeltaRight:
		mov boolLastMove, 4
		cmp boolWallCollison, 1
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
		cmp boolLastMove, 1
		je LastMoveWasUp
		cmp boolLastMove, 2
		je LastMoveWasLeft
		cmp boolLastMove, 3
		je LastMoveWasDown
		cmp boolLastMove, 4
		je LastMoveWasRight
	LastMoveWasDown:
		cmp ypos, 23
		jge temp1
		jmp elseDelta
	LastMoveWasUp:
		cmp ypos, 1
		jle temp1
		jmp elseDelta

	LastMoveWasRight:
		cmp xpos,  83
		jge temp1
		jmp elseDelta

	LastMoveWasLeft:
		mov ah, xpos
		cmp xpos, 1
		jle temp1
		jmp elseDelta
	elseDelta:

		mov dl, lastposy
		mov dh, lastposx
		add xPos, dh
		add yPos, dl
		temp1:
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
	 mov eax, Green + (Black* 16)
    call SetTextColor

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
	 mov eax, White + (Black* 16)
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

