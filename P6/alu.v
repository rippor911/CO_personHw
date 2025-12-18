`include "global.v"
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
    input wire [5:0] aluOp,
    input wire [31:0] A,
    input wire [31:0] B,
    output reg [31:0] out
    );
	always @(*) begin
		if (aluOp == `aluAddu) begin
			out = A + B;
		end else if (aluOp == `aluSubu) begin
			out = A - B;			
		end else if (aluOp == `aluOr) begin
			out = A | B;		
		end else if (aluOp == `aluLui) begin
			out = {B[15:0],16'd0};		
		end else if (aluOp == `aluAnd) begin
			out = A & B;		
		end else if (aluOp == `aluSlt) begin
			out = ($signed(A) < $signed(B)) ? 1 : 0;		
		end else if (aluOp == `aluSltu) begin
			out = ({1'd0,A} < {1'd0,B}) ? 1 : 0;
		end else begin
			out = 0;
		end
	end

endmodule
