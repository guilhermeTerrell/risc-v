start:
#################################### DATA SECTION ###################################
.data 
.equ FIBONACI_ELEMENT, 12

#################################### TEXT SECTION ###################################
.text 

############################ REGISTER FUNCTIONALITY MAPPING #############################
# a0 -> store fibonaci calculation result
# t0 -> store the number which we want to calculate fibonci (ex: in fib(10), t0 = 10)
# t1 -> store value 1 which will be user to increment process
# t2 -> counter initialized with zero that will be incremented until FIBONACI_ELEMENT
# t3 -> store fib(n - 1) value
# t4 -> store fib(n - 2) value
# In this code fib(n) = fib(n - 1) + fib(n - 2) means a0 = t3 + t4


# clean registers
andi a0, a0, 0
andi t0, t0, 0 
andi t1, t1, 0
andi t2, t2, 0
andi t3, t3, 0
andi t4, t4, 0

# initializations
addi t1, t1, 1 # load 1 in t1 register. This value will be used to evaluate if counter == 1
addi t0, t0, FIBONACI_ELEMENT # store the element which we want to calculate it´s fibonaci value

# Program routine
while:

    # go to end if counter > FIBONACI_ELEMENT -> end of calculation process
    bgt t2, t0, end

    # if counter == 0, go to fib_0 routine
    beq t2, zero, fib_0

    # if counter == 1, go to fib_1 routine
    beq t2, t1, fib_1
    
    # if counter < FIBONACI_ELEMENT, go to fib_n routine
    ble t2, t0, fib_n

fib_n:
    add a0, t3, t4 # fib(n) = fib(n - 1) + fib(n - 2)
    add t4, t3, zero # this will be fib(n - 2) if there is another iteration 
    add t3, a0, zero # this will be fib(n - 1) if there is another iteraation
    addi t2, t2, 1 # increment counter
    j while

fib_0:
    add a0, a0, zero # fib(0) = 0
    addi t2, t2, 1 # increment counter
    j while

fib_1:
    addi a0, a0, 1 # fib(1) = 1
    add t3, t3, a0 # this will be fib(n - 1) if there is another itereation
    addi t2, t2, 1 # increment counter
    j while

# end of program routine
end:
    nop