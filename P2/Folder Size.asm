.data
nodeType:.space 640
fileSizeVal:.space 640
headAdj:.space 640
toEdge:.space 3280
nextEdge:.space 3208
stack:.space 2000
enter:.asciiz "\n"

.macro read(%dst)
li $v0,5
syscall
move %dst,$v0
.end_macro

.macro save(%adr,%id,%src)
mult %id,$s6
mflo $s7
addu $s7,$s7,%adr
sw %src,($s7)
.end_macro

.macro load(%adr,%id,%src)
mult %id,$s6
mflo $s7
addu $s7,$s7,%adr
lw %src,($s7)
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
read($s0)	#s0 = n
la $s1,nodeType	#s1 = node
la $s2,fileSizeVal	#s2 = file
la $s3,headAdj	#s3 = head
la $s4,toEdge	#s4 = to
la $s5,nextEdge	#s5 = next
li $s6,4	#s6 = a word
li $s7,0	#s7 = temp
la $sp,stack

li $t7,0	#t7 = edgeCnt

li $t0,1
initBegin:
bgt $t0,$s0,initEnd

li $t1,-1
save($s3,$t0,$t1)
save($s2,$t0,$0)
save($s1,$t0,$0)

addi $t0,$t0,1
j initBegin
initEnd:

li $t0,1
inputBegin:
bgt $t0,$s0,inputEnd

read($t1)
read($t2)
beqz $t1,inputCase

li $t3,1
save($s1,$t0,$t3)

li $t3,0
addEdgeBegin:
bge $t3,$t2,addEdgeEnd
read($t4)
#add_edge($t0,$t4)
save($s4,$t7,$t4)
load($s3,$t0,$t5)
save($s5,$t7,$t5)
save($s3,$t0,$t7)
addi $t7,$t7,1

addi $t3,$t3,1
j addEdgeBegin
addEdgeEnd:
j inputNext
inputCase:
save($s1,$t0,$0)
save($s2,$t0,$t2)
inputNext:
addi $t0,$t0,1
j inputBegin
inputEnd:

read($t0)
while:
blez $t0,end

read($t1)	#t1 = id

li $a0,0	#sum = 0
jal dfs		#dfs(t1)

li $v0,1
syscall

li $v0,4
la $a0,enter
syscall

subi $t0,$t0,1
j while
end:
li $v0,10
syscall

dfs:
saveStack($ra)
saveStack($t1)
saveStack($t2)
load($s1,$t1,$s7)
bgtz $s7,continue

load($s2,$t1,$s7)
add $a0,$a0,$s7
j return

continue:

load($s3,$t1,$t2)
searchBegin:
bltz $t2,return

load($s4,$t2,$t1)
jal dfs

load($s5,$t2,$t2)
j searchBegin
return:
loadStack($t2)
loadStack($t1)
loadStack($ra)
jr $ra