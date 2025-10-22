.data
space:.asciiz " "
enter:.asciiz "\n"
symbol:.space 400
array:.space 400
stack:.space 1000

.macro printInt(%src)
li $v0,1
move $a0,%src
syscall
li $v0,4
la $a0,space
syscall
.end_macro

.macro readSymbol(%dst,%i)
mulu %dst,%i,4
lw %dst,symbol(%dst)
.end_macro

.macro setSymbol(%src,%x)
mulu $a0,%x,4
sw %src,symbol($a0)
.end_macro

.macro readStack(%dst)
subi $sp,$sp,4
lw %dst,($sp)
.end_macro

.macro writeStack(%src)
sw %src,($sp)
addi $sp,$sp,4
.end_macro

.macro writeArray(%src,%address)
mulu $a0,%address,4
addi $a1,%src,1
sw $a1,array($a0)
.end_macro

.text
li $v0,5
syscall
move $s0,$v0

li $t0,0
li $t1,0
li $s1,1	#s1 = 1
la $sp,stack
jal fullArray

li $v0,10
syscall


fullArray:
writeStack($ra)	#save return address
writeStack($t1)	#save loop i
blt $t0,$s0,continue
li $t1,0	#i = 0
printBegin:
beq $t1,$s0,printEnd	#end if i == n
mulu $t2,$t1,4	#4 * i
lw $t2,array($t2)
printInt($t2)
addi $t1,$t1,1
j printBegin
printEnd:
li $v0,4
la $a0,enter
syscall	#print \n
j searchEnd

continue:
li $t1,0
searchBegin:
beq $t1,$s0,searchEnd
readSymbol($t2,$t1)
bgtz $t2,nextNum
writeArray($t1,$t0)
addi $t0,$t0,1
setSymbol($s1,$t1)

jal fullArray

setSymbol($0,$t1)
subi $t0,$t0,1

nextNum:
addi $t1,$t1,1
j searchBegin
searchEnd:
readStack($t1)
readStack($ra)
jr $ra
