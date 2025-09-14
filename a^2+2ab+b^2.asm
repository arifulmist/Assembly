.model small
.stack 100h
.data
  a db 0
  b db 0
  ans db 0
.code
main proc
    
       mov ax,@data
       mov ds,ax
         mov ah,01h
         int 21h
         sub al,'0'
         mov a,al 
         mov ah,01h
         int 21h 
         sub al,'0'
         mov b,al
         mov al,a
         mul a
         mov ans,al
         mov al,2
         mul a
         mul b
         add ans,al
         mov al,b
         mul b
         add ans ,al 
         xor bl,bl
         mov bl,ans
        
        mov cx,16
        l:
        rol bl ,1
        jc one
        jnc  zero
        one:
        mov ah,02h
        mov dx,'1'
        int 21h
        loop l
        zero:
        mov ah,02h
        mov dx,'0'
        int 21h
        loop  l
         
        
         
         
         
    
    
   main endp
  end main