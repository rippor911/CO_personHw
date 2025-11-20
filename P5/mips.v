`include "global.v"
/**
 * MIPS流水线处理器
 * 包含5级流水线：取指(F)、译码(D)、执行(E)、访存(M)、写回(W)
 * 支持数据前推和冒险处理
 */
module mips(
    input wire clk,        // 时钟信号
    input wire reset       // 同步复位信号
    );
	 
    // ==================== 全局信号定义 ====================
    wire [31:0] time_now;  // 当前时钟周期计数，用于调试
    
    // 数据前推选择信号
    wire [2:0] D_rdata1Choose;  // D阶段寄存器rdata1数据源选择
    wire [2:0] D_rdata2Choose;  // D阶段寄存器rdata2数据源选择  
    wire [2:0] E_rdata1Choose;  // E阶段寄存器rdata1数据源选择
    wire [2:0] E_rdata2Choose;  // E阶段寄存器rdata2数据源选择
    wire [2:0] M_rdata2Choose;  // M阶段寄存器rdata2数据源选择
    
    // 控制信号
    wire clear;            // 流水线清除信号
    wire stall;            // 流水线暂停信号
    wire link;             // 链接指令信号(用于JAL等指令)
    
    // ==================== F阶段(取指)信号 ====================
    wire [31:0] npc;       // 下一条指令地址
    wire [31:0] F_instr;   // 取到的指令
    wire [31:0] F_pc;      // 当前PC值
    
    // 分支跳转相关
    wire [2:0]  mode;      // NPC计算模式
    wire [31:0] F_immSignExt; // 立即数符号扩展(用于分支地址计算)
    wire        flush;     // 分支预测失败刷新信号
    
    // ==================== D阶段(译码)信号 ====================
    wire [31:0] D_pc;              // D阶段PC值
    wire [31:0] D_instr;           // D阶段指令
    wire [5:0]  D_opcode;          // 操作码
    wire [5:0]  D_func;            // 功能码
    wire [4:0]  D_rs, D_rt;        // 源寄存器编号
    wire [25:0] D_instr_index;     // 指令索引(用于跳转)
    wire [15:0] D_imm;             // 立即数字段
    
    // 寄存器文件访问
    wire [2:0]  rd1Choose, rd2Choose; // 寄存器读地址选择
    wire [4:0]  rd1, rd2;          // 实际读寄存器地址
    wire [31:0] grf_rdata1;        // 寄存器文件读数据1
    wire [31:0] grf_rdata2;        // 寄存器文件读数据2
    wire [31:0] D_rdata1;          // 前推后的rdata1
    wire [31:0] D_rdata2;          // 前推后的rdata2
    
    // 控制信号传递
    wire        D_grfWE;           // D阶段产生的寄存器写使能
    wire        D_E_grfWE;         // 传递到E阶段的寄存器写使能
    
    // ==================== E阶段(执行)信号 ====================
    wire [31:0] E_pc;              // E阶段PC值
    wire [31:0] E_instr;           // E阶段指令
    wire [5:0]  E_opcode;          // 操作码
    wire [5:0]  E_func;            // 功能码
    wire [15:0] E_imm;             // 立即数字段
    
    // 立即数扩展
    wire [31:0] E_immZeroExt;      // 零扩展立即数
    wire [31:0] E_immSignExt;      // 符号扩展立即数
    
    // ALU操作数选择
    wire [2:0]  AChoose;           // ALU输入A选择
    wire [2:0]  BChoose;           // ALU输入B选择
    wire [5:0]  aluOp;             // ALU操作码
    
    // 数据通路
    wire [31:0] E_rdata1;          // 前推后的rdata1
    wire [31:0] E_rdata2;          // 前推后的rdata2
    wire [31:0] D_E_rdata1;        // 从D传递到E的rdata1
    wire [31:0] D_E_rdata2;        // 从D传递到E的rdata2
    wire [31:0] A, B;              // ALU输入操作数
    wire [31:0] E_aluOut;          // ALU计算结果
    
    // 流水线寄存器输出
    wire [31:0] E_M_aluOut;        // 传递到M阶段的ALU结果
    wire [31:0] E_M_rdata2;        // 传递到M阶段的rdata2
    wire        E_M_grfWE;         // 传递到M阶段的寄存器写使能
    
    // 常量定义
    reg [31:0] E_constant8 = 32'd8; // 常量8(用于JAL指令的PC+8)

    // ==================== M阶段(访存)信号 ====================
    wire [31:0] M_pc;              // M阶段PC值
    wire [31:0] M_instr;           // M阶段指令
    wire [5:0]  M_opcode;          // 操作码
    wire [5:0]  M_func;            // 功能码
    
    // 内存访问控制
    wire [2:0]  memAdrChoose;      // 内存地址选择
    wire [2:0]  memWdataChoose;    // 内存写数据选择  
    wire [2:0]  memWrite;          // 内存写使能及类型
    
    // 数据通路
    wire [31:0] memAdr;            // 内存访问地址
    wire [31:0] memWdata;          // 内存写数据
    wire [31:0] M_memOut;          // 内存读数据
    wire [31:0] M_rdata2;          // 前推后的rdata2
    wire [31:0] M_aluOut;          // M阶段ALU结果
    
    // 流水线寄存器输出
    wire [31:0] M_W_memOut;        // 传递到W阶段的内存读数据
    wire [31:0] M_W_aluOut;        // 传递到W阶段的ALU结果
    wire        M_W_grfWE;         // 传递到W阶段的寄存器写使能
    
    // 信号连接
    assign M_aluOut = E_M_aluOut;  // M阶段ALU结果

    // ==================== W阶段(写回)信号 ====================
    wire [31:0] W_pc;              // W阶段PC值
    wire [31:0] W_instr;           // W阶段指令
    wire [5:0]  W_opcode;          // 操作码
    wire [5:0]  W_func;            // 功能码
    wire [4:0]  W_rd, W_rt;        // 目的寄存器编号
    
    // 写回控制
    wire [2:0]  wtChoose;          // 写目标寄存器选择
    wire [2:0]  wdataChoose;       // 写数据选择
    
    // 数据通路
    wire [31:0] wdata;             // 写回数据
    wire [4:0]  wt;                // 写目标寄存器地址
    wire        W_grfWE;           // 寄存器写使能
    wire [31:0] W_memOut;          // W阶段内存读数据
    wire [31:0] W_aluOut;          // W阶段ALU结果
	 wire [31:0] W_rdata2;
    
    // 信号连接
    
    assign W_aluOut = M_W_aluOut;  // W阶段ALU结果
    assign W_grfWE = M_W_grfWE;    // W阶段寄存器写使能

    // 特殊寄存器定义
    reg [4:0] W_ra = 5'd31;        // $ra寄存器编号(31)
	 
	 
	 wire [4:0] lr =	(W_opcode == `load) ? (0) : 0 ;		//TODO:set lr and connect
	 
	 assign W_memOut = M_W_memOut;  // W阶段内存读数据

    // ==================== 全局模块实例化 ====================
    
    /**
     * 时钟周期计数器 - 用于调试和性能分析
     */
    counter counter(
        .clk(clk),
        .reset(reset),
        .time_now(time_now)
    );
    
    /**
     * 冒险控制单元 - 处理数据相关和控制相关
     */
    hazard_ctrl hazard_ctrl(
        .F_D_instr(D_instr),
        .D_E_instr(E_instr),
        .E_M_instr(M_instr),
        .M_W_instr(W_instr),
        .D_E_grfWE(D_E_grfWE),
        .E_M_grfWE(E_M_grfWE),
        .M_W_grfWE(M_W_grfWE),
		  .lr(lr),
        .D_rdata1Choose(D_rdata1Choose),
        .D_rdata2Choose(D_rdata2Choose),
        .E_rdata1Choose(E_rdata1Choose),
        .E_rdata2Choose(E_rdata2Choose),
        .M_rdata2Choose(M_rdata2Choose),
        .stall(stall),
        .clear(clear)
    );
    
    // ==================== F阶段(取指)模块 ====================
    
    /**
     * 程序计数器 - 存储当前指令地址
     */
    pc pc(
        .clk(clk),
        .reset(reset),
        .En_low(stall),        // 暂停时保持PC不变
        .npc(npc),             // 下一条指令地址
        .pc(F_pc)              // 当前指令地址
    );
    
    /**
     * 立即数扩展器 - 用于分支地址计算
     */
    ext F_ext(
        .imm(D_imm),
        .immSignExt(F_immSignExt)
    );
    
    /**
     * 下条地址计算单元 - 计算分支、跳转的目标地址
     */
    npc npcUnit(
        .mode(mode),           // 地址计算模式
        .pc(F_pc),             // 当前PC
        .immSignExt(F_immSignExt), // 符号扩展立即数
        .instr_index(D_instr_index), // 跳转指令索引
        .rdata1(D_rdata1),     // 寄存器读数据1(用于JR等)
        .rdata2(D_rdata2),     // 寄存器读数据2
        .npc(npc),             // 下一条指令地址
        .flush(flush),         // 分支刷新信号
        .link(link)            // 链接指令信号
    );
    
    /**
     * 指令存储器 - 读取指令
     */
    im im(
        .adr(F_pc),
        .instr(F_instr)
    );
    
    /**
     * F->D流水线寄存器
     */
    alreg F_D_reg(
        .clk(clk),
        .reset(reset | (flush & ~stall)), // 复位或分支刷新
        .En_low(stall | flush),           // 暂停或刷新时保持
        .X_pc(F_pc),
        .X_instr(F_instr),
        .Y_pc(D_pc),
        .Y_instr(D_instr)
    );
    
    // ==================== D阶段(译码)模块 ====================
    
    /**
     * 指令分解器 - 将指令分解为各个字段
     */
    splitter D_splitter(
        .instr(D_instr),
        .opcode(D_opcode),
        .func(D_func),
        .rs(D_rs),
        .rt(D_rt),
        .instr_index(D_instr_index),
        .imm(D_imm)
    );
    
    /**
     * D阶段控制器 - 产生译码阶段控制信号
     */
    controller D_ctrl(
        .opcode(D_opcode),
        .func(D_func),
        .rd1Choose(rd1Choose),   // 读寄存器1地址选择
        .rd2Choose(rd2Choose),   // 读寄存器2地址选择
        .grfWE(D_grfWE),         // 寄存器写使能
        .mode(mode)              // NPC计算模式
    );
    
    /**
     * 读寄存器地址选择器
     */
    mux5 rd1Chooser(
        .choose(rd1Choose),
        .input0(D_rs),           // 默认使用rs字段
        .out(rd1)                // 实际读寄存器1地址
    );
    
    mux5 rd2Chooser(
        .choose(rd2Choose),
        .input0(D_rt),           // 默认使用rt字段  
        .out(rd2)                // 实际读寄存器2地址
    );
    
    /**
     * 寄存器文件 - 32个32位通用寄存器
     */
    grf grf(
        .clk(clk),
        .reset(reset),
        .rd1(rd1),               // 读地址1
        .rd2(rd2),               // 读地址2
        .wt(wt),                 // 写地址
        .WE(W_grfWE),            // 写使能
        .wdata(wdata),           // 写数据
        .wPc(W_pc),              // 写操作时的PC(用于调试)
        .time_now(time_now),     // 当前时间(用于调试)
        .rdata1(grf_rdata1),     // 读数据1
        .rdata2(grf_rdata2)      // 读数据2
    );
    
    /**
     * D阶段数据前推选择器
     */
    mux32 D_rdata1Chooser(
        .choose(D_rdata1Choose),
        .input0(grf_rdata1),     // 0: 直接从寄存器文件读取
        .input1(M_aluOut),       // 1: 前推M阶段ALU结果
        .input2(W_memOut),       // 2: 前推W阶段内存数据
        .input3(W_aluOut),       // 3: 前推W阶段ALU结果
        .out(D_rdata1)
    );
    
    mux32 D_rdata2Chooser(
        .choose(D_rdata2Choose),
        .input0(grf_rdata2),     // 0: 直接从寄存器文件读取
        .input1(M_aluOut),       // 1: 前推M阶段ALU结果  
        .input2(W_memOut),       // 2: 前推W阶段内存数据
        .input3(W_aluOut),       // 3: 前推W阶段ALU结果
        .out(D_rdata2)
    );
    
    /**
     * D->E流水线寄存器
     */
    alreg D_E_reg(
        .clk(clk),
        .reset(reset | clear),   // 复位或流水线清除
        .En_low(1'b0),           // 始终使能
        .X_pc(D_pc),
        .X_instr(D_instr),
        .rdata1(D_rdata1),
        .rdata2(D_rdata2),
        .grfWE(D_grfWE | link),  // 寄存器写使能(包含链接指令)
        .Y_pc(E_pc),
        .Y_instr(E_instr),
        .X_Y_rdata1(D_E_rdata1),
        .X_Y_rdata2(D_E_rdata2),
        .X_Y_grfWE(D_E_grfWE)
    );
    
    // ==================== E阶段(执行)模块 ====================
    
    /**
     * E阶段指令分解器
     */
    splitter E_splitter (
        .instr(E_instr),
        .opcode(E_opcode),
        .func(E_func),
        .imm(E_imm)
    );
    
    /**
     * E阶段立即数扩展器
     */
    ext E_ext(
        .imm(E_imm),
        .immZeroExt(E_immZeroExt), // 零扩展
        .immSignExt(E_immSignExt)  // 符号扩展
    );
    
    /**
     * E阶段控制器 - 产生执行阶段控制信号
     */
    controller E_ctrl(
        .opcode(E_opcode),
        .func(E_func),
        .AChoose(AChoose),       // ALU输入A选择
        .BChoose(BChoose),       // ALU输入B选择
        .aluOp(aluOp)            // ALU操作码
    );
    
    /**
     * E阶段数据前推选择器
     */
    mux32 E_rdata1Chooser(
        .choose(E_rdata1Choose),
        .input0(D_E_rdata1),     // 0: 从D阶段传递的数据
        .input1(M_aluOut),       // 1: 前推M阶段ALU结果
        .input2(W_memOut),       // 2: 前推W阶段内存数据
        .input3(W_aluOut),       // 3: 前推W阶段ALU结果
        .out(E_rdata1)
    );
    
    mux32 E_rdata2Chooser(
        .choose(E_rdata2Choose),
        .input0(D_E_rdata2),     // 0: 从D阶段传递的数据
        .input1(M_aluOut),       // 1: 前推M阶段ALU结果
        .input2(W_memOut),       // 2: 前推W阶段内存数据
        .input3(W_aluOut),       // 3: 前推W阶段ALU结果
        .out(E_rdata2)
    );
    
    /**
     * ALU输入操作数选择器
     */
    mux32 AChooser(
        .choose(AChoose),
        .input0(E_rdata1),       // 0: 寄存器数据
        .input1(E_pc),           // 1: PC值(用于计算跳转地址)
        .out(A)                  // ALU输入A
    );
    
    mux32 BChooser(
        .choose(BChoose),
        .input0(E_rdata2),       // 0: 寄存器数据
        .input1(E_immZeroExt),   // 1: 零扩展立即数
        .input2(E_immSignExt),   // 2: 符号扩展立即数
        .input3(E_constant8),    // 3: 常量8(用于JAL指令)
        .out(B)                  // ALU输入B
    );
    
    /**
     * 算术逻辑单元 - 执行算术和逻辑运算
     */
    alu alu(
        .aluOp(aluOp),           // ALU操作码
        .A(A),                   // 输入A
        .B(B),                   // 输入B
        .out(E_aluOut)           // 运算结果
    );
    
    /**
     * E->M流水线寄存器
     */
    alreg E_M_reg(
        .clk(clk),
        .reset(reset),
        .En_low(1'b0),           // 始终使能
        .X_pc(E_pc),
        .X_instr(E_instr),
        .rdata2(E_rdata2),
        .aluOut(E_aluOut),
        .grfWE(D_E_grfWE),
        .Y_pc(M_pc),
        .Y_instr(M_instr),
        .X_Y_rdata2(E_M_rdata2),
        .X_Y_aluOut(E_M_aluOut),
        .X_Y_grfWE(E_M_grfWE)
    );
    
    // ==================== M阶段(访存)模块 ====================
    
    /**
     * M阶段指令分解器
     */
    splitter M_splitter(
        .instr(M_instr),
        .opcode(M_opcode),
        .func(M_func)
    );
    
    /**
     * M阶段控制器 - 产生访存阶段控制信号
     */
    controller M_ctrl(
        .opcode(M_opcode),
        .func(M_func),
        .memAdrChoose(memAdrChoose),   // 内存地址选择
        .memWdataChoose(memWdataChoose), // 内存写数据选择
        .memWrite(memWrite)            // 内存写使能
    );
    
    /**
     * M阶段数据前推选择器
     */
    mux32 M_rdata2Chooser(
        .choose(M_rdata2Choose),
        .input0(E_M_rdata2),     // 0: 从E阶段传递的数据
        .input2(W_memOut),       // 2: 前推W阶段内存数据
        .input3(W_aluOut),       // 3: 前推W阶段ALU结果
        .out(M_rdata2)
    );
    
    /**
     * 内存地址选择器
     */
    mux32 memAdrChooser(
        .choose(memAdrChoose),
        .input0(M_aluOut),       // 0: ALU计算结果
        .out(memAdr)             // 内存访问地址
    );
    
    /**
     * 内存写数据选择器  
     */
    mux32 memWdataChooser(
        .choose(memWdataChoose),
        .input0(M_rdata2),       // 0: 寄存器数据
        .out(memWdata)           // 内存写数据
    );
    
    /**
     * 数据存储器 - 读写数据内存
     */
    mem mem(
        .clk(clk),
        .reset(reset),
        .memAdr(memAdr),         // 内存地址
        .memWrite(memWrite),     // 写使能及类型
        .wdata(memWdata),        // 写数据
        .wPc(M_pc),              // 写操作时的PC(用于调试)
        .time_now(time_now),     // 当前时间(用于调试)
        .memOut(M_memOut)        // 读数据
    );
    
    /**
     * M->W流水线寄存器
     */
    alreg M_W_reg(
        .clk(clk),
        .reset(reset),
        .En_low(1'b0),           // 始终使能
        .X_pc(M_pc),
        .X_instr(M_instr),
        .aluOut(M_aluOut),
        .memOut(M_memOut),
        .grfWE(E_M_grfWE),
		  .rdata2(M_rdata2),
        .Y_pc(W_pc),
        .Y_instr(W_instr),
        .X_Y_aluOut(M_W_aluOut),
        .X_Y_memOut(M_W_memOut),
        .X_Y_grfWE(M_W_grfWE),
		  .X_Y_rdata2(W_rdata2)
    );
    
    // ==================== W阶段(写回)模块 ====================
    
    /**
     * W阶段指令分解器
     */
    splitter W_splitter(
        .instr(W_instr),
        .opcode(W_opcode),
        .func(W_func),
        .rd(W_rd),
        .rt(W_rt)
    );
    
    /**
     * W阶段控制器 - 产生写回阶段控制信号
     */
    controller W_ctrl(
        .opcode(W_opcode),
        .func(W_func),
        .wtChoose(wtChoose),     // 写目标寄存器选择
        .wdataChoose(wdataChoose) // 写数据选择
    );
    
    /**
     * 写目标寄存器选择器
     */
    mux5 wtChooser(
        .choose(wtChoose),
        .input0(W_rd),           // 0: rd字段(R型指令)
        .input1(W_rt),           // 1: rt字段(I型指令)
        .input2(W_ra),           // 2: $ra寄存器(JAL指令)
		  .input3(lr),
        .out(wt)                 // 实际写目标寄存器
    );
    
    /**
     * 写回数据选择器
     */
    mux32 wdataChooser(
        .choose(wdataChoose),
        .input0(W_aluOut),       // 0: ALU计算结果
        .input1(W_memOut),       // 1: 内存读数据
        .out(wdata)              // 写回寄存器文件的数据
    );
	 
endmodule