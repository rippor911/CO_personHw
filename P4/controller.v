`timescale 1ns / 1ps
`define special 6'b000000
`define add 6'b100000
`define sub 6'b100010
`define jr  6'b001000

`define ori 6'b001101
`define lw  6'b100011
`define sw  6'b101011
`define beq 6'b000100
`define lui 6'b001111
`define jal 6'b000011

`define norm 3'b000
`define logi 3'b001
`define jmode 3'b010
`define jrmode 3'b011
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:25:29 11/06/2025 
// Design Name: 
// Module Name:    controller 
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
module controller(
    input [5:0] opcode,
    input [5:0] func,
    output reg [2:0] rd1Choose,
    output reg [2:0] rd2Choose,
    output reg [2:0] wtChoose,
    output reg [2:0] wdataChoose,
    output reg [2:0] AChoose,
    output reg [2:0] BChoose,
    output reg [2:0] memAdrChoose,
    output reg [2:0] memWdataChoose,
    output reg [5:0] aluOp,
    output reg grfWE,
    output reg memWrite,
    output reg [2:0] mode
    );
	 /*default
	 grfWE = 1'd0;
	 memWrite = 1'd0;
	 mode = `norm;
	 */
	 
	 always @(*) begin
		if (opcode == `special) begin
			if (func == `add) begin
				rd1Choose = 3'b000;
				rd2Choose = 3'b000;
				wtChoose = 3'b000;
				wdataChoose = 3'b000;
				AChoose = 3'b000;
				BChoose = 3'b000;
				aluOp = 6'b000000;	//aluOp = addu
				grfWE = 1'd1;			//
				memWrite = 1'd0;
				mode = `norm;				
			end else if (func == `sub) begin
				rd1Choose = 3'b000;
				rd2Choose = 3'b000;
				wtChoose = 3'b000;
				wdataChoose = 3'b000;
				AChoose = 3'b000;
				BChoose = 3'b000;
				aluOp = 6'b000001;	//aluOp = subu
				grfWE = 1'd1;			//
				memWrite = 1'd0;
				mode = `norm;			
			end else if (func == `jr) begin
				rd1Choose = 3'b000;
				rd2Choose = 3'b000;
				wtChoose = 3'b000;
				wdataChoose = 3'b000;
				AChoose = 3'b000;
				BChoose = 3'b000;
				aluOp = 6'b000000;	//aluOp = addu
				grfWE = 1'd1;			//
				memWrite = 1'd0;
				mode = `jrmode;	  //mode = jrmode			
			end else begin
				grfWE = 1'd0;
				memWrite = 1'd0;
				mode = `norm;		
			end
		end else begin
			if (opcode == `ori) begin
				 rd1Choose = 3'b000;
				 wtChoose = 3'b001;	//wt = rt
				 wdataChoose = 3'b000;
				 AChoose = 3'b000;
				 BChoose = 3'b001;	//B = immZeroExt
				 aluOp = 6'b000010;	//aluOp = or
				 grfWE = 1'd1;			//
				 memWrite = 1'd0;
				 mode = `norm;			
			end else if (opcode == `lw) begin
				 rd1Choose = 3'b000;
				 wtChoose = 3'b001;	//wt = rt
				 wdataChoose = 3'b001;//wdata = memOut
				 AChoose = 3'b000;
				 BChoose = 3'b010;	//B = immSignExt
				 aluOp = 6'b000000;	//aluOp = addu
				 memAdrChoose = 3'b000;		//memAdr = aluOut
				 grfWE = 1'd1;			//
				 memWrite = 1'd0;
				 mode = `norm;			
			end else if (opcode == `sw) begin
				 rd1Choose = 3'b000;
				 AChoose = 3'b000;
				 BChoose = 3'b010;			//B = immSignExt
				 aluOp = 6'b000000;			//aluOp = addu
				 memAdrChoose = 3'b000;		//memAdr = aluOut
				 memWdataChoose = 3'b000;	//memWdata = GPR[rt] 
				 grfWE = 1'd0;			
				 memWrite = 1'd1;		//
				 mode = `norm;			
			end else if (opcode == `beq) begin
				 rd1Choose = 3'b000;
				 rd2Choose = 3'b000;
				 AChoose = 3'b000;
				 BChoose = 3'b000;
				 aluOp = 6'b000100;
				 grfWE = 1'd0;
				 memWrite = 1'd0;
				 mode = `logi;			
			end else if (opcode == `lui) begin
				 rd1Choose = 3'b000;
				 wtChoose = 3'b001;		//wt = rt
				 wdataChoose = 3'b000;
				 AChoose = 3'b000;
				 BChoose = 3'b001;		//B = immZeroExt
				 aluOp = 6'b000011;		//aluOp = lui
				 grfWE = 1'd1;				//
				 memWrite = 1'd0;
				 mode = `norm;			
			end else if (opcode == `jal) begin
				 wtChoose = 3'b010;			//wt = 31
				 wdataChoose = 3'b000;
				 AChoose = 3'b001;			//A = pc
				 BChoose = 3'b011;			//B = 4
				 aluOp = 6'b000000;			//aluOp = addu 
				 grfWE = 1'd1;					//
				 memWrite = 1'd0;
				 mode = `jmode;				//			
			end else begin
				 grfWE = 1'd0;
				 memWrite = 1'd0;
				 mode = `norm;		
			end
		end
	 end

endmodule
