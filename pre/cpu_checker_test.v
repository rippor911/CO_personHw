`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:44:37 09/10/2025
// Design Name:   cpu_checker
// Module Name:   D:/verilog/COpre/cpu_checker_test.v
// Project Name:  COpre
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_checker
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_checker_test;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] char;
	reg [15:0] freq;

	// Outputs
	wire [1:0] format_type;
	wire [3:0] error_code;

	// Instantiate the Unit Under Test (UUT)
	cpu_checker uut (
		.clk(clk), 
		.reset(reset), 
		.char(char), 
		.freq(freq), 
		.format_type(format_type), 
		.error_code(error_code)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		char = 0;
		freq = 10;
/*
//example1 : grf format test 1 0       "^64 @ 0000_3004 : $ 5 <= 00ab_0003 #"
		#10 reset = 0;
			 char = "^";
			 freq = 16'd10;
	
		#10 reset = 0;
			 char = "6";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "4";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "@";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "3";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "4";
			 freq = 16'd10;

		#10 reset = 0;
			 char = ":";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "$";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "5";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "<";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "=";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "a";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "b";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;	

		#10 reset = 0;
			 char = "3";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "#";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "#";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "^";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "%";
			 freq = 16'd8;
//example2 : test grf test : 1 1010       "^64 @ 0004_3004 : $ 32 <= 00ab_0003 #"
		#10 reset = 0;
			 char = "^";
			 freq = 16'd10;
	
		#10 reset = 0;
			 char = "6";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "4";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "@";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "4";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "4";
			 freq = 16'd10;

		#10 reset = 0;
			 char = ":";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "$";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "3";
			 freq = 16'd10;
			 
		#10 reset = 0;
			 char = "2";
			 freq = 16'd10;			 

		#10 reset = 0;
			 char = "<";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "=";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "a";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "b";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd32;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd32;	

		#10 reset = 0;
			 char = "3";
			 freq = 16'd32;

		#10 reset = 0;
			 char = "#";
			 freq = 16'd32;	

//example3 : test grf format:1 0011       "^63 @ 0000_30ff : $ 0014 <= 00ab_0003 #"			 

		#10 reset = 0;
			 char = "^";
			 freq = 16'd10;
	
		#10 reset = 0;
			 char = "6";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "3";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "@";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "3";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "f";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "f";
			 freq = 16'd10;

		#10 reset = 0;
			 char = ":";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "$";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;
			 
		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "1";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "4";
			 freq = 16'd10;			 

		#10 reset = 0;
			 char = "<";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "=";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "a";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "b";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;	

		#10 reset = 0;
			 char = "3";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "#";
			 freq = 16'd8;	*/
			 
//example4 : test addr format 1 0100       "^64 @ 0000_3004 : * 0000_0003 <= 00ab_0003 #"

		#10 reset = 0;
			 char = "^";
			 freq = 16'd10;
	
		#10 reset = 0;
			 char = "6";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "4";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "@";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "3";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "4";
			 freq = 16'd10;

		#10 reset = 0;
			 char = ":";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "*";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;
			
		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "3";
			 freq = 16'd10;			 

		#10 reset = 0;
			 char = "<";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "=";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "a";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "b";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;	

		#10 reset = 0;
			 char = "3";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "#";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "#";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "^";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "%";
			 freq = 16'd8;
			 
//example5 : test addr format 1 0100       "^64 @ 0000_3004 : * 0000_4000 <= 00ab_0003 #"			 

		#10 reset = 0;
			 char = "^";
			 freq = 16'd10;
	
		#10 reset = 0;
			 char = "6";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "4";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "@";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "3";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "4";
			 freq = 16'd10;

		#10 reset = 0;
			 char = ":";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "*";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;
			
		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "4";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;			 

		#10 reset = 0;
			 char = "<";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "=";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "a";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "b";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;

		#10 reset = 0;
			 char = "0";
			 freq = 16'd10;	

		#10 reset = 0;
			 char = "3";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "#";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "#";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "^";
			 freq = 16'd8;

		#10 reset = 0;
			 char = "%";
			 freq = 16'd8;
	end
	
	always #5 clk = ~clk;
      
endmodule

