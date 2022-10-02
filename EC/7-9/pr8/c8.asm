.data 
 array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  
 long: .word 10  
 suma: .word 0 
 res: .asciiz "Valor medio: "
 .text
 la $t4,array				#direccion array
 
 li $s0,1				#inicio contador
 li $s1,10				#condicion
 li $t2,0				#suma
 for_suma:
 	sle $t1,$s0,$s1
	beqz $t1,fin_suma		#comprobar condicion
	
	lw $t3,0($t4)			#carga numero del array
	add $t2,$t2,$t3			#se lo suma a t2
	
	addi $t4,$t4,4			#aumenta la direccion en 4
	
	addi $s0,$s0,1			#incremento contador
	j for_suma
	
fin_suma:
	mtc1 $s1,$f0			#cantidad
	mtc1 $t2,$f2			#suma
	div.s $f12,$f2,$f0		#suma/cantidad en $f12
	
	la $a0,res
	li $v0,4
	syscall				#imprime Valor Medio:
	
	li $v0,2
	syscall				#imprime float en f12
	
	li $v0,10
	syscall				#fin programa