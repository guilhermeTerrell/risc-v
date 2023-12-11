# Program:                  getMaxValueFromArray
# Functionality:            Iterate over an array and get it´s maximum value

start:

#################################### DATA SECTION ###################################
.data
array: .word 1, 10, 5, 71, 105, 0, 9, 87 # alocate consecutive 4 bytes space in memory
.set ARRAY_SIZE, 8 # size of the array

#################################### TEXT SECTION ###################################
.text 

# REGISTER FUNCTIONALITY MAPPING:
# a0 -> store greater number of the array
# t0 -> store ARRAY_SIZE
# t1 -> indexer that will be used to iterate over the array
# t2 -> store the address of array´s first byte (symbol array points to it)
# t3 -> store wach element of the array during iteration process

# clean registers
andi a0, a0, 0 # a0 = a0 & 0
andi t0, t0, 0 # t0 = t0 & 0
andi t1, t1, 0 # t1 = t1 & 0
andi t2, t2, 0 # t2 = t2 & 0
andi t3, t3, 0 # t3 = t3 & 0

# initializations
li t0, ARRAY_SIZE # load ARRAY_SIZE in register t0
la t2, array # load the memory address represented by array symbol in t1 register

# Program routine
loop:

    # if t1 == t0 -> end of array reached, jump to end
    beq t1, t0, end

    lw t3, 0(t2) # load in t3 the value stored in address pointed by t2
    
    addi t2, t2, 4 # t2 = t2 + 4 -> incrment t2 to point to the address of the next array element
    addi t1, t1, 1 # t1 = t1 + 1 -> increment indexer

    # if a0 > t3, then jump back to loop because we already have a greater in a0
    bge a0, t3, loop

    # if a0 < t3, mv the value stored in t3 to a0
    mv a0, t3 # a0 = t3
    j loop # jump back to loop

# end of program routine
end:
    nop