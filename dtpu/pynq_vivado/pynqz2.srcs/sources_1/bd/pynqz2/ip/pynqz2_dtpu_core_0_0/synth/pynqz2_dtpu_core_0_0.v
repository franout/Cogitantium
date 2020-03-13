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


// IP VLNV: xilinx.com:module_ref:dtpu_core:1.0
// IP Revision: 1

(* X_CORE_INFO = "dtpu_core,Vivado 2019.2" *)
(* CHECK_LICENSE_TYPE = "pynqz2_dtpu_core_0_0,dtpu_core,{}" *)
(* CORE_GENERATION_INFO = "pynqz2_dtpu_core_0_0,dtpu_core,{x_ipProduct=Vivado 2019.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=dtpu_core,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,DATA_WIDTH_MAC=4,ROWS=3,COLUMNS=3,SIZE_WMEMORY=8196,SIZE_CSR=1024,DATA_WIDTH_CSR=8,DATA_WIDTH_WMEMORY=64,DATA_WIDTH_FIFO_IN=64,DATA_WIDTH_FIFO_OUT=64}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module pynqz2_dtpu_core_0_0 (
  clk,
  areset,
  test_mode,
  enable,
  csr_address,
  csr_clk,
  csr_din,
  csr_dout,
  csr_ce,
  csr_reset,
  csr_we,
  wm_address,
  wm_clk,
  wm_din,
  wm_dout,
  wm_ce,
  wm_reset,
  wm_we,
  infifo_is_empty,
  infifo_dout,
  infifo_read,
  outfifo_is_full,
  outfifo_din,
  outfifo_write,
  cs_continue,
  cs_done,
  cs_idle,
  cs_ready,
  cs_start,
  state
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET areset, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN pynqz2_ps7_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME areset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 areset RST" *)
input wire areset;
input wire test_mode;
input wire enable;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface ADDR" *)
output wire [31 : 0] csr_address;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface CLK" *)
output wire csr_clk;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface DIN" *)
output wire [7 : 0] csr_din;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface DOUT" *)
input wire [7 : 0] csr_dout;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface EN" *)
output wire csr_ce;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface RST" *)
output wire csr_reset;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME csr_mem_interface, MASTER_TYPE BRAM_CTRL, MEM_ECC no, MEM_WIDTH 8, MEM_SIZE 1024, READ_LATENCY 1" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface WE" *)
output wire csr_we;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface ADDR" *)
output wire [31 : 0] wm_address;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface CLK" *)
output wire wm_clk;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface DIN" *)
output wire [63 : 0] wm_din;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface DOUT" *)
input wire [63 : 0] wm_dout;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface EN" *)
output wire wm_ce;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface RST" *)
output wire wm_reset;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME weight_mem_interface, MASTER_TYPE BRAM_CTRL, MEM_ECC no, MEM_WIDTH 64, MEM_SIZE 8192, READ_LATENCY 1" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface WE" *)
output wire wm_we;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo EMPTY_N" *)
input wire infifo_is_empty;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *)
input wire [63 : 0] infifo_dout;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_EN" *)
output wire infifo_read;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo FULL_N" *)
input wire outfifo_is_full;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *)
output wire [63 : 0] outfifo_din;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_EN" *)
output wire outfifo_write;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 control_interface ap_continue" *)
input wire cs_continue;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 control_interface ap_done" *)
output wire cs_done;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 control_interface ap_idle" *)
output wire cs_idle;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 control_interface ap_ready" *)
output wire cs_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 control_interface ap_start" *)
input wire cs_start;
output wire [3 : 0] state;

  dtpu_core #(
    .DATA_WIDTH_MAC(4),
    .ROWS(3),
    .COLUMNS(3),
    .SIZE_WMEMORY(8196),
    .SIZE_CSR(1024),
    .DATA_WIDTH_CSR(8),
    .DATA_WIDTH_WMEMORY(64),
    .DATA_WIDTH_FIFO_IN(64),
    .DATA_WIDTH_FIFO_OUT(64)
  ) inst (
    .clk(clk),
    .areset(areset),
    .test_mode(test_mode),
    .enable(enable),
    .csr_address(csr_address),
    .csr_clk(csr_clk),
    .csr_din(csr_din),
    .csr_dout(csr_dout),
    .csr_ce(csr_ce),
    .csr_reset(csr_reset),
    .csr_we(csr_we),
    .wm_address(wm_address),
    .wm_clk(wm_clk),
    .wm_din(wm_din),
    .wm_dout(wm_dout),
    .wm_ce(wm_ce),
    .wm_reset(wm_reset),
    .wm_we(wm_we),
    .infifo_is_empty(infifo_is_empty),
    .infifo_dout(infifo_dout),
    .infifo_read(infifo_read),
    .outfifo_is_full(outfifo_is_full),
    .outfifo_din(outfifo_din),
    .outfifo_write(outfifo_write),
    .cs_continue(cs_continue),
    .cs_done(cs_done),
    .cs_idle(cs_idle),
    .cs_ready(cs_ready),
    .cs_start(cs_start),
    .state(state)
  );
endmodule
