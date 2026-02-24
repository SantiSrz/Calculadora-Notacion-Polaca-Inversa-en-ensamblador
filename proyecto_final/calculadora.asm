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

    mov ecx, buffer
    mov edx, 64
    call leer_texto

    mov esi, buffer

.bucle_principal:
    mov bl, [esi]
    cmp bl, 0
    je fin
    cmp bl, 0xA
    je fin
    cmp bl, 0x20
    je .saltar_espacio
    
    cmp bl, '0'
    jl .es_operador
    cmp bl, '9'
    jg .es_operador

    call ATOI
    call custom_push
    jmp .bucle_principal

.saltar_espacio:
    inc esi
    jmp .bucle_principal

.es_operador:
    cmp bl, '+'
    je .hacer_suma
    
    cmp bl, '-'
    je .hacer_resta

    inc esi
    jmp .bucle_principal

.hacer_suma:
    call custom_pop
    mov ebx, eax  
    
    call custom_pop
    add eax, ebx
    
    call custom_push
    inc esi
    jmp .bucle_principal

.hacer_resta:
    call custom_pop
    mov ebx, eax
    
    call custom_pop
    sub eax, ebx
    
    call custom_push
    inc esi 
    jmp .bucle_principal

fin:
    call custom_pop 
    call ITOA

    mov eax, 1
    mov ebx, 0
    int 0x80