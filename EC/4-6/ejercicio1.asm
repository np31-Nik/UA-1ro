.data
Intr_num: .asciiz "Introduce un numero: "

.text

la $a0,Intr_num

li $v0,4
syscall				#Introduce un numero:

li $v0,5
syscall				#lee entero1

move $t1,$v0			#mueve entero 1 a t1

li $v0,4
syscall				#Introduce un numero:

li $v0,5
syscall				#lee entero2

move $t2,$v0			#mueve entero 2 a t2

sw $t1,0x10010004		#almacena cada entero en las direcciones pedidas
sw $t2,0x1001000C

slt $t0,$t1,$t2			#t1<t2 -> t0=1

beq $t0,1,menor1		#si t1<t2, salto a menor1

sw $t2,0x10010014		#sino, almacena entero 2

j multiplicar

menor1:
sw $t1,0x10010014		#almacena entero 1

multiplicar:			#x30
sll $t0,$t1,5
sub $t0,$t0,$t1
sub $t0,$t0,$t1

sb $t0,0x10010005		#almacenar en direccion

li $t3, 0x11111111		
xor $t0,$t2,$t3			#invertir
sb $t0,0x1001000D		#almacenar en direccion

li $v0,10
syscall				#fin programa

