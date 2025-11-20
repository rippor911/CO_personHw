`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:17:03 11/13/2025
// Design Name:   npc
// Module Name:   D:/verilog/P5/npc_test.v
// Project Name:  P5
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
	reg [2:0] mode;
	reg [31:0] pc;
	reg [31:0] immSignExt;
	reg [25:0] instr_index;
	reg [31:0] rdata1;
	reg [31:0] rdata2;

	// Outputs
	wire [31:0] npc;

	// Instantiate the Unit Under Test (UUT)
	npc uut (
		.mode(mode), 
		.pc(pc), 
		.immSignExt(immSignExt), 
		.instr_index(instr_index), 
		.rdata1(rdata1), 
		.rdata2(rdata2), 
		.npc(npc)
	);

	initial begin
		// Initialize Inputs
		mode = 0;
		pc = 32'h00003000;
		immSignExt = -2;
		instr_index = 7788;
		rdata1 = 0;
		rdata2 = 0;
		
		#30 rdata1 = 1;

	end
	
	always # 5 mode = mode + 1;
      
endmodule

