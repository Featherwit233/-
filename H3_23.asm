assume cs:codesg,ds:datasg
datasg segment   
    org 1000h     ;LIST从1000h单元开始
    LIST db 100/5 dup(1,2,3,4,5) ;初始化100个1-5的数据
	org 2000h     ;BLK从2000h单元开始
    BLK  db 100 dup(0)
datasg ends

codesg segment
start:
    mov ax,datasg
    mov ds,ax
    lea si,LIST ;si定位LIST中的数据
    lea di,BLK  ;di定位BLK中的数据
    mov cx,100
next:
    mov al,[si]
    mov [di],al
    inc si
    inc di
    loop next 
exit:
    mov ax,4c00h
    int 21h
codesg ends
end start