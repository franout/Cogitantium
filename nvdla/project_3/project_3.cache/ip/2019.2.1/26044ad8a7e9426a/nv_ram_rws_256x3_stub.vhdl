-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
-- Date        : Sat Feb  1 17:53:20 2020
-- Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ nv_ram_rws_256x3_stub.vhdl
-- Design      : nv_ram_rws_256x3
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    CAS_OUT_ADDR_A : out STD_LOGIC_VECTOR ( 22 downto 0 );
    CAS_OUT_ADDR_B : out STD_LOGIC_VECTOR ( 22 downto 0 );
    CAS_OUT_BWE_A : out STD_LOGIC_VECTOR ( 8 downto 0 );
    CAS_OUT_BWE_B : out STD_LOGIC_VECTOR ( 8 downto 0 );
    CAS_OUT_DBITERR_A : out STD_LOGIC;
    CAS_OUT_DBITERR_B : out STD_LOGIC;
    CAS_OUT_DIN_A : out STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_OUT_DIN_B : out STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_OUT_DOUT_A : out STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_OUT_DOUT_B : out STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_OUT_EN_A : out STD_LOGIC;
    CAS_OUT_EN_B : out STD_LOGIC;
    CAS_OUT_RDACCESS_A : out STD_LOGIC;
    CAS_OUT_RDACCESS_B : out STD_LOGIC;
    CAS_OUT_RDB_WR_A : out STD_LOGIC;
    CAS_OUT_RDB_WR_B : out STD_LOGIC;
    CAS_OUT_SBITERR_A : out STD_LOGIC;
    CAS_OUT_SBITERR_B : out STD_LOGIC;
    DBITERR_A : out STD_LOGIC;
    DBITERR_B : out STD_LOGIC;
    DOUT_A : out STD_LOGIC_VECTOR ( 71 downto 0 );
    DOUT_B : out STD_LOGIC_VECTOR ( 71 downto 0 );
    RDACCESS_A : out STD_LOGIC;
    RDACCESS_B : out STD_LOGIC;
    SBITERR_A : out STD_LOGIC;
    SBITERR_B : out STD_LOGIC;
    ADDR_A : in STD_LOGIC_VECTOR ( 22 downto 0 );
    ADDR_B : in STD_LOGIC_VECTOR ( 22 downto 0 );
    BWE_A : in STD_LOGIC_VECTOR ( 8 downto 0 );
    BWE_B : in STD_LOGIC_VECTOR ( 8 downto 0 );
    CAS_IN_ADDR_A : in STD_LOGIC_VECTOR ( 22 downto 0 );
    CAS_IN_ADDR_B : in STD_LOGIC_VECTOR ( 22 downto 0 );
    CAS_IN_BWE_A : in STD_LOGIC_VECTOR ( 8 downto 0 );
    CAS_IN_BWE_B : in STD_LOGIC_VECTOR ( 8 downto 0 );
    CAS_IN_DBITERR_A : in STD_LOGIC;
    CAS_IN_DBITERR_B : in STD_LOGIC;
    CAS_IN_DIN_A : in STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_IN_DIN_B : in STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_IN_DOUT_A : in STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_IN_DOUT_B : in STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_IN_EN_A : in STD_LOGIC;
    CAS_IN_EN_B : in STD_LOGIC;
    CAS_IN_RDACCESS_A : in STD_LOGIC;
    CAS_IN_RDACCESS_B : in STD_LOGIC;
    CAS_IN_RDB_WR_A : in STD_LOGIC;
    CAS_IN_RDB_WR_B : in STD_LOGIC;
    CAS_IN_SBITERR_A : in STD_LOGIC;
    CAS_IN_SBITERR_B : in STD_LOGIC;
    CLK : in STD_LOGIC;
    DIN_A : in STD_LOGIC_VECTOR ( 71 downto 0 );
    DIN_B : in STD_LOGIC_VECTOR ( 71 downto 0 );
    EN_A : in STD_LOGIC;
    EN_B : in STD_LOGIC;
    INJECT_DBITERR_A : in STD_LOGIC;
    INJECT_DBITERR_B : in STD_LOGIC;
    INJECT_SBITERR_A : in STD_LOGIC;
    INJECT_SBITERR_B : in STD_LOGIC;
    OREG_CE_A : in STD_LOGIC;
    OREG_CE_B : in STD_LOGIC;
    OREG_ECC_CE_A : in STD_LOGIC;
    OREG_ECC_CE_B : in STD_LOGIC;
    RDB_WR_A : in STD_LOGIC;
    RDB_WR_B : in STD_LOGIC;
    RST_A : in STD_LOGIC;
    RST_B : in STD_LOGIC;
    SLEEP : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CCLK : in STD_LOGIC;
    VLD : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CAS_OUT_ADDR_A[22:0],CAS_OUT_ADDR_B[22:0],CAS_OUT_BWE_A[8:0],CAS_OUT_BWE_B[8:0],CAS_OUT_DBITERR_A,CAS_OUT_DBITERR_B,CAS_OUT_DIN_A[71:0],CAS_OUT_DIN_B[71:0],CAS_OUT_DOUT_A[71:0],CAS_OUT_DOUT_B[71:0],CAS_OUT_EN_A,CAS_OUT_EN_B,CAS_OUT_RDACCESS_A,CAS_OUT_RDACCESS_B,CAS_OUT_RDB_WR_A,CAS_OUT_RDB_WR_B,CAS_OUT_SBITERR_A,CAS_OUT_SBITERR_B,DBITERR_A,DBITERR_B,DOUT_A[71:0],DOUT_B[71:0],RDACCESS_A,RDACCESS_B,SBITERR_A,SBITERR_B,ADDR_A[22:0],ADDR_B[22:0],BWE_A[8:0],BWE_B[8:0],CAS_IN_ADDR_A[22:0],CAS_IN_ADDR_B[22:0],CAS_IN_BWE_A[8:0],CAS_IN_BWE_B[8:0],CAS_IN_DBITERR_A,CAS_IN_DBITERR_B,CAS_IN_DIN_A[71:0],CAS_IN_DIN_B[71:0],CAS_IN_DOUT_A[71:0],CAS_IN_DOUT_B[71:0],CAS_IN_EN_A,CAS_IN_EN_B,CAS_IN_RDACCESS_A,CAS_IN_RDACCESS_B,CAS_IN_RDB_WR_A,CAS_IN_RDB_WR_B,CAS_IN_SBITERR_A,CAS_IN_SBITERR_B,CLK,DIN_A[71:0],DIN_B[71:0],EN_A,EN_B,INJECT_DBITERR_A,INJECT_DBITERR_B,INJECT_SBITERR_A,INJECT_SBITERR_B,OREG_CE_A,OREG_CE_B,OREG_ECC_CE_A,OREG_ECC_CE_B,RDB_WR_A,RDB_WR_B,RST_A,RST_B,SLEEP,DI[31:0],CCLK,VLD";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "uram_rd_back_v1_0_0,Vivado 2019.2.1";
begin
end;
