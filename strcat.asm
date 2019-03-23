.data 
	.align 0 # align for stri g
str :	.space 40 #get 40 spaces 
str2 :	.asciiz "Oi, tudo bem"

.text
	.globl main
	
main :
	
	li $v0,8 #read string
	la $a0, str #the input buffer(must have memory allocated)
	li $a1, 12 #the size of the read
	syscall
	
	add $t2,$t2,$zero #the size of the first string(negative)
	addi $t3,$t3,10 #stop condition (\n)
loop :
	lb $t0, 0($a0) #load each char of the string
	beq $t0,$t3, end_loop
	addi $a0,$a0,1 # $a0++
	addi $t2,$t2,-1 #$t2--
	j loop
	
end_loop:

	la $a1, str2 #load the second string
	add $t4,$t4,$zero #stop condition (\n)
loop_add :
	
	lb $t0, 0($a1) #load each char
	sb $t0, 0($a0) #store each char
	beq $t0,$zero, end_loop_add # until the \0
	addi $a0,$a0,1 #$a0++
	addi $a1,$a1,1 #$a1++
	addi $t4,$t4,-1 #$t3--
	j loop_add
	
end_loop_add :
	
	
	add $t2,$t2,$t4 #go back the number of chars of the last string
	add $a0,$a0,$t2 #go back to the start of the first string
	li $v0,4 #print string
	syscall
	
	li $v0, 10 #exit
	syscall
	
	
	
	