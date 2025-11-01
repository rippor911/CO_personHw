ori $17, $0, 0x3293
ori $5, $0, 0x2a0
ori $22, $0, 0x2542
ori $4, $0, 0x6b61
ori $4, $0, 0xb077
ori $25, $0, 0xc1a0
ori $13, $0, 0x8174
ori $12, $0, 0x57a7
ori $26, $0, 0xa097
ori $25, $0, 0xa6a6
ori $9, $0, 0xb002
ori $8, $0, 0x730c
ori $27, $0, 0x6a5c
ori $22, $0, 0xc1c3
ori $31, $0, 0x90a6
ori $14, $0, 0xeb89
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
ori $0, $0, 0x19
ori $15, $0, 0x9
ori $10, $0, 0x29
ori $19, $0, 0x1c
ori $11, $0, 0x24
ori $4, $0, 0x1b
ori $9, $0, 0xf
ori $27, $0, 0x26
ori $25, $0, 0x31
ori $5, $0, 0x0
ori $24, $0, 0x5
ori $17, $0, 0x11
ori $12, $0, 0x1a
ori $14, $0, 0x20
ori $18, $0, 0xf
ori $31, $0, 0x7
ori $20, $0, 0x3050
ori $26, $0, 0x3064
ori $8, $0, 0x30e4
ori $21, $0, 0x30e4
ori $22, $0, 0x30e4
ori $16, $0, 0x30b4
ori $13, $0, 0x30c8
ori $2, $0, 0x30e4
sw $24, 24($0)
sw $25, 20($0)
sw $16, 32($0)
sw $21, 40($0)
sw $0, 32($0)
sw $19, 4($0)
sw $0, 36($0)
sw $12, 0($0)
sw $31, 36($0)
sw $10, 32($0)
sw $22, 44($0)
sw $20, 16($0)
sw $18, 40($0)
sw $19, 44($0)
sw $25, 32($0)
sw $11, 44($0)
sw $16, 28($0)
sw $17, 48($0)
sw $22, 16($0)
sw $9, 24($0)
Test0Begin:
ori $19, $0, 0xa6
ori $17, $0, 0xa6
ori $19, $0, 0x69
ori $24, $0, 0x69
beq $19, $17, Test0End
ori $31, $0, 0x31b0
add $19, $14, $5
lui $31, 0x0
beq $19, $24, Test0End
ori $31, $0, 0x31c0
ori $31, $0, 0x31c0
Test0End:
ori $24, $0, 0x2e
ori $17, $0, 0x12
ori $31, $0, 0x3
Test1Begin:
sw $14, 59($10)
nop
ori $31, $0, 0x31dc
nop
ori $31, $0, 0x31e4
nop
ori $31, $0, 0x31ec
ori $31, $0, 0x31ec
Test1End:
ori $31, $0, 0x4
Test2Begin:
ori $12, $0, 0xaf
ori $25, $0, 0xaf
ori $24, $0, 0x30
ori $24, $0, 0x30
sw $25, -9($15)
beq $12, $25, Test2End
ori $31, $0, 0x3210
beq $24, $24, Test2End
ori $31, $0, 0x3218
add $31, $5, $19
ori $31, $0, 0x321c
Test2End:
ori $25, $0, 0x2f
ori $12, $0, 0x2c
ori $31, $0, 0x29
Test3Begin:
ori $5, $0, 0x7c
ori $25, $0, 0x7c
ori $10, $0, 0x3a
ori $11, $0, 0x3a
beq $5, $25, Test3End
ori $31, $0, 0x3244
lw $24, 0($24)
lui $5, 0x0
beq $10, $11, Test3End
ori $31, $0, 0x3254
ori $31, $0, 0x3254
Test3End:
ori $25, $0, 0x0
ori $5, $0, 0x8
ori $31, $0, 0x1e
Test4Begin:
ori $25, $0, 0x3d
ori $24, $0, 0x3d
sub $9, $18, $0
beq $25, $24, Test4End
ori $31, $0, 0x3278
sub $27, $11, $4
nop
ori $31, $0, 0x3280
Test4End:
ori $31, $0, 0x27
Test5Begin:
nop
ori $31, $0, 0x3290
lui $5, 0x0
nop
lw $11, 161($4)
ori $31, $0, 0x329c
Test5End:
ori $31, $0, 0x2a
Test6Begin:
nop
sub $25, $12, $12
sw $15, 36($25)
nop
ori $31, $0, 0x32b8
ori $31, $0, 0x32b8
Test6End:
ori $31, $0, 0x13
Test7Begin:
ori $10, $0, 0x95
ori $14, $0, 0x95
beq $10, $14, Test7End
ori $31, $0, 0x32d0
lw $5, 54($17)
sub $0, $0, $25
nop
ori $31, $0, 0x32dc
Test7End:
ori $10, $0, 0x19
ori $14, $0, 0x22
ori $31, $0, 0x31
Test8Begin:
ori $4, $0, 0xc7
ori $24, $0, 0xc7
sub $19, $19, $0
lw $5, 100($11)
nop
ori $31, $0, 0x3304
beq $4, $24, Test8End
ori $31, $0, 0x330c
ori $31, $0, 0x330c
Test8End:
ori $4, $0, 0x8
ori $24, $0, 0xe
ori $31, $0, 0x1e
Test9Begin:
nop
ori $31, $0, 0x3324
nop
sw $24, -12996($31)
lw $18, 142($27)
ori $31, $0, 0x3330
Test9End:
ori $31, $0, 0x10
Test10Begin:
lui $27, 0x0
nop
ori $31, $0, 0x3344
lw $0, 80($27)
add $0, $24, $10
ori $31, $0, 0x334c
Test10End:
ori $31, $0, 0x9
Test11Begin:
ori $25, $0, 0xc5
ori $17, $0, 0xc5
sw $5, 159($10)
lui $24, 0x0
beq $25, $17, Test11End
ori $31, $0, 0x336c
sw $0, 175($15)
ori $31, $0, 0x3370
Test11End:
ori $25, $0, 0x18
ori $17, $0, 0x1f
ori $31, $0, 0x11
Test12Begin:
lw $0, 75($15)
sw $12, 148($4)
nop
sw $11, 24($19)
ori $31, $0, 0x3390
Test12End:
ori $31, $0, 0x2d
Test13Begin:
sw $27, 143($15)
nop
add $24, $24, $10
nop
ori $31, $0, 0x33a8
Test13End:
ori $31, $0, 0x2b
Test14Begin:
lw $18, 128($19)
nop
lw $19, 152($12)
add $4, $11, $15
nop
ori $31, $0, 0x33c0
Test14End:
ori $31, $0, 0x17
Test15Begin:
lw $24, 104($19)
sw $14, 157($17)
sw $25, 128($11)
lui $27, 0x0
ori $31, $0, 0x33d8
Test15End:
ori $31, $0, 0x2c
Test16Begin:
ori $12, $0, 0x1e
ori $12, $0, 0x1e
beq $12, $12, Test16End
ori $31, $0, 0x33f0
lw $0, -1($4)
nop
lw $14, 28($25)
ori $31, $0, 0x33fc
Test16End:
ori $31, $0, 0xd
Test17Begin:
ori $18, $0, 0xc7
ori $0, $0, 0xc7
ori $18, $0, 0xbd
ori $31, $0, 0xbd
ori $19, $0, 0x3e
ori $17, $0, 0x3e
add $18, $19, $25
beq $18, $0, Test17End
ori $31, $0, 0x3428
beq $18, $31, Test17End
ori $31, $0, 0x3430
beq $19, $17, Test17End
ori $31, $0, 0x3438
ori $31, $0, 0x3438
Test17End:
ori $31, $0, 0x2
Test18Begin:
ori $5, $0, 0x7e
ori $14, $0, 0x7e
lui $18, 0x0
sw $27, 96($25)
nop
ori $31, $0, 0x3458
beq $5, $14, Test18End
ori $31, $0, 0x3460
ori $31, $0, 0x3460
Test18End:
ori $5, $0, 0xe
ori $14, $0, 0x25
ori $31, $0, 0x1c
Test19Begin:
ori $18, $0, 0x37
ori $24, $0, 0x37
nop
add $18, $9, $27
lui $11, 0x0
beq $18, $24, Test19End
ori $31, $0, 0x348c
ori $31, $0, 0x348c
Test19End:
ori $31, $0, 0x17
Test20Begin:
ori $15, $0, 0x81
ori $17, $0, 0x81
ori $15, $0, 0x1d
ori $15, $0, 0x1d
beq $15, $17, Test20End
ori $31, $0, 0x34ac
beq $15, $15, Test20End
ori $31, $0, 0x34b4
sw $17, 94($19)
sw $14, 67($10)
ori $31, $0, 0x34bc
Test20End:
ori $17, $0, 0x13
ori $31, $0, 0x15
Test21Begin:
ori $17, $0, 0x43
ori $19, $0, 0x43
nop
nop
nop
ori $31, $0, 0x34e0
beq $17, $19, Test21End
ori $31, $0, 0x34e8
ori $31, $0, 0x34e8
Test21End:
ori $31, $0, 0x12
Test22Begin:
ori $18, $0, 0x7e
ori $5, $0, 0x7e
nop
beq $18, $5, Test22End
ori $31, $0, 0x3504
lw $18, 21($19)
lw $10, -13528($31)
ori $31, $0, 0x350c
Test22End:
ori $5, $0, 0x20
ori $18, $0, 0x13
ori $31, $0, 0xa
Test23Begin:
ori $12, $0, 0x92
ori $11, $0, 0x92
nop
ori $31, $0, 0x352c
beq $12, $11, Test23End
ori $31, $0, 0x3534
nop
ori $31, $0, 0x353c
add $0, $5, $0
ori $31, $0, 0x3540
Test23End:
ori $11, $0, 0x23
ori $12, $0, 0x8
ori $31, $0, 0x13
Test24Begin:
ori $10, $0, 0x9a
ori $0, $0, 0x9a
beq $10, $0, Test24End
ori $31, $0, 0x3560
add $25, $4, $24
sw $5, 108($25)
sub $11, $19, $9
ori $31, $0, 0x356c
Test24End:
ori $10, $0, 0x30
ori $31, $0, 0x11
Test25Begin:
lui $14, 0x0
nop
nop
nop
ori $31, $0, 0x3588
Test25End:
ori $31, $0, 0xa
Test26Begin:
lw $24, 107($15)
lw $4, 32($14)
lui $31, 0x0
lw $17, 39($15)
ori $31, $0, 0x35a0
Test26End:
ori $31, $0, 0xd
Test27Begin:
lui $27, 0x0
lw $27, 140($11)
nop
lw $14, 16($11)
ori $31, $0, 0x35b8
Test27End:
ori $31, $0, 0x6
Test28Begin:
lui $24, 0x0
lw $19, 0($24)
add $27, $31, $0
lw $15, 84($5)
ori $31, $0, 0x35d0
Test28End:
ori $19, $0, 0xe
ori $31, $0, 0x1a
Test29Begin:
lw $24, 10($27)
sw $9, -12508($24)
sw $19, -33($4)
nop
ori $31, $0, 0x35f0
ori $31, $0, 0x35f0
Test29End:
ori $24, $0, 0xe
ori $31, $0, 0x26
Test30Begin:
ori $10, $0, 0x69
ori $5, $0, 0x69
ori $31, $0, 0x53
ori $5, $0, 0x53
ori $14, $0, 0xf
ori $15, $0, 0xf
beq $10, $5, Test30End
ori $31, $0, 0x361c
lw $11, 129($9)
beq $31, $5, Test30End
ori $31, $0, 0x3628
beq $14, $15, Test30End
ori $31, $0, 0x3630
ori $31, $0, 0x3630
Test30End:
ori $10, $0, 0x2f
ori $31, $0, 0x8
Test31Begin:
ori $19, $0, 0x31
ori $5, $0, 0x31
beq $19, $5, Test31End
ori $31, $0, 0x364c
nop
nop
ori $31, $0, 0x3658
nop
ori $31, $0, 0x3660
ori $31, $0, 0x3660
Test31End:
ori $31, $0, 0x26
Test32Begin:
ori $19, $0, 0x58
ori $5, $0, 0x58
nop
beq $19, $5, Test32End
ori $31, $0, 0x367c
nop
lui $18, 0x0
ori $31, $0, 0x3684
Test32End:
ori $31, $0, 0x20
Test33Begin:
ori $4, $0, 0x2a
ori $9, $0, 0x2a
lui $27, 0x0
nop
nop
ori $31, $0, 0x36a4
beq $4, $9, Test33End
ori $31, $0, 0x36ac
ori $31, $0, 0x36ac
Test33End:
ori $31, $0, 0x5
Test34Begin:
ori $17, $0, 0x23
ori $4, $0, 0x23
beq $17, $4, Test34End
ori $31, $0, 0x36c4
sw $11, -64($19)
lw $11, 141($17)
nop
ori $31, $0, 0x36d4
ori $31, $0, 0x36d4
Test34End:
ori $31, $0, 0x11
Test35Begin:
ori $12, $0, 0x51
ori $19, $0, 0x51
sw $19, 71($19)
lw $12, 7($12)
beq $12, $19, Test35End
ori $31, $0, 0x36f4
add $10, $0, $0
ori $31, $0, 0x36f8
Test35End:
ori $31, $0, 0x15
Test36Begin:
ori $12, $0, 0x8a
ori $9, $0, 0x8a
ori $19, $0, 0x5
ori $5, $0, 0x5
beq $12, $9, Test36End
ori $31, $0, 0x3718
nop
ori $31, $0, 0x3720
lui $31, 0x0
beq $19, $5, Test36End
ori $31, $0, 0x372c
ori $31, $0, 0x372c
Test36End:
ori $9, $0, 0xf
ori $12, $0, 0x17
ori $31, $0, 0x9
Test37Begin:
add $31, $19, $17
sub $4, $31, $14
nop
sw $5, 56($31)
ori $31, $0, 0x374c
Test37End:
ori $31, $0, 0x2c
Test38Begin:
nop
nop
lui $15, 0x0
lw $11, 31($19)
ori $31, $0, 0x3764
Test38End:
ori $31, $0, 0x15
Test39Begin:
ori $15, $0, 0xa7
ori $14, $0, 0xa7
beq $15, $14, Test39End
ori $31, $0, 0x377c
sw $10, 0($0)
sw $15, 154($24)
sw $18, 71($4)
ori $31, $0, 0x3788
Test39End:
ori $15, $0, 0x1f
ori $14, $0, 0x29
ori $31, $0, 0x2f
Test40Begin:
lui $12, 0x0
lui $24, 0x0
nop
lui $0, 0x0
ori $31, $0, 0x37a8
Test40End:
ori $31, $0, 0xd
Test41Begin:
ori $4, $0, 0xa8
ori $0, $0, 0xa8
lui $14, 0x0
beq $4, $0, Test41End
ori $31, $0, 0x37c4
sw $25, 160($14)
sw $11, 8($4)
ori $31, $0, 0x37cc
Test41End:
ori $4, $0, 0x15
ori $31, $0, 0x23
Test42Begin:
lw $27, 3($19)
nop
ori $31, $0, 0x37e4
sw $31, 11($19)
lw $12, 8($14)
ori $31, $0, 0x37ec
Test42End:
ori $31, $0, 0x24
Test43Begin:
ori $25, $0, 0x7e
ori $17, $0, 0x7e
lw $5, -5($19)
add $27, $0, $14
lw $18, 28($27)
beq $25, $17, Test43End
ori $31, $0, 0x3810
ori $31, $0, 0x3810
Test43End:
ori $25, $0, 0x31
ori $5, $0, 0x12
ori $17, $0, 0xa
ori $18, $0, 0x20
ori $31, $0, 0xc
Test44Begin:
lui $15, 0x0
sw $15, 156($18)
add $24, $0, $19
nop
ori $31, $0, 0x3838
Test44End:
ori $31, $0, 0x22
Test45Begin:
ori $10, $0, 0xba
ori $17, $0, 0xba
ori $15, $0, 0xc3
ori $25, $0, 0xc3
beq $10, $17, Test45End
ori $31, $0, 0x3858
lw $0, 32($27)
sw $31, -14376($31)
beq $15, $25, Test45End
ori $31, $0, 0x3868
ori $31, $0, 0x3868
Test45End:
ori $15, $0, 0x0
ori $10, $0, 0x5
ori $25, $0, 0x29
ori $17, $0, 0x2a
ori $31, $0, 0x16
Test46Begin:
nop
nop
ori $31, $0, 0x388c
lw $5, 27($25)
nop
ori $31, $0, 0x3894
Test46End:
ori $31, $0, 0x28
Test47Begin:
ori $9, $0, 0x26
ori $24, $0, 0x26
nop
ori $31, $0, 0x38ac
lui $24, 0x0
beq $9, $24, Test47End
ori $31, $0, 0x38b8
nop
ori $31, $0, 0x38c0
ori $31, $0, 0x38c0
Test47End:
ori $31, $0, 0x29
Test48Begin:
ori $19, $0, 0x2e
ori $5, $0, 0x2e
sub $19, $15, $12
beq $19, $5, Test48End
ori $31, $0, 0x38dc
lw $25, 110($5)
sub $17, $17, $9
ori $31, $0, 0x38e4
Test48End:
ori $31, $0, 0x25
Test49Begin:
ori $19, $0, 0x9a
ori $10, $0, 0x9a
ori $12, $0, 0x52
ori $18, $0, 0x52
beq $19, $10, Test49End
ori $31, $0, 0x3904
lui $4, 0x0
beq $12, $18, Test49End
ori $31, $0, 0x3910
sub $18, $12, $11
ori $31, $0, 0x3914
Test49End:
ori $10, $0, 0x27
ori $19, $0, 0x2b
ori $31, $0, 0x10
Test50Begin:
ori $15, $0, 0x2f
ori $10, $0, 0x2f
beq $15, $10, Test50End
ori $31, $0, 0x3934
nop
lw $17, 54($18)
sw $12, -27($19)
ori $31, $0, 0x3940
Test50End:
ori $31, $0, 0x6
Test51Begin:
ori $10, $0, 0xaf
ori $27, $0, 0xaf
ori $27, $0, 0x80
ori $9, $0, 0x80
nop
ori $31, $0, 0x3960
lw $18, 113($15)
beq $10, $27, Test51End
ori $31, $0, 0x396c
beq $27, $9, Test51End
ori $31, $0, 0x3974
ori $31, $0, 0x3974
Test51End:
ori $10, $0, 0x2a
ori $9, $0, 0x15
ori $27, $0, 0x2b
ori $31, $0, 0x10
Test52Begin:
ori $5, $0, 0x6d
ori $24, $0, 0x6d
nop
nop
ori $31, $0, 0x399c
lw $25, 96($17)
beq $5, $24, Test52End
ori $31, $0, 0x39a8
ori $31, $0, 0x39a8
Test52End:
ori $5, $0, 0x1
ori $24, $0, 0x24
ori $31, $0, 0x1
Test53Begin:
ori $10, $0, 0x80
ori $14, $0, 0x80
sw $19, 167($11)
beq $10, $14, Test53End
ori $31, $0, 0x39cc
sub $25, $31, $25
add $15, $27, $31
ori $31, $0, 0x39d4
Test53End:
ori $10, $0, 0x10
ori $14, $0, 0x2a
ori $31, $0, 0x22
Test54Begin:
sw $19, 69($15)
lw $27, -9($9)
nop
ori $31, $0, 0x39f4
nop
ori $31, $0, 0x39f8
Test54End:
ori $31, $0, 0x23
Test55Begin:
add $12, $12, $0
sub $31, $10, $17
lui $24, 0x0
lui $27, 0x0
ori $31, $0, 0x3a10
Test55End:
ori $31, $0, 0x8
Test56Begin:
lw $0, 129($19)
lui $12, 0x0
add $24, $25, $25
lui $18, 0x0
ori $31, $0, 0x3a28
Test56End:
ori $31, $0, 0x22
Test57Begin:
lw $25, -15($19)
nop
ori $31, $0, 0x3a3c
lui $24, 0x0
nop
ori $31, $0, 0x3a48
ori $31, $0, 0x3a48
Test57End:
ori $25, $0, 0x11
ori $31, $0, 0xa
Test58Begin:
nop
nop
ori $31, $0, 0x3a60
nop
nop
ori $31, $0, 0x3a6c
ori $31, $0, 0x3a6c
Test58End:
ori $31, $0, 0x18
Test59Begin:
ori $9, $0, 0xa0
ori $4, $0, 0xa0
sw $31, -31($19)
nop
ori $31, $0, 0x3a88
nop
ori $31, $0, 0x3a90
beq $9, $4, Test59End
ori $31, $0, 0x3a98
ori $31, $0, 0x3a98
Test59End:
ori $4, $0, 0x14
ori $9, $0, 0xc
ori $31, $0, 0xc
Test60Begin:
ori $25, $0, 0xb4
ori $11, $0, 0xb4
lw $9, 152($24)
nop
ori $31, $0, 0x3abc
beq $25, $11, Test60End
ori $31, $0, 0x3ac4
sw $17, 38($14)
ori $31, $0, 0x3ac8
Test60End:
ori $11, $0, 0x15
ori $25, $0, 0xf
ori $31, $0, 0x1c
Test61Begin:
ori $19, $0, 0x58
ori $0, $0, 0x58
beq $19, $0, Test61End
ori $31, $0, 0x3ae8
nop
add $17, $5, $10
sub $0, $9, $12
ori $31, $0, 0x3af4
Test61End:
ori $31, $0, 0x2
Test62Begin:
sw $27, 115($17)
nop
lw $0, 99($17)
lw $19, 91($11)
ori $31, $0, 0x3b0c
Test62End:
ori $31, $0, 0x29
Test63Begin:
ori $9, $0, 0xc2
ori $24, $0, 0xc2
nop
ori $31, $0, 0x3b24
sub $19, $18, $15
nop
beq $9, $24, Test63End
ori $31, $0, 0x3b34
ori $31, $0, 0x3b34
Test63End:
ori $9, $0, 0x1d
ori $24, $0, 0xf
ori $31, $0, 0x14
Test64Begin:
ori $18, $0, 0x74
ori $4, $0, 0x74
nop
ori $31, $0, 0x3b54
lw $31, 159($9)
beq $18, $4, Test64End
ori $31, $0, 0x3b60
nop
ori $31, $0, 0x3b64
Test64End:
ori $4, $0, 0x9
ori $18, $0, 0x10
ori $31, $0, 0x13
