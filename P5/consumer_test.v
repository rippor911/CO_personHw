`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:44:55 11/14/2025
// Design Name:   consumer
// Module Name:   D:/verilog/P5/consumer_test.v
// Project Name:  P5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: consumer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module consumer_test;

	// Inputs
	reg [31:0] instr;

	// Outputs
	wire [4:0] A_1;
	wire [2:0] Tuse_1;
	wire [4:0] A_2;
	wire [2:0] Tuse_2;

	// Instantiate the Unit Under Test (UUT)
	consumer uut (
		.instr(instr), 
		.A_1(A_1), 
		.Tuse_1(Tuse_1), 
		.A_2(A_2), 
		.Tuse_2(Tuse_2)
	);

/*
	ori $1,$2,5
	lui $1,1
	add $1,$2,$4
	sub $1,$3,$2
	lw $1,-1($2)
	sw $1,-1($3)
	beq $2,$0,next
	next:
	jal end
	nop
	nop
	nop
	end:
	jr $31	
*/

	initial begin
		instr = 0;

	   #10 instr = 32'h34410005;
		#10 instr = 32'h3c010001;
		#10 instr = 32'h00440820;
		#10 instr = 32'h00620822;
		#10 instr = 32'h8c41ffff;
		#10 instr = 32'hac61ffff;
		#10 instr = 32'h10400000;
		#10 instr = 32'h0c000c0b;
		#10 instr = 32'h03e00008;

	end
      
endmodule

