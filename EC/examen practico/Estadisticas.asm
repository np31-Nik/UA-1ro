#Nikita Polyanskiy P550048833
.data
Introd: .asciiz "Introduce cadena(3-30): "
Otra: .asciiz "Quieres introducir otra cadena? (y/n): "
Long: .asciiz "Longitud: "
Voc: .asciiz "Vocales(may/min): "
Con: .asciiz "Consonantes(may): "
Inv: .asciiz "Cadena no valida!"
string: .byte 30

.text
main:
la $a0,Introd
li $v0,4
syscall			#imprime introduce cadena

la $a0,string		#dir string
li $a1, 30		#max char
li $v0,8
syscall			#lee cadena

la $t0,string

li $t2,0		#contador vocal
li $t3,0		#contador cons

contar:
lb   $t1,0($t0)
beq  $t1,$zero,fin_cont	#si el caracter es vacio, fin

addi $t0 $t0 1		#cuenta nº bytes

#Vocales:
beq $t1,65,vocal
beq $t1,69,vocal
beq $t1,73,vocal
beq $t1,79,vocal
beq $t1,85,vocal	#mayusc

beq $t1,97,vocal
beq $t1,101,vocal
beq $t1,105,vocal
beq $t1,111,vocal
beq $t1,117,vocal	#minusc

#consonantes (MAY):
beq $t1,66,consonante
beq $t1,67,consonante
beq $t1,68,consonante
beq $t1,70,consonante
beq $t1,71,consonante
beq $t1,72,consonante
beq $t1,74,consonante
beq $t1,75,consonante
beq $t1,76,consonante
beq $t1,77,consonante
beq $t1,78,consonante
beq $t1,80,consonante
beq $t1,81,consonante
beq $t1,82,consonante
beq $t1,83,consonante
beq $t1,84,consonante
beq $t1,86,consonante
beq $t1,87,consonante
beq $t1,88,consonante
beq $t1,89,consonante
beq $t1,90,consonante

j contar

vocal:
addi $t2,$t2,1		#+1 al contador
j contar

consonante:
addi $t3,$t3,1		#+1 al contador
j contar


fin_cont:
la $t1 string
sub $t4,$t0,$t1 	#fin cadena - inicio cadena = longitud (t4)

li $t6,3		#min longitud cadena

slt $t5,$t4,$t6
beq $t5,1,invalid	#si long<3, salto a invalida

la $a0,Long
li $v0,4
syscall			#longitud:

move $a0,$t4
li $v0,1
syscall			#imprime la longitud

li $a0,'\n'
li $v0,11
syscall			 #salto de linea

la $a0,Voc
li $v0,4
syscall			#vocales:

move $a0,$t2
li $v0,1
syscall			#imprime nº vocales

li $a0,'\n'
li $v0,11
syscall			 #salto de linea

la $a0,Con
li $v0,4
syscall			#Consonantes:

move $a0,$t3
li $v0,1
syscall			#imprime nº consonantes

li $a0,'\n'
li $v0,11
syscall			 #salto de linea

li $t1,121		#ascii y
li $t2,110		#ascii n

confirm:
la $a0,Otra
li $v0,4
syscall			#Otra cadena?

li $v0,12
syscall			#lee char

move $t0,$v0

li $a0,'\n'
li $v0,11
syscall			 #salto de linea

beq $t0,$t1,main	#y = vuelve al inicio del main
beq $t0,$t2,fin_main	#n = fin

j confirm		#otro char -> vuelve a pedir y/n

invalid:
la $a0,Inv
li $v0,4
syscall			#Cadena no valida!

li $a0,'\n'
li $v0,11
syscall			 #salto de linea

j main

fin_main:
li $v0,10
syscall			#fin programa