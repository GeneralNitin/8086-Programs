org 100h
   
.DATA 

   BCD     DB 99H     
   BCD_SUM DB ?
                   
.CODE
.STARTUP

   MOV AL, BCD     
   AND AL, 0FH            

   MOV AH, BCD      
   MOV CL, 04H            
   ROR AH, CL
   AND AH, 0FH             

   ADD AH, AL             

   CMP AH, 0AH            
   JC SAVE
   ADD AH, 06H
   SAVE: MOV BCD_SUM, AH

.EXIT
END