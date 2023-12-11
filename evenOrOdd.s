start:

#################################### DATA SECTION ###################################
.data 

vector: .byte 12, 19, 45, 69, 98, 23 # Array of even and odd numbers
.equ DIVIDER, 2
.equ VECTOR_MAX_SIZE, 6 

#################################### TEXT SECTION ###################################
.text 

# clean registers
andi t0, t0, 0 # Even number count
andi t1, t1, 0 # Odd number count
andi t2, t2, 0 # vector index
andi t3, t3, 0 # store number 2
andi t4, t4, 0 # point to vector postions
andi t5, t5, 0 # vector size 

# initializations
addi t3, t3, DIVIDER # load number 2 which will be used to remainder calculus
addi t5, t5, VECTOR_MAX_SIZE # load number 6, which is the size of vector
la t4, vector # load the memory address represented by vector label, which points to 
              # the address of the first byte of the array

# Program routine
for:
    beq t2, t5, end # if t2 = 6 means we reach the end of the vector, so we must jump to end
    addi t2, t2, 1 # increment index counter

    lb a0, 0(t4) # load the byte stored in vector position 
    addi t4, t4, 1 #increment vector position. Since its a byte vector, just add 1

    # calculate rest
    rem a0, a0, t3 # a0 = vetor[i] % 2

    # if a0 == 0 -> is a even number
    beqz a0, isEven

    # else -> is a odd number
    j isOdd

isEven:
    addi t0, t0, 1 # increment counter for even number
    j for

isOdd:
    addi t1, t1, 1 # increment counter for odd number
    j for

# end of program routine
end: