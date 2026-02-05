# --- VARIABLES ---
ASM = nasm
LD = ld
ASM_FLAGS = -f elf -g
LD_FLAGS = -m elf_i386
# Definimos la carpeta donde está el código para no escribirla todo el rato
DIR = proyecto_final

# --- REGLA PRINCIPAL ---
all: calculadora

# --- PASO FINAL: ENLAZAR ---
# El ejecutable 'calculadora' se creará FUERA (en la raíz).
# Depende del objeto que se creará DENTRO de la carpeta.
calculadora: $(DIR)/calculadora.o
	$(LD) $(LD_FLAGS) -o calculadora $(DIR)/calculadora.o

# --- PASO INTERMEDIO: COMPILAR ---
# Le decimos: Para crear el .o dentro de la carpeta...
# Necesitas el .asm que está dentro de la carpeta.
$(DIR)/calculadora.o: $(DIR)/calculadora.asm
	$(ASM) $(ASM_FLAGS) $(DIR)/calculadora.asm -o $(DIR)/calculadora.o

# --- LIMPIEZA ---
# Borra el ejecutable de fuera y el .o de dentro
clean:
	rm -f calculadora $(DIR)/*.o