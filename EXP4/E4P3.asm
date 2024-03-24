section .data
    array db 11, 12, 13, 14, 15
    evenMsg db 'Even : '
    lenEvenMsg equ $-evenMsg
   
    oddMsg db ' and Odd : '
    lenOddMsg equ $-oddMsg

    newline db '', 13, 10
    lennewline equ $-newline
   
section .bss
    even resb 1
    odd resb 1

section .text
    global _start
   
_start:
    mov cl, 5 ; size of the array
    mov dl, 0 ; stores the no. of even numbers in the array
    mov esi, array ; point to address of elements of the array
   
    up:
        mov al, [esi] ; move current element to al
        inc esi ; increment array index
        ror al, 1
        jc skip ; if value in al is odd
        add dl, 1 ; if value in al is even
        skip:
            loop up
   
    mov al, 5 ; size of array
    sub al, dl ; Odd numbers = Size of array - Even numbers
    add al, '0'
    add dl, '0'
       
    mov [even], dl
    mov [odd], al
   
    ;Display even message
    mov eax, 4
    mov ebx, 1
    mov ecx, evenMsg
    mov edx, lenEvenMsg
    int 80h
   
    ;Display even count
    mov eax, 4
    mov ebx, 1
    mov ecx, even
    mov edx, 1
    int 80h
   
    ;Display odd message
    mov eax, 4
    mov ebx, 1
    mov ecx, oddMsg
    mov edx, lenOddMsg
    int 80h
   
    ;Display odd count
    mov eax, 4
    mov ebx, 1
    mov ecx, odd
    mov edx, 1
    int 80h
   
    ;Displaying a new line
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, lennewline
    int 80h

    mov eax, 1
    int 80h