# Program:                  Fatorial function
# Functionality:            Given a n integer, calculate it´s fatorial
# Type of implementation:   Without recursion
# Definitions:
#   0! = 1
#   1! = 1
#   n! = n * (n - 1) * (n - 2) * ... * 3 * 2 * 1

start:

#################################### DATA SECTION ###################################
.data
.equ FATORIAL_RANGE, 10 # number which we want to calculate it´s fatorial 

#################################### TEXT SECTION ###################################
.text 

# REGISTER FUNCTIONALITY MAPPING:
# a0 -> store fatorial calculation result
# t0 -> store the number which we want to calculate fatorial (ex: in fat(10), t0 = 10)
# t1 -> store value 1 which will be used in branch instructions
# t2 -> counter initialized with zero that will be incremented until FATORIAL_RANGE

# clean registers
andi a0, a0, 0 # a0 = a0 & 0
andi t0, t0, 0 # t0 = t0 & 0
andi t1, t1, 0 # t1 = t1 & 0
andi t2, t2, 0 # t2 = t2 & 0

# initializations
li t0, FATORIAL_RANGE # load FATORIAL_RANGE in register t0
li t1, 1 # t1 = 1
mv t2, zero # t2 = 0

# Program routine
loop:

    # if t2 > t0 -> end of loop, go to end
    bgt t2, t0, end 
    
    # if t2 == 0 -> go to fat_0 routine
    beqz t2, fat_0
    
    # if t2 == 1, go to fat_1 routine
    beq t2, t1, fat_1

    # if t2 > 1, go to fat_n routine
    bgt t2, t1, fat_n

fat_0:
    addi a0, zero, 1 # fat(0) = 1
    addi t2, t2, 1 # increment counter
    j loop # jump back to loop routine

fat_1:
    addi a0, zero, 1 # fat(1) = 1
    addi t2, t2, 1 # increment counter
    j loop # jump back to loop routine

fat_n:
    mul a0, a0, t2 # a0 = a0 * t2
    addi t2, t2, 1 # increment counter
    j loop # jump back to loop routine

# end of program routine
end:
    nop