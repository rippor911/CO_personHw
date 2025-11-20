`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:10:57 11/14/2025 
// Design Name: 
// Module Name:    counter 
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
module counter(
    input wire clk,
    input wire reset,
    output reg [31:0] time_now
    );
	
	always @(posedge clk) begin
		if (reset == 1) begin
			time_now <= 0;
		end else begin
			time_now <= time_now + 1; 
		end
	end

endmodule
