-- (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:uram_rd_back:1.0
-- IP Revision: 0

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT xilinx_ram
  PORT (
    CAS_OUT_ADDR_A : OUT STD_LOGIC_VECTOR(22 DOWNTO 0);
    CAS_OUT_ADDR_B : OUT STD_LOGIC_VECTOR(22 DOWNTO 0);
    CAS_OUT_BWE_A : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    CAS_OUT_BWE_B : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    CAS_OUT_DBITERR_A : OUT STD_LOGIC;
    CAS_OUT_DBITERR_B : OUT STD_LOGIC;
    CAS_OUT_DIN_A : OUT STD_LOGIC_VECTOR(71 DOWNTO 0);
    CAS_OUT_DIN_B : OUT STD_LOGIC_VECTOR(71 DOWNTO 0);
    CAS_OUT_DOUT_A : OUT STD_LOGIC_VECTOR(71 DOWNTO 0);
    CAS_OUT_DOUT_B : OUT STD_LOGIC_VECTOR(71 DOWNTO 0);
    CAS_OUT_EN_A : OUT STD_LOGIC;
    CAS_OUT_EN_B : OUT STD_LOGIC;
    CAS_OUT_RDACCESS_A : OUT STD_LOGIC;
    CAS_OUT_RDACCESS_B : OUT STD_LOGIC;
    CAS_OUT_RDB_WR_A : OUT STD_LOGIC;
    CAS_OUT_RDB_WR_B : OUT STD_LOGIC;
    CAS_OUT_SBITERR_A : OUT STD_LOGIC;
    CAS_OUT_SBITERR_B : OUT STD_LOGIC;
    DBITERR_A : OUT STD_LOGIC;
    DBITERR_B : OUT STD_LOGIC;
    DOUT_A : OUT STD_LOGIC_VECTOR(71 DOWNTO 0);
    DOUT_B : OUT STD_LOGIC_VECTOR(71 DOWNTO 0);
    RDACCESS_A : OUT STD_LOGIC;
    RDACCESS_B : OUT STD_LOGIC;
    SBITERR_A : OUT STD_LOGIC;
    SBITERR_B : OUT STD_LOGIC;
    ADDR_A : IN STD_LOGIC_VECTOR(22 DOWNTO 0);
    ADDR_B : IN STD_LOGIC_VECTOR(22 DOWNTO 0);
    BWE_A : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    BWE_B : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    CAS_IN_ADDR_A : IN STD_LOGIC_VECTOR(22 DOWNTO 0);
    CAS_IN_ADDR_B : IN STD_LOGIC_VECTOR(22 DOWNTO 0);
    CAS_IN_BWE_A : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    CAS_IN_BWE_B : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    CAS_IN_DBITERR_A : IN STD_LOGIC;
    CAS_IN_DBITERR_B : IN STD_LOGIC;
    CAS_IN_DIN_A : IN STD_LOGIC_VECTOR(71 DOWNTO 0);
    CAS_IN_DIN_B : IN STD_LOGIC_VECTOR(71 DOWNTO 0);
    CAS_IN_DOUT_A : IN STD_LOGIC_VECTOR(71 DOWNTO 0);
    CAS_IN_DOUT_B : IN STD_LOGIC_VECTOR(71 DOWNTO 0);
    CAS_IN_EN_A : IN STD_LOGIC;
    CAS_IN_EN_B : IN STD_LOGIC;
    CAS_IN_RDACCESS_A : IN STD_LOGIC;
    CAS_IN_RDACCESS_B : IN STD_LOGIC;
    CAS_IN_RDB_WR_A : IN STD_LOGIC;
    CAS_IN_RDB_WR_B : IN STD_LOGIC;
    CAS_IN_SBITERR_A : IN STD_LOGIC;
    CAS_IN_SBITERR_B : IN STD_LOGIC;
    CLK : IN STD_LOGIC;
    DIN_A : IN STD_LOGIC_VECTOR(71 DOWNTO 0);
    DIN_B : IN STD_LOGIC_VECTOR(71 DOWNTO 0);
    EN_A : IN STD_LOGIC;
    EN_B : IN STD_LOGIC;
    INJECT_DBITERR_A : IN STD_LOGIC;
    INJECT_DBITERR_B : IN STD_LOGIC;
    INJECT_SBITERR_A : IN STD_LOGIC;
    INJECT_SBITERR_B : IN STD_LOGIC;
    OREG_CE_A : IN STD_LOGIC;
    OREG_CE_B : IN STD_LOGIC;
    OREG_ECC_CE_A : IN STD_LOGIC;
    OREG_ECC_CE_B : IN STD_LOGIC;
    RDB_WR_A : IN STD_LOGIC;
    RDB_WR_B : IN STD_LOGIC;
    RST_A : IN STD_LOGIC;
    RST_B : IN STD_LOGIC;
    SLEEP : IN STD_LOGIC;
    DI : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    CCLK : IN STD_LOGIC;
    VLD : IN STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : xilinx_ram
  PORT MAP (
    CAS_OUT_ADDR_A => CAS_OUT_ADDR_A,
    CAS_OUT_ADDR_B => CAS_OUT_ADDR_B,
    CAS_OUT_BWE_A => CAS_OUT_BWE_A,
    CAS_OUT_BWE_B => CAS_OUT_BWE_B,
    CAS_OUT_DBITERR_A => CAS_OUT_DBITERR_A,
    CAS_OUT_DBITERR_B => CAS_OUT_DBITERR_B,
    CAS_OUT_DIN_A => CAS_OUT_DIN_A,
    CAS_OUT_DIN_B => CAS_OUT_DIN_B,
    CAS_OUT_DOUT_A => CAS_OUT_DOUT_A,
    CAS_OUT_DOUT_B => CAS_OUT_DOUT_B,
    CAS_OUT_EN_A => CAS_OUT_EN_A,
    CAS_OUT_EN_B => CAS_OUT_EN_B,
    CAS_OUT_RDACCESS_A => CAS_OUT_RDACCESS_A,
    CAS_OUT_RDACCESS_B => CAS_OUT_RDACCESS_B,
    CAS_OUT_RDB_WR_A => CAS_OUT_RDB_WR_A,
    CAS_OUT_RDB_WR_B => CAS_OUT_RDB_WR_B,
    CAS_OUT_SBITERR_A => CAS_OUT_SBITERR_A,
    CAS_OUT_SBITERR_B => CAS_OUT_SBITERR_B,
    DBITERR_A => DBITERR_A,
    DBITERR_B => DBITERR_B,
    DOUT_A => DOUT_A,
    DOUT_B => DOUT_B,
    RDACCESS_A => RDACCESS_A,
    RDACCESS_B => RDACCESS_B,
    SBITERR_A => SBITERR_A,
    SBITERR_B => SBITERR_B,
    ADDR_A => ADDR_A,
    ADDR_B => ADDR_B,
    BWE_A => BWE_A,
    BWE_B => BWE_B,
    CAS_IN_ADDR_A => CAS_IN_ADDR_A,
    CAS_IN_ADDR_B => CAS_IN_ADDR_B,
    CAS_IN_BWE_A => CAS_IN_BWE_A,
    CAS_IN_BWE_B => CAS_IN_BWE_B,
    CAS_IN_DBITERR_A => CAS_IN_DBITERR_A,
    CAS_IN_DBITERR_B => CAS_IN_DBITERR_B,
    CAS_IN_DIN_A => CAS_IN_DIN_A,
    CAS_IN_DIN_B => CAS_IN_DIN_B,
    CAS_IN_DOUT_A => CAS_IN_DOUT_A,
    CAS_IN_DOUT_B => CAS_IN_DOUT_B,
    CAS_IN_EN_A => CAS_IN_EN_A,
    CAS_IN_EN_B => CAS_IN_EN_B,
    CAS_IN_RDACCESS_A => CAS_IN_RDACCESS_A,
    CAS_IN_RDACCESS_B => CAS_IN_RDACCESS_B,
    CAS_IN_RDB_WR_A => CAS_IN_RDB_WR_A,
    CAS_IN_RDB_WR_B => CAS_IN_RDB_WR_B,
    CAS_IN_SBITERR_A => CAS_IN_SBITERR_A,
    CAS_IN_SBITERR_B => CAS_IN_SBITERR_B,
    CLK => CLK,
    DIN_A => DIN_A,
    DIN_B => DIN_B,
    EN_A => EN_A,
    EN_B => EN_B,
    INJECT_DBITERR_A => INJECT_DBITERR_A,
    INJECT_DBITERR_B => INJECT_DBITERR_B,
    INJECT_SBITERR_A => INJECT_SBITERR_A,
    INJECT_SBITERR_B => INJECT_SBITERR_B,
    OREG_CE_A => OREG_CE_A,
    OREG_CE_B => OREG_CE_B,
    OREG_ECC_CE_A => OREG_ECC_CE_A,
    OREG_ECC_CE_B => OREG_ECC_CE_B,
    RDB_WR_A => RDB_WR_A,
    RDB_WR_B => RDB_WR_B,
    RST_A => RST_A,
    RST_B => RST_B,
    SLEEP => SLEEP,
    DI => DI,
    CCLK => CCLK,
    VLD => VLD
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file xilinx_ram.vhd when simulating
-- the core, xilinx_ram. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.

