//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:04:01 11/13/2025 
// Design Name: 
// Module Name:    hazard_ctrl 
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
module hazard_ctrl(
    input wire [31:0] F_D_instr,
    input wire [31:0] D_E_instr,
    input wire [31:0] E_M_instr,
    input wire [31:0] M_W_instr,
	 input wire D_E_grfWE,
	 input wire E_M_grfWE,
	 input wire M_W_grfWE,
	 input wire [4:0] lr,
	 input wire busy,
    output wire [2:0] D_rdata1Choose,
    output wire [2:0] D_rdata2Choose,
    output wire [2:0] E_rdata1Choose,
    output wire [2:0] E_rdata2Choose,
    output wire [2:0] M_rdata2Choose,
	 output wire stall,
	 output wire clear
    );
	 
	//function declaration
	function isLoad;
		input [31:0] instr;
		reg [5:0] opcode;
		reg [4:0] rs;
		begin
			opcode = instr[31:26];
			rs = instr[25:21];
			isLoad = opcode == `lw || opcode == `lh || opcode == `lb || opcode == `load || (opcode == `cop0 && rs == `mfc0);
			//TODO:add load!!!
		end
	endfunction
	
	function possibleLoad;
		input [4:0] A_use;
		begin
			possibleLoad = A_use != 0;																			//TODO:set possible range!!!
		end
	endfunction
	 
	//consumer
	 wire [4:0] D_A_1;
	 wire [2:0] D_Tuse_1;
	 wire [4:0] D_A_2;
	 wire [2:0] D_Tuse_2;
	 
	 consumer D_consumer(
		.instr(F_D_instr),
		.A_1(D_A_1),
		.Tuse_1(D_Tuse_1),
		.A_2(D_A_2),
		.Tuse_2(D_Tuse_2)
	 );
	 
	 wire [4:0] E_A_1;
	 wire [4:0] E_A_2;
	 
	 consumer E_consumer(
		.instr(D_E_instr),
		.A_1(E_A_1),
		.A_2(E_A_2)
	 );

	 wire [4:0] M_A_1;
	 wire [4:0] M_A_2;
	 
	 consumer M_consumer(
		.instr(E_M_instr),
		.A_1(M_A_1),
		.A_2(M_A_2)
	 );
	 
	 //producer
	 reg [2:0] constant1 = 0;
	 wire [2:0] E_Tnew;
	 wire [4:0] E_A;
	 producer E_producer(
		.instr(D_E_instr),
		.grfWE(D_E_grfWE),
		.Tnow(constant1),
		.Tnew(E_Tnew),
		.A(E_A)
	 );
	 
	 reg [2:0] constant2 = 1;
	 wire [2:0] M_Tnew;
	 wire [4:0] M_A;
	 producer M_producer(
		.instr(E_M_instr),
		.grfWE(E_M_grfWE),
		.Tnow(constant2),
		.Tnew(M_Tnew),
		.A(M_A)
	 );

	 reg [2:0] constant3 = 2;
	 wire [2:0] W_Tnew;
	 wire [4:0] W_A;
	 producer W_producer(
		.instr(M_W_instr),
		.grfWE(M_W_grfWE),
		.Tnow(constant3),
		.Tnew(W_Tnew),
		.A(W_A)
	 );
	 
	 //stall 
	 wire stall1  =   (D_A_1 == 0)   ? 																		 0:
							(D_E_instr[31:26] == `load && D_Tuse_1 <= 1 && possibleLoad(D_A_1)) ? 1:								
							(E_A == D_A_1) ? 									((E_Tnew > D_Tuse_1) ? 1 : 0):
							(E_M_instr[31:26] == `load && D_Tuse_1 == 0 && possibleLoad(D_A_1)) ? 1:		   					
							(M_A == D_A_1) ? 								  ((M_Tnew > D_Tuse_1) ? 1 : 0) :
							(W_A == D_A_1) ? 								  ((W_Tnew > D_Tuse_1) ? 1 : 0) :
							0;
	 wire stall2  =   (D_A_2 == 0)   ? 																		 0:
							(D_E_instr[31:26] == `load && D_Tuse_2 <= 1 && possibleLoad(D_A_2)) ? 1:								
							(E_A == D_A_2) ? 									((E_Tnew > D_Tuse_2) ? 1 : 0):
							(E_M_instr[31:26] == `load && D_Tuse_2 == 0 && possibleLoad(D_A_2)) ? 1:		   					
							(M_A == D_A_2) ? 								  ((M_Tnew > D_Tuse_2) ? 1 : 0) :
							(W_A == D_A_2) ? 								  ((W_Tnew > D_Tuse_2) ? 1 : 0) :
							0;
							
	 wire stall3  =	busy == 0 ? 0 :
							(F_D_instr[31:26] == `special && ((F_D_instr[5:0] & 6'b110100) == 6'b010000)) ? 1 :
							0;
						
	 wire stall4  =  (!(F_D_instr[31:26] == `cop0 && F_D_instr[5:0] == `eret)) ? 0 :
						  (D_E_instr[31:26] == `cop0 && (D_E_instr[15:11] == 5'd14) 
															&& D_E_instr[25:21] == `mtc0)		? 1 :
						  (E_M_instr[31:26] == `cop0 && (E_M_instr[15:11] == 5'd14) 
															&& E_M_instr[25:21] == `mtc0)		? 1 :
						  0;
	 
	 assign stall = stall1 || stall2 || stall3 || stall4;
	 assign clear = stall1 || stall2	|| stall3 || stall4;			
	 
	 //forward
	 assign D_rdata1Choose = (D_A_1 == 0)                  ? `origin                                				:
									 (D_A_1 == M_A && M_Tnew <= 0) ? `M_alu                                 				:
									 (M_W_instr[31:26] == `load && D_A_1 == lr) ? `W_mem											:				
 									 (D_A_1 == W_A && W_Tnew <= 0) ? ((isLoad(M_W_instr) == 1) ? `W_mem : `W_alu) 		:
									 `origin;
									 
	 assign D_rdata2Choose = (D_A_2 == 0)                  ? `origin                                				:
									 (D_A_2 == M_A && M_Tnew <= 0) ? `M_alu                                 				:
									 (M_W_instr[31:26] == `load && D_A_2 == lr) ? `W_mem											:
									 (D_A_2 == W_A && W_Tnew <= 0) ? ((isLoad(M_W_instr) == 1) ? `W_mem : `W_alu) 		:
									 `origin;
									 
	 assign E_rdata1Choose = (E_A_1 == 0)                  ? `origin                                				:
									 (E_A_1 == M_A && M_Tnew <= 0) ? `M_alu                                 				:
									 (M_W_instr[31:26] == `load && E_A_1 == lr) ? `W_mem											:				
									 (E_A_1 == W_A && W_Tnew <= 0) ? ((isLoad(M_W_instr) == 1) ? `W_mem : `W_alu) 		:
									 `origin;	
									 
	 assign E_rdata2Choose = (E_A_2 == 0)                  ? `origin                                				:
									 (E_A_2 == M_A && M_Tnew <= 0) ? `M_alu                                 				:
									 (M_W_instr[31:26] == `load && E_A_2 == lr) ? `W_mem											:				
									 (E_A_2 == W_A && W_Tnew <= 0) ? ((isLoad(M_W_instr) == 1) ? `W_mem : `W_alu) 		:
									 `origin;	
									 
	 assign M_rdata2Choose = (M_A_2 == 0)                  ? `origin                                				:
									(M_W_instr[31:26] == `load && M_A_2 == lr) ? `W_mem											:				
									 (M_A_2 == W_A && W_Tnew <= 0) ? ((isLoad(M_W_instr) == 1) ? `W_mem : `W_alu) 		:
									 `origin;										 

endmodule
