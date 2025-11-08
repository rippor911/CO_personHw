`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:58:56 11/06/2025
// Design Name:   pc
// Module Name:   D:/verilog/P4/mips/pc_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pc_test;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] npc;

	// Outputs
	wire [31:0] pc;

	// Instantiate the Unit Under Test (UUT)
	pc uut (
		.clk(clk), 
		.reset(reset), 
		.npc(npc), 
		.pc(pc)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		npc = 0;
		
		#10 reset = 0;
	end
	
	always #5 clk = ~clk;
	
	always #10 npc = npc + 1;
      
endmodule

