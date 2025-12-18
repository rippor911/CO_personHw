//time
`timescale 1ns / 1ps

//syntax
`default_nettype none


//opcode
`define special 6'b000000
//func:special
`define add 	6'b100000
`define addu 	6'b100001
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

`define sysc	6'b001100

`define cop0	6'b010000
//rs:cop0
`define mfc0	5'b00000
`define mtc0	5'b00100
`define eret   6'b011000

`define ori 	6'b001101
`define addi 	6'b001000
`define addiu	6'b001001
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
`define load 	6'b100101		//load TODO:opcode    :lhu
`define branch 6'b000111		//branch TODO:opcode	 :bgtz

//npc mode
`define norm 		3'd0
`define jmode 		3'd1
`define jrmode 	3'd2
`define pcBeq 		3'd3
`define pcBranch 	3'd4
`define pcBne		3'd5


//aluOp
`define aluAddu 	6'd0
`define aluSub 	6'd1
`define aluOr	 	6'd2
`define aluLui  	6'd3
`define aluAnd	 	6'd4
`define aluSlt	 	6'd5
`define aluSltu	6'd6
`define aluAdd		6'd7

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


//ExcCode
`define ExcInt		5'd0
`define ExcAdEL	5'd4
`define ExcAdES	5'd5
`define ExcSysC	5'd8
`define ExcRI		5'd10
`define ExcOv		5'd12