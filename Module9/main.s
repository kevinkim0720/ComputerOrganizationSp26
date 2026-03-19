.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp, #0]


	#Grade program
	LDR r0, =promptGrade
	BL printf

	LDR r0, =inputInt
	LDR r1, =grade
	BL scanf

	LDR r0, =grade
	LDR r0, [r0]
	BL Grade

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
promptLOG: .asciz "Input something and I'll tell you if it's alphabetic using logical operations: "
promptNOLOG: .asciz "Input something and I'll tell you if it's alphabetic not using logical operations: "
promptMax: .asciz "Input 3 values: "
promptGrade: .asciz "Enter a score between 0-100: "

inputChar: .asciz "%s"
inputInt: .asciz "%d"


grade: .word 0
