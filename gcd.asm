.model small
.data
a dw 2
b dw 4
res db ?
.code
mov ax,@data
mov ds,ax
xor ax,ax
mov bl,1
mov cx,a
back:mov ax,a
     div bl
     cmp ah,00h
     je next
     inc bl
     loop back
next:mov ax,b
     div bl
     cmp ah,00h
     je next1
     inc bl
     loop back
next1:mov res,bl
      inc bl
      loop back
call display
mov ah,4ch
int 21h
display proc near
xor ax,ax
mov al,res
aam
add ax,3030h
mov bl,al
mov dl,ah
mov ah,02h
int 21h
mov dl,bl
mov ah,02h
int 21h
ret
display endp
end