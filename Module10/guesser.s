.text
.global main
main:
	# program dictionary:
	# r4 - target number
	# r5 - guess count
	# r6 - current guess

	SUB sp, sp, #12
	STR lr, [sp]
	STR r4, [sp, #4]
	STR r5, [sp, #8]
	STR r6, [sp, #12] 

	start_loop:
		# prompt user to either continue to program or -1 to quit
		LDR r0, =promptCont
		BL printf

		LDR r0, =inputInt
		LDR r1, =cont
		BL scanf

		LDR r1, =cont
		LDR r1, [r1]

		CMP r1, #-1
		BEQ end_program

		# prompt for max value
		LDR r0, =promptMax
		BL printf

		LDR r0, =inputInt
		LDR r1, =max
		BL scanf

		LDR r1, =max
		LDR r1, [r1]
		
		# make sure input is valid
		CMP r1, #1
		BLE invalid_max_input

		# rand generator
		BL rand
		MOV r2, r0

		LDR r3, =max
		LDR r3, [r3]

	mod_loop:
		CMP r2, r3
		BLT mod_done
		SUB r2, r2, r3
		B mod_loop

	mod_done:
		# target number and counter
		ADD r4, r2, #1
		MOV r5, #0

	guess_loop:
		# prompt guess
		LDR r0, =promptGuess
		BL printf

		LDR r0, =inputInt
		LDR r1, =guess
		BL scanf

		LDR r6, =guess
		LDR r6, [r6]
	
		# counter + 1
		ADD r5, r5, #1

		# check if valid guess. Still counts as a guess
		CMP r6, #1
		BLT invalid_guess_input

		LDR r2, =max
		LDR r2, [r2]

		CMP r6, r2
		BGT invalid_guess_input
		
		# Compare and give hint or correct
		CMP r6, r4
		BEQ correct
		BGT too_high		
		BLT too_low

	too_high:
		LDR r0, =highMsg
		BL printf
		B guess_loop

	too_low:
		LDR r0, =lowMsg
		BL printf
		B guess_loop

	invalid_guess_input:
		LDR r0, =errorGuessMsg
		BL printf
		B guess_loop

	correct:
		LDR r0, =correctMsg
		BL printf
		
		LDR r0, =countMsg
		MOV r1, r5
		BL printf

		B start_loop

	invalid_max_input:
		LDR r0, =errorMaxMsg
		BL printf
		B start_loop

	end_program:
		LDR lr, [sp]
		LDR r4, [sp, #4]
		LDR r5, [sp, #8]
		LDR r6, [sp, #12]
		ADD sp, sp, #12
		MOV pc, lr

.data
promptCont: .asciz "\nEnter -1 to quit. Press any number to continue: "
promptMax: .asciz "\nEnter Maximum number: "
promptGuess: .asciz "\nEnter your guess: "
inputInt: .asciz "%d"

highMsg: .asciz "too high"
lowMsg: .asciz "too low"
correctMsg: .asciz "You got it!\n"
countMsg: .asciz "Total number of guesses was %d\n"
errorMaxMsg: .asciz "Invalid max. Must be greater than 1"
errorGuessMsg: .asciz "Invalid guess. Must be greater than or equal to 1 and less than or equal to %d"

cont: .word 0
max: .word 0
guess: .word 0

