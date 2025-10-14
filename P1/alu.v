`timescale 1ns / 1ps
module alu(
    input [31:0] A,
    input [31:0] B,
    input [2:0] ALUop,
    output [31:0] C
	);
    assign C = (ALUop == 3'b000) ? A + B :
					(ALUop == 3'b001) ? A - B :
					(ALUop == 3'b010) ? A & B :
					(ALUop == 3'b011) ? A | B :
					(ALUop == 3'b100) ? A >> B :
					(ALUop == 3'b101) ? $signed(A) >>> B :
					32'd0;
endmodule
