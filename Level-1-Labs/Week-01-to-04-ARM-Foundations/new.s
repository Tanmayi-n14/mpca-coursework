


.TEXT
MOV R0, #5       
MOV R1, #5    
LDR R2, =STR    

LOOP:
    SWI 0x206   
    SWI 0x204    
    BL DELAY
    
    CMP R0, #0
    BEQ EXIT    
    SUB R0, R0, #1
    B LOOP

DELAY:
    LDR R3, =1000000
D_LOOP:
    SUBS R3, R3, #1
    BNE D_LOOP
    MOV PC, LR

EXIT:
    SWI 0x11

.DATA
.ALIGN
STR: .ASCIZ "HELLO WORLD"