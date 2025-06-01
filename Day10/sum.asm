;Use a loop to display sum of numbers from 1 to 5 (eg: 1+2+3+4+5=15)
.model small
.stack 100h
.data

s db " $"
msg db "SUM: $"
nl db 5
nf db 1
sum db 0
r db 0

.code
start:

mov ax,@data
mov ds,ax

mov cl,nl ; n=5
;mov bl,nf

lstart: ; cl=5 ; cl=4 ; cl=3 ; cl=2 ; cl=1
mov dl,sum ; dl=sum=0 ; sum=5 ; sum=9 ; sum=12 ; sum=14
add dl,cl ;  dl=dl+cl=0+5=5 ; dl=5+4=9 ; dl=9+3=12 ; dl=12+2=14 ; dl=14+1=15
mov sum,dl ; sum=dl=5 ; sum=dl=9 ; sum=dl=12 ; sum=dl=14 ; sum=dl=15

loop lstart
;sum=15
mov al,sum
mov ah,00
mov bl,10 ; bl=10
div bl
mov r,ah

mov dl,al
add dl,48
mov ah,02h
int 21h

mov dl,r
add dl,48
mov ah,02h
int 21h

mov ax,4c00h
int 21h

end start