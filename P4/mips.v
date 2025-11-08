`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:49 11/06/2025 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
	 
	 //global variable
	 wire [31:0] next_pc;
	 wire [31:0] pcAdr;
	 wire [31:0] instr;
	 wire logicOutput;
	 wire [2:0] mode;
	 wire [31:0] immZeroExt;
	 wire [31:0] immSignExt;
	 wire [31:0] aluOut;	 
    wire [5:0] opcode;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [5:0] shamt;
    wire [5:0] func;
    wire [15:0] imm;
    wire [25:0] instr_index;
    wire [5:0] aluOp;
    wire [31:0] A;
    wire [31:0] B;
    wire [2:0] rd1Choose;
    wire [2:0] rd2Choose;
    wire [2:0] wtChoose;
    wire [2:0] wdataChoose;
    wire [2:0] AChoose;
    wire [2:0] BChoose;
    wire [2:0] memAdrChoose;
    wire [2:0] memWdataChoose;
    wire grfWE;
    wire memWrite;
    wire [4:0] rd1;
    wire [4:0] rd2;
    wire [4:0] wt;
    wire [31:0] wdata;
	 wire [31:0] wPc;
    wire [31:0] rdata1;
    wire [31:0] rdata2;
    wire [31:0] memAdr;
    wire [31:0] memWdata;
    wire [31:0] memOut;	 
	 
	 reg [31:0] constant4 = 32'd4;
	 reg [4:0] constantRa = 5'd31;
	 
	 
	 //pc zone	 
	 pc pc (
		.clk(clk),
		.reset(reset),
		.npc(next_pc),
		.pc(pcAdr)
	 );
	 im im (
		.adr(pcAdr),
		.instr(instr)
	 );
	 
	 //npc zone
	 npc npc(
		.logicOutput(logicOutput),
		.mode(mode),
		.pc(pcAdr),
		.immSignExt(immSignExt),
		.instr_index(instr_index),
		.aluOut(aluOut),
		.npc(next_pc)		
	 );
	 
	 //splitter zone			
	 splitter splitter(
		.instr(instr),
		.opcode(opcode),
		.rs(rs),
		.rt(rt),
		.rd(rd),
		.shamt(shamt),
		.func(func),
		.imm(imm),
		.instr_index(instr_index)
	 );
	 
	 //alu zone
	mux32 Achooser(
		.choose(AChoose),
		.input0(rdata1),
		.input1(pcAdr),
		.out(A)
	);
	
	mux32 Bchooser(
		.choose(BChoose),
		.input0(rdata2),
		.input1(immZeroExt),
		.input2(immSignExt),
		.input3(constant4),
		.out(B)
	);
	 
	 alu alu (
		.aluOp(aluOp),
		.A(A),
		.B(B),
		.logicOutput(logicOutput),
		.out(aluOut)
	 );
	 
	 //controller zone
	 controller controller(
		.opcode(opcode),
		.func(func),
		.rd1Choose(rd1Choose),
		.rd2Choose(rd2Choose),
		.wdataChoose(wdataChoose),
		.wtChoose(wtChoose),
		.AChoose(AChoose),
		.BChoose(BChoose),
		.memAdrChoose(memAdrChoose),
		.memWdataChoose(memWdataChoose),
		.aluOp(aluOp),
		.grfWE(grfWE),
		.memWrite(memWrite),
		.mode(mode)
	 );
	 
	 //ext zone
	 ext ext (
		.imm(imm),
		.immSignExt(immSignExt),
		.immZeroExt(immZeroExt)
	 );
	 
	 //grf zone
	 
	 mux5 rd1Chooser(
		.choose(rd1Choose),
		.input0(rs),
		.out(rd1)
	 );
	 
	 mux5 rd2Chooser(
		.choose(rd2Choose),
		.input0(rt),
		.out(rd2)
	 );
	 
	 mux5 wtChooser(
		.choose(wtChoose),
		.input0(rd),
		.input1(rt),
		.input2(constantRa),
		.out(wt)
	 );
	 
	 mux32 wdataChooser(
		.choose(wdataChoose),
		.input0(aluOut),
		.input1(memOut),
		.out(wdata)
	 );
	 
	 grf grf (
		.clk(clk),
		.reset(reset),
		.rd1(rd1),
		.rd2(rd2),
		.wt(wt),
		.WE(grfWE),
		.wdata(wdata),
		.wPc(pcAdr),
		.rdata1(rdata1),
		.rdata2(rdata2)
	 );
	 
	 
	 //mem zone	 
	 
	 mux32 memAdrChooser(
		.choose(memAdrChoose),
		.input0(aluOut),
		.out(memAdr)
	 );
	 
	 mux32 memWdataChooser(
		.choose(memWdataChoose),
		.input0(rdata2),
		.out(memWdata)
	 );
	 
	 mem mem (
		.clk(clk),
		.reset(reset),
		.memAdr(memAdr),
		.memWrite(memWrite),
		.wdata(memWdata),
		.wPc(pcAdr),
		.memOut(memOut)
	 );
	 
endmodule
