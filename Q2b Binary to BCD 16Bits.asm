; Q2b BCD conversion Binary to BCD

org 100h

.DATA

BIN_IN DW 0078H           ; Binary Input Variable
BCD_OUT DW ?            ; Binary Output Varibale

.CODE
.STARTUP
                  
    CALL BIN_TO_BCD                
    
.EXIT
    
    BIN_TO_BCD PROC NEAR
        PUSHF                     ; Pushing the registers value into the stack
        PUSH BX
        PUSH CX
        PUSH DX
          
      L1:   MOV AX, BIN_IN            ; Storing the BCD input in AL register
        
            MOV BX, 000AH             ; Initilising BL with 0AH
            DIV BX                    ; Dividing AL (Dividend) with BL (Divisor), Quotient goes in AL, and remainder in AH
               
            CMP AL, 0AH
            JC SKIP
            
            ADD AL, 06H
            
            SKIP:MOV CL, 04H               ; Initilising CL with 04H 
            
            SHL AX, CL                ; Using Shift left instruction to shift Lower Order nibble to Higher order and making Lower order nibble 0H
            
            ADD AX, DX                ; Adding the AL with AH (remainder), and sum gets stored in AL 
            
            AND DX, 0000H
            
            MOV BCD_OUT, AX           ; Storing the sum to out output variable
            
            DEC BIN_IN 
            
            JNZ L1
        
           
        POP DX                    ; Poping the registers value from the stack in LIFO order
        POP CX
        POP BX
        POPF
    BIN_TO_BCD ENDP 


END