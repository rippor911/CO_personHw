ori $9, $0, 0x989d
ori $5, $0, 0xdd83
ori $15, $0, 0x5cfb
ori $16, $0, 0xc493
ori $28, $0, 0x9622
ori $0, $0, 0x5511
ori $14, $0, 0xc30
ori $3, $0, 0x788
ori $16, $0, 0xc427
ori $10, $0, 0x874f
ori $9, $0, 0x6f5e
ori $8, $0, 0x91e
ori $5, $0, 0x91f2
ori $21, $0, 0x2a57
ori $12, $0, 0x9630
ori $5, $0, 0x5e3
Jarea:
beq $0, $0, JareaEnd
JBackFor11_0:
add $11, $0, $31
jr $11
ori $0, $0, 0x3044
JBackFor11_1:
jr $31
ori $11, $0, 0x3050
JBackFor5_0:
add $5, $0, $31
jr $5
ori $0, $0, 0x3058
JBackFor5_1:
jr $31
ori $5, $0, 0x3064
JBackFor20_0:
add $20, $0, $31
jr $20
ori $0, $0, 0x306c
JBackFor20_1:
jr $31
ori $20, $0, 0x3078
JBackFor9_0:
add $9, $0, $31
jr $9
ori $0, $0, 0x3080
JBackFor9_1:
jr $31
ori $9, $0, 0x308c
JBackFor3_0:
add $3, $0, $31
jr $3
ori $0, $0, 0x3094
JBackFor3_1:
jr $31
ori $3, $0, 0x30a0
JBackFor28_0:
add $28, $0, $31
jr $28
ori $0, $0, 0x30a8
JBackFor28_1:
jr $31
ori $28, $0, 0x30b4
JBackFor15_0:
add $15, $0, $31
jr $15
ori $0, $0, 0x30bc
JBackFor15_1:
jr $31
ori $15, $0, 0x30c8
JBackFor16_0:
add $16, $0, $31
jr $16
ori $0, $0, 0x30d0
JBackFor16_1:
jr $31
ori $16, $0, 0x30dc
JBackFor31_0:
jr $31
JareaEnd:
ori $0, $0, 0xe
ori $10, $0, 0x6
ori $26, $0, 0x30
ori $12, $0, 0x17
ori $14, $0, 0x9
ori $27, $0, 0x31
ori $18, $0, 0xa
ori $24, $0, 0x2b
ori $25, $0, 0x17
ori $17, $0, 0x1a
ori $19, $0, 0x26
ori $8, $0, 0xd
ori $21, $0, 0x2e
ori $7, $0, 0x5
ori $1, $0, 0x13
ori $31, $0, 0x2f
ori $11, $0, 0x30e4
ori $5, $0, 0x30e4
ori $20, $0, 0x3078
ori $9, $0, 0x308c
ori $3, $0, 0x30a0
ori $28, $0, 0x30b4
ori $15, $0, 0x30e4
ori $16, $0, 0x30e4
sw $5, 32($0)
sw $12, 8($0)
sw $15, 36($0)
sw $27, 4($0)
sw $31, 0($0)
sw $7, 8($0)
sw $1, 44($0)
sw $16, 48($0)
sw $8, 4($0)
sw $16, 48($0)
sw $21, 44($0)
sw $14, 4($0)
sw $31, 16($0)
sw $10, 20($0)
sw $9, 32($0)
sw $15, 8($0)
sw $28, 8($0)
sw $17, 20($0)
sw $8, 4($0)
sw $12, 12($0)
Test0Begin:
lw $0, 99($14)
nop
sw $26, 177($1)
sw $14, 98($19)
ori $31, $0, 0x31a8
Test0End:
ori $31, $0, 0x1d
Test1Begin:
lw $21, 113($12)
ori $21, $24, 0x72
nop
ori $21, $8, 0xe
ori $31, $0, 0x31c0
Test1End:
ori $31, $0, 0xd
Test2Begin:
ori $21, $0, 0x4
ori $10, $0, 0x4
nop
beq $21, $10, Test2End
ori $31, $0, 0x31dc
sw $27, 65($1)
nop
ori $31, $0, 0x31e4
Test2End:
ori $31, $0, 0x1f
Test3Begin:
ori $24, $0, 0x45
ori $18, $0, 0x45
lw $8, 196($0)
sw $25, 153($31)
lui $14, 0x0
beq $24, $18, Test3End
ori $31, $0, 0x3208
ori $31, $0, 0x3208
Test3End:
ori $31, $0, 0x10
Test4Begin:
ori $8, $0, 0x58
ori $21, $0, 0x58
lw $21, 68($10)
lui $26, 0x0
beq $8, $21, Test4End
ori $31, $0, 0x3228
sw $8, 70($19)
ori $31, $0, 0x322c
Test4End:
ori $31, $0, 0x18
Test5Begin:
ori $26, $0, 0x9e
ori $26, $0, 0x9e
beq $26, $26, Test5End
ori $31, $0, 0x3244
lui $7, 0x0
ori $0, $18, 0xc4
lui $27, 0x0
ori $31, $0, 0x3250
Test5End:
ori $26, $0, 0x2a
ori $31, $0, 0x2b
Test6Begin:
ori $27, $0, 0x77
ori $14, $0, 0x77
ori $18, $0, 0x74
ori $0, $0, 0x74
lui $26, 0x0
beq $27, $14, Test6End
ori $31, $0, 0x3278
ori $24, $19, 0x5a
beq $18, $0, Test6End
ori $31, $0, 0x3284
ori $31, $0, 0x3284
Test6End:
ori $14, $0, 0x20
ori $27, $0, 0x2d
ori $18, $0, 0x21
ori $31, $0, 0xf
Test7Begin:
ori $0, $0, 0x99
ori $24, $19, 0x4e
ori $24, $25, 0x4d
sw $19, 156($10)
ori $31, $0, 0x32a8
Test7End:
ori $31, $0, 0x3
Test8Begin:
lui $12, 0x0
lui $27, 0x0
sw $27, -79($24)
ori $7, $26, 0x4c
ori $31, $0, 0x32c0
Test8End:
ori $31, $0, 0x17
Test9Begin:
ori $8, $0, 0xb9
ori $19, $0, 0xb9
ori $19, $0, 0x58
ori $0, $0, 0x58
sw $24, 140($12)
beq $8, $19, Test9End
ori $31, $0, 0x32e4
beq $19, $0, Test9End
ori $31, $0, 0x32ec
duandianceshi:nop#∂œµÁ≤‚ ‘
lw $17, 76($0)
ori $31, $0, 0x32f0
Test9End:
ori $8, $0, 0x16
ori $31, $0, 0x8
Test10Begin:
ori $25, $26, 0x65
ori $24, $26, 0x2d
lw $0, 20($0)
lui $14, 0x0
ori $31, $0, 0x330c
Test10End:
ori $25, $0, 0x23
ori $31, $0, 0x8
Test11Begin:
ori $21, $0, 0x77
ori $10, $0, 0x77
ori $7, $25, 0x4d
lw $0, -36($19)
beq $21, $10, Test11End
ori $31, $0, 0x3330
lw $1, 46($8)
ori $31, $0, 0x3334
Test11End:
ori $10, $0, 0x24
ori $21, $0, 0x7
ori $7, $0, 0x1c
ori $31, $0, 0x16
Test12Begin:
ori $8, $0, 0x1a
ori $26, $0, 0x1a
beq $8, $26, Test12End
ori $31, $0, 0x3358
lw $17, -9($24)
lw $0, -12948($31)
sw $19, 165($21)
ori $31, $0, 0x3364
Test12End:
ori $31, $0, 0x10
Test13Begin:
ori $14, $0, 0x54
ori $27, $0, 0x54
beq $14, $27, Test13End
ori $31, $0, 0x337c
lw $14, 24($17)
lw $26, 105($1)
lui $27, 0x0
ori $31, $0, 0x3388
Test13End:
ori $31, $0, 0x25
Test14Begin:
ori $27, $0, 0x95
ori $10, $0, 0x95
beq $27, $10, Test14End
ori $31, $0, 0x33a0
sw $17, 97($21)
sw $26, 40($7)
ori $27, $10, 0x9
ori $31, $0, 0x33ac
Test14End:
ori $10, $0, 0x3
ori $27, $0, 0x2b
ori $31, $0, 0x24
Test15Begin:
ori $19, $0, 0xbb
ori $27, $0, 0xbb
nop
lw $25, 37($21)
sw $25, 68($7)
beq $19, $27, Test15End
ori $31, $0, 0x33d8
ori $31, $0, 0x33d8
Test15End:
ori $27, $0, 0x2d
ori $19, $0, 0x2f
ori $31, $0, 0x1
Test16Begin:
ori $7, $0, 0x68
ori $21, $0, 0x68
ori $18, $10, 0x6e
beq $7, $21, Test16End
ori $31, $0, 0x33fc
ori $31, $21, 0x96
lui $1, 0x0
ori $31, $0, 0x3404
Test16End:
ori $18, $0, 0x2f
ori $21, $0, 0x1a
ori $7, $0, 0x21
ori $31, $0, 0x5
Test17Begin:
lui $14, 0x0
sw $1, 43($24)
lw $7, 110($21)
sw $21, -2($8)
ori $31, $0, 0x3428
Test17End:
ori $31, $0, 0x8
Test18Begin:
ori $25, $1, 0x2f
nop
ori $31, $1, 0x29
lw $18, 188($12)
ori $31, $0, 0x3440
Test18End:
ori $31, $0, 0x17
Test19Begin:
ori $25, $0, 0x35
ori $27, $0, 0x35
lui $31, 0x0
ori $10, $21, 0xb
beq $25, $27, Test19End
ori $31, $0, 0x3460
sw $24, 158($26)
ori $31, $0, 0x3464
Test19End:
ori $31, $0, 0x24
Test20Begin:
ori $8, $0, 0x7b
ori $10, $0, 0x7b
lui $8, 0x0
lui $24, 0x0
beq $8, $10, Test20End
ori $31, $0, 0x3484
lw $8, 76($12)
ori $31, $0, 0x3488
Test20End:
ori $10, $0, 0x6
ori $31, $0, 0xd
Test21Begin:
ori $12, $10, 0x74
nop
nop
sw $19, 74($12)
ori $31, $0, 0x34a4
Test21End:
ori $12, $0, 0x10
ori $31, $0, 0x27
Test22Begin:
ori $24, $0, 0x39
ori $12, $0, 0x39
nop
lw $12, 94($10)
ori $27, $26, 0x93
beq $24, $12, Test22End
ori $31, $0, 0x34cc
ori $31, $0, 0x34cc
Test22End:
ori $27, $0, 0x19
ori $31, $0, 0x23
Test23Begin:
ori $17, $0, 0x64
ori $21, $0, 0x64
ori $21, $27, 0x80
lui $26, 0x0
beq $17, $21, Test23End
ori $31, $0, 0x34f0
sw $25, 148($8)
ori $31, $0, 0x34f4
Test23End:
ori $21, $0, 0x1d
ori $31, $0, 0x2a
Test24Begin:
lui $17, 0x0
lw $31, 65($1)
lw $24, 20($12)
ori $25, $10, 0x52
ori $31, $0, 0x3510
Test24End:
ori $31, $0, 0x29
Test25Begin:
lw $10, 184($12)
lw $21, 89($19)
lui $18, 0x0
sw $26, 111($27)
ori $31, $0, 0x3528
Test25End:
ori $31, $0, 0xf
Test26Begin:
nop
lui $25, 0x0
lui $8, 0x0
sw $8, 176($25)
ori $31, $0, 0x3540
Test26End:
ori $31, $0, 0x2b
Test27Begin:
ori $1, $0, 0x1b
ori $25, $0, 0x1b
beq $1, $25, Test27End
ori $31, $0, 0x3558
lw $18, 120($8)
nop
lw $31, 64($0)
ori $31, $0, 0x3564
Test27End:
ori $31, $0, 0x13
Test28Begin:
ori $8, $0, 0x84
ori $14, $0, 0x84
ori $27, $0, 0x11
ori $24, $0, 0x11
ori $10, $0, 0x18
ori $19, $0, 0x18
beq $8, $14, Test28End
ori $31, $0, 0x358c
lui $31, 0x0
beq $27, $24, Test28End
ori $31, $0, 0x3598
beq $10, $19, Test28End
ori $31, $0, 0x35a0
ori $31, $0, 0x35a0
Test28End:
ori $14, $0, 0x2d
ori $8, $0, 0x5
ori $31, $0, 0x2b
Test29Begin:
ori $12, $27, 0x83
lui $25, 0x0
lw $8, 64($18)
lui $1, 0x0
ori $31, $0, 0x35c0
Test29End:
ori $12, $0, 0x2b
ori $31, $0, 0x11
Test30Begin:
nop
nop
sw $26, 75($24)
ori $8, $24, 0x82
ori $31, $0, 0x35dc
Test30End:
ori $8, $0, 0x15
ori $31, $0, 0x1a
Test31Begin:
ori $19, $0, 0x4b
ori $17, $0, 0x4b
beq $19, $17, Test31End
ori $31, $0, 0x35f8
sw $31, -9($14)
ori $24, $18, 0x18
sw $0, -27($17)
ori $31, $0, 0x3604
Test31End:
ori $31, $0, 0x1e
Test32Begin:
ori $19, $0, 0x22
ori $27, $0, 0x22
nop
sw $18, 74($27)
nop
beq $19, $27, Test32End
ori $31, $0, 0x3628
ori $31, $0, 0x3628
Test32End:
ori $31, $0, 0x13
Test33Begin:
ori $0, $0, 0x27
ori $8, $0, 0x27
ori $1, $0, 0xb7
ori $31, $0, 0xb7
ori $18, $0, 0x3c
ori $12, $0, 0x3c
ori $31, $0, 0x69
ori $10, $0, 0x69
beq $0, $8, Test33End
ori $31, $0, 0x3658
beq $1, $31, Test33End
ori $31, $0, 0x3660
beq $18, $12, Test33End
ori $31, $0, 0x3668
beq $31, $10, Test33End
ori $31, $0, 0x3670
ori $31, $0, 0x3670
Test33End:
ori $10, $0, 0x27
ori $1, $0, 0x3
ori $31, $0, 0x15
Test34Begin:
sw $18, 101($17)
lui $8, 0x0
ori $8, $14, 0x27
sw $8, 88($26)
ori $31, $0, 0x3690
Test34End:
ori $31, $0, 0x1
Test35Begin:
ori $8, $0, 0x47
ori $10, $0, 0x47
lw $14, 65($10)
ori $8, $21, 0xad
beq $8, $10, Test35End
ori $31, $0, 0x36b0
nop
ori $31, $0, 0x36b4
Test35End:
ori $8, $0, 0x1f
ori $31, $0, 0x16
Test36Begin:
ori $14, $0, 0x80
ori $21, $0, 0x80
ori $27, $0, 0x96
ori $27, $0, 0x96
sw $8, 26($31)
nop
beq $14, $21, Test36End
ori $31, $0, 0x36e0
beq $27, $27, Test36End
ori $31, $0, 0x36e8
ori $31, $0, 0x36e8
Test36End:
ori $14, $0, 0x2d
ori $27, $0, 0x2
ori $21, $0, 0x22
ori $31, $0, 0x17
Test37Begin:
sw $19, -63($10)
ori $24, $17, 0xb5
ori $26, $31, 0x1b
ori $8, $18, 0x6d
ori $31, $0, 0x370c
Test37End:
ori $24, $0, 0x30
ori $8, $0, 0xd
ori $31, $0, 0x6
Test38Begin:
sw $27, 137($26)
lui $17, 0x0
lui $18, 0x0
sw $10, 142($21)
ori $31, $0, 0x372c
Test38End:
ori $31, $0, 0x7
Test39Begin:
ori $24, $10, 0x6f
lw $12, 30($19)
sw $12, -14($19)
sw $8, 47($7)
ori $31, $0, 0x3744
Test39End:
ori $24, $0, 0x13
ori $31, $0, 0xe
Test40Begin:
ori $14, $0, 0x63
ori $18, $0, 0x63
beq $14, $18, Test40End
ori $31, $0, 0x3760
nop
lw $12, 32($0)
lw $12, 152($17)
ori $31, $0, 0x376c
Test40End:
ori $31, $0, 0x3
Test41Begin:
ori $8, $0, 0x55
ori $0, $0, 0x55
beq $8, $0, Test41End
ori $31, $0, 0x3784
ori $21, $24, 0x10
ori $10, $7, 0x5b
lui $17, 0x0
ori $31, $0, 0x3790
Test41End:
ori $31, $0, 0xc
Test42Begin:
ori $19, $10, 0x57
lui $1, 0x0
lw $31, 17($10)
ori $25, $8, 0x14
ori $31, $0, 0x37a8
Test42End:
ori $31, $0, 0x1b
Test43Begin:
lui $14, 0x0
nop
lui $25, 0x0
nop
ori $31, $0, 0x37c0
Test43End:
ori $31, $0, 0x2
Test44Begin:
ori $26, $0, 0xc5
ori $12, $0, 0xc5
beq $26, $12, Test44End
ori $31, $0, 0x37d8
sw $25, 69($18)
sw $10, 61($21)
ori $24, $17, 0x7e
ori $31, $0, 0x37e4
Test44End:
ori $26, $0, 0x29
ori $12, $0, 0x11
ori $31, $0, 0x1b
Test45Begin:
ori $7, $26, 0x34
lw $12, 91($12)
ori $24, $14, 0xd
lui $25, 0x0
ori $31, $0, 0x3804
Test45End:
ori $31, $0, 0x29
Test46Begin:
sw $25, 60($25)
lui $18, 0x0
sw $24, 12($25)
ori $1, $1, 0x94
ori $31, $0, 0x381c
Test46End:
ori $1, $0, 0x1c
ori $31, $0, 0x25
Test47Begin:
sw $27, 76($12)
nop
sw $18, 64($14)
lw $21, -13($26)
ori $31, $0, 0x3838
Test47End:
ori $31, $0, 0x2a
Test48Begin:
ori $12, $0, 0x72
ori $0, $0, 0x72
beq $12, $0, Test48End
ori $31, $0, 0x3850
lui $26, 0x0
ori $0, $7, 0x63
lui $14, 0x0
ori $31, $0, 0x385c
Test48End:
ori $12, $0, 0x2d
ori $31, $0, 0x26
Test49Begin:
lui $1, 0x0
nop
ori $1, $1, 0x81
sw $10, 152($0)
ori $31, $0, 0x3878
Test49End:
ori $1, $0, 0x9
ori $31, $0, 0x24
Test50Begin:
ori $7, $0, 0x5d
ori $21, $0, 0x5d
lw $7, -1($12)
nop
ori $31, $17, 0x61
beq $7, $21, Test50End
ori $31, $0, 0x38a0
ori $31, $0, 0x38a0
Test50End:
ori $31, $0, 0x15
Test51Begin:
sw $7, 136($26)
lui $24, 0x0
lw $7, 38($7)
sw $18, 4($24)
ori $31, $0, 0x38b8
Test51End:
ori $31, $0, 0xe
Test52Begin:
lw $0, 132($26)
lui $12, 0x0
sw $14, 160($7)
nop
ori $31, $0, 0x38d0
Test52End:
ori $31, $0, 0x30
Test53Begin:
ori $8, $0, 0x58
ori $27, $0, 0x58
ori $18, $26, 0xad
beq $8, $27, Test53End
ori $31, $0, 0x38ec
lui $24, 0x0
ori $25, $31, 0x41
ori $31, $0, 0x38f4
Test53End:
ori $18, $0, 0x25
ori $31, $0, 0x18
Test54Begin:
ori $25, $0, 0x85
ori $1, $0, 0x85
lw $26, 13($19)
ori $8, $12, 0xaa
sw $12, 172($31)
beq $25, $1, Test54End
ori $31, $0, 0x391c
ori $31, $0, 0x391c
Test54End:
ori $25, $0, 0x0
ori $8, $0, 0x17
ori $1, $0, 0x8
ori $31, $0, 0x0
Test55Begin:
ori $12, $0, 0x64
ori $1, $0, 0x64
beq $12, $1, Test55End
ori $31, $0, 0x3940
lui $27, 0x0
ori $14, $10, 0xc7
lui $25, 0x0
ori $31, $0, 0x394c
Test55End:
ori $31, $0, 0x1f
Test56Begin:
ori $17, $10, 0xb7
sw $27, 188($7)
ori $19, $18, 0x2d
sw $19, 28($25)
ori $31, $0, 0x3964
Test56End:
ori $17, $0, 0x2c
ori $31, $0, 0x1e
Test57Begin:
lui $27, 0x0
ori $14, $12, 0xac
sw $31, 128($26)
lw $7, 132($26)
ori $31, $0, 0x3980
Test57End:
ori $14, $0, 0x15
ori $31, $0, 0x28
Test58Begin:
ori $26, $0, 0x9a
ori $27, $0, 0x9a
beq $26, $27, Test58End
ori $31, $0, 0x399c
nop
sw $26, 24($17)
nop
ori $31, $0, 0x39a8
Test58End:
ori $26, $0, 0x23
ori $27, $0, 0x2a
ori $31, $0, 0xb
Test59Begin:
nop
ori $14, $0, 0x13
nop
sw $31, -3($10)
ori $31, $0, 0x39c8
Test59End:
ori $31, $0, 0x1
Test60Begin:
sw $21, 100($7)
nop
nop
sw $21, 105($8)
ori $31, $0, 0x39e0
Test60End:
ori $31, $0, 0x17
Test61Begin:
ori $17, $0, 0xba
ori $25, $0, 0xba
sw $25, -106($25)
nop
beq $17, $25, Test61End
ori $31, $0, 0x3a00
lui $19, 0x0
ori $31, $0, 0x3a04
Test61End:
ori $25, $0, 0x10
ori $17, $0, 0x2b
ori $31, $0, 0x31
Test62Begin:
ori $12, $0, 0x66
ori $18, $0, 0x66
ori $12, $0, 0x5d
ori $25, $0, 0x5d
beq $12, $18, Test62End
ori $31, $0, 0x3a2c
nop
lui $24, 0x0
beq $12, $25, Test62End
ori $31, $0, 0x3a3c
ori $31, $0, 0x3a3c
Test62End:
ori $18, $0, 0x6
ori $31, $0, 0xa
Test63Begin:
nop
nop
lw $17, 125($17)
lw $7, -35($10)
ori $31, $0, 0x3a58
Test63End:
ori $31, $0, 0x7
Test64Begin:
ori $24, $25, 0xae
ori $25, $21, 0x16
lui $25, 0x0
lw $26, 63($19)
ori $31, $0, 0x3a70
Test64End:
ori $24, $0, 0x19
ori $31, $0, 0x1d
Test65Begin:
ori $27, $0, 0x3e
ori $0, $0, 0x3e
ori $8, $12, 0xab
sw $10, 152($26)
beq $27, $0, Test65End
ori $31, $0, 0x3a94
lui $17, 0x0
ori $31, $0, 0x3a98
Test65End:
ori $8, $0, 0x9
ori $31, $0, 0x7
Test66Begin:
lui $26, 0x0
lui $1, 0x0
lw $8, -33($12)
ori $10, $14, 0x82
ori $31, $0, 0x3ab4
Test66End:
ori $10, $0, 0x1b
ori $31, $0, 0x22
Test67Begin:
lui $12, 0x0
sw $19, 121($14)
nop
ori $0, $19, 0xa
ori $31, $0, 0x3ad0
Test67End:
ori $31, $0, 0x2d
Test68Begin:
ori $21, $10, 0x97
lw $18, 72($8)
lui $8, 0x0
lui $18, 0x0
ori $31, $0, 0x3ae8
Test68End:
ori $21, $0, 0x17
ori $31, $0, 0x1d
Test69Begin:
lui $24, 0x0
lui $27, 0x0
lui $10, 0x0
sw $7, 115($7)
ori $31, $0, 0x3b04
Test69End:
ori $31, $0, 0x2d
Test70Begin:
ori $10, $0, 0xa
ori $8, $0, 0xa
lw $31, 50($10)
lui $24, 0x0
lw $25, 12($27)
beq $10, $8, Test70End
ori $31, $0, 0x3b28
ori $31, $0, 0x3b28
Test70End:
ori $31, $0, 0xa
Test71Begin:
lui $1, 0x0
lui $12, 0x0
lui $24, 0x0
ori $25, $18, 0x70
ori $31, $0, 0x3b40
Test71End:
ori $25, $0, 0xe
ori $31, $0, 0x29
