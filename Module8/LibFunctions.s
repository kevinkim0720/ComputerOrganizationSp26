.global miles2kilometer
.global CToF
.global kph
.global InchesToFt

.text
InchesToFt:
	#Push stack
	SUB sp, sp, #4
	STR lr, [sp]

	MOV r1, #12

	#Pop stack
	LDR lr, [sp]
	ADD sp, sp, #4
.data

#END InchesToFt

.text
kph:
	#Push stack
	SUB sp, sp, #4
	STR lr, [sp]

	BL miles2kilometer

	#Pop stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data

#END kph

.text
CToF:
	# Push stack
	SUB sp, sp, #4
	STR lr, [sp]

	#r0 = (r0 * 9/ 5) + 32
	MOV r1, #5
	MUL r0, r0, r1
	MOV r1, #9
	BL __aeabi_idiv	
	MOV r1, #32
	ADD r0, r0, r1

	# Pop stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

.data

#END CToF


.text
miles2kilometer:
	# Push stack
	SUB sp, sp #4
	STR lr, [sp]

	# Convert miles to kilometers
	MOV r1, #161
	MUL r0, r0, r1
	
	MOV r1, #100
	BL __aeabi_idiv

	# Pop stack
	LDR lr, [sp]
	ADD sp, sp, #4	
	MOV pc, lr
.data

#END miles2kilometer
