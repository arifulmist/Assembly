 .MODEL SMALL
.STACK 100H
.DATA 
     A DB 0
     B DB 0
     C DB 0
    MSG  DW 'LESS$'  
    MSG2 DW 'GREATER$' 
    MSG3 DW 'SAME$'
.CODE   
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX   
    MOV AH,01H
    INT 21H 
    MOV A,AL 
    
     MOV AH ,02H
              MOV DX,0AH
              INT 21H
             
                  MOV DX,0DH
                  INT 21H

    MOV AH,01H
    INT 21H
      MOV BL,AL
      
      MOV AH ,02H
              MOV DX,0AH
              INT 21H
             
                  MOV DX,0DH
                  INT 21H

    
    CMP A, BL
     JG  LE
     JL  LABEL2
     JMP LAB 
     
    

   LAB:  MOV AH ,02H
     MOV DX,0AH
     INT 21H
     MOV AH ,02H
     MOV DX,0DH
     INT 21H
      MOV AH, 09H
     LEA DX,MSG3
     INT 21H 
     JMP L  
     
     LE: 
              MOV AH ,02H
              MOV DX,0AH
              INT 21H
              MOV AH ,02H
              MOV DX,0DH
              INT 21H  
              MOV AH, 09H 
              LEA DX,MSG2
              INT 21H 
              JMP L
             
      LABEL2:  MOV AH ,02H
            MOV DX,0AH
          INT 21H
          MOV AH ,02H
          MOV DX,0DH
          INT 21H

           MOV AH, 09H
          LEA DX,MSG
          JMP L        
     
 
    L: MAIN ENDP
      END MAIN