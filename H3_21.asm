assume cs:codesg,ds:datasg
datasg segment
    str1 db 'helloWWW'
	cnt1=$-str1  ;计算字符串1的长度
	str2 db 'helloASM'
	cnt2=$-str2  ;计算字符串2的长度
	yes db  'MATCH','$'
	no  db  'NOT MATCH','$'
datasg ends
codesg segment
 start:
     mov ax,datasg
	 mov ds,ax
	 mov ax,cnt1
	 mov bx,cnt2
	 cmp ax,bx
	 jnz  isNotMatch
	 lea si,str1
	 lea di,str2
	 mov cx,cnt1
 next:
     mov al,[si]
	 mov ah,[di]
	 cmp al,ah
	 jnz isNotMatch
	 inc si
	 inc di
	 loop next 
 isMatch:
     mov dx,offset yes
	 mov ah,9
	 int 21h
	 jmp exit
 isNotMatch:
     mov dx,offset no
     mov ah,9
     int 21h
     jmp exit
 exit:
     mov ax,4c00h
	 int 21h
     	 
codesg ends
end start