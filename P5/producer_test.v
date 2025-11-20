`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:18:06 11/14/2025
// Design Name:   producer
// Module Name:   D:/verilog/P5/producer_test.v
// Project Name:  P5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: producer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module producer_test;

	// Inputs
	reg [31:0] instr;
	reg [2:0] Tnow;
	

	// Outputs
	wire [4:0] A;
	wire [2:0] Tnew;

	// Instantiate the Unit Under Test (UUT)
	producer uut (
		.instr(instr), 
		.Tnow(Tnow), 
		.Tnew(Tnew), 
		.A(A)
	);
	
	/*
	ori $1,$0,5
	lui $1,1
	add $1,$0,$4
	sub $1,$0,$2
	lw $1,-1($0)
	sw $1,-1($0)
	beq $0,$0,next
	next:
	jal end
	nop
	nop
	nop
	end:
	jr $0	
	*/

	initial begin
		// Initialize Inputs
		instr = 0;
		Tnow = 0;

		#5 Tnow = 0;
			instr = 32'h34010005;
		#5 instr = 32'h3c010001;
		#5 instr = 32'h00040820;
		#5 instr = 32'h00020822;
		#5 instr = 32'h8c01ffff;
		#5 instr = 32'hac01ffff;
		#5 instr = 32'h10000000;
		#5 instr = 32'h0c000c0b;
		#5 instr = 32'h00000008;
		
		#5 Tnow = 1;
			instr = 32'h34010005;
		#5 instr = 32'h3c010001;
		#5 instr = 32'h00040820;
		#5 instr = 32'h00020822;
		#5 instr = 32'h8c01ffff;
		#5 instr = 32'hac01ffff;
		#5 instr = 32'h10000000;
		#5 instr = 32'h0c000c0b;
		#5 instr = 32'h00000008;


		#5 Tnow = 2;
			instr = 32'h34010005;
		#5 instr = 32'h3c010001;
		#5 instr = 32'h00040820;
		#5 instr = 32'h00020822;
		#5 instr = 32'h8c01ffff;
		#5 instr = 32'hac01ffff;
		#5 instr = 32'h10000000;
		#5 instr = 32'h0c000c0b;
		#5 instr = 32'h00000008;	

		#5 Tnow = 3;
			instr = 32'h34010005;
		#5 instr = 32'h3c010001;
		#5 instr = 32'h00040820;
		#5 instr = 32'h00020822;
		#5 instr = 32'h8c01ffff;
		#5 instr = 32'hac01ffff;
		#5 instr = 32'h10000000;
		#5 instr = 32'h0c000c0b;
		#5 instr = 32'h00000008;		

	end
      
endmodule

