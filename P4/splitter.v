`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:40:35 11/06/2025 
// Design Name: 
// Module Name:    splitter 
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
module splitter(
    input [31:0] instr,
    output [5:0] opcode,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
    output [5:0] shamt,
    output [5:0] func,
    output [15:0] imm,
    output [25:0] instr_index
    );
	 assign opcode = instr[31:26];
	 assign rs = instr[25:21];
	 assign rt = instr[20:16];
	 assign rd = instr[15:11];
	 assign shamt = instr[10:6];
	 assign func = instr[5:0];
	 assign imm = instr[15:0];
	 assign instr_index = instr[25:0];


endmodule
