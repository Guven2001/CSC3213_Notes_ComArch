; Write an Assembly program to compare two numbers. 
; Display the greater number. 

.model small
.stack 100h

.data
    num1 db 5     ; First number
    num2 db 3     ; Second number
    msg1 db 'Greater number is: $'

.code
main:
    mov ax, @data
    mov ds, ax

    ; Load numbers into registers
    mov al, num1
    mov bl, num2

    ; Compare numbers
    cmp al, bl
    jge FG   ; If AL >= BL, jump to FG

SG:
    ; Display message
    mov dx, offset msg1
    mov ah, 09h
    int 21h

    ; Display number
    mov dl, num2
    add dl, 48
    mov ah, 02h
    int 21h

    jmp Exit

FG:
    ; Display message
    mov dx, offset msg1
    mov ah, 09h
    int 21h

    ; Display number
    mov dl, num1
    add dl, 48
    mov ah, 02h
    int 21h

Exit:
    ; Exit program
    mov ax, 4C00h
    int 21h

end main
