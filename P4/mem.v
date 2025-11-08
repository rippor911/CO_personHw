`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:59:38 11/06/2025 
// Design Name: 
// Module Name:    mem 
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
module mem(
    input clk,
    input reset,
    input [31:0] memAdr,
    input memWrite,
    input [31:0] wdata,
    input [31:0] wPc,
    output [31:0] memOut
    );
	
	integer i;
	reg [31:0] register[0:3071];
	wire [31:0] id;
	
	assign id = {2'b00,memAdr[31:2]};
	assign memOut = register[id];
	
	always @(posedge clk) begin
		if (reset) begin
			for (i = 0 ; i < 3072 ; i = i + 1) begin
				register[i] <= 0;
			end
		end else begin
			if (memWrite == 1'b1) begin
				register[id] <= wdata;
				$display("@%h: *%h <= %h", wPc, memAdr, wdata);
			end
		end
	end

endmodule
