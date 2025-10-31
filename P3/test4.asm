ori $0,$0,72
ori $1,$0,1
ori $2,$0,2
ori $3,$0,3
ori $4,$0,4
ori $5,$0,5
ori $6,$0,6
ori $7,$0,7
ori $8,$0,8
ori $9,$0,9
ori $10,$0,10
ori $11,$0,11
ori $12,$0,12
ori $13,$0,13
ori $14,$0,14
ori $15,$0,15
ori $16,$0,16
ori $17,$0,17
ori $18,$0,18
ori $19,$0,19
ori $20,$0,20
ori $21,$0,21
ori $22,$0,22
ori $23,$0,23
ori $24,$0,24
ori $25,$0,25
ori $26,$0,26
ori $27,$0,27
ori $28,$0,28
ori $29,$0,29
ori $30,$0,30
ori $31,$0,31

lui $t1,0xffff
ori $t1,$t2,0xffff

ori $sp,$0,0

loop:
beq $t0,$31,next

subu $s1,$s2,$s3
addu $s3,$t0,$t6
ori $t3,$t2,1000
lui $5,0xabcd

nop
sw $t0,0($sp)
addu $sp,$sp,$4
lw $s2,-4($sp)
nop

addu $t0,$t0,$1
beq $0,$0,loop
next:
nop
lui $7,100
