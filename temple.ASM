.model small
display macro str1
lea dx,str1
mov ah,09h
int 21h
endm
.data
str db "TEMPLE$"
len equ $-str
.code
mov ax,@data
mov ds,ax
mov es,ax
lea di,str
mov cl,len
cld
mov al,'E'
back:scasb
    jne next
    mov byte ptr es:[di-1],'A'
next:loop back
display str
mov ah,4ch
int 21h
end
