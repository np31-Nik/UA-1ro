.data 

cadena: .space 32 
	.eqv ControlTeclado 0  
	.eqv BufferTeclado 4  
	.eqv ControlDisplay 8  
	.eqv BufferDisplay 12 
 
.text    

	la $a0,cadena  
	jal read_string  
	la $a0,cadena 
	jal print_string    
   
	li $v0,10  
	syscall 

print_string:  
	la $t0,0xFFFF0000 
sync: 
	lw $t1, ControlDisplay($t0)  
	andi $t1,$t1,1  
	beqz $t1,sync 

	lbu $t1,0($a0)  
	beqz $t1,final  
	sw $t1, BufferDisplay($t0)  
	addi $a0,$a0,1  
	j sync 

final:  
	jr $ra  
 
read_string: 
	la $t0, 0xffff0000			#direccion de registro de control por teclado
	li $t3,0				
	
sync_read:
	lw $t1,ControlTeclado($t0)		#lee registro
	andi $t1,$t1,1				#extrae bit ready
	
	beqz $t1,sync_read			#si ready==0, entra en bucle

	lw $t2,BufferTeclado($t0)		#carga datos a t2
	sb $t2,cadena($t3)			#almacena t2 en cadena,posicion t3
	
	addi $t3,$t3,1				#aumenta la posicion en 1
	
	beq $t2,'\n',fin_read			#comprueba que el ultimo caracter sea \n
	
	j sync_read
	
fin_read:
	jr $ra
	

	