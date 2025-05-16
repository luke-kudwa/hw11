program.o:
	nasm -f elf32 -g -F dwarf -o program.o program.asm

program:
	ld -m elf_i386 -o program program.o

run:
	./program

clean:
	rm program.o
	rm program
	rm *~
