	SECTION .data
	;;  data
	inputBuf db 0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A 

	;; get length of inputBuf
	inputLen equ $ - inputBuf

	SECTION .bss
counter:
	resb 1

	
outputBuf:
	resb 80

	
	SECTION .text
	global  _start

_start:


	;; setting location of input and output buff
	mov esi, inputBuf
	mov edi, outputBuf
	mov byte[counter], inputLen

	
	;; start jump spot
loop_start:
	
	mov al, [esi]		;loads first byte

	call highTranslation

	;; put first half of byte into buffer
	mov byte[edi], dl
	inc edi
	
	;; increment edi so we can store second half of byte
	call lowTranslation

	mov byte[edi], dl
	inc edi

	;; add in space for formatting
	mov byte[edi], 0x20
	inc edi

	;;incrementing to next byte of data and decrementing counter of data byte left to process
	inc esi
	dec byte[counter]
	
	;; put comparison here
	cmp byte[counter], 0
	jne loop_start
	
	;;end jump spot
	
	
	;; get size of buffer
	mov eax, edi
	sub eax, outputBuf
	

	;;printing out everything in output buffer
	mov ecx, outputBuf
	mov ebx, 1
	mov edx, eax
	mov eax, 4
	
	int 80h
		
	;;this is the end of the program
	mov     ebx, 0      ; return 0 status on exit - 'No Errors'
	mov     eax, 1  ; invoke SYS_EXIT (kernel opcode 1)
	int     80h


	;;subroutines
highTranslation:
	;;stores byte of data in edx
	movzx edx, al
	;;masks the byte
	AND edx, 0xF0
	;;shifts data for but the hex number on far right
	SHR edx, 4
	;;checks if it is a letter
	cmp edx, 10
	jl lessThan
	;;since it is a letter, adds a little extra to convert it to the correct character
	ADD edx, 0x07
lessThan:
	ADD edx, 0x30
	ret



lowTranslation:
	;;stores byte of data in edx
	movzx edx, al
	AND edx, 0x0F
	;;checks if it is a letter
	cmp edx, 10
	jl less
	;;since it is a letter, adds a little extra to convert it to the correct character
	ADD edx, 0x07
less:
	ADD edx, 0x30
	ret
