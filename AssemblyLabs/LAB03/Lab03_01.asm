.data				
input_a:	.asciiz	"Enter A: "
input_b:	.asciiz	"Enter B: "
output:		.asciiz	"\nThe Answer is: "



.globl main			
.text

main:
	# printing of asking the user to input a integer
	li $v0, 4		# service code for printing
	la $a0, input_a		# load address of input a into $a0
	syscall			# print ctrl string
	
	# it reads the integer inputted by the user
	li $v0 ,5		# service code for read integer
	syscall			# read integer input into $v0
	move $t1, $v0		# save input value in %v0
	
	# printing of asking the user to input a integer
	li $v0, 4		# service code for printing
	la $a0, input_b		# load address of str1 into $a0
	syscall			# print ctrl string
	
	# it reads the integer inputted by the user
	li $v0 ,5		# service code for read integer
	syscall			# read integer input into $v0
	move $t2, $v0		# save input value in %v0
	
	
	# formula
	mul $t8, $t2, 2		# multiplication of b and 2
	add $t7, $t1, $t8	# addition of a and b which is stored in t8
	sub $t6, $t7, 5		# subtraction of result of a + 2b and 5 and stored in t6
	
	# prnts the text output
	li $v0, 4		# prints the answer text
	la $a0, output
	syscall
	
	# prints the answer
	li $v0, 1		# service code for printing the integer
	move $a0, $t6
	syscall
