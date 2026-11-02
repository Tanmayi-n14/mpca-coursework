/*
;BASIC CODES
MOV R1, #10
MOV R2, #20
ADD R0,R1,R2
SWI 0X11

;Write an ALP to subtract if the numbers are equal, otherwise add them. 

MOV R1,#10
MOV R2,#10
CMP R1,R2
BEQ L1
ADD R5,R1,R2
B L2
L1: SUB R4,R1,R2
L2: SWI 0X11


;Check if a given number is even or odd. Note: at the end of the program execution R2 contains 0 if
number is even, otherwise R2 contains 1.

MOV R1, #15  
AND R2, R1, #1
SWI 0x11

OR

MOV R0,#8
AND R1, R0, #1
CMP R1,#0
BEQ L1
MOV R2,#1
B L2
L1: MOV R2,#0
L2: SWI 0X11

*/








