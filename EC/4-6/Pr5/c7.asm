.text
li $s0, 1 #Iniciamos contador
 li $s1, 11 #Condición de finalización
li $s2,0 #Contador
inicio_for: 

li $v0,5
syscall
beq $v0,$zero,final_for
sle $t1, $s0, $s1
beqz $t1, final_for
add $s2, $s2, $s0 #cuerpo del bucle
addi $s0, $s0, 1 #incremento del contador
j inicio_for
final_for: