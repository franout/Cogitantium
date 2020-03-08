-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
-- Date        : Sat Mar  7 15:13:57 2020
-- Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ axi_epc_0_sim_netlist.vhdl
-- Design      : axi_epc_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_access_mux is
  port (
    prh_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    prh_rd_n : out STD_LOGIC;
    prh_wr_n : out STD_LOGIC;
    prh_data_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    prh_addr : out STD_LOGIC_VECTOR ( 0 to 31 );
    prh_data_o : out STD_LOGIC_VECTOR ( 0 to 31 );
    Asynch_chip_select : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    Asynch_Rd : in STD_LOGIC;
    Asynch_Wr : in STD_LOGIC;
    async_data_oe_i0 : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\ : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_access_mux;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_access_mux is
begin
\ALL_DEV_ASYNC_GEN.PRH_CS_n_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Asynch_chip_select,
      Q => prh_cs_n(0),
      R => '0'
    );
\ALL_DEV_ASYNC_GEN.PRH_Rd_n_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Asynch_Rd,
      Q => prh_rd_n,
      R => '0'
    );
\ALL_DEV_ASYNC_GEN.PRH_Wr_n_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Asynch_Wr,
      Q => prh_wr_n,
      R => '0'
    );
\ALL_DEV_ASYNC_GEN.async_data_oe_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => async_data_oe_i0,
      Q => prh_data_t(0),
      R => '0'
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(31),
      Q => prh_data_o(0),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(21),
      Q => prh_data_o(10),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(20),
      Q => prh_data_o(11),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(19),
      Q => prh_data_o(12),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(18),
      Q => prh_data_o(13),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(17),
      Q => prh_data_o(14),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(16),
      Q => prh_data_o(15),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(15),
      Q => prh_data_o(16),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(14),
      Q => prh_data_o(17),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(13),
      Q => prh_data_o(18),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(12),
      Q => prh_data_o(19),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(30),
      Q => prh_data_o(1),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(11),
      Q => prh_data_o(20),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(10),
      Q => prh_data_o(21),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(9),
      Q => prh_data_o(22),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(8),
      Q => prh_data_o(23),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(7),
      Q => prh_data_o(24),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(6),
      Q => prh_data_o(25),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(5),
      Q => prh_data_o(26),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(4),
      Q => prh_data_o(27),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(3),
      Q => prh_data_o(28),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(2),
      Q => prh_data_o(29),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(29),
      Q => prh_data_o(2),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(1),
      Q => prh_data_o(30),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(0),
      Q => prh_data_o(31),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(28),
      Q => prh_data_o(3),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(27),
      Q => prh_data_o(4),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(26),
      Q => prh_data_o(5),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(25),
      Q => prh_data_o(6),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(24),
      Q => prh_data_o(7),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(23),
      Q => prh_data_o(8),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wdata(22),
      Q => prh_data_o(9),
      R => \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\
    );
\PRH_Addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(31),
      Q => prh_addr(0),
      R => '0'
    );
\PRH_Addr_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(21),
      Q => prh_addr(10),
      R => '0'
    );
\PRH_Addr_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(20),
      Q => prh_addr(11),
      R => '0'
    );
\PRH_Addr_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(19),
      Q => prh_addr(12),
      R => '0'
    );
\PRH_Addr_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(18),
      Q => prh_addr(13),
      R => '0'
    );
\PRH_Addr_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(17),
      Q => prh_addr(14),
      R => '0'
    );
\PRH_Addr_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(16),
      Q => prh_addr(15),
      R => '0'
    );
\PRH_Addr_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(15),
      Q => prh_addr(16),
      R => '0'
    );
\PRH_Addr_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(14),
      Q => prh_addr(17),
      R => '0'
    );
\PRH_Addr_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(13),
      Q => prh_addr(18),
      R => '0'
    );
\PRH_Addr_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(12),
      Q => prh_addr(19),
      R => '0'
    );
\PRH_Addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(30),
      Q => prh_addr(1),
      R => '0'
    );
\PRH_Addr_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(11),
      Q => prh_addr(20),
      R => '0'
    );
\PRH_Addr_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(10),
      Q => prh_addr(21),
      R => '0'
    );
\PRH_Addr_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(9),
      Q => prh_addr(22),
      R => '0'
    );
\PRH_Addr_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(8),
      Q => prh_addr(23),
      R => '0'
    );
\PRH_Addr_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(7),
      Q => prh_addr(24),
      R => '0'
    );
\PRH_Addr_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(6),
      Q => prh_addr(25),
      R => '0'
    );
\PRH_Addr_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(5),
      Q => prh_addr(26),
      R => '0'
    );
\PRH_Addr_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(4),
      Q => prh_addr(27),
      R => '0'
    );
\PRH_Addr_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(3),
      Q => prh_addr(28),
      R => '0'
    );
\PRH_Addr_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(2),
      Q => prh_addr(29),
      R => '0'
    );
\PRH_Addr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(29),
      Q => prh_addr(2),
      R => '0'
    );
\PRH_Addr_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(1),
      Q => prh_addr(30),
      R => '0'
    );
\PRH_Addr_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(0),
      Q => prh_addr(31),
      R => '0'
    );
\PRH_Addr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(28),
      Q => prh_addr(3),
      R => '0'
    );
\PRH_Addr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(27),
      Q => prh_addr(4),
      R => '0'
    );
\PRH_Addr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(26),
      Q => prh_addr(5),
      R => '0'
    );
\PRH_Addr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(25),
      Q => prh_addr(6),
      R => '0'
    );
\PRH_Addr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(24),
      Q => prh_addr(7),
      R => '0'
    );
\PRH_Addr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(23),
      Q => prh_addr(8),
      R => '0'
    );
\PRH_Addr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(22),
      Q => prh_addr(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder is
  port (
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\ : out STD_LOGIC;
    Bus_RNW_reg_reg_0 : out STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1\ : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    ip_async_Wrack_d10 : out STD_LOGIC;
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rready_0 : out STD_LOGIC;
    s_axi_bready_0 : out STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1\ : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    Q : in STD_LOGIC;
    ipic_async_req : in STD_LOGIC;
    s_axi_rvalid_i_reg : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_rvalid_i_reg_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    bus2ip_rnw_i0 : in STD_LOGIC;
    \FSM_onehot_state_reg[0]\ : in STD_LOGIC;
    \ASYNC_REQ_GEN.ip_async_Wrack_d4_reg\ : in STD_LOGIC;
    ip2bus_data_int : in STD_LOGIC_VECTOR ( 30 downto 0 );
    \s_axi_rdata_i_reg[0]\ : in STD_LOGIC;
    Q_0 : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_rvalid_i_reg_1 : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_bvalid_i_reg : in STD_LOGIC;
    asynch_prh_rdy_d1 : in STD_LOGIC;
    \s_axi_bresp_i_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    tdevrdy_wdth_cnt : in STD_LOGIC;
    s_axi_bresp : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder is
  signal Bus_RNW_reg_i_1_n_0 : STD_LOGIC;
  signal \^bus_rnw_reg_reg_0\ : STD_LOGIC;
  signal \GEN_BKEND_CE_REGISTERS[0].ce_out_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\ : STD_LOGIC;
  signal \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_1\ : STD_LOGIC;
  signal \MEM_DECODE_GEN[0].cs_out_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \^mem_decode_gen[0].cs_out_i_reg[0]_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ASYNC_REQ_GEN.ip_async_Rdack_d1_r_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of s_axi_arready_INST_0 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of s_axi_bvalid_i_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[10]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[11]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[12]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[13]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[14]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[15]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[16]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[17]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[18]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[19]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[20]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[21]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[22]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[23]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[24]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[25]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[26]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[27]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[28]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[29]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[30]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[31]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[4]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[5]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[6]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[7]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[8]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[9]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of s_axi_wready_INST_0 : label is "soft_lutpair0";
begin
  Bus_RNW_reg_reg_0 <= \^bus_rnw_reg_reg_0\;
  \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\ <= \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\;
  \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1\ <= \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_1\;
  \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\ <= \^mem_decode_gen[0].cs_out_i_reg[0]_0\;
\ASYNC_REQ_GEN.ip_async_Rdack_d1_r_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \ASYNC_REQ_GEN.ip_async_Wrack_d4_reg\,
      I1 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => ip_async_Wrack_d10
    );
Bus_RNW_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \s_axi_rdata_i_reg[0]\,
      I1 => Q,
      I2 => \^bus_rnw_reg_reg_0\,
      O => Bus_RNW_reg_i_1_n_0
    );
Bus_RNW_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Bus_RNW_reg_i_1_n_0,
      Q => \^bus_rnw_reg_reg_0\,
      R => '0'
    );
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFCCCEECCCCCCCC"
    )
        port map (
      I0 => s_axi_rvalid_i_reg_0(1),
      I1 => \FSM_onehot_state_reg[0]\,
      I2 => s_axi_rvalid_i_reg_0(2),
      I3 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_1\,
      I4 => \^bus_rnw_reg_reg_0\,
      I5 => s_axi_rvalid_i_reg,
      O => D(0)
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FD00FFFFFD00FD00"
    )
        port map (
      I0 => s_axi_rvalid_i_reg,
      I1 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_1\,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => s_axi_rvalid_i_reg_0(1),
      I4 => s_axi_arvalid,
      I5 => bus2ip_rnw_i0,
      O => D(1)
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF8FFF88888888"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => s_axi_rvalid_i_reg_0(0),
      I2 => s_axi_rvalid_i_reg,
      I3 => \^bus_rnw_reg_reg_0\,
      I4 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_1\,
      I5 => s_axi_rvalid_i_reg_0(2),
      O => D(2)
    );
\GEN_BKEND_CE_REGISTERS[0].ce_out_i[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3FAAFFAA00000000"
    )
        port map (
      I0 => Q,
      I1 => ipic_async_req,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      I3 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I4 => s_axi_rvalid_i_reg,
      I5 => s_axi_aresetn,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i[0]_i_1_n_0\
    );
\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_BKEND_CE_REGISTERS[0].ce_out_i[0]_i_1_n_0\,
      Q => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      R => '0'
    );
\MEM_DECODE_GEN[0].cs_out_i[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3AFAFAFA00000000"
    )
        port map (
      I0 => Q,
      I1 => ipic_async_req,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      I3 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I4 => s_axi_rvalid_i_reg,
      I5 => s_axi_aresetn,
      O => \MEM_DECODE_GEN[0].cs_out_i[0]_i_1_n_0\
    );
\MEM_DECODE_GEN[0].cs_out_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \MEM_DECODE_GEN[0].cs_out_i[0]_i_1_n_0\,
      Q => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      R => '0'
    );
s_axi_arready_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => s_axi_rvalid_i_reg,
      I1 => \^bus_rnw_reg_reg_0\,
      I2 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I3 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      I4 => ipic_async_req,
      O => s_axi_arready
    );
\s_axi_bresp_i[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000FFFF20000000"
    )
        port map (
      I0 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      I1 => asynch_prh_rdy_d1,
      I2 => \s_axi_bresp_i_reg[1]\(0),
      I3 => tdevrdy_wdth_cnt,
      I4 => s_axi_rvalid_i_reg_0(1),
      I5 => s_axi_bresp(0),
      O => \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1\
    );
s_axi_bvalid_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555D5555000C0000"
    )
        port map (
      I0 => s_axi_bready,
      I1 => s_axi_rvalid_i_reg,
      I2 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_1\,
      I3 => \^bus_rnw_reg_reg_0\,
      I4 => s_axi_rvalid_i_reg_0(1),
      I5 => s_axi_bvalid_i_reg,
      O => s_axi_bready_0
    );
s_axi_bvalid_i_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      I2 => ipic_async_req,
      O => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_1\
    );
\s_axi_rdata_i[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(0),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(0)
    );
\s_axi_rdata_i[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(10),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(10)
    );
\s_axi_rdata_i[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(11),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(11)
    );
\s_axi_rdata_i[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(12),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(12)
    );
\s_axi_rdata_i[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(13),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(13)
    );
\s_axi_rdata_i[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(14),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(14)
    );
\s_axi_rdata_i[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(15),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(15)
    );
\s_axi_rdata_i[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(16),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(16)
    );
\s_axi_rdata_i[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(17),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(17)
    );
\s_axi_rdata_i[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(18),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(18)
    );
\s_axi_rdata_i[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(19),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(19)
    );
\s_axi_rdata_i[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(1),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(1)
    );
\s_axi_rdata_i[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(20),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(20)
    );
\s_axi_rdata_i[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(21),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(21)
    );
\s_axi_rdata_i[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(22),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(22)
    );
\s_axi_rdata_i[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(23),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(23)
    );
\s_axi_rdata_i[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(24),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(24)
    );
\s_axi_rdata_i[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(25),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(25)
    );
\s_axi_rdata_i[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(26),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(26)
    );
\s_axi_rdata_i[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(27),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(27)
    );
\s_axi_rdata_i[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(28),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(28)
    );
\s_axi_rdata_i[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(29),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(29)
    );
\s_axi_rdata_i[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(2),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(2)
    );
\s_axi_rdata_i[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(30),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(30)
    );
\s_axi_rdata_i[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => Q_0,
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(31)
    );
\s_axi_rdata_i[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(3),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(3)
    );
\s_axi_rdata_i[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(4),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(4)
    );
\s_axi_rdata_i[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(5),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(5)
    );
\s_axi_rdata_i[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(6),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(6)
    );
\s_axi_rdata_i[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(7),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(7)
    );
\s_axi_rdata_i[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(8),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(8)
    );
\s_axi_rdata_i[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => ip2bus_data_int(9),
      I1 => \s_axi_rdata_i_reg[0]\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      O => \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(9)
    );
s_axi_rvalid_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55D5555500C00000"
    )
        port map (
      I0 => s_axi_rready,
      I1 => s_axi_rvalid_i_reg,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_1\,
      I4 => s_axi_rvalid_i_reg_0(2),
      I5 => s_axi_rvalid_i_reg_1,
      O => s_axi_rready_0
    );
s_axi_wready_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => s_axi_rvalid_i_reg,
      I1 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I2 => \^mem_decode_gen[0].cs_out_i_reg[0]_0\,
      I3 => ipic_async_req,
      I4 => \^bus_rnw_reg_reg_0\,
      O => s_axi_wready
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_statemachine is
  port (
    tdata_hold_ld_ce_i : out STD_LOGIC;
    async_en : out STD_LOGIC;
    tdev_valid_ld_ce_i : out STD_LOGIC;
    tdev_rdy_ld_ce_i : out STD_LOGIC;
    tads_ld_ce_i : out STD_LOGIC;
    twr_non_muxed_recovery_load_ce_i : out STD_LOGIC;
    trd_non_muxed_recovery_load_ce_i : out STD_LOGIC;
    Asynch_chip_select : out STD_LOGIC;
    Asynch_Rd : out STD_LOGIC;
    Asynch_Wr : out STD_LOGIC;
    async_data_oe_i0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    ip2bus_error : out STD_LOGIC;
    CE : out STD_LOGIC;
    CE_0 : out STD_LOGIC;
    CE_1 : out STD_LOGIC;
    CE_2 : out STD_LOGIC;
    CE_3 : out STD_LOGIC;
    CE_4 : out STD_LOGIC;
    no_steer_async_ce : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    twr_non_muxed_rec_cnt : in STD_LOGIC;
    trd_non_muxed_rec_cnt : in STD_LOGIC;
    \FSM_onehot_command_cs_reg[0]_0\ : in STD_LOGIC;
    \FSM_onehot_command_cs_reg[1]_0\ : in STD_LOGIC;
    bus2ip_cs : in STD_LOGIC;
    ce_out_i : in STD_LOGIC;
    taddr_data_cs_hold_cnt : in STD_LOGIC;
    Asynch_Wr_reg_0 : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    tcontrol_wdth_cnt : in STD_LOGIC;
    \Asynch_chip_select_reg[0]_0\ : in STD_LOGIC;
    \Asynch_chip_select_reg[0]_1\ : in STD_LOGIC;
    tads_cnt : in STD_LOGIC;
    bus2ip_rnw : in STD_LOGIC;
    dev_dbus_width : in STD_LOGIC_VECTOR ( 0 to 0 );
    bus2ip_reset_active_high : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_statemachine;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_statemachine is
  signal Asynch_Rd_i_1_n_0 : STD_LOGIC;
  signal Asynch_Wr_i_1_n_0 : STD_LOGIC;
  signal Asynch_data_sel_inv_i_2_n_0 : STD_LOGIC;
  signal \FSM_onehot_command_cs[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_command_cs[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_command_cs[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_command_cs[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_command_cs[5]_i_1_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal async_addr_cnt_ld : STD_LOGIC;
  signal \^async_en\ : STD_LOGIC;
  signal asynch_chip_select_n : STD_LOGIC;
  signal asynch_data_sel_i : STD_LOGIC;
  signal asynch_start_i : STD_LOGIC;
  signal \^tads_ld_ce_i\ : STD_LOGIC;
  signal \^tdev_rdy_ld_ce_i\ : STD_LOGIC;
  signal tdev_rdy_load_ce_i : STD_LOGIC;
  signal \^tdev_valid_ld_ce_i\ : STD_LOGIC;
  signal \^trd_non_muxed_recovery_load_ce_i\ : STD_LOGIC;
  signal \^twr_non_muxed_recovery_load_ce_i\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of Asynch_Rd_i_1 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of Asynch_Wr_i_1 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \Asynch_chip_select[0]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of Asynch_data_sel_inv_i_2 : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \FSM_onehot_command_cs[1]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \FSM_onehot_command_cs[2]_i_1\ : label is "soft_lutpair43";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_command_cs_reg[0]\ : label is "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_command_cs_reg[15]\ : label is "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_command_cs_reg[16]\ : label is "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_command_cs_reg[17]\ : label is "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_command_cs_reg[1]\ : label is "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_command_cs_reg[2]\ : label is "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_command_cs_reg[3]\ : label is "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_command_cs_reg[4]\ : label is "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_command_cs_reg[5]\ : label is "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000";
  attribute SOFT_HLUTNM of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__2\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__3\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__4\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \s_axi_rresp_i[1]_i_1\ : label is "soft_lutpair39";
begin
  Q(6 downto 0) <= \^q\(6 downto 0);
  async_en <= \^async_en\;
  tads_ld_ce_i <= \^tads_ld_ce_i\;
  tdev_rdy_ld_ce_i <= \^tdev_rdy_ld_ce_i\;
  tdev_valid_ld_ce_i <= \^tdev_valid_ld_ce_i\;
  trd_non_muxed_recovery_load_ce_i <= \^trd_non_muxed_recovery_load_ce_i\;
  twr_non_muxed_recovery_load_ce_i <= \^twr_non_muxed_recovery_load_ce_i\;
Asynch_Rd_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDDDFFDF"
    )
        port map (
      I0 => Bus_RNW_reg,
      I1 => Asynch_Wr_reg_0,
      I2 => \^q\(3),
      I3 => tcontrol_wdth_cnt,
      I4 => tdev_rdy_load_ce_i,
      O => Asynch_Rd_i_1_n_0
    );
Asynch_Rd_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Asynch_Rd_i_1_n_0,
      Q => Asynch_Rd,
      R => '0'
    );
Asynch_Wr_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEEEFFEF"
    )
        port map (
      I0 => Asynch_Wr_reg_0,
      I1 => Bus_RNW_reg,
      I2 => \^q\(3),
      I3 => tcontrol_wdth_cnt,
      I4 => tdev_rdy_load_ce_i,
      O => Asynch_Wr_i_1_n_0
    );
Asynch_Wr_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Asynch_Wr_i_1_n_0,
      Q => Asynch_Wr,
      R => '0'
    );
\Asynch_chip_select[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF40FF"
    )
        port map (
      I0 => \Asynch_chip_select_reg[0]_0\,
      I1 => \^q\(2),
      I2 => \Asynch_chip_select_reg[0]_1\,
      I3 => bus2ip_cs,
      I4 => async_addr_cnt_ld,
      O => asynch_chip_select_n
    );
\Asynch_chip_select_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => asynch_chip_select_n,
      Q => Asynch_chip_select,
      R => '0'
    );
Asynch_data_sel_inv_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000008A"
    )
        port map (
      I0 => Asynch_data_sel_inv_i_2_n_0,
      I1 => taddr_data_cs_hold_cnt,
      I2 => \^q\(4),
      I3 => \^q\(3),
      I4 => \^q\(2),
      I5 => bus2ip_rnw,
      O => asynch_data_sel_i
    );
Asynch_data_sel_inv_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"15"
    )
        port map (
      I0 => \^q\(1),
      I1 => tads_cnt,
      I2 => \^q\(0),
      O => Asynch_data_sel_inv_i_2_n_0
    );
Asynch_data_sel_reg_inv: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => asynch_data_sel_i,
      Q => async_data_oe_i0,
      R => '0'
    );
Asynch_en_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_command_cs[5]_i_1_n_0\,
      Q => \^async_en\,
      R => '0'
    );
\FSM_onehot_command_cs[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \FSM_onehot_command_cs[0]_i_2_n_0\,
      I1 => \^q\(5),
      I2 => twr_non_muxed_rec_cnt,
      I3 => \^q\(6),
      I4 => trd_non_muxed_rec_cnt,
      I5 => \FSM_onehot_command_cs_reg[0]_0\,
      O => \FSM_onehot_command_cs[0]_i_1_n_0\
    );
\FSM_onehot_command_cs[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F7F7F7F7F000000"
    )
        port map (
      I0 => \FSM_onehot_command_cs_reg[1]_0\,
      I1 => bus2ip_cs,
      I2 => ce_out_i,
      I3 => \^q\(4),
      I4 => taddr_data_cs_hold_cnt,
      I5 => async_addr_cnt_ld,
      O => \FSM_onehot_command_cs[0]_i_2_n_0\
    );
\FSM_onehot_command_cs[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => async_addr_cnt_ld,
      I1 => \FSM_onehot_command_cs_reg[1]_0\,
      I2 => bus2ip_cs,
      I3 => ce_out_i,
      O => \FSM_onehot_command_cs[1]_i_1_n_0\
    );
\FSM_onehot_command_cs[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => asynch_start_i,
      I1 => tads_cnt,
      I2 => \^q\(0),
      O => \FSM_onehot_command_cs[2]_i_1_n_0\
    );
\FSM_onehot_command_cs[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F444"
    )
        port map (
      I0 => tcontrol_wdth_cnt,
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \Asynch_chip_select_reg[0]_0\,
      O => \FSM_onehot_command_cs[5]_i_1_n_0\
    );
\FSM_onehot_command_cs_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_command_cs[0]_i_1_n_0\,
      Q => async_addr_cnt_ld,
      S => bus2ip_reset_active_high
    );
\FSM_onehot_command_cs_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(2),
      Q => \^q\(4),
      R => bus2ip_reset_active_high
    );
\FSM_onehot_command_cs_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(3),
      Q => \^q\(5),
      R => bus2ip_reset_active_high
    );
\FSM_onehot_command_cs_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(4),
      Q => \^q\(6),
      R => bus2ip_reset_active_high
    );
\FSM_onehot_command_cs_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_command_cs[1]_i_1_n_0\,
      Q => asynch_start_i,
      R => bus2ip_reset_active_high
    );
\FSM_onehot_command_cs_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_command_cs[2]_i_1_n_0\,
      Q => \^q\(0),
      R => bus2ip_reset_active_high
    );
\FSM_onehot_command_cs_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(0),
      Q => \^q\(1),
      R => bus2ip_reset_active_high
    );
\FSM_onehot_command_cs_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(1),
      Q => \^q\(2),
      R => bus2ip_reset_active_high
    );
\FSM_onehot_command_cs_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_command_cs[5]_i_1_n_0\,
      Q => \^q\(3),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^async_en\,
      I1 => dev_dbus_width(0),
      O => no_steer_async_ce(0)
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^trd_non_muxed_recovery_load_ce_i\,
      I1 => async_addr_cnt_ld,
      I2 => \^q\(4),
      O => CE
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^twr_non_muxed_recovery_load_ce_i\,
      I1 => async_addr_cnt_ld,
      I2 => \^q\(4),
      O => CE_0
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^tads_ld_ce_i\,
      I1 => async_addr_cnt_ld,
      I2 => \^q\(4),
      O => CE_1
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^tdev_valid_ld_ce_i\,
      I1 => async_addr_cnt_ld,
      I2 => \^q\(4),
      O => CE_2
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^async_en\,
      I1 => async_addr_cnt_ld,
      I2 => \^q\(4),
      O => CE_3
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => async_addr_cnt_ld,
      I1 => \^tdev_rdy_ld_ce_i\,
      O => CE_4
    );
Tads_load_ce_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_command_cs[2]_i_1_n_0\,
      Q => \^tads_ld_ce_i\,
      R => '0'
    );
Tdata_hold_load_ce_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(2),
      Q => tdata_hold_ld_ce_i,
      R => '0'
    );
Tdev_rdy_load_ce_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFD0D0D0"
    )
        port map (
      I0 => \Asynch_chip_select_reg[0]_1\,
      I1 => \Asynch_chip_select_reg[0]_0\,
      I2 => \^q\(2),
      I3 => \^q\(0),
      I4 => tads_cnt,
      I5 => \^q\(1),
      O => tdev_rdy_load_ce_i
    );
Tdev_rdy_load_ce_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => tdev_rdy_load_ce_i,
      Q => \^tdev_rdy_ld_ce_i\,
      R => '0'
    );
Tdev_valid_load_ce_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(0),
      Q => \^tdev_valid_ld_ce_i\,
      R => '0'
    );
Trd_non_muxed_recovery_load_ce_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(4),
      Q => \^trd_non_muxed_recovery_load_ce_i\,
      R => '0'
    );
Twr_non_muxed_recovery_load_ce_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => D(3),
      Q => \^twr_non_muxed_recovery_load_ce_i\,
      R => '0'
    );
\s_axi_rresp_i[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => bus2ip_cs,
      I1 => \Asynch_chip_select_reg[0]_0\,
      I2 => \^q\(2),
      I3 => \Asynch_chip_select_reg[0]_1\,
      O => ip2bus_error
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_data_steer is
  port (
    Q_0 : out STD_LOGIC;
    ip2bus_data_int : out STD_LOGIC_VECTOR ( 30 downto 0 );
    prh_be : out STD_LOGIC_VECTOR ( 0 to 3 );
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ : out STD_LOGIC;
    bus2ip_reset_active_high : in STD_LOGIC;
    no_steer_async_ce : in STD_LOGIC_VECTOR ( 0 to 0 );
    prh_data_i : in STD_LOGIC_VECTOR ( 0 to 31 );
    s_axi_aclk : in STD_LOGIC;
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0]_0\ : in STD_LOGIC;
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1]_0\ : in STD_LOGIC;
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2]_0\ : in STD_LOGIC;
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3]_0\ : in STD_LOGIC;
    bus2ip_cs : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_data_steer;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_data_steer is
  signal \^mem_decode_gen[0].cs_out_i_reg[0]\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT\ : label is std.standard.true;
  attribute BOX_TYPE of \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT\ : label is "PRIMITIVE";
begin
  \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ <= \^mem_decode_gen[0].cs_out_i_reg[0]\;
\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => bus2ip_cs,
      O => \^mem_decode_gen[0].cs_out_i_reg[0]\
    );
\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0]_0\,
      Q => prh_be(0),
      R => \^mem_decode_gen[0].cs_out_i_reg[0]\
    );
\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1]_0\,
      Q => prh_be(1),
      R => \^mem_decode_gen[0].cs_out_i_reg[0]\
    );
\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2]_0\,
      Q => prh_be(2),
      R => \^mem_decode_gen[0].cs_out_i_reg[0]\
    );
\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3]_0\,
      Q => prh_be(3),
      R => \^mem_decode_gen[0].cs_out_i_reg[0]\
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(0),
      Q => Q_0,
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(1),
      Q => ip2bus_data_int(30),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(2),
      Q => ip2bus_data_int(29),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(3),
      Q => ip2bus_data_int(28),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(4),
      Q => ip2bus_data_int(27),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(5),
      Q => ip2bus_data_int(26),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(6),
      Q => ip2bus_data_int(25),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(7),
      Q => ip2bus_data_int(24),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(8),
      Q => ip2bus_data_int(23),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(9),
      Q => ip2bus_data_int(22),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(10),
      Q => ip2bus_data_int(21),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(11),
      Q => ip2bus_data_int(20),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(12),
      Q => ip2bus_data_int(19),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(13),
      Q => ip2bus_data_int(18),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(14),
      Q => ip2bus_data_int(17),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(15),
      Q => ip2bus_data_int(16),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(16),
      Q => ip2bus_data_int(15),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(17),
      Q => ip2bus_data_int(14),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(18),
      Q => ip2bus_data_int(13),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(19),
      Q => ip2bus_data_int(12),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(20),
      Q => ip2bus_data_int(11),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(21),
      Q => ip2bus_data_int(10),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(22),
      Q => ip2bus_data_int(9),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(23),
      Q => ip2bus_data_int(8),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(24),
      Q => ip2bus_data_int(7),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(25),
      Q => ip2bus_data_int(6),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(26),
      Q => ip2bus_data_int(5),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(27),
      Q => ip2bus_data_int(4),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(28),
      Q => ip2bus_data_int(3),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(29),
      Q => ip2bus_data_int(2),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(30),
      Q => ip2bus_data_int(1),
      R => bus2ip_reset_active_high
    );
\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => no_steer_async_ce(0),
      D => prh_data_i(31),
      Q => ip2bus_data_int(0),
      R => bus2ip_reset_active_high
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ipic_if_decode is
  port (
    dev_dbus_width : out STD_LOGIC_VECTOR ( 0 to 0 );
    \ASYNC_REQ_GEN.local_async_req_reg_0\ : out STD_LOGIC;
    dev_rdy : out STD_LOGIC;
    bus2ip_reset_active_high : in STD_LOGIC;
    bus2ip_cs : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    ip_async_Wrack_d10 : in STD_LOGIC;
    s_axi_arready : in STD_LOGIC;
    s_axi_wready : in STD_LOGIC;
    \ASYNC_REQ_GEN.local_async_req_reg_1\ : in STD_LOGIC;
    ce_out_i : in STD_LOGIC;
    prh_rdy : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ipic_if_decode;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ipic_if_decode is
  signal \ASYNC_REQ_GEN.ip_async_Rdack_d1_reg_r_n_0\ : STD_LOGIC;
  signal \ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0\ : STD_LOGIC;
  signal \ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0\ : STD_LOGIC;
  signal \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0\ : STD_LOGIC;
  signal \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_gate_n_0\ : STD_LOGIC;
  signal \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0\ : STD_LOGIC;
  signal \ASYNC_REQ_GEN.ip_async_Wrack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0\ : STD_LOGIC;
  signal \ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0\ : STD_LOGIC;
  signal \ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_gate_n_0\ : STD_LOGIC;
  signal \ASYNC_REQ_GEN.local_async_req_i_1_n_0\ : STD_LOGIC;
  signal \ASYNC_REQ_GEN.local_async_req_i_2_n_0\ : STD_LOGIC;
  signal \^async_req_gen.local_async_req_reg_0\ : STD_LOGIC;
  signal \Dev_id[0]_i_1_n_0\ : STD_LOGIC;
  signal \^dev_dbus_width\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \dev_dbus_width_i[0]_i_1_n_0\ : STD_LOGIC;
  signal dev_id : STD_LOGIC;
  signal dev_in_access_int_d1 : STD_LOGIC;
  signal ip_async_Rdack_d4 : STD_LOGIC;
  signal ip_async_Wrack_d4 : STD_LOGIC;
  attribute srl_name : string;
  attribute srl_name of \ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r\ : label is "U0/\EPC_CORE_I/IPIC_DECODE_I/ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r ";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_gate\ : label is "soft_lutpair45";
  attribute srl_name of \ASYNC_REQ_GEN.ip_async_Wrack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r\ : label is "U0/\EPC_CORE_I/IPIC_DECODE_I/ASYNC_REQ_GEN.ip_async_Wrack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r ";
  attribute SOFT_HLUTNM of \ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_gate\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \Dev_id[0]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \dev_dbus_width_i[0]_i_1\ : label is "soft_lutpair44";
begin
  \ASYNC_REQ_GEN.local_async_req_reg_0\ <= \^async_req_gen.local_async_req_reg_0\;
  dev_dbus_width(0) <= \^dev_dbus_width\(0);
\ASYNC_REQ_GEN.ip_async_Rdack_d1_reg_r\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => '1',
      Q => \ASYNC_REQ_GEN.ip_async_Rdack_d1_reg_r_n_0\,
      R => ip_async_Wrack_d10
    );
\ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \ASYNC_REQ_GEN.ip_async_Rdack_d1_reg_r_n_0\,
      Q => \ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0\,
      R => ip_async_Wrack_d10
    );
\ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => s_axi_aclk,
      D => s_axi_arready,
      Q => \ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0\
    );
\ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0\,
      Q => \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0\,
      R => '0'
    );
\ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_gate\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0\,
      I1 => \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0\,
      O => \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_gate_n_0\
    );
\ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0\,
      Q => \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0\,
      R => ip_async_Wrack_d10
    );
\ASYNC_REQ_GEN.ip_async_Rdack_d4_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_gate_n_0\,
      Q => ip_async_Rdack_d4,
      R => ip_async_Wrack_d10
    );
\ASYNC_REQ_GEN.ip_async_Wrack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => s_axi_aclk,
      D => s_axi_wready,
      Q => \ASYNC_REQ_GEN.ip_async_Wrack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0\
    );
\ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \ASYNC_REQ_GEN.ip_async_Wrack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0\,
      Q => \ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0\,
      R => '0'
    );
\ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_gate\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0\,
      I1 => \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0\,
      O => \ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_gate_n_0\
    );
\ASYNC_REQ_GEN.ip_async_Wrack_d4_reg\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_gate_n_0\,
      Q => ip_async_Wrack_d4,
      R => ip_async_Wrack_d10
    );
\ASYNC_REQ_GEN.local_async_req_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00007FFF"
    )
        port map (
      I0 => \ASYNC_REQ_GEN.local_async_req_reg_1\,
      I1 => ce_out_i,
      I2 => bus2ip_cs,
      I3 => \^async_req_gen.local_async_req_reg_0\,
      I4 => \ASYNC_REQ_GEN.local_async_req_i_2_n_0\,
      O => \ASYNC_REQ_GEN.local_async_req_i_1_n_0\
    );
\ASYNC_REQ_GEN.local_async_req_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABAAAAFFFFFFFF"
    )
        port map (
      I0 => bus2ip_reset_active_high,
      I1 => \^async_req_gen.local_async_req_reg_0\,
      I2 => ip_async_Wrack_d4,
      I3 => ip_async_Rdack_d4,
      I4 => dev_in_access_int_d1,
      I5 => bus2ip_cs,
      O => \ASYNC_REQ_GEN.local_async_req_i_2_n_0\
    );
\ASYNC_REQ_GEN.local_async_req_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \ASYNC_REQ_GEN.local_async_req_i_1_n_0\,
      Q => \^async_req_gen.local_async_req_reg_0\,
      R => '0'
    );
\Dev_id[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F2"
    )
        port map (
      I0 => bus2ip_cs,
      I1 => dev_in_access_int_d1,
      I2 => dev_id,
      O => \Dev_id[0]_i_1_n_0\
    );
\Dev_id_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \Dev_id[0]_i_1_n_0\,
      Q => dev_id,
      R => bus2ip_reset_active_high
    );
\SOME_DEV_ASYNC_GEN.REG_PRH_RDY_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => dev_id,
      I1 => prh_rdy(0),
      O => dev_rdy
    );
\dev_dbus_width_i[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F2"
    )
        port map (
      I0 => bus2ip_cs,
      I1 => dev_in_access_int_d1,
      I2 => \^dev_dbus_width\(0),
      O => \dev_dbus_width_i[0]_i_1_n_0\
    );
\dev_dbus_width_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \dev_dbus_width_i[0]_i_1_n_0\,
      Q => \^dev_dbus_width\(0),
      R => bus2ip_reset_active_high
    );
dev_in_access_int_d1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => bus2ip_cs,
      Q => dev_in_access_int_d1,
      R => bus2ip_reset_active_high
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg is
  port (
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    tdata_hold_ld_ce_i : in STD_LOGIC;
    bus2ip_reset_active_high : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \ASYNC_REQ_GEN.local_async_req_reg\ : in STD_LOGIC;
    \ASYNC_REQ_GEN.local_async_req_reg_0\ : in STD_LOGIC;
    tcontrol_wdth_cnt : in STD_LOGIC;
    bus2ip_cs : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg is
  signal D_0 : STD_LOGIC;
  signal \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\ : STD_LOGIC;
  signal S : STD_LOGIC;
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
  \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ <= \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\;
\FSM_onehot_command_cs[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F444"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\,
      I1 => Q(2),
      I2 => tcontrol_wdth_cnt,
      I3 => Q(1),
      O => D(0)
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => D_0,
      Q => \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\,
      R => bus2ip_reset_active_high
    );
\PERBIT_GEN[0].XORCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 0),
      CYINIT => tdata_hold_ld_ce_i,
      DI(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 0),
      O(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => D_0,
      S(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => S
    );
\PERBIT_GEN[0].XORCY_i1_i_1__3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\,
      I1 => tdata_hold_ld_ce_i,
      I2 => bus2ip_cs,
      O => S
    );
s_axi_wready_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8F888888"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\,
      I1 => Q(2),
      I2 => \ASYNC_REQ_GEN.local_async_req_reg\,
      I3 => Q(0),
      I4 => \ASYNC_REQ_GEN.local_async_req_reg_0\,
      O => \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_0 is
  port (
    tcontrol_wdth_cnt : out STD_LOGIC;
    async_en : in STD_LOGIC;
    bus2ip_reset_active_high : in STD_LOGIC;
    CE : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    bus2ip_cs : in STD_LOGIC;
    ce_out_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_0 : entity is "ld_arith_reg";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_0 is
  signal D : STD_LOGIC;
  signal S : STD_LOGIC;
  signal \^tcontrol_wdth_cnt\ : STD_LOGIC;
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
  tcontrol_wdth_cnt <= \^tcontrol_wdth_cnt\;
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE,
      D => D,
      Q => \^tcontrol_wdth_cnt\,
      R => bus2ip_reset_active_high
    );
\PERBIT_GEN[0].XORCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 0),
      CYINIT => async_en,
      DI(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 0),
      O(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => D,
      S(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => S
    );
\PERBIT_GEN[0].XORCY_i1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAC0"
    )
        port map (
      I0 => \^tcontrol_wdth_cnt\,
      I1 => bus2ip_cs,
      I2 => ce_out_i,
      I3 => async_en,
      O => S
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_1 is
  port (
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1\ : out STD_LOGIC;
    tdev_rdy_ld_ce_i : in STD_LOGIC;
    bus2ip_reset_active_high : in STD_LOGIC;
    CE_0 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_onehot_command_cs_reg[0]\ : in STD_LOGIC;
    bus2ip_cs : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_1 : entity is "ld_arith_reg";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_1;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_1 is
  signal D : STD_LOGIC;
  signal \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\ : STD_LOGIC;
  signal S : STD_LOGIC;
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
  \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ <= \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\;
\FSM_onehot_command_cs[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\,
      I1 => Q(0),
      I2 => \FSM_onehot_command_cs_reg[0]\,
      O => \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1\
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_0,
      D => D,
      Q => \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\,
      R => bus2ip_reset_active_high
    );
\PERBIT_GEN[0].XORCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 0),
      CYINIT => tdev_rdy_ld_ce_i,
      DI(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 0),
      O(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => D,
      S(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => S
    );
\PERBIT_GEN[0].XORCY_i1_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^perbit_gen[0].ff_rst0_gen.fdre_i1_0\,
      I1 => tdev_rdy_ld_ce_i,
      I2 => bus2ip_cs,
      O => S
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_2 is
  port (
    tdev_valid_cnt : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    tdev_valid_ld_ce_i : in STD_LOGIC;
    bus2ip_reset_active_high : in STD_LOGIC;
    CE_1 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \FSM_onehot_command_cs_reg[4]\ : in STD_LOGIC;
    \FSM_onehot_command_cs_reg[4]_0\ : in STD_LOGIC;
    bus2ip_cs : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_2 : entity is "ld_arith_reg";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_2;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_2 is
  signal D_0 : STD_LOGIC;
  signal S : STD_LOGIC;
  signal \^tdev_valid_cnt\ : STD_LOGIC;
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
  tdev_valid_cnt <= \^tdev_valid_cnt\;
\FSM_onehot_command_cs[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88888F88"
    )
        port map (
      I0 => \^tdev_valid_cnt\,
      I1 => Q(0),
      I2 => \FSM_onehot_command_cs_reg[4]\,
      I3 => Q(1),
      I4 => \FSM_onehot_command_cs_reg[4]_0\,
      O => D(0)
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_1,
      D => D_0,
      Q => \^tdev_valid_cnt\,
      R => bus2ip_reset_active_high
    );
\PERBIT_GEN[0].XORCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 0),
      CYINIT => tdev_valid_ld_ce_i,
      DI(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 0),
      O(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => D_0,
      S(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => S
    );
\PERBIT_GEN[0].XORCY_i1_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^tdev_valid_cnt\,
      I1 => tdev_valid_ld_ce_i,
      I2 => bus2ip_cs,
      O => S
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_3 is
  port (
    tads_cnt : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    tads_ld_ce_i : in STD_LOGIC;
    bus2ip_reset_active_high : in STD_LOGIC;
    CE_2 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    tdev_valid_cnt : in STD_LOGIC;
    bus2ip_cs : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_3 : entity is "ld_arith_reg";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_3;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_3 is
  signal D_0 : STD_LOGIC;
  signal S : STD_LOGIC;
  signal \^tads_cnt\ : STD_LOGIC;
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
  tads_cnt <= \^tads_cnt\;
\FSM_onehot_command_cs[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => \^tads_cnt\,
      I1 => Q(0),
      I2 => tdev_valid_cnt,
      I3 => Q(1),
      O => D(0)
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_2,
      D => D_0,
      Q => \^tads_cnt\,
      R => bus2ip_reset_active_high
    );
\PERBIT_GEN[0].XORCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 0),
      CYINIT => tads_ld_ce_i,
      DI(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 0),
      O(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => D_0,
      S(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => S
    );
\PERBIT_GEN[0].XORCY_i1_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^tads_cnt\,
      I1 => tads_ld_ce_i,
      I2 => bus2ip_cs,
      O => S
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_4 is
  port (
    twr_non_muxed_rec_cnt : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    twr_non_muxed_recovery_load_ce_i : in STD_LOGIC;
    bus2ip_reset_active_high : in STD_LOGIC;
    CE_3 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Bus_RNW_reg : in STD_LOGIC;
    Twr_non_muxed_recovery_load_ce_reg : in STD_LOGIC;
    taddr_data_cs_hold_cnt : in STD_LOGIC;
    bus2ip_cs : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_4 : entity is "ld_arith_reg";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_4;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_4 is
  signal D_0 : STD_LOGIC;
  signal S : STD_LOGIC;
  signal \^twr_non_muxed_rec_cnt\ : STD_LOGIC;
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
  twr_non_muxed_rec_cnt <= \^twr_non_muxed_rec_cnt\;
\FSM_onehot_command_cs[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"444F444444444444"
    )
        port map (
      I0 => \^twr_non_muxed_rec_cnt\,
      I1 => Q(1),
      I2 => Bus_RNW_reg,
      I3 => Twr_non_muxed_recovery_load_ce_reg,
      I4 => Q(0),
      I5 => taddr_data_cs_hold_cnt,
      O => D(0)
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_3,
      D => D_0,
      Q => \^twr_non_muxed_rec_cnt\,
      R => bus2ip_reset_active_high
    );
\PERBIT_GEN[0].XORCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 0),
      CYINIT => twr_non_muxed_recovery_load_ce_i,
      DI(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 0),
      O(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => D_0,
      S(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => S
    );
\PERBIT_GEN[0].XORCY_i1_i_1__4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^twr_non_muxed_rec_cnt\,
      I1 => twr_non_muxed_recovery_load_ce_i,
      I2 => bus2ip_cs,
      O => S
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_5 is
  port (
    trd_non_muxed_rec_cnt : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    trd_non_muxed_recovery_load_ce_i : in STD_LOGIC;
    bus2ip_reset_active_high : in STD_LOGIC;
    CE_4 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Trd_non_muxed_recovery_load_ce_reg : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    taddr_data_cs_hold_cnt : in STD_LOGIC;
    bus2ip_cs : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_5 : entity is "ld_arith_reg";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_5;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_5 is
  signal D_0 : STD_LOGIC;
  signal S : STD_LOGIC;
  signal \^trd_non_muxed_rec_cnt\ : STD_LOGIC;
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "MLO";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \PERBIT_GEN[0].XORCY_i1_CARRY4\ : label is "(MUXCY,XORCY)";
begin
  trd_non_muxed_rec_cnt <= \^trd_non_muxed_rec_cnt\;
\FSM_onehot_command_cs[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44444444444444"
    )
        port map (
      I0 => \^trd_non_muxed_rec_cnt\,
      I1 => Q(1),
      I2 => Trd_non_muxed_recovery_load_ce_reg,
      I3 => Bus_RNW_reg,
      I4 => Q(0),
      I5 => taddr_data_cs_hold_cnt,
      O => D(0)
    );
\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => CE_4,
      D => D_0,
      Q => \^trd_non_muxed_rec_cnt\,
      R => bus2ip_reset_active_high
    );
\PERBIT_GEN[0].XORCY_i1_CARRY4\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED\(3 downto 0),
      CYINIT => trd_non_muxed_recovery_load_ce_i,
      DI(3 downto 0) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED\(3 downto 0),
      O(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED\(3 downto 1),
      O(0) => D_0,
      S(3 downto 1) => \NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED\(3 downto 1),
      S(0) => S
    );
\PERBIT_GEN[0].XORCY_i1_i_1__5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^trd_non_muxed_rec_cnt\,
      I1 => trd_non_muxed_recovery_load_ce_i,
      I2 => bus2ip_cs,
      O => S
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_counters is
  port (
    tcontrol_wdth_cnt : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : out STD_LOGIC;
    tads_cnt : out STD_LOGIC;
    taddr_data_cs_hold_cnt : out STD_LOGIC;
    twr_non_muxed_rec_cnt : out STD_LOGIC;
    trd_non_muxed_rec_cnt : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 4 downto 0 );
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1\ : out STD_LOGIC;
    async_en : in STD_LOGIC;
    bus2ip_reset_active_high : in STD_LOGIC;
    CE : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    tdev_rdy_ld_ce_i : in STD_LOGIC;
    CE_0 : in STD_LOGIC;
    tdev_valid_ld_ce_i : in STD_LOGIC;
    CE_1 : in STD_LOGIC;
    tads_ld_ce_i : in STD_LOGIC;
    CE_2 : in STD_LOGIC;
    tdata_hold_ld_ce_i : in STD_LOGIC;
    twr_non_muxed_recovery_load_ce_i : in STD_LOGIC;
    CE_3 : in STD_LOGIC;
    trd_non_muxed_recovery_load_ce_i : in STD_LOGIC;
    CE_4 : in STD_LOGIC;
    bus2ip_cs : in STD_LOGIC;
    ce_out_i : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    Bus_RNW_reg : in STD_LOGIC;
    Trd_non_muxed_recovery_load_ce_reg : in STD_LOGIC;
    \FSM_onehot_command_cs_reg[4]\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_counters;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_counters is
  signal \^perbit_gen[0].ff_rst0_gen.fdre_i1\ : STD_LOGIC;
  signal \^taddr_data_cs_hold_cnt\ : STD_LOGIC;
  signal \^tcontrol_wdth_cnt\ : STD_LOGIC;
  signal tdev_valid_cnt : STD_LOGIC;
begin
  \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ <= \^perbit_gen[0].ff_rst0_gen.fdre_i1\;
  taddr_data_cs_hold_cnt <= \^taddr_data_cs_hold_cnt\;
  tcontrol_wdth_cnt <= \^tcontrol_wdth_cnt\;
LD_ARITH_REG_I_CNTR12: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg
     port map (
      \ASYNC_REQ_GEN.local_async_req_reg\ => \FSM_onehot_command_cs_reg[4]\,
      \ASYNC_REQ_GEN.local_async_req_reg_0\ => \^perbit_gen[0].ff_rst0_gen.fdre_i1\,
      D(0) => D(2),
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ => \^taddr_data_cs_hold_cnt\,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1\ => \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\,
      Q(2 downto 0) => Q(4 downto 2),
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      s_axi_aclk => s_axi_aclk,
      tcontrol_wdth_cnt => \^tcontrol_wdth_cnt\,
      tdata_hold_ld_ce_i => tdata_hold_ld_ce_i
    );
LD_ARITH_REG_I_CNTR3: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_0
     port map (
      CE => CE,
      async_en => async_en,
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      ce_out_i => ce_out_i,
      s_axi_aclk => s_axi_aclk,
      tcontrol_wdth_cnt => \^tcontrol_wdth_cnt\
    );
LD_ARITH_REG_I_CNTR4: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_1
     port map (
      CE_0 => CE_0,
      \FSM_onehot_command_cs_reg[0]\ => \FSM_onehot_command_cs_reg[4]\,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ => \^perbit_gen[0].ff_rst0_gen.fdre_i1\,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1\ => \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1\,
      Q(0) => Q(2),
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      s_axi_aclk => s_axi_aclk,
      tdev_rdy_ld_ce_i => tdev_rdy_ld_ce_i
    );
LD_ARITH_REG_I_CNTR7: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_2
     port map (
      CE_1 => CE_1,
      D(0) => D(1),
      \FSM_onehot_command_cs_reg[4]\ => \FSM_onehot_command_cs_reg[4]\,
      \FSM_onehot_command_cs_reg[4]_0\ => \^perbit_gen[0].ff_rst0_gen.fdre_i1\,
      Q(1 downto 0) => Q(2 downto 1),
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      s_axi_aclk => s_axi_aclk,
      tdev_valid_cnt => tdev_valid_cnt,
      tdev_valid_ld_ce_i => tdev_valid_ld_ce_i
    );
LD_ARITH_REG_I_CNTR8: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_3
     port map (
      CE_2 => CE_2,
      D(0) => D(0),
      Q(1 downto 0) => Q(1 downto 0),
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      s_axi_aclk => s_axi_aclk,
      tads_cnt => tads_cnt,
      tads_ld_ce_i => tads_ld_ce_i,
      tdev_valid_cnt => tdev_valid_cnt
    );
LD_ARITH_REG_I_NON_MUXED_CNTR5: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_4
     port map (
      Bus_RNW_reg => Bus_RNW_reg,
      CE_3 => CE_3,
      D(0) => D(3),
      Q(1 downto 0) => Q(5 downto 4),
      Twr_non_muxed_recovery_load_ce_reg => Trd_non_muxed_recovery_load_ce_reg,
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      s_axi_aclk => s_axi_aclk,
      taddr_data_cs_hold_cnt => \^taddr_data_cs_hold_cnt\,
      twr_non_muxed_rec_cnt => twr_non_muxed_rec_cnt,
      twr_non_muxed_recovery_load_ce_i => twr_non_muxed_recovery_load_ce_i
    );
LD_ARITH_REG_I_NON_MUXED_CNTR9: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_5
     port map (
      Bus_RNW_reg => Bus_RNW_reg,
      CE_4 => CE_4,
      D(0) => D(4),
      Q(1) => Q(6),
      Q(0) => Q(4),
      Trd_non_muxed_recovery_load_ce_reg => Trd_non_muxed_recovery_load_ce_reg,
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      s_axi_aclk => s_axi_aclk,
      taddr_data_cs_hold_cnt => \^taddr_data_cs_hold_cnt\,
      trd_non_muxed_rec_cnt => trd_non_muxed_rec_cnt,
      trd_non_muxed_recovery_load_ce_i => trd_non_muxed_recovery_load_ce_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    bus2ip_rnw_i_reg_0 : out STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ : out STD_LOGIC;
    Bus_RNW_reg_reg : out STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ : out STD_LOGIC;
    s_axi_rvalid_i_reg_0 : out STD_LOGIC;
    s_axi_bvalid_i_reg_0 : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\ : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    ip_async_Wrack_d10 : out STD_LOGIC;
    bus2ip_rnw_i_reg_1 : out STD_LOGIC;
    bus2ip_rnw_i_reg_2 : out STD_LOGIC;
    bus2ip_rnw_i_reg_3 : out STD_LOGIC;
    bus2ip_rnw_i_reg_4 : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \bus2ip_addr_i_reg[31]_0\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    ip2bus_error : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    ipic_async_req : in STD_LOGIC;
    s_axi_rvalid_i_reg_1 : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    ip2bus_data_int : in STD_LOGIC_VECTOR ( 30 downto 0 );
    Q_0 : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    asynch_prh_rdy_d1 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    tdevrdy_wdth_cnt : in STD_LOGIC;
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment is
  signal \FSM_onehot_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[1]\ : STD_LOGIC;
  signal I_DECODER_n_3 : STD_LOGIC;
  signal I_DECODER_n_4 : STD_LOGIC;
  signal I_DECODER_n_42 : STD_LOGIC;
  signal I_DECODER_n_43 : STD_LOGIC;
  signal I_DECODER_n_44 : STD_LOGIC;
  signal I_DECODER_n_5 : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \bus2ip_addr_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[10]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[11]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[12]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[13]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[14]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[15]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[16]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[17]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[18]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[19]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[1]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[20]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[21]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[22]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[23]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[24]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[25]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[26]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[27]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[28]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[29]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[2]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[30]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[31]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[31]_i_2_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[3]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[4]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[5]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[6]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[7]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[8]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[9]_i_1_n_0\ : STD_LOGIC;
  signal bus2ip_rnw_i0 : STD_LOGIC;
  signal \^bus2ip_rnw_i_reg_0\ : STD_LOGIC;
  signal \ip2bus_data_int__0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s_axi_bresp_i : STD_LOGIC;
  signal \^s_axi_bvalid_i_reg_0\ : STD_LOGIC;
  signal s_axi_rresp_i : STD_LOGIC;
  signal \^s_axi_rvalid_i_reg_0\ : STD_LOGIC;
  signal start2 : STD_LOGIC;
  signal start2_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[0]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \FSM_onehot_state[1]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_2\ : label is "soft_lutpair19";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "sm_read:1000,sm_write:0100,sm_resp:0001,sm_idle:0010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "sm_read:1000,sm_write:0100,sm_resp:0001,sm_idle:0010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "sm_read:1000,sm_write:0100,sm_resp:0001,sm_idle:0010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "sm_read:1000,sm_write:0100,sm_resp:0001,sm_idle:0010";
  attribute SOFT_HLUTNM of \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[0]_i_2\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[1]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[2]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[3]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[0]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[10]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[11]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[12]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[13]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[14]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[15]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[16]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[17]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[18]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[19]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[1]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[20]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[21]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[22]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[23]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[24]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[25]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[26]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[27]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[28]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[29]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[2]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[30]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[31]_i_2\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[3]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[4]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[5]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[6]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[7]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[8]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[9]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of start2_i_1 : label is "soft_lutpair19";
begin
  SR(0) <= \^sr\(0);
  bus2ip_rnw_i_reg_0 <= \^bus2ip_rnw_i_reg_0\;
  s_axi_bresp(0) <= \^s_axi_bresp\(0);
  s_axi_bvalid_i_reg_0 <= \^s_axi_bvalid_i_reg_0\;
  s_axi_rvalid_i_reg_0 <= \^s_axi_rvalid_i_reg_0\;
\FSM_onehot_state[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002A2A2A"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[0]\,
      I1 => s_axi_rready,
      I2 => \^s_axi_rvalid_i_reg_0\,
      I3 => s_axi_bready,
      I4 => \^s_axi_bvalid_i_reg_0\,
      O => \FSM_onehot_state[0]_i_2_n_0\
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888F888F888F88"
    )
        port map (
      I0 => \FSM_onehot_state[1]_i_2_n_0\,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      I2 => s_axi_arvalid,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \FSM_onehot_state[1]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^s_axi_bvalid_i_reg_0\,
      I1 => s_axi_bready,
      I2 => \^s_axi_rvalid_i_reg_0\,
      I3 => s_axi_rready,
      O => \FSM_onehot_state[1]_i_2_n_0\
    );
\FSM_onehot_state[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => s_axi_wvalid,
      I2 => s_axi_awvalid,
      O => bus2ip_rnw_i0
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_5,
      Q => \FSM_onehot_state_reg_n_0_[0]\,
      R => \^sr\(0)
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_state[1]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[1]\,
      S => \^sr\(0)
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_4,
      Q => s_axi_bresp_i,
      R => \^sr\(0)
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_3,
      Q => s_axi_rresp_i,
      R => \^sr\(0)
    );
I_DECODER: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder
     port map (
      \ASYNC_REQ_GEN.ip_async_Wrack_d4_reg\ => \^sr\(0),
      Bus_RNW_reg_reg_0 => Bus_RNW_reg_reg,
      D(2) => I_DECODER_n_3,
      D(1) => I_DECODER_n_4,
      D(0) => I_DECODER_n_5,
      \FSM_onehot_state_reg[0]\ => \FSM_onehot_state[0]_i_2_n_0\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\ => \MEM_DECODE_GEN[0].cs_out_i_reg[0]\,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1\ => I_DECODER_n_44,
      \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT\(31 downto 0) => \ip2bus_data_int__0\(31 downto 0),
      Q => start2,
      Q_0 => Q_0,
      asynch_prh_rdy_d1 => asynch_prh_rdy_d1,
      bus2ip_rnw_i0 => bus2ip_rnw_i0,
      ip2bus_data_int(30 downto 0) => ip2bus_data_int(30 downto 0),
      ip_async_Wrack_d10 => ip_async_Wrack_d10,
      ipic_async_req => ipic_async_req,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bready_0 => I_DECODER_n_43,
      s_axi_bresp(0) => \^s_axi_bresp\(0),
      \s_axi_bresp_i_reg[1]\(0) => Q(0),
      s_axi_bvalid_i_reg => \^s_axi_bvalid_i_reg_0\,
      \s_axi_rdata_i_reg[0]\ => \^bus2ip_rnw_i_reg_0\,
      s_axi_rready => s_axi_rready,
      s_axi_rready_0 => I_DECODER_n_42,
      s_axi_rvalid_i_reg => s_axi_rvalid_i_reg_1,
      s_axi_rvalid_i_reg_0(2) => s_axi_rresp_i,
      s_axi_rvalid_i_reg_0(1) => s_axi_bresp_i,
      s_axi_rvalid_i_reg_0(0) => \FSM_onehot_state_reg_n_0_[1]\,
      s_axi_rvalid_i_reg_1 => \^s_axi_rvalid_i_reg_0\,
      s_axi_wready => s_axi_wready,
      tdevrdy_wdth_cnt => tdevrdy_wdth_cnt
    );
\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^bus2ip_rnw_i_reg_0\,
      I1 => s_axi_wstrb(3),
      O => bus2ip_rnw_i_reg_1
    );
\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^bus2ip_rnw_i_reg_0\,
      I1 => s_axi_wstrb(2),
      O => bus2ip_rnw_i_reg_2
    );
\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^bus2ip_rnw_i_reg_0\,
      I1 => s_axi_wstrb(1),
      O => bus2ip_rnw_i_reg_3
    );
\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^bus2ip_rnw_i_reg_0\,
      I1 => s_axi_wstrb(0),
      O => bus2ip_rnw_i_reg_4
    );
\bus2ip_addr_i[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(0),
      O => \bus2ip_addr_i[0]_i_1_n_0\
    );
\bus2ip_addr_i[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(10),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(10),
      O => \bus2ip_addr_i[10]_i_1_n_0\
    );
\bus2ip_addr_i[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(11),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(11),
      O => \bus2ip_addr_i[11]_i_1_n_0\
    );
\bus2ip_addr_i[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(12),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(12),
      O => \bus2ip_addr_i[12]_i_1_n_0\
    );
\bus2ip_addr_i[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(13),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(13),
      O => \bus2ip_addr_i[13]_i_1_n_0\
    );
\bus2ip_addr_i[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(14),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(14),
      O => \bus2ip_addr_i[14]_i_1_n_0\
    );
\bus2ip_addr_i[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(15),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(15),
      O => \bus2ip_addr_i[15]_i_1_n_0\
    );
\bus2ip_addr_i[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(16),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(16),
      O => \bus2ip_addr_i[16]_i_1_n_0\
    );
\bus2ip_addr_i[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(17),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(17),
      O => \bus2ip_addr_i[17]_i_1_n_0\
    );
\bus2ip_addr_i[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(18),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(18),
      O => \bus2ip_addr_i[18]_i_1_n_0\
    );
\bus2ip_addr_i[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(19),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(19),
      O => \bus2ip_addr_i[19]_i_1_n_0\
    );
\bus2ip_addr_i[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(1),
      O => \bus2ip_addr_i[1]_i_1_n_0\
    );
\bus2ip_addr_i[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(20),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(20),
      O => \bus2ip_addr_i[20]_i_1_n_0\
    );
\bus2ip_addr_i[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(21),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(21),
      O => \bus2ip_addr_i[21]_i_1_n_0\
    );
\bus2ip_addr_i[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(22),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(22),
      O => \bus2ip_addr_i[22]_i_1_n_0\
    );
\bus2ip_addr_i[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(23),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(23),
      O => \bus2ip_addr_i[23]_i_1_n_0\
    );
\bus2ip_addr_i[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(24),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(24),
      O => \bus2ip_addr_i[24]_i_1_n_0\
    );
\bus2ip_addr_i[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(25),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(25),
      O => \bus2ip_addr_i[25]_i_1_n_0\
    );
\bus2ip_addr_i[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(26),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(26),
      O => \bus2ip_addr_i[26]_i_1_n_0\
    );
\bus2ip_addr_i[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(27),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(27),
      O => \bus2ip_addr_i[27]_i_1_n_0\
    );
\bus2ip_addr_i[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(28),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(28),
      O => \bus2ip_addr_i[28]_i_1_n_0\
    );
\bus2ip_addr_i[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(29),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(29),
      O => \bus2ip_addr_i[29]_i_1_n_0\
    );
\bus2ip_addr_i[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(2),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(2),
      O => \bus2ip_addr_i[2]_i_1_n_0\
    );
\bus2ip_addr_i[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(30),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(30),
      O => \bus2ip_addr_i[30]_i_1_n_0\
    );
\bus2ip_addr_i[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA00"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => s_axi_awvalid,
      I2 => s_axi_wvalid,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      O => \bus2ip_addr_i[31]_i_1_n_0\
    );
\bus2ip_addr_i[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(31),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(31),
      O => \bus2ip_addr_i[31]_i_2_n_0\
    );
\bus2ip_addr_i[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(3),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(3),
      O => \bus2ip_addr_i[3]_i_1_n_0\
    );
\bus2ip_addr_i[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(4),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(4),
      O => \bus2ip_addr_i[4]_i_1_n_0\
    );
\bus2ip_addr_i[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(5),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(5),
      O => \bus2ip_addr_i[5]_i_1_n_0\
    );
\bus2ip_addr_i[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(6),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(6),
      O => \bus2ip_addr_i[6]_i_1_n_0\
    );
\bus2ip_addr_i[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(7),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(7),
      O => \bus2ip_addr_i[7]_i_1_n_0\
    );
\bus2ip_addr_i[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(8),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(8),
      O => \bus2ip_addr_i[8]_i_1_n_0\
    );
\bus2ip_addr_i[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(9),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(9),
      O => \bus2ip_addr_i[9]_i_1_n_0\
    );
\bus2ip_addr_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[0]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(0),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[10]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(10),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[11]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(11),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[12]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(12),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[13]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(13),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[14]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(14),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[15]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(15),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[16]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(16),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[17]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(17),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[18]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(18),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[19]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(19),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[1]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(1),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[20]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(20),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[21]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(21),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[22]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(22),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[23]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(23),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[24]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(24),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[25]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(25),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[26]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(26),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[27]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(27),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[28]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(28),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[29]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(29),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[2]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(2),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[30]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(30),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[31]_i_2_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(31),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[3]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(3),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[4]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(4),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[5]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(5),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[6]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(6),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[7]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(7),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[8]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(8),
      R => \^sr\(0)
    );
\bus2ip_addr_i_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => \bus2ip_addr_i[9]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg[31]_0\(9),
      R => \^sr\(0)
    );
bus2ip_rnw_i_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[31]_i_1_n_0\,
      D => s_axi_arvalid,
      Q => \^bus2ip_rnw_i_reg_0\,
      R => \^sr\(0)
    );
rst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => p_0_in
    );
rst_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_0_in,
      Q => \^sr\(0),
      R => '0'
    );
\s_axi_bresp_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_44,
      Q => \^s_axi_bresp\(0),
      R => \^sr\(0)
    );
s_axi_bvalid_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_43,
      Q => \^s_axi_bvalid_i_reg_0\,
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(0),
      Q => s_axi_rdata(0),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(10),
      Q => s_axi_rdata(10),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(11),
      Q => s_axi_rdata(11),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(12),
      Q => s_axi_rdata(12),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(13),
      Q => s_axi_rdata(13),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(14),
      Q => s_axi_rdata(14),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(15),
      Q => s_axi_rdata(15),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(16),
      Q => s_axi_rdata(16),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(17),
      Q => s_axi_rdata(17),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(18),
      Q => s_axi_rdata(18),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(19),
      Q => s_axi_rdata(19),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(1),
      Q => s_axi_rdata(1),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(20),
      Q => s_axi_rdata(20),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(21),
      Q => s_axi_rdata(21),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(22),
      Q => s_axi_rdata(22),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(23),
      Q => s_axi_rdata(23),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(24),
      Q => s_axi_rdata(24),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(25),
      Q => s_axi_rdata(25),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(26),
      Q => s_axi_rdata(26),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(27),
      Q => s_axi_rdata(27),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(28),
      Q => s_axi_rdata(28),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(29),
      Q => s_axi_rdata(29),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(2),
      Q => s_axi_rdata(2),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(30),
      Q => s_axi_rdata(30),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(31),
      Q => s_axi_rdata(31),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(3),
      Q => s_axi_rdata(3),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(4),
      Q => s_axi_rdata(4),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(5),
      Q => s_axi_rdata(5),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(6),
      Q => s_axi_rdata(6),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(7),
      Q => s_axi_rdata(7),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(8),
      Q => s_axi_rdata(8),
      R => \^sr\(0)
    );
\s_axi_rdata_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \ip2bus_data_int__0\(9),
      Q => s_axi_rdata(9),
      R => \^sr\(0)
    );
\s_axi_rresp_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => ip2bus_error,
      Q => s_axi_rresp(0),
      R => \^sr\(0)
    );
s_axi_rvalid_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_42,
      Q => \^s_axi_rvalid_i_reg_0\,
      R => \^sr\(0)
    );
start2_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F800"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => s_axi_wvalid,
      I2 => s_axi_arvalid,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      O => start2_i_1_n_0
    );
start2_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => start2_i_1_n_0,
      Q => start2,
      R => \^sr\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_cntl is
  port (
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : out STD_LOGIC;
    \SOME_DEV_ASYNC_GEN.REG_PRH_RDY_0\ : out STD_LOGIC;
    Asynch_chip_select : out STD_LOGIC;
    Asynch_Rd : out STD_LOGIC;
    Asynch_Wr : out STD_LOGIC;
    async_data_oe_i0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    ip2bus_error : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ : out STD_LOGIC;
    no_steer_async_ce : out STD_LOGIC_VECTOR ( 0 to 0 );
    bus2ip_reset_active_high : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    dev_rdy : in STD_LOGIC;
    bus2ip_cs : in STD_LOGIC;
    ce_out_i : in STD_LOGIC;
    \FSM_onehot_command_cs_reg[1]\ : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    Asynch_Wr_reg : in STD_LOGIC;
    bus2ip_rnw : in STD_LOGIC;
    dev_dbus_width : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_cntl;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_cntl is
  signal \LD_ARITH_REG_I_CNTR3/CE\ : STD_LOGIC;
  signal \LD_ARITH_REG_I_CNTR4/CE\ : STD_LOGIC;
  signal \LD_ARITH_REG_I_CNTR7/CE\ : STD_LOGIC;
  signal \LD_ARITH_REG_I_CNTR8/CE\ : STD_LOGIC;
  signal \LD_ARITH_REG_I_NON_MUXED_CNTR5/CE\ : STD_LOGIC;
  signal \LD_ARITH_REG_I_NON_MUXED_CNTR9/CE\ : STD_LOGIC;
  signal \^perbit_gen[0].ff_rst0_gen.fdre_i1\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_10\ : STD_LOGIC;
  signal \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_12\ : STD_LOGIC;
  signal \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_6\ : STD_LOGIC;
  signal \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_7\ : STD_LOGIC;
  signal \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_8\ : STD_LOGIC;
  signal \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_9\ : STD_LOGIC;
  signal \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_11\ : STD_LOGIC;
  signal \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_12\ : STD_LOGIC;
  signal \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_13\ : STD_LOGIC;
  signal \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_14\ : STD_LOGIC;
  signal \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_16\ : STD_LOGIC;
  signal \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_17\ : STD_LOGIC;
  signal \^some_dev_async_gen.reg_prh_rdy_0\ : STD_LOGIC;
  signal async_en : STD_LOGIC;
  signal taddr_data_cs_hold_cnt : STD_LOGIC;
  signal tads_cnt : STD_LOGIC;
  signal tads_ld_ce_i : STD_LOGIC;
  signal tcontrol_wdth_cnt : STD_LOGIC;
  signal tdata_hold_ld_ce_i : STD_LOGIC;
  signal tdev_rdy_ld_ce_i : STD_LOGIC;
  signal tdev_valid_ld_ce_i : STD_LOGIC;
  signal trd_non_muxed_rec_cnt : STD_LOGIC;
  signal trd_non_muxed_recovery_load_ce_i : STD_LOGIC;
  signal twr_non_muxed_rec_cnt : STD_LOGIC;
  signal twr_non_muxed_recovery_load_ce_i : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \SOME_DEV_ASYNC_GEN.REG_PRH_RDY\ : label is std.standard.true;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \SOME_DEV_ASYNC_GEN.REG_PRH_RDY\ : label is "PRIMITIVE";
begin
  \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ <= \^perbit_gen[0].ff_rst0_gen.fdre_i1\;
  Q(0) <= \^q\(0);
  \SOME_DEV_ASYNC_GEN.REG_PRH_RDY_0\ <= \^some_dev_async_gen.reg_prh_rdy_0\;
\SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_counters
     port map (
      Bus_RNW_reg => Bus_RNW_reg,
      CE => \LD_ARITH_REG_I_CNTR3/CE\,
      CE_0 => \LD_ARITH_REG_I_CNTR4/CE\,
      CE_1 => \LD_ARITH_REG_I_CNTR7/CE\,
      CE_2 => \LD_ARITH_REG_I_CNTR8/CE\,
      CE_3 => \LD_ARITH_REG_I_NON_MUXED_CNTR5/CE\,
      CE_4 => \LD_ARITH_REG_I_NON_MUXED_CNTR9/CE\,
      D(4) => \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_6\,
      D(3) => \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_7\,
      D(2) => \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_8\,
      D(1) => \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_9\,
      D(0) => \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_10\,
      \FSM_onehot_command_cs_reg[4]\ => \^some_dev_async_gen.reg_prh_rdy_0\,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ => \^perbit_gen[0].ff_rst0_gen.fdre_i1\,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ => \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1\ => \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_12\,
      Q(6) => \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_11\,
      Q(5) => \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_12\,
      Q(4) => \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_13\,
      Q(3) => \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_14\,
      Q(2) => \^q\(0),
      Q(1) => \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_16\,
      Q(0) => \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_17\,
      Trd_non_muxed_recovery_load_ce_reg => Asynch_Wr_reg,
      async_en => async_en,
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      ce_out_i => ce_out_i,
      s_axi_aclk => s_axi_aclk,
      taddr_data_cs_hold_cnt => taddr_data_cs_hold_cnt,
      tads_cnt => tads_cnt,
      tads_ld_ce_i => tads_ld_ce_i,
      tcontrol_wdth_cnt => tcontrol_wdth_cnt,
      tdata_hold_ld_ce_i => tdata_hold_ld_ce_i,
      tdev_rdy_ld_ce_i => tdev_rdy_ld_ce_i,
      tdev_valid_ld_ce_i => tdev_valid_ld_ce_i,
      trd_non_muxed_rec_cnt => trd_non_muxed_rec_cnt,
      trd_non_muxed_recovery_load_ce_i => trd_non_muxed_recovery_load_ce_i,
      twr_non_muxed_rec_cnt => twr_non_muxed_rec_cnt,
      twr_non_muxed_recovery_load_ce_i => twr_non_muxed_recovery_load_ce_i
    );
\SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_statemachine
     port map (
      Asynch_Rd => Asynch_Rd,
      Asynch_Wr => Asynch_Wr,
      Asynch_Wr_reg_0 => Asynch_Wr_reg,
      Asynch_chip_select => Asynch_chip_select,
      \Asynch_chip_select_reg[0]_0\ => \^some_dev_async_gen.reg_prh_rdy_0\,
      \Asynch_chip_select_reg[0]_1\ => \^perbit_gen[0].ff_rst0_gen.fdre_i1\,
      Bus_RNW_reg => Bus_RNW_reg,
      CE => \LD_ARITH_REG_I_NON_MUXED_CNTR9/CE\,
      CE_0 => \LD_ARITH_REG_I_NON_MUXED_CNTR5/CE\,
      CE_1 => \LD_ARITH_REG_I_CNTR8/CE\,
      CE_2 => \LD_ARITH_REG_I_CNTR7/CE\,
      CE_3 => \LD_ARITH_REG_I_CNTR3/CE\,
      CE_4 => \LD_ARITH_REG_I_CNTR4/CE\,
      D(4) => \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_6\,
      D(3) => \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_7\,
      D(2) => \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_8\,
      D(1) => \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_9\,
      D(0) => \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_10\,
      \FSM_onehot_command_cs_reg[0]_0\ => \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_12\,
      \FSM_onehot_command_cs_reg[1]_0\ => \FSM_onehot_command_cs_reg[1]\,
      Q(6) => \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_11\,
      Q(5) => \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_12\,
      Q(4) => \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_13\,
      Q(3) => \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_14\,
      Q(2) => \^q\(0),
      Q(1) => \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_16\,
      Q(0) => \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_17\,
      async_data_oe_i0 => async_data_oe_i0,
      async_en => async_en,
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      bus2ip_rnw => bus2ip_rnw,
      ce_out_i => ce_out_i,
      dev_dbus_width(0) => dev_dbus_width(0),
      ip2bus_error => ip2bus_error,
      no_steer_async_ce(0) => no_steer_async_ce(0),
      s_axi_aclk => s_axi_aclk,
      taddr_data_cs_hold_cnt => taddr_data_cs_hold_cnt,
      tads_cnt => tads_cnt,
      tads_ld_ce_i => tads_ld_ce_i,
      tcontrol_wdth_cnt => tcontrol_wdth_cnt,
      tdata_hold_ld_ce_i => tdata_hold_ld_ce_i,
      tdev_rdy_ld_ce_i => tdev_rdy_ld_ce_i,
      tdev_valid_ld_ce_i => tdev_valid_ld_ce_i,
      trd_non_muxed_rec_cnt => trd_non_muxed_rec_cnt,
      trd_non_muxed_recovery_load_ce_i => trd_non_muxed_recovery_load_ce_i,
      twr_non_muxed_rec_cnt => twr_non_muxed_rec_cnt,
      twr_non_muxed_recovery_load_ce_i => twr_non_muxed_recovery_load_ce_i
    );
\SOME_DEV_ASYNC_GEN.REG_PRH_RDY\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => dev_rdy,
      Q => \^some_dev_async_gen.reg_prh_rdy_0\,
      R => bus2ip_reset_active_high
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif is
  port (
    bus2ip_reset_active_high : out STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    bus2ip_rnw : out STD_LOGIC;
    bus2ip_cs : out STD_LOGIC;
    Bus_RNW_reg : out STD_LOGIC;
    ce_out_i : out STD_LOGIC;
    s_axi_rvalid_i_reg : out STD_LOGIC;
    s_axi_bvalid_i_reg : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    ip_async_Wrack_d10 : out STD_LOGIC;
    bus2ip_rnw_i_reg : out STD_LOGIC;
    bus2ip_rnw_i_reg_0 : out STD_LOGIC;
    bus2ip_rnw_i_reg_1 : out STD_LOGIC;
    bus2ip_rnw_i_reg_2 : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \bus2ip_addr_i_reg[31]\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    ip2bus_error : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    ipic_async_req : in STD_LOGIC;
    s_axi_rvalid_i_reg_0 : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    ip2bus_data_int : in STD_LOGIC_VECTOR ( 30 downto 0 );
    Q_0 : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    asynch_prh_rdy_d1 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    tdevrdy_wdth_cnt : in STD_LOGIC;
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif is
begin
I_SLAVE_ATTACHMENT: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment
     port map (
      Bus_RNW_reg_reg => Bus_RNW_reg,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ => ce_out_i,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ => bus2ip_cs,
      Q(0) => Q(0),
      Q_0 => Q_0,
      SR(0) => bus2ip_reset_active_high,
      asynch_prh_rdy_d1 => asynch_prh_rdy_d1,
      \bus2ip_addr_i_reg[31]_0\(31 downto 0) => \bus2ip_addr_i_reg[31]\(31 downto 0),
      bus2ip_rnw_i_reg_0 => bus2ip_rnw,
      bus2ip_rnw_i_reg_1 => bus2ip_rnw_i_reg,
      bus2ip_rnw_i_reg_2 => bus2ip_rnw_i_reg_0,
      bus2ip_rnw_i_reg_3 => bus2ip_rnw_i_reg_1,
      bus2ip_rnw_i_reg_4 => bus2ip_rnw_i_reg_2,
      ip2bus_data_int(30 downto 0) => ip2bus_data_int(30 downto 0),
      ip2bus_error => ip2bus_error,
      ip_async_Wrack_d10 => ip_async_Wrack_d10,
      ipic_async_req => ipic_async_req,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => s_axi_bresp(0),
      s_axi_bvalid_i_reg_0 => s_axi_bvalid_i_reg,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => s_axi_rresp(0),
      s_axi_rvalid_i_reg_0 => s_axi_rvalid_i_reg,
      s_axi_rvalid_i_reg_1 => s_axi_rvalid_i_reg_0,
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      tdevrdy_wdth_cnt => tdevrdy_wdth_cnt
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_epc_core is
  port (
    tdevrdy_wdth_cnt : out STD_LOGIC;
    asynch_prh_rdy_d1 : out STD_LOGIC;
    Q_0 : out STD_LOGIC;
    ip2bus_data_int : out STD_LOGIC_VECTOR ( 30 downto 0 );
    prh_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    prh_rd_n : out STD_LOGIC;
    prh_wr_n : out STD_LOGIC;
    prh_data_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    ipic_async_req : out STD_LOGIC;
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    ip2bus_error : out STD_LOGIC;
    prh_be : out STD_LOGIC_VECTOR ( 0 to 3 );
    prh_addr : out STD_LOGIC_VECTOR ( 0 to 31 );
    prh_data_o : out STD_LOGIC_VECTOR ( 0 to 31 );
    bus2ip_reset_active_high : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    prh_data_i : in STD_LOGIC_VECTOR ( 0 to 31 );
    bus2ip_cs : in STD_LOGIC;
    ip_async_Wrack_d10 : in STD_LOGIC;
    s_axi_arready : in STD_LOGIC;
    s_axi_wready : in STD_LOGIC;
    ce_out_i : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    Asynch_Wr_reg : in STD_LOGIC;
    bus2ip_rnw : in STD_LOGIC;
    prh_rdy : in STD_LOGIC_VECTOR ( 0 to 0 );
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0]\ : in STD_LOGIC;
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1]\ : in STD_LOGIC;
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2]\ : in STD_LOGIC;
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3]\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_epc_core;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_epc_core is
  signal Asynch_Rd : STD_LOGIC;
  signal Asynch_Wr : STD_LOGIC;
  signal Asynch_chip_select : STD_LOGIC;
  signal DATA_STEER_I_n_36 : STD_LOGIC;
  signal \^perbit_gen[0].ff_rst0_gen.fdre_i1\ : STD_LOGIC;
  signal async_data_oe_i0 : STD_LOGIC;
  signal dev_dbus_width : STD_LOGIC_VECTOR ( 0 to 0 );
  signal dev_rdy : STD_LOGIC;
  signal \^ipic_async_req\ : STD_LOGIC;
  signal no_steer_async_ce : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ <= \^perbit_gen[0].ff_rst0_gen.fdre_i1\;
  ipic_async_req <= \^ipic_async_req\;
ACCESS_MUX_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_access_mux
     port map (
      Asynch_Rd => Asynch_Rd,
      Asynch_Wr => Asynch_Wr,
      Asynch_chip_select => Asynch_chip_select,
      D(31 downto 0) => D(31 downto 0),
      \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0\ => DATA_STEER_I_n_36,
      async_data_oe_i0 => async_data_oe_i0,
      prh_addr(0 to 31) => prh_addr(0 to 31),
      prh_cs_n(0) => prh_cs_n(0),
      prh_data_o(0 to 31) => prh_data_o(0 to 31),
      prh_data_t(0) => prh_data_t(0),
      prh_rd_n => prh_rd_n,
      prh_wr_n => prh_wr_n,
      s_axi_aclk => s_axi_aclk,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0)
    );
ASYNC_CNTL_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_cntl
     port map (
      Asynch_Rd => Asynch_Rd,
      Asynch_Wr => Asynch_Wr,
      Asynch_Wr_reg => Asynch_Wr_reg,
      Asynch_chip_select => Asynch_chip_select,
      Bus_RNW_reg => Bus_RNW_reg,
      \FSM_onehot_command_cs_reg[1]\ => \^ipic_async_req\,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ => tdevrdy_wdth_cnt,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0\ => \^perbit_gen[0].ff_rst0_gen.fdre_i1\,
      Q(0) => Q(0),
      \SOME_DEV_ASYNC_GEN.REG_PRH_RDY_0\ => asynch_prh_rdy_d1,
      async_data_oe_i0 => async_data_oe_i0,
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      bus2ip_rnw => bus2ip_rnw,
      ce_out_i => ce_out_i,
      dev_dbus_width(0) => dev_dbus_width(0),
      dev_rdy => dev_rdy,
      ip2bus_error => ip2bus_error,
      no_steer_async_ce(0) => no_steer_async_ce(0),
      s_axi_aclk => s_axi_aclk
    );
DATA_STEER_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_data_steer
     port map (
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]\ => DATA_STEER_I_n_36,
      \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0]_0\ => \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0]\,
      \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1]_0\ => \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1]\,
      \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2]_0\ => \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2]\,
      \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3]_0\ => \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3]\,
      Q_0 => Q_0,
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      ip2bus_data_int(30 downto 0) => ip2bus_data_int(30 downto 0),
      no_steer_async_ce(0) => no_steer_async_ce(0),
      prh_be(0 to 3) => prh_be(0 to 3),
      prh_data_i(0 to 31) => prh_data_i(0 to 31),
      s_axi_aclk => s_axi_aclk
    );
IPIC_DECODE_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ipic_if_decode
     port map (
      \ASYNC_REQ_GEN.local_async_req_reg_0\ => \^ipic_async_req\,
      \ASYNC_REQ_GEN.local_async_req_reg_1\ => \^perbit_gen[0].ff_rst0_gen.fdre_i1\,
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      ce_out_i => ce_out_i,
      dev_dbus_width(0) => dev_dbus_width(0),
      dev_rdy => dev_rdy,
      ip_async_Wrack_d10 => ip_async_Wrack_d10,
      prh_rdy(0) => prh_rdy(0),
      s_axi_aclk => s_axi_aclk,
      s_axi_arready => s_axi_arready,
      s_axi_wready => s_axi_wready
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc is
  port (
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
  attribute C_FAMILY : string;
  attribute C_FAMILY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is "zynq";
  attribute C_INSTANCE : string;
  attribute C_INSTANCE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is "axi_epc_inst";
  attribute C_NUM_PERIPHERALS : integer;
  attribute C_NUM_PERIPHERALS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 1;
  attribute C_PRH0_ADDR_TH : integer;
  attribute C_PRH0_ADDR_TH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_ADDR_TSU : integer;
  attribute C_PRH0_ADDR_TSU of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_ADS_WIDTH : integer;
  attribute C_PRH0_ADS_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_AWIDTH : integer;
  attribute C_PRH0_AWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 32;
  attribute C_PRH0_BASEADDR : integer;
  attribute C_PRH0_BASEADDR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is -1610547201;
  attribute C_PRH0_BUS_MULTIPLEX : integer;
  attribute C_PRH0_BUS_MULTIPLEX of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_CSN_TH : integer;
  attribute C_PRH0_CSN_TH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_CSN_TSU : integer;
  attribute C_PRH0_CSN_TSU of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_DATA_TH : integer;
  attribute C_PRH0_DATA_TH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_DATA_TINV : integer;
  attribute C_PRH0_DATA_TINV of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_DATA_TOUT : integer;
  attribute C_PRH0_DATA_TOUT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_DATA_TSU : integer;
  attribute C_PRH0_DATA_TSU of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_DWIDTH : integer;
  attribute C_PRH0_DWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 32;
  attribute C_PRH0_DWIDTH_MATCH : integer;
  attribute C_PRH0_DWIDTH_MATCH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_FIFO_ACCESS : integer;
  attribute C_PRH0_FIFO_ACCESS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_FIFO_OFFSET : integer;
  attribute C_PRH0_FIFO_OFFSET of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_HIGHADDR : integer;
  attribute C_PRH0_HIGHADDR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is -1342177281;
  attribute C_PRH0_RDN_WIDTH : integer;
  attribute C_PRH0_RDN_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_RDY_TOUT : integer;
  attribute C_PRH0_RDY_TOUT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_RDY_WIDTH : integer;
  attribute C_PRH0_RDY_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_RD_CYCLE : integer;
  attribute C_PRH0_RD_CYCLE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_SYNC : integer;
  attribute C_PRH0_SYNC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_WRN_WIDTH : integer;
  attribute C_PRH0_WRN_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH0_WR_CYCLE : integer;
  attribute C_PRH0_WR_CYCLE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_ADDR_TH : integer;
  attribute C_PRH1_ADDR_TH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_ADDR_TSU : integer;
  attribute C_PRH1_ADDR_TSU of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_ADS_WIDTH : integer;
  attribute C_PRH1_ADS_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_AWIDTH : integer;
  attribute C_PRH1_AWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 32;
  attribute C_PRH1_BASEADDR : integer;
  attribute C_PRH1_BASEADDR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is -1342111745;
  attribute C_PRH1_BUS_MULTIPLEX : integer;
  attribute C_PRH1_BUS_MULTIPLEX of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_CSN_TH : integer;
  attribute C_PRH1_CSN_TH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_CSN_TSU : integer;
  attribute C_PRH1_CSN_TSU of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_DATA_TH : integer;
  attribute C_PRH1_DATA_TH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_DATA_TINV : integer;
  attribute C_PRH1_DATA_TINV of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_DATA_TOUT : integer;
  attribute C_PRH1_DATA_TOUT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_DATA_TSU : integer;
  attribute C_PRH1_DATA_TSU of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_DWIDTH : integer;
  attribute C_PRH1_DWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 32;
  attribute C_PRH1_DWIDTH_MATCH : integer;
  attribute C_PRH1_DWIDTH_MATCH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_FIFO_ACCESS : integer;
  attribute C_PRH1_FIFO_ACCESS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_FIFO_OFFSET : integer;
  attribute C_PRH1_FIFO_OFFSET of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_HIGHADDR : integer;
  attribute C_PRH1_HIGHADDR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is -1073741825;
  attribute C_PRH1_RDN_WIDTH : integer;
  attribute C_PRH1_RDN_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_RDY_TOUT : integer;
  attribute C_PRH1_RDY_TOUT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_RDY_WIDTH : integer;
  attribute C_PRH1_RDY_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_RD_CYCLE : integer;
  attribute C_PRH1_RD_CYCLE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_SYNC : integer;
  attribute C_PRH1_SYNC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_WRN_WIDTH : integer;
  attribute C_PRH1_WRN_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH1_WR_CYCLE : integer;
  attribute C_PRH1_WR_CYCLE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_ADDR_TH : integer;
  attribute C_PRH2_ADDR_TH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_ADDR_TSU : integer;
  attribute C_PRH2_ADDR_TSU of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_ADS_WIDTH : integer;
  attribute C_PRH2_ADS_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_AWIDTH : integer;
  attribute C_PRH2_AWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 32;
  attribute C_PRH2_BASEADDR : integer;
  attribute C_PRH2_BASEADDR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is -1073676289;
  attribute C_PRH2_BUS_MULTIPLEX : integer;
  attribute C_PRH2_BUS_MULTIPLEX of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_CSN_TH : integer;
  attribute C_PRH2_CSN_TH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_CSN_TSU : integer;
  attribute C_PRH2_CSN_TSU of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_DATA_TH : integer;
  attribute C_PRH2_DATA_TH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_DATA_TINV : integer;
  attribute C_PRH2_DATA_TINV of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_DATA_TOUT : integer;
  attribute C_PRH2_DATA_TOUT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_DATA_TSU : integer;
  attribute C_PRH2_DATA_TSU of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_DWIDTH : integer;
  attribute C_PRH2_DWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 32;
  attribute C_PRH2_DWIDTH_MATCH : integer;
  attribute C_PRH2_DWIDTH_MATCH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_FIFO_ACCESS : integer;
  attribute C_PRH2_FIFO_ACCESS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_FIFO_OFFSET : integer;
  attribute C_PRH2_FIFO_OFFSET of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_HIGHADDR : integer;
  attribute C_PRH2_HIGHADDR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is -805306369;
  attribute C_PRH2_RDN_WIDTH : integer;
  attribute C_PRH2_RDN_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_RDY_TOUT : integer;
  attribute C_PRH2_RDY_TOUT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_RDY_WIDTH : integer;
  attribute C_PRH2_RDY_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_RD_CYCLE : integer;
  attribute C_PRH2_RD_CYCLE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_SYNC : integer;
  attribute C_PRH2_SYNC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_WRN_WIDTH : integer;
  attribute C_PRH2_WRN_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH2_WR_CYCLE : integer;
  attribute C_PRH2_WR_CYCLE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_ADDR_TH : integer;
  attribute C_PRH3_ADDR_TH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_ADDR_TSU : integer;
  attribute C_PRH3_ADDR_TSU of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_ADS_WIDTH : integer;
  attribute C_PRH3_ADS_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_AWIDTH : integer;
  attribute C_PRH3_AWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 32;
  attribute C_PRH3_BASEADDR : integer;
  attribute C_PRH3_BASEADDR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is -805240833;
  attribute C_PRH3_BUS_MULTIPLEX : integer;
  attribute C_PRH3_BUS_MULTIPLEX of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_CSN_TH : integer;
  attribute C_PRH3_CSN_TH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_CSN_TSU : integer;
  attribute C_PRH3_CSN_TSU of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_DATA_TH : integer;
  attribute C_PRH3_DATA_TH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_DATA_TINV : integer;
  attribute C_PRH3_DATA_TINV of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_DATA_TOUT : integer;
  attribute C_PRH3_DATA_TOUT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_DATA_TSU : integer;
  attribute C_PRH3_DATA_TSU of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_DWIDTH : integer;
  attribute C_PRH3_DWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 32;
  attribute C_PRH3_DWIDTH_MATCH : integer;
  attribute C_PRH3_DWIDTH_MATCH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_FIFO_ACCESS : integer;
  attribute C_PRH3_FIFO_ACCESS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_FIFO_OFFSET : integer;
  attribute C_PRH3_FIFO_OFFSET of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_HIGHADDR : integer;
  attribute C_PRH3_HIGHADDR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is -536870913;
  attribute C_PRH3_RDN_WIDTH : integer;
  attribute C_PRH3_RDN_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_RDY_TOUT : integer;
  attribute C_PRH3_RDY_TOUT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_RDY_WIDTH : integer;
  attribute C_PRH3_RDY_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_RD_CYCLE : integer;
  attribute C_PRH3_RD_CYCLE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_SYNC : integer;
  attribute C_PRH3_SYNC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_WRN_WIDTH : integer;
  attribute C_PRH3_WRN_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH3_WR_CYCLE : integer;
  attribute C_PRH3_WR_CYCLE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH_BURST_SUPPORT : integer;
  attribute C_PRH_BURST_SUPPORT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH_CLK_PERIOD_PS : integer;
  attribute C_PRH_CLK_PERIOD_PS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 20000;
  attribute C_PRH_CLK_SUPPORT : integer;
  attribute C_PRH_CLK_SUPPORT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 0;
  attribute C_PRH_MAX_ADWIDTH : integer;
  attribute C_PRH_MAX_ADWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 32;
  attribute C_PRH_MAX_AWIDTH : integer;
  attribute C_PRH_MAX_AWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 32;
  attribute C_PRH_MAX_DWIDTH : integer;
  attribute C_PRH_MAX_DWIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 32;
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 32;
  attribute C_S_AXI_CLK_PERIOD_PS : integer;
  attribute C_S_AXI_CLK_PERIOD_PS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 10000;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc : entity is 32;
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \ASYNC_CNTL_I/asynch_prh_rdy_d1\ : STD_LOGIC;
  signal \ASYNC_CNTL_I/tdevrdy_wdth_cnt\ : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_13 : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_14 : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_15 : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_16 : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_9 : STD_LOGIC;
  signal \DATA_STEER_I/Q\ : STD_LOGIC;
  signal \DATA_STEER_I/ip2bus_data_int\ : STD_LOGIC_VECTOR ( 1 to 31 );
  signal EPC_CORE_I_n_39 : STD_LOGIC;
  signal EPC_CORE_I_n_40 : STD_LOGIC;
  signal \IPIC_DECODE_I/ip_async_Wrack_d10\ : STD_LOGIC;
  signal \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg\ : STD_LOGIC;
  signal \I_SLAVE_ATTACHMENT/I_DECODER/ce_out_i\ : STD_LOGIC;
  signal bus2ip_addr_i : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal bus2ip_cs : STD_LOGIC;
  signal bus2ip_reset_active_high : STD_LOGIC;
  signal bus2ip_rnw : STD_LOGIC;
  signal ip2bus_error : STD_LOGIC;
  signal ipic_async_req : STD_LOGIC;
  signal \^prh_data_t\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_rresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_wready\ : STD_LOGIC;
  attribute sigis : string;
  attribute sigis of prh_clk : signal is "Clk";
  attribute sigis of prh_rst : signal is "Rst";
  attribute sigis of s_axi_aclk : signal is "Clk";
  attribute sigis of s_axi_aresetn : signal is "Rst";
begin
  prh_ads <= \<const0>\;
  prh_burst <= \<const0>\;
  prh_data_t(0) <= \^prh_data_t\(1);
  prh_data_t(1) <= \^prh_data_t\(1);
  prh_data_t(2) <= \^prh_data_t\(1);
  prh_data_t(3) <= \^prh_data_t\(1);
  prh_data_t(4) <= \^prh_data_t\(1);
  prh_data_t(5) <= \^prh_data_t\(1);
  prh_data_t(6) <= \^prh_data_t\(1);
  prh_data_t(7) <= \^prh_data_t\(1);
  prh_data_t(8) <= \^prh_data_t\(1);
  prh_data_t(9) <= \^prh_data_t\(1);
  prh_data_t(10) <= \^prh_data_t\(1);
  prh_data_t(11) <= \^prh_data_t\(1);
  prh_data_t(12) <= \^prh_data_t\(1);
  prh_data_t(13) <= \^prh_data_t\(1);
  prh_data_t(14) <= \^prh_data_t\(1);
  prh_data_t(15) <= \^prh_data_t\(1);
  prh_data_t(16) <= \^prh_data_t\(1);
  prh_data_t(17) <= \^prh_data_t\(1);
  prh_data_t(18) <= \^prh_data_t\(1);
  prh_data_t(19) <= \^prh_data_t\(1);
  prh_data_t(20) <= \^prh_data_t\(1);
  prh_data_t(21) <= \^prh_data_t\(1);
  prh_data_t(22) <= \^prh_data_t\(1);
  prh_data_t(23) <= \^prh_data_t\(1);
  prh_data_t(24) <= \^prh_data_t\(1);
  prh_data_t(25) <= \^prh_data_t\(1);
  prh_data_t(26) <= \^prh_data_t\(1);
  prh_data_t(27) <= \^prh_data_t\(1);
  prh_data_t(28) <= \^prh_data_t\(1);
  prh_data_t(29) <= \^prh_data_t\(1);
  prh_data_t(30) <= \^prh_data_t\(1);
  prh_data_t(31) <= \^prh_data_t\(1);
  prh_rnw <= \<const1>\;
  s_axi_arready <= \^s_axi_arready\;
  s_axi_awready <= \^s_axi_wready\;
  s_axi_bresp(1) <= \^s_axi_bresp\(1);
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rresp(1) <= \^s_axi_rresp\(1);
  s_axi_rresp(0) <= \<const0>\;
  s_axi_wready <= \^s_axi_wready\;
AXI_LITE_IPIF_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif
     port map (
      Bus_RNW_reg => \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ => AXI_LITE_IPIF_I_n_9,
      Q(0) => EPC_CORE_I_n_40,
      Q_0 => \DATA_STEER_I/Q\,
      asynch_prh_rdy_d1 => \ASYNC_CNTL_I/asynch_prh_rdy_d1\,
      \bus2ip_addr_i_reg[31]\(31 downto 0) => bus2ip_addr_i(31 downto 0),
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      bus2ip_rnw => bus2ip_rnw,
      bus2ip_rnw_i_reg => AXI_LITE_IPIF_I_n_13,
      bus2ip_rnw_i_reg_0 => AXI_LITE_IPIF_I_n_14,
      bus2ip_rnw_i_reg_1 => AXI_LITE_IPIF_I_n_15,
      bus2ip_rnw_i_reg_2 => AXI_LITE_IPIF_I_n_16,
      ce_out_i => \I_SLAVE_ATTACHMENT/I_DECODER/ce_out_i\,
      ip2bus_data_int(30) => \DATA_STEER_I/ip2bus_data_int\(1),
      ip2bus_data_int(29) => \DATA_STEER_I/ip2bus_data_int\(2),
      ip2bus_data_int(28) => \DATA_STEER_I/ip2bus_data_int\(3),
      ip2bus_data_int(27) => \DATA_STEER_I/ip2bus_data_int\(4),
      ip2bus_data_int(26) => \DATA_STEER_I/ip2bus_data_int\(5),
      ip2bus_data_int(25) => \DATA_STEER_I/ip2bus_data_int\(6),
      ip2bus_data_int(24) => \DATA_STEER_I/ip2bus_data_int\(7),
      ip2bus_data_int(23) => \DATA_STEER_I/ip2bus_data_int\(8),
      ip2bus_data_int(22) => \DATA_STEER_I/ip2bus_data_int\(9),
      ip2bus_data_int(21) => \DATA_STEER_I/ip2bus_data_int\(10),
      ip2bus_data_int(20) => \DATA_STEER_I/ip2bus_data_int\(11),
      ip2bus_data_int(19) => \DATA_STEER_I/ip2bus_data_int\(12),
      ip2bus_data_int(18) => \DATA_STEER_I/ip2bus_data_int\(13),
      ip2bus_data_int(17) => \DATA_STEER_I/ip2bus_data_int\(14),
      ip2bus_data_int(16) => \DATA_STEER_I/ip2bus_data_int\(15),
      ip2bus_data_int(15) => \DATA_STEER_I/ip2bus_data_int\(16),
      ip2bus_data_int(14) => \DATA_STEER_I/ip2bus_data_int\(17),
      ip2bus_data_int(13) => \DATA_STEER_I/ip2bus_data_int\(18),
      ip2bus_data_int(12) => \DATA_STEER_I/ip2bus_data_int\(19),
      ip2bus_data_int(11) => \DATA_STEER_I/ip2bus_data_int\(20),
      ip2bus_data_int(10) => \DATA_STEER_I/ip2bus_data_int\(21),
      ip2bus_data_int(9) => \DATA_STEER_I/ip2bus_data_int\(22),
      ip2bus_data_int(8) => \DATA_STEER_I/ip2bus_data_int\(23),
      ip2bus_data_int(7) => \DATA_STEER_I/ip2bus_data_int\(24),
      ip2bus_data_int(6) => \DATA_STEER_I/ip2bus_data_int\(25),
      ip2bus_data_int(5) => \DATA_STEER_I/ip2bus_data_int\(26),
      ip2bus_data_int(4) => \DATA_STEER_I/ip2bus_data_int\(27),
      ip2bus_data_int(3) => \DATA_STEER_I/ip2bus_data_int\(28),
      ip2bus_data_int(2) => \DATA_STEER_I/ip2bus_data_int\(29),
      ip2bus_data_int(1) => \DATA_STEER_I/ip2bus_data_int\(30),
      ip2bus_data_int(0) => \DATA_STEER_I/ip2bus_data_int\(31),
      ip2bus_error => ip2bus_error,
      ip_async_Wrack_d10 => \IPIC_DECODE_I/ip_async_Wrack_d10\,
      ipic_async_req => ipic_async_req,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => \^s_axi_arready\,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => \^s_axi_bresp\(1),
      s_axi_bvalid_i_reg => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => \^s_axi_rresp\(1),
      s_axi_rvalid_i_reg => s_axi_rvalid,
      s_axi_rvalid_i_reg_0 => EPC_CORE_I_n_39,
      s_axi_wready => \^s_axi_wready\,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      tdevrdy_wdth_cnt => \ASYNC_CNTL_I/tdevrdy_wdth_cnt\
    );
EPC_CORE_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_epc_core
     port map (
      Asynch_Wr_reg => AXI_LITE_IPIF_I_n_9,
      Bus_RNW_reg => \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg\,
      D(31 downto 0) => bus2ip_addr_i(31 downto 0),
      \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0]\ => AXI_LITE_IPIF_I_n_13,
      \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1]\ => AXI_LITE_IPIF_I_n_14,
      \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2]\ => AXI_LITE_IPIF_I_n_15,
      \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3]\ => AXI_LITE_IPIF_I_n_16,
      \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1\ => EPC_CORE_I_n_39,
      Q(0) => EPC_CORE_I_n_40,
      Q_0 => \DATA_STEER_I/Q\,
      asynch_prh_rdy_d1 => \ASYNC_CNTL_I/asynch_prh_rdy_d1\,
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset_active_high => bus2ip_reset_active_high,
      bus2ip_rnw => bus2ip_rnw,
      ce_out_i => \I_SLAVE_ATTACHMENT/I_DECODER/ce_out_i\,
      ip2bus_data_int(30) => \DATA_STEER_I/ip2bus_data_int\(1),
      ip2bus_data_int(29) => \DATA_STEER_I/ip2bus_data_int\(2),
      ip2bus_data_int(28) => \DATA_STEER_I/ip2bus_data_int\(3),
      ip2bus_data_int(27) => \DATA_STEER_I/ip2bus_data_int\(4),
      ip2bus_data_int(26) => \DATA_STEER_I/ip2bus_data_int\(5),
      ip2bus_data_int(25) => \DATA_STEER_I/ip2bus_data_int\(6),
      ip2bus_data_int(24) => \DATA_STEER_I/ip2bus_data_int\(7),
      ip2bus_data_int(23) => \DATA_STEER_I/ip2bus_data_int\(8),
      ip2bus_data_int(22) => \DATA_STEER_I/ip2bus_data_int\(9),
      ip2bus_data_int(21) => \DATA_STEER_I/ip2bus_data_int\(10),
      ip2bus_data_int(20) => \DATA_STEER_I/ip2bus_data_int\(11),
      ip2bus_data_int(19) => \DATA_STEER_I/ip2bus_data_int\(12),
      ip2bus_data_int(18) => \DATA_STEER_I/ip2bus_data_int\(13),
      ip2bus_data_int(17) => \DATA_STEER_I/ip2bus_data_int\(14),
      ip2bus_data_int(16) => \DATA_STEER_I/ip2bus_data_int\(15),
      ip2bus_data_int(15) => \DATA_STEER_I/ip2bus_data_int\(16),
      ip2bus_data_int(14) => \DATA_STEER_I/ip2bus_data_int\(17),
      ip2bus_data_int(13) => \DATA_STEER_I/ip2bus_data_int\(18),
      ip2bus_data_int(12) => \DATA_STEER_I/ip2bus_data_int\(19),
      ip2bus_data_int(11) => \DATA_STEER_I/ip2bus_data_int\(20),
      ip2bus_data_int(10) => \DATA_STEER_I/ip2bus_data_int\(21),
      ip2bus_data_int(9) => \DATA_STEER_I/ip2bus_data_int\(22),
      ip2bus_data_int(8) => \DATA_STEER_I/ip2bus_data_int\(23),
      ip2bus_data_int(7) => \DATA_STEER_I/ip2bus_data_int\(24),
      ip2bus_data_int(6) => \DATA_STEER_I/ip2bus_data_int\(25),
      ip2bus_data_int(5) => \DATA_STEER_I/ip2bus_data_int\(26),
      ip2bus_data_int(4) => \DATA_STEER_I/ip2bus_data_int\(27),
      ip2bus_data_int(3) => \DATA_STEER_I/ip2bus_data_int\(28),
      ip2bus_data_int(2) => \DATA_STEER_I/ip2bus_data_int\(29),
      ip2bus_data_int(1) => \DATA_STEER_I/ip2bus_data_int\(30),
      ip2bus_data_int(0) => \DATA_STEER_I/ip2bus_data_int\(31),
      ip2bus_error => ip2bus_error,
      ip_async_Wrack_d10 => \IPIC_DECODE_I/ip_async_Wrack_d10\,
      ipic_async_req => ipic_async_req,
      prh_addr(0 to 31) => prh_addr(0 to 31),
      prh_be(0 to 3) => prh_be(0 to 3),
      prh_cs_n(0) => prh_cs_n(0),
      prh_data_i(0 to 31) => prh_data_i(0 to 31),
      prh_data_o(0 to 31) => prh_data_o(0 to 31),
      prh_data_t(0) => \^prh_data_t\(1),
      prh_rd_n => prh_rd_n,
      prh_rdy(0) => prh_rdy(0),
      prh_wr_n => prh_wr_n,
      s_axi_aclk => s_axi_aclk,
      s_axi_arready => \^s_axi_arready\,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => \^s_axi_wready\,
      tdevrdy_wdth_cnt => \ASYNC_CNTL_I/tdevrdy_wdth_cnt\
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "axi_epc_0,axi_epc,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "axi_epc,Vivado 2019.2.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "zynq";
  attribute C_INSTANCE : string;
  attribute C_INSTANCE of U0 : label is "axi_epc_inst";
  attribute C_NUM_PERIPHERALS : integer;
  attribute C_NUM_PERIPHERALS of U0 : label is 1;
  attribute C_PRH0_ADDR_TH : integer;
  attribute C_PRH0_ADDR_TH of U0 : label is 0;
  attribute C_PRH0_ADDR_TSU : integer;
  attribute C_PRH0_ADDR_TSU of U0 : label is 0;
  attribute C_PRH0_ADS_WIDTH : integer;
  attribute C_PRH0_ADS_WIDTH of U0 : label is 0;
  attribute C_PRH0_AWIDTH : integer;
  attribute C_PRH0_AWIDTH of U0 : label is 32;
  attribute C_PRH0_BASEADDR : integer;
  attribute C_PRH0_BASEADDR of U0 : label is -1610547201;
  attribute C_PRH0_BUS_MULTIPLEX : integer;
  attribute C_PRH0_BUS_MULTIPLEX of U0 : label is 0;
  attribute C_PRH0_CSN_TH : integer;
  attribute C_PRH0_CSN_TH of U0 : label is 0;
  attribute C_PRH0_CSN_TSU : integer;
  attribute C_PRH0_CSN_TSU of U0 : label is 0;
  attribute C_PRH0_DATA_TH : integer;
  attribute C_PRH0_DATA_TH of U0 : label is 0;
  attribute C_PRH0_DATA_TINV : integer;
  attribute C_PRH0_DATA_TINV of U0 : label is 0;
  attribute C_PRH0_DATA_TOUT : integer;
  attribute C_PRH0_DATA_TOUT of U0 : label is 0;
  attribute C_PRH0_DATA_TSU : integer;
  attribute C_PRH0_DATA_TSU of U0 : label is 0;
  attribute C_PRH0_DWIDTH : integer;
  attribute C_PRH0_DWIDTH of U0 : label is 32;
  attribute C_PRH0_DWIDTH_MATCH : integer;
  attribute C_PRH0_DWIDTH_MATCH of U0 : label is 0;
  attribute C_PRH0_FIFO_ACCESS : integer;
  attribute C_PRH0_FIFO_ACCESS of U0 : label is 0;
  attribute C_PRH0_FIFO_OFFSET : integer;
  attribute C_PRH0_FIFO_OFFSET of U0 : label is 0;
  attribute C_PRH0_HIGHADDR : integer;
  attribute C_PRH0_HIGHADDR of U0 : label is -1342177281;
  attribute C_PRH0_RDN_WIDTH : integer;
  attribute C_PRH0_RDN_WIDTH of U0 : label is 0;
  attribute C_PRH0_RDY_TOUT : integer;
  attribute C_PRH0_RDY_TOUT of U0 : label is 0;
  attribute C_PRH0_RDY_WIDTH : integer;
  attribute C_PRH0_RDY_WIDTH of U0 : label is 0;
  attribute C_PRH0_RD_CYCLE : integer;
  attribute C_PRH0_RD_CYCLE of U0 : label is 0;
  attribute C_PRH0_SYNC : integer;
  attribute C_PRH0_SYNC of U0 : label is 0;
  attribute C_PRH0_WRN_WIDTH : integer;
  attribute C_PRH0_WRN_WIDTH of U0 : label is 0;
  attribute C_PRH0_WR_CYCLE : integer;
  attribute C_PRH0_WR_CYCLE of U0 : label is 0;
  attribute C_PRH1_ADDR_TH : integer;
  attribute C_PRH1_ADDR_TH of U0 : label is 0;
  attribute C_PRH1_ADDR_TSU : integer;
  attribute C_PRH1_ADDR_TSU of U0 : label is 0;
  attribute C_PRH1_ADS_WIDTH : integer;
  attribute C_PRH1_ADS_WIDTH of U0 : label is 0;
  attribute C_PRH1_AWIDTH : integer;
  attribute C_PRH1_AWIDTH of U0 : label is 32;
  attribute C_PRH1_BASEADDR : integer;
  attribute C_PRH1_BASEADDR of U0 : label is -1342111745;
  attribute C_PRH1_BUS_MULTIPLEX : integer;
  attribute C_PRH1_BUS_MULTIPLEX of U0 : label is 0;
  attribute C_PRH1_CSN_TH : integer;
  attribute C_PRH1_CSN_TH of U0 : label is 0;
  attribute C_PRH1_CSN_TSU : integer;
  attribute C_PRH1_CSN_TSU of U0 : label is 0;
  attribute C_PRH1_DATA_TH : integer;
  attribute C_PRH1_DATA_TH of U0 : label is 0;
  attribute C_PRH1_DATA_TINV : integer;
  attribute C_PRH1_DATA_TINV of U0 : label is 0;
  attribute C_PRH1_DATA_TOUT : integer;
  attribute C_PRH1_DATA_TOUT of U0 : label is 0;
  attribute C_PRH1_DATA_TSU : integer;
  attribute C_PRH1_DATA_TSU of U0 : label is 0;
  attribute C_PRH1_DWIDTH : integer;
  attribute C_PRH1_DWIDTH of U0 : label is 32;
  attribute C_PRH1_DWIDTH_MATCH : integer;
  attribute C_PRH1_DWIDTH_MATCH of U0 : label is 0;
  attribute C_PRH1_FIFO_ACCESS : integer;
  attribute C_PRH1_FIFO_ACCESS of U0 : label is 0;
  attribute C_PRH1_FIFO_OFFSET : integer;
  attribute C_PRH1_FIFO_OFFSET of U0 : label is 0;
  attribute C_PRH1_HIGHADDR : integer;
  attribute C_PRH1_HIGHADDR of U0 : label is -1073741825;
  attribute C_PRH1_RDN_WIDTH : integer;
  attribute C_PRH1_RDN_WIDTH of U0 : label is 0;
  attribute C_PRH1_RDY_TOUT : integer;
  attribute C_PRH1_RDY_TOUT of U0 : label is 0;
  attribute C_PRH1_RDY_WIDTH : integer;
  attribute C_PRH1_RDY_WIDTH of U0 : label is 0;
  attribute C_PRH1_RD_CYCLE : integer;
  attribute C_PRH1_RD_CYCLE of U0 : label is 0;
  attribute C_PRH1_SYNC : integer;
  attribute C_PRH1_SYNC of U0 : label is 0;
  attribute C_PRH1_WRN_WIDTH : integer;
  attribute C_PRH1_WRN_WIDTH of U0 : label is 0;
  attribute C_PRH1_WR_CYCLE : integer;
  attribute C_PRH1_WR_CYCLE of U0 : label is 0;
  attribute C_PRH2_ADDR_TH : integer;
  attribute C_PRH2_ADDR_TH of U0 : label is 0;
  attribute C_PRH2_ADDR_TSU : integer;
  attribute C_PRH2_ADDR_TSU of U0 : label is 0;
  attribute C_PRH2_ADS_WIDTH : integer;
  attribute C_PRH2_ADS_WIDTH of U0 : label is 0;
  attribute C_PRH2_AWIDTH : integer;
  attribute C_PRH2_AWIDTH of U0 : label is 32;
  attribute C_PRH2_BASEADDR : integer;
  attribute C_PRH2_BASEADDR of U0 : label is -1073676289;
  attribute C_PRH2_BUS_MULTIPLEX : integer;
  attribute C_PRH2_BUS_MULTIPLEX of U0 : label is 0;
  attribute C_PRH2_CSN_TH : integer;
  attribute C_PRH2_CSN_TH of U0 : label is 0;
  attribute C_PRH2_CSN_TSU : integer;
  attribute C_PRH2_CSN_TSU of U0 : label is 0;
  attribute C_PRH2_DATA_TH : integer;
  attribute C_PRH2_DATA_TH of U0 : label is 0;
  attribute C_PRH2_DATA_TINV : integer;
  attribute C_PRH2_DATA_TINV of U0 : label is 0;
  attribute C_PRH2_DATA_TOUT : integer;
  attribute C_PRH2_DATA_TOUT of U0 : label is 0;
  attribute C_PRH2_DATA_TSU : integer;
  attribute C_PRH2_DATA_TSU of U0 : label is 0;
  attribute C_PRH2_DWIDTH : integer;
  attribute C_PRH2_DWIDTH of U0 : label is 32;
  attribute C_PRH2_DWIDTH_MATCH : integer;
  attribute C_PRH2_DWIDTH_MATCH of U0 : label is 0;
  attribute C_PRH2_FIFO_ACCESS : integer;
  attribute C_PRH2_FIFO_ACCESS of U0 : label is 0;
  attribute C_PRH2_FIFO_OFFSET : integer;
  attribute C_PRH2_FIFO_OFFSET of U0 : label is 0;
  attribute C_PRH2_HIGHADDR : integer;
  attribute C_PRH2_HIGHADDR of U0 : label is -805306369;
  attribute C_PRH2_RDN_WIDTH : integer;
  attribute C_PRH2_RDN_WIDTH of U0 : label is 0;
  attribute C_PRH2_RDY_TOUT : integer;
  attribute C_PRH2_RDY_TOUT of U0 : label is 0;
  attribute C_PRH2_RDY_WIDTH : integer;
  attribute C_PRH2_RDY_WIDTH of U0 : label is 0;
  attribute C_PRH2_RD_CYCLE : integer;
  attribute C_PRH2_RD_CYCLE of U0 : label is 0;
  attribute C_PRH2_SYNC : integer;
  attribute C_PRH2_SYNC of U0 : label is 0;
  attribute C_PRH2_WRN_WIDTH : integer;
  attribute C_PRH2_WRN_WIDTH of U0 : label is 0;
  attribute C_PRH2_WR_CYCLE : integer;
  attribute C_PRH2_WR_CYCLE of U0 : label is 0;
  attribute C_PRH3_ADDR_TH : integer;
  attribute C_PRH3_ADDR_TH of U0 : label is 0;
  attribute C_PRH3_ADDR_TSU : integer;
  attribute C_PRH3_ADDR_TSU of U0 : label is 0;
  attribute C_PRH3_ADS_WIDTH : integer;
  attribute C_PRH3_ADS_WIDTH of U0 : label is 0;
  attribute C_PRH3_AWIDTH : integer;
  attribute C_PRH3_AWIDTH of U0 : label is 32;
  attribute C_PRH3_BASEADDR : integer;
  attribute C_PRH3_BASEADDR of U0 : label is -805240833;
  attribute C_PRH3_BUS_MULTIPLEX : integer;
  attribute C_PRH3_BUS_MULTIPLEX of U0 : label is 0;
  attribute C_PRH3_CSN_TH : integer;
  attribute C_PRH3_CSN_TH of U0 : label is 0;
  attribute C_PRH3_CSN_TSU : integer;
  attribute C_PRH3_CSN_TSU of U0 : label is 0;
  attribute C_PRH3_DATA_TH : integer;
  attribute C_PRH3_DATA_TH of U0 : label is 0;
  attribute C_PRH3_DATA_TINV : integer;
  attribute C_PRH3_DATA_TINV of U0 : label is 0;
  attribute C_PRH3_DATA_TOUT : integer;
  attribute C_PRH3_DATA_TOUT of U0 : label is 0;
  attribute C_PRH3_DATA_TSU : integer;
  attribute C_PRH3_DATA_TSU of U0 : label is 0;
  attribute C_PRH3_DWIDTH : integer;
  attribute C_PRH3_DWIDTH of U0 : label is 32;
  attribute C_PRH3_DWIDTH_MATCH : integer;
  attribute C_PRH3_DWIDTH_MATCH of U0 : label is 0;
  attribute C_PRH3_FIFO_ACCESS : integer;
  attribute C_PRH3_FIFO_ACCESS of U0 : label is 0;
  attribute C_PRH3_FIFO_OFFSET : integer;
  attribute C_PRH3_FIFO_OFFSET of U0 : label is 0;
  attribute C_PRH3_HIGHADDR : integer;
  attribute C_PRH3_HIGHADDR of U0 : label is -536870913;
  attribute C_PRH3_RDN_WIDTH : integer;
  attribute C_PRH3_RDN_WIDTH of U0 : label is 0;
  attribute C_PRH3_RDY_TOUT : integer;
  attribute C_PRH3_RDY_TOUT of U0 : label is 0;
  attribute C_PRH3_RDY_WIDTH : integer;
  attribute C_PRH3_RDY_WIDTH of U0 : label is 0;
  attribute C_PRH3_RD_CYCLE : integer;
  attribute C_PRH3_RD_CYCLE of U0 : label is 0;
  attribute C_PRH3_SYNC : integer;
  attribute C_PRH3_SYNC of U0 : label is 0;
  attribute C_PRH3_WRN_WIDTH : integer;
  attribute C_PRH3_WRN_WIDTH of U0 : label is 0;
  attribute C_PRH3_WR_CYCLE : integer;
  attribute C_PRH3_WR_CYCLE of U0 : label is 0;
  attribute C_PRH_BURST_SUPPORT : integer;
  attribute C_PRH_BURST_SUPPORT of U0 : label is 0;
  attribute C_PRH_CLK_PERIOD_PS : integer;
  attribute C_PRH_CLK_PERIOD_PS of U0 : label is 20000;
  attribute C_PRH_CLK_SUPPORT : integer;
  attribute C_PRH_CLK_SUPPORT of U0 : label is 0;
  attribute C_PRH_MAX_ADWIDTH : integer;
  attribute C_PRH_MAX_ADWIDTH of U0 : label is 32;
  attribute C_PRH_MAX_AWIDTH : integer;
  attribute C_PRH_MAX_AWIDTH of U0 : label is 32;
  attribute C_PRH_MAX_DWIDTH : integer;
  attribute C_PRH_MAX_DWIDTH of U0 : label is 32;
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of U0 : label is 32;
  attribute C_S_AXI_CLK_PERIOD_PS : integer;
  attribute C_S_AXI_CLK_PERIOD_PS of U0 : label is 10000;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of U0 : label is 32;
  attribute x_interface_info : string;
  attribute x_interface_info of prh_ads : signal is "xilinx.com:interface:epc:1.0 EPC_INTF ADS";
  attribute x_interface_info of prh_burst : signal is "xilinx.com:interface:epc:1.0 EPC_INTF BURST";
  attribute x_interface_info of prh_clk : signal is "xilinx.com:interface:epc:1.0 EPC_INTF CLK";
  attribute x_interface_info of prh_rd_n : signal is "xilinx.com:interface:epc:1.0 EPC_INTF RD_N";
  attribute x_interface_info of prh_rnw : signal is "xilinx.com:interface:epc:1.0 EPC_INTF RNW";
  attribute x_interface_info of prh_rst : signal is "xilinx.com:interface:epc:1.0 EPC_INTF RST";
  attribute x_interface_info of prh_wr_n : signal is "xilinx.com:interface:epc:1.0 EPC_INTF WR_N";
  attribute x_interface_info of s_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of s_axi_aclk : signal is "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  attribute x_interface_info of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S_AXI_RST RST";
  attribute x_interface_parameter of s_axi_aresetn : signal is "XIL_INTERFACENAME S_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute x_interface_info of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute x_interface_info of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute x_interface_info of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute x_interface_info of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute x_interface_info of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute x_interface_info of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute x_interface_info of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute x_interface_info of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute x_interface_info of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute x_interface_info of prh_addr : signal is "xilinx.com:interface:epc:1.0 EPC_INTF ADDR";
  attribute x_interface_info of prh_be : signal is "xilinx.com:interface:epc:1.0 EPC_INTF BE";
  attribute x_interface_info of prh_cs_n : signal is "xilinx.com:interface:epc:1.0 EPC_INTF CS_N";
  attribute x_interface_info of prh_data_i : signal is "xilinx.com:interface:epc:1.0 EPC_INTF DATA_I";
  attribute x_interface_info of prh_data_o : signal is "xilinx.com:interface:epc:1.0 EPC_INTF DATA_O";
  attribute x_interface_info of prh_data_t : signal is "xilinx.com:interface:epc:1.0 EPC_INTF DATA_T";
  attribute x_interface_info of prh_rdy : signal is "xilinx.com:interface:epc:1.0 EPC_INTF RDY";
  attribute x_interface_info of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute x_interface_info of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute x_interface_parameter of s_axi_awaddr : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute x_interface_info of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute x_interface_info of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute x_interface_info of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute x_interface_info of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc
     port map (
      prh_addr(0 to 31) => prh_addr(0 to 31),
      prh_ads => prh_ads,
      prh_be(0 to 3) => prh_be(0 to 3),
      prh_burst => prh_burst,
      prh_clk => prh_clk,
      prh_cs_n(0) => prh_cs_n(0),
      prh_data_i(0 to 31) => prh_data_i(0 to 31),
      prh_data_o(0 to 31) => prh_data_o(0 to 31),
      prh_data_t(0 to 31) => prh_data_t(0 to 31),
      prh_rd_n => prh_rd_n,
      prh_rdy(0) => prh_rdy(0),
      prh_rnw => prh_rnw,
      prh_rst => prh_rst,
      prh_wr_n => prh_wr_n,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => s_axi_bresp(1 downto 0),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(1 downto 0) => s_axi_rresp(1 downto 0),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid
    );
end STRUCTURE;
