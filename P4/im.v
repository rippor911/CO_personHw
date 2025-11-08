`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:59 11/06/2025 
// Design Name: 
// Module Name:    im 
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
module im(
    input [31:0] adr,
    output [31:0] instr
    );
	 
    reg [31:0] im_reg [0:4095];
	 wire [31:0] id;
    
	 initial begin
        $readmemh("code.txt", im_reg);
    end
	 
	 assign id = adr - 32'h00003000;
	 
	 assign instr = im_reg[id[31:2]];

endmodule
