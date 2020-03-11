//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
//Date        : Wed Mar 11 16:09:21 2020
//Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
//Command     : generate_target pynqz2.bd
//Design      : pynqz2
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module m00_couplers_imp_13FRLR6
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
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
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
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

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire m00_couplers_to_m00_couplers_ARREADY;
  wire m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire m00_couplers_to_m00_couplers_AWREADY;
  wire m00_couplers_to_m00_couplers_AWVALID;
  wire m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready;
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready;
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready;
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready;
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid;
endmodule

module m00_couplers_imp_1YRW0US
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wid,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awuser,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [1:0]M_AXI_arid;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [1:0]M_AXI_awid;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [5:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [63:0]M_AXI_rdata;
  input [5:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [63:0]M_AXI_wdata;
  output [1:0]M_AXI_wid;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [7:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [1:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [1:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input [3:0]S_AXI_awuser;
  input S_AXI_awvalid;
  output [1:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [63:0]S_AXI_rdata;
  output [1:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [63:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [7:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_m00_couplers_ARADDR;
  wire [1:0]auto_pc_to_m00_couplers_ARBURST;
  wire [3:0]auto_pc_to_m00_couplers_ARCACHE;
  wire [1:0]auto_pc_to_m00_couplers_ARID;
  wire [3:0]auto_pc_to_m00_couplers_ARLEN;
  wire [1:0]auto_pc_to_m00_couplers_ARLOCK;
  wire [2:0]auto_pc_to_m00_couplers_ARPROT;
  wire [3:0]auto_pc_to_m00_couplers_ARQOS;
  wire auto_pc_to_m00_couplers_ARREADY;
  wire [2:0]auto_pc_to_m00_couplers_ARSIZE;
  wire auto_pc_to_m00_couplers_ARVALID;
  wire [31:0]auto_pc_to_m00_couplers_AWADDR;
  wire [1:0]auto_pc_to_m00_couplers_AWBURST;
  wire [3:0]auto_pc_to_m00_couplers_AWCACHE;
  wire [1:0]auto_pc_to_m00_couplers_AWID;
  wire [3:0]auto_pc_to_m00_couplers_AWLEN;
  wire [1:0]auto_pc_to_m00_couplers_AWLOCK;
  wire [2:0]auto_pc_to_m00_couplers_AWPROT;
  wire [3:0]auto_pc_to_m00_couplers_AWQOS;
  wire auto_pc_to_m00_couplers_AWREADY;
  wire [2:0]auto_pc_to_m00_couplers_AWSIZE;
  wire auto_pc_to_m00_couplers_AWVALID;
  wire [5:0]auto_pc_to_m00_couplers_BID;
  wire auto_pc_to_m00_couplers_BREADY;
  wire [1:0]auto_pc_to_m00_couplers_BRESP;
  wire auto_pc_to_m00_couplers_BVALID;
  wire [63:0]auto_pc_to_m00_couplers_RDATA;
  wire [5:0]auto_pc_to_m00_couplers_RID;
  wire auto_pc_to_m00_couplers_RLAST;
  wire auto_pc_to_m00_couplers_RREADY;
  wire [1:0]auto_pc_to_m00_couplers_RRESP;
  wire auto_pc_to_m00_couplers_RVALID;
  wire [63:0]auto_pc_to_m00_couplers_WDATA;
  wire [1:0]auto_pc_to_m00_couplers_WID;
  wire auto_pc_to_m00_couplers_WLAST;
  wire auto_pc_to_m00_couplers_WREADY;
  wire [7:0]auto_pc_to_m00_couplers_WSTRB;
  wire auto_pc_to_m00_couplers_WVALID;
  wire [31:0]m00_couplers_to_auto_pc_ARADDR;
  wire [1:0]m00_couplers_to_auto_pc_ARBURST;
  wire [3:0]m00_couplers_to_auto_pc_ARCACHE;
  wire [1:0]m00_couplers_to_auto_pc_ARID;
  wire [7:0]m00_couplers_to_auto_pc_ARLEN;
  wire [0:0]m00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]m00_couplers_to_auto_pc_ARPROT;
  wire [3:0]m00_couplers_to_auto_pc_ARQOS;
  wire m00_couplers_to_auto_pc_ARREADY;
  wire [3:0]m00_couplers_to_auto_pc_ARREGION;
  wire [2:0]m00_couplers_to_auto_pc_ARSIZE;
  wire m00_couplers_to_auto_pc_ARVALID;
  wire [31:0]m00_couplers_to_auto_pc_AWADDR;
  wire [1:0]m00_couplers_to_auto_pc_AWBURST;
  wire [3:0]m00_couplers_to_auto_pc_AWCACHE;
  wire [1:0]m00_couplers_to_auto_pc_AWID;
  wire [7:0]m00_couplers_to_auto_pc_AWLEN;
  wire [0:0]m00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]m00_couplers_to_auto_pc_AWPROT;
  wire [3:0]m00_couplers_to_auto_pc_AWQOS;
  wire m00_couplers_to_auto_pc_AWREADY;
  wire [3:0]m00_couplers_to_auto_pc_AWREGION;
  wire [2:0]m00_couplers_to_auto_pc_AWSIZE;
  wire [3:0]m00_couplers_to_auto_pc_AWUSER;
  wire m00_couplers_to_auto_pc_AWVALID;
  wire [1:0]m00_couplers_to_auto_pc_BID;
  wire m00_couplers_to_auto_pc_BREADY;
  wire [1:0]m00_couplers_to_auto_pc_BRESP;
  wire m00_couplers_to_auto_pc_BVALID;
  wire [63:0]m00_couplers_to_auto_pc_RDATA;
  wire [1:0]m00_couplers_to_auto_pc_RID;
  wire m00_couplers_to_auto_pc_RLAST;
  wire m00_couplers_to_auto_pc_RREADY;
  wire [1:0]m00_couplers_to_auto_pc_RRESP;
  wire m00_couplers_to_auto_pc_RVALID;
  wire [63:0]m00_couplers_to_auto_pc_WDATA;
  wire m00_couplers_to_auto_pc_WLAST;
  wire m00_couplers_to_auto_pc_WREADY;
  wire [7:0]m00_couplers_to_auto_pc_WSTRB;
  wire m00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_m00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_m00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_m00_couplers_ARCACHE;
  assign M_AXI_arid[1:0] = auto_pc_to_m00_couplers_ARID;
  assign M_AXI_arlen[3:0] = auto_pc_to_m00_couplers_ARLEN;
  assign M_AXI_arlock[1:0] = auto_pc_to_m00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_m00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_m00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_m00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_m00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_pc_to_m00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_pc_to_m00_couplers_AWCACHE;
  assign M_AXI_awid[1:0] = auto_pc_to_m00_couplers_AWID;
  assign M_AXI_awlen[3:0] = auto_pc_to_m00_couplers_AWLEN;
  assign M_AXI_awlock[1:0] = auto_pc_to_m00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_pc_to_m00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_pc_to_m00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_pc_to_m00_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_pc_to_m00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m00_couplers_RREADY;
  assign M_AXI_wdata[63:0] = auto_pc_to_m00_couplers_WDATA;
  assign M_AXI_wid[1:0] = auto_pc_to_m00_couplers_WID;
  assign M_AXI_wlast = auto_pc_to_m00_couplers_WLAST;
  assign M_AXI_wstrb[7:0] = auto_pc_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = m00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[1:0] = m00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = m00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[63:0] = m00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[1:0] = m00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = m00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = m00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = m00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_m00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m00_couplers_BID = M_AXI_bid[5:0];
  assign auto_pc_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m00_couplers_RDATA = M_AXI_rdata[63:0];
  assign auto_pc_to_m00_couplers_RID = M_AXI_rid[5:0];
  assign auto_pc_to_m00_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign m00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign m00_couplers_to_auto_pc_ARID = S_AXI_arid[1:0];
  assign m00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign m00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign m00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign m00_couplers_to_auto_pc_ARREGION = S_AXI_arregion[3:0];
  assign m00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign m00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign m00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign m00_couplers_to_auto_pc_AWID = S_AXI_awid[1:0];
  assign m00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign m00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign m00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign m00_couplers_to_auto_pc_AWREGION = S_AXI_awregion[3:0];
  assign m00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign m00_couplers_to_auto_pc_AWUSER = S_AXI_awuser[3:0];
  assign m00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign m00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign m00_couplers_to_auto_pc_WDATA = S_AXI_wdata[63:0];
  assign m00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign m00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[7:0];
  assign m00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  pynqz2_auto_pc_1 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m00_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_m00_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_m00_couplers_ARCACHE),
        .m_axi_arid(auto_pc_to_m00_couplers_ARID),
        .m_axi_arlen(auto_pc_to_m00_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_m00_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_m00_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_m00_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_m00_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_m00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m00_couplers_AWADDR),
        .m_axi_awburst(auto_pc_to_m00_couplers_AWBURST),
        .m_axi_awcache(auto_pc_to_m00_couplers_AWCACHE),
        .m_axi_awid(auto_pc_to_m00_couplers_AWID),
        .m_axi_awlen(auto_pc_to_m00_couplers_AWLEN),
        .m_axi_awlock(auto_pc_to_m00_couplers_AWLOCK),
        .m_axi_awprot(auto_pc_to_m00_couplers_AWPROT),
        .m_axi_awqos(auto_pc_to_m00_couplers_AWQOS),
        .m_axi_awready(auto_pc_to_m00_couplers_AWREADY),
        .m_axi_awsize(auto_pc_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(auto_pc_to_m00_couplers_AWVALID),
        .m_axi_bid(auto_pc_to_m00_couplers_BID[1:0]),
        .m_axi_bready(auto_pc_to_m00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m00_couplers_RDATA),
        .m_axi_rid(auto_pc_to_m00_couplers_RID[1:0]),
        .m_axi_rlast(auto_pc_to_m00_couplers_RLAST),
        .m_axi_rready(auto_pc_to_m00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m00_couplers_WDATA),
        .m_axi_wid(auto_pc_to_m00_couplers_WID),
        .m_axi_wlast(auto_pc_to_m00_couplers_WLAST),
        .m_axi_wready(auto_pc_to_m00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m00_couplers_WVALID),
        .s_axi_araddr(m00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(m00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(m00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(m00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(m00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(m00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(m00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(m00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(m00_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion(m00_couplers_to_auto_pc_ARREGION),
        .s_axi_arsize(m00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(m00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(m00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(m00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(m00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(m00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(m00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(m00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(m00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(m00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(m00_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion(m00_couplers_to_auto_pc_AWREGION),
        .s_axi_awsize(m00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awuser(m00_couplers_to_auto_pc_AWUSER),
        .s_axi_awvalid(m00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(m00_couplers_to_auto_pc_BID),
        .s_axi_bready(m00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(m00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(m00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(m00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(m00_couplers_to_auto_pc_RID),
        .s_axi_rlast(m00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(m00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(m00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(m00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(m00_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(m00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(m00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(m00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(m00_couplers_to_auto_pc_WVALID));
endmodule

module m00_couplers_imp_4JMH9A
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tdest,
    M_AXIS_tid,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tuser,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tdest,
    S_AXIS_tid,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tuser,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [63:0]M_AXIS_tdata;
  output [3:0]M_AXIS_tdest;
  output [3:0]M_AXIS_tid;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output [31:0]M_AXIS_tuser;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [31:0]S_AXIS_tdata;
  input [3:0]S_AXIS_tdest;
  input [7:0]S_AXIS_tid;
  input [3:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input [15:0]S_AXIS_tuser;
  input S_AXIS_tvalid;

  wire S_AXIS_ACLK_1;
  wire S_AXIS_ARESETN_1;
  wire [63:0]auto_ss_k_to_auto_ss_slidr_TDATA;
  wire [3:0]auto_ss_k_to_auto_ss_slidr_TDEST;
  wire [7:0]auto_ss_k_to_auto_ss_slidr_TID;
  wire auto_ss_k_to_auto_ss_slidr_TLAST;
  wire auto_ss_k_to_auto_ss_slidr_TREADY;
  wire [31:0]auto_ss_k_to_auto_ss_slidr_TUSER;
  wire auto_ss_k_to_auto_ss_slidr_TVALID;
  wire [63:0]auto_ss_slidr_to_m00_couplers_TDATA;
  wire [3:0]auto_ss_slidr_to_m00_couplers_TDEST;
  wire [3:0]auto_ss_slidr_to_m00_couplers_TID;
  wire auto_ss_slidr_to_m00_couplers_TLAST;
  wire auto_ss_slidr_to_m00_couplers_TREADY;
  wire [31:0]auto_ss_slidr_to_m00_couplers_TUSER;
  wire auto_ss_slidr_to_m00_couplers_TVALID;
  wire [63:0]auto_us_to_auto_ss_k_TDATA;
  wire [3:0]auto_us_to_auto_ss_k_TDEST;
  wire [7:0]auto_us_to_auto_ss_k_TID;
  wire [7:0]auto_us_to_auto_ss_k_TKEEP;
  wire auto_us_to_auto_ss_k_TLAST;
  wire auto_us_to_auto_ss_k_TREADY;
  wire [31:0]auto_us_to_auto_ss_k_TUSER;
  wire auto_us_to_auto_ss_k_TVALID;
  wire [31:0]m00_couplers_to_auto_us_TDATA;
  wire [3:0]m00_couplers_to_auto_us_TDEST;
  wire [7:0]m00_couplers_to_auto_us_TID;
  wire [3:0]m00_couplers_to_auto_us_TKEEP;
  wire m00_couplers_to_auto_us_TLAST;
  wire m00_couplers_to_auto_us_TREADY;
  wire [15:0]m00_couplers_to_auto_us_TUSER;
  wire m00_couplers_to_auto_us_TVALID;

  assign M_AXIS_tdata[63:0] = auto_ss_slidr_to_m00_couplers_TDATA;
  assign M_AXIS_tdest[3:0] = auto_ss_slidr_to_m00_couplers_TDEST;
  assign M_AXIS_tid[3:0] = auto_ss_slidr_to_m00_couplers_TID;
  assign M_AXIS_tlast = auto_ss_slidr_to_m00_couplers_TLAST;
  assign M_AXIS_tuser[31:0] = auto_ss_slidr_to_m00_couplers_TUSER;
  assign M_AXIS_tvalid = auto_ss_slidr_to_m00_couplers_TVALID;
  assign S_AXIS_ACLK_1 = S_AXIS_ACLK;
  assign S_AXIS_ARESETN_1 = S_AXIS_ARESETN;
  assign S_AXIS_tready = m00_couplers_to_auto_us_TREADY;
  assign auto_ss_slidr_to_m00_couplers_TREADY = M_AXIS_tready;
  assign m00_couplers_to_auto_us_TDATA = S_AXIS_tdata[31:0];
  assign m00_couplers_to_auto_us_TDEST = S_AXIS_tdest[3:0];
  assign m00_couplers_to_auto_us_TID = S_AXIS_tid[7:0];
  assign m00_couplers_to_auto_us_TKEEP = S_AXIS_tkeep[3:0];
  assign m00_couplers_to_auto_us_TLAST = S_AXIS_tlast;
  assign m00_couplers_to_auto_us_TUSER = S_AXIS_tuser[15:0];
  assign m00_couplers_to_auto_us_TVALID = S_AXIS_tvalid;
  pynqz2_auto_ss_k_0 auto_ss_k
       (.aclk(S_AXIS_ACLK_1),
        .aresetn(S_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_k_to_auto_ss_slidr_TDATA),
        .m_axis_tdest(auto_ss_k_to_auto_ss_slidr_TDEST),
        .m_axis_tid(auto_ss_k_to_auto_ss_slidr_TID),
        .m_axis_tlast(auto_ss_k_to_auto_ss_slidr_TLAST),
        .m_axis_tready(auto_ss_k_to_auto_ss_slidr_TREADY),
        .m_axis_tuser(auto_ss_k_to_auto_ss_slidr_TUSER),
        .m_axis_tvalid(auto_ss_k_to_auto_ss_slidr_TVALID),
        .s_axis_tdata(auto_us_to_auto_ss_k_TDATA),
        .s_axis_tdest(auto_us_to_auto_ss_k_TDEST),
        .s_axis_tid(auto_us_to_auto_ss_k_TID),
        .s_axis_tkeep(auto_us_to_auto_ss_k_TKEEP),
        .s_axis_tlast(auto_us_to_auto_ss_k_TLAST),
        .s_axis_tready(auto_us_to_auto_ss_k_TREADY),
        .s_axis_tuser(auto_us_to_auto_ss_k_TUSER),
        .s_axis_tvalid(auto_us_to_auto_ss_k_TVALID));
  pynqz2_auto_ss_slidr_0 auto_ss_slidr
       (.aclk(S_AXIS_ACLK_1),
        .aresetn(S_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_slidr_to_m00_couplers_TDATA),
        .m_axis_tdest(auto_ss_slidr_to_m00_couplers_TDEST),
        .m_axis_tid(auto_ss_slidr_to_m00_couplers_TID),
        .m_axis_tlast(auto_ss_slidr_to_m00_couplers_TLAST),
        .m_axis_tready(auto_ss_slidr_to_m00_couplers_TREADY),
        .m_axis_tuser(auto_ss_slidr_to_m00_couplers_TUSER),
        .m_axis_tvalid(auto_ss_slidr_to_m00_couplers_TVALID),
        .s_axis_tdata(auto_ss_k_to_auto_ss_slidr_TDATA),
        .s_axis_tdest(auto_ss_k_to_auto_ss_slidr_TDEST),
        .s_axis_tid(auto_ss_k_to_auto_ss_slidr_TID),
        .s_axis_tlast(auto_ss_k_to_auto_ss_slidr_TLAST),
        .s_axis_tready(auto_ss_k_to_auto_ss_slidr_TREADY),
        .s_axis_tuser(auto_ss_k_to_auto_ss_slidr_TUSER),
        .s_axis_tvalid(auto_ss_k_to_auto_ss_slidr_TVALID));
  pynqz2_auto_us_2 auto_us
       (.aclk(S_AXIS_ACLK_1),
        .aresetn(S_AXIS_ARESETN_1),
        .m_axis_tdata(auto_us_to_auto_ss_k_TDATA),
        .m_axis_tdest(auto_us_to_auto_ss_k_TDEST),
        .m_axis_tid(auto_us_to_auto_ss_k_TID),
        .m_axis_tkeep(auto_us_to_auto_ss_k_TKEEP),
        .m_axis_tlast(auto_us_to_auto_ss_k_TLAST),
        .m_axis_tready(auto_us_to_auto_ss_k_TREADY),
        .m_axis_tuser(auto_us_to_auto_ss_k_TUSER),
        .m_axis_tvalid(auto_us_to_auto_ss_k_TVALID),
        .s_axis_tdata(m00_couplers_to_auto_us_TDATA),
        .s_axis_tdest(m00_couplers_to_auto_us_TDEST),
        .s_axis_tid(m00_couplers_to_auto_us_TID),
        .s_axis_tkeep(m00_couplers_to_auto_us_TKEEP),
        .s_axis_tlast(m00_couplers_to_auto_us_TLAST),
        .s_axis_tready(m00_couplers_to_auto_us_TREADY),
        .s_axis_tuser(m00_couplers_to_auto_us_TUSER),
        .s_axis_tvalid(m00_couplers_to_auto_us_TVALID));
endmodule

module m01_couplers_imp_1GQ7LFZ
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tdest,
    M_AXIS_tid,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tuser,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tdest,
    S_AXIS_tid,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tuser,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [63:0]M_AXIS_tdata;
  output [3:0]M_AXIS_tdest;
  output [3:0]M_AXIS_tid;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output [31:0]M_AXIS_tuser;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [31:0]S_AXIS_tdata;
  input [3:0]S_AXIS_tdest;
  input [7:0]S_AXIS_tid;
  input [3:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input [15:0]S_AXIS_tuser;
  input S_AXIS_tvalid;

  wire S_AXIS_ACLK_1;
  wire S_AXIS_ARESETN_1;
  wire [63:0]auto_ss_k_to_auto_ss_slidr_TDATA;
  wire [3:0]auto_ss_k_to_auto_ss_slidr_TDEST;
  wire [7:0]auto_ss_k_to_auto_ss_slidr_TID;
  wire auto_ss_k_to_auto_ss_slidr_TLAST;
  wire auto_ss_k_to_auto_ss_slidr_TREADY;
  wire [31:0]auto_ss_k_to_auto_ss_slidr_TUSER;
  wire auto_ss_k_to_auto_ss_slidr_TVALID;
  wire [63:0]auto_ss_slidr_to_m01_couplers_TDATA;
  wire [3:0]auto_ss_slidr_to_m01_couplers_TDEST;
  wire [3:0]auto_ss_slidr_to_m01_couplers_TID;
  wire auto_ss_slidr_to_m01_couplers_TLAST;
  wire auto_ss_slidr_to_m01_couplers_TREADY;
  wire [31:0]auto_ss_slidr_to_m01_couplers_TUSER;
  wire auto_ss_slidr_to_m01_couplers_TVALID;
  wire [63:0]auto_us_to_auto_ss_k_TDATA;
  wire [3:0]auto_us_to_auto_ss_k_TDEST;
  wire [7:0]auto_us_to_auto_ss_k_TID;
  wire [7:0]auto_us_to_auto_ss_k_TKEEP;
  wire auto_us_to_auto_ss_k_TLAST;
  wire auto_us_to_auto_ss_k_TREADY;
  wire [31:0]auto_us_to_auto_ss_k_TUSER;
  wire auto_us_to_auto_ss_k_TVALID;
  wire [31:0]m01_couplers_to_auto_us_TDATA;
  wire [3:0]m01_couplers_to_auto_us_TDEST;
  wire [7:0]m01_couplers_to_auto_us_TID;
  wire [3:0]m01_couplers_to_auto_us_TKEEP;
  wire m01_couplers_to_auto_us_TLAST;
  wire m01_couplers_to_auto_us_TREADY;
  wire [15:0]m01_couplers_to_auto_us_TUSER;
  wire m01_couplers_to_auto_us_TVALID;

  assign M_AXIS_tdata[63:0] = auto_ss_slidr_to_m01_couplers_TDATA;
  assign M_AXIS_tdest[3:0] = auto_ss_slidr_to_m01_couplers_TDEST;
  assign M_AXIS_tid[3:0] = auto_ss_slidr_to_m01_couplers_TID;
  assign M_AXIS_tlast = auto_ss_slidr_to_m01_couplers_TLAST;
  assign M_AXIS_tuser[31:0] = auto_ss_slidr_to_m01_couplers_TUSER;
  assign M_AXIS_tvalid = auto_ss_slidr_to_m01_couplers_TVALID;
  assign S_AXIS_ACLK_1 = S_AXIS_ACLK;
  assign S_AXIS_ARESETN_1 = S_AXIS_ARESETN;
  assign S_AXIS_tready = m01_couplers_to_auto_us_TREADY;
  assign auto_ss_slidr_to_m01_couplers_TREADY = M_AXIS_tready;
  assign m01_couplers_to_auto_us_TDATA = S_AXIS_tdata[31:0];
  assign m01_couplers_to_auto_us_TDEST = S_AXIS_tdest[3:0];
  assign m01_couplers_to_auto_us_TID = S_AXIS_tid[7:0];
  assign m01_couplers_to_auto_us_TKEEP = S_AXIS_tkeep[3:0];
  assign m01_couplers_to_auto_us_TLAST = S_AXIS_tlast;
  assign m01_couplers_to_auto_us_TUSER = S_AXIS_tuser[15:0];
  assign m01_couplers_to_auto_us_TVALID = S_AXIS_tvalid;
  pynqz2_auto_ss_k_1 auto_ss_k
       (.aclk(S_AXIS_ACLK_1),
        .aresetn(S_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_k_to_auto_ss_slidr_TDATA),
        .m_axis_tdest(auto_ss_k_to_auto_ss_slidr_TDEST),
        .m_axis_tid(auto_ss_k_to_auto_ss_slidr_TID),
        .m_axis_tlast(auto_ss_k_to_auto_ss_slidr_TLAST),
        .m_axis_tready(auto_ss_k_to_auto_ss_slidr_TREADY),
        .m_axis_tuser(auto_ss_k_to_auto_ss_slidr_TUSER),
        .m_axis_tvalid(auto_ss_k_to_auto_ss_slidr_TVALID),
        .s_axis_tdata(auto_us_to_auto_ss_k_TDATA),
        .s_axis_tdest(auto_us_to_auto_ss_k_TDEST),
        .s_axis_tid(auto_us_to_auto_ss_k_TID),
        .s_axis_tkeep(auto_us_to_auto_ss_k_TKEEP),
        .s_axis_tlast(auto_us_to_auto_ss_k_TLAST),
        .s_axis_tready(auto_us_to_auto_ss_k_TREADY),
        .s_axis_tuser(auto_us_to_auto_ss_k_TUSER),
        .s_axis_tvalid(auto_us_to_auto_ss_k_TVALID));
  pynqz2_auto_ss_slidr_1 auto_ss_slidr
       (.aclk(S_AXIS_ACLK_1),
        .aresetn(S_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_slidr_to_m01_couplers_TDATA),
        .m_axis_tdest(auto_ss_slidr_to_m01_couplers_TDEST),
        .m_axis_tid(auto_ss_slidr_to_m01_couplers_TID),
        .m_axis_tlast(auto_ss_slidr_to_m01_couplers_TLAST),
        .m_axis_tready(auto_ss_slidr_to_m01_couplers_TREADY),
        .m_axis_tuser(auto_ss_slidr_to_m01_couplers_TUSER),
        .m_axis_tvalid(auto_ss_slidr_to_m01_couplers_TVALID),
        .s_axis_tdata(auto_ss_k_to_auto_ss_slidr_TDATA),
        .s_axis_tdest(auto_ss_k_to_auto_ss_slidr_TDEST),
        .s_axis_tid(auto_ss_k_to_auto_ss_slidr_TID),
        .s_axis_tlast(auto_ss_k_to_auto_ss_slidr_TLAST),
        .s_axis_tready(auto_ss_k_to_auto_ss_slidr_TREADY),
        .s_axis_tuser(auto_ss_k_to_auto_ss_slidr_TUSER),
        .s_axis_tvalid(auto_ss_k_to_auto_ss_slidr_TVALID));
  pynqz2_auto_us_3 auto_us
       (.aclk(S_AXIS_ACLK_1),
        .aresetn(S_AXIS_ARESETN_1),
        .m_axis_tdata(auto_us_to_auto_ss_k_TDATA),
        .m_axis_tdest(auto_us_to_auto_ss_k_TDEST),
        .m_axis_tid(auto_us_to_auto_ss_k_TID),
        .m_axis_tkeep(auto_us_to_auto_ss_k_TKEEP),
        .m_axis_tlast(auto_us_to_auto_ss_k_TLAST),
        .m_axis_tready(auto_us_to_auto_ss_k_TREADY),
        .m_axis_tuser(auto_us_to_auto_ss_k_TUSER),
        .m_axis_tvalid(auto_us_to_auto_ss_k_TVALID),
        .s_axis_tdata(m01_couplers_to_auto_us_TDATA),
        .s_axis_tdest(m01_couplers_to_auto_us_TDEST),
        .s_axis_tid(m01_couplers_to_auto_us_TID),
        .s_axis_tkeep(m01_couplers_to_auto_us_TKEEP),
        .s_axis_tlast(m01_couplers_to_auto_us_TLAST),
        .s_axis_tready(m01_couplers_to_auto_us_TREADY),
        .s_axis_tuser(m01_couplers_to_auto_us_TUSER),
        .s_axis_tvalid(m01_couplers_to_auto_us_TVALID));
endmodule

module m01_couplers_imp_8YL27N
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
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
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
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
  input S_AXI_wvalid;

  wire [31:0]m01_couplers_to_m01_couplers_ARADDR;
  wire m01_couplers_to_m01_couplers_ARREADY;
  wire m01_couplers_to_m01_couplers_ARVALID;
  wire [31:0]m01_couplers_to_m01_couplers_AWADDR;
  wire m01_couplers_to_m01_couplers_AWREADY;
  wire m01_couplers_to_m01_couplers_AWVALID;
  wire m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire m01_couplers_to_m01_couplers_WREADY;
  wire m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wvalid = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready;
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid;
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready;
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid;
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready;
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid;
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready;
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid;
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready;
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid;
endmodule

module m02_couplers_imp_163UPBX
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tdest,
    M_AXIS_tid,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tuser,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tdest,
    S_AXIS_tid,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tuser,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [63:0]M_AXIS_tdata;
  output [3:0]M_AXIS_tdest;
  output [3:0]M_AXIS_tid;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output [31:0]M_AXIS_tuser;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [31:0]S_AXIS_tdata;
  input [3:0]S_AXIS_tdest;
  input [7:0]S_AXIS_tid;
  input [3:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input [15:0]S_AXIS_tuser;
  input S_AXIS_tvalid;

  wire S_AXIS_ACLK_1;
  wire S_AXIS_ARESETN_1;
  wire [63:0]auto_ss_k_to_auto_ss_slidr_TDATA;
  wire [3:0]auto_ss_k_to_auto_ss_slidr_TDEST;
  wire [7:0]auto_ss_k_to_auto_ss_slidr_TID;
  wire auto_ss_k_to_auto_ss_slidr_TLAST;
  wire auto_ss_k_to_auto_ss_slidr_TREADY;
  wire [31:0]auto_ss_k_to_auto_ss_slidr_TUSER;
  wire auto_ss_k_to_auto_ss_slidr_TVALID;
  wire [63:0]auto_ss_slidr_to_m02_couplers_TDATA;
  wire [3:0]auto_ss_slidr_to_m02_couplers_TDEST;
  wire [3:0]auto_ss_slidr_to_m02_couplers_TID;
  wire auto_ss_slidr_to_m02_couplers_TLAST;
  wire auto_ss_slidr_to_m02_couplers_TREADY;
  wire [31:0]auto_ss_slidr_to_m02_couplers_TUSER;
  wire auto_ss_slidr_to_m02_couplers_TVALID;
  wire [63:0]auto_us_to_auto_ss_k_TDATA;
  wire [3:0]auto_us_to_auto_ss_k_TDEST;
  wire [7:0]auto_us_to_auto_ss_k_TID;
  wire [7:0]auto_us_to_auto_ss_k_TKEEP;
  wire auto_us_to_auto_ss_k_TLAST;
  wire auto_us_to_auto_ss_k_TREADY;
  wire [31:0]auto_us_to_auto_ss_k_TUSER;
  wire auto_us_to_auto_ss_k_TVALID;
  wire [31:0]m02_couplers_to_auto_us_TDATA;
  wire [3:0]m02_couplers_to_auto_us_TDEST;
  wire [7:0]m02_couplers_to_auto_us_TID;
  wire [3:0]m02_couplers_to_auto_us_TKEEP;
  wire m02_couplers_to_auto_us_TLAST;
  wire m02_couplers_to_auto_us_TREADY;
  wire [15:0]m02_couplers_to_auto_us_TUSER;
  wire m02_couplers_to_auto_us_TVALID;

  assign M_AXIS_tdata[63:0] = auto_ss_slidr_to_m02_couplers_TDATA;
  assign M_AXIS_tdest[3:0] = auto_ss_slidr_to_m02_couplers_TDEST;
  assign M_AXIS_tid[3:0] = auto_ss_slidr_to_m02_couplers_TID;
  assign M_AXIS_tlast = auto_ss_slidr_to_m02_couplers_TLAST;
  assign M_AXIS_tuser[31:0] = auto_ss_slidr_to_m02_couplers_TUSER;
  assign M_AXIS_tvalid = auto_ss_slidr_to_m02_couplers_TVALID;
  assign S_AXIS_ACLK_1 = S_AXIS_ACLK;
  assign S_AXIS_ARESETN_1 = S_AXIS_ARESETN;
  assign S_AXIS_tready = m02_couplers_to_auto_us_TREADY;
  assign auto_ss_slidr_to_m02_couplers_TREADY = M_AXIS_tready;
  assign m02_couplers_to_auto_us_TDATA = S_AXIS_tdata[31:0];
  assign m02_couplers_to_auto_us_TDEST = S_AXIS_tdest[3:0];
  assign m02_couplers_to_auto_us_TID = S_AXIS_tid[7:0];
  assign m02_couplers_to_auto_us_TKEEP = S_AXIS_tkeep[3:0];
  assign m02_couplers_to_auto_us_TLAST = S_AXIS_tlast;
  assign m02_couplers_to_auto_us_TUSER = S_AXIS_tuser[15:0];
  assign m02_couplers_to_auto_us_TVALID = S_AXIS_tvalid;
  pynqz2_auto_ss_k_2 auto_ss_k
       (.aclk(S_AXIS_ACLK_1),
        .aresetn(S_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_k_to_auto_ss_slidr_TDATA),
        .m_axis_tdest(auto_ss_k_to_auto_ss_slidr_TDEST),
        .m_axis_tid(auto_ss_k_to_auto_ss_slidr_TID),
        .m_axis_tlast(auto_ss_k_to_auto_ss_slidr_TLAST),
        .m_axis_tready(auto_ss_k_to_auto_ss_slidr_TREADY),
        .m_axis_tuser(auto_ss_k_to_auto_ss_slidr_TUSER),
        .m_axis_tvalid(auto_ss_k_to_auto_ss_slidr_TVALID),
        .s_axis_tdata(auto_us_to_auto_ss_k_TDATA),
        .s_axis_tdest(auto_us_to_auto_ss_k_TDEST),
        .s_axis_tid(auto_us_to_auto_ss_k_TID),
        .s_axis_tkeep(auto_us_to_auto_ss_k_TKEEP),
        .s_axis_tlast(auto_us_to_auto_ss_k_TLAST),
        .s_axis_tready(auto_us_to_auto_ss_k_TREADY),
        .s_axis_tuser(auto_us_to_auto_ss_k_TUSER),
        .s_axis_tvalid(auto_us_to_auto_ss_k_TVALID));
  pynqz2_auto_ss_slidr_2 auto_ss_slidr
       (.aclk(S_AXIS_ACLK_1),
        .aresetn(S_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_slidr_to_m02_couplers_TDATA),
        .m_axis_tdest(auto_ss_slidr_to_m02_couplers_TDEST),
        .m_axis_tid(auto_ss_slidr_to_m02_couplers_TID),
        .m_axis_tlast(auto_ss_slidr_to_m02_couplers_TLAST),
        .m_axis_tready(auto_ss_slidr_to_m02_couplers_TREADY),
        .m_axis_tuser(auto_ss_slidr_to_m02_couplers_TUSER),
        .m_axis_tvalid(auto_ss_slidr_to_m02_couplers_TVALID),
        .s_axis_tdata(auto_ss_k_to_auto_ss_slidr_TDATA),
        .s_axis_tdest(auto_ss_k_to_auto_ss_slidr_TDEST),
        .s_axis_tid(auto_ss_k_to_auto_ss_slidr_TID),
        .s_axis_tlast(auto_ss_k_to_auto_ss_slidr_TLAST),
        .s_axis_tready(auto_ss_k_to_auto_ss_slidr_TREADY),
        .s_axis_tuser(auto_ss_k_to_auto_ss_slidr_TUSER),
        .s_axis_tvalid(auto_ss_k_to_auto_ss_slidr_TVALID));
  pynqz2_auto_us_4 auto_us
       (.aclk(S_AXIS_ACLK_1),
        .aresetn(S_AXIS_ARESETN_1),
        .m_axis_tdata(auto_us_to_auto_ss_k_TDATA),
        .m_axis_tdest(auto_us_to_auto_ss_k_TDEST),
        .m_axis_tid(auto_us_to_auto_ss_k_TID),
        .m_axis_tkeep(auto_us_to_auto_ss_k_TKEEP),
        .m_axis_tlast(auto_us_to_auto_ss_k_TLAST),
        .m_axis_tready(auto_us_to_auto_ss_k_TREADY),
        .m_axis_tuser(auto_us_to_auto_ss_k_TUSER),
        .m_axis_tvalid(auto_us_to_auto_ss_k_TVALID),
        .s_axis_tdata(m02_couplers_to_auto_us_TDATA),
        .s_axis_tdest(m02_couplers_to_auto_us_TDEST),
        .s_axis_tid(m02_couplers_to_auto_us_TID),
        .s_axis_tkeep(m02_couplers_to_auto_us_TKEEP),
        .s_axis_tlast(m02_couplers_to_auto_us_TLAST),
        .s_axis_tready(m02_couplers_to_auto_us_TREADY),
        .s_axis_tuser(m02_couplers_to_auto_us_TUSER),
        .s_axis_tvalid(m02_couplers_to_auto_us_TVALID));
endmodule

(* CORE_GENERATION_INFO = "pynqz2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pynqz2,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=36,numReposBlks=22,numNonXlnxBlks=0,numHierBlks=14,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=1,bdsource=USER,da_axi4_cnt=40,da_axi4_s2mm_cnt=5,da_clkrst_cnt=69,da_ps7_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "pynqz2.hwdef" *) 
module pynqz2
   (DDR_0_addr,
    DDR_0_ba,
    DDR_0_cas_n,
    DDR_0_ck_n,
    DDR_0_ck_p,
    DDR_0_cke,
    DDR_0_cs_n,
    DDR_0_dm,
    DDR_0_dq,
    DDR_0_dqs_n,
    DDR_0_dqs_p,
    DDR_0_odt,
    DDR_0_ras_n,
    DDR_0_reset_n,
    DDR_0_we_n,
    FIXED_IO_0_ddr_vrn,
    FIXED_IO_0_ddr_vrp,
    FIXED_IO_0_mio,
    FIXED_IO_0_ps_clk,
    FIXED_IO_0_ps_porb,
    FIXED_IO_0_ps_srstb,
    clk_pl,
    enable,
    idle_signal,
    reset_n);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR_0, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_0_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 BA" *) inout [2:0]DDR_0_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 CAS_N" *) inout DDR_0_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 CK_N" *) inout DDR_0_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 CK_P" *) inout DDR_0_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 CKE" *) inout DDR_0_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 CS_N" *) inout DDR_0_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 DM" *) inout [3:0]DDR_0_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 DQ" *) inout [31:0]DDR_0_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 DQS_N" *) inout [3:0]DDR_0_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 DQS_P" *) inout [3:0]DDR_0_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 ODT" *) inout DDR_0_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 RAS_N" *) inout DDR_0_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 RESET_N" *) inout DDR_0_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 WE_N" *) inout DDR_0_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO_0, CAN_DEBUG false" *) inout FIXED_IO_0_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 DDR_VRP" *) inout FIXED_IO_0_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 MIO" *) inout [53:0]FIXED_IO_0_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 PS_CLK" *) inout FIXED_IO_0_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 PS_PORB" *) inout FIXED_IO_0_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 PS_SRSTB" *) inout FIXED_IO_0_ps_srstb;
  output clk_pl;
  input enable;
  output idle_signal;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_n;

  wire [0:0]ARESETN_1;
  wire [31:0]axi_mcdma_0_M_AXIS_MM2S_TDATA;
  wire [3:0]axi_mcdma_0_M_AXIS_MM2S_TDEST;
  wire [7:0]axi_mcdma_0_M_AXIS_MM2S_TID;
  wire [3:0]axi_mcdma_0_M_AXIS_MM2S_TKEEP;
  wire axi_mcdma_0_M_AXIS_MM2S_TLAST;
  wire [0:0]axi_mcdma_0_M_AXIS_MM2S_TREADY;
  wire [15:0]axi_mcdma_0_M_AXIS_MM2S_TUSER;
  wire axi_mcdma_0_M_AXIS_MM2S_TVALID;
  wire [31:0]axi_mcdma_0_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_mcdma_0_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_mcdma_0_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_mcdma_0_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_mcdma_0_M_AXI_MM2S_ARPROT;
  wire axi_mcdma_0_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_mcdma_0_M_AXI_MM2S_ARSIZE;
  wire axi_mcdma_0_M_AXI_MM2S_ARVALID;
  wire [31:0]axi_mcdma_0_M_AXI_MM2S_RDATA;
  wire axi_mcdma_0_M_AXI_MM2S_RLAST;
  wire axi_mcdma_0_M_AXI_MM2S_RREADY;
  wire [1:0]axi_mcdma_0_M_AXI_MM2S_RRESP;
  wire axi_mcdma_0_M_AXI_MM2S_RVALID;
  wire [31:0]axi_mcdma_0_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_mcdma_0_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_mcdma_0_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_mcdma_0_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_mcdma_0_M_AXI_S2MM_AWPROT;
  wire axi_mcdma_0_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_mcdma_0_M_AXI_S2MM_AWSIZE;
  wire [3:0]axi_mcdma_0_M_AXI_S2MM_AWUSER;
  wire axi_mcdma_0_M_AXI_S2MM_AWVALID;
  wire axi_mcdma_0_M_AXI_S2MM_BREADY;
  wire [1:0]axi_mcdma_0_M_AXI_S2MM_BRESP;
  wire axi_mcdma_0_M_AXI_S2MM_BVALID;
  wire [63:0]axi_mcdma_0_M_AXI_S2MM_WDATA;
  wire axi_mcdma_0_M_AXI_S2MM_WLAST;
  wire axi_mcdma_0_M_AXI_S2MM_WREADY;
  wire [7:0]axi_mcdma_0_M_AXI_S2MM_WSTRB;
  wire axi_mcdma_0_M_AXI_S2MM_WVALID;
  wire [31:0]axi_mcdma_0_M_AXI_SG_ARADDR;
  wire [1:0]axi_mcdma_0_M_AXI_SG_ARBURST;
  wire [3:0]axi_mcdma_0_M_AXI_SG_ARCACHE;
  wire [7:0]axi_mcdma_0_M_AXI_SG_ARLEN;
  wire [2:0]axi_mcdma_0_M_AXI_SG_ARPROT;
  wire axi_mcdma_0_M_AXI_SG_ARREADY;
  wire [2:0]axi_mcdma_0_M_AXI_SG_ARSIZE;
  wire axi_mcdma_0_M_AXI_SG_ARVALID;
  wire [31:0]axi_mcdma_0_M_AXI_SG_AWADDR;
  wire [1:0]axi_mcdma_0_M_AXI_SG_AWBURST;
  wire [3:0]axi_mcdma_0_M_AXI_SG_AWCACHE;
  wire [7:0]axi_mcdma_0_M_AXI_SG_AWLEN;
  wire [2:0]axi_mcdma_0_M_AXI_SG_AWPROT;
  wire axi_mcdma_0_M_AXI_SG_AWREADY;
  wire [2:0]axi_mcdma_0_M_AXI_SG_AWSIZE;
  wire axi_mcdma_0_M_AXI_SG_AWVALID;
  wire axi_mcdma_0_M_AXI_SG_BREADY;
  wire [1:0]axi_mcdma_0_M_AXI_SG_BRESP;
  wire axi_mcdma_0_M_AXI_SG_BVALID;
  wire [31:0]axi_mcdma_0_M_AXI_SG_RDATA;
  wire axi_mcdma_0_M_AXI_SG_RLAST;
  wire axi_mcdma_0_M_AXI_SG_RREADY;
  wire [1:0]axi_mcdma_0_M_AXI_SG_RRESP;
  wire axi_mcdma_0_M_AXI_SG_RVALID;
  wire [31:0]axi_mcdma_0_M_AXI_SG_WDATA;
  wire axi_mcdma_0_M_AXI_SG_WLAST;
  wire axi_mcdma_0_M_AXI_SG_WREADY;
  wire [3:0]axi_mcdma_0_M_AXI_SG_WSTRB;
  wire axi_mcdma_0_M_AXI_SG_WVALID;
  wire axi_mcdma_0_mm2s_ch1_introut;
  wire axi_mcdma_0_mm2s_ch2_introut;
  wire axi_mcdma_0_mm2s_ch3_introut;
  wire axi_mcdma_0_s2mm_ch1_introut;
  wire [31:0]axi_mem_intercon_M00_AXI_ARADDR;
  wire [1:0]axi_mem_intercon_M00_AXI_ARBURST;
  wire [3:0]axi_mem_intercon_M00_AXI_ARCACHE;
  wire [1:0]axi_mem_intercon_M00_AXI_ARID;
  wire [3:0]axi_mem_intercon_M00_AXI_ARLEN;
  wire [1:0]axi_mem_intercon_M00_AXI_ARLOCK;
  wire [2:0]axi_mem_intercon_M00_AXI_ARPROT;
  wire [3:0]axi_mem_intercon_M00_AXI_ARQOS;
  wire axi_mem_intercon_M00_AXI_ARREADY;
  wire [2:0]axi_mem_intercon_M00_AXI_ARSIZE;
  wire axi_mem_intercon_M00_AXI_ARVALID;
  wire [31:0]axi_mem_intercon_M00_AXI_AWADDR;
  wire [1:0]axi_mem_intercon_M00_AXI_AWBURST;
  wire [3:0]axi_mem_intercon_M00_AXI_AWCACHE;
  wire [1:0]axi_mem_intercon_M00_AXI_AWID;
  wire [3:0]axi_mem_intercon_M00_AXI_AWLEN;
  wire [1:0]axi_mem_intercon_M00_AXI_AWLOCK;
  wire [2:0]axi_mem_intercon_M00_AXI_AWPROT;
  wire [3:0]axi_mem_intercon_M00_AXI_AWQOS;
  wire axi_mem_intercon_M00_AXI_AWREADY;
  wire [2:0]axi_mem_intercon_M00_AXI_AWSIZE;
  wire axi_mem_intercon_M00_AXI_AWVALID;
  wire [5:0]axi_mem_intercon_M00_AXI_BID;
  wire axi_mem_intercon_M00_AXI_BREADY;
  wire [1:0]axi_mem_intercon_M00_AXI_BRESP;
  wire axi_mem_intercon_M00_AXI_BVALID;
  wire [63:0]axi_mem_intercon_M00_AXI_RDATA;
  wire [5:0]axi_mem_intercon_M00_AXI_RID;
  wire axi_mem_intercon_M00_AXI_RLAST;
  wire axi_mem_intercon_M00_AXI_RREADY;
  wire [1:0]axi_mem_intercon_M00_AXI_RRESP;
  wire axi_mem_intercon_M00_AXI_RVALID;
  wire [63:0]axi_mem_intercon_M00_AXI_WDATA;
  wire [1:0]axi_mem_intercon_M00_AXI_WID;
  wire axi_mem_intercon_M00_AXI_WLAST;
  wire axi_mem_intercon_M00_AXI_WREADY;
  wire [7:0]axi_mem_intercon_M00_AXI_WSTRB;
  wire axi_mem_intercon_M00_AXI_WVALID;
  wire [63:0]axis_interconnect_0_M00_AXIS_TDATA;
  wire [3:0]axis_interconnect_0_M00_AXIS_TDEST;
  wire [3:0]axis_interconnect_0_M00_AXIS_TID;
  wire axis_interconnect_0_M00_AXIS_TLAST;
  wire axis_interconnect_0_M00_AXIS_TREADY;
  wire [31:0]axis_interconnect_0_M00_AXIS_TUSER;
  wire axis_interconnect_0_M00_AXIS_TVALID;
  wire [63:0]axis_interconnect_0_M01_AXIS_TDATA;
  wire [3:0]axis_interconnect_0_M01_AXIS_TDEST;
  wire [3:0]axis_interconnect_0_M01_AXIS_TID;
  wire axis_interconnect_0_M01_AXIS_TLAST;
  wire axis_interconnect_0_M01_AXIS_TREADY;
  wire [31:0]axis_interconnect_0_M01_AXIS_TUSER;
  wire axis_interconnect_0_M01_AXIS_TVALID;
  wire [63:0]axis_interconnect_0_M02_AXIS_TDATA;
  wire [3:0]axis_interconnect_0_M02_AXIS_TDEST;
  wire [3:0]axis_interconnect_0_M02_AXIS_TID;
  wire axis_interconnect_0_M02_AXIS_TLAST;
  wire axis_interconnect_0_M02_AXIS_TREADY;
  wire [31:0]axis_interconnect_0_M02_AXIS_TUSER;
  wire axis_interconnect_0_M02_AXIS_TVALID;
  wire [63:0]dtpu_0_M_AXIS_0_0_TDATA;
  wire [3:0]dtpu_0_M_AXIS_0_0_TDEST;
  wire [3:0]dtpu_0_M_AXIS_0_0_TID;
  wire dtpu_0_M_AXIS_0_0_TLAST;
  wire dtpu_0_M_AXIS_0_0_TREADY;
  wire [7:0]dtpu_0_M_AXIS_0_0_TUSER;
  wire dtpu_0_M_AXIS_0_0_TVALID;
  wire dtpu_0_idle_signal;
  wire dtpu_0_intr_dtpu;
  wire enable_1;
  wire [14:0]ps7_DDR_ADDR;
  wire [2:0]ps7_DDR_BA;
  wire ps7_DDR_CAS_N;
  wire ps7_DDR_CKE;
  wire ps7_DDR_CK_N;
  wire ps7_DDR_CK_P;
  wire ps7_DDR_CS_N;
  wire [3:0]ps7_DDR_DM;
  wire [31:0]ps7_DDR_DQ;
  wire [3:0]ps7_DDR_DQS_N;
  wire [3:0]ps7_DDR_DQS_P;
  wire ps7_DDR_ODT;
  wire ps7_DDR_RAS_N;
  wire ps7_DDR_RESET_N;
  wire ps7_DDR_WE_N;
  wire ps7_FCLK_CLK0;
  wire ps7_FCLK_CLK1;
  wire ps7_FCLK_RESET0_N;
  wire ps7_FIXED_IO_DDR_VRN;
  wire ps7_FIXED_IO_DDR_VRP;
  wire [53:0]ps7_FIXED_IO_MIO;
  wire ps7_FIXED_IO_PS_CLK;
  wire ps7_FIXED_IO_PS_PORB;
  wire ps7_FIXED_IO_PS_SRSTB;
  wire [31:0]ps7_M_AXI_GP0_ARADDR;
  wire [1:0]ps7_M_AXI_GP0_ARBURST;
  wire [3:0]ps7_M_AXI_GP0_ARCACHE;
  wire [11:0]ps7_M_AXI_GP0_ARID;
  wire [3:0]ps7_M_AXI_GP0_ARLEN;
  wire [1:0]ps7_M_AXI_GP0_ARLOCK;
  wire [2:0]ps7_M_AXI_GP0_ARPROT;
  wire [3:0]ps7_M_AXI_GP0_ARQOS;
  wire ps7_M_AXI_GP0_ARREADY;
  wire [2:0]ps7_M_AXI_GP0_ARSIZE;
  wire ps7_M_AXI_GP0_ARVALID;
  wire [31:0]ps7_M_AXI_GP0_AWADDR;
  wire [1:0]ps7_M_AXI_GP0_AWBURST;
  wire [3:0]ps7_M_AXI_GP0_AWCACHE;
  wire [11:0]ps7_M_AXI_GP0_AWID;
  wire [3:0]ps7_M_AXI_GP0_AWLEN;
  wire [1:0]ps7_M_AXI_GP0_AWLOCK;
  wire [2:0]ps7_M_AXI_GP0_AWPROT;
  wire [3:0]ps7_M_AXI_GP0_AWQOS;
  wire ps7_M_AXI_GP0_AWREADY;
  wire [2:0]ps7_M_AXI_GP0_AWSIZE;
  wire ps7_M_AXI_GP0_AWVALID;
  wire [11:0]ps7_M_AXI_GP0_BID;
  wire ps7_M_AXI_GP0_BREADY;
  wire [1:0]ps7_M_AXI_GP0_BRESP;
  wire ps7_M_AXI_GP0_BVALID;
  wire [31:0]ps7_M_AXI_GP0_RDATA;
  wire [11:0]ps7_M_AXI_GP0_RID;
  wire ps7_M_AXI_GP0_RLAST;
  wire ps7_M_AXI_GP0_RREADY;
  wire [1:0]ps7_M_AXI_GP0_RRESP;
  wire ps7_M_AXI_GP0_RVALID;
  wire [31:0]ps7_M_AXI_GP0_WDATA;
  wire [11:0]ps7_M_AXI_GP0_WID;
  wire ps7_M_AXI_GP0_WLAST;
  wire ps7_M_AXI_GP0_WREADY;
  wire [3:0]ps7_M_AXI_GP0_WSTRB;
  wire ps7_M_AXI_GP0_WVALID;
  wire [31:0]ps7_axi_periph_M00_AXI_ARADDR;
  wire ps7_axi_periph_M00_AXI_ARREADY;
  wire ps7_axi_periph_M00_AXI_ARVALID;
  wire [31:0]ps7_axi_periph_M00_AXI_AWADDR;
  wire ps7_axi_periph_M00_AXI_AWREADY;
  wire ps7_axi_periph_M00_AXI_AWVALID;
  wire ps7_axi_periph_M00_AXI_BREADY;
  wire [1:0]ps7_axi_periph_M00_AXI_BRESP;
  wire ps7_axi_periph_M00_AXI_BVALID;
  wire [31:0]ps7_axi_periph_M00_AXI_RDATA;
  wire ps7_axi_periph_M00_AXI_RREADY;
  wire [1:0]ps7_axi_periph_M00_AXI_RRESP;
  wire ps7_axi_periph_M00_AXI_RVALID;
  wire [31:0]ps7_axi_periph_M00_AXI_WDATA;
  wire ps7_axi_periph_M00_AXI_WREADY;
  wire [3:0]ps7_axi_periph_M00_AXI_WSTRB;
  wire ps7_axi_periph_M00_AXI_WVALID;
  wire [31:0]ps7_axi_periph_M01_AXI_ARADDR;
  wire ps7_axi_periph_M01_AXI_ARREADY;
  wire ps7_axi_periph_M01_AXI_ARVALID;
  wire [31:0]ps7_axi_periph_M01_AXI_AWADDR;
  wire ps7_axi_periph_M01_AXI_AWREADY;
  wire ps7_axi_periph_M01_AXI_AWVALID;
  wire ps7_axi_periph_M01_AXI_BREADY;
  wire [1:0]ps7_axi_periph_M01_AXI_BRESP;
  wire ps7_axi_periph_M01_AXI_BVALID;
  wire [31:0]ps7_axi_periph_M01_AXI_RDATA;
  wire ps7_axi_periph_M01_AXI_RREADY;
  wire [1:0]ps7_axi_periph_M01_AXI_RRESP;
  wire ps7_axi_periph_M01_AXI_RVALID;
  wire [31:0]ps7_axi_periph_M01_AXI_WDATA;
  wire ps7_axi_periph_M01_AXI_WREADY;
  wire ps7_axi_periph_M01_AXI_WVALID;
  wire reset_n_0_1;
  wire [4:0]xlconcat_0_dout;
  wire [0:0]xlconstant_0_dout;

  assign clk_pl = ps7_FCLK_CLK0;
  assign enable_1 = enable;
  assign idle_signal = dtpu_0_idle_signal;
  assign reset_n_0_1 = reset_n;
  pynqz2_axi_mcdma_0_0 axi_mcdma_0
       (.axi_resetn(ARESETN_1),
        .m_axi_mm2s_araddr(axi_mcdma_0_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_mcdma_0_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_mcdma_0_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(axi_mcdma_0_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_mcdma_0_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_mcdma_0_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_mcdma_0_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(axi_mcdma_0_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_mcdma_0_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_mcdma_0_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_mcdma_0_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_mcdma_0_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_mcdma_0_M_AXI_MM2S_RVALID),
        .m_axi_s2mm_awaddr(axi_mcdma_0_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_mcdma_0_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_mcdma_0_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_mcdma_0_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_mcdma_0_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_mcdma_0_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_mcdma_0_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awuser(axi_mcdma_0_M_AXI_S2MM_AWUSER),
        .m_axi_s2mm_awvalid(axi_mcdma_0_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_mcdma_0_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_mcdma_0_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_mcdma_0_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_mcdma_0_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_mcdma_0_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_mcdma_0_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_mcdma_0_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_mcdma_0_M_AXI_S2MM_WVALID),
        .m_axi_sg_araddr(axi_mcdma_0_M_AXI_SG_ARADDR),
        .m_axi_sg_arburst(axi_mcdma_0_M_AXI_SG_ARBURST),
        .m_axi_sg_arcache(axi_mcdma_0_M_AXI_SG_ARCACHE),
        .m_axi_sg_arlen(axi_mcdma_0_M_AXI_SG_ARLEN),
        .m_axi_sg_arprot(axi_mcdma_0_M_AXI_SG_ARPROT),
        .m_axi_sg_arready(axi_mcdma_0_M_AXI_SG_ARREADY),
        .m_axi_sg_arsize(axi_mcdma_0_M_AXI_SG_ARSIZE),
        .m_axi_sg_arvalid(axi_mcdma_0_M_AXI_SG_ARVALID),
        .m_axi_sg_awaddr(axi_mcdma_0_M_AXI_SG_AWADDR),
        .m_axi_sg_awburst(axi_mcdma_0_M_AXI_SG_AWBURST),
        .m_axi_sg_awcache(axi_mcdma_0_M_AXI_SG_AWCACHE),
        .m_axi_sg_awlen(axi_mcdma_0_M_AXI_SG_AWLEN),
        .m_axi_sg_awprot(axi_mcdma_0_M_AXI_SG_AWPROT),
        .m_axi_sg_awready(axi_mcdma_0_M_AXI_SG_AWREADY),
        .m_axi_sg_awsize(axi_mcdma_0_M_AXI_SG_AWSIZE),
        .m_axi_sg_awvalid(axi_mcdma_0_M_AXI_SG_AWVALID),
        .m_axi_sg_bready(axi_mcdma_0_M_AXI_SG_BREADY),
        .m_axi_sg_bresp(axi_mcdma_0_M_AXI_SG_BRESP),
        .m_axi_sg_bvalid(axi_mcdma_0_M_AXI_SG_BVALID),
        .m_axi_sg_rdata(axi_mcdma_0_M_AXI_SG_RDATA),
        .m_axi_sg_rlast(axi_mcdma_0_M_AXI_SG_RLAST),
        .m_axi_sg_rready(axi_mcdma_0_M_AXI_SG_RREADY),
        .m_axi_sg_rresp(axi_mcdma_0_M_AXI_SG_RRESP),
        .m_axi_sg_rvalid(axi_mcdma_0_M_AXI_SG_RVALID),
        .m_axi_sg_wdata(axi_mcdma_0_M_AXI_SG_WDATA),
        .m_axi_sg_wlast(axi_mcdma_0_M_AXI_SG_WLAST),
        .m_axi_sg_wready(axi_mcdma_0_M_AXI_SG_WREADY),
        .m_axi_sg_wstrb(axi_mcdma_0_M_AXI_SG_WSTRB),
        .m_axi_sg_wvalid(axi_mcdma_0_M_AXI_SG_WVALID),
        .m_axis_mm2s_tdata(axi_mcdma_0_M_AXIS_MM2S_TDATA),
        .m_axis_mm2s_tdest(axi_mcdma_0_M_AXIS_MM2S_TDEST),
        .m_axis_mm2s_tid(axi_mcdma_0_M_AXIS_MM2S_TID),
        .m_axis_mm2s_tkeep(axi_mcdma_0_M_AXIS_MM2S_TKEEP),
        .m_axis_mm2s_tlast(axi_mcdma_0_M_AXIS_MM2S_TLAST),
        .m_axis_mm2s_tready(axi_mcdma_0_M_AXIS_MM2S_TREADY),
        .m_axis_mm2s_tuser(axi_mcdma_0_M_AXIS_MM2S_TUSER),
        .m_axis_mm2s_tvalid(axi_mcdma_0_M_AXIS_MM2S_TVALID),
        .mm2s_ch1_introut(axi_mcdma_0_mm2s_ch1_introut),
        .mm2s_ch2_introut(axi_mcdma_0_mm2s_ch2_introut),
        .mm2s_ch3_introut(axi_mcdma_0_mm2s_ch3_introut),
        .s2mm_ch1_introut(axi_mcdma_0_s2mm_ch1_introut),
        .s_axi_aclk(ps7_FCLK_CLK0),
        .s_axi_lite_aclk(ps7_FCLK_CLK0),
        .s_axi_lite_araddr(ps7_axi_periph_M01_AXI_ARADDR[11:0]),
        .s_axi_lite_arready(ps7_axi_periph_M01_AXI_ARREADY),
        .s_axi_lite_arvalid(ps7_axi_periph_M01_AXI_ARVALID),
        .s_axi_lite_awaddr(ps7_axi_periph_M01_AXI_AWADDR[11:0]),
        .s_axi_lite_awready(ps7_axi_periph_M01_AXI_AWREADY),
        .s_axi_lite_awvalid(ps7_axi_periph_M01_AXI_AWVALID),
        .s_axi_lite_bready(ps7_axi_periph_M01_AXI_BREADY),
        .s_axi_lite_bresp(ps7_axi_periph_M01_AXI_BRESP),
        .s_axi_lite_bvalid(ps7_axi_periph_M01_AXI_BVALID),
        .s_axi_lite_rdata(ps7_axi_periph_M01_AXI_RDATA),
        .s_axi_lite_rready(ps7_axi_periph_M01_AXI_RREADY),
        .s_axi_lite_rresp(ps7_axi_periph_M01_AXI_RRESP),
        .s_axi_lite_rvalid(ps7_axi_periph_M01_AXI_RVALID),
        .s_axi_lite_wdata(ps7_axi_periph_M01_AXI_WDATA),
        .s_axi_lite_wready(ps7_axi_periph_M01_AXI_WREADY),
        .s_axi_lite_wvalid(ps7_axi_periph_M01_AXI_WVALID),
        .s_axis_s2mm_tdata(dtpu_0_M_AXIS_0_0_TDATA),
        .s_axis_s2mm_tdest(dtpu_0_M_AXIS_0_0_TDEST),
        .s_axis_s2mm_tid({1'b0,1'b0,1'b0,1'b0,dtpu_0_M_AXIS_0_0_TID}),
        .s_axis_s2mm_tkeep({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_s2mm_tlast(dtpu_0_M_AXIS_0_0_TLAST),
        .s_axis_s2mm_tready(dtpu_0_M_AXIS_0_0_TREADY),
        .s_axis_s2mm_tuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dtpu_0_M_AXIS_0_0_TUSER}),
        .s_axis_s2mm_tvalid(dtpu_0_M_AXIS_0_0_TVALID));
  pynqz2_axi_mem_intercon_4 axi_mem_intercon
       (.ACLK(ps7_FCLK_CLK0),
        .ARESETN(ARESETN_1),
        .M00_ACLK(ps7_FCLK_CLK0),
        .M00_ARESETN(ARESETN_1),
        .M00_AXI_araddr(axi_mem_intercon_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_mem_intercon_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_mem_intercon_M00_AXI_ARCACHE),
        .M00_AXI_arid(axi_mem_intercon_M00_AXI_ARID),
        .M00_AXI_arlen(axi_mem_intercon_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_mem_intercon_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_mem_intercon_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_mem_intercon_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_mem_intercon_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_mem_intercon_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_mem_intercon_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_mem_intercon_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_mem_intercon_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_mem_intercon_M00_AXI_AWCACHE),
        .M00_AXI_awid(axi_mem_intercon_M00_AXI_AWID),
        .M00_AXI_awlen(axi_mem_intercon_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_mem_intercon_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_mem_intercon_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_mem_intercon_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_mem_intercon_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_mem_intercon_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_mem_intercon_M00_AXI_AWVALID),
        .M00_AXI_bid(axi_mem_intercon_M00_AXI_BID),
        .M00_AXI_bready(axi_mem_intercon_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_mem_intercon_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_mem_intercon_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_mem_intercon_M00_AXI_RDATA),
        .M00_AXI_rid(axi_mem_intercon_M00_AXI_RID),
        .M00_AXI_rlast(axi_mem_intercon_M00_AXI_RLAST),
        .M00_AXI_rready(axi_mem_intercon_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_mem_intercon_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_mem_intercon_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_mem_intercon_M00_AXI_WDATA),
        .M00_AXI_wid(axi_mem_intercon_M00_AXI_WID),
        .M00_AXI_wlast(axi_mem_intercon_M00_AXI_WLAST),
        .M00_AXI_wready(axi_mem_intercon_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_mem_intercon_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_mem_intercon_M00_AXI_WVALID),
        .S00_ACLK(ps7_FCLK_CLK0),
        .S00_ARESETN(ARESETN_1),
        .S00_AXI_araddr(axi_mcdma_0_M_AXI_MM2S_ARADDR),
        .S00_AXI_arburst(axi_mcdma_0_M_AXI_MM2S_ARBURST),
        .S00_AXI_arcache(axi_mcdma_0_M_AXI_MM2S_ARCACHE),
        .S00_AXI_arlen(axi_mcdma_0_M_AXI_MM2S_ARLEN),
        .S00_AXI_arprot(axi_mcdma_0_M_AXI_MM2S_ARPROT),
        .S00_AXI_arready(axi_mcdma_0_M_AXI_MM2S_ARREADY),
        .S00_AXI_arsize(axi_mcdma_0_M_AXI_MM2S_ARSIZE),
        .S00_AXI_arvalid(axi_mcdma_0_M_AXI_MM2S_ARVALID),
        .S00_AXI_rdata(axi_mcdma_0_M_AXI_MM2S_RDATA),
        .S00_AXI_rlast(axi_mcdma_0_M_AXI_MM2S_RLAST),
        .S00_AXI_rready(axi_mcdma_0_M_AXI_MM2S_RREADY),
        .S00_AXI_rresp(axi_mcdma_0_M_AXI_MM2S_RRESP),
        .S00_AXI_rvalid(axi_mcdma_0_M_AXI_MM2S_RVALID),
        .S01_ACLK(ps7_FCLK_CLK0),
        .S01_ARESETN(ARESETN_1),
        .S01_AXI_awaddr(axi_mcdma_0_M_AXI_S2MM_AWADDR),
        .S01_AXI_awburst(axi_mcdma_0_M_AXI_S2MM_AWBURST),
        .S01_AXI_awcache(axi_mcdma_0_M_AXI_S2MM_AWCACHE),
        .S01_AXI_awlen(axi_mcdma_0_M_AXI_S2MM_AWLEN),
        .S01_AXI_awprot(axi_mcdma_0_M_AXI_S2MM_AWPROT),
        .S01_AXI_awready(axi_mcdma_0_M_AXI_S2MM_AWREADY),
        .S01_AXI_awsize(axi_mcdma_0_M_AXI_S2MM_AWSIZE),
        .S01_AXI_awuser(axi_mcdma_0_M_AXI_S2MM_AWUSER),
        .S01_AXI_awvalid(axi_mcdma_0_M_AXI_S2MM_AWVALID),
        .S01_AXI_bready(axi_mcdma_0_M_AXI_S2MM_BREADY),
        .S01_AXI_bresp(axi_mcdma_0_M_AXI_S2MM_BRESP),
        .S01_AXI_bvalid(axi_mcdma_0_M_AXI_S2MM_BVALID),
        .S01_AXI_wdata(axi_mcdma_0_M_AXI_S2MM_WDATA),
        .S01_AXI_wlast(axi_mcdma_0_M_AXI_S2MM_WLAST),
        .S01_AXI_wready(axi_mcdma_0_M_AXI_S2MM_WREADY),
        .S01_AXI_wstrb(axi_mcdma_0_M_AXI_S2MM_WSTRB),
        .S01_AXI_wvalid(axi_mcdma_0_M_AXI_S2MM_WVALID),
        .S02_ACLK(ps7_FCLK_CLK0),
        .S02_ARESETN(ARESETN_1),
        .S02_AXI_araddr(axi_mcdma_0_M_AXI_SG_ARADDR),
        .S02_AXI_arburst(axi_mcdma_0_M_AXI_SG_ARBURST),
        .S02_AXI_arcache(axi_mcdma_0_M_AXI_SG_ARCACHE),
        .S02_AXI_arlen(axi_mcdma_0_M_AXI_SG_ARLEN),
        .S02_AXI_arprot(axi_mcdma_0_M_AXI_SG_ARPROT),
        .S02_AXI_arready(axi_mcdma_0_M_AXI_SG_ARREADY),
        .S02_AXI_arsize(axi_mcdma_0_M_AXI_SG_ARSIZE),
        .S02_AXI_arvalid(axi_mcdma_0_M_AXI_SG_ARVALID),
        .S02_AXI_awaddr(axi_mcdma_0_M_AXI_SG_AWADDR),
        .S02_AXI_awburst(axi_mcdma_0_M_AXI_SG_AWBURST),
        .S02_AXI_awcache(axi_mcdma_0_M_AXI_SG_AWCACHE),
        .S02_AXI_awlen(axi_mcdma_0_M_AXI_SG_AWLEN),
        .S02_AXI_awprot(axi_mcdma_0_M_AXI_SG_AWPROT),
        .S02_AXI_awready(axi_mcdma_0_M_AXI_SG_AWREADY),
        .S02_AXI_awsize(axi_mcdma_0_M_AXI_SG_AWSIZE),
        .S02_AXI_awvalid(axi_mcdma_0_M_AXI_SG_AWVALID),
        .S02_AXI_bready(axi_mcdma_0_M_AXI_SG_BREADY),
        .S02_AXI_bresp(axi_mcdma_0_M_AXI_SG_BRESP),
        .S02_AXI_bvalid(axi_mcdma_0_M_AXI_SG_BVALID),
        .S02_AXI_rdata(axi_mcdma_0_M_AXI_SG_RDATA),
        .S02_AXI_rlast(axi_mcdma_0_M_AXI_SG_RLAST),
        .S02_AXI_rready(axi_mcdma_0_M_AXI_SG_RREADY),
        .S02_AXI_rresp(axi_mcdma_0_M_AXI_SG_RRESP),
        .S02_AXI_rvalid(axi_mcdma_0_M_AXI_SG_RVALID),
        .S02_AXI_wdata(axi_mcdma_0_M_AXI_SG_WDATA),
        .S02_AXI_wlast(axi_mcdma_0_M_AXI_SG_WLAST),
        .S02_AXI_wready(axi_mcdma_0_M_AXI_SG_WREADY),
        .S02_AXI_wstrb(axi_mcdma_0_M_AXI_SG_WSTRB),
        .S02_AXI_wvalid(axi_mcdma_0_M_AXI_SG_WVALID));
  pynqz2_axis_interconnect_0_0 axis_interconnect_0
       (.ACLK(ps7_FCLK_CLK0),
        .ARESETN(ARESETN_1),
        .M00_AXIS_ACLK(ps7_FCLK_CLK0),
        .M00_AXIS_ARESETN(ARESETN_1),
        .M00_AXIS_tdata(axis_interconnect_0_M00_AXIS_TDATA),
        .M00_AXIS_tdest(axis_interconnect_0_M00_AXIS_TDEST),
        .M00_AXIS_tid(axis_interconnect_0_M00_AXIS_TID),
        .M00_AXIS_tlast(axis_interconnect_0_M00_AXIS_TLAST),
        .M00_AXIS_tready(axis_interconnect_0_M00_AXIS_TREADY),
        .M00_AXIS_tuser(axis_interconnect_0_M00_AXIS_TUSER),
        .M00_AXIS_tvalid(axis_interconnect_0_M00_AXIS_TVALID),
        .M01_AXIS_ACLK(ps7_FCLK_CLK0),
        .M01_AXIS_ARESETN(ARESETN_1),
        .M01_AXIS_tdata(axis_interconnect_0_M01_AXIS_TDATA),
        .M01_AXIS_tdest(axis_interconnect_0_M01_AXIS_TDEST),
        .M01_AXIS_tid(axis_interconnect_0_M01_AXIS_TID),
        .M01_AXIS_tlast(axis_interconnect_0_M01_AXIS_TLAST),
        .M01_AXIS_tready(axis_interconnect_0_M01_AXIS_TREADY),
        .M01_AXIS_tuser(axis_interconnect_0_M01_AXIS_TUSER),
        .M01_AXIS_tvalid(axis_interconnect_0_M01_AXIS_TVALID),
        .M02_AXIS_ACLK(ps7_FCLK_CLK0),
        .M02_AXIS_ARESETN(ARESETN_1),
        .M02_AXIS_tdata(axis_interconnect_0_M02_AXIS_TDATA),
        .M02_AXIS_tdest(axis_interconnect_0_M02_AXIS_TDEST),
        .M02_AXIS_tid(axis_interconnect_0_M02_AXIS_TID),
        .M02_AXIS_tlast(axis_interconnect_0_M02_AXIS_TLAST),
        .M02_AXIS_tready(axis_interconnect_0_M02_AXIS_TREADY),
        .M02_AXIS_tuser(axis_interconnect_0_M02_AXIS_TUSER),
        .M02_AXIS_tvalid(axis_interconnect_0_M02_AXIS_TVALID),
        .S00_AXIS_ACLK(ps7_FCLK_CLK0),
        .S00_AXIS_ARESETN(ARESETN_1),
        .S00_AXIS_tdata(axi_mcdma_0_M_AXIS_MM2S_TDATA),
        .S00_AXIS_tdest(axi_mcdma_0_M_AXIS_MM2S_TDEST),
        .S00_AXIS_tid(axi_mcdma_0_M_AXIS_MM2S_TID),
        .S00_AXIS_tkeep(axi_mcdma_0_M_AXIS_MM2S_TKEEP),
        .S00_AXIS_tlast(axi_mcdma_0_M_AXIS_MM2S_TLAST),
        .S00_AXIS_tready(axi_mcdma_0_M_AXIS_MM2S_TREADY),
        .S00_AXIS_tuser(axi_mcdma_0_M_AXIS_MM2S_TUSER),
        .S00_AXIS_tvalid(axi_mcdma_0_M_AXIS_MM2S_TVALID));
  pynqz2_dtpu_0_1 dtpu_0
       (.M_AXIS_0_0_tdata(dtpu_0_M_AXIS_0_0_TDATA),
        .M_AXIS_0_0_tdest(dtpu_0_M_AXIS_0_0_TDEST),
        .M_AXIS_0_0_tid(dtpu_0_M_AXIS_0_0_TID),
        .M_AXIS_0_0_tlast(dtpu_0_M_AXIS_0_0_TLAST),
        .M_AXIS_0_0_tready(dtpu_0_M_AXIS_0_0_TREADY),
        .M_AXIS_0_0_tuser(dtpu_0_M_AXIS_0_0_TUSER),
        .M_AXIS_0_0_tvalid(dtpu_0_M_AXIS_0_0_TVALID),
        .S_AXIS_0_0_tdata(axis_interconnect_0_M01_AXIS_TDATA),
        .S_AXIS_0_0_tdest(axis_interconnect_0_M01_AXIS_TDEST),
        .S_AXIS_0_0_tid(axis_interconnect_0_M01_AXIS_TID),
        .S_AXIS_0_0_tlast(axis_interconnect_0_M01_AXIS_TLAST),
        .S_AXIS_0_0_tready(axis_interconnect_0_M01_AXIS_TREADY),
        .S_AXIS_0_0_tuser(axis_interconnect_0_M01_AXIS_TUSER[7:0]),
        .S_AXIS_0_0_tvalid(axis_interconnect_0_M01_AXIS_TVALID),
        .S_AXIS_1_0_tdata(axis_interconnect_0_M00_AXIS_TDATA),
        .S_AXIS_1_0_tdest(axis_interconnect_0_M00_AXIS_TDEST),
        .S_AXIS_1_0_tid(axis_interconnect_0_M00_AXIS_TID),
        .S_AXIS_1_0_tlast(axis_interconnect_0_M00_AXIS_TLAST),
        .S_AXIS_1_0_tready(axis_interconnect_0_M00_AXIS_TREADY),
        .S_AXIS_1_0_tuser(axis_interconnect_0_M00_AXIS_TUSER[7:0]),
        .S_AXIS_1_0_tvalid(axis_interconnect_0_M00_AXIS_TVALID),
        .S_AXIS_2_0_tdata(axis_interconnect_0_M02_AXIS_TDATA),
        .S_AXIS_2_0_tdest(axis_interconnect_0_M02_AXIS_TDEST),
        .S_AXIS_2_0_tid(axis_interconnect_0_M02_AXIS_TID),
        .S_AXIS_2_0_tlast(axis_interconnect_0_M02_AXIS_TLAST),
        .S_AXIS_2_0_tready(axis_interconnect_0_M02_AXIS_TREADY),
        .S_AXIS_2_0_tuser(axis_interconnect_0_M02_AXIS_TUSER[7:0]),
        .S_AXIS_2_0_tvalid(axis_interconnect_0_M02_AXIS_TVALID),
        .S_AXI_araddr(ps7_axi_periph_M00_AXI_ARADDR[12:0]),
        .S_AXI_arready(ps7_axi_periph_M00_AXI_ARREADY),
        .S_AXI_arvalid(ps7_axi_periph_M00_AXI_ARVALID),
        .S_AXI_awaddr(ps7_axi_periph_M00_AXI_AWADDR[12:0]),
        .S_AXI_awready(ps7_axi_periph_M00_AXI_AWREADY),
        .S_AXI_awvalid(ps7_axi_periph_M00_AXI_AWVALID),
        .S_AXI_bready(ps7_axi_periph_M00_AXI_BREADY),
        .S_AXI_bresp(ps7_axi_periph_M00_AXI_BRESP),
        .S_AXI_bvalid(ps7_axi_periph_M00_AXI_BVALID),
        .S_AXI_rdata(ps7_axi_periph_M00_AXI_RDATA),
        .S_AXI_rready(ps7_axi_periph_M00_AXI_RREADY),
        .S_AXI_rresp(ps7_axi_periph_M00_AXI_RRESP),
        .S_AXI_rvalid(ps7_axi_periph_M00_AXI_RVALID),
        .S_AXI_wdata(ps7_axi_periph_M00_AXI_WDATA),
        .S_AXI_wready(ps7_axi_periph_M00_AXI_WREADY),
        .S_AXI_wstrb(ps7_axi_periph_M00_AXI_WSTRB),
        .S_AXI_wvalid(ps7_axi_periph_M00_AXI_WVALID),
        .axi_aclk(ps7_FCLK_CLK0),
        .axi_resetn(ARESETN_1),
        .clk(ps7_FCLK_CLK1),
        .enable(enable_1),
        .idle_signal(dtpu_0_idle_signal),
        .intr_dtpu(dtpu_0_intr_dtpu),
        .test_mode(xlconstant_0_dout));
  pynqz2_ps7_0 ps7
       (.DDR_Addr(DDR_0_addr[14:0]),
        .DDR_BankAddr(DDR_0_ba[2:0]),
        .DDR_CAS_n(DDR_0_cas_n),
        .DDR_CKE(DDR_0_cke),
        .DDR_CS_n(DDR_0_cs_n),
        .DDR_Clk(DDR_0_ck_p),
        .DDR_Clk_n(DDR_0_ck_n),
        .DDR_DM(DDR_0_dm[3:0]),
        .DDR_DQ(DDR_0_dq[31:0]),
        .DDR_DQS(DDR_0_dqs_p[3:0]),
        .DDR_DQS_n(DDR_0_dqs_n[3:0]),
        .DDR_DRSTB(DDR_0_reset_n),
        .DDR_ODT(DDR_0_odt),
        .DDR_RAS_n(DDR_0_ras_n),
        .DDR_VRN(FIXED_IO_0_ddr_vrn),
        .DDR_VRP(FIXED_IO_0_ddr_vrp),
        .DDR_WEB(DDR_0_we_n),
        .FCLK_CLK0(ps7_FCLK_CLK0),
        .FCLK_CLK1(ps7_FCLK_CLK1),
        .FCLK_RESET0_N(ps7_FCLK_RESET0_N),
        .IRQ_F2P(xlconcat_0_dout),
        .MIO(FIXED_IO_0_mio[53:0]),
        .M_AXI_GP0_ACLK(ps7_FCLK_CLK0),
        .M_AXI_GP0_ARADDR(ps7_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(ps7_M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(ps7_M_AXI_GP0_ARCACHE),
        .M_AXI_GP0_ARID(ps7_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(ps7_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(ps7_M_AXI_GP0_ARLOCK),
        .M_AXI_GP0_ARPROT(ps7_M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(ps7_M_AXI_GP0_ARQOS),
        .M_AXI_GP0_ARREADY(ps7_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE(ps7_M_AXI_GP0_ARSIZE),
        .M_AXI_GP0_ARVALID(ps7_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(ps7_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(ps7_M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(ps7_M_AXI_GP0_AWCACHE),
        .M_AXI_GP0_AWID(ps7_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(ps7_M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(ps7_M_AXI_GP0_AWLOCK),
        .M_AXI_GP0_AWPROT(ps7_M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(ps7_M_AXI_GP0_AWQOS),
        .M_AXI_GP0_AWREADY(ps7_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE(ps7_M_AXI_GP0_AWSIZE),
        .M_AXI_GP0_AWVALID(ps7_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(ps7_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(ps7_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(ps7_M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(ps7_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(ps7_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(ps7_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(ps7_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(ps7_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(ps7_M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(ps7_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(ps7_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(ps7_M_AXI_GP0_WID),
        .M_AXI_GP0_WLAST(ps7_M_AXI_GP0_WLAST),
        .M_AXI_GP0_WREADY(ps7_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(ps7_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(ps7_M_AXI_GP0_WVALID),
        .PS_CLK(FIXED_IO_0_ps_clk),
        .PS_PORB(FIXED_IO_0_ps_porb),
        .PS_SRSTB(FIXED_IO_0_ps_srstb),
        .S_AXI_HP0_ACLK(ps7_FCLK_CLK0),
        .S_AXI_HP0_ARADDR(axi_mem_intercon_M00_AXI_ARADDR),
        .S_AXI_HP0_ARBURST(axi_mem_intercon_M00_AXI_ARBURST),
        .S_AXI_HP0_ARCACHE(axi_mem_intercon_M00_AXI_ARCACHE),
        .S_AXI_HP0_ARID({1'b0,1'b0,1'b0,1'b0,axi_mem_intercon_M00_AXI_ARID}),
        .S_AXI_HP0_ARLEN(axi_mem_intercon_M00_AXI_ARLEN),
        .S_AXI_HP0_ARLOCK(axi_mem_intercon_M00_AXI_ARLOCK),
        .S_AXI_HP0_ARPROT(axi_mem_intercon_M00_AXI_ARPROT),
        .S_AXI_HP0_ARQOS(axi_mem_intercon_M00_AXI_ARQOS),
        .S_AXI_HP0_ARREADY(axi_mem_intercon_M00_AXI_ARREADY),
        .S_AXI_HP0_ARSIZE(axi_mem_intercon_M00_AXI_ARSIZE),
        .S_AXI_HP0_ARVALID(axi_mem_intercon_M00_AXI_ARVALID),
        .S_AXI_HP0_AWADDR(axi_mem_intercon_M00_AXI_AWADDR),
        .S_AXI_HP0_AWBURST(axi_mem_intercon_M00_AXI_AWBURST),
        .S_AXI_HP0_AWCACHE(axi_mem_intercon_M00_AXI_AWCACHE),
        .S_AXI_HP0_AWID({1'b0,1'b0,1'b0,1'b0,axi_mem_intercon_M00_AXI_AWID}),
        .S_AXI_HP0_AWLEN(axi_mem_intercon_M00_AXI_AWLEN),
        .S_AXI_HP0_AWLOCK(axi_mem_intercon_M00_AXI_AWLOCK),
        .S_AXI_HP0_AWPROT(axi_mem_intercon_M00_AXI_AWPROT),
        .S_AXI_HP0_AWQOS(axi_mem_intercon_M00_AXI_AWQOS),
        .S_AXI_HP0_AWREADY(axi_mem_intercon_M00_AXI_AWREADY),
        .S_AXI_HP0_AWSIZE(axi_mem_intercon_M00_AXI_AWSIZE),
        .S_AXI_HP0_AWVALID(axi_mem_intercon_M00_AXI_AWVALID),
        .S_AXI_HP0_BID(axi_mem_intercon_M00_AXI_BID),
        .S_AXI_HP0_BREADY(axi_mem_intercon_M00_AXI_BREADY),
        .S_AXI_HP0_BRESP(axi_mem_intercon_M00_AXI_BRESP),
        .S_AXI_HP0_BVALID(axi_mem_intercon_M00_AXI_BVALID),
        .S_AXI_HP0_RDATA(axi_mem_intercon_M00_AXI_RDATA),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RID(axi_mem_intercon_M00_AXI_RID),
        .S_AXI_HP0_RLAST(axi_mem_intercon_M00_AXI_RLAST),
        .S_AXI_HP0_RREADY(axi_mem_intercon_M00_AXI_RREADY),
        .S_AXI_HP0_RRESP(axi_mem_intercon_M00_AXI_RRESP),
        .S_AXI_HP0_RVALID(axi_mem_intercon_M00_AXI_RVALID),
        .S_AXI_HP0_WDATA(axi_mem_intercon_M00_AXI_WDATA),
        .S_AXI_HP0_WID({1'b0,1'b0,1'b0,1'b0,axi_mem_intercon_M00_AXI_WID}),
        .S_AXI_HP0_WLAST(axi_mem_intercon_M00_AXI_WLAST),
        .S_AXI_HP0_WREADY(axi_mem_intercon_M00_AXI_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB(axi_mem_intercon_M00_AXI_WSTRB),
        .S_AXI_HP0_WVALID(axi_mem_intercon_M00_AXI_WVALID),
        .USB0_VBUS_PWRFAULT(1'b0));
  pynqz2_ps7_axi_periph_2 ps7_axi_periph
       (.ACLK(ps7_FCLK_CLK0),
        .ARESETN(ARESETN_1),
        .M00_ACLK(ps7_FCLK_CLK0),
        .M00_ARESETN(ARESETN_1),
        .M00_AXI_araddr(ps7_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arready(ps7_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(ps7_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(ps7_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awready(ps7_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(ps7_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(ps7_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(ps7_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(ps7_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(ps7_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(ps7_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(ps7_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(ps7_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(ps7_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(ps7_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wstrb(ps7_axi_periph_M00_AXI_WSTRB),
        .M00_AXI_wvalid(ps7_axi_periph_M00_AXI_WVALID),
        .M01_ACLK(ps7_FCLK_CLK0),
        .M01_ARESETN(ARESETN_1),
        .M01_AXI_araddr(ps7_axi_periph_M01_AXI_ARADDR),
        .M01_AXI_arready(ps7_axi_periph_M01_AXI_ARREADY),
        .M01_AXI_arvalid(ps7_axi_periph_M01_AXI_ARVALID),
        .M01_AXI_awaddr(ps7_axi_periph_M01_AXI_AWADDR),
        .M01_AXI_awready(ps7_axi_periph_M01_AXI_AWREADY),
        .M01_AXI_awvalid(ps7_axi_periph_M01_AXI_AWVALID),
        .M01_AXI_bready(ps7_axi_periph_M01_AXI_BREADY),
        .M01_AXI_bresp(ps7_axi_periph_M01_AXI_BRESP),
        .M01_AXI_bvalid(ps7_axi_periph_M01_AXI_BVALID),
        .M01_AXI_rdata(ps7_axi_periph_M01_AXI_RDATA),
        .M01_AXI_rready(ps7_axi_periph_M01_AXI_RREADY),
        .M01_AXI_rresp(ps7_axi_periph_M01_AXI_RRESP),
        .M01_AXI_rvalid(ps7_axi_periph_M01_AXI_RVALID),
        .M01_AXI_wdata(ps7_axi_periph_M01_AXI_WDATA),
        .M01_AXI_wready(ps7_axi_periph_M01_AXI_WREADY),
        .M01_AXI_wvalid(ps7_axi_periph_M01_AXI_WVALID),
        .S00_ACLK(ps7_FCLK_CLK0),
        .S00_ARESETN(ARESETN_1),
        .S00_AXI_araddr(ps7_M_AXI_GP0_ARADDR),
        .S00_AXI_arburst(ps7_M_AXI_GP0_ARBURST),
        .S00_AXI_arcache(ps7_M_AXI_GP0_ARCACHE),
        .S00_AXI_arid(ps7_M_AXI_GP0_ARID),
        .S00_AXI_arlen(ps7_M_AXI_GP0_ARLEN),
        .S00_AXI_arlock(ps7_M_AXI_GP0_ARLOCK),
        .S00_AXI_arprot(ps7_M_AXI_GP0_ARPROT),
        .S00_AXI_arqos(ps7_M_AXI_GP0_ARQOS),
        .S00_AXI_arready(ps7_M_AXI_GP0_ARREADY),
        .S00_AXI_arsize(ps7_M_AXI_GP0_ARSIZE),
        .S00_AXI_arvalid(ps7_M_AXI_GP0_ARVALID),
        .S00_AXI_awaddr(ps7_M_AXI_GP0_AWADDR),
        .S00_AXI_awburst(ps7_M_AXI_GP0_AWBURST),
        .S00_AXI_awcache(ps7_M_AXI_GP0_AWCACHE),
        .S00_AXI_awid(ps7_M_AXI_GP0_AWID),
        .S00_AXI_awlen(ps7_M_AXI_GP0_AWLEN),
        .S00_AXI_awlock(ps7_M_AXI_GP0_AWLOCK),
        .S00_AXI_awprot(ps7_M_AXI_GP0_AWPROT),
        .S00_AXI_awqos(ps7_M_AXI_GP0_AWQOS),
        .S00_AXI_awready(ps7_M_AXI_GP0_AWREADY),
        .S00_AXI_awsize(ps7_M_AXI_GP0_AWSIZE),
        .S00_AXI_awvalid(ps7_M_AXI_GP0_AWVALID),
        .S00_AXI_bid(ps7_M_AXI_GP0_BID),
        .S00_AXI_bready(ps7_M_AXI_GP0_BREADY),
        .S00_AXI_bresp(ps7_M_AXI_GP0_BRESP),
        .S00_AXI_bvalid(ps7_M_AXI_GP0_BVALID),
        .S00_AXI_rdata(ps7_M_AXI_GP0_RDATA),
        .S00_AXI_rid(ps7_M_AXI_GP0_RID),
        .S00_AXI_rlast(ps7_M_AXI_GP0_RLAST),
        .S00_AXI_rready(ps7_M_AXI_GP0_RREADY),
        .S00_AXI_rresp(ps7_M_AXI_GP0_RRESP),
        .S00_AXI_rvalid(ps7_M_AXI_GP0_RVALID),
        .S00_AXI_wdata(ps7_M_AXI_GP0_WDATA),
        .S00_AXI_wid(ps7_M_AXI_GP0_WID),
        .S00_AXI_wlast(ps7_M_AXI_GP0_WLAST),
        .S00_AXI_wready(ps7_M_AXI_GP0_WREADY),
        .S00_AXI_wstrb(ps7_M_AXI_GP0_WSTRB),
        .S00_AXI_wvalid(ps7_M_AXI_GP0_WVALID));
  pynqz2_rst_ps7_30M_0 rst_ps7_30M
       (.aux_reset_in(reset_n_0_1),
        .dcm_locked(1'b1),
        .ext_reset_in(ps7_FCLK_RESET0_N),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(ARESETN_1),
        .slowest_sync_clk(ps7_FCLK_CLK0));
  pynqz2_xlconcat_0_0 xlconcat_0
       (.In0(axi_mcdma_0_mm2s_ch3_introut),
        .In1(axi_mcdma_0_s2mm_ch1_introut),
        .In2(dtpu_0_intr_dtpu),
        .In3(axi_mcdma_0_mm2s_ch2_introut),
        .In4(axi_mcdma_0_mm2s_ch1_introut),
        .dout(xlconcat_0_dout));
  pynqz2_xlconstant_0_1 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule

module pynqz2_axi_mem_intercon_4
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wid,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arlen,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_rdata,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S01_ACLK,
    S01_ARESETN,
    S01_AXI_awaddr,
    S01_AXI_awburst,
    S01_AXI_awcache,
    S01_AXI_awlen,
    S01_AXI_awprot,
    S01_AXI_awready,
    S01_AXI_awsize,
    S01_AXI_awuser,
    S01_AXI_awvalid,
    S01_AXI_bready,
    S01_AXI_bresp,
    S01_AXI_bvalid,
    S01_AXI_wdata,
    S01_AXI_wlast,
    S01_AXI_wready,
    S01_AXI_wstrb,
    S01_AXI_wvalid,
    S02_ACLK,
    S02_ARESETN,
    S02_AXI_araddr,
    S02_AXI_arburst,
    S02_AXI_arcache,
    S02_AXI_arlen,
    S02_AXI_arprot,
    S02_AXI_arready,
    S02_AXI_arsize,
    S02_AXI_arvalid,
    S02_AXI_awaddr,
    S02_AXI_awburst,
    S02_AXI_awcache,
    S02_AXI_awlen,
    S02_AXI_awprot,
    S02_AXI_awready,
    S02_AXI_awsize,
    S02_AXI_awvalid,
    S02_AXI_bready,
    S02_AXI_bresp,
    S02_AXI_bvalid,
    S02_AXI_rdata,
    S02_AXI_rlast,
    S02_AXI_rready,
    S02_AXI_rresp,
    S02_AXI_rvalid,
    S02_AXI_wdata,
    S02_AXI_wlast,
    S02_AXI_wready,
    S02_AXI_wstrb,
    S02_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [1:0]M00_AXI_arid;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [1:0]M00_AXI_awid;
  output [3:0]M00_AXI_awlen;
  output [1:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [5:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [63:0]M00_AXI_rdata;
  input [5:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [63:0]M00_AXI_wdata;
  output [1:0]M00_AXI_wid;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [7:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arprot;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  output [31:0]S00_AXI_rdata;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input S01_ACLK;
  input S01_ARESETN;
  input [31:0]S01_AXI_awaddr;
  input [1:0]S01_AXI_awburst;
  input [3:0]S01_AXI_awcache;
  input [7:0]S01_AXI_awlen;
  input [2:0]S01_AXI_awprot;
  output S01_AXI_awready;
  input [2:0]S01_AXI_awsize;
  input [3:0]S01_AXI_awuser;
  input S01_AXI_awvalid;
  input S01_AXI_bready;
  output [1:0]S01_AXI_bresp;
  output S01_AXI_bvalid;
  input [63:0]S01_AXI_wdata;
  input S01_AXI_wlast;
  output S01_AXI_wready;
  input [7:0]S01_AXI_wstrb;
  input S01_AXI_wvalid;
  input S02_ACLK;
  input S02_ARESETN;
  input [31:0]S02_AXI_araddr;
  input [1:0]S02_AXI_arburst;
  input [3:0]S02_AXI_arcache;
  input [7:0]S02_AXI_arlen;
  input [2:0]S02_AXI_arprot;
  output S02_AXI_arready;
  input [2:0]S02_AXI_arsize;
  input S02_AXI_arvalid;
  input [31:0]S02_AXI_awaddr;
  input [1:0]S02_AXI_awburst;
  input [3:0]S02_AXI_awcache;
  input [7:0]S02_AXI_awlen;
  input [2:0]S02_AXI_awprot;
  output S02_AXI_awready;
  input [2:0]S02_AXI_awsize;
  input S02_AXI_awvalid;
  input S02_AXI_bready;
  output [1:0]S02_AXI_bresp;
  output S02_AXI_bvalid;
  output [31:0]S02_AXI_rdata;
  output S02_AXI_rlast;
  input S02_AXI_rready;
  output [1:0]S02_AXI_rresp;
  output S02_AXI_rvalid;
  input [31:0]S02_AXI_wdata;
  input S02_AXI_wlast;
  output S02_AXI_wready;
  input [3:0]S02_AXI_wstrb;
  input S02_AXI_wvalid;

  wire axi_mem_intercon_ACLK_net;
  wire axi_mem_intercon_ARESETN_net;
  wire [31:0]axi_mem_intercon_to_s00_couplers_ARADDR;
  wire [1:0]axi_mem_intercon_to_s00_couplers_ARBURST;
  wire [3:0]axi_mem_intercon_to_s00_couplers_ARCACHE;
  wire [7:0]axi_mem_intercon_to_s00_couplers_ARLEN;
  wire [2:0]axi_mem_intercon_to_s00_couplers_ARPROT;
  wire axi_mem_intercon_to_s00_couplers_ARREADY;
  wire [2:0]axi_mem_intercon_to_s00_couplers_ARSIZE;
  wire axi_mem_intercon_to_s00_couplers_ARVALID;
  wire [31:0]axi_mem_intercon_to_s00_couplers_RDATA;
  wire axi_mem_intercon_to_s00_couplers_RLAST;
  wire axi_mem_intercon_to_s00_couplers_RREADY;
  wire [1:0]axi_mem_intercon_to_s00_couplers_RRESP;
  wire axi_mem_intercon_to_s00_couplers_RVALID;
  wire [31:0]axi_mem_intercon_to_s01_couplers_AWADDR;
  wire [1:0]axi_mem_intercon_to_s01_couplers_AWBURST;
  wire [3:0]axi_mem_intercon_to_s01_couplers_AWCACHE;
  wire [7:0]axi_mem_intercon_to_s01_couplers_AWLEN;
  wire [2:0]axi_mem_intercon_to_s01_couplers_AWPROT;
  wire axi_mem_intercon_to_s01_couplers_AWREADY;
  wire [2:0]axi_mem_intercon_to_s01_couplers_AWSIZE;
  wire [3:0]axi_mem_intercon_to_s01_couplers_AWUSER;
  wire axi_mem_intercon_to_s01_couplers_AWVALID;
  wire axi_mem_intercon_to_s01_couplers_BREADY;
  wire [1:0]axi_mem_intercon_to_s01_couplers_BRESP;
  wire axi_mem_intercon_to_s01_couplers_BVALID;
  wire [63:0]axi_mem_intercon_to_s01_couplers_WDATA;
  wire axi_mem_intercon_to_s01_couplers_WLAST;
  wire axi_mem_intercon_to_s01_couplers_WREADY;
  wire [7:0]axi_mem_intercon_to_s01_couplers_WSTRB;
  wire axi_mem_intercon_to_s01_couplers_WVALID;
  wire [31:0]axi_mem_intercon_to_s02_couplers_ARADDR;
  wire [1:0]axi_mem_intercon_to_s02_couplers_ARBURST;
  wire [3:0]axi_mem_intercon_to_s02_couplers_ARCACHE;
  wire [7:0]axi_mem_intercon_to_s02_couplers_ARLEN;
  wire [2:0]axi_mem_intercon_to_s02_couplers_ARPROT;
  wire axi_mem_intercon_to_s02_couplers_ARREADY;
  wire [2:0]axi_mem_intercon_to_s02_couplers_ARSIZE;
  wire axi_mem_intercon_to_s02_couplers_ARVALID;
  wire [31:0]axi_mem_intercon_to_s02_couplers_AWADDR;
  wire [1:0]axi_mem_intercon_to_s02_couplers_AWBURST;
  wire [3:0]axi_mem_intercon_to_s02_couplers_AWCACHE;
  wire [7:0]axi_mem_intercon_to_s02_couplers_AWLEN;
  wire [2:0]axi_mem_intercon_to_s02_couplers_AWPROT;
  wire axi_mem_intercon_to_s02_couplers_AWREADY;
  wire [2:0]axi_mem_intercon_to_s02_couplers_AWSIZE;
  wire axi_mem_intercon_to_s02_couplers_AWVALID;
  wire axi_mem_intercon_to_s02_couplers_BREADY;
  wire [1:0]axi_mem_intercon_to_s02_couplers_BRESP;
  wire axi_mem_intercon_to_s02_couplers_BVALID;
  wire [31:0]axi_mem_intercon_to_s02_couplers_RDATA;
  wire axi_mem_intercon_to_s02_couplers_RLAST;
  wire axi_mem_intercon_to_s02_couplers_RREADY;
  wire [1:0]axi_mem_intercon_to_s02_couplers_RRESP;
  wire axi_mem_intercon_to_s02_couplers_RVALID;
  wire [31:0]axi_mem_intercon_to_s02_couplers_WDATA;
  wire axi_mem_intercon_to_s02_couplers_WLAST;
  wire axi_mem_intercon_to_s02_couplers_WREADY;
  wire [3:0]axi_mem_intercon_to_s02_couplers_WSTRB;
  wire axi_mem_intercon_to_s02_couplers_WVALID;
  wire [31:0]m00_couplers_to_axi_mem_intercon_ARADDR;
  wire [1:0]m00_couplers_to_axi_mem_intercon_ARBURST;
  wire [3:0]m00_couplers_to_axi_mem_intercon_ARCACHE;
  wire [1:0]m00_couplers_to_axi_mem_intercon_ARID;
  wire [3:0]m00_couplers_to_axi_mem_intercon_ARLEN;
  wire [1:0]m00_couplers_to_axi_mem_intercon_ARLOCK;
  wire [2:0]m00_couplers_to_axi_mem_intercon_ARPROT;
  wire [3:0]m00_couplers_to_axi_mem_intercon_ARQOS;
  wire m00_couplers_to_axi_mem_intercon_ARREADY;
  wire [2:0]m00_couplers_to_axi_mem_intercon_ARSIZE;
  wire m00_couplers_to_axi_mem_intercon_ARVALID;
  wire [31:0]m00_couplers_to_axi_mem_intercon_AWADDR;
  wire [1:0]m00_couplers_to_axi_mem_intercon_AWBURST;
  wire [3:0]m00_couplers_to_axi_mem_intercon_AWCACHE;
  wire [1:0]m00_couplers_to_axi_mem_intercon_AWID;
  wire [3:0]m00_couplers_to_axi_mem_intercon_AWLEN;
  wire [1:0]m00_couplers_to_axi_mem_intercon_AWLOCK;
  wire [2:0]m00_couplers_to_axi_mem_intercon_AWPROT;
  wire [3:0]m00_couplers_to_axi_mem_intercon_AWQOS;
  wire m00_couplers_to_axi_mem_intercon_AWREADY;
  wire [2:0]m00_couplers_to_axi_mem_intercon_AWSIZE;
  wire m00_couplers_to_axi_mem_intercon_AWVALID;
  wire [5:0]m00_couplers_to_axi_mem_intercon_BID;
  wire m00_couplers_to_axi_mem_intercon_BREADY;
  wire [1:0]m00_couplers_to_axi_mem_intercon_BRESP;
  wire m00_couplers_to_axi_mem_intercon_BVALID;
  wire [63:0]m00_couplers_to_axi_mem_intercon_RDATA;
  wire [5:0]m00_couplers_to_axi_mem_intercon_RID;
  wire m00_couplers_to_axi_mem_intercon_RLAST;
  wire m00_couplers_to_axi_mem_intercon_RREADY;
  wire [1:0]m00_couplers_to_axi_mem_intercon_RRESP;
  wire m00_couplers_to_axi_mem_intercon_RVALID;
  wire [63:0]m00_couplers_to_axi_mem_intercon_WDATA;
  wire [1:0]m00_couplers_to_axi_mem_intercon_WID;
  wire m00_couplers_to_axi_mem_intercon_WLAST;
  wire m00_couplers_to_axi_mem_intercon_WREADY;
  wire [7:0]m00_couplers_to_axi_mem_intercon_WSTRB;
  wire m00_couplers_to_axi_mem_intercon_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [1:0]s00_couplers_to_xbar_ARBURST;
  wire [3:0]s00_couplers_to_xbar_ARCACHE;
  wire [7:0]s00_couplers_to_xbar_ARLEN;
  wire [0:0]s00_couplers_to_xbar_ARLOCK;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [3:0]s00_couplers_to_xbar_ARQOS;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [2:0]s00_couplers_to_xbar_ARSIZE;
  wire s00_couplers_to_xbar_ARVALID;
  wire [63:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RLAST;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s01_couplers_to_xbar_AWADDR;
  wire [1:0]s01_couplers_to_xbar_AWBURST;
  wire [3:0]s01_couplers_to_xbar_AWCACHE;
  wire [7:0]s01_couplers_to_xbar_AWLEN;
  wire [2:0]s01_couplers_to_xbar_AWPROT;
  wire [1:1]s01_couplers_to_xbar_AWREADY;
  wire [2:0]s01_couplers_to_xbar_AWSIZE;
  wire [3:0]s01_couplers_to_xbar_AWUSER;
  wire s01_couplers_to_xbar_AWVALID;
  wire s01_couplers_to_xbar_BREADY;
  wire [3:2]s01_couplers_to_xbar_BRESP;
  wire [1:1]s01_couplers_to_xbar_BVALID;
  wire [63:0]s01_couplers_to_xbar_WDATA;
  wire s01_couplers_to_xbar_WLAST;
  wire [1:1]s01_couplers_to_xbar_WREADY;
  wire [7:0]s01_couplers_to_xbar_WSTRB;
  wire s01_couplers_to_xbar_WVALID;
  wire [31:0]s02_couplers_to_xbar_ARADDR;
  wire [1:0]s02_couplers_to_xbar_ARBURST;
  wire [3:0]s02_couplers_to_xbar_ARCACHE;
  wire [7:0]s02_couplers_to_xbar_ARLEN;
  wire [0:0]s02_couplers_to_xbar_ARLOCK;
  wire [2:0]s02_couplers_to_xbar_ARPROT;
  wire [3:0]s02_couplers_to_xbar_ARQOS;
  wire [2:2]s02_couplers_to_xbar_ARREADY;
  wire [2:0]s02_couplers_to_xbar_ARSIZE;
  wire s02_couplers_to_xbar_ARVALID;
  wire [31:0]s02_couplers_to_xbar_AWADDR;
  wire [1:0]s02_couplers_to_xbar_AWBURST;
  wire [3:0]s02_couplers_to_xbar_AWCACHE;
  wire [7:0]s02_couplers_to_xbar_AWLEN;
  wire [0:0]s02_couplers_to_xbar_AWLOCK;
  wire [2:0]s02_couplers_to_xbar_AWPROT;
  wire [3:0]s02_couplers_to_xbar_AWQOS;
  wire [2:2]s02_couplers_to_xbar_AWREADY;
  wire [2:0]s02_couplers_to_xbar_AWSIZE;
  wire s02_couplers_to_xbar_AWVALID;
  wire s02_couplers_to_xbar_BREADY;
  wire [5:4]s02_couplers_to_xbar_BRESP;
  wire [2:2]s02_couplers_to_xbar_BVALID;
  wire [191:128]s02_couplers_to_xbar_RDATA;
  wire [2:2]s02_couplers_to_xbar_RLAST;
  wire s02_couplers_to_xbar_RREADY;
  wire [5:4]s02_couplers_to_xbar_RRESP;
  wire [2:2]s02_couplers_to_xbar_RVALID;
  wire [63:0]s02_couplers_to_xbar_WDATA;
  wire s02_couplers_to_xbar_WLAST;
  wire [2:2]s02_couplers_to_xbar_WREADY;
  wire [7:0]s02_couplers_to_xbar_WSTRB;
  wire s02_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [1:0]xbar_to_m00_couplers_ARBURST;
  wire [3:0]xbar_to_m00_couplers_ARCACHE;
  wire [1:0]xbar_to_m00_couplers_ARID;
  wire [7:0]xbar_to_m00_couplers_ARLEN;
  wire [0:0]xbar_to_m00_couplers_ARLOCK;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire [3:0]xbar_to_m00_couplers_ARQOS;
  wire xbar_to_m00_couplers_ARREADY;
  wire [3:0]xbar_to_m00_couplers_ARREGION;
  wire [2:0]xbar_to_m00_couplers_ARSIZE;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [1:0]xbar_to_m00_couplers_AWBURST;
  wire [3:0]xbar_to_m00_couplers_AWCACHE;
  wire [1:0]xbar_to_m00_couplers_AWID;
  wire [7:0]xbar_to_m00_couplers_AWLEN;
  wire [0:0]xbar_to_m00_couplers_AWLOCK;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire [3:0]xbar_to_m00_couplers_AWQOS;
  wire xbar_to_m00_couplers_AWREADY;
  wire [3:0]xbar_to_m00_couplers_AWREGION;
  wire [2:0]xbar_to_m00_couplers_AWSIZE;
  wire [3:0]xbar_to_m00_couplers_AWUSER;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [1:0]xbar_to_m00_couplers_BID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [63:0]xbar_to_m00_couplers_RDATA;
  wire [1:0]xbar_to_m00_couplers_RID;
  wire xbar_to_m00_couplers_RLAST;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [63:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WLAST;
  wire xbar_to_m00_couplers_WREADY;
  wire [7:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [2:0]NLW_xbar_s_axi_arready_UNCONNECTED;
  wire [2:0]NLW_xbar_s_axi_awready_UNCONNECTED;
  wire [5:0]NLW_xbar_s_axi_bresp_UNCONNECTED;
  wire [2:0]NLW_xbar_s_axi_bvalid_UNCONNECTED;
  wire [191:0]NLW_xbar_s_axi_rdata_UNCONNECTED;
  wire [2:0]NLW_xbar_s_axi_rlast_UNCONNECTED;
  wire [5:0]NLW_xbar_s_axi_rresp_UNCONNECTED;
  wire [2:0]NLW_xbar_s_axi_rvalid_UNCONNECTED;
  wire [2:0]NLW_xbar_s_axi_wready_UNCONNECTED;

  assign M00_AXI_araddr[31:0] = m00_couplers_to_axi_mem_intercon_ARADDR;
  assign M00_AXI_arburst[1:0] = m00_couplers_to_axi_mem_intercon_ARBURST;
  assign M00_AXI_arcache[3:0] = m00_couplers_to_axi_mem_intercon_ARCACHE;
  assign M00_AXI_arid[1:0] = m00_couplers_to_axi_mem_intercon_ARID;
  assign M00_AXI_arlen[3:0] = m00_couplers_to_axi_mem_intercon_ARLEN;
  assign M00_AXI_arlock[1:0] = m00_couplers_to_axi_mem_intercon_ARLOCK;
  assign M00_AXI_arprot[2:0] = m00_couplers_to_axi_mem_intercon_ARPROT;
  assign M00_AXI_arqos[3:0] = m00_couplers_to_axi_mem_intercon_ARQOS;
  assign M00_AXI_arsize[2:0] = m00_couplers_to_axi_mem_intercon_ARSIZE;
  assign M00_AXI_arvalid = m00_couplers_to_axi_mem_intercon_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_axi_mem_intercon_AWADDR;
  assign M00_AXI_awburst[1:0] = m00_couplers_to_axi_mem_intercon_AWBURST;
  assign M00_AXI_awcache[3:0] = m00_couplers_to_axi_mem_intercon_AWCACHE;
  assign M00_AXI_awid[1:0] = m00_couplers_to_axi_mem_intercon_AWID;
  assign M00_AXI_awlen[3:0] = m00_couplers_to_axi_mem_intercon_AWLEN;
  assign M00_AXI_awlock[1:0] = m00_couplers_to_axi_mem_intercon_AWLOCK;
  assign M00_AXI_awprot[2:0] = m00_couplers_to_axi_mem_intercon_AWPROT;
  assign M00_AXI_awqos[3:0] = m00_couplers_to_axi_mem_intercon_AWQOS;
  assign M00_AXI_awsize[2:0] = m00_couplers_to_axi_mem_intercon_AWSIZE;
  assign M00_AXI_awvalid = m00_couplers_to_axi_mem_intercon_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_axi_mem_intercon_BREADY;
  assign M00_AXI_rready = m00_couplers_to_axi_mem_intercon_RREADY;
  assign M00_AXI_wdata[63:0] = m00_couplers_to_axi_mem_intercon_WDATA;
  assign M00_AXI_wid[1:0] = m00_couplers_to_axi_mem_intercon_WID;
  assign M00_AXI_wlast = m00_couplers_to_axi_mem_intercon_WLAST;
  assign M00_AXI_wstrb[7:0] = m00_couplers_to_axi_mem_intercon_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_axi_mem_intercon_WVALID;
  assign S00_AXI_arready = axi_mem_intercon_to_s00_couplers_ARREADY;
  assign S00_AXI_rdata[31:0] = axi_mem_intercon_to_s00_couplers_RDATA;
  assign S00_AXI_rlast = axi_mem_intercon_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_mem_intercon_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_mem_intercon_to_s00_couplers_RVALID;
  assign S01_AXI_awready = axi_mem_intercon_to_s01_couplers_AWREADY;
  assign S01_AXI_bresp[1:0] = axi_mem_intercon_to_s01_couplers_BRESP;
  assign S01_AXI_bvalid = axi_mem_intercon_to_s01_couplers_BVALID;
  assign S01_AXI_wready = axi_mem_intercon_to_s01_couplers_WREADY;
  assign S02_AXI_arready = axi_mem_intercon_to_s02_couplers_ARREADY;
  assign S02_AXI_awready = axi_mem_intercon_to_s02_couplers_AWREADY;
  assign S02_AXI_bresp[1:0] = axi_mem_intercon_to_s02_couplers_BRESP;
  assign S02_AXI_bvalid = axi_mem_intercon_to_s02_couplers_BVALID;
  assign S02_AXI_rdata[31:0] = axi_mem_intercon_to_s02_couplers_RDATA;
  assign S02_AXI_rlast = axi_mem_intercon_to_s02_couplers_RLAST;
  assign S02_AXI_rresp[1:0] = axi_mem_intercon_to_s02_couplers_RRESP;
  assign S02_AXI_rvalid = axi_mem_intercon_to_s02_couplers_RVALID;
  assign S02_AXI_wready = axi_mem_intercon_to_s02_couplers_WREADY;
  assign axi_mem_intercon_ACLK_net = ACLK;
  assign axi_mem_intercon_ARESETN_net = ARESETN;
  assign axi_mem_intercon_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_mem_intercon_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_mem_intercon_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_mem_intercon_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign axi_mem_intercon_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_mem_intercon_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_mem_intercon_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_mem_intercon_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_mem_intercon_to_s01_couplers_AWADDR = S01_AXI_awaddr[31:0];
  assign axi_mem_intercon_to_s01_couplers_AWBURST = S01_AXI_awburst[1:0];
  assign axi_mem_intercon_to_s01_couplers_AWCACHE = S01_AXI_awcache[3:0];
  assign axi_mem_intercon_to_s01_couplers_AWLEN = S01_AXI_awlen[7:0];
  assign axi_mem_intercon_to_s01_couplers_AWPROT = S01_AXI_awprot[2:0];
  assign axi_mem_intercon_to_s01_couplers_AWSIZE = S01_AXI_awsize[2:0];
  assign axi_mem_intercon_to_s01_couplers_AWUSER = S01_AXI_awuser[3:0];
  assign axi_mem_intercon_to_s01_couplers_AWVALID = S01_AXI_awvalid;
  assign axi_mem_intercon_to_s01_couplers_BREADY = S01_AXI_bready;
  assign axi_mem_intercon_to_s01_couplers_WDATA = S01_AXI_wdata[63:0];
  assign axi_mem_intercon_to_s01_couplers_WLAST = S01_AXI_wlast;
  assign axi_mem_intercon_to_s01_couplers_WSTRB = S01_AXI_wstrb[7:0];
  assign axi_mem_intercon_to_s01_couplers_WVALID = S01_AXI_wvalid;
  assign axi_mem_intercon_to_s02_couplers_ARADDR = S02_AXI_araddr[31:0];
  assign axi_mem_intercon_to_s02_couplers_ARBURST = S02_AXI_arburst[1:0];
  assign axi_mem_intercon_to_s02_couplers_ARCACHE = S02_AXI_arcache[3:0];
  assign axi_mem_intercon_to_s02_couplers_ARLEN = S02_AXI_arlen[7:0];
  assign axi_mem_intercon_to_s02_couplers_ARPROT = S02_AXI_arprot[2:0];
  assign axi_mem_intercon_to_s02_couplers_ARSIZE = S02_AXI_arsize[2:0];
  assign axi_mem_intercon_to_s02_couplers_ARVALID = S02_AXI_arvalid;
  assign axi_mem_intercon_to_s02_couplers_AWADDR = S02_AXI_awaddr[31:0];
  assign axi_mem_intercon_to_s02_couplers_AWBURST = S02_AXI_awburst[1:0];
  assign axi_mem_intercon_to_s02_couplers_AWCACHE = S02_AXI_awcache[3:0];
  assign axi_mem_intercon_to_s02_couplers_AWLEN = S02_AXI_awlen[7:0];
  assign axi_mem_intercon_to_s02_couplers_AWPROT = S02_AXI_awprot[2:0];
  assign axi_mem_intercon_to_s02_couplers_AWSIZE = S02_AXI_awsize[2:0];
  assign axi_mem_intercon_to_s02_couplers_AWVALID = S02_AXI_awvalid;
  assign axi_mem_intercon_to_s02_couplers_BREADY = S02_AXI_bready;
  assign axi_mem_intercon_to_s02_couplers_RREADY = S02_AXI_rready;
  assign axi_mem_intercon_to_s02_couplers_WDATA = S02_AXI_wdata[31:0];
  assign axi_mem_intercon_to_s02_couplers_WLAST = S02_AXI_wlast;
  assign axi_mem_intercon_to_s02_couplers_WSTRB = S02_AXI_wstrb[3:0];
  assign axi_mem_intercon_to_s02_couplers_WVALID = S02_AXI_wvalid;
  assign m00_couplers_to_axi_mem_intercon_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_axi_mem_intercon_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_axi_mem_intercon_BID = M00_AXI_bid[5:0];
  assign m00_couplers_to_axi_mem_intercon_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_mem_intercon_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_axi_mem_intercon_RDATA = M00_AXI_rdata[63:0];
  assign m00_couplers_to_axi_mem_intercon_RID = M00_AXI_rid[5:0];
  assign m00_couplers_to_axi_mem_intercon_RLAST = M00_AXI_rlast;
  assign m00_couplers_to_axi_mem_intercon_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_mem_intercon_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_axi_mem_intercon_WREADY = M00_AXI_wready;
  m00_couplers_imp_1YRW0US m00_couplers
       (.M_ACLK(axi_mem_intercon_ACLK_net),
        .M_ARESETN(axi_mem_intercon_ARESETN_net),
        .M_AXI_araddr(m00_couplers_to_axi_mem_intercon_ARADDR),
        .M_AXI_arburst(m00_couplers_to_axi_mem_intercon_ARBURST),
        .M_AXI_arcache(m00_couplers_to_axi_mem_intercon_ARCACHE),
        .M_AXI_arid(m00_couplers_to_axi_mem_intercon_ARID),
        .M_AXI_arlen(m00_couplers_to_axi_mem_intercon_ARLEN),
        .M_AXI_arlock(m00_couplers_to_axi_mem_intercon_ARLOCK),
        .M_AXI_arprot(m00_couplers_to_axi_mem_intercon_ARPROT),
        .M_AXI_arqos(m00_couplers_to_axi_mem_intercon_ARQOS),
        .M_AXI_arready(m00_couplers_to_axi_mem_intercon_ARREADY),
        .M_AXI_arsize(m00_couplers_to_axi_mem_intercon_ARSIZE),
        .M_AXI_arvalid(m00_couplers_to_axi_mem_intercon_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_mem_intercon_AWADDR),
        .M_AXI_awburst(m00_couplers_to_axi_mem_intercon_AWBURST),
        .M_AXI_awcache(m00_couplers_to_axi_mem_intercon_AWCACHE),
        .M_AXI_awid(m00_couplers_to_axi_mem_intercon_AWID),
        .M_AXI_awlen(m00_couplers_to_axi_mem_intercon_AWLEN),
        .M_AXI_awlock(m00_couplers_to_axi_mem_intercon_AWLOCK),
        .M_AXI_awprot(m00_couplers_to_axi_mem_intercon_AWPROT),
        .M_AXI_awqos(m00_couplers_to_axi_mem_intercon_AWQOS),
        .M_AXI_awready(m00_couplers_to_axi_mem_intercon_AWREADY),
        .M_AXI_awsize(m00_couplers_to_axi_mem_intercon_AWSIZE),
        .M_AXI_awvalid(m00_couplers_to_axi_mem_intercon_AWVALID),
        .M_AXI_bid(m00_couplers_to_axi_mem_intercon_BID),
        .M_AXI_bready(m00_couplers_to_axi_mem_intercon_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_mem_intercon_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_mem_intercon_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_mem_intercon_RDATA),
        .M_AXI_rid(m00_couplers_to_axi_mem_intercon_RID),
        .M_AXI_rlast(m00_couplers_to_axi_mem_intercon_RLAST),
        .M_AXI_rready(m00_couplers_to_axi_mem_intercon_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_mem_intercon_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_mem_intercon_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_mem_intercon_WDATA),
        .M_AXI_wid(m00_couplers_to_axi_mem_intercon_WID),
        .M_AXI_wlast(m00_couplers_to_axi_mem_intercon_WLAST),
        .M_AXI_wready(m00_couplers_to_axi_mem_intercon_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_mem_intercon_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_mem_intercon_WVALID),
        .S_ACLK(axi_mem_intercon_ACLK_net),
        .S_ARESETN(axi_mem_intercon_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m00_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m00_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m00_couplers_ARID),
        .S_AXI_arlen(xbar_to_m00_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m00_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m00_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m00_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m00_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m00_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m00_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m00_couplers_AWID),
        .S_AXI_awlen(xbar_to_m00_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m00_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m00_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m00_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m00_couplers_AWSIZE),
        .S_AXI_awuser(xbar_to_m00_couplers_AWUSER),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m00_couplers_BID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rid(xbar_to_m00_couplers_RID),
        .S_AXI_rlast(xbar_to_m00_couplers_RLAST),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m00_couplers_WLAST),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  s00_couplers_imp_1JNWH51 s00_couplers
       (.M_ACLK(axi_mem_intercon_ACLK_net),
        .M_ARESETN(axi_mem_intercon_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s00_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s00_couplers_to_xbar_ARCACHE),
        .M_AXI_arlen(s00_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s00_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s00_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s00_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rlast(s00_couplers_to_xbar_RLAST),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .S_ACLK(axi_mem_intercon_ACLK_net),
        .S_ARESETN(axi_mem_intercon_ARESETN_net),
        .S_AXI_araddr(axi_mem_intercon_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_mem_intercon_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_mem_intercon_to_s00_couplers_ARCACHE),
        .S_AXI_arlen(axi_mem_intercon_to_s00_couplers_ARLEN),
        .S_AXI_arprot(axi_mem_intercon_to_s00_couplers_ARPROT),
        .S_AXI_arready(axi_mem_intercon_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_mem_intercon_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_mem_intercon_to_s00_couplers_ARVALID),
        .S_AXI_rdata(axi_mem_intercon_to_s00_couplers_RDATA),
        .S_AXI_rlast(axi_mem_intercon_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_mem_intercon_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_mem_intercon_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_mem_intercon_to_s00_couplers_RVALID));
  s01_couplers_imp_SKF2VO s01_couplers
       (.M_ACLK(axi_mem_intercon_ACLK_net),
        .M_ARESETN(axi_mem_intercon_ARESETN_net),
        .M_AXI_awaddr(s01_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s01_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s01_couplers_to_xbar_AWCACHE),
        .M_AXI_awlen(s01_couplers_to_xbar_AWLEN),
        .M_AXI_awprot(s01_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s01_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s01_couplers_to_xbar_AWSIZE),
        .M_AXI_awuser(s01_couplers_to_xbar_AWUSER),
        .M_AXI_awvalid(s01_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s01_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s01_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s01_couplers_to_xbar_BVALID),
        .M_AXI_wdata(s01_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s01_couplers_to_xbar_WLAST),
        .M_AXI_wready(s01_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s01_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s01_couplers_to_xbar_WVALID),
        .S_ACLK(axi_mem_intercon_ACLK_net),
        .S_ARESETN(axi_mem_intercon_ARESETN_net),
        .S_AXI_awaddr(axi_mem_intercon_to_s01_couplers_AWADDR),
        .S_AXI_awburst(axi_mem_intercon_to_s01_couplers_AWBURST),
        .S_AXI_awcache(axi_mem_intercon_to_s01_couplers_AWCACHE),
        .S_AXI_awlen(axi_mem_intercon_to_s01_couplers_AWLEN),
        .S_AXI_awprot(axi_mem_intercon_to_s01_couplers_AWPROT),
        .S_AXI_awready(axi_mem_intercon_to_s01_couplers_AWREADY),
        .S_AXI_awsize(axi_mem_intercon_to_s01_couplers_AWSIZE),
        .S_AXI_awuser(axi_mem_intercon_to_s01_couplers_AWUSER),
        .S_AXI_awvalid(axi_mem_intercon_to_s01_couplers_AWVALID),
        .S_AXI_bready(axi_mem_intercon_to_s01_couplers_BREADY),
        .S_AXI_bresp(axi_mem_intercon_to_s01_couplers_BRESP),
        .S_AXI_bvalid(axi_mem_intercon_to_s01_couplers_BVALID),
        .S_AXI_wdata(axi_mem_intercon_to_s01_couplers_WDATA),
        .S_AXI_wlast(axi_mem_intercon_to_s01_couplers_WLAST),
        .S_AXI_wready(axi_mem_intercon_to_s01_couplers_WREADY),
        .S_AXI_wstrb(axi_mem_intercon_to_s01_couplers_WSTRB),
        .S_AXI_wvalid(axi_mem_intercon_to_s01_couplers_WVALID));
  s02_couplers_imp_LZIY7A s02_couplers
       (.M_ACLK(axi_mem_intercon_ACLK_net),
        .M_ARESETN(axi_mem_intercon_ARESETN_net),
        .M_AXI_araddr(s02_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s02_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s02_couplers_to_xbar_ARCACHE),
        .M_AXI_arlen(s02_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s02_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s02_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s02_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s02_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s02_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s02_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s02_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s02_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s02_couplers_to_xbar_AWCACHE),
        .M_AXI_awlen(s02_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s02_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s02_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s02_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s02_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s02_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s02_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s02_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s02_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s02_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s02_couplers_to_xbar_RDATA),
        .M_AXI_rlast(s02_couplers_to_xbar_RLAST),
        .M_AXI_rready(s02_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s02_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s02_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s02_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s02_couplers_to_xbar_WLAST),
        .M_AXI_wready(s02_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s02_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s02_couplers_to_xbar_WVALID),
        .S_ACLK(axi_mem_intercon_ACLK_net),
        .S_ARESETN(axi_mem_intercon_ARESETN_net),
        .S_AXI_araddr(axi_mem_intercon_to_s02_couplers_ARADDR),
        .S_AXI_arburst(axi_mem_intercon_to_s02_couplers_ARBURST),
        .S_AXI_arcache(axi_mem_intercon_to_s02_couplers_ARCACHE),
        .S_AXI_arlen(axi_mem_intercon_to_s02_couplers_ARLEN),
        .S_AXI_arprot(axi_mem_intercon_to_s02_couplers_ARPROT),
        .S_AXI_arready(axi_mem_intercon_to_s02_couplers_ARREADY),
        .S_AXI_arsize(axi_mem_intercon_to_s02_couplers_ARSIZE),
        .S_AXI_arvalid(axi_mem_intercon_to_s02_couplers_ARVALID),
        .S_AXI_awaddr(axi_mem_intercon_to_s02_couplers_AWADDR),
        .S_AXI_awburst(axi_mem_intercon_to_s02_couplers_AWBURST),
        .S_AXI_awcache(axi_mem_intercon_to_s02_couplers_AWCACHE),
        .S_AXI_awlen(axi_mem_intercon_to_s02_couplers_AWLEN),
        .S_AXI_awprot(axi_mem_intercon_to_s02_couplers_AWPROT),
        .S_AXI_awready(axi_mem_intercon_to_s02_couplers_AWREADY),
        .S_AXI_awsize(axi_mem_intercon_to_s02_couplers_AWSIZE),
        .S_AXI_awvalid(axi_mem_intercon_to_s02_couplers_AWVALID),
        .S_AXI_bready(axi_mem_intercon_to_s02_couplers_BREADY),
        .S_AXI_bresp(axi_mem_intercon_to_s02_couplers_BRESP),
        .S_AXI_bvalid(axi_mem_intercon_to_s02_couplers_BVALID),
        .S_AXI_rdata(axi_mem_intercon_to_s02_couplers_RDATA),
        .S_AXI_rlast(axi_mem_intercon_to_s02_couplers_RLAST),
        .S_AXI_rready(axi_mem_intercon_to_s02_couplers_RREADY),
        .S_AXI_rresp(axi_mem_intercon_to_s02_couplers_RRESP),
        .S_AXI_rvalid(axi_mem_intercon_to_s02_couplers_RVALID),
        .S_AXI_wdata(axi_mem_intercon_to_s02_couplers_WDATA),
        .S_AXI_wlast(axi_mem_intercon_to_s02_couplers_WLAST),
        .S_AXI_wready(axi_mem_intercon_to_s02_couplers_WREADY),
        .S_AXI_wstrb(axi_mem_intercon_to_s02_couplers_WSTRB),
        .S_AXI_wvalid(axi_mem_intercon_to_s02_couplers_WVALID));
  pynqz2_xbar_3 xbar
       (.aclk(axi_mem_intercon_ACLK_net),
        .aresetn(axi_mem_intercon_ARESETN_net),
        .m_axi_araddr(xbar_to_m00_couplers_ARADDR),
        .m_axi_arburst(xbar_to_m00_couplers_ARBURST),
        .m_axi_arcache(xbar_to_m00_couplers_ARCACHE),
        .m_axi_arid(xbar_to_m00_couplers_ARID),
        .m_axi_arlen(xbar_to_m00_couplers_ARLEN),
        .m_axi_arlock(xbar_to_m00_couplers_ARLOCK),
        .m_axi_arprot(xbar_to_m00_couplers_ARPROT),
        .m_axi_arqos(xbar_to_m00_couplers_ARQOS),
        .m_axi_arready(xbar_to_m00_couplers_ARREADY),
        .m_axi_arregion(xbar_to_m00_couplers_ARREGION),
        .m_axi_arsize(xbar_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(xbar_to_m00_couplers_ARVALID),
        .m_axi_awaddr(xbar_to_m00_couplers_AWADDR),
        .m_axi_awburst(xbar_to_m00_couplers_AWBURST),
        .m_axi_awcache(xbar_to_m00_couplers_AWCACHE),
        .m_axi_awid(xbar_to_m00_couplers_AWID),
        .m_axi_awlen(xbar_to_m00_couplers_AWLEN),
        .m_axi_awlock(xbar_to_m00_couplers_AWLOCK),
        .m_axi_awprot(xbar_to_m00_couplers_AWPROT),
        .m_axi_awqos(xbar_to_m00_couplers_AWQOS),
        .m_axi_awready(xbar_to_m00_couplers_AWREADY),
        .m_axi_awregion(xbar_to_m00_couplers_AWREGION),
        .m_axi_awsize(xbar_to_m00_couplers_AWSIZE),
        .m_axi_awuser(xbar_to_m00_couplers_AWUSER),
        .m_axi_awvalid(xbar_to_m00_couplers_AWVALID),
        .m_axi_bid(xbar_to_m00_couplers_BID),
        .m_axi_bready(xbar_to_m00_couplers_BREADY),
        .m_axi_bresp(xbar_to_m00_couplers_BRESP),
        .m_axi_bvalid(xbar_to_m00_couplers_BVALID),
        .m_axi_rdata(xbar_to_m00_couplers_RDATA),
        .m_axi_rid(xbar_to_m00_couplers_RID),
        .m_axi_rlast(xbar_to_m00_couplers_RLAST),
        .m_axi_rready(xbar_to_m00_couplers_RREADY),
        .m_axi_rresp(xbar_to_m00_couplers_RRESP),
        .m_axi_rvalid(xbar_to_m00_couplers_RVALID),
        .m_axi_wdata(xbar_to_m00_couplers_WDATA),
        .m_axi_wlast(xbar_to_m00_couplers_WLAST),
        .m_axi_wready(xbar_to_m00_couplers_WREADY),
        .m_axi_wstrb(xbar_to_m00_couplers_WSTRB),
        .m_axi_wvalid(xbar_to_m00_couplers_WVALID),
        .s_axi_araddr({s02_couplers_to_xbar_ARADDR,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARADDR}),
        .s_axi_arburst({s02_couplers_to_xbar_ARBURST,1'b0,1'b0,s00_couplers_to_xbar_ARBURST}),
        .s_axi_arcache({s02_couplers_to_xbar_ARCACHE,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARCACHE}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({s02_couplers_to_xbar_ARLEN,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARLEN}),
        .s_axi_arlock({s02_couplers_to_xbar_ARLOCK,1'b0,s00_couplers_to_xbar_ARLOCK}),
        .s_axi_arprot({s02_couplers_to_xbar_ARPROT,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARPROT}),
        .s_axi_arqos({s02_couplers_to_xbar_ARQOS,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARQOS}),
        .s_axi_arready({s02_couplers_to_xbar_ARREADY,NLW_xbar_s_axi_arready_UNCONNECTED[1],s00_couplers_to_xbar_ARREADY}),
        .s_axi_arsize({s02_couplers_to_xbar_ARSIZE,1'b0,1'b0,1'b1,s00_couplers_to_xbar_ARSIZE}),
        .s_axi_arvalid({s02_couplers_to_xbar_ARVALID,1'b0,s00_couplers_to_xbar_ARVALID}),
        .s_axi_awaddr({s02_couplers_to_xbar_AWADDR,s01_couplers_to_xbar_AWADDR,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({s02_couplers_to_xbar_AWBURST,s01_couplers_to_xbar_AWBURST,1'b0,1'b1}),
        .s_axi_awcache({s02_couplers_to_xbar_AWCACHE,s01_couplers_to_xbar_AWCACHE,1'b0,1'b0,1'b1,1'b1}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({s02_couplers_to_xbar_AWLEN,s01_couplers_to_xbar_AWLEN,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock({s02_couplers_to_xbar_AWLOCK,1'b0,1'b0}),
        .s_axi_awprot({s02_couplers_to_xbar_AWPROT,s01_couplers_to_xbar_AWPROT,1'b0,1'b0,1'b0}),
        .s_axi_awqos({s02_couplers_to_xbar_AWQOS,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready({s02_couplers_to_xbar_AWREADY,s01_couplers_to_xbar_AWREADY,NLW_xbar_s_axi_awready_UNCONNECTED[0]}),
        .s_axi_awsize({s02_couplers_to_xbar_AWSIZE,s01_couplers_to_xbar_AWSIZE,1'b0,1'b1,1'b1}),
        .s_axi_awuser({1'b0,1'b0,1'b0,1'b0,s01_couplers_to_xbar_AWUSER,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awvalid({s02_couplers_to_xbar_AWVALID,s01_couplers_to_xbar_AWVALID,1'b0}),
        .s_axi_bready({s02_couplers_to_xbar_BREADY,s01_couplers_to_xbar_BREADY,1'b0}),
        .s_axi_bresp({s02_couplers_to_xbar_BRESP,s01_couplers_to_xbar_BRESP,NLW_xbar_s_axi_bresp_UNCONNECTED[1:0]}),
        .s_axi_bvalid({s02_couplers_to_xbar_BVALID,s01_couplers_to_xbar_BVALID,NLW_xbar_s_axi_bvalid_UNCONNECTED[0]}),
        .s_axi_rdata({s02_couplers_to_xbar_RDATA,NLW_xbar_s_axi_rdata_UNCONNECTED[127:64],s00_couplers_to_xbar_RDATA}),
        .s_axi_rlast({s02_couplers_to_xbar_RLAST,NLW_xbar_s_axi_rlast_UNCONNECTED[1],s00_couplers_to_xbar_RLAST}),
        .s_axi_rready({s02_couplers_to_xbar_RREADY,1'b0,s00_couplers_to_xbar_RREADY}),
        .s_axi_rresp({s02_couplers_to_xbar_RRESP,NLW_xbar_s_axi_rresp_UNCONNECTED[3:2],s00_couplers_to_xbar_RRESP}),
        .s_axi_rvalid({s02_couplers_to_xbar_RVALID,NLW_xbar_s_axi_rvalid_UNCONNECTED[1],s00_couplers_to_xbar_RVALID}),
        .s_axi_wdata({s02_couplers_to_xbar_WDATA,s01_couplers_to_xbar_WDATA,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast({s02_couplers_to_xbar_WLAST,s01_couplers_to_xbar_WLAST,1'b0}),
        .s_axi_wready({s02_couplers_to_xbar_WREADY,s01_couplers_to_xbar_WREADY,NLW_xbar_s_axi_wready_UNCONNECTED[0]}),
        .s_axi_wstrb({s02_couplers_to_xbar_WSTRB,s01_couplers_to_xbar_WSTRB,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axi_wvalid({s02_couplers_to_xbar_WVALID,s01_couplers_to_xbar_WVALID,1'b0}));
endmodule

module pynqz2_axis_interconnect_0_0
   (ACLK,
    ARESETN,
    M00_AXIS_ACLK,
    M00_AXIS_ARESETN,
    M00_AXIS_tdata,
    M00_AXIS_tdest,
    M00_AXIS_tid,
    M00_AXIS_tlast,
    M00_AXIS_tready,
    M00_AXIS_tuser,
    M00_AXIS_tvalid,
    M01_AXIS_ACLK,
    M01_AXIS_ARESETN,
    M01_AXIS_tdata,
    M01_AXIS_tdest,
    M01_AXIS_tid,
    M01_AXIS_tlast,
    M01_AXIS_tready,
    M01_AXIS_tuser,
    M01_AXIS_tvalid,
    M02_AXIS_ACLK,
    M02_AXIS_ARESETN,
    M02_AXIS_tdata,
    M02_AXIS_tdest,
    M02_AXIS_tid,
    M02_AXIS_tlast,
    M02_AXIS_tready,
    M02_AXIS_tuser,
    M02_AXIS_tvalid,
    S00_AXIS_ACLK,
    S00_AXIS_ARESETN,
    S00_AXIS_tdata,
    S00_AXIS_tdest,
    S00_AXIS_tid,
    S00_AXIS_tkeep,
    S00_AXIS_tlast,
    S00_AXIS_tready,
    S00_AXIS_tuser,
    S00_AXIS_tvalid);
  input ACLK;
  input ARESETN;
  input M00_AXIS_ACLK;
  input M00_AXIS_ARESETN;
  output [63:0]M00_AXIS_tdata;
  output [3:0]M00_AXIS_tdest;
  output [3:0]M00_AXIS_tid;
  output M00_AXIS_tlast;
  input M00_AXIS_tready;
  output [31:0]M00_AXIS_tuser;
  output M00_AXIS_tvalid;
  input M01_AXIS_ACLK;
  input M01_AXIS_ARESETN;
  output [63:0]M01_AXIS_tdata;
  output [3:0]M01_AXIS_tdest;
  output [3:0]M01_AXIS_tid;
  output M01_AXIS_tlast;
  input M01_AXIS_tready;
  output [31:0]M01_AXIS_tuser;
  output M01_AXIS_tvalid;
  input M02_AXIS_ACLK;
  input M02_AXIS_ARESETN;
  output [63:0]M02_AXIS_tdata;
  output [3:0]M02_AXIS_tdest;
  output [3:0]M02_AXIS_tid;
  output M02_AXIS_tlast;
  input M02_AXIS_tready;
  output [31:0]M02_AXIS_tuser;
  output M02_AXIS_tvalid;
  input S00_AXIS_ACLK;
  input S00_AXIS_ARESETN;
  input [31:0]S00_AXIS_tdata;
  input [3:0]S00_AXIS_tdest;
  input [7:0]S00_AXIS_tid;
  input [3:0]S00_AXIS_tkeep;
  input [0:0]S00_AXIS_tlast;
  output [0:0]S00_AXIS_tready;
  input [15:0]S00_AXIS_tuser;
  input [0:0]S00_AXIS_tvalid;

  wire axis_interconnect_0_ACLK_net;
  wire axis_interconnect_0_ARESETN_net;
  wire [31:0]axis_interconnect_0_to_s00_couplers_TDATA;
  wire [3:0]axis_interconnect_0_to_s00_couplers_TDEST;
  wire [7:0]axis_interconnect_0_to_s00_couplers_TID;
  wire [3:0]axis_interconnect_0_to_s00_couplers_TKEEP;
  wire [0:0]axis_interconnect_0_to_s00_couplers_TLAST;
  wire [0:0]axis_interconnect_0_to_s00_couplers_TREADY;
  wire [15:0]axis_interconnect_0_to_s00_couplers_TUSER;
  wire [0:0]axis_interconnect_0_to_s00_couplers_TVALID;
  wire [63:0]m00_couplers_to_axis_interconnect_0_TDATA;
  wire [3:0]m00_couplers_to_axis_interconnect_0_TDEST;
  wire [3:0]m00_couplers_to_axis_interconnect_0_TID;
  wire m00_couplers_to_axis_interconnect_0_TLAST;
  wire m00_couplers_to_axis_interconnect_0_TREADY;
  wire [31:0]m00_couplers_to_axis_interconnect_0_TUSER;
  wire m00_couplers_to_axis_interconnect_0_TVALID;
  wire [63:0]m01_couplers_to_axis_interconnect_0_TDATA;
  wire [3:0]m01_couplers_to_axis_interconnect_0_TDEST;
  wire [3:0]m01_couplers_to_axis_interconnect_0_TID;
  wire m01_couplers_to_axis_interconnect_0_TLAST;
  wire m01_couplers_to_axis_interconnect_0_TREADY;
  wire [31:0]m01_couplers_to_axis_interconnect_0_TUSER;
  wire m01_couplers_to_axis_interconnect_0_TVALID;
  wire [63:0]m02_couplers_to_axis_interconnect_0_TDATA;
  wire [3:0]m02_couplers_to_axis_interconnect_0_TDEST;
  wire [3:0]m02_couplers_to_axis_interconnect_0_TID;
  wire m02_couplers_to_axis_interconnect_0_TLAST;
  wire m02_couplers_to_axis_interconnect_0_TREADY;
  wire [31:0]m02_couplers_to_axis_interconnect_0_TUSER;
  wire m02_couplers_to_axis_interconnect_0_TVALID;
  wire [31:0]s00_couplers_to_xbar_TDATA;
  wire [3:0]s00_couplers_to_xbar_TDEST;
  wire [7:0]s00_couplers_to_xbar_TID;
  wire [3:0]s00_couplers_to_xbar_TKEEP;
  wire [0:0]s00_couplers_to_xbar_TLAST;
  wire [0:0]s00_couplers_to_xbar_TREADY;
  wire [15:0]s00_couplers_to_xbar_TUSER;
  wire [0:0]s00_couplers_to_xbar_TVALID;
  wire [31:0]xbar_to_m00_couplers_TDATA;
  wire [3:0]xbar_to_m00_couplers_TDEST;
  wire [7:0]xbar_to_m00_couplers_TID;
  wire [3:0]xbar_to_m00_couplers_TKEEP;
  wire [0:0]xbar_to_m00_couplers_TLAST;
  wire xbar_to_m00_couplers_TREADY;
  wire [15:0]xbar_to_m00_couplers_TUSER;
  wire [0:0]xbar_to_m00_couplers_TVALID;
  wire [63:32]xbar_to_m01_couplers_TDATA;
  wire [7:4]xbar_to_m01_couplers_TDEST;
  wire [15:8]xbar_to_m01_couplers_TID;
  wire [7:4]xbar_to_m01_couplers_TKEEP;
  wire [1:1]xbar_to_m01_couplers_TLAST;
  wire xbar_to_m01_couplers_TREADY;
  wire [31:16]xbar_to_m01_couplers_TUSER;
  wire [1:1]xbar_to_m01_couplers_TVALID;
  wire [95:64]xbar_to_m02_couplers_TDATA;
  wire [11:8]xbar_to_m02_couplers_TDEST;
  wire [23:16]xbar_to_m02_couplers_TID;
  wire [11:8]xbar_to_m02_couplers_TKEEP;
  wire [2:2]xbar_to_m02_couplers_TLAST;
  wire xbar_to_m02_couplers_TREADY;
  wire [47:32]xbar_to_m02_couplers_TUSER;
  wire [2:2]xbar_to_m02_couplers_TVALID;

  assign M00_AXIS_tdata[63:0] = m00_couplers_to_axis_interconnect_0_TDATA;
  assign M00_AXIS_tdest[3:0] = m00_couplers_to_axis_interconnect_0_TDEST;
  assign M00_AXIS_tid[3:0] = m00_couplers_to_axis_interconnect_0_TID;
  assign M00_AXIS_tlast = m00_couplers_to_axis_interconnect_0_TLAST;
  assign M00_AXIS_tuser[31:0] = m00_couplers_to_axis_interconnect_0_TUSER;
  assign M00_AXIS_tvalid = m00_couplers_to_axis_interconnect_0_TVALID;
  assign M01_AXIS_tdata[63:0] = m01_couplers_to_axis_interconnect_0_TDATA;
  assign M01_AXIS_tdest[3:0] = m01_couplers_to_axis_interconnect_0_TDEST;
  assign M01_AXIS_tid[3:0] = m01_couplers_to_axis_interconnect_0_TID;
  assign M01_AXIS_tlast = m01_couplers_to_axis_interconnect_0_TLAST;
  assign M01_AXIS_tuser[31:0] = m01_couplers_to_axis_interconnect_0_TUSER;
  assign M01_AXIS_tvalid = m01_couplers_to_axis_interconnect_0_TVALID;
  assign M02_AXIS_tdata[63:0] = m02_couplers_to_axis_interconnect_0_TDATA;
  assign M02_AXIS_tdest[3:0] = m02_couplers_to_axis_interconnect_0_TDEST;
  assign M02_AXIS_tid[3:0] = m02_couplers_to_axis_interconnect_0_TID;
  assign M02_AXIS_tlast = m02_couplers_to_axis_interconnect_0_TLAST;
  assign M02_AXIS_tuser[31:0] = m02_couplers_to_axis_interconnect_0_TUSER;
  assign M02_AXIS_tvalid = m02_couplers_to_axis_interconnect_0_TVALID;
  assign S00_AXIS_tready[0] = axis_interconnect_0_to_s00_couplers_TREADY;
  assign axis_interconnect_0_ACLK_net = ACLK;
  assign axis_interconnect_0_ARESETN_net = ARESETN;
  assign axis_interconnect_0_to_s00_couplers_TDATA = S00_AXIS_tdata[31:0];
  assign axis_interconnect_0_to_s00_couplers_TDEST = S00_AXIS_tdest[3:0];
  assign axis_interconnect_0_to_s00_couplers_TID = S00_AXIS_tid[7:0];
  assign axis_interconnect_0_to_s00_couplers_TKEEP = S00_AXIS_tkeep[3:0];
  assign axis_interconnect_0_to_s00_couplers_TLAST = S00_AXIS_tlast[0];
  assign axis_interconnect_0_to_s00_couplers_TUSER = S00_AXIS_tuser[15:0];
  assign axis_interconnect_0_to_s00_couplers_TVALID = S00_AXIS_tvalid[0];
  assign m00_couplers_to_axis_interconnect_0_TREADY = M00_AXIS_tready;
  assign m01_couplers_to_axis_interconnect_0_TREADY = M01_AXIS_tready;
  assign m02_couplers_to_axis_interconnect_0_TREADY = M02_AXIS_tready;
  m00_couplers_imp_4JMH9A m00_couplers
       (.M_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .M_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .M_AXIS_tdata(m00_couplers_to_axis_interconnect_0_TDATA),
        .M_AXIS_tdest(m00_couplers_to_axis_interconnect_0_TDEST),
        .M_AXIS_tid(m00_couplers_to_axis_interconnect_0_TID),
        .M_AXIS_tlast(m00_couplers_to_axis_interconnect_0_TLAST),
        .M_AXIS_tready(m00_couplers_to_axis_interconnect_0_TREADY),
        .M_AXIS_tuser(m00_couplers_to_axis_interconnect_0_TUSER),
        .M_AXIS_tvalid(m00_couplers_to_axis_interconnect_0_TVALID),
        .S_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .S_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .S_AXIS_tdata(xbar_to_m00_couplers_TDATA),
        .S_AXIS_tdest(xbar_to_m00_couplers_TDEST),
        .S_AXIS_tid(xbar_to_m00_couplers_TID),
        .S_AXIS_tkeep(xbar_to_m00_couplers_TKEEP),
        .S_AXIS_tlast(xbar_to_m00_couplers_TLAST),
        .S_AXIS_tready(xbar_to_m00_couplers_TREADY),
        .S_AXIS_tuser(xbar_to_m00_couplers_TUSER),
        .S_AXIS_tvalid(xbar_to_m00_couplers_TVALID));
  m01_couplers_imp_1GQ7LFZ m01_couplers
       (.M_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .M_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .M_AXIS_tdata(m01_couplers_to_axis_interconnect_0_TDATA),
        .M_AXIS_tdest(m01_couplers_to_axis_interconnect_0_TDEST),
        .M_AXIS_tid(m01_couplers_to_axis_interconnect_0_TID),
        .M_AXIS_tlast(m01_couplers_to_axis_interconnect_0_TLAST),
        .M_AXIS_tready(m01_couplers_to_axis_interconnect_0_TREADY),
        .M_AXIS_tuser(m01_couplers_to_axis_interconnect_0_TUSER),
        .M_AXIS_tvalid(m01_couplers_to_axis_interconnect_0_TVALID),
        .S_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .S_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .S_AXIS_tdata(xbar_to_m01_couplers_TDATA),
        .S_AXIS_tdest(xbar_to_m01_couplers_TDEST),
        .S_AXIS_tid(xbar_to_m01_couplers_TID),
        .S_AXIS_tkeep(xbar_to_m01_couplers_TKEEP),
        .S_AXIS_tlast(xbar_to_m01_couplers_TLAST),
        .S_AXIS_tready(xbar_to_m01_couplers_TREADY),
        .S_AXIS_tuser(xbar_to_m01_couplers_TUSER),
        .S_AXIS_tvalid(xbar_to_m01_couplers_TVALID));
  m02_couplers_imp_163UPBX m02_couplers
       (.M_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .M_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .M_AXIS_tdata(m02_couplers_to_axis_interconnect_0_TDATA),
        .M_AXIS_tdest(m02_couplers_to_axis_interconnect_0_TDEST),
        .M_AXIS_tid(m02_couplers_to_axis_interconnect_0_TID),
        .M_AXIS_tlast(m02_couplers_to_axis_interconnect_0_TLAST),
        .M_AXIS_tready(m02_couplers_to_axis_interconnect_0_TREADY),
        .M_AXIS_tuser(m02_couplers_to_axis_interconnect_0_TUSER),
        .M_AXIS_tvalid(m02_couplers_to_axis_interconnect_0_TVALID),
        .S_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .S_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .S_AXIS_tdata(xbar_to_m02_couplers_TDATA),
        .S_AXIS_tdest(xbar_to_m02_couplers_TDEST),
        .S_AXIS_tid(xbar_to_m02_couplers_TID),
        .S_AXIS_tkeep(xbar_to_m02_couplers_TKEEP),
        .S_AXIS_tlast(xbar_to_m02_couplers_TLAST),
        .S_AXIS_tready(xbar_to_m02_couplers_TREADY),
        .S_AXIS_tuser(xbar_to_m02_couplers_TUSER),
        .S_AXIS_tvalid(xbar_to_m02_couplers_TVALID));
  s00_couplers_imp_B2X07J s00_couplers
       (.M_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .M_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .M_AXIS_tdata(s00_couplers_to_xbar_TDATA),
        .M_AXIS_tdest(s00_couplers_to_xbar_TDEST),
        .M_AXIS_tid(s00_couplers_to_xbar_TID),
        .M_AXIS_tkeep(s00_couplers_to_xbar_TKEEP),
        .M_AXIS_tlast(s00_couplers_to_xbar_TLAST),
        .M_AXIS_tready(s00_couplers_to_xbar_TREADY),
        .M_AXIS_tuser(s00_couplers_to_xbar_TUSER),
        .M_AXIS_tvalid(s00_couplers_to_xbar_TVALID),
        .S_AXIS_ACLK(axis_interconnect_0_ACLK_net),
        .S_AXIS_ARESETN(axis_interconnect_0_ARESETN_net),
        .S_AXIS_tdata(axis_interconnect_0_to_s00_couplers_TDATA),
        .S_AXIS_tdest(axis_interconnect_0_to_s00_couplers_TDEST),
        .S_AXIS_tid(axis_interconnect_0_to_s00_couplers_TID),
        .S_AXIS_tkeep(axis_interconnect_0_to_s00_couplers_TKEEP),
        .S_AXIS_tlast(axis_interconnect_0_to_s00_couplers_TLAST),
        .S_AXIS_tready(axis_interconnect_0_to_s00_couplers_TREADY),
        .S_AXIS_tuser(axis_interconnect_0_to_s00_couplers_TUSER),
        .S_AXIS_tvalid(axis_interconnect_0_to_s00_couplers_TVALID));
  pynqz2_xbar_4 xbar
       (.aclk(axis_interconnect_0_ACLK_net),
        .aresetn(axis_interconnect_0_ARESETN_net),
        .m_axis_tdata({xbar_to_m02_couplers_TDATA,xbar_to_m01_couplers_TDATA,xbar_to_m00_couplers_TDATA}),
        .m_axis_tdest({xbar_to_m02_couplers_TDEST,xbar_to_m01_couplers_TDEST,xbar_to_m00_couplers_TDEST}),
        .m_axis_tid({xbar_to_m02_couplers_TID,xbar_to_m01_couplers_TID,xbar_to_m00_couplers_TID}),
        .m_axis_tkeep({xbar_to_m02_couplers_TKEEP,xbar_to_m01_couplers_TKEEP,xbar_to_m00_couplers_TKEEP}),
        .m_axis_tlast({xbar_to_m02_couplers_TLAST,xbar_to_m01_couplers_TLAST,xbar_to_m00_couplers_TLAST}),
        .m_axis_tready({xbar_to_m02_couplers_TREADY,xbar_to_m01_couplers_TREADY,xbar_to_m00_couplers_TREADY}),
        .m_axis_tuser({xbar_to_m02_couplers_TUSER,xbar_to_m01_couplers_TUSER,xbar_to_m00_couplers_TUSER}),
        .m_axis_tvalid({xbar_to_m02_couplers_TVALID,xbar_to_m01_couplers_TVALID,xbar_to_m00_couplers_TVALID}),
        .s_axis_tdata(s00_couplers_to_xbar_TDATA),
        .s_axis_tdest(s00_couplers_to_xbar_TDEST),
        .s_axis_tid(s00_couplers_to_xbar_TID),
        .s_axis_tkeep(s00_couplers_to_xbar_TKEEP),
        .s_axis_tlast(s00_couplers_to_xbar_TLAST),
        .s_axis_tready(s00_couplers_to_xbar_TREADY),
        .s_axis_tuser(s00_couplers_to_xbar_TUSER),
        .s_axis_tvalid(s00_couplers_to_xbar_TVALID));
endmodule

module pynqz2_ps7_axi_periph_2
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output M01_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire [31:0]m00_couplers_to_ps7_axi_periph_ARADDR;
  wire m00_couplers_to_ps7_axi_periph_ARREADY;
  wire m00_couplers_to_ps7_axi_periph_ARVALID;
  wire [31:0]m00_couplers_to_ps7_axi_periph_AWADDR;
  wire m00_couplers_to_ps7_axi_periph_AWREADY;
  wire m00_couplers_to_ps7_axi_periph_AWVALID;
  wire m00_couplers_to_ps7_axi_periph_BREADY;
  wire [1:0]m00_couplers_to_ps7_axi_periph_BRESP;
  wire m00_couplers_to_ps7_axi_periph_BVALID;
  wire [31:0]m00_couplers_to_ps7_axi_periph_RDATA;
  wire m00_couplers_to_ps7_axi_periph_RREADY;
  wire [1:0]m00_couplers_to_ps7_axi_periph_RRESP;
  wire m00_couplers_to_ps7_axi_periph_RVALID;
  wire [31:0]m00_couplers_to_ps7_axi_periph_WDATA;
  wire m00_couplers_to_ps7_axi_periph_WREADY;
  wire [3:0]m00_couplers_to_ps7_axi_periph_WSTRB;
  wire m00_couplers_to_ps7_axi_periph_WVALID;
  wire [31:0]m01_couplers_to_ps7_axi_periph_ARADDR;
  wire m01_couplers_to_ps7_axi_periph_ARREADY;
  wire m01_couplers_to_ps7_axi_periph_ARVALID;
  wire [31:0]m01_couplers_to_ps7_axi_periph_AWADDR;
  wire m01_couplers_to_ps7_axi_periph_AWREADY;
  wire m01_couplers_to_ps7_axi_periph_AWVALID;
  wire m01_couplers_to_ps7_axi_periph_BREADY;
  wire [1:0]m01_couplers_to_ps7_axi_periph_BRESP;
  wire m01_couplers_to_ps7_axi_periph_BVALID;
  wire [31:0]m01_couplers_to_ps7_axi_periph_RDATA;
  wire m01_couplers_to_ps7_axi_periph_RREADY;
  wire [1:0]m01_couplers_to_ps7_axi_periph_RRESP;
  wire m01_couplers_to_ps7_axi_periph_RVALID;
  wire [31:0]m01_couplers_to_ps7_axi_periph_WDATA;
  wire m01_couplers_to_ps7_axi_periph_WREADY;
  wire m01_couplers_to_ps7_axi_periph_WVALID;
  wire ps7_axi_periph_ACLK_net;
  wire ps7_axi_periph_ARESETN_net;
  wire [31:0]ps7_axi_periph_to_s00_couplers_ARADDR;
  wire [1:0]ps7_axi_periph_to_s00_couplers_ARBURST;
  wire [3:0]ps7_axi_periph_to_s00_couplers_ARCACHE;
  wire [11:0]ps7_axi_periph_to_s00_couplers_ARID;
  wire [3:0]ps7_axi_periph_to_s00_couplers_ARLEN;
  wire [1:0]ps7_axi_periph_to_s00_couplers_ARLOCK;
  wire [2:0]ps7_axi_periph_to_s00_couplers_ARPROT;
  wire [3:0]ps7_axi_periph_to_s00_couplers_ARQOS;
  wire ps7_axi_periph_to_s00_couplers_ARREADY;
  wire [2:0]ps7_axi_periph_to_s00_couplers_ARSIZE;
  wire ps7_axi_periph_to_s00_couplers_ARVALID;
  wire [31:0]ps7_axi_periph_to_s00_couplers_AWADDR;
  wire [1:0]ps7_axi_periph_to_s00_couplers_AWBURST;
  wire [3:0]ps7_axi_periph_to_s00_couplers_AWCACHE;
  wire [11:0]ps7_axi_periph_to_s00_couplers_AWID;
  wire [3:0]ps7_axi_periph_to_s00_couplers_AWLEN;
  wire [1:0]ps7_axi_periph_to_s00_couplers_AWLOCK;
  wire [2:0]ps7_axi_periph_to_s00_couplers_AWPROT;
  wire [3:0]ps7_axi_periph_to_s00_couplers_AWQOS;
  wire ps7_axi_periph_to_s00_couplers_AWREADY;
  wire [2:0]ps7_axi_periph_to_s00_couplers_AWSIZE;
  wire ps7_axi_periph_to_s00_couplers_AWVALID;
  wire [11:0]ps7_axi_periph_to_s00_couplers_BID;
  wire ps7_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]ps7_axi_periph_to_s00_couplers_BRESP;
  wire ps7_axi_periph_to_s00_couplers_BVALID;
  wire [31:0]ps7_axi_periph_to_s00_couplers_RDATA;
  wire [11:0]ps7_axi_periph_to_s00_couplers_RID;
  wire ps7_axi_periph_to_s00_couplers_RLAST;
  wire ps7_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]ps7_axi_periph_to_s00_couplers_RRESP;
  wire ps7_axi_periph_to_s00_couplers_RVALID;
  wire [31:0]ps7_axi_periph_to_s00_couplers_WDATA;
  wire [11:0]ps7_axi_periph_to_s00_couplers_WID;
  wire ps7_axi_periph_to_s00_couplers_WLAST;
  wire ps7_axi_periph_to_s00_couplers_WREADY;
  wire [3:0]ps7_axi_periph_to_s00_couplers_WSTRB;
  wire ps7_axi_periph_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire xbar_to_m01_couplers_WREADY;
  wire [1:1]xbar_to_m01_couplers_WVALID;

  assign M00_AXI_araddr[31:0] = m00_couplers_to_ps7_axi_periph_ARADDR;
  assign M00_AXI_arvalid = m00_couplers_to_ps7_axi_periph_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_ps7_axi_periph_AWADDR;
  assign M00_AXI_awvalid = m00_couplers_to_ps7_axi_periph_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_ps7_axi_periph_BREADY;
  assign M00_AXI_rready = m00_couplers_to_ps7_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_ps7_axi_periph_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_ps7_axi_periph_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_ps7_axi_periph_WVALID;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_ps7_axi_periph_ARADDR;
  assign M01_AXI_arvalid = m01_couplers_to_ps7_axi_periph_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_ps7_axi_periph_AWADDR;
  assign M01_AXI_awvalid = m01_couplers_to_ps7_axi_periph_AWVALID;
  assign M01_AXI_bready = m01_couplers_to_ps7_axi_periph_BREADY;
  assign M01_AXI_rready = m01_couplers_to_ps7_axi_periph_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_ps7_axi_periph_WDATA;
  assign M01_AXI_wvalid = m01_couplers_to_ps7_axi_periph_WVALID;
  assign S00_AXI_arready = ps7_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = ps7_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[11:0] = ps7_axi_periph_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = ps7_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = ps7_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = ps7_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rid[11:0] = ps7_axi_periph_to_s00_couplers_RID;
  assign S00_AXI_rlast = ps7_axi_periph_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = ps7_axi_periph_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = ps7_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready = ps7_axi_periph_to_s00_couplers_WREADY;
  assign m00_couplers_to_ps7_axi_periph_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_ps7_axi_periph_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_ps7_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_ps7_axi_periph_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_ps7_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_ps7_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_ps7_axi_periph_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_ps7_axi_periph_WREADY = M00_AXI_wready;
  assign m01_couplers_to_ps7_axi_periph_ARREADY = M01_AXI_arready;
  assign m01_couplers_to_ps7_axi_periph_AWREADY = M01_AXI_awready;
  assign m01_couplers_to_ps7_axi_periph_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_ps7_axi_periph_BVALID = M01_AXI_bvalid;
  assign m01_couplers_to_ps7_axi_periph_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_ps7_axi_periph_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_ps7_axi_periph_RVALID = M01_AXI_rvalid;
  assign m01_couplers_to_ps7_axi_periph_WREADY = M01_AXI_wready;
  assign ps7_axi_periph_ACLK_net = ACLK;
  assign ps7_axi_periph_ARESETN_net = ARESETN;
  assign ps7_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign ps7_axi_periph_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign ps7_axi_periph_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign ps7_axi_periph_to_s00_couplers_ARID = S00_AXI_arid[11:0];
  assign ps7_axi_periph_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign ps7_axi_periph_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign ps7_axi_periph_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign ps7_axi_periph_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign ps7_axi_periph_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign ps7_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign ps7_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign ps7_axi_periph_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign ps7_axi_periph_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign ps7_axi_periph_to_s00_couplers_AWID = S00_AXI_awid[11:0];
  assign ps7_axi_periph_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign ps7_axi_periph_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign ps7_axi_periph_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign ps7_axi_periph_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign ps7_axi_periph_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign ps7_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign ps7_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready;
  assign ps7_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready;
  assign ps7_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign ps7_axi_periph_to_s00_couplers_WID = S00_AXI_wid[11:0];
  assign ps7_axi_periph_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign ps7_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign ps7_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid;
  m00_couplers_imp_13FRLR6 m00_couplers
       (.M_ACLK(ps7_axi_periph_ACLK_net),
        .M_ARESETN(ps7_axi_periph_ARESETN_net),
        .M_AXI_araddr(m00_couplers_to_ps7_axi_periph_ARADDR),
        .M_AXI_arready(m00_couplers_to_ps7_axi_periph_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_ps7_axi_periph_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_ps7_axi_periph_AWADDR),
        .M_AXI_awready(m00_couplers_to_ps7_axi_periph_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_ps7_axi_periph_AWVALID),
        .M_AXI_bready(m00_couplers_to_ps7_axi_periph_BREADY),
        .M_AXI_bresp(m00_couplers_to_ps7_axi_periph_BRESP),
        .M_AXI_bvalid(m00_couplers_to_ps7_axi_periph_BVALID),
        .M_AXI_rdata(m00_couplers_to_ps7_axi_periph_RDATA),
        .M_AXI_rready(m00_couplers_to_ps7_axi_periph_RREADY),
        .M_AXI_rresp(m00_couplers_to_ps7_axi_periph_RRESP),
        .M_AXI_rvalid(m00_couplers_to_ps7_axi_periph_RVALID),
        .M_AXI_wdata(m00_couplers_to_ps7_axi_periph_WDATA),
        .M_AXI_wready(m00_couplers_to_ps7_axi_periph_WREADY),
        .M_AXI_wstrb(m00_couplers_to_ps7_axi_periph_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_ps7_axi_periph_WVALID),
        .S_ACLK(ps7_axi_periph_ACLK_net),
        .S_ARESETN(ps7_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_8YL27N m01_couplers
       (.M_ACLK(ps7_axi_periph_ACLK_net),
        .M_ARESETN(ps7_axi_periph_ARESETN_net),
        .M_AXI_araddr(m01_couplers_to_ps7_axi_periph_ARADDR),
        .M_AXI_arready(m01_couplers_to_ps7_axi_periph_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_ps7_axi_periph_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_ps7_axi_periph_AWADDR),
        .M_AXI_awready(m01_couplers_to_ps7_axi_periph_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_ps7_axi_periph_AWVALID),
        .M_AXI_bready(m01_couplers_to_ps7_axi_periph_BREADY),
        .M_AXI_bresp(m01_couplers_to_ps7_axi_periph_BRESP),
        .M_AXI_bvalid(m01_couplers_to_ps7_axi_periph_BVALID),
        .M_AXI_rdata(m01_couplers_to_ps7_axi_periph_RDATA),
        .M_AXI_rready(m01_couplers_to_ps7_axi_periph_RREADY),
        .M_AXI_rresp(m01_couplers_to_ps7_axi_periph_RRESP),
        .M_AXI_rvalid(m01_couplers_to_ps7_axi_periph_RVALID),
        .M_AXI_wdata(m01_couplers_to_ps7_axi_periph_WDATA),
        .M_AXI_wready(m01_couplers_to_ps7_axi_periph_WREADY),
        .M_AXI_wvalid(m01_couplers_to_ps7_axi_periph_WVALID),
        .S_ACLK(ps7_axi_periph_ACLK_net),
        .S_ARESETN(ps7_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  s00_couplers_imp_1FIOEWJ s00_couplers
       (.M_ACLK(ps7_axi_periph_ACLK_net),
        .M_ARESETN(ps7_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(ps7_axi_periph_ACLK_net),
        .S_ARESETN(ps7_axi_periph_ARESETN_net),
        .S_AXI_araddr(ps7_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arburst(ps7_axi_periph_to_s00_couplers_ARBURST),
        .S_AXI_arcache(ps7_axi_periph_to_s00_couplers_ARCACHE),
        .S_AXI_arid(ps7_axi_periph_to_s00_couplers_ARID),
        .S_AXI_arlen(ps7_axi_periph_to_s00_couplers_ARLEN),
        .S_AXI_arlock(ps7_axi_periph_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(ps7_axi_periph_to_s00_couplers_ARPROT),
        .S_AXI_arqos(ps7_axi_periph_to_s00_couplers_ARQOS),
        .S_AXI_arready(ps7_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arsize(ps7_axi_periph_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(ps7_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(ps7_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awburst(ps7_axi_periph_to_s00_couplers_AWBURST),
        .S_AXI_awcache(ps7_axi_periph_to_s00_couplers_AWCACHE),
        .S_AXI_awid(ps7_axi_periph_to_s00_couplers_AWID),
        .S_AXI_awlen(ps7_axi_periph_to_s00_couplers_AWLEN),
        .S_AXI_awlock(ps7_axi_periph_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(ps7_axi_periph_to_s00_couplers_AWPROT),
        .S_AXI_awqos(ps7_axi_periph_to_s00_couplers_AWQOS),
        .S_AXI_awready(ps7_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awsize(ps7_axi_periph_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(ps7_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bid(ps7_axi_periph_to_s00_couplers_BID),
        .S_AXI_bready(ps7_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(ps7_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(ps7_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(ps7_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rid(ps7_axi_periph_to_s00_couplers_RID),
        .S_AXI_rlast(ps7_axi_periph_to_s00_couplers_RLAST),
        .S_AXI_rready(ps7_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rresp(ps7_axi_periph_to_s00_couplers_RRESP),
        .S_AXI_rvalid(ps7_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(ps7_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wid(ps7_axi_periph_to_s00_couplers_WID),
        .S_AXI_wlast(ps7_axi_periph_to_s00_couplers_WLAST),
        .S_AXI_wready(ps7_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(ps7_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(ps7_axi_periph_to_s00_couplers_WVALID));
  pynqz2_xbar_5 xbar
       (.aclk(ps7_axi_periph_ACLK_net),
        .aresetn(ps7_axi_periph_ARESETN_net),
        .m_axi_araddr({xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arready({xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awready({xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb(xbar_to_m00_couplers_WSTRB),
        .m_axi_wvalid({xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module s00_couplers_imp_1FIOEWJ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [11:0]s00_couplers_to_auto_pc_ARID;
  wire [3:0]s00_couplers_to_auto_pc_ARLEN;
  wire [1:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [11:0]s00_couplers_to_auto_pc_AWID;
  wire [3:0]s00_couplers_to_auto_pc_AWLEN;
  wire [1:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [11:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [11:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire [11:0]s00_couplers_to_auto_pc_WID;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WID = S_AXI_wid[11:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  pynqz2_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wid(s00_couplers_to_auto_pc_WID),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule

module s00_couplers_imp_1JNWH51
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  input [63:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [7:0]S_AXI_arlen;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  output [31:0]S_AXI_rdata;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_us_to_s00_couplers_ARADDR;
  wire [1:0]auto_us_to_s00_couplers_ARBURST;
  wire [3:0]auto_us_to_s00_couplers_ARCACHE;
  wire [7:0]auto_us_to_s00_couplers_ARLEN;
  wire [0:0]auto_us_to_s00_couplers_ARLOCK;
  wire [2:0]auto_us_to_s00_couplers_ARPROT;
  wire [3:0]auto_us_to_s00_couplers_ARQOS;
  wire auto_us_to_s00_couplers_ARREADY;
  wire [2:0]auto_us_to_s00_couplers_ARSIZE;
  wire auto_us_to_s00_couplers_ARVALID;
  wire [63:0]auto_us_to_s00_couplers_RDATA;
  wire auto_us_to_s00_couplers_RLAST;
  wire auto_us_to_s00_couplers_RREADY;
  wire [1:0]auto_us_to_s00_couplers_RRESP;
  wire auto_us_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_auto_us_ARADDR;
  wire [1:0]s00_couplers_to_auto_us_ARBURST;
  wire [3:0]s00_couplers_to_auto_us_ARCACHE;
  wire [7:0]s00_couplers_to_auto_us_ARLEN;
  wire [2:0]s00_couplers_to_auto_us_ARPROT;
  wire s00_couplers_to_auto_us_ARREADY;
  wire [2:0]s00_couplers_to_auto_us_ARSIZE;
  wire s00_couplers_to_auto_us_ARVALID;
  wire [31:0]s00_couplers_to_auto_us_RDATA;
  wire s00_couplers_to_auto_us_RLAST;
  wire s00_couplers_to_auto_us_RREADY;
  wire [1:0]s00_couplers_to_auto_us_RRESP;
  wire s00_couplers_to_auto_us_RVALID;

  assign M_AXI_araddr[31:0] = auto_us_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_us_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_us_to_s00_couplers_ARCACHE;
  assign M_AXI_arlen[7:0] = auto_us_to_s00_couplers_ARLEN;
  assign M_AXI_arlock[0] = auto_us_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_us_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_us_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_us_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_us_to_s00_couplers_ARVALID;
  assign M_AXI_rready = auto_us_to_s00_couplers_RREADY;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_us_ARREADY;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_us_RDATA;
  assign S_AXI_rlast = s00_couplers_to_auto_us_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_us_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_us_RVALID;
  assign auto_us_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_us_to_s00_couplers_RDATA = M_AXI_rdata[63:0];
  assign auto_us_to_s00_couplers_RLAST = M_AXI_rlast;
  assign auto_us_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_us_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_auto_us_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_us_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_us_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_us_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_auto_us_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_us_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_us_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_us_RREADY = S_AXI_rready;
  pynqz2_auto_us_0 auto_us
       (.m_axi_araddr(auto_us_to_s00_couplers_ARADDR),
        .m_axi_arburst(auto_us_to_s00_couplers_ARBURST),
        .m_axi_arcache(auto_us_to_s00_couplers_ARCACHE),
        .m_axi_arlen(auto_us_to_s00_couplers_ARLEN),
        .m_axi_arlock(auto_us_to_s00_couplers_ARLOCK),
        .m_axi_arprot(auto_us_to_s00_couplers_ARPROT),
        .m_axi_arqos(auto_us_to_s00_couplers_ARQOS),
        .m_axi_arready(auto_us_to_s00_couplers_ARREADY),
        .m_axi_arsize(auto_us_to_s00_couplers_ARSIZE),
        .m_axi_arvalid(auto_us_to_s00_couplers_ARVALID),
        .m_axi_rdata(auto_us_to_s00_couplers_RDATA),
        .m_axi_rlast(auto_us_to_s00_couplers_RLAST),
        .m_axi_rready(auto_us_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_us_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_us_to_s00_couplers_RVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(s00_couplers_to_auto_us_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_us_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_us_ARCACHE),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arlen(s00_couplers_to_auto_us_ARLEN),
        .s_axi_arlock(1'b0),
        .s_axi_arprot(s00_couplers_to_auto_us_ARPROT),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(s00_couplers_to_auto_us_ARREADY),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(s00_couplers_to_auto_us_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_us_ARVALID),
        .s_axi_rdata(s00_couplers_to_auto_us_RDATA),
        .s_axi_rlast(s00_couplers_to_auto_us_RLAST),
        .s_axi_rready(s00_couplers_to_auto_us_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_us_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_us_RVALID));
endmodule

module s00_couplers_imp_B2X07J
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tdest,
    M_AXIS_tid,
    M_AXIS_tkeep,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tuser,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tdest,
    S_AXIS_tid,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tuser,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [31:0]M_AXIS_tdata;
  output [3:0]M_AXIS_tdest;
  output [7:0]M_AXIS_tid;
  output [3:0]M_AXIS_tkeep;
  output [0:0]M_AXIS_tlast;
  input [0:0]M_AXIS_tready;
  output [15:0]M_AXIS_tuser;
  output [0:0]M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [31:0]S_AXIS_tdata;
  input [3:0]S_AXIS_tdest;
  input [7:0]S_AXIS_tid;
  input [3:0]S_AXIS_tkeep;
  input [0:0]S_AXIS_tlast;
  output [0:0]S_AXIS_tready;
  input [15:0]S_AXIS_tuser;
  input [0:0]S_AXIS_tvalid;

  wire [31:0]s00_couplers_to_s00_couplers_TDATA;
  wire [3:0]s00_couplers_to_s00_couplers_TDEST;
  wire [7:0]s00_couplers_to_s00_couplers_TID;
  wire [3:0]s00_couplers_to_s00_couplers_TKEEP;
  wire [0:0]s00_couplers_to_s00_couplers_TLAST;
  wire [0:0]s00_couplers_to_s00_couplers_TREADY;
  wire [15:0]s00_couplers_to_s00_couplers_TUSER;
  wire [0:0]s00_couplers_to_s00_couplers_TVALID;

  assign M_AXIS_tdata[31:0] = s00_couplers_to_s00_couplers_TDATA;
  assign M_AXIS_tdest[3:0] = s00_couplers_to_s00_couplers_TDEST;
  assign M_AXIS_tid[7:0] = s00_couplers_to_s00_couplers_TID;
  assign M_AXIS_tkeep[3:0] = s00_couplers_to_s00_couplers_TKEEP;
  assign M_AXIS_tlast[0] = s00_couplers_to_s00_couplers_TLAST;
  assign M_AXIS_tuser[15:0] = s00_couplers_to_s00_couplers_TUSER;
  assign M_AXIS_tvalid[0] = s00_couplers_to_s00_couplers_TVALID;
  assign S_AXIS_tready[0] = s00_couplers_to_s00_couplers_TREADY;
  assign s00_couplers_to_s00_couplers_TDATA = S_AXIS_tdata[31:0];
  assign s00_couplers_to_s00_couplers_TDEST = S_AXIS_tdest[3:0];
  assign s00_couplers_to_s00_couplers_TID = S_AXIS_tid[7:0];
  assign s00_couplers_to_s00_couplers_TKEEP = S_AXIS_tkeep[3:0];
  assign s00_couplers_to_s00_couplers_TLAST = S_AXIS_tlast[0];
  assign s00_couplers_to_s00_couplers_TREADY = M_AXIS_tready[0];
  assign s00_couplers_to_s00_couplers_TUSER = S_AXIS_tuser[15:0];
  assign s00_couplers_to_s00_couplers_TVALID = S_AXIS_tvalid[0];
endmodule

module s01_couplers_imp_SKF2VO
   (M_ACLK,
    M_ARESETN,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awuser,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awlen,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awuser,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [7:0]M_AXI_awlen;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output [3:0]M_AXI_awuser;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  output [63:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [7:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [7:0]S_AXI_awlen;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input [3:0]S_AXI_awuser;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  input [63:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [7:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]s01_couplers_to_s01_couplers_AWADDR;
  wire [1:0]s01_couplers_to_s01_couplers_AWBURST;
  wire [3:0]s01_couplers_to_s01_couplers_AWCACHE;
  wire [7:0]s01_couplers_to_s01_couplers_AWLEN;
  wire [2:0]s01_couplers_to_s01_couplers_AWPROT;
  wire s01_couplers_to_s01_couplers_AWREADY;
  wire [2:0]s01_couplers_to_s01_couplers_AWSIZE;
  wire [3:0]s01_couplers_to_s01_couplers_AWUSER;
  wire s01_couplers_to_s01_couplers_AWVALID;
  wire s01_couplers_to_s01_couplers_BREADY;
  wire [1:0]s01_couplers_to_s01_couplers_BRESP;
  wire s01_couplers_to_s01_couplers_BVALID;
  wire [63:0]s01_couplers_to_s01_couplers_WDATA;
  wire s01_couplers_to_s01_couplers_WLAST;
  wire s01_couplers_to_s01_couplers_WREADY;
  wire [7:0]s01_couplers_to_s01_couplers_WSTRB;
  wire s01_couplers_to_s01_couplers_WVALID;

  assign M_AXI_awaddr[31:0] = s01_couplers_to_s01_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s01_couplers_to_s01_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s01_couplers_to_s01_couplers_AWCACHE;
  assign M_AXI_awlen[7:0] = s01_couplers_to_s01_couplers_AWLEN;
  assign M_AXI_awprot[2:0] = s01_couplers_to_s01_couplers_AWPROT;
  assign M_AXI_awsize[2:0] = s01_couplers_to_s01_couplers_AWSIZE;
  assign M_AXI_awuser[3:0] = s01_couplers_to_s01_couplers_AWUSER;
  assign M_AXI_awvalid = s01_couplers_to_s01_couplers_AWVALID;
  assign M_AXI_bready = s01_couplers_to_s01_couplers_BREADY;
  assign M_AXI_wdata[63:0] = s01_couplers_to_s01_couplers_WDATA;
  assign M_AXI_wlast = s01_couplers_to_s01_couplers_WLAST;
  assign M_AXI_wstrb[7:0] = s01_couplers_to_s01_couplers_WSTRB;
  assign M_AXI_wvalid = s01_couplers_to_s01_couplers_WVALID;
  assign S_AXI_awready = s01_couplers_to_s01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s01_couplers_to_s01_couplers_BRESP;
  assign S_AXI_bvalid = s01_couplers_to_s01_couplers_BVALID;
  assign S_AXI_wready = s01_couplers_to_s01_couplers_WREADY;
  assign s01_couplers_to_s01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s01_couplers_to_s01_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s01_couplers_to_s01_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s01_couplers_to_s01_couplers_AWLEN = S_AXI_awlen[7:0];
  assign s01_couplers_to_s01_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s01_couplers_to_s01_couplers_AWREADY = M_AXI_awready;
  assign s01_couplers_to_s01_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s01_couplers_to_s01_couplers_AWUSER = S_AXI_awuser[3:0];
  assign s01_couplers_to_s01_couplers_AWVALID = S_AXI_awvalid;
  assign s01_couplers_to_s01_couplers_BREADY = S_AXI_bready;
  assign s01_couplers_to_s01_couplers_BRESP = M_AXI_bresp[1:0];
  assign s01_couplers_to_s01_couplers_BVALID = M_AXI_bvalid;
  assign s01_couplers_to_s01_couplers_WDATA = S_AXI_wdata[63:0];
  assign s01_couplers_to_s01_couplers_WLAST = S_AXI_wlast;
  assign s01_couplers_to_s01_couplers_WREADY = M_AXI_wready;
  assign s01_couplers_to_s01_couplers_WSTRB = S_AXI_wstrb[7:0];
  assign s01_couplers_to_s01_couplers_WVALID = S_AXI_wvalid;
endmodule

module s02_couplers_imp_LZIY7A
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awlen,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [63:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [63:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [7:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [7:0]S_AXI_arlen;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [7:0]S_AXI_awlen;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_us_to_s02_couplers_ARADDR;
  wire [1:0]auto_us_to_s02_couplers_ARBURST;
  wire [3:0]auto_us_to_s02_couplers_ARCACHE;
  wire [7:0]auto_us_to_s02_couplers_ARLEN;
  wire [0:0]auto_us_to_s02_couplers_ARLOCK;
  wire [2:0]auto_us_to_s02_couplers_ARPROT;
  wire [3:0]auto_us_to_s02_couplers_ARQOS;
  wire auto_us_to_s02_couplers_ARREADY;
  wire [2:0]auto_us_to_s02_couplers_ARSIZE;
  wire auto_us_to_s02_couplers_ARVALID;
  wire [31:0]auto_us_to_s02_couplers_AWADDR;
  wire [1:0]auto_us_to_s02_couplers_AWBURST;
  wire [3:0]auto_us_to_s02_couplers_AWCACHE;
  wire [7:0]auto_us_to_s02_couplers_AWLEN;
  wire [0:0]auto_us_to_s02_couplers_AWLOCK;
  wire [2:0]auto_us_to_s02_couplers_AWPROT;
  wire [3:0]auto_us_to_s02_couplers_AWQOS;
  wire auto_us_to_s02_couplers_AWREADY;
  wire [2:0]auto_us_to_s02_couplers_AWSIZE;
  wire auto_us_to_s02_couplers_AWVALID;
  wire auto_us_to_s02_couplers_BREADY;
  wire [1:0]auto_us_to_s02_couplers_BRESP;
  wire auto_us_to_s02_couplers_BVALID;
  wire [63:0]auto_us_to_s02_couplers_RDATA;
  wire auto_us_to_s02_couplers_RLAST;
  wire auto_us_to_s02_couplers_RREADY;
  wire [1:0]auto_us_to_s02_couplers_RRESP;
  wire auto_us_to_s02_couplers_RVALID;
  wire [63:0]auto_us_to_s02_couplers_WDATA;
  wire auto_us_to_s02_couplers_WLAST;
  wire auto_us_to_s02_couplers_WREADY;
  wire [7:0]auto_us_to_s02_couplers_WSTRB;
  wire auto_us_to_s02_couplers_WVALID;
  wire [31:0]s02_couplers_to_auto_us_ARADDR;
  wire [1:0]s02_couplers_to_auto_us_ARBURST;
  wire [3:0]s02_couplers_to_auto_us_ARCACHE;
  wire [7:0]s02_couplers_to_auto_us_ARLEN;
  wire [2:0]s02_couplers_to_auto_us_ARPROT;
  wire s02_couplers_to_auto_us_ARREADY;
  wire [2:0]s02_couplers_to_auto_us_ARSIZE;
  wire s02_couplers_to_auto_us_ARVALID;
  wire [31:0]s02_couplers_to_auto_us_AWADDR;
  wire [1:0]s02_couplers_to_auto_us_AWBURST;
  wire [3:0]s02_couplers_to_auto_us_AWCACHE;
  wire [7:0]s02_couplers_to_auto_us_AWLEN;
  wire [2:0]s02_couplers_to_auto_us_AWPROT;
  wire s02_couplers_to_auto_us_AWREADY;
  wire [2:0]s02_couplers_to_auto_us_AWSIZE;
  wire s02_couplers_to_auto_us_AWVALID;
  wire s02_couplers_to_auto_us_BREADY;
  wire [1:0]s02_couplers_to_auto_us_BRESP;
  wire s02_couplers_to_auto_us_BVALID;
  wire [31:0]s02_couplers_to_auto_us_RDATA;
  wire s02_couplers_to_auto_us_RLAST;
  wire s02_couplers_to_auto_us_RREADY;
  wire [1:0]s02_couplers_to_auto_us_RRESP;
  wire s02_couplers_to_auto_us_RVALID;
  wire [31:0]s02_couplers_to_auto_us_WDATA;
  wire s02_couplers_to_auto_us_WLAST;
  wire s02_couplers_to_auto_us_WREADY;
  wire [3:0]s02_couplers_to_auto_us_WSTRB;
  wire s02_couplers_to_auto_us_WVALID;

  assign M_AXI_araddr[31:0] = auto_us_to_s02_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_us_to_s02_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_us_to_s02_couplers_ARCACHE;
  assign M_AXI_arlen[7:0] = auto_us_to_s02_couplers_ARLEN;
  assign M_AXI_arlock[0] = auto_us_to_s02_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_us_to_s02_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_us_to_s02_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_us_to_s02_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_us_to_s02_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_us_to_s02_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_us_to_s02_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_us_to_s02_couplers_AWCACHE;
  assign M_AXI_awlen[7:0] = auto_us_to_s02_couplers_AWLEN;
  assign M_AXI_awlock[0] = auto_us_to_s02_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_us_to_s02_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_us_to_s02_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_us_to_s02_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_us_to_s02_couplers_AWVALID;
  assign M_AXI_bready = auto_us_to_s02_couplers_BREADY;
  assign M_AXI_rready = auto_us_to_s02_couplers_RREADY;
  assign M_AXI_wdata[63:0] = auto_us_to_s02_couplers_WDATA;
  assign M_AXI_wlast = auto_us_to_s02_couplers_WLAST;
  assign M_AXI_wstrb[7:0] = auto_us_to_s02_couplers_WSTRB;
  assign M_AXI_wvalid = auto_us_to_s02_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s02_couplers_to_auto_us_ARREADY;
  assign S_AXI_awready = s02_couplers_to_auto_us_AWREADY;
  assign S_AXI_bresp[1:0] = s02_couplers_to_auto_us_BRESP;
  assign S_AXI_bvalid = s02_couplers_to_auto_us_BVALID;
  assign S_AXI_rdata[31:0] = s02_couplers_to_auto_us_RDATA;
  assign S_AXI_rlast = s02_couplers_to_auto_us_RLAST;
  assign S_AXI_rresp[1:0] = s02_couplers_to_auto_us_RRESP;
  assign S_AXI_rvalid = s02_couplers_to_auto_us_RVALID;
  assign S_AXI_wready = s02_couplers_to_auto_us_WREADY;
  assign auto_us_to_s02_couplers_ARREADY = M_AXI_arready;
  assign auto_us_to_s02_couplers_AWREADY = M_AXI_awready;
  assign auto_us_to_s02_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_us_to_s02_couplers_BVALID = M_AXI_bvalid;
  assign auto_us_to_s02_couplers_RDATA = M_AXI_rdata[63:0];
  assign auto_us_to_s02_couplers_RLAST = M_AXI_rlast;
  assign auto_us_to_s02_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_us_to_s02_couplers_RVALID = M_AXI_rvalid;
  assign auto_us_to_s02_couplers_WREADY = M_AXI_wready;
  assign s02_couplers_to_auto_us_ARADDR = S_AXI_araddr[31:0];
  assign s02_couplers_to_auto_us_ARBURST = S_AXI_arburst[1:0];
  assign s02_couplers_to_auto_us_ARCACHE = S_AXI_arcache[3:0];
  assign s02_couplers_to_auto_us_ARLEN = S_AXI_arlen[7:0];
  assign s02_couplers_to_auto_us_ARPROT = S_AXI_arprot[2:0];
  assign s02_couplers_to_auto_us_ARSIZE = S_AXI_arsize[2:0];
  assign s02_couplers_to_auto_us_ARVALID = S_AXI_arvalid;
  assign s02_couplers_to_auto_us_AWADDR = S_AXI_awaddr[31:0];
  assign s02_couplers_to_auto_us_AWBURST = S_AXI_awburst[1:0];
  assign s02_couplers_to_auto_us_AWCACHE = S_AXI_awcache[3:0];
  assign s02_couplers_to_auto_us_AWLEN = S_AXI_awlen[7:0];
  assign s02_couplers_to_auto_us_AWPROT = S_AXI_awprot[2:0];
  assign s02_couplers_to_auto_us_AWSIZE = S_AXI_awsize[2:0];
  assign s02_couplers_to_auto_us_AWVALID = S_AXI_awvalid;
  assign s02_couplers_to_auto_us_BREADY = S_AXI_bready;
  assign s02_couplers_to_auto_us_RREADY = S_AXI_rready;
  assign s02_couplers_to_auto_us_WDATA = S_AXI_wdata[31:0];
  assign s02_couplers_to_auto_us_WLAST = S_AXI_wlast;
  assign s02_couplers_to_auto_us_WSTRB = S_AXI_wstrb[3:0];
  assign s02_couplers_to_auto_us_WVALID = S_AXI_wvalid;
  pynqz2_auto_us_1 auto_us
       (.m_axi_araddr(auto_us_to_s02_couplers_ARADDR),
        .m_axi_arburst(auto_us_to_s02_couplers_ARBURST),
        .m_axi_arcache(auto_us_to_s02_couplers_ARCACHE),
        .m_axi_arlen(auto_us_to_s02_couplers_ARLEN),
        .m_axi_arlock(auto_us_to_s02_couplers_ARLOCK),
        .m_axi_arprot(auto_us_to_s02_couplers_ARPROT),
        .m_axi_arqos(auto_us_to_s02_couplers_ARQOS),
        .m_axi_arready(auto_us_to_s02_couplers_ARREADY),
        .m_axi_arsize(auto_us_to_s02_couplers_ARSIZE),
        .m_axi_arvalid(auto_us_to_s02_couplers_ARVALID),
        .m_axi_awaddr(auto_us_to_s02_couplers_AWADDR),
        .m_axi_awburst(auto_us_to_s02_couplers_AWBURST),
        .m_axi_awcache(auto_us_to_s02_couplers_AWCACHE),
        .m_axi_awlen(auto_us_to_s02_couplers_AWLEN),
        .m_axi_awlock(auto_us_to_s02_couplers_AWLOCK),
        .m_axi_awprot(auto_us_to_s02_couplers_AWPROT),
        .m_axi_awqos(auto_us_to_s02_couplers_AWQOS),
        .m_axi_awready(auto_us_to_s02_couplers_AWREADY),
        .m_axi_awsize(auto_us_to_s02_couplers_AWSIZE),
        .m_axi_awvalid(auto_us_to_s02_couplers_AWVALID),
        .m_axi_bready(auto_us_to_s02_couplers_BREADY),
        .m_axi_bresp(auto_us_to_s02_couplers_BRESP),
        .m_axi_bvalid(auto_us_to_s02_couplers_BVALID),
        .m_axi_rdata(auto_us_to_s02_couplers_RDATA),
        .m_axi_rlast(auto_us_to_s02_couplers_RLAST),
        .m_axi_rready(auto_us_to_s02_couplers_RREADY),
        .m_axi_rresp(auto_us_to_s02_couplers_RRESP),
        .m_axi_rvalid(auto_us_to_s02_couplers_RVALID),
        .m_axi_wdata(auto_us_to_s02_couplers_WDATA),
        .m_axi_wlast(auto_us_to_s02_couplers_WLAST),
        .m_axi_wready(auto_us_to_s02_couplers_WREADY),
        .m_axi_wstrb(auto_us_to_s02_couplers_WSTRB),
        .m_axi_wvalid(auto_us_to_s02_couplers_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(s02_couplers_to_auto_us_ARADDR),
        .s_axi_arburst(s02_couplers_to_auto_us_ARBURST),
        .s_axi_arcache(s02_couplers_to_auto_us_ARCACHE),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arlen(s02_couplers_to_auto_us_ARLEN),
        .s_axi_arlock(1'b0),
        .s_axi_arprot(s02_couplers_to_auto_us_ARPROT),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(s02_couplers_to_auto_us_ARREADY),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(s02_couplers_to_auto_us_ARSIZE),
        .s_axi_arvalid(s02_couplers_to_auto_us_ARVALID),
        .s_axi_awaddr(s02_couplers_to_auto_us_AWADDR),
        .s_axi_awburst(s02_couplers_to_auto_us_AWBURST),
        .s_axi_awcache(s02_couplers_to_auto_us_AWCACHE),
        .s_axi_awlen(s02_couplers_to_auto_us_AWLEN),
        .s_axi_awlock(1'b0),
        .s_axi_awprot(s02_couplers_to_auto_us_AWPROT),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(s02_couplers_to_auto_us_AWREADY),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(s02_couplers_to_auto_us_AWSIZE),
        .s_axi_awvalid(s02_couplers_to_auto_us_AWVALID),
        .s_axi_bready(s02_couplers_to_auto_us_BREADY),
        .s_axi_bresp(s02_couplers_to_auto_us_BRESP),
        .s_axi_bvalid(s02_couplers_to_auto_us_BVALID),
        .s_axi_rdata(s02_couplers_to_auto_us_RDATA),
        .s_axi_rlast(s02_couplers_to_auto_us_RLAST),
        .s_axi_rready(s02_couplers_to_auto_us_RREADY),
        .s_axi_rresp(s02_couplers_to_auto_us_RRESP),
        .s_axi_rvalid(s02_couplers_to_auto_us_RVALID),
        .s_axi_wdata(s02_couplers_to_auto_us_WDATA),
        .s_axi_wlast(s02_couplers_to_auto_us_WLAST),
        .s_axi_wready(s02_couplers_to_auto_us_WREADY),
        .s_axi_wstrb(s02_couplers_to_auto_us_WSTRB),
        .s_axi_wvalid(s02_couplers_to_auto_us_WVALID));
endmodule
