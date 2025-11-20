# 初始化寄存器，使用ANDI清零$gp和$sp（但源寄存器为$s0，可能意图清零）
andi $gp, $s0, 0       # $gp = $s0 & 0，实际上将$gp清零
andi $sp, $s0, 0       # $sp = $s0 & 0，实际上将$sp清零

# 设置立即数到寄存器
ori $at, $zero, 0x1010 # $at = 0x1010
lui $v0, 0x8723        # $v0 = 0x87230000
ori $v1, $zero, 0x7856 # $v1 = 0x7856
lui $a0, 0x85ff        # $a0 = 0x85ff0000
ori $a1, $zero, 1      # $a1 = 1
lui $a2, 0xffff        # $a2 = 0xffff0000
ori $a3, $zero, 0xffff # $a3 = 0xffff

# 算术操作
add $s0, $v0, $v0      # $s0 = $v0 + $v0
add $t0, $v0, $v1      # $t0 = $v0 + $v1
sub $t0, $v0, $v0      # $t0 = $v0 - $v0，结果为0
sub $zero, $a2, $zero  # $zero = $a2 - $zero，无效果（$zero只读）

# 条件分支
beq $s3, $s1, label1   # 如果$s3 == $s1，跳转到label1（偏移3条指令）
nop                    # 延迟槽（空操作）
beq $zero, $zero, label2 # 无条件跳转到label2（偏移21条指令）
nop                    # 延迟槽（空操作）

label1:
beq $zero, $v0, label2 # 如果$v0 == 0，跳转到label2（偏移19条指令）
nop                    # 延迟槽（空操作）
ori $v0, $zero, 12     # $v0 = 12
nop                    # 空操作
nop                    # 空操作
nop                    # 空操作
jal 0x0000306c         # 跳转到绝对地址0x306c，并将返回地址保存到$ra
sw $at, 0($v0)         # 存储$at到地址$v0+0（$v0=12，地址可能无效）
beq $zero, $zero, label2 # 无条件跳转到label2（偏移11条指令）

# 以下代码不会被执行（因为前一条指令是无条件分支）
add $s0, $v0, $v0      # $s0 = $v0 + $v0（重复4次，死代码）
add $s0, $v0, $v0
add $s0, $v0, $v0
add $s0, $v0, $v0
sw $ra, 0($v0)         # 存储$ra到地址$v0+0
lw $at, 0($v0)         # 从地址$v0+0加载$at
nop                    # 空操作
nop                    # 空操作
nop                    # 空操作
jr $zero               # 跳转到地址0（通常表示退出或错误）
sw $ra, 0($v0)         # 存储$ra到地址$v0+0（死代码）

label2:
beq $zero, $zero, -1   # 无条件跳转到自身（无限循环）
nop                    # 延迟槽（空操作）