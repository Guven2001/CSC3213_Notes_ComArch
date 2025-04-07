;Write an assembly language program to read two one-digit integer
;from the user,and do arithmatic operations as follws in the ;output
;Enter the first number:4
;Enter the second number:2
;The addition is:6
;The subraction is:2
;The multiplication is:8
;The divition quotient is:2
;The divition remainder is:0

.model small
.stack 100h
.data
msg1 db "Enter the first number: $"
msg2 db "Enter the second number: $"
msg3 db "The addition is: $"
msg4 db "The subraction is: $"
msg5 db "The multiplication is: $"
msg6 db "The divition quotient is: $"
msg7 db "The divition remainder is: $"

n1 db 0
n2 db 0
r db ?

.code
start:

mov ax,@data
mov ds,ax

;printing msg1
mov dx,offset msg1
mov ah,09h
int 21h

;read the input n1
mov ah,01h
int 21h

mov dl,al
sub dl,48
mov n1,dl

;next line
mov dl,0ah
mov ah,02h
int 21h

;printing msg2
mov dx,offset msg2
mov ah,09h
int 21h

;read the input n2
mov ah,01h
int 21h

mov dl,al
sub dl,48
mov n2,dl

;next line
mov dl,0ah
mov ah,02h
int 21h

;printing msg3
mov dx,offset msg3
mov ah,09h
int 21h

;addition
mov dl,n1 ;dl=4
add dl,n2 ;dl=4+2=6
add dl,48 ;dl=48+6=54
mov ah,02h
int 21h

;next line
mov dl,0ah
mov ah,02h
int 21h

;printing msg4
mov dx,offset msg4
mov ah,09h
int 21h

;subtraction
mov dl,n1 ;dl=4
sub dl,n2 ;dl=4-2=2
add dl,48 ;dl=48+2=50
mov ah,02h
int 21h

;next line
mov dl,0ah
mov ah,02h
int 21h

;printing msg5
mov dx,offset msg5
mov ah,09h
int 21h

;multiplication
mov al,n1 
mul n2 
mov dl,al
add dl,48
mov ah,02h
int 21h

;next line
mov dl,0ah
mov ah,02h
int 21h

;printing msg6
mov dx,offset msg6
mov ah,09h
int 21h

;division
mov ah,00
mov al,n1
div n2
mov r,ah

mov dl,al
add dl,48
mov ah,02h
int 21h

;next line
mov dl,0ah
mov ah,02h
int 21h

;printing msg7
mov dx,offset msg7
mov ah,09h
int 21h

;remainder
mov dl,r
add dl,48
mov ah,02h
int 21h

mov ax,4c00h
int 21h

end start