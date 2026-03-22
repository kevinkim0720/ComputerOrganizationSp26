.global ChkAlphaLOG
.global ChkAlphaNOLOG
.global findMAXOf3
.global Grade

.text
ChkAlphaLOG:
	SUB sp, sp, #8
	STR lr, [sp]
	STR r4, [sp, #4]

	MOV r4, r0

	#Comparing with uppercase letters
	MOV r0, #0
	CMP r4, #'A'
	ADDGE r0, r0, #1
	MOV r1, #0
	CMP r4, #'Z'
	ADDLE r1, r1, #1
	AND r2, r0, r1

	#Comparing with lowercase letters
	MOV r0, #0
	CMP r4, #'a'
	ADDGE r0, r0, #1
	MOV r1, #0
	CMP r4, #'z'
	ADDLE r1, r1, #1
	AND r3, r0, r1

	#If either 'and' returns 1 then the character is alphabetic
	ORR r0, r2, r3

	CMP r0, #1
	BEQ printY

	printN:
		LDR r0, =n_msg
		BL printf
		B done_LOG

	printY:
		LDR r0, =y_msg
		BL printf

	done_LOG:
		LDR lr, [sp]
		LDR r4, [sp, #4]
		ADD sp, sp, #8
		MOV pc, lr

#END ChkAlphaLOG

ChkAlphaNOLOG:
	SUB sp, sp, #4
	STR lr, [sp]

	CMP r0, #'A'
	BLT chkLower
	CMP r0, #'Z'
	BLE isAlpha

	chkLower:
		CMP r0, #'a'
		BLT notAlpha
		CMP r0, #'z'
		BLE isAlpha
	notAlpha:
		LDR r0, =n_msg
		BL printf
		B done_NOLOG
	isAlpha:
		LDR r0, =y_msg
		BL printf

	done_NOLOG:
		LDR lr, [sp]
		ADD sp, sp, #4
		MOV pc, lr


#END ChkAlphaNOLOG

findMAXOf3:
	SUB sp, sp, #4
	STR lr, [sp]
	
	CMP r1, r0
	MOVGT r0, r1
	CMP r2, r0
	MOVGT r0, r2
	
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

#END findMAXOf3

Grade:
	SUB sp, sp, #8
	STR lr, [sp]
	STR r4, [sp, #4]

	# Store grade score safely
	MOV r4, r0

	MOV r0, #0
	CMP r4, #0
	ADDGE r0, r0, #1
	MOV r1, #0
	CMP r4, #100
	ADDLE r1, r1, #1
	AND r0, r0, r1

	MOV r1, #0

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
		B done_Grade

	gradeB:
		LDR r0, =grade_B
		B done_Grade

	gradeC:
		LDR r0, =grade_C
		B done_Grade

	gradeD:
		LDR r0, =grade_D
		B done_Grade

	gradeF:
		LDR r0, =grade_F
		B done_Grade
			
	ErrorMsg:
		# Print if grade is invalid
		LDR r0, =error
		MOV r1, #1

	done_Grade:
		LDR lr, [sp]
		LDR r4, [sp, #4]
		ADD sp, sp, #8
		MOV pc, lr

#END Grade
.data
.global y_msg
.global n_msg

	y_msg: .asciz "Y\n"
	n_msg: .asciz "N\n"

	error: .asciz "Invalid score\n"
	grade_A: .asciz "A"
	grade_B: .asciz "B"
	grade_C: .asciz "C"
	grade_D: .asciz "D"
	grade_F: .asciz "F"

