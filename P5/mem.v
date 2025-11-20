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
    input wire clk,
    input wire reset,
    input wire [31:0] memAdr,
    input wire [2:0] memWrite,
    input wire [31:0] wdata,
    input wire [31:0] wPc,
	 input wire [31:0] time_now,
    output reg [31:0] memOut
    );
	
	integer i;
	reg [31:0] register[0:3071];
	wire [31:0] id;
	wire [31:0] wordAdr;
	
	assign id = {2'b00,memAdr[31:2]};
	
	
	assign wordAdr = {memAdr[31:2],2'b00};

	wire [31:0] bytedata = (memAdr[1:0] == 2'b00) ? {register[id][31:8],wdata[7:0]}:
								  (memAdr[1:0] == 2'b01) ? {register[id][31:16],wdata[7:0],register[id][7:0]}:
								  (memAdr[1:0] == 2'b10) ? {register[id][31:24],wdata[7:0],register[id][15:0]}:
								  (memAdr[1:0] == 2'b11) ? {wdata[7:0],register[id][23:0]}:
								  32'h0;
								  
	wire [31:0] halfdata = (memAdr[1:1] == 1) ? {wdata[15:0],register[id][15:0]} :
									{register[id][31:16],wdata[15:0]};
									
	always @(*) begin
			if (memWrite == `memNeg) begin
				memOut = register[id];
			end else if (memWrite == `memLb) begin
				memOut =  	(memAdr[1:0] == 2'b00) ? {{24{register[id][7:7]}},register[id][7:0]}:
								(memAdr[1:0] == 2'b01) ? {{24{register[id][15:15]}},register[id][15:8]}:
								(memAdr[1:0] == 2'b10) ? {{24{register[id][23:23]}},register[id][23:16]}:
								(memAdr[1:0] == 2'b11) ? {{24{register[id][31:31]}},register[id][31:24]}:
								32'h0;
			end else if (memWrite == `memLh) begin
				memOut =  	(memAdr[1:1] == 0) ? {{16{register[id][15:15]}},register[id][15:0]}:
								{{16{register[id][31:31]}},register[id][31:16]};	
			end	
	end
	
	always @(posedge clk) begin
		if (reset) begin
			memOut = 0;
			for (i = 0 ; i < 3072 ; i = i + 1) begin
				register[i] <= 0;
			end
		end else begin
			if (memWrite == `memSw) begin
				register[id] <= wdata;
				$display("%d@%h: *%h <= %h", $time, wPc, wordAdr, wdata);
			end else if (memWrite == `memSb) begin
				register[id] <= bytedata;
				$display("%d@%h: *%h <= %h", $time, wPc, wordAdr, bytedata);
			end else if (memWrite == `memSh) begin
				register[id] <= halfdata;
				$display("%d@%h: *%h <= %h", $time, wPc, wordAdr, halfdata);
			end
		end
	end

endmodule
