`include "global.v"
`include "choose.v"
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
    input wire [5:0] opcode,
    input wire [5:0] func,
    output reg [2:0] rd1Choose,
    output reg [2:0] rd2Choose,
    output reg [2:0] wtChoose,
    output reg [2:0] wdataChoose,
    output reg [2:0] AChoose,
    output reg [2:0] BChoose,
	 output reg [5:0] aluOp,
    output reg [2:0] memAdrChoose,
    output reg [2:0] memWdataChoose,
    output reg grfWE,
    output reg [2:0] memWrite,
    output reg [2:0] mode
    );
	 /*default
				 rd1Choose = `rd1_rs;
				 rd2Choose = `rd2_rt;
				 wtChoose = `wt_rd;
				 wdataChoose = `wdata_alu;
				 AChoose = `A_rdata1;
				 BChoose = `B_rdata2;
				 aluOp = `aluAddu;
				 memAdrChoose = `memAdr_alu;
				 memWdataChoose = `memWdata_rdata2;
				 grfWE = 1'd0;
				 memWrite = `memNeg;
				 mode = `norm;
	 */
	 
	 always @(*) begin
		if (opcode == `special) begin
			if (func == `add) begin
				rd1Choose = `rd1_rs;
				rd2Choose = `rd2_rt;
				wtChoose = `wt_rd;
				wdataChoose = `wdata_alu;
				AChoose = `A_rdata1;
				BChoose = `B_rdata2;
				aluOp = `aluAddu;				//
				memAdrChoose = `memAdr_alu;
				memWdataChoose = `memWdata_rdata2;
				grfWE = 1'd1;					//
				memWrite = `memNeg;
				mode = `norm;				
			end else if (func == `sub) begin
				rd1Choose = `rd1_rs;
				rd2Choose = `rd2_rt;
				wtChoose = `wt_rd;
				wdataChoose = `wdata_alu;
				AChoose = `A_rdata1;
				BChoose = `B_rdata2;
				aluOp = `aluSubu;				//
				memAdrChoose = `memAdr_alu;
				memWdataChoose = `memWdata_rdata2;
				grfWE = 1'd1;					//
				memWrite = `memNeg;
				mode = `norm;								
			end else if (func == `jr) begin
				rd1Choose = `rd1_rs;
				rd2Choose = `rd2_rt;
				wtChoose = `wt_rd;
				wdataChoose = `wdata_alu;
				AChoose = `A_pc;
				BChoose = `B_four;
				aluOp = `aluAddu;				//
				memAdrChoose = `memAdr_alu;
				memWdataChoose = `memWdata_rdata2;
				grfWE = 1'd0;
				memWrite = `memNeg;
				mode = `jrmode;	         //
			end else begin
				rd1Choose = `rd1_rs;
				rd2Choose = `rd2_rt;
				wtChoose = `wt_rd;
				wdataChoose = `wdata_alu;
				AChoose = `A_rdata1;
				BChoose = `B_rdata2;
				aluOp = `aluAddu;				//
				memAdrChoose = `memAdr_alu;
				memWdataChoose = `memWdata_rdata2;
				grfWE = 1'd0;					//
				memWrite = `memNeg;
				mode = `norm;				
			end
		end else begin
			if (opcode == `ori) begin
				 rd1Choose = `rd1_rs;
				 rd2Choose = `rd2_rt;
				 wtChoose = `wt_rt;				//
				 wdataChoose = `wdata_alu;
				 AChoose = `A_rdata1;
				 BChoose = `B_immZeroExt;		//
				 aluOp = `aluOr;				   //
				 memAdrChoose = `memAdr_alu;
				 memWdataChoose = `memWdata_rdata2;
				 grfWE = 1'd1;					   //
				 memWrite = `memNeg;
				 mode = `norm;								 
			end else if (opcode == `lw) begin
				 rd1Choose = `rd1_rs;
				 rd2Choose = `rd2_rt;
				 wtChoose = `wt_rt;				//
				 wdataChoose = `wdata_mem;		//
				 AChoose = `A_rdata1;
				 BChoose = `B_immSignExt;		//
				 aluOp = `aluAddu;				//
				 memAdrChoose = `memAdr_alu;  //
				 memWdataChoose = `memWdata_rdata2;
				 grfWE = 1'd1;					   //
				 memWrite = `memNeg;
				 mode = `norm;								 
			end else if (opcode == `lh) begin
				 rd1Choose = `rd1_rs;
				 rd2Choose = `rd2_rt;
				 wtChoose = `wt_rt;				//
				 wdataChoose = `wdata_mem;		//
				 AChoose = `A_rdata1;
				 BChoose = `B_immSignExt;		//
				 aluOp = `aluAddu;				//
				 memAdrChoose = `memAdr_alu;  //
				 memWdataChoose = `memWdata_rdata2;
				 grfWE = 1'd1;					   //
				 memWrite = `memLh;
				 mode = `norm;								 
			end else if (opcode == `load) begin							//load          new                  instruction
				//TODO:set relevant args
				 rd1Choose = `rd1_rs;
				 rd2Choose = `rd2_rt;
				 wtChoose = `wt_lr;				//
				 wdataChoose = `wdata_mem;		//
				 AChoose = `A_rdata1;
				 BChoose = `B_immSignExt;		//
				 aluOp = `aluAddu;				//
				 memAdrChoose = `memAdr_alu;  //
				 memWdataChoose = `memWdata_rdata2;
				 grfWE = 1'd1;					   //
				 memWrite = `memNeg;
				 mode = `norm;									 
			end else if (opcode == `lb) begin
				 rd1Choose = `rd1_rs;
				 rd2Choose = `rd2_rt;
				 wtChoose = `wt_rt;				//
				 wdataChoose = `wdata_mem;		//
				 AChoose = `A_rdata1;
				 BChoose = `B_immSignExt;		//
				 aluOp = `aluAddu;				//
				 memAdrChoose = `memAdr_alu;  //
				 memWdataChoose = `memWdata_rdata2;
				 grfWE = 1'd1;					   //
				 memWrite = `memLb;
				 mode = `norm;								 
			end else if (opcode == `sw) begin
				 rd1Choose = `rd1_rs;
				 rd2Choose = `rd2_rt;
				 wtChoose = `wt_rd;
				 wdataChoose = `wdata_alu;
				 AChoose = `A_rdata1;
				 BChoose = `B_immSignExt;					//
				 aluOp = `aluAddu;							//
				 memAdrChoose = `memAdr_alu;				//
				 memWdataChoose = `memWdata_rdata2;		//
				 grfWE = 1'd0;
				 memWrite = `memSw;						   //
				 mode = `norm;								 
			end else if (opcode == `sh) begin
				 rd1Choose = `rd1_rs;
				 rd2Choose = `rd2_rt;
				 wtChoose = `wt_rd;
				 wdataChoose = `wdata_alu;
				 AChoose = `A_rdata1;
				 BChoose = `B_immSignExt;					//
				 aluOp = `aluAddu;							//
				 memAdrChoose = `memAdr_alu;				//
				 memWdataChoose = `memWdata_rdata2;		//
				 grfWE = 1'd0;
				 memWrite = `memSh;						   //
				 mode = `norm;				 
			end else if (opcode == `sb) begin
				 rd1Choose = `rd1_rs;
				 rd2Choose = `rd2_rt;
				 wtChoose = `wt_rd;
				 wdataChoose = `wdata_alu;
				 AChoose = `A_rdata1;
				 BChoose = `B_immSignExt;					//
				 aluOp = `aluAddu;							//
				 memAdrChoose = `memAdr_alu;				//
				 memWdataChoose = `memWdata_rdata2;		//
				 grfWE = 1'd0;
				 memWrite = `memSb;						   //
				 mode = `norm;				 		
			end else if (opcode == `beq) begin
				 rd1Choose = `rd1_rs;
				 rd2Choose = `rd2_rt;
				 wtChoose = `wt_rd;
				 wdataChoose = `wdata_alu;
				 AChoose = `A_rdata1;
				 BChoose = `B_rdata2;
				 aluOp = `aluEqu;								//
				 memAdrChoose = `memAdr_alu;
				 memWdataChoose = `memWdata_rdata2;
				 grfWE = 1'd0;
				 memWrite = `memNeg;
				 mode = `pcBeq;				 					//
			end else if (opcode == `lui) begin
				 rd1Choose = `rd1_rs;
				 rd2Choose = `rd2_rt;
				 wtChoose = `wt_rt;							//
				 wdataChoose = `wdata_alu;
				 AChoose = `A_rdata1;
				 BChoose = `B_immZeroExt;					//
				 aluOp = `aluLui;								//
				 memAdrChoose = `memAdr_alu;
				 memWdataChoose = `memWdata_rdata2;
				 grfWE = 1'd1;									//
				 memWrite = `memNeg;
				 mode = `norm;				 
			end else if (opcode == `jal) begin
				 rd1Choose = `rd1_rs;
				 rd2Choose = `rd2_rt;
				 wtChoose = `wt_ra;							//
				 wdataChoose = `wdata_alu;
				 AChoose = `A_pc;								//
				 BChoose = `B_four;							//
				 aluOp = `aluAddu;							//
				 memAdrChoose = `memAdr_alu;
				 memWdataChoose = `memWdata_rdata2;
				 grfWE = 1'd1;									//
				 memWrite = `memNeg;
				 mode = `jmode;								//
			end else begin
				 rd1Choose = `rd1_rs;
				 rd2Choose = `rd2_rt;
				 wtChoose = `wt_rd;
				 wdataChoose = `wdata_alu;
				 AChoose = `A_rdata1;
				 BChoose = `B_rdata2;
				 aluOp = `aluAddu;
				 memAdrChoose = `memAdr_alu;
				 memWdataChoose = `memWdata_rdata2;
				 grfWE = 1'd0;
				 memWrite = `memNeg;
				 mode = `norm;	
			end
		end
	 end

endmodule
