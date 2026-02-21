# Program Name: FeetandInches.s
# Author: Kevin Kim
# Date 2/21/2026
# Purpose: convert total inches given to feet and inches

.text

.global main
main:
	SUB sp, sp, #4
	STR lr, [sp]

	LDR r0, =prompt
	BL printf

	LDR r0, =formatString
	LDR r1, =totalInches
	BL scanf

	LDR r0, =totalInches
	LDR r0, [r0]
	MOV r1, #12
	BL __aeabi_idiv
	MOV r4, r0 // Feet in r4
	
	MOV r1, #12
	MOV r0, r4
	MUL r0, r1, r4

	LDR r1, =totalInches
	LDR r1, [r1]
	SUB r1, r1, r0 //Remaining inches

	MOV r2, r1
	MOV r1, r4
	LDR r0, =output
	BL printf

	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Enter total inches: "
	totalInches: .word 0
	formatString: .asciz "%d"
	output: .asciz "Conversion is %d Feet and %d Inches\n"

