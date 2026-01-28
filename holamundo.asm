section .text
   global _start     ; declarado para el enlazador (linker)
_start:              ; punto de entrada
   mov edx, len      ; longitud del mensaje
   mov ecx, msg      ; mensaje a escribir
   mov ebx, 1        ; descriptor de archivo (stdout)
   mov eax, 4        ; número de llamada al sistema (sys_write)
   int 0x80          ; llamar al kernel

   mov eax, 1        ; número de llamada al sistema (sys_exit)
   int 0x80          ; llamar al kernel

section .data
msg db 'Hello, world!', 0xa  ; nuestra cadena de texto
len equ $ - msg              ; longitud de la cadena