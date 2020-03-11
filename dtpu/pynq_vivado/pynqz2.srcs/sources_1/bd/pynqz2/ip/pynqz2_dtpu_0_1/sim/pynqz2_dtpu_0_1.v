// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:dtpu:1.0
// IP Revision: 3

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "IPI" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module pynqz2_dtpu_0_1 (
  M_AXIS_0_0_tdata,
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
  test_mode
);

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TDATA" *)
output wire [63 : 0] M_AXIS_0_0_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TDEST" *)
output wire [3 : 0] M_AXIS_0_0_tdest;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TID" *)
output wire [3 : 0] M_AXIS_0_0_tid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TLAST" *)
output wire M_AXIS_0_0_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TREADY" *)
input wire M_AXIS_0_0_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TUSER" *)
output wire [7 : 0] M_AXIS_0_0_tuser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_0, TDATA_NUM_BYTES 8, TDEST_WIDTH 4, TID_WIDTH 4, TUSER_WIDTH 8, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, LAYERED_METADATA undef, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN pynqz2_ps7_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TVALID" *)
output wire M_AXIS_0_0_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TDATA" *)
input wire [63 : 0] S_AXIS_0_0_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TDEST" *)
input wire [3 : 0] S_AXIS_0_0_tdest;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TID" *)
input wire [3 : 0] S_AXIS_0_0_tid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TLAST" *)
input wire S_AXIS_0_0_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TREADY" *)
output wire S_AXIS_0_0_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TUSER" *)
input wire [7 : 0] S_AXIS_0_0_tuser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_0_0, TDATA_NUM_BYTES 8, TDEST_WIDTH 4, TID_WIDTH 4, TUSER_WIDTH 8, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, LAYERED_METADATA undef, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN pynqz2_ps7_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TVALID" *)
input wire S_AXIS_0_0_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TDATA" *)
input wire [63 : 0] S_AXIS_1_0_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TDEST" *)
input wire [3 : 0] S_AXIS_1_0_tdest;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TID" *)
input wire [3 : 0] S_AXIS_1_0_tid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TLAST" *)
input wire S_AXIS_1_0_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TREADY" *)
output wire S_AXIS_1_0_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TUSER" *)
input wire [7 : 0] S_AXIS_1_0_tuser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_1_0, TDATA_NUM_BYTES 8, TDEST_WIDTH 4, TID_WIDTH 4, TUSER_WIDTH 8, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, LAYERED_METADATA undef, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN pynqz2_ps7_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TVALID" *)
input wire S_AXIS_1_0_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TDATA" *)
input wire [63 : 0] S_AXIS_2_0_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TDEST" *)
input wire [3 : 0] S_AXIS_2_0_tdest;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TID" *)
input wire [3 : 0] S_AXIS_2_0_tid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TLAST" *)
input wire S_AXIS_2_0_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TREADY" *)
output wire S_AXIS_2_0_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TUSER" *)
input wire [7 : 0] S_AXIS_2_0_tuser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_2_0, TDATA_NUM_BYTES 8, TDEST_WIDTH 4, TID_WIDTH 4, TUSER_WIDTH 8, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, LAYERED_METADATA undef, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN pynqz2_ps7_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TVALID" *)
input wire S_AXIS_2_0_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *)
input wire [12 : 0] S_AXI_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *)
output wire S_AXI_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *)
input wire S_AXI_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *)
input wire [12 : 0] S_AXI_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *)
output wire S_AXI_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *)
input wire S_AXI_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *)
input wire S_AXI_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *)
output wire [1 : 0] S_AXI_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *)
output wire S_AXI_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *)
output wire [31 : 0] S_AXI_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *)
input wire S_AXI_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *)
output wire [1 : 0] S_AXI_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *)
output wire S_AXI_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *)
input wire [31 : 0] S_AXI_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *)
output wire S_AXI_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *)
input wire [3 : 0] S_AXI_wstrb;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, FREQ_HZ 100000\
000, PHASE 0.000, CLK_DOMAIN pynqz2_ps7_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *)
input wire S_AXI_wvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AXI_ACLK, PHASE 0.000, ASSOCIATED_BUSIF S_AXI:S_AXIS_0_0:M_AXIS_0_0:S_AXIS_1_0:S_AXIS_2_0, ASSOCIATED_RESET axi_resetn:axi_resetn, FREQ_HZ 100000000, CLK_DOMAIN pynqz2_ps7_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AXI_ACLK CLK" *)
input wire axi_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AXI_RESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AXI_RESETN RST" *)
input wire axi_resetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, PHASE 0.000, FREQ_HZ 200000000, CLK_DOMAIN pynqz2_ps7_0_FCLK_CLK1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *)
input wire clk;
input wire enable;
output wire idle_signal;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTR_DTPU, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTR_DTPU INTERRUPT" *)
output wire intr_dtpu;
input wire test_mode;

  dtpu inst (
    .M_AXIS_0_0_tdata(M_AXIS_0_0_tdata),
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
    .test_mode(test_mode)
  );
endmodule
