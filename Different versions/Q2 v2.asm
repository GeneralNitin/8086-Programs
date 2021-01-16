org 100h

.DATA
    BCD_INPUT DB 16H          ; BCD Input Variable
    BIN_VALUE DB ?            ; Binary Output Variable

.CODE
.STARTUP
                              
    CALL BCD_TO_BIN                

.EXIT

    BCD_TO_BIN PROC NEAR
        PUSHF
        PUSH BX
        PUSH CX
                  
        MOV AL, BCD_INPUT
        MOV BL, AL      
        AND BL, 0FH
        AND AL, 0F0H
        
        MOV CL, 04H
        ROR AL, CL
                 
        MOV BH, 0AH         
        MUL BH
        
        ADD AL, BL
        
        MOV BIN_VALUE, AL  
             
        POP CX
        POP BX
        POPF 
        RET
    BCD_TO_BIN ENDP
    
END