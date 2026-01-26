section .data
    msg db "Calculadora RPN arrancando...", 0xA
    len equ $ - msg

section .text
    global _start

_start:
    ; Syscall write
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    ; Syscall exit
    mov rax, 60
    xor rdi, rdi
    syscall