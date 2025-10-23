.data
array:.space 8000

.text
li $v0,5
syscall
move $s0,$v0

la $sp,array
li $t0,1	#t0 = i = 0
li $s1,10 	#s1 = 10
sw $t0,($sp)

forIBegin:
beq $t0,$s0,forIEnd
li $t1,0	#c_in
la $t2,array	

#mul i
forJBegin:
bgt $t2,$sp,forJEnd
lw $t3,($t2)	#t3 = array at t2
mult $t3,$t0	#t3 = t3 * i
mflo $t3
add $t3,$t3,$t1	#t3 = t3 * i + c_in
div $t3,$s1
mflo $t1	#t1 = tmp / 10
mfhi $t3	#t3 = tmp % 10
sw $t3,($t2)
addi $t2,$t2,4
j forJBegin
forJEnd:

setCIn:
beqz $t1,next
div $t1,$s1
mflo $t1
mfhi $t3
addi $sp,$sp,4
sw $t3,($sp)
j setCIn
next:
addi $t0,$t0,1
j forIBegin
forIEnd:

la $t2,array
printBegin:
bgt $t2,$sp,printEnd

lw $a0,($t2)
li $v0,1
syscall

addi $t2,$t2,4
j printBegin
printEnd:

li $v0,10
syscall