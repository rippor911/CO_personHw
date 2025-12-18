//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:39:17 11/13/2025 
// Design Name: 
// Module Name:    alreg 
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
`include "global.v"
module alreg(
	 input wire clk,
	 input wire reset,
	 input wire clear,
	 input wire Req,
	 input wire En_low,
	 
    input wire [31:0] X_pc,
    input wire [31:0] X_instr,
    
    input wire [31:0] aluOut,
    input wire [31:0] rdata1,
    input wire [31:0] rdata2,
    input wire [31:0] memOut,
	 input wire grfWE,
	 input wire [4 :0] ExcCode,
	 input wire BD,
    
    output reg [31:0] Y_pc,
    output reg [31:0] Y_instr,
    output reg [31:0] X_Y_aluOut,
    output reg [31:0] X_Y_rdata1,
    output reg [31:0] X_Y_rdata2,
    output reg [31:0] X_Y_memOut,
	 output reg [4 :0] X_Y_ExcCode, 
	 output reg X_Y_grfWE,
	 output reg X_Y_BD
    );
	 
	 always @(posedge clk) begin
		if (reset || Req || clear) begin
			Y_pc 			<= reset ? 32'h00003000 : (Req ? 32'h00004180 : X_pc);
			Y_instr 		<= 0;
			X_Y_aluOut 	<= 0;
			X_Y_rdata1 	<= 0;
			X_Y_rdata2 	<= 0;
			X_Y_memOut 	<= 0;
			X_Y_grfWE 	<= 0;
			X_Y_ExcCode	<= 0;
			X_Y_BD		<= reset ? 0 : (Req ? 0 : BD);
		end else if (En_low == 1'd0) begin
			Y_pc 			<= X_pc;
			Y_instr 		<= X_instr;
			X_Y_aluOut 	<= aluOut;
			X_Y_rdata1 	<= rdata1;
			X_Y_rdata2 	<= rdata2;
			X_Y_memOut 	<= memOut;
			X_Y_grfWE 	<= grfWE;	
			X_Y_ExcCode <= ExcCode;
			X_Y_BD		<= BD;
		end
	 end
endmodule
