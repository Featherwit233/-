datasg segment
    org 10h
    db 12
    db 10 dup(0)
datasg ends

codesg segment
    assume cs:codesg,ds:datasg
start:
     mov ax,datasg
     mov ds,ax    ;ds指向datasg
	 mov si,12H
     mov al,ds:[10h] ;取其中一个数
	 mov bl,0     
	 mov cx,10    ;累计加10次
next:
	 add bl,al
	 loop next
	 mov [si],bl
exit:
    mov ax,4c00h
    int 21h
codesg ends
end start