section .data
    msg1 db 'Enter the first number : '
    len1 equ $-msg1

    msg2 db 'Enter the second Number : '
    len2 equ $-msg2

    msg3 db 'Addition : '
    len3 equ $-msg3

    newline db '', 13, 10
    lennewline equ $-newline

section .bss
    num1 resb 1
    num2 resb 1
    res resb 1

section .text
 global _start
  _start:
    ;'Enter the first number : '
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 80h

    ;Reading the first number
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 2
    int 80h

    ;'Enter the second number : '
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 80h

    ;Reading the second number
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 2
    int 80h

   
    mov eax, [num1]
    sub eax, '0'

    mov ebx, [num2]
    sub ebx, '0'

    ;Adding num1 and num2 and storing result in eax
    add eax, ebx
    add eax, '0'

    ;pushing result of summation to variable res
    mov [res], eax

    ;'Addition : '
    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, len3
    int 80h

    ;Displaying the result of Addition
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 80h

    ;Displaying a new line
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, lennewline
    int 80h

mov EAX,1
int 80h
