 # Reserva de espacio para guardar registros en kdata 
.kdata 
 
contexto:  .word 0,0,0,0  		# espacio para alojar cuatro registros 
 
.ktext 0x80000180    			# Dirección de comienzo de la rutina   
 
 # Guardar registros a utilizar en la rutina.  
 la $k1, contexto  
 sw $at, 0($k1)   			# Guardamos $at  
 sw $t0, 4($k1)  
 sw  $v0, 8($k1)  
 sw $a0, 12($k1) 
 
 #Comprobación de si se trata de una interrupción   
 mfc0 $k0, $13  			# Registro Cause   
 srl $a0, $k0, 2  			# Extraemos campo del código  
 andi $a0, $a0, 0x1f  
 bne $a0, $zero, acabamos 		 # Sólo procesamos aquí E/S 
 
 #Tratamiento de la interrupción   
lui $t0, 0xffff 			#Direccion de registro de control por teclado
lw $v0, 4($t0)   			# Lee carácter del teclado 
sw $v0, 12($t0)   			#Escribe en la consola
 
 acabamos:  
 mtc0 $0, $13				# Iniciar registro Cause  
 mfc0 $k0, $12				# Leer registre Status  
 andi $k0, 0xfffd			# Iniciar bit de excepción  
 ori  $k0, 0x11				# Habilitar interrupciones  
 mtc0 $k0, $12  			# reescribir registre Startus 
 
 # Restaurar registros (menos v0)
  lw $at, 0($k1) 			# Recupero $at  
  lw $t0, 4($k1)  
  lw $a0, 12($k1) 
 
 # Devolver en el programa de usuario 
 eret
 
  .text
 main:
  lui $t0,0xffff  			# Dirige del registro de control   
  lw $t1,0($t0)				# Registre de control del receptor  
  ori $t1,$t1,0x0002  			# Habilitar interrupciones del teclado   
  sw $t1,0($t0)  			# Actualizamos registro de control 
  
  mfc0 $a0, $12  			# leer registre Status  
  ori $a0, 0xff11  			# Habilitar todas las interrupciones  
  mtc0 $a0, $12  			# reescribir el registro status 
  
  beq $v0,'\n',fin			#comprobacion salto de linea
  
  j main
  
  fin:
  li $v0, 10  
  syscall  				# syscall 10 (exit) 
 
