.model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.data
msg1 db 0dh,0ah, "Enter string 1 $"
msg2 db  0dh,0ah,"Enter string 2 $"
msg3 db  0dh,0ah,"Same string$"
msg4 db  0dh,0ah,"Not same$"
str1 db 10h dup(0)
str2 db 10h dup(0)
len1 db 0
len2 db 0
.code
mov ax,@data
mov ds,ax
mov es,ax
display msg1
mov si,00h
back1: mov ah,01h  ;int to accept character
       int 21h
       cmp al,0dh           ;ASCII for Enter key
       JZ next1
       mov str1[si],al
       inc si
       inc len1
       jmp back1
next1: mov si,00h
       display msg2
back2: mov ah,01h          ;int to accept character
       int 21h
       cmp al,0dh
       JZ next2
       mov str2[si],al
       inc si
       inc len2
       jmp back2
 next2:lea si,str1
       lea di,str2
       mov al,len1
       cmp al,len2
       jnz last
       mov cl,len1
       cld                  ;clear direction flag 
 repe cmpsb
 jnz last
 display msg3
 jmp final
 last:display msg4
 final:mov ah,4ch
 int 21h
 end
