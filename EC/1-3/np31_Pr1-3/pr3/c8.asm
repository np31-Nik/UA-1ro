.text

addi $v0,$zero,12
syscall

addi $t1,$v0,32

addi $a0,$zero,'\n'
addi $v0,$zero,11
syscall

addi $a0,$t1,0
addi $v0,$zero,11
syscall

addi $v0,$zero, 10
syscall