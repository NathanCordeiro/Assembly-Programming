section .data
    message db 'Enter a string in lowercase: ',
    lenmessage equ $- message
 
    outputmessage db 'String in uppercase: ',
    lenoutputmessage equ $- outputmessage
section .bss

input resb 10
output resb 10

%macro read 2
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro write 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .text
    global _start

_start:
   
    write message,lenmessage
    read input, 10

 
    ; Convert lowercase to uppercase
    mov esi, input ; source address
    mov edi, output ; destination address

convert_loop:
    lodsb ; load byte from source into AL, increment SI
    cmp al, 0 ; check if end of string
    je convert_done ; if end of string, jump to done
    cmp al, 'a' ; compare with 'a'
    jb skip_conversion ; if less than 'a', skip conversion
    cmp al, 'z' ; compare with 'z'
    ja skip_conversion ; if greater than 'z', skip conversion
    sub al, 32 ; convert lowercase to uppercase

skip_conversion:
    stosb ; store byte from AL into destination, increment DI
    jmp convert_loop ; repeat for next byte

convert_done:
write outputmessage,lenoutputmessage  
write output,10

    mov eax, 1
    xor ebx, ebx ; exit status 0
    int 80h