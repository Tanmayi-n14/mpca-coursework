
/*
LDR R0,=A
LDR R1,[R0,#-4]
LDR R1,[R0,#4]
LDR R1,[R0,#8]!
LDR R1,[R0],#4
A: .WORD 100,200,300,400,500


;POST INDEXED ADDRESSING MODE WHERE ANSWER IS IN SOME OTHER REGISTER, ADD ALL THE VALUES IN THE REGISTER

LDR R0, =A

LDR R1, [R0, #-4]
LDR R1, [R0, #4]
LDR R1, [R0, #8]!
LDR R1, [R0], #4
LDR R1, [R0], #4     ; <--- ADD IT HERE
A: .WORD 100,200,300,400,500


Q.
IF (R0!=5)
{
R0=R0+R1-R2
}


    MOV R0, #4
    MOV R1, #10
    MOV R2, #2
    CMP R0, #5
    ADDNE R0, R0, R1
    SUBNE R0, R0, R2
    SWI 0x11

;OR

    MOV R0, #4
    MOV R1, #10
    MOV R2, #2
    CMP R0, #5
    BEQ skip
    ADD R0, R0, R1
    SUB R0, R0, R2
skip:
    SWI 0x11

Q. 
IF (R0==R1) && (R2==R3)
{
    R4++
}


    MOV R0, #5
    MOV R1, #5
    MOV R2, #3
    MOV R3, #3
    MOV R4, #10
    CMP R0, R1
    CMPEQ R2, R3
    ADDEQ R4, R4, #1
    SWI 0x11

;OR


    MOV R0, #5
    MOV R1, #5
    MOV R2, #3
    MOV R3, #3
    MOV R4, #10
    CMP R0, R1
    BNE _exit
    CMP R2, R3
    BNE _exit
    ADD R4, R4, #1
_exit:
    SWI 0x11



Q. 
IF (R0==R1) OR (R2==R3)
{
    R4++
}


*/

    MOV R0, #5
    MOV R1, #5
    MOV R2, #4
    MOV R3, #3
    MOV R4, #10
    CMP R0, R1
    CMPNE R2, R3
    ADDEQ R4, R4, #1
    SWI 0x11


/*


    MOV R0, #5
    MOV R1, #5
    MOV R2, #4
    MOV R3, #3
    MOV R4, #10
    CMP R0, R1
    BEQ _do_add
    CMP R2, R3
    BNE _skip
_do_add:
    ADD R4, R4, #1
_skip:
    SWI 0x11



*/

