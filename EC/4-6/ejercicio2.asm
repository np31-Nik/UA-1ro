.data
introd: .asciiz "Introduce un numero (<256): "
.text
la $a0,introd

li $v0,4
syscall			#Introduce un numero:

li $v0,5
syscall			#pide entero

move $t0,$v0		#entero a t0

li $t1,0		#inicio contador	
beq $t0,$t1,fin_suma	#si entero=0, fin

li $t3,0x1001000D	#direccion de guardado

addi $t1,$t1,1		#primer numero impar

suma:
move $a0,$t1		#mover t1 a a0
li $v0,1
syscall			#imprimir numero
sb $a0,0($t3)		#guardar numero

li $a0,'\n'
li $v0,11
syscall			#salto de linea

addi $t1,$t1,2		#aumenta el numero en 2
addi $t3,$t3,1		#aumenta direccion en 1

sle $t2,$t1,$t0		#si numero >= t0, fin
beq $t2,1,suma		#sino salto a suma

fin_suma:
li $v0,10
syscall			#fin programa