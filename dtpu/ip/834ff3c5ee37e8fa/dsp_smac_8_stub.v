// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Wed Apr  8 17:52:33 2020
// Host        : fra running 64-bit Ubuntu 18.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dsp_smac_8_stub.v
// Design      : dsp_smac_8
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "xbip_dsp48_macro_v3_0_17,Vivado 2019.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(CLK, CE, SCLR, CARRYIN, A, B, C, CARRYCASCOUT, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,CE,SCLR,CARRYIN,A[7:0],B[7:0],C[7:0],CARRYCASCOUT,P[7:0]" */;
  input CLK;
  input CE;
  input SCLR;
  input CARRYIN;
  input [7:0]A;
  input [7:0]B;
  input [7:0]C;
  output CARRYCASCOUT;
  output [7:0]P;
endmodule
