section .data
hex dw 57h

newline db '', 13, 10
    lennewline equ $-newline

section .bss
ascii resb 2

section .text
global _start

_start:
mov bl,[hex]
mov cl,2 ;2 bytes so count is 2
mov edi,ascii ;initialize edi with memory address of ascii

next_digit:
rol bl,04 ;rotat 4 msb to 4 lsb
mov al,bl ;create copy
and al,0Fh ;erase 4 msb's
cmp al,09h ;check if al>9 if true that means num is a hex from (ah, bh, ch, etc)
jbe skip_add
add al, 07h ;only gets executed incase the hex is from A - F
       
skip_add:
add al, 30h ; Add 30h to convert the digit to its corresponding ascii character
mov [edi], al ; move ascii char to ascii variable location
inc edi ; increment edi by one byte
loop next_digit
           
    ; Display the decimal number
    mov eax, 4
    mov ebx, 1
    mov ecx, ascii
    mov edx, 2
    int 80h
   
    ;Displaying a new line
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, lennewline
    int 80h

    mov eax, 1
    int 80h