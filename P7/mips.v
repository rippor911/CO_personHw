`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:40 12/05/2025 
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
    input	wire clk,                    // 时钟信号
    input	wire reset,                  // 同步复位信号
    input	wire interrupt,              // 外部中断信号
    output	wire [31:0] macroscopic_pc, // 宏观 PC

    output	wire [31:0] i_inst_addr,    // IM 读取地址（取指 PC）
    input	wire [31:0] i_inst_rdata,   // IM 读取数据

    output	wire [31:0] m_data_addr,    // DM 读写地址
    input	wire [31:0] m_data_rdata,   // DM 读取数据
    output	wire [31:0] m_data_wdata,   // DM 待写入数据
    output	wire [3 :0] m_data_byteen,  // DM 字节使能信号

    output	wire [31:0] m_int_addr,     // 中断发生器待写入地址
    output	wire [3 :0] m_int_byteen,   // 中断发生器字节使能信号

    output	wire [31:0] m_inst_addr,    // M 级 PC

    output	wire w_grf_we,              // GRF 写使能信号
    output	wire [4 :0] w_grf_addr,     // GRF 待写入寄存器编号
    output	wire [31:0] w_grf_wdata,    // GRF 待写入数据

    output	wire [31:0] w_inst_addr     // W 级 PC
	);
	
	wire [5 :0] HWInt;
	wire [31:0] cpu_i_inst_rdata;
	wire [31:0] cpu_m_data_rdata;
	wire [31:0] cpu_i_inst_addr;
	wire [31:0] cpu_m_data_addr;
	wire [31:0] cpu_m_data_wdata;
	wire [3 :0] cpu_m_data_byteen;
	
	wire [31:2] tc0Addr;
	wire 			tc0WE;
	wire [31:0] tc0Din;
	wire [31:0] tc0Dout;
	wire			tc0IRQ;
	
	wire [31:2] tc1Addr;
	wire 			tc1WE;
	wire [31:0] tc1Din;
	wire [31:0] tc1Dout;
	wire			tc1IRQ;	
	
	cpu cpu(
    .clk            (clk),
    .reset          (reset),
    .HWInt          (HWInt),
    .i_inst_rdata   (cpu_i_inst_rdata),
    .m_data_rdata   (cpu_m_data_rdata),
    .i_inst_addr    (cpu_i_inst_addr),
    .m_data_addr    (cpu_m_data_addr),
    .m_data_wdata   (cpu_m_data_wdata),
    .m_data_byteen  (cpu_m_data_byteen),
    .m_inst_addr    (m_inst_addr),
    .w_grf_we       (w_grf_we),
    .w_grf_addr     (w_grf_addr),
    .w_grf_wdata    (w_grf_wdata),
    .w_inst_addr    (w_inst_addr)	
	);
	
	bridge bridge(
    .interrupt            (interrupt),
    .HWInt                (HWInt),
    .cpu_macroscopic_pc   (m_inst_addr),
    .macroscopic_pc       (macroscopic_pc),
    .cpu_i_inst_addr      (cpu_i_inst_addr),
    .cpu_i_inst_rdata     (cpu_i_inst_rdata),
    .i_inst_addr          (i_inst_addr),
    .i_inst_rdata         (i_inst_rdata),
    .cpu_m_data_addr      (cpu_m_data_addr),
    .cpu_m_data_rdata     (cpu_m_data_rdata),
    .cpu_m_data_wdata     (cpu_m_data_wdata),
    .cpu_m_data_byteen    (cpu_m_data_byteen),
    .m_data_addr          (m_data_addr),
    .m_data_rdata         (m_data_rdata),
    .m_data_wdata         (m_data_wdata),
    .m_data_byteen        (m_data_byteen),
    .m_int_addr           (m_int_addr),
    .m_int_byteen         (m_int_byteen),
    .tc0Addr              (tc0Addr),
    .tc0WE                (tc0WE),
    .tc0Din               (tc0Din),
    .tc0Dout              (tc0Dout),
    .tc0IRQ               (tc0IRQ),
    .tc1Addr              (tc1Addr),
    .tc1WE                (tc1WE),
    .tc1Din               (tc1Din),
    .tc1Dout              (tc1Dout),
    .tc1IRQ               (tc1IRQ)	
	);
	
	TC timer0(
    .clk   (clk),
    .reset (reset),
    .Addr  (tc0Addr),
    .WE    (tc0WE),
    .Din   (tc0Din),
    .Dout  (tc0Dout),
    .IRQ   (tc0IRQ)	
	);
	
	TC timer1(
    .clk   (clk),
    .reset (reset),
    .Addr  (tc1Addr),
    .WE    (tc1WE),
    .Din   (tc1Din),
    .Dout  (tc1Dout),
    .IRQ   (tc1IRQ)	
	);

endmodule
