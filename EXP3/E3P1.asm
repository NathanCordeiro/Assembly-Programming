;Nathan Cordeiro 22co09
;APL to print number 1 - 4 using loops

section .bss
   num resb 1

section .data
    newline db '', 13, 10
    lenNewline equ $-newline

    space db ' '
    lenspace equ $-space

section .text
   global _start        

_start:                
   mov ecx,4
   mov eax, '1'

   
UP: ;LOOP LABEL
   mov [num], eax
   mov eax, 4
   mov ebx, 1
   push ecx

   mov ecx, num        
   mov edx, 1        
   int 0x80

   mov eax, [num]

   ;increment the value by 1
   sub eax, '0'
   inc eax
   add eax, '0'
   pop ecx
   loop UP ;LABEL termination

    ;Printing newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, lenNewline
    int 80h

mov eax,1             ;system call number (sys_exit)
int 0x80              ;call kernel