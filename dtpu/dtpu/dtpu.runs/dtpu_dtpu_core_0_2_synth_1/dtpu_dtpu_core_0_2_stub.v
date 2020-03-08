// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Sun Mar  8 20:37:19 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dtpu_dtpu_core_0_2_stub.v
// Design      : dtpu_dtpu_core_0_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "dtpu_core,Vivado 2019.2.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, reset, test_mode, enable, csr_address, 
  csr_clk, csr_din, csr_dout, csr_ce, csr_reset, csr_we, wm_address, wm_clk, wm_din, wm_dout, wm_ce, 
  wm_reset, wm_we, infifo_is_empty, infifo_dout, infifo_read, outfifo_is_full, outfifo_din, 
  outfifo_write, cs_continue, cs_done, cs_idle, cs_ready, cs_start)
/* synthesis syn_black_box black_box_pad_pin="clk,reset,test_mode,enable,csr_address[31:0],csr_clk,csr_din[7:0],csr_dout[7:0],csr_ce,csr_reset,csr_we,wm_address[31:0],wm_clk,wm_din[63:0],wm_dout[63:0],wm_ce,wm_reset,wm_we,infifo_is_empty,infifo_dout[63:0],infifo_read,outfifo_is_full,outfifo_din[63:0],outfifo_write,cs_continue,cs_done,cs_idle,cs_ready,cs_start" */;
  input clk;
  input reset;
  input test_mode;
  input enable;
  output [31:0]csr_address;
  output csr_clk;
  output [7:0]csr_din;
  input [7:0]csr_dout;
  output csr_ce;
  output csr_reset;
  output csr_we;
  output [31:0]wm_address;
  output wm_clk;
  output [63:0]wm_din;
  input [63:0]wm_dout;
  output wm_ce;
  output wm_reset;
  output wm_we;
  input infifo_is_empty;
  input [63:0]infifo_dout;
  output infifo_read;
  input outfifo_is_full;
  output [63:0]outfifo_din;
  output outfifo_write;
  input cs_continue;
  output cs_done;
  output cs_idle;
  output cs_ready;
  input cs_start;
endmodule
