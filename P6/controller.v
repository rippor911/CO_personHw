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
	 input wire [31:0] instr,
    output wire [2:0] rd1Choose,
    output wire [2:0] rd2Choose,
    output wire [2:0] wtChoose,
    output wire [2:0] wdataChoose,
    output wire [2:0] AChoose,
    output wire [2:0] BChoose,
	 output wire [5:0] aluOp,
    output wire [2:0] memAdrChoose,
    output wire [2:0] memWdataChoose,
    output wire grfWE,
    output wire memWE,
	 output wire [2:0] npcMode,
	 output wire [3:0] mdOp
    );
	 
    wire [5:0] opcode = instr[31:26];
    wire [5:0] func = instr[5:0];
	 
	 //type signal:
	 wire instr_special = (opcode == `special);
	 wire instr_calImm  = (opcode == `ori || opcode == `lui  || opcode == `andi || opcode == `addi);
	 wire instr_load    = (opcode == `lw  || opcode == `load || opcode == `lb || opcode == `lh);
	 wire instr_save 	  = (opcode == `sw  || opcode == `sb   || opcode == `sh);
	 wire instr_branch  = (opcode == `beq || opcode == `branch || opcode == `bne);
	 wire instr_jump    = (opcode == `jal);
	 
	 wire all_link = (instr_jump);													//link in all cases
	 
	 wire pcfour = (opcode == `jal || opcode == `branch);						//link pc + 4 (pc + 8 actually if consider delayed branch)
	 
	 wire instr_sub = (instr_special & (func == `sub));
	 
	 wire instr_or  = (opcode == `ori  || (opcode == `special && func == `orr));
	 
	 wire instr_and = (opcode == `andi || (opcode == `special && func == `annd));
	 
	 wire instr_lui = opcode == `lui;
	 
	 wire instr_slt = (opcode == `special && func == `slt);
	 
	 wire instr_sltu = (opcode == `special && func == `sltu);
	 
	 //special zone:
	 wire calRR = (opcode == `special && !(func == `jr));
	 wire jump_register = (opcode == `special & (func == `jr));
	 
	 wire instr_md = (opcode == `special && ((func & 6'b111100) == 6'b011000));
	 
	 //choose:
    assign rd1Choose      = `rd1_rs;
    assign rd2Choose      = `rd2_rt;
    assign memAdrChoose   = `memAdr_alu;
    assign memWdataChoose = `memWdata_rdata2;
	 
    assign wtChoose = (all_link || pcfour) ? `wt_ra :
							 (opcode == `load) ? `wt_lr :
							 (instr_calImm | instr_load) ? `wt_rt :
							 `wt_rd; // Default (includes add, sub, jr, sw, beq, etc.)
							 
	 assign wdataChoose = (instr_load) ? `wdata_mem : 
								 `wdata_alu;
							  
	 assign AChoose = (pcfour) ? `A_pc : 
							`A_rdata1;
						
    assign BChoose = (pcfour) ? `B_four :
							(instr_load | instr_save | (opcode == `addi)) ? `B_immSignExt :
							(instr_calImm) ? `B_immZeroExt :
							`B_rdata2; // Default(includes add, sub, beq)						
						
    assign aluOp = (instr_sub) 	? `aluSubu 	:
                   (instr_or) 	? `aluOr 	:
						 (instr_and) 	? `aluAnd	:
                   (instr_lui) 	? `aluLui 	:
						 (instr_slt)	? `aluSlt	:
						 (instr_sltu)	? `aluSltu	:
                   `aluAddu; // Default: add, jr, jal, loads, stores	
						 
    assign grfWE = (calRR | instr_calImm | instr_load | all_link);
	 
	 assign memWE = (instr_save) ? 1:
                   0; // Default (Read or NOP)
						 
	 assign npcMode = (jump_register) ? `jrmode			:
							(instr_jump) ? `jmode				:
							(opcode == `beq) ? `pcBeq			:
							(opcode == `branch) ? `pcBranch	:
							(opcode == `bne) ? `pcBne			:
							`norm;
	
	assign mdOp = (opcode == `special && func == `mult) 	? `mdMult 	:
					  (opcode == `special && func == `multu) 	? `mdMultu 	:
					  (opcode == `special && func == `div) 	? `mdDiv 	:
					  (opcode == `special && func == `divu) 	? `mdDivu 	:
					  (opcode == `special && func == `mfhi) 	? `mdMfhi 	:
					  (opcode == `special && func == `mflo) 	? `mdMflo 	:
					  (opcode == `special && func == `mthi) 	? `mdMthi 	:
					  (opcode == `special && func == `mtlo) 	? `mdMtlo 	:
					  `mdNeg;
endmodule
