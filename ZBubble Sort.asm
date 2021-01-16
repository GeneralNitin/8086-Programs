
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.CODE
.STARTUP
MOV AX, 4000H
MOV DS, AX
MOV SI, 2000H
MOV DI, 2000H
 
MOV CH, 10H 
L1: MOV SI, 2000H
    MOV CL, 0FH    
    L2: MOV AL, [SI]
        MOV BL, [SI+01H]
        
        CMP AL, BL
        JC SKIP
        CALL SWAP
        SKIP: INC SI
        DEC CL
        JNZ L2
    DEC CH
    JNZ L1 


.EXIT
SWAP PROC NEAR
    XCHG AL, BL
    MOV [SI], AL
    MOV [SI+01H], BL 
    RET   
SWAP ENDP




