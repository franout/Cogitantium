library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_design is
--  Port ( 
--clk 
--reset
-- to/from ddram
 --);
end top_design;

architecture structural of top_design is


component reset_system IS
  PORT (
    slowest_sync_clk : IN STD_LOGIC;
    ext_reset_in : IN STD_LOGIC;
    aux_reset_in : IN STD_LOGIC;
    mb_debug_sys_rst : IN STD_LOGIC;
    dcm_locked : IN STD_LOGIC;
    mb_reset : OUT STD_LOGIC;
    bus_struct_reset : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    peripheral_reset : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    interconnect_aresetn : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    peripheral_aresetn : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END component reset_system;


COMPONENT processing_system7_0
  PORT (
    Core0_nFIQ : IN STD_LOGIC;
    FCLK_CLK0 : OUT STD_LOGIC;
    FCLK_RESET0_N : OUT STD_LOGIC;
    MIO : INOUT STD_LOGIC_VECTOR(53 DOWNTO 0);
    DDR_CAS_n : INOUT STD_LOGIC;
    DDR_CKE : INOUT STD_LOGIC;
    DDR_Clk_n : INOUT STD_LOGIC;
    DDR_Clk : INOUT STD_LOGIC;
    DDR_CS_n : INOUT STD_LOGIC;
    DDR_DRSTB : INOUT STD_LOGIC;
    DDR_ODT : INOUT STD_LOGIC;
    DDR_RAS_n : INOUT STD_LOGIC;
    DDR_WEB : INOUT STD_LOGIC;
    DDR_BankAddr : INOUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    DDR_Addr : INOUT STD_LOGIC_VECTOR(14 DOWNTO 0);
    DDR_VRN : INOUT STD_LOGIC;
    DDR_VRP : INOUT STD_LOGIC;
    DDR_DM : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DDR_DQ : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    DDR_DQS_n : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    DDR_DQS : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    PS_SRSTB : INOUT STD_LOGIC;
    PS_CLK : INOUT STD_LOGIC;
    PS_PORB : INOUT STD_LOGIC
  );
END COMPONENT processing_system7_0;

COMPONENT NV_nvdla 
  PORT ( 
   dla_core_clk: in std_logic;
  dla_csb_clk: in std_logic;
  global_clk_ovr_on: in std_logic;
  tmc2slcg_disable_clock_gating : in std_logic;
  dla_reset_rstn : in std_logic;
  direct_reset : in std_logic;
  test_mode : in std_logic;
  csb2nvdla_valid : in std_logic;
  csb2nvdla_ready: OUT std_logic;
  csb2nvdla_addr : in std_logic_VECTOR(15 downto 0);
  csb2nvdla_wdat : in std_logic_vector(31 downto 0);
  csb2nvdla_write : in std_logic;
  csb2nvdla_nposted : in std_logic;
  nvdla2csb_valid : out std_logic;
  nvdla2csb_data : in std_logic_vector(31 downto 0);
  nvdla2csb_wr_complete : out std_logic;
  nvdla_core2dbb_aw_awvalid : out std_logic;
  nvdla_core2dbb_aw_awready : in std_logic;
  nvdla_core2dbb_aw_awid : out std_logic_vector(7 downto 0);
  nvdla_core2dbb_aw_awlen : out std_logic_vector(3 downto 0);
  nvdla_core2dbb_aw_awaddr : out std_logic_vector(31 downto 0);
  nvdla_core2dbb_w_wvalid : out std_logic;
  nvdla_core2dbb_w_wready: in std_logic;
  nvdla_core2dbb_w_wdata: in std_logic_vector(63 downto 0);
  nvdla_core2dbb_w_wstrb : in std_logic_vector(7 downto 0);
  nvdla_core2dbb_w_wlast: out std_logic;
  nvdla_core2dbb_b_bvalid : in std_logic;
  nvdla_core2dbb_b_bready : out std_logic;
  nvdla_core2dbb_b_bid : in std_logic_vector(7 downto 0);
  nvdla_core2dbb_ar_arvalid : out std_logic;
  nvdla_core2dbb_ar_arready : in std_logic;
  nvdla_core2dbb_ar_arid : out std_logic_vector(7 downto 0);
  nvdla_core2dbb_ar_arlen : out std_logic_vector(3 downto 0);
  nvdla_core2dbb_ar_araddr : out std_logic_vector(31 downto 0);
  nvdla_core2dbb_r_rvalid : in std_logic;
  nvdla_core2dbb_r_rready:out std_logic;
  nvdla_core2dbb_r_rid: in std_logic_vector(7 downto 0);
  nvdla_core2dbb_r_rlast : in std_logic;
  nvdla_core2dbb_r_rdata : in std_logic_vector(63 downto 0);
  dla_intr : out std_logic;
  nvdla_pwrbus_ram_c_pd : in std_logic_vector(31 downto 0);
  nvdla_pwrbus_ram_ma_pd : in std_logic_vector(31 downto 0);
  nvdla_pwrbus_ram_mb_pd : in std_logic_vector(31 downto 0);
  nvdla_pwrbus_ram_p_pd  : in std_logic_vector(31 downto 0);
  nvdla_pwrbus_ram_o_pd  : in std_logic_vector(31 downto 0);
  nvdla_pwrbus_ram_a_pd  : in std_logic_vector(31 downto 0)
  );
END COMPONENT NV_nvdla;


-- signal internconnections 
--reset system
signal slowest_sync_clk,ext_reset_in,aux_reset_in,mb_debug_sys_rst,dcm_locked,mb_reset: std_logic;
signal bus_struct_reset,peripheral_reset,interconnect_aresetn,peripheral_aresetn : std_logic_vector(0 downto 0);

--processing system
signal Core0_nFIQ , FCLK_CLK0 , FCLK_RESET0_N, PS_SRSTB, PS_CLK,PS_PORB,
        DDR_CAS_N,DDR_CKE,DDR_Clk_n,DDR_Clk,DDR_CS_N,DDR_DRSTB ,DDR_ODT,DDR_RAS_n,DDR_WEB,DDR_VRN,DDR_VRP:std_logic;
signal  MIO : STD_LOGIC_VECTOR(53 DOWNTO 0);
signal DDR_BankAddr :  STD_LOGIC_VECTOR(2 DOWNTO 0);
signal DDR_Addr :  STD_LOGIC_VECTOR(14 DOWNTO 0);
signal DDR_DM :  STD_LOGIC_VECTOR(3 DOWNTO 0);
 signal  DDR_DQ :  STD_LOGIC_VECTOR(31 DOWNTO 0);
 signal   DDR_DQS_n :  STD_LOGIC_VECTOR(3 DOWNTO 0);
 signal DDR_DQS :  STD_LOGIC_VECTOR(3 DOWNTO 0);
     
--dla
signal    dla_core_clk, dla_csb_clk,   global_clk_ovr_on , tmc2slcg_disable_clock_gating ,  dla_reset_rstn ,
  direct_reset ,test_mode, csb2nvdla_write, nvdla2csb_valid,csb2nvdla_nposted,csb2nvdla_valid, csb2nvdla_ready,
  nvdla2csb_wr_complete ,  nvdla_core2dbb_aw_awvalid , nvdla_core2dbb_aw_awready ,  nvdla_core2dbb_w_wvalid ,nvdla_core2dbb_w_wready ,
    dla_intr,nvdla_core2dbb_r_rvalid, nvdla_core2dbb_r_rready,nvdla_core2dbb_r_rlast,
        nvdla_core2dbb_w_wlast, nvdla_core2dbb_b_bvalid ,  nvdla_core2dbb_b_bready , nvdla_core2dbb_ar_arvalid , nvdla_core2dbb_ar_arready: std_logic;
  signal csb2nvdla_addr :  std_logic_VECTOR(15 downto 0);
signal csb2nvdla_wdat, nvdla2csb_data: std_logic_vector(31 downto 0);
  signal   nvdla_core2dbb_aw_awid :  std_logic_vector(7 downto 0);
 signal  nvdla_core2dbb_aw_awlen :  std_logic_vector(3 downto 0);
   signal nvdla_core2dbb_aw_awaddr :  std_logic_vector(31 downto 0);
  signal nvdla_core2dbb_w_wdata:  std_logic_vector(63 downto 0);
 signal  nvdla_core2dbb_w_wstrb ,nvdla_core2dbb_b_bid:  std_logic_vector(7 downto 0);
  
  signal nvdla_core2dbb_ar_arid :  std_logic_vector(7 downto 0);
  signal nvdla_core2dbb_ar_arlen :  std_logic_vector(3 downto 0);
  signal  nvdla_core2dbb_ar_araddr :  std_logic_vector(31 downto 0);

  signal nvdla_core2dbb_r_rid:  std_logic_vector(7 downto 0);
  
  signal nvdla_core2dbb_r_rdata :  std_logic_vector(63 downto 0);
  
  signal nvdla_pwrbus_ram_c_pd :  std_logic_vector(31 downto 0);
  signal nvdla_pwrbus_ram_ma_pd :  std_logic_vector(31 downto 0);
  signal nvdla_pwrbus_ram_mb_pd :  std_logic_vector(31 downto 0);
  signal nvdla_pwrbus_ram_p_pd  :  std_logic_vector(31 downto 0);
  signal nvdla_pwrbus_ram_o_pd  :  std_logic_vector(31 downto 0);
  signal nvdla_pwrbus_ram_a_pd  :  std_logic_vector(31 downto 0)


begin

top_reset_system: reset_system PORT MAP(slowest_sync_clk=>slowest_sync_clk ,
    ext_reset_in=> ext_reset_in ,
    aux_reset_in=> aux_reset_in,
    mb_debug_sys_rst=> mb_debug_sys_rst ,
    dcm_locked=>dcm_locked ,
    mb_reset=>mb_reset ,
    bus_struct_reset=>bus_struct_reset ,
    peripheral_reset=> peripheral_reset ,
    interconnect_aresetn=> interconnect_aresetn ,
    peripheral_aresetn => peripheral_aresetn);
    
    cores_and_memory_controller : processing_system7_0
  PORT MAP (
    Core0_nFIQ => Core0_nFIQ,
    FCLK_CLK0 => FCLK_CLK0,
    FCLK_RESET0_N => FCLK_RESET0_N,
    MIO => MIO,
    DDR_CAS_n => DDR_CAS_n,
    DDR_CKE => DDR_CKE,
    DDR_Clk_n => DDR_Clk_n,
    DDR_Clk => DDR_Clk,
    DDR_CS_n => DDR_CS_n,
    DDR_DRSTB => DDR_DRSTB,
    DDR_ODT => DDR_ODT,
    DDR_RAS_n => DDR_RAS_n,
    DDR_WEB => DDR_WEB,
    DDR_BankAddr => DDR_BankAddr,
    DDR_Addr => DDR_Addr,
    DDR_VRN => DDR_VRN,
    DDR_VRP => DDR_VRP,
    DDR_DM => DDR_DM,
    DDR_DQ => DDR_DQ,
    DDR_DQS_n => DDR_DQS_n,
    DDR_DQS => DDR_DQS,
    PS_SRSTB => PS_SRSTB,
    PS_CLK => PS_CLK,
    PS_PORB => PS_PORB
  );
  
  dla: NV_nvdla PORT MAP(
  dla_core_clk,
  dla_csb_clk,
  global_clk_ovr_on,
  tmc2slcg_disable_clock_gating ,
  dla_reset_rstn ,
  direct_reset,
  test_mode ,
  csb2nvdla_valid ,
  csb2nvdla_ready,
  csb2nvdla_addr ,
  csb2nvdla_wdat ,
  csb2nvdla_write ,
  csb2nvdla_nposted,
  nvdla2csb_valid ,
  nvdla2csb_data ,
  nvdla2csb_wr_complete ,
  nvdla_core2dbb_aw_awvalid ,
  nvdla_core2dbb_aw_awready ,
  nvdla_core2dbb_aw_awid ,
  nvdla_core2dbb_aw_awlen ,
  nvdla_core2dbb_aw_awaddr ,
  nvdla_core2dbb_w_wvalid ,
  nvdla_core2dbb_w_wready,
  nvdla_core2dbb_w_wdata,
  nvdla_core2dbb_w_wstrb ,
  nvdla_core2dbb_w_wlast,
  nvdla_core2dbb_b_bvalid,
  nvdla_core2dbb_b_bready ,
  nvdla_core2dbb_b_bid ,
  nvdla_core2dbb_ar_arvalid ,
  nvdla_core2dbb_ar_arready ,
  nvdla_core2dbb_ar_arid ,
  nvdla_core2dbb_ar_arlen ,
  nvdla_core2dbb_ar_araddr ,
  nvdla_core2dbb_r_rvalid,
  nvdla_core2dbb_r_rready,
  nvdla_core2dbb_r_rid,
  nvdla_core2dbb_r_rlast ,
  nvdla_core2dbb_r_rdata ,
  dla_intr,
  nvdla_pwrbus_ram_c_pd,
  nvdla_pwrbus_ram_ma_pd,
  nvdla_pwrbus_ram_mb_pd ,
  nvdla_pwrbus_ram_p_pd  ,
  nvdla_pwrbus_ram_o_pd  ,
  nvdla_pwrbus_ram_a_pd 
   );
  
end structural;
