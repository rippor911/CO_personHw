//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:49:35 11/13/2025 
// Design Name: 
// Module Name:    producer 
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
`include "global.v"
module producer(
    input wire [31:0] instr,
	 input wire [2:0] Tnow,
	 input wire grfWE,
    output reg [2:0] Tnew,
    output reg [4:0] A
    );
	 //F_D_now = 0,D_E_now = 1,E_M_now = 2,M_W_now = 3
	 
	 wire [5:0] opcode;
	 wire [5:0] func;
	 wire [4:0] rt;
	 wire [4:0] rd;
	 wire [4:0] rs;
	 
	 splitter p_splitter(
		.instr(instr),
		.opcode(opcode),
		.func(func),
		.rt(rt),
		.rd(rd),
		.rs(rs)
	 );
	 
	 always @(*) begin
		if (grfWE == 1) begin
			if (opcode == `ori || opcode == `lui || opcode == `andi || opcode == `addi || opcode == `addiu) begin
				//cal_i
				A = rt;
				Tnew = (Tnow < 1) ? 1 - Tnow : 0;
			end else if (opcode == `special && (func != `jr)) begin	//注意这里可能因为指令集扩展而变化
				//cal_r
				A = rd;
				Tnew = (Tnow < 1) ? 1 - Tnow : 0;			
			end else if (opcode == `lw || opcode == `lb || opcode == `lh) begin
				//load
				A = rt;
				Tnew = (Tnow < 2) ? 2 - Tnow : 0;			
			end else if (opcode == `load) begin
				//TODO:set goal register
				A = 0;
				Tnew = (Tnow < 2) ? 2 - Tnow : 0;			
			end else if (opcode == `jal || opcode == `branch) begin
				//jmode
				A = 5'd31;
				Tnew = (Tnow < 1) ? 1 - Tnow : 0;
			end else if (opcode == `special && (func == `jr)) begin
				//jrmode
				A = rd;
				Tnew = (Tnow < 1) ? 1 - Tnow : 0;					
			end else if (opcode == `cop0 && (rs == `mfc0)) begin
				//mfc0	
				A = rt;
				Tnew = (Tnow < 2) ? 2 - Tnow : 0;			
			end else begin
				A = 0;
				Tnew = 0;
			end		
		end else begin
			A = 0;
			Tnew = 0;
		end
	 end
endmodule
