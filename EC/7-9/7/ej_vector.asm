#Nikita Polyanskiy P550048833

.data
.space 4		#espacio para que los numeros sean almacenados en 0x10010004
nums: .byte 0:4		#vector de 4 numeros entre 0 y 255 (2bytes cada uno)
.space 24		#espacio para que el vector empieze por 0x10010020
vec: .word 0:4		#vector de 4 palabras
solicita: .asciiz "Introduce un numero: "
media_aritmetica: .asciiz "Media artimetica: "

.text

li $s0,1		#inicializar contador
li $s1,4		#condicion fin de bucle
la $t1, nums		#posicion donde se almacenaran los numeros
li $t2,0		#registro donde se almacenaran los numeros
la $t5, solicita

leer:
sle $t0,$s0,$s1
beqz $t0,fin_leer	#comprueba condicion del bucle

move $a0,$t5
li $v0,4
syscall			#escribe la cadena "introduce numero"

li $v0,5
syscall			#leer numero
add $t2,$t2,$v0		#almacenar nuevo numero en t2
ror $t2,$t2,8		#desplazamiento circular de 1 byte


addi $s0,$s0,1		#incremento contador
j leer

fin_leer:

sw $t2,0($t1)		#almacenar los numeros en posicion de $t1

li $s0,1		#reinicio contador
la $t3,vec		#posicion del vector

extraer:
sle $t0,$s0,$s1
beqz $t0,fin_extraer	#comprueba condicion del bucle

sll $t4,$t2,24		#desplazamiento 3 numeros a la izquierda
srl $t4,$t4,24		#desplazamiento 3 numeros a la derecha
			#con estas 2 instrucciones quitamos todos los numeros menos uno
		
sw $t4,0($t3)		#guardamos el numero en el vector

srl $t2,$t2,8		#quitamos ese numero del registro t2, donde estan los 4 numeros

addi $t3,$t3,4		#aumentamos posicion del vector a la siguiente palabra

addi $s0,$s0,1		#incremento del contador
j extraer
fin_extraer:

li $s0,1		#reinicio del contador
la $t3,vec		#volvemos a carga la posicion del vector
li $t6,0		#iniciamos t6 a 0 (por si se ha utilizado antes)

suma_media:
sle $t0,$s0,$s1
beqz $t0,fin_media	#comprueba condicion del bucle

lw $t5,0($t3)		#carga un numero del vector a t5

add $t6,$t6,$t5		#suma el numero a t6

addi $t3,$t3,4		#aumento de posicion del vector

addi $s0,$s0,1		#incremento contador

j suma_media
fin_media:

la $a0,media_aritmetica
li $v0,4
syscall			#imprimimos cadena "Media artimetica:"

srl $a0,$t6,2		#se divide la suma por 4 utilizando la instruccion de desplazamiento

li $v0,1
syscall			#imprime el resultado

li $v0,10
syscall			#fin programa



