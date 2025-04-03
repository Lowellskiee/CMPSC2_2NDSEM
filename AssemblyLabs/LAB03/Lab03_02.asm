.globl main
.text

main:
	# Load immediate value 0x12345678 into register $s1 and 0xffff9a00 into register $s2
	li $s1, 0x12345678
	li $s2, 0xffff9a00
	
					# Bitwise AND operation: the output is 1 when both value is 1
	and $s3, $s1, $s2		# Result: $s3 = 0x12341200
	
					# Bitwise OR operation: output is 0 only when both values are 0
	or $s4, $s1, $s2		# Result: $s4 = 0xffffde78
	
					# Bitwise XOR operation: output is 0 if both value is 1 or 0
	xor $s5, $s1, $s2		# Result: $s5 = 0xedcbcc78
	
					# Bitwise NOR operation: output is 1 only when both values are 0
	nor $s6, $s1, $s2		# Result: $s6 = 0x00002187
	
					# Exit program
	li $v0, 10			# System call code for program exit
	syscall
