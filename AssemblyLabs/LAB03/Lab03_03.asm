.globl main
.text

main: # main program
	li $s1, 0x87654321 		# Load immediate value 0x12345678 into register $s1
	
	sll $s2,$s1, 16 		# Shift left logical: shift bits of $s1 left by 16 positions, filling with zeros. $s2 = 0x43210000
	srl $s3,$s1, 8 			# Shift right logical: shift bits of $s1 right by 8 positions, filling with zeros. $s3 = 0x00876543
	sra $s4,$s1, 12 		# Shift right arithmetic: shift bits of $s1 right by 12 positions, preserving sign bit. $s4 = 0xfff87654
	
	li $v0, 10 			# Load immediate value 10 into $v0 (exit program code)
	syscall 			# System call to exit program
