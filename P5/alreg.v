`include "global.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:39:17 11/13/2025 
// Design Name: 
// Module Name:    alreg 
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
module alreg(
	 input wire clk,
	 input wire reset,
	 input wire En_low,
	 
    input wire [31:0] X_pc,
    input wire [31:0] X_instr,
    
    input wire [31:0] aluOut,
    input wire [31:0] rdata1,
    input wire [31:0] rdata2,
    input wire [31:0] memOut,
	 input wire grfWE,
    
    output reg [31:0] Y_pc,
    output reg [31:0] Y_instr,
    output reg [31:0] X_Y_aluOut,
    output reg [31:0] X_Y_rdata1,
    output reg [31:0] X_Y_rdata2,
    output reg [31:0] X_Y_memOut,
	 output reg X_Y_grfWE
    );
	 
	 always @(posedge clk) begin
		if (reset) begin
			Y_pc <= 0;
			Y_instr <= 0;
			X_Y_aluOut <= 0;
			X_Y_rdata1 <= 0;
			X_Y_rdata2 <= 0;
			X_Y_memOut <= 0;
			X_Y_grfWE <= 0;
		end else if (En_low == 1'd0) begin
			Y_pc <= X_pc;
			Y_instr <= X_instr;
			X_Y_aluOut <= aluOut;
			X_Y_rdata1 <= rdata1;
			X_Y_rdata2 <= rdata2;
			X_Y_memOut <= memOut;
			X_Y_grfWE <= grfWE;			
		end
	 end
endmodule
