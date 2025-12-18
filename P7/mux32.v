`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:36:27 11/06/2025 
// Design Name: 
// Module Name:    mux32 
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
module mux32(
    input wire [2:0] choose,
	 input wire [31:0] input0,
	 input wire [31:0] input1,
	 input wire [31:0] input2,
	 input wire [31:0] input3,
	 input wire [31:0] input4,
	 input wire [31:0] input5,
	 input wire [31:0] input6,
	 input wire [31:0] input7,
    output wire [31:0] out
    );

	assign out = choose == 3'd0 ? input0 :
					 choose == 3'd1 ? input1 :
					 choose == 3'd2 ? input2 :
					 choose == 3'd3 ? input3 :
					 choose == 3'd4 ? input4 :
					 choose == 3'd5 ? input5 :
					 choose == 3'd6 ? input6 :
					                  input7 ;

endmodule
