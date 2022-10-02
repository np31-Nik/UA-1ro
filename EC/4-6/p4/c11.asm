.text

li $v0,5
syscall

li $t0,5

mult $v0,$v0

mflo $t1

mult $t0,$t1

mflo $t1

li $t0,2

mult $t0,$v0

mflo $t2

add $a0,$t2,$t1

addi $a0,$a0,3

li $v0,1
syscall