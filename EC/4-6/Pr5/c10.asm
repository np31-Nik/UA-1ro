.text

li $v0,5
syscall				#leer numero A

move $t0,$v0			#mover num A a t0

li $v0,5
syscall				#leer numero B

move $t1,$v0			#mover num B a t1
	

bucle:				#inicio bucle

sle $t2,$t0,$t1			
beqz $t2,fin			#comprueba que t0(A) es menoro igual que t1(B), sino va a fin

move $a0,$t0			#mover num A a a0

li $v0,1			
syscall				#mostrar siguiente valor

li $a0,' '
li $v0,11			
syscall				#escribe un espacio en blanco

addi $t0,$t0,1			#sumar 1 a num A

j bucle				#salto a inicio de bucle

fin:				#fin programa

