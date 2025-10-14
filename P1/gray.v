`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:33:28 10/14/2025 
// Design Name: 
// Module Name:    gray 
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
module gray(
    input Clk,
    input Reset,
    input En,
    output [2:0] Output,
    output reg Overflow
    );
	 reg [2:0] code;
	 assign Output = code;
	 
	always @(posedge Clk) begin
		if (Reset == 1'b1) begin
			code <= 2'd0;
			Overflow <= 1'b0;
		end else if (En == 1'b1) begin
			if (code == 3'b000) begin
				code <= 3'b001;
			end if (code == 3'b001) begin
				code <= 3'b011;
			end if (code == 3'b011) begin
				code <= 3'b010;
			end if (code == 3'b010) begin
				code <= 3'b110;
			end if (code == 3'b110) begin
				code <= 3'b111;
			end if (code == 3'b111) begin
				code <= 3'b101;
			end if (code == 3'b101) begin
				code <= 3'b100;
			end if (code == 3'b100) begin
				code <= 3'b000;
				Overflow <= 1'b1;
			end
		end
	end

endmodule
