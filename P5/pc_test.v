`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:01:27 11/13/2025
// Design Name:   pc
// Module Name:   D:/verilog/P5/pc_test.v
// Project Name:  P5
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
	reg En;
	reg [31:0] npc;

	// Outputs
	wire [31:0] pc;

	// Instantiate the Unit Under Test (UUT)
	pc uut (
		.clk(clk), 
		.reset(reset), 
		.En(En), 
		.npc(npc), 
		.pc(pc)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		En = 0;
		npc = 0;

		#10 reset = 0;
		
		#30 En = 1;
		
		#30 En = 0;
 
	end
	
	always #5 clk = ~clk;
	always #10 npc = npc + 4;
      
endmodule

