.text
li $a0,'>'
li $v0,11
syscall
li $v0,5
syscall

move $a0,$v0
jal mult10
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
	
mult10:	sll $v0,$a0,3
	add $v0,$v0,$a0
	add $v0,$v0,$a0

	

	
	
	
	
	jr $ra