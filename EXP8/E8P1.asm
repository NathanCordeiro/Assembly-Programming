; PROGRAM TO PRINT HELLO WORLD VERTICALLY DOWNWARDS...

SYS_WRITE EQU 4
SYS_READ EQU 3
SYS_EXIT EQU 1
STDOUT EQU 1
STDIN EQU 0

section .data
    strr db "HELLO WORLD !"
    strlen equ $ - strr
    nl db " ", 0Ah
    nllen equ $ - nl

section .bss
    NUM RESB 1

section .text
    global _start
_start:
    MOV ECX, strlen ; strlen is length of string
    MOV EAX, strr ; strr is the string Hello World
up:
    MOV EBX, EAX
    MOV [NUM], EBX
    ADD EAX, 1
    PUSH EAX
    PUSH ECX
   
    MOV EAX, SYS_WRITE ;Display Num
    MOV EBX,STDOUT
    MOV ECX,[NUM]
    MOV EDX,1
    INT 80H

    MOV EAX, SYS_WRITE ;Display nl
    MOV EBX, STDOUT
    MOV ECX, nl
    MOV EDX, nllen
    INT 80H

    POP ECX
    POP EAX
    LOOP up
exit:
    MOV EAX,SYS_EXIT
    XOR EBX, EBX
    INT 80H