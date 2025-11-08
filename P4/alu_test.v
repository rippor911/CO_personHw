`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:45:45 11/06/2025
// Design Name:   alu
// Module Name:   D:/verilog/P4/mips/alu_test.v
// Project Name:  mips
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
	wire logicOutput;
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.aluOp(aluOp), 
		.A(A), 
		.B(B), 
		.logicOutput(logicOutput), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		aluOp = 0;
		A = 32'h11ac5670;
		B = 32'ha1ac5670;
		#40 A = B;

	end
	always #10 aluOp = aluOp + 1;
      
endmodule

