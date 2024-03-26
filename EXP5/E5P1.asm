section .data
msg1 db 'Hello word',13,10
lenmsg1 equ $- msg1

msg2 db 'Hows it going? ',13,10
lenmsg2 equ $- msg2

section .bss

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
write msg1,lenmsg1
write msg2,lenmsg2


mov eax,1
int 80h