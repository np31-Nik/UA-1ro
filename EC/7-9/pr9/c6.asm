.data   
Xpide: .asciiz "X = "   
Ypide: .asciiz "Y = "   
MaxRes: .asciiz "El mayor es "  
.text 
 la $a0, Xpide  
 li $v0,4  
 syscall  		#imprime "X="
 
 li $v0,6  
 syscall  		#pide X en float
 
 mov.s $f12,$f0  	#mueve x a f12
   
 la $a0, Ypide  
 li $v0,4  
 syscall  		#imprime "Y="
 
 li $v0,6  
 syscall  		#pide y en float
 
 mov.s $f14,$f0 	#mueve y a f14
 
 jal max    		#salto a max
 
 la $a0,MaxRes  
 li $v0,4  
 syscall  		#imprime "El mayor es"
 
 mov.s $f12,$f0  
 li $v0,2  
 syscall    		#imprime valor en f12
 
 li $v0,10  
 syscall 		#fin programa
 
 
  max: 
 c.lt.s $f12,$f14	#f12<f14 (si V entonces flag a 1,sino 0)
 bc1t Ymayor		#si flag a 1 entonces Y mayor
 bc1f Xmayor		#si flag a 0 entonces X mayor

Ymayor:
mov.s $f0,$f14		#mueve Y a f0
j fin_max		#fin funcion

Xmayor:
mov.s $f0,$f12		#mueve X a f0
j fin_max		#fin funcion

 fin_max:
 jr $ra			#vuelve a jal max