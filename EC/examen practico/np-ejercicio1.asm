.data
introd1: .asciiz "Introduce el primer numero: "
introd2: .asciiz "Introduce el segundo numero: "
space: .word 8	#supuesto espacio para almacenar luego los numeros
simultiplo: .asciiz "El segundo numero es multiplo de 3"
nomultiplo: .asciiz "El segundo numero no es multiplo de 3"
.text

la $a0,introd1
li $v0,4
syscall			#imprime introd primer numero

li $v0,5
syscall			#lee primer numero

move $t0,$v0		#lo almacena en t0

la $a0,introd2
li $v0,4
syscall			#imprime introd segundo numero

li $v0,5
syscall			#lee segundo numero

move $t1,$v0		#lo almacena en t1

li $t2,0x10010020	#direccion de memoria

slt $t3,$t0,$t1		#si t0<t1, t3=1

beqz $t3,menor2		#si t1 es menor, salto

addi $t2,$t2,24		#dni termina en 3+3=6, en palabras 6*4=24
sw $t1,0($t2)		#almaceno el segundo (mayor)

addi $t2,$t2,4		#siguiente posicion
sw $t0,0($t2)		#almaceno el primero (menor) en la siguiente posicion

j invertir

menor2:
addi $t2,$t2,24		#dni termina en 3+3=6, en palabras 6*4=24
sw $t0,0($t2)		#almaceno el primero (mayor)

addi $t2,$t2,4		#siguiente posicion
sw $t1,0($t2)		#almaceno el segundo(menor) en la siguiente posicion

invertir:
xori $t3,$t0,0x1111	#invierte los 16 bits menores

li $t2,0x10010000
sw $t3,0($t2)		#almacena an direccion t2

li $t3,3
div $t1,$t3		#el resto se guarda en hi
mfhi $t4		#muevo hi a t4
beqz $t4,multiplo	#resto=0 ->multiplo

la $a0,nomultiplo
li $v0,4
syscall
j fin

multiplo:
la $a0,simultiplo
li $v0,4
syscall

fin:
li $v0,10
syscall			#fin programa
