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
`include "global.v"
module alu(
    input wire [31:0] instr,
    input wire [5:0] aluOp,
    input wire [31:0] A,
    input wire [31:0] B,
    output reg [31:0] out,
	 output reg [4:0] ExcCode
    );
	 
	 wire [32:0] tempA = {A[31:31],A};
	 wire [32:0] tempB = {B[31:31],B};
	 reg overflow;
	 reg [32:0] overCheck;
	 
	 wire [5:0] opcode = instr[31:26];
	 wire [5:0] func = instr[5:0];
	 
	 reg dm;
	 reg tc0;
	 reg tc1;
	 reg Int;
	 reg tcCount;
	 
	 
	always @(*) begin
		// alu
		if (aluOp == `aluAddu) begin
			out = A + B;
			overflow = 0;
		end else if (aluOp == `aluAdd) begin
			overCheck = tempA + tempB;
			overflow = (overCheck[32] !== overCheck[31]) ? 1 : 0;
			out = A + B;
		end else if (aluOp == `aluSub) begin
			overCheck = tempA - tempB;
			overflow = (overCheck[32] !== overCheck[31]) ? 1 : 0;
			out = A - B;			
		end else if (aluOp == `aluOr) begin
			out = A | B;
			overflow = 0;
		end else if (aluOp == `aluLui) begin
			out = {B[15:0],16'd0};
			overflow = 0;
		end else if (aluOp == `aluAnd) begin
			out = A & B;
			overflow = 0;
		end else if (aluOp == `aluSlt) begin
			out = ($signed(A) < $signed(B)) ? 1 : 0;
			overflow = 0;
		end else if (aluOp == `aluSltu) begin
			out = ({1'd0,A} < {1'd0,B}) ? 1 : 0;
			overflow = 0;
		end else begin
			out = 0;
			overflow = 0;
		end

	   dm  = (out >= 32'h0000_0000 && out <= 32'h0000_2FFF) ? 1 : 0;
	   tc0 = (out >= 32'h0000_7F00 && out <= 32'h0000_7F0B) ? 1 : 0;
	   tc1 = (out >= 32'h0000_7F10 && out <= 32'h0000_7F1B) ? 1 : 0;
	   Int = (out >= 32'h0000_7F20 && out <= 32'h0000_7F23) ? 1 : 0;
	   tcCount = (out == 32'h0000_7F08 || out == 32'h0000_7F18);
		
		// ExcCode
		if (opcode == `lw) begin
			ExcCode = (overflow) 					? `ExcAdEL :
						 (out[1:0] != 0)				? `ExcAdEL :
						 !(dm | tc0 | tc1 | Int) 	? `ExcAdEL :
						 `ExcInt;
		end else if (opcode == `lh) begin
			ExcCode = (overflow) 					? `ExcAdEL :
						 (out[0] != 0)					? `ExcAdEL :
						 !(dm | Int) 					? `ExcAdEL :
						 `ExcInt;
		end else if (opcode == `lb) begin
			ExcCode = (overflow) 					? `ExcAdEL :
						 !(dm | Int) 					? `ExcAdEL :
						 `ExcInt;						
		end else if (opcode == `sw) begin
			ExcCode = (overflow) 					? `ExcAdES :
						 (out[1:0] != 0)				? `ExcAdES :
						 (tcCount)						? `ExcAdES :
						 !(dm | tc0 | tc1 | Int) 	? `ExcAdES :
						 `ExcInt;			
		end else if (opcode == `sh) begin
			ExcCode = (overflow) 					? `ExcAdES :
						 (out[0] != 0)					? `ExcAdES :
						 !(dm | Int) 					? `ExcAdES :
						 `ExcInt;			
		end else if (opcode == `sb) begin
			ExcCode = (overflow) 					? `ExcAdES :
						 !(dm | Int) 					? `ExcAdES :
						 `ExcInt;			
		end else begin
			ExcCode = (overflow) ? `ExcOv : `ExcInt;
		end
	end

endmodule
