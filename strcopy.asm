.data 
str_hello : .asciiz "Hello World\n"

.text 
	.globl main
	
main :
	
	li $v0, 9 #alocar memoria
	li $a0,13 #tamanho da alocacao
	syscall
	
	move $s0, $v0 #coloca para $s0
	la $s1,str_hello

	
loop : 
	lb $t0,0($s1) #primeiro byte da string
	beq $t0, $zero, end_loop #quando chega no \0
	sb $t0, 0($s0) #coloca o byte na nova string
	addi $s0,$s0,1 #anda na string nova
	addi $s1,$s1,1 #anda na string dada
	
	j loop
	
end_loop :

	sb $zero,0($s0) #coloca o \0
	addi $s0,$s0,-12 #volta para o inicio da string nova
	
	li $v0, 4
	move $a0, $s0
	syscall
	
	li $v0, 10
	syscall
	
	
	
	