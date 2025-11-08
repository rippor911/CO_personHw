`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:59 11/06/2025 
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
    output [31:0] immSignExt,
    output [31:0] immZeroExt
    );

	assign immSignExt = {{16{imm[15:15]}}, imm};
	assign immZeroExt = {16'd0, imm};
endmodule
