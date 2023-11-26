INCLUDE Irvine32.inc

.data
    ground BYTE "------------------------------------------------------------------------------------------------------------------------",0
    strScore BYTE "Your score is: ",0
vertical BYTE "|                                                                                                          |",0

    score BYTE 0

    xPos BYTE 20
    yPos BYTE 20

    MIN_X equ 0
    MIN_Y equ 0
    MAX_X equ 40 ; Assuming a console width of 80 characters
    MAX_Y equ 27

    xCoinPos BYTE ?
    yCoinPos BYTE ?

    inputChar BYTE ?

.code
DrawBoundry PROC
mov dl, al
mov dh, ah
call Gotoxy
mov edx, OFFSET vertical
call WriteString
ret
DrawBoundry ENDP
main PROC
    mov eax,Black +(white*16)
    call SetTextColor
    call clrscr
    mov dl, 0
    mov dh, 0
    call Gotoxy
    mov edx, OFFSET ground
    call WriteString
    mov al, 0
    mov ecx, 29
LOOP1:
    inc ah
    mov bl, vertical
    call DrawBoundry
    loop LOOP1
    mov dl, 0
    mov dh, 29
    call Gotoxy
    mov edx, OFFSET ground
    call WriteString


    call DrawPlayer
    call CreateRandomCoin
    call DrawCoin

    call Randomize

    gameLoop:
        ; getting points:
        mov bl,xPos
        cmp bl,xCoinPos
        jne notCollecting
        mov bl,yPos
        cmp bl,yCoinPos
        jne notCollecting
        ; player is intersecting coin:
        inc score
        call CreateRandomCoin
        call DrawCoin
        notCollecting:

        mov eax,white+(black * 16)
        call SetTextColor

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteInt

        ; gravity logic:
        gravity:
        cmp yPos,MAX_Y
        jg onGround
        ; make player fall:
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        mov eax,80
        call Delay
        jmp gravity
        onGround:

        call ReadChar
        mov inputChar, al

        ; exit game if user types 'x':
        cmp inputChar, "x"
        je exitGame

        ; Handle player movement
        cmp inputChar, "w"
        je moveUp
        cmp inputChar, "s"
        je moveDown
        cmp inputChar, "a"
        je moveLeft
        cmp inputChar, "d"
        je moveRight

        moveUp:
            ; Check boundary before moving up
            cmp yPos, MIN_Y
            jle skipMoveUp
            call UpdatePlayer
            dec yPos
            call DrawPlayer
            skipMoveUp:
            jmp gameLoop

        moveDown:
            ; Check boundary before moving down
            cmp yPos, MAX_Y
            jge skipMoveDown
            call UpdatePlayer
            inc yPos
            call DrawPlayer
            skipMoveDown:
            jmp gameLoop

        moveLeft:
            ; Check boundary before moving left
            cmp xPos, MIN_X
            jle skipMoveLeft
            call UpdatePlayer
            dec xPos
            call DrawPlayer
            skipMoveLeft:
            jmp gameLoop

        moveRight:
            ; Check boundary before moving right
            cmp xPos, MAX_X
            jge skipMoveRight
            call UpdatePlayer
            inc xPos
            call DrawPlayer
            skipMoveRight:
            jmp gameLoop

    jmp gameLoop

    exitGame:
        exit
main ENDP

; ... (the rest of your code remains unchanged)




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

