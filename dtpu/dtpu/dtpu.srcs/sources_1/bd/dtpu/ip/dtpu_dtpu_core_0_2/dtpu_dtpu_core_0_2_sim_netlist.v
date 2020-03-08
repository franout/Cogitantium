// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Sun Mar  8 20:37:21 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/uni/2019-2020/thesis/cogitantium/dtpu/dtpu/dtpu.srcs/sources_1/bd/dtpu/ip/dtpu_dtpu_core_0_2/dtpu_dtpu_core_0_2_sim_netlist.v
// Design      : dtpu_dtpu_core_0_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dtpu_dtpu_core_0_2,dtpu_core,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "dtpu_core,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module dtpu_dtpu_core_0_2
   (clk,
    reset,
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
    cs_start);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET reset, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN dtpu_clk, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset;
  input test_mode;
  input enable;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface ADDR" *) output [31:0]csr_address;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface CLK" *) output csr_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface DIN" *) output [7:0]csr_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface DOUT" *) input [7:0]csr_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface EN" *) output csr_ce;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface RST" *) output csr_reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 csr_mem_interface WE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME csr_mem_interface, MASTER_TYPE BRAM_CTRL, MEM_ECC no, MEM_WIDTH 8, MEM_SIZE 1024, READ_LATENCY 1" *) output csr_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface ADDR" *) output [31:0]wm_address;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface CLK" *) output wm_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface DIN" *) output [63:0]wm_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface DOUT" *) input [63:0]wm_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface EN" *) output wm_ce;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface RST" *) output wm_reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 weight_mem_interface WE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME weight_mem_interface, MASTER_TYPE BRAM_CTRL, MEM_ECC no, MEM_WIDTH 64, MEM_SIZE 8192, READ_LATENCY 1" *) output wm_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo EMPTY_N" *) input infifo_is_empty;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) input [63:0]infifo_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_EN" *) output infifo_read;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo FULL_N" *) input outfifo_is_full;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) output [63:0]outfifo_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_EN" *) output outfifo_write;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 control_interface ap_continue" *) input cs_continue;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 control_interface ap_done" *) output cs_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 control_interface ap_idle" *) output cs_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 control_interface ap_ready" *) output cs_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 control_interface ap_start" *) input cs_start;

  wire clk;
  wire cs_continue;
  wire cs_done;
  wire cs_idle;
  wire cs_ready;
  wire cs_start;
  wire [31:0]csr_address;
  wire csr_ce;
  wire csr_clk;
  wire [7:0]csr_din;
  wire [7:0]csr_dout;
  wire csr_reset;
  wire csr_we;
  wire enable;
  wire [63:0]infifo_dout;
  wire infifo_is_empty;
  wire infifo_read;
  wire [63:0]outfifo_din;
  wire outfifo_is_full;
  wire outfifo_write;
  wire reset;
  wire test_mode;
  wire [31:0]wm_address;
  wire wm_ce;
  wire wm_clk;
  wire [63:0]wm_din;
  wire [63:0]wm_dout;
  wire wm_reset;
  wire wm_we;

  (* COLUMNS = "3" *) 
  (* DATA_WIDTH_CSR = "8" *) 
  (* DATA_WIDTH_FIFO_IN = "64" *) 
  (* DATA_WIDTH_FIFO_OUT = "64" *) 
  (* DATA_WIDTH_MAC = "4" *) 
  (* DATA_WIDTH_WMEMORY = "64" *) 
  (* ROWS = "3" *) 
  (* SIZE_CSR = "1024" *) 
  (* SIZE_WMEMORY = "8196" *) 
  dtpu_dtpu_core_0_2_dtpu_core inst
       (.clk(clk),
        .cs_continue(cs_continue),
        .cs_done(cs_done),
        .cs_idle(cs_idle),
        .cs_ready(cs_ready),
        .cs_start(cs_start),
        .csr_address(csr_address),
        .csr_ce(csr_ce),
        .csr_clk(csr_clk),
        .csr_din(csr_din),
        .csr_dout(csr_dout),
        .csr_reset(csr_reset),
        .csr_we(csr_we),
        .enable(enable),
        .infifo_dout(infifo_dout),
        .infifo_is_empty(infifo_is_empty),
        .infifo_read(infifo_read),
        .outfifo_din(outfifo_din),
        .outfifo_is_full(outfifo_is_full),
        .outfifo_write(outfifo_write),
        .reset(reset),
        .test_mode(test_mode),
        .wm_address(wm_address),
        .wm_ce(wm_ce),
        .wm_clk(wm_clk),
        .wm_din(wm_din),
        .wm_dout(wm_dout),
        .wm_reset(wm_reset),
        .wm_we(wm_we));
endmodule

(* COLUMNS = "3" *) (* DATA_WIDTH_CSR = "8" *) (* DATA_WIDTH_FIFO_IN = "64" *) 
(* DATA_WIDTH_FIFO_OUT = "64" *) (* DATA_WIDTH_MAC = "4" *) (* DATA_WIDTH_WMEMORY = "64" *) 
(* ORIG_REF_NAME = "dtpu_core" *) (* ROWS = "3" *) (* SIZE_CSR = "1024" *) 
(* SIZE_WMEMORY = "8196" *) 
module dtpu_dtpu_core_0_2_dtpu_core
   (clk,
    reset,
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
    cs_start);
  input clk;
  input reset;
  input test_mode;
  input enable;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) output [31:0]csr_address;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface CLK" *) output csr_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DIN" *) output [7:0]csr_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DOUT" *) input [7:0]csr_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface EN" *) (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC no,MEM_WIDTH 8,MEM_SIZE 1024 " *) output csr_ce;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface RST" *) output csr_reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface WE" *) output csr_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) output [31:0]wm_address;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface CLK" *) output wm_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) output [63:0]wm_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) input [63:0]wm_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface EN" *) (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC no,MEM_WIDTH 64,MEM_SIZE 8192 " *) output wm_ce;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface RST" *) output wm_reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface WE" *) output wm_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo EMPTY_N" *) input infifo_is_empty;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) input [63:0]infifo_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_EN" *) output infifo_read;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo FULL_N" *) input outfifo_is_full;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) output [63:0]outfifo_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_EN" *) output outfifo_write;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_continue" *) input cs_continue;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_done" *) output cs_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_idle" *) output cs_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_ready" *) output cs_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_start" *) input cs_start;

  wire \<const0> ;
  wire clk;
  wire reset;

  assign cs_done = \<const0> ;
  assign cs_idle = \<const0> ;
  assign cs_ready = \<const0> ;
  assign csr_address[31] = \<const0> ;
  assign csr_address[30] = \<const0> ;
  assign csr_address[29] = \<const0> ;
  assign csr_address[28] = \<const0> ;
  assign csr_address[27] = \<const0> ;
  assign csr_address[26] = \<const0> ;
  assign csr_address[25] = \<const0> ;
  assign csr_address[24] = \<const0> ;
  assign csr_address[23] = \<const0> ;
  assign csr_address[22] = \<const0> ;
  assign csr_address[21] = \<const0> ;
  assign csr_address[20] = \<const0> ;
  assign csr_address[19] = \<const0> ;
  assign csr_address[18] = \<const0> ;
  assign csr_address[17] = \<const0> ;
  assign csr_address[16] = \<const0> ;
  assign csr_address[15] = \<const0> ;
  assign csr_address[14] = \<const0> ;
  assign csr_address[13] = \<const0> ;
  assign csr_address[12] = \<const0> ;
  assign csr_address[11] = \<const0> ;
  assign csr_address[10] = \<const0> ;
  assign csr_address[9] = \<const0> ;
  assign csr_address[8] = \<const0> ;
  assign csr_address[7] = \<const0> ;
  assign csr_address[6] = \<const0> ;
  assign csr_address[5] = \<const0> ;
  assign csr_address[4] = \<const0> ;
  assign csr_address[3] = \<const0> ;
  assign csr_address[2] = \<const0> ;
  assign csr_address[1] = \<const0> ;
  assign csr_address[0] = \<const0> ;
  assign csr_ce = \<const0> ;
  assign csr_clk = clk;
  assign csr_din[7] = \<const0> ;
  assign csr_din[6] = \<const0> ;
  assign csr_din[5] = \<const0> ;
  assign csr_din[4] = \<const0> ;
  assign csr_din[3] = \<const0> ;
  assign csr_din[2] = \<const0> ;
  assign csr_din[1] = \<const0> ;
  assign csr_din[0] = \<const0> ;
  assign csr_reset = \<const0> ;
  assign csr_we = \<const0> ;
  assign infifo_read = \<const0> ;
  assign outfifo_din[63] = \<const0> ;
  assign outfifo_din[62] = \<const0> ;
  assign outfifo_din[61] = \<const0> ;
  assign outfifo_din[60] = \<const0> ;
  assign outfifo_din[59] = \<const0> ;
  assign outfifo_din[58] = \<const0> ;
  assign outfifo_din[57] = \<const0> ;
  assign outfifo_din[56] = \<const0> ;
  assign outfifo_din[55] = \<const0> ;
  assign outfifo_din[54] = \<const0> ;
  assign outfifo_din[53] = \<const0> ;
  assign outfifo_din[52] = \<const0> ;
  assign outfifo_din[51] = \<const0> ;
  assign outfifo_din[50] = \<const0> ;
  assign outfifo_din[49] = \<const0> ;
  assign outfifo_din[48] = \<const0> ;
  assign outfifo_din[47] = \<const0> ;
  assign outfifo_din[46] = \<const0> ;
  assign outfifo_din[45] = \<const0> ;
  assign outfifo_din[44] = \<const0> ;
  assign outfifo_din[43] = \<const0> ;
  assign outfifo_din[42] = \<const0> ;
  assign outfifo_din[41] = \<const0> ;
  assign outfifo_din[40] = \<const0> ;
  assign outfifo_din[39] = \<const0> ;
  assign outfifo_din[38] = \<const0> ;
  assign outfifo_din[37] = \<const0> ;
  assign outfifo_din[36] = \<const0> ;
  assign outfifo_din[35] = \<const0> ;
  assign outfifo_din[34] = \<const0> ;
  assign outfifo_din[33] = \<const0> ;
  assign outfifo_din[32] = \<const0> ;
  assign outfifo_din[31] = \<const0> ;
  assign outfifo_din[30] = \<const0> ;
  assign outfifo_din[29] = \<const0> ;
  assign outfifo_din[28] = \<const0> ;
  assign outfifo_din[27] = \<const0> ;
  assign outfifo_din[26] = \<const0> ;
  assign outfifo_din[25] = \<const0> ;
  assign outfifo_din[24] = \<const0> ;
  assign outfifo_din[23] = \<const0> ;
  assign outfifo_din[22] = \<const0> ;
  assign outfifo_din[21] = \<const0> ;
  assign outfifo_din[20] = \<const0> ;
  assign outfifo_din[19] = \<const0> ;
  assign outfifo_din[18] = \<const0> ;
  assign outfifo_din[17] = \<const0> ;
  assign outfifo_din[16] = \<const0> ;
  assign outfifo_din[15] = \<const0> ;
  assign outfifo_din[14] = \<const0> ;
  assign outfifo_din[13] = \<const0> ;
  assign outfifo_din[12] = \<const0> ;
  assign outfifo_din[11] = \<const0> ;
  assign outfifo_din[10] = \<const0> ;
  assign outfifo_din[9] = \<const0> ;
  assign outfifo_din[8] = \<const0> ;
  assign outfifo_din[7] = \<const0> ;
  assign outfifo_din[6] = \<const0> ;
  assign outfifo_din[5] = \<const0> ;
  assign outfifo_din[4] = \<const0> ;
  assign outfifo_din[3] = \<const0> ;
  assign outfifo_din[2] = \<const0> ;
  assign outfifo_din[1] = \<const0> ;
  assign outfifo_din[0] = \<const0> ;
  assign outfifo_write = \<const0> ;
  assign wm_address[31] = \<const0> ;
  assign wm_address[30] = \<const0> ;
  assign wm_address[29] = \<const0> ;
  assign wm_address[28] = \<const0> ;
  assign wm_address[27] = \<const0> ;
  assign wm_address[26] = \<const0> ;
  assign wm_address[25] = \<const0> ;
  assign wm_address[24] = \<const0> ;
  assign wm_address[23] = \<const0> ;
  assign wm_address[22] = \<const0> ;
  assign wm_address[21] = \<const0> ;
  assign wm_address[20] = \<const0> ;
  assign wm_address[19] = \<const0> ;
  assign wm_address[18] = \<const0> ;
  assign wm_address[17] = \<const0> ;
  assign wm_address[16] = \<const0> ;
  assign wm_address[15] = \<const0> ;
  assign wm_address[14] = \<const0> ;
  assign wm_address[13] = \<const0> ;
  assign wm_address[12] = \<const0> ;
  assign wm_address[11] = \<const0> ;
  assign wm_address[10] = \<const0> ;
  assign wm_address[9] = \<const0> ;
  assign wm_address[8] = \<const0> ;
  assign wm_address[7] = \<const0> ;
  assign wm_address[6] = \<const0> ;
  assign wm_address[5] = \<const0> ;
  assign wm_address[4] = \<const0> ;
  assign wm_address[3] = \<const0> ;
  assign wm_address[2] = \<const0> ;
  assign wm_address[1] = \<const0> ;
  assign wm_address[0] = \<const0> ;
  assign wm_ce = \<const0> ;
  assign wm_clk = clk;
  assign wm_din[63] = \<const0> ;
  assign wm_din[62] = \<const0> ;
  assign wm_din[61] = \<const0> ;
  assign wm_din[60] = \<const0> ;
  assign wm_din[59] = \<const0> ;
  assign wm_din[58] = \<const0> ;
  assign wm_din[57] = \<const0> ;
  assign wm_din[56] = \<const0> ;
  assign wm_din[55] = \<const0> ;
  assign wm_din[54] = \<const0> ;
  assign wm_din[53] = \<const0> ;
  assign wm_din[52] = \<const0> ;
  assign wm_din[51] = \<const0> ;
  assign wm_din[50] = \<const0> ;
  assign wm_din[49] = \<const0> ;
  assign wm_din[48] = \<const0> ;
  assign wm_din[47] = \<const0> ;
  assign wm_din[46] = \<const0> ;
  assign wm_din[45] = \<const0> ;
  assign wm_din[44] = \<const0> ;
  assign wm_din[43] = \<const0> ;
  assign wm_din[42] = \<const0> ;
  assign wm_din[41] = \<const0> ;
  assign wm_din[40] = \<const0> ;
  assign wm_din[39] = \<const0> ;
  assign wm_din[38] = \<const0> ;
  assign wm_din[37] = \<const0> ;
  assign wm_din[36] = \<const0> ;
  assign wm_din[35] = \<const0> ;
  assign wm_din[34] = \<const0> ;
  assign wm_din[33] = \<const0> ;
  assign wm_din[32] = \<const0> ;
  assign wm_din[31] = \<const0> ;
  assign wm_din[30] = \<const0> ;
  assign wm_din[29] = \<const0> ;
  assign wm_din[28] = \<const0> ;
  assign wm_din[27] = \<const0> ;
  assign wm_din[26] = \<const0> ;
  assign wm_din[25] = \<const0> ;
  assign wm_din[24] = \<const0> ;
  assign wm_din[23] = \<const0> ;
  assign wm_din[22] = \<const0> ;
  assign wm_din[21] = \<const0> ;
  assign wm_din[20] = \<const0> ;
  assign wm_din[19] = \<const0> ;
  assign wm_din[18] = \<const0> ;
  assign wm_din[17] = \<const0> ;
  assign wm_din[16] = \<const0> ;
  assign wm_din[15] = \<const0> ;
  assign wm_din[14] = \<const0> ;
  assign wm_din[13] = \<const0> ;
  assign wm_din[12] = \<const0> ;
  assign wm_din[11] = \<const0> ;
  assign wm_din[10] = \<const0> ;
  assign wm_din[9] = \<const0> ;
  assign wm_din[8] = \<const0> ;
  assign wm_din[7] = \<const0> ;
  assign wm_din[6] = \<const0> ;
  assign wm_din[5] = \<const0> ;
  assign wm_din[4] = \<const0> ;
  assign wm_din[3] = \<const0> ;
  assign wm_din[2] = \<const0> ;
  assign wm_din[1] = \<const0> ;
  assign wm_din[0] = \<const0> ;
  assign wm_reset = \<const0> ;
  assign wm_we = \<const0> ;
  GND GND
       (.G(\<const0> ));
  dtpu_dtpu_core_0_2_mxu_wrapper engine
       (.clk(clk),
        .reset(reset));
endmodule

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "mult_gen_0" *) 
(* X_CORE_INFO = "mult_gen_v12_0_16,Vivado 2019.2.1" *) 
module dtpu_dtpu_core_0_2_mult_gen_0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    P);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;

  wire [3:0]A;
  wire [3:0]B;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_mult_gen_v12_0_16 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "mult_gen_0" *) 
(* X_CORE_INFO = "mult_gen_v12_0_16,Vivado 2019.2.1" *) 
module dtpu_dtpu_core_0_2_mult_gen_0__1
   (CLK,
    A,
    B,
    CE,
    SCLR,
    P);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;

  wire [3:0]A;
  wire [3:0]B;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_mult_gen_v12_0_16__1 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "mult_gen_0" *) 
(* X_CORE_INFO = "mult_gen_v12_0_16,Vivado 2019.2.1" *) 
module dtpu_dtpu_core_0_2_mult_gen_0__2
   (CLK,
    A,
    B,
    CE,
    SCLR,
    P);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;

  wire [3:0]A;
  wire [3:0]B;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_mult_gen_v12_0_16__2 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* ORIG_REF_NAME = "mxu_core" *) 
module dtpu_dtpu_core_0_2_mxu_core
   (clk,
    reset);
  input clk;
  input reset;

  wire clk;
  wire [3:0]p_0_out;
  wire [3:0]p_4_out;
  wire [3:0]p_7_out;
  wire [3:0]p_8_out;
  wire [3:0]\res_mac_next[3]_0 ;
  wire [3:0]\res_mac_next[7]_1 ;
  wire reset;

  (* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2.1" *) 
  dtpu_dtpu_core_0_2_mult_gen_0__1 \rows[0].columns[0].mult_i 
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b0),
        .CLK(clk),
        .P(p_7_out),
        .SCLR(reset));
  dtpu_dtpu_core_0_2_mxu_mac__xdcDup__1 \rows[0].columns[1].mac_i_j 
       (.P(p_8_out),
        .clk(clk),
        .i_primitive(p_7_out),
        .reset(reset));
  dtpu_dtpu_core_0_2_mxu_mac__xdcDup__2 \rows[0].columns[2].mac_i_j 
       (.P(p_8_out),
        .clk(clk),
        .reset(reset));
  (* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2.1" *) 
  dtpu_dtpu_core_0_2_mult_gen_0__2 \rows[1].columns[0].mult_i 
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b0),
        .CLK(clk),
        .P(\res_mac_next[3]_0 ),
        .SCLR(reset));
  dtpu_dtpu_core_0_2_mxu_mac__xdcDup__3 \rows[1].columns[1].mac_i_j 
       (.P(p_4_out),
        .clk(clk),
        .i_primitive(\res_mac_next[3]_0 ),
        .reset(reset));
  dtpu_dtpu_core_0_2_mxu_mac__xdcDup__4 \rows[1].columns[2].mac_i_j 
       (.P(p_4_out),
        .clk(clk),
        .reset(reset));
  (* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2.1" *) 
  dtpu_dtpu_core_0_2_mult_gen_0 \rows[2].columns[0].mult_i 
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b0),
        .CLK(clk),
        .P(p_0_out),
        .SCLR(reset));
  dtpu_dtpu_core_0_2_mxu_mac__xdcDup__5 \rows[2].columns[1].mac_i_j 
       (.P(\res_mac_next[7]_1 ),
        .clk(clk),
        .i_primitive(p_0_out),
        .reset(reset));
  dtpu_dtpu_core_0_2_mxu_mac \rows[2].columns[2].mac_i_j 
       (.P(\res_mac_next[7]_1 ),
        .clk(clk),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "mxu_mac" *) 
module dtpu_dtpu_core_0_2_mxu_mac
   (clk,
    reset,
    P);
  input clk;
  input reset;
  input [3:0]P;

  wire [3:0]P;
  wire clk;
  wire reset;
  wire [11:8]y_mxu;
  wire [47:0]NLW_mac_PCOUT_UNCONNECTED;

  (* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
  dtpu_dtpu_core_0_2_vivado_mac mac
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0}),
        .C(P),
        .CE(1'b0),
        .CLK(clk),
        .P(y_mxu),
        .PCOUT(NLW_mac_PCOUT_UNCONNECTED[47:0]),
        .SCLR(reset),
        .SUBTRACT(1'b0));
endmodule

(* ORIG_REF_NAME = "mxu_mac" *) 
module dtpu_dtpu_core_0_2_mxu_mac__xdcDup__1
   (P,
    clk,
    reset,
    i_primitive);
  output [3:0]P;
  input clk;
  input reset;
  input [3:0]i_primitive;

  wire [3:0]P;
  wire clk;
  wire [3:0]i_primitive;
  wire reset;
  wire [47:0]NLW_mac_PCOUT_UNCONNECTED;

  (* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
  dtpu_dtpu_core_0_2_vivado_mac__6 mac
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0}),
        .C(i_primitive),
        .CE(1'b0),
        .CLK(clk),
        .P(P),
        .PCOUT(NLW_mac_PCOUT_UNCONNECTED[47:0]),
        .SCLR(reset),
        .SUBTRACT(1'b0));
endmodule

(* ORIG_REF_NAME = "mxu_mac" *) 
module dtpu_dtpu_core_0_2_mxu_mac__xdcDup__2
   (clk,
    reset,
    P);
  input clk;
  input reset;
  input [3:0]P;

  wire [3:0]P;
  wire clk;
  wire mac_n_0;
  wire mac_n_1;
  wire mac_n_2;
  wire mac_n_3;
  wire reset;
  wire [47:0]NLW_mac_PCOUT_UNCONNECTED;

  (* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
  dtpu_dtpu_core_0_2_vivado_mac__7 mac
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0}),
        .C(P),
        .CE(1'b0),
        .CLK(clk),
        .P({mac_n_0,mac_n_1,mac_n_2,mac_n_3}),
        .PCOUT(NLW_mac_PCOUT_UNCONNECTED[47:0]),
        .SCLR(reset),
        .SUBTRACT(1'b0));
endmodule

(* ORIG_REF_NAME = "mxu_mac" *) 
module dtpu_dtpu_core_0_2_mxu_mac__xdcDup__3
   (P,
    clk,
    reset,
    i_primitive);
  output [3:0]P;
  input clk;
  input reset;
  input [3:0]i_primitive;

  wire [3:0]P;
  wire clk;
  wire [3:0]i_primitive;
  wire reset;
  wire [47:0]NLW_mac_PCOUT_UNCONNECTED;

  (* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
  dtpu_dtpu_core_0_2_vivado_mac__8 mac
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0}),
        .C(i_primitive),
        .CE(1'b0),
        .CLK(clk),
        .P(P),
        .PCOUT(NLW_mac_PCOUT_UNCONNECTED[47:0]),
        .SCLR(reset),
        .SUBTRACT(1'b0));
endmodule

(* ORIG_REF_NAME = "mxu_mac" *) 
module dtpu_dtpu_core_0_2_mxu_mac__xdcDup__4
   (clk,
    reset,
    P);
  input clk;
  input reset;
  input [3:0]P;

  wire [3:0]P;
  wire clk;
  wire reset;
  wire [7:4]y_mxu;
  wire [47:0]NLW_mac_PCOUT_UNCONNECTED;

  (* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
  dtpu_dtpu_core_0_2_vivado_mac__9 mac
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0}),
        .C(P),
        .CE(1'b0),
        .CLK(clk),
        .P(y_mxu),
        .PCOUT(NLW_mac_PCOUT_UNCONNECTED[47:0]),
        .SCLR(reset),
        .SUBTRACT(1'b0));
endmodule

(* ORIG_REF_NAME = "mxu_mac" *) 
module dtpu_dtpu_core_0_2_mxu_mac__xdcDup__5
   (P,
    clk,
    reset,
    i_primitive);
  output [3:0]P;
  input clk;
  input reset;
  input [3:0]i_primitive;

  wire [3:0]P;
  wire clk;
  wire [3:0]i_primitive;
  wire reset;
  wire [47:0]NLW_mac_PCOUT_UNCONNECTED;

  (* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
  dtpu_dtpu_core_0_2_vivado_mac__10 mac
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0}),
        .C(i_primitive),
        .CE(1'b0),
        .CLK(clk),
        .P(P),
        .PCOUT(NLW_mac_PCOUT_UNCONNECTED[47:0]),
        .SCLR(reset),
        .SUBTRACT(1'b0));
endmodule

(* ORIG_REF_NAME = "mxu_wrapper" *) 
module dtpu_dtpu_core_0_2_mxu_wrapper
   (clk,
    reset);
  input clk;
  input reset;

  wire clk;
  wire reset;

  dtpu_dtpu_core_0_2_mxu_core kernel
       (.clk(clk),
        .reset(reset));
endmodule

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "vivado_mac" *) 
(* X_CORE_INFO = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
module dtpu_dtpu_core_0_2_vivado_mac
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15 U0
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "vivado_mac" *) 
(* X_CORE_INFO = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
module dtpu_dtpu_core_0_2_vivado_mac__10
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15__10 U0
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "vivado_mac" *) 
(* X_CORE_INFO = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
module dtpu_dtpu_core_0_2_vivado_mac__6
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15__6 U0
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "vivado_mac" *) 
(* X_CORE_INFO = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
module dtpu_dtpu_core_0_2_vivado_mac__7
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15__7 U0
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "vivado_mac" *) 
(* X_CORE_INFO = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
module dtpu_dtpu_core_0_2_vivado_mac__8
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15__8 U0
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "vivado_mac" *) 
(* X_CORE_INFO = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
module dtpu_dtpu_core_0_2_vivado_mac__9
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15__9 U0
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "4" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "0" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "3" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* ORIG_REF_NAME = "mult_gen_v12_0_16" *) 
module dtpu_dtpu_core_0_2_mult_gen_v12_0_16
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [3:0]A;
  input [3:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [3:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [3:0]A;
  wire [3:0]B;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire SCLR;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_mult_gen_v12_0_16_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "4" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "0" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "3" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* ORIG_REF_NAME = "mult_gen_v12_0_16" *) 
module dtpu_dtpu_core_0_2_mult_gen_v12_0_16__1
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [3:0]A;
  input [3:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [3:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [3:0]A;
  wire [3:0]B;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire SCLR;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_mult_gen_v12_0_16_viv__1 i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "4" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "0" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "3" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* ORIG_REF_NAME = "mult_gen_v12_0_16" *) 
module dtpu_dtpu_core_0_2_mult_gen_v12_0_16__2
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [3:0]A;
  input [3:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [3:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [3:0]A;
  wire [3:0]B;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire SCLR;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_mult_gen_v12_0_16_viv__2 i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "-1" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "4" *) 
(* C_OUT_HIGH = "3" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "xbip_multadd_v3_0_15" *) 
module dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    PCIN,
    SUBTRACT,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input [3:0]A;
  input [3:0]B;
  input [3:0]C;
  input [47:0]PCIN;
  input SUBTRACT;
  output [3:0]P;
  output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15_viv i_synth
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "-1" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "4" *) 
(* C_OUT_HIGH = "3" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "xbip_multadd_v3_0_15" *) 
module dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15__10
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    PCIN,
    SUBTRACT,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input [3:0]A;
  input [3:0]B;
  input [3:0]C;
  input [47:0]PCIN;
  input SUBTRACT;
  output [3:0]P;
  output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15_viv__10 i_synth
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "-1" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "4" *) 
(* C_OUT_HIGH = "3" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "xbip_multadd_v3_0_15" *) 
module dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15__6
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    PCIN,
    SUBTRACT,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input [3:0]A;
  input [3:0]B;
  input [3:0]C;
  input [47:0]PCIN;
  input SUBTRACT;
  output [3:0]P;
  output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15_viv__6 i_synth
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "-1" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "4" *) 
(* C_OUT_HIGH = "3" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "xbip_multadd_v3_0_15" *) 
module dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15__7
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    PCIN,
    SUBTRACT,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input [3:0]A;
  input [3:0]B;
  input [3:0]C;
  input [47:0]PCIN;
  input SUBTRACT;
  output [3:0]P;
  output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15_viv__7 i_synth
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "-1" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "4" *) 
(* C_OUT_HIGH = "3" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "xbip_multadd_v3_0_15" *) 
module dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15__8
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    PCIN,
    SUBTRACT,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input [3:0]A;
  input [3:0]B;
  input [3:0]C;
  input [47:0]PCIN;
  input SUBTRACT;
  output [3:0]P;
  output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15_viv__8 i_synth
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "-1" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "4" *) 
(* C_OUT_HIGH = "3" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* DowngradeIPIdentifiedWarnings = "yes" *) (* ORIG_REF_NAME = "xbip_multadd_v3_0_15" *) 
module dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15__9
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    PCIN,
    SUBTRACT,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input [3:0]A;
  input [3:0]B;
  input [3:0]C;
  input [47:0]PCIN;
  input SUBTRACT;
  output [3:0]P;
  output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  dtpu_dtpu_core_0_2_xbip_multadd_v3_0_15_viv__9 i_synth
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
T6NLm7q5PluSbvLo/vRV3EPZO8CWK8dMbm9VLfdzLe2xUvOGWBbzPoMbz5epEsB8c1F59+1k/nFJ
xTa+vqHnfQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
d4I/M9ck6JPxAfWj9MVD8CXXq3IOU178dw4Vy9P59mAHmZ1H5QMVK2YrsBH9Mj0fOXk/4IovpcSY
JkNhdtFGkMepsx43G6odN7ZbZlHctdl9qVYL6Rw0k3dc7yw4cKjSKywkQS1JIq6CGlkhYR7PZ25C
Bxg4ws1nXRkDT56ubLk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
AKjliawu+uMUweV1x+aDDRnXPmx0n28qR6ru12BgyvLEOvn3E+u/vhcfnbwgYG38LdF4Kb6cjUnf
tD8dgKBQrMPwCJkDD9/bLdL6pnSv9QjwY1qr9nRwWA8GlZkQXJRCySBEv2zQyJQYWxo+fyL5qofx
IAuauj45P0O3pwtwKiZ9ITiTdh7Kc1a+OeOp9SwrI5oUTyvffp52aOLPdzVkXRmuSXCZWavwMbyS
6pgsS4j8b5GgBpdCFPvxlhA7VR6hOGrdLnBMbEtMkknU3N8VGlGJ5nYfR7caMaCQrAKyx/ulixs9
Po9f5vYPsgsqSQnTUTY2UwFgUDWLRdvSLE8bXw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OLlgboZxsWp33ysT9gGBWznaXfE45zD51JGRJ/PqXZRomwu8DnvCXSLpVCzReDLegtbRfY6N56Sj
1JgN0sg3SvM/YFw77TeOiBoP77Am6jqPJlL4n8P3qckQwnvZwPUNdBK/a+AdSNg7O0RnvYWY10gP
mo/FlnOJc79Rm7JLTWdKZxijtAuC5astZFaOyCRlUw24S1FX637DC8l9i43Cry/n+s2SqE4/oF1p
eKCPPYzgcvozR9yfQakaj/O3Z0dyrKNoOTomNpt9MCkpLl3OS/zxeLyXDx5VyIMoia2e8Yny7SAR
yL/XwWl6RB4lN1/EL7gmWNbGNoqFyvsR/8vXfQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
diXRMuapoEH9WPieuk/05uiVYLDJQb3EuM0eaIhg3E1tkBUlBX+hZRBqBLEL0N/3GY9ZOiqVpbiE
ackIC7iymOUelyxAKk0Q8rflKEZdq9CbGY5xv2Kv+lHF7JJjNSDTYUN4k4EMKcpY7xaxXDgiu4NA
BHGzgWvN2kKhPpVoifDnnoknX92UGXCZjcXCGdYZulS56iL5Cqa0+k7IB4n0vpV5M4uYV+4GAmi1
I7HKOx7mrhJkDH6uzpgzJ5chUD9UYHJnaUFaV11aLL1mmfz7Yl3yM3eJfwMfUt+DHZAJZ+tX1/Ds
7cTc0ry69I82Kpo3WhgbPC+WV66Zz+JUP/Ikwg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
iRXkYk7x/WAjhgGYwtNPN2yR3h8zFSpXbYXv00FEl7wK1myDbcd3XJEmg19xPW4qgtsiMD3hQPuR
7L+mBY0KiMkF4ckYOuAgredCMtedGcP4yaKhpsuSe+gYUQgtzPq/rBNTYteHkUtxu6PTPSapt5M0
xMeVekT53HLGyoQwjCU=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q3RfBWK/qZU9a8RspOPRerwpHj464DMbrCC1dRe0Z6shOgtGMaZ5OVqfxf6GIHMI1SysSGAMPhyk
SvIHtrnw9ExCewhQSi2FuRIIEpTQ5FVffPQphhZO+qE0t5whcm6e2SvOSLH/fDuIGbrWe7vCfxLe
hOXpaqZWmul2Fs7JlbrbizRjDPJa2cV6KHSeKhaEjkNPeKAJX8LWYU6o79H2S/UWs2NAPxdC1yAf
tY9sELbNaKPmRjjxfp6LOwIV7pexetErdZvzPnJwG7rZzBRYhupQ48w3bdmYq9NIGcgTU9SGoI8s
Am4MJth/i4oo6LgfOjdgCniw9rjPysNMVZ0isA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L5h0BM/jH8EoBw22fEWjc6BlUOfyn2+JxL4YZymLh1RE/ScH2jZFGn2RRsBftRvum8b+2b+0TZz6
hc8Z7Esj86LmXif5rwsEL/VTTRXX5tNVKt50EwOcW0jY+gDhFBGHAK/Rr7HY1P2FY7M2bDB2kwRM
Xkpo+uc9km+leX8qCb18yPFKUGWZ+rJc68NI5oaMu9O3cAMXCrVwPkw7MZXfj0VecdZ14DKtr2zZ
TrdxMcuvVHa1umCB+GLcnq/Ipg8bRJBBSjcQzRxxjgmC9tA2bsaJZa2RHYI7Fg333rh5WoD0oi9t
oHlR70eOIdjxjGwv+FUGtFENyngd2+rIcexUCQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BpkkQAdKBcWV6ebfZ9NQ+45rx4Pqc2b5yXqxhZ0Tcfksp/+hKq/AcIL2ruZdkTRpTbqsYz2QDVJl
IjhIFUJgGDSAAmdbbR/Xxragl0MVE8t+XosZ5sDicP2NO62IwMxDqerkQYSDyJ8nRj/19l/Ne6nH
QEAyBgt3GurjWMPs3rG0vAhDe2yuV6F2tBFuQ+8emvuScgP6XfWzFmSHzdym/HtJbU93KUpAhwr4
gVHDxjZ5KB5YM26PvVaRAXZgAOOGeE5n/NqomDibQdnE4ttYOHTR5K7VKUxEd2MUDpuSaNfNl0TW
HedRZRKTZJ+QZmLeFHZOmGTlbErdtXzLcc0DlA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
5JI01ySZGG/1fJ5VqlxzxCoKwV9pF+QeIxtAXQlx9ISqTAXZ5UCkvTXM7lQPBrUv3eQvvzUY1JIw
grf9X5SxZekwjk+rrruHJ+2iij6DvXyGxSgOmw8ff6Ns4h63vEFIN/bt/ckV0hpdvle5UsI4ExTh
gExiHcqAsWHoOnlD8snl+zfC5Rc0fFacet35DqyuX6bXuz9mGxsFnx2MiCGUhMEZRkhl4e0+kwGO
0SFvhXgRll2e7osTaH6goo0gAWrMxzPw/pcOyFgR/4FNXQPy/Ek7TMTx/+dF1bGkCmnsj3ZIS3dy
1bNPKHd+TUmymV+Qzj5tf3PAeiGu1R5Jldl37Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 99856)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
