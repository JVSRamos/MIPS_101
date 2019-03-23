.data
	
.text
	.globl main
	
main:
	li $v0,5
	syscall
	move $t1, $v0 #read the number
	
	addi $t2,$zero,1 #the result
	addi $t3,$zero,1 #stop contition
	while :
		 mul $t2,$t2,$t1 # $t2 *= $t1
		 sub $t1,$t1,1 #$t2--
		 bne $t3,$t1,while
		 
	move $a0,$t2 
	li $v0,1 #print the result
	syscall
	
	li $v0,10 #exit
	syscall
