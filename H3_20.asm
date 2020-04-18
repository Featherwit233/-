assume cs:code,ds:data
data segment
    org 1000H
d_data db Byte ptr 1000/8 dup(1,-1,5,-9,3,4,3,8)
data ends

code segment
start:
     mov ax,data
	 mov ds,ax   ;ds指向data
	 lea bx,d_data
	 mov cx,999
	 mov al,[bx]  ;先假设第一个数最小
	 inc bx
compare:
	 cmp al,[bx]
	 jl   next   ;al>ds:[bx],直接下一个数
	 mov al,[bx] ;否则al=ds:[bx]
next:
     inc bx
	 loop  compare 
	 mov ds:[2000H],al
exit:
     mov ax,4c00h
	 int 21h
code ends
end start