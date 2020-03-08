// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Fri Mar  6 18:24:33 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ register_file_stub.v
// Design      : register_file
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(a, d, dpra, clk, we, qspo_srst, qdpo_srst, qspo, qdpo)
/* synthesis syn_black_box black_box_pad_pin="a[9:0],d[7:0],dpra[9:0],clk,we,qspo_srst,qdpo_srst,qspo[7:0],qdpo[7:0]" */;
  input [9:0]a;
  input [7:0]d;
  input [9:0]dpra;
  input clk;
  input we;
  input qspo_srst;
  input qdpo_srst;
  output [7:0]qspo;
  output [7:0]qdpo;
endmodule
