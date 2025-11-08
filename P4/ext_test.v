`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:22:09 11/06/2025
// Design Name:   ext
// Module Name:   D:/verilog/P4/mips/ext_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ext
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ext_test;

	// Inputs
	reg [15:0] imm;

	// Outputs
	wire [31:0] immSignExt;
	wire [31:0] immZeroExt;

	// Instantiate the Unit Under Test (UUT)
	ext uut (
		.imm(imm), 
		.immSignExt(immSignExt), 
		.immZeroExt(immZeroExt)
	);

	initial begin
		// Initialize Inputs
		imm = 16'hf13a;
	end
      
endmodule

