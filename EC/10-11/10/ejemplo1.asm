	lui $t0, 0xffff 	#Direccion de registro de control por teclado
 	
	b_espera_p:   
		lw $t1, 8($t0)     	#Lee registro control del teclado      
  
		andi $t1, $t1, 0x0001 	#Extrae el bit de ready     
  			
		beq $t1, $0,b_espera_p	#Si !=0 se ha detectado caracter   
   			  
	sw $a0, 12($t0)   	#Lee registro de datos del teclado         
				#caracter guardado en $v0 
			