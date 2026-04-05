All: primeTester guesser

CC=gcc

primeTester: primeTester.o
	$(CC) primeTester.o -g -o primeTester

guesser: guesser.o
	$(CC) guesser.o -g -o guesser

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
