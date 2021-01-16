; Q3 Sum of 2 digit BCD numbers 

org 100h
   
.data 

   BCD_INPUT  DB 16H      ; Variable for storing the input BCD number
   BCD_SUM_OUTPUT DB ?    ; Variable for storing the output BCD sum
                   
.code
.startup

   MOV AL, BCD_INPUT      ; Storing the input in AL register
   AND AL, 0FH            ; ANDing with 0FH, to retain Lower Order Nibble

   MOV AH, BCD_INPUT      ; Storing the input again in AH register
   MOV CL, 04H            ; Initilising CL with 04H
   SHR AH, CL             ; Using Shift right instruction to shift Higher Order nibble to Lower order and making higher order nibble 0H

   ADD AH, AL             ; Adding both BCD digits

   CMP AH, 09H            
   JC SKIP                ; IF SUM > 09H then ADD 06 to the SUM, ELSE jump to Label SKIP
   ADD AH, 06H
   SKIP: MOV BCD_SUM_OUTPUT, AH  ; Storing the sum to our output variable

.exit
end