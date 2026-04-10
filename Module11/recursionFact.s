.text
.global main
main:
	SUB sp, sp, #4
	STR lr, [sp]

	# prompt integer for factorial
	LDR r0, =promptN
	BL printf

	LDR r0, =inputInt
	LDR r1, =nVal
	BL scanf

	LDR r0, =nVal
	LDR r0, [r0]

	CMP r0, #0
	BLT negative_val

	CMP r0, #12
	BGT over_max

	BL Factorial

	MOV r2, r0
	LDR r0, =printAnswer

	LDR r1, =nVal
	LDR r1, [r1]

	BL printf
	B end_program

negative_val:
	LDR r0, =negativeMsg
	BL printf
	B end_program

over_max:
	LDR r0, =overmaxMsg
	BL printf
	B end_program

end_program:
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr

Factorial:
	SUB sp, sp, #8
	STR lr, [sp]
	STR r4, [sp, #4]

	MOV r4, r0

	CMP r0, #0
	BEQ fact_base

	CMP r0, #1
	BEQ fact_base

	SUB r0, r4, #1
	BL Factorial

	MOV r1, r4
	BL addMult
	B fact_done

fact_base:
	MOV r0, #1

fact_done:
	LDR r4, [sp, #4]
	LDR lr, [sp]
	ADD sp, sp, #8
	MOV pc, lr

addMult:
	SUB sp, sp, #8
	STR lr, [sp]
	STR r4, [sp, #4]

	MOV r4, r0

	CMP r1, #0
	BEQ add_zero

	CMP r1, #1
	BEQ add_one

	SUB r1, r1, #1
	BL addMult

	ADD r0, r4, r0
	B add_done

add_zero:
	MOV r0, #0
	B add_done

add_one:
	MOV r0, r4

add_done:
	LDR r4, [sp, #4]
	LDR lr, [sp]
	ADD sp, sp, #8
	MOV pc, lr

.data
promptN: .asciz "Enter a value for n: "
printAnswer: .asciz "factorial(%d) is %d\n"

inputInt: .asciz "%d"

nVal: .word 0

negativeMsg: .asciz "Input cannot be negative\n"
overmaxMsg: .asciz "Input cannot exceed max input (12)\n"
