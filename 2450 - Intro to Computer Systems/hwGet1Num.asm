; John Kearney
; ASU CS 2450-101 SP 25
; 2-14-25 


; calling GETNUM subroutine twice
			.orig x3000
			JSR GETNUM
			JSR GETNUM
			HALT

GETNUM
            ; R1 and R2 constants, R7 for char input
			ST R1, GN_SR1
			ST R2, GN_SR2
			ST R7, GN_SR7

TOP			; get a char from user
			AND R0, R0, #0
			GETC
			ST R0, CHAR

			; load constants
			LD R1, N48
			LD R2, N57
			
			; check highs 
			ADD R0, R0, R2
			BRP TOP
            
            ; reload R0
			LD R0, CHAR

            ; check lows
			ADD R0, R0, R1
			BRN TOP

			; reload all 3 registers
			LD R1, GN_SR1
			LD R2, GN_SR2
			LD R7, GN_SR7
			
			RET

; R1, R2, R7 memory (?)
GN_SR1 		.fill 0
GN_SR2 		.fill 0
GN_SR7 		.fill 0
CHAR		.fill 0
N48			.fill -48
N57			.fill -57
			.end