; PROGRAM TO IMPLEMENT THE LINEAR SEARCH ALGORITHM....

%macro read 2
    pusha
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, %2
    int 80h
    popa
%endmacro
   
%macro write 2
    pusha
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
    popa
%endmacro

section .data
    acceptMsg db 'Enter the 10 array elements:'
    lenAcceptMsg equ $-acceptMsg
    inputMsg db 'Enter the key value : '
    lenInputMsg equ $-inputMsg
    foundMsg db 'Element found at index : '
    lenFoundMsg equ $-foundMsg
    notFoundMsg db 'Element not present in the array',13,10
    lenNotFoundMsg equ $-notFoundMsg
    space db ' ',13,10
    lenSpace equ $-space
   
section .bss
    index resb 1
    key resb 1
    array resb 10
    whitespace resb 1

section .text
    global _start
 _start:  

write acceptMsg,lenAcceptMsg
 mov ecx,10
 mov edi,array
   
    input:
        read edi,1
        read whitespace,1
        inc edi
        loop input

write inputMsg, lenInputMsg
read key,1

mov al,[key]
    mov cl,10 ; 10 Elements in the array
    mov dl,0 ; Holds the current index position
    mov esi,array

linear:
        mov bl,[esi]
        cmp al,bl
        jz found
        inc esi
        inc dl
        loop linear
    write notFoundMsg, lenNotFoundMsg
    jmp exit
   
    found:
        write foundMsg, lenFoundMsg
        add dl,'0'
        mov [index],dl
        write index,1
        write space,lenSpace
       
    exit:
        mov eax,1
        int 80h