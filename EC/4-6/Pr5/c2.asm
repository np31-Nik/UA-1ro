.text

li $v0,5
syscall
move $t0,$v0
li $v0,5
syscall
move $t1,$v0

slt $t2,$t0,$t1
beq $t2,$zero,impB

move $a0,$t1
li $v0,1
syscall
j end

impB: 
move $a0,$t0
li $v0,1
syscall
j end



end: