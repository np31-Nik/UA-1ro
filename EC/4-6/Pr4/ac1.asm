.text
li $a0,'>'
li $v0,11
syscall
li $v0,5
syscall

addi $t1,$v0,10
move $a0,$t1
jal imprim
add $t1,$t1,$t1

move $a0,$t1
jal imprim

li $v0,10
syscall


imprim: addi $v0,$0,1
	syscall
	li $a0,'\n'
	li $v0,11
	syscall
	jr $ra