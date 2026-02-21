#Program Name: TotalInches.s
# Author: Kevin Kim
# Date: 2/22/2026
# Purpose: Convert feet and inches into total inches
.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp]

	LDR r0, =prompt1
	BL printf
	LDR r0, =formatString
	LDR r1, =feet
	BL scanf

	LDR r0, =prompt2
	BL printf
	LDR r0, =formatString
	LDR r1, =inches
	BL scanf
	
	LDR r0, =feet
	LDR r0, [r0]
	LDR r1, =inches
	LDR r1, [r1]

	MOV r2, #12
	MUL r0, r0, r2
	ADD r0, r0, r1
	MOV r1, r0
	LDR r0, =output
	BL printf


	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt1: .asciz "Enter number of feet: "
	prompt2: .asciz "Enter number of inches: "
	feet: .word 0
	inches: .word 0
	formatString: .asciz "%d"
	output: .asciz "Total number of inches is %d\n"
