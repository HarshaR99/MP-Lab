.model small
.data
msg1 db 0Dh,0Ah, "enter alphanumeric character$"
res db 02 dup(0)
.code
mov ax,@data
mov ds,ax
lea dx,msg1
call disp
mov ah,01h
int 21h
mov bl,al
mov cl,4
shr al,cl
cmp al,0Ah
jc digit
add al,07
digit: add al,30h
       mov res,al
       and bl,0Fh
       cmp bl,0Ah
       jc digit1
       add al,07
digit1: add bl,30h
        mov res+1,bl
        mov ah,00h
        mov al,03h
        int 10h
        mov ah,02h
        mov bh,00h
        mov dh,0Ch
        mov dl,28h
        int 10h
        mov res+2,'$'
        lea dx,res
        call disp
        mov ah,4ch
        int 21h
disp proc near
mov ah,09h
int 21h
ret
disp endp
end