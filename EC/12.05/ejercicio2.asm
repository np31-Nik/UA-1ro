.data
pedir: .asciiz "Introduce un numero: "
signo: .asciiz "Signo: "
mantisa: .asciiz "Mantisa: "
exp: .asciiz "Exponente: "
float: .word 
.text

la $a0,pedir
li $v0,4
syscall		#introduce un num

li $v0,6
syscall 	#lee float, se guarda en f0

la $t0,float

cvt.w.s $f1,$f0
swc1 $t0,$f1

addi $t0,$t0,4
load:
lb $t1,0($t0)

la $a0,signo
li $v0,4
syscall

rol $t1,$t1,1
andi $t2,$t1,1
beq $t2,1,nega

la $a0,'+'
li $v0,11
syscall
j mant

nega:
la $a0,'-'
li $v0,11
syscall

