--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
--Date        : Tue Jan 28 17:03:24 2020
--Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
--Command     : generate_target base_zynq_wrapper.bd
--Design      : base_zynq_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity base_zynq_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    led_4bits_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end base_zynq_wrapper;

architecture STRUCTURE of base_zynq_wrapper is
  component base_zynq is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    led_4bits_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component base_zynq;
  component NV_nvdla 
    PORT (
 dla_core_clk: IN std_logic;
 dla_csb_clk: IN std_logic;
 global_clk_ovr_on : IN std_logic;
 tmc2slcg_disable_clock_gating : IN std_logic;
dla_reset_rstn : IN std_logic;
 direct_reset : IN std_logic;
 test_mode : IN std_logic;
 csb2nvdla_valid: IN std_logic;
 csb2nvdla_ready: OUT std_logic;
 csb2nvdla_addr: in std_logic_vector( 15 downto 0);
 csb2nvdla_wdat: in std_logic_vector(31 downto 0);
csb2nvdla_write: IN std_logic;
 csb2nvdla_nposted: IN std_logic;
  nvdla2csb_valid: OUT  std_logic;
 nvdla2csb_data: out std_logic_vector(31 DOWNTO 0);
nvdla2csb_wr_complete: OUT std_logic;
 nvdla_core2dbb_aw_awvalid: OUT std_logic;
nvdla_core2dbb_aw_awready: IN std_logic;
 nvdla_core2dbb_aw_awid: out std_logic_vector( 7 DOWNTO 0);
 nvdla_core2dbb_aw_awlen : out std_logic_vector( 3 DOWNTO 0);
 nvdla_core2dbb_aw_awaddr : out std_logic_vector( 31 DOWNTO 0);
 nvdla_core2dbb_w_wvalid : out std_logic;
 nvdla_core2dbb_w_wready: in std_logic;
 nvdla_core2dbb_w_wdata: out std_logic_vector(63 downto 0);
nvdla_core2dbb_w_wstrb: out std_logic_vector(7 downto 0);
 nvdla_core2dbb_w_wlast: out std_logic;
 nvdla_core2dbb_ar_arvalid: out std_logic;
 nvdla_core2dbb_ar_arready: in std_logic;
 nvdla_core2dbb_ar_arid: out std_logic_vector(7 downto 0);
 nvdla_core2dbb_ar_arlen: out std_logic_vector(3 downto 0);
nvdla_core2dbb_ar_araddr: out std_logic_vector(31 downto 0);
 nvdla_core2dbb_b_bvalid: in std_logic;
 nvdla_core2dbb_b_bready: out std_logic;
 nvdla_core2dbb_b_bid: out std_logic_vector(7 downto 0);
 nvdla_core2dbb_r_rvalid: in std_logic;
 nvdla_core2dbb_r_rready: out std_logic;
 nvdla_core2dbb_r_rid: in std_logic_vector(7 downto 0);
 nvdla_core2dbb_r_rlast: in std_logic;
 nvdla_core2dbb_r_rdata: in std_logic_vector( 63 downto 0);
 dla_intr: out std_logic;
 nvdla_pwrbus_ram_c_pd: in std_logic_vector(31 downto 0);
 nvdla_pwrbus_ram_ma_pd: in std_logic_vector(31 downto 0);
 nvdla_pwrbus_ram_mb_pd: in std_logic_vector(31 downto 0);
 nvdla_pwrbus_ram_p_pd: in std_logic_vector(31 downto 0);
 nvdla_pwrbus_ram_o_pd: in std_logic_vector(31 downto 0);
nvdla_pwrbus_ram_a_pd: in std_logic_vector(31 downto 0)
);
  end component NV_nvdla;
  
signal dla_core_clk:  std_logic;
 signal dla_csb_clk:  std_logic;
 signal global_clk_ovr_on :  std_logic;
 signal tmc2slcg_disable_clock_gating :  std_logic;
signal dla_reset_rstn :  std_logic;
 signal direct_reset :  std_logic;
 signal test_mode :  std_logic;
 signal csb2nvdla_valid:  std_logic;
 signal csb2nvdla_ready:  std_logic;
 signal csb2nvdla_addr: std_logic_vector( 15 downto 0);
 signal csb2nvdla_wdat:  std_logic_vector(31 downto 0);
signal csb2nvdla_write:  std_logic;
 signal csb2nvdla_nposted:  std_logic;
  signal nvdla2csb_valid:   std_logic;
 signal nvdla2csb_data:  std_logic_vector(31 DOWNTO 0);
signal nvdla2csb_wr_complete:  std_logic;
 signal nvdla_core2dbb_aw_awvalid:  std_logic;
signal nvdla_core2dbb_aw_awready:  std_logic;
 signal nvdla_core2dbb_aw_awid:  std_logic_vector( 7 DOWNTO 0);
 signal nvdla_core2dbb_aw_awlen :  std_logic_vector( 3 DOWNTO 0);
 signal nvdla_core2dbb_aw_awaddr :  std_logic_vector( 31 DOWNTO 0);
 signal nvdla_core2dbb_w_wvalid :  std_logic;
 signal nvdla_core2dbb_w_wready:  std_logic;
 signal nvdla_core2dbb_w_wdata:  std_logic_vector(63 downto 0);
signal nvdla_core2dbb_w_wstrb:  std_logic_vector(7 downto 0);
 signal nvdla_core2dbb_w_wlast:  std_logic;
 signal nvdla_core2dbb_ar_arvalid:  std_logic;
 signal nvdla_core2dbb_ar_arready:  std_logic;
 signal nvdla_core2dbb_ar_arid:  std_logic_vector(7 downto 0);
 signal nvdla_core2dbb_ar_arlen:  std_logic_vector(3 downto 0);
signal nvdla_core2dbb_ar_araddr:  std_logic_vector(31 downto 0);
 signal nvdla_core2dbb_b_bvalid:  std_logic;
 signal nvdla_core2dbb_b_bready:  std_logic;
 signal nvdla_core2dbb_b_bid:  std_logic_vector(7 downto 0);
 signal nvdla_core2dbb_r_rvalid:  std_logic;
 signal nvdla_core2dbb_r_rready:  std_logic;
 signal nvdla_core2dbb_r_rid: std_logic_vector(7 downto 0);
 signal nvdla_core2dbb_r_rlast:  std_logic;
 signal nvdla_core2dbb_r_rdata:  std_logic_vector( 63 downto 0);
 signal dla_intr:  std_logic;
 signal nvdla_pwrbus_ram_c_pd:  std_logic_vector(31 downto 0);
 signal nvdla_pwrbus_ram_ma_pd:  std_logic_vector(31 downto 0);
 signal nvdla_pwrbus_ram_mb_pd:  std_logic_vector(31 downto 0);
 signal nvdla_pwrbus_ram_p_pd:   std_logic_vector(31 downto 0);
 signal nvdla_pwrbus_ram_o_pd: std_logic_vector(31 downto 0);
signal nvdla_pwrbus_ram_a_pd:  std_logic_vector(31 downto 0);


begin
base_zynq_i: component base_zynq
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      led_4bits_tri_o(3 downto 0) => led_4bits_tri_o(3 downto 0)
    );
    
    
    -- NVIDIA deep learning accelerator NOTE BE CAREFUL WITH the names cause the module is written in verilog
-- dummy instantiation  just for checking the correctness of hierarchy!!
dla:NV_nvdla PORT MAP(dla_core_clk, dla_csb_clk,
 global_clk_ovr_on,
 tmc2slcg_disable_clock_gating ,
dla_reset_rstn ,
 direct_reset ,
 test_mode ,
 csb2nvdla_valid,
 csb2nvdla_ready,
 csb2nvdla_addr,
 csb2nvdla_wdat,
csb2nvdla_write,
 csb2nvdla_nposted,
  nvdla2csb_valid,
 nvdla2csb_data,
nvdla2csb_wr_complete,
 nvdla_core2dbb_aw_awvalid,
nvdla_core2dbb_aw_awready,
 nvdla_core2dbb_aw_awid,
 nvdla_core2dbb_aw_awlen ,
 nvdla_core2dbb_aw_awaddr ,
 nvdla_core2dbb_w_wvalid ,
 nvdla_core2dbb_w_wready,
 nvdla_core2dbb_w_wdata,
nvdla_core2dbb_w_wstrb,
 nvdla_core2dbb_w_wlast,
 nvdla_core2dbb_ar_arvalid,
 nvdla_core2dbb_ar_arready,
 nvdla_core2dbb_ar_arid,
 nvdla_core2dbb_ar_arlen,
nvdla_core2dbb_ar_araddr,
 nvdla_core2dbb_b_bvalid,
 nvdla_core2dbb_b_bready,
 nvdla_core2dbb_b_bid,
 nvdla_core2dbb_r_rvalid,
 nvdla_core2dbb_r_rready,
 nvdla_core2dbb_r_rid,
 nvdla_core2dbb_r_rlast,
 nvdla_core2dbb_r_rdata,
 dla_intr,
 nvdla_pwrbus_ram_c_pd,
 nvdla_pwrbus_ram_ma_pd,
 nvdla_pwrbus_ram_mb_pd,
 nvdla_pwrbus_ram_p_pd,
 nvdla_pwrbus_ram_o_pd,
nvdla_pwrbus_ram_a_pd);    
    
end STRUCTURE;
