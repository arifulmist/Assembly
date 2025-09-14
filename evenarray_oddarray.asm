 ;LINEAR SEARCH
.MODEL SMALL
.STACK 100H
.DATA 
    ARR DB 0,1,2,3,4,101,6,7,8,9
    ;ARR DB 10 DUP(0)
    TOTAL DB 0
    COUNT DB 0
    EV DB 0 
    OD DB 0 
    MSS DB 'EVEN ARAAY$'
    MSSS DB 'ODD ARRAY$'
    
    

.CODE

MAIN PROC

    MOV AX,@DATA
    MOV DS,AX 
        
       MOV BX,OFFSET ARR ;LOAD
    MOV SI,0
    MOV CX,10
    
    LL2: 
    CALL DEC_INP
    MOV DX,0;
    MOV DL,TOTAL
    MOV [BX+SI],DX 
  
    CALL NEW_LINE

    INC SI
    LOOP LL2
  
        
        
        
    
        
     MOV BX,OFFSET ARR 
    MOV SI,0
    MOV CX,10
    
    LLL2: 
    CALL DEC_INP
    MOV  AL, TOTAL         
    MOV  [BX+SI], AL 
     TEST AL, 1             
    JNZ  IS_ODD  
    IS_EV:
       INC EV
       JMP L3  
       
    IS_ODD:
       INC OD 
        JMP L3
     L3:
       INC SI
       LOOP LLL2
    
     L4:
       MOV AL,EV
       CMP AL,OD
       JL PRINT1  
       LEA DX,MSS
       MOV AH,09H
       INT 21H
       JMP FIN_EXIT
       
       PRINT1: 
           LEA DX,MSSS
          MOV AH,09H
           INT 21H 
           JMP FIN_EXIT
          
       
       
    
    
    
    
   
   
   
   ; CALL DEC_INP
   ; CALL NEW_LINE
   ; CALL DEC_OUT
    
    
    
    
    ;ENTER ARRAY ELEMENTS
    
   
    
    ;ENTER THE NUMBER YOU WANT TO SEARCH
   
    
    
    
    ;PRINTING ARRAY ELEMENTS
    
   
    
    
    
    
    JMP FIN_EXIT
    
MAIN ENDP

;FUNCTION FOR SEARCHING




;FUNCTION TO PRINT NEWLINE

NEW_LINE PROC 
    PUSH DX
    MOV DX,0AH
    MOV AH,02H
    INT 21H
    MOV DX,0DH
    INT 21H
    POP DX
    RET
    
    NEW_LINE ENDP


;FUNCTION FOR DECIMAL OUTPUT
DEC_OUT PROC
    PUSH BX 
    PUSH CX
    PUSH DX
    MOV COUNT,0
    MOV DX,0
    MOV AX,0
    MOV AL,TOTAL
    
    LAB2:
        MOV BL,10
        MOV AH,0
        DIV BL
        
        MOV DL,AH
        PUSH DX
        INC COUNT
        
        CMP AL,0
        JNE LAB2
        
        
        MOV CX,0
        MOV DX,0
        MOV CL,COUNT
        
        L:
            POP DX
            ADD DL,'0'
            MOV AH,02H
            INT 21H
            LOOP L
            
        
        POP DX
        POP CX
        POP BX
        RET
    
    DEC_OUT ENDP


;FUNCTION FOR DECIMAL INPUT

DEC_INP PROC 
       PUSH BX
       MOV BX,0
       MOV TOTAL,0
       MOV AH,01
       INT 21H
       
       LAB:
            CMP AL,0DH
            JE EXIT
            SUB AL,'0'
            MOV BL,AL
            MOV AL,10
            MUL TOTAL
            ADD AL,BL
            MOV TOTAL,AL
            
            
            MOV AH,01H
            INT 21H
            JMP LAB
            
       EXIT: 
       
       POP BX
       RET
    
    DEC_INP ENDP

FIN_EXIT:

END MAIN
    
