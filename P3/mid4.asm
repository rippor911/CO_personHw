ori $11, $0, 0xb0fa
ori $15, $0, 0x48a5
ori $24, $0, 0xea99
ori $8, $0, 0xc764
ori $31, $0, 0xa2b0
ori $25, $0, 0x165f
ori $0, $0, 0x15db
ori $24, $0, 0x7865
ori $18, $0, 0x9155
ori $20, $0, 0xb3f4
ori $26, $0, 0x573e
ori $21, $0, 0x5c65
ori $8, $0, 0xe9bb
ori $8, $0, 0x44a4
ori $31, $0, 0xf543
ori $15, $0, 0xeeed
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
ori $0, $0, 0x9
ori $15, $0, 0x2b
ori $10, $0, 0x19
ori $19, $0, 0x20
ori $11, $0, 0x19
ori $4, $0, 0x2f
ori $9, $0, 0xf
ori $27, $0, 0x1a
ori $25, $0, 0x20
ori $5, $0, 0x22
ori $24, $0, 0x3
ori $17, $0, 0x11
ori $12, $0, 0x30
ori $14, $0, 0xa
ori $18, $0, 0x3
ori $31, $0, 0x19
ori $20, $0, 0x30e4
ori $26, $0, 0x30e4
ori $8, $0, 0x30e4
ori $21, $0, 0x30e4
ori $22, $0, 0x30e4
ori $16, $0, 0x30e4
ori $13, $0, 0x30e4
ori $2, $0, 0x30dc
sw $5, 28($0)
sw $22, 8($0)
sw $26, 36($0)
sw $10, 16($0)
sw $15, 8($0)
sw $13, 0($0)
sw $0, 12($0)
sw $17, 28($0)
sw $10, 4($0)
sw $21, 16($0)
sw $2, 0($0)
sw $20, 20($0)
sw $8, 20($0)
sw $2, 32($0)
sw $16, 40($0)
sw $17, 44($0)
sw $20, 40($0)
sw $8, 12($0)
sw $25, 0($0)
sw $9, 4($0)
Test0Begin:
nop
nop
ori $31, $0, 0x31a4
sub $5, $5, $12
sw $25, 202($5)
ori $31, $0, 0x31ac
Test0End:
ori $31, $0, 0x1d
Test1Begin:
lw $11, 68($19)
nop
sw $19, 25($24)
nop
ori $31, $0, 0x31c8
ori $31, $0, 0x31c8
Test1End:
ori $31, $0, 0x29
Test2Begin:
ori $9, $0, 0x68
ori $11, $0, 0x68
sub $17, $10, $24
nop
ori $31, $0, 0x31e4
beq $9, $11, Test2End
ori $31, $0, 0x31ec
nop
ori $31, $0, 0x31f0
Test2End:
ori $11, $0, 0x9
ori $9, $0, 0x4
ori $31, $0, 0x21
Test3Begin:
sw $5, 8($19)
lui $24, 0x0
sw $15, 40($9)
sub $14, $0, $15
ori $31, $0, 0x3210
Test3End:
ori $31, $0, 0x20
Test4Begin:
add $11, $10, $24
lw $14, 27($11)
lui $14, 0x0
nop
ori $31, $0, 0x322c
ori $31, $0, 0x322c
Test4End:
ori $31, $0, 0x4
Test5Begin:
sw $14, 11($10)
sw $0, 132($0)
add $18, $0, $11
sw $17, -25($18)
ori $31, $0, 0x3244
Test5End:
ori $31, $0, 0x5
Test6Begin:
lui $25, 0x0
lw $10, 116($9)
nop
ori $31, $0, 0x325c
nop
ori $31, $0, 0x3260
Test6End:
ori $31, $0, 0x23
Test7Begin:
ori $9, $0, 0x1f
ori $15, $0, 0x1f
lui $25, 0x0
nop
beq $9, $15, Test7End
ori $31, $0, 0x3280
lw $25, 97($4)
ori $31, $0, 0x3284
Test7End:
ori $31, $0, 0x2c
Test8Begin:
ori $31, $0, 0x88
ori $18, $0, 0x88
beq $31, $18, Test8End
ori $31, $0, 0x329c
nop
ori $31, $0, 0x32a4
nop
ori $31, $0, 0x32ac
nop
ori $31, $0, 0x32b0
Test8End:
ori $18, $0, 0x19
ori $31, $0, 0xc
Test9Begin:
ori $4, $0, 0xa
ori $11, $0, 0xa
lui $18, 0x0
nop
ori $31, $0, 0x32d0
sub $4, $24, $24
beq $4, $11, Test9End
ori $31, $0, 0x32dc
ori $31, $0, 0x32dc
Test9End:
ori $31, $0, 0x1d
Test10Begin:
nop
lw $14, -2($17)
lw $4, 168($18)
nop
ori $31, $0, 0x32f8
ori $31, $0, 0x32f8
Test10End:
ori $14, $0, 0xc
ori $31, $0, 0x2e
Test11Begin:
sub $15, $15, $27
sub $18, $10, $9
nop
ori $31, $0, 0x3314
sub $15, $25, $19
ori $31, $0, 0x3318
Test11End:
ori $31, $0, 0x1b
Test12Begin:
ori $11, $0, 0x9d
ori $24, $0, 0x9d
sub $14, $10, $0
nop
ori $31, $0, 0x3334
beq $11, $24, Test12End
ori $31, $0, 0x333c
nop
ori $31, $0, 0x3344
ori $31, $0, 0x3344
Test12End:
ori $11, $0, 0x1
ori $24, $0, 0x23
ori $31, $0, 0x16
Test13Begin:
sw $24, 188($10)
lw $14, 4($14)
lw $12, 124($12)
lui $25, 0x0
ori $31, $0, 0x3364
Test13End:
ori $31, $0, 0x2a
Test14Begin:
nop
ori $31, $0, 0x3374
lui $24, 0x0
lui $31, 0x0
lui $17, 0x0
ori $31, $0, 0x3380
Test14End:
ori $31, $0, 0x24
Test15Begin:
add $5, $15, $25
nop
ori $31, $0, 0x3394
nop
add $19, $12, $10
ori $31, $0, 0x339c
Test15End:
ori $31, $0, 0x12
Test16Begin:
lw $5, 124($15)
nop
nop
nop
ori $31, $0, 0x33b8
ori $31, $0, 0x33b8
Test16End:
ori $31, $0, 0x27
Test17Begin:
add $14, $10, $27
lw $10, 41($31)
lw $14, 188($25)
lw $14, 141($14)
ori $31, $0, 0x33d0
Test17End:
ori $31, $0, 0x21
Test18Begin:
lui $27, 0x0
lw $0, 12($24)
lw $24, 35($11)
lw $11, 128($12)
ori $31, $0, 0x33e8
Test18End:
ori $31, $0, 0x2
Test19Begin:
ori $25, $0, 0xc4
ori $24, $0, 0xc4
sw $24, 120($19)
add $9, $18, $27
sw $18, 219($9)
beq $25, $24, Test19End
ori $31, $0, 0x340c
ori $31, $0, 0x340c
Test19End:
ori $25, $0, 0x15
ori $24, $0, 0x4
ori $31, $0, 0x2b
Test20Begin:
sw $11, 148($10)
nop
add $11, $19, $27
sub $18, $14, $24
ori $31, $0, 0x342c
Test20End:
ori $31, $0, 0xd
Test21Begin:
sw $18, 32($15)
sw $31, 111($9)
sw $11, 20($11)
nop
ori $31, $0, 0x3448
ori $31, $0, 0x3448
Test21End:
ori $31, $0, 0x1d
Test22Begin:
ori $15, $0, 0x98
ori $25, $0, 0x98
nop
ori $31, $0, 0x3460
sw $5, 156($18)
beq $15, $25, Test22End
ori $31, $0, 0x346c
nop
ori $31, $0, 0x3474
ori $31, $0, 0x3474
Test22End:
ori $15, $0, 0x2f
ori $25, $0, 0x15
ori $31, $0, 0x12
Test23Begin:
ori $15, $0, 0xb0
ori $17, $0, 0xb0
ori $5, $0, 0x95
ori $18, $0, 0x95
beq $15, $17, Test23End
ori $31, $0, 0x349c
beq $5, $18, Test23End
ori $31, $0, 0x34a4
sw $4, 32($4)
sw $9, 0($24)
ori $31, $0, 0x34ac
Test23End:
ori $15, $0, 0x1d
ori $5, $0, 0xf
ori $17, $0, 0xb
ori $18, $0, 0x1a
ori $31, $0, 0x16
Test24Begin:
ori $15, $0, 0x96
ori $9, $0, 0x96
add $4, $31, $4
add $5, $11, $17
sw $11, 81($5)
beq $15, $9, Test24End
ori $31, $0, 0x34e0
ori $31, $0, 0x34e0
Test24End:
ori $15, $0, 0x19
ori $9, $0, 0x18
ori $31, $0, 0xf
Test25Begin:
ori $18, $0, 0x72
ori $27, $0, 0x72
ori $9, $0, 0x77
ori $18, $0, 0x77
beq $18, $27, Test25End
ori $31, $0, 0x3508
nop
ori $31, $0, 0x3510
sw $15, 48($0)
beq $9, $18, Test25End
ori $31, $0, 0x351c
ori $31, $0, 0x351c
Test25End:
ori $9, $0, 0x30
ori $27, $0, 0x0
ori $18, $0, 0x11
ori $31, $0, 0x23
Test26Begin:
ori $24, $0, 0xe
ori $31, $0, 0xe
nop
lw $25, 116($0)
beq $24, $31, Test26End
ori $31, $0, 0x3548
lui $9, 0x0
ori $31, $0, 0x354c
Test26End:
ori $31, $0, 0x1e
Test27Begin:
lw $24, 172($27)
nop
ori $31, $0, 0x3560
lw $25, 19($18)
add $17, $19, $4
ori $31, $0, 0x3568
Test27End:
ori $31, $0, 0x1f
Test28Begin:
sub $25, $19, $15
lui $31, 0x0
nop
ori $31, $0, 0x3580
sub $31, $24, $31
ori $31, $0, 0x3584
Test28End:
ori $31, $0, 0x28
Test29Begin:
nop
lw $14, 192($24)
nop
nop
ori $31, $0, 0x359c
Test29End:
ori $31, $0, 0x1a
Test30Begin:
nop
ori $31, $0, 0x35ac
lui $31, 0x0
nop
lui $10, 0x0
ori $31, $0, 0x35b8
Test30End:
ori $31, $0, 0x29
Test31Begin:
lui $12, 0x0
nop
nop
ori $31, $0, 0x35d0
sw $5, 72($14)
ori $31, $0, 0x35d4
Test31End:
ori $31, $0, 0xe
Test32Begin:
ori $10, $0, 0x79
ori $5, $0, 0x79
ori $4, $0, 0x88
ori $5, $0, 0x88
lui $11, 0x0
lw $11, 96($19)
beq $10, $5, Test32End
ori $31, $0, 0x35fc
beq $4, $5, Test32End
ori $31, $0, 0x3604
ori $31, $0, 0x3604
Test32End:
ori $10, $0, 0x1
ori $4, $0, 0x14
ori $5, $0, 0x25
ori $31, $0, 0x0
Test33Begin:
lui $15, 0x0
lui $9, 0x0
lw $15, 84($31)
nop
ori $31, $0, 0x362c
ori $31, $0, 0x362c
Test33End:
ori $31, $0, 0x2e
Test34Begin:
sw $31, 115($10)
sw $25, -30($31)
lw $12, 49($25)
nop
ori $31, $0, 0x3648
ori $31, $0, 0x3648
Test34End:
ori $31, $0, 0x9
Test35Begin:
ori $25, $0, 0x2
ori $0, $0, 0x2
ori $27, $0, 0xc3
ori $5, $0, 0xc3
add $25, $10, $10
nop
ori $31, $0, 0x366c
beq $25, $0, Test35End
ori $31, $0, 0x3674
beq $27, $5, Test35End
ori $31, $0, 0x367c
ori $31, $0, 0x367c
Test35End:
ori $27, $0, 0x29
ori $5, $0, 0x6
ori $31, $0, 0x31
Test36Begin:
sw $19, 92($0)
lui $11, 0x0
nop
ori $31, $0, 0x369c
add $9, $10, $15
ori $31, $0, 0x36a0
Test36End:
ori $31, $0, 0xa
Test37Begin:
ori $14, $0, 0x79
ori $11, $0, 0x79
sw $12, 116($24)
lui $12, 0x0
lui $19, 0x0
beq $14, $11, Test37End
ori $31, $0, 0x36c4
ori $31, $0, 0x36c4
Test37End:
ori $11, $0, 0xe
ori $14, $0, 0x10
ori $31, $0, 0x2c
Test38Begin:
lui $14, 0x0
lui $11, 0x0
lui $31, 0x0
nop
ori $31, $0, 0x36e8
ori $31, $0, 0x36e8
Test38End:
ori $31, $0, 0x4
Test39Begin:
nop
sw $27, 140($0)
nop
ori $31, $0, 0x3700
lw $14, 88($19)
ori $31, $0, 0x3704
Test39End:
ori $31, $0, 0x1f
Test40Begin:
ori $10, $0, 0x4f
ori $9, $0, 0x4f
ori $12, $0, 0x25
ori $14, $0, 0x25
add $10, $27, $4
beq $10, $9, Test40End
ori $31, $0, 0x3728
beq $12, $14, Test40End
ori $31, $0, 0x3730
add $15, $17, $24
ori $31, $0, 0x3734
Test40End:
ori $31, $0, 0x15
Test41Begin:
ori $5, $0, 0x9f
ori $19, $0, 0x9f
lui $9, 0x0
lui $4, 0x0
sw $11, 180($4)
beq $5, $19, Test41End
ori $31, $0, 0x3758
ori $31, $0, 0x3758
Test41End:
ori $19, $0, 0x9
ori $5, $0, 0xb
ori $31, $0, 0x28
Test42Begin:
ori $10, $0, 0xc2
ori $17, $0, 0xc2
ori $25, $0, 0xba
ori $25, $0, 0xba
beq $10, $17, Test42End
ori $31, $0, 0x3780
beq $25, $25, Test42End
ori $31, $0, 0x3788
lw $10, 0($9)
nop
ori $31, $0, 0x3794
ori $31, $0, 0x3794
Test42End:
ori $10, $0, 0x25
ori $25, $0, 0x1e
ori $17, $0, 0x30
ori $31, $0, 0x26
Test43Begin:
nop
ori $31, $0, 0x37b0
nop
nop
nop
ori $31, $0, 0x37bc
Test43End:
ori $31, $0, 0xf
Test44Begin:
ori $11, $0, 0x16
ori $19, $0, 0x16
lui $10, 0x0
beq $11, $19, Test44End
ori $31, $0, 0x37d8
add $25, $11, $27
nop
ori $31, $0, 0x37e0
Test44End:
ori $31, $0, 0x9
Test45Begin:
lw $19, 55($14)
sub $14, $27, $15
lui $17, 0x0
nop
ori $31, $0, 0x37fc
ori $31, $0, 0x37fc
Test45End:
ori $31, $0, 0x25
Test46Begin:
lui $14, 0x0
nop
ori $31, $0, 0x3810
lui $9, 0x0
nop
ori $31, $0, 0x3818
Test46End:
ori $31, $0, 0x4
Test47Begin:
lw $31, 192($15)
add $5, $9, $24
lw $31, 84($5)
nop
ori $31, $0, 0x3834
ori $31, $0, 0x3834
Test47End:
ori $31, $0, 0x16
Test48Begin:
ori $19, $0, 0x6d
ori $0, $0, 0x6d
sub $31, $25, $9
beq $19, $0, Test48End
ori $31, $0, 0x3850
lw $27, 80($15)
lw $5, 132($5)
ori $31, $0, 0x3858
Test48End:
ori $19, $0, 0x8
ori $31, $0, 0x2f
Test49Begin:
lw $31, -4($19)
nop
ori $31, $0, 0x3870
sw $25, 116($4)
lw $5, 56($17)
ori $31, $0, 0x3878
Test49End:
ori $31, $0, 0x0
Test50Begin:
lw $4, 184($10)
nop
ori $31, $0, 0x388c
lui $14, 0x0
nop
ori $31, $0, 0x3894
Test50End:
ori $31, $0, 0x2e
Test51Begin:
nop
nop
lui $17, 0x0
sw $4, 87($27)
ori $31, $0, 0x38ac
Test51End:
ori $31, $0, 0x15
Test52Begin:
add $9, $4, $31
lw $0, 164($5)
nop
nop
ori $31, $0, 0x38c8
ori $31, $0, 0x38c8
Test52End:
ori $31, $0, 0x1b
Test53Begin:
lui $19, 0x0
add $0, $4, $0
lui $18, 0x0
lw $10, 94($11)
ori $31, $0, 0x38e0
Test53End:
ori $31, $0, 0x24
Test54Begin:
sw $11, 131($27)
lui $5, 0x0
lui $19, 0x0
sub $9, $5, $31
ori $31, $0, 0x38f8
Test54End:
ori $31, $0, 0x12
Test55Begin:
sub $14, $15, $12
nop
ori $31, $0, 0x390c
sub $12, $25, $9
lw $27, 41($14)
ori $31, $0, 0x3914
Test55End:
ori $31, $0, 0x18
Test56Begin:
lw $31, 101($27)
nop
ori $31, $0, 0x3928
sw $0, 132($15)
nop
ori $31, $0, 0x3934
ori $31, $0, 0x3934
Test56End:
ori $31, $0, 0x23
Test57Begin:
sub $10, $10, $10
nop
ori $31, $0, 0x3948
nop
ori $31, $0, 0x3950
lw $18, 149($14)
ori $31, $0, 0x3954
Test57End:
ori $31, $0, 0x29
Test58Begin:
sub $19, $19, $14
lui $4, 0x0
add $31, $10, $5
lw $24, -14($12)
ori $31, $0, 0x396c
Test58End:
ori $31, $0, 0xd
Test59Begin:
sw $10, 47($31)
sub $19, $0, $5
sub $5, $19, $14
nop
ori $31, $0, 0x3988
ori $31, $0, 0x3988
Test59End:
ori $31, $0, 0x31
Test60Begin:
lui $18, 0x0
nop
nop
ori $31, $0, 0x39a0
add $31, $17, $12
ori $31, $0, 0x39a4
Test60End:
ori $31, $0, 0x2e
Test61Begin:
lw $11, 156($4)
add $5, $15, $24
lui $14, 0x0
lw $4, 76($9)
ori $31, $0, 0x39bc
Test61End:
ori $31, $0, 0x2c
Test62Begin:
sw $27, 56($15)
nop
nop
nop
ori $31, $0, 0x39d4
Test62End:
ori $31, $0, 0x28
Test63Begin:
ori $10, $0, 0x2e
ori $4, $0, 0x2e
beq $10, $4, Test63End
ori $31, $0, 0x39ec
nop
sw $14, 58($12)
nop
ori $31, $0, 0x39fc
ori $31, $0, 0x39fc
Test63End:
ori $31, $0, 0x8
Test64Begin:
sw $31, 146($10)
nop
ori $31, $0, 0x3a10
add $14, $27, $25
nop
ori $31, $0, 0x3a18
Test64End:
ori $31, $0, 0xb
Test65Begin:
add $15, $25, $11
sub $19, $27, $18
sw $18, -15($19)
lw $27, 148($0)
ori $31, $0, 0x3a30
Test65End:
ori $31, $0, 0xe
Test66Begin:
add $19, $31, $31
sub $12, $15, $31
sw $11, 108($24)
lui $19, 0x0
ori $31, $0, 0x3a48
Test66End:
ori $31, $0, 0x10
Test67Begin:
sw $4, 132($19)
lui $0, 0x0
lw $17, 108($12)
nop
ori $31, $0, 0x3a60
Test67End:
ori $31, $0, 0x16
Test68Begin:
ori $25, $0, 0xaa
ori $14, $0, 0xaa
ori $12, $0, 0xbc
ori $0, $0, 0xbc
ori $17, $0, 0x4c
ori $17, $0, 0x4c
nop
ori $31, $0, 0x3a88
beq $25, $14, Test68End
ori $31, $0, 0x3a90
beq $12, $0, Test68End
ori $31, $0, 0x3a98
beq $17, $17, Test68End
ori $31, $0, 0x3aa0
ori $31, $0, 0x3aa0
Test68End:
ori $25, $0, 0x10
ori $12, $0, 0x21
ori $14, $0, 0x1
ori $31, $0, 0x20
Test69Begin:
nop
lui $9, 0x0
sw $15, 70($15)
add $25, $24, $15
ori $31, $0, 0x3ac4
Test69End:
ori $31, $0, 0x2b
Test70Begin:
sub $19, $31, $25
sw $10, 103($19)
add $9, $15, $9
lui $10, 0x0
ori $31, $0, 0x3adc
Test70End:
ori $31, $0, 0x26
Test71Begin:
nop
nop
ori $31, $0, 0x3af0
sw $31, 19($12)
add $5, $0, $5
ori $31, $0, 0x3af8
Test71End:
ori $31, $0, 0x10
Test72Begin:
ori $11, $0, 0x88
ori $10, $0, 0x88
beq $11, $10, Test72End
ori $31, $0, 0x3b10
add $9, $18, $0
nop
ori $31, $0, 0x3b1c
lw $27, 159($19)
ori $31, $0, 0x3b20
Test72End:
ori $10, $0, 0x8
ori $11, $0, 0x15
ori $31, $0, 0x1
