# Program Name: TwosComplement.s
# Author: Kevin Kim
# Date: 2/21/2026
# Purpose: read integer and output its negative using twos complement
.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp]

	LDR r0, =prompt
	BL printf

	LDR r0, =formatString
	LDR r1, =integer
	Bl scanf

	LDR r0, =integer
	LDR r0, [r0]
	MVN r0, r0
	MOV r1, #1
	ADD r0, r0, r1

	MOV r1, r0
	LDR r0, =output
	BL printf

	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Input an integer: "
	integer: .word 0
	formatString: .asciz "%d"
	output: .asciz "Using two's complement, the negative integer is %d\n"
