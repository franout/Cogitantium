// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Sat Feb  1 17:53:20 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top xilinx_ram -prefix
//               xilinx_ram_ nv_ram_rws_256x3_sim_netlist.v
// Design      : nv_ram_rws_256x3
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module xilinx_ram_URAM288
   (CAS_OUT_ADDR_A,
    CAS_OUT_ADDR_B,
    CAS_OUT_BWE_A,
    CAS_OUT_BWE_B,
    CAS_OUT_DBITERR_A,
    CAS_OUT_DBITERR_B,
    CAS_OUT_DIN_A,
    CAS_OUT_DIN_B,
    CAS_OUT_DOUT_A,
    CAS_OUT_DOUT_B,
    CAS_OUT_EN_A,
    CAS_OUT_EN_B,
    CAS_OUT_RDACCESS_A,
    CAS_OUT_RDACCESS_B,
    CAS_OUT_RDB_WR_A,
    CAS_OUT_RDB_WR_B,
    CAS_OUT_SBITERR_A,
    CAS_OUT_SBITERR_B,
    DBITERR_A,
    DBITERR_B,
    DOUT_A,
    DOUT_B,
    RDACCESS_A,
    RDACCESS_B,
    SBITERR_A,
    SBITERR_B,
    ADDR_A,
    ADDR_B,
    BWE_A,
    BWE_B,
    CAS_IN_ADDR_A,
    CAS_IN_ADDR_B,
    CAS_IN_BWE_A,
    CAS_IN_BWE_B,
    CAS_IN_DBITERR_A,
    CAS_IN_DBITERR_B,
    CAS_IN_DIN_A,
    CAS_IN_DIN_B,
    CAS_IN_DOUT_A,
    CAS_IN_DOUT_B,
    CAS_IN_EN_A,
    CAS_IN_EN_B,
    CAS_IN_RDACCESS_A,
    CAS_IN_RDACCESS_B,
    CAS_IN_RDB_WR_A,
    CAS_IN_RDB_WR_B,
    CAS_IN_SBITERR_A,
    CAS_IN_SBITERR_B,
    CLK,
    DIN_A,
    DIN_B,
    EN_A,
    EN_B,
    INJECT_DBITERR_A,
    INJECT_DBITERR_B,
    INJECT_SBITERR_A,
    INJECT_SBITERR_B,
    OREG_CE_A,
    OREG_CE_B,
    OREG_ECC_CE_A,
    OREG_ECC_CE_B,
    RDB_WR_A,
    RDB_WR_B,
    RST_A,
    RST_B,
    SLEEP);
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


endmodule

(* CHECK_LICENSE_TYPE = "nv_ram_rws_256x3,uram_rd_back_v1_0_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "uram_rd_back_v1_0_0,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module xilinx_ram
   (CAS_OUT_ADDR_A,
    CAS_OUT_ADDR_B,
    CAS_OUT_BWE_A,
    CAS_OUT_BWE_B,
    CAS_OUT_DBITERR_A,
    CAS_OUT_DBITERR_B,
    CAS_OUT_DIN_A,
    CAS_OUT_DIN_B,
    CAS_OUT_DOUT_A,
    CAS_OUT_DOUT_B,
    CAS_OUT_EN_A,
    CAS_OUT_EN_B,
    CAS_OUT_RDACCESS_A,
    CAS_OUT_RDACCESS_B,
    CAS_OUT_RDB_WR_A,
    CAS_OUT_RDB_WR_B,
    CAS_OUT_SBITERR_A,
    CAS_OUT_SBITERR_B,
    DBITERR_A,
    DBITERR_B,
    DOUT_A,
    DOUT_B,
    RDACCESS_A,
    RDACCESS_B,
    SBITERR_A,
    SBITERR_B,
    ADDR_A,
    ADDR_B,
    BWE_A,
    BWE_B,
    CAS_IN_ADDR_A,
    CAS_IN_ADDR_B,
    CAS_IN_BWE_A,
    CAS_IN_BWE_B,
    CAS_IN_DBITERR_A,
    CAS_IN_DBITERR_B,
    CAS_IN_DIN_A,
    CAS_IN_DIN_B,
    CAS_IN_DOUT_A,
    CAS_IN_DOUT_B,
    CAS_IN_EN_A,
    CAS_IN_EN_B,
    CAS_IN_RDACCESS_A,
    CAS_IN_RDACCESS_B,
    CAS_IN_RDB_WR_A,
    CAS_IN_RDB_WR_B,
    CAS_IN_SBITERR_A,
    CAS_IN_SBITERR_B,
    CLK,
    DIN_A,
    DIN_B,
    EN_A,
    EN_B,
    INJECT_DBITERR_A,
    INJECT_DBITERR_B,
    INJECT_SBITERR_A,
    INJECT_SBITERR_B,
    OREG_CE_A,
    OREG_CE_B,
    OREG_ECC_CE_A,
    OREG_ECC_CE_B,
    RDB_WR_A,
    RDB_WR_B,
    RST_A,
    RST_B,
    SLEEP,
    DI,
    CCLK,
    VLD);
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

  wire [22:0]ADDR_A;
  wire [22:0]ADDR_B;
  wire [8:0]BWE_A;
  wire [8:0]BWE_B;
  wire [22:0]CAS_IN_ADDR_A;
  wire [22:0]CAS_IN_ADDR_B;
  wire [8:0]CAS_IN_BWE_A;
  wire [8:0]CAS_IN_BWE_B;
  wire CAS_IN_DBITERR_A;
  wire CAS_IN_DBITERR_B;
  wire [71:0]CAS_IN_DIN_A;
  wire [71:0]CAS_IN_DIN_B;
  wire [71:0]CAS_IN_DOUT_A;
  wire [71:0]CAS_IN_DOUT_B;
  wire CAS_IN_EN_A;
  wire CAS_IN_EN_B;
  wire CAS_IN_RDACCESS_A;
  wire CAS_IN_RDACCESS_B;
  wire CAS_IN_RDB_WR_A;
  wire CAS_IN_RDB_WR_B;
  wire CAS_IN_SBITERR_A;
  wire CAS_IN_SBITERR_B;
  wire [22:0]CAS_OUT_ADDR_A;
  wire [22:0]CAS_OUT_ADDR_B;
  wire [8:0]CAS_OUT_BWE_A;
  wire [8:0]CAS_OUT_BWE_B;
  wire CAS_OUT_DBITERR_A;
  wire CAS_OUT_DBITERR_B;
  wire [71:0]CAS_OUT_DIN_A;
  wire [71:0]CAS_OUT_DIN_B;
  wire [71:0]CAS_OUT_DOUT_A;
  wire [71:0]CAS_OUT_DOUT_B;
  wire CAS_OUT_EN_A;
  wire CAS_OUT_EN_B;
  wire CAS_OUT_RDACCESS_A;
  wire CAS_OUT_RDACCESS_B;
  wire CAS_OUT_RDB_WR_A;
  wire CAS_OUT_RDB_WR_B;
  wire CAS_OUT_SBITERR_A;
  wire CAS_OUT_SBITERR_B;
  wire CCLK;
  wire CLK;
  wire DBITERR_A;
  wire DBITERR_B;
  wire [31:0]DI;
  wire [71:0]DIN_A;
  wire [71:0]DIN_B;
  wire [71:0]DOUT_A;
  wire [71:0]DOUT_B;
  wire EN_A;
  wire EN_B;
  wire INJECT_DBITERR_A;
  wire INJECT_DBITERR_B;
  wire INJECT_SBITERR_A;
  wire INJECT_SBITERR_B;
  wire OREG_CE_A;
  wire OREG_CE_B;
  wire OREG_ECC_CE_A;
  wire OREG_ECC_CE_B;
  wire RDACCESS_A;
  wire RDACCESS_B;
  wire RDB_WR_A;
  wire RDB_WR_B;
  wire RST_A;
  wire RST_B;
  wire SBITERR_A;
  wire SBITERR_B;
  wire SLEEP;
  wire VLD;

  (* AUTO_SLEEP_LATENCY = "8" *) 
  (* AVG_CONS_INACTIVE_CYCLES = "10" *) 
  (* BWE_MODE_A = "PARITY_INTERLEAVED" *) 
  (* BWE_MODE_B = "PARITY_INTERLEAVED" *) 
  (* CASCADE_ORDER_A = "NONE" *) 
  (* CASCADE_ORDER_B = "NONE" *) 
  (* EN_AUTO_SLEEP_MODE = "FALSE" *) 
  (* EN_ECC_RD_A = "FALSE" *) 
  (* EN_ECC_RD_B = "FALSE" *) 
  (* EN_ECC_WR_A = "FALSE" *) 
  (* EN_ECC_WR_B = "FALSE" *) 
  (* IREG_PRE_A = "FALSE" *) 
  (* IREG_PRE_B = "FALSE" *) 
  (* IS_CLK_INVERTED = "1'b0" *) 
  (* IS_EN_A_INVERTED = "1'b0" *) 
  (* IS_EN_B_INVERTED = "1'b0" *) 
  (* IS_RDB_WR_A_INVERTED = "1'b0" *) 
  (* IS_RDB_WR_B_INVERTED = "1'b0" *) 
  (* IS_RST_A_INVERTED = "1'b0" *) 
  (* IS_RST_B_INVERTED = "1'b0" *) 
  (* MATRIX_ID = "NONE" *) 
  (* NUM_UNIQUE_SELF_ADDR_A = "1" *) 
  (* NUM_UNIQUE_SELF_ADDR_B = "1" *) 
  (* NUM_URAM_IN_MATRIX = "1" *) 
  (* OREG_A = "FALSE" *) 
  (* OREG_B = "FALSE" *) 
  (* OREG_ECC_A = "FALSE" *) 
  (* OREG_ECC_B = "FALSE" *) 
  (* REG_CAS_A = "FALSE" *) 
  (* REG_CAS_B = "FALSE" *) 
  (* RST_MODE_A = "SYNC" *) 
  (* RST_MODE_B = "SYNC" *) 
  (* SELF_ADDR_A = "11'b00000000000" *) 
  (* SELF_ADDR_B = "11'b00000000000" *) 
  (* SELF_MASK_A = "11'b11111111111" *) 
  (* SELF_MASK_B = "11'b11111111111" *) 
  (* USE_EXT_CE_A = "FALSE" *) 
  (* USE_EXT_CE_B = "FALSE" *) 
  xilinx_ram_uram_rd_back_v1_0_0 inst
       (.ADDR_A(ADDR_A),
        .ADDR_B(ADDR_B),
        .BWE_A(BWE_A),
        .BWE_B(BWE_B),
        .CAS_IN_ADDR_A(CAS_IN_ADDR_A),
        .CAS_IN_ADDR_B(CAS_IN_ADDR_B),
        .CAS_IN_BWE_A(CAS_IN_BWE_A),
        .CAS_IN_BWE_B(CAS_IN_BWE_B),
        .CAS_IN_DBITERR_A(CAS_IN_DBITERR_A),
        .CAS_IN_DBITERR_B(CAS_IN_DBITERR_B),
        .CAS_IN_DIN_A(CAS_IN_DIN_A),
        .CAS_IN_DIN_B(CAS_IN_DIN_B),
        .CAS_IN_DOUT_A(CAS_IN_DOUT_A),
        .CAS_IN_DOUT_B(CAS_IN_DOUT_B),
        .CAS_IN_EN_A(CAS_IN_EN_A),
        .CAS_IN_EN_B(CAS_IN_EN_B),
        .CAS_IN_RDACCESS_A(CAS_IN_RDACCESS_A),
        .CAS_IN_RDACCESS_B(CAS_IN_RDACCESS_B),
        .CAS_IN_RDB_WR_A(CAS_IN_RDB_WR_A),
        .CAS_IN_RDB_WR_B(CAS_IN_RDB_WR_B),
        .CAS_IN_SBITERR_A(CAS_IN_SBITERR_A),
        .CAS_IN_SBITERR_B(CAS_IN_SBITERR_B),
        .CAS_OUT_ADDR_A(CAS_OUT_ADDR_A),
        .CAS_OUT_ADDR_B(CAS_OUT_ADDR_B),
        .CAS_OUT_BWE_A(CAS_OUT_BWE_A),
        .CAS_OUT_BWE_B(CAS_OUT_BWE_B),
        .CAS_OUT_DBITERR_A(CAS_OUT_DBITERR_A),
        .CAS_OUT_DBITERR_B(CAS_OUT_DBITERR_B),
        .CAS_OUT_DIN_A(CAS_OUT_DIN_A),
        .CAS_OUT_DIN_B(CAS_OUT_DIN_B),
        .CAS_OUT_DOUT_A(CAS_OUT_DOUT_A),
        .CAS_OUT_DOUT_B(CAS_OUT_DOUT_B),
        .CAS_OUT_EN_A(CAS_OUT_EN_A),
        .CAS_OUT_EN_B(CAS_OUT_EN_B),
        .CAS_OUT_RDACCESS_A(CAS_OUT_RDACCESS_A),
        .CAS_OUT_RDACCESS_B(CAS_OUT_RDACCESS_B),
        .CAS_OUT_RDB_WR_A(CAS_OUT_RDB_WR_A),
        .CAS_OUT_RDB_WR_B(CAS_OUT_RDB_WR_B),
        .CAS_OUT_SBITERR_A(CAS_OUT_SBITERR_A),
        .CAS_OUT_SBITERR_B(CAS_OUT_SBITERR_B),
        .CCLK(CCLK),
        .CLK(CLK),
        .DBITERR_A(DBITERR_A),
        .DBITERR_B(DBITERR_B),
        .DI(DI),
        .DIN_A(DIN_A),
        .DIN_B(DIN_B),
        .DOUT_A(DOUT_A),
        .DOUT_B(DOUT_B),
        .EN_A(EN_A),
        .EN_B(EN_B),
        .INJECT_DBITERR_A(INJECT_DBITERR_A),
        .INJECT_DBITERR_B(INJECT_DBITERR_B),
        .INJECT_SBITERR_A(INJECT_SBITERR_A),
        .INJECT_SBITERR_B(INJECT_SBITERR_B),
        .OREG_CE_A(OREG_CE_A),
        .OREG_CE_B(OREG_CE_B),
        .OREG_ECC_CE_A(OREG_ECC_CE_A),
        .OREG_ECC_CE_B(OREG_ECC_CE_B),
        .RDACCESS_A(RDACCESS_A),
        .RDACCESS_B(RDACCESS_B),
        .RDB_WR_A(RDB_WR_A),
        .RDB_WR_B(RDB_WR_B),
        .RST_A(RST_A),
        .RST_B(RST_B),
        .SBITERR_A(SBITERR_A),
        .SBITERR_B(SBITERR_B),
        .SLEEP(SLEEP),
        .VLD(VLD));
endmodule

(* AUTO_SLEEP_LATENCY = "8" *) (* AVG_CONS_INACTIVE_CYCLES = "10" *) (* BWE_MODE_A = "PARITY_INTERLEAVED" *) 
(* BWE_MODE_B = "PARITY_INTERLEAVED" *) (* CASCADE_ORDER_A = "NONE" *) (* CASCADE_ORDER_B = "NONE" *) 
(* EN_AUTO_SLEEP_MODE = "FALSE" *) (* EN_ECC_RD_A = "FALSE" *) (* EN_ECC_RD_B = "FALSE" *) 
(* EN_ECC_WR_A = "FALSE" *) (* EN_ECC_WR_B = "FALSE" *) (* IREG_PRE_A = "FALSE" *) 
(* IREG_PRE_B = "FALSE" *) (* IS_CLK_INVERTED = "1'b0" *) (* IS_EN_A_INVERTED = "1'b0" *) 
(* IS_EN_B_INVERTED = "1'b0" *) (* IS_RDB_WR_A_INVERTED = "1'b0" *) (* IS_RDB_WR_B_INVERTED = "1'b0" *) 
(* IS_RST_A_INVERTED = "1'b0" *) (* IS_RST_B_INVERTED = "1'b0" *) (* MATRIX_ID = "NONE" *) 
(* NUM_UNIQUE_SELF_ADDR_A = "1" *) (* NUM_UNIQUE_SELF_ADDR_B = "1" *) (* NUM_URAM_IN_MATRIX = "1" *) 
(* OREG_A = "FALSE" *) (* OREG_B = "FALSE" *) (* OREG_ECC_A = "FALSE" *) 
(* OREG_ECC_B = "FALSE" *) (* REG_CAS_A = "FALSE" *) (* REG_CAS_B = "FALSE" *) 
(* RST_MODE_A = "SYNC" *) (* RST_MODE_B = "SYNC" *) (* SELF_ADDR_A = "11'b00000000000" *) 
(* SELF_ADDR_B = "11'b00000000000" *) (* SELF_MASK_A = "11'b11111111111" *) (* SELF_MASK_B = "11'b11111111111" *) 
(* USE_EXT_CE_A = "FALSE" *) (* USE_EXT_CE_B = "FALSE" *) 
module xilinx_ram_uram_rd_back_v1_0_0
   (CAS_OUT_ADDR_A,
    CAS_OUT_ADDR_B,
    CAS_OUT_BWE_A,
    CAS_OUT_BWE_B,
    CAS_OUT_DBITERR_A,
    CAS_OUT_DBITERR_B,
    CAS_OUT_DIN_A,
    CAS_OUT_DIN_B,
    CAS_OUT_DOUT_A,
    CAS_OUT_DOUT_B,
    CAS_OUT_EN_A,
    CAS_OUT_EN_B,
    CAS_OUT_RDACCESS_A,
    CAS_OUT_RDACCESS_B,
    CAS_OUT_RDB_WR_A,
    CAS_OUT_RDB_WR_B,
    CAS_OUT_SBITERR_A,
    CAS_OUT_SBITERR_B,
    DBITERR_A,
    DBITERR_B,
    DOUT_A,
    DOUT_B,
    RDACCESS_A,
    RDACCESS_B,
    SBITERR_A,
    SBITERR_B,
    ADDR_A,
    ADDR_B,
    BWE_A,
    BWE_B,
    CAS_IN_ADDR_A,
    CAS_IN_ADDR_B,
    CAS_IN_BWE_A,
    CAS_IN_BWE_B,
    CAS_IN_DBITERR_A,
    CAS_IN_DBITERR_B,
    CAS_IN_DIN_A,
    CAS_IN_DIN_B,
    CAS_IN_DOUT_A,
    CAS_IN_DOUT_B,
    CAS_IN_EN_A,
    CAS_IN_EN_B,
    CAS_IN_RDACCESS_A,
    CAS_IN_RDACCESS_B,
    CAS_IN_RDB_WR_A,
    CAS_IN_RDB_WR_B,
    CAS_IN_SBITERR_A,
    CAS_IN_SBITERR_B,
    CLK,
    DIN_A,
    DIN_B,
    EN_A,
    EN_B,
    INJECT_DBITERR_A,
    INJECT_DBITERR_B,
    INJECT_SBITERR_A,
    INJECT_SBITERR_B,
    OREG_CE_A,
    OREG_CE_B,
    OREG_ECC_CE_A,
    OREG_ECC_CE_B,
    RDB_WR_A,
    RDB_WR_B,
    RST_A,
    RST_B,
    SLEEP,
    DI,
    CCLK,
    VLD);
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

  wire [22:0]ADDR_A;
  wire [22:0]ADDR_B;
  wire [8:0]BWE_A;
  wire [8:0]BWE_B;
  wire [22:0]CAS_IN_ADDR_A;
  wire [22:0]CAS_IN_ADDR_B;
  wire [8:0]CAS_IN_BWE_A;
  wire [8:0]CAS_IN_BWE_B;
  wire CAS_IN_DBITERR_A;
  wire CAS_IN_DBITERR_B;
  wire [71:0]CAS_IN_DIN_A;
  wire [71:0]CAS_IN_DIN_B;
  wire [71:0]CAS_IN_DOUT_A;
  wire [71:0]CAS_IN_DOUT_B;
  wire CAS_IN_EN_A;
  wire CAS_IN_EN_B;
  wire CAS_IN_RDACCESS_A;
  wire CAS_IN_RDACCESS_B;
  wire CAS_IN_RDB_WR_A;
  wire CAS_IN_RDB_WR_B;
  wire CAS_IN_SBITERR_A;
  wire CAS_IN_SBITERR_B;
  wire [22:0]CAS_OUT_ADDR_A;
  wire [22:0]CAS_OUT_ADDR_B;
  wire [8:0]CAS_OUT_BWE_A;
  wire [8:0]CAS_OUT_BWE_B;
  wire CAS_OUT_DBITERR_A;
  wire CAS_OUT_DBITERR_B;
  wire [71:0]CAS_OUT_DIN_A;
  wire [71:0]CAS_OUT_DIN_B;
  wire [71:0]CAS_OUT_DOUT_A;
  wire [71:0]CAS_OUT_DOUT_B;
  wire CAS_OUT_EN_A;
  wire CAS_OUT_EN_B;
  wire CAS_OUT_RDACCESS_A;
  wire CAS_OUT_RDACCESS_B;
  wire CAS_OUT_RDB_WR_A;
  wire CAS_OUT_RDB_WR_B;
  wire CAS_OUT_SBITERR_A;
  wire CAS_OUT_SBITERR_B;
  wire CCLK;
  wire CLK;
  wire DBITERR_A;
  wire DBITERR_B;
  wire [31:0]DI;
  wire [71:0]DIN_A;
  wire [71:0]DIN_B;
  wire [71:0]DOUT_A;
  wire [71:0]DOUT_B;
  wire EN_A;
  wire EN_B;
  wire INJECT_DBITERR_A;
  wire INJECT_DBITERR_B;
  wire INJECT_SBITERR_A;
  wire INJECT_SBITERR_B;
  wire OREG_CE_A;
  wire OREG_CE_B;
  wire OREG_ECC_CE_A;
  wire OREG_ECC_CE_B;
  wire RDACCESS_A;
  wire RDACCESS_B;
  wire RDB_WR_A;
  wire RDB_WR_B;
  wire RST_A;
  wire RST_B;
  wire SBITERR_A;
  wire SBITERR_B;
  wire SLEEP;
  wire VLD;

  xilinx_ram_uram_rd_back_v1_0_0_top uram_rd_back_top_inst
       (.ADDR_A(ADDR_A),
        .ADDR_B(ADDR_B),
        .BWE_A(BWE_A),
        .BWE_B(BWE_B),
        .CAS_IN_ADDR_A(CAS_IN_ADDR_A),
        .CAS_IN_ADDR_B(CAS_IN_ADDR_B),
        .CAS_IN_BWE_A(CAS_IN_BWE_A),
        .CAS_IN_BWE_B(CAS_IN_BWE_B),
        .CAS_IN_DBITERR_A(CAS_IN_DBITERR_A),
        .CAS_IN_DBITERR_B(CAS_IN_DBITERR_B),
        .CAS_IN_DIN_A(CAS_IN_DIN_A),
        .CAS_IN_DIN_B(CAS_IN_DIN_B),
        .CAS_IN_DOUT_A(CAS_IN_DOUT_A),
        .CAS_IN_DOUT_B(CAS_IN_DOUT_B),
        .CAS_IN_EN_A(CAS_IN_EN_A),
        .CAS_IN_EN_B(CAS_IN_EN_B),
        .CAS_IN_RDACCESS_A(CAS_IN_RDACCESS_A),
        .CAS_IN_RDACCESS_B(CAS_IN_RDACCESS_B),
        .CAS_IN_RDB_WR_A(CAS_IN_RDB_WR_A),
        .CAS_IN_RDB_WR_B(CAS_IN_RDB_WR_B),
        .CAS_IN_SBITERR_A(CAS_IN_SBITERR_A),
        .CAS_IN_SBITERR_B(CAS_IN_SBITERR_B),
        .CAS_OUT_ADDR_A(CAS_OUT_ADDR_A),
        .CAS_OUT_ADDR_B(CAS_OUT_ADDR_B),
        .CAS_OUT_BWE_A(CAS_OUT_BWE_A),
        .CAS_OUT_BWE_B(CAS_OUT_BWE_B),
        .CAS_OUT_DBITERR_A(CAS_OUT_DBITERR_A),
        .CAS_OUT_DBITERR_B(CAS_OUT_DBITERR_B),
        .CAS_OUT_DIN_A(CAS_OUT_DIN_A),
        .CAS_OUT_DIN_B(CAS_OUT_DIN_B),
        .CAS_OUT_DOUT_A(CAS_OUT_DOUT_A),
        .CAS_OUT_DOUT_B(CAS_OUT_DOUT_B),
        .CAS_OUT_EN_A(CAS_OUT_EN_A),
        .CAS_OUT_EN_B(CAS_OUT_EN_B),
        .CAS_OUT_RDACCESS_A(CAS_OUT_RDACCESS_A),
        .CAS_OUT_RDACCESS_B(CAS_OUT_RDACCESS_B),
        .CAS_OUT_RDB_WR_A(CAS_OUT_RDB_WR_A),
        .CAS_OUT_RDB_WR_B(CAS_OUT_RDB_WR_B),
        .CAS_OUT_SBITERR_A(CAS_OUT_SBITERR_A),
        .CAS_OUT_SBITERR_B(CAS_OUT_SBITERR_B),
        .CCLK(CCLK),
        .CLK(CLK),
        .DBITERR_A(DBITERR_A),
        .DBITERR_B(DBITERR_B),
        .DI(DI),
        .DIN_A(DIN_A),
        .DIN_B(DIN_B),
        .DOUT_A(DOUT_A),
        .DOUT_B(DOUT_B),
        .EN_A(EN_A),
        .EN_B(EN_B),
        .INJECT_DBITERR_A(INJECT_DBITERR_A),
        .INJECT_DBITERR_B(INJECT_DBITERR_B),
        .INJECT_SBITERR_A(INJECT_SBITERR_A),
        .INJECT_SBITERR_B(INJECT_SBITERR_B),
        .OREG_CE_A(OREG_CE_A),
        .OREG_CE_B(OREG_CE_B),
        .OREG_ECC_CE_A(OREG_ECC_CE_A),
        .OREG_ECC_CE_B(OREG_ECC_CE_B),
        .RDACCESS_A(RDACCESS_A),
        .RDACCESS_B(RDACCESS_B),
        .RDB_WR_A(RDB_WR_A),
        .RDB_WR_B(RDB_WR_B),
        .RST_A(RST_A),
        .RST_B(RST_B),
        .SBITERR_A(SBITERR_A),
        .SBITERR_B(SBITERR_B),
        .SLEEP(SLEEP),
        .VLD(VLD));
endmodule

module xilinx_ram_uram_rd_back_v1_0_0_top
   (CAS_OUT_DBITERR_A,
    CAS_OUT_DBITERR_B,
    CAS_OUT_EN_A,
    CAS_OUT_EN_B,
    CAS_OUT_RDACCESS_A,
    CAS_OUT_RDACCESS_B,
    CAS_OUT_RDB_WR_A,
    CAS_OUT_RDB_WR_B,
    CAS_OUT_SBITERR_A,
    CAS_OUT_SBITERR_B,
    DBITERR_A,
    DBITERR_B,
    RDACCESS_A,
    RDACCESS_B,
    SBITERR_A,
    SBITERR_B,
    CAS_OUT_ADDR_A,
    CAS_OUT_ADDR_B,
    CAS_OUT_DIN_A,
    CAS_OUT_DIN_B,
    CAS_OUT_DOUT_A,
    CAS_OUT_DOUT_B,
    DOUT_A,
    DOUT_B,
    CAS_OUT_BWE_A,
    CAS_OUT_BWE_B,
    DI,
    VLD,
    CCLK,
    CLK,
    CAS_IN_DBITERR_A,
    CAS_IN_DBITERR_B,
    CAS_IN_EN_A,
    CAS_IN_EN_B,
    CAS_IN_RDACCESS_A,
    CAS_IN_RDACCESS_B,
    CAS_IN_RDB_WR_A,
    CAS_IN_RDB_WR_B,
    CAS_IN_SBITERR_A,
    CAS_IN_SBITERR_B,
    RST_A,
    SLEEP,
    CAS_IN_ADDR_A,
    CAS_IN_ADDR_B,
    CAS_IN_DIN_A,
    CAS_IN_DIN_B,
    CAS_IN_DOUT_A,
    CAS_IN_DOUT_B,
    CAS_IN_BWE_A,
    CAS_IN_BWE_B,
    RST_B,
    ADDR_B,
    INJECT_DBITERR_B,
    INJECT_SBITERR_B,
    OREG_CE_B,
    OREG_ECC_CE_B,
    EN_A,
    ADDR_A,
    BWE_A,
    DIN_A,
    INJECT_DBITERR_A,
    INJECT_SBITERR_A,
    OREG_CE_A,
    OREG_ECC_CE_A,
    RDB_WR_A,
    BWE_B,
    RDB_WR_B,
    DIN_B,
    EN_B);
  output CAS_OUT_DBITERR_A;
  output CAS_OUT_DBITERR_B;
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
  output RDACCESS_A;
  output RDACCESS_B;
  output SBITERR_A;
  output SBITERR_B;
  output [22:0]CAS_OUT_ADDR_A;
  output [22:0]CAS_OUT_ADDR_B;
  output [71:0]CAS_OUT_DIN_A;
  output [71:0]CAS_OUT_DIN_B;
  output [71:0]CAS_OUT_DOUT_A;
  output [71:0]CAS_OUT_DOUT_B;
  output [71:0]DOUT_A;
  output [71:0]DOUT_B;
  output [8:0]CAS_OUT_BWE_A;
  output [8:0]CAS_OUT_BWE_B;
  input [31:0]DI;
  input VLD;
  input CCLK;
  input CLK;
  input CAS_IN_DBITERR_A;
  input CAS_IN_DBITERR_B;
  input CAS_IN_EN_A;
  input CAS_IN_EN_B;
  input CAS_IN_RDACCESS_A;
  input CAS_IN_RDACCESS_B;
  input CAS_IN_RDB_WR_A;
  input CAS_IN_RDB_WR_B;
  input CAS_IN_SBITERR_A;
  input CAS_IN_SBITERR_B;
  input RST_A;
  input SLEEP;
  input [22:0]CAS_IN_ADDR_A;
  input [22:0]CAS_IN_ADDR_B;
  input [71:0]CAS_IN_DIN_A;
  input [71:0]CAS_IN_DIN_B;
  input [71:0]CAS_IN_DOUT_A;
  input [71:0]CAS_IN_DOUT_B;
  input [8:0]CAS_IN_BWE_A;
  input [8:0]CAS_IN_BWE_B;
  input RST_B;
  input [22:0]ADDR_B;
  input INJECT_DBITERR_B;
  input INJECT_SBITERR_B;
  input OREG_CE_B;
  input OREG_ECC_CE_B;
  input EN_A;
  input [22:0]ADDR_A;
  input [8:0]BWE_A;
  input [71:0]DIN_A;
  input INJECT_DBITERR_A;
  input INJECT_SBITERR_A;
  input OREG_CE_A;
  input OREG_ECC_CE_A;
  input RDB_WR_A;
  input [8:0]BWE_B;
  input RDB_WR_B;
  input [71:0]DIN_B;
  input EN_B;

  wire [22:0]ADDR_A;
  wire [22:0]ADDR_A_R;
  wire [22:0]ADDR_B;
  wire [22:0]ADDR_URAM;
  wire [8:0]BWE_A;
  wire [8:0]BWE_A_R;
  wire [8:0]BWE_B;
  wire [8:0]BWE_URAM;
  wire [22:0]CAS_IN_ADDR_A;
  wire [22:0]CAS_IN_ADDR_B;
  wire [8:0]CAS_IN_BWE_A;
  wire [8:0]CAS_IN_BWE_B;
  wire CAS_IN_DBITERR_A;
  wire CAS_IN_DBITERR_B;
  wire [71:0]CAS_IN_DIN_A;
  wire [71:0]CAS_IN_DIN_B;
  wire [71:0]CAS_IN_DOUT_A;
  wire [71:0]CAS_IN_DOUT_B;
  wire CAS_IN_EN_A;
  wire CAS_IN_EN_B;
  wire CAS_IN_RDACCESS_A;
  wire CAS_IN_RDACCESS_B;
  wire CAS_IN_RDB_WR_A;
  wire CAS_IN_RDB_WR_B;
  wire CAS_IN_SBITERR_A;
  wire CAS_IN_SBITERR_B;
  wire [22:0]CAS_OUT_ADDR_A;
  wire [22:0]CAS_OUT_ADDR_B;
  wire [8:0]CAS_OUT_BWE_A;
  wire [8:0]CAS_OUT_BWE_B;
  wire CAS_OUT_DBITERR_A;
  wire CAS_OUT_DBITERR_B;
  wire [71:0]CAS_OUT_DIN_A;
  wire [71:0]CAS_OUT_DIN_B;
  wire [71:0]CAS_OUT_DOUT_A;
  wire [71:0]CAS_OUT_DOUT_B;
  wire CAS_OUT_EN_A;
  wire CAS_OUT_EN_B;
  wire CAS_OUT_RDACCESS_A;
  wire CAS_OUT_RDACCESS_B;
  wire CAS_OUT_RDB_WR_A;
  wire CAS_OUT_RDB_WR_B;
  wire CAS_OUT_SBITERR_A;
  wire CAS_OUT_SBITERR_B;
  wire CCLK;
  wire CE00;
  wire CLK;
  wire CLK_URAM;
  wire DBITERR_A;
  wire DBITERR_B;
  wire [31:0]DI;
  wire [71:0]DIN_A;
  wire [71:0]DIN_A_R;
  wire [71:0]DIN_B;
  wire [71:0]DIN_URAM;
  wire [71:0]DOUT_A;
  wire [71:0]DOUT_B;
  wire ENA_URAM;
  wire EN_A;
  wire EN_B;
  wire EN_URAM;
  wire INJECT_DBITERR_A;
  wire INJECT_DBITERR_A_R;
  wire INJECT_DBITERR_B;
  wire INJECT_DBITERR_URAM;
  wire INJECT_SBITERR_A;
  wire INJECT_SBITERR_A_R;
  wire INJECT_SBITERR_B;
  wire INJECT_SBITERR_URAM;
  wire OREG_CE_A;
  wire OREG_CE_A_R;
  wire OREG_CE_B;
  wire OREG_CE_URAM;
  wire OREG_ECC_CE_A;
  wire OREG_ECC_CE_A_R;
  wire OREG_ECC_CE_B;
  wire OREG_ECC_CE_URAM;
  wire RDACCESS_A;
  wire RDACCESS_B;
  wire RDB_WR_A;
  wire RDB_WR_A_R;
  wire RDB_WR_B;
  wire RDB_WR_URAM;
  wire RST_A;
  wire RST_B;
  wire RST_CFG1;
  wire RST_CFG2;
  wire RST_URAM;
  wire SBITERR_A;
  wire SBITERR_B;
  wire SLEEP;
  wire VLD;
  wire control;
  wire uram_rdb_wrd_fsm_inst_n_1;
  wire uram_rdb_wrd_fsm_inst_n_10;
  wire uram_rdb_wrd_fsm_inst_n_11;
  wire uram_rdb_wrd_fsm_inst_n_12;
  wire uram_rdb_wrd_fsm_inst_n_13;
  wire uram_rdb_wrd_fsm_inst_n_14;
  wire uram_rdb_wrd_fsm_inst_n_15;
  wire uram_rdb_wrd_fsm_inst_n_16;
  wire uram_rdb_wrd_fsm_inst_n_17;
  wire uram_rdb_wrd_fsm_inst_n_18;
  wire uram_rdb_wrd_fsm_inst_n_19;
  wire uram_rdb_wrd_fsm_inst_n_2;
  wire uram_rdb_wrd_fsm_inst_n_20;
  wire uram_rdb_wrd_fsm_inst_n_21;
  wire uram_rdb_wrd_fsm_inst_n_22;
  wire uram_rdb_wrd_fsm_inst_n_23;
  wire uram_rdb_wrd_fsm_inst_n_24;
  wire uram_rdb_wrd_fsm_inst_n_25;
  wire uram_rdb_wrd_fsm_inst_n_26;
  wire uram_rdb_wrd_fsm_inst_n_27;
  wire uram_rdb_wrd_fsm_inst_n_28;
  wire uram_rdb_wrd_fsm_inst_n_29;
  wire uram_rdb_wrd_fsm_inst_n_3;
  wire uram_rdb_wrd_fsm_inst_n_30;
  wire uram_rdb_wrd_fsm_inst_n_31;
  wire uram_rdb_wrd_fsm_inst_n_32;
  wire uram_rdb_wrd_fsm_inst_n_33;
  wire uram_rdb_wrd_fsm_inst_n_34;
  wire uram_rdb_wrd_fsm_inst_n_35;
  wire uram_rdb_wrd_fsm_inst_n_36;
  wire uram_rdb_wrd_fsm_inst_n_37;
  wire uram_rdb_wrd_fsm_inst_n_38;
  wire uram_rdb_wrd_fsm_inst_n_39;
  wire uram_rdb_wrd_fsm_inst_n_4;
  wire uram_rdb_wrd_fsm_inst_n_40;
  wire uram_rdb_wrd_fsm_inst_n_41;
  wire uram_rdb_wrd_fsm_inst_n_42;
  wire uram_rdb_wrd_fsm_inst_n_43;
  wire uram_rdb_wrd_fsm_inst_n_44;
  wire uram_rdb_wrd_fsm_inst_n_45;
  wire uram_rdb_wrd_fsm_inst_n_46;
  wire uram_rdb_wrd_fsm_inst_n_47;
  wire uram_rdb_wrd_fsm_inst_n_48;
  wire uram_rdb_wrd_fsm_inst_n_49;
  wire uram_rdb_wrd_fsm_inst_n_5;
  wire uram_rdb_wrd_fsm_inst_n_50;
  wire uram_rdb_wrd_fsm_inst_n_51;
  wire uram_rdb_wrd_fsm_inst_n_52;
  wire uram_rdb_wrd_fsm_inst_n_53;
  wire uram_rdb_wrd_fsm_inst_n_54;
  wire uram_rdb_wrd_fsm_inst_n_55;
  wire uram_rdb_wrd_fsm_inst_n_56;
  wire uram_rdb_wrd_fsm_inst_n_57;
  wire uram_rdb_wrd_fsm_inst_n_58;
  wire uram_rdb_wrd_fsm_inst_n_59;
  wire uram_rdb_wrd_fsm_inst_n_6;
  wire uram_rdb_wrd_fsm_inst_n_60;
  wire uram_rdb_wrd_fsm_inst_n_61;
  wire uram_rdb_wrd_fsm_inst_n_62;
  wire uram_rdb_wrd_fsm_inst_n_63;
  wire uram_rdb_wrd_fsm_inst_n_64;
  wire uram_rdb_wrd_fsm_inst_n_65;
  wire uram_rdb_wrd_fsm_inst_n_66;
  wire uram_rdb_wrd_fsm_inst_n_67;
  wire uram_rdb_wrd_fsm_inst_n_68;
  wire uram_rdb_wrd_fsm_inst_n_69;
  wire uram_rdb_wrd_fsm_inst_n_7;
  wire uram_rdb_wrd_fsm_inst_n_70;
  wire uram_rdb_wrd_fsm_inst_n_71;
  wire uram_rdb_wrd_fsm_inst_n_72;
  wire uram_rdb_wrd_fsm_inst_n_73;
  wire uram_rdb_wrd_fsm_inst_n_74;
  wire uram_rdb_wrd_fsm_inst_n_75;
  wire uram_rdb_wrd_fsm_inst_n_76;
  wire uram_rdb_wrd_fsm_inst_n_77;
  wire uram_rdb_wrd_fsm_inst_n_78;
  wire uram_rdb_wrd_fsm_inst_n_79;
  wire uram_rdb_wrd_fsm_inst_n_8;
  wire uram_rdb_wrd_fsm_inst_n_80;
  wire uram_rdb_wrd_fsm_inst_n_81;
  wire uram_rdb_wrd_fsm_inst_n_82;
  wire uram_rdb_wrd_fsm_inst_n_83;
  wire uram_rdb_wrd_fsm_inst_n_85;
  wire uram_rdb_wrd_fsm_inst_n_86;
  wire uram_rdb_wrd_fsm_inst_n_87;
  wire uram_rdb_wrd_fsm_inst_n_88;
  wire uram_rdb_wrd_fsm_inst_n_89;
  wire uram_rdb_wrd_fsm_inst_n_9;
  wire uram_rdb_wrd_fsm_inst_n_90;
  wire uram_rdb_wrd_fsm_inst_n_91;
  wire uram_rdb_wrd_fsm_inst_n_92;
  wire uram_rdb_wrd_fsm_inst_n_93;
  wire uram_rdb_wrd_fsm_inst_n_94;
  wire uram_rdb_wrd_fsm_inst_n_95;
  wire uram_rdb_wrd_fsm_inst_n_96;

  FDRE \ADDR_A_R_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[0]),
        .Q(ADDR_A_R[0]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[10]),
        .Q(ADDR_A_R[10]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[11]),
        .Q(ADDR_A_R[11]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[12]),
        .Q(ADDR_A_R[12]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[13]),
        .Q(ADDR_A_R[13]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[14]),
        .Q(ADDR_A_R[14]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[15]),
        .Q(ADDR_A_R[15]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[16]),
        .Q(ADDR_A_R[16]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[17]),
        .Q(ADDR_A_R[17]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[18]),
        .Q(ADDR_A_R[18]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[19]),
        .Q(ADDR_A_R[19]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[1]),
        .Q(ADDR_A_R[1]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[20]),
        .Q(ADDR_A_R[20]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[21] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[21]),
        .Q(ADDR_A_R[21]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[22] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[22]),
        .Q(ADDR_A_R[22]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[2]),
        .Q(ADDR_A_R[2]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[3]),
        .Q(ADDR_A_R[3]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[4]),
        .Q(ADDR_A_R[4]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[5]),
        .Q(ADDR_A_R[5]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[6]),
        .Q(ADDR_A_R[6]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[7]),
        .Q(ADDR_A_R[7]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[8]),
        .Q(ADDR_A_R[8]),
        .R(1'b0));
  FDRE \ADDR_A_R_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(ADDR_A[9]),
        .Q(ADDR_A_R[9]),
        .R(1'b0));
  FDRE \BWE_A_R_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(BWE_A[0]),
        .Q(BWE_A_R[0]),
        .R(1'b0));
  FDRE \BWE_A_R_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(BWE_A[1]),
        .Q(BWE_A_R[1]),
        .R(1'b0));
  FDRE \BWE_A_R_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(BWE_A[2]),
        .Q(BWE_A_R[2]),
        .R(1'b0));
  FDRE \BWE_A_R_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(BWE_A[3]),
        .Q(BWE_A_R[3]),
        .R(1'b0));
  FDRE \BWE_A_R_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(BWE_A[4]),
        .Q(BWE_A_R[4]),
        .R(1'b0));
  FDRE \BWE_A_R_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(BWE_A[5]),
        .Q(BWE_A_R[5]),
        .R(1'b0));
  FDRE \BWE_A_R_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(BWE_A[6]),
        .Q(BWE_A_R[6]),
        .R(1'b0));
  FDRE \BWE_A_R_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(BWE_A[7]),
        .Q(BWE_A_R[7]),
        .R(1'b0));
  FDRE \BWE_A_R_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(BWE_A[8]),
        .Q(BWE_A_R[8]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[0]),
        .Q(DIN_A_R[0]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[10]),
        .Q(DIN_A_R[10]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[11]),
        .Q(DIN_A_R[11]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[12]),
        .Q(DIN_A_R[12]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[13]),
        .Q(DIN_A_R[13]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[14]),
        .Q(DIN_A_R[14]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[15]),
        .Q(DIN_A_R[15]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[16]),
        .Q(DIN_A_R[16]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[17]),
        .Q(DIN_A_R[17]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[18]),
        .Q(DIN_A_R[18]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[19]),
        .Q(DIN_A_R[19]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[1]),
        .Q(DIN_A_R[1]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[20]),
        .Q(DIN_A_R[20]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[21] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[21]),
        .Q(DIN_A_R[21]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[22] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[22]),
        .Q(DIN_A_R[22]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[23] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[23]),
        .Q(DIN_A_R[23]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[24] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[24]),
        .Q(DIN_A_R[24]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[25] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[25]),
        .Q(DIN_A_R[25]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[26] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[26]),
        .Q(DIN_A_R[26]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[27] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[27]),
        .Q(DIN_A_R[27]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[28] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[28]),
        .Q(DIN_A_R[28]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[29] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[29]),
        .Q(DIN_A_R[29]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[2]),
        .Q(DIN_A_R[2]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[30] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[30]),
        .Q(DIN_A_R[30]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[31] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[31]),
        .Q(DIN_A_R[31]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[32] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[32]),
        .Q(DIN_A_R[32]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[33] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[33]),
        .Q(DIN_A_R[33]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[34] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[34]),
        .Q(DIN_A_R[34]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[35] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[35]),
        .Q(DIN_A_R[35]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[36] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[36]),
        .Q(DIN_A_R[36]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[37] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[37]),
        .Q(DIN_A_R[37]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[38] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[38]),
        .Q(DIN_A_R[38]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[39] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[39]),
        .Q(DIN_A_R[39]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[3]),
        .Q(DIN_A_R[3]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[40] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[40]),
        .Q(DIN_A_R[40]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[41] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[41]),
        .Q(DIN_A_R[41]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[42] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[42]),
        .Q(DIN_A_R[42]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[43] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[43]),
        .Q(DIN_A_R[43]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[44] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[44]),
        .Q(DIN_A_R[44]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[45] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[45]),
        .Q(DIN_A_R[45]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[46] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[46]),
        .Q(DIN_A_R[46]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[47] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[47]),
        .Q(DIN_A_R[47]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[48] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[48]),
        .Q(DIN_A_R[48]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[49] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[49]),
        .Q(DIN_A_R[49]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[4]),
        .Q(DIN_A_R[4]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[50] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[50]),
        .Q(DIN_A_R[50]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[51] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[51]),
        .Q(DIN_A_R[51]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[52] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[52]),
        .Q(DIN_A_R[52]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[53] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[53]),
        .Q(DIN_A_R[53]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[54] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[54]),
        .Q(DIN_A_R[54]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[55] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[55]),
        .Q(DIN_A_R[55]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[56] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[56]),
        .Q(DIN_A_R[56]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[57] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[57]),
        .Q(DIN_A_R[57]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[58] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[58]),
        .Q(DIN_A_R[58]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[59] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[59]),
        .Q(DIN_A_R[59]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[5]),
        .Q(DIN_A_R[5]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[60] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[60]),
        .Q(DIN_A_R[60]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[61] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[61]),
        .Q(DIN_A_R[61]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[62] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[62]),
        .Q(DIN_A_R[62]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[63] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[63]),
        .Q(DIN_A_R[63]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[64] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[64]),
        .Q(DIN_A_R[64]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[65] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[65]),
        .Q(DIN_A_R[65]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[66] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[66]),
        .Q(DIN_A_R[66]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[67] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[67]),
        .Q(DIN_A_R[67]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[68] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[68]),
        .Q(DIN_A_R[68]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[69] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[69]),
        .Q(DIN_A_R[69]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[6]),
        .Q(DIN_A_R[6]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[70] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[70]),
        .Q(DIN_A_R[70]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[71] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[71]),
        .Q(DIN_A_R[71]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[7]),
        .Q(DIN_A_R[7]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[8]),
        .Q(DIN_A_R[8]),
        .R(1'b0));
  FDRE \DIN_A_R_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(DIN_A[9]),
        .Q(DIN_A_R[9]),
        .R(1'b0));
  FDRE INJECT_DBITERR_A_R_reg
       (.C(CLK),
        .CE(1'b1),
        .D(INJECT_DBITERR_A),
        .Q(INJECT_DBITERR_A_R),
        .R(1'b0));
  FDRE INJECT_SBITERR_A_R_reg
       (.C(CLK),
        .CE(1'b1),
        .D(INJECT_SBITERR_A),
        .Q(INJECT_SBITERR_A_R),
        .R(1'b0));
  FDRE OREG_CE_A_R_reg
       (.C(CLK),
        .CE(1'b1),
        .D(OREG_CE_A),
        .Q(OREG_CE_A_R),
        .R(1'b0));
  FDRE OREG_ECC_CE_A_R_reg
       (.C(CLK),
        .CE(1'b1),
        .D(OREG_ECC_CE_A),
        .Q(OREG_ECC_CE_A_R),
        .R(1'b0));
  FDRE RDB_WR_A_R_reg
       (.C(CLK),
        .CE(1'b1),
        .D(RDB_WR_A),
        .Q(RDB_WR_A_R),
        .R(1'b0));
  FDRE RST_CFG1_reg
       (.C(CCLK),
        .CE(1'b1),
        .D(RST_B),
        .Q(RST_CFG1),
        .R(1'b0));
  FDRE RST_CFG2_reg
       (.C(CCLK),
        .CE(1'b1),
        .D(RST_CFG1),
        .Q(RST_CFG2),
        .R(1'b0));
  (* AUTO_SLEEP_LATENCY = "8" *) 
  (* AVG_CONS_INACTIVE_CYCLES = "10" *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* BWE_MODE_A = "PARITY_INTERLEAVED" *) 
  (* BWE_MODE_B = "PARITY_INTERLEAVED" *) 
  (* CASCADE_ORDER_A = "NONE" *) 
  (* CASCADE_ORDER_B = "NONE" *) 
  (* EN_AUTO_SLEEP_MODE = "FALSE" *) 
  (* EN_ECC_RD_A = "FALSE" *) 
  (* EN_ECC_RD_B = "FALSE" *) 
  (* EN_ECC_WR_A = "FALSE" *) 
  (* EN_ECC_WR_B = "FALSE" *) 
  (* IREG_PRE_A = "FALSE" *) 
  (* IREG_PRE_B = "FALSE" *) 
  (* IS_CLK_INVERTED = "1'b0" *) 
  (* IS_EN_A_INVERTED = "1'b0" *) 
  (* IS_EN_B_INVERTED = "1'b0" *) 
  (* IS_RDB_WR_A_INVERTED = "1'b0" *) 
  (* IS_RDB_WR_B_INVERTED = "1'b0" *) 
  (* IS_RST_A_INVERTED = "1'b0" *) 
  (* IS_RST_B_INVERTED = "1'b0" *) 
  (* MATRIX_ID = "NONE" *) 
  (* NUM_UNIQUE_SELF_ADDR_A = "1" *) 
  (* NUM_UNIQUE_SELF_ADDR_B = "1" *) 
  (* NUM_URAM_IN_MATRIX = "1" *) 
  (* OREG_A = "FALSE" *) 
  (* OREG_B = "FALSE" *) 
  (* OREG_ECC_A = "FALSE" *) 
  (* OREG_ECC_B = "FALSE" *) 
  (* REG_CAS_A = "FALSE" *) 
  (* REG_CAS_B = "FALSE" *) 
  (* RST_MODE_A = "SYNC" *) 
  (* RST_MODE_B = "SYNC" *) 
  (* SELF_ADDR_A = "11'h000" *) 
  (* SELF_ADDR_B = "11'h000" *) 
  (* SELF_MASK_A = "11'h7ff" *) 
  (* SELF_MASK_B = "11'h7ff" *) 
  (* USE_EXT_CE_A = "FALSE" *) 
  (* USE_EXT_CE_B = "FALSE" *) 
  xilinx_ram_URAM288 uram288_prim_inst
       (.ADDR_A(ADDR_A_R),
        .ADDR_B(ADDR_URAM),
        .BWE_A(BWE_A_R),
        .BWE_B(BWE_URAM),
        .CAS_IN_ADDR_A(CAS_IN_ADDR_A),
        .CAS_IN_ADDR_B(CAS_IN_ADDR_B),
        .CAS_IN_BWE_A(CAS_IN_BWE_A),
        .CAS_IN_BWE_B(CAS_IN_BWE_B),
        .CAS_IN_DBITERR_A(CAS_IN_DBITERR_A),
        .CAS_IN_DBITERR_B(CAS_IN_DBITERR_B),
        .CAS_IN_DIN_A(CAS_IN_DIN_A),
        .CAS_IN_DIN_B(CAS_IN_DIN_B),
        .CAS_IN_DOUT_A(CAS_IN_DOUT_A),
        .CAS_IN_DOUT_B(CAS_IN_DOUT_B),
        .CAS_IN_EN_A(CAS_IN_EN_A),
        .CAS_IN_EN_B(CAS_IN_EN_B),
        .CAS_IN_RDACCESS_A(CAS_IN_RDACCESS_A),
        .CAS_IN_RDACCESS_B(CAS_IN_RDACCESS_B),
        .CAS_IN_RDB_WR_A(CAS_IN_RDB_WR_A),
        .CAS_IN_RDB_WR_B(CAS_IN_RDB_WR_B),
        .CAS_IN_SBITERR_A(CAS_IN_SBITERR_A),
        .CAS_IN_SBITERR_B(CAS_IN_SBITERR_B),
        .CAS_OUT_ADDR_A(CAS_OUT_ADDR_A),
        .CAS_OUT_ADDR_B(CAS_OUT_ADDR_B),
        .CAS_OUT_BWE_A(CAS_OUT_BWE_A),
        .CAS_OUT_BWE_B(CAS_OUT_BWE_B),
        .CAS_OUT_DBITERR_A(CAS_OUT_DBITERR_A),
        .CAS_OUT_DBITERR_B(CAS_OUT_DBITERR_B),
        .CAS_OUT_DIN_A(CAS_OUT_DIN_A),
        .CAS_OUT_DIN_B(CAS_OUT_DIN_B),
        .CAS_OUT_DOUT_A(CAS_OUT_DOUT_A),
        .CAS_OUT_DOUT_B(CAS_OUT_DOUT_B),
        .CAS_OUT_EN_A(CAS_OUT_EN_A),
        .CAS_OUT_EN_B(CAS_OUT_EN_B),
        .CAS_OUT_RDACCESS_A(CAS_OUT_RDACCESS_A),
        .CAS_OUT_RDACCESS_B(CAS_OUT_RDACCESS_B),
        .CAS_OUT_RDB_WR_A(CAS_OUT_RDB_WR_A),
        .CAS_OUT_RDB_WR_B(CAS_OUT_RDB_WR_B),
        .CAS_OUT_SBITERR_A(CAS_OUT_SBITERR_A),
        .CAS_OUT_SBITERR_B(CAS_OUT_SBITERR_B),
        .CLK(CLK_URAM),
        .DBITERR_A(DBITERR_A),
        .DBITERR_B(DBITERR_B),
        .DIN_A(DIN_A_R),
        .DIN_B(DIN_URAM),
        .DOUT_A(DOUT_A),
        .DOUT_B(DOUT_B),
        .EN_A(ENA_URAM),
        .EN_B(EN_URAM),
        .INJECT_DBITERR_A(INJECT_DBITERR_A_R),
        .INJECT_DBITERR_B(INJECT_DBITERR_URAM),
        .INJECT_SBITERR_A(INJECT_SBITERR_A_R),
        .INJECT_SBITERR_B(INJECT_SBITERR_URAM),
        .OREG_CE_A(OREG_CE_A_R),
        .OREG_CE_B(OREG_CE_URAM),
        .OREG_ECC_CE_A(OREG_ECC_CE_A_R),
        .OREG_ECC_CE_B(OREG_ECC_CE_URAM),
        .RDACCESS_A(RDACCESS_A),
        .RDACCESS_B(RDACCESS_B),
        .RDB_WR_A(RDB_WR_A_R),
        .RDB_WR_B(RDB_WR_URAM),
        .RST_A(RST_A),
        .RST_B(RST_URAM),
        .SBITERR_A(SBITERR_A),
        .SBITERR_B(SBITERR_B),
        .SLEEP(SLEEP));
  xilinx_ram_uram_rd_back_v1_0_0_uram_rdb_mux uram_rdb_mux_inst
       (.ADDR_B(ADDR_URAM),
        .\ADDR_O_reg[22]_0 (ADDR_B[22:12]),
        .\BWE_O_reg[8]_0 ({uram_rdb_wrd_fsm_inst_n_1,uram_rdb_wrd_fsm_inst_n_2,uram_rdb_wrd_fsm_inst_n_3,uram_rdb_wrd_fsm_inst_n_4,uram_rdb_wrd_fsm_inst_n_5,uram_rdb_wrd_fsm_inst_n_6,uram_rdb_wrd_fsm_inst_n_7,uram_rdb_wrd_fsm_inst_n_8,uram_rdb_wrd_fsm_inst_n_9}),
        .CCLK(CCLK),
        .CE00(CE00),
        .CLK(CLK),
        .CLK_URAM(CLK_URAM),
        .D({uram_rdb_wrd_fsm_inst_n_85,uram_rdb_wrd_fsm_inst_n_86,uram_rdb_wrd_fsm_inst_n_87,uram_rdb_wrd_fsm_inst_n_88,uram_rdb_wrd_fsm_inst_n_89,uram_rdb_wrd_fsm_inst_n_90,uram_rdb_wrd_fsm_inst_n_91,uram_rdb_wrd_fsm_inst_n_92,uram_rdb_wrd_fsm_inst_n_93,uram_rdb_wrd_fsm_inst_n_94,uram_rdb_wrd_fsm_inst_n_95,uram_rdb_wrd_fsm_inst_n_96}),
        .\DIN_O_reg[71]_0 (DIN_URAM),
        .\DIN_O_reg[71]_1 ({uram_rdb_wrd_fsm_inst_n_12,uram_rdb_wrd_fsm_inst_n_13,uram_rdb_wrd_fsm_inst_n_14,uram_rdb_wrd_fsm_inst_n_15,uram_rdb_wrd_fsm_inst_n_16,uram_rdb_wrd_fsm_inst_n_17,uram_rdb_wrd_fsm_inst_n_18,uram_rdb_wrd_fsm_inst_n_19,uram_rdb_wrd_fsm_inst_n_20,uram_rdb_wrd_fsm_inst_n_21,uram_rdb_wrd_fsm_inst_n_22,uram_rdb_wrd_fsm_inst_n_23,uram_rdb_wrd_fsm_inst_n_24,uram_rdb_wrd_fsm_inst_n_25,uram_rdb_wrd_fsm_inst_n_26,uram_rdb_wrd_fsm_inst_n_27,uram_rdb_wrd_fsm_inst_n_28,uram_rdb_wrd_fsm_inst_n_29,uram_rdb_wrd_fsm_inst_n_30,uram_rdb_wrd_fsm_inst_n_31,uram_rdb_wrd_fsm_inst_n_32,uram_rdb_wrd_fsm_inst_n_33,uram_rdb_wrd_fsm_inst_n_34,uram_rdb_wrd_fsm_inst_n_35,uram_rdb_wrd_fsm_inst_n_36,uram_rdb_wrd_fsm_inst_n_37,uram_rdb_wrd_fsm_inst_n_38,uram_rdb_wrd_fsm_inst_n_39,uram_rdb_wrd_fsm_inst_n_40,uram_rdb_wrd_fsm_inst_n_41,uram_rdb_wrd_fsm_inst_n_42,uram_rdb_wrd_fsm_inst_n_43,uram_rdb_wrd_fsm_inst_n_44,uram_rdb_wrd_fsm_inst_n_45,uram_rdb_wrd_fsm_inst_n_46,uram_rdb_wrd_fsm_inst_n_47,uram_rdb_wrd_fsm_inst_n_48,uram_rdb_wrd_fsm_inst_n_49,uram_rdb_wrd_fsm_inst_n_50,uram_rdb_wrd_fsm_inst_n_51,uram_rdb_wrd_fsm_inst_n_52,uram_rdb_wrd_fsm_inst_n_53,uram_rdb_wrd_fsm_inst_n_54,uram_rdb_wrd_fsm_inst_n_55,uram_rdb_wrd_fsm_inst_n_56,uram_rdb_wrd_fsm_inst_n_57,uram_rdb_wrd_fsm_inst_n_58,uram_rdb_wrd_fsm_inst_n_59,uram_rdb_wrd_fsm_inst_n_60,uram_rdb_wrd_fsm_inst_n_61,uram_rdb_wrd_fsm_inst_n_62,uram_rdb_wrd_fsm_inst_n_63,uram_rdb_wrd_fsm_inst_n_64,uram_rdb_wrd_fsm_inst_n_65,uram_rdb_wrd_fsm_inst_n_66,uram_rdb_wrd_fsm_inst_n_67,uram_rdb_wrd_fsm_inst_n_68,uram_rdb_wrd_fsm_inst_n_69,uram_rdb_wrd_fsm_inst_n_70,uram_rdb_wrd_fsm_inst_n_71,uram_rdb_wrd_fsm_inst_n_72,uram_rdb_wrd_fsm_inst_n_73,uram_rdb_wrd_fsm_inst_n_74,uram_rdb_wrd_fsm_inst_n_75,uram_rdb_wrd_fsm_inst_n_76,uram_rdb_wrd_fsm_inst_n_77,uram_rdb_wrd_fsm_inst_n_78,uram_rdb_wrd_fsm_inst_n_79,uram_rdb_wrd_fsm_inst_n_80,uram_rdb_wrd_fsm_inst_n_81,uram_rdb_wrd_fsm_inst_n_82,uram_rdb_wrd_fsm_inst_n_83}),
        .ENA_URAM(ENA_URAM),
        .EN_A(EN_A),
        .EN_O_reg_0(uram_rdb_wrd_fsm_inst_n_11),
        .EN_URAM(EN_URAM),
        .INJECT_DBITERR_B(INJECT_DBITERR_B),
        .INJECT_DBITERR_URAM(INJECT_DBITERR_URAM),
        .INJECT_SBITERR_B(INJECT_SBITERR_B),
        .INJECT_SBITERR_URAM(INJECT_SBITERR_URAM),
        .OREG_CE_B(OREG_CE_B),
        .OREG_CE_URAM(OREG_CE_URAM),
        .OREG_ECC_CE_B(OREG_ECC_CE_B),
        .OREG_ECC_CE_URAM(OREG_ECC_CE_URAM),
        .Q(BWE_URAM),
        .RDB_WR_O_reg_0(uram_rdb_wrd_fsm_inst_n_10),
        .RDB_WR_URAM(RDB_WR_URAM),
        .RST_B(RST_B),
        .RST_URAM(RST_URAM),
        .control(control));
  xilinx_ram_uram_rd_back_v1_0_0_uram_rdb_wrd_fsm uram_rdb_wrd_fsm_inst
       (.ADDR_B(ADDR_B[11:0]),
        .BWE_B(BWE_B),
        .CCLK(CCLK),
        .CE00(CE00),
        .D({uram_rdb_wrd_fsm_inst_n_85,uram_rdb_wrd_fsm_inst_n_86,uram_rdb_wrd_fsm_inst_n_87,uram_rdb_wrd_fsm_inst_n_88,uram_rdb_wrd_fsm_inst_n_89,uram_rdb_wrd_fsm_inst_n_90,uram_rdb_wrd_fsm_inst_n_91,uram_rdb_wrd_fsm_inst_n_92,uram_rdb_wrd_fsm_inst_n_93,uram_rdb_wrd_fsm_inst_n_94,uram_rdb_wrd_fsm_inst_n_95,uram_rdb_wrd_fsm_inst_n_96}),
        .DI(DI),
        .DIN_B(DIN_B),
        .EN_B(EN_B),
        .\FSM_onehot_curr_state_reg[1]_0 ({uram_rdb_wrd_fsm_inst_n_1,uram_rdb_wrd_fsm_inst_n_2,uram_rdb_wrd_fsm_inst_n_3,uram_rdb_wrd_fsm_inst_n_4,uram_rdb_wrd_fsm_inst_n_5,uram_rdb_wrd_fsm_inst_n_6,uram_rdb_wrd_fsm_inst_n_7,uram_rdb_wrd_fsm_inst_n_8,uram_rdb_wrd_fsm_inst_n_9}),
        .\FSM_onehot_curr_state_reg[1]_1 (uram_rdb_wrd_fsm_inst_n_10),
        .\FSM_onehot_curr_state_reg[3]_0 (uram_rdb_wrd_fsm_inst_n_11),
        .RDB_WR_B(RDB_WR_B),
        .RST_CFG2(RST_CFG2),
        .VLD(VLD),
        .control(control),
        .\uram_data_int_r_reg[71]_0 ({uram_rdb_wrd_fsm_inst_n_12,uram_rdb_wrd_fsm_inst_n_13,uram_rdb_wrd_fsm_inst_n_14,uram_rdb_wrd_fsm_inst_n_15,uram_rdb_wrd_fsm_inst_n_16,uram_rdb_wrd_fsm_inst_n_17,uram_rdb_wrd_fsm_inst_n_18,uram_rdb_wrd_fsm_inst_n_19,uram_rdb_wrd_fsm_inst_n_20,uram_rdb_wrd_fsm_inst_n_21,uram_rdb_wrd_fsm_inst_n_22,uram_rdb_wrd_fsm_inst_n_23,uram_rdb_wrd_fsm_inst_n_24,uram_rdb_wrd_fsm_inst_n_25,uram_rdb_wrd_fsm_inst_n_26,uram_rdb_wrd_fsm_inst_n_27,uram_rdb_wrd_fsm_inst_n_28,uram_rdb_wrd_fsm_inst_n_29,uram_rdb_wrd_fsm_inst_n_30,uram_rdb_wrd_fsm_inst_n_31,uram_rdb_wrd_fsm_inst_n_32,uram_rdb_wrd_fsm_inst_n_33,uram_rdb_wrd_fsm_inst_n_34,uram_rdb_wrd_fsm_inst_n_35,uram_rdb_wrd_fsm_inst_n_36,uram_rdb_wrd_fsm_inst_n_37,uram_rdb_wrd_fsm_inst_n_38,uram_rdb_wrd_fsm_inst_n_39,uram_rdb_wrd_fsm_inst_n_40,uram_rdb_wrd_fsm_inst_n_41,uram_rdb_wrd_fsm_inst_n_42,uram_rdb_wrd_fsm_inst_n_43,uram_rdb_wrd_fsm_inst_n_44,uram_rdb_wrd_fsm_inst_n_45,uram_rdb_wrd_fsm_inst_n_46,uram_rdb_wrd_fsm_inst_n_47,uram_rdb_wrd_fsm_inst_n_48,uram_rdb_wrd_fsm_inst_n_49,uram_rdb_wrd_fsm_inst_n_50,uram_rdb_wrd_fsm_inst_n_51,uram_rdb_wrd_fsm_inst_n_52,uram_rdb_wrd_fsm_inst_n_53,uram_rdb_wrd_fsm_inst_n_54,uram_rdb_wrd_fsm_inst_n_55,uram_rdb_wrd_fsm_inst_n_56,uram_rdb_wrd_fsm_inst_n_57,uram_rdb_wrd_fsm_inst_n_58,uram_rdb_wrd_fsm_inst_n_59,uram_rdb_wrd_fsm_inst_n_60,uram_rdb_wrd_fsm_inst_n_61,uram_rdb_wrd_fsm_inst_n_62,uram_rdb_wrd_fsm_inst_n_63,uram_rdb_wrd_fsm_inst_n_64,uram_rdb_wrd_fsm_inst_n_65,uram_rdb_wrd_fsm_inst_n_66,uram_rdb_wrd_fsm_inst_n_67,uram_rdb_wrd_fsm_inst_n_68,uram_rdb_wrd_fsm_inst_n_69,uram_rdb_wrd_fsm_inst_n_70,uram_rdb_wrd_fsm_inst_n_71,uram_rdb_wrd_fsm_inst_n_72,uram_rdb_wrd_fsm_inst_n_73,uram_rdb_wrd_fsm_inst_n_74,uram_rdb_wrd_fsm_inst_n_75,uram_rdb_wrd_fsm_inst_n_76,uram_rdb_wrd_fsm_inst_n_77,uram_rdb_wrd_fsm_inst_n_78,uram_rdb_wrd_fsm_inst_n_79,uram_rdb_wrd_fsm_inst_n_80,uram_rdb_wrd_fsm_inst_n_81,uram_rdb_wrd_fsm_inst_n_82,uram_rdb_wrd_fsm_inst_n_83}));
endmodule

module xilinx_ram_uram_rd_back_v1_0_0_uram_rdb_mux
   (CLK_URAM,
    EN_URAM,
    INJECT_DBITERR_URAM,
    INJECT_SBITERR_URAM,
    OREG_CE_URAM,
    OREG_ECC_CE_URAM,
    RDB_WR_URAM,
    RST_URAM,
    ENA_URAM,
    ADDR_B,
    Q,
    \DIN_O_reg[71]_0 ,
    CE00,
    control,
    CLK,
    CCLK,
    EN_O_reg_0,
    INJECT_DBITERR_B,
    INJECT_SBITERR_B,
    OREG_CE_B,
    OREG_ECC_CE_B,
    RDB_WR_O_reg_0,
    RST_B,
    EN_A,
    D,
    \ADDR_O_reg[22]_0 ,
    \BWE_O_reg[8]_0 ,
    \DIN_O_reg[71]_1 );
  output CLK_URAM;
  output EN_URAM;
  output INJECT_DBITERR_URAM;
  output INJECT_SBITERR_URAM;
  output OREG_CE_URAM;
  output OREG_ECC_CE_URAM;
  output RDB_WR_URAM;
  output RST_URAM;
  output ENA_URAM;
  output [22:0]ADDR_B;
  output [8:0]Q;
  output [71:0]\DIN_O_reg[71]_0 ;
  input CE00;
  input control;
  input CLK;
  input CCLK;
  input EN_O_reg_0;
  input INJECT_DBITERR_B;
  input INJECT_SBITERR_B;
  input OREG_CE_B;
  input OREG_ECC_CE_B;
  input RDB_WR_O_reg_0;
  input RST_B;
  input EN_A;
  input [11:0]D;
  input [10:0]\ADDR_O_reg[22]_0 ;
  input [8:0]\BWE_O_reg[8]_0 ;
  input [71:0]\DIN_O_reg[71]_1 ;

  wire [22:0]ADDR_B;
  wire [10:0]\ADDR_O_reg[22]_0 ;
  wire [8:0]\BWE_O_reg[8]_0 ;
  wire CCLK;
  wire CE00;
  wire CLK;
  wire CLK_URAM;
  wire [11:0]D;
  wire [71:0]\DIN_O_reg[71]_0 ;
  wire [71:0]\DIN_O_reg[71]_1 ;
  wire ENA_URAM;
  wire EN_A;
  wire EN_O_reg_0;
  wire EN_URAM;
  wire INJECT_DBITERR_B;
  wire INJECT_DBITERR_URAM;
  wire INJECT_SBITERR_B;
  wire INJECT_SBITERR_URAM;
  wire OREG_CE_B;
  wire OREG_CE_URAM;
  wire OREG_ECC_CE_B;
  wire OREG_ECC_CE_URAM;
  wire [8:0]Q;
  wire RDB_WR_O_reg_0;
  wire RDB_WR_URAM;
  wire RST_B;
  wire RST_URAM;
  wire control;

  FDRE \ADDR_O_reg[0] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(D[0]),
        .Q(ADDR_B[0]),
        .R(1'b0));
  FDRE \ADDR_O_reg[10] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(D[10]),
        .Q(ADDR_B[10]),
        .R(1'b0));
  FDRE \ADDR_O_reg[11] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(D[11]),
        .Q(ADDR_B[11]),
        .R(1'b0));
  FDRE \ADDR_O_reg[12] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\ADDR_O_reg[22]_0 [0]),
        .Q(ADDR_B[12]),
        .R(control));
  FDRE \ADDR_O_reg[13] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\ADDR_O_reg[22]_0 [1]),
        .Q(ADDR_B[13]),
        .R(control));
  FDRE \ADDR_O_reg[14] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\ADDR_O_reg[22]_0 [2]),
        .Q(ADDR_B[14]),
        .R(control));
  FDRE \ADDR_O_reg[15] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\ADDR_O_reg[22]_0 [3]),
        .Q(ADDR_B[15]),
        .R(control));
  FDRE \ADDR_O_reg[16] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\ADDR_O_reg[22]_0 [4]),
        .Q(ADDR_B[16]),
        .R(control));
  FDRE \ADDR_O_reg[17] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\ADDR_O_reg[22]_0 [5]),
        .Q(ADDR_B[17]),
        .R(control));
  FDRE \ADDR_O_reg[18] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\ADDR_O_reg[22]_0 [6]),
        .Q(ADDR_B[18]),
        .R(control));
  FDRE \ADDR_O_reg[19] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\ADDR_O_reg[22]_0 [7]),
        .Q(ADDR_B[19]),
        .R(control));
  FDRE \ADDR_O_reg[1] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(D[1]),
        .Q(ADDR_B[1]),
        .R(1'b0));
  FDRE \ADDR_O_reg[20] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\ADDR_O_reg[22]_0 [8]),
        .Q(ADDR_B[20]),
        .R(control));
  FDRE \ADDR_O_reg[21] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\ADDR_O_reg[22]_0 [9]),
        .Q(ADDR_B[21]),
        .R(control));
  FDRE \ADDR_O_reg[22] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\ADDR_O_reg[22]_0 [10]),
        .Q(ADDR_B[22]),
        .R(control));
  FDRE \ADDR_O_reg[2] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(D[2]),
        .Q(ADDR_B[2]),
        .R(1'b0));
  FDRE \ADDR_O_reg[3] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(D[3]),
        .Q(ADDR_B[3]),
        .R(1'b0));
  FDRE \ADDR_O_reg[4] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(D[4]),
        .Q(ADDR_B[4]),
        .R(1'b0));
  FDRE \ADDR_O_reg[5] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(D[5]),
        .Q(ADDR_B[5]),
        .R(1'b0));
  FDRE \ADDR_O_reg[6] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(D[6]),
        .Q(ADDR_B[6]),
        .R(1'b0));
  FDRE \ADDR_O_reg[7] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(D[7]),
        .Q(ADDR_B[7]),
        .R(1'b0));
  FDRE \ADDR_O_reg[8] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(D[8]),
        .Q(ADDR_B[8]),
        .R(1'b0));
  FDRE \ADDR_O_reg[9] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(D[9]),
        .Q(ADDR_B[9]),
        .R(1'b0));
  FDRE \BWE_O_reg[0] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\BWE_O_reg[8]_0 [0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \BWE_O_reg[1] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\BWE_O_reg[8]_0 [1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \BWE_O_reg[2] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\BWE_O_reg[8]_0 [2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \BWE_O_reg[3] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\BWE_O_reg[8]_0 [3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \BWE_O_reg[4] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\BWE_O_reg[8]_0 [4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \BWE_O_reg[5] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\BWE_O_reg[8]_0 [5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \BWE_O_reg[6] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\BWE_O_reg[8]_0 [6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE \BWE_O_reg[7] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\BWE_O_reg[8]_0 [7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE \BWE_O_reg[8] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\BWE_O_reg[8]_0 [8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE \DIN_O_reg[0] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [0]),
        .Q(\DIN_O_reg[71]_0 [0]),
        .R(1'b0));
  FDRE \DIN_O_reg[10] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [10]),
        .Q(\DIN_O_reg[71]_0 [10]),
        .R(1'b0));
  FDRE \DIN_O_reg[11] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [11]),
        .Q(\DIN_O_reg[71]_0 [11]),
        .R(1'b0));
  FDRE \DIN_O_reg[12] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [12]),
        .Q(\DIN_O_reg[71]_0 [12]),
        .R(1'b0));
  FDRE \DIN_O_reg[13] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [13]),
        .Q(\DIN_O_reg[71]_0 [13]),
        .R(1'b0));
  FDRE \DIN_O_reg[14] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [14]),
        .Q(\DIN_O_reg[71]_0 [14]),
        .R(1'b0));
  FDRE \DIN_O_reg[15] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [15]),
        .Q(\DIN_O_reg[71]_0 [15]),
        .R(1'b0));
  FDRE \DIN_O_reg[16] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [16]),
        .Q(\DIN_O_reg[71]_0 [16]),
        .R(1'b0));
  FDRE \DIN_O_reg[17] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [17]),
        .Q(\DIN_O_reg[71]_0 [17]),
        .R(1'b0));
  FDRE \DIN_O_reg[18] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [18]),
        .Q(\DIN_O_reg[71]_0 [18]),
        .R(1'b0));
  FDRE \DIN_O_reg[19] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [19]),
        .Q(\DIN_O_reg[71]_0 [19]),
        .R(1'b0));
  FDRE \DIN_O_reg[1] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [1]),
        .Q(\DIN_O_reg[71]_0 [1]),
        .R(1'b0));
  FDRE \DIN_O_reg[20] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [20]),
        .Q(\DIN_O_reg[71]_0 [20]),
        .R(1'b0));
  FDRE \DIN_O_reg[21] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [21]),
        .Q(\DIN_O_reg[71]_0 [21]),
        .R(1'b0));
  FDRE \DIN_O_reg[22] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [22]),
        .Q(\DIN_O_reg[71]_0 [22]),
        .R(1'b0));
  FDRE \DIN_O_reg[23] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [23]),
        .Q(\DIN_O_reg[71]_0 [23]),
        .R(1'b0));
  FDRE \DIN_O_reg[24] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [24]),
        .Q(\DIN_O_reg[71]_0 [24]),
        .R(1'b0));
  FDRE \DIN_O_reg[25] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [25]),
        .Q(\DIN_O_reg[71]_0 [25]),
        .R(1'b0));
  FDRE \DIN_O_reg[26] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [26]),
        .Q(\DIN_O_reg[71]_0 [26]),
        .R(1'b0));
  FDRE \DIN_O_reg[27] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [27]),
        .Q(\DIN_O_reg[71]_0 [27]),
        .R(1'b0));
  FDRE \DIN_O_reg[28] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [28]),
        .Q(\DIN_O_reg[71]_0 [28]),
        .R(1'b0));
  FDRE \DIN_O_reg[29] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [29]),
        .Q(\DIN_O_reg[71]_0 [29]),
        .R(1'b0));
  FDRE \DIN_O_reg[2] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [2]),
        .Q(\DIN_O_reg[71]_0 [2]),
        .R(1'b0));
  FDRE \DIN_O_reg[30] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [30]),
        .Q(\DIN_O_reg[71]_0 [30]),
        .R(1'b0));
  FDRE \DIN_O_reg[31] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [31]),
        .Q(\DIN_O_reg[71]_0 [31]),
        .R(1'b0));
  FDRE \DIN_O_reg[32] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [32]),
        .Q(\DIN_O_reg[71]_0 [32]),
        .R(1'b0));
  FDRE \DIN_O_reg[33] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [33]),
        .Q(\DIN_O_reg[71]_0 [33]),
        .R(1'b0));
  FDRE \DIN_O_reg[34] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [34]),
        .Q(\DIN_O_reg[71]_0 [34]),
        .R(1'b0));
  FDRE \DIN_O_reg[35] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [35]),
        .Q(\DIN_O_reg[71]_0 [35]),
        .R(1'b0));
  FDRE \DIN_O_reg[36] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [36]),
        .Q(\DIN_O_reg[71]_0 [36]),
        .R(1'b0));
  FDRE \DIN_O_reg[37] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [37]),
        .Q(\DIN_O_reg[71]_0 [37]),
        .R(1'b0));
  FDRE \DIN_O_reg[38] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [38]),
        .Q(\DIN_O_reg[71]_0 [38]),
        .R(1'b0));
  FDRE \DIN_O_reg[39] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [39]),
        .Q(\DIN_O_reg[71]_0 [39]),
        .R(1'b0));
  FDRE \DIN_O_reg[3] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [3]),
        .Q(\DIN_O_reg[71]_0 [3]),
        .R(1'b0));
  FDRE \DIN_O_reg[40] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [40]),
        .Q(\DIN_O_reg[71]_0 [40]),
        .R(1'b0));
  FDRE \DIN_O_reg[41] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [41]),
        .Q(\DIN_O_reg[71]_0 [41]),
        .R(1'b0));
  FDRE \DIN_O_reg[42] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [42]),
        .Q(\DIN_O_reg[71]_0 [42]),
        .R(1'b0));
  FDRE \DIN_O_reg[43] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [43]),
        .Q(\DIN_O_reg[71]_0 [43]),
        .R(1'b0));
  FDRE \DIN_O_reg[44] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [44]),
        .Q(\DIN_O_reg[71]_0 [44]),
        .R(1'b0));
  FDRE \DIN_O_reg[45] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [45]),
        .Q(\DIN_O_reg[71]_0 [45]),
        .R(1'b0));
  FDRE \DIN_O_reg[46] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [46]),
        .Q(\DIN_O_reg[71]_0 [46]),
        .R(1'b0));
  FDRE \DIN_O_reg[47] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [47]),
        .Q(\DIN_O_reg[71]_0 [47]),
        .R(1'b0));
  FDRE \DIN_O_reg[48] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [48]),
        .Q(\DIN_O_reg[71]_0 [48]),
        .R(1'b0));
  FDRE \DIN_O_reg[49] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [49]),
        .Q(\DIN_O_reg[71]_0 [49]),
        .R(1'b0));
  FDRE \DIN_O_reg[4] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [4]),
        .Q(\DIN_O_reg[71]_0 [4]),
        .R(1'b0));
  FDRE \DIN_O_reg[50] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [50]),
        .Q(\DIN_O_reg[71]_0 [50]),
        .R(1'b0));
  FDRE \DIN_O_reg[51] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [51]),
        .Q(\DIN_O_reg[71]_0 [51]),
        .R(1'b0));
  FDRE \DIN_O_reg[52] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [52]),
        .Q(\DIN_O_reg[71]_0 [52]),
        .R(1'b0));
  FDRE \DIN_O_reg[53] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [53]),
        .Q(\DIN_O_reg[71]_0 [53]),
        .R(1'b0));
  FDRE \DIN_O_reg[54] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [54]),
        .Q(\DIN_O_reg[71]_0 [54]),
        .R(1'b0));
  FDRE \DIN_O_reg[55] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [55]),
        .Q(\DIN_O_reg[71]_0 [55]),
        .R(1'b0));
  FDRE \DIN_O_reg[56] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [56]),
        .Q(\DIN_O_reg[71]_0 [56]),
        .R(1'b0));
  FDRE \DIN_O_reg[57] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [57]),
        .Q(\DIN_O_reg[71]_0 [57]),
        .R(1'b0));
  FDRE \DIN_O_reg[58] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [58]),
        .Q(\DIN_O_reg[71]_0 [58]),
        .R(1'b0));
  FDRE \DIN_O_reg[59] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [59]),
        .Q(\DIN_O_reg[71]_0 [59]),
        .R(1'b0));
  FDRE \DIN_O_reg[5] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [5]),
        .Q(\DIN_O_reg[71]_0 [5]),
        .R(1'b0));
  FDRE \DIN_O_reg[60] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [60]),
        .Q(\DIN_O_reg[71]_0 [60]),
        .R(1'b0));
  FDRE \DIN_O_reg[61] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [61]),
        .Q(\DIN_O_reg[71]_0 [61]),
        .R(1'b0));
  FDRE \DIN_O_reg[62] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [62]),
        .Q(\DIN_O_reg[71]_0 [62]),
        .R(1'b0));
  FDRE \DIN_O_reg[63] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [63]),
        .Q(\DIN_O_reg[71]_0 [63]),
        .R(1'b0));
  FDRE \DIN_O_reg[64] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [64]),
        .Q(\DIN_O_reg[71]_0 [64]),
        .R(1'b0));
  FDRE \DIN_O_reg[65] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [65]),
        .Q(\DIN_O_reg[71]_0 [65]),
        .R(1'b0));
  FDRE \DIN_O_reg[66] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [66]),
        .Q(\DIN_O_reg[71]_0 [66]),
        .R(1'b0));
  FDRE \DIN_O_reg[67] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [67]),
        .Q(\DIN_O_reg[71]_0 [67]),
        .R(1'b0));
  FDRE \DIN_O_reg[68] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [68]),
        .Q(\DIN_O_reg[71]_0 [68]),
        .R(1'b0));
  FDRE \DIN_O_reg[69] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [69]),
        .Q(\DIN_O_reg[71]_0 [69]),
        .R(1'b0));
  FDRE \DIN_O_reg[6] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [6]),
        .Q(\DIN_O_reg[71]_0 [6]),
        .R(1'b0));
  FDRE \DIN_O_reg[70] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [70]),
        .Q(\DIN_O_reg[71]_0 [70]),
        .R(1'b0));
  FDRE \DIN_O_reg[71] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [71]),
        .Q(\DIN_O_reg[71]_0 [71]),
        .R(1'b0));
  FDRE \DIN_O_reg[7] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [7]),
        .Q(\DIN_O_reg[71]_0 [7]),
        .R(1'b0));
  FDRE \DIN_O_reg[8] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [8]),
        .Q(\DIN_O_reg[71]_0 [8]),
        .R(1'b0));
  FDRE \DIN_O_reg[9] 
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(\DIN_O_reg[71]_1 [9]),
        .Q(\DIN_O_reg[71]_0 [9]),
        .R(1'b0));
  FDRE ENA_O_reg
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(EN_A),
        .Q(ENA_URAM),
        .R(control));
  FDRE EN_O_reg
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(EN_O_reg_0),
        .Q(EN_URAM),
        .R(1'b0));
  FDRE INJECT_DBITERR_O_reg
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(INJECT_DBITERR_B),
        .Q(INJECT_DBITERR_URAM),
        .R(control));
  FDRE INJECT_SBITERR_O_reg
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(INJECT_SBITERR_B),
        .Q(INJECT_SBITERR_URAM),
        .R(control));
  FDRE OREG_CE_O_reg
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(OREG_CE_B),
        .Q(OREG_CE_URAM),
        .R(control));
  FDRE OREG_ECC_CE_O_reg
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(OREG_ECC_CE_B),
        .Q(OREG_ECC_CE_URAM),
        .R(control));
  FDRE RDB_WR_O_reg
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(RDB_WR_O_reg_0),
        .Q(RDB_WR_URAM),
        .R(1'b0));
  FDRE RST_O_reg
       (.C(CLK_URAM),
        .CE(1'b1),
        .D(RST_B),
        .Q(RST_URAM),
        .R(control));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFGCTRL #(
    .CE_TYPE_CE0("SYNC"),
    .CE_TYPE_CE1("SYNC"),
    .INIT_OUT(0),
    .IS_CE0_INVERTED(1'b0),
    .IS_CE1_INVERTED(1'b0),
    .IS_I0_INVERTED(1'b0),
    .IS_I1_INVERTED(1'b0),
    .IS_IGNORE0_INVERTED(1'b0),
    .IS_IGNORE1_INVERTED(1'b0),
    .IS_S0_INVERTED(1'b0),
    .IS_S1_INVERTED(1'b0),
    .PRESELECT_I0("FALSE"),
    .PRESELECT_I1("FALSE"),
    .SIM_DEVICE("7SERIES"),
    .STARTUP_SYNC("FALSE")) 
    clk_mux_inst
       (.CE0(CE00),
        .CE1(control),
        .I0(CLK),
        .I1(CCLK),
        .IGNORE0(1'b0),
        .IGNORE1(1'b0),
        .O(CLK_URAM),
        .S0(1'b1),
        .S1(1'b1));
endmodule

module xilinx_ram_uram_rd_back_v1_0_0_uram_rdb_wrd_fsm
   (control,
    \FSM_onehot_curr_state_reg[1]_0 ,
    \FSM_onehot_curr_state_reg[1]_1 ,
    \FSM_onehot_curr_state_reg[3]_0 ,
    \uram_data_int_r_reg[71]_0 ,
    CE00,
    D,
    RST_CFG2,
    CCLK,
    DI,
    VLD,
    BWE_B,
    RDB_WR_B,
    DIN_B,
    ADDR_B,
    EN_B);
  output control;
  output [8:0]\FSM_onehot_curr_state_reg[1]_0 ;
  output \FSM_onehot_curr_state_reg[1]_1 ;
  output \FSM_onehot_curr_state_reg[3]_0 ;
  output [71:0]\uram_data_int_r_reg[71]_0 ;
  output CE00;
  output [11:0]D;
  input RST_CFG2;
  input CCLK;
  input [31:0]DI;
  input VLD;
  input [8:0]BWE_B;
  input RDB_WR_B;
  input [71:0]DIN_B;
  input [11:0]ADDR_B;
  input EN_B;

  wire [11:0]ADDR_B;
  wire \ADDR_O[11]_i_2_n_0 ;
  wire \ADDR_O[11]_i_3_n_0 ;
  wire [8:0]BWE_B;
  wire CCLK;
  wire CE00;
  wire [11:0]D;
  wire [31:0]DI;
  wire [71:0]DIN_B;
  wire \DIN_O[71]_i_2_n_0 ;
  wire EN_B;
  wire EN_O_i_2_n_0;
  wire EN_O_i_3_n_0;
  wire EN_O_i_4_n_0;
  wire EN_O_i_5_n_0;
  wire EN_O_i_6_n_0;
  wire \FSM_onehot_curr_state[0]_i_1_n_0 ;
  wire \FSM_onehot_curr_state[0]_i_2_n_0 ;
  wire \FSM_onehot_curr_state[0]_i_3_n_0 ;
  wire \FSM_onehot_curr_state[0]_i_4_n_0 ;
  wire \FSM_onehot_curr_state[1]_i_1_n_0 ;
  wire \FSM_onehot_curr_state[2]_i_1_n_0 ;
  wire \FSM_onehot_curr_state[2]_i_2_n_0 ;
  wire \FSM_onehot_curr_state[3]_i_1_n_0 ;
  wire \FSM_onehot_curr_state[3]_i_2_n_0 ;
  wire \FSM_onehot_curr_state[3]_i_3_n_0 ;
  wire \FSM_onehot_curr_state[3]_i_4_n_0 ;
  wire \FSM_onehot_curr_state[3]_i_5_n_0 ;
  wire \FSM_onehot_curr_state[3]_i_6_n_0 ;
  wire \FSM_onehot_curr_state[3]_i_7_n_0 ;
  wire \FSM_onehot_curr_state[3]_i_8_n_0 ;
  wire \FSM_onehot_curr_state[4]_i_1_n_0 ;
  wire \FSM_onehot_curr_state[5]_i_1_n_0 ;
  wire \FSM_onehot_curr_state[5]_i_2_n_0 ;
  wire [8:0]\FSM_onehot_curr_state_reg[1]_0 ;
  wire \FSM_onehot_curr_state_reg[1]_1 ;
  wire \FSM_onehot_curr_state_reg[3]_0 ;
  wire \FSM_onehot_curr_state_reg_n_0_[0] ;
  wire \FSM_onehot_curr_state_reg_n_0_[2] ;
  wire \FSM_onehot_curr_state_reg_n_0_[3] ;
  wire \FSM_onehot_curr_state_reg_n_0_[4] ;
  wire \FSM_onehot_curr_state_reg_n_0_[5] ;
  wire \FSM_onehot_curr_state_reg_n_0_[6] ;
  wire \FSM_onehot_curr_state_reg_n_0_[7] ;
  wire RDB_WR_B;
  wire RST_CFG2;
  wire VLD;
  wire \_inferred__4/i__carry__0_n_0 ;
  wire \_inferred__4/i__carry__0_n_1 ;
  wire \_inferred__4/i__carry__0_n_2 ;
  wire \_inferred__4/i__carry__0_n_3 ;
  wire \_inferred__4/i__carry__1_n_1 ;
  wire \_inferred__4/i__carry__1_n_2 ;
  wire \_inferred__4/i__carry__1_n_3 ;
  wire \_inferred__4/i__carry_n_0 ;
  wire \_inferred__4/i__carry_n_1 ;
  wire \_inferred__4/i__carry_n_2 ;
  wire \_inferred__4/i__carry_n_3 ;
  wire [29:0]config_data_batch_int;
  wire \config_data_batch_int[29]_i_1_n_0 ;
  wire config_data_int0;
  wire \config_data_int_reg_n_0_[0] ;
  wire \config_data_int_reg_n_0_[10] ;
  wire \config_data_int_reg_n_0_[11] ;
  wire \config_data_int_reg_n_0_[1] ;
  wire \config_data_int_reg_n_0_[2] ;
  wire \config_data_int_reg_n_0_[3] ;
  wire \config_data_int_reg_n_0_[4] ;
  wire \config_data_int_reg_n_0_[5] ;
  wire \config_data_int_reg_n_0_[6] ;
  wire \config_data_int_reg_n_0_[7] ;
  wire \config_data_int_reg_n_0_[8] ;
  wire \config_data_int_reg_n_0_[9] ;
  wire control;
  wire control_batch_int;
  wire control_batch_int_i_1_n_0;
  wire control_batch_int_i_2_n_0;
  wire control_int_r_i_1_n_0;
  wire \ctrl_cnt[9]_i_1_n_0 ;
  wire \ctrl_cnt[9]_i_2_n_0 ;
  wire \ctrl_cnt[9]_i_4_n_0 ;
  wire \ctrl_cnt[9]_i_5_n_0 ;
  wire \ctrl_cnt[9]_i_6_n_0 ;
  wire [9:0]ctrl_cnt_reg;
  wire ctrl_idle;
  wire ctrl_idle0;
  wire ctrl_idle_r1;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__0_i_5_n_0;
  wire i__carry__0_i_6_n_0;
  wire i__carry__0_i_7_n_0;
  wire i__carry__0_i_8_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry__1_i_2_n_0;
  wire i__carry__1_i_3_n_0;
  wire i__carry__1_i_4_n_0;
  wire i__carry__1_i_5_n_0;
  wire i__carry__1_i_6_n_0;
  wire i__carry__1_i_7_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire [11:0]in18;
  wire [29:1]in22;
  wire [1:0]in3;
  wire [6:0]in4;
  wire [29:0]num_reads_r;
  wire num_reads_r0_carry__0_i_1_n_0;
  wire num_reads_r0_carry__0_i_2_n_0;
  wire num_reads_r0_carry__0_i_3_n_0;
  wire num_reads_r0_carry__0_i_4_n_0;
  wire num_reads_r0_carry__0_n_0;
  wire num_reads_r0_carry__0_n_1;
  wire num_reads_r0_carry__0_n_2;
  wire num_reads_r0_carry__0_n_3;
  wire num_reads_r0_carry__1_i_1_n_0;
  wire num_reads_r0_carry__1_i_2_n_0;
  wire num_reads_r0_carry__1_i_3_n_0;
  wire num_reads_r0_carry__1_i_4_n_0;
  wire num_reads_r0_carry__1_n_0;
  wire num_reads_r0_carry__1_n_1;
  wire num_reads_r0_carry__1_n_2;
  wire num_reads_r0_carry__1_n_3;
  wire num_reads_r0_carry__2_i_1_n_0;
  wire num_reads_r0_carry__2_i_2_n_0;
  wire num_reads_r0_carry__2_i_3_n_0;
  wire num_reads_r0_carry__2_i_4_n_0;
  wire num_reads_r0_carry__2_n_0;
  wire num_reads_r0_carry__2_n_1;
  wire num_reads_r0_carry__2_n_2;
  wire num_reads_r0_carry__2_n_3;
  wire num_reads_r0_carry__3_i_1_n_0;
  wire num_reads_r0_carry__3_i_2_n_0;
  wire num_reads_r0_carry__3_i_3_n_0;
  wire num_reads_r0_carry__3_i_4_n_0;
  wire num_reads_r0_carry__3_n_0;
  wire num_reads_r0_carry__3_n_1;
  wire num_reads_r0_carry__3_n_2;
  wire num_reads_r0_carry__3_n_3;
  wire num_reads_r0_carry__4_i_1_n_0;
  wire num_reads_r0_carry__4_i_2_n_0;
  wire num_reads_r0_carry__4_i_3_n_0;
  wire num_reads_r0_carry__4_i_4_n_0;
  wire num_reads_r0_carry__4_n_0;
  wire num_reads_r0_carry__4_n_1;
  wire num_reads_r0_carry__4_n_2;
  wire num_reads_r0_carry__4_n_3;
  wire num_reads_r0_carry__5_i_1_n_0;
  wire num_reads_r0_carry__5_i_2_n_0;
  wire num_reads_r0_carry__5_i_3_n_0;
  wire num_reads_r0_carry__5_i_4_n_0;
  wire num_reads_r0_carry__5_n_0;
  wire num_reads_r0_carry__5_n_1;
  wire num_reads_r0_carry__5_n_2;
  wire num_reads_r0_carry__5_n_3;
  wire num_reads_r0_carry__6_i_1_n_0;
  wire num_reads_r0_carry_i_1_n_0;
  wire num_reads_r0_carry_i_2_n_0;
  wire num_reads_r0_carry_i_3_n_0;
  wire num_reads_r0_carry_i_4_n_0;
  wire num_reads_r0_carry_n_0;
  wire num_reads_r0_carry_n_1;
  wire num_reads_r0_carry_n_2;
  wire num_reads_r0_carry_n_3;
  wire \num_reads_r[29]_i_1_n_0 ;
  wire \num_reads_r[29]_i_2_n_0 ;
  wire [29:0]num_reads_r_1;
  wire [9:0]p_0_in;
  wire p_0_in2_in;
  wire [29:0]p_1_in;
  wire [29:0]p_2_in;
  wire [11:0]uram_addr_int_r;
  wire \uram_addr_int_r[0]_i_1_n_0 ;
  wire \uram_addr_int_r[10]_i_1_n_0 ;
  wire \uram_addr_int_r[11]_i_1_n_0 ;
  wire \uram_addr_int_r[1]_i_1_n_0 ;
  wire \uram_addr_int_r[2]_i_1_n_0 ;
  wire \uram_addr_int_r[3]_i_1_n_0 ;
  wire \uram_addr_int_r[4]_i_1_n_0 ;
  wire \uram_addr_int_r[5]_i_1_n_0 ;
  wire \uram_addr_int_r[6]_i_1_n_0 ;
  wire \uram_addr_int_r[7]_i_1_n_0 ;
  wire \uram_addr_int_r[8]_i_1_n_0 ;
  wire \uram_addr_int_r[9]_i_1_n_0 ;
  wire [71:0]uram_data_int_r;
  wire \uram_data_int_r[0]_i_1_n_0 ;
  wire \uram_data_int_r[10]_i_1_n_0 ;
  wire \uram_data_int_r[11]_i_1_n_0 ;
  wire \uram_data_int_r[12]_i_1_n_0 ;
  wire \uram_data_int_r[13]_i_1_n_0 ;
  wire \uram_data_int_r[14]_i_1_n_0 ;
  wire \uram_data_int_r[15]_i_1_n_0 ;
  wire \uram_data_int_r[16]_i_1_n_0 ;
  wire \uram_data_int_r[17]_i_1_n_0 ;
  wire \uram_data_int_r[18]_i_1_n_0 ;
  wire \uram_data_int_r[19]_i_1_n_0 ;
  wire \uram_data_int_r[1]_i_1_n_0 ;
  wire \uram_data_int_r[20]_i_1_n_0 ;
  wire \uram_data_int_r[21]_i_1_n_0 ;
  wire \uram_data_int_r[22]_i_1_n_0 ;
  wire \uram_data_int_r[23]_i_1_n_0 ;
  wire \uram_data_int_r[24]_i_1_n_0 ;
  wire \uram_data_int_r[25]_i_1_n_0 ;
  wire \uram_data_int_r[26]_i_1_n_0 ;
  wire \uram_data_int_r[27]_i_1_n_0 ;
  wire \uram_data_int_r[28]_i_1_n_0 ;
  wire \uram_data_int_r[29]_i_1_n_0 ;
  wire \uram_data_int_r[2]_i_1_n_0 ;
  wire \uram_data_int_r[30]_i_1_n_0 ;
  wire \uram_data_int_r[31]_i_1_n_0 ;
  wire \uram_data_int_r[32]_i_1_n_0 ;
  wire \uram_data_int_r[33]_i_1_n_0 ;
  wire \uram_data_int_r[34]_i_1_n_0 ;
  wire \uram_data_int_r[35]_i_1_n_0 ;
  wire \uram_data_int_r[36]_i_1_n_0 ;
  wire \uram_data_int_r[37]_i_1_n_0 ;
  wire \uram_data_int_r[38]_i_1_n_0 ;
  wire \uram_data_int_r[39]_i_1_n_0 ;
  wire \uram_data_int_r[3]_i_1_n_0 ;
  wire \uram_data_int_r[40]_i_1_n_0 ;
  wire \uram_data_int_r[41]_i_1_n_0 ;
  wire \uram_data_int_r[42]_i_1_n_0 ;
  wire \uram_data_int_r[43]_i_1_n_0 ;
  wire \uram_data_int_r[44]_i_1_n_0 ;
  wire \uram_data_int_r[45]_i_1_n_0 ;
  wire \uram_data_int_r[46]_i_1_n_0 ;
  wire \uram_data_int_r[47]_i_1_n_0 ;
  wire \uram_data_int_r[48]_i_1_n_0 ;
  wire \uram_data_int_r[49]_i_1_n_0 ;
  wire \uram_data_int_r[4]_i_1_n_0 ;
  wire \uram_data_int_r[50]_i_1_n_0 ;
  wire \uram_data_int_r[51]_i_1_n_0 ;
  wire \uram_data_int_r[52]_i_1_n_0 ;
  wire \uram_data_int_r[53]_i_1_n_0 ;
  wire \uram_data_int_r[54]_i_1_n_0 ;
  wire \uram_data_int_r[55]_i_1_n_0 ;
  wire \uram_data_int_r[56]_i_1_n_0 ;
  wire \uram_data_int_r[57]_i_1_n_0 ;
  wire \uram_data_int_r[58]_i_1_n_0 ;
  wire \uram_data_int_r[59]_i_1_n_0 ;
  wire \uram_data_int_r[5]_i_1_n_0 ;
  wire \uram_data_int_r[60]_i_1_n_0 ;
  wire \uram_data_int_r[61]_i_1_n_0 ;
  wire \uram_data_int_r[62]_i_1_n_0 ;
  wire \uram_data_int_r[63]_i_1_n_0 ;
  wire \uram_data_int_r[64]_i_1_n_0 ;
  wire \uram_data_int_r[65]_i_1_n_0 ;
  wire \uram_data_int_r[66]_i_1_n_0 ;
  wire \uram_data_int_r[67]_i_1_n_0 ;
  wire \uram_data_int_r[68]_i_1_n_0 ;
  wire \uram_data_int_r[69]_i_1_n_0 ;
  wire \uram_data_int_r[6]_i_1_n_0 ;
  wire \uram_data_int_r[70]_i_1_n_0 ;
  wire \uram_data_int_r[71]_i_1_n_0 ;
  wire \uram_data_int_r[7]_i_1_n_0 ;
  wire \uram_data_int_r[8]_i_1_n_0 ;
  wire \uram_data_int_r[9]_i_1_n_0 ;
  wire [71:0]\uram_data_int_r_reg[71]_0 ;
  wire \wr_batch_addr_incr[0]_i_1_n_0 ;
  wire \wr_batch_addr_incr[0]_i_4_n_0 ;
  wire [11:0]wr_batch_addr_incr_reg;
  wire \wr_batch_addr_incr_reg[0]_i_3_n_0 ;
  wire \wr_batch_addr_incr_reg[0]_i_3_n_1 ;
  wire \wr_batch_addr_incr_reg[0]_i_3_n_2 ;
  wire \wr_batch_addr_incr_reg[0]_i_3_n_3 ;
  wire \wr_batch_addr_incr_reg[0]_i_3_n_4 ;
  wire \wr_batch_addr_incr_reg[0]_i_3_n_5 ;
  wire \wr_batch_addr_incr_reg[0]_i_3_n_6 ;
  wire \wr_batch_addr_incr_reg[0]_i_3_n_7 ;
  wire \wr_batch_addr_incr_reg[4]_i_1_n_0 ;
  wire \wr_batch_addr_incr_reg[4]_i_1_n_1 ;
  wire \wr_batch_addr_incr_reg[4]_i_1_n_2 ;
  wire \wr_batch_addr_incr_reg[4]_i_1_n_3 ;
  wire \wr_batch_addr_incr_reg[4]_i_1_n_4 ;
  wire \wr_batch_addr_incr_reg[4]_i_1_n_5 ;
  wire \wr_batch_addr_incr_reg[4]_i_1_n_6 ;
  wire \wr_batch_addr_incr_reg[4]_i_1_n_7 ;
  wire \wr_batch_addr_incr_reg[8]_i_1_n_1 ;
  wire \wr_batch_addr_incr_reg[8]_i_1_n_2 ;
  wire \wr_batch_addr_incr_reg[8]_i_1_n_3 ;
  wire \wr_batch_addr_incr_reg[8]_i_1_n_4 ;
  wire \wr_batch_addr_incr_reg[8]_i_1_n_5 ;
  wire \wr_batch_addr_incr_reg[8]_i_1_n_6 ;
  wire \wr_batch_addr_incr_reg[8]_i_1_n_7 ;
  wire [29:0]write_config_data_0;
  wire \write_config_data_0[0]_i_1_n_0 ;
  wire \write_config_data_0[10]_i_1_n_0 ;
  wire \write_config_data_0[11]_i_1_n_0 ;
  wire \write_config_data_0[12]_i_1_n_0 ;
  wire \write_config_data_0[13]_i_1_n_0 ;
  wire \write_config_data_0[14]_i_1_n_0 ;
  wire \write_config_data_0[15]_i_1_n_0 ;
  wire \write_config_data_0[16]_i_1_n_0 ;
  wire \write_config_data_0[17]_i_1_n_0 ;
  wire \write_config_data_0[18]_i_1_n_0 ;
  wire \write_config_data_0[19]_i_1_n_0 ;
  wire \write_config_data_0[1]_i_1_n_0 ;
  wire \write_config_data_0[20]_i_1_n_0 ;
  wire \write_config_data_0[21]_i_1_n_0 ;
  wire \write_config_data_0[22]_i_1_n_0 ;
  wire \write_config_data_0[23]_i_1_n_0 ;
  wire \write_config_data_0[24]_i_1_n_0 ;
  wire \write_config_data_0[25]_i_1_n_0 ;
  wire \write_config_data_0[26]_i_1_n_0 ;
  wire \write_config_data_0[27]_i_1_n_0 ;
  wire \write_config_data_0[28]_i_1_n_0 ;
  wire \write_config_data_0[29]_i_1_n_0 ;
  wire \write_config_data_0[29]_i_2_n_0 ;
  wire \write_config_data_0[29]_i_3_n_0 ;
  wire \write_config_data_0[2]_i_1_n_0 ;
  wire \write_config_data_0[3]_i_1_n_0 ;
  wire \write_config_data_0[4]_i_1_n_0 ;
  wire \write_config_data_0[5]_i_1_n_0 ;
  wire \write_config_data_0[6]_i_1_n_0 ;
  wire \write_config_data_0[7]_i_1_n_0 ;
  wire \write_config_data_0[8]_i_1_n_0 ;
  wire \write_config_data_0[9]_i_1_n_0 ;
  wire [29:0]write_config_data_1;
  wire \write_config_data_1[29]_i_1_n_0 ;
  wire \write_config_data_1[29]_i_2_n_0 ;
  wire [11:0]write_config_data_2;
  wire \write_config_data_2[0]_i_1_n_0 ;
  wire \write_config_data_2[10]_i_1_n_0 ;
  wire \write_config_data_2[11]_i_1_n_0 ;
  wire \write_config_data_2[11]_i_2_n_0 ;
  wire \write_config_data_2[11]_i_3_n_0 ;
  wire \write_config_data_2[1]_i_1_n_0 ;
  wire \write_config_data_2[2]_i_1_n_0 ;
  wire \write_config_data_2[3]_i_1_n_0 ;
  wire \write_config_data_2[4]_i_1_n_0 ;
  wire \write_config_data_2[5]_i_1_n_0 ;
  wire \write_config_data_2[6]_i_1_n_0 ;
  wire \write_config_data_2[7]_i_1_n_0 ;
  wire \write_config_data_2[8]_i_1_n_0 ;
  wire \write_config_data_2[9]_i_1_n_0 ;
  wire write_config_data_2_0;
  wire \write_data_cnt[0]_i_1_n_0 ;
  wire \write_data_cnt[1]_i_1_n_0 ;
  wire \write_data_cnt[1]_i_2_n_0 ;
  wire \write_data_cnt_reg_n_0_[0] ;
  wire \write_data_cnt_reg_n_0_[1] ;
  wire write_data_end;
  wire write_data_end_reg;
  wire [3:3]\NLW__inferred__4/i__carry__1_CO_UNCONNECTED ;
  wire [3:0]NLW_num_reads_r0_carry__6_CO_UNCONNECTED;
  wire [3:1]NLW_num_reads_r0_carry__6_O_UNCONNECTED;
  wire [3:3]\NLW_wr_batch_addr_incr_reg[8]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \ADDR_O[0]_i_1 
       (.I0(\ADDR_O[11]_i_2_n_0 ),
        .I1(\config_data_int_reg_n_0_[0] ),
        .I2(\ADDR_O[11]_i_3_n_0 ),
        .I3(in18[0]),
        .I4(control),
        .I5(ADDR_B[0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \ADDR_O[10]_i_1 
       (.I0(\ADDR_O[11]_i_2_n_0 ),
        .I1(\config_data_int_reg_n_0_[10] ),
        .I2(\ADDR_O[11]_i_3_n_0 ),
        .I3(in18[10]),
        .I4(control),
        .I5(ADDR_B[10]),
        .O(D[10]));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \ADDR_O[11]_i_1 
       (.I0(\ADDR_O[11]_i_2_n_0 ),
        .I1(\config_data_int_reg_n_0_[11] ),
        .I2(\ADDR_O[11]_i_3_n_0 ),
        .I3(in18[11]),
        .I4(control),
        .I5(ADDR_B[11]),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \ADDR_O[11]_i_2 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .O(\ADDR_O[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \ADDR_O[11]_i_3 
       (.I0(p_0_in2_in),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .O(\ADDR_O[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \ADDR_O[1]_i_1 
       (.I0(\ADDR_O[11]_i_2_n_0 ),
        .I1(\config_data_int_reg_n_0_[1] ),
        .I2(\ADDR_O[11]_i_3_n_0 ),
        .I3(in18[1]),
        .I4(control),
        .I5(ADDR_B[1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \ADDR_O[2]_i_1 
       (.I0(\ADDR_O[11]_i_2_n_0 ),
        .I1(\config_data_int_reg_n_0_[2] ),
        .I2(\ADDR_O[11]_i_3_n_0 ),
        .I3(in18[2]),
        .I4(control),
        .I5(ADDR_B[2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \ADDR_O[3]_i_1 
       (.I0(\ADDR_O[11]_i_2_n_0 ),
        .I1(\config_data_int_reg_n_0_[3] ),
        .I2(\ADDR_O[11]_i_3_n_0 ),
        .I3(in18[3]),
        .I4(control),
        .I5(ADDR_B[3]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \ADDR_O[4]_i_1 
       (.I0(\ADDR_O[11]_i_2_n_0 ),
        .I1(\config_data_int_reg_n_0_[4] ),
        .I2(\ADDR_O[11]_i_3_n_0 ),
        .I3(in18[4]),
        .I4(control),
        .I5(ADDR_B[4]),
        .O(D[4]));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \ADDR_O[5]_i_1 
       (.I0(\ADDR_O[11]_i_2_n_0 ),
        .I1(\config_data_int_reg_n_0_[5] ),
        .I2(\ADDR_O[11]_i_3_n_0 ),
        .I3(in18[5]),
        .I4(control),
        .I5(ADDR_B[5]),
        .O(D[5]));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \ADDR_O[6]_i_1 
       (.I0(\ADDR_O[11]_i_2_n_0 ),
        .I1(\config_data_int_reg_n_0_[6] ),
        .I2(\ADDR_O[11]_i_3_n_0 ),
        .I3(in18[6]),
        .I4(control),
        .I5(ADDR_B[6]),
        .O(D[6]));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \ADDR_O[7]_i_1 
       (.I0(\ADDR_O[11]_i_2_n_0 ),
        .I1(\config_data_int_reg_n_0_[7] ),
        .I2(\ADDR_O[11]_i_3_n_0 ),
        .I3(in18[7]),
        .I4(control),
        .I5(ADDR_B[7]),
        .O(D[7]));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \ADDR_O[8]_i_1 
       (.I0(\ADDR_O[11]_i_2_n_0 ),
        .I1(\config_data_int_reg_n_0_[8] ),
        .I2(\ADDR_O[11]_i_3_n_0 ),
        .I3(in18[8]),
        .I4(control),
        .I5(ADDR_B[8]),
        .O(D[8]));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \ADDR_O[9]_i_1 
       (.I0(\ADDR_O[11]_i_2_n_0 ),
        .I1(\config_data_int_reg_n_0_[9] ),
        .I2(\ADDR_O[11]_i_3_n_0 ),
        .I3(in18[9]),
        .I4(control),
        .I5(ADDR_B[9]),
        .O(D[9]));
  LUT6 #(
    .INIT(64'hAA08FFFFAA080000)) 
    \BWE_O[0]_i_1 
       (.I0(write_config_data_2_0),
        .I1(p_0_in2_in),
        .I2(write_data_end_reg),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(control),
        .I5(BWE_B[0]),
        .O(\FSM_onehot_curr_state_reg[1]_0 [0]));
  LUT6 #(
    .INIT(64'hAA08FFFFAA080000)) 
    \BWE_O[1]_i_1 
       (.I0(write_config_data_2_0),
        .I1(p_0_in2_in),
        .I2(write_data_end_reg),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(control),
        .I5(BWE_B[1]),
        .O(\FSM_onehot_curr_state_reg[1]_0 [1]));
  LUT6 #(
    .INIT(64'hAA08FFFFAA080000)) 
    \BWE_O[2]_i_1 
       (.I0(write_config_data_2_0),
        .I1(p_0_in2_in),
        .I2(write_data_end_reg),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(control),
        .I5(BWE_B[2]),
        .O(\FSM_onehot_curr_state_reg[1]_0 [2]));
  LUT6 #(
    .INIT(64'hAA08FFFFAA080000)) 
    \BWE_O[3]_i_1 
       (.I0(write_config_data_2_0),
        .I1(p_0_in2_in),
        .I2(write_data_end_reg),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(control),
        .I5(BWE_B[3]),
        .O(\FSM_onehot_curr_state_reg[1]_0 [3]));
  LUT6 #(
    .INIT(64'hAA08FFFFAA080000)) 
    \BWE_O[4]_i_1 
       (.I0(write_config_data_2_0),
        .I1(p_0_in2_in),
        .I2(write_data_end_reg),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(control),
        .I5(BWE_B[4]),
        .O(\FSM_onehot_curr_state_reg[1]_0 [4]));
  LUT6 #(
    .INIT(64'hAA08FFFFAA080000)) 
    \BWE_O[5]_i_1 
       (.I0(write_config_data_2_0),
        .I1(p_0_in2_in),
        .I2(write_data_end_reg),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(control),
        .I5(BWE_B[5]),
        .O(\FSM_onehot_curr_state_reg[1]_0 [5]));
  LUT6 #(
    .INIT(64'hAA08FFFFAA080000)) 
    \BWE_O[6]_i_1 
       (.I0(write_config_data_2_0),
        .I1(p_0_in2_in),
        .I2(write_data_end_reg),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(control),
        .I5(BWE_B[6]),
        .O(\FSM_onehot_curr_state_reg[1]_0 [6]));
  LUT6 #(
    .INIT(64'hAA08FFFFAA080000)) 
    \BWE_O[7]_i_1 
       (.I0(write_config_data_2_0),
        .I1(p_0_in2_in),
        .I2(write_data_end_reg),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(control),
        .I5(BWE_B[7]),
        .O(\FSM_onehot_curr_state_reg[1]_0 [7]));
  LUT6 #(
    .INIT(64'hAA08FFFFAA080000)) 
    \BWE_O[8]_i_1 
       (.I0(write_config_data_2_0),
        .I1(p_0_in2_in),
        .I2(write_data_end_reg),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(control),
        .I5(BWE_B[8]),
        .O(\FSM_onehot_curr_state_reg[1]_0 [8]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[0]_i_1 
       (.I0(uram_data_int_r[0]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[0]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[0]),
        .O(\uram_data_int_r_reg[71]_0 [0]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[10]_i_1 
       (.I0(uram_data_int_r[10]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[10]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[10]),
        .O(\uram_data_int_r_reg[71]_0 [10]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[11]_i_1 
       (.I0(uram_data_int_r[11]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[11]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[11]),
        .O(\uram_data_int_r_reg[71]_0 [11]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[12]_i_1 
       (.I0(uram_data_int_r[12]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[12]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[12]),
        .O(\uram_data_int_r_reg[71]_0 [12]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[13]_i_1 
       (.I0(uram_data_int_r[13]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[13]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[13]),
        .O(\uram_data_int_r_reg[71]_0 [13]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[14]_i_1 
       (.I0(uram_data_int_r[14]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[14]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[14]),
        .O(\uram_data_int_r_reg[71]_0 [14]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[15]_i_1 
       (.I0(uram_data_int_r[15]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[15]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[15]),
        .O(\uram_data_int_r_reg[71]_0 [15]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[16]_i_1 
       (.I0(uram_data_int_r[16]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[16]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[16]),
        .O(\uram_data_int_r_reg[71]_0 [16]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[17]_i_1 
       (.I0(uram_data_int_r[17]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[17]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[17]),
        .O(\uram_data_int_r_reg[71]_0 [17]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[18]_i_1 
       (.I0(uram_data_int_r[18]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[18]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[18]),
        .O(\uram_data_int_r_reg[71]_0 [18]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[19]_i_1 
       (.I0(uram_data_int_r[19]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[19]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[19]),
        .O(\uram_data_int_r_reg[71]_0 [19]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[1]_i_1 
       (.I0(uram_data_int_r[1]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[1]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[1]),
        .O(\uram_data_int_r_reg[71]_0 [1]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[20]_i_1 
       (.I0(uram_data_int_r[20]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[20]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[20]),
        .O(\uram_data_int_r_reg[71]_0 [20]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[21]_i_1 
       (.I0(uram_data_int_r[21]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[21]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[21]),
        .O(\uram_data_int_r_reg[71]_0 [21]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[22]_i_1 
       (.I0(uram_data_int_r[22]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[22]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[22]),
        .O(\uram_data_int_r_reg[71]_0 [22]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[23]_i_1 
       (.I0(uram_data_int_r[23]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[23]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[23]),
        .O(\uram_data_int_r_reg[71]_0 [23]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[24]_i_1 
       (.I0(uram_data_int_r[24]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[24]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[24]),
        .O(\uram_data_int_r_reg[71]_0 [24]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[25]_i_1 
       (.I0(uram_data_int_r[25]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[25]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[25]),
        .O(\uram_data_int_r_reg[71]_0 [25]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[26]_i_1 
       (.I0(uram_data_int_r[26]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[26]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[26]),
        .O(\uram_data_int_r_reg[71]_0 [26]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[27]_i_1 
       (.I0(uram_data_int_r[27]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[27]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[27]),
        .O(\uram_data_int_r_reg[71]_0 [27]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[28]_i_1 
       (.I0(uram_data_int_r[28]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[28]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[28]),
        .O(\uram_data_int_r_reg[71]_0 [28]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[29]_i_1 
       (.I0(uram_data_int_r[29]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[29]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[29]),
        .O(\uram_data_int_r_reg[71]_0 [29]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[2]_i_1 
       (.I0(uram_data_int_r[2]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[2]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[2]),
        .O(\uram_data_int_r_reg[71]_0 [2]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[30]_i_1 
       (.I0(uram_data_int_r[30]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[0]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[30]),
        .O(\uram_data_int_r_reg[71]_0 [30]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[31]_i_1 
       (.I0(uram_data_int_r[31]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[1]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[31]),
        .O(\uram_data_int_r_reg[71]_0 [31]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[32]_i_1 
       (.I0(uram_data_int_r[32]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[2]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[32]),
        .O(\uram_data_int_r_reg[71]_0 [32]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[33]_i_1 
       (.I0(uram_data_int_r[33]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[3]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[33]),
        .O(\uram_data_int_r_reg[71]_0 [33]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[34]_i_1 
       (.I0(uram_data_int_r[34]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[4]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[34]),
        .O(\uram_data_int_r_reg[71]_0 [34]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[35]_i_1 
       (.I0(uram_data_int_r[35]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[5]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[35]),
        .O(\uram_data_int_r_reg[71]_0 [35]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[36]_i_1 
       (.I0(uram_data_int_r[36]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[6]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[36]),
        .O(\uram_data_int_r_reg[71]_0 [36]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[37]_i_1 
       (.I0(uram_data_int_r[37]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[7]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[37]),
        .O(\uram_data_int_r_reg[71]_0 [37]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[38]_i_1 
       (.I0(uram_data_int_r[38]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[8]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[38]),
        .O(\uram_data_int_r_reg[71]_0 [38]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[39]_i_1 
       (.I0(uram_data_int_r[39]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[9]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[39]),
        .O(\uram_data_int_r_reg[71]_0 [39]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[3]_i_1 
       (.I0(uram_data_int_r[3]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[3]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[3]),
        .O(\uram_data_int_r_reg[71]_0 [3]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[40]_i_1 
       (.I0(uram_data_int_r[40]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[10]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[40]),
        .O(\uram_data_int_r_reg[71]_0 [40]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[41]_i_1 
       (.I0(uram_data_int_r[41]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[11]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[41]),
        .O(\uram_data_int_r_reg[71]_0 [41]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[42]_i_1 
       (.I0(uram_data_int_r[42]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[12]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[42]),
        .O(\uram_data_int_r_reg[71]_0 [42]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[43]_i_1 
       (.I0(uram_data_int_r[43]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[13]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[43]),
        .O(\uram_data_int_r_reg[71]_0 [43]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[44]_i_1 
       (.I0(uram_data_int_r[44]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[14]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[44]),
        .O(\uram_data_int_r_reg[71]_0 [44]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[45]_i_1 
       (.I0(uram_data_int_r[45]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[15]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[45]),
        .O(\uram_data_int_r_reg[71]_0 [45]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[46]_i_1 
       (.I0(uram_data_int_r[46]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[16]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[46]),
        .O(\uram_data_int_r_reg[71]_0 [46]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[47]_i_1 
       (.I0(uram_data_int_r[47]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[17]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[47]),
        .O(\uram_data_int_r_reg[71]_0 [47]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[48]_i_1 
       (.I0(uram_data_int_r[48]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[18]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[48]),
        .O(\uram_data_int_r_reg[71]_0 [48]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[49]_i_1 
       (.I0(uram_data_int_r[49]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[19]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[49]),
        .O(\uram_data_int_r_reg[71]_0 [49]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[4]_i_1 
       (.I0(uram_data_int_r[4]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[4]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[4]),
        .O(\uram_data_int_r_reg[71]_0 [4]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[50]_i_1 
       (.I0(uram_data_int_r[50]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[20]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[50]),
        .O(\uram_data_int_r_reg[71]_0 [50]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[51]_i_1 
       (.I0(uram_data_int_r[51]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[21]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[51]),
        .O(\uram_data_int_r_reg[71]_0 [51]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[52]_i_1 
       (.I0(uram_data_int_r[52]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[22]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[52]),
        .O(\uram_data_int_r_reg[71]_0 [52]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[53]_i_1 
       (.I0(uram_data_int_r[53]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[23]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[53]),
        .O(\uram_data_int_r_reg[71]_0 [53]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[54]_i_1 
       (.I0(uram_data_int_r[54]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[24]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[54]),
        .O(\uram_data_int_r_reg[71]_0 [54]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[55]_i_1 
       (.I0(uram_data_int_r[55]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[25]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[55]),
        .O(\uram_data_int_r_reg[71]_0 [55]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[56]_i_1 
       (.I0(uram_data_int_r[56]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[26]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[56]),
        .O(\uram_data_int_r_reg[71]_0 [56]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[57]_i_1 
       (.I0(uram_data_int_r[57]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[27]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[57]),
        .O(\uram_data_int_r_reg[71]_0 [57]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[58]_i_1 
       (.I0(uram_data_int_r[58]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[28]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[58]),
        .O(\uram_data_int_r_reg[71]_0 [58]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[59]_i_1 
       (.I0(uram_data_int_r[59]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[29]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[59]),
        .O(\uram_data_int_r_reg[71]_0 [59]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[5]_i_1 
       (.I0(uram_data_int_r[5]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[5]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[5]),
        .O(\uram_data_int_r_reg[71]_0 [5]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[60]_i_1 
       (.I0(uram_data_int_r[60]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[0]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[60]),
        .O(\uram_data_int_r_reg[71]_0 [60]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[61]_i_1 
       (.I0(uram_data_int_r[61]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[1]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[61]),
        .O(\uram_data_int_r_reg[71]_0 [61]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[62]_i_1 
       (.I0(uram_data_int_r[62]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[2]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[62]),
        .O(\uram_data_int_r_reg[71]_0 [62]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[63]_i_1 
       (.I0(uram_data_int_r[63]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[3]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[63]),
        .O(\uram_data_int_r_reg[71]_0 [63]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[64]_i_1 
       (.I0(uram_data_int_r[64]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[4]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[64]),
        .O(\uram_data_int_r_reg[71]_0 [64]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[65]_i_1 
       (.I0(uram_data_int_r[65]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[5]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[65]),
        .O(\uram_data_int_r_reg[71]_0 [65]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[66]_i_1 
       (.I0(uram_data_int_r[66]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[6]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[66]),
        .O(\uram_data_int_r_reg[71]_0 [66]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[67]_i_1 
       (.I0(uram_data_int_r[67]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[7]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[67]),
        .O(\uram_data_int_r_reg[71]_0 [67]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[68]_i_1 
       (.I0(uram_data_int_r[68]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[8]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[68]),
        .O(\uram_data_int_r_reg[71]_0 [68]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[69]_i_1 
       (.I0(uram_data_int_r[69]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[9]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[69]),
        .O(\uram_data_int_r_reg[71]_0 [69]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[6]_i_1 
       (.I0(uram_data_int_r[6]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[6]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[6]),
        .O(\uram_data_int_r_reg[71]_0 [6]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[70]_i_1 
       (.I0(uram_data_int_r[70]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[10]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[70]),
        .O(\uram_data_int_r_reg[71]_0 [70]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[71]_i_1 
       (.I0(uram_data_int_r[71]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[11]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[71]),
        .O(\uram_data_int_r_reg[71]_0 [71]));
  LUT3 #(
    .INIT(8'h45)) 
    \DIN_O[71]_i_2 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(write_data_end_reg),
        .I2(p_0_in2_in),
        .O(\DIN_O[71]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[7]_i_1 
       (.I0(uram_data_int_r[7]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[7]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[7]),
        .O(\uram_data_int_r_reg[71]_0 [7]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[8]_i_1 
       (.I0(uram_data_int_r[8]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[8]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[8]),
        .O(\uram_data_int_r_reg[71]_0 [8]));
  LUT6 #(
    .INIT(64'h00E2FFFF00E20000)) 
    \DIN_O[9]_i_1 
       (.I0(uram_data_int_r[9]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[9]),
        .I3(\DIN_O[71]_i_2_n_0 ),
        .I4(control),
        .I5(DIN_B[9]),
        .O(\uram_data_int_r_reg[71]_0 [9]));
  LUT6 #(
    .INIT(64'h00000000FFFFEEEA)) 
    EN_O_i_1
       (.I0(EN_O_i_2_n_0),
        .I1(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .I2(EN_O_i_3_n_0),
        .I3(\FSM_onehot_curr_state[3]_i_4_n_0 ),
        .I4(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I5(EN_O_i_4_n_0),
        .O(\FSM_onehot_curr_state_reg[3]_0 ));
  LUT6 #(
    .INIT(64'hFBFBFBFBBBBBFBBB)) 
    EN_O_i_2
       (.I0(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I1(control),
        .I2(write_config_data_2_0),
        .I3(p_0_in2_in),
        .I4(write_data_end_reg),
        .I5(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .O(EN_O_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    EN_O_i_3
       (.I0(\FSM_onehot_curr_state[3]_i_6_n_0 ),
        .I1(EN_O_i_5_n_0),
        .I2(\FSM_onehot_curr_state[3]_i_5_n_0 ),
        .I3(EN_O_i_6_n_0),
        .O(EN_O_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h1)) 
    EN_O_i_4
       (.I0(control),
        .I1(EN_B),
        .O(EN_O_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    EN_O_i_5
       (.I0(num_reads_r[15]),
        .I1(num_reads_r[20]),
        .I2(num_reads_r[4]),
        .I3(num_reads_r[6]),
        .O(EN_O_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    EN_O_i_6
       (.I0(num_reads_r[28]),
        .I1(num_reads_r[29]),
        .I2(num_reads_r[0]),
        .I3(num_reads_r[2]),
        .O(EN_O_i_6_n_0));
  LUT5 #(
    .INIT(32'hFFFF0100)) 
    \FSM_onehot_curr_state[0]_i_1 
       (.I0(\FSM_onehot_curr_state[3]_i_2_n_0 ),
        .I1(\FSM_onehot_curr_state[3]_i_3_n_0 ),
        .I2(\FSM_onehot_curr_state[3]_i_4_n_0 ),
        .I3(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .I4(\FSM_onehot_curr_state[0]_i_2_n_0 ),
        .O(\FSM_onehot_curr_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFD0FFD0FFD0)) 
    \FSM_onehot_curr_state[0]_i_2 
       (.I0(\FSM_onehot_curr_state[5]_i_2_n_0 ),
        .I1(\FSM_onehot_curr_state[0]_i_3_n_0 ),
        .I2(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .I3(\FSM_onehot_curr_state[0]_i_4_n_0 ),
        .I4(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I5(write_config_data_2_0),
        .O(\FSM_onehot_curr_state[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \FSM_onehot_curr_state[0]_i_3 
       (.I0(in4[2]),
        .I1(in4[1]),
        .O(\FSM_onehot_curr_state[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF444F444FFFFF444)) 
    \FSM_onehot_curr_state[0]_i_4 
       (.I0(control_batch_int),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I2(p_0_in2_in),
        .I3(write_data_end_reg),
        .I4(\FSM_onehot_curr_state_reg_n_0_[0] ),
        .I5(VLD),
        .O(\FSM_onehot_curr_state[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h4F44)) 
    \FSM_onehot_curr_state[1]_i_1 
       (.I0(write_data_end_reg),
        .I1(p_0_in2_in),
        .I2(\FSM_onehot_curr_state[2]_i_2_n_0 ),
        .I3(in4[0]),
        .O(\FSM_onehot_curr_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h444F)) 
    \FSM_onehot_curr_state[2]_i_1 
       (.I0(write_config_data_2_0),
        .I1(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I2(\FSM_onehot_curr_state[2]_i_2_n_0 ),
        .I3(in4[0]),
        .O(\FSM_onehot_curr_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hDFFF)) 
    \FSM_onehot_curr_state[2]_i_2 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .I1(in4[1]),
        .I2(in4[2]),
        .I3(\FSM_onehot_curr_state[5]_i_2_n_0 ),
        .O(\FSM_onehot_curr_state[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFAAA8)) 
    \FSM_onehot_curr_state[3]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_curr_state[3]_i_2_n_0 ),
        .I2(\FSM_onehot_curr_state[3]_i_3_n_0 ),
        .I3(\FSM_onehot_curr_state[3]_i_4_n_0 ),
        .I4(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .O(\FSM_onehot_curr_state[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_onehot_curr_state[3]_i_2 
       (.I0(num_reads_r[2]),
        .I1(num_reads_r[0]),
        .I2(num_reads_r[29]),
        .I3(num_reads_r[28]),
        .I4(\FSM_onehot_curr_state[3]_i_5_n_0 ),
        .O(\FSM_onehot_curr_state[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_onehot_curr_state[3]_i_3 
       (.I0(num_reads_r[6]),
        .I1(num_reads_r[4]),
        .I2(num_reads_r[20]),
        .I3(num_reads_r[15]),
        .I4(\FSM_onehot_curr_state[3]_i_6_n_0 ),
        .O(\FSM_onehot_curr_state[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_onehot_curr_state[3]_i_4 
       (.I0(\FSM_onehot_curr_state[3]_i_7_n_0 ),
        .I1(\FSM_onehot_curr_state[3]_i_8_n_0 ),
        .I2(num_reads_r[9]),
        .I3(num_reads_r[16]),
        .I4(num_reads_r[11]),
        .I5(num_reads_r[27]),
        .O(\FSM_onehot_curr_state[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_onehot_curr_state[3]_i_5 
       (.I0(num_reads_r[5]),
        .I1(num_reads_r[17]),
        .I2(num_reads_r[3]),
        .I3(num_reads_r[25]),
        .O(\FSM_onehot_curr_state[3]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_onehot_curr_state[3]_i_6 
       (.I0(num_reads_r[7]),
        .I1(num_reads_r[12]),
        .I2(num_reads_r[14]),
        .I3(num_reads_r[21]),
        .O(\FSM_onehot_curr_state[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    \FSM_onehot_curr_state[3]_i_7 
       (.I0(num_reads_r[13]),
        .I1(num_reads_r[23]),
        .I2(num_reads_r[19]),
        .I3(num_reads_r[8]),
        .I4(num_reads_r[26]),
        .I5(num_reads_r[1]),
        .O(\FSM_onehot_curr_state[3]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_onehot_curr_state[3]_i_8 
       (.I0(num_reads_r[10]),
        .I1(num_reads_r[22]),
        .I2(num_reads_r[18]),
        .I3(num_reads_r[24]),
        .O(\FSM_onehot_curr_state[3]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_curr_state[4]_i_1 
       (.I0(control_batch_int),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .O(\FSM_onehot_curr_state[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \FSM_onehot_curr_state[5]_i_1 
       (.I0(\FSM_onehot_curr_state[5]_i_2_n_0 ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .I2(in4[2]),
        .I3(in4[1]),
        .O(\FSM_onehot_curr_state[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \FSM_onehot_curr_state[5]_i_2 
       (.I0(in4[6]),
        .I1(in3[1]),
        .I2(in4[3]),
        .I3(in4[4]),
        .I4(in3[0]),
        .I5(in4[5]),
        .O(\FSM_onehot_curr_state[5]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_curr_state[7]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[0] ),
        .I1(VLD),
        .O(config_data_int0));
  (* FSM_ENCODED_STATES = "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_curr_state_reg[0] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\FSM_onehot_curr_state[0]_i_1_n_0 ),
        .Q(\FSM_onehot_curr_state_reg_n_0_[0] ),
        .S(RST_CFG2));
  (* FSM_ENCODED_STATES = "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_curr_state_reg[1] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\FSM_onehot_curr_state[1]_i_1_n_0 ),
        .Q(p_0_in2_in),
        .R(RST_CFG2));
  (* FSM_ENCODED_STATES = "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_curr_state_reg[2] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\FSM_onehot_curr_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .R(RST_CFG2));
  (* FSM_ENCODED_STATES = "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_curr_state_reg[3] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\FSM_onehot_curr_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .R(RST_CFG2));
  (* FSM_ENCODED_STATES = "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_curr_state_reg[4] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\FSM_onehot_curr_state[4]_i_1_n_0 ),
        .Q(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .R(RST_CFG2));
  (* FSM_ENCODED_STATES = "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_curr_state_reg[5] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\FSM_onehot_curr_state[5]_i_1_n_0 ),
        .Q(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .R(RST_CFG2));
  (* FSM_ENCODED_STATES = "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_curr_state_reg[6] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\FSM_onehot_curr_state_reg_n_0_[7] ),
        .Q(\FSM_onehot_curr_state_reg_n_0_[6] ),
        .R(RST_CFG2));
  (* FSM_ENCODED_STATES = "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_curr_state_reg[7] 
       (.C(CCLK),
        .CE(1'b1),
        .D(config_data_int0),
        .Q(\FSM_onehot_curr_state_reg_n_0_[7] ),
        .R(RST_CFG2));
  LUT6 #(
    .INIT(64'hAA08FFFFAA080000)) 
    RDB_WR_O_i_1
       (.I0(write_config_data_2_0),
        .I1(p_0_in2_in),
        .I2(write_data_end_reg),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(control),
        .I5(RDB_WR_B),
        .O(\FSM_onehot_curr_state_reg[1]_1 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__4/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__4/i__carry_n_0 ,\_inferred__4/i__carry_n_1 ,\_inferred__4/i__carry_n_2 ,\_inferred__4/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}),
        .O(in18[3:0]),
        .S({i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__4/i__carry__0 
       (.CI(\_inferred__4/i__carry_n_0 ),
        .CO({\_inferred__4/i__carry__0_n_0 ,\_inferred__4/i__carry__0_n_1 ,\_inferred__4/i__carry__0_n_2 ,\_inferred__4/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0}),
        .O(in18[7:4]),
        .S({i__carry__0_i_5_n_0,i__carry__0_i_6_n_0,i__carry__0_i_7_n_0,i__carry__0_i_8_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__4/i__carry__1 
       (.CI(\_inferred__4/i__carry__0_n_0 ),
        .CO({\NLW__inferred__4/i__carry__1_CO_UNCONNECTED [3],\_inferred__4/i__carry__1_n_1 ,\_inferred__4/i__carry__1_n_2 ,\_inferred__4/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,i__carry__1_i_1_n_0,i__carry__1_i_2_n_0,i__carry__1_i_3_n_0}),
        .O(in18[11:8]),
        .S({i__carry__1_i_4_n_0,i__carry__1_i_5_n_0,i__carry__1_i_6_n_0,i__carry__1_i_7_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    clk_mux_inst_i_1
       (.I0(control),
        .O(CE00));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[0]_i_1 
       (.I0(control),
        .I1(DI[0]),
        .I2(VLD),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[10]_i_1 
       (.I0(control),
        .I1(DI[10]),
        .I2(VLD),
        .O(p_1_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[11]_i_1 
       (.I0(control),
        .I1(DI[11]),
        .I2(VLD),
        .O(p_1_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[12]_i_1 
       (.I0(control),
        .I1(DI[12]),
        .I2(VLD),
        .O(p_1_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[13]_i_1 
       (.I0(control),
        .I1(DI[13]),
        .I2(VLD),
        .O(p_1_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[14]_i_1 
       (.I0(control),
        .I1(DI[14]),
        .I2(VLD),
        .O(p_1_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[15]_i_1 
       (.I0(control),
        .I1(DI[15]),
        .I2(VLD),
        .O(p_1_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[16]_i_1 
       (.I0(control),
        .I1(DI[16]),
        .I2(VLD),
        .O(p_1_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[17]_i_1 
       (.I0(control),
        .I1(DI[17]),
        .I2(VLD),
        .O(p_1_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[18]_i_1 
       (.I0(control),
        .I1(DI[18]),
        .I2(VLD),
        .O(p_1_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[19]_i_1 
       (.I0(control),
        .I1(DI[19]),
        .I2(VLD),
        .O(p_1_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[1]_i_1 
       (.I0(control),
        .I1(DI[1]),
        .I2(VLD),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[20]_i_1 
       (.I0(control),
        .I1(DI[20]),
        .I2(VLD),
        .O(p_1_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[21]_i_1 
       (.I0(control),
        .I1(DI[21]),
        .I2(VLD),
        .O(p_1_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[22]_i_1 
       (.I0(control),
        .I1(DI[22]),
        .I2(VLD),
        .O(p_1_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[23]_i_1 
       (.I0(control),
        .I1(DI[23]),
        .I2(VLD),
        .O(p_1_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[24]_i_1 
       (.I0(control),
        .I1(DI[24]),
        .I2(VLD),
        .O(p_1_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[25]_i_1 
       (.I0(control),
        .I1(DI[25]),
        .I2(VLD),
        .O(p_1_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[26]_i_1 
       (.I0(control),
        .I1(DI[26]),
        .I2(VLD),
        .O(p_1_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[27]_i_1 
       (.I0(control),
        .I1(DI[27]),
        .I2(VLD),
        .O(p_1_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[28]_i_1 
       (.I0(control),
        .I1(DI[28]),
        .I2(VLD),
        .O(p_1_in[28]));
  LUT2 #(
    .INIT(4'hB)) 
    \config_data_batch_int[29]_i_1 
       (.I0(VLD),
        .I1(control),
        .O(\config_data_batch_int[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[29]_i_2 
       (.I0(control),
        .I1(DI[29]),
        .I2(VLD),
        .O(p_1_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[2]_i_1 
       (.I0(control),
        .I1(DI[2]),
        .I2(VLD),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[3]_i_1 
       (.I0(control),
        .I1(DI[3]),
        .I2(VLD),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[4]_i_1 
       (.I0(control),
        .I1(DI[4]),
        .I2(VLD),
        .O(p_1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[5]_i_1 
       (.I0(control),
        .I1(DI[5]),
        .I2(VLD),
        .O(p_1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[6]_i_1 
       (.I0(control),
        .I1(DI[6]),
        .I2(VLD),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[7]_i_1 
       (.I0(control),
        .I1(DI[7]),
        .I2(VLD),
        .O(p_1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[8]_i_1 
       (.I0(control),
        .I1(DI[8]),
        .I2(VLD),
        .O(p_1_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \config_data_batch_int[9]_i_1 
       (.I0(control),
        .I1(DI[9]),
        .I2(VLD),
        .O(p_1_in[9]));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[0] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(config_data_batch_int[0]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[10] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[10]),
        .Q(config_data_batch_int[10]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[11] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[11]),
        .Q(config_data_batch_int[11]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[12] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[12]),
        .Q(config_data_batch_int[12]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[13] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[13]),
        .Q(config_data_batch_int[13]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[14] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[14]),
        .Q(config_data_batch_int[14]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[15] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[15]),
        .Q(config_data_batch_int[15]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[16] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[16]),
        .Q(config_data_batch_int[16]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[17] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[17]),
        .Q(config_data_batch_int[17]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[18] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[18]),
        .Q(config_data_batch_int[18]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[19] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[19]),
        .Q(config_data_batch_int[19]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[1] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(config_data_batch_int[1]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[20] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[20]),
        .Q(config_data_batch_int[20]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[21] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[21]),
        .Q(config_data_batch_int[21]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[22] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[22]),
        .Q(config_data_batch_int[22]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[23] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[23]),
        .Q(config_data_batch_int[23]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[24] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[24]),
        .Q(config_data_batch_int[24]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[25] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[25]),
        .Q(config_data_batch_int[25]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[26] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[26]),
        .Q(config_data_batch_int[26]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[27] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[27]),
        .Q(config_data_batch_int[27]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[28] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[28]),
        .Q(config_data_batch_int[28]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[29] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[29]),
        .Q(config_data_batch_int[29]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[2] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(config_data_batch_int[2]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[3] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(config_data_batch_int[3]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[4] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(config_data_batch_int[4]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[5] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(config_data_batch_int[5]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[6] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(config_data_batch_int[6]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[7] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(config_data_batch_int[7]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[8] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[8]),
        .Q(config_data_batch_int[8]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_batch_int_reg[9] 
       (.C(CCLK),
        .CE(\config_data_batch_int[29]_i_1_n_0 ),
        .D(p_1_in[9]),
        .Q(config_data_batch_int[9]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[0] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[0]),
        .Q(\config_data_int_reg_n_0_[0] ),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[10] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[10]),
        .Q(\config_data_int_reg_n_0_[10] ),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[11] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[11]),
        .Q(\config_data_int_reg_n_0_[11] ),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[1] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[1]),
        .Q(\config_data_int_reg_n_0_[1] ),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[23] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[23]),
        .Q(in4[0]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[24] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[24]),
        .Q(in4[1]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[25] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[25]),
        .Q(in4[2]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[26] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[26]),
        .Q(in4[3]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[27] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[27]),
        .Q(in4[4]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[28] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[28]),
        .Q(in4[5]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[29] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[29]),
        .Q(in4[6]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[2] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[2]),
        .Q(\config_data_int_reg_n_0_[2] ),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[30] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[30]),
        .Q(in3[0]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[31] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[31]),
        .Q(in3[1]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[3] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[3]),
        .Q(\config_data_int_reg_n_0_[3] ),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[4] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[4]),
        .Q(\config_data_int_reg_n_0_[4] ),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[5] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[5]),
        .Q(\config_data_int_reg_n_0_[5] ),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[6] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[6]),
        .Q(\config_data_int_reg_n_0_[6] ),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[7] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[7]),
        .Q(\config_data_int_reg_n_0_[7] ),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[8] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[8]),
        .Q(\config_data_int_reg_n_0_[8] ),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \config_data_int_reg[9] 
       (.C(CCLK),
        .CE(config_data_int0),
        .D(DI[9]),
        .Q(\config_data_int_reg_n_0_[9] ),
        .R(RST_CFG2));
  LUT5 #(
    .INIT(32'hFD55FC00)) 
    control_batch_int_i_1
       (.I0(\FSM_onehot_curr_state_reg_n_0_[0] ),
        .I1(\ctrl_cnt[9]_i_4_n_0 ),
        .I2(control_batch_int_i_2_n_0),
        .I3(VLD),
        .I4(control_batch_int),
        .O(control_batch_int_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    control_batch_int_i_2
       (.I0(ctrl_cnt_reg[2]),
        .I1(ctrl_cnt_reg[1]),
        .I2(ctrl_cnt_reg[0]),
        .O(control_batch_int_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    control_batch_int_reg
       (.C(CCLK),
        .CE(1'b1),
        .D(control_batch_int_i_1_n_0),
        .Q(control_batch_int),
        .R(RST_CFG2));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hF575F030)) 
    control_int_r_i_1
       (.I0(ctrl_idle_r1),
        .I1(DI[30]),
        .I2(VLD),
        .I3(DI[31]),
        .I4(control),
        .O(control_int_r_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    control_int_r_reg
       (.C(CCLK),
        .CE(1'b1),
        .D(control_int_r_i_1_n_0),
        .Q(control),
        .R(RST_CFG2));
  LUT1 #(
    .INIT(2'h1)) 
    \ctrl_cnt[0]_i_1 
       (.I0(ctrl_cnt_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \ctrl_cnt[1]_i_1 
       (.I0(ctrl_cnt_reg[0]),
        .I1(ctrl_cnt_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \ctrl_cnt[2]_i_1 
       (.I0(ctrl_cnt_reg[2]),
        .I1(ctrl_cnt_reg[0]),
        .I2(ctrl_cnt_reg[1]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \ctrl_cnt[3]_i_1 
       (.I0(ctrl_cnt_reg[3]),
        .I1(ctrl_cnt_reg[1]),
        .I2(ctrl_cnt_reg[0]),
        .I3(ctrl_cnt_reg[2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \ctrl_cnt[4]_i_1 
       (.I0(ctrl_cnt_reg[2]),
        .I1(ctrl_cnt_reg[0]),
        .I2(ctrl_cnt_reg[1]),
        .I3(ctrl_cnt_reg[3]),
        .I4(ctrl_cnt_reg[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \ctrl_cnt[5]_i_1 
       (.I0(ctrl_cnt_reg[5]),
        .I1(ctrl_cnt_reg[2]),
        .I2(ctrl_cnt_reg[0]),
        .I3(ctrl_cnt_reg[1]),
        .I4(ctrl_cnt_reg[3]),
        .I5(ctrl_cnt_reg[4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \ctrl_cnt[6]_i_1 
       (.I0(ctrl_cnt_reg[6]),
        .I1(\ctrl_cnt[9]_i_5_n_0 ),
        .I2(ctrl_cnt_reg[5]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \ctrl_cnt[7]_i_1 
       (.I0(ctrl_cnt_reg[7]),
        .I1(ctrl_cnt_reg[5]),
        .I2(\ctrl_cnt[9]_i_5_n_0 ),
        .I3(ctrl_cnt_reg[6]),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \ctrl_cnt[8]_i_1 
       (.I0(ctrl_cnt_reg[8]),
        .I1(ctrl_cnt_reg[6]),
        .I2(\ctrl_cnt[9]_i_5_n_0 ),
        .I3(ctrl_cnt_reg[5]),
        .I4(ctrl_cnt_reg[7]),
        .O(p_0_in[8]));
  LUT4 #(
    .INIT(16'hAEAA)) 
    \ctrl_cnt[9]_i_1 
       (.I0(RST_CFG2),
        .I1(\FSM_onehot_curr_state_reg_n_0_[0] ),
        .I2(VLD),
        .I3(\ctrl_cnt[9]_i_4_n_0 ),
        .O(\ctrl_cnt[9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \ctrl_cnt[9]_i_2 
       (.I0(VLD),
        .I1(ctrl_cnt_reg[2]),
        .I2(ctrl_cnt_reg[1]),
        .I3(ctrl_cnt_reg[0]),
        .I4(\ctrl_cnt[9]_i_4_n_0 ),
        .O(\ctrl_cnt[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \ctrl_cnt[9]_i_3 
       (.I0(ctrl_cnt_reg[9]),
        .I1(ctrl_cnt_reg[7]),
        .I2(ctrl_cnt_reg[5]),
        .I3(\ctrl_cnt[9]_i_5_n_0 ),
        .I4(ctrl_cnt_reg[6]),
        .I5(ctrl_cnt_reg[8]),
        .O(p_0_in[9]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \ctrl_cnt[9]_i_4 
       (.I0(\ctrl_cnt[9]_i_6_n_0 ),
        .I1(ctrl_cnt_reg[5]),
        .I2(ctrl_cnt_reg[6]),
        .I3(ctrl_cnt_reg[4]),
        .O(\ctrl_cnt[9]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \ctrl_cnt[9]_i_5 
       (.I0(ctrl_cnt_reg[4]),
        .I1(ctrl_cnt_reg[3]),
        .I2(ctrl_cnt_reg[1]),
        .I3(ctrl_cnt_reg[0]),
        .I4(ctrl_cnt_reg[2]),
        .O(\ctrl_cnt[9]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \ctrl_cnt[9]_i_6 
       (.I0(ctrl_cnt_reg[8]),
        .I1(ctrl_cnt_reg[7]),
        .I2(ctrl_cnt_reg[9]),
        .I3(ctrl_cnt_reg[3]),
        .O(\ctrl_cnt[9]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_cnt_reg[0] 
       (.C(CCLK),
        .CE(\ctrl_cnt[9]_i_2_n_0 ),
        .D(p_0_in[0]),
        .Q(ctrl_cnt_reg[0]),
        .R(\ctrl_cnt[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_cnt_reg[1] 
       (.C(CCLK),
        .CE(\ctrl_cnt[9]_i_2_n_0 ),
        .D(p_0_in[1]),
        .Q(ctrl_cnt_reg[1]),
        .R(\ctrl_cnt[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_cnt_reg[2] 
       (.C(CCLK),
        .CE(\ctrl_cnt[9]_i_2_n_0 ),
        .D(p_0_in[2]),
        .Q(ctrl_cnt_reg[2]),
        .R(\ctrl_cnt[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_cnt_reg[3] 
       (.C(CCLK),
        .CE(\ctrl_cnt[9]_i_2_n_0 ),
        .D(p_0_in[3]),
        .Q(ctrl_cnt_reg[3]),
        .R(\ctrl_cnt[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_cnt_reg[4] 
       (.C(CCLK),
        .CE(\ctrl_cnt[9]_i_2_n_0 ),
        .D(p_0_in[4]),
        .Q(ctrl_cnt_reg[4]),
        .R(\ctrl_cnt[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_cnt_reg[5] 
       (.C(CCLK),
        .CE(\ctrl_cnt[9]_i_2_n_0 ),
        .D(p_0_in[5]),
        .Q(ctrl_cnt_reg[5]),
        .R(\ctrl_cnt[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_cnt_reg[6] 
       (.C(CCLK),
        .CE(\ctrl_cnt[9]_i_2_n_0 ),
        .D(p_0_in[6]),
        .Q(ctrl_cnt_reg[6]),
        .R(\ctrl_cnt[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_cnt_reg[7] 
       (.C(CCLK),
        .CE(\ctrl_cnt[9]_i_2_n_0 ),
        .D(p_0_in[7]),
        .Q(ctrl_cnt_reg[7]),
        .R(\ctrl_cnt[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_cnt_reg[8] 
       (.C(CCLK),
        .CE(\ctrl_cnt[9]_i_2_n_0 ),
        .D(p_0_in[8]),
        .Q(ctrl_cnt_reg[8]),
        .R(\ctrl_cnt[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ctrl_cnt_reg[9] 
       (.C(CCLK),
        .CE(\ctrl_cnt[9]_i_2_n_0 ),
        .D(p_0_in[9]),
        .Q(ctrl_cnt_reg[9]),
        .R(\ctrl_cnt[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h8)) 
    ctrl_idle_i_1
       (.I0(\FSM_onehot_curr_state_reg_n_0_[0] ),
        .I1(control),
        .O(ctrl_idle0));
  FDRE #(
    .INIT(1'b0)) 
    ctrl_idle_r1_reg
       (.C(CCLK),
        .CE(1'b1),
        .D(ctrl_idle),
        .Q(ctrl_idle_r1),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    ctrl_idle_reg
       (.C(CCLK),
        .CE(1'b1),
        .D(ctrl_idle0),
        .Q(ctrl_idle),
        .R(RST_CFG2));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry__0_i_1
       (.I0(p_0_in2_in),
        .I1(wr_batch_addr_incr_reg[7]),
        .O(i__carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry__0_i_2
       (.I0(p_0_in2_in),
        .I1(wr_batch_addr_incr_reg[6]),
        .O(i__carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry__0_i_3
       (.I0(p_0_in2_in),
        .I1(wr_batch_addr_incr_reg[5]),
        .O(i__carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry__0_i_4
       (.I0(p_0_in2_in),
        .I1(wr_batch_addr_incr_reg[4]),
        .O(i__carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'h7748774877484848)) 
    i__carry__0_i_5
       (.I0(wr_batch_addr_incr_reg[7]),
        .I1(p_0_in2_in),
        .I2(\config_data_int_reg_n_0_[7] ),
        .I3(uram_addr_int_r[7]),
        .I4(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I5(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .O(i__carry__0_i_5_n_0));
  LUT6 #(
    .INIT(64'h7748774877484848)) 
    i__carry__0_i_6
       (.I0(wr_batch_addr_incr_reg[6]),
        .I1(p_0_in2_in),
        .I2(\config_data_int_reg_n_0_[6] ),
        .I3(uram_addr_int_r[6]),
        .I4(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I5(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .O(i__carry__0_i_6_n_0));
  LUT6 #(
    .INIT(64'h7748774877484848)) 
    i__carry__0_i_7
       (.I0(wr_batch_addr_incr_reg[5]),
        .I1(p_0_in2_in),
        .I2(\config_data_int_reg_n_0_[5] ),
        .I3(uram_addr_int_r[5]),
        .I4(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I5(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .O(i__carry__0_i_7_n_0));
  LUT6 #(
    .INIT(64'h7748774877484848)) 
    i__carry__0_i_8
       (.I0(wr_batch_addr_incr_reg[4]),
        .I1(p_0_in2_in),
        .I2(\config_data_int_reg_n_0_[4] ),
        .I3(uram_addr_int_r[4]),
        .I4(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I5(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .O(i__carry__0_i_8_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry__1_i_1
       (.I0(p_0_in2_in),
        .I1(wr_batch_addr_incr_reg[10]),
        .O(i__carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry__1_i_2
       (.I0(p_0_in2_in),
        .I1(wr_batch_addr_incr_reg[9]),
        .O(i__carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry__1_i_3
       (.I0(p_0_in2_in),
        .I1(wr_batch_addr_incr_reg[8]),
        .O(i__carry__1_i_3_n_0));
  LUT6 #(
    .INIT(64'h1115EEEACCC0CCC0)) 
    i__carry__1_i_4
       (.I0(\config_data_int_reg_n_0_[11] ),
        .I1(uram_addr_int_r[11]),
        .I2(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I3(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .I4(wr_batch_addr_incr_reg[11]),
        .I5(p_0_in2_in),
        .O(i__carry__1_i_4_n_0));
  LUT6 #(
    .INIT(64'h7748774877484848)) 
    i__carry__1_i_5
       (.I0(wr_batch_addr_incr_reg[10]),
        .I1(p_0_in2_in),
        .I2(\config_data_int_reg_n_0_[10] ),
        .I3(uram_addr_int_r[10]),
        .I4(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I5(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .O(i__carry__1_i_5_n_0));
  LUT6 #(
    .INIT(64'h7748774877484848)) 
    i__carry__1_i_6
       (.I0(wr_batch_addr_incr_reg[9]),
        .I1(p_0_in2_in),
        .I2(\config_data_int_reg_n_0_[9] ),
        .I3(uram_addr_int_r[9]),
        .I4(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I5(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .O(i__carry__1_i_6_n_0));
  LUT6 #(
    .INIT(64'h7748774877484848)) 
    i__carry__1_i_7
       (.I0(wr_batch_addr_incr_reg[8]),
        .I1(p_0_in2_in),
        .I2(\config_data_int_reg_n_0_[8] ),
        .I3(uram_addr_int_r[8]),
        .I4(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I5(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .O(i__carry__1_i_7_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry_i_1
       (.I0(p_0_in2_in),
        .I1(wr_batch_addr_incr_reg[3]),
        .O(i__carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry_i_2
       (.I0(p_0_in2_in),
        .I1(wr_batch_addr_incr_reg[2]),
        .O(i__carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i__carry_i_3
       (.I0(p_0_in2_in),
        .I1(wr_batch_addr_incr_reg[1]),
        .O(i__carry_i_3_n_0));
  LUT4 #(
    .INIT(16'hFEEE)) 
    i__carry_i_4
       (.I0(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .I2(wr_batch_addr_incr_reg[0]),
        .I3(p_0_in2_in),
        .O(i__carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h7748774877484848)) 
    i__carry_i_5
       (.I0(wr_batch_addr_incr_reg[3]),
        .I1(p_0_in2_in),
        .I2(\config_data_int_reg_n_0_[3] ),
        .I3(uram_addr_int_r[3]),
        .I4(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I5(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .O(i__carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h7748774877484848)) 
    i__carry_i_6
       (.I0(wr_batch_addr_incr_reg[2]),
        .I1(p_0_in2_in),
        .I2(\config_data_int_reg_n_0_[2] ),
        .I3(uram_addr_int_r[2]),
        .I4(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I5(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .O(i__carry_i_6_n_0));
  LUT6 #(
    .INIT(64'h7748774877484848)) 
    i__carry_i_7
       (.I0(wr_batch_addr_incr_reg[1]),
        .I1(p_0_in2_in),
        .I2(\config_data_int_reg_n_0_[1] ),
        .I3(uram_addr_int_r[1]),
        .I4(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I5(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .O(i__carry_i_7_n_0));
  LUT6 #(
    .INIT(64'h003F003F003F4848)) 
    i__carry_i_8
       (.I0(wr_batch_addr_incr_reg[0]),
        .I1(p_0_in2_in),
        .I2(\config_data_int_reg_n_0_[0] ),
        .I3(uram_addr_int_r[0]),
        .I4(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I5(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .O(i__carry_i_8_n_0));
  CARRY4 num_reads_r0_carry
       (.CI(1'b0),
        .CO({num_reads_r0_carry_n_0,num_reads_r0_carry_n_1,num_reads_r0_carry_n_2,num_reads_r0_carry_n_3}),
        .CYINIT(num_reads_r[0]),
        .DI(num_reads_r[4:1]),
        .O(in22[4:1]),
        .S({num_reads_r0_carry_i_1_n_0,num_reads_r0_carry_i_2_n_0,num_reads_r0_carry_i_3_n_0,num_reads_r0_carry_i_4_n_0}));
  CARRY4 num_reads_r0_carry__0
       (.CI(num_reads_r0_carry_n_0),
        .CO({num_reads_r0_carry__0_n_0,num_reads_r0_carry__0_n_1,num_reads_r0_carry__0_n_2,num_reads_r0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI(num_reads_r[8:5]),
        .O(in22[8:5]),
        .S({num_reads_r0_carry__0_i_1_n_0,num_reads_r0_carry__0_i_2_n_0,num_reads_r0_carry__0_i_3_n_0,num_reads_r0_carry__0_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__0_i_1
       (.I0(num_reads_r[8]),
        .O(num_reads_r0_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__0_i_2
       (.I0(num_reads_r[7]),
        .O(num_reads_r0_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__0_i_3
       (.I0(num_reads_r[6]),
        .O(num_reads_r0_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__0_i_4
       (.I0(num_reads_r[5]),
        .O(num_reads_r0_carry__0_i_4_n_0));
  CARRY4 num_reads_r0_carry__1
       (.CI(num_reads_r0_carry__0_n_0),
        .CO({num_reads_r0_carry__1_n_0,num_reads_r0_carry__1_n_1,num_reads_r0_carry__1_n_2,num_reads_r0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI(num_reads_r[12:9]),
        .O(in22[12:9]),
        .S({num_reads_r0_carry__1_i_1_n_0,num_reads_r0_carry__1_i_2_n_0,num_reads_r0_carry__1_i_3_n_0,num_reads_r0_carry__1_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__1_i_1
       (.I0(num_reads_r[12]),
        .O(num_reads_r0_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__1_i_2
       (.I0(num_reads_r[11]),
        .O(num_reads_r0_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__1_i_3
       (.I0(num_reads_r[10]),
        .O(num_reads_r0_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__1_i_4
       (.I0(num_reads_r[9]),
        .O(num_reads_r0_carry__1_i_4_n_0));
  CARRY4 num_reads_r0_carry__2
       (.CI(num_reads_r0_carry__1_n_0),
        .CO({num_reads_r0_carry__2_n_0,num_reads_r0_carry__2_n_1,num_reads_r0_carry__2_n_2,num_reads_r0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI(num_reads_r[16:13]),
        .O(in22[16:13]),
        .S({num_reads_r0_carry__2_i_1_n_0,num_reads_r0_carry__2_i_2_n_0,num_reads_r0_carry__2_i_3_n_0,num_reads_r0_carry__2_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__2_i_1
       (.I0(num_reads_r[16]),
        .O(num_reads_r0_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__2_i_2
       (.I0(num_reads_r[15]),
        .O(num_reads_r0_carry__2_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__2_i_3
       (.I0(num_reads_r[14]),
        .O(num_reads_r0_carry__2_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__2_i_4
       (.I0(num_reads_r[13]),
        .O(num_reads_r0_carry__2_i_4_n_0));
  CARRY4 num_reads_r0_carry__3
       (.CI(num_reads_r0_carry__2_n_0),
        .CO({num_reads_r0_carry__3_n_0,num_reads_r0_carry__3_n_1,num_reads_r0_carry__3_n_2,num_reads_r0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI(num_reads_r[20:17]),
        .O(in22[20:17]),
        .S({num_reads_r0_carry__3_i_1_n_0,num_reads_r0_carry__3_i_2_n_0,num_reads_r0_carry__3_i_3_n_0,num_reads_r0_carry__3_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__3_i_1
       (.I0(num_reads_r[20]),
        .O(num_reads_r0_carry__3_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__3_i_2
       (.I0(num_reads_r[19]),
        .O(num_reads_r0_carry__3_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__3_i_3
       (.I0(num_reads_r[18]),
        .O(num_reads_r0_carry__3_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__3_i_4
       (.I0(num_reads_r[17]),
        .O(num_reads_r0_carry__3_i_4_n_0));
  CARRY4 num_reads_r0_carry__4
       (.CI(num_reads_r0_carry__3_n_0),
        .CO({num_reads_r0_carry__4_n_0,num_reads_r0_carry__4_n_1,num_reads_r0_carry__4_n_2,num_reads_r0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI(num_reads_r[24:21]),
        .O(in22[24:21]),
        .S({num_reads_r0_carry__4_i_1_n_0,num_reads_r0_carry__4_i_2_n_0,num_reads_r0_carry__4_i_3_n_0,num_reads_r0_carry__4_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__4_i_1
       (.I0(num_reads_r[24]),
        .O(num_reads_r0_carry__4_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__4_i_2
       (.I0(num_reads_r[23]),
        .O(num_reads_r0_carry__4_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__4_i_3
       (.I0(num_reads_r[22]),
        .O(num_reads_r0_carry__4_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__4_i_4
       (.I0(num_reads_r[21]),
        .O(num_reads_r0_carry__4_i_4_n_0));
  CARRY4 num_reads_r0_carry__5
       (.CI(num_reads_r0_carry__4_n_0),
        .CO({num_reads_r0_carry__5_n_0,num_reads_r0_carry__5_n_1,num_reads_r0_carry__5_n_2,num_reads_r0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI(num_reads_r[28:25]),
        .O(in22[28:25]),
        .S({num_reads_r0_carry__5_i_1_n_0,num_reads_r0_carry__5_i_2_n_0,num_reads_r0_carry__5_i_3_n_0,num_reads_r0_carry__5_i_4_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__5_i_1
       (.I0(num_reads_r[28]),
        .O(num_reads_r0_carry__5_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__5_i_2
       (.I0(num_reads_r[27]),
        .O(num_reads_r0_carry__5_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__5_i_3
       (.I0(num_reads_r[26]),
        .O(num_reads_r0_carry__5_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__5_i_4
       (.I0(num_reads_r[25]),
        .O(num_reads_r0_carry__5_i_4_n_0));
  CARRY4 num_reads_r0_carry__6
       (.CI(num_reads_r0_carry__5_n_0),
        .CO(NLW_num_reads_r0_carry__6_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_num_reads_r0_carry__6_O_UNCONNECTED[3:1],in22[29]}),
        .S({1'b0,1'b0,1'b0,num_reads_r0_carry__6_i_1_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry__6_i_1
       (.I0(num_reads_r[29]),
        .O(num_reads_r0_carry__6_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry_i_1
       (.I0(num_reads_r[4]),
        .O(num_reads_r0_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry_i_2
       (.I0(num_reads_r[3]),
        .O(num_reads_r0_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry_i_3
       (.I0(num_reads_r[2]),
        .O(num_reads_r0_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    num_reads_r0_carry_i_4
       (.I0(num_reads_r[1]),
        .O(num_reads_r0_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'h8B)) 
    \num_reads_r[0]_i_1 
       (.I0(config_data_batch_int[0]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(num_reads_r[0]),
        .O(num_reads_r_1[0]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[10]_i_1 
       (.I0(config_data_batch_int[10]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[10]),
        .O(num_reads_r_1[10]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[11]_i_1 
       (.I0(config_data_batch_int[11]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[11]),
        .O(num_reads_r_1[11]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[12]_i_1 
       (.I0(config_data_batch_int[12]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[12]),
        .O(num_reads_r_1[12]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[13]_i_1 
       (.I0(config_data_batch_int[13]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[13]),
        .O(num_reads_r_1[13]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[14]_i_1 
       (.I0(config_data_batch_int[14]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[14]),
        .O(num_reads_r_1[14]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[15]_i_1 
       (.I0(config_data_batch_int[15]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[15]),
        .O(num_reads_r_1[15]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[16]_i_1 
       (.I0(config_data_batch_int[16]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[16]),
        .O(num_reads_r_1[16]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[17]_i_1 
       (.I0(config_data_batch_int[17]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[17]),
        .O(num_reads_r_1[17]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[18]_i_1 
       (.I0(config_data_batch_int[18]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[18]),
        .O(num_reads_r_1[18]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[19]_i_1 
       (.I0(config_data_batch_int[19]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[19]),
        .O(num_reads_r_1[19]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[1]_i_1 
       (.I0(config_data_batch_int[1]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[1]),
        .O(num_reads_r_1[1]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[20]_i_1 
       (.I0(config_data_batch_int[20]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[20]),
        .O(num_reads_r_1[20]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[21]_i_1 
       (.I0(config_data_batch_int[21]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[21]),
        .O(num_reads_r_1[21]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[22]_i_1 
       (.I0(config_data_batch_int[22]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[22]),
        .O(num_reads_r_1[22]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[23]_i_1 
       (.I0(config_data_batch_int[23]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[23]),
        .O(num_reads_r_1[23]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[24]_i_1 
       (.I0(config_data_batch_int[24]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[24]),
        .O(num_reads_r_1[24]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[25]_i_1 
       (.I0(config_data_batch_int[25]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[25]),
        .O(num_reads_r_1[25]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[26]_i_1 
       (.I0(config_data_batch_int[26]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[26]),
        .O(num_reads_r_1[26]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[27]_i_1 
       (.I0(config_data_batch_int[27]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[27]),
        .O(num_reads_r_1[27]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[28]_i_1 
       (.I0(config_data_batch_int[28]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[28]),
        .O(num_reads_r_1[28]));
  LUT4 #(
    .INIT(16'hABAA)) 
    \num_reads_r[29]_i_1 
       (.I0(RST_CFG2),
        .I1(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .I2(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I3(\FSM_onehot_curr_state_reg_n_0_[0] ),
        .O(\num_reads_r[29]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \num_reads_r[29]_i_2 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .O(\num_reads_r[29]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[29]_i_3 
       (.I0(config_data_batch_int[29]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[29]),
        .O(num_reads_r_1[29]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[2]_i_1 
       (.I0(config_data_batch_int[2]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[2]),
        .O(num_reads_r_1[2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[3]_i_1 
       (.I0(config_data_batch_int[3]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[3]),
        .O(num_reads_r_1[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[4]_i_1 
       (.I0(config_data_batch_int[4]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[4]),
        .O(num_reads_r_1[4]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[5]_i_1 
       (.I0(config_data_batch_int[5]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[5]),
        .O(num_reads_r_1[5]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[6]_i_1 
       (.I0(config_data_batch_int[6]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[6]),
        .O(num_reads_r_1[6]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[7]_i_1 
       (.I0(config_data_batch_int[7]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[7]),
        .O(num_reads_r_1[7]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[8]_i_1 
       (.I0(config_data_batch_int[8]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[8]),
        .O(num_reads_r_1[8]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \num_reads_r[9]_i_1 
       (.I0(config_data_batch_int[9]),
        .I1(\FSM_onehot_curr_state_reg_n_0_[4] ),
        .I2(in22[9]),
        .O(num_reads_r_1[9]));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[0] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[0]),
        .Q(num_reads_r[0]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[10] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[10]),
        .Q(num_reads_r[10]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[11] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[11]),
        .Q(num_reads_r[11]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[12] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[12]),
        .Q(num_reads_r[12]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[13] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[13]),
        .Q(num_reads_r[13]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[14] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[14]),
        .Q(num_reads_r[14]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[15] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[15]),
        .Q(num_reads_r[15]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[16] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[16]),
        .Q(num_reads_r[16]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[17] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[17]),
        .Q(num_reads_r[17]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[18] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[18]),
        .Q(num_reads_r[18]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[19] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[19]),
        .Q(num_reads_r[19]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[1] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[1]),
        .Q(num_reads_r[1]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[20] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[20]),
        .Q(num_reads_r[20]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[21] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[21]),
        .Q(num_reads_r[21]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[22] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[22]),
        .Q(num_reads_r[22]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[23] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[23]),
        .Q(num_reads_r[23]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[24] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[24]),
        .Q(num_reads_r[24]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[25] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[25]),
        .Q(num_reads_r[25]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[26] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[26]),
        .Q(num_reads_r[26]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[27] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[27]),
        .Q(num_reads_r[27]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[28] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[28]),
        .Q(num_reads_r[28]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[29] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[29]),
        .Q(num_reads_r[29]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[2] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[2]),
        .Q(num_reads_r[2]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[3] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[3]),
        .Q(num_reads_r[3]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[4] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[4]),
        .Q(num_reads_r[4]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[5] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[5]),
        .Q(num_reads_r[5]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[6] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[6]),
        .Q(num_reads_r[6]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[7] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[7]),
        .Q(num_reads_r[7]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[8] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[8]),
        .Q(num_reads_r[8]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \num_reads_r_reg[9] 
       (.C(CCLK),
        .CE(\num_reads_r[29]_i_2_n_0 ),
        .D(num_reads_r_1[9]),
        .Q(num_reads_r[9]),
        .R(\num_reads_r[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE0E0E0E0E0)) 
    \uram_addr_int_r[0]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I2(\config_data_int_reg_n_0_[0] ),
        .I3(p_0_in2_in),
        .I4(\num_reads_r[29]_i_2_n_0 ),
        .I5(in18[0]),
        .O(\uram_addr_int_r[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE0E0E0E0E0)) 
    \uram_addr_int_r[10]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I2(\config_data_int_reg_n_0_[10] ),
        .I3(p_0_in2_in),
        .I4(\num_reads_r[29]_i_2_n_0 ),
        .I5(in18[10]),
        .O(\uram_addr_int_r[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE0E0E0E0E0)) 
    \uram_addr_int_r[11]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I2(\config_data_int_reg_n_0_[11] ),
        .I3(p_0_in2_in),
        .I4(\num_reads_r[29]_i_2_n_0 ),
        .I5(in18[11]),
        .O(\uram_addr_int_r[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE0E0E0E0E0)) 
    \uram_addr_int_r[1]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I2(\config_data_int_reg_n_0_[1] ),
        .I3(p_0_in2_in),
        .I4(\num_reads_r[29]_i_2_n_0 ),
        .I5(in18[1]),
        .O(\uram_addr_int_r[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE0E0E0E0E0)) 
    \uram_addr_int_r[2]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I2(\config_data_int_reg_n_0_[2] ),
        .I3(p_0_in2_in),
        .I4(\num_reads_r[29]_i_2_n_0 ),
        .I5(in18[2]),
        .O(\uram_addr_int_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE0E0E0E0E0)) 
    \uram_addr_int_r[3]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I2(\config_data_int_reg_n_0_[3] ),
        .I3(p_0_in2_in),
        .I4(\num_reads_r[29]_i_2_n_0 ),
        .I5(in18[3]),
        .O(\uram_addr_int_r[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE0E0E0E0E0)) 
    \uram_addr_int_r[4]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I2(\config_data_int_reg_n_0_[4] ),
        .I3(p_0_in2_in),
        .I4(\num_reads_r[29]_i_2_n_0 ),
        .I5(in18[4]),
        .O(\uram_addr_int_r[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE0E0E0E0E0)) 
    \uram_addr_int_r[5]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I2(\config_data_int_reg_n_0_[5] ),
        .I3(p_0_in2_in),
        .I4(\num_reads_r[29]_i_2_n_0 ),
        .I5(in18[5]),
        .O(\uram_addr_int_r[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE0E0E0E0E0)) 
    \uram_addr_int_r[6]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I2(\config_data_int_reg_n_0_[6] ),
        .I3(p_0_in2_in),
        .I4(\num_reads_r[29]_i_2_n_0 ),
        .I5(in18[6]),
        .O(\uram_addr_int_r[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE0E0E0E0E0)) 
    \uram_addr_int_r[7]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I2(\config_data_int_reg_n_0_[7] ),
        .I3(p_0_in2_in),
        .I4(\num_reads_r[29]_i_2_n_0 ),
        .I5(in18[7]),
        .O(\uram_addr_int_r[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE0E0E0E0E0)) 
    \uram_addr_int_r[8]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I2(\config_data_int_reg_n_0_[8] ),
        .I3(p_0_in2_in),
        .I4(\num_reads_r[29]_i_2_n_0 ),
        .I5(in18[8]),
        .O(\uram_addr_int_r[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFE0E0E0E0E0)) 
    \uram_addr_int_r[9]_i_1 
       (.I0(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_curr_state_reg_n_0_[5] ),
        .I2(\config_data_int_reg_n_0_[9] ),
        .I3(p_0_in2_in),
        .I4(\num_reads_r[29]_i_2_n_0 ),
        .I5(in18[9]),
        .O(\uram_addr_int_r[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \uram_addr_int_r_reg[0] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_addr_int_r[0]_i_1_n_0 ),
        .Q(uram_addr_int_r[0]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_addr_int_r_reg[10] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_addr_int_r[10]_i_1_n_0 ),
        .Q(uram_addr_int_r[10]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_addr_int_r_reg[11] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_addr_int_r[11]_i_1_n_0 ),
        .Q(uram_addr_int_r[11]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_addr_int_r_reg[1] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_addr_int_r[1]_i_1_n_0 ),
        .Q(uram_addr_int_r[1]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_addr_int_r_reg[2] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_addr_int_r[2]_i_1_n_0 ),
        .Q(uram_addr_int_r[2]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_addr_int_r_reg[3] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_addr_int_r[3]_i_1_n_0 ),
        .Q(uram_addr_int_r[3]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_addr_int_r_reg[4] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_addr_int_r[4]_i_1_n_0 ),
        .Q(uram_addr_int_r[4]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_addr_int_r_reg[5] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_addr_int_r[5]_i_1_n_0 ),
        .Q(uram_addr_int_r[5]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_addr_int_r_reg[6] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_addr_int_r[6]_i_1_n_0 ),
        .Q(uram_addr_int_r[6]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_addr_int_r_reg[7] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_addr_int_r[7]_i_1_n_0 ),
        .Q(uram_addr_int_r[7]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_addr_int_r_reg[8] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_addr_int_r[8]_i_1_n_0 ),
        .Q(uram_addr_int_r[8]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_addr_int_r_reg[9] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_addr_int_r[9]_i_1_n_0 ),
        .Q(uram_addr_int_r[9]),
        .R(RST_CFG2));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[0]_i_1 
       (.I0(uram_data_int_r[0]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[0]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[10]_i_1 
       (.I0(uram_data_int_r[10]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[10]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[11]_i_1 
       (.I0(uram_data_int_r[11]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[11]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[12]_i_1 
       (.I0(uram_data_int_r[12]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[12]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[13]_i_1 
       (.I0(uram_data_int_r[13]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[13]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[14]_i_1 
       (.I0(uram_data_int_r[14]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[14]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[15]_i_1 
       (.I0(uram_data_int_r[15]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[16]_i_1 
       (.I0(uram_data_int_r[16]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[16]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[17]_i_1 
       (.I0(uram_data_int_r[17]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[17]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[18]_i_1 
       (.I0(uram_data_int_r[18]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[18]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[19]_i_1 
       (.I0(uram_data_int_r[19]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[19]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[1]_i_1 
       (.I0(uram_data_int_r[1]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[1]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[20]_i_1 
       (.I0(uram_data_int_r[20]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[20]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[21]_i_1 
       (.I0(uram_data_int_r[21]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[21]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[22]_i_1 
       (.I0(uram_data_int_r[22]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[22]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[23]_i_1 
       (.I0(uram_data_int_r[23]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[23]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[24]_i_1 
       (.I0(uram_data_int_r[24]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[24]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[25]_i_1 
       (.I0(uram_data_int_r[25]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[25]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[26]_i_1 
       (.I0(uram_data_int_r[26]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[26]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[27]_i_1 
       (.I0(uram_data_int_r[27]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[27]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[28]_i_1 
       (.I0(uram_data_int_r[28]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[28]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[29]_i_1 
       (.I0(uram_data_int_r[29]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[29]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[2]_i_1 
       (.I0(uram_data_int_r[2]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[2]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[30]_i_1 
       (.I0(uram_data_int_r[30]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[0]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[31]_i_1 
       (.I0(uram_data_int_r[31]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[1]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[32]_i_1 
       (.I0(uram_data_int_r[32]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[2]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[32]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[33]_i_1 
       (.I0(uram_data_int_r[33]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[3]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[33]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[34]_i_1 
       (.I0(uram_data_int_r[34]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[4]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[34]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[35]_i_1 
       (.I0(uram_data_int_r[35]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[5]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[35]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[36]_i_1 
       (.I0(uram_data_int_r[36]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[6]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[36]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[37]_i_1 
       (.I0(uram_data_int_r[37]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[7]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[37]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[38]_i_1 
       (.I0(uram_data_int_r[38]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[8]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[38]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[39]_i_1 
       (.I0(uram_data_int_r[39]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[9]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[39]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[3]_i_1 
       (.I0(uram_data_int_r[3]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[3]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[40]_i_1 
       (.I0(uram_data_int_r[40]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[10]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[40]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[41]_i_1 
       (.I0(uram_data_int_r[41]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[11]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[41]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[42]_i_1 
       (.I0(uram_data_int_r[42]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[12]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[42]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[43]_i_1 
       (.I0(uram_data_int_r[43]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[13]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[43]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[44]_i_1 
       (.I0(uram_data_int_r[44]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[14]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[44]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[45]_i_1 
       (.I0(uram_data_int_r[45]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[15]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[45]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[46]_i_1 
       (.I0(uram_data_int_r[46]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[16]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[46]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[47]_i_1 
       (.I0(uram_data_int_r[47]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[17]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[47]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[48]_i_1 
       (.I0(uram_data_int_r[48]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[18]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[48]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[49]_i_1 
       (.I0(uram_data_int_r[49]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[19]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[49]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[4]_i_1 
       (.I0(uram_data_int_r[4]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[4]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[50]_i_1 
       (.I0(uram_data_int_r[50]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[20]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[50]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[51]_i_1 
       (.I0(uram_data_int_r[51]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[21]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[51]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[52]_i_1 
       (.I0(uram_data_int_r[52]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[22]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[52]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[53]_i_1 
       (.I0(uram_data_int_r[53]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[23]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[53]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[54]_i_1 
       (.I0(uram_data_int_r[54]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[24]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[54]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[55]_i_1 
       (.I0(uram_data_int_r[55]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[25]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[55]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[56]_i_1 
       (.I0(uram_data_int_r[56]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[26]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[56]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[57]_i_1 
       (.I0(uram_data_int_r[57]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[27]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[57]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[58]_i_1 
       (.I0(uram_data_int_r[58]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[28]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[58]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[59]_i_1 
       (.I0(uram_data_int_r[59]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_1[29]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[59]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[5]_i_1 
       (.I0(uram_data_int_r[5]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[5]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[60]_i_1 
       (.I0(uram_data_int_r[60]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[0]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[60]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[61]_i_1 
       (.I0(uram_data_int_r[61]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[1]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[61]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[62]_i_1 
       (.I0(uram_data_int_r[62]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[2]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[62]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[63]_i_1 
       (.I0(uram_data_int_r[63]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[3]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[63]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[64]_i_1 
       (.I0(uram_data_int_r[64]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[4]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[64]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[65]_i_1 
       (.I0(uram_data_int_r[65]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[5]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[65]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[66]_i_1 
       (.I0(uram_data_int_r[66]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[6]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[66]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[67]_i_1 
       (.I0(uram_data_int_r[67]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[7]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[67]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[68]_i_1 
       (.I0(uram_data_int_r[68]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[8]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[68]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[69]_i_1 
       (.I0(uram_data_int_r[69]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[9]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[69]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[6]_i_1 
       (.I0(uram_data_int_r[6]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[6]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[70]_i_1 
       (.I0(uram_data_int_r[70]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[10]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[70]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[71]_i_1 
       (.I0(uram_data_int_r[71]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_2[11]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[71]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[7]_i_1 
       (.I0(uram_data_int_r[7]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[7]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[8]_i_1 
       (.I0(uram_data_int_r[8]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[8]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE200E2E2E200E200)) 
    \uram_data_int_r[9]_i_1 
       (.I0(uram_data_int_r[9]),
        .I1(write_config_data_2_0),
        .I2(write_config_data_0[9]),
        .I3(\FSM_onehot_curr_state_reg_n_0_[2] ),
        .I4(write_data_end_reg),
        .I5(p_0_in2_in),
        .O(\uram_data_int_r[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[0] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[0]_i_1_n_0 ),
        .Q(uram_data_int_r[0]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[10] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[10]_i_1_n_0 ),
        .Q(uram_data_int_r[10]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[11] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[11]_i_1_n_0 ),
        .Q(uram_data_int_r[11]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[12] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[12]_i_1_n_0 ),
        .Q(uram_data_int_r[12]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[13] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[13]_i_1_n_0 ),
        .Q(uram_data_int_r[13]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[14] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[14]_i_1_n_0 ),
        .Q(uram_data_int_r[14]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[15] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[15]_i_1_n_0 ),
        .Q(uram_data_int_r[15]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[16] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[16]_i_1_n_0 ),
        .Q(uram_data_int_r[16]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[17] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[17]_i_1_n_0 ),
        .Q(uram_data_int_r[17]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[18] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[18]_i_1_n_0 ),
        .Q(uram_data_int_r[18]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[19] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[19]_i_1_n_0 ),
        .Q(uram_data_int_r[19]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[1] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[1]_i_1_n_0 ),
        .Q(uram_data_int_r[1]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[20] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[20]_i_1_n_0 ),
        .Q(uram_data_int_r[20]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[21] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[21]_i_1_n_0 ),
        .Q(uram_data_int_r[21]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[22] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[22]_i_1_n_0 ),
        .Q(uram_data_int_r[22]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[23] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[23]_i_1_n_0 ),
        .Q(uram_data_int_r[23]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[24] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[24]_i_1_n_0 ),
        .Q(uram_data_int_r[24]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[25] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[25]_i_1_n_0 ),
        .Q(uram_data_int_r[25]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[26] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[26]_i_1_n_0 ),
        .Q(uram_data_int_r[26]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[27] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[27]_i_1_n_0 ),
        .Q(uram_data_int_r[27]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[28] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[28]_i_1_n_0 ),
        .Q(uram_data_int_r[28]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[29] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[29]_i_1_n_0 ),
        .Q(uram_data_int_r[29]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[2] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[2]_i_1_n_0 ),
        .Q(uram_data_int_r[2]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[30] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[30]_i_1_n_0 ),
        .Q(uram_data_int_r[30]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[31] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[31]_i_1_n_0 ),
        .Q(uram_data_int_r[31]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[32] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[32]_i_1_n_0 ),
        .Q(uram_data_int_r[32]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[33] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[33]_i_1_n_0 ),
        .Q(uram_data_int_r[33]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[34] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[34]_i_1_n_0 ),
        .Q(uram_data_int_r[34]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[35] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[35]_i_1_n_0 ),
        .Q(uram_data_int_r[35]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[36] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[36]_i_1_n_0 ),
        .Q(uram_data_int_r[36]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[37] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[37]_i_1_n_0 ),
        .Q(uram_data_int_r[37]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[38] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[38]_i_1_n_0 ),
        .Q(uram_data_int_r[38]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[39] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[39]_i_1_n_0 ),
        .Q(uram_data_int_r[39]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[3] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[3]_i_1_n_0 ),
        .Q(uram_data_int_r[3]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[40] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[40]_i_1_n_0 ),
        .Q(uram_data_int_r[40]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[41] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[41]_i_1_n_0 ),
        .Q(uram_data_int_r[41]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[42] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[42]_i_1_n_0 ),
        .Q(uram_data_int_r[42]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[43] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[43]_i_1_n_0 ),
        .Q(uram_data_int_r[43]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[44] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[44]_i_1_n_0 ),
        .Q(uram_data_int_r[44]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[45] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[45]_i_1_n_0 ),
        .Q(uram_data_int_r[45]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[46] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[46]_i_1_n_0 ),
        .Q(uram_data_int_r[46]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[47] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[47]_i_1_n_0 ),
        .Q(uram_data_int_r[47]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[48] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[48]_i_1_n_0 ),
        .Q(uram_data_int_r[48]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[49] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[49]_i_1_n_0 ),
        .Q(uram_data_int_r[49]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[4] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[4]_i_1_n_0 ),
        .Q(uram_data_int_r[4]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[50] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[50]_i_1_n_0 ),
        .Q(uram_data_int_r[50]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[51] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[51]_i_1_n_0 ),
        .Q(uram_data_int_r[51]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[52] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[52]_i_1_n_0 ),
        .Q(uram_data_int_r[52]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[53] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[53]_i_1_n_0 ),
        .Q(uram_data_int_r[53]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[54] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[54]_i_1_n_0 ),
        .Q(uram_data_int_r[54]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[55] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[55]_i_1_n_0 ),
        .Q(uram_data_int_r[55]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[56] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[56]_i_1_n_0 ),
        .Q(uram_data_int_r[56]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[57] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[57]_i_1_n_0 ),
        .Q(uram_data_int_r[57]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[58] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[58]_i_1_n_0 ),
        .Q(uram_data_int_r[58]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[59] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[59]_i_1_n_0 ),
        .Q(uram_data_int_r[59]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[5] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[5]_i_1_n_0 ),
        .Q(uram_data_int_r[5]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[60] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[60]_i_1_n_0 ),
        .Q(uram_data_int_r[60]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[61] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[61]_i_1_n_0 ),
        .Q(uram_data_int_r[61]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[62] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[62]_i_1_n_0 ),
        .Q(uram_data_int_r[62]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[63] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[63]_i_1_n_0 ),
        .Q(uram_data_int_r[63]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[64] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[64]_i_1_n_0 ),
        .Q(uram_data_int_r[64]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[65] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[65]_i_1_n_0 ),
        .Q(uram_data_int_r[65]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[66] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[66]_i_1_n_0 ),
        .Q(uram_data_int_r[66]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[67] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[67]_i_1_n_0 ),
        .Q(uram_data_int_r[67]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[68] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[68]_i_1_n_0 ),
        .Q(uram_data_int_r[68]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[69] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[69]_i_1_n_0 ),
        .Q(uram_data_int_r[69]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[6] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[6]_i_1_n_0 ),
        .Q(uram_data_int_r[6]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[70] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[70]_i_1_n_0 ),
        .Q(uram_data_int_r[70]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[71] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[71]_i_1_n_0 ),
        .Q(uram_data_int_r[71]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[7] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[7]_i_1_n_0 ),
        .Q(uram_data_int_r[7]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[8] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[8]_i_1_n_0 ),
        .Q(uram_data_int_r[8]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \uram_data_int_r_reg[9] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\uram_data_int_r[9]_i_1_n_0 ),
        .Q(uram_data_int_r[9]),
        .R(RST_CFG2));
  LUT3 #(
    .INIT(8'hBA)) 
    \wr_batch_addr_incr[0]_i_1 
       (.I0(RST_CFG2),
        .I1(write_config_data_2_0),
        .I2(\FSM_onehot_curr_state_reg_n_0_[0] ),
        .O(\wr_batch_addr_incr[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \wr_batch_addr_incr[0]_i_2 
       (.I0(\write_data_cnt_reg_n_0_[1] ),
        .I1(\write_data_cnt_reg_n_0_[0] ),
        .O(write_config_data_2_0));
  LUT1 #(
    .INIT(2'h1)) 
    \wr_batch_addr_incr[0]_i_4 
       (.I0(wr_batch_addr_incr_reg[0]),
        .O(\wr_batch_addr_incr[0]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_batch_addr_incr_reg[0] 
       (.C(CCLK),
        .CE(write_config_data_2_0),
        .D(\wr_batch_addr_incr_reg[0]_i_3_n_7 ),
        .Q(wr_batch_addr_incr_reg[0]),
        .R(\wr_batch_addr_incr[0]_i_1_n_0 ));
  CARRY4 \wr_batch_addr_incr_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\wr_batch_addr_incr_reg[0]_i_3_n_0 ,\wr_batch_addr_incr_reg[0]_i_3_n_1 ,\wr_batch_addr_incr_reg[0]_i_3_n_2 ,\wr_batch_addr_incr_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\wr_batch_addr_incr_reg[0]_i_3_n_4 ,\wr_batch_addr_incr_reg[0]_i_3_n_5 ,\wr_batch_addr_incr_reg[0]_i_3_n_6 ,\wr_batch_addr_incr_reg[0]_i_3_n_7 }),
        .S({wr_batch_addr_incr_reg[3:1],\wr_batch_addr_incr[0]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \wr_batch_addr_incr_reg[10] 
       (.C(CCLK),
        .CE(write_config_data_2_0),
        .D(\wr_batch_addr_incr_reg[8]_i_1_n_5 ),
        .Q(wr_batch_addr_incr_reg[10]),
        .R(\wr_batch_addr_incr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_batch_addr_incr_reg[11] 
       (.C(CCLK),
        .CE(write_config_data_2_0),
        .D(\wr_batch_addr_incr_reg[8]_i_1_n_4 ),
        .Q(wr_batch_addr_incr_reg[11]),
        .R(\wr_batch_addr_incr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_batch_addr_incr_reg[1] 
       (.C(CCLK),
        .CE(write_config_data_2_0),
        .D(\wr_batch_addr_incr_reg[0]_i_3_n_6 ),
        .Q(wr_batch_addr_incr_reg[1]),
        .R(\wr_batch_addr_incr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_batch_addr_incr_reg[2] 
       (.C(CCLK),
        .CE(write_config_data_2_0),
        .D(\wr_batch_addr_incr_reg[0]_i_3_n_5 ),
        .Q(wr_batch_addr_incr_reg[2]),
        .R(\wr_batch_addr_incr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_batch_addr_incr_reg[3] 
       (.C(CCLK),
        .CE(write_config_data_2_0),
        .D(\wr_batch_addr_incr_reg[0]_i_3_n_4 ),
        .Q(wr_batch_addr_incr_reg[3]),
        .R(\wr_batch_addr_incr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_batch_addr_incr_reg[4] 
       (.C(CCLK),
        .CE(write_config_data_2_0),
        .D(\wr_batch_addr_incr_reg[4]_i_1_n_7 ),
        .Q(wr_batch_addr_incr_reg[4]),
        .R(\wr_batch_addr_incr[0]_i_1_n_0 ));
  CARRY4 \wr_batch_addr_incr_reg[4]_i_1 
       (.CI(\wr_batch_addr_incr_reg[0]_i_3_n_0 ),
        .CO({\wr_batch_addr_incr_reg[4]_i_1_n_0 ,\wr_batch_addr_incr_reg[4]_i_1_n_1 ,\wr_batch_addr_incr_reg[4]_i_1_n_2 ,\wr_batch_addr_incr_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\wr_batch_addr_incr_reg[4]_i_1_n_4 ,\wr_batch_addr_incr_reg[4]_i_1_n_5 ,\wr_batch_addr_incr_reg[4]_i_1_n_6 ,\wr_batch_addr_incr_reg[4]_i_1_n_7 }),
        .S(wr_batch_addr_incr_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \wr_batch_addr_incr_reg[5] 
       (.C(CCLK),
        .CE(write_config_data_2_0),
        .D(\wr_batch_addr_incr_reg[4]_i_1_n_6 ),
        .Q(wr_batch_addr_incr_reg[5]),
        .R(\wr_batch_addr_incr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_batch_addr_incr_reg[6] 
       (.C(CCLK),
        .CE(write_config_data_2_0),
        .D(\wr_batch_addr_incr_reg[4]_i_1_n_5 ),
        .Q(wr_batch_addr_incr_reg[6]),
        .R(\wr_batch_addr_incr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_batch_addr_incr_reg[7] 
       (.C(CCLK),
        .CE(write_config_data_2_0),
        .D(\wr_batch_addr_incr_reg[4]_i_1_n_4 ),
        .Q(wr_batch_addr_incr_reg[7]),
        .R(\wr_batch_addr_incr[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_batch_addr_incr_reg[8] 
       (.C(CCLK),
        .CE(write_config_data_2_0),
        .D(\wr_batch_addr_incr_reg[8]_i_1_n_7 ),
        .Q(wr_batch_addr_incr_reg[8]),
        .R(\wr_batch_addr_incr[0]_i_1_n_0 ));
  CARRY4 \wr_batch_addr_incr_reg[8]_i_1 
       (.CI(\wr_batch_addr_incr_reg[4]_i_1_n_0 ),
        .CO({\NLW_wr_batch_addr_incr_reg[8]_i_1_CO_UNCONNECTED [3],\wr_batch_addr_incr_reg[8]_i_1_n_1 ,\wr_batch_addr_incr_reg[8]_i_1_n_2 ,\wr_batch_addr_incr_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\wr_batch_addr_incr_reg[8]_i_1_n_4 ,\wr_batch_addr_incr_reg[8]_i_1_n_5 ,\wr_batch_addr_incr_reg[8]_i_1_n_6 ,\wr_batch_addr_incr_reg[8]_i_1_n_7 }),
        .S(wr_batch_addr_incr_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \wr_batch_addr_incr_reg[9] 
       (.C(CCLK),
        .CE(write_config_data_2_0),
        .D(\wr_batch_addr_incr_reg[8]_i_1_n_6 ),
        .Q(wr_batch_addr_incr_reg[9]),
        .R(\wr_batch_addr_incr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[0]_i_1 
       (.I0(DI[0]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[10]_i_1 
       (.I0(DI[10]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[11]_i_1 
       (.I0(DI[11]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[12]_i_1 
       (.I0(DI[12]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[13]_i_1 
       (.I0(DI[13]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[14]_i_1 
       (.I0(DI[14]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[15]_i_1 
       (.I0(DI[15]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[16]_i_1 
       (.I0(DI[16]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[17]_i_1 
       (.I0(DI[17]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[18]_i_1 
       (.I0(DI[18]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[19]_i_1 
       (.I0(DI[19]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[1]_i_1 
       (.I0(DI[1]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[20]_i_1 
       (.I0(DI[20]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[21]_i_1 
       (.I0(DI[21]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[22]_i_1 
       (.I0(DI[22]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[23]_i_1 
       (.I0(DI[23]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[24]_i_1 
       (.I0(DI[24]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[25]_i_1 
       (.I0(DI[25]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[26]_i_1 
       (.I0(DI[26]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[27]_i_1 
       (.I0(DI[27]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[28]_i_1 
       (.I0(DI[28]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAABAA)) 
    \write_config_data_0[29]_i_1 
       (.I0(write_config_data_2_0),
        .I1(\write_data_cnt_reg_n_0_[0] ),
        .I2(DI[31]),
        .I3(VLD),
        .I4(DI[30]),
        .I5(\write_data_cnt_reg_n_0_[1] ),
        .O(\write_config_data_0[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[29]_i_2 
       (.I0(DI[29]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF0FFFFFFFEFF)) 
    \write_config_data_0[29]_i_3 
       (.I0(\write_data_cnt_reg_n_0_[0] ),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(DI[30]),
        .I3(VLD),
        .I4(DI[31]),
        .I5(p_0_in2_in),
        .O(\write_config_data_0[29]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[2]_i_1 
       (.I0(DI[2]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[3]_i_1 
       (.I0(DI[3]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[4]_i_1 
       (.I0(DI[4]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[5]_i_1 
       (.I0(DI[5]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[6]_i_1 
       (.I0(DI[6]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[7]_i_1 
       (.I0(DI[7]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[8]_i_1 
       (.I0(DI[8]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \write_config_data_0[9]_i_1 
       (.I0(DI[9]),
        .I1(\write_config_data_0[29]_i_3_n_0 ),
        .O(\write_config_data_0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[0] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[0]_i_1_n_0 ),
        .Q(write_config_data_0[0]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[10] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[10]_i_1_n_0 ),
        .Q(write_config_data_0[10]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[11] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[11]_i_1_n_0 ),
        .Q(write_config_data_0[11]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[12] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[12]_i_1_n_0 ),
        .Q(write_config_data_0[12]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[13] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[13]_i_1_n_0 ),
        .Q(write_config_data_0[13]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[14] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[14]_i_1_n_0 ),
        .Q(write_config_data_0[14]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[15] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[15]_i_1_n_0 ),
        .Q(write_config_data_0[15]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[16] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[16]_i_1_n_0 ),
        .Q(write_config_data_0[16]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[17] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[17]_i_1_n_0 ),
        .Q(write_config_data_0[17]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[18] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[18]_i_1_n_0 ),
        .Q(write_config_data_0[18]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[19] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[19]_i_1_n_0 ),
        .Q(write_config_data_0[19]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[1] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[1]_i_1_n_0 ),
        .Q(write_config_data_0[1]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[20] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[20]_i_1_n_0 ),
        .Q(write_config_data_0[20]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[21] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[21]_i_1_n_0 ),
        .Q(write_config_data_0[21]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[22] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[22]_i_1_n_0 ),
        .Q(write_config_data_0[22]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[23] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[23]_i_1_n_0 ),
        .Q(write_config_data_0[23]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[24] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[24]_i_1_n_0 ),
        .Q(write_config_data_0[24]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[25] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[25]_i_1_n_0 ),
        .Q(write_config_data_0[25]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[26] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[26]_i_1_n_0 ),
        .Q(write_config_data_0[26]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[27] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[27]_i_1_n_0 ),
        .Q(write_config_data_0[27]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[28] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[28]_i_1_n_0 ),
        .Q(write_config_data_0[28]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[29] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[29]_i_2_n_0 ),
        .Q(write_config_data_0[29]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[2] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[2]_i_1_n_0 ),
        .Q(write_config_data_0[2]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[3] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[3]_i_1_n_0 ),
        .Q(write_config_data_0[3]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[4] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[4]_i_1_n_0 ),
        .Q(write_config_data_0[4]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[5] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[5]_i_1_n_0 ),
        .Q(write_config_data_0[5]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[6] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[6]_i_1_n_0 ),
        .Q(write_config_data_0[6]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[7] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[7]_i_1_n_0 ),
        .Q(write_config_data_0[7]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[8] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[8]_i_1_n_0 ),
        .Q(write_config_data_0[8]),
        .R(RST_CFG2));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_0_reg[9] 
       (.C(CCLK),
        .CE(\write_config_data_0[29]_i_1_n_0 ),
        .D(\write_config_data_0[9]_i_1_n_0 ),
        .Q(write_config_data_0[9]),
        .R(RST_CFG2));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[0]_i_1 
       (.I0(DI[0]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[0]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[10]_i_1 
       (.I0(DI[10]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[10]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[11]_i_1 
       (.I0(DI[11]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[11]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[12]_i_1 
       (.I0(DI[12]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[12]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[13]_i_1 
       (.I0(DI[13]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[13]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[14]_i_1 
       (.I0(DI[14]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[14]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[15]_i_1 
       (.I0(DI[15]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[15]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[16]_i_1 
       (.I0(DI[16]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[16]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[17]_i_1 
       (.I0(DI[17]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[17]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[18]_i_1 
       (.I0(DI[18]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[18]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[19]_i_1 
       (.I0(DI[19]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[19]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[1]_i_1 
       (.I0(DI[1]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[1]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[20]_i_1 
       (.I0(DI[20]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[20]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[21]_i_1 
       (.I0(DI[21]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[21]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[22]_i_1 
       (.I0(DI[22]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[22]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[23]_i_1 
       (.I0(DI[23]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[23]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[24]_i_1 
       (.I0(DI[24]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[24]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[25]_i_1 
       (.I0(DI[25]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[25]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[26]_i_1 
       (.I0(DI[26]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[26]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[27]_i_1 
       (.I0(DI[27]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[27]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[28]_i_1 
       (.I0(DI[28]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[28]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAABAA)) 
    \write_config_data_1[29]_i_1 
       (.I0(RST_CFG2),
        .I1(\write_data_cnt_reg_n_0_[0] ),
        .I2(DI[31]),
        .I3(VLD),
        .I4(DI[30]),
        .I5(\write_data_cnt_reg_n_0_[1] ),
        .O(\write_config_data_1[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAABAAAAA)) 
    \write_config_data_1[29]_i_2 
       (.I0(write_config_data_2_0),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(\write_config_data_1[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[29]_i_3 
       (.I0(DI[29]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[29]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[2]_i_1 
       (.I0(DI[2]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[2]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[3]_i_1 
       (.I0(DI[3]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[3]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[4]_i_1 
       (.I0(DI[4]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[4]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[5]_i_1 
       (.I0(DI[5]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[5]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[6]_i_1 
       (.I0(DI[6]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[6]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[7]_i_1 
       (.I0(DI[7]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[7]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[8]_i_1 
       (.I0(DI[8]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[8]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \write_config_data_1[9]_i_1 
       (.I0(DI[9]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[30]),
        .I4(VLD),
        .I5(DI[31]),
        .O(p_2_in[9]));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[0] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[0]),
        .Q(write_config_data_1[0]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[10] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[10]),
        .Q(write_config_data_1[10]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[11] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[11]),
        .Q(write_config_data_1[11]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[12] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[12]),
        .Q(write_config_data_1[12]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[13] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[13]),
        .Q(write_config_data_1[13]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[14] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[14]),
        .Q(write_config_data_1[14]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[15] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[15]),
        .Q(write_config_data_1[15]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[16] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[16]),
        .Q(write_config_data_1[16]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[17] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[17]),
        .Q(write_config_data_1[17]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[18] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[18]),
        .Q(write_config_data_1[18]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[19] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[19]),
        .Q(write_config_data_1[19]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[1] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[1]),
        .Q(write_config_data_1[1]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[20] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[20]),
        .Q(write_config_data_1[20]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[21] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[21]),
        .Q(write_config_data_1[21]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[22] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[22]),
        .Q(write_config_data_1[22]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[23] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[23]),
        .Q(write_config_data_1[23]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[24] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[24]),
        .Q(write_config_data_1[24]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[25] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[25]),
        .Q(write_config_data_1[25]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[26] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[26]),
        .Q(write_config_data_1[26]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[27] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[27]),
        .Q(write_config_data_1[27]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[28] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[28]),
        .Q(write_config_data_1[28]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[29] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[29]),
        .Q(write_config_data_1[29]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[2] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[2]),
        .Q(write_config_data_1[2]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[3] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[3]),
        .Q(write_config_data_1[3]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[4] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[4]),
        .Q(write_config_data_1[4]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[5] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[5]),
        .Q(write_config_data_1[5]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[6] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[6]),
        .Q(write_config_data_1[6]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[7] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[7]),
        .Q(write_config_data_1[7]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[8] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[8]),
        .Q(write_config_data_1[8]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_1_reg[9] 
       (.C(CCLK),
        .CE(\write_config_data_1[29]_i_2_n_0 ),
        .D(p_2_in[9]),
        .Q(write_config_data_1[9]),
        .R(\write_config_data_1[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \write_config_data_2[0]_i_1 
       (.I0(DI[0]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[31]),
        .I4(VLD),
        .I5(DI[30]),
        .O(\write_config_data_2[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \write_config_data_2[10]_i_1 
       (.I0(DI[10]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[31]),
        .I4(VLD),
        .I5(DI[30]),
        .O(\write_config_data_2[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAABAA)) 
    \write_config_data_2[11]_i_1 
       (.I0(RST_CFG2),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(DI[30]),
        .I3(VLD),
        .I4(DI[31]),
        .O(\write_config_data_2[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAEAAAA)) 
    \write_config_data_2[11]_i_2 
       (.I0(write_config_data_2_0),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[31]),
        .I4(VLD),
        .I5(DI[30]),
        .O(\write_config_data_2[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \write_config_data_2[11]_i_3 
       (.I0(DI[11]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[31]),
        .I4(VLD),
        .I5(DI[30]),
        .O(\write_config_data_2[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \write_config_data_2[1]_i_1 
       (.I0(DI[1]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[31]),
        .I4(VLD),
        .I5(DI[30]),
        .O(\write_config_data_2[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \write_config_data_2[2]_i_1 
       (.I0(DI[2]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[31]),
        .I4(VLD),
        .I5(DI[30]),
        .O(\write_config_data_2[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \write_config_data_2[3]_i_1 
       (.I0(DI[3]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[31]),
        .I4(VLD),
        .I5(DI[30]),
        .O(\write_config_data_2[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \write_config_data_2[4]_i_1 
       (.I0(DI[4]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[31]),
        .I4(VLD),
        .I5(DI[30]),
        .O(\write_config_data_2[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \write_config_data_2[5]_i_1 
       (.I0(DI[5]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[31]),
        .I4(VLD),
        .I5(DI[30]),
        .O(\write_config_data_2[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \write_config_data_2[6]_i_1 
       (.I0(DI[6]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[31]),
        .I4(VLD),
        .I5(DI[30]),
        .O(\write_config_data_2[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \write_config_data_2[7]_i_1 
       (.I0(DI[7]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[31]),
        .I4(VLD),
        .I5(DI[30]),
        .O(\write_config_data_2[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \write_config_data_2[8]_i_1 
       (.I0(DI[8]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[31]),
        .I4(VLD),
        .I5(DI[30]),
        .O(\write_config_data_2[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \write_config_data_2[9]_i_1 
       (.I0(DI[9]),
        .I1(\write_data_cnt_reg_n_0_[1] ),
        .I2(\write_data_cnt_reg_n_0_[0] ),
        .I3(DI[31]),
        .I4(VLD),
        .I5(DI[30]),
        .O(\write_config_data_2[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_2_reg[0] 
       (.C(CCLK),
        .CE(\write_config_data_2[11]_i_2_n_0 ),
        .D(\write_config_data_2[0]_i_1_n_0 ),
        .Q(write_config_data_2[0]),
        .R(\write_config_data_2[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_2_reg[10] 
       (.C(CCLK),
        .CE(\write_config_data_2[11]_i_2_n_0 ),
        .D(\write_config_data_2[10]_i_1_n_0 ),
        .Q(write_config_data_2[10]),
        .R(\write_config_data_2[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_2_reg[11] 
       (.C(CCLK),
        .CE(\write_config_data_2[11]_i_2_n_0 ),
        .D(\write_config_data_2[11]_i_3_n_0 ),
        .Q(write_config_data_2[11]),
        .R(\write_config_data_2[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_2_reg[1] 
       (.C(CCLK),
        .CE(\write_config_data_2[11]_i_2_n_0 ),
        .D(\write_config_data_2[1]_i_1_n_0 ),
        .Q(write_config_data_2[1]),
        .R(\write_config_data_2[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_2_reg[2] 
       (.C(CCLK),
        .CE(\write_config_data_2[11]_i_2_n_0 ),
        .D(\write_config_data_2[2]_i_1_n_0 ),
        .Q(write_config_data_2[2]),
        .R(\write_config_data_2[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_2_reg[3] 
       (.C(CCLK),
        .CE(\write_config_data_2[11]_i_2_n_0 ),
        .D(\write_config_data_2[3]_i_1_n_0 ),
        .Q(write_config_data_2[3]),
        .R(\write_config_data_2[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_2_reg[4] 
       (.C(CCLK),
        .CE(\write_config_data_2[11]_i_2_n_0 ),
        .D(\write_config_data_2[4]_i_1_n_0 ),
        .Q(write_config_data_2[4]),
        .R(\write_config_data_2[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_2_reg[5] 
       (.C(CCLK),
        .CE(\write_config_data_2[11]_i_2_n_0 ),
        .D(\write_config_data_2[5]_i_1_n_0 ),
        .Q(write_config_data_2[5]),
        .R(\write_config_data_2[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_2_reg[6] 
       (.C(CCLK),
        .CE(\write_config_data_2[11]_i_2_n_0 ),
        .D(\write_config_data_2[6]_i_1_n_0 ),
        .Q(write_config_data_2[6]),
        .R(\write_config_data_2[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_2_reg[7] 
       (.C(CCLK),
        .CE(\write_config_data_2[11]_i_2_n_0 ),
        .D(\write_config_data_2[7]_i_1_n_0 ),
        .Q(write_config_data_2[7]),
        .R(\write_config_data_2[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_2_reg[8] 
       (.C(CCLK),
        .CE(\write_config_data_2[11]_i_2_n_0 ),
        .D(\write_config_data_2[8]_i_1_n_0 ),
        .Q(write_config_data_2[8]),
        .R(\write_config_data_2[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_config_data_2_reg[9] 
       (.C(CCLK),
        .CE(\write_config_data_2[11]_i_2_n_0 ),
        .D(\write_config_data_2[9]_i_1_n_0 ),
        .Q(write_config_data_2[9]),
        .R(\write_config_data_2[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000008F800000F0F)) 
    \write_data_cnt[0]_i_1 
       (.I0(\write_data_cnt_reg_n_0_[1] ),
        .I1(p_0_in2_in),
        .I2(\write_data_cnt[1]_i_2_n_0 ),
        .I3(write_config_data_2_0),
        .I4(RST_CFG2),
        .I5(\write_data_cnt_reg_n_0_[0] ),
        .O(\write_data_cnt[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h000F0002)) 
    \write_data_cnt[1]_i_1 
       (.I0(\write_data_cnt_reg_n_0_[0] ),
        .I1(\write_data_cnt[1]_i_2_n_0 ),
        .I2(write_config_data_2_0),
        .I3(RST_CFG2),
        .I4(\write_data_cnt_reg_n_0_[1] ),
        .O(\write_data_cnt[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFB)) 
    \write_data_cnt[1]_i_2 
       (.I0(DI[30]),
        .I1(VLD),
        .I2(DI[31]),
        .O(\write_data_cnt[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \write_data_cnt_reg[0] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\write_data_cnt[0]_i_1_n_0 ),
        .Q(\write_data_cnt_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \write_data_cnt_reg[1] 
       (.C(CCLK),
        .CE(1'b1),
        .D(\write_data_cnt[1]_i_1_n_0 ),
        .Q(\write_data_cnt_reg_n_0_[1] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h08)) 
    write_data_end_reg_i_1
       (.I0(DI[30]),
        .I1(VLD),
        .I2(DI[31]),
        .O(write_data_end));
  FDRE #(
    .INIT(1'b0)) 
    write_data_end_reg_reg
       (.C(CCLK),
        .CE(1'b1),
        .D(write_data_end),
        .Q(write_data_end_reg),
        .R(RST_CFG2));
endmodule
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
