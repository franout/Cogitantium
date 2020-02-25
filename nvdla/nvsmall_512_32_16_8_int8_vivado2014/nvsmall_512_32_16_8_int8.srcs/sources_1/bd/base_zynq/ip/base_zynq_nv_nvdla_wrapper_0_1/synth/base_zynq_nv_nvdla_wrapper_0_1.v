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


// IP VLNV: xilinx.com:module_ref:nv_nvdla_wrapper:1.0
// IP Revision: 1

(* X_CORE_INFO = "nv_nvdla_wrapper,Vivado 2019.2.1" *)
(* CHECK_LICENSE_TYPE = "base_zynq_nv_nvdla_wrapper_0_1,nv_nvdla_wrapper,{}" *)
(* CORE_GENERATION_INFO = "base_zynq_nv_nvdla_wrapper_0_1,nv_nvdla_wrapper,{x_ipProduct=Vivado 2019.2.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=nv_nvdla_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module base_zynq_nv_nvdla_wrapper_0_1 (
  clk,
  reset_n,
  test_mode,
  dla_int_request,
  apb2slave_dla_paddr,
  apb2slave_dla_penable,
  apb2slave_dla_psel,
  apb2slave_dla_pwdata,
  apb2slave_dla_pwrite,
  apb2slave_dla_prdata,
  apb2slave_dla_pready,
  M_AXI_awvalid,
  M_AXI_awready,
  M_AXI_awid,
  M_AXI_awlen,
  M_AXI_awaddr,
  M_AXI_wvalid,
  M_AXI_wready,
  M_AXI_wdata,
  M_AXI_wstrb,
  M_AXI_wlast,
  M_AXI_bvalid,
  M_AXI_bready,
  M_AXI_bid,
  M_AXI_arvalid,
  M_AXI_arready,
  M_AXI_arid,
  M_AXI_arlen,
  M_AXI_araddr,
  M_AXI_rvalid,
  M_AXI_rready,
  M_AXI_rid,
  M_AXI_rlast,
  M_AXI_rdata
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF M_AXI, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset_n RST" *)
input wire reset_n;
input wire test_mode;
output wire dla_int_request;
input wire [31 : 0] apb2slave_dla_paddr;
input wire apb2slave_dla_penable;
input wire apb2slave_dla_psel;
input wire [31 : 0] apb2slave_dla_pwdata;
input wire apb2slave_dla_pwrite;
output wire [31 : 0] apb2slave_dla_prdata;
output wire apb2slave_dla_pready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *)
output wire M_AXI_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *)
input wire M_AXI_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWID" *)
output wire [7 : 0] M_AXI_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *)
output wire [3 : 0] M_AXI_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *)
output wire [31 : 0] M_AXI_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *)
output wire M_AXI_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *)
input wire M_AXI_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *)
output wire [31 : 0] M_AXI_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *)
output wire [3 : 0] M_AXI_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *)
output wire M_AXI_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *)
input wire M_AXI_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *)
output wire M_AXI_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BID" *)
input wire [7 : 0] M_AXI_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *)
output wire M_AXI_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *)
input wire M_AXI_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARID" *)
output wire [7 : 0] M_AXI_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *)
output wire [3 : 0] M_AXI_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *)
output wire [31 : 0] M_AXI_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *)
input wire M_AXI_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *)
output wire M_AXI_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RID" *)
input wire [7 : 0] M_AXI_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RLAST" *)
input wire M_AXI_rlast;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXI, DATA_WIDTH 32, PROTOCOL AXI3, FREQ_HZ 50000000, ID_WIDTH 8, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 0, HAS_RRESP 0, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 16, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1\
, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *)
input wire [31 : 0] M_AXI_rdata;

  nv_nvdla_wrapper inst (
    .clk(clk),
    .reset_n(reset_n),
    .test_mode(test_mode),
    .dla_int_request(dla_int_request),
    .apb2slave_dla_paddr(apb2slave_dla_paddr),
    .apb2slave_dla_penable(apb2slave_dla_penable),
    .apb2slave_dla_psel(apb2slave_dla_psel),
    .apb2slave_dla_pwdata(apb2slave_dla_pwdata),
    .apb2slave_dla_pwrite(apb2slave_dla_pwrite),
    .apb2slave_dla_prdata(apb2slave_dla_prdata),
    .apb2slave_dla_pready(apb2slave_dla_pready),
    .M_AXI_awvalid(M_AXI_awvalid),
    .M_AXI_awready(M_AXI_awready),
    .M_AXI_awid(M_AXI_awid),
    .M_AXI_awlen(M_AXI_awlen),
    .M_AXI_awaddr(M_AXI_awaddr),
    .M_AXI_wvalid(M_AXI_wvalid),
    .M_AXI_wready(M_AXI_wready),
    .M_AXI_wdata(M_AXI_wdata),
    .M_AXI_wstrb(M_AXI_wstrb),
    .M_AXI_wlast(M_AXI_wlast),
    .M_AXI_bvalid(M_AXI_bvalid),
    .M_AXI_bready(M_AXI_bready),
    .M_AXI_bid(M_AXI_bid),
    .M_AXI_arvalid(M_AXI_arvalid),
    .M_AXI_arready(M_AXI_arready),
    .M_AXI_arid(M_AXI_arid),
    .M_AXI_arlen(M_AXI_arlen),
    .M_AXI_araddr(M_AXI_araddr),
    .M_AXI_rvalid(M_AXI_rvalid),
    .M_AXI_rready(M_AXI_rready),
    .M_AXI_rid(M_AXI_rid),
    .M_AXI_rlast(M_AXI_rlast),
    .M_AXI_rdata(M_AXI_rdata)
  );
endmodule
