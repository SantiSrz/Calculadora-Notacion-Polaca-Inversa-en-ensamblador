section .data
    mensaje db 'Debe salir 20 y luego 10 -> ', 0xa
    longitud equ $ - mensaje

section .bss
    buffer resb 64
    stack_data resd 256
    stack_ptr resd 1

section .text
global _start

_start:
    mov ecx, mensaje
    mov edx, longitud
    call imprimir_texto

    mov eax, 10
    call custom_push

    mov eax, 20
    call custom_push

    call custom_pop
    call ITOA

    call custom_pop
    call ITOA

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

ATOI:
    mov eax, 0
.bucle_atoi:
    mov ebx, 0
    mov bl, [esi]
    cmp bl, 0
    je .fin_atoi
    cmp bl, 0xA
    je .fin_atoi
    cmp bl, 0x20
    je .fin_atoi
    sub bl, '0'
    mov ecx, 10
    mul ecx
    add eax, ebx
    inc esi
    jmp .bucle_atoi
.fin_atoi:
    ret

ITOA:
    mov ecx, 0
    mov ebx, 10
.bucle_division:
    mov edx, 0
    div ebx
    add edx, '0'
    push edx
    inc ecx
    cmp eax, 0
    jne .bucle_division
    mov edi, buffer
.bucle_print:
    pop eax
    mov [edi], al
    inc edi
    loop .bucle_print
    mov byte [edi], 0xA
    inc edi
    sub edi, buffer
    mov edx, edi
    mov ecx, buffer
    call imprimir_texto
    ret

custom_push:
    mov edi, [stack_ptr]
    mov [stack_data + edi], eax
    add edi, 4
    mov [stack_ptr], edi
    ret

custom_pop:
    mov edi, [stack_ptr]
    sub edi, 4
    mov eax, [stack_data + edi]
    mov [stack_ptr], edi
    ret