//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:35:10 11/14/2025 
// Design Name: 
// Module Name:    consumer 
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
module consumer(
    input wire [31:0] instr,
    output reg [4:0] A_1,
    output reg [2:0] Tuse_1,
    output reg [4:0] A_2,
    output reg [2:0] Tuse_2
    );
	 wire [5:0] opcode;
	 wire [5:0] func;
	 wire [4:0] rs;
	 wire [4:0] rt;
	 wire [4:0] rd;
	 
	 splitter c_splitter(
		.instr(instr),
		.opcode(opcode),
		.func(func),
		.rs(rs),
		.rt(rt),
		.rd(rd)
	 );
	 
	 always @(*) begin
		if (opcode == `ori || opcode == `lui || opcode == `andi || opcode == `addi || opcode == `addiu) begin
			//cal_i
			A_1 = rs;
			A_2 = 0;
			Tuse_1 = 1;
			Tuse_2 = 0;
		end else if (opcode == `special && (func != `jr)) begin		//注意这里可能因为指令集扩展而变化
			//cal_r
			A_1 = rs;
			A_2 = rt;
			Tuse_1 = 1;
			Tuse_2 = 1;			
		end else if (opcode == `lw || opcode == `lb || opcode == `lh) begin
			//load
			A_1 = rs;
			A_2 = 0;
			Tuse_1 = 1;
			Tuse_2 = 0;			
		end else if (opcode == `load) begin
			//TODO: set A_1,A_2
			A_1 = rs;
			A_2 = 0;
			Tuse_1 = 1;
			Tuse_2 = 0;						
		end else if (opcode == `sw || opcode == `sb || opcode == `sh) begin
			//save
			A_1 = rs;
			A_2 = rt;
			Tuse_1 = 1;
			Tuse_2 = 2;					
		end else if (opcode == `beq || opcode == `branch || opcode == `bne) begin
			//branch
			A_1 = rs;
			A_2 = rt;
			Tuse_1 = 0;
			Tuse_2 = 0;
		end else if (opcode == `jal) begin
			//jmode
			A_1 = 0;
			A_2 = 0;
			Tuse_1 = 0;
			Tuse_2 = 0;					
		end else if (opcode == `special && (func == `jr)) begin
			//jrmode	
			A_1 = rs;
			A_2 = 0;
			Tuse_1 = 0;
			Tuse_2 = 0;		
		end else if (opcode == `cop0 && (rs == `mtc0)) begin
			//mtc0	
			A_1 = 0;
			A_2 = rt;
			Tuse_1 = 0;
			Tuse_2 = 2;							
		end else begin
			A_1 = 0;
			A_2 = 0;
			Tuse_1 = 0;
			Tuse_2 = 0;			
		end
	end

endmodule
