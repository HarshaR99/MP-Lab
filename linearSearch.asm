.model small
.data
a db 1,2,3,4,5
n db 5
key db 3
pos dw ?
.code
mov ax,@data
mov ds,ax
mov cl,n
mov si,00h
mov al,key
back : cmp al,a[si]
       jz next
       inc si
       loop back
next :inc si
      mov ax,si
       
mov ah,4ch
int 21h
end


