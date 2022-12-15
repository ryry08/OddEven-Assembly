	JMP start

even: DB "Even"	; even variable
      DB 0	; string terminator
odd:  DB "odd"	; odd variable
      DB 0 	; string terminator

start:
	MOV A,4 	; gives A the value 5
	AND A,1		; gives register A value 1 and chacks z flag
	JZ evend	; jump if zero to even
	JNZ oddd	; jump if not 0 to odd
	HLT		; halt the program

evend:
	MOV A, even 	; gives register A the odd variable
	MOV B, 232
	CALL printeven

oddd:
	MOV A, odd
	MOV B, 232
	CALL printodd

printodd:
	MOV C, [A]	; gives c the odd variable address
	MOV [B], c	; moves the character in C to output
	INC A
	INC B
	CMP D, [A]	; check if end
	JNZ printodd	; if not end continue
	HLT

printeven:
	MOV C, [A]
	MOV [B], C
	INC A
	INC B
	CMP D, [A]
	JNZ printeven
	HLT