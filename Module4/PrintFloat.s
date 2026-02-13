# Program Name: PrintFloat
# Author: Kevin Kim
# Date: 2/13/2026
# Purpose: Take user inputted float value and print it back
.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp, #0]
	
	LDR r0, = prompt
	BL printf

	LDR r0, = input
	LDR r1, = num
	BL scanf

	LDR r0, = format
	LDR r1, = num
	LDRD r2, [r1]
	BL printf
	

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr


.data
	num: .float 0.0
	prompt: .asciz "Input float value: "
	input: .asciz "%f"
	format: .asciz "You inputted: %f\n"


