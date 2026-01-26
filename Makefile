all: calculadora

calculadora: calculadora.o
	ld -o calculadora calculadora.o

calculadora.o: calculadora.asm
	nasm -f elf64 calculadora.asm -o calculadora.o

clean:
	rm -f calculadora calculadora.o