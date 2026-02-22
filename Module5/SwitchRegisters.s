# Program Name: SwitchRegisters.s
# Author: Kevin Kim
# Date: 2/21/2026
# Purpose: switching two registers using EOR

.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp]

	LDR r0, =prompt1
	BL printf
	
	LDR r0, =formatString
	LDR r1, =integer1
	BL scanf

	LDR r0, =prompt2
	BL printf

	LDR r0, =formatString
	LDR r1, =integer2
	BL scanf
	
	LDR r0, =integer1
	LDR r0, [r0]
	LDR r1, =integer2
	LDR r1, [r1]

	EOR r0, r0, r1
	EOR r1, r0, r1
	EOR r0, r0, r1

	MOV r2, r1
	MOV r1, r0
	LDR r0, =output
	BL printf

	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt1: .asciz "Enter first value (stored in r0): "
	prompt2: .asciz "Enter second value(stored in r1): "
	integer1: .word 0
	integer2: .word 0
	formatString: .asciz "%d"
	output: .asciz "The first value (stored in r0) is now %d and the second value (stored in r1) is now %d\n"
