ori $5, $0, 0xc3af
ori $8, $0, 0xc05a
ori $31, $0, 0x646
ori $19, $0, 0xf207
ori $2, $0, 0x3ab4
ori $8, $0, 0xc5df
ori $16, $0, 0x9080
ori $5, $0, 0x25aa
ori $2, $0, 0xa18f
ori $31, $0, 0x1b11
ori $2, $0, 0xce55
ori $8, $0, 0xcba9
ori $14, $0, 0x3a72
ori $13, $0, 0x2869
ori $20, $0, 0xedd8
ori $31, $0, 0x89ee
Jarea:
beq $0, $0, JareaEnd
JBackFor20_0:
add $20, $0, $31
jr $20
ori $0, $0, 0x3044
JBackFor20_1:
jr $31
ori $20, $0, 0x3050
JBackFor26_0:
add $26, $0, $31
jr $26
ori $0, $0, 0x3058
JBackFor26_1:
jr $31
ori $26, $0, 0x3064
JBackFor8_0:
add $8, $0, $31
jr $8
ori $0, $0, 0x306c
JBackFor8_1:
jr $31
ori $8, $0, 0x3078
JBackFor21_0:
add $21, $0, $31
jr $21
ori $0, $0, 0x3080
JBackFor21_1:
jr $31
ori $21, $0, 0x308c
JBackFor22_0:
add $22, $0, $31
jr $22
ori $0, $0, 0x3094
JBackFor22_1:
jr $31
ori $22, $0, 0x30a0
JBackFor16_0:
add $16, $0, $31
jr $16
ori $0, $0, 0x30a8
JBackFor16_1:
jr $31
ori $16, $0, 0x30b4
JBackFor13_0:
add $13, $0, $31
jr $13
ori $0, $0, 0x30bc
JBackFor13_1:
jr $31
ori $13, $0, 0x30c8
JBackFor2_0:
add $2, $0, $31
jr $2
ori $0, $0, 0x30d0
JBackFor2_1:
jr $31
ori $2, $0, 0x30dc
JBackFor31_0:
jr $31
JareaEnd:
ori $0, $0, 0x11
ori $15, $0, 0x0
ori $10, $0, 0x1
ori $19, $0, 0x0
ori $11, $0, 0x1c
ori $4, $0, 0xa
ori $9, $0, 0x22
ori $27, $0, 0x25
ori $25, $0, 0x1d
ori $5, $0, 0x4
ori $24, $0, 0x16
ori $17, $0, 0x30
ori $12, $0, 0x19
ori $14, $0, 0x27
ori $18, $0, 0xa
ori $31, $0, 0x27
ori $20, $0, 0x30e4
ori $26, $0, 0x30e4
ori $8, $0, 0x3078
ori $21, $0, 0x308c
ori $22, $0, 0x30e4
ori $16, $0, 0x30e4
ori $13, $0, 0x30c8
ori $2, $0, 0x30dc
sw $17, 20($0)
sw $16, 32($0)
sw $9, 48($0)
sw $12, 12($0)
sw $27, 4($0)
sw $20, 16($0)
sw $9, 48($0)
sw $16, 40($0)
sw $27, 16($0)
sw $26, 0($0)
sw $22, 12($0)
sw $4, 16($0)
sw $17, 44($0)
sw $5, 32($0)
sw $25, 16($0)
sw $9, 16($0)
sw $17, 12($0)
sw $2, 0($0)
sw $9, 8($0)
sw $25, 20($0)
Test0Begin:
ori $12, $0, 0xbc
ori $25, $0, 0xbc
lui $19, 0x0
sub $17, $9, $12
sw $5, 198($17)
beq $12, $25, Test0End
ori $31, $0, 0x31b4
ori $31, $0, 0x31b4
Test0End:
ori $25, $0, 0x22
ori $17, $0, 0xf
ori $12, $0, 0x2a
ori $31, $0, 0x22
Test1Begin:
lui $17, 0x0
add $25, $9, $4
sw $4, 112($25)
nop
ori $31, $0, 0x31dc
ori $31, $0, 0x31dc
Test1End:
ori $31, $0, 0xa
Test2Begin:
ori $4, $0, 0xc7
ori $18, $0, 0xc7
nop
ori $31, $0, 0x31f4
beq $4, $18, Test2End
ori $31, $0, 0x31fc
lui $15, 0x0
sw $11, 138($9)
ori $31, $0, 0x3204
Test2End:
ori $4, $0, 0x22
ori $18, $0, 0x18
ori $31, $0, 0x2a
Test3Begin:
sub $12, $10, $18
nop
ori $31, $0, 0x3220
nop
ori $31, $0, 0x3228
lw $15, 36($17)
ori $31, $0, 0x322c
Test3End:
ori $31, $0, 0x2d
Test4Begin:
nop
ori $31, $0, 0x323c
nop
lw $19, 146($24)
lw $14, 24($0)
ori $31, $0, 0x3248
Test4End:
ori $31, $0, 0x2f
Test5Begin:
sub $10, $4, $14
nop
lui $12, 0x0
sw $25, 50($4)
ori $31, $0, 0x3260
Test5End:
ori $31, $0, 0x16
Test6Begin:
ori $5, $0, 0x88
ori $25, $0, 0x88
ori $0, $0, 0x81
ori $10, $0, 0x81
beq $5, $25, Test6End
ori $31, $0, 0x3280
beq $0, $10, Test6End
ori $31, $0, 0x3288
sw $25, -16($11)
lui $11, 0x0
ori $31, $0, 0x3290
Test6End:
ori $10, $0, 0x12
ori $25, $0, 0xc
ori $5, $0, 0x14
ori $31, $0, 0x2f
Test7Begin:
lui $24, 0x0
nop
lw $9, 96($19)
lui $25, 0x0
ori $31, $0, 0x32b4
Test7End:
ori $31, $0, 0xd
Test8Begin:
lw $25, 72($15)
nop
lw $9, 68($25)
nop
ori $31, $0, 0x32d0
ori $31, $0, 0x32d0
Test8End:
ori $31, $0, 0x18
Test9Begin:
lui $5, 0x0
nop
ori $31, $0, 0x32e4
add $17, $12, $12
sub $24, $31, $27
ori $31, $0, 0x32ec
Test9End:
ori $24, $0, 0x4
ori $31, $0, 0x17
Test10Begin:
ori $25, $0, 0x7d
ori $31, $0, 0x7d
add $24, $17, $18
sub $19, $24, $19
beq $25, $31, Test10End
ori $31, $0, 0x3310
nop
ori $31, $0, 0x3314
Test10End:
ori $25, $0, 0x1b
ori $31, $0, 0x10
Test11Begin:
ori $27, $0, 0x3d
ori $19, $0, 0x3d
sw $5, 154($10)
sub $18, $10, $19
sub $31, $18, $14
beq $27, $19, Test11End
ori $31, $0, 0x333c
ori $31, $0, 0x333c
Test11End:
ori $31, $0, 0x26
Test12Begin:
sw $5, 32($15)
lw $17, 126($10)
sw $11, 52($0)
sub $14, $18, $27
ori $31, $0, 0x3354
Test12End:
ori $14, $0, 0x27
ori $31, $0, 0x2a
Test13Begin:
sw $24, 23($19)
lw $31, 99($27)
add $31, $10, $0
add $9, $4, $27
ori $31, $0, 0x3370
Test13End:
ori $31, $0, 0x28
Test14Begin:
ori $31, $0, 0x53
ori $18, $0, 0x53
sub $18, $11, $15
nop
sw $25, 72($0)
beq $31, $18, Test14End
ori $31, $0, 0x3394
ori $31, $0, 0x3394
Test14End:
ori $31, $0, 0x1
Test15Begin:
lui $18, 0x0
nop
lw $17, 160($24)
sw $12, 21($14)
ori $31, $0, 0x33ac
Test15End:
ori $31, $0, 0x21
Test16Begin:
ori $11, $0, 0x39
ori $31, $0, 0x39
nop
ori $31, $0, 0x33c4
beq $11, $31, Test16End
ori $31, $0, 0x33cc
sub $0, $12, $27
lw $19, 96($0)
ori $31, $0, 0x33d4
Test16End:
ori $31, $0, 0x22
Test17Begin:
sub $4, $19, $12
sub $24, $25, $11
lui $9, 0x0
sw $15, 114($24)
ori $31, $0, 0x33ec
Test17End:
ori $31, $0, 0x1c
Test18Begin:
ori $18, $0, 0xa8
ori $12, $0, 0xa8
lw $10, 110($10)
beq $18, $12, Test18End
ori $31, $0, 0x3408
lui $18, 0x0
nop
ori $31, $0, 0x3410
Test18End:
ori $12, $0, 0x1
ori $18, $0, 0x28
ori $31, $0, 0xd
Test19Begin:
ori $19, $0, 0x4c
ori $9, $0, 0x4c
ori $11, $0, 0xc6
ori $12, $0, 0xc6
beq $19, $9, Test19End
ori $31, $0, 0x3438
sw $0, 68($17)
lui $10, 0x0
beq $11, $12, Test19End
ori $31, $0, 0x3448
ori $31, $0, 0x3448
Test19End:
ori $11, $0, 0x24
ori $12, $0, 0x2d
ori $31, $0, 0xd
Test20Begin:
ori $9, $0, 0xb6
ori $14, $0, 0xb6
lui $12, 0x0
beq $9, $14, Test20End
ori $31, $0, 0x346c
lui $4, 0x0
sw $4, 76($18)
ori $31, $0, 0x3474
Test20End:
ori $9, $0, 0x30
ori $14, $0, 0x5
ori $31, $0, 0xb
Test21Begin:
ori $10, $0, 0x5d
ori $4, $0, 0x5d
sw $19, -33($10)
lw $5, 135($14)
lui $11, 0x0
beq $10, $4, Test21End
ori $31, $0, 0x34a0
ori $31, $0, 0x34a0
Test21End:
ori $31, $0, 0x25
Test22Begin:
sw $15, 156($17)
sub $27, $0, $24
nop
nop
ori $31, $0, 0x34b8
Test22End:
ori $31, $0, 0xa
Test23Begin:
nop
sw $5, 128($15)
nop
ori $31, $0, 0x34d0
lw $19, -13468($31)
ori $31, $0, 0x34d4
Test23End:
ori $31, $0, 0x0
Test24Begin:
ori $15, $0, 0xa5
ori $0, $0, 0xa5
beq $15, $0, Test24End
ori $31, $0, 0x34ec
lui $25, 0x0
nop
ori $31, $0, 0x34f8
sw $17, 95($10)
ori $31, $0, 0x34fc
Test24End:
ori $15, $0, 0x31
ori $31, $0, 0xc
Test25Begin:
ori $14, $0, 0x52
ori $25, $0, 0x52
lw $17, 196($0)
nop
beq $14, $25, Test25End
ori $31, $0, 0x3520
add $15, $9, $18
ori $31, $0, 0x3524
Test25End:
ori $31, $0, 0x8
Test26Begin:
sub $18, $9, $15
sw $0, 157($18)
sub $0, $0, $17
nop
ori $31, $0, 0x353c
Test26End:
ori $31, $0, 0x18
Test27Begin:
ori $0, $0, 0x6a
ori $25, $0, 0x6a
beq $0, $25, Test27End
ori $31, $0, 0x3554
nop
lw $10, 18($25)
lui $14, 0x0
ori $31, $0, 0x3560
Test27End:
ori $25, $0, 0x0
ori $31, $0, 0x7
Test28Begin:
add $4, $12, $17
sw $4, 176($17)
lw $17, 84($9)
sub $11, $15, $15
ori $31, $0, 0x357c
Test28End:
ori $31, $0, 0x15
Test29Begin:
ori $5, $0, 0x2a
ori $17, $0, 0x2a
sw $0, 7($15)
beq $5, $17, Test29End
ori $31, $0, 0x3598
lui $19, 0x0
nop
ori $31, $0, 0x35a0
Test29End:
ori $31, $0, 0x8
Test30Begin:
ori $9, $0, 0x47
ori $4, $0, 0x47
lw $31, 123($15)
nop
ori $31, $0, 0x35bc
lui $14, 0x0
beq $9, $4, Test30End
ori $31, $0, 0x35c8
ori $31, $0, 0x35c8
Test30End:
ori $31, $0, 0x13
Test31Begin:
sw $18, 20($19)
nop
ori $31, $0, 0x35dc
sw $31, -13624($31)
lui $11, 0x0
ori $31, $0, 0x35e4
Test31End:
ori $31, $0, 0xb
Test32Begin:
ori $25, $0, 0x80
ori $5, $0, 0x80
beq $25, $5, Test32End
ori $31, $0, 0x35fc
lw $10, 64($12)
nop
ori $31, $0, 0x3608
add $4, $0, $25
ori $31, $0, 0x360c
Test32End:
ori $25, $0, 0x2a
ori $5, $0, 0x3
ori $31, $0, 0x21
Test33Begin:
ori $9, $0, 0x75
ori $11, $0, 0x75
add $27, $19, $15
lw $4, 63($27)
beq $9, $11, Test33End
ori $31, $0, 0x3634
nop
ori $31, $0, 0x3638
Test33End:
ori $11, $0, 0x30
ori $9, $0, 0x26
ori $31, $0, 0x1c
Test34Begin:
lw $24, 72($10)
lw $24, 33($18)
sw $9, 164($24)
nop
ori $31, $0, 0x3658
Test34End:
ori $31, $0, 0x7
Test35Begin:
ori $10, $0, 0x50
ori $15, $0, 0x50
beq $10, $15, Test35End
ori $31, $0, 0x3670
lui $25, 0x0
lw $18, 184($14)
lw $15, 120($14)
ori $31, $0, 0x367c
Test35End:
ori $31, $0, 0x28
Test36Begin:
nop
ori $31, $0, 0x368c
lui $12, 0x0
nop
add $31, $5, $18
ori $31, $0, 0x3698
Test36End:
ori $31, $0, 0x2
Test37Begin:
lui $14, 0x0
nop
ori $31, $0, 0x36ac
lw $18, 24($14)
sw $5, 16($18)
ori $31, $0, 0x36b4
Test37End:
ori $31, $0, 0x1c
Test38Begin:
lw $27, 108($11)
sw $19, 144($0)
nop
sw $27, 82($25)
ori $31, $0, 0x36cc
Test38End:
ori $31, $0, 0x28
Test39Begin:
sub $25, $31, $14
nop
lui $9, 0x0
nop
ori $31, $0, 0x36e4
Test39End:
ori $31, $0, 0xd
Test40Begin:
nop
ori $31, $0, 0x36f4
sw $15, 18($17)
lui $10, 0x0
nop
ori $31, $0, 0x3700
Test40End:
ori $31, $0, 0xc
Test41Begin:
lw $19, 168($27)
lui $27, 0x0
sw $12, -8($11)
lui $17, 0x0
ori $31, $0, 0x3718
Test41End:
ori $31, $0, 0x11
Test42Begin:
ori $12, $0, 0x18
ori $11, $0, 0x18
ori $18, $0, 0xae
ori $9, $0, 0xae
sw $0, 116($19)
beq $12, $11, Test42End
ori $31, $0, 0x373c
beq $18, $9, Test42End
ori $31, $0, 0x3744
nop
ori $31, $0, 0x3748
Test42End:
ori $9, $0, 0xf
ori $18, $0, 0x15
ori $31, $0, 0x31
Test43Begin:
lw $12, 36($10)
lui $4, 0x0
lui $18, 0x0
add $10, $15, $0
ori $31, $0, 0x3768
Test43End:
ori $31, $0, 0x26
Test44Begin:
ori $5, $0, 0x87
ori $10, $0, 0x87
sw $12, 68($19)
beq $5, $10, Test44End
ori $31, $0, 0x3784
sub $31, $12, $19
sw $10, -14076($31)
ori $31, $0, 0x378c
Test44End:
ori $10, $0, 0x1
ori $5, $0, 0x30
ori $31, $0, 0x24
Test45Begin:
ori $12, $0, 0x53
ori $19, $0, 0x53
nop
nop
beq $12, $19, Test45End
ori $31, $0, 0x37b4
lw $10, 111($10)
ori $31, $0, 0x37b8
Test45End:
ori $31, $0, 0xa
Test46Begin:
lui $14, 0x0
lw $5, 64($18)
sw $9, 124($11)
sw $14, 184($27)
ori $31, $0, 0x37d0
Test46End:
ori $31, $0, 0xa
Test47Begin:
nop
nop
ori $31, $0, 0x37e4
nop
nop
ori $31, $0, 0x37f0
ori $31, $0, 0x37f0
Test47End:
ori $31, $0, 0x2e
Test48Begin:
nop
nop
sw $24, 88($15)
lui $10, 0x0
ori $31, $0, 0x3808
Test48End:
ori $31, $0, 0x20
Test49Begin:
nop
lui $15, 0x0
nop
nop
ori $31, $0, 0x3824
ori $31, $0, 0x3824
Test49End:
ori $31, $0, 0x15
Test50Begin:
ori $14, $0, 0x8e
ori $19, $0, 0x8e
ori $18, $0, 0x56
ori $18, $0, 0x56
lui $31, 0x0
sw $0, 6($19)
beq $14, $19, Test50End
ori $31, $0, 0x384c
beq $18, $18, Test50End
ori $31, $0, 0x3854
ori $31, $0, 0x3854
Test50End:
ori $19, $0, 0x1b
ori $14, $0, 0xf
ori $31, $0, 0x0
Test51Begin:
nop
sw $27, 6($18)
add $24, $11, $19
lw $5, 37($24)
ori $31, $0, 0x3874
Test51End:
ori $31, $0, 0x20
Test52Begin:
ori $31, $0, 0x1b
ori $4, $0, 0x1b
ori $10, $0, 0x7c
ori $11, $0, 0x7c
ori $14, $0, 0x3b
ori $0, $0, 0x3b
add $31, $14, $24
beq $31, $4, Test52End
ori $31, $0, 0x38a0
beq $10, $11, Test52End
ori $31, $0, 0x38a8
beq $14, $0, Test52End
ori $31, $0, 0x38b0
ori $31, $0, 0x38b0
Test52End:
ori $10, $0, 0x2e
ori $11, $0, 0x24
ori $31, $0, 0x7
Test53Begin:
nop
lw $10, 37($31)
lw $24, 9($24)
nop
ori $31, $0, 0x38d0
Test53End:
ori $31, $0, 0x2a
Test54Begin:
lw $27, 116($5)
nop
ori $31, $0, 0x38e4
lui $15, 0x0
nop
ori $31, $0, 0x38f0
ori $31, $0, 0x38f0
Test54End:
ori $31, $0, 0x2e
Test55Begin:
sub $15, $0, $27
nop
ori $31, $0, 0x3904
nop
ori $31, $0, 0x390c
lui $12, 0x0
ori $31, $0, 0x3910
Test55End:
ori $31, $0, 0x19
Test56Begin:
add $15, $15, $18
nop
ori $31, $0, 0x3924
nop
nop
ori $31, $0, 0x392c
Test56End:
ori $31, $0, 0x2f
Test57Begin:
ori $17, $0, 0x11
ori $5, $0, 0x11
sub $11, $12, $14
nop
beq $17, $5, Test57End
ori $31, $0, 0x394c
sw $12, -58($15)
ori $31, $0, 0x3950
Test57End:
ori $31, $0, 0x5
Test58Begin:
add $25, $19, $14
add $31, $31, $18
sw $11, 61($31)
lui $14, 0x0
ori $31, $0, 0x3968
Test58End:
ori $31, $0, 0x19
Test59Begin:
ori $0, $0, 0x7
ori $10, $0, 0x7
lui $15, 0x0
beq $0, $10, Test59End
ori $31, $0, 0x3984
lw $24, 108($24)
sw $5, 37($10)
ori $31, $0, 0x398c
Test59End:
ori $31, $0, 0x19
Test60Begin:
nop
lui $25, 0x0
add $5, $17, $15
lui $24, 0x0
ori $31, $0, 0x39a4
Test60End:
ori $31, $0, 0x9
Test61Begin:
ori $15, $0, 0x2e
ori $12, $0, 0x2e
ori $9, $0, 0xa1
ori $14, $0, 0xa1
beq $15, $12, Test61End
ori $31, $0, 0x39c4
sub $9, $27, $5
beq $9, $14, Test61End
ori $31, $0, 0x39d0
nop
ori $31, $0, 0x39d8
ori $31, $0, 0x39d8
Test61End:
ori $9, $0, 0x19
ori $14, $0, 0x2c
ori $31, $0, 0xf
Test62Begin:
ori $10, $0, 0x38
ori $9, $0, 0x38
lw $25, 49($4)
lw $12, -22($18)
nop
beq $10, $9, Test62End
ori $31, $0, 0x3a04
ori $31, $0, 0x3a04
Test62End:
ori $31, $0, 0x1e
Test63Begin:
nop
ori $31, $0, 0x3a14
lui $31, 0x0
lui $15, 0x0
nop
ori $31, $0, 0x3a24
ori $31, $0, 0x3a24
Test63End:
ori $31, $0, 0x18
Test64Begin:
ori $17, $0, 0x6d
ori $27, $0, 0x6d
nop
ori $31, $0, 0x3a3c
nop
beq $17, $27, Test64End
ori $31, $0, 0x3a48
lw $14, -93($27)
ori $31, $0, 0x3a4c
Test64End:
ori $27, $0, 0x2d
ori $17, $0, 0x2f
ori $31, $0, 0x23
Test65Begin:
nop
ori $31, $0, 0x3a64
lui $11, 0x0
lui $4, 0x0
sub $5, $18, $27
ori $31, $0, 0x3a70
Test65End:
ori $31, $0, 0xd
Test66Begin:
add $15, $19, $14
add $27, $18, $14
nop
ori $31, $0, 0x3a88
nop
ori $31, $0, 0x3a8c
Test66End:
ori $27, $0, 0x11
ori $31, $0, 0x14
Test67Begin:
ori $0, $0, 0xa6
ori $31, $0, 0xa6
nop
ori $31, $0, 0x3aa8
sw $17, 148($25)
beq $0, $31, Test67End
ori $31, $0, 0x3ab4
lw $5, -25($5)
ori $31, $0, 0x3ab8
Test67End:
ori $31, $0, 0x2d
Test68Begin:
lw $18, 104($11)
nop
sw $9, -16($9)
sw $4, -16($9)
ori $31, $0, 0x3ad0
Test68End:
ori $31, $0, 0x13
Test69Begin:
nop
nop
ori $31, $0, 0x3ae4
lui $17, 0x0
lui $14, 0x0
ori $31, $0, 0x3aec
Test69End:
ori $31, $0, 0xe
Test70Begin:
ori $27, $0, 0x14
ori $18, $0, 0x14
beq $27, $18, Test70End
ori $31, $0, 0x3b04
lw $12, 72($14)
sw $12, -15048($31)
add $15, $17, $19
ori $31, $0, 0x3b10
Test70End:
ori $31, $0, 0x18
Test71Begin:
sub $25, $15, $12
lui $9, 0x0
nop
ori $31, $0, 0x3b28
sw $15, 132($4)
ori $31, $0, 0x3b2c
Test71End:
ori $31, $0, 0x13
Test72Begin:
lw $11, 65($19)
lw $17, 88($18)
sw $18, 140($11)
lui $25, 0x0
ori $31, $0, 0x3b44
Test72End:
ori $31, $0, 0x1d
