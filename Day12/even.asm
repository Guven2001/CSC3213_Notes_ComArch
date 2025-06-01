;print even Numbers from 2 to 9
.model small
.stack 100h
.data

msg db "Even Numbers $"
newLine db 13,10,"$"

.code
start:

mov ax,@data
mov ds,ax

mov cl,8
mov bl,2

lstart:
mov al,bl
mov ah,00
mov dl,2 ; n%2==0
div dl
cmp ah,0
jnz not_even

mov dx,offset msg
mov ah,09h
int 21h

mov al,bl
add al,48
mov dl,al
mov ah,02h
int 21h

mov dx,offset newLine
mov ah,09h
int 21h

not_even:
inc bl
loop lstart

mov ax,4c00h
int 21h

end start
