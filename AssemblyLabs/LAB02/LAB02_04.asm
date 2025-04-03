.data				
input_a:	.asciiz	"Enter A: "
input_b:	.asciiz	"Enter B: "
input_c:	.asciiz	"Enter C: "
output:		.asciiz	"\nThe Answer is: "



.globl main			
.text

main:
	# printing of asking the user to input a integer
	li $v0, 4		# service code for printing
	la $a0, input_a		# load address of str1 into $a0
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
	
	# printing of asking the user to input a integer
	li $v0, 4		# service code for printing
	la $a0, input_c		# load address of str1 into $a0
	syscall			# print ctrl string
	
	# it reads the integer inputted by the user
	li $v0 ,5		# service code for read integer
	syscall			# read integer input into $v0
	move $t3, $v0		# save input value in %v0
	
	# formula
	add $t8, $t1, $t2	# addition of a and b
	li $t4, 101		# temporarily store the 101 value to t4
	add $t7, $t3, $t4	# addition of c and t4
	sub $t6, $t8, $t7	# final formula (a+b)-(c-101)
	
	# prnts the text output
	li $v0, 4		# prints the answer text
	la $a0, output
	syscall
	
	# prints the answer of the formula
	li $v0, 1		# service code for printing the integer
	move $a0, $t6
	syscall