//time
`timescale 1ns / 1ps

//syntax
`default_nettype none


//opcode
`define special 6'b000000
//func:special
`define add 	6'b100000
`define sub 	6'b100010
`define annd  	6'b100100
`define orr		6'b100101
`define slt		6'b101010
`define sltu	6'b101011
`define jr  	6'b001000
`define mult 	6'b011000
`define multu	6'b011001
`define div		6'b011010
`define divu	6'b011011
`define mfhi	6'b010000
`define mthi	6'b010001
`define mflo	6'b010010
`define mtlo	6'b010011

`define ori 	6'b001101
`define addi 	6'b001000
`define andi	6'b001100
`define lw  	6'b100011
`define lb  	6'b100000
`define lh 		6'b100001
`define sw  	6'b101011
`define sb  	6'b101000
`define sh		6'b101001
`define beq 	6'b000100
`define bne		6'b000101
`define lui 	6'b001111
`define jal 	6'b000011
`define load 	6'b111111		//load TODO:opcode 
`define branch 6'b111110		//branch TODO:opcode

//npc mode
`define norm 		3'b000
`define jmode 		3'b001
`define jrmode 	3'b010
`define pcBeq 		3'b011
`define pcBranch 	3'b100
`define pcBne		3'b101


//aluOp
`define aluAddu 	6'd0
`define aluSubu 	6'd1
`define aluOr	 	6'd2
`define aluLui  	6'd3
`define aluAnd	 	6'd4
`define aluSlt	 	6'd5
`define aluSltu	6'd6

//mdOp
`define mdNeg		4'd0
`define mdMult		4'd1
`define mdMultu	4'd2
`define mdDiv		4'd3
`define mdDivu		4'd4
`define mdMfhi		4'd5
`define mdMflo		4'd6
`define mdMthi		4'd7
`define mdMtlo		4'd8