`include "global.v"
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
    output reg [2:0] memWrite,
    output reg [2:0] mode
    );
	 /*default
	 grfWE = 1'd0;
	 memWrite = `memNeg;
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
				aluOp = `aluAddu;	//aluOp = addu
				grfWE = 1'd1;			//
				memWrite = `memNeg;
				mode = `norm;				
			end else if (func == `sub) begin
				rd1Choose = 3'b000;
				rd2Choose = 3'b000;
				wtChoose = 3'b000;
				wdataChoose = 3'b000;
				AChoose = 3'b000;
				BChoose = 3'b000;
				aluOp = `aluSubu;	//aluOp = subu
				grfWE = 1'd1;			//
				memWrite = `memNeg;
				mode = `norm;			
			end else if (func == `jr) begin
				rd1Choose = 3'b000;
				rd2Choose = 3'b000;
				wtChoose = 3'b000;
				wdataChoose = 3'b000;
				AChoose = 3'b000;
				BChoose = 3'b000;
				aluOp = `aluAddu;	//aluOp = addu
				grfWE = 1'd1;			//
				memWrite = `memNeg;
				mode = `jrmode;	  //mode = jrmode			
			end else begin
				grfWE = 1'd0;
				memWrite = `memNeg;
				mode = `norm;		
			end
		end else begin
			if (opcode == `ori) begin
				 rd1Choose = 3'b000;
				 wtChoose = 3'b001;	//wt = rt
				 wdataChoose = 3'b000;
				 AChoose = 3'b000;
				 BChoose = 3'b001;	//B = immZeroExt
				 aluOp = `aluOr;	//aluOp = or
				 grfWE = 1'd1;			//
				 memWrite = `memNeg;
				 mode = `norm;			
			end else if (opcode == `lw) begin
				 rd1Choose = 3'b000;
				 wtChoose = 3'b001;	//wt = rt
				 wdataChoose = 3'b001;//wdata = memOut
				 AChoose = 3'b000;
				 BChoose = 3'b010;	//B = immSignExt
				 aluOp = `aluAddu;	//aluOp = addu
				 memAdrChoose = 3'b000;		//memAdr = aluOut
				 grfWE = 1'd1;			//
				 memWrite = `memNeg;
				 mode = `norm;			
			end else if (opcode == `sw) begin
				 rd1Choose = 3'b000;
				 rd2Choose = 3'b000;
				 AChoose = 3'b000;
				 BChoose = 3'b010;			//B = immSignExt
				 aluOp = `aluAddu;			//aluOp = addu
				 memAdrChoose = 3'b000;		//memAdr = aluOut
				 memWdataChoose = 3'b000;	//memWdata = GPR[rt] 
				 grfWE = 1'd0;			
				 memWrite = `memSw;		//
				 mode = `norm;			
			end else if (opcode == `sb) begin
				 rd1Choose = 3'b000;
				 rd2Choose = 3'b000;
				 AChoose = 3'b000;
				 BChoose = 3'b010;			//B = immSignExt
				 aluOp = `aluAddu;			//aluOp = addu
				 memAdrChoose = 3'b000;		//memAdr = aluOut
				 memWdataChoose = 3'b000;	//memWdata = GPR[rt] 
				 grfWE = 1'd0;			
				 memWrite = `memSb;		//
				 mode = `norm;			
			end else if (opcode == `beq) begin
				 rd1Choose = 3'b000;
				 rd2Choose = 3'b000;
				 AChoose = 3'b000;
				 BChoose = 3'b000;
				 aluOp = `aluEqu;
				 grfWE = 1'd0;
				 memWrite = `memNeg;
				 mode = `logi;			
			end else if (opcode == `lui) begin
				 rd1Choose = 3'b000;
				 wtChoose = 3'b001;		//wt = rt
				 wdataChoose = 3'b000;
				 AChoose = 3'b000;
				 BChoose = 3'b001;		//B = immZeroExt
				 aluOp = `aluLui;		//aluOp = lui
				 grfWE = 1'd1;				//
				 memWrite = `memNeg;
				 mode = `norm;			
			end else if (opcode == `jal) begin
				 wtChoose = 3'b010;			//wt = 31
				 wdataChoose = 3'b000;
				 AChoose = 3'b001;			//A = pc
				 BChoose = 3'b011;			//B = 4
				 aluOp = `aluAddu;			//aluOp = addu 
				 grfWE = 1'd1;					//
				 memWrite = `memNeg;
				 mode = `jmode;				//			
			end else begin
				 grfWE = 1'd0;
				 memWrite = `memNeg;
				 mode = `norm;		
			end
		end
	 end

endmodule
