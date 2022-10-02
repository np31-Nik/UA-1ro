####################################
# #
# Código ejemplo de la actividad 3 #
# Imprimir matriz transpuesta #
# #
####################################
 .data
#Definimos matriz 3x3 bytes
 matriz: .byte 122, 4, 7,
 2, 5, 8
 3, 6, 9
 columnas: .word 3 # Número de columnas
 .text
 la $t0, matriz
 lw $t3, columnas
 li $t2, 0 #iniciamos índice para recorrer matriz
 bucle:
lb $t1, 0($t0) #Fila 0
move $a0, $t1
jal imprimir
lb $t1, 3($t0) #Fila 1 (1*3elementos)
move $a0, $t1
jal imprimir
lb $t1, 6($t0) #Fila 2 (2*3elementos)
move $a0, $t1
jal imprimir
jal nuevalin
 addi $t2, $t2, 1 # incremento índice
addi $t0, $t0, 1 #nueva columna
bne $t2, $t3, bucle
 li, $v0, 10 #Acaba el programa
 syscall
####################################
# Funcions #

 imprimir: #Función imprimir
li, $v0, 1
syscall
li $a0, '\t'
li $v0, 11
syscall
jr $ra #Retorno de la función
nuevalin: #Función nueva línea
li $a0,'\n'
li, $v0, 11
syscall
jr $ra #Retorno de la función