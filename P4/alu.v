`timescale 1ns / 1ps
`define addu 6'd0
`define subu 6'd1
`define orr	6'd2
`define lui 6'd3
`define equ 6'd4
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:34:21 11/06/2025 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(
    input [5:0] aluOp,
    input [31:0] A,
    input [31:0] B,
    output reg logicOutput,
    output reg [31:0] out
    );
	always @(*) begin
		if (aluOp == `addu) begin
			logicOutput = 0;
			out = A + B;
		end else if (aluOp == `subu) begin
			logicOutput = 0;
			out = A - B;			
		end else if (aluOp == `orr) begin
			logicOutput = 0;
			out = A | B;		
		end else if (aluOp == `lui) begin
			logicOutput = 0;
			out = {B[15:0],A[15:0]};		
		end else if (aluOp == `equ) begin
			if (A == B) begin
				logicOutput = 1;
			end else begin
				logicOutput = 0;
			end
			out = 0;		
		end else begin
			logicOutput = 0;
			out = 0;
		end
	end

endmodule
