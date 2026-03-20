.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	#LOG program
	LDR r0, =promptLOG
	BL printf

	LDR r0, =inputChar
	LDR r1, = inchar
	BL scanf

	LDR r0, =inchar
	LDRB r0, [r0]
	BL ChkAlphaLOG
		

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
promptLOG: .asciz "Input a character and I'll tell you if it's alphabetic using logical operations: "
promptNOLOG: .asciz "Input a character and I'll tell you if it's alphabetic not using logical operations: "
promptMax: .asciz "Input 3 values: "
promptStudent: .asciz "Input student name: "
promptGrade: .asciz "Enter a score between 0-100: "


printGrade: .asciz "%s got grade letter %s\n"

inputChar: .asciz " %c"
inputStr: .asciz "%s"
inputInt: .asciz "%d"

inchar: .byte 0
student: .space 40
grade: .word 0

invalid_msg: .asciz "Invalid score\n"
