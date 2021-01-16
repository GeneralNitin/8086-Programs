org 100h
   
.DATA 

   BCD     DB 63H     
   BCD_SUM DB ?
                   
.CODE
.STARTUP

   MOV AL, BCD     
   AND AL, 0FH            

   MOV AH, BCD      
   MOV CL, 04H            
   SHR AH, CL             

   ADD AH, AL             

   CMP AH, 0AH            
   JC SAVE
   ADD AH, 06H
   SAVE: MOV BCD_SUM, AH

.EXIT
END