`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:56:28 12/06/2025 
// Design Name: 
// Module Name:    bridge 
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
module bridge(
    input  	wire interrupt,							// 外部中断信号
    output 	wire [5:0] HWInt,							// 输入CPU的中断信号
	 
    input	wire [31:0] cpu_macroscopic_pc,		// 宏观pc
    output	wire [31:0] macroscopic_pc,
	 
    input	wire [31:0] cpu_i_inst_addr,			// IM 指令数据交换
	 output	wire [31:0] cpu_i_inst_rdata,
    output	wire [31:0] i_inst_addr,
    input	wire [31:0] i_inst_rdata,
	 
    input	wire [31:0] cpu_m_data_addr,    		// CPU 尝试访存地址，需要Bridge分配
    output	wire [31:0] cpu_m_data_rdata,   		//	读取数据
    input	wire [31:0] cpu_m_data_wdata,   		//	待写入数据
    input	wire [3 :0] cpu_m_data_byteen,  		//	字节使能信号
	 
    output	wire [31:0] m_data_addr,    			// DM 读写地址
    input	wire [31:0] m_data_rdata,   			// DM 读取数据
    output	wire [31:0] m_data_wdata,   			// DM 待写入数据
    output	wire [3 :0] m_data_byteen,  			// DM 字节使能信号
	 
	 output	wire [31:0] m_int_addr,     			// 中断发生器待写入地址
    output	wire [3 :0] m_int_byteen,   			// 中断发生器字节使能信号

    output	wire [31:2] tc0Addr,						// timer0读写地址
    output	wire 			tc0WE,						// timer0写入信号
    output	wire [31:0] tc0Din,						//	timer0写入数据
    input	wire [31:0] tc0Dout,						//	timer0读出数据	
    input	wire 			tc0IRQ,						// timer0中断信号	 
	 
    output	wire [31:2] tc1Addr,						// timer1读写地址
    output	wire 			tc1WE,						// timer1写入信号
    output	wire [31:0] tc1Din,						//	timer1写入数据
    input	wire [31:0] tc1Dout,						//	timer1读出数据	
    input 	wire			tc1IRQ						// timer1中断信号	 	 
    );
	 
	 wire dm  = (cpu_m_data_addr >= 32'h0000_0000 && cpu_m_data_addr <= 32'h0000_2FFF) ? 1 : 0;
	 wire tc0 = (cpu_m_data_addr >= 32'h0000_7F00 && cpu_m_data_addr <= 32'h0000_7F0B) ? 1 : 0;
	 wire tc1 = (cpu_m_data_addr >= 32'h0000_7F10 && cpu_m_data_addr <= 32'h0000_7F1B) ? 1 : 0;
	 wire Int = (cpu_m_data_addr >= 32'h0000_7F20 && cpu_m_data_addr <= 32'h0000_7F23) ? 1 : 0;
	 
	 //中断信号
	 assign HWInt = {3'd0,interrupt,tc1IRQ,tc0IRQ};
	 
	 //数据交换
	 assign macroscopic_pc = cpu_macroscopic_pc;
	 
	 assign i_inst_addr = cpu_i_inst_addr;
	 assign cpu_i_inst_rdata = i_inst_rdata;
	 
	 //读出数据
	 assign cpu_m_data_rdata = (dm)	?	m_data_rdata :
										(tc0)	?	tc0Dout		 :
										(tc1)	?	tc1Dout		 :
										0;
	 
	 //向DM传输数据
	 assign m_data_addr  	= (dm) ? cpu_m_data_addr 	: 0;
	 assign m_data_wdata 	= (dm) ? cpu_m_data_wdata	: 0;
	 assign m_data_byteen	= (dm) ? cpu_m_data_byteen : 0;

	 //向中断发生器传输数据
	 assign m_int_addr	= (Int) ? cpu_m_data_addr 		: 0;
	 assign m_int_byteen	= (Int) ? cpu_m_data_byteen 	: 0;
	 
	 //向timer0传输数据
	 assign tc0Addr	=	(tc0) ? cpu_m_data_addr[31:2] : 0;
	 assign tc0WE		=	(tc0) ? (&cpu_m_data_byteen)	: 0;		// 即使能为 1111 时才写入
	 assign tc0Din		=	(tc0) ? cpu_m_data_wdata		: 0;
	 
	 //向timer1传输数据
	 assign tc1Addr	=	(tc1) ? cpu_m_data_addr[31:2]	: 0;
	 assign tc1WE		=	(tc1) ? (&cpu_m_data_byteen)	: 0;		// 即使能为 1111 时才写入
	 assign tc1Din		=	(tc1) ? cpu_m_data_wdata		: 0;

endmodule
