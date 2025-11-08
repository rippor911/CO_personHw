`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:31:26 11/07/2025
// Design Name:   controller
// Module Name:   D:/verilog/P4/mips/controller_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controller_test;

	// Inputs
	reg [5:0] opcode;
	reg [5:0] func;

	// Outputs
	wire [2:0] rd1Choose;
	wire [2:0] rd2Choose;
	wire [2:0] wtChoose;
	wire [2:0] wdataChoose;
	wire [2:0] AChoose;
	wire [2:0] BChoose;
	wire [2:0] memAdrChoose;
	wire [2:0] memWdataChoose;
	wire [5:0] aluOp;
	wire grfWE;
	wire memWrite;
	wire [2:0] mode;

	// Instantiate the Unit Under Test (UUT)
	controller uut (
		.opcode(opcode), 
		.func(func), 
		.rd1Choose(rd1Choose), 
		.rd2Choose(rd2Choose), 
		.wtChoose(wtChoose), 
		.wdataChoose(wdataChoose), 
		.AChoose(AChoose), 
		.BChoose(BChoose), 
		.memAdrChoose(memAdrChoose), 
		.memWdataChoose(memWdataChoose), 
		.aluOp(aluOp), 
		.grfWE(grfWE), 
		.memWrite(memWrite), 
		.mode(mode)
	);

	initial begin
		// add
		opcode = 6'b000000;
		func = 6'b100000;
		#10
		//sub
		opcode = 6'b000000;
		func = 6'b100010;
		#10
		//ori
		opcode = 6'b001101;
		func = 6'b100010;
		#10
		//lw
		opcode = 6'b100011;
		func = 6'b100010;
		#10
		//sw
		opcode = 6'b101011;
		func = 6'b100010;
		#10
		//beq
		opcode = 6'b000100;
		func = 6'b100010;
		#10
		//lui
		opcode = 6'b001111;
		func = 6'b100010;
		#10
		//jr
		opcode = 6'b000000;
		func = 6'b001000;
		#10
		//sub
		opcode = 6'b000011;
		func = 6'b100010;

	end
      
endmodule

