section .data
    size db 5
    array db 5, 7, 3, 9, 1
   
    space db ' '
    lenSpace equ $-space

    msg1 db 'The initial array: '
    lenmsg1 equ $-msg1
   
    msg2 db 13,10,'The array after sort: '
    lenmsg2 equ $-msg2
   
section .bss
    value resb 1

section .text
    global _start
   
%macro write 2
    pusha
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
    popa
%endmacro

_start:
write msg1,lenmsg1
mov cl, [size]
mov esi, array

    disp:
        mov al, [esi]
        add al, '0'
        mov [value], al
        write value, 1
        write space, lenSpace
        inc esi
        loop disp

    mov cl, [size] ; count for loop 1
    loop1:
        mov dl, [size] ; count for loop 2
        mov edi, array ; holds address of array elements
        loop2:
            mov al, [edi] ; ith element
            mov bl, [edi + 1] ; (i+1)th element
           
            cmp al, bl
            jbe noSwap ; if al <= bl, then no swap req
            mov [edi], bl
            mov [edi + 1], al
           
            noSwap:
                inc edi
                dec dl ; dec loop 2 counter
                jnz loop2
        loop loop1 ; auto decrement of loop 1 counter
   
    mov cl, [size]
    mov esi, array
   
    write msg2,lenmsg2

    output:
        mov al, [esi]
        add al, '0'
        mov [value], al
        write value, 1
        write space, lenSpace
        inc esi
        loop output
       
    exit:
        mov eax, 1
        int 80h