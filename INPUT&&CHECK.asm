.MODEL  SMALL
.STACK 100H
.DATA
  A DB 0
  WEL DB 'Enter the valueof X :$',0
  NUM DB ' Given input is the number.$',0
  VOW DB 'Given input is vowel$',0
  CON DB 'Given input is a consonnent$',0
  INV  DB  'Invalied input.$',0  
  QUE DB 'Do you want to give another input?(Y/N)$',0 
  .CODE
  
  MAIN PROC 
    
    SURO:
    
    MOV AX,@DATA  
    MOV DS,AX
    LEA DX,WEL
    MOV AH,09H
    INT 21H
    MOV AH,01H
    INT 21H
    MOV A,AL
    CALL SPNEW   
    CMP A,'A'
    JGE CHAR
    CMP A,'0'
    JGE NUMB
    JMP INVALID
    
    CHAR:
       CMP A,'A'
       JE VOWEL 
        CMP A,'E'
       JE VOWEL
        CMP A,'I'
       JE VOWEL
        CMP A,'O'
       JE VOWEL 
       CMP A,'U'
       JE VOWEL
       CMP A,'Z'
       JNE CONSO 
       JMP INVALID
       
       
     VOWEL:
         MOV AH,09H
         LEA DX,VOW
         INT 21H
         CALL SPNEW
         JMP ABAR
       
      CONSO: 
         LEA DX,CON
         MOV AH,09H
         INT 21H
         CALL SPNEW
         JMP ABAR
        
       NUMB:
           MOV AH,09H
         LEA DX,NUM
         INT 21H
         CALL SPNEW 
         CMP A,'9'
         JG INVALID
         JMP ABAR 
        
        ABAR:
           MOV AH,09H
           LEA DX,QUE
           INT 21H
           CALL SPNEW
           MOV AH,01H
           INT 21H  
           MOV A,AL
           CALL SPNEW
           CMP A,'Y'
           JE AGAIN
           CMP A,'N'
           JE FINISH
           JMP INVALID
           
        INVALID:
           MOV AH,09H
           INT 21H
           LEA DX,INV
           CALL SPNEW  
           JMP ABAR
           
         AGAIN:
           JMP SURO  
        
        SPNEW:
               MOV AH ,02H
              MOV DX,0AH
              INT 21H
              MOV AH ,02H
              MOV DX,0DH
              INT 21H
               RET
        
        FINISH:  MAIN ENDP
                 END MAIN
          
           
           
       
       
    
    
    