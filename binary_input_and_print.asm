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
         
   
    EXIT:
      
     MOV AH,2
     MOV DX,0AH
     INT 21H
     MOV DX,0DH
     INT 21H
     
    MOV CX,16D
    L2:
    ROL BX,1
    JC ONE
    JNC ZERO
    NEXT:
      LOOP L2 
      
    JMP EXITT 
    ONE:
      MOV AH,2
      MOV DX,'1'
      INT 21H
      JMP NEXT
    ZERO:
      MOV AH,2
      MOV DX,'0'
      INT 21H
      JMP NEXT
    
    
    
    EXITT:
      MAIN ENDP
          END MAIN