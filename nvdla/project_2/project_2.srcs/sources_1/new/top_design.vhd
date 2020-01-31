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


begin

top_reset_system: reset_system PORT MAP(slowest_sync_clk ,
    ext_reset_in ,
    aux_reset_in,
    mb_debug_sys_rst ,
    dcm_locked ,
    mb_reset ,
    bus_struct_reset ,
    peripheral_reset ,
    interconnect_aresetn ,
    peripheral_aresetn );
    
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
end structural;
