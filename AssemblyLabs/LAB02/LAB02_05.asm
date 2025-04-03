.data				
input_1:	.asciiz	"Enter A: "
input_2:	.asciiz	"Enter B: "
equal:		.asciiz "Equal"
n_equal:	.asciiz "Not Equal"



.globl main			
.text

main:
	# printing of asking the user to input a integer
	li $v0, 4		# service code for printing
	la $a0, input_1		# load address of str1 into $a0
	syscall			# print ctrl string
	
	# it reads the integer inputted by the user
	li $v0 ,5		# service code for read integer
	syscall			# read integer input into $v0
	move $t1, $v0		# save input value in %v0
	
	# printing of asking the user to input a integer
	li $v0, 4		# service code for printing
	la $a0, input_2		# load address of str1 into $a0
	syscall			# print ctrl string
	
	# it reads the integer inputted by the user
	li $v0 ,5		# service code for read integer
	syscall			# read integer input into $v0
	move $t2, $v0		# save input value in %v0
	
	# compare if the two intgeres are equal if not it jumps to the printing of not equal
	beq $t1, $t2, print_equal 
	j print_n_equal
	
	print_equal:
	li $v0, 4 		# this prints the value if equal
	la $a0, equal
	syscall
	j exit
	
	
	print_n_equal:
	li $v0, 4 		# this prints the value if not equal
	la $a0, n_equal
	syscall
	j exit
	
	exit:
	li $v0, 10
	syscall