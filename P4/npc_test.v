`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:25:00 11/06/2025
// Design Name:   npc
// Module Name:   D:/verilog/P4/mips/npc_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: npc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module npc_test;

	// Inputs
	reg logicOutput;
	reg [2:0] mode;
	reg [31:0] pc;
	reg [31:0] immSignExt;
	reg [25:0] instr_index;
	reg [31:0] aluOut;

	// Outputs
	wire [31:0] npc;

	// Instantiate the Unit Under Test (UUT)
	npc uut (
		.logicOutput(logicOutput), 
		.mode(mode), 
		.pc(pc), 
		.immSignExt(immSignExt), 
		.instr_index(instr_index), 
		.aluOut(aluOut), 
		.npc(npc)
	);

	initial begin
		// Initialize Inputs
		logicOutput = 0;
		mode = 0;
		pc = 32'h1f000004;
		immSignExt = 2;
		instr_index = 26;
		aluOut = 32;

		#30 logicOutput = 1;

	end
	
	always #20 mode = mode + 1;
      
endmodule

