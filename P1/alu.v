`timescale 1ns / 1ps
module alu(
    input [31:0] A,
    input [31:0] B,
    input [2:0] ALUOp,
    output reg [31:0] C
);
    always @(*) begin
        if (ALUOp == 3'b000) begin
            C = A + B;
        end else if (ALUOp == 3'b001) begin
            C = A - B;
        end else if (ALUOp == 3'b010) begin
            C = A & B;
        end else if (ALUOp == 3'b011) begin
            C = A | B;
        end else if (ALUOp == 3'b100) begin
            C = A >> B ;
        end else if (ALUOp == 3'b101) begin
            C = $signed(A) >>> B;
        end
    end

endmodule