ori $28, $0, 0x6cba
ori $30, $0, 0xb69
ori $25, $0, 0x9296
ori $9, $0, 0xdd4b
ori $0, $0, 0xbd54
ori $10, $0, 0x4f12
ori $7, $0, 0x225d
ori $31, $0, 0x8adf
ori $4, $0, 0x80de
ori $14, $0, 0x7851
ori $9, $0, 0x5b7
ori $27, $0, 0x956
ori $12, $0, 0xdb18
ori $10, $0, 0xabeb
ori $14, $0, 0xb199
ori $9, $0, 0x1c09
Jarea:
beq $0, $0, JareaEnd
JBackFor18_0:
add $18, $0, $31
jr $18
ori $0, $0, 0x3044
JBackFor18_1:
jr $31
ori $18, $0, 0x3050
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
JBackFor15_0:
add $15, $0, $31
jr $15
ori $0, $0, 0x3080
JBackFor15_1:
jr $31
ori $15, $0, 0x308c
JBackFor10_0:
add $10, $0, $31
jr $10
ori $0, $0, 0x3094
JBackFor10_1:
jr $31
ori $10, $0, 0x30a0
JBackFor20_0:
add $20, $0, $31
jr $20
ori $0, $0, 0x30a8
JBackFor20_1:
jr $31
ori $20, $0, 0x30b4
JBackFor24_0:
add $24, $0, $31
jr $24
ori $0, $0, 0x30bc
JBackFor24_1:
jr $31
ori $24, $0, 0x30c8
JBackFor6_0:
add $6, $0, $31
jr $6
ori $0, $0, 0x30d0
JBackFor6_1:
jr $31
ori $6, $0, 0x30dc
JBackFor31_0:
jr $31
JareaEnd:
ori $0, $0, 0x26
ori $25, $0, 0x31
ori $3, $0, 0x2f
ori $19, $0, 0x5
ori $30, $0, 0xf
ori $14, $0, 0x29
ori $7, $0, 0x29
ori $4, $0, 0x15
ori $27, $0, 0x2a
ori $11, $0, 0x24
ori $23, $0, 0x1a
ori $12, $0, 0x13
ori $17, $0, 0x30
ori $28, $0, 0xc
ori $9, $0, 0x2f
ori $31, $0, 0x1c
ori $18, $0, 0x30e4
ori $26, $0, 0x30e4
ori $8, $0, 0x30e4
ori $15, $0, 0x30e4
ori $10, $0, 0x30e4
ori $20, $0, 0x30b4
ori $24, $0, 0x30e4
ori $6, $0, 0x30dc
sw $8, 4($0)
sw $11, 4($0)
sw $23, 12($0)
sw $23, 16($0)
sw $31, 12($0)
sw $6, 32($0)
sw $28, 44($0)
sw $9, 40($0)
sw $15, 4($0)
sw $15, 4($0)
sw $20, 16($0)
sw $0, 36($0)
sw $27, 8($0)
sw $27, 24($0)
sw $19, 44($0)
sw $4, 16($0)
sw $7, 36($0)
sw $30, 8($0)
sw $27, 32($0)
sw $17, 36($0)
Test0Begin:
ori $19, $0, 0x93
ori $7, $0, 0x93
beq $19, $7, Test0End
ori $31, $0, 0x31a8
lw $19, 120($17)
sw $25, 108($0)
sw $4, 130($23)
ori $31, $0, 0x31b4
Test0End:
ori $19, $0, 0x18
ori $7, $0, 0x1a
ori $31, $0, 0xe
Test1Begin:
lw $3, 77($3)
sw $27, 68($11)
sw $3, 150($31)
nop
ori $31, $0, 0x31d4
Test1End:
ori $31, $0, 0x15
Test2Begin:
nop
sub $27, $25, $23
sw $23, 125($12)
sub $31, $30, $0
ori $31, $0, 0x31ec
Test2End:
ori $31, $0, 0xe
Test3Begin:
ori $19, $0, 0x28
ori $25, $0, 0x28
beq $19, $25, Test3End
ori $31, $0, 0x3204
nop
ori $31, $0, 0x320c
nop
ori $31, $0, 0x3214
sw $7, 152($0)
ori $31, $0, 0x3218
Test3End:
ori $31, $0, 0x8
Test4Begin:
lui $4, 0x0
sw $4, -6($7)
nop
ori $31, $0, 0x3230
lw $27, 9($27)
ori $31, $0, 0x3234
Test4End:
ori $31, $0, 0xc
Test5Begin:
lui $31, 0x0
lw $27, 52($0)
sw $3, 169($12)
lw $30, 24($28)
ori $31, $0, 0x324c
Test5End:
ori $31, $0, 0x23
Test6Begin:
nop
ori $31, $0, 0x325c
nop
sw $17, -36($19)
lw $17, 12($19)
ori $31, $0, 0x3268
Test6End:
ori $31, $0, 0x29
Test7Begin:
ori $25, $0, 0x74
ori $12, $0, 0x74
beq $25, $12, Test7End
ori $31, $0, 0x3280
nop
ori $31, $0, 0x3288
nop
lw $11, 0($28)
ori $31, $0, 0x3290
Test7End:
ori $25, $0, 0x2b
ori $12, $0, 0xa
ori $31, $0, 0x19
Test8Begin:
nop
ori $31, $0, 0x32a8
add $11, $30, $4
nop
ori $31, $0, 0x32b4
lui $23, 0x0
ori $31, $0, 0x32b8
Test8End:
ori $31, $0, 0x18
Test9Begin:
sub $23, $30, $30
lui $19, 0x0
nop
sub $28, $7, $28
ori $31, $0, 0x32d0
Test9End:
ori $31, $0, 0x24
Test10Begin:
nop
ori $31, $0, 0x32e0
sw $28, 164($27)
add $19, $4, $27
nop
ori $31, $0, 0x32ec
Test10End:
ori $31, $0, 0xd
Test11Begin:
ori $28, $0, 0xa6
ori $14, $0, 0xa6
lw $17, 100($0)
add $19, $9, $28
nop
beq $28, $14, Test11End
ori $31, $0, 0x3310
ori $31, $0, 0x3310
Test11End:
ori $19, $0, 0xb
ori $14, $0, 0x5
ori $28, $0, 0x9
ori $31, $0, 0x11
Test12Begin:
ori $28, $0, 0x2
ori $27, $0, 0x2
nop
lui $4, 0x0
beq $28, $27, Test12End
ori $31, $0, 0x333c
nop
ori $31, $0, 0x3340
Test12End:
ori $31, $0, 0x28
Test13Begin:
nop
sw $3, 114($27)
lui $17, 0x0
sw $14, 180($17)
ori $31, $0, 0x3358
Test13End:
ori $31, $0, 0x31
Test14Begin:
ori $3, $0, 0x8a
ori $4, $0, 0x8a
beq $3, $4, Test14End
ori $31, $0, 0x3370
sw $11, 82($27)
lw $27, -26($7)
nop
ori $31, $0, 0x3380
ori $31, $0, 0x3380
Test14End:
ori $3, $0, 0x25
ori $4, $0, 0x2a
ori $31, $0, 0x21
Test15Begin:
sw $23, 153($25)
lui $31, 0x0
add $25, $23, $19
lui $0, 0x0
ori $31, $0, 0x33a0
Test15End:
ori $31, $0, 0x17
Test16Begin:
lw $23, 87($3)
sub $19, $31, $4
sub $12, $19, $14
nop
ori $31, $0, 0x33bc
ori $31, $0, 0x33bc
Test16End:
ori $31, $0, 0x25
Test17Begin:
nop
ori $31, $0, 0x33cc
nop
ori $31, $0, 0x33d4
sub $4, $7, $4
lui $7, 0x0
ori $31, $0, 0x33dc
Test17End:
ori $31, $0, 0x20
Test18Begin:
add $25, $14, $4
lui $19, 0x0
lui $9, 0x0
nop
ori $31, $0, 0x33f8
ori $31, $0, 0x33f8
Test18End:
ori $31, $0, 0x17
Test19Begin:
sw $27, 128($19)
lui $23, 0x0
add $12, $0, $25
nop
ori $31, $0, 0x3410
Test19End:
ori $31, $0, 0x13
Test20Begin:
ori $28, $0, 0xbd
ori $7, $0, 0xbd
nop
lw $31, 87($25)
nop
ori $31, $0, 0x3430
beq $28, $7, Test20End
ori $31, $0, 0x3438
ori $31, $0, 0x3438
Test20End:
ori $7, $0, 0x12
ori $28, $0, 0x19
ori $31, $0, 0xd
Test21Begin:
ori $23, $0, 0x90
ori $30, $0, 0x90
sw $9, 7($3)
sub $17, $30, $11
nop
ori $31, $0, 0x3460
beq $23, $30, Test21End
ori $31, $0, 0x3468
ori $31, $0, 0x3468
Test21End:
ori $30, $0, 0x29
ori $23, $0, 0x20
ori $31, $0, 0x1c
Test22Begin:
lw $19, -21($3)
lui $11, 0x0
lui $3, 0x0
lui $19, 0x0
ori $31, $0, 0x3488
Test22End:
ori $31, $0, 0xf
Test23Begin:
ori $23, $0, 0xc5
ori $19, $0, 0xc5
ori $31, $0, 0x70
ori $0, $0, 0x70
lw $17, 0($3)
beq $23, $19, Test23End
ori $31, $0, 0x34ac
beq $31, $0, Test23End
ori $31, $0, 0x34b4
lw $30, 91($14)
ori $31, $0, 0x34b8
Test23End:
ori $19, $0, 0x2c
ori $23, $0, 0x1
ori $31, $0, 0xc
Test24Begin:
ori $25, $0, 0x6e
ori $25, $0, 0x6e
beq $25, $25, Test24End
ori $31, $0, 0x34d8
sw $14, 92($4)
lui $19, 0x0
lw $4, 47($30)
ori $31, $0, 0x34e4
Test24End:
ori $25, $0, 0x2
ori $31, $0, 0x20
Test25Begin:
ori $19, $0, 0x8
ori $11, $0, 0x8
ori $19, $0, 0x0
ori $28, $0, 0x0
beq $19, $11, Test25End
ori $31, $0, 0x3508
nop
lw $31, 128($9)
beq $19, $28, Test25End
ori $31, $0, 0x3518
ori $31, $0, 0x3518
Test25End:
ori $31, $0, 0x26
Test26Begin:
nop
ori $31, $0, 0x3528
sub $31, $27, $9
lui $19, 0x0
sw $28, 64($0)
ori $31, $0, 0x3534
Test26End:
ori $31, $0, 0x2c
Test27Begin:
add $7, $19, $12
lw $17, 131($7)
nop
ori $31, $0, 0x354c
nop
ori $31, $0, 0x3550
Test27End:
ori $31, $0, 0x2b
Test28Begin:
ori $23, $0, 0xb4
ori $25, $0, 0xb4
beq $23, $25, Test28End
ori $31, $0, 0x3568
sw $23, 80($28)
lw $3, 100($28)
nop
ori $31, $0, 0x3574
Test28End:
ori $25, $0, 0x25
ori $23, $0, 0xe
ori $31, $0, 0xd
Test29Begin:
ori $4, $0, 0x30
ori $27, $0, 0x30
lui $27, 0x0
nop
ori $31, $0, 0x3598
beq $4, $27, Test29End
ori $31, $0, 0x35a0
sw $30, 196($3)
ori $31, $0, 0x35a4
Test29End:
ori $31, $0, 0x14
Test30Begin:
lw $12, 120($3)
nop
ori $31, $0, 0x35b8
nop
ori $31, $0, 0x35c0
lui $12, 0x0
ori $31, $0, 0x35c4
Test30End:
ori $31, $0, 0x25
Test31Begin:
sw $30, 8($3)
nop
ori $31, $0, 0x35d8
nop
lw $25, 60($0)
ori $31, $0, 0x35e0
Test31End:
ori $31, $0, 0x24
Test32Begin:
ori $4, $0, 0x35
ori $28, $0, 0x35
lw $17, 131($30)
nop
add $4, $14, $0
beq $4, $28, Test32End
ori $31, $0, 0x3604
ori $31, $0, 0x3604
Test32End:
ori $31, $0, 0x17
Test33Begin:
ori $11, $0, 0xad
ori $12, $0, 0xad
nop
ori $31, $0, 0x361c
sub $31, $7, $19
beq $11, $12, Test33End
ori $31, $0, 0x3628
lw $25, 62($23)
ori $31, $0, 0x362c
Test33End:
ori $11, $0, 0x27
ori $12, $0, 0x9
ori $31, $0, 0x30
Test34Begin:
lw $27, 63($30)
add $30, $0, $28
add $31, $30, $12
lw $27, 184($17)
ori $31, $0, 0x364c
Test34End:
ori $31, $0, 0x1f
Test35Begin:
sw $4, 76($3)
lw $31, 95($14)
lw $23, 31($30)
nop
ori $31, $0, 0x3664
Test35End:
ori $31, $0, 0x13
Test36Begin:
nop
ori $31, $0, 0x3674
lw $7, 188($23)
lui $27, 0x0
nop
ori $31, $0, 0x3684
ori $31, $0, 0x3684
Test36End:
ori $31, $0, 0x4
Test37Begin:
nop
ori $31, $0, 0x3694
sub $28, $30, $3
lui $4, 0x0
add $23, $19, $14
ori $31, $0, 0x36a0
Test37End:
ori $31, $0, 0xd
Test38Begin:
sub $9, $3, $27
add $30, $9, $9
lui $4, 0x0
sw $17, 168($9)
ori $31, $0, 0x36b8
Test38End:
ori $31, $0, 0x3
Test39Begin:
nop
ori $31, $0, 0x36c8
nop
ori $31, $0, 0x36d0
lw $7, 140($25)
add $14, $14, $30
ori $31, $0, 0x36d8
Test39End:
ori $31, $0, 0x17
Test40Begin:
ori $3, $0, 0xb7
ori $11, $0, 0xb7
ori $17, $0, 0xaf
ori $23, $0, 0xaf
beq $3, $11, Test40End
ori $31, $0, 0x36f8
nop
sw $4, 116($9)
beq $17, $23, Test40End
ori $31, $0, 0x3708
ori $31, $0, 0x3708
Test40End:
ori $3, $0, 0x2b
ori $11, $0, 0x11
ori $23, $0, 0x21
ori $17, $0, 0x25
ori $31, $0, 0xe
Test41Begin:
ori $23, $0, 0x74
ori $7, $0, 0x74
ori $31, $0, 0x4e
ori $7, $0, 0x4e
ori $30, $0, 0x7e
ori $0, $0, 0x7e
beq $23, $7, Test41End
ori $31, $0, 0x3740
beq $31, $7, Test41End
ori $31, $0, 0x3748
nop
ori $31, $0, 0x3750
beq $30, $0, Test41End
ori $31, $0, 0x3758
ori $31, $0, 0x3758
Test41End:
ori $30, $0, 0x1b
ori $23, $0, 0x8
ori $31, $0, 0x1e
Test42Begin:
lw $3, 73($3)
lui $30, 0x0
sw $9, 78($7)
nop
ori $31, $0, 0x377c
ori $31, $0, 0x377c
Test42End:
ori $31, $0, 0x12
Test43Begin:
ori $27, $0, 0xa9
ori $0, $0, 0xa9
ori $19, $0, 0x8
ori $17, $0, 0x8
lw $28, 48($19)
beq $27, $0, Test43End
ori $31, $0, 0x37a0
lui $28, 0x0
beq $19, $17, Test43End
ori $31, $0, 0x37ac
ori $31, $0, 0x37ac
Test43End:
ori $27, $0, 0x15
ori $31, $0, 0x2e
Test44Begin:
lw $17, 56($19)
lui $4, 0x0
sub $9, $12, $12
lui $23, 0x0
ori $31, $0, 0x37c8
Test44End:
ori $31, $0, 0x29
Test45Begin:
sw $3, 152($9)
lw $3, 63($12)
sw $0, 11($14)
nop
ori $31, $0, 0x37e0
Test45End:
ori $31, $0, 0x16
Test46Begin:
nop
ori $31, $0, 0x37f0
nop
lw $30, 144($9)
sw $9, 3($27)
ori $31, $0, 0x37fc
Test46End:
ori $31, $0, 0x28
Test47Begin:
sw $25, 32($28)
nop
lui $17, 0x0
lw $30, 80($9)
ori $31, $0, 0x3814
Test47End:
ori $31, $0, 0x29
Test48Begin:
ori $30, $0, 0x44
ori $12, $0, 0x44
sw $7, 75($31)
sub $30, $25, $19
beq $30, $12, Test48End
ori $31, $0, 0x3834
sub $7, $25, $4
ori $31, $0, 0x3838
Test48End:
ori $31, $0, 0x2e
Test49Begin:
ori $19, $0, 0x54
ori $19, $0, 0x54
beq $19, $19, Test49End
ori $31, $0, 0x3850
nop
ori $31, $0, 0x3858
nop
ori $31, $0, 0x3860
nop
ori $31, $0, 0x3868
ori $31, $0, 0x3868
Test49End:
ori $31, $0, 0xd
Test50Begin:
lui $9, 0x0
nop
lui $19, 0x0
nop
ori $31, $0, 0x3884
ori $31, $0, 0x3884
Test50End:
ori $31, $0, 0x1c
Test51Begin:
ori $0, $0, 0x9
ori $23, $0, 0x9
ori $17, $0, 0x9a
ori $30, $0, 0x9a
add $0, $7, $23
beq $0, $23, Test51End
ori $31, $0, 0x38a8
beq $17, $30, Test51End
ori $31, $0, 0x38b0
lw $12, 104($12)
ori $31, $0, 0x38b4
Test51End:
ori $30, $0, 0x15
ori $17, $0, 0x12
ori $31, $0, 0x18
Test52Begin:
lui $14, 0x0
nop
ori $31, $0, 0x38d0
nop
ori $31, $0, 0x38d8
sw $28, 102($17)
ori $31, $0, 0x38dc
Test52End:
ori $31, $0, 0x5
Test53Begin:
sub $23, $17, $28
sw $0, 128($4)
nop
ori $31, $0, 0x38f4
nop
ori $31, $0, 0x38fc
ori $31, $0, 0x38fc
Test53End:
ori $31, $0, 0x22
Test54Begin:
ori $17, $0, 0x28
ori $28, $0, 0x28
ori $0, $0, 0x95
ori $19, $0, 0x95
beq $17, $28, Test54End
ori $31, $0, 0x391c
lw $25, 96($3)
nop
beq $0, $19, Test54End
ori $31, $0, 0x392c
ori $31, $0, 0x392c
Test54End:
ori $19, $0, 0x12
ori $31, $0, 0x8
Test55Begin:
lui $0, 0x0
sw $28, 47($27)
sw $12, 72($14)
lw $30, -13($30)
ori $31, $0, 0x3948
Test55End:
ori $31, $0, 0x12
Test56Begin:
ori $23, $0, 0x13
ori $19, $0, 0x13
beq $23, $19, Test56End
ori $31, $0, 0x3960
sub $12, $17, $17
lw $4, 40($12)
lw $31, 87($11)
ori $31, $0, 0x396c
Test56End:
ori $31, $0, 0xa
Test57Begin:
nop
ori $31, $0, 0x397c
nop
ori $31, $0, 0x3984
nop
ori $31, $0, 0x398c
sw $12, 55($30)
ori $31, $0, 0x3990
Test57End:
ori $31, $0, 0x17
Test58Begin:
ori $28, $0, 0x82
ori $12, $0, 0x82
lui $17, 0x0
beq $28, $12, Test58End
ori $31, $0, 0x39ac
lui $23, 0x0
nop
ori $31, $0, 0x39b4
Test58End:
ori $12, $0, 0x1e
ori $28, $0, 0x0
ori $31, $0, 0x19
Test59Begin:
ori $17, $0, 0x31
ori $17, $0, 0x31
lui $28, 0x0
sw $19, 140($4)
beq $17, $17, Test59End
ori $31, $0, 0x39dc
lw $27, 188($7)
ori $31, $0, 0x39e0
Test59End:
ori $31, $0, 0x17
Test60Begin:
lw $4, 102($12)
add $23, $7, $23
lui $0, 0x0
lw $12, 124($28)
ori $31, $0, 0x39f8
Test60End:
ori $31, $0, 0x25
Test61Begin:
ori $30, $0, 0x16
ori $25, $0, 0x16
nop
sw $12, 16($4)
lui $9, 0x0
beq $30, $25, Test61End
ori $31, $0, 0x3a1c
ori $31, $0, 0x3a1c
Test61End:
ori $31, $0, 0x4
Test62Begin:
lw $17, 122($25)
add $0, $11, $3
nop
ori $31, $0, 0x3a34
nop
ori $31, $0, 0x3a3c
ori $31, $0, 0x3a3c
Test62End:
ori $31, $0, 0xf
Test63Begin:
ori $11, $0, 0x66
ori $11, $0, 0x66
lui $17, 0x0
lui $19, 0x0
lui $3, 0x0
beq $11, $11, Test63End
ori $31, $0, 0x3a60
ori $31, $0, 0x3a60
Test63End:
ori $11, $0, 0x11
ori $31, $0, 0x10
Test64Begin:
ori $30, $0, 0x26
ori $0, $0, 0x26
ori $14, $0, 0xb
ori $30, $0, 0xb
beq $30, $0, Test64End
ori $31, $0, 0x3a84
lw $30, 170($25)
beq $14, $30, Test64End
ori $31, $0, 0x3a90
add $12, $30, $23
ori $31, $0, 0x3a94
Test64End:
ori $31, $0, 0x31
Test65Begin:
nop
lui $28, 0x0
lw $23, 96($0)
nop
ori $31, $0, 0x3aac
Test65End:
ori $31, $0, 0x26
Test66Begin:
nop
ori $31, $0, 0x3abc
nop
ori $31, $0, 0x3ac4
lw $28, 167($27)
sub $23, $25, $0
ori $31, $0, 0x3acc
Test66End:
ori $31, $0, 0x23
Test67Begin:
sw $3, 52($0)
nop
ori $31, $0, 0x3ae0
sw $19, 114($23)
add $25, $0, $11
ori $31, $0, 0x3ae8
Test67End:
ori $31, $0, 0x0
Test68Begin:
ori $4, $0, 0x93
ori $12, $0, 0x93
ori $4, $0, 0x67
ori $4, $0, 0x67
nop
beq $4, $12, Test68End
ori $31, $0, 0x3b0c
beq $4, $4, Test68End
ori $31, $0, 0x3b14
nop
ori $31, $0, 0x3b1c
ori $31, $0, 0x3b1c
Test68End:
ori $4, $0, 0x24
ori $12, $0, 0x17
ori $31, $0, 0x9
Test69Begin:
ori $25, $0, 0x56
ori $17, $0, 0x56
nop
ori $31, $0, 0x3b3c
add $25, $27, $30
beq $25, $17, Test69End
ori $31, $0, 0x3b48
sw $9, 113($14)
ori $31, $0, 0x3b4c
Test69End:
ori $31, $0, 0x17
