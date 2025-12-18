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
    input wire [3:0] memWrite,
    input wire [31:0] memWdata,
    input wire [31:0] wPc,
    output wire [31:0] memOut
    );
	
    integer i;
    reg [31:0] fixed_addr;
    reg [31:0] fixed_wdata;
    reg [31:0] data[0:4095];

    assign memOut = data[memAdr >> 2];
	 
    always @(*) begin
        fixed_wdata = data[memAdr >> 2];
        fixed_addr = memAdr & 32'hfffffffc;
        if (memWrite[3]) fixed_wdata[31:24] = memWdata[31:24];
        if (memWrite[2]) fixed_wdata[23:16] = memWdata[23:16];
        if (memWrite[1]) fixed_wdata[15: 8] = memWdata[15: 8];
        if (memWrite[0]) fixed_wdata[7 : 0] = memWdata[7 : 0];
    end

    always @(posedge clk) begin
        if (reset) for (i = 0; i < 4096; i = i + 1) data[i] <= 0;
        else if (memWrite) begin
            data[fixed_addr >> 2] <= fixed_wdata;
            $display("%d@%h: *%h <= %h", $time, wPc, fixed_addr, fixed_wdata);
        end
    end

endmodule
