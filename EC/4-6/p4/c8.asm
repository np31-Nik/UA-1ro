.text
li $a0,'>'
li $v0,11
syscall
li $v0,5
syscall

move $a0,$v0
jal mult60
move $a0,$v0
jal imprim
li $v0,10
syscall

imprim:	addi $v0,$0,1
	syscall
	li $a0,'\n'
	li $v0,11
	syscall
	jr $ra
	
mult60:	sll $v0,$a0,6
	sub $v0,$v0,$a0
	sub $v0,$v0,$a0
	sub $v0,$v0,$a0
	sub $v0,$v0,$a0

	jr $ra
