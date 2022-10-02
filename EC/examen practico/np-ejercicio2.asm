.data
.space 12	#espacio para guardar el numero en 0x10010008 sin interrumpir las cadenas
introd: .asciiz "Introduce un numero: "
octal: .asciiz "En octal es (Leyendo de derecha a izquierda): "
.text
la $a0,introd
li $v0,4
syscall			#imprime "introduce un numero"

li $v0,5
syscall			#lee numero entero

move $t0,$v0		#mueve el numero a t0

#mi dni termina en 8833, la suma es 22

sll $t1,$t0,4
add $t1,$t1,$t0
add $t1,$t1,$t0
add $t1,$t1,$t0
add $t1,$t1,$t0
add $t1,$t1,$t0
add $t1,$t1,$t0
			#multiplica el numero por 22 y lo guarda en t1
li $t2,0x10010008
sw $t1,0($t2)

li $t2,1
li $t6,10

ToOctal:

div $t1,$t1,8		#divide el numero decimal por 8
mfhi $t3		#obtiene el resto
mult $t3,$t2		#lo multiplica por multiplos de 10
mflo $t4
add $t5,$t5,$t4		#lo suma al total y lo guarda
mult $t2,$t6		#aumenta t2 x 10
mflo $t2		
beqz $t1, imprimir1		#si t1=0, fin

j ToOctal
#numero octal guardado en t5
imprimir1:
la $a0,octal
li $v0,4
syscall			#imprime "en octal es:" 

imprimir:
div $t5,$t5,10		#divide el numero entre 10
mfhi $t3		#obtiene el resto

addi $a0,$t3,48
li $v0,11
syscall			#imprime caracter

beqz $t5,fin
j imprimir

fin:
li $v0,10
syscall			#fin programa
