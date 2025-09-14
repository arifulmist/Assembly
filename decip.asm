.model small
.stack 100h
.data
  a dw 0
  b db 0
  ans dw 0
.code
main proc
    
       mov ax,@data
       mov ds,ax
        
       
        rep: 
           mov ah,01h
        int 21h
         
           cmp al,0dh
           je exit
           sub al,'0'
            mov ah,0  
          
           mov a,ax
           mov ax,10
           mul ans
           add ax,a 
           mov ans,ax
          
           jmp rep
       
   exit: 
       main endp
       end main