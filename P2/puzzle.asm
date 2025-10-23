.data
map:.space 400
visit:.space 400
stack:.space 1600
fx:.space 20
fy:.space 20

.macro getAddress(%dst,%i,%j,%row,%col,%temp)
multu %i,%col
mflo %dst
add %dst,%dst,%j
li %temp,4	#1 word = 4 byte
multu %dst,%temp
mflo %dst
.end_macro

.macro readInt(%dst)
li $v0,5
syscall
move %dst,$v0
.end_macro

.macro saveStack(%src)
sw %src,($sp)
addi $sp,$sp,4
.end_macro

.macro loadStack(%dst)
subi $sp,$sp,4
lw %dst,($sp)
.end_macro

.text
readInt($s0)	#s0 = n
readInt($s1)	#s1 = m

li $t0,0	#i = 0
iLoopBegin:
beq $t0,$s0,iLoopEnd

	li $t1,0	#j = 0
	jLoopBegin:
	beq $t1,$s1,jLoopEnd
	readInt($t2)
	getAddress($t3,$t0,$t1,$s0,$s1,$t4)
	sw $t2,map($t3)
	addi $t1,$t1,1
	j jLoopBegin
	jLoopEnd:

addi $t0,$t0,1
j iLoopBegin
iLoopEnd:

readInt($s2)	#s2 = x1
readInt($s3)	#s3 = y1
readInt($s4)	#s4 = x2
readInt($s5)	#s5 = y2

subi $s2,$s2,1
subi $s3,$s3,1
subi $s4,$s4,1
subi $s5,$s5,1

li $a0,0	#a0 = sum = 0
la $sp,stack	#init stack

#establish forward array
#fx[0] = -1 ,fy[0] = 0
li $t0,0
li $t1,-1
li $t2,0
sw $t1,fx($t0)
sw $t2,fy($t0)
#fx[1] = 1 ,fy[1] = 0
li $t0,4
li $t1,1
li $t2,0
sw $t1,fx($t0)
sw $t2,fy($t0)
#fx[2] = 0 ,fy[2] = -1
li $t0,8
li $t1,0
li $t2,-1
sw $t1,fx($t0)
sw $t2,fy($t0)
#fx[3] = 0 ,fy[3] = 1
li $t0,12
li $t1,0
li $t2,1
sw $t1,fx($t0)
sw $t2,fy($t0)

move $t2,$s2	#t0 = x = x1
move $t3,$s3	#t1 = y = y1
jal dfs
li $v0,1
syscall
li $v0,10
syscall

dfs:
saveStack($ra)
saveStack($t0)
saveStack($t1)
saveStack($t7)

move $t0,$t2	#x = next_x
move $t1,$t3	#y = next_y
bne $t0,$s4,continue
bne $t1,$s5,continue
addi $a0,$a0,1
j return

continue:
#mark[x][y] = 1
getAddress($t2,$t0,$t1,$s0,$s1,$t3)
li $t3,1
sw $t3,visit($t2)

#for i = 0 ; i < 16 ; i += 4
li $t7,0
li $s7,16
search_begin:
bge $t7,$s7,return
lw $t2,fx($t7)
lw $t3,fy($t7)
addu $t2,$t2,$t0	#t2 = next_x
addu $t3,$t3,$t1	#t3 = next_y
bltz $t2,search_next	#next_x < 0
bltz $t3,search_next	#next_y < 0
bge $t2,$s0,search_next	#next_x >= n
bge $t3,$s1,search_next #next_y >= m
getAddress($t4,$t2,$t3,$s0,$s1,$t5)
lw $t5,visit($t4)
bgtz $t5,search_next	#visit[next_x][next_y]	== 1
lw $t5,map($t4)
bgtz $t5,search_next	#map[next_x][next_y] == 1

#jump to next_x,next_y
jal dfs

search_next:
addi $t7,$t7,4
j search_begin

return:
#mark[x][y] = 0
getAddress($t2,$t0,$t1,$s0,$s1,$t3)
li $t3,0
sw $t3,visit($t2)
loadStack($t7)
loadStack($t1)
loadStack($t0)
loadStack($ra)
jr $ra
