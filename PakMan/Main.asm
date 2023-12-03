
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


r1  db "#", " ", "#", 0 ; r1
r2  db '#                                                                                   #', 0 ; r2
r3  db '#       # # # # # # # # # # # # #                 # # # # # # # # # # # # #         #', 0 ; r3
r4  db '#       # . . . . . # . . . . . #                 # . . . . . . . . . . . #         #', 0 ; r4
r5  db '#       # . . . . . # . . . . . #                 # . . . . . . . . . . . #         #', 0 ; r5
r6  db '#       # . . . . . # . . . . . #                 # . . # # # # # # # . . #         #', 0 ; r6
r7  db '#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #', 0 ; r7
r8  db '#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #', 0 ; r8
r9  db '#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #', 0 ; r9
r10 db '#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #', 0 ; r10
r11 db '#       # . . . . . # . . . . . #                 # . . #    . .    # . . #         #', 0 ; r11
r12 db '#                                                                                   #', 0 ; r12
r13 db '#                                                                                   #', 0 ; r13
r14 db '#                            # .   . #  . .  # .   . #                              #', 0 ; r14
r15 db '#                            # .   . #  . .  # .   . #                              #', 0 ; r15
r16 db '#                            # .   . #  . .  # .   . #                              #', 0 ; r16
r17 db '#                            # .   . #  . .  # .   . #                              #', 0 ; r17
r18 db '#                            # .   . #  . .  # .   . #                              #', 0 ; r18
r19 db '#                            # .   . #  . .  # .   . #                              #', 0 ; r19
r20 db '#                            # .   . #  . .  # .   . #                              #', 0 ; r20
r21 db '#                            # .   . #  . .  # .   . #                              #', 0 ; r21
r22 db '#                            # .   . #  . .  # .   . #                              #', 0 ; r22
r23 db '#                            # # # # # # # # # # # # #                              #', 0 ; r23
r24 db '#                                                                                   #', 0 ; r24
r25 db '# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #', 0 ; r25


dot db ".", 0

foodx1 db 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
foodx2 db 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 
foodx3 db 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10
foodx4 db 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 14, 14, 14, 14
foodx5 db 14, 14, 15, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 19, 20, 20, 20
foodx6 db 20, 20, 20, 21, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22

foody1 db 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71
foody2 db 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 71
foody3 db 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11, 13
foody4 db 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11, 13, 15, 17, 19
foody5 db 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52
foody6 db 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52


wallx1 db 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4
wallx2 db 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 9
wallx3 db 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 13, 13, 13, 13, 14, 14, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 18, 18
wallx4 db 18, 18, 19, 19, 19, 19, 20, 20, 20, 20, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22

wally1 db 8, 32, 50, 74, 8, 20, 32, 50, 74, 8, 20, 32, 50, 74, 8, 20, 32, 50, 56, 58, 60 
wally2 db 62, 64, 66, 68, 74, 8, 20, 32, 50, 56, 68, 74, 8, 20, 32, 50, 56, 68, 74, 8, 20, 32, 50, 56, 68, 74, 8, 20, 32, 50, 56, 68, 74, 8, 20
wally3 db 32, 50, 56, 68, 74, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37
wally4 db 45, 53, 29, 37, 45, 53, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53

foodcountlv1 db 190
brickcountlv1 db 132
boolAteFood db 0
boolisWall db 0

scorecounter db 0
lastposx db 1
lastposy db 0
boolLastMove db 4

outofboundsy db 5 dup(?) 
outofboundsx db 5 dup(?) 



strScore BYTE "Your score is: ",0
score BYTE 0

xPos BYTE 7
yPos BYTE 2

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
dec dl
mov ebx, eax
pop eax
add eax, 1
mov dh, [eax]
dec dh
call gotoxy
mov edx, Offset dot
CALL writestring
push eax
push ebx
cmp ecx, 0
je ifDots
Loop DotsLoop

ifDots:
pop eax
pop eax
ret 
Loop DotsLoop
pop eax
pop eax
ret 
PrintDots endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
isFood Proc
    xor ecx, ecx
    mov ecx, 0
    mov esi, 0  
	mov eax, Offset foodx1 - 1
	mov edx, Offset foody1 - 1 ; esi for loop counter
	; esi for loop counter

FoodLoop:
    cmp cl, foodcountlv1
    je  endFood      ; Exit loop if all food items checked
	add eax, 1
	add edx, 1
    mov bh, xpos
	mov bl, [eax]
	dec bl
    cmp bh, bl
    je  ifFood
continueFood:

    inc ecx
    jmp FoodLoop

ifFood:
    mov bh, ypos
    mov bl, [edx]
	dec bl

    cmp bl, bh

    je  elseifFood
    jmp continueFood

elseifFood:
    inc scorecounter
    jmp endFood

endFood:
    ret
isFood endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
isWall PROC
	xor ecx, ecx
    mov ecx, 0
    mov esi, 0  
	mov eax, Offset wallx1 - 1
	mov edx, Offset wally1 - 1 

WallLoop:
    cmp cl, brickcountlv1
    je  endWall   
	add eax, 1
	add edx, 1
    mov bh, ypos
	mov bl, [eax]
    cmp bh, bl
    je  ifWall
continueWall:

    inc ecx
    jmp WallLoop

ifWall:
    mov bh, xpos
    mov bl, [edx]
	

    cmp bl, bh

    je  elseifWall
    jmp continueWall

elseifWall:
    mov boolisWall, 1
    jmp endWall

endWall:
    ret
isWall endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
		call isFood
		mov boolLastMove, 1
		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
		CALL UpdatePlayer

		dec dh
		dec yPos
		mov boolisWall, 0
		call isWall
		cmp boolisWall, 1
		je DeltaUpBack

		DeltaUpContinue:
		
		CALL GoToXY
		mov lastposy, -1
		mov lastposx, 0
		

		call DrawPlayer
		call gameloop
	DeltaUpBack:
		inc dh
		inc yPos
		jmp DeltaUpContinue
	
	DeltaDown:
		call isFood

		mov boolLastMove, 3
		
		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
		CALL UpdatePlayer
		
		inc yPos
		inc dh
		mov boolisWall, 0
		
		call isWall
		cmp boolisWall, 1
		je DeltaDownBack
		DeltaDownContinue:

		CALL GoToXY
		mov lastposy, 1
		mov lastposx, 0
		call DrawPlayer
		call gameloop
				
		DeltaDownBack:
		dec dh
		dec Ypos
		jmp DeltaDownContinue
	

	DeltaLeft:
		call isFood

		mov boolLastMove, 2
		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
		CALL UpdatePlayer

		dec dl
		SUB xPos, 1

		mov boolisWall, 0
		call isWall
		cmp boolisWall, 1
		je DeltaLeftBack
		DeltaLeftContinue:

		mov dl, xPos
		CALL GoToXY
		mov lastposy, 0
		mov lastposx, -1
		call DrawPlayer
		call gameloop
	
	DeltaLeftBack:
		inc xPos
		inc dl

		jmp DeltaLeftContinue

	DeltaRight:
		call isFood
		mov boolLastMove, 4
		cmp boolWallCollison, 1
		mov dh, yPos
		mov dl, xPos
		CALL GoToXY
		CALL UpdatePlayer

		inc dl
		ADD xPos, 1

		mov boolisWall, 0
		call isWall
		cmp boolisWall, 1
		je DeltaRightBack
		DeltaRightContinue:

		mov dl, xPos
		CALL GoToXY
		mov lastposy, 0
		mov lastposx, 1
		call DrawPlayer
		call gameloop
	DeltaRightBack:
		dec xPos
		dec dl

		jmp DeltaRightContinue	
	
	DeltaLast:
		call isFood

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
		jge continueElseDelta
		jmp elseDelta
	LastMoveWasUp:
		cmp ypos, 1
		jle continueElseDelta
		jmp elseDelta

	LastMoveWasRight:
		cmp xpos,  83
		jge continueElseDelta
		jmp elseDelta

	LastMoveWasLeft:
		mov ah, xpos
		cmp xpos, 1
		jle continueElseDelta
		jmp elseDelta
	elseDelta:

		mov dl, lastposy
		mov dh, lastposx
		add xPos, dh
		add yPos, dl
		
		
		mov boolisWall, 0
		call isWall
		cmp boolisWall, 1
		je DeltaElseBack

		
		continueElseDelta:
		mov dl, xPos
		mov dh, yPos
		CALL GoToXY
		call DrawPlayer		
		call gameloop


	DeltaElseBack:

	mov dl, lastposy
		mov dh, lastposx
		sub xPos, dh
		sub yPos, dl
		jmp continueElseDelta

	

main ENDP

DrawPlayer PROC
	; draw player at (xPos,yPos):
	 mov eax, Green + (Black* 16)
    call SetTextColor

	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	mov al,"&"
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


	
END main

