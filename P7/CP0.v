
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:37:51 12/06/2025 
// Design Name: 
// Module Name:    CP0 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
`define SR_id 12
`define Cause_id 13
`define EPC_id 14
`define SR register[`SR_id]
`define Cause register[`Cause_id]
`define EPC register[`EPC_id]
`define IM `SR[15:10]
`define EXL `SR[1]
`define IE `SR[0]
`define BD `Cause[31]
`define IP `Cause[15:10]
`define ExcCode `Cause[6:2]
module CP0(
    input  wire				clk,          // 时钟信号
    input  wire				reset,        // 复位信号
	 
    input  wire				en,           // 写使能信号
    input  wire	[4:0]		CP0Add,       // 寄存器地址 (5位)
    input  wire	[31:0]	CP0In,        // CP0 写入数据
    output wire	[31:0]	CP0Out,       // CP0 读出数据
	 
    input  wire	[31:0]	VPC,          // 受害 PC (Victim PC)
    input  wire            BDIn,         // 是否是延迟槽指令
    input  wire	[4:0]  	ExcCodeIn,    // 记录异常类型 (5位)
    input  wire	[5:0]  	HWInt,        // 输入中断信号 (6位)
    input  wire            EXLClr,       // 用来复位 EXL (Exception Level)
    output wire	[31:0] 	EPCOut,       // EPC 的值
    output wire            Req           // 进入处理程序请求 (Interrupt/Exception Request)
    );
	
	integer i;
	reg [31:0] register [0:31];
	
	assign Req = (~`EXL && ((`IE && (`IM & HWInt)) || (ExcCodeIn)));
	
	assign CP0Out = register[CP0Add];
	
	assign EPCOut = `EPC;
	
	wire [31:0] load = (CP0Add == `SR_id) 		?	(CP0In & 32'b0000_0000_0000_0000_1111_1100_0000_0011):	// 未实现位始终为0
							 CP0In;
	
	wire WriteEn = (CP0Add != `Cause_id);  //判断可写入范围
	
	always @(posedge clk) begin
		if (reset) begin
			for (i = 0 ; i < 32 ; i = i + 1) begin
				register[i] <= 0;
			end
		end else begin
			if (Req) begin
				`EXL 		<= 1;
				`BD 		<= BDIn;
				`ExcCode	<= (`IE && (`IM & HWInt)) ? 0 : ExcCodeIn;
				`EPC 		<= (BDIn) ? (VPC - 32'd4) : VPC;
			end else begin
				if (EXLClr) begin
					`EXL <= 0;
				end
				if (en && WriteEn) begin
					register[CP0Add] <= load;
				end
			end
			`IP <= HWInt;
		end
	end


endmodule
