// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Sun Mar  8 20:38:58 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/uni/2019-2020/thesis/cogitantium/dtpu/dtpu/dtpu.srcs/sources_1/bd/dtpu/ip/dtpu_axis_accelerator_ada_0_0/dtpu_axis_accelerator_ada_0_0_stub.v
// Design      : dtpu_axis_accelerator_ada_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "axis_accelerator_adapter,Vivado 2019.2.1" *)
module dtpu_axis_accelerator_ada_0_0(s_axi_aclk, s_axi_aresetn, s_axi_awaddr, 
  s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wstrb, s_axi_wvalid, s_axi_wready, 
  s_axi_bresp, s_axi_bvalid, s_axi_bready, s_axi_araddr, s_axi_arvalid, s_axi_arready, 
  s_axi_rdata, s_axi_rresp, s_axi_rvalid, s_axi_rready, s_axis_aclk, s_axis_aresetn, 
  s_axis_0_tvalid, s_axis_0_tready, s_axis_0_tdata, s_axis_0_tlast, s_axis_0_tid, 
  s_axis_0_tdest, s_axis_0_tuser, s_axis_1_tvalid, s_axis_1_tready, s_axis_1_tdata, 
  s_axis_1_tlast, s_axis_1_tid, s_axis_1_tdest, s_axis_1_tuser, s_axis_2_tvalid, 
  s_axis_2_tready, s_axis_2_tdata, s_axis_2_tlast, s_axis_2_tid, s_axis_2_tdest, 
  s_axis_2_tuser, ap_iarg_0_clk, ap_iarg_0_rst, ap_iarg_0_addr, ap_iarg_0_ce, ap_iarg_0_we, 
  ap_iarg_0_din, ap_iarg_0_dout, ap_iarg_1_clk, ap_iarg_1_rst, ap_iarg_1_addr, ap_iarg_1_ce, 
  ap_iarg_1_we, ap_iarg_1_din, ap_iarg_1_dout, ap_fifo_iarg_2_dout, ap_fifo_iarg_2_read, 
  ap_fifo_iarg_2_empty_n, m_axis_aclk, m_axis_aresetn, m_axis_0_tvalid, m_axis_0_tready, 
  m_axis_0_tdata, m_axis_0_tlast, m_axis_0_tid, m_axis_0_tdest, m_axis_0_tuser, 
  ap_fifo_oarg_0_din, ap_fifo_oarg_0_write, ap_fifo_oarg_0_full_n, aclk, aresetn, ap_start, 
  ap_ready, ap_done, ap_continue, ap_idle, interrupt)
/* synthesis syn_black_box black_box_pad_pin="s_axi_aclk,s_axi_aresetn,s_axi_awaddr[12:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[12:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,s_axis_aclk,s_axis_aresetn,s_axis_0_tvalid,s_axis_0_tready,s_axis_0_tdata[63:0],s_axis_0_tlast,s_axis_0_tid[3:0],s_axis_0_tdest[3:0],s_axis_0_tuser[7:0],s_axis_1_tvalid,s_axis_1_tready,s_axis_1_tdata[63:0],s_axis_1_tlast,s_axis_1_tid[3:0],s_axis_1_tdest[3:0],s_axis_1_tuser[7:0],s_axis_2_tvalid,s_axis_2_tready,s_axis_2_tdata[63:0],s_axis_2_tlast,s_axis_2_tid[3:0],s_axis_2_tdest[3:0],s_axis_2_tuser[7:0],ap_iarg_0_clk,ap_iarg_0_rst,ap_iarg_0_addr[31:0],ap_iarg_0_ce,ap_iarg_0_we[0:0],ap_iarg_0_din[7:0],ap_iarg_0_dout[7:0],ap_iarg_1_clk,ap_iarg_1_rst,ap_iarg_1_addr[31:0],ap_iarg_1_ce,ap_iarg_1_we[7:0],ap_iarg_1_din[63:0],ap_iarg_1_dout[63:0],ap_fifo_iarg_2_dout[63:0],ap_fifo_iarg_2_read,ap_fifo_iarg_2_empty_n,m_axis_aclk,m_axis_aresetn,m_axis_0_tvalid,m_axis_0_tready,m_axis_0_tdata[63:0],m_axis_0_tlast,m_axis_0_tid[3:0],m_axis_0_tdest[3:0],m_axis_0_tuser[7:0],ap_fifo_oarg_0_din[63:0],ap_fifo_oarg_0_write,ap_fifo_oarg_0_full_n,aclk,aresetn,ap_start,ap_ready,ap_done,ap_continue,ap_idle,interrupt" */;
  input s_axi_aclk;
  input s_axi_aresetn;
  input [12:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [12:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axis_aclk;
  input s_axis_aresetn;
  input s_axis_0_tvalid;
  output s_axis_0_tready;
  input [63:0]s_axis_0_tdata;
  input s_axis_0_tlast;
  input [3:0]s_axis_0_tid;
  input [3:0]s_axis_0_tdest;
  input [7:0]s_axis_0_tuser;
  input s_axis_1_tvalid;
  output s_axis_1_tready;
  input [63:0]s_axis_1_tdata;
  input s_axis_1_tlast;
  input [3:0]s_axis_1_tid;
  input [3:0]s_axis_1_tdest;
  input [7:0]s_axis_1_tuser;
  input s_axis_2_tvalid;
  output s_axis_2_tready;
  input [63:0]s_axis_2_tdata;
  input s_axis_2_tlast;
  input [3:0]s_axis_2_tid;
  input [3:0]s_axis_2_tdest;
  input [7:0]s_axis_2_tuser;
  input ap_iarg_0_clk;
  input ap_iarg_0_rst;
  input [31:0]ap_iarg_0_addr;
  input ap_iarg_0_ce;
  input [0:0]ap_iarg_0_we;
  input [7:0]ap_iarg_0_din;
  output [7:0]ap_iarg_0_dout;
  input ap_iarg_1_clk;
  input ap_iarg_1_rst;
  input [31:0]ap_iarg_1_addr;
  input ap_iarg_1_ce;
  input [7:0]ap_iarg_1_we;
  input [63:0]ap_iarg_1_din;
  output [63:0]ap_iarg_1_dout;
  output [63:0]ap_fifo_iarg_2_dout;
  input ap_fifo_iarg_2_read;
  output ap_fifo_iarg_2_empty_n;
  input m_axis_aclk;
  input m_axis_aresetn;
  output m_axis_0_tvalid;
  input m_axis_0_tready;
  output [63:0]m_axis_0_tdata;
  output m_axis_0_tlast;
  output [3:0]m_axis_0_tid;
  output [3:0]m_axis_0_tdest;
  output [7:0]m_axis_0_tuser;
  input [63:0]ap_fifo_oarg_0_din;
  input ap_fifo_oarg_0_write;
  output ap_fifo_oarg_0_full_n;
  input aclk;
  output aresetn;
  output ap_start;
  input ap_ready;
  input ap_done;
  output ap_continue;
  input ap_idle;
  output interrupt;
endmodule
