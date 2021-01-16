org 100h

.CODE
.STARTUP

    MOV AX, 04000H
    MOV DS, AX
    MOV SI, 02000H
    MOV DI, 02010H
                              
    CALL FIND_MIN_AND_MAX

.EXIT

 FIND_MIN_AND_MAX PROC NEAR
    PUSHF
    PUSH AX
    PUSH BX
    PUSH CX
    
    MOV CL, 0AH

    MOV BL, 0FFH
    MOV BH, 00H               
    L1: MOV AL, [SI]
        INC SI
        CMP AL, BL
        JNC SKIP1
        MOV BL, AL 
        
        SKIP1: CMP AL, BH
        JC SKIP2
        MOV BH, AL
        
        SKIP2: DEC CL
        JNZ L1  
    
    MOV [DI], BL
    INC DI
    MOV [DI], BH
                   
    POP CX
    POP BX
    POP AX
    POPF                                     
    RET
 FIND_MIN_AND_MAX ENDP
 
END