# minimum value in an array of signed 32-bit integers
#
# arguments:
#
#   a0: starting address of the array
#   a1: number of integers in the array
#
# returns:
#
#   a0: index of the minimum value in the supplied array
.globl min
min:
        # t1 is used to store the current min value
        # a0 is used to store the next value in the array to check
        # t2 is used to count the iterations of the loop
        # t3 is used to store the current index of the smallest number
        # t4 is used as a temporary to store the value at a0

        # Save the required temporary registers in the stack
        addi sp, sp, -16        # Decremenet the stack 16 bytes
        sw t1, 0(sp)            # Store t1 in the first 4 bytes
        sw t2, 4(sp)            # Store t2 in the next 4 bytes
        sw t3, 8(sp)            # Store t3 in the third 4 bytes
        sw t4, 12(sp)		# Store t4 in the fouth 4 bytes

        # Start the counter for the loop at zero
        addi t2, zero, 0
        mv t3, t2               # Set the current smallest index to the first element

        # Load the first value of the array into the "current min" t1
        lw t1, 0(a0)

        # Begin routine to find the smallest number
        loop:
                addi t2, t2, 1          # Increment the counter
                beq t2, a1, done        # Break if finished looping over the array

                addi a0, a0, 4          # Increment the pointer at a0 4 bytes to the next point in the array
		lw t4, 0(a0)		# Load the value at a0 into t4
		
                bgt t4, t1, end		# Skip the store smallest routine if a0=t4 < t1

                storeSmallest:
                        lw t1, 0(a0)    # Store the value at a0 to t1
                        mv t3, t2       # Store the index of the smallest word
                end:
                j loop
        done:

        mv a0, t3               # Return the index of the smallest value

        # Return the stack to original state
        lw t1, 0(sp)            # Reload t1
        lw t2, 4(sp)            # Reload t2
        lw t3, 8(sp)            # Reload t3
        lw t4, 12(sp)		# Reload t4
        addi sp, sp, 16         # Return the stack pointer to original position


        ret # do not remove this line
