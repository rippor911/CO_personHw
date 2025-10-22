.data
array1:.space 256
array2:.space 256
ans:.space 256
space:.asciiz " "
enter:.asciiz "\n"

.macro call_address(%dst,%row,%column,%rank)
	multu %row,%rank
	mflo %dst
	addu %dst,%dst,%column
	mulu %dst,%dst,4
.end_macro

.macro read_int(%dst)
	li $v0,5
	syscall
	move %dst,$v0
.end_macro

.text
read_int($t0)

li $t1,0	#i = 0
forRow1Begin:
beq $t1,$t0,forRow1End
li $t2,0	#j = 0
forColumn1Begin:
beq $t2,$t0,forColumn1End
read_int($t3)
call_address($t4,$t1,$t2,$t0)
sw $t3,array1($t4)
addi $t2,$t2,1
jal forColumn1Begin
forColumn1End:
addi $t1,$t1,1
jal forRow1Begin
forRow1End:

li $t1,0	#i = 0
forRow2Begin:
beq $t1,$t0,forRow2End
li $t2,0	#j = 0
forColumn2Begin:
beq $t2,$t0,forColumn2End
read_int($t3)
call_address($t4,$t1,$t2,$t0)
sw $t3,array2($t4)
addi $t2,$t2,1
jal forColumn2Begin
forColumn2End:
addi $t1,$t1,1
jal forRow2Begin
forRow2End:

li $t1,0	#i = 0
forIBegin:
beq $t1,$t0,forIEnd
li $t2,0	#j = 0
forJBegin:
beq $t2,$t0,forJEnd
li $t3,0	#k = 0
li $t7,0	#sum = 0
forKBegin:
beq $t3,$t0,forKEnd

call_address($t5,$t1,$t3,$t0)	#(i,k)
call_address($t6,$t3,$t2,$t0)	#(k,j)

lw $t5,array1($t5)
lw $t6,array2($t6)

multu $t5,$t6

mflo $t5
add $t7,$t7,$t5

addi $t3,$t3,1
jal forKBegin
forKEnd:

call_address($t4,$t1,$t2,$t0)	#(i,j)
sw $t7,ans($t4)

addi $t2,$t2,1
jal forJBegin
forJEnd:
addi $t1,$t1,1
jal forIBegin
forIEnd:

li $t1,0	#i = 0
forRow3Begin:
beq $t1,$t0,forRow3End
li $t2,0	#j = 0
forColumn3Begin:
beq $t2,$t0,forColumn3End
li $v0,1
call_address($t4,$t1,$t2,$t0)
lw $a0,ans($t4)
syscall
li $v0,4
la $a0,space
syscall
addi $t2,$t2,1
jal forColumn3Begin
forColumn3End:

li $v0,4
la $a0,enter
syscall

addi $t1,$t1,1
jal forRow3Begin
forRow3End:

li $v0,10
syscall
