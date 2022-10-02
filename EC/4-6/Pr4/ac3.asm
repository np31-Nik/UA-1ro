.text
li $a0,'>'
li $v0,11
syscall
li $v0,5
syscall

move $a0,$v0
jal mult4
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
	
mult5:	sll $v0,$a0,2
	sub $v0,$v0,$a0
	sll $v0,$v0,1
	sub $v0,$v0,$a0
	
	jr $ra