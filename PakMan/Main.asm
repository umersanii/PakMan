﻿INCLUDE Irvine32.inc

.data

DOWNARROW BYTE 50h
LEFTARROW BYTE 4Bh
RIGHTARROW BYTE 4Dh
UPARROW BYTE 48h

boolWallCollison db 0

strtitle0 db "                                      the west has robinhood; we have           ",0
strtitle1 db "                                      ______  ___   _   _____  ___  ___   _   _ ",0
strtitle2 db "                                      | ___ \/ _ \ | | / /|  \/  | / _ \ | \ | |",0
strtitle3 db "                                      | |_/ / /_\ \| |/ / | .  . |/ /_\ \|  \| |",0
strtitle4 db "                                      |  __/|  _  ||    \ | |\/| ||  _  || . ` |",0
strtitle5 db "                                      | |   | | | || |\  \| |  | || | | || |\  |",0
strtitle6 db "                                      \_|   \_| |_/\_| \_/\_|  |_/\_| |_/\_| \_/",0
          
;strt0 db "                      the west has robinhood; we have                           ",0
;strt1	  db "                      ██▓███   ▄▄▄       ██ ▄█▀ ███▄ ▄███▓ ▄▄▄       ███▄    █  ", 0 
;strt2	  db "                     ▓██░  ██▒▒████▄     ██▄█▒ ▓██▒▀█▀ ██▒▒████▄     ██ ▀█   █  ", 0
;strt3	  db "                     ▓██░ ██▓▒▒██  ▀█▄  ▓███▄░ ▓██    ▓██░▒██  ▀█▄  ▓██  ▀█ ██▒ ", 0
;strt4	  db "                     ▒██▄█▓▒ ▒░██▄▄▄▄██ ▓██ █▄ ▒██    ▒██ ░██▄▄▄▄██ ▓██▒  ▐▌██▒ ", 0
;strt5	  db "                     ▒██▒ ░  ░ ▓█   ▓██▒▒██▒ █▄▒██▒   ░██▒ ▓█   ▓██▒▒██░   ▓██░ ", 0
;strt6	  db "                     ▒▓▒░ ░  ░ ▒▒   ▓▒█░▒ ▒▒ ▓▒░ ▒░   ░  ░ ▒▒   ▓▒█░░ ▒░   ▒ ▒  ", 0
;strt7	  db "                     ░▒ ░       ▒   ▒▒ ░░ ░▒ ▒░░  ░      ░  ▒   ▒▒ ░░ ░░   ░ ▒░ ", 0
;strt8	  db "                     ░░         ░   ▒   ░ ░░ ░ ░      ░     ░   ▒      ░   ░ ░  ", 0
;strt9	  db "                                    ░  ░░  ░          ░         ░  ░         ░  ", 0
                                                          


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

StringLvl db "Level 01 : In the beninging                                                          ", 0
xUI db "|                      |", 0
yUI db " ----------------------", 0
xyUI db "|----------------------|", 0

dot db ".", 0
Spaces db "                                                                                                                         ",0
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

tfoodx1 db 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
tfoodx2 db 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 
tfoodx3 db 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10
tfoodx4 db 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 14, 14, 14, 14
tfoodx5 db 14, 14, 15, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 19, 20, 20, 20
tfoodx6 db 20, 20, 20, 21, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22

tfoody1 db 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71
tfoody2 db 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 71
tfoody3 db 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11, 13
tfoody4 db 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 11, 13, 15, 17, 19
tfoody5 db 23, 25, 27, 29, 31, 53, 55, 62, 64, 71, 73, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52
tfoody6 db 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52, 32, 36, 41, 43, 48, 52

wallx1 db 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
wallx2 db 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
wallx3 db 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9 
wallx4 db 9, 10, 10, 10, 10, 10, 10, 10, 13, 13, 13, 13, 14, 14, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 18, 18, 18, 18, 19, 19, 19
wallx5 db 19, 20, 20, 20, 20, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22


wally1 db 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59
wally2 db 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 8, 20, 32, 50, 74, 8, 20, 32, 50, 74, 8, 20, 32, 50, 56, 57, 58, 59, 60, 61
wally3 db 62, 63, 64, 65, 66, 67, 68, 74, 8, 20, 32, 50, 56, 68, 74, 8, 20, 32, 50, 56, 68, 74, 8, 20, 32, 50, 56, 68, 74, 8, 20, 32, 50, 56, 68
wally4 db 74, 8, 20, 32, 50, 56, 68, 74, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 37, 45
wally5 db 53, 29, 37, 45, 53, 29, 37, 45, 53, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53

foodcountlv1 db 190
brickcountlv1 db 174
boolAteFood db 0
boolisWall db 0
lifecount db 3

scorecounter db 0
lastposx db 1
lastposy db 0
boolLastMove db 4

outofboundsy db 5 dup(?) 
outofboundsx db 5 dup(?) 



strxUI BYTE "Previous Pak-Men",0
stryUI db "& ",0
score BYTE 0

xPos BYTE 10
yPos BYTE 4

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
	mov eax, blue+ (black* 16)
    call SetTextColor
	mov ecx, 25
	mov edx, OFFSET row1 - 86

	BoardLoop:
		ADD edx, 86
		CALL writestring
		CALL CRLF

		Loop BoardLoop

		
	
		

	RET 

PrintBoard ENDP

PrintxUI PROC
	mov eax, white+ (black* 16)
    call SetTextColor

	mov dh, 1
	mov dl, 88
	call gotoxy
	mov edx, OFFSET yUI
	call writestring

	mov ecx, 3
	mov dh, 2
	xor ebx, ebx

	mov bl, 88
	mov dl, 88
	mov bh, 2
	xUILoop1:
		mov dh, bh
		mov dl, bl
		call gotoxy
		mov edx, OFFSET xUI
		call writestring
		inc bh
		Loop xUILoop1

	mov dh, 5
	mov dl, 88
	call gotoxy
	mov edx, OFFSET xyUI
	call writestring

	mov ecx, 8
	mov dh, 5
	xor ebx, ebx

	mov bl, 88
	mov dl, 88
	mov bh, 6
	xUILoop2:
		mov dh, bh
		mov dl, bl
		call gotoxy
		mov edx, OFFSET xUI
		call writestring
		inc bh

		mov dh, bh
		mov dl, bl
		call gotoxy
		mov edx, OFFSET xyUI
		call writestring
		inc bh

		loop xUILoop2

	mov dh, 22
	mov dl, 88
	call gotoxy
	mov edx, OFFSET xUI
	call writestring
	inc bh
	mov dh, 23
	mov dl, 88
	call gotoxy
	mov edx, OFFSET yUI
	call writestring


	mov eax, yellow + (black* 16)
    call SetTextColor
	mov dh, 3
	mov dl, 92
	call gotoxy
	mov edx, OFFSET strxUI
	call writestring

	mov eax, yellow+ (black* 16)
    call SetTextColor
	mov dl, 28
	mov dh, 25
	call gotoxy
	mov edx, Offset Stringlvl
	call writestring

	mov eax, red+ (black* 16)
    call SetTextColor
	mov dl, 80
	mov dh, 21
	mov ecx, 3
	HeartLoop:
	
	
	
	add dh, 4
	call gotoxy
	mov edx, Offset stryUI
	call writestring
	loop HeartLoop

	RET 

PrintxUI ENDP
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

PrintDots endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
isFood Proc
    xor ecx, ecx
    mov ecx, 0
    mov esi, 0  
	mov eax, Offset tfoodx1 - 1
	mov edx, Offset tfoody1 - 1 ; esi for loop counter
	; esi for loop counter

FoodLoop:
    cmp cl, foodcountlv1
    je  endFood      ; Exit loop if all food items checked
	add eax, 1
	add edx, 1
    mov bh, ypos
	mov bl, [eax]
    cmp bh, bl
    je  ifFood
continueFood:

    inc ecx
    jmp FoodLoop

ifFood:
    mov bh, xpos
    mov bl, [edx]
	dec bl
    cmp bl, bh

    je  elseifFood
    jmp continueFood

elseifFood:
    inc scorecounter
	mov bl, -1
	mov [edx], bl
	mov [eax], bl
    jmp endFood

endFood:
    ret
isFood endp

titleScreen PROC
mov ecx, 10
mov edx, Offset spaces

TitletempLoop:
call writestring
loop TitletempLoop
mov eax, green+ (black* 16)
    call SetTextColor
call crlf
mov edx, Offset strt0 - 81
mov ecx, 7
TitleLoop:
add edx, 81
CALL writestring
call crlf

loop TitleLoop
titleScreen endp
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
call titleScreen
call readchar
	call PrintBoard
	call PrintDots

	call PrintxUI
	
    
	call DrawPlayer


	gameLoop:
	mov eax, 100
	call delay
	mov dl, 0
	mov dh, 25
	call gotoxy
	mov al, scorecounter
	call WriteDec
	
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
		cmp ypos, 1
		jle DeltaUpContinue
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
		cmp ypos, 23
		jge DeltaDownContinue
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
		cmp xpos, 1
		jle DeltaLeftContinue
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
		cmp xpos,  83
		jge DeltaRightContinue
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
	 mov eax, white + (Black* 16)
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

