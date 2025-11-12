`include "global.v"
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
    input [2:0] memWrite,
    input [31:0] wdata,
    input [31:0] wPc,
    output [31:0] memOut
    );
	
	integer i;
	reg [31:0] register[0:3071];
	wire [31:0] id;
	wire [1:0] byte;
	wire [31:0] wordAdr;
	
	assign id = {2'b00,memAdr[31:2]};
	assign memOut = register[id];
	assign wordAdr = {memAdr[31:2],2'b00};

	wire [31:0] bytedata = (memAdr[1:0] == 2'b00) ? {register[id][31:8],wdata[7:0]}:
						  (memAdr[1:0] == 2'b01) ? {register[id][31:16],wdata[7:0],register[id][7:0]}:
						  (memAdr[1:0] == 2'b10) ? {register[id][31:24],wdata[7:0],register[id][15:0]}:
						  (memAdr[1:0] == 2'b11) ? {wdata[7:0],register[id][23:0]}:
						  32'h0;
	
	always @(posedge clk) begin
		if (reset) begin
			for (i = 0 ; i < 3072 ; i = i + 1) begin
				register[i] <= 0;
			end
		end else begin
			if (memWrite == `memSw) begin
				register[id] <= wdata;
				$display("@%h: *%h <= %h", wPc, memAdr, wdata);
			end else if (memWrite == `memSb) begin
				register[id] <= bytedata;
				$display("@%h: *%h <= %h", wPc, wordAdr, bytedata);
			end
		end
	end

endmodule
