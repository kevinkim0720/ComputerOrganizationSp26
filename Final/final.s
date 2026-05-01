.text
.global main

	# program dictionary
	# r4 - count
	# r5 - sum
	# r6 - input value

main:
	SUB sp, sp, #24
	STR LR, [sp, #20]

	MOV r4, #0
	MOV r5, #0


loop:
	LDR r0, =prompt
	BL printf

	LDR r0, =scanFmt
	MOV r1, sp
	BL scanf

	LDR r6, [sp]
	CMP r6, #-1
	BEQ done

	ADD r4, r4, #1
	ADD r5, r5, r6
	B loop

done:
	CMP r4, #0
	BEQ no_avg

	MOV r0, r5
	MOV r1, r4
	BL __aeabi_idiv
	B print

no_avg:
	MOV r0, #0

print:
	STR r4, [sp, #4]
	STR r5, [sp, #8]
	STR r0, [sp, #12]

	LDR r0, =resultFmt
	LDR r1, [sp, #4]
	LDR r2, [sp, #8]
	LDR r3, [sp, #12]
	BL printf

	MOV r0, #0
	LDR lr, [sp, #20]
	ADD sp, sp, #24

.data
prompt: .asciz "Enter an integer (-1 to stop): "
scanFmt: .asciz "%d"
resultFmt: .asciz "Count = %d Sum = %d Avg = %d\n"
