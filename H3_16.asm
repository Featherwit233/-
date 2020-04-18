assume cs:codesg,ds:datasg
datasg segment
     org 2170H
	 data1 db 100H/8 dup(11H,22H,33H,44H,55H,66H,77H,88H)
	 org 1000H
	 data2 db 100H  dup(?)
datasg ends

codesg segment
start:
     mov ax,datasg
	 mov ds,ax  ;都是同一个段
	 mov es,ax
	 lea si,data1 ;设定源串地址
	 lea di,data2 ;设定目的串首地址
	 mov cx,100H  ;设定长度
	 cld          ;设定操作方向位增加
	 rep movsb    ;开始传送，每次cx-1，结束重复条件为cx==0

;*********开始与AL比较**********	 
	 mov cx,100H  ;比较100H个单元
	 mov al,33H    ;假定al为33h
	 lea di,data2  ;设定初始地址
Again:
	 cmp al,es:[di]
	 jnz  NotEqual    ;不相等
     mov byte ptr es:[di],' ';相等赋值空格
NotEqual:
     inc di
	 loop Again
;***********比较结束*****************

Exit:
     mov ax,4c00h
	 int 21h
codesg ends
end start
