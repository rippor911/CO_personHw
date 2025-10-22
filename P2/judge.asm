.data
string:.space 100

.macro readChar(%dst)
li $v0,12
syscall
move %dst,$v0
.end_macro

.macro getaddress(%word,%i,%dst)
multu %word,%i
mflo %dst
.end_macro

.macro getchar(%word,%i,%dst)
getaddress(%word,%i,%dst)
lw %dst,string(%dst)
.end_macro

.text
li $v0,5
syscall
move $s0,$v0	#$s0 = n

li $t0,0	#i = 0
li $s1,4	#$s1 = word
forIBegin:
beq $t0,$s0 forIEnd
readChar($t1)
getaddress($s1,$t0,$t2)
sw $t1,string($t2)
addi $t0,$t0,1
jal forIBegin
forIEnd:

li $t0,0	#i = 0
li $a0,1	#flag = 1
subi $t1,$s0,1	#j = n - 1
Begin:
bge $t0,$t1 End

getchar($s1,$t0,$t2)	#t2 = s[i]
getchar($s1,$t1,$t3)	#t3 = s[j]

addi $t0,$t0,1	#i = i + 1
subi $t1,$t1,1	#j = j - 1
beq $t2,$t3,Begin
li $a0,0
End:

li $v0,1
syscall
li $v0,10
syscall
