`timescale 1ns / 1ps
module alu(
    input A[31:0],
    input B[31:0],
    input ALUop[2:0],
    output C[31:0]
);
    always @(*) begin
        if (ALUop == 3'b000) begin
            C = A + B;
        end else if (ALUop == 3'b001) begin
            C = A - B;
        end else if (ALUop == 3'b010) begin
            C = A & B;
        end else if (ALUop == 3'b011) begin
            C = A | B;
        end else if (ALUop == 3'b100) begin
            C = A >> B ;
        end else if (ALUop == 3'b101) begin
            C = $signed(A) >>> B;
        end
    end

endmodule