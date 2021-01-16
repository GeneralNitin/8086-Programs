org 100h                  

MOV AX, 4000H            ; Moving data 4000H to AX register
MOV DS, AX               ; Intializing DS with AX i.e. 4000H
MOV SI, 2000H            ; Intializing SI reg with 2000H
MOV DI, 4000H     

MOV CL, 10H       

ADD DI, 0FH

L1: MOV AL, [SI]
    MOV [DI], AL  
    
    INC SI            
    DEC DI  01H          
    DEC CL  00H          
    JNZ L1      
ret 