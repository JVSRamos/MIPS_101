.data 
	.align 0
.text
	.globl main
	
main :
	li $v0,5
	syscall
	move $t0,$v0 #coloca o numero dado em $t0 
	li $t1, 10
	li $t4, 0 # o numero invertido
loop : 
	div $t0,$t1 #divide o numero dado por 10
	mflo $t0 #quociente da divisao
	mfhi $t2 #resto da divisao
	mul $t4,$t4,10 #multiplica o numero invertido por 10
	add $t4,$t4,$t2	#soma com o resto
	beq $t0,$zero,end_loop 
	
	j loop
	
end_loop :
	li $v0, 1
	move $a0,$t4
	syscall
	
	li $v0,10
	syscall
	
	
	
	