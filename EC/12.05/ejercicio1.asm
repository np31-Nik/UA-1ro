.data
Introd: .asciiz "Escribe una cadena (4-20 chars): "
Caract: .asciiz "Introduce el caracter a buscar en la cadena: "
Invalid: .asciiz "Cadena invalida!"
Confirm: .asciiz "Caracter: "
Confirm2: .asciiz "Es correcto? [y/n]: "
Cantidad: .asciiz "Nº de veces que aparece: "

string: .byte 20

.text
main:
la $a0,Introd
li $v0,4
syscall			#Escribe una cadena

la $a0,string
li $a1,21
li $v0,8
syscall			#Pide la cadena, max 20 chars

la $t0 string		#carga direccion de cadena

contar:
lb   $t1,0($t0)
beq  $t1,$zero,fin_cont	#si el caracter es vacio, fin

addi $t0 $t0 1		#cuenta nº bytes
j contar

fin_cont:

la $t1 string
sub $t3,$t0,$t1 	#fin cadena - inicio cadena = longitud t3

li $t4,4		#minimo 4

slt $t2,$t4,$t3		#si t3<4
beqz $t2,invalido
j pedir

invalido:
la $a0,Invalid
li $v0, 4
syscall			#cadena invalida
j main			#vuelve al inicio

pedir:
la $a0, Caract
li $v0,4
syscall			#introduce caracter

li $v0,12
syscall			#lee caracter

move $t0,$v0

li $t1,121		#ascii y
li $t2,110		#ascii n

la $a0,Confirm
li $v0,4
syscall			#Caracter:

move $a0,$t0

li $v0,11
syscall			#imprime char

li $a0,'\n'
li $v0,11
syscall			 #salto de linea
verif:
la $a0,Confirm2
li $v0,4
syscall 		#corecto?



li $v0,12
syscall			#lee y/n

move $t3,$v0

li $a0,'\n'
li $v0,11
syscall			 #salto de linea

beq $t3,$t1,buscar	#y = buscar el char
beq $t3,$t2,pedir	#n = vuelve a pedir

j verif

buscar:
la $t1 string		#carga direccion de cadena
li $t2,0		#contador

buscar2:
lb   $t3,0($t1)
addi $t1,$t1,1
beq  $t3,$zero,fin_busq	#si el caracter es vacio, fin
beq  $t3,$t0,addcount
j buscar2
addcount:
addi $t2,$t2,1
j buscar2

fin_busq:
la $a0,Cantidad
li $v0,4
syscall

move $a0,$t2

li $v0,1
syscall

fin_main:
li $v0,10
syscall			#fin programa