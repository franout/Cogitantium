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

-- IP VLNV: xilinx.com:ip:axi_epc:2.0
-- IP Revision: 23

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY axi_epc_v2_0_23;
USE axi_epc_v2_0_23.axi_epc;

ENTITY axi_epc_0 IS
  PORT (
    s_axi_aclk : IN STD_LOGIC;
    s_axi_aresetn : IN STD_LOGIC;
    s_axi_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_awvalid : IN STD_LOGIC;
    s_axi_awready : OUT STD_LOGIC;
    s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_wvalid : IN STD_LOGIC;
    s_axi_wready : OUT STD_LOGIC;
    s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_bvalid : OUT STD_LOGIC;
    s_axi_bready : IN STD_LOGIC;
    s_axi_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_arvalid : IN STD_LOGIC;
    s_axi_arready : OUT STD_LOGIC;
    s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_rvalid : OUT STD_LOGIC;
    s_axi_rready : IN STD_LOGIC;
    prh_clk : IN STD_LOGIC;
    prh_rst : IN STD_LOGIC;
    prh_cs_n : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    prh_addr : OUT STD_LOGIC_VECTOR(0 TO 31);
    prh_ads : OUT STD_LOGIC;
    prh_be : OUT STD_LOGIC_VECTOR(0 TO 3);
    prh_rnw : OUT STD_LOGIC;
    prh_rd_n : OUT STD_LOGIC;
    prh_wr_n : OUT STD_LOGIC;
    prh_burst : OUT STD_LOGIC;
    prh_rdy : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    prh_data_i : IN STD_LOGIC_VECTOR(0 TO 31);
    prh_data_o : OUT STD_LOGIC_VECTOR(0 TO 31);
    prh_data_t : OUT STD_LOGIC_VECTOR(0 TO 31)
  );
END axi_epc_0;

ARCHITECTURE axi_epc_0_arch OF axi_epc_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF axi_epc_0_arch: ARCHITECTURE IS "yes";
  COMPONENT axi_epc IS
    GENERIC (
      C_S_AXI_CLK_PERIOD_PS : INTEGER;
      C_PRH_CLK_PERIOD_PS : INTEGER;
      C_FAMILY : STRING;
      C_INSTANCE : STRING;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_NUM_PERIPHERALS : INTEGER;
      C_PRH_MAX_AWIDTH : INTEGER;
      C_PRH_MAX_DWIDTH : INTEGER;
      C_PRH_MAX_ADWIDTH : INTEGER;
      C_PRH_CLK_SUPPORT : INTEGER;
      C_PRH0_BASEADDR : STD_LOGIC_VECTOR;
      C_PRH0_HIGHADDR : STD_LOGIC_VECTOR;
      C_PRH0_FIFO_ACCESS : INTEGER;
      C_PRH0_FIFO_OFFSET : INTEGER;
      C_PRH0_AWIDTH : INTEGER;
      C_PRH0_DWIDTH : INTEGER;
      C_PRH0_DWIDTH_MATCH : INTEGER;
      C_PRH0_SYNC : INTEGER;
      C_PRH0_BUS_MULTIPLEX : INTEGER;
      C_PRH0_ADDR_TSU : INTEGER;
      C_PRH0_ADDR_TH : INTEGER;
      C_PRH0_ADS_WIDTH : INTEGER;
      C_PRH0_CSN_TSU : INTEGER;
      C_PRH0_CSN_TH : INTEGER;
      C_PRH0_WRN_WIDTH : INTEGER;
      C_PRH0_WR_CYCLE : INTEGER;
      C_PRH0_DATA_TSU : INTEGER;
      C_PRH0_DATA_TH : INTEGER;
      C_PRH0_RDN_WIDTH : INTEGER;
      C_PRH0_RD_CYCLE : INTEGER;
      C_PRH0_DATA_TOUT : INTEGER;
      C_PRH0_DATA_TINV : INTEGER;
      C_PRH0_RDY_TOUT : INTEGER;
      C_PRH0_RDY_WIDTH : INTEGER;
      C_PRH1_BASEADDR : STD_LOGIC_VECTOR;
      C_PRH1_HIGHADDR : STD_LOGIC_VECTOR;
      C_PRH1_FIFO_ACCESS : INTEGER;
      C_PRH1_FIFO_OFFSET : INTEGER;
      C_PRH1_AWIDTH : INTEGER;
      C_PRH1_DWIDTH : INTEGER;
      C_PRH1_DWIDTH_MATCH : INTEGER;
      C_PRH1_SYNC : INTEGER;
      C_PRH1_BUS_MULTIPLEX : INTEGER;
      C_PRH1_ADDR_TSU : INTEGER;
      C_PRH1_ADDR_TH : INTEGER;
      C_PRH1_ADS_WIDTH : INTEGER;
      C_PRH1_CSN_TSU : INTEGER;
      C_PRH1_CSN_TH : INTEGER;
      C_PRH1_WRN_WIDTH : INTEGER;
      C_PRH1_WR_CYCLE : INTEGER;
      C_PRH1_DATA_TSU : INTEGER;
      C_PRH1_DATA_TH : INTEGER;
      C_PRH1_RDN_WIDTH : INTEGER;
      C_PRH1_RD_CYCLE : INTEGER;
      C_PRH1_DATA_TOUT : INTEGER;
      C_PRH1_DATA_TINV : INTEGER;
      C_PRH1_RDY_TOUT : INTEGER;
      C_PRH1_RDY_WIDTH : INTEGER;
      C_PRH2_BASEADDR : STD_LOGIC_VECTOR;
      C_PRH2_HIGHADDR : STD_LOGIC_VECTOR;
      C_PRH2_FIFO_ACCESS : INTEGER;
      C_PRH2_FIFO_OFFSET : INTEGER;
      C_PRH2_AWIDTH : INTEGER;
      C_PRH2_DWIDTH : INTEGER;
      C_PRH2_DWIDTH_MATCH : INTEGER;
      C_PRH2_SYNC : INTEGER;
      C_PRH2_BUS_MULTIPLEX : INTEGER;
      C_PRH2_ADDR_TSU : INTEGER;
      C_PRH2_ADDR_TH : INTEGER;
      C_PRH2_ADS_WIDTH : INTEGER;
      C_PRH2_CSN_TSU : INTEGER;
      C_PRH2_CSN_TH : INTEGER;
      C_PRH2_WRN_WIDTH : INTEGER;
      C_PRH2_WR_CYCLE : INTEGER;
      C_PRH2_DATA_TSU : INTEGER;
      C_PRH2_DATA_TH : INTEGER;
      C_PRH2_RDN_WIDTH : INTEGER;
      C_PRH2_RD_CYCLE : INTEGER;
      C_PRH2_DATA_TOUT : INTEGER;
      C_PRH2_DATA_TINV : INTEGER;
      C_PRH2_RDY_TOUT : INTEGER;
      C_PRH2_RDY_WIDTH : INTEGER;
      C_PRH3_BASEADDR : STD_LOGIC_VECTOR;
      C_PRH3_HIGHADDR : STD_LOGIC_VECTOR;
      C_PRH3_FIFO_ACCESS : INTEGER;
      C_PRH3_FIFO_OFFSET : INTEGER;
      C_PRH3_AWIDTH : INTEGER;
      C_PRH3_DWIDTH : INTEGER;
      C_PRH3_DWIDTH_MATCH : INTEGER;
      C_PRH3_SYNC : INTEGER;
      C_PRH3_BUS_MULTIPLEX : INTEGER;
      C_PRH3_ADDR_TSU : INTEGER;
      C_PRH3_ADDR_TH : INTEGER;
      C_PRH3_ADS_WIDTH : INTEGER;
      C_PRH3_CSN_TSU : INTEGER;
      C_PRH3_CSN_TH : INTEGER;
      C_PRH3_WRN_WIDTH : INTEGER;
      C_PRH3_WR_CYCLE : INTEGER;
      C_PRH3_DATA_TSU : INTEGER;
      C_PRH3_DATA_TH : INTEGER;
      C_PRH3_RDN_WIDTH : INTEGER;
      C_PRH3_RD_CYCLE : INTEGER;
      C_PRH3_DATA_TOUT : INTEGER;
      C_PRH3_DATA_TINV : INTEGER;
      C_PRH3_RDY_TOUT : INTEGER;
      C_PRH3_RDY_WIDTH : INTEGER
    );
    PORT (
      s_axi_aclk : IN STD_LOGIC;
      s_axi_aresetn : IN STD_LOGIC;
      s_axi_awaddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_awvalid : IN STD_LOGIC;
      s_axi_awready : OUT STD_LOGIC;
      s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_wvalid : IN STD_LOGIC;
      s_axi_wready : OUT STD_LOGIC;
      s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_bvalid : OUT STD_LOGIC;
      s_axi_bready : IN STD_LOGIC;
      s_axi_araddr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_arvalid : IN STD_LOGIC;
      s_axi_arready : OUT STD_LOGIC;
      s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_rvalid : OUT STD_LOGIC;
      s_axi_rready : IN STD_LOGIC;
      prh_clk : IN STD_LOGIC;
      prh_rst : IN STD_LOGIC;
      prh_cs_n : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      prh_addr : OUT STD_LOGIC_VECTOR(0 TO 31);
      prh_ads : OUT STD_LOGIC;
      prh_be : OUT STD_LOGIC_VECTOR(0 TO 3);
      prh_rnw : OUT STD_LOGIC;
      prh_rd_n : OUT STD_LOGIC;
      prh_wr_n : OUT STD_LOGIC;
      prh_burst : OUT STD_LOGIC;
      prh_rdy : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      prh_data_i : IN STD_LOGIC_VECTOR(0 TO 31);
      prh_data_o : OUT STD_LOGIC_VECTOR(0 TO 31);
      prh_data_t : OUT STD_LOGIC_VECTOR(0 TO 31)
    );
  END COMPONENT axi_epc;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF prh_data_t: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF DATA_T";
  ATTRIBUTE X_INTERFACE_INFO OF prh_data_o: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF DATA_O";
  ATTRIBUTE X_INTERFACE_INFO OF prh_data_i: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF DATA_I";
  ATTRIBUTE X_INTERFACE_INFO OF prh_rdy: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF RDY";
  ATTRIBUTE X_INTERFACE_INFO OF prh_burst: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF BURST";
  ATTRIBUTE X_INTERFACE_INFO OF prh_wr_n: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF WR_N";
  ATTRIBUTE X_INTERFACE_INFO OF prh_rd_n: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF RD_N";
  ATTRIBUTE X_INTERFACE_INFO OF prh_rnw: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF RNW";
  ATTRIBUTE X_INTERFACE_INFO OF prh_be: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF BE";
  ATTRIBUTE X_INTERFACE_INFO OF prh_ads: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF ADS";
  ATTRIBUTE X_INTERFACE_INFO OF prh_addr: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF ADDR";
  ATTRIBUTE X_INTERFACE_INFO OF prh_cs_n: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF CS_N";
  ATTRIBUTE X_INTERFACE_INFO OF prh_rst: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF RST";
  ATTRIBUTE X_INTERFACE_INFO OF prh_clk: SIGNAL IS "xilinx.com:interface:epc:1.0 EPC_INTF CLK";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_awaddr: SIGNAL IS "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER" & 
"_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_aresetn: SIGNAL IS "XIL_INTERFACENAME S_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 S_AXI_RST RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_aclk: SIGNAL IS "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK";
BEGIN
  U0 : axi_epc
    GENERIC MAP (
      C_S_AXI_CLK_PERIOD_PS => 10000,
      C_PRH_CLK_PERIOD_PS => 20000,
      C_FAMILY => "zynq",
      C_INSTANCE => "axi_epc_inst",
      C_S_AXI_ADDR_WIDTH => 32,
      C_S_AXI_DATA_WIDTH => 32,
      C_NUM_PERIPHERALS => 1,
      C_PRH_MAX_AWIDTH => 32,
      C_PRH_MAX_DWIDTH => 32,
      C_PRH_MAX_ADWIDTH => 32,
      C_PRH_CLK_SUPPORT => 0,
      C_PRH0_BASEADDR => X"A000FFFF",
      C_PRH0_HIGHADDR => X"AFFFFFFF",
      C_PRH0_FIFO_ACCESS => 0,
      C_PRH0_FIFO_OFFSET => 0,
      C_PRH0_AWIDTH => 32,
      C_PRH0_DWIDTH => 32,
      C_PRH0_DWIDTH_MATCH => 0,
      C_PRH0_SYNC => 0,
      C_PRH0_BUS_MULTIPLEX => 0,
      C_PRH0_ADDR_TSU => 0,
      C_PRH0_ADDR_TH => 0,
      C_PRH0_ADS_WIDTH => 0,
      C_PRH0_CSN_TSU => 0,
      C_PRH0_CSN_TH => 0,
      C_PRH0_WRN_WIDTH => 0,
      C_PRH0_WR_CYCLE => 0,
      C_PRH0_DATA_TSU => 0,
      C_PRH0_DATA_TH => 0,
      C_PRH0_RDN_WIDTH => 0,
      C_PRH0_RD_CYCLE => 0,
      C_PRH0_DATA_TOUT => 0,
      C_PRH0_DATA_TINV => 0,
      C_PRH0_RDY_TOUT => 0,
      C_PRH0_RDY_WIDTH => 0,
      C_PRH1_BASEADDR => X"B000FFFF",
      C_PRH1_HIGHADDR => X"BFFFFFFF",
      C_PRH1_FIFO_ACCESS => 0,
      C_PRH1_FIFO_OFFSET => 0,
      C_PRH1_AWIDTH => 32,
      C_PRH1_DWIDTH => 32,
      C_PRH1_DWIDTH_MATCH => 0,
      C_PRH1_SYNC => 0,
      C_PRH1_BUS_MULTIPLEX => 0,
      C_PRH1_ADDR_TSU => 0,
      C_PRH1_ADDR_TH => 0,
      C_PRH1_ADS_WIDTH => 0,
      C_PRH1_CSN_TSU => 0,
      C_PRH1_CSN_TH => 0,
      C_PRH1_WRN_WIDTH => 0,
      C_PRH1_WR_CYCLE => 0,
      C_PRH1_DATA_TSU => 0,
      C_PRH1_DATA_TH => 0,
      C_PRH1_RDN_WIDTH => 0,
      C_PRH1_RD_CYCLE => 0,
      C_PRH1_DATA_TOUT => 0,
      C_PRH1_DATA_TINV => 0,
      C_PRH1_RDY_TOUT => 0,
      C_PRH1_RDY_WIDTH => 0,
      C_PRH2_BASEADDR => X"C000FFFF",
      C_PRH2_HIGHADDR => X"CFFFFFFF",
      C_PRH2_FIFO_ACCESS => 0,
      C_PRH2_FIFO_OFFSET => 0,
      C_PRH2_AWIDTH => 32,
      C_PRH2_DWIDTH => 32,
      C_PRH2_DWIDTH_MATCH => 0,
      C_PRH2_SYNC => 0,
      C_PRH2_BUS_MULTIPLEX => 0,
      C_PRH2_ADDR_TSU => 0,
      C_PRH2_ADDR_TH => 0,
      C_PRH2_ADS_WIDTH => 0,
      C_PRH2_CSN_TSU => 0,
      C_PRH2_CSN_TH => 0,
      C_PRH2_WRN_WIDTH => 0,
      C_PRH2_WR_CYCLE => 0,
      C_PRH2_DATA_TSU => 0,
      C_PRH2_DATA_TH => 0,
      C_PRH2_RDN_WIDTH => 0,
      C_PRH2_RD_CYCLE => 0,
      C_PRH2_DATA_TOUT => 0,
      C_PRH2_DATA_TINV => 0,
      C_PRH2_RDY_TOUT => 0,
      C_PRH2_RDY_WIDTH => 0,
      C_PRH3_BASEADDR => X"D000FFFF",
      C_PRH3_HIGHADDR => X"DFFFFFFF",
      C_PRH3_FIFO_ACCESS => 0,
      C_PRH3_FIFO_OFFSET => 0,
      C_PRH3_AWIDTH => 32,
      C_PRH3_DWIDTH => 32,
      C_PRH3_DWIDTH_MATCH => 0,
      C_PRH3_SYNC => 0,
      C_PRH3_BUS_MULTIPLEX => 0,
      C_PRH3_ADDR_TSU => 0,
      C_PRH3_ADDR_TH => 0,
      C_PRH3_ADS_WIDTH => 0,
      C_PRH3_CSN_TSU => 0,
      C_PRH3_CSN_TH => 0,
      C_PRH3_WRN_WIDTH => 0,
      C_PRH3_WR_CYCLE => 0,
      C_PRH3_DATA_TSU => 0,
      C_PRH3_DATA_TH => 0,
      C_PRH3_RDN_WIDTH => 0,
      C_PRH3_RD_CYCLE => 0,
      C_PRH3_DATA_TOUT => 0,
      C_PRH3_DATA_TINV => 0,
      C_PRH3_RDY_TOUT => 0,
      C_PRH3_RDY_WIDTH => 0
    )
    PORT MAP (
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_awaddr => s_axi_awaddr,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_awready => s_axi_awready,
      s_axi_wdata => s_axi_wdata,
      s_axi_wstrb => s_axi_wstrb,
      s_axi_wvalid => s_axi_wvalid,
      s_axi_wready => s_axi_wready,
      s_axi_bresp => s_axi_bresp,
      s_axi_bvalid => s_axi_bvalid,
      s_axi_bready => s_axi_bready,
      s_axi_araddr => s_axi_araddr,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_arready => s_axi_arready,
      s_axi_rdata => s_axi_rdata,
      s_axi_rresp => s_axi_rresp,
      s_axi_rvalid => s_axi_rvalid,
      s_axi_rready => s_axi_rready,
      prh_clk => prh_clk,
      prh_rst => prh_rst,
      prh_cs_n => prh_cs_n,
      prh_addr => prh_addr,
      prh_ads => prh_ads,
      prh_be => prh_be,
      prh_rnw => prh_rnw,
      prh_rd_n => prh_rd_n,
      prh_wr_n => prh_wr_n,
      prh_burst => prh_burst,
      prh_rdy => prh_rdy,
      prh_data_i => prh_data_i,
      prh_data_o => prh_data_o,
      prh_data_t => prh_data_t
    );
END axi_epc_0_arch;
