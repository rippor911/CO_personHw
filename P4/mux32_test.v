`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:45:14 11/06/2025
// Design Name:   mux32
// Module Name:   D:/verilog/P4/mips/mux32_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux32_test;

	// Inputs
	reg [2:0] choose;
	reg [31:0] input0;
	reg [31:0] input1;
	reg [31:0] input2;
	reg [31:0] input3;
	reg [31:0] input4;
	reg [31:0] input5;
	reg [31:0] input6;
	reg [31:0] input7;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux32 uut (
		.choose(choose), 
		.input0(input0), 
		.input1(input1), 
		.input2(input2), 
		.input3(input3), 
		.input4(input4), 
		.input5(input5), 
		.input6(input6), 
		.input7(input7), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		choose = 0;
		input0 = 1;
		input1 = 2;
		input2 = 3;
		input3 = 4;
		input4 = 5;
		input5 = 6;
		input6 = 7;
		input7 = 8;

	end
	
	always #10 choose = choose + 1;
      
endmodule

