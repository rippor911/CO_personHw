`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:31:24 11/13/2025
// Design Name:   alu
// Module Name:   D:/verilog/P5/alu_test.v
// Project Name:  P5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [5:0] aluOp;
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.aluOp(aluOp), 
		.A(A), 
		.B(B), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		aluOp = 0;
		A = 3;
		B = 8;

	end
	
	always #10 aluOp = aluOp + 1;
      
endmodule

