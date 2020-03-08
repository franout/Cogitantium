// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Sat Mar  7 15:13:58 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/uni/2019-2020/thesis/cogitantium/dtpu/dtpu/dtpu.srcs/sources_1/ip/axi_epc_0/axi_epc_0_stub.v
// Design      : axi_epc_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "axi_epc,Vivado 2019.2.1" *)
module axi_epc_0(s_axi_aclk, s_axi_aresetn, s_axi_awaddr, 
  s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wstrb, s_axi_wvalid, s_axi_wready, 
  s_axi_bresp, s_axi_bvalid, s_axi_bready, s_axi_araddr, s_axi_arvalid, s_axi_arready, 
  s_axi_rdata, s_axi_rresp, s_axi_rvalid, s_axi_rready, prh_clk, prh_rst, prh_cs_n, prh_addr, 
  prh_ads, prh_be, prh_rnw, prh_rd_n, prh_wr_n, prh_burst, prh_rdy, prh_data_i, prh_data_o, 
  prh_data_t)
/* synthesis syn_black_box black_box_pad_pin="s_axi_aclk,s_axi_aresetn,s_axi_awaddr[31:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[31:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,prh_clk,prh_rst,prh_cs_n[0:0],prh_addr[0:31],prh_ads,prh_be[0:3],prh_rnw,prh_rd_n,prh_wr_n,prh_burst,prh_rdy[0:0],prh_data_i[0:31],prh_data_o[0:31],prh_data_t[0:31]" */;
  input s_axi_aclk;
  input s_axi_aresetn;
  input [31:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [31:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  input prh_clk;
  input prh_rst;
  output [0:0]prh_cs_n;
  output [0:31]prh_addr;
  output prh_ads;
  output [0:3]prh_be;
  output prh_rnw;
  output prh_rd_n;
  output prh_wr_n;
  output prh_burst;
  input [0:0]prh_rdy;
  input [0:31]prh_data_i;
  output [0:31]prh_data_o;
  output [0:31]prh_data_t;
endmodule
