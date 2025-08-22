.MODEL SMALL
.STACK 100H
.DATA
 N DB 0
 i DB 0
 j DB 0
 t DB 0
 MSG DB 'ENTER NUMBER : $'

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
    MOV N,AL

   
    MOV AH,02H
   MOV DL,0DH        
    INT 21H
   MOV AH,02H
     MOV DL,0AH    
    INT 21H

    MOV i,1

  UR: ;upper half er kaj
    MOV AL,i
    CMP AL,N
    JG  LLHS      

    MOV j,1
   USH: ;left e hash print 
    MOV AL,j
    CMP AL,i  
    JG  USS
    MOV AH,02H
    MOV DL,'#'
    INT 21H
    INC j 
    JMP USH

   USS: ;then space
    MOV AL,N
    SUB AL,i
    MOV t,AL
    SHL AL,1
    MOV t,AL

    MOV j,1
   UMS:   ;space middel e bosalam
    MOV AL,j
    CMP AL,t
    JG  URH
    MOV AH,02H
    MOV DL,' '
    INT 21H
    INC j
    JMP UMS

URH: ;right e hash print
    MOV j,1
   URH_LOOP:
    MOV AL,j    
    CMP AL,i
    JG  UEND
    MOV AH,02H
     MOV DL,'#'
    INT 21H
    INC j
    JMP URH_LOOP

   UEND:;sesh i inc kore outer loop ghurabo 
    MOV AH,02H
    MOV DL,0DH     
      INT 21H
    MOV AH,02H
    MOV DL,0AH    
    INT 21H

    INC i
    JMP UR


   LLHS:;nicher print same,ulta dek theke asbo
    MOV AL,N
    DEC AL
    MOV i,AL 

LR:
    MOV AL,i
   CMP AL,1
   JL  BRK

    MOV j,1
   LHS: ;left nicher hash
    MOV AL,j
    CMP AL,i
    JG  LSS
    MOV AH,02H
    MOV DL,'#'
    INT 21H
    INC j
    JMP LHS

   LSS: ;middele space
    MOV AL,N
    SUB AL,i 
    MOV t,AL
    SHL AL,1
    MOV t,AL

    MOV j,1
   LMS:
    MOV AL,j
    CMP AL,t
    JG  LRS
   MOV AH,02H
   MOV DL,' '
   INT 21H
    INC j
    JMP LMS
             
  LRS:
    MOV j,1
   LRH:;niche hash print
    MOV AL,j
    CMP AL,i
    JG  LEND
    MOV AH,02H
    MOV DL,'#'
    INT 21H
    INC j
    JMP LRH
          
    LEND:
    MOV AH,02H
   MOV DL,0DH       
    INT 21H
   MOV AH,02H
   MOV DL,0AH     
    INT 21H
          
    DEC i
    JMP LR 

    BRK:
    MOV AH,02H
   MOV DL,0DH    
    INT 21H
   MOV AH,02H
   MOV DL,0AH        
    INT 21H 
                    
MAIN ENDP
END MAIN
