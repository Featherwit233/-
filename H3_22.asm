assume cs:codesg,ds:data
data segment
   data1 db 1,3,5,7
         dw 0
   data2 db 1,10,100,20    
data ends

codesg segment
start:
     mov ax,data
	 mov ds,ax
	 lea si,data1
	 lea di,data2
	 mov dx,0
	 mov cx,4
next:
	 mov al,[si]
	 mov bl,[di]
	 call MyMul  ;调用函数
	 add dx,ax  
	 inc si
	 inc di
	 loop next
	 mov word ptr data1+4,dx
exit:
     mov ah,4ch	
	 int 21h
;*********乘法函数********	 
myMul proc
    mul bl
     ret
myMul endp	
  
codesg ends 
end start