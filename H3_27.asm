assume cs:codesg,ds:datasg
datasg segment
    org 10h
    dw 0873h
    db 10 dup(0)
datasg ends

codesg segment
start:
      mov ax,datasg
      mov ds,ax
      mov ax,ds:[10h]
      mov cl,3
      sar ax,cl
      mov ds:[12h],al
	  mov ds:[13h],ah
exit:
    mov ax,4c00h
    int 21h
codesg ends
end start
      
    