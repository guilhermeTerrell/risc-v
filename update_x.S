start:

#.bss
#x: .word # alocate 4 bytes in main memory for variable x

.data
x: .word # alocate 4 bytes in main memory for variable x
y: .word, 8 # alocate 4 bytes in memory and store the value 8

.text
# clean registers
andi t0, t0, 0
andi t1, t1, 0

la t1, y # load the memory address of the first byte alocated for y
lw t0, 0(t1) # load the value stored in memory position associated with label y

# routine
update_x:
    la t1, x # load the memory address of the first byte alocated for x
    sw t0, 0(t1) # store y value in memory position associated with label x
    j end

end:
    nop