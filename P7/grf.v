`include "global.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:32 11/06/2025 
// Design Name: 
// Module Name:    grf 
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
module grf(
    input wire clk,
    input wire reset,
    input wire [4:0] rd1,
    input wire [4:0] rd2,
    input wire [4:0] wt,
    input wire WE,
    input wire [31:0] wdata,
	 input wire [31:0] wPc,
    output wire [31:0] rdata1,
    output wire [31:0] rdata2
    );
	 
	 reg [31:0] register [0:31];
	 integer i;
	 
	 assign rdata1 = register[rd1];
	 assign rdata2 = register[rd2];
	 
	 always @(posedge clk) begin
		if (reset) begin
			for (i = 0 ; i < 32 ; i = i + 1) begin
				register[i] <= 0;
			end
		end else begin
			if (WE == 1'b1 && wt != 5'd0) begin
				register[wt] <= wdata;
			end
		end
	 end
	 
endmodule
