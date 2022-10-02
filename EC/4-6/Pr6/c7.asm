.data
#reservamos espacio para los 4 numeros
num: .space 4
num2: .space 4
num3: .space 4
num4: .space 4

intro: .asciiz "Introduce un numero: "


.text


li $s0,1 			#contador for1
li $s1,4			#condicion


la $t3,num			#almacena en t3 la direccion de memoria de la etiqueta

for1:
sle $t1,$s0,$s1		
beqz $t1,fin1		#compara que la condicion se siga cumpliendo

la $a0, intro
li $v0, 4
syscall			#escribe la frase en etiqueta intro

li $v0,5
syscall			#leer numero

move $t2,$v0		#mover numero a t2

sw $t2,0($t3)		#guardar numero en direccion almacenada en t3

addi $t3,$t3,4		#aumenta en 4 bits la direccion en t3

addi $s0,$s0,1		#aumenta el contador

j for1			#salto a inicio for1

fin1:			

li $s0,1			#reinicia el contador
la $t3,num		

for2:
sle $t1,$s0,$s1		
beqz $t1,fin2		#compara que la condicion se siga cumpliendo

lw $a0,0($t3)		#carga el numero guardado en direccion t3 a a0
li $v0,1
syscall			#imprime el numero

li $a0,'\n'
li $v0,11
syscall			#salto de linea

addi $t3,$t3,4		#aumenta la direccion en 4
addi $s0,$s0,1		#aumenta el contador

j for2
fin2:
li $v0,10
syscall			#fin programa
