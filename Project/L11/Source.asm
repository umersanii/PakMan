INCLUDE Irvine32.inc

.data
    ground BYTE "------------------------------------------------------------------------------------------------------------------------",0
    strScore BYTE "Your score is: ",0
vertical BYTE "|                                                                                                          |",0

    score BYTE 0

    xPos BYTE 20
    yPos BYTE 20

    MIN_X equ 5
    MIN_Y equ 5
    MAX_X equ 25 ; Assuming a console width of 80 characters
    MAX_Y equ 80

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
v
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

