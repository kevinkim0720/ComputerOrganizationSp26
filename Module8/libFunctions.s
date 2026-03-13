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
	BL __aeabi_idiv

	#Pop stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data

#END InchesToFt

.text
kph:
	#Push stack
	SUB sp, sp, #8
	STR lr, [sp]
	STR r4, [sp, #4]
	
	# r0 input is hours and r1 input is miles
	MOV r4, r0
	MOV r0, r1

	BL miles2kilometer
	MOV r1, r4
	BL __aeabi_idiv

	#Pop stack
	LDR r4, [sp, #4]
	LDR lr, [sp]
	ADD sp, sp, #8
	MOV pc, lr
.data

#END kph

.text
CToF:
	# Push stack
	SUB sp, sp, #4
	STR lr, [sp]

	#r0 = (r0 * 9/ 5) + 32
	MOV r1, #9
	MUL r0, r0, r1
	MOV r1, #5
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
	SUB sp, sp, #4
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
