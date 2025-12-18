//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:45 11/06/2025 
// Design Name: 
// Module Name:    pc 
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
`timescale 1ns / 1ps
module pc(
    input wire clk,
    input wire reset,
	 input wire En_low,
    input wire [31:0] npc,
    output reg [31:0] pc
    );
	 
	 always @(posedge clk) begin
		if (reset) begin
			pc <= 32'h00003000;
		end else begin
			if (En_low == 1'd0) begin
				pc <= npc;
			end
		end
	 end


endmodule
