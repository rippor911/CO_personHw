`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:49 09/09/2025 
// Design Name: 
// Module Name:    cpu_checker 
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
module cpu_checker(
    input clk,
    input reset,
    input [7:0] char,
    output reg [1:0] format_type
    );
	 
	 wire number_flag,Hex_flag;
	 reg [1:0] format_flag; //00: error 01: pc 10: addr
	 reg [3:0] state,pcCount,addrCount,dataCount,numCount;
	
	assign number_flag = (char >= "0" && char <= "9") ? 1'd1 : 1'd0;
	assign Hex_flag = ((char >= "0" && char <= "9") || (char >= "a" && char <= "f")) ? 1'd1 : 1'd0;

	always@(posedge clk)
	begin
		if(reset) begin
			state <= 4'd0; 
			format_flag <= 2'd0;
			format_type <= 2'd0;
		end else begin
			case (state)
				4'd0:                        //start state
				begin
					format_type <= 2'd0;
					if(char == "^") begin
						state <= 4'd1;
					end
				end
				4'd1:                       //Dec state beginning
					if(number_flag)
					begin
						state <= 4'd2;
						numCount <= 4'd1;
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end
				4'd2:                      //Dec state
					if(number_flag && numCount < 4'd4)
					begin
						numCount <= numCount + 4'd1;
						state <= 4'd2;
					end else if(char == "@" && numCount >= 4'd1 && numCount <= 4'd4 ) begin
						state <= 4'd3;
						pcCount <= 4'd0;
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end
				4'd3:					  //Hex state
					if(Hex_flag && pcCount < 4'd8)
					begin
						pcCount <= pcCount + 4'd1;
						state <= 4'd3;
					end else if(char == ":" && pcCount == 4'd8) begin
						state <= 4'd4;
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin 
						state <= 4'd0;
					end
				4'd4:					  //space state and fork state
					if(char == " ") begin
						state <= 4'd4;
					end else if(char == "$") begin
						state <= 4'd5;
						format_flag <= 2'd1; //pc format
					end else if(char == "*") begin
						state <= 4'd7;
						addrCount <= 4'd0;
						format_flag <= 2'd2; //addr format
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end
				4'd5:   					//pc format state:Dec state beginning
					if(number_flag) begin
						state <= 4'd6;
						numCount <= 4'd1;
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end
				4'd6:   					//pc format state:Dec state
					if(number_flag && numCount < 4'd4) begin
						numCount <= numCount + 4'd1;
						state <= 4'd6;
					end else if(char == " " && numCount >= 4'd1 && numCount <= 4'd4 ) begin
						state <= 4'd8;
					end else if(char == "<" && numCount >= 4'd1 && numCount <= 4'd4 ) begin
						state <= 4'd9;
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end
				4'd7:
					if(Hex_flag && addrCount < 4'd8) begin
						addrCount <= addrCount + 4'd1;
						state <= 4'd7;
					end else if(char == " " && addrCount == 4'd8) begin
						state <= 4'd8;
					end else if(char == "<" && addrCount == 4'd8) begin
						state <= 4'd9;
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end
				4'd8:
					if(char == " ") begin
						state <= 4'd8;
					end else if(char == "<") begin
						state <= 4'd9;
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end				
				4'd9:
					if(char == "=") begin
						state <= 4'd10;
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin 
						state <= 4'd0;
					end
				4'd10:
					if(char == " ") begin
						state <= 4'd10;
					end else if(Hex_flag) begin
						state <= 4'd11;
						dataCount <= 4'd1;
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end
				4'd11:
					if(Hex_flag && dataCount < 4'd8) begin
						dataCount <= dataCount + 4'd1;
						state <= 4'd11;
					end else if(char == "#" && dataCount == 4'd8) begin
						state <= 4'd12;
						format_type <= format_flag;
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end
				4'd12:
				begin
					if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end
					format_flag <= 2'd0;
					format_type <= 2'd0;
				end
			endcase

		end
	end

endmodule
