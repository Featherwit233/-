assume cs:codesg,ds:block
block segment
     dw 4 dup(-1,9,15,24,-1000,1025,2009,8)
block ends

codesg segment
start:
     mov ax,block
	 mov ds,ax
	 mov cx,32  ;计数有32个双字节数
	 mov si,0   ;定位block中的数
next:
     mov ax,[si] ;取数
	 mov bx,ax   ;数备份到bx中
	 cmp ax,0    ;与0做比较
	 jns  IsNotNegNum;非负跳转
	 neg bx       ;是负数就求补，然后保存
	 mov [si],bx
IsNotNegNum:
     add si,2
	 loop next
	 
exit:
     mov ax,4c00h
	 int 21h
codesg ends
end start