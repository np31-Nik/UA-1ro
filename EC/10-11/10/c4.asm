.text  
main:     
	li $t3,'\n'		#caracter salto de linea
	
	jal getc  		#lee caracter por teclado
	
	move $s0, $v0		#mueve el caracter guardado a s0 para comparar condicion de echo
	
	beq $s0,$t3,end		#comprueba si el caracter es salto de linea para terminar el programa
	
	move $a0, $v0  		#mueve el caracter guardado a a0 para escribirlo

	subi $a0,$a0,32		#trasnformo caracter a mayuscula
	
	jal putc    		#escribe el caracter por teclado
	
	j main			#vuelve al principio del programa

getc:

	lui $t0, 0xffff 	#Direccion de registro de control por teclado
	li $t1, 0   		#Iniciar contador de espera
 
	b_espera_g:   
	lw $t2, ($t0)     	#Lee registro control del teclado      
  
	andi $t2, $t2, 1 	#Extrae el bit de ready     
	addiu $t1, $t1, 1  	#Incrementa el contador       
  				#(cuenta las iteraciones)  
  			
	beqz $t2, b_espera_g	#Si !=0 entonces se ha detectado caracter   
   			  
	lw $v0, 4($t0)   	#Lee registro de datos del teclado         
				#caracter guardado en $v0 
			
	jr $ra			#vuelve al programa principal
 putc:
 	lui $t0, 0xffff 	#Direccion de registro de control por teclado
 
	b_espera_p:   
	
	lw $t1, 8($t0)     	#Lee registro control del teclado      
  
	andi $t1, $t1, 0x0001 	#Extrae el bit de ready     
  			
	beqz $t1, b_espera_p	#Si =0 entonces sigue esperando  
   			  
	sw $a0, 12($t0)   	#Escribe en la consola
			
	jr $ra			#vuelve al programa principal
	
end:       

	li $v0,10      
	syscall			#fin programa
 