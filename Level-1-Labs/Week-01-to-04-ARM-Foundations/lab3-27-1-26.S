; Count the number of positive, negative numbers and zeros in a given array

/*

LDR R0, =ARRAY
MOV R1, #10
MOV R5, #0
MOV R6, #0
MOV R7, #0

LOOP:
LDR R2, [R0], #4
CMP R2, #0
ADDGT R5, R5, #1
ADDLT R6, R6, #1
ADDEQ R7, R7, #1
SUBS R1, R1, #1
BNE LOOP

SWI 0X11

ARRAY: .WORD 10, -5, 0, 20, -15, 0, 30, -25, 40, 0





;write a program to find sum of n data items stored at alternative memory locations in the memory. store the result in another memory location. give the ans separately using these 3 addressing modes: pre indexed, post indexed and pre indexed with writeback





;PRE INDEXED

.text
.global _start

_start:                 
    LDR R0, =ARRAY      
    LDR R1, =N         
    LDR R1, [R1]       
    MOV R2, #0
    MOV R3, #0

LOOP:                  
    LDR R4, [R0, R3]    

    ADD R2, R2, R4      
    ADD R3, R3, #8      

    SUBS R1, R1, #1
    BNE LOOP

    LDR R5, =RESULT
    STR R2, [R5]

    SWI 0x11          

.data
    ARRAY:  .word 10, 0, 20, 0, 30, 0, 40, 0, 50
    N:      .word 5
    RESULT: .word 0



; POST INDEXED

.text
.global _start

_start:
    LDR R0, =ARRAY          
    LDR R1, =N          
    LDR R1, [R1]       

    MOV R2, #0          

LOOP:
    LDR R4, [R0], #8    

    ADD R2, R2, R4      
    
    SUBS R1, R1, #1     
    BNE LOOP            

    LDR R5, =RESULT
    STR R2, [R5]        

    SWI 0x11           

.data
    ARRAY:  .word 10, 0, 20, 0, 30, 0, 40, 0, 50
    N:      .word 5
    RESULT: .word 0





;PREINDEXED WITH WRITEBACK

.text
.global _start

_start:
    LDR R0, =ARRAY      
    SUB R0, R0, #8     

    LDR R1, =N          
    LDR R1, [R1]        
  
    MOV R2, #0         

LOOP:

    LDR R4, [R0, #8]!   

    ADD R2, R2, R4      
    
    SUBS R1, R1, #1     
    BNE LOOP            

    LDR R5, =RESULT
    STR R2, [R5]        

    SWI 0x11            

.data
    ARRAY:  .word 10, 0, 20, 0, 30, 0, 40, 0, 50
    N:      .word 5
    RESULT: .word 0





*/

;GIVEN A NUMBER, FIND IF IT HAS EVEN OR ODD PARITY(NO OF 1'S IS ODD THEN ITS ODD PARITY, ELSE EVEN PARITY. DO IT USING ADD OPERATION WITH 1.KEEP A ZERO COUNTER AND A 1 COUNTER. IF LAST BIT IS 0, ADD 1 TO ZERO REGISTER. THEN SHIFT LOGICAL RIGHT. KEEP A COUNTER WITH 32 FOR 32 BIT AND THEN REDUCE COUNTER WITH 1. WHEN THIS REGISTER IS 0, THEN STOP)


.text
.global _start

_start:
    LDR R0, =NUMBER     
    LDR R0, [R0]        
    
    MOV R1, #0          @ R1 = Zero Counter
    MOV R2, #0          @ R2 = One Counter
    MOV R3, #32         @ R3 = Loop Counter (for 32 bits)

LOOP:
    AND R4, R0, #1      
    
    CMP R4, #0          
    
    ADDEQ R1, R1, #1    
    ADDNE R2, R2, #1    

    MOV R0, R0, LSR #1    
    
    SUBS R3, R3, #1     
    BNE LOOP             @ If R2 is Even -> Even Parity. If R2 is Odd -> Odd Parity.
    
    AND R5, R2, #1      
    
    LDR R6, =RESULT     
    STR R5, [R6]        

    SWI 0x11            

.data
    NUMBER: .word 15    
    RESULT: .word 0     






