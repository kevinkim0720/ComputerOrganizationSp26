.text
.global main
main:
	# Program dictionary:
	# r4 - divisor for prime test
	# r5 - divisor^2

	push {lr}

	start_loop:
		LDR r0, =promptCont
		BL printf

		LDR r0, =inputInt
		LDR r1, =cont
		BL scanf

		LDR r1, =cont
		LDR r1, [r1]
		
		CMP r1, #-1
		BEQ end_program

		# prompt for number
		LDR r0, =promptNum
		BL printf

		LDR r0, =inputInt
		LDR r1, =num
		BL scanf

		LDR r0, =num
		LDR r0, [r0]

		CMP r0, #3
		BLT invalid_input

		MOV r4, #2

	prime_loop:
		MUL r5, r4, r4
		CMP r5, r0
		BGT is_prime
		
		MOV r1, r0
	
	mod_loop:
		CMP r1, r4
		BLT mod_done
		SUB r1, r1, r4
		B mod_loop

	mod_done:
		CMP r1, #0
		BEQ not_prime

		ADD r4, r4, #1
		B prime_loop

	is_prime:
		LDR r0, =primeMsg
		LDR r1, =num
		LDR r1, [r1]
		BL printf
		B start_loop

	not_prime:
		LDR r0, =notPrimeMsg
		LDR r1, =num
		LDR r1, [r1]
		BL printf
		B start_loop

	invalid_input:
		LDR r0, =errorMsg
		BL printf
		B start_loop

	end_program:
		MOV r0, #0
		pop {lr}
		BX lr

.data
promptCont: .asciz "\nEnter -1 to end the program, any other key to continue: "
promptNum: .asciz "\nEnter a number to test: "

inputInt: .asciz "%d"

primeMsg: .asciz "Number %d is prime\n"
notPrimeMsg: .asciz "Number %d is not prime\n"
errorMsg: .asciz "Invalid input. Enter number greater than 2\n"

cont: .word 0
num: .word 0
