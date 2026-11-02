/*
1) Write a program in ARM7TDMI-ISA to transfer a block of 16 words stored at memory location X to memory location Y using Load Multiple and Store Multiple instructions. The rate of transfer is 24 bytes.

2)Write a program to perform 3X3 matrix addition.

3) Write a program to find the length of a string.

4) Write a program to copy a string from one location to another location.

5) Write an ALP to find how many times the given character is present in a string.
*/

LDR R0, =X
        LDR R1, =Y
        MOV R2, #2            
LOOP:   LDMIA R0!, {R3-R8}    
        STMIA R1!, {R3-R8}    
        SUBS R2, R2, #1
        BNE LOOP
        LDMIA R0!, {R3-R6}    
        STMIA R1!, {R3-R6}
        SWI 0x11              ; Exit

X:      .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
Y:      .space 64




LDR R0, =M1
        LDR R1, =M2
        LDR R2, =RES
        MOV R3, #9
ADDER:  LDR R4, [R0], #4
        LDR R5, [R1], #4
        ADD R6, R4, R5
        STR R6, [R2], #4
        SUBS R3, R3, #1
        BNE ADDER
        SWI 0x11              ; Exit

M1:     .word 1,2,3,4,5,6,7,8,9
M2:     .word 1,1,1,1,1,1,1,1,1
RES:    .space 36






LDR R0, =STR
        MOV R1, #0
COUNT:  LDRB R2, [R0], #1
        CMP R2, #0
        BEQ EXIT
        ADD R1, R1, #1
        B COUNT
EXIT:   SWI 0x11              ; Exit

STR:    .ascii "PES UNIVERSITY"
        .byte 0






LDR R0, =SRC
        LDR R1, =DST
COPY:   LDRB R2, [R0], #1
        STRB R2, [R1], #1
        CMP R2, #0
        BNE COPY
        SWI 0x11              ; Exit

SRC:    .ascii "OS LAB"
        .byte 0
DST:    .space 10






LDR R0, =S
        MOV R1, #'a'
        MOV R2, #0
SCAN:   LDRB R3, [R0], #1
        CMP R3, #0
        BEQ END
        CMP R3, R1
        ADDEQ R2, R2, #1
        B SCAN
END:    SWI 0x11              ; Exit

S:      .ascii "banana"
        .byte 0



