section .bss
buffer resb 64

section .text
global _start
    _start:
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 64
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80