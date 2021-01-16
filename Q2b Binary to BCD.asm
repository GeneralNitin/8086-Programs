; Q2b BCD conversion Binary to BCD

org 100h

.DATA

BIN_IN DB 10H           ; Binary Input Variable
BCD_OUT DB ?            ; Binary Output Varibale

.CODE
.STARTUP
                  
    CALL BIN_TO_BCD                
    
    BIN_TO_BCD PROC NEAR
        PUSHF                     ; Pushing the registers value into the stack
        PUSH BX
        PUSH CX
        PUSH DX
          
        MOV AL, BIN_IN            ; Storing the BCD input in AL register
        
        MOV BL, 0AH               ; Initilising BL with 0AH
        DIV BL                    ; Dividing AL (Dividend) with BL (Divisor), Quotient goes in AL, and remainder in AH
        
        MOV CL, 04H               ; Initilising CL with 04H 
        SHL AL, CL                ; Using Shift left instruction to shift Lower Order nibble to Higher order and making Lower order nibble 0H
        
        ADD AL, AH                ; Adding the AL with AH (remainder), and sum gets stored in AL
        
        MOV BCD_OUT, AL           ; Storing the sum to out output variable
           
        POP DX                    ; Poping the registers value from the stack in LIFO order
        POP CX
        POP BX
        POPF
    BIN_TO_BCD ENDP 

.EXIT
END