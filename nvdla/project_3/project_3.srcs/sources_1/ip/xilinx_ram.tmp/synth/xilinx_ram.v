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


// IP VLNV: xilinx.com:ip:uram_rd_back:1.0
// IP Revision: 0

(* X_CORE_INFO = "uram_rd_back_v1_0_0,Vivado 2019.2.1" *)
(* CHECK_LICENSE_TYPE = "xilinx_ram,uram_rd_back_v1_0_0,{}" *)
(* CORE_GENERATION_INFO = "xilinx_ram,uram_rd_back_v1_0_0,{x_ipProduct=Vivado 2019.2.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=uram_rd_back,x_ipVersion=1.0,x_ipCoreRevision=0,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,AUTO_SLEEP_LATENCY=8,AVG_CONS_INACTIVE_CYCLES=10,BWE_MODE_A=PARITY_INTERLEAVED,BWE_MODE_B=PARITY_INTERLEAVED,CASCADE_ORDER_A=NONE,CASCADE_ORDER_B=NONE,EN_AUTO_SLEEP_MODE=FALSE,EN_ECC_RD_A=FALSE,EN_ECC_RD_B=FALSE,EN_ECC_WR_A=FALSE,EN_ECC_WR_B=FALSE,IREG_PRE_A=FALSE,IREG_PRE_B=FALSE,IS_CLK_INVERTED=0,IS_\
EN_A_INVERTED=0,IS_EN_B_INVERTED=0,IS_RDB_WR_A_INVERTED=0,IS_RDB_WR_B_INVERTED=0,IS_RST_A_INVERTED=0,IS_RST_B_INVERTED=0,MATRIX_ID=NONE,NUM_UNIQUE_SELF_ADDR_A=1,NUM_UNIQUE_SELF_ADDR_B=1,NUM_URAM_IN_MATRIX=1,OREG_A=FALSE,OREG_B=FALSE,OREG_ECC_A=FALSE,OREG_ECC_B=FALSE,REG_CAS_A=FALSE,REG_CAS_B=FALSE,RST_MODE_A=SYNC,RST_MODE_B=SYNC,SELF_ADDR_A=0,SELF_ADDR_B=0,SELF_MASK_A=2047,SELF_MASK_B=2047,USE_EXT_CE_A=FALSE,USE_EXT_CE_B=FALSE}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module xilinx_ram (
  CAS_OUT_ADDR_A,
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
  VLD
);

output wire [22 : 0] CAS_OUT_ADDR_A;
output wire [22 : 0] CAS_OUT_ADDR_B;
output wire [8 : 0] CAS_OUT_BWE_A;
output wire [8 : 0] CAS_OUT_BWE_B;
output wire CAS_OUT_DBITERR_A;
output wire CAS_OUT_DBITERR_B;
output wire [71 : 0] CAS_OUT_DIN_A;
output wire [71 : 0] CAS_OUT_DIN_B;
output wire [71 : 0] CAS_OUT_DOUT_A;
output wire [71 : 0] CAS_OUT_DOUT_B;
output wire CAS_OUT_EN_A;
output wire CAS_OUT_EN_B;
output wire CAS_OUT_RDACCESS_A;
output wire CAS_OUT_RDACCESS_B;
output wire CAS_OUT_RDB_WR_A;
output wire CAS_OUT_RDB_WR_B;
output wire CAS_OUT_SBITERR_A;
output wire CAS_OUT_SBITERR_B;
output wire DBITERR_A;
output wire DBITERR_B;
output wire [71 : 0] DOUT_A;
output wire [71 : 0] DOUT_B;
output wire RDACCESS_A;
output wire RDACCESS_B;
output wire SBITERR_A;
output wire SBITERR_B;
input wire [22 : 0] ADDR_A;
input wire [22 : 0] ADDR_B;
input wire [8 : 0] BWE_A;
input wire [8 : 0] BWE_B;
input wire [22 : 0] CAS_IN_ADDR_A;
input wire [22 : 0] CAS_IN_ADDR_B;
input wire [8 : 0] CAS_IN_BWE_A;
input wire [8 : 0] CAS_IN_BWE_B;
input wire CAS_IN_DBITERR_A;
input wire CAS_IN_DBITERR_B;
input wire [71 : 0] CAS_IN_DIN_A;
input wire [71 : 0] CAS_IN_DIN_B;
input wire [71 : 0] CAS_IN_DOUT_A;
input wire [71 : 0] CAS_IN_DOUT_B;
input wire CAS_IN_EN_A;
input wire CAS_IN_EN_B;
input wire CAS_IN_RDACCESS_A;
input wire CAS_IN_RDACCESS_B;
input wire CAS_IN_RDB_WR_A;
input wire CAS_IN_RDB_WR_B;
input wire CAS_IN_SBITERR_A;
input wire CAS_IN_SBITERR_B;
input wire CLK;
input wire [71 : 0] DIN_A;
input wire [71 : 0] DIN_B;
input wire EN_A;
input wire EN_B;
input wire INJECT_DBITERR_A;
input wire INJECT_DBITERR_B;
input wire INJECT_SBITERR_A;
input wire INJECT_SBITERR_B;
input wire OREG_CE_A;
input wire OREG_CE_B;
input wire OREG_ECC_CE_A;
input wire OREG_ECC_CE_B;
input wire RDB_WR_A;
input wire RDB_WR_B;
input wire RST_A;
input wire RST_B;
input wire SLEEP;
input wire [31 : 0] DI;
input wire CCLK;
input wire VLD;

  uram_rd_back_v1_0_0 #(
    .AUTO_SLEEP_LATENCY(8),
    .AVG_CONS_INACTIVE_CYCLES(10),
    .BWE_MODE_A("PARITY_INTERLEAVED"),
    .BWE_MODE_B("PARITY_INTERLEAVED"),
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .EN_AUTO_SLEEP_MODE("FALSE"),
    .EN_ECC_RD_A("FALSE"),
    .EN_ECC_RD_B("FALSE"),
    .EN_ECC_WR_A("FALSE"),
    .EN_ECC_WR_B("FALSE"),
    .IREG_PRE_A("FALSE"),
    .IREG_PRE_B("FALSE"),
    .IS_CLK_INVERTED(0),
    .IS_EN_A_INVERTED(0),
    .IS_EN_B_INVERTED(0),
    .IS_RDB_WR_A_INVERTED(0),
    .IS_RDB_WR_B_INVERTED(0),
    .IS_RST_A_INVERTED(0),
    .IS_RST_B_INVERTED(0),
    .MATRIX_ID("NONE"),
    .NUM_UNIQUE_SELF_ADDR_A(1),
    .NUM_UNIQUE_SELF_ADDR_B(1),
    .NUM_URAM_IN_MATRIX(1),
    .OREG_A("FALSE"),
    .OREG_B("FALSE"),
    .OREG_ECC_A("FALSE"),
    .OREG_ECC_B("FALSE"),
    .REG_CAS_A("FALSE"),
    .REG_CAS_B("FALSE"),
    .RST_MODE_A("SYNC"),
    .RST_MODE_B("SYNC"),
    .SELF_ADDR_A(0),
    .SELF_ADDR_B(0),
    .SELF_MASK_A(2047),
    .SELF_MASK_B(2047),
    .USE_EXT_CE_A("FALSE"),
    .USE_EXT_CE_B("FALSE")
  ) inst (
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
    .DBITERR_A(DBITERR_A),
    .DBITERR_B(DBITERR_B),
    .DOUT_A(DOUT_A),
    .DOUT_B(DOUT_B),
    .RDACCESS_A(RDACCESS_A),
    .RDACCESS_B(RDACCESS_B),
    .SBITERR_A(SBITERR_A),
    .SBITERR_B(SBITERR_B),
    .ADDR_A(ADDR_A),
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
    .CLK(CLK),
    .DIN_A(DIN_A),
    .DIN_B(DIN_B),
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
    .RDB_WR_A(RDB_WR_A),
    .RDB_WR_B(RDB_WR_B),
    .RST_A(RST_A),
    .RST_B(RST_B),
    .SLEEP(SLEEP),
    .DI(DI),
    .CCLK(CCLK),
    .VLD(VLD)
  );
endmodule
