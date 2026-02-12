# Program Name: printAge.s
# Author: Kevin Kim
# Date: 2/12/2026
# Purpose: Asks user input of his/her age then printf
.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp, #0]
	
	# prompt for age input
	LDR r0, = prompt
	BL printf
	
	#Scanf
	LDR r0, = input
	LDR r1, = num
	BL scanf

	# print age message
	LDR r0, = format
	LDR r1, = num
	LDR r1, [r1, #0]
	BL printf	

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr


.data
num: .word 0
prompt: .asciz "Enter your age:"
input: .asciz "%d"
format: .asciz "Your age is %d \n"
