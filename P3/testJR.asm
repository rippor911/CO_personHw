ori $1,$0,1
ori $4,$0,0x00003008
add $1,$1,$1
ori $2,$0,16
beq $1,$2,end
jr $4
end:
nop
sw $1,-4($2)