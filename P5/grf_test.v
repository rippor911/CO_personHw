`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:11:58 11/06/2025
// Design Name:   grf
// Module Name:   D:/verilog/P4/mips/grf_test.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: grf
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module grf_test;

	// Inputs
	reg clk;
	reg reset;
	reg [4:0] rd1;
	reg [4:0] rd2;
	reg [4:0] wt;
	reg WE;
	reg [31:0] wdata;
	reg [31:0] wPc;

	// Outputs
	wire [31:0] rdata1;
	wire [31:0] rdata2;

	// Instantiate the Unit Under Test (UUT)
	grf uut (
		.clk(clk), 
		.reset(reset), 
		.rd1(rd1), 
		.rd2(rd2), 
		.wt(wt), 
		.WE(WE), 
		.wdata(wdata), 
		.wPc(wPc),
		.rdata1(rdata1), 
		.rdata2(rdata2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		rd1 = 0;
		rd2 = 0;
		wt = 0;
		WE = 0;
		wdata = 32;
		wPc = 4;

		#20 reset = 0;
			 rd1 = 1;
			 rd2 = 2;
			 wt = 0;
			 WE = 1;
		#20 
			 rd1 = 0;	//$0 can't be modified
			 rd2 = 3;	//$3 can   be modified
			 wt = 3;
			 WE = 1;		
	end
	always #10 clk = ~clk;
      
endmodule

