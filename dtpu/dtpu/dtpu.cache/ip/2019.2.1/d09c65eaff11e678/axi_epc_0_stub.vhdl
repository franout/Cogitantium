-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
-- Date        : Sat Mar  7 15:13:57 2020
-- Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ axi_epc_0_stub.vhdl
-- Design      : axi_epc_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    prh_clk : in STD_LOGIC;
    prh_rst : in STD_LOGIC;
    prh_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    prh_addr : out STD_LOGIC_VECTOR ( 0 to 31 );
    prh_ads : out STD_LOGIC;
    prh_be : out STD_LOGIC_VECTOR ( 0 to 3 );
    prh_rnw : out STD_LOGIC;
    prh_rd_n : out STD_LOGIC;
    prh_wr_n : out STD_LOGIC;
    prh_burst : out STD_LOGIC;
    prh_rdy : in STD_LOGIC_VECTOR ( 0 to 0 );
    prh_data_i : in STD_LOGIC_VECTOR ( 0 to 31 );
    prh_data_o : out STD_LOGIC_VECTOR ( 0 to 31 );
    prh_data_t : out STD_LOGIC_VECTOR ( 0 to 31 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_aclk,s_axi_aresetn,s_axi_awaddr[31:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[31:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,prh_clk,prh_rst,prh_cs_n[0:0],prh_addr[0:31],prh_ads,prh_be[0:3],prh_rnw,prh_rd_n,prh_wr_n,prh_burst,prh_rdy[0:0],prh_data_i[0:31],prh_data_o[0:31],prh_data_t[0:31]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "axi_epc,Vivado 2019.2.1";
begin
end;
