//rd1Choose
`define rd1_rs 3'b000


//rd2Choose:
`define rd2_rt 3'b000


//wtChoose:
`define wt_rd 3'b000
`define wt_rt 3'b001
`define wt_ra 3'b010
`define wt_lr 3'b011


//wdataChoose:
`define wdata_alu 3'b000
`define wdata_mem 3'b001


//AChoose:
`define A_rdata1 3'b000
`define A_pc 3'b001


//BChoose:
`define B_rdata2 3'b000
`define B_immZeroExt 3'b001
`define B_immSignExt 3'b010
`define B_four 3'b011


//memAdrChoose:
`define memAdr_alu 3'b000


//memWdataChoose:
`define memWdata_rdata2 3'b000


//hazardChoose:
`define origin 3'b000
`define M_alu 3'b001
`define W_mem 3'b010
`define W_alu 3'b011

//aluOutChoose:
`define aluOut_alu 3'd0
`define aluOut_md	 3'd1

//memOutChoose:
`define memOut_mem 3'd0
`define memOut_cp0 3'd1