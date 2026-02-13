# Program Name: PrintStrTab.s
# Author: Kevin Kim
# Date: 2/23/2026
# Purpose: format string with tabs between a number and text
.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	LDR r0, = format
	LDR r1, = number
	LDR r1, [r1, #0]
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
	number: .word 2026
	format: .asciz "The year\t%d\tis tabbed between words\n"
