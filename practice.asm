.model small
.stack 100h
.data

  inp1 db "enter a:$"
  inp2 db "enter b:$"
  a db ?
  b db ? 
  ten dw 10 
  digit dw 0
  delim db  0dh ,0ah,'$'
  ans dw 0
 .code 
 main proc 
     
     input:
      mov dx,@data
      mov ds,dx
     
      mov ah,01h
      int 21h  
      cmp al,0dh
      je printing
      sub al,'0' 
      mov ah,0
      mov bx,ax
      mov ax,ans
      mov cx,10
      mul cx
      add ax,bx
      mov ans,ax
      inc digit 
      jmp input 
     
     printing:
       mov ah,09h
       lea dx,delim
       int 21h
       mov cx,1
       move:
         cmp cx,digit
         jg print
         mov dx,0
         mov ax,ans
         div ten
         push dx  ;125/10 dx e 5 ax e 12
         mov ans,ax
         inc cx
         jmp move  
        
      print:
       mov cx,1
       pp:
         cmp cx,digit 
         jg exit
         mov ah,02h
         pop dx
         add dx,'0'
         int 21h
         inc cx
         jmp pp
        
       
         
  exit: main endp
 end main
       
      