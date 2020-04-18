assume cs:codesg,ds:datasg
datasg segment
     org 3030h
	num dw 1234H,-1234H
	 dw  0,0 
datasg ends

codesg segment
start:
     mov ax,datasg
	 mov ds,ax     ;ds指向数据段
	 lea si,num
	 mov ax,[si]   ;ax保存被乘数
	 mov bx,[si+2] ;bx保存乘数
	 imul bx       ;有符号数相乘
	 mov [si+4],ax ;保存乘积低16位
	 mov [si+6],dx	 ;保存乘积高16位
exit:
     mov ax,4c00h
	 int 21h
codesg ends
end start
