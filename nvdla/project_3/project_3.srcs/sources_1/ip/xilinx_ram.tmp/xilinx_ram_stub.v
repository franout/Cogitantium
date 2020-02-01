// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Sat Feb  1 17:53:20 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top xilinx_ram -prefix
//               xilinx_ram_ nv_ram_rws_256x3_stub.v
// Design      : nv_ram_rws_256x3
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "uram_rd_back_v1_0_0,Vivado 2019.2.1" *)
module xilinx_ram(CAS_OUT_ADDR_A, CAS_OUT_ADDR_B, 
  CAS_OUT_BWE_A, CAS_OUT_BWE_B, CAS_OUT_DBITERR_A, CAS_OUT_DBITERR_B, CAS_OUT_DIN_A, 
  CAS_OUT_DIN_B, CAS_OUT_DOUT_A, CAS_OUT_DOUT_B, CAS_OUT_EN_A, CAS_OUT_EN_B, 
  CAS_OUT_RDACCESS_A, CAS_OUT_RDACCESS_B, CAS_OUT_RDB_WR_A, CAS_OUT_RDB_WR_B, 
  CAS_OUT_SBITERR_A, CAS_OUT_SBITERR_B, DBITERR_A, DBITERR_B, DOUT_A, DOUT_B, RDACCESS_A, 
  RDACCESS_B, SBITERR_A, SBITERR_B, ADDR_A, ADDR_B, BWE_A, BWE_B, CAS_IN_ADDR_A, CAS_IN_ADDR_B, 
  CAS_IN_BWE_A, CAS_IN_BWE_B, CAS_IN_DBITERR_A, CAS_IN_DBITERR_B, CAS_IN_DIN_A, CAS_IN_DIN_B, 
  CAS_IN_DOUT_A, CAS_IN_DOUT_B, CAS_IN_EN_A, CAS_IN_EN_B, CAS_IN_RDACCESS_A, 
  CAS_IN_RDACCESS_B, CAS_IN_RDB_WR_A, CAS_IN_RDB_WR_B, CAS_IN_SBITERR_A, CAS_IN_SBITERR_B, 
  CLK, DIN_A, DIN_B, EN_A, EN_B, INJECT_DBITERR_A, INJECT_DBITERR_B, INJECT_SBITERR_A, 
  INJECT_SBITERR_B, OREG_CE_A, OREG_CE_B, OREG_ECC_CE_A, OREG_ECC_CE_B, RDB_WR_A, RDB_WR_B, 
  RST_A, RST_B, SLEEP, DI, CCLK, VLD)
/* synthesis syn_black_box black_box_pad_pin="CAS_OUT_ADDR_A[22:0],CAS_OUT_ADDR_B[22:0],CAS_OUT_BWE_A[8:0],CAS_OUT_BWE_B[8:0],CAS_OUT_DBITERR_A,CAS_OUT_DBITERR_B,CAS_OUT_DIN_A[71:0],CAS_OUT_DIN_B[71:0],CAS_OUT_DOUT_A[71:0],CAS_OUT_DOUT_B[71:0],CAS_OUT_EN_A,CAS_OUT_EN_B,CAS_OUT_RDACCESS_A,CAS_OUT_RDACCESS_B,CAS_OUT_RDB_WR_A,CAS_OUT_RDB_WR_B,CAS_OUT_SBITERR_A,CAS_OUT_SBITERR_B,DBITERR_A,DBITERR_B,DOUT_A[71:0],DOUT_B[71:0],RDACCESS_A,RDACCESS_B,SBITERR_A,SBITERR_B,ADDR_A[22:0],ADDR_B[22:0],BWE_A[8:0],BWE_B[8:0],CAS_IN_ADDR_A[22:0],CAS_IN_ADDR_B[22:0],CAS_IN_BWE_A[8:0],CAS_IN_BWE_B[8:0],CAS_IN_DBITERR_A,CAS_IN_DBITERR_B,CAS_IN_DIN_A[71:0],CAS_IN_DIN_B[71:0],CAS_IN_DOUT_A[71:0],CAS_IN_DOUT_B[71:0],CAS_IN_EN_A,CAS_IN_EN_B,CAS_IN_RDACCESS_A,CAS_IN_RDACCESS_B,CAS_IN_RDB_WR_A,CAS_IN_RDB_WR_B,CAS_IN_SBITERR_A,CAS_IN_SBITERR_B,CLK,DIN_A[71:0],DIN_B[71:0],EN_A,EN_B,INJECT_DBITERR_A,INJECT_DBITERR_B,INJECT_SBITERR_A,INJECT_SBITERR_B,OREG_CE_A,OREG_CE_B,OREG_ECC_CE_A,OREG_ECC_CE_B,RDB_WR_A,RDB_WR_B,RST_A,RST_B,SLEEP,DI[31:0],CCLK,VLD" */;
  output [22:0]CAS_OUT_ADDR_A;
  output [22:0]CAS_OUT_ADDR_B;
  output [8:0]CAS_OUT_BWE_A;
  output [8:0]CAS_OUT_BWE_B;
  output CAS_OUT_DBITERR_A;
  output CAS_OUT_DBITERR_B;
  output [71:0]CAS_OUT_DIN_A;
  output [71:0]CAS_OUT_DIN_B;
  output [71:0]CAS_OUT_DOUT_A;
  output [71:0]CAS_OUT_DOUT_B;
  output CAS_OUT_EN_A;
  output CAS_OUT_EN_B;
  output CAS_OUT_RDACCESS_A;
  output CAS_OUT_RDACCESS_B;
  output CAS_OUT_RDB_WR_A;
  output CAS_OUT_RDB_WR_B;
  output CAS_OUT_SBITERR_A;
  output CAS_OUT_SBITERR_B;
  output DBITERR_A;
  output DBITERR_B;
  output [71:0]DOUT_A;
  output [71:0]DOUT_B;
  output RDACCESS_A;
  output RDACCESS_B;
  output SBITERR_A;
  output SBITERR_B;
  input [22:0]ADDR_A;
  input [22:0]ADDR_B;
  input [8:0]BWE_A;
  input [8:0]BWE_B;
  input [22:0]CAS_IN_ADDR_A;
  input [22:0]CAS_IN_ADDR_B;
  input [8:0]CAS_IN_BWE_A;
  input [8:0]CAS_IN_BWE_B;
  input CAS_IN_DBITERR_A;
  input CAS_IN_DBITERR_B;
  input [71:0]CAS_IN_DIN_A;
  input [71:0]CAS_IN_DIN_B;
  input [71:0]CAS_IN_DOUT_A;
  input [71:0]CAS_IN_DOUT_B;
  input CAS_IN_EN_A;
  input CAS_IN_EN_B;
  input CAS_IN_RDACCESS_A;
  input CAS_IN_RDACCESS_B;
  input CAS_IN_RDB_WR_A;
  input CAS_IN_RDB_WR_B;
  input CAS_IN_SBITERR_A;
  input CAS_IN_SBITERR_B;
  input CLK;
  input [71:0]DIN_A;
  input [71:0]DIN_B;
  input EN_A;
  input EN_B;
  input INJECT_DBITERR_A;
  input INJECT_DBITERR_B;
  input INJECT_SBITERR_A;
  input INJECT_SBITERR_B;
  input OREG_CE_A;
  input OREG_CE_B;
  input OREG_ECC_CE_A;
  input OREG_ECC_CE_B;
  input RDB_WR_A;
  input RDB_WR_B;
  input RST_A;
  input RST_B;
  input SLEEP;
  input [31:0]DI;
  input CCLK;
  input VLD;
endmodule
