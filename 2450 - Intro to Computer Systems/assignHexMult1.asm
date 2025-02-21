; John Kearney CS2450 - PROGRAMMING ASSIGNMENT 1-1 (gethd)

.orig x3000
JSR  GETHD ; call gethd (duh)
JSR  GETHD  ; again
HALT 

GETHD   ST   R7, SAVER7      ; Save R7 to avoid JSR conflicts
        ST   R5, SAVER5      ; Save R5 (ascii limits)
        ST   R4, SAVER4      ; Save R4
        ST   R3, SAVER3      ; Save R3

GHD_TOP GETC                ; get user input

        ; Check if character is between 48 and 57
        NOT  R3, R0
        ADD  R3, R3, #1
        LD   R5, ASCIINL
        ADD  R4, R3, R5
        BRp  ENDIF1
        NOT  R3, R0
        ADD  R3, R3, #1
        LD   R5, ASCIINU
        ADD  R4, R3, R5
        BRn  ENDIF1
        OUT		; VALID
        LD   R5, HEXNTD
        ADD  R0, R0, R5
        BRnzp GHD_END

ENDIF1		; NOT a digit
        NOT  R3, R0
        ADD  R3, R3, #1
        LD   R5, ASCIIUL
        ADD  R4, R3, R5
        BRp  ENDIF2
        NOT  R3, R0
        ADD  R3, R3, #1
        LD   R5, ASCIIUU
        ADD  R4, R3, R5
        BRn  ENDIF2
        OUT		; VALID
        LD   R5, HEXUTD
        ADD  R0, R0, R5
        BRnzp GHD_END

ENDIF2  ; LOWERCASE CHARS
        NOT  R3, R0
        ADD  R3, R3, #1
        LD   R5, ASCIILL
        ADD  R4, R3, R5 
        BRp  ENDIF3
        NOT  R3, R0
        ADD  R3, R3, #1
        LD   R5, ASCIILU
        ADD  R4, R3, R5
        BRn  ENDIF3
        OUT		; VALID
        LD   R5, HEXLTD
        ADD  R0, R0, R5
        BRnzp GHD_END

ENDIF3
        BRnzp GHD_TOP

GHD_END LD   R5, SAVER5		; restore registers
        LD   R4, SAVER4
        LD   R3, SAVER3
        LD   R7, SAVER7
        RET

; Constants

SAVER7  .fill   #0
SAVER5  .fill   #0
SAVER4  .fill   #0
SAVER3  .fill   #0

ASCIINL .fill   #48		; ASCII 0
ASCIINU .fill   #57		; ascii 9
ASCIIUL .fill   #65		; ascii A
ASCIIUU .fill   #70		; ASCII F
ASCIILL .fill   #96		; ASCII a
ASCIILU .fill   #102	; ASCII f

HEXNTD  .fill   #-48	; 0–9
HEXUTD  .fill   #-55	; 10–15 (A-F)
HEXLTD  .fill   #-87	; 10–15 (a-f)
