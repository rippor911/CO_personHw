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
`include "global.v"
`include "choose.v"
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
	 output wire [3:0] mdOp,
	 output wire [2:0] aluOutChoose,
	 output wire [2:0] memOutChoose,
	 output wire cp0En,
	 output wire [4:0] ExcCode,
	 output wire BD,
	 output wire EXLClr
    );
	 
    wire [5:0] opcode = instr[31:26];
    wire [5:0] func = instr[5:0];
	 wire [4:0] rs = instr[25:21];
	 
	 //type signal:
	 wire instr_special 	= (opcode == `special);
	 wire instr_calImm  	= (opcode == `ori || opcode == `lui  || opcode == `andi || opcode == `addi || opcode == `addiu);
	 wire instr_load    	= (opcode == `lw  || opcode == `load || opcode == `lb || opcode == `lh);
	 wire instr_save 	  	= (opcode == `sw  || opcode == `sb   || opcode == `sh);
	 wire instr_branch  	= (opcode == `beq || opcode == `branch || opcode == `bne);
	 wire instr_jump    	= (opcode == `jal);
	 wire instr_cop0		= (opcode == `cop0 && (rs == `mfc0 || rs == `mtc0 || func == `eret));
	 
	 //special zone:
	 wire calRR = (opcode == `special && !(func == `jr));
	 wire jump_register = (opcode == `special && (func == `jr));
	 
	 wire instr_calRR = (instr_special && (func == `add || func == `sub || func == `annd 
													|| func == `orr || func == `slt || func == `sltu 
													|| func == `addu));
	 wire instr_md = (opcode == `special && ((func & 6'b111100) == 6'b011000));	 
	 wire instr_sysc		= (opcode == `special && func == `sysc);
	 
	 wire all_link = (instr_jump);													//link in all cases
	 
	 wire pcfour = (opcode == `jal || opcode == `branch);						//link pc + 4 (pc + 8 actually if consider delayed branch)
	 
	 //ALUOP:
	 wire instr_sub  = (instr_special && (func == `sub));
	 wire instr_add  = (instr_special && (func == `add) || instr_load || instr_save || opcode == `addi);
	 wire instr_or   = (opcode == `ori  || (opcode == `special && func == `orr));
	 wire instr_and  = (opcode == `andi || (opcode == `special && func == `annd));
	 wire instr_lui  = (opcode == `lui);
	 wire instr_slt  = (opcode == `special && func == `slt);
	 wire instr_sltu = (opcode == `special && func == `sltu);
	 

	 
	 //choose:
    assign rd1Choose      = `rd1_rs;
    assign rd2Choose      = `rd2_rt;
    assign memAdrChoose   = `memAdr_alu;
    assign memWdataChoose = `memWdata_rdata2;
	 
    assign wtChoose = (all_link || pcfour) ? `wt_ra :
							 (opcode == `load) ? `wt_lr :
							 (instr_calImm || instr_load || (instr_cop0 && (rs == `mfc0))) ? `wt_rt :
							 `wt_rd; // Default (includes add, sub, jr, sw, beq, etc.)
							 
	 assign wdataChoose = (instr_load || (instr_cop0 && (rs == `mfc0))) ? `wdata_mem : 
								 `wdata_alu;
							  
	 assign AChoose = (pcfour) ? `A_pc : 
							`A_rdata1;
						
    assign BChoose = (pcfour) ? `B_four :
							(instr_load | instr_save | (opcode == `addi || opcode == `addiu)) ? `B_immSignExt :
							(instr_calImm) ? `B_immZeroExt :
							`B_rdata2; // Default(includes add, sub, beq)						
						
    assign aluOp = (instr_sub) 	? `aluSub 	:
						 (instr_add)	? `aluAdd	:
                   (instr_or) 	? `aluOr 	:
						 (instr_and) 	? `aluAnd	:
                   (instr_lui) 	? `aluLui 	:
						 (instr_slt)	? `aluSlt	:
						 (instr_sltu)	? `aluSltu	:
                   `aluAddu;
						 
    assign grfWE = (calRR | instr_calImm | instr_load | all_link | (instr_cop0 && (rs == `mfc0)));
	 
	 assign memWE = (instr_save) ? 1:
                   0; // Default (Read or NOP)
						 
	 assign npcMode = (jump_register) ? `jrmode			:
							(instr_jump) ? `jmode				:
							(opcode == `beq) ? `pcBeq			:
							(opcode == `branch) ? `pcBranch	:
							(opcode == `bne) ? `pcBne			:
							`norm;
	
	assign mdOp = (instr_special && func == `mult) 	? `mdMult 	:
					  (instr_special && func == `multu) ? `mdMultu 	:
					  (instr_special && func == `div) 	? `mdDiv 	:
					  (instr_special && func == `divu) 	? `mdDivu 	:
					  (instr_special && func == `mfhi) 	? `mdMfhi 	:
					  (instr_special && func == `mflo) 	? `mdMflo 	:
					  (instr_special && func == `mthi) 	? `mdMthi 	:
					  (instr_special && func == `mtlo) 	? `mdMtlo 	:
					  `mdNeg;
					  
	assign aluOutChoose = (mdOp != `mdNeg) ? 	`aluOut_md 	:
								 `aluOut_alu;
								 
	assign memOutChoose = (instr_cop0 && (rs == `mfc0)) ? `memOut_cp0 :
								 `memOut_mem;
								 
	assign cp0En = (instr_cop0 && (rs == `mtc0));
	
	assign ExcCode = (instr == 0)		? `ExcInt:
						  (instr_load) 	? `ExcInt:
						  (instr_save) 	? `ExcInt:
						  (instr_calRR)	? `ExcInt:
						  (instr_calImm || instr_branch || instr_jump || instr_cop0) ? `ExcInt :
						  ((mdOp != `mdNeg)	|| (opcode == `special && (func == `jr))) ?  `ExcInt :
						  (instr_sysc) ? `ExcSysC	:
						  `ExcRI; 
						  
	assign BD = (instr_branch | instr_jump | jump_register);
	assign EXLClr = (instr_cop0 && (func == `eret));
endmodule
