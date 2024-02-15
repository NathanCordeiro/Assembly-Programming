section .data
msg db "***Basic Mathematic Operations***"
len equ $ -msg

msg1 db 10,13,"sum is:"
len1 equ $ -msg1

newline db '', 13, 10
lennewline equ $-newline

section .bss
sum resb 1

section .text
global _start

_start:

    ;Displaying message '***Basic Mathematical Operations***'
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 80h

    ;Displaying msg 'sum is:'
    mov edx, len1
    mov ecx, msg1
    mov ebx, 1
    mov eax, 4
    int 80h

    ;***addition***
    mov AX,'6' ;convert to decimal 6  
    sub AX,'0'
    mov BX,'2' ;convert to decimal 2
    sub BL,'0'
    add AL,BL
    add AX,'0'
    mov [sum],AX

    ;Display sum
    mov ECX,sum
    mov EDX,1
    mov EBX,1
    mov EAX,4
    int 80h

    ;Displaying a new line
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, lennewline
    int 80h

mov EAX, 1
int 80h
