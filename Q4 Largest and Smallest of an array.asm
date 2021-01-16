; Q4 Finding the largest and the smallest number from an array of size 10 Bytes

org 100h

.DATA
    ARRAY DB 01H, 0FEH, 02H, 03H, 04H, 05H, 06H, 0FH, 00H, 0FFH ; Array of 10 Byte elements
    SIZE DB 0AH ; Size of the array
    MAX DB ?    ; For storing largest element
    MIN DB ?    ; For storing smallest element 
    
.CODE
.STARTUP
    MOV MAX, 00H    ; Initilizing MAX with 00H, Smallest number
    MOV MIN, 0FFH   ; Initilizing MIN with FFH, Largest number
    
    LEA BX, ARRAY                     ; Storing the address of first element of ARRAY  
    MOV CL, 00H                       ; Initilizing CL with 00H
    L1: MOV AL, CL  
        XLAT                          ; AL will have the content from the ARRAY, 01 in first iteration
        
        CMP AL, MAX                   
        JC SKIP_TO_NEXT_CMP           ; IF AL > MAX then Store AL to MAX, ELSE we jump to other comparision logic
        MOV MAX, AL
        
        SKIP_TO_NEXT_CMP: CMP AL, MIN 
        JNC SKIP_TO_INC               ; IF AL < MIN then Store AL to MIN, ELSE we jump to incrementing the counter
        MOV MIN, AL
        SKIP_TO_INC: INC CL           ; Incrementing CL
        
        CMP SIZE, CL                  
        JNZ L1                        ; IF SIZE == CL then move to next instruction, ELSE jump to label L1
.EXIT                                 
END    
