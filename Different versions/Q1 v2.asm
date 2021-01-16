org 100h

MOV AX, 04000H    
MOV DS, AX        
MOV SI, 2000H    
MOV DI, 4000H    

MOV CL, 10H      

ADD SI, 0FH     
          
L1: MOV AL, [SI]
    MOV [DI], AL 
    
    INC DI           
    DEC SI            
    DEC CL            
    JNZ L1            

ret