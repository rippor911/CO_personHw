`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:19:01 11/06/2025
// Design Name:   im
// Module Name:   D:/verilog/P4/mips/im_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: im
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module im_test;

	// Inputs
	reg [31:0] adr;

	// Outputs
	wire [31:0] instr;

	// Instantiate the Unit Under Test (UUT)
	im uut (
		.adr(adr), 
		.instr(instr)
	);

	initial begin
		// Initialize Inputs
		adr = 32'h00003000;
	end
	
	always #10 adr = adr + 4;
      
endmodule

