.data
input_num:        .asciiz "Enter an integer number: "
input_pos:        .asciiz "Enter a bit position (between 0 and 31): "
result:           .asciiz "The value of the bit is: "
error_message:    .asciiz "Invalid bit position. Please enter a position between 0 and 31.\n"

.text
.globl main

main:
    # Prompt user to enter an integer number
    li $v0, 4              # syscall code 4: print string
    la $a0, input_num      # load the address of the "input_num" prompt into $a0
    syscall                # make the system call to print the string

    # Read the integer number
    li $v0, 5              # syscall code 5: read integer input
    syscall                # read the integer entered by the user
    move $t0, $v0          # store the entered number in $t0

    # Prompt user to enter a bit position
    li $v0, 4              # syscall code 4: print string
    la $a0, input_pos      # load the address of the "input_pos" prompt
    syscall                # print the prompt

    # Read the bit position
    li $v0, 5              # syscall code 5: read integer input
    syscall                # read the bit position entered by the user
    move $t1, $v0          # store the entered bit position in $t1

    # Validate bit position (0 to 31)
    li $t2, 0              # lower bound (minimum valid bit position)
    li $t3, 31             # upper bound (maximum valid bit position)
    blt $t1, $t2, invalid_position   # if bit position < 0, jump to invalid_position
    bgt $t1, $t3, invalid_position   # if bit position > 31, jump to invalid_position

    # Calculate the value of the bit at the specified position
    # Right shift the number by the bit position stored in $t1
    srlv $t4, $t0, $t1

    # Isolate the least significant bit (the bit we want)
    andi $t4, $t4, 1       # use bitwise AND with 1 to extract the rightmost bit (0 or 1)

    # Print the result message
    li $v0, 4              # syscall code 4: print string
    la $a0, result         # load the address of the "result" message
    syscall                # print the message

    # Print the bit value (0 or 1)
    li $v0, 1              # syscall code 1: print integer
    move $a0, $t4          # move the bit value into $a0 for printing
    syscall                # print the bit value

    # Exit the program
    li $v0, 10             # syscall code 10: exit
    syscall                # terminate the program

invalid_position:
    # Handle invalid bit position
    li $v0, 4              # syscall code 4: print string
    la $a0, error_message  # load the address of the error message
    syscall                # print the error message

    # Exit the program
    li $v0, 10             # syscall code 10: exit
    syscall                # terminate the program
