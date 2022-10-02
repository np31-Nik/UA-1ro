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
beqz $t1,fin1			#compara que la condicion se siga cumpliendo

la $a0, intro
li $v0, 4
syscall				#escribe la frase en etiqueta intro

li $v0,5
syscall				#leer numero

move $t2,$v0			#mover numero a t2

sw $t2,0($t3)			#guardar numero en direccion almacenada en t3

addi $t3,$t3,4			#aumenta en 4 bits la direccion en t3

addi $s0,$s0,1			#aumenta el contador

j for1				#salto a inicio for1

fin1:			

li $s0,1			#reinicia el contador
la $t3,num		

ordenar:
sle $t1,$s0,$s1		
beqz $t1,finOrdenar		#compara que la condicion se siga cumpliendo
li $s2,1			#contador 2 para comparar

lw $t4,0($t3)
addi $t7,$t3,0			#t7 es la direccion de registro del numero t4
addi $s0,$s0,1			#aumenta el contador
j comparar
finComparar:
j ordenar

comparar:
sle $t1,$s2,$s1	
beqz $t1,finComparar		#compara que la condicion se siga cumpliendo

addi $t3,$t3,4			
lw $t5,0($t3)
sle $t6,$t4,$t5
beqz $t6,bubble
finbubble:
addi $s2,$s2,1			#aumenta el contador

j comparar

finOrdenar:
li $s0,1			#reinicia el contador
la $t3,num


for2:
sle $t1,$s0,$s1		
beqz $t1,fin2			#compara que la condicion se siga cumpliendo

lw $a0,0($t3)			#carga el numero guardado en direccion t3 a a0
li $v0,1
syscall				#imprime el numero

li $a0,'\n'
li $v0,11
syscall				#salto de linea

addi $t3,$t3,4			#aumenta la direccion en 4
addi $s0,$s0,1			#aumenta el contador

j for2

bubble:
sw $t5,0($t7)			#guardamos el nuevo minimo en la direccion del primero
sw $t4,0($t3)			#guardamos el primer numero en la direccion del nuevo minimo
li $s1,4			#para marcar fin del bucle comparar
j finbubble

fin2:
li $v0,10
syscall				#fin programa



