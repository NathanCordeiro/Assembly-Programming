section .data
    msg1 db 'Data Block 1 : '
    lenMsg1 equ $-msg1
   
    msg2 db 13, 10, 'Data Block 2 : '
    lenMsg2 equ $-msg2
   
    srcArray db 1, 2, 3, 4, 5
    destArray db 0, 0, 0, 0, 0
   
    space db ' '
    lenSpace equ $-space
   
section .bss
    data resb 1
   
%macro write 2
    pusha
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
    popa
%endmacro
   
section .text
    global _start
   
_start:
    write msg1, lenMsg1
   
    mov ecx, 5
    mov esi, srcArray
   
    datablock1:
        mov eax, [esi]
        add eax, '0'
        mov [data], eax
        write data, 1
        write space, lenSpace
        inc esi
  ;inc esi
        loop datablock1
       
    mov ecx, 5
    mov esi, srcArray
    mov edi, destArray
   
    transfer:
        mov eax, [esi]
        mov [edi], eax
        inc esi
        inc edi
        loop transfer
       
    write msg2, lenMsg2
   
    mov ecx, 5
    mov edi, destArray
   
    datablock2:
        mov eax, [edi]
        add eax, '0'
        mov [data], eax
        write data, 1
        write space, lenSpace
        inc edi
        loop datablock2
   
    mov eax, 1
    int 80h
