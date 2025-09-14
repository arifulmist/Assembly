.model small
.stack 100h
.data
  a dw 10
  d dw 0
  ans dw 0
.code
main proc
    
      input: mov ax,@data
       mov ds,ax
        mov ah,01h
        int 21h 
        cmp al,0dh
        jmp print 
       sub al,'0'
      
       xor ah,ah
       mov bx,ax
       mov cx,ans
       mov cx,10
       mul cx
       add ax,bx 
       mov ans,ax
       inc d
       jmp input
       
       print:
          mov ah,02h
          mov dx,0ah
         int 21h
         mov cx,1
         move:
         cmp cx,d
         jg l1
         mov dx,0
         mov ax,ans
         div a
         push dx
         mov ans,ax
         inc cx
         jmp move
         l1:
           mov cx,1
           p2: 
             cmp cx,d
             jg exit
             mov ah, 02h
             pop dx
             add dx,'0'
             int 21h
             inc cx
             jmp p2 
             
            exit:
             main endp
              end main
            
           
        
       
    
          
       
   exit: 
       main endp
       end main