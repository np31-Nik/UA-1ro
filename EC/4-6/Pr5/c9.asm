.text

start:			#comienzo bucle

li $v0,5
syscall			#leer numero A

move $t0,$v0		#mover numero A a registro v0

li $v0,5
syscall			#leer numero B

add $a0,$v0,$t0		#sumar A y B

move $t1,$a0		#mover la suma a t1 para guardar el valor

li $v0, 1
syscall			#mostrar suma

li $a0,'\n'
li $v0,11
syscall			#salto de linea

beq $t1,$zero,end	#si suma es igual a cero fin de bucle

j start			#volver al principio del bucle

end:			#fin de programa