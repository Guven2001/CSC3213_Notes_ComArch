.model small
.stack 100h
.data

msg db "Enter  the Number: $"
n1 db 3
a db ?

.code
start:

mov ax,@data
mov ds,ax

mov dx,offset msg
mov ah,09h
int 21h

call read
call nextLine
call print

mov ax,4c00h
int 21h

proc nextLine
mov dl,0ah
mov ah,02h
int 21h

ret
endp

proc read
mov ah,01h
int 21h
mov n1,al

ret
endp 

proc print
mov dl,n1
mov ah,02h
int 21h

ret 
endp

end start



