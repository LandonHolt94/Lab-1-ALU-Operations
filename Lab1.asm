.ORIG x3000

LD R1, X     ; Load X into R1
LD R2, Y     ; Load Y into R2

; Compute X + Y and store result at x3102
ADD R3, R1, R2
ST R3, SUM

; Compute X AND Y and store result at x3103
AND R3, R1, R2
ST R3, AAND

; Compute X OR Y and store result at x3104
NOT R4, R1      ; negate R1 to get the bitwise complement of X
NOT R5, R2      ; negate R2 to get the bitwise complement of Y
AND R4, R4, R5  ; perform a bitwise AND operation between the complement of X and the complement of Y
NOT R4, R4      ; negate the result to get the bitwise OR of X and Y
ST R4, OOR      ; store the result in x3104

; Compute NOT(X) and store result at x3105
NOT R3, R1
ST R3, NOTX

; Compute NOT(Y) and store result at x3106
NOT R3, R2
ST R3, NOTY

; Compute X + 3 and store result at x3107
ADD R3, R1, #3
ST R3, XPLUS3

; Compute Y - 3 and store result at x3108
ADD R3, R2, #-3
ST R3, YMINUS3

; Check if X is even or odd and store result at x3109
AND R3, R1, #1   ; Check if the least significant bit of X is 0 or 1
BRz EVEN         ; If it's 0, X is even, so jump to EVEN
ADD R3, R0, #1   ; If it's 1, X is odd, so set R3 to 1
ST R3, Z         ; Store the result in x3109
BR END           ; Jump to the end of the program

EVEN:             ; X is even, so store 0 at x3109
ST R0, Z

END:
HALT
.END

        .ORIG x3100
X       .FILL #9
Y       .FILL #12
SUM     .FILL x3102
AAND    .FILL x3103
OOR     .FILL x3104
NOTX    .FILL x3105
NOTY    .FILL x3106
XPLUS3  .FILL x3107
YMINUS3 .FILL x3108
Z       .FILL x3109

        .END