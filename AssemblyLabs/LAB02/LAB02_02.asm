.data
str1:		.asciiz		"\nEnter a integer value: " 	# asks the user to input a value
str2:		.asciiz		"You entered: "			# displays the doubled value of the user entered
rep_mess:	.asciiz		"\n[Repeat (y/n): "		# prompt that asks the user to repeat the entering of int
yes:		.byte		'y'				# y stands for yes 
no:		.byte		'n'				# n stands for yes 

.globl 		main
.text
main:
loop_start:
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
	
	# ask the user if they want to repeat(y/n)
	li $v0, 4		# service code for printing
	la $a0, rep_mess	# load address of rep_mess to $a0
	syscall			# print the repeated message
	
	# prompts the user to input y or n
	li $v0, 12		# service code 12 is to read a character
	syscall			# read the character inputted
	move $t0, $v0		# move the character into $t0
	
	# this checks if the user inputs y; if then it repeat the prompts of the user integer
	lb $t1, yes		# load the character y into t1
	beq $t0, $t1, loop_start # if t0 and t1 are equal the loop start
	
	# this checks if the user input is not y, this exits the program
	li $v0, 10		# service code for exit
	syscall			# exits the program
	
