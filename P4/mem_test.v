`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:05:52 11/06/2025
// Design Name:   mem
// Module Name:   D:/verilog/P4/mips/mem_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mem_test;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] memAdr;
	reg memWrite;
	reg [31:0] wdata;
	reg [31:0] wPc;

	// Outputs
	wire [31:0] memOut;

	// Instantiate the Unit Under Test (UUT)
	mem uut (
		.clk(clk), 
		.reset(reset), 
		.memAdr(memAdr), 
		.memWrite(memWrite), 
		.wdata(wdata), 
		.wPc(wPc), 
		.memOut(memOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		memAdr = 0;
		memWrite = 1;
		wdata = 7;
		wPc = 0;

		#10 reset = 0;
			 
		#20 memWrite = 0;
			 

	end
	
	always #5 clk = ~clk;
	always #10 wPc = wPc + 4;
	always #10 memAdr = memAdr + 4;
	always #10 wdata = wdata + 4;
      
endmodule

