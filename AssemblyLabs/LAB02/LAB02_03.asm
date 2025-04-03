.data				
user: 	.asciiz 	"Enter your name: "	# a null terminated string
hello:  .asciiz		"\nHello, "
name: 	.space 20



.globl main			
.text

main:
	# prints the enter your name
	li $v0, 4			# specify system write service
	la $a0, user			# load string address
	syscall				# call the kernel (write string)
	
	li $v0, 8			# reads the string input
	la $a0, name			# stores the name of the user
	la $a1, 20			# sets the maximum number of characters to 20
	syscall				#
	move $t0, $v0			#
	
	# prints the Hello
	li $v0, 4			
	la $a0, hello
	syscall
	
	# prints the name inputted
	li $v0, 4
	la $a0, name
	syscall