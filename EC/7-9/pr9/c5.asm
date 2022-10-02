.data
Xpide: .asciiz "X = "
Npide: .asciiz "n = "
powRes: .asciiz "X^n = "

.text
la $a0, Xpide
li $v0,4
syscall				#imprime "x="

li $v0,6
syscall				#pide x como float

la $a0, Npide
li $v0,4
syscall				#imprime "n="

li $v0,5
syscall				#pide n como entero

mov.s $f12,$f0			#pasa x a f12
move $a0,$v0			#pasa n a a0

jal pow				#llama a funcion

la $a0,powRes			
li $v0,4
syscall				#imprime "x^n="

mov.s $f12,$f0
li $v0,2
syscall				#imprime x^n

li $v0,10
syscall				#fin programa

 pow:
 
li $t0, 1			#valor inicial del resultado es 1, en caso de que la potencia es 0

mtc1 $t0,$f2			#pasar t0 a f2

cvt.s.w $f2,$f2			#conversion a float

move $s0,$a0			#condicion de finaliacion, contador=n

addi $s1,$s1,0			#inicio contador

mult:
slt $t1,$s1,$s0
beqz $t1,fin_mult		#comprobar condicion

mul.s $f2,$f2,$f0		#f2(resultado) * X

addi $s1,$s1,1			#incremento contador
j mult
fin_mult:
mov.s $f0,$f2			#mueve el resultado a f0
jr $ra				#volver a jal pow
