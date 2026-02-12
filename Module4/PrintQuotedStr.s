# Program Name: printQuotedStr.s
# Author: Kevin Kim
# Date: 2/12/2026
# Purpose: get user input string and put quotes around it

.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	LDR r0, = prompt
	BL printf
	
	LDR r0, = input
	LDR r1, = words
	BL scanf

	LDR r0, = output
	LDR r1, =words
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	prompt: .asciz "Input string: "
	input: .asciz "%[^\n]"
	words: .space 40
	output: .asciz "This is my output \042%s\042\n"
