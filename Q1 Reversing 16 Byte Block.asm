; Q1 Copying 16 Byte Block in reverse order

org 100h

MOV AX, 04000H    ; Initilising AX
MOV DS, AX        ; Initilising DS with 40000H
MOV SI, 2000H     ; Initilising SI
MOV DI, 4000H     ; Initilising DI

MOV CL, 10H       ; 16 in Hexadecimal

L1: MOV AL, [SI]
    MOV [DI+0FH], AL  ; DI+0F as 44000-4400F, 0-F = 16 locations, Block Size - 1
    
    INC SI            ; Increment SI to read next Byte
    DEC DI            ; Decremenitng DI, an offset of 0FH is already in place
    DEC CL            ; Decrementing our Counter
    JNZ L1            ; IF Counter > 0 then Jump to Label L1, ELSE move to next instruction

.exit
end