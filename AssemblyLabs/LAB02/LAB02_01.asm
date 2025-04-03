.data
str1:		.asciiz		"\nEnter a integer value: " 	# asks the user to input a value
str2:		.asciiz		"You entered: "			# displays the doubled value of the user entered

.globl 		main
.text
main:
	# printing of asking the user to input a integer
	li $v0, 4		# service code for printing
	la $a0, str1		# load address of str1 into $a0
	syscall			# print ctrl string
	
	# it reads the integer inputted by the user
	li $v0 ,5		# service code for read integer
	syscall			# read integer input into $v0
	move $s0, $v0		# save input value in %v0
	
	# logic to double the user input integer
	add $s0, $s0, $s0	# adding
	
	# prints the str1
	li $v0, 4		# service code for print string
	la $a0, str2		# load address of str2 into $a0
	syscall			# print str2 string
	
	# prints the doubled value
	li $v0, 1		# servide code to print integer
	move $a0, $s0		# copy input value
	syscall			# print integer
	
	# this exits the program
	li $v0, 10		# service code for exit
	syscall			# exits the program
	
