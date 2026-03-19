.global ChkAlphaLOG
.global ChkAlphaNOLOG
.global findMAXOf3
.global Grade

.text
ChkAlphaLOG:

.data

#END ChkAlphaLOG

.text
ChkAlphaNOLOG:

.data

#END ChkAlphaNOLOG

.text
findMAXOf3:

.data

#END findMAXOf3

.text
Grade:
	SUB sp, sp, #8
	STR lr, [sp]
	STR r4, [sp, #4]

	# Store for safety
	MOV r4, r0

	MOV r0, #0
	CMP r4, #0
	ADDGE r0, r0, #1
	MOV r1, #0
	CMP r4, #100
	ADDLE r1, r1, #1
	OR r0, r0, r1

	CMP r1, #1
	BNE ErrorMsg
		# Grade is valid
		CMP r4, #90
		BGE elsif_1:
			LDR r0, =grade_A
			BL printf
			
	ErrorMsg:
		"Print if grade is invalid"
		LDR r0, =error
		BL printf
	EndError

	LDR lr, [sp]
	LDR r4, [sp, #4]
	ADD sp, sp, #8
	MOV pc, lr
.data
	error: .asciz ""
	grade_A: .asciz "\nGrade is A"
	grade_B: .asciz "\nGrade is B"
	grade_C: .asciz "\nGrade is C"
	grade_D: .asciz "\nGrade is D"
	grade_F: .asciz "\nGrade is F"

#END Grade
