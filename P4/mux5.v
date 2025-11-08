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
module mux5(
    input [2:0] choose,
	 input [4:0] input0,
	 input [4:0] input1,
	 input [4:0] input2,
	 input [4:0] input3,
	 input [4:0] input4,
	 input [4:0] input5,
	 input [4:0] input6,
	 input [4:0] input7,
    output [4:0] out
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
