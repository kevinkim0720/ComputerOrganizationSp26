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
	AND r0, r0, r1

	CMP r0, #1
	BNE ErrorMsg
	
	CMP r4, #90
	BGE gradeA

	CMP r4, #80
	BGE gradeB

	CMP r4, #70
	BGE gradeC
	
	CMP r4, #60
	BGE gradeD

	B gradeF

	gradeA:
		LDR r0, =grade_A
		BL printf
		B EndError

	gradeB:
		LDR r0, =grade_B
		BL printf
		B EndError

	gradeC:
		LDR r0, =grade_C
		BL printf
		B EndError

	gradeD:
		LDR r0, =grade_D
		BL printf
		B EndError

	gradeF:
		LDR r0, =grade_F
		BL printf
		B EndError
			
	ErrorMsg:
		# Print if grade is invalid
		LDR r0, =error
		BL printf

	EndError:
		LDR lr, [sp]
		LDR r4, [sp, #4]
		ADD sp, sp, #8
		MOV pc, lr
.data
	error: .asciz "Invalid score\n"
	grade_A: .asciz "Grade is A\n"
	grade_B: .asciz "Grade is B\n"
	grade_C: .asciz "Grade is C\n"
	grade_D: .asciz "Grade is D\n"
	grade_F: .asciz "Grade is F\n"

#END Grade
