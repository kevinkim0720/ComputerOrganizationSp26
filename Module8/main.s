.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp, #0]

	LDR r0, =promptMiles
	BL printf

	LDR r0, =inputInt
	LDR r1, =miles
	BL scanf

	LDR r0, =miles
	LDR r0, [r0]
	BL miles2kilometer

	MOV r1, r0
	LDR r0, =printKm
	BL printf


	LDR r0, =promptMiles
	BL printf
	
	LDR r0, =inputInt
	LDR r1, =miles
	BL scanf

	LDR r0, =promptHours
	BL printf

	LDR r0, =inputInt
	LDR r1, =hours
	BL scanf

	LDR r0, =hours
	LDR r0, [r0]

	LDR r1, =miles
	LDR r1, [r1]
	BL kph

	MOV r1, r0
	LDR r0, =printKph
	BL printf


	LDR r0, =promptC
	BL printf

	LDR r0, =inputInt
	LDR r1, =celsius
	BL scanf

	LDR r0, =celsius
	LDR r0, [r0]
	BL CToF

	MOV r1, r0
	LDR r0, =printF
	BL printf


	LDR r0, =promptInches
	BL printf

	LDR r0, =inputInt
	LDR r1, =inches
	BL scanf

	LDR r0, =inches
	LDR r0, [r0]
	BL InchesToFt

	MOV r1, r0
	LDR r0, =printFt
	BL printf

	LDR lr, [sp, #0]
	ADD sp, sp, #4
	MOV pc, lr

.data
promptMiles: .asciz "Enter miles for conversion: "
promptHours: .asciz "Enter hours to calculate KPH: "
promptC: .asciz "Enter degrees celsius for conversion: "
promptInches: .asciz "Enter inches to get feet: "

printKm: .asciz "That is %d Kilometers\n"
printKph: .asciz "That is %d Kilometers per hour\n"
printF: .asciz "That is %d degrees Fahrenheit\n"
printFt: .asciz "It is %d feet\n"

inputInt: .asciz "%d"

miles: .word 0
hours: .word 0
celsius: .word 0
inches: .word 0

