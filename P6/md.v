`include "global.v"
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    18:11:14 11/25/2025
// Design Name:
// Module Name:    md
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
module md(
    input wire clk,
    input wire reset,
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [3:0] op,
    output wire busy,
    output wire [31:0] out
    );

    reg [31:0] LO;
    reg [31:0] HI;
    reg [3:0] count;
	 
	 wire [63:0] mult_result;
	 wire [63:0] multu_result;

    localparam mult_delay = 5;
    localparam div_delay = 10;     
     
    assign busy = (count != 0);
	 
	 assign mult_result = $signed(A) * $signed(B);
	 assign multu_result = A * B;
	 
	 assign out = (op == `mdMfhi) ? HI :
						LO;

    always @(posedge clk) begin
        if(reset) begin
            LO <= 0;
            HI <= 0;
            count <= 0;
        end else begin
            if (count == 0) begin
                if (op == `mdMult) begin
                    HI <= mult_result[63:32];
                    LO <= mult_result[31:0];
                    count <= mult_delay;
                end else if (op == `mdMultu) begin
                    HI <= multu_result[63:32];
                    LO <= multu_result[31:0];
                    count <= mult_delay;
                end else if (op == `mdDiv) begin
                    if (B != 0) begin
                        HI <= $signed(A) % $signed(B);
                        LO <= $signed(A) / $signed(B);
                    end
                    count <= div_delay;
                end else if (op == `mdDivu) begin
                    if (B != 0) begin
                        HI <= A % B;
                        LO <= A / B;
                    end
                    count <= div_delay;
                end else if (op == `mdMthi) begin
                    HI <= A;
                end else if (op == `mdMtlo) begin
                    LO <= A;
                end
            end else begin
                count <= count - 1;
            end
        end
    end

endmodule