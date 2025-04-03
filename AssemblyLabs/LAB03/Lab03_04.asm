.data

mess:        .asciiz "Enter an Alphabetic Character: "
upper_case:  .asciiz "\nThe Upper Case of the Character is: "
lower_case:  .asciiz "\nThe Lower Case of the Character is: "

.globl main
.text

main:
    # Print the message asking for input
    li $v0, 4            # Service code for printing a string
    la $a0, mess         # Load the address of the message into $a0
    syscall              # Print the message
    
    # Read the character from user input
    li $v0, 12           # Service code for reading a character
    syscall              # Read the character
    move $s0, $v0        # Store the character temporarily in $s0
    
    # stores temporarily the ascii values of A and Z
    li $t0, 65           # ASCII value of 'A'
    li $t1, 90           # ASCII value of 'Z'
    
    blt $s0, $t0, low_case   # If the character is less than the value of 'A', jump to low_case
    bgt $s0, $t1, low_case   # If the character is greater than the value of 'Z', jump to low_case
    
    # Convert the character to respective using the 
    addi $s0, $s0, 0x20
   
    # Print message for lowercase conversion
    li $v0, 4                # Service code for printing a string
    la $a0, lower_case       # Load address of lowercase message
    syscall                  # Print the message
    
    # Print the converted lowercase character
    li $v0, 11               # Service code for printing a character
    move $a0, $s0            # Move the character into $a0 for printing
    syscall                  # Print the character
    
    j end                    # Jump to the end of the program
    
low_case:
    # Check if the character is a lowercase letter (a-z)
    li $t0, 97               # ASCII value of 'a'
    li $t1, 122              # ASCII value of 'z'
    
    blt $s0, $t0, end        # If the character is less than 'a', jump to end
    bgt $s0, $t1, end        # If the character is greater than 'z', jump to end
    
    # Convert lowercase to uppercase by subtracting 32 from the ASCII value
    addi $s0, $s0, -32       # Subtract 32 to convert lowercase to uppercase
    
    # Print message for uppercase conversion
    li $v0, 4                # Service code for printing a string
    la $a0, upper_case       # Load address of uppercase message
    syscall                  # Print the message
    
    # Print the converted uppercase character
    li $v0, 11               # Service code for printing a character
    move $a0, $s0            # Move the character into $a0 for printing
    syscall                  # Print the character
    
end:
    # Exit the program
    li $v0, 10               # Service code for program exit
    syscall                  # Exit the program
