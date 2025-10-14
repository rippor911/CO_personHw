`timescale 1ns / 1ps
module cpu_checker(
    input clk,
    input reset,
    input [7:0] char,
	input [15:0] freq,
    output reg [1:0] format_type,
	output [3:0] error_code
    );
	 
	wire number_flag,Hex_flag;
	reg c1,c2,c3,c4;
	reg [1:0] format_flag; //00: error 01: grf 10: addr
	reg [3:0] state,pcCount,addrCount,dataCount,numCount,error_ans;
	reg [15:0] timer,grf,freq_half;
	reg [31:0] pc,addr,data;
	
	assign number_flag = (char >= "0" && char <= "9") ? 1'd1 : 1'd0;
	assign Hex_flag = ((char >= "0" && char <= "9") || (char >= "a" && char <= "f")) ? 1'd1 : 1'd0;
	assign error_code = error_ans;

	integer i;
	reg [5:0] exp;
	
	always @(freq) begin
		freq_half = (freq>>1);
	end

	always @(format_type) begin
		if (reset) begin
			error_ans = 4'd0;
		end else if (format_type) begin

			//timer check
			exp = 6'd0;
			for(i = 0; i < 16; i = i + 1) begin
				if((freq_half >> i) & 1) begin
					exp = i;
				end
			end
			if((timer >= (1 << exp)) && !(timer & ((1 << exp)-1))) begin
				c1 = 1'b0;
			end else begin
				c1 = 1'b1;
			end

			//pc check
			if(pc[1:0] == 0 && pc >= 32'h3000 && pc <= 32'h4fff) begin
				c2 = 1'b0;	
			end else begin
				c2 = 1'b1;
			end


			if(format_type == 2'd1) begin //grf format
				if(grf >= 16'd0 && grf <= 16'd31) begin
					c4 = 1'b0;	
				end else begin
					c4 = 1'b1;
				end

			end else if(format_type == 2'd2) begin //addr format
				if(addr[1:0] == 0 && addr >= 32'h00000000 && addr <= 32'h00002fff) begin
					c3 = 1'b0;	
				end else begin
					c3 = 1'b1;
				end
			end

			error_ans = {c4,c3,c2,c1};
		end
	end

	always@(posedge clk)
	begin
		if(reset) begin
			state <= 4'd0; 
			format_flag <= 2'd0;
			format_type <= 2'd0;
			c1 <= 1'b0;
			c2 <= 1'b0;	
			c3 <= 1'b0;
			c4 <= 1'b0;
		end else begin
			case (state)
				4'd0:                        //start state
				begin
					if(char == "^") begin
						state <= 4'd1;
					end
				end
				4'd1:                       //Dec state beginning
				begin
					format_type <= 2'd0;
					c1 <= 1'b0;
					c2 <= 1'b0;
					c3 <= 1'b0;
					c4 <= 1'b0;
					if(number_flag)
					begin
						state <= 4'd2;
						numCount <= 4'd1;
						timer <= char - "0";
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end
				end
				4'd2:                      //Dec state
					if(number_flag && numCount < 4'd4)
					begin
						timer <= (timer << 3) + (timer << 1) + (char - "0");
						numCount <= numCount + 4'd1;
						state <= 4'd2;
					end else if(char == "@" && numCount >= 4'd1 && numCount <= 4'd4 ) begin
						state <= 4'd3;
						pc <= 32'd0;
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
						pc <= (pc << 4) + (char >= "a" ? (char - "a" + 10) : (char - "0"));
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
						format_flag <= 2'd1; //grf format
					end else if(char == 8'd42) begin
						state <= 4'd7;
						addrCount <= 4'd0;
						addr <= 32'd0;
						format_flag <= 2'd2; //addr format
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end
				4'd5:   					//grf format state:Dec state beginning
					if(number_flag) begin
						state <= 4'd6;
						numCount <= 4'd1;
						grf <= char - "0";
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end
				4'd6:   					//pc format state:Dec state
					if(number_flag && numCount < 4'd4) begin
						numCount <= numCount + 4'd1;
						state <= 4'd6;
						grf <= (grf << 3) + (grf << 1) + (char - "0");
					end else if(char == " " && numCount >= 4'd1 && numCount <= 4'd4) begin
						state <= 4'd8;
					end else if(char == "<" && numCount >= 4'd1 && numCount <= 4'd4) begin
						state <= 4'd9;
					end else if(char == "^") begin
						state <= 4'd1;
					end else begin
						state <= 4'd0;
					end
				4'd7:
					if(Hex_flag && addrCount < 4'd8) begin
						addrCount <= addrCount + 4'd1;
						addr <= (addr << 4) + (char >= "a" ? (char - "a" + 10) : (char - "0"));
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
						data <= (data << 4) + (char >= "a" ? (char - "a" + 10) : (char - "0"));
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
					error_ans <= 4'd0;
				end
			endcase

		end
	end

endmodule
