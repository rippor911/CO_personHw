`timescale 1ns / 1ps
`define norm 3'b000
`define logi 3'b001
`define jmode 3'b010
`define jrmode 3'b011
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:44 11/06/2025 
// Design Name: 
// Module Name:    npc 
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
module npc(
    input logicOutput,
    input [2:0] mode,
	 input [31:0] pc,
    input [31:0] immSignExt,
    input [25:0] instr_index,
	 input [31:0] aluOut,
    output reg [31:0] npc
    );
	 
	 wire [31:0] jmode_result = {pc[31:28], instr_index, 2'b00};
	 
	 always @(*) begin
		if (mode == `norm) begin
			npc = pc + 32'd4;
		end else if (mode == `logi) begin
			if (logicOutput == 1'b1) begin
				npc = pc + 32'd4 + (immSignExt << 2);
			end else begin
				npc = pc + 32'd4;
			end
		end else if (mode == `jmode) begin
			npc = jmode_result;
		end else if (mode == `jrmode) begin
			npc = aluOut;
		end else begin
			npc = pc + 32'd4;
		end
	 end

endmodule
