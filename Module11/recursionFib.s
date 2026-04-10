.text
.global main
main:
	# prompt integer for n-th Fib number
        LDR r0, =promptN
        BL printf

        LDR r0, =inputInt
        LDR r1, =n
        BL scanf

        LDR r0, =n
        LDR r0, [r0]
        BL Fib

        MOV r1, r0
        LDR r0, =printFib

        LDR r2, =n
        LDR r2, [r2]

        MOV r3, r1
        MOV r1, r2
        MOV r2, r3

        BL printf

        MOV r0, #0
        MOV pc, lr


.text
Fib:
        # Push stack
        SUB sp, sp, #12
        STR lr, [sp]
        STR r4, [sp, #4]
        STR r5, [sp, #8]

        # r0 = n
        MOV r4, r0

        CMP r0, #0
        BEQ fib_zero

        CMP r0, #1
        BEQ fib_one

        SUB r0, r4, #1
        BL Fib
        MOV r5, r0

        SUB r0, r4, #2
        BL Fib

        ADD r0, r5, r0
        B fib_done

fib_zero:
        MOV r0, #0
        B fib_done

fib_one:
        MOV r0, #1

fib_done:
        # Pop stack
	LDR lr, [sp]
	LDR r4, [sp, #4]        
	LDR r5, [sp, #8]
        ADD sp, sp, #12
        MOV pc, lr

.data
promptN: .asciz "Enter n: "
printFib: .asciz "Fib(%d) = %d\n"

inputInt: .asciz "%d"

n: .word 0

