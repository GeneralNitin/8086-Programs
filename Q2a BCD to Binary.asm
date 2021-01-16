; Q2a BCD conversion BCD to Binary

org 100h

.DATA
    BCD_IN DB 16H           ; BCD Input Variable
    BIN_OUT DB ?            ; Binary Output Variable

.CODE
.STARTUP
                  
    CALL BCD_TO_BIN              

    BCD_TO_BIN PROC NEAR
        PUSHF                   ; Pushing the registers value into the stack
        PUSH BX
        PUSH CX
        PUSH DX
                  
        MOV AL, BCD_IN          ; Storing the BCD input in AL register          
                  
        MOV BL, AL              ; Copying the same in Bl register
        AND BL, 0FH             ; ANDing with 0FH, to retain Lower Order Nibble
        
        MOV CL, 04H             ; Initilising CL with 04H
        SHR AL, CL              ; Using Shift right instruction to shift Higher Order nibble to Lower order and making Higher order nibble 0H
                               
        MOV DL, 0AH             ; Initilising DL with 0AH
        MUL DL                  ; Muliplying AL with DL and storing in AX
        
        ADD AL, BL              ; Adding AL and BL, and sum gets stored in AL
             
        MOV BIN_OUT, AL         ; Storing the sum to out output variable
             
        POP DX                  ; Poping the registers value from the stack in LIFO order
        POP CX
        POP BX
        POPF
    BCD_TO_BIN ENDP 

.EXIT
END