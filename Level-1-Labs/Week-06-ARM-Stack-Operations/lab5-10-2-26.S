/*
1. Write an ARM7TDMI assembly program using nested procedure calls to compute the sum of squares of two numbers. The main program calls a procedure SUM_SQ, which in turn calls another procedure SQUARE to compute the square of a number.


2. Write an ARM7TDMI assembly language program to multiply two matrices of suitable order and store the result in a separate memory location.


3. Write an ARM7TDMI assembly language program to generate the first N terms of an arithmetic progression and store them in memory.


4. Write an ARM7TDMI assembly language program to concatenate two strings and store the result and displays the string.


5.
i)	Write a program to swap the first and last character of a given string.
ii)	Given a c Code convert it in its equivalent Arm Code : z = (a << 2) |(b & 15);


6. Write an ARM7TDMI assembly language program in which the main program calls a procedure STRING_PROC. The procedure STRING_PROC calls separate procedures LENGTH to find the length of a string and REVERSE to reverse the string. The reversed string must be stored in a separate memory location.
*/

MOV R0,#3
MOV R1,#4
BL SUM_SQ
SWI 0x11

SUM_SQ:
STMFD SP!,{R1, LR}
BL SQUARE
MOV R2,R0
LDMFD SP!,{R1}
MOV R0,R1
BL SQUARE
ADD R0,R0,R2
LDMFD SP!,{PC}

SQUARE:
STMFD SP!,{LR}
MOV R3,R0
MUL R0,R3,R3
LDMFD SP!,{LR}
BX LR




LDR R0,=A
LDR R1,=B
LDR R2,=C

LDR R3,[R0]
LDR R4,[R0,#4]
LDR R5,[R0,#8]
LDR R6,[R0,#12]

LDR R7,[R1]
LDR R8,[R1,#4]
LDR R9,[R1,#8]
LDR R10,[R1,#12]

MUL R11,R3,R7
MUL R12,R4,R9
ADD R11,R11,R12
STR R11,[R2]

MUL R11,R3,R8
MUL R12,R4,R10
ADD R11,R11,R12
STR R11,[R2,#4]
MUL R11,R5,R7
MUL R12,R6,R9
ADD R11,R11,R12
STR R11,[R2,#8]

MUL R11,R5,R8
MUL R12,R6,R10
ADD R11,R11,R12
STR R11,[R2,#12]

SWI 0x11

A: .WORD 1,2,3,4
B: .WORD 5,6,7,8
C: .WORD 0,0,0,0










LDR R0,=N
LDR R1,[R0]

LDR R2,=A
LDR R3,[R2]
LDR R4,=D
LDR R5,[R4]
LDR R6,=AP

LOOP:
STR R3,[R6],#4
ADD R3,R3,R5
SUBS R1,R1,#1
BNE LOOP

SWI 0x11

N: .WORD 5
A: .WORD 2
D: .WORD 3
AP:.WORD 0,0,0,0,0














LDR R0,=STR1
LDR R1,=STR2
LDR R2,=RES

L1:
LDRB R3,[R0],#1
CMP R3,#0
BEQ L2
STRB R3,[R2],#1
B L1

L2:
LDRB R3,[R1],#1
CMP R3,#0
BEQ L3
STRB R3,[R2],#1
B L2

L3:
MOV R3,#0
STRB R3,[R2]

SWI 0x11

STR1: .ASCIZ "HELLO "
STR2: .ASCIZ "WORLD"
RES:  .SPACE 20










LDR R0,=STR
MOV R1,R0

FIND:
LDRB R2,[R1],#1
CMP R2,#0
BNE FIND
SUB R1,R1,#2

LDRB R3,[R0]
LDRB R4,[R1]
STRB R4,[R0]
STRB R3,[R1]

SWI 0x11

STR: .ASCIZ "HELLO"














LDR R0,=A
LDR R1,[R0]

LDR R2,=B
LDR R3,[R2]

MOV R1,R1,LSL #2
AND R3,R3,#15
ORR R4,R1,R3

LDR R5,=Z
STR R4,[R5]

SWI 0x11

A: .WORD 5
B: .WORD 10
Z: .WORD 0








LDR R0,=STR
LDR R1,=REV
BL STRING_PROC
SWI 0x11

STRING_PROC:
STMFD SP!,{R4,R5,LR}
MOV R4,R0
MOV R5,R1
BL LENGTH
MOV R2,R0
MOV R0,R4
MOV R1,R5
BL REVERSE
LDMFD SP!,{R4,R5,PC}

LENGTH:
MOV R3,#0
L1:
LDRB R2,[R0],#1
CMP R2,#0
BEQ L2
ADD R3,R3,#1
B L1
L2:
MOV R0,R3
BX LR

REVERSE:
CMP R2,#0
BXEQ LR
ADD R0,R0,R2
SUB R0,R0,#1
L3:
CMP R2,#0
BEQ L4
LDRB R3,[R0],#-1
STRB R3,[R1],#1
SUB R2,R2,#1
B L3
L4:
MOV R3,#0
STRB R3,[R1]
BX LR

STR: .ASCIZ "HELLO"
REV: .SPACE 20
