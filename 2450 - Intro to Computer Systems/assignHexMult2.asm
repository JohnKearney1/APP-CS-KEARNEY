; John Kearney CS2450 - PROGRAMMING ASSIGNMENT 1-2 (MULT)
; att 3 corrected typo ln 12

.orig x3000
JSR MULT ; call MULT
JSR MULT  ; again
HALT

GHD_END
        LD R5, SAVER5
        LD R4, SAVER4
        LD R3, SAVER3
        LD R7, SAVER7
        RET

MULT    ST R3, SAVER3
        AND R0, R0, #0
        ADD R1, R1, #1
        ADD R1, R1, #-1
        BRZ FINAL
        ADD R2, R2, #1
        ADD R2, R2, #-1
        BRZ FINAL
        AND R0, R0, #0
        NOT R3, R1
        ADD R3, R3, #1
        ADD R3, R3, R2
        BRN MULT2
        AND R3, R3, #0
        ADD R3, R1, #0

MULT1   ADD R0, R0, R2
        ADD R3, R3, #-1
        BRP MULT1
        BRNZP FINAL

MULT2   AND R3, R3, #0
        ADD R3, R2, #0

MULT3   ADD R0, R0, R1
        ADD R3, R3, #-1
        BRP MULT3

FINAL   LD R3, SAVER3
        RET

SAVER7 	.fill	#0
SAVER72	.fill	#0
SAVER6	.fill	#0
SAVER5	.fill	#0
SAVER4	.fill	#0
SAVER3	.fill	#0
SAVER2	.fill	#0
SAVER1	.fill	#0
SAVER0	.fill	#0

ASCIICR	.fill	#10 
ASCIINL .fill	#48 
ASCIINU .fill	#57 
ASCIIUL	.fill	#65
ASCIIUU	.fill   #70
ASCIILL	.fill	#96
ASCIILU	.fill	#102

HEXNTD  .fill   #-48
HEXUTD  .fill   #-55
HEXLTD  .fill   #-87

SUM	.fill 	#0
HEX1	.fill	#16
HEX2	.fill	#256
HEX3	.fill	#4096

.end