org 100h

.DATA
    BCD_INPUT DB 16H          ; BCD Input Variable
    BIN_VALUE DB ?            ; Binary Output Variable

.CODE
.STARTUP
               
    MOV AL, BCD_INPUT               
    CALL BCD_TO_BIN 
    MOV BIN_VALUE, AL               
    
.EXIT

    BCD_TO_BIN PROC NEAR
        PUSHF
        PUSH BX
        PUSH CX
                  
        MOV BL, AL      
        AND BL, 0FH
        AND AL, 0F0H
        
        MOV CL, 04H
        ROR AL, CL
                 
        MOV BH, 0AH         
        MUL BH
        
        ADD AL, BL  
             
        POP CX
        POP BX
        POPF 
        RET
    BCD_TO_BIN ENDP

END