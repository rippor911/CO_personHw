.data
array1:.space 600
array2:.space 600
space:.asciiz " "
enter:.asciiz "\n"

.macro printInt
li $v0,1
syscall
.end_macro

.macro printString
li $v0,4
syscall
.end_macro

.macro readInt(%dst)
li $v0,5
syscall
move %dst,$v0
.end_macro

.macro getAddress(%dst,%i,%j,%column)
multu %i,%column
mflo %dst
addu %dst,%dst,%j
mulu %dst,%dst,4
.end_macro

.macro readMatrix(%adr,%i,%j,%row,%col,%temp,%get) 
li %i,0	#i = 0
readiBegin:
beq %i,%row,readiEnd
li %j,0	#j = 0
readjBegin:
beq %j,%col,readjEnd

readInt(%get)

getAddress(%temp,%i,%j,%col)

addu %temp,%temp,%adr

sw %get,(%temp)

addi %j,%j,1	#j = j + 1
jal readjBegin
readjEnd:
addi %i,%i,1	#i = i + 1
jal readiBegin
readiEnd:
.end_macro

.macro printMatrix(%adr,%i,%j,%row,%col,%temp) 
li %i,0	#i = 0
readiBegin:
beq %i,%row,readiEnd
li %j,0	#j = 0
readjBegin:
beq %j,%col,readjEnd

getAddress(%temp,%i,%j,%col)
addu %temp,%temp,%adr

lw $a0,(%temp)

printInt

la $a0,space
printString

addi %j,%j,1	#j = j + 1
jal readjBegin
readjEnd:
la $a0,enter
printString
addi %i,%i,1	#i = i + 1
jal readiBegin
readiEnd:
.end_macro

.text
readInt($s0)	#s0 = n1
readInt($s1)	#s1 = m1
readInt($s2)	#s2 = n2
readInt($s3)	#s3 = m2

la $s4,array1	#s4 == array1
readMatrix($s4,$t1,$t2,$s0,$s1,$t3,$t4)

la $s5,array2	#s5 == array5
readMatrix($s5,$t1,$t2,$s2,$s3,$t3,$t4)

sub $s6,$s0,$s2	#s6 = n1 - n2
addi $s6,$s6,1	#s6 = n1 - n2 + 1

sub $s7,$s1,$s3	#s7 = m1 - m2
addi $s7,$s7,1	#s7 = m1 - m2 + 1

li $t0,0	#t0 = i = 0
iLoopBegin:
beq $t0,$s6,iLoopEnd

	li $t1,0	#t1 = j = 0
	jLoopBegin:
	beq $t1,$s7,jLoopEnd
	
	li $a0,0
	
		li $t2,0	#t2 = k = 0
		kLoopBegin:
		beq $t2,$s2,kLoopEnd
		
			li $t3,0	#t3 = l = 0
			lLoopBegin:
			beq $t3,$s3,lLoopEnd
			
			add $t4,$t0,$t2	#t4 = i + k
			add $t5,$t1,$t3	#t5 = j + l
			getAddress($t6,$t4,$t5,$s1)	# dst = t6 , col = s1 = m1
			lw $t6,array1($t6)
			
			getAddress($t7,$t2,$t3,$s3)	# dst = t7 , col = s3 = m2
			lw $t7,array2($t7)
			
			multu $t6,$t7
			
			mflo $t7
			
			add $a0,$a0,$t7
			
			addi $t3,$t3,1
			j lLoopBegin
			lLoopEnd:
			
		addi $t2,$t2,1
		j kLoopBegin
		kLoopEnd:
	
	printInt
	la $a0,space
	printString
	
	addi $t1,$t1,1
	j jLoopBegin
	jLoopEnd:
	
la $a0,enter
printString

addi $t0,$t0,1
j iLoopBegin
iLoopEnd: