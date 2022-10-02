#Nikita Polyanskiy P550048833
.data
Nums: .space 16		#espacio para 4 words
Introd: .asciiz "Introduce numero "
Puntos: .asciiz " : "
Res: .asciiz "Resultado: "
const2: .float 2
const4: .float 4
.text

li $t0,1		#contador
la $t1,Nums		#direccion para guardar los num

introducir:
la $a0,Introd
li $v0,4
syscall			#"Introduce numero"

move $a0,$t0
li $v0,1
syscall			#imprime 1,2,3,4

addi $t0,$t0,1		#aumento contador

la $a0, Puntos
li $v0,4
syscall			#imprime " : "

li $v0,6
syscall			#lee float

cvt.w.s $f1,$f0		#convierte de precision simple a word
swc1 $f1,($t1)		#almacena en direccion t1
addi $t1,$t1,4		#aumento direccion t1 en 4

beq $t0,5,fin_intro

j introducir

fin_intro:
la $t0,Nums			#direccion de nums

lwc1 $f1,0($t0)		#n1
lwc1 $f2,4($t0)		#n2
lwc1 $f3,8($t0)		#n3
lwc1 $f4,12($t0)	#n4

sub.s $f0,$f1,$f3		#n1-n3


l.s $f5,const2	
div.s $f6,$f0,$f5		#(n1-n3)/2

mul.s $f0,$f2,$f4		#n2*n4

l.s $f5,const4		
div.s $f0,$f0,$f5		#(n2*n4)/4

add.s $f0,$f0,$f6		#((n1-n3)/2) + ((n2*n4)/4)

cvt.w.s $f0,$f0

li $t0,0x10010080
swc1 $f0,($t0)			#se guarda el resultado en la direccion

la $a0,Res
li $v0,4
syscall				#Resultado:

mov.s $f12,$f0
li $v0,2
syscall				#imprime el resultado en float


li $t0,0x10010040

ordenar:
lwc1 $f1,0($t0)		#n1
lwc1 $f2,4($t0)		#n2
lwc1 $f3,8($t0)		#n3
lwc1 $f4,12($t0)	#n4


 c.lt.s $f1,$f2		#f1<f2 (si V entonces flag a 1,sino 0)
 bc1t f1menor		#si flag a 1 entonces 1menor
 bc1f f2menor		#si flag a 0 entonces 2menor

f1menor:
c.lt.s $f1,$f3
 bc1f f3menor		#si flag a 0 entonces 3menor
 c.lt.s $f1,$f4
 bc1f f4menor
 
f2menor:
c.lt.s $f2,$f3

f3menor:

f4menor:

fin_main:
li $v0,10
syscall			#fin programa






