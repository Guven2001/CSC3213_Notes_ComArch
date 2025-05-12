.model small
.stack 100h
.data
  msg db 'Enter a number:',10,'$'
  msg1 db 'even',10,'$'
  msg2 db 'odd',10,'$'
  
.code 
start:
 mov ax,@data
 mov ds,ax
 
 mov dx,offset msg
 mov ah,09h
 int 21h
 
 mov ah,01h
 int 21h
 
 mov ah,00
 mov bl,2
 div bl
 
 cmp ah,1   ;cmp-compare
 je odd     ;jump equal
 jne evennum  ;jump not equal
 
 odd:
  mov dl,10
  mov ah,02h
  int 21h
  
  mov dx,offset msg2
  mov ah,09h
  int 21h
  jmp Enddn  ; then jump to exit the code
  
 evennum:
  mov dl,10
  mov ah,02h
  int 21h
  
  mov dx,offset msg1
  mov ah,09h
  int 21h
  
 Enddn:
  mov ax,4c00h
  int 21h
  
 end start