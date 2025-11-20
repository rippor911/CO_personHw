`include "global.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:44 11/06/2025 
// Design Name: 
// Module Name:    npc 
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
module npc(
    input wire [2:0] mode,
	 input wire [31:0] pc,
	 input wire [31:0] immSignExt,
    input wire [25:0] instr_index,
	 input wire [31:0] rdata1,
	 input wire [31:0] rdata2,
    output reg [31:0] npc,
	 output reg flush,
	 output reg link
    );
	 
	 wire [31:0] jmode_result = {pc[31:28], instr_index, 2'b00};
	 
	 always @(*) begin
		if (mode == `norm) begin
			npc = pc + 32'd4;
			flush = 0;
			link = 0;
		end else if (mode == `pcBeq) begin
			flush = 0;
			link = 0;
			if (rdata1 == rdata2) begin
				npc = pc + (immSignExt << 2);		//D_pc + 4 == F_pc
			end else begin
				npc = pc + 32'd4;
			end
		end else if (mode == `jmode) begin
			flush = 0;
			link = 0;
			npc = jmode_result;
		end else if (mode == `jrmode) begin
			flush = 0;
			link = 0;
			npc = rdata1;
		end else begin
			npc = pc + 32'd4;
			flush = 0;
		end
	 end

endmodule
