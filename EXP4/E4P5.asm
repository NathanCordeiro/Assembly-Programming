section .data
    inputMsg db 'Enter an uppercase character : '
    lenInputMsg equ $-inputMsg
   
    outputMsg db 'Lowercase Character : '
    lenOutputMsg equ $-outputMsg
   
    errorMsg db 'Error the character Entered is neither Uppercase nor Lowercase'
    lenErrorMsg equ $-errorMsg
   
    invalidMsg db 'Invalid input the character is Lowercase'
    lenInvalidMsg equ $-invalidMsg

    newline db '', 13, 10
    lennewline equ $-newline
   
section .bss
    lowercase resb 1
    uppercase resb 1
   
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
    write inputMsg, lenInputMsg
    read uppercase, 1
   
    mov eax, [uppercase]
   
    ;If the ascii code of the entered character is less than 65, then input is erroneus
    cmp eax, 'A'
    jb error
   
    ;If the ascii code of the entered character is greater than 122, then input is erroneus
    cmp eax, 'z'
    ja error
   
    ;If the ascii code of the entered character is above 96, then the entered character is lowercase; hence invalid
    cmp eax, 'a'
    ja invalid
   
    ;Converting uppercase to lowercase
    add eax, 32
    mov [lowercase], eax
    write outputMsg, lenOutputMsg
    write lowercase, 1
    jmp exit
   
    error:
        write errorMsg, lenErrorMsg
        jmp exit
       
    invalid:
        write invalidMsg, lenInvalidMsg
        jmp exit
   
    exit:
        ;Displaying a new line
        mov eax, 4
        mov ebx, 1
        mov ecx, newline
        mov edx, lennewline
        int 80h

        mov eax, 1
        int 80h