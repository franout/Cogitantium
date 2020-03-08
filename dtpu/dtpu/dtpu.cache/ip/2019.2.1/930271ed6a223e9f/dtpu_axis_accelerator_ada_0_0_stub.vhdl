-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
-- Date        : Sun Mar  8 19:31:02 2020
-- Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dtpu_axis_accelerator_ada_0_0_stub.vhdl
-- Design      : dtpu_axis_accelerator_ada_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 12 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC;
    s_axis_0_tvalid : in STD_LOGIC;
    s_axis_0_tready : out STD_LOGIC;
    s_axis_0_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_0_tlast : in STD_LOGIC;
    s_axis_0_tid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_0_tdest : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_0_tuser : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_1_tvalid : in STD_LOGIC;
    s_axis_1_tready : out STD_LOGIC;
    s_axis_1_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_1_tlast : in STD_LOGIC;
    s_axis_1_tid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_1_tdest : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_1_tuser : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_2_tvalid : in STD_LOGIC;
    s_axis_2_tready : out STD_LOGIC;
    s_axis_2_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_2_tlast : in STD_LOGIC;
    s_axis_2_tid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_2_tdest : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_2_tuser : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ap_iarg_0_clk : in STD_LOGIC;
    ap_iarg_0_rst : in STD_LOGIC;
    ap_iarg_0_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_iarg_0_ce : in STD_LOGIC;
    ap_iarg_0_we : in STD_LOGIC_VECTOR ( 0 to 0 );
    ap_iarg_0_din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ap_iarg_0_dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ap_iarg_1_clk : in STD_LOGIC;
    ap_iarg_1_rst : in STD_LOGIC;
    ap_iarg_1_addr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_iarg_1_ce : in STD_LOGIC;
    ap_iarg_1_we : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ap_iarg_1_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    ap_iarg_1_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    ap_fifo_iarg_2_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    ap_fifo_iarg_2_read : in STD_LOGIC;
    ap_fifo_iarg_2_empty_n : out STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_aresetn : in STD_LOGIC;
    m_axis_0_tvalid : out STD_LOGIC;
    m_axis_0_tready : in STD_LOGIC;
    m_axis_0_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_0_tlast : out STD_LOGIC;
    m_axis_0_tid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_0_tdest : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_0_tuser : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ap_fifo_oarg_0_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    ap_fifo_oarg_0_write : in STD_LOGIC;
    ap_fifo_oarg_0_full_n : out STD_LOGIC;
    aclk : in STD_LOGIC;
    aresetn : out STD_LOGIC;
    ap_start : out STD_LOGIC;
    ap_ready : in STD_LOGIC;
    ap_done : in STD_LOGIC;
    ap_continue : out STD_LOGIC;
    ap_idle : in STD_LOGIC;
    interrupt : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_aclk,s_axi_aresetn,s_axi_awaddr[12:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[12:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,s_axis_aclk,s_axis_aresetn,s_axis_0_tvalid,s_axis_0_tready,s_axis_0_tdata[63:0],s_axis_0_tlast,s_axis_0_tid[3:0],s_axis_0_tdest[3:0],s_axis_0_tuser[7:0],s_axis_1_tvalid,s_axis_1_tready,s_axis_1_tdata[63:0],s_axis_1_tlast,s_axis_1_tid[3:0],s_axis_1_tdest[3:0],s_axis_1_tuser[7:0],s_axis_2_tvalid,s_axis_2_tready,s_axis_2_tdata[63:0],s_axis_2_tlast,s_axis_2_tid[3:0],s_axis_2_tdest[3:0],s_axis_2_tuser[7:0],ap_iarg_0_clk,ap_iarg_0_rst,ap_iarg_0_addr[31:0],ap_iarg_0_ce,ap_iarg_0_we[0:0],ap_iarg_0_din[7:0],ap_iarg_0_dout[7:0],ap_iarg_1_clk,ap_iarg_1_rst,ap_iarg_1_addr[31:0],ap_iarg_1_ce,ap_iarg_1_we[7:0],ap_iarg_1_din[63:0],ap_iarg_1_dout[63:0],ap_fifo_iarg_2_dout[63:0],ap_fifo_iarg_2_read,ap_fifo_iarg_2_empty_n,m_axis_aclk,m_axis_aresetn,m_axis_0_tvalid,m_axis_0_tready,m_axis_0_tdata[63:0],m_axis_0_tlast,m_axis_0_tid[3:0],m_axis_0_tdest[3:0],m_axis_0_tuser[7:0],ap_fifo_oarg_0_din[63:0],ap_fifo_oarg_0_write,ap_fifo_oarg_0_full_n,aclk,aresetn,ap_start,ap_ready,ap_done,ap_continue,ap_idle,interrupt";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "axis_accelerator_adapter,Vivado 2019.2.1";
begin
end;
