`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:10:54 10/14/2025 
// Design Name: 
// Module Name:    ext 
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
module ext(
    input [15:0] imm,
    input [1:0] EOp,
    output reg [31:0] ext
    );
	 reg [31:0] temp;
	always @(*) begin
		if (EOp == 2'b00) begin
			ext={{16{imm[15:15]}},imm[15:0]};
		end else if (EOp == 2'b01) begin
			ext[15:0] = imm[15:0];
			ext[31:16] = 16'd0;
		end else if (EOp == 2'b10) begin 
			ext[31:16] = imm[15:0];
			ext[15:0] = 16'd0;			
		end else if (EOp == 2'b11) begin 
			temp={{16{imm[15:15]}},imm[15:0]};
			ext = temp<<2;
		end
	end

endmodule
