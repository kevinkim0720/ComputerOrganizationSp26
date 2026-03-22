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

	#NOLOG program
	LDR r0, =promptNOLOG
	BL printf

	LDR r0, =inputChar
	LDR r1, =inchar
	BL scanf

	LDR r0, =inchar
	LDRB r0, [r0]
	BL ChkAlphaNOLOG
	
	#Max3program
	LDR r0, =promptMax
	BL printf

	LDR r0, =input3Int
	LDR r1, =val1
	LDR r2, =val2
	LDR r3, =val3
	BL scanf

	LDR r0, =val1
	LDR r0, [r0]
	LDR r1, =val2
	LDR r1, [r1]
	LDR r2, =val3
	LDR r2, [r2]
	BL findMAXOf3

	MOV r1, r0
	LDR r0, =printMax
	BL printf

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

printMax: .asciz "Max value is: %d\n"
printGrade: .asciz "%s got grade letter %s\n"

inputChar: .asciz " %c"
input3Int: .asciz "%d %d %d"
inputStr: .asciz "%s"
inputInt: .asciz "%d"

inchar: .byte 0
val1: .word 0
val2: .word 0
val3: .word 0
student: .space 40
grade: .word 0

invalid_msg: .asciz "Invalid score\n"
