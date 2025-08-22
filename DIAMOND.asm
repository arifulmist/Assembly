.MODEL SMALL
.STACK 100H
.DATA

  n DB 0  
  s DB 0 
  k DB 0
  tmp DB 0
  MSG DB 'Enter n : $',0  
  spc DB ' ' 
  has  DB '#'
  R DB 0
  i db 0
  j db 0 
  
 .CODE
 
 MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,09H
    LEA DX,MSG
    INT 21H
    MOV AH,01H 
    INT 21H
    SUB AL,'0'
    MOV  n,AL 
    MOV AH,02H           
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV AL,n
    DEC AL
    MOV s,AL
    
    MOV k,1 
    
    MOV AL,n
    SHL AL,1
    DEC AL
    MOV BL,AL
    MOV i,1
    RP:
       MOV j ,1
       PS:
           MOV AL,j
           CMP AL,s
           JG PH
           MOV AH,02H
           MOV DL,spc 
           INT 21H
           INC j 
           
           JMP PS   
         
       PH:
         MOV j,1
           HL:
             MOV AL,j
             CMP AL,k
             JG ED
             MOV AH,02H
             MOV DL,has
             INT 21H
             INC j
             JMP HL
          
       
       ED:  
       MOV AH,02H           
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
        
         MOV AL,n
         DEC AL
         MOV DL,i
         CMP DL,AL
         JG NICHE
       
       OPRE:
          DEC S
          MOV AL,k
          ADD AL,2
          MOV k,AL
          JMP NR 
          
       NICHE:
        INC S
        MOV AL,k
        SUB AL,2
        MOV k,AL
     
       NR:
         INC i
         MOV AL,i
         CMP AL,BL
         JLE RP
       
    
  
       MAIN ENDP
       END MAIN

  