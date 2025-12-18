`include "global.v"
/**
 * MIPS流水线处理器
 * 包含5级流水线：取指(F)、译码(D)、执行(E)、访存(M)、写回(W)
 * 支持数据前推和冒险处理
 */
module mips(
    input wire clk,
    input wire reset,
    input wire [31:0] i_inst_rdata,
    input wire [31:0] m_data_rdata,
    output wire [31:0] i_inst_addr,
    output wire [31:0] m_data_addr,
    output wire [31:0] m_data_wdata,
    output wire [3 :0] m_data_byteen,
    output wire [31:0] m_inst_addr,
    output wire w_grf_we,
    output wire [4:0] w_grf_addr,
    output wire [31:0] w_grf_wdata,
    output wire [31:0] w_inst_addr
    );
	 
    // ==================== 全局信号定义 ====================
    // 数据前推选择信号
    wire [2:0] D_rdata1Choose;
    wire [2:0] D_rdata2Choose;  
    wire [2:0] E_rdata1Choose;
    wire [2:0] E_rdata2Choose;
    wire [2:0] M_rdata2Choose;
    
    // 控制信号
    wire clear;            // 流水线清除信号
    wire stall;            // 流水线暂停信号
    wire condition_link;   // 条件链接信号
	 wire busy;					// 乘除槽忙碌信号
    
    // ==================== F阶段(取指)信号 ====================
    wire [31:0] npc;
    wire [31:0] F_instr;
    wire [31:0] F_pc;
    
    // 分支跳转相关
    wire        flush;     // 分支预测失败刷新信号
	 wire [2 :0] npcMode;
    
    // ==================== D阶段(译码)信号 ====================
    wire [31:0] D_pc;              
    wire [31:0] D_instr;           
    wire [5:0]  D_opcode;          
    wire [5:0]  D_func;            
    wire [4:0]  D_rs, D_rt;        
    wire [25:0] D_instr_index;     
    wire [15:0] D_imm;
    wire [31:0] D_immSignExt;	 
    
    // 寄存器文件访问
    wire [2:0]  rd1Choose, rd2Choose; 
    wire [4:0]  rd1, rd2;          
    wire [31:0] grf_rdata1;        
    wire [31:0] grf_rdata2;        
    wire [31:0] D_rdata1;          
    wire [31:0] D_rdata2;         
    
    // 控制信号传递
    wire        D_grfWE;           
    wire        D_E_grfWE;         
    
    // ==================== E阶段(执行)信号 ====================
    wire [31:0] E_pc;              
    wire [31:0] E_instr;           
    wire [5:0]  E_opcode;          
    wire [5:0]  E_func;            
    wire [15:0] E_imm;             
    
    // 立即数扩展
    wire [31:0] E_immZeroExt;      
    wire [31:0] E_immSignExt;     
    
    // ALU操作数选择
    wire [2:0]  AChoose;           
    wire [2:0]  BChoose;           
    wire [5:0]  aluOp;
	 wire [3:0]  mdOp;
    
    // 数据通路
    wire [31:0] E_rdata1;          
    wire [31:0] E_rdata2;          
    wire [31:0] D_E_rdata1;        
    wire [31:0] D_E_rdata2;        
    wire [31:0] A, B;
	 wire [31:0] aluOut;
	 wire [31:0] mdOut;
    wire [31:0] E_aluOut;          
    
    // 流水线寄存器输出
    wire [31:0] E_M_aluOut;        
    wire [31:0] E_M_rdata2;        
    wire        E_M_grfWE;         
    
    // 常量定义
    reg [31:0] E_constant8 = 32'd8; // 常量8(用于JAL指令的PC+8)

    // ==================== M阶段(访存)信号 ====================
    wire [31:0] M_pc;              
    wire [31:0] M_instr;           
    wire [5:0]  M_opcode;          
    wire [5:0]  M_func;            
    
    // 内存访问控制
	 wire memWE;
    wire [2:0]  memAdrChoose;      
    wire [2:0]  memWdataChoose;     
    wire [3:0]  memWrite;          // 内存写信号（独热编码）
    
    // 数据通路
    wire [31:0] memAdr;            
    wire [31:0] memWdata;
	 wire [31:0] memWdata_raw;
	 wire [31:0] memOut;	 
    wire [31:0] M_memOut;          
    wire [31:0] M_rdata2;          
    wire [31:0] M_aluOut;
   
    // 流水线寄存器输出
    wire [31:0] M_W_memOut;        
    wire [31:0] M_W_aluOut;        
    wire        M_W_grfWE;        
    assign M_aluOut = E_M_aluOut;

    // ==================== W阶段(写回)信号 ====================
    wire [31:0] W_pc;              
    wire [31:0] W_instr;          
    wire [5:0]  W_opcode;          
    wire [5:0]  W_func;            
    wire [4:0]  W_rd, W_rt,W_ra; 
	 wire [4:0]  lr;					//新 load 指令专供
    
    // 写回控制
    wire [2:0]  wtChoose;         
    wire [2:0]  wdataChoose;     
    
    // 数据通路
    wire [31:0] wdata;             
    wire [4:0]  wt;                
    wire        W_grfWE;          
    wire [31:0] W_memOut;          
    wire [31:0] W_aluOut;         
	 wire [31:0] W_rdata2;
    
     // ==================== 扩展信号 ====================
	  
	  wire start = (E_instr[31:26] == `special && ((E_instr[5:0] & 6'b111100) == 6'b011000)) ? 1 : 0;	// 乘除指令
	 
	 assign memWrite = (memWE == 0) 				 ? 0                                      :
							 (M_instr[31:26] == `sw) ? 4'b1111 											:
							 (M_instr[31:26] == `sh) ? ((memAdr[1] == 1) ? 4'b1100 : 4'b0011) :
							 (M_instr[31:26] == `sb) ? (4'b0001 << memAdr[1:0])					:
							 0;
							 
	assign M_memOut = 
		 (M_instr[31:26] == `lw) ? memOut :
		 (M_instr[31:26] == `lh) ? (
			  (memAdr[1] == 1'b1) ? {{16{memOut[31]}}, memOut[31:16]} :
											{{16{memOut[15]}}, memOut[15:0]}
		 ) :
		 (M_instr[31:26] == `lb) ? (
			  (memAdr[1:0] == 2'b00) ? {{24{memOut[7]}},  memOut[7:0]}   :
			  (memAdr[1:0] == 2'b01) ? {{24{memOut[15]}}, memOut[15:8]}  :
			  (memAdr[1:0] == 2'b10) ? {{24{memOut[23]}}, memOut[23:16]} :
												{{24{memOut[31]}}, memOut[31:24]}   
		 ) :
		 memOut; // default
		 
    assign memWdata = (M_instr[31:26] == `sb) ? {4{memWdata_raw[7:0]}} :
                      (M_instr[31:26] == `sh) ? {2{memWdata_raw[15:0]}} :
                      memWdata_raw;		 
    
    assign W_aluOut = M_W_aluOut;  
    assign W_grfWE  = M_W_grfWE;
	 assign W_ra 	  = 5'd31;        								// 链接写地址 
	 assign lr 		  =	(W_opcode == `load) ? (0) : 0 ;		//TODO:set lr and connect
	 
	 assign W_memOut = M_W_memOut;  									// W阶段内存读数据（可修改为特别的数据）

    // ==================== 全局模块实例化 ====================
    
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
		  .busy(busy || start),
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
        .npc(npc),             
        .pc(F_pc)              
    );
    
    /**
     * 立即数扩展器 - 用于分支地址计算
     */
    
    /**
     * 下条地址计算单元 - 计算分支、跳转的目标地址
     */
    npc npcUnit(
        .pc(F_pc),             
        .immSignExt(D_immSignExt), 
        .instr_index(D_instr_index), 
        .rdata1(D_rdata1),     
        .rdata2(D_rdata2),     
        .npc(npc),
		  .mode(npcMode),
        .flush(flush),         
        .link(condition_link)           
    );
    
    /**
     * 指令存储器 - 读取指令
     */
	 
	 assign F_instr = i_inst_rdata;
	 assign i_inst_addr = F_pc;
	 
    
    /**
     * F->D流水线寄存器
     */
    alreg F_D_reg(
        .clk(clk),
        .reset(reset | (flush & ~stall)), // 复位或分支刷新
        .En_low(stall),         				// 暂停
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
	 
	 ext D_ext(
		.imm(D_imm),
		.immSignExt(D_immSignExt)
	 );
    
    /**
     * D阶段控制器 - 产生译码阶段控制信号
     */
    controller D_ctrl(
        .instr(D_instr),
        .rd1Choose(rd1Choose),   
        .rd2Choose(rd2Choose),   
        .grfWE(D_grfWE),
		  .npcMode(npcMode)
    );
    
    /**
     * 读寄存器地址选择器
     */
    mux5 rd1Chooser(
        .choose(rd1Choose),
        .input0(D_rs),           
        .out(rd1)               
    );
    
    mux5 rd2Chooser(
        .choose(rd2Choose),
        .input0(D_rt),           
        .out(rd2)                
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
        .rdata1(grf_rdata1),     // 读数据1
        .rdata2(grf_rdata2)      // 读数据2
    );
	 
	 assign w_grf_we = W_grfWE;	// 写使能
	 assign w_grf_addr = wt;		// 写地址
	 assign w_grf_wdata = wdata;	// 写数据
	 assign w_inst_addr = W_pc;	// 写操作时的PC(用于调试)
    
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
        .grfWE(D_grfWE | condition_link),  // 寄存器写使能(包含链接指令)
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
        .immZeroExt(E_immZeroExt),
        .immSignExt(E_immSignExt)  
    );
    
    /**
     * E阶段控制器 - 产生执行阶段控制信号
     */
    controller E_ctrl(
        .instr(E_instr),
		  .mdOp(mdOp),
        .AChoose(AChoose),       
        .BChoose(BChoose),       
        .aluOp(aluOp)            
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
        .out(aluOut)           // 运算结果
    );
	 
	 md md(
		.clk(clk),
		.reset(reset),
		.A(A),
		.B(B),
		.op(mdOp),
		.busy(busy),
		.out(mdOut)		
	 );
	 
	 wire [2:0] aluOutChoose = mdOp == 0 ? 0 : 1;
	 
	 mux32 aluOutChooser(
		.choose(aluOutChoose),
		.input0(aluOut),
		.input1(mdOut),
		.out(E_aluOut)
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
        .instr(M_instr),
        .memAdrChoose(memAdrChoose),   // 内存地址选择
        .memWdataChoose(memWdataChoose), // 内存写数据选择
		  .memWE(memWE)// 内存写使能
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
        .out(memWdata_raw)           // 内存写数据
    );
    
    /**
     * 数据存储器 - 读写数据内存
     */

	 assign m_data_addr = memAdr;   	// 内存地址
	 assign m_data_wdata = memWdata;	// 写数据
	 assign m_data_byteen = memWrite;// 写使能及类型
	 assign m_inst_addr = M_pc;		// 写操作时的PC(用于调试)
    assign memOut = m_data_rdata;	// 读数据
	 
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
        .instr(W_instr),
        .wtChoose(wtChoose),     
        .wdataChoose(wdataChoose)
    );
    
    /**
     * 写目标寄存器选择器
     */
    mux5 wtChooser(
        .choose(wtChoose),
        .input0(W_rd),           // 0: rd字段(R型指令)
        .input1(W_rt),           // 1: rt字段(I型指令)
        .input2(W_ra),           // 2: link寄存器
		  .input3(lr),					// 3: 新 load 专供
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