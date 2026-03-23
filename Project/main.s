.text
.global main
main:
	loop:
		LDR r0, =menu
		BL printf

		LDR r0, =fmt
		LDR r1, =p
		BL scanf

		LDR r0, [p]
		CMP r0, #1
		BEQ generate_keys
		B exit

	generate_keys:
		# Read p
		LDR r0, =prompt_p
		BL printf

		LDR r0, =fmt
		LDR r1, =p
		BL scanf
	
		# Read q
		LDR r0, =prompt_q
		BL printf

		LDR r0, =fmt
		LDR r1, =q
		BL scanf

		# Check p prime
		LDR r0, [p]
		BL primeCheck
		CMP r0, #0
		BEQ not_prime

		# Check q prime
		LDR r0, [q]
		BL primeCheck
		CMP r0, #0
		BEQ not_prime

		# Compute phi = (p-1)(q-1)
		LDR r0, [p]
		LDR r1, [q]
		BL calcTotient
		LDR r1, =phi
		STR r0, [r1]

		# Read e
		LDR r0, =prompt_e
		BL printf

		LDR r0, =fmt
		LDR r1, =e
		BL scanf

		# Check e
		LDR r0, [e]
		LDR r1, [phi]
		BL eCheck
		CMP r0, #0
		BEQ invalid_e

		LDR r0, =success_msg
		BL printf
		B loop

	not_prime:
		LDR r0, =notprime_msg
		BL printf
		B loop

	invalid_e:
		LDR r0, =invalide_msg
		BL printf
		B loop

	exit:
		MOV r7, #1
		SWI 0

.data
menu: .asciz "\n1. Generate Keys\n2. Quit\nChoice: "
prompt_p: .asciz "Enter p (<50): "
prompt_q: .asciz "Enter q (<50): "
prompt_e: .asciz "Enter e: "

fmt: .asciz "%d"

notprime_msg: .asciz "Error: p or q not prime \n"
invalide_msg: .asciz "Error: invalid e\n"
success_msg: .asciz "Keys generated successfully!\n"

.bss
p: .skip 4
q: .skip 4
phi: .skip 4
e: .skip 4
