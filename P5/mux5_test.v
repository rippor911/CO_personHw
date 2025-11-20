`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:45:48 11/06/2025
// Design Name:   mux5
// Module Name:   D:/verilog/P4/mips/mux5_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux5
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux5_test;

	// Inputs
	reg [2:0] choose;
	reg [4:0] input0;
	reg [4:0] input1;
	reg [4:0] input2;
	reg [4:0] input3;
	reg [4:0] input4;
	reg [4:0] input5;
	reg [4:0] input6;
	reg [4:0] input7;

	// Outputs
	wire [4:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux5 uut (
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
		input0 = 5;
		input1 = 6;
		input2 = 7;
		input3 = 8;
		input4 = 1;
		input5 = 2;
		input6 = 3;
		input7 = 4;

	end
	
	always #10 choose = choose + 1;
      
endmodule

