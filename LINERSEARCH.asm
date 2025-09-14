;LINEAR SEARCH
.MODEL SMALL
.STACK 100H
.DATA 
    ;ARR DB 0,1,2,3,4,101,6,7,8,9
    ARR DB 10 DUP(?)
    TOTAL DB 0
    COUNT DB 0 
    A DB 0  
    MSG DB 'FOUND$',0   
    MSGNF DB 'NOT FOUND$',0
    

.CODE

MAIN PROC

    MOV AX,@DATA
    MOV DS,AX 
    
    MOV BX,OFFSET ARR ;LOAD
    MOV SI,0
    MOV CX,10
    
    LL2: 
    CALL DEC_INP
    MOV DL,TOTAL
    MOV [BX+SI],DL 
  
    CALL NEW_LINE

    INC SI
    LOOP LL2
    
    
    
     ;INPUT
     MOV AH,01H
     INT 21H
     MOV A,AL
    
    
     ;ARRAY OUTPUT
    MOV  BX, OFFSET ARR
    XOR  SI, SI
    MOV  CX, 10           ; array length
    MOV  AL, A            ; target value in AL

SEARCH_LOOP:
    CMP  [BX+SI], AL                           
    JE   FOUND
    INC  SI
    LOOP SEARCH_LOOP

NOT_FOUND:
    CALL NEW_LINE
    LEA  DX, MSGNF        ; DX must point to string BEFORE INT 21h
    MOV  AH, 09h
    INT  21h
    JMP  FIN_EXIT

FOUND:
    CALL NEW_LINE
    LEA  DX, MSG
    MOV  AH, 09h
    INT  21h
    JMP  FIN_EXIT
       
    
   
   
   
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
    
