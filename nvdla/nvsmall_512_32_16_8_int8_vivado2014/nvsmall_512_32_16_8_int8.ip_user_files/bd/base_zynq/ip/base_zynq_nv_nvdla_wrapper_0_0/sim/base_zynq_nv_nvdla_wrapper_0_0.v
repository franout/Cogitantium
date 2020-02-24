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

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module base_zynq_nv_nvdla_wrapper_0_0 (
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
  nvdla_core2dbb_aw_awvalid,
  nvdla_core2dbb_aw_awready,
  nvdla_core2dbb_aw_awid,
  nvdla_core2dbb_aw_awlen,
  nvdla_core2dbb_aw_awaddr,
  nvdla_core2dbb_w_wvalid,
  nvdla_core2dbb_w_wready,
  nvdla_core2dbb_w_wdata,
  nvdla_core2dbb_w_wstrb,
  nvdla_core2dbb_w_wlast,
  nvdla_core2dbb_b_bvalid,
  nvdla_core2dbb_b_bready,
  nvdla_core2dbb_b_bid,
  nvdla_core2dbb_ar_arvalid,
  nvdla_core2dbb_ar_arready,
  nvdla_core2dbb_ar_arid,
  nvdla_core2dbb_ar_arlen,
  nvdla_core2dbb_ar_araddr,
  nvdla_core2dbb_r_rvalid,
  nvdla_core2dbb_r_rready,
  nvdla_core2dbb_r_rid,
  nvdla_core2dbb_r_rlast,
  nvdla_core2dbb_r_rdata
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN base_zynq_processing_system7_0_0_FCLK_CLK0" *)
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
output wire nvdla_core2dbb_aw_awvalid;
input wire nvdla_core2dbb_aw_awready;
output wire [7 : 0] nvdla_core2dbb_aw_awid;
output wire [3 : 0] nvdla_core2dbb_aw_awlen;
output wire [31 : 0] nvdla_core2dbb_aw_awaddr;
output wire nvdla_core2dbb_w_wvalid;
input wire nvdla_core2dbb_w_wready;
output wire [31 : 0] nvdla_core2dbb_w_wdata;
output wire [3 : 0] nvdla_core2dbb_w_wstrb;
output wire nvdla_core2dbb_w_wlast;
input wire nvdla_core2dbb_b_bvalid;
output wire nvdla_core2dbb_b_bready;
input wire [7 : 0] nvdla_core2dbb_b_bid;
output wire nvdla_core2dbb_ar_arvalid;
input wire nvdla_core2dbb_ar_arready;
output wire [7 : 0] nvdla_core2dbb_ar_arid;
output wire [3 : 0] nvdla_core2dbb_ar_arlen;
output wire [31 : 0] nvdla_core2dbb_ar_araddr;
input wire nvdla_core2dbb_r_rvalid;
output wire nvdla_core2dbb_r_rready;
input wire [7 : 0] nvdla_core2dbb_r_rid;
input wire nvdla_core2dbb_r_rlast;
input wire [31 : 0] nvdla_core2dbb_r_rdata;

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
    .nvdla_core2dbb_aw_awvalid(nvdla_core2dbb_aw_awvalid),
    .nvdla_core2dbb_aw_awready(nvdla_core2dbb_aw_awready),
    .nvdla_core2dbb_aw_awid(nvdla_core2dbb_aw_awid),
    .nvdla_core2dbb_aw_awlen(nvdla_core2dbb_aw_awlen),
    .nvdla_core2dbb_aw_awaddr(nvdla_core2dbb_aw_awaddr),
    .nvdla_core2dbb_w_wvalid(nvdla_core2dbb_w_wvalid),
    .nvdla_core2dbb_w_wready(nvdla_core2dbb_w_wready),
    .nvdla_core2dbb_w_wdata(nvdla_core2dbb_w_wdata),
    .nvdla_core2dbb_w_wstrb(nvdla_core2dbb_w_wstrb),
    .nvdla_core2dbb_w_wlast(nvdla_core2dbb_w_wlast),
    .nvdla_core2dbb_b_bvalid(nvdla_core2dbb_b_bvalid),
    .nvdla_core2dbb_b_bready(nvdla_core2dbb_b_bready),
    .nvdla_core2dbb_b_bid(nvdla_core2dbb_b_bid),
    .nvdla_core2dbb_ar_arvalid(nvdla_core2dbb_ar_arvalid),
    .nvdla_core2dbb_ar_arready(nvdla_core2dbb_ar_arready),
    .nvdla_core2dbb_ar_arid(nvdla_core2dbb_ar_arid),
    .nvdla_core2dbb_ar_arlen(nvdla_core2dbb_ar_arlen),
    .nvdla_core2dbb_ar_araddr(nvdla_core2dbb_ar_araddr),
    .nvdla_core2dbb_r_rvalid(nvdla_core2dbb_r_rvalid),
    .nvdla_core2dbb_r_rready(nvdla_core2dbb_r_rready),
    .nvdla_core2dbb_r_rid(nvdla_core2dbb_r_rid),
    .nvdla_core2dbb_r_rlast(nvdla_core2dbb_r_rlast),
    .nvdla_core2dbb_r_rdata(nvdla_core2dbb_r_rdata)
  );
endmodule
