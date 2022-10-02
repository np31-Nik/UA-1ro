li $t1, 1215261793


move $t2,$t1

move $a0,$t2
li $v0, 11
syscall




srl $a0,$t2,4
xor $a0,$a0,$zero
li $v0, 11
syscall



li $v0,10
syscall