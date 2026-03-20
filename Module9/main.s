.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp, #0]


	#Grade program

	LDR r0, =promptStudent
	BL printf

	LDR r0, =inputStr
	LDR r1, =student
	BL scanf

	LDR r0, =promptGrade
	BL printf

	LDR r0, =inputInt
	LDR r1, =grade
	BL scanf

	LDR r0, =grade
	LDR r0, [r0]
	BL Grade

	CMP r1, #1
	BEQ print_invalid
	
	MOV r2, r0
	LDR r0, =printGrade
	LDR r1, =student
	BL printf
	B done

	print_invalid:
	LDR r0, = invalid_msg
	BL printf

	done:

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
promptLOG: .asciz "Input something and I'll tell you if it's alphabetic using logical operations: "
promptNOLOG: .asciz "Input something and I'll tell you if it's alphabetic not using logical operations: "
promptMax: .asciz "Input 3 values: "
promptStudent: .asciz "Input student name: "
promptGrade: .asciz "Enter a score between 0-100: "


printGrade: .asciz "%s got grade letter %s\n"

inputStr: .asciz "%s"
inputInt: .asciz "%d"

student: .space 40
grade: .word 0

invalid_msg: .asciz "Invalid score\n"
