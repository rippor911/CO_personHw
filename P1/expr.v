`timescale 1ns / 1ps
parameter empty = 2'b00,
          right = 2'b01,
          error = 2'b10,
          sign = 2'b11;
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:36 10/14/2025 
// Design Name: 
// Module Name:    expr 
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
module expr(
    input clk,
    input clr,
    input [7:0] in,
    output out
    );

    reg [1:0] state;

    always @(posedge clk or clr) begin
        if(clr) begin
            state <= empty;
            out <= 1'b0;
        end else begin
            case(state)
            empty:
                begin
                    if(in >= "0" && in <= "9") begin
                        state <= right;
                        out <= 1'b1;
                    end else begin
                        state <= error;
                    end
                end
            right:
                begin
                    if(in == "+" || in == "*") begin
                        state <= sign;
                        out <= 1'b0;
                    end else begin
                        state <= error;
                        out <= 1'b0;                        
                    end
                end
            error:
                begin
                    out <= 1'b0;
                end
            sign:
                begin
                    if(in >= "0" && in <= "9") begin
                        state <= right;
                        out <= 1'b1;
                    end else begin
                        state <= error;
                    end
                end
            default:
                begin
                    state <= error;
                    out <= 1'b0;
                end
            endcase
        end
    end

endmodule
