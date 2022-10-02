 # Reserva de espacio para guardar registros en kdata 
.kdata 
 
contexto:  .word 0,0,0,0,0,0,0  		# espacio para alojar cuatro registros 
error_t: .asciiz "\n ATENCION:Interrupcion por teclado \n \n"
error_d: .asciiz "\n ATENCION: Excepcion por direccion erronea (Numero 4) \n \n"
error_a: .asciiz "\n ATENCION: Excepcion por desbordamiento aritmetico \n \n"

.ktext 0x80000180    			# Dirección de comienzo de la rutina   

 # Guardar registros a utilizar en la rutina.  
 la $k1, contexto  
 sw $at, 0($k1)   			# Guardamos $at  
 sw $t0, 4($k1)  
 sw  $v0, 8($k1)  
 sw $a0, 12($k1) 
 sw $t1,16($k1)
 sw $t2,20($k1)
 sw $t3,24($k1)
 
 #Cargar mensajes de error
 la $t1, error_t
 la $t2, error_d
 la $t3, error_a
 #Comprobación de si se trata de una interrupción   
 mfc0 $k0, $13  			# Registro Cause   
 
 beq $k0, 256,teclado			#Interrupcion por teclado

 

 beq $k0, 16,direccion		#Excepcion por direccion erronea (4)
 

 beq $k0, 48, desbord 			#desbordamiento aritmetico
 
 j acabamos
 
  #Tratamiento de la interrupción   
 teclado:
 
move $a0,$t1
li $v0,4
syscall
lui $t0, 0xffff 			#Direccion de registro de control por teclado
lw $v0, 4($t0)   			# Lee carácter del teclado 
 j acabamos

direccion:
move $a0,$t2
li $v0,4
syscall
mfc0 $k0, $14 # $k0 <= EPC  
addiu $k0, $k0, 4 # Incremento de $k0 en 4  
mtc0 $k0, $14  # Ahora EPC apunta a la siguiente instrucción 
j acabamos

desbord:
move $a0,$t3
li $v0,4
syscall
mfc0 $k0, $14 # $k0 <= EPC  
addiu $k0, $k0, 4 # Incremento de $k0 en 4  
mtc0 $k0, $14  # Ahora EPC apunta a la siguiente instrucción 
 j acabamos
 acabamos:  

 
 # Restaurar registros (menos v0)
 
  lw $at, 0($k1) 			# Recupero $at  
  lw $t0, 4($k1)  
  lw $a0, 12($k1) 
  lw $t1, 16($k1) 
  lw $t2, 20($k1) 
  lw $t3, 24($k1) 
        
 # Devolver en el programa de usuario siguiente instruccion

 eret
 
 .data 
 elige_1: .asciiz "1-Teclado (entra en bucle hasta detectar interrupcion por teclado)\n"
 elige_2: .asciiz "2-Direccion erronea \n"
 elige_3: .asciiz "3-Desbordamiento aritmetico\n"
 elige_4: .asciiz "4-Salir\n"
 elige: .asciiz "Elige la excepcion a probar(1-4): "
 vector: .word 1, 3, 5, 7, 11, 13
 
  .text
  
 main:
  la $t1,elige_1
  la $t2,elige_2
  la $t3,elige_3
  la $t4,elige_4
  la $t5,elige
  #Imprime el menu:
  move $a0,$t1
  li $v0,4
  syscall
  
  move $a0,$t2
  li $v0,4
  syscall
  
  move $a0,$t3
  li $v0,4
  syscall
  
  move $a0,$t4
  li $v0,4
  syscall
  
  move $a0,$t5
  li $v0,4
  syscall
  
  li $v0,5
  syscall				#Elige el nº de opcion
  
  
  lui $t0,0xffff  			# Dirige del registro de control   
  lw $t1,0($t0)				# Registre de control del receptor  
  ori $t1,$t1,0x0002  			# Habilitar interrupciones del teclado   
  sw $t1,0($t0)  			# Actualizamos registro de control 
  
  mfc0 $a0, $12  			# leer registre Status  
  ori $a0, 0xff11  			# Habilitar todas las interrupciones  
  mtc0 $a0, $12  			# reescribir el registro status 
  
  beq $v0,1,test_teclado
  beq $v0,2,test_direccion
  beq $v0,3,test_desbord
  beq $v0,4,fin
  
  j main
  
  test_teclado:
   lui $t0,0xffff  			# Dirige del registro de control   
  lw $t1,0($t0)				# Registre de control del receptor  
  ori $t1,$t1,0x0002  			# Habilitar interrupciones del teclado   
  sw $t1,0($t0)  			# Actualizamos registro de control 
  
  mfc0 $a0, $12  			# leer registre Status  
  ori $a0, 0xff11  			# Habilitar todas las interrupciones  
  mtc0 $a0, $12  			# reescribir el registro status 
  beq $v0,'\n',main			#comprobacion salto de linea
  j test_teclado
  
  test_direccion:
  la $t0, vector   
  lw $t0, 3($t0) 
  j main
  
  test_desbord:
  li $t1, 0x7FFFFFFF    
  addiu $t2, $t1,1 #Se ignora el desbordamiento   
  addi $t3, $t1, 1 #Detecta el desbordamiento
  j main
   
  fin:
  li $v0, 10  
  syscall  				# syscall 10 (exit) 
 
