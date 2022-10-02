.data
demanaPi :.asciiz "Dame el valor de pi..."
pideRadio:.asciiz "Dame el radio... "
long: .asciiz "Longitud de la circunferència = "
super: .asciiz "Área del círculo = "
.text
li $v0,4
la $a0,demanaPi
syscall
li $v0,6
syscall
mov.s $f1, $f0
li $v0,4
la $a0,pideRadio
syscall
li $v0,6
syscall
li $v0,4
la $a0,long
syscall


mul.s $f2,$f0,$f1		#f2 igual a radio por pi

li $t0,2			#t0=2
mtc1 $t0,$f4			#paso t0 a f4
cvt.s.w $f4,$f4			#convierto el valor en f4 a simple precision

mul.s $f12,$f2,$f4		#f2 por 2

li $v0,2
syscall				#lee float en f12

mul.s $f0,$f0,$f0		#f0 igual a radio por radio
mul.s $f12,$f1,$f0		#f12 igual a radio^2 por pi

li $a0,'\n'
li $v0, 11
syscall				#salto de linea

la $a0,super
li $v0,4
syscall				#imprime cadena super

li $v0,2
syscall				#imprime float en f12

li $v0,10
syscall				#fin programa