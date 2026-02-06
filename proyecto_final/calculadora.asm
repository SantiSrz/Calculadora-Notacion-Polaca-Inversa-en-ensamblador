section .data
mensaje db 'Escribe algo: ', 0xa
longitud equ $ - mensaje

section .bss
buffer resb 64

section .text
global _start
    _start:

    mov ecx, mensaje
    mov edx, longitud
    call imprimir_texto

    mov ecx, buffer
    mov edx, 64
    call leer_texto

    mov ecx, buffer
    mov edx, eax
    call imprimir_texto

    mov eax, 1
    mov ebx, 0
    int 0x80

imprimir_texto:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

leer_texto:
    mov eax, 3
    mov ebx, 0
    int 0x80
    ret