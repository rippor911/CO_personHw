`timescale 1ns / 1ps
parameter empty = 4'b0000, 
			 bn1 = 4'b0001,
			 bn2 = 4'b0010,
			 bn3 = 4'b0011,
			 bn4 = 4'b0100,
			 bn5 = 4'b0101,
			 ed1 = 4'b0110,
			 ed2 = 4'b0111,
			 ed3 = 4'b1000,
			 reading = 4'b1001;
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:39 10/15/2025 
// Design Name: 
// Module Name:    BlockChecker 
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
module BlockChecker(
    input clk,
    input reset,
    input [7:0] in,
    output result
    );
	reg [31:0] sum;
	reg [3:0] state;
	reg flag;
	assign result = (flag == 1) ? 0 : ((sum == 0) ? 1 : 0);
	
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			sum <= 0;
			state <= empty;
			flag <= 0;
		end else begin
			case (state)
			empty:
			begin
				if (in == "b" || in == "B") begin
					state <= bn1;
				end else if (in == "e" || in == "E") begin
					state <= ed1;
				end else if ((in >= "a" && in <= "z") || (in >= "A" && in <= "Z")) begin
					state <= reading;
				end
			end
			reading:
			begin
				if (in == " ") begin
					state <= empty;
				end
			end
			bn1:
			begin
				if (in == "e" || in == "E") begin
					state <= bn2;
				end else if ((in >= "a" && in <= "z") || (in >= "A" && in <= "Z")) begin
					state <= reading;
				end else begin
					state <= empty;
				end
			end
			bn2:
			begin
				if (in == "g" || in == "G") begin
					state <= bn3;
				end else if ((in >= "a" && in <= "z") || (in >= "A" && in <= "Z")) begin
					state <= reading;
				end else begin
					state <= empty;
				end			
			end
			bn3:
			begin
				if (in == "i" || in == "I") begin
					state <= bn4;
				end else if ((in >= "a" && in <= "z") || (in >= "A" && in <= "Z")) begin
					state <= reading;
				end else begin
					state <= empty;
				end			
			end
			bn4:
			begin
				if (in == "n" || in == "N") begin
					state <= bn5;
					sum <= sum + 1;
				end else if ((in >= "a" && in <= "z") || (in >= "A" && in <= "Z")) begin
					state <= reading;
				end else begin
					state <= empty;
				end			
			end
			bn5:
			begin
				if ((in >= "a" && in <= "z") || (in >= "A" && in <= "Z")) begin
					sum <= sum - 1;
					state <= reading;
				end else begin
					state <= empty;
				end			
			end			
			ed1:
			begin
				if (in == "n" || in == "N") begin
					state <= ed2;
				end else if ((in >= "a" && in <= "z") || (in >= "A" && in <= "Z")) begin
					state <= reading;
				end else begin
					state <= empty;
				end			
			end			
			ed2:
			begin
				if (in == "d" || in == "D") begin
					state <= ed3;
					sum <= sum - 1;
				end else if ((in >= "a" && in <= "z") || (in >= "A" && in <= "Z")) begin
					state <= reading;
				end else begin
					state <= empty;
				end			
			end			
			ed3:
			begin
				if ((in >= "a" && in <= "z") || (in >= "A" && in <= "Z")) begin
					sum <= sum + 1;
					state <= reading;
				end else begin
					if ($signed(sum) < 0) begin
						flag <= 1;
					end
					state <= empty;
				end
			end
			default:
			begin
			end
			endcase
		end
	end

endmodule
