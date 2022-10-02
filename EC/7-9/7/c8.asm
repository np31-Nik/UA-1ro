.data
matriz: .word 0:16

intr_fila: .asciiz "Introduce fila "
intr_columna: .asciiz " columna "
intr_valor: .asciiz " : "
verificar: .asciiz "Has introducido bien los numeros?"
otra: .asciiz "Quieres hacer otra operacion? y/n : "
suma: .asciiz "Suma de la diagonal: "


.text
li $s1,4				#condicion
li $t3,121				#y en ascii
li $t4,110				#n en ascii
la $t5,verificar

main:
	
	jal reset

escribirFilas:	
	sle $t1,$s0,$s1
	beqz $t1,fin_escribirFilas	#comprobar condicion filas
	li $s2,1			#inicio contador columnas
	
escribirColumnas:
	sle $t1,$s2,$s1
	beqz $t1,fin_escribirColumnas	#comprobar condicion columnas
	
	la $a0,intr_fila
	li $v0,4
	syscall				#print introduce fila
	
	move $a0,$s0
	li $v0,1
	syscall				#print numero fila
	
	la $a0,intr_columna
	li $v0,4
	syscall				#print columna
	
	move $a0,$s2
	li $v0,1
	syscall				#print numero columna
	
	la $a0,intr_valor
	li $v0,4
	syscall				#print dos puntos
		
	li $v0,5
	syscall				#leer numero
		
	sw $v0,0($t2)			#almacena el numero en direccion t2
	
	addi $t2,$t2,4			#aumenta la direccion t2 en 4
	
	addi $s2,$s2,1			#aumento contador columnas
	j escribirColumnas
	
fin_escribirColumnas:
	
	addi $s0,$s0,1			#aumento contador filas
	j escribirFilas
	
fin_escribirFilas:

jal reset

imprimirFilas:
	sle $t1,$s0,$s1
	beqz $t1,fin_imprimirFilas	#comprobar condicion filas
	li $s2,1			#inicio contador columnas
	
imprimirColumnas:
	sle $t1,$s2,$s1
	beqz $t1,fin_imprimirColumnas	#comprobar condicion columnas
	
	
	lw $a0,0($t2)			#almacena el numero en direccion t2 en a0
	
	addi $t2,$t2,4			#aumenta la direccion t2 en 4
	
	li $v0,1
	syscall				#imprime numero
	
	li $a0,32
	li $v0,11
	syscall				#imprime espacio
	
	addi $s2,$s2,1			#aumento contador columnas
	j imprimirColumnas
	
fin_imprimirColumnas:

	li $a0,'\n'
	li $v0,11
	syscall				#imprime salto de linea
	
	addi $s0,$s0,1			#aumento contador filas
	j imprimirFilas
	
fin_imprimirFilas:

jal reset
li $t6,0				#reinicio valor de t6
correcto:
	beq $t6,$t3,fin_correcto	#si y
	beq $t6,$t4,escribirFilas	#si n
	
	move $a0,$t5
	li $v0,4
	syscall				#imprime es correcto?
	
	li $a0,'\n'
	li $v0,11
	syscall				#imprime salto de linea
	
	li $v0,12
	syscall				#lee caracter							
	move $t6,$v0
	
	li $a0,'\n'
	li $v0,11
	syscall				#imprime salto de linea
	
	j correcto
	
fin_correcto:
jal reset
li $t6,0				#reinicio t6 (donde se guarda y/n)
li $t7,0				#inicio suma de la diagonal
diagonal:
	sle $t1,$s0,$s1
	beqz $t1,fin_diagonal		#comprobar condicion diagonal
	lw $a0,0($t2)			#carga numero a a0
	add $t7,$t7,$a0			#suma de cada elemento a t7
	addi $t2,$t2,20			#aumenta la posicion de la matriz en 5
	addi $s0,$s0,1			#incremento contador
	j diagonal
fin_diagonal:
	la $a0,suma
	li $v0,4
	syscall				#print "suma diagonal:"
	
	move $a0,$t7			#mover el resultado de t7 a a0
	li $v0,1		
	syscall				#muestra la suma
	
	li $a0,'\n'
	li $v0,11
	syscall				#imprime salto de linea
	
	jal reset
continuar:
	beq $t6,$t3,fin_continuar	#si y
	beq $t6,$t4,fin_main		#si n
	
	la $a0,otra
	li $v0,4
	syscall				#print "quieres hacer otra operacion"
	
	li $a0,'\n'
	li $v0,11
	syscall				#imprime salto de linea
	
	li $v0,12
	syscall				#lee caracter			
	move $t6,$v0
	
	li $a0,'\n'
	li $v0,11
	syscall				#imprime salto de linea
	j continuar
fin_continuar:

	j main
	
fin_main:
	li $v0,10
	syscall				#fin programa
	
reset:
li $s0,1				#reinicio contador filas
la $t2,matriz				#carga direccion de la matriz en t2
jr $ra
	
