`timescale 1ns / 1ps
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
module pc(
    input clk,
    input reset,
    input [31:0] npc,
    output reg [31:0] pc
    );
	 
	 always @(posedge clk) begin
		if (reset) begin
			pc <= 32'h00003000;
		end else begin
			pc <= npc;
		end
	 end


endmodule
