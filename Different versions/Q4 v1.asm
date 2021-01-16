org 100h

.CODE
.STARTUP

    MOV AX, 04000H
    MOV DS, AX
    MOV SI, 02000H
    MOV DI, 02010H
                              
    CALL FIND_MIN
    
    MOV SI, 02000H
    CALL FIND_MAX 

.EXIT

 FIND_MIN PROC NEAR
    PUSH AX
    PUSH BX
    PUSH CX
    
    MOV CL, 0AH

    MOV BL, 0FFH             
    L1: MOV AL, [SI]
        INC SI
        CMP AL, BL
        JNC SKIP
        MOV BL, AL 
        
        SKIP: DEC CL
        JNZ L1  
    
    MOV [DI], BL
    INC DI
                   
    POP CX
    POP BX
    POP AX                                     
    RET
 FIND_MIN ENDP
 
 FIND_MAX PROC NEAR
    PUSH AX
    PUSH BX
    PUSH CX
    
    MOV CL, 0AH

    MOV BL, 00H               
    L2: MOV AL, [SI]
        INC SI
        CMP AL, BL
        JC SKIP2
        MOV BL, AL 
        
        SKIP2: DEC CL
        JNZ L2  
    
    MOV [DI], BL
                   
    POP CX
    POP BX
    POP AX                                     
    RET
 FIND_MAX ENDP
 
END