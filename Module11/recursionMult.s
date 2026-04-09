.text
.global main
main:
        # Program dictionary:
        # r4 - m
        # r5 - n
        # r6 - result

        SUB     sp, sp, #16
        STR     lr, [sp]
        STR     r4, [sp, #4]
        STR     r5, [sp, #8]
        STR     r6, [sp, #12]

        # prompt for m
        LDR     r0, =promptM
        BL      printf

        LDR     r0, =inputInt
        LDR     r1, =mVal
        BL      scanf

        # prompt for n
        LDR     r0, =promptN
        BL      printf

        LDR     r0, =inputInt
        LDR     r1, =nVal
        BL      scanf

        LDR     r4, =mVal
        LDR     r4, [r4]

        LDR     r5, =nVal
        LDR     r5, [r5]

        MOV     r0, r4
        MOV     r1, r5
        BL      Mult

        MOV     r6, r0

        LDR     r0, =resultMult
        LDR     r1, =mVal
        LDR     r1, [r1]
        LDR     r2, =nVal
        LDR     r2, [r2]
        MOV     r3, r6
        BL      printf

end_program:
        LDR     lr, [sp]
        LDR     r4, [sp, #4]
        LDR     r5, [sp, #8]
        LDR     r6, [sp, #12]
        ADD     sp, sp, #16
        MOV     pc, lr

Mult:
        # Recursive definition:
        # if n == 0 return 0
        # if n == 1 return m
        # else return m + Mult(m, n-1)

        SUB     sp, sp, #12
        STR     lr, [sp]
        STR     r4, [sp, #4]
        STR     r5, [sp, #8]

        MOV     r4, r0
        MOV     r5, r1

        CMP     r5, #0
        BEQ     mult_zero

        CMP     r5, #1
        BEQ     mult_one

        MOV     r0, r4
        SUB     r1, r5, #1
        BL      Mult

        ADD     r0, r4, r0
        B       mult_done

mult_zero:
        MOV     r0, #0
        B       mult_done

mult_one:
        MOV     r0, r4

mult_done:
        LDR     lr, [sp]
        LDR     r4, [sp, #4]
        LDR     r5, [sp, #8]
        ADD     sp, sp, #12
        MOV     pc, lr

.data
promptM:        .asciz "Enter m (multipler): "
promptN:        .asciz "Enter n (# of additions): "
resultMult:     .asciz "%d x %d = %d\n"

inputInt: .asciz "%d"

mVal:           .word 0
nVal:           .word 0
