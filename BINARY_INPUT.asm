.MODEL SMALL
    .STACK 100H
    .DATA
         B DW 0
         A DB 0
         C DW 0
         D DW 0
        MSG1  DW 'HELLO$'  
        MSG2 DW 'BYE$'    
        MSG3 DW 'SEE YOU$'
        
    .CODE
    
       
    MAIN PROC ;AND 
          
          
        MOV AX,@DATA
        MOV DS,AX
      
        MOV AH,1
        INT 21H
        SUB AL,'0' 
        
        MOV BX,0  
        
        L1:
        
         SHL BX,1   ; LEFT SHIFT
         OR BL,AL    ; OR
         
         MOV AH,1
         INT 21H  
         CMP AL,0DH     ;CARAGE RETURN
         JE EXIT
         
         SUB AL,'0'  
         JMP L1
         
   
    EXIT: MAIN ENDP
          END MAIN