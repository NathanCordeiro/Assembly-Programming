section .data
    name db "Nathan " ,13,10
    nameLen equ $ - name

    surname db "Cordeiro "
    surnameLen equ $ - surname

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, nameLen
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, surname
    mov edx, surnameLen
    int 80h

    mov eax, 1
    int 80h