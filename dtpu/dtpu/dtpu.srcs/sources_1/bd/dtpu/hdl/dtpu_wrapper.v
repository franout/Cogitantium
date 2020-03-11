//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
//Date        : Wed Mar 11 14:52:42 2020
//Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
//Command     : generate_target dtpu_wrapper.bd
//Design      : dtpu_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module dtpu_wrapper
   (M_AXIS_0_0_tdata,
    M_AXIS_0_0_tdest,
    M_AXIS_0_0_tid,
    M_AXIS_0_0_tlast,
    M_AXIS_0_0_tready,
    M_AXIS_0_0_tuser,
    M_AXIS_0_0_tvalid,
    S_AXIS_0_0_tdata,
    S_AXIS_0_0_tdest,
    S_AXIS_0_0_tid,
    S_AXIS_0_0_tlast,
    S_AXIS_0_0_tready,
    S_AXIS_0_0_tuser,
    S_AXIS_0_0_tvalid,
    S_AXIS_1_0_tdata,
    S_AXIS_1_0_tdest,
    S_AXIS_1_0_tid,
    S_AXIS_1_0_tlast,
    S_AXIS_1_0_tready,
    S_AXIS_1_0_tuser,
    S_AXIS_1_0_tvalid,
    S_AXIS_2_0_tdata,
    S_AXIS_2_0_tdest,
    S_AXIS_2_0_tid,
    S_AXIS_2_0_tlast,
    S_AXIS_2_0_tready,
    S_AXIS_2_0_tuser,
    S_AXIS_2_0_tvalid,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid,
    axi_aclk,
    axi_resetn,
    clk,
    enable,
    idle_signal,
    intr_dtpu,
    test_mode);
  output [63:0]M_AXIS_0_0_tdata;
  output [3:0]M_AXIS_0_0_tdest;
  output [3:0]M_AXIS_0_0_tid;
  output M_AXIS_0_0_tlast;
  input M_AXIS_0_0_tready;
  output [7:0]M_AXIS_0_0_tuser;
  output M_AXIS_0_0_tvalid;
  input [63:0]S_AXIS_0_0_tdata;
  input [3:0]S_AXIS_0_0_tdest;
  input [3:0]S_AXIS_0_0_tid;
  input S_AXIS_0_0_tlast;
  output S_AXIS_0_0_tready;
  input [7:0]S_AXIS_0_0_tuser;
  input S_AXIS_0_0_tvalid;
  input [63:0]S_AXIS_1_0_tdata;
  input [3:0]S_AXIS_1_0_tdest;
  input [3:0]S_AXIS_1_0_tid;
  input S_AXIS_1_0_tlast;
  output S_AXIS_1_0_tready;
  input [7:0]S_AXIS_1_0_tuser;
  input S_AXIS_1_0_tvalid;
  input [63:0]S_AXIS_2_0_tdata;
  input [3:0]S_AXIS_2_0_tdest;
  input [3:0]S_AXIS_2_0_tid;
  input S_AXIS_2_0_tlast;
  output S_AXIS_2_0_tready;
  input [7:0]S_AXIS_2_0_tuser;
  input S_AXIS_2_0_tvalid;
  input [12:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [12:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;
  input axi_aclk;
  input axi_resetn;
  input clk;
  input enable;
  output idle_signal;
  output intr_dtpu;
  input test_mode;

  wire [63:0]M_AXIS_0_0_tdata;
  wire [3:0]M_AXIS_0_0_tdest;
  wire [3:0]M_AXIS_0_0_tid;
  wire M_AXIS_0_0_tlast;
  wire M_AXIS_0_0_tready;
  wire [7:0]M_AXIS_0_0_tuser;
  wire M_AXIS_0_0_tvalid;
  wire [63:0]S_AXIS_0_0_tdata;
  wire [3:0]S_AXIS_0_0_tdest;
  wire [3:0]S_AXIS_0_0_tid;
  wire S_AXIS_0_0_tlast;
  wire S_AXIS_0_0_tready;
  wire [7:0]S_AXIS_0_0_tuser;
  wire S_AXIS_0_0_tvalid;
  wire [63:0]S_AXIS_1_0_tdata;
  wire [3:0]S_AXIS_1_0_tdest;
  wire [3:0]S_AXIS_1_0_tid;
  wire S_AXIS_1_0_tlast;
  wire S_AXIS_1_0_tready;
  wire [7:0]S_AXIS_1_0_tuser;
  wire S_AXIS_1_0_tvalid;
  wire [63:0]S_AXIS_2_0_tdata;
  wire [3:0]S_AXIS_2_0_tdest;
  wire [3:0]S_AXIS_2_0_tid;
  wire S_AXIS_2_0_tlast;
  wire S_AXIS_2_0_tready;
  wire [7:0]S_AXIS_2_0_tuser;
  wire S_AXIS_2_0_tvalid;
  wire [12:0]S_AXI_araddr;
  wire S_AXI_arready;
  wire S_AXI_arvalid;
  wire [12:0]S_AXI_awaddr;
  wire S_AXI_awready;
  wire S_AXI_awvalid;
  wire S_AXI_bready;
  wire [1:0]S_AXI_bresp;
  wire S_AXI_bvalid;
  wire [31:0]S_AXI_rdata;
  wire S_AXI_rready;
  wire [1:0]S_AXI_rresp;
  wire S_AXI_rvalid;
  wire [31:0]S_AXI_wdata;
  wire S_AXI_wready;
  wire [3:0]S_AXI_wstrb;
  wire S_AXI_wvalid;
  wire axi_aclk;
  wire axi_resetn;
  wire clk;
  wire enable;
  wire idle_signal;
  wire intr_dtpu;
  wire test_mode;

  dtpu dtpu_i
       (.M_AXIS_0_0_tdata(M_AXIS_0_0_tdata),
        .M_AXIS_0_0_tdest(M_AXIS_0_0_tdest),
        .M_AXIS_0_0_tid(M_AXIS_0_0_tid),
        .M_AXIS_0_0_tlast(M_AXIS_0_0_tlast),
        .M_AXIS_0_0_tready(M_AXIS_0_0_tready),
        .M_AXIS_0_0_tuser(M_AXIS_0_0_tuser),
        .M_AXIS_0_0_tvalid(M_AXIS_0_0_tvalid),
        .S_AXIS_0_0_tdata(S_AXIS_0_0_tdata),
        .S_AXIS_0_0_tdest(S_AXIS_0_0_tdest),
        .S_AXIS_0_0_tid(S_AXIS_0_0_tid),
        .S_AXIS_0_0_tlast(S_AXIS_0_0_tlast),
        .S_AXIS_0_0_tready(S_AXIS_0_0_tready),
        .S_AXIS_0_0_tuser(S_AXIS_0_0_tuser),
        .S_AXIS_0_0_tvalid(S_AXIS_0_0_tvalid),
        .S_AXIS_1_0_tdata(S_AXIS_1_0_tdata),
        .S_AXIS_1_0_tdest(S_AXIS_1_0_tdest),
        .S_AXIS_1_0_tid(S_AXIS_1_0_tid),
        .S_AXIS_1_0_tlast(S_AXIS_1_0_tlast),
        .S_AXIS_1_0_tready(S_AXIS_1_0_tready),
        .S_AXIS_1_0_tuser(S_AXIS_1_0_tuser),
        .S_AXIS_1_0_tvalid(S_AXIS_1_0_tvalid),
        .S_AXIS_2_0_tdata(S_AXIS_2_0_tdata),
        .S_AXIS_2_0_tdest(S_AXIS_2_0_tdest),
        .S_AXIS_2_0_tid(S_AXIS_2_0_tid),
        .S_AXIS_2_0_tlast(S_AXIS_2_0_tlast),
        .S_AXIS_2_0_tready(S_AXIS_2_0_tready),
        .S_AXIS_2_0_tuser(S_AXIS_2_0_tuser),
        .S_AXIS_2_0_tvalid(S_AXIS_2_0_tvalid),
        .S_AXI_araddr(S_AXI_araddr),
        .S_AXI_arready(S_AXI_arready),
        .S_AXI_arvalid(S_AXI_arvalid),
        .S_AXI_awaddr(S_AXI_awaddr),
        .S_AXI_awready(S_AXI_awready),
        .S_AXI_awvalid(S_AXI_awvalid),
        .S_AXI_bready(S_AXI_bready),
        .S_AXI_bresp(S_AXI_bresp),
        .S_AXI_bvalid(S_AXI_bvalid),
        .S_AXI_rdata(S_AXI_rdata),
        .S_AXI_rready(S_AXI_rready),
        .S_AXI_rresp(S_AXI_rresp),
        .S_AXI_rvalid(S_AXI_rvalid),
        .S_AXI_wdata(S_AXI_wdata),
        .S_AXI_wready(S_AXI_wready),
        .S_AXI_wstrb(S_AXI_wstrb),
        .S_AXI_wvalid(S_AXI_wvalid),
        .axi_aclk(axi_aclk),
        .axi_resetn(axi_resetn),
        .clk(clk),
        .enable(enable),
        .idle_signal(idle_signal),
        .intr_dtpu(intr_dtpu),
        .test_mode(test_mode));
endmodule
