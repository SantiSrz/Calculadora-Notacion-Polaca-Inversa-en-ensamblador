# Calculadora-Notacion-Polaca-Inversa
https://github.com/SantiSrz/Calculadora-Notacion-Polaca-Inversa.git

ls -> Comprueba que los archivos están ahí
make -> Compila
./Nombre_del_archivo -> Ejecuta
clear -> limpia la terminal

Ensamblar: Ejecuta el comando -> nasm -f elf Nombre_del_Archivo.asm | Si hay errores, te los mostrará aquí; si no, creará un archivo objeto llamado Nombre_del_Archivo.o.
Enlazar: Convierte el archivo objeto en un ejecutable con el comando -> ld -m elf_i386 -s -o Nombre_del_Archivo Nombre_del_Archivo.o
Ejecutar: Corre tu programa escribiendo ./Nombre_del_Archivo en la terminal.
Mostrar Ultimo Resultado: echo $? (se mostrara unicamente lo ultimo que hayas ejecutado)

para cerrar issues:
git add .
git commit -m "Nombre_del_issue"
git push
