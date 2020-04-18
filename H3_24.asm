assume cs:code,ds:BUFFER
BUFFER segment
   len dw  8 ;假定有14个数据
   num db  "12345678"
BUFFER ends
code segment
start:
     mov ax,BUFFER
	 mov ds,ax
	 lea si,num  ;si定位ASCII数字
	 lea di,num ;di定位转换后BCD数字
	 mov cx,len  ;获得字符长度
	 shr cx,1    ;循环次数位长度的一半（2个字符只要一个字节保存）
next:
	 push cx   
	 mov cl,4    ;左移4位,必须要用cl计数
	 mov al,[si] ;取得ASCII
	 shl al,cl   ;左移4位可得到bcd码（保存到Al高四位中）
	 mov bl,[si+1];得到下一位ASCII 码
	 and bl,0fh   ;与运算，保留低四位保存一个BCD码
	 or al,bl    ;将高低BCD码加到到al中
	 mov [di],al  ;保存
	 add si,2
	 inc di
	 pop cx     ;恢复循环计数
	 loop next
exit:
     mov ax,4c00h
	 int 21h
code ends
end start