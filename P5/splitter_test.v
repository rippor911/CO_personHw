`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:42:59 11/06/2025
// Design Name:   splitter
// Module Name:   D:/verilog/P4/mips/splitter_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: splitter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module splitter_test;

	// Inputs
	reg [31:0] instr;

	// Outputs
	wire [5:0] opcode;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [5:0] shamt;
	wire [5:0] func;
	wire [15:0] imm;
	wire [25:0] instr_index;

	// Instantiate the Unit Under Test (UUT)
	splitter uut (
		.instr(instr), 
		.opcode(opcode), 
		.rs(rs), 
		.rt(rt), 
		.rd(rd), 
		.shamt(shamt), 
		.func(func), 
		.imm(imm), 
		.instr_index(instr_index)
	);

	initial begin
		instr = 0;
		#20 instr = 32'h012a5020;	//add  : 0x012a5020
		#20 instr = 32'h016d5822;	//sub  : 0x016d5822  
		#20 instr = 32'h356b7f3c;	//ori  : 0x356b7f3c
		#20 instr = 32'h8d2c1234;	//lw   : 0x8d2c1234
		#20 instr = 32'had4c5678;	//sw   : 0xad4c5678
		#20 instr = 32'h11229abc;	//beq  : 0x11229abc
		#20 instr = 32'h3c01def0;	//lui  : 0x3c01def0
		#20 instr = 32'h0c123456;	//jal  : 0x0c123456
		#20 instr = 32'h02a00008;	//jr   : 0x02a00008
		#20 instr = 32'h00000000;	//nop  : 0x00000000
	end
      
endmodule

