# Program Name: Multiply10.s
# Author: Kevin Kim
# Date: 2/21/2026
# Purpose: read an integer and multiply by 10 using left logical shifts and addition
.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp]

	LDR r0, =prompt
	BL printf

	LDR r0, =formatString
	LDR r1, =integer
	BL scanf

	LDR r0, =integer
	LDR r0, [r0]
	LSL r1, r0, #3
	LSL r0, r0, #1
	ADD r0, r0, r1

	MOV r1, r0
	LDR r0, =output
	BL printf

	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Enter an integer: "
	integer: .word 0
	formatString: .asciz "%d"
	output: .asciz "Multiplied by 10, the integer is now %d\n" 
