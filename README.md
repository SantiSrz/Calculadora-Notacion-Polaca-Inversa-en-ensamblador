# Calculadora-Notacion-Polaca-Inversa
https://github.com/SantiSrz/Calculadora-Notacion-Polaca-Inversa.git

¿Qué tiene de especial este proyecto?

Para que esto funcione de forma estable, he tenido que programar desde cero varias herramientas clave:
    -Pila Personalizada (Custom Stack): En lugar de usar la pila del sistema (ESP) —y arriesgarme a corromper el flujo del programa con un Segmentation Fault—, construí una estructura de datos LIFO propia gestionada con un puntero (stack_ptr) en la sección .  bss.
    -ATOI & ITOA Propios: Funciones caseras para convertir texto ASCII a enteros y viceversa, controlando la multiplicación/división por 10.
    -Soporte para Números Negativos: La calculadora es capaz de distinguir cuándo un guion (-) es el operador de resta y cuándo indica un número negativo (ej. -3), aplicando Complemento a 2 (NEG) internamente.
    -Matemáticas con Signo: Uso de imul e idiv (con extensión de signo mediante cdq) para que las multiplicaciones y divisiones manejen correctamente la polaridad matemática.
    -Parser (Analizador Sintáctico): Un bucle principal que recorre el texto introducido byte a byte usando punteros (ESI), ignorando espacios y tomando decisiones de salto condicional según el carácter.

¿Cómo probarla?

Necesitarás un entorno Linux con NASM instalado.
Clona el repositorio:Bashgit clone https://github.com/TU_USUARIO/Calculadora-Notacion-Polaca-Inversa-en-ensamblador.git
cd Calculadora-Notacion-Polaca-Inversa-en-ensamblador
como hay un makefile, escribe make para compilar y enlazar
Ejecuta la máquina: ./calculadora

¿Cómo funciona la Notación Polaca Inversa (RPN)?

Si nunca has usado una calculadora RPN (como las clásicas de HP), la regla es: primero los números, luego el operador.
En lugar de escribir 5 + 3, escribes 5 3 +. 
La ventaja es que no necesitas usar paréntesis para operaciones complejas.
Ejemplos de uso:
                Suma básica: * Entrada: 5 3 +Resultado: 8
                Resta con resultado negativo: * Entrada: 10 20 - Resultado: -10
                Operaciones encadenadas (5 * (5 + 3)): * Entrada: 5 5 3 + * Resultado: 40
                Usando números negativos: * Entrada: 5 -3 + Resultado: 2
