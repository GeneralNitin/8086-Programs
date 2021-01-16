org 100h

.CODE
.STARTUP
    MOV AX, 4000H
    MOV DS, AX
    MOV SI, 2000H
    MOV DI, 2000H
    
    MOV CH, 00H
    L1: MOV BX, 0000H
    MOV AH, 00H
    
    MOV CL, 10H
    SUB CL, CH
    
    CALL FIND_MAX
    
    MOV DL, 0FH
    SUB DL, CH
    MOV DH, 20H
    MOV SI, DX
    
    CALL SWAP
    
    INC CH
    ADD BL, CH
    ADD BH, 00H
    CMP CH, 0FH
    JNZ L1
    
    .EXIT
    
    FIND_MAX PROC NEAR
        L2: MOV AL, [SI]
            ;MOV AH, [SI+01H]
            
            CMP AL, AH
            JC SKIP
            MOV AH, AL
            MOV DI, SI
            SKIP:INC SI
            
            DEC CL
            JNZ L2
        RET
    FIND_MAX ENDP
    
    
    SWAP PROC NEAR
        MOV DL, [DI]
        MOV DH, [SI+BX]
        MOV [DI], DH
        MOV [SI+BX], DL
        
        MOV SI, 2000H
        RET
    SWAP ENDP
