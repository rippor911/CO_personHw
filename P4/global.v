//time
`timescale 1ns / 1ps


//opcode
`define special 6'b000000
//func:special
`define add 6'b100000
`define sub 6'b100010
`define jr  6'b001000

`define ori 6'b001101
`define lw  6'b100011
`define sw  6'b101011
`define sb  6'b101000
`define beq 6'b000100
`define lui 6'b001111
`define jal 6'b000011


//npc mode
`define norm 3'b000
`define logi 3'b001
`define jmode 3'b010
`define jrmode 3'b011


//aluOp
`define aluAddu 6'd0
`define aluSubu 6'd1
`define aluOr	 6'd2
`define aluLui  6'd3
`define aluEqu  6'd4


//memMode
`define memNeg 3'd0
`define memSw  3'd1
`define memSb  3'd2