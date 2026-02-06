section .data
mensaje db 'Escribe el numero: ', 0xa
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

    mov esi, buffer
    call ATOII
    mov ebx, eax

    mov eax, 1

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

ATOII:
    mov eax, 0
    bucle:
        mov ebx, 0
        mov bl, [esi]
        cmp bl, 0
        je fin
        cmp bl, 0xA
        je fin
        cmp bl, 0x20
        je fin
        sub bl, '0'
        mov ecx, 10
        mul ecx
        add eax, ebx
        inc esi
        jmp bucle
    fin:
        ret