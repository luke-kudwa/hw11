# hw11


Instructions for compiling.  Use the commands: 
1) make program.o
2) make program

After compiling code execute with ONE of the commands listed:
1) make run
2) ./program

The descrition above is assuming you have downloaded and is using the provided makefile. IF you refuse to use the provided makefile, use the comannds listed to both compile and execute:
1) nasm -f elf32 -g -F dwarf -o program.o program.asm
2) ld -m elf_i386 -o program program.o
3)  ./program


The program will use the provided data in the assignment description:
db  0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A
It will take that data and print out the Hexadecimal values. The provided data will print out:
83 6A 88 DE 9A C3 54 9A

If you want, for each number or letter, you can change it to another hexadecimal value. The program will still print it out.
Yes the program prints spaces between each byte of data. This is for readability, not sure it is apart of the assignment requirements, but it is an added feature.

EXTRA CREDIT:
My program uses 2 subroutines, at the very bottom of my code. For each byte of data, my program will call 1 of the 2 subroutines I have created. One is for the higher nibble, and the other the lower nibble. 
Regardless, each byte of data is translated to the correct hex value to be printed in ASCII characters. Although the assignment doesn't elaborate what it means by "the actual character translation", my code reflects my best interpretation of the assignment extra credit description. 
