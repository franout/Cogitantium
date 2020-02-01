-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
-- Date        : Sat Feb  1 17:53:20 2020
-- Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top xilinx_ram -prefix
--               xilinx_ram_ nv_ram_rws_256x3_sim_netlist.vhdl
-- Design      : nv_ram_rws_256x3
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xilinx_ram_uram_rd_back_v1_0_0_uram_rdb_mux is
  port (
    CLK_URAM : out STD_LOGIC;
    EN_URAM : out STD_LOGIC;
    INJECT_DBITERR_URAM : out STD_LOGIC;
    INJECT_SBITERR_URAM : out STD_LOGIC;
    OREG_CE_URAM : out STD_LOGIC;
    OREG_ECC_CE_URAM : out STD_LOGIC;
    RDB_WR_URAM : out STD_LOGIC;
    RST_URAM : out STD_LOGIC;
    ENA_URAM : out STD_LOGIC;
    ADDR_B : out STD_LOGIC_VECTOR ( 22 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \DIN_O_reg[71]_0\ : out STD_LOGIC_VECTOR ( 71 downto 0 );
    CE00 : in STD_LOGIC;
    control : in STD_LOGIC;
    CLK : in STD_LOGIC;
    CCLK : in STD_LOGIC;
    EN_O_reg_0 : in STD_LOGIC;
    INJECT_DBITERR_B : in STD_LOGIC;
    INJECT_SBITERR_B : in STD_LOGIC;
    OREG_CE_B : in STD_LOGIC;
    OREG_ECC_CE_B : in STD_LOGIC;
    RDB_WR_O_reg_0 : in STD_LOGIC;
    RST_B : in STD_LOGIC;
    EN_A : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \ADDR_O_reg[22]_0\ : in STD_LOGIC_VECTOR ( 10 downto 0 );
    \BWE_O_reg[8]_0\ : in STD_LOGIC_VECTOR ( 8 downto 0 );
    \DIN_O_reg[71]_1\ : in STD_LOGIC_VECTOR ( 71 downto 0 )
  );
end xilinx_ram_uram_rd_back_v1_0_0_uram_rdb_mux;

architecture STRUCTURE of xilinx_ram_uram_rd_back_v1_0_0_uram_rdb_mux is
  signal \^clk_uram\ : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clk_mux_inst : label is "PRIMITIVE";
begin
  CLK_URAM <= \^clk_uram\;
\ADDR_O_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => D(0),
      Q => ADDR_B(0),
      R => '0'
    );
\ADDR_O_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => D(10),
      Q => ADDR_B(10),
      R => '0'
    );
\ADDR_O_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => D(11),
      Q => ADDR_B(11),
      R => '0'
    );
\ADDR_O_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \ADDR_O_reg[22]_0\(0),
      Q => ADDR_B(12),
      R => control
    );
\ADDR_O_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \ADDR_O_reg[22]_0\(1),
      Q => ADDR_B(13),
      R => control
    );
\ADDR_O_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \ADDR_O_reg[22]_0\(2),
      Q => ADDR_B(14),
      R => control
    );
\ADDR_O_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \ADDR_O_reg[22]_0\(3),
      Q => ADDR_B(15),
      R => control
    );
\ADDR_O_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \ADDR_O_reg[22]_0\(4),
      Q => ADDR_B(16),
      R => control
    );
\ADDR_O_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \ADDR_O_reg[22]_0\(5),
      Q => ADDR_B(17),
      R => control
    );
\ADDR_O_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \ADDR_O_reg[22]_0\(6),
      Q => ADDR_B(18),
      R => control
    );
\ADDR_O_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \ADDR_O_reg[22]_0\(7),
      Q => ADDR_B(19),
      R => control
    );
\ADDR_O_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => D(1),
      Q => ADDR_B(1),
      R => '0'
    );
\ADDR_O_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \ADDR_O_reg[22]_0\(8),
      Q => ADDR_B(20),
      R => control
    );
\ADDR_O_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \ADDR_O_reg[22]_0\(9),
      Q => ADDR_B(21),
      R => control
    );
\ADDR_O_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \ADDR_O_reg[22]_0\(10),
      Q => ADDR_B(22),
      R => control
    );
\ADDR_O_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => D(2),
      Q => ADDR_B(2),
      R => '0'
    );
\ADDR_O_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => D(3),
      Q => ADDR_B(3),
      R => '0'
    );
\ADDR_O_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => D(4),
      Q => ADDR_B(4),
      R => '0'
    );
\ADDR_O_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => D(5),
      Q => ADDR_B(5),
      R => '0'
    );
\ADDR_O_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => D(6),
      Q => ADDR_B(6),
      R => '0'
    );
\ADDR_O_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => D(7),
      Q => ADDR_B(7),
      R => '0'
    );
\ADDR_O_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => D(8),
      Q => ADDR_B(8),
      R => '0'
    );
\ADDR_O_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => D(9),
      Q => ADDR_B(9),
      R => '0'
    );
\BWE_O_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \BWE_O_reg[8]_0\(0),
      Q => Q(0),
      R => '0'
    );
\BWE_O_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \BWE_O_reg[8]_0\(1),
      Q => Q(1),
      R => '0'
    );
\BWE_O_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \BWE_O_reg[8]_0\(2),
      Q => Q(2),
      R => '0'
    );
\BWE_O_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \BWE_O_reg[8]_0\(3),
      Q => Q(3),
      R => '0'
    );
\BWE_O_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \BWE_O_reg[8]_0\(4),
      Q => Q(4),
      R => '0'
    );
\BWE_O_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \BWE_O_reg[8]_0\(5),
      Q => Q(5),
      R => '0'
    );
\BWE_O_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \BWE_O_reg[8]_0\(6),
      Q => Q(6),
      R => '0'
    );
\BWE_O_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \BWE_O_reg[8]_0\(7),
      Q => Q(7),
      R => '0'
    );
\BWE_O_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \BWE_O_reg[8]_0\(8),
      Q => Q(8),
      R => '0'
    );
\DIN_O_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(0),
      Q => \DIN_O_reg[71]_0\(0),
      R => '0'
    );
\DIN_O_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(10),
      Q => \DIN_O_reg[71]_0\(10),
      R => '0'
    );
\DIN_O_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(11),
      Q => \DIN_O_reg[71]_0\(11),
      R => '0'
    );
\DIN_O_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(12),
      Q => \DIN_O_reg[71]_0\(12),
      R => '0'
    );
\DIN_O_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(13),
      Q => \DIN_O_reg[71]_0\(13),
      R => '0'
    );
\DIN_O_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(14),
      Q => \DIN_O_reg[71]_0\(14),
      R => '0'
    );
\DIN_O_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(15),
      Q => \DIN_O_reg[71]_0\(15),
      R => '0'
    );
\DIN_O_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(16),
      Q => \DIN_O_reg[71]_0\(16),
      R => '0'
    );
\DIN_O_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(17),
      Q => \DIN_O_reg[71]_0\(17),
      R => '0'
    );
\DIN_O_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(18),
      Q => \DIN_O_reg[71]_0\(18),
      R => '0'
    );
\DIN_O_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(19),
      Q => \DIN_O_reg[71]_0\(19),
      R => '0'
    );
\DIN_O_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(1),
      Q => \DIN_O_reg[71]_0\(1),
      R => '0'
    );
\DIN_O_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(20),
      Q => \DIN_O_reg[71]_0\(20),
      R => '0'
    );
\DIN_O_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(21),
      Q => \DIN_O_reg[71]_0\(21),
      R => '0'
    );
\DIN_O_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(22),
      Q => \DIN_O_reg[71]_0\(22),
      R => '0'
    );
\DIN_O_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(23),
      Q => \DIN_O_reg[71]_0\(23),
      R => '0'
    );
\DIN_O_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(24),
      Q => \DIN_O_reg[71]_0\(24),
      R => '0'
    );
\DIN_O_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(25),
      Q => \DIN_O_reg[71]_0\(25),
      R => '0'
    );
\DIN_O_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(26),
      Q => \DIN_O_reg[71]_0\(26),
      R => '0'
    );
\DIN_O_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(27),
      Q => \DIN_O_reg[71]_0\(27),
      R => '0'
    );
\DIN_O_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(28),
      Q => \DIN_O_reg[71]_0\(28),
      R => '0'
    );
\DIN_O_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(29),
      Q => \DIN_O_reg[71]_0\(29),
      R => '0'
    );
\DIN_O_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(2),
      Q => \DIN_O_reg[71]_0\(2),
      R => '0'
    );
\DIN_O_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(30),
      Q => \DIN_O_reg[71]_0\(30),
      R => '0'
    );
\DIN_O_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(31),
      Q => \DIN_O_reg[71]_0\(31),
      R => '0'
    );
\DIN_O_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(32),
      Q => \DIN_O_reg[71]_0\(32),
      R => '0'
    );
\DIN_O_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(33),
      Q => \DIN_O_reg[71]_0\(33),
      R => '0'
    );
\DIN_O_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(34),
      Q => \DIN_O_reg[71]_0\(34),
      R => '0'
    );
\DIN_O_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(35),
      Q => \DIN_O_reg[71]_0\(35),
      R => '0'
    );
\DIN_O_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(36),
      Q => \DIN_O_reg[71]_0\(36),
      R => '0'
    );
\DIN_O_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(37),
      Q => \DIN_O_reg[71]_0\(37),
      R => '0'
    );
\DIN_O_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(38),
      Q => \DIN_O_reg[71]_0\(38),
      R => '0'
    );
\DIN_O_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(39),
      Q => \DIN_O_reg[71]_0\(39),
      R => '0'
    );
\DIN_O_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(3),
      Q => \DIN_O_reg[71]_0\(3),
      R => '0'
    );
\DIN_O_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(40),
      Q => \DIN_O_reg[71]_0\(40),
      R => '0'
    );
\DIN_O_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(41),
      Q => \DIN_O_reg[71]_0\(41),
      R => '0'
    );
\DIN_O_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(42),
      Q => \DIN_O_reg[71]_0\(42),
      R => '0'
    );
\DIN_O_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(43),
      Q => \DIN_O_reg[71]_0\(43),
      R => '0'
    );
\DIN_O_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(44),
      Q => \DIN_O_reg[71]_0\(44),
      R => '0'
    );
\DIN_O_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(45),
      Q => \DIN_O_reg[71]_0\(45),
      R => '0'
    );
\DIN_O_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(46),
      Q => \DIN_O_reg[71]_0\(46),
      R => '0'
    );
\DIN_O_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(47),
      Q => \DIN_O_reg[71]_0\(47),
      R => '0'
    );
\DIN_O_reg[48]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(48),
      Q => \DIN_O_reg[71]_0\(48),
      R => '0'
    );
\DIN_O_reg[49]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(49),
      Q => \DIN_O_reg[71]_0\(49),
      R => '0'
    );
\DIN_O_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(4),
      Q => \DIN_O_reg[71]_0\(4),
      R => '0'
    );
\DIN_O_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(50),
      Q => \DIN_O_reg[71]_0\(50),
      R => '0'
    );
\DIN_O_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(51),
      Q => \DIN_O_reg[71]_0\(51),
      R => '0'
    );
\DIN_O_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(52),
      Q => \DIN_O_reg[71]_0\(52),
      R => '0'
    );
\DIN_O_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(53),
      Q => \DIN_O_reg[71]_0\(53),
      R => '0'
    );
\DIN_O_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(54),
      Q => \DIN_O_reg[71]_0\(54),
      R => '0'
    );
\DIN_O_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(55),
      Q => \DIN_O_reg[71]_0\(55),
      R => '0'
    );
\DIN_O_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(56),
      Q => \DIN_O_reg[71]_0\(56),
      R => '0'
    );
\DIN_O_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(57),
      Q => \DIN_O_reg[71]_0\(57),
      R => '0'
    );
\DIN_O_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(58),
      Q => \DIN_O_reg[71]_0\(58),
      R => '0'
    );
\DIN_O_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(59),
      Q => \DIN_O_reg[71]_0\(59),
      R => '0'
    );
\DIN_O_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(5),
      Q => \DIN_O_reg[71]_0\(5),
      R => '0'
    );
\DIN_O_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(60),
      Q => \DIN_O_reg[71]_0\(60),
      R => '0'
    );
\DIN_O_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(61),
      Q => \DIN_O_reg[71]_0\(61),
      R => '0'
    );
\DIN_O_reg[62]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(62),
      Q => \DIN_O_reg[71]_0\(62),
      R => '0'
    );
\DIN_O_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(63),
      Q => \DIN_O_reg[71]_0\(63),
      R => '0'
    );
\DIN_O_reg[64]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(64),
      Q => \DIN_O_reg[71]_0\(64),
      R => '0'
    );
\DIN_O_reg[65]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(65),
      Q => \DIN_O_reg[71]_0\(65),
      R => '0'
    );
\DIN_O_reg[66]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(66),
      Q => \DIN_O_reg[71]_0\(66),
      R => '0'
    );
\DIN_O_reg[67]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(67),
      Q => \DIN_O_reg[71]_0\(67),
      R => '0'
    );
\DIN_O_reg[68]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(68),
      Q => \DIN_O_reg[71]_0\(68),
      R => '0'
    );
\DIN_O_reg[69]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(69),
      Q => \DIN_O_reg[71]_0\(69),
      R => '0'
    );
\DIN_O_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(6),
      Q => \DIN_O_reg[71]_0\(6),
      R => '0'
    );
\DIN_O_reg[70]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(70),
      Q => \DIN_O_reg[71]_0\(70),
      R => '0'
    );
\DIN_O_reg[71]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(71),
      Q => \DIN_O_reg[71]_0\(71),
      R => '0'
    );
\DIN_O_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(7),
      Q => \DIN_O_reg[71]_0\(7),
      R => '0'
    );
\DIN_O_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(8),
      Q => \DIN_O_reg[71]_0\(8),
      R => '0'
    );
\DIN_O_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => \DIN_O_reg[71]_1\(9),
      Q => \DIN_O_reg[71]_0\(9),
      R => '0'
    );
ENA_O_reg: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => EN_A,
      Q => ENA_URAM,
      R => control
    );
EN_O_reg: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => EN_O_reg_0,
      Q => EN_URAM,
      R => '0'
    );
INJECT_DBITERR_O_reg: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => INJECT_DBITERR_B,
      Q => INJECT_DBITERR_URAM,
      R => control
    );
INJECT_SBITERR_O_reg: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => INJECT_SBITERR_B,
      Q => INJECT_SBITERR_URAM,
      R => control
    );
OREG_CE_O_reg: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => OREG_CE_B,
      Q => OREG_CE_URAM,
      R => control
    );
OREG_ECC_CE_O_reg: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => OREG_ECC_CE_B,
      Q => OREG_ECC_CE_URAM,
      R => control
    );
RDB_WR_O_reg: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => RDB_WR_O_reg_0,
      Q => RDB_WR_URAM,
      R => '0'
    );
RST_O_reg: unisim.vcomponents.FDRE
     port map (
      C => \^clk_uram\,
      CE => '1',
      D => RST_B,
      Q => RST_URAM,
      R => control
    );
clk_mux_inst: unisim.vcomponents.BUFGCTRL
    generic map(
      CE_TYPE_CE0 => "SYNC",
      CE_TYPE_CE1 => "SYNC",
      INIT_OUT => 0,
      IS_CE0_INVERTED => '0',
      IS_CE1_INVERTED => '0',
      IS_I0_INVERTED => '0',
      IS_I1_INVERTED => '0',
      IS_IGNORE0_INVERTED => '0',
      IS_IGNORE1_INVERTED => '0',
      IS_S0_INVERTED => '0',
      IS_S1_INVERTED => '0',
      PRESELECT_I0 => false,
      PRESELECT_I1 => false,
      SIM_DEVICE => "7SERIES",
      STARTUP_SYNC => "FALSE"
    )
        port map (
      CE0 => CE00,
      CE1 => control,
      I0 => CLK,
      I1 => CCLK,
      IGNORE0 => '0',
      IGNORE1 => '0',
      O => \^clk_uram\,
      S0 => '1',
      S1 => '1'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xilinx_ram_uram_rd_back_v1_0_0_uram_rdb_wrd_fsm is
  port (
    control : out STD_LOGIC;
    \FSM_onehot_curr_state_reg[1]_0\ : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \FSM_onehot_curr_state_reg[1]_1\ : out STD_LOGIC;
    \FSM_onehot_curr_state_reg[3]_0\ : out STD_LOGIC;
    \uram_data_int_r_reg[71]_0\ : out STD_LOGIC_VECTOR ( 71 downto 0 );
    CE00 : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 11 downto 0 );
    RST_CFG2 : in STD_LOGIC;
    CCLK : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VLD : in STD_LOGIC;
    BWE_B : in STD_LOGIC_VECTOR ( 8 downto 0 );
    RDB_WR_B : in STD_LOGIC;
    DIN_B : in STD_LOGIC_VECTOR ( 71 downto 0 );
    ADDR_B : in STD_LOGIC_VECTOR ( 11 downto 0 );
    EN_B : in STD_LOGIC
  );
end xilinx_ram_uram_rd_back_v1_0_0_uram_rdb_wrd_fsm;

architecture STRUCTURE of xilinx_ram_uram_rd_back_v1_0_0_uram_rdb_wrd_fsm is
  signal \ADDR_O[11]_i_2_n_0\ : STD_LOGIC;
  signal \ADDR_O[11]_i_3_n_0\ : STD_LOGIC;
  signal \DIN_O[71]_i_2_n_0\ : STD_LOGIC;
  signal EN_O_i_2_n_0 : STD_LOGIC;
  signal EN_O_i_3_n_0 : STD_LOGIC;
  signal EN_O_i_4_n_0 : STD_LOGIC;
  signal EN_O_i_5_n_0 : STD_LOGIC;
  signal EN_O_i_6_n_0 : STD_LOGIC;
  signal \FSM_onehot_curr_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[0]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[3]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[3]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[3]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[3]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[3]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[3]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state[5]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[4]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[5]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[6]\ : STD_LOGIC;
  signal \FSM_onehot_curr_state_reg_n_0_[7]\ : STD_LOGIC;
  signal \_inferred__4/i__carry__0_n_0\ : STD_LOGIC;
  signal \_inferred__4/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__4/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__4/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__4/i__carry__1_n_1\ : STD_LOGIC;
  signal \_inferred__4/i__carry__1_n_2\ : STD_LOGIC;
  signal \_inferred__4/i__carry__1_n_3\ : STD_LOGIC;
  signal \_inferred__4/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__4/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__4/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__4/i__carry_n_3\ : STD_LOGIC;
  signal config_data_batch_int : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \config_data_batch_int[29]_i_1_n_0\ : STD_LOGIC;
  signal config_data_int0 : STD_LOGIC;
  signal \config_data_int_reg_n_0_[0]\ : STD_LOGIC;
  signal \config_data_int_reg_n_0_[10]\ : STD_LOGIC;
  signal \config_data_int_reg_n_0_[11]\ : STD_LOGIC;
  signal \config_data_int_reg_n_0_[1]\ : STD_LOGIC;
  signal \config_data_int_reg_n_0_[2]\ : STD_LOGIC;
  signal \config_data_int_reg_n_0_[3]\ : STD_LOGIC;
  signal \config_data_int_reg_n_0_[4]\ : STD_LOGIC;
  signal \config_data_int_reg_n_0_[5]\ : STD_LOGIC;
  signal \config_data_int_reg_n_0_[6]\ : STD_LOGIC;
  signal \config_data_int_reg_n_0_[7]\ : STD_LOGIC;
  signal \config_data_int_reg_n_0_[8]\ : STD_LOGIC;
  signal \config_data_int_reg_n_0_[9]\ : STD_LOGIC;
  signal \^control\ : STD_LOGIC;
  signal control_batch_int : STD_LOGIC;
  signal control_batch_int_i_1_n_0 : STD_LOGIC;
  signal control_batch_int_i_2_n_0 : STD_LOGIC;
  signal control_int_r_i_1_n_0 : STD_LOGIC;
  signal \ctrl_cnt[9]_i_1_n_0\ : STD_LOGIC;
  signal \ctrl_cnt[9]_i_2_n_0\ : STD_LOGIC;
  signal \ctrl_cnt[9]_i_4_n_0\ : STD_LOGIC;
  signal \ctrl_cnt[9]_i_5_n_0\ : STD_LOGIC;
  signal \ctrl_cnt[9]_i_6_n_0\ : STD_LOGIC;
  signal ctrl_cnt_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal ctrl_idle : STD_LOGIC;
  signal ctrl_idle0 : STD_LOGIC;
  signal ctrl_idle_r1 : STD_LOGIC;
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_8_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal \i__carry_i_5_n_0\ : STD_LOGIC;
  signal \i__carry_i_6_n_0\ : STD_LOGIC;
  signal \i__carry_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_8_n_0\ : STD_LOGIC;
  signal in18 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal in22 : STD_LOGIC_VECTOR ( 29 downto 1 );
  signal in3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal in4 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal num_reads_r : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \num_reads_r0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__0_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__0_n_1\ : STD_LOGIC;
  signal \num_reads_r0_carry__0_n_2\ : STD_LOGIC;
  signal \num_reads_r0_carry__0_n_3\ : STD_LOGIC;
  signal \num_reads_r0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__1_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__1_n_1\ : STD_LOGIC;
  signal \num_reads_r0_carry__1_n_2\ : STD_LOGIC;
  signal \num_reads_r0_carry__1_n_3\ : STD_LOGIC;
  signal \num_reads_r0_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__2_i_3_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__2_i_4_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__2_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__2_n_1\ : STD_LOGIC;
  signal \num_reads_r0_carry__2_n_2\ : STD_LOGIC;
  signal \num_reads_r0_carry__2_n_3\ : STD_LOGIC;
  signal \num_reads_r0_carry__3_i_1_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__3_i_2_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__3_i_3_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__3_i_4_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__3_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__3_n_1\ : STD_LOGIC;
  signal \num_reads_r0_carry__3_n_2\ : STD_LOGIC;
  signal \num_reads_r0_carry__3_n_3\ : STD_LOGIC;
  signal \num_reads_r0_carry__4_i_1_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__4_i_2_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__4_i_3_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__4_i_4_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__4_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__4_n_1\ : STD_LOGIC;
  signal \num_reads_r0_carry__4_n_2\ : STD_LOGIC;
  signal \num_reads_r0_carry__4_n_3\ : STD_LOGIC;
  signal \num_reads_r0_carry__5_i_1_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__5_i_2_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__5_i_3_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__5_i_4_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__5_n_0\ : STD_LOGIC;
  signal \num_reads_r0_carry__5_n_1\ : STD_LOGIC;
  signal \num_reads_r0_carry__5_n_2\ : STD_LOGIC;
  signal \num_reads_r0_carry__5_n_3\ : STD_LOGIC;
  signal \num_reads_r0_carry__6_i_1_n_0\ : STD_LOGIC;
  signal num_reads_r0_carry_i_1_n_0 : STD_LOGIC;
  signal num_reads_r0_carry_i_2_n_0 : STD_LOGIC;
  signal num_reads_r0_carry_i_3_n_0 : STD_LOGIC;
  signal num_reads_r0_carry_i_4_n_0 : STD_LOGIC;
  signal num_reads_r0_carry_n_0 : STD_LOGIC;
  signal num_reads_r0_carry_n_1 : STD_LOGIC;
  signal num_reads_r0_carry_n_2 : STD_LOGIC;
  signal num_reads_r0_carry_n_3 : STD_LOGIC;
  signal \num_reads_r[29]_i_1_n_0\ : STD_LOGIC;
  signal \num_reads_r[29]_i_2_n_0\ : STD_LOGIC;
  signal num_reads_r_1 : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal p_0_in2_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal p_2_in : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal uram_addr_int_r : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \uram_addr_int_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \uram_addr_int_r[10]_i_1_n_0\ : STD_LOGIC;
  signal \uram_addr_int_r[11]_i_1_n_0\ : STD_LOGIC;
  signal \uram_addr_int_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \uram_addr_int_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \uram_addr_int_r[3]_i_1_n_0\ : STD_LOGIC;
  signal \uram_addr_int_r[4]_i_1_n_0\ : STD_LOGIC;
  signal \uram_addr_int_r[5]_i_1_n_0\ : STD_LOGIC;
  signal \uram_addr_int_r[6]_i_1_n_0\ : STD_LOGIC;
  signal \uram_addr_int_r[7]_i_1_n_0\ : STD_LOGIC;
  signal \uram_addr_int_r[8]_i_1_n_0\ : STD_LOGIC;
  signal \uram_addr_int_r[9]_i_1_n_0\ : STD_LOGIC;
  signal uram_data_int_r : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal \uram_data_int_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[10]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[11]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[12]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[13]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[14]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[15]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[16]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[17]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[18]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[19]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[20]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[21]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[22]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[23]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[24]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[25]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[26]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[27]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[28]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[29]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[30]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[31]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[32]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[33]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[34]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[35]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[36]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[37]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[38]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[39]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[3]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[40]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[41]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[42]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[43]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[44]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[45]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[46]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[47]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[48]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[49]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[4]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[50]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[51]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[52]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[53]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[54]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[55]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[56]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[57]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[58]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[59]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[5]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[60]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[61]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[62]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[63]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[64]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[65]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[66]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[67]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[68]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[69]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[6]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[70]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[71]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[7]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[8]_i_1_n_0\ : STD_LOGIC;
  signal \uram_data_int_r[9]_i_1_n_0\ : STD_LOGIC;
  signal \wr_batch_addr_incr[0]_i_1_n_0\ : STD_LOGIC;
  signal \wr_batch_addr_incr[0]_i_4_n_0\ : STD_LOGIC;
  signal wr_batch_addr_incr_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \wr_batch_addr_incr_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \wr_batch_addr_incr_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal write_config_data_0 : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \write_config_data_0[0]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[10]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[11]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[12]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[13]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[14]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[15]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[16]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[17]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[18]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[19]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[1]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[20]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[21]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[22]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[23]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[24]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[25]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[26]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[27]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[28]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[29]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[29]_i_2_n_0\ : STD_LOGIC;
  signal \write_config_data_0[29]_i_3_n_0\ : STD_LOGIC;
  signal \write_config_data_0[2]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[3]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[4]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[5]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[6]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[7]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[8]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_0[9]_i_1_n_0\ : STD_LOGIC;
  signal write_config_data_1 : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \write_config_data_1[29]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_1[29]_i_2_n_0\ : STD_LOGIC;
  signal write_config_data_2 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \write_config_data_2[0]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_2[10]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_2[11]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_2[11]_i_2_n_0\ : STD_LOGIC;
  signal \write_config_data_2[11]_i_3_n_0\ : STD_LOGIC;
  signal \write_config_data_2[1]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_2[2]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_2[3]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_2[4]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_2[5]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_2[6]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_2[7]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_2[8]_i_1_n_0\ : STD_LOGIC;
  signal \write_config_data_2[9]_i_1_n_0\ : STD_LOGIC;
  signal write_config_data_2_0 : STD_LOGIC;
  signal \write_data_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \write_data_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal \write_data_cnt[1]_i_2_n_0\ : STD_LOGIC;
  signal \write_data_cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \write_data_cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal write_data_end : STD_LOGIC;
  signal write_data_end_reg : STD_LOGIC;
  signal \NLW__inferred__4/i__carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_num_reads_r0_carry__6_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_num_reads_r0_carry__6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_wr_batch_addr_incr_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ADDR_O[11]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \ADDR_O[11]_i_3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of EN_O_i_4 : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of EN_O_i_5 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of EN_O_i_6 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_onehot_curr_state[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \FSM_onehot_curr_state[2]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \FSM_onehot_curr_state[3]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_onehot_curr_state[3]_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \FSM_onehot_curr_state[5]_i_1\ : label is "soft_lutpair8";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[0]\ : label is "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[1]\ : label is "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[2]\ : label is "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[3]\ : label is "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[4]\ : label is "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[5]\ : label is "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[6]\ : label is "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_curr_state_reg[7]\ : label is "CMD_INT:01000000,IDLE_INT:10000000,READ_ONCE:00100000,READ_BATCH:00010000,READ_DATA:00001000,WRITE_ONCE:00000100,WRITE_BATCH:00000010,IDLE:00000001";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \_inferred__4/i__carry\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \_inferred__4/i__carry__0\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute METHODOLOGY_DRC_VIOS of \_inferred__4/i__carry__1\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute SOFT_HLUTNM of \config_data_batch_int[0]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \config_data_batch_int[10]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \config_data_batch_int[11]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \config_data_batch_int[12]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \config_data_batch_int[13]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \config_data_batch_int[14]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \config_data_batch_int[15]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \config_data_batch_int[16]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \config_data_batch_int[17]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \config_data_batch_int[18]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \config_data_batch_int[19]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \config_data_batch_int[1]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \config_data_batch_int[20]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \config_data_batch_int[21]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \config_data_batch_int[22]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \config_data_batch_int[23]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \config_data_batch_int[24]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \config_data_batch_int[25]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \config_data_batch_int[26]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \config_data_batch_int[27]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \config_data_batch_int[28]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \config_data_batch_int[29]_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \config_data_batch_int[2]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \config_data_batch_int[3]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \config_data_batch_int[4]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \config_data_batch_int[5]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \config_data_batch_int[6]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \config_data_batch_int[7]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \config_data_batch_int[8]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \config_data_batch_int[9]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of control_batch_int_i_2 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of control_int_r_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ctrl_cnt[1]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \ctrl_cnt[2]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \ctrl_cnt[3]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \ctrl_cnt[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ctrl_cnt[6]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \ctrl_cnt[7]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ctrl_cnt[8]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ctrl_cnt[9]_i_4\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \ctrl_cnt[9]_i_5\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of ctrl_idle_i_1 : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \num_reads_r[10]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \num_reads_r[11]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \num_reads_r[12]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \num_reads_r[13]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \num_reads_r[14]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \num_reads_r[15]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \num_reads_r[16]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \num_reads_r[17]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \num_reads_r[18]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \num_reads_r[19]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \num_reads_r[1]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \num_reads_r[20]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \num_reads_r[21]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \num_reads_r[22]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \num_reads_r[23]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \num_reads_r[24]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \num_reads_r[25]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \num_reads_r[26]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \num_reads_r[27]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \num_reads_r[28]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \num_reads_r[29]_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \num_reads_r[2]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \num_reads_r[3]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \num_reads_r[4]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \num_reads_r[5]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \num_reads_r[6]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \num_reads_r[7]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \num_reads_r[8]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \num_reads_r[9]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \write_config_data_0[0]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \write_config_data_0[10]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \write_config_data_0[11]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \write_config_data_0[12]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \write_config_data_0[13]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \write_config_data_0[14]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \write_config_data_0[15]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \write_config_data_0[16]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \write_config_data_0[17]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \write_config_data_0[18]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \write_config_data_0[19]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \write_config_data_0[1]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \write_config_data_0[20]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \write_config_data_0[21]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \write_config_data_0[22]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \write_config_data_0[23]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \write_config_data_0[24]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \write_config_data_0[25]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \write_config_data_0[26]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \write_config_data_0[27]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \write_config_data_0[28]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \write_config_data_0[29]_i_2\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \write_config_data_0[2]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \write_config_data_0[3]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \write_config_data_0[4]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \write_config_data_0[5]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \write_config_data_0[6]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \write_config_data_0[7]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \write_config_data_0[8]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \write_config_data_0[9]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of write_data_end_reg_i_1 : label is "soft_lutpair1";
begin
  control <= \^control\;
\ADDR_O[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44FFFF4F440000"
    )
        port map (
      I0 => \ADDR_O[11]_i_2_n_0\,
      I1 => \config_data_int_reg_n_0_[0]\,
      I2 => \ADDR_O[11]_i_3_n_0\,
      I3 => in18(0),
      I4 => \^control\,
      I5 => ADDR_B(0),
      O => D(0)
    );
\ADDR_O[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44FFFF4F440000"
    )
        port map (
      I0 => \ADDR_O[11]_i_2_n_0\,
      I1 => \config_data_int_reg_n_0_[10]\,
      I2 => \ADDR_O[11]_i_3_n_0\,
      I3 => in18(10),
      I4 => \^control\,
      I5 => ADDR_B(10),
      O => D(10)
    );
\ADDR_O[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44FFFF4F440000"
    )
        port map (
      I0 => \ADDR_O[11]_i_2_n_0\,
      I1 => \config_data_int_reg_n_0_[11]\,
      I2 => \ADDR_O[11]_i_3_n_0\,
      I3 => in18(11),
      I4 => \^control\,
      I5 => ADDR_B(11),
      O => D(11)
    );
\ADDR_O[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      O => \ADDR_O[11]_i_2_n_0\
    );
\ADDR_O[11]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      O => \ADDR_O[11]_i_3_n_0\
    );
\ADDR_O[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44FFFF4F440000"
    )
        port map (
      I0 => \ADDR_O[11]_i_2_n_0\,
      I1 => \config_data_int_reg_n_0_[1]\,
      I2 => \ADDR_O[11]_i_3_n_0\,
      I3 => in18(1),
      I4 => \^control\,
      I5 => ADDR_B(1),
      O => D(1)
    );
\ADDR_O[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44FFFF4F440000"
    )
        port map (
      I0 => \ADDR_O[11]_i_2_n_0\,
      I1 => \config_data_int_reg_n_0_[2]\,
      I2 => \ADDR_O[11]_i_3_n_0\,
      I3 => in18(2),
      I4 => \^control\,
      I5 => ADDR_B(2),
      O => D(2)
    );
\ADDR_O[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44FFFF4F440000"
    )
        port map (
      I0 => \ADDR_O[11]_i_2_n_0\,
      I1 => \config_data_int_reg_n_0_[3]\,
      I2 => \ADDR_O[11]_i_3_n_0\,
      I3 => in18(3),
      I4 => \^control\,
      I5 => ADDR_B(3),
      O => D(3)
    );
\ADDR_O[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44FFFF4F440000"
    )
        port map (
      I0 => \ADDR_O[11]_i_2_n_0\,
      I1 => \config_data_int_reg_n_0_[4]\,
      I2 => \ADDR_O[11]_i_3_n_0\,
      I3 => in18(4),
      I4 => \^control\,
      I5 => ADDR_B(4),
      O => D(4)
    );
\ADDR_O[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44FFFF4F440000"
    )
        port map (
      I0 => \ADDR_O[11]_i_2_n_0\,
      I1 => \config_data_int_reg_n_0_[5]\,
      I2 => \ADDR_O[11]_i_3_n_0\,
      I3 => in18(5),
      I4 => \^control\,
      I5 => ADDR_B(5),
      O => D(5)
    );
\ADDR_O[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44FFFF4F440000"
    )
        port map (
      I0 => \ADDR_O[11]_i_2_n_0\,
      I1 => \config_data_int_reg_n_0_[6]\,
      I2 => \ADDR_O[11]_i_3_n_0\,
      I3 => in18(6),
      I4 => \^control\,
      I5 => ADDR_B(6),
      O => D(6)
    );
\ADDR_O[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44FFFF4F440000"
    )
        port map (
      I0 => \ADDR_O[11]_i_2_n_0\,
      I1 => \config_data_int_reg_n_0_[7]\,
      I2 => \ADDR_O[11]_i_3_n_0\,
      I3 => in18(7),
      I4 => \^control\,
      I5 => ADDR_B(7),
      O => D(7)
    );
\ADDR_O[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44FFFF4F440000"
    )
        port map (
      I0 => \ADDR_O[11]_i_2_n_0\,
      I1 => \config_data_int_reg_n_0_[8]\,
      I2 => \ADDR_O[11]_i_3_n_0\,
      I3 => in18(8),
      I4 => \^control\,
      I5 => ADDR_B(8),
      O => D(8)
    );
\ADDR_O[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44FFFF4F440000"
    )
        port map (
      I0 => \ADDR_O[11]_i_2_n_0\,
      I1 => \config_data_int_reg_n_0_[9]\,
      I2 => \ADDR_O[11]_i_3_n_0\,
      I3 => in18(9),
      I4 => \^control\,
      I5 => ADDR_B(9),
      O => D(9)
    );
\BWE_O[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA08FFFFAA080000"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => p_0_in2_in,
      I2 => write_data_end_reg,
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => \^control\,
      I5 => BWE_B(0),
      O => \FSM_onehot_curr_state_reg[1]_0\(0)
    );
\BWE_O[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA08FFFFAA080000"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => p_0_in2_in,
      I2 => write_data_end_reg,
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => \^control\,
      I5 => BWE_B(1),
      O => \FSM_onehot_curr_state_reg[1]_0\(1)
    );
\BWE_O[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA08FFFFAA080000"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => p_0_in2_in,
      I2 => write_data_end_reg,
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => \^control\,
      I5 => BWE_B(2),
      O => \FSM_onehot_curr_state_reg[1]_0\(2)
    );
\BWE_O[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA08FFFFAA080000"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => p_0_in2_in,
      I2 => write_data_end_reg,
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => \^control\,
      I5 => BWE_B(3),
      O => \FSM_onehot_curr_state_reg[1]_0\(3)
    );
\BWE_O[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA08FFFFAA080000"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => p_0_in2_in,
      I2 => write_data_end_reg,
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => \^control\,
      I5 => BWE_B(4),
      O => \FSM_onehot_curr_state_reg[1]_0\(4)
    );
\BWE_O[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA08FFFFAA080000"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => p_0_in2_in,
      I2 => write_data_end_reg,
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => \^control\,
      I5 => BWE_B(5),
      O => \FSM_onehot_curr_state_reg[1]_0\(5)
    );
\BWE_O[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA08FFFFAA080000"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => p_0_in2_in,
      I2 => write_data_end_reg,
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => \^control\,
      I5 => BWE_B(6),
      O => \FSM_onehot_curr_state_reg[1]_0\(6)
    );
\BWE_O[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA08FFFFAA080000"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => p_0_in2_in,
      I2 => write_data_end_reg,
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => \^control\,
      I5 => BWE_B(7),
      O => \FSM_onehot_curr_state_reg[1]_0\(7)
    );
\BWE_O[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA08FFFFAA080000"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => p_0_in2_in,
      I2 => write_data_end_reg,
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => \^control\,
      I5 => BWE_B(8),
      O => \FSM_onehot_curr_state_reg[1]_0\(8)
    );
\DIN_O[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(0),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(0),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(0),
      O => \uram_data_int_r_reg[71]_0\(0)
    );
\DIN_O[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(10),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(10),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(10),
      O => \uram_data_int_r_reg[71]_0\(10)
    );
\DIN_O[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(11),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(11),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(11),
      O => \uram_data_int_r_reg[71]_0\(11)
    );
\DIN_O[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(12),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(12),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(12),
      O => \uram_data_int_r_reg[71]_0\(12)
    );
\DIN_O[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(13),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(13),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(13),
      O => \uram_data_int_r_reg[71]_0\(13)
    );
\DIN_O[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(14),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(14),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(14),
      O => \uram_data_int_r_reg[71]_0\(14)
    );
\DIN_O[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(15),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(15),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(15),
      O => \uram_data_int_r_reg[71]_0\(15)
    );
\DIN_O[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(16),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(16),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(16),
      O => \uram_data_int_r_reg[71]_0\(16)
    );
\DIN_O[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(17),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(17),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(17),
      O => \uram_data_int_r_reg[71]_0\(17)
    );
\DIN_O[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(18),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(18),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(18),
      O => \uram_data_int_r_reg[71]_0\(18)
    );
\DIN_O[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(19),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(19),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(19),
      O => \uram_data_int_r_reg[71]_0\(19)
    );
\DIN_O[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(1),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(1),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(1),
      O => \uram_data_int_r_reg[71]_0\(1)
    );
\DIN_O[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(20),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(20),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(20),
      O => \uram_data_int_r_reg[71]_0\(20)
    );
\DIN_O[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(21),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(21),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(21),
      O => \uram_data_int_r_reg[71]_0\(21)
    );
\DIN_O[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(22),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(22),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(22),
      O => \uram_data_int_r_reg[71]_0\(22)
    );
\DIN_O[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(23),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(23),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(23),
      O => \uram_data_int_r_reg[71]_0\(23)
    );
\DIN_O[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(24),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(24),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(24),
      O => \uram_data_int_r_reg[71]_0\(24)
    );
\DIN_O[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(25),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(25),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(25),
      O => \uram_data_int_r_reg[71]_0\(25)
    );
\DIN_O[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(26),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(26),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(26),
      O => \uram_data_int_r_reg[71]_0\(26)
    );
\DIN_O[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(27),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(27),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(27),
      O => \uram_data_int_r_reg[71]_0\(27)
    );
\DIN_O[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(28),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(28),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(28),
      O => \uram_data_int_r_reg[71]_0\(28)
    );
\DIN_O[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(29),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(29),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(29),
      O => \uram_data_int_r_reg[71]_0\(29)
    );
\DIN_O[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(2),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(2),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(2),
      O => \uram_data_int_r_reg[71]_0\(2)
    );
\DIN_O[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(30),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(0),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(30),
      O => \uram_data_int_r_reg[71]_0\(30)
    );
\DIN_O[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(31),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(1),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(31),
      O => \uram_data_int_r_reg[71]_0\(31)
    );
\DIN_O[32]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(32),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(2),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(32),
      O => \uram_data_int_r_reg[71]_0\(32)
    );
\DIN_O[33]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(33),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(3),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(33),
      O => \uram_data_int_r_reg[71]_0\(33)
    );
\DIN_O[34]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(34),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(4),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(34),
      O => \uram_data_int_r_reg[71]_0\(34)
    );
\DIN_O[35]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(35),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(5),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(35),
      O => \uram_data_int_r_reg[71]_0\(35)
    );
\DIN_O[36]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(36),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(6),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(36),
      O => \uram_data_int_r_reg[71]_0\(36)
    );
\DIN_O[37]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(37),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(7),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(37),
      O => \uram_data_int_r_reg[71]_0\(37)
    );
\DIN_O[38]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(38),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(8),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(38),
      O => \uram_data_int_r_reg[71]_0\(38)
    );
\DIN_O[39]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(39),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(9),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(39),
      O => \uram_data_int_r_reg[71]_0\(39)
    );
\DIN_O[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(3),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(3),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(3),
      O => \uram_data_int_r_reg[71]_0\(3)
    );
\DIN_O[40]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(40),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(10),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(40),
      O => \uram_data_int_r_reg[71]_0\(40)
    );
\DIN_O[41]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(41),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(11),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(41),
      O => \uram_data_int_r_reg[71]_0\(41)
    );
\DIN_O[42]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(42),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(12),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(42),
      O => \uram_data_int_r_reg[71]_0\(42)
    );
\DIN_O[43]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(43),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(13),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(43),
      O => \uram_data_int_r_reg[71]_0\(43)
    );
\DIN_O[44]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(44),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(14),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(44),
      O => \uram_data_int_r_reg[71]_0\(44)
    );
\DIN_O[45]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(45),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(15),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(45),
      O => \uram_data_int_r_reg[71]_0\(45)
    );
\DIN_O[46]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(46),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(16),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(46),
      O => \uram_data_int_r_reg[71]_0\(46)
    );
\DIN_O[47]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(47),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(17),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(47),
      O => \uram_data_int_r_reg[71]_0\(47)
    );
\DIN_O[48]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(48),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(18),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(48),
      O => \uram_data_int_r_reg[71]_0\(48)
    );
\DIN_O[49]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(49),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(19),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(49),
      O => \uram_data_int_r_reg[71]_0\(49)
    );
\DIN_O[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(4),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(4),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(4),
      O => \uram_data_int_r_reg[71]_0\(4)
    );
\DIN_O[50]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(50),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(20),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(50),
      O => \uram_data_int_r_reg[71]_0\(50)
    );
\DIN_O[51]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(51),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(21),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(51),
      O => \uram_data_int_r_reg[71]_0\(51)
    );
\DIN_O[52]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(52),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(22),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(52),
      O => \uram_data_int_r_reg[71]_0\(52)
    );
\DIN_O[53]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(53),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(23),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(53),
      O => \uram_data_int_r_reg[71]_0\(53)
    );
\DIN_O[54]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(54),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(24),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(54),
      O => \uram_data_int_r_reg[71]_0\(54)
    );
\DIN_O[55]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(55),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(25),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(55),
      O => \uram_data_int_r_reg[71]_0\(55)
    );
\DIN_O[56]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(56),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(26),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(56),
      O => \uram_data_int_r_reg[71]_0\(56)
    );
\DIN_O[57]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(57),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(27),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(57),
      O => \uram_data_int_r_reg[71]_0\(57)
    );
\DIN_O[58]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(58),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(28),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(58),
      O => \uram_data_int_r_reg[71]_0\(58)
    );
\DIN_O[59]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(59),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(29),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(59),
      O => \uram_data_int_r_reg[71]_0\(59)
    );
\DIN_O[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(5),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(5),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(5),
      O => \uram_data_int_r_reg[71]_0\(5)
    );
\DIN_O[60]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(60),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(0),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(60),
      O => \uram_data_int_r_reg[71]_0\(60)
    );
\DIN_O[61]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(61),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(1),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(61),
      O => \uram_data_int_r_reg[71]_0\(61)
    );
\DIN_O[62]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(62),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(2),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(62),
      O => \uram_data_int_r_reg[71]_0\(62)
    );
\DIN_O[63]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(63),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(3),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(63),
      O => \uram_data_int_r_reg[71]_0\(63)
    );
\DIN_O[64]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(64),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(4),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(64),
      O => \uram_data_int_r_reg[71]_0\(64)
    );
\DIN_O[65]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(65),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(5),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(65),
      O => \uram_data_int_r_reg[71]_0\(65)
    );
\DIN_O[66]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(66),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(6),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(66),
      O => \uram_data_int_r_reg[71]_0\(66)
    );
\DIN_O[67]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(67),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(7),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(67),
      O => \uram_data_int_r_reg[71]_0\(67)
    );
\DIN_O[68]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(68),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(8),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(68),
      O => \uram_data_int_r_reg[71]_0\(68)
    );
\DIN_O[69]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(69),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(9),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(69),
      O => \uram_data_int_r_reg[71]_0\(69)
    );
\DIN_O[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(6),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(6),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(6),
      O => \uram_data_int_r_reg[71]_0\(6)
    );
\DIN_O[70]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(70),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(10),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(70),
      O => \uram_data_int_r_reg[71]_0\(70)
    );
\DIN_O[71]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(71),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(11),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(71),
      O => \uram_data_int_r_reg[71]_0\(71)
    );
\DIN_O[71]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => write_data_end_reg,
      I2 => p_0_in2_in,
      O => \DIN_O[71]_i_2_n_0\
    );
\DIN_O[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(7),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(7),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(7),
      O => \uram_data_int_r_reg[71]_0\(7)
    );
\DIN_O[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(8),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(8),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(8),
      O => \uram_data_int_r_reg[71]_0\(8)
    );
\DIN_O[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => uram_data_int_r(9),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(9),
      I3 => \DIN_O[71]_i_2_n_0\,
      I4 => \^control\,
      I5 => DIN_B(9),
      O => \uram_data_int_r_reg[71]_0\(9)
    );
EN_O_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFEEEA"
    )
        port map (
      I0 => EN_O_i_2_n_0,
      I1 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      I2 => EN_O_i_3_n_0,
      I3 => \FSM_onehot_curr_state[3]_i_4_n_0\,
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I5 => EN_O_i_4_n_0,
      O => \FSM_onehot_curr_state_reg[3]_0\
    );
EN_O_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFBFBFBBBBBFBBB"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I1 => \^control\,
      I2 => write_config_data_2_0,
      I3 => p_0_in2_in,
      I4 => write_data_end_reg,
      I5 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      O => EN_O_i_2_n_0
    );
EN_O_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_onehot_curr_state[3]_i_6_n_0\,
      I1 => EN_O_i_5_n_0,
      I2 => \FSM_onehot_curr_state[3]_i_5_n_0\,
      I3 => EN_O_i_6_n_0,
      O => EN_O_i_3_n_0
    );
EN_O_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^control\,
      I1 => EN_B,
      O => EN_O_i_4_n_0
    );
EN_O_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => num_reads_r(15),
      I1 => num_reads_r(20),
      I2 => num_reads_r(4),
      I3 => num_reads_r(6),
      O => EN_O_i_5_n_0
    );
EN_O_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => num_reads_r(28),
      I1 => num_reads_r(29),
      I2 => num_reads_r(0),
      I3 => num_reads_r(2),
      O => EN_O_i_6_n_0
    );
\FSM_onehot_curr_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0100"
    )
        port map (
      I0 => \FSM_onehot_curr_state[3]_i_2_n_0\,
      I1 => \FSM_onehot_curr_state[3]_i_3_n_0\,
      I2 => \FSM_onehot_curr_state[3]_i_4_n_0\,
      I3 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      I4 => \FSM_onehot_curr_state[0]_i_2_n_0\,
      O => \FSM_onehot_curr_state[0]_i_1_n_0\
    );
\FSM_onehot_curr_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFD0FFD0FFD0"
    )
        port map (
      I0 => \FSM_onehot_curr_state[5]_i_2_n_0\,
      I1 => \FSM_onehot_curr_state[0]_i_3_n_0\,
      I2 => \FSM_onehot_curr_state_reg_n_0_[6]\,
      I3 => \FSM_onehot_curr_state[0]_i_4_n_0\,
      I4 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I5 => write_config_data_2_0,
      O => \FSM_onehot_curr_state[0]_i_2_n_0\
    );
\FSM_onehot_curr_state[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => in4(2),
      I1 => in4(1),
      O => \FSM_onehot_curr_state[0]_i_3_n_0\
    );
\FSM_onehot_curr_state[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F444F444FFFFF444"
    )
        port map (
      I0 => control_batch_int,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I2 => p_0_in2_in,
      I3 => write_data_end_reg,
      I4 => \FSM_onehot_curr_state_reg_n_0_[0]\,
      I5 => VLD,
      O => \FSM_onehot_curr_state[0]_i_4_n_0\
    );
\FSM_onehot_curr_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => write_data_end_reg,
      I1 => p_0_in2_in,
      I2 => \FSM_onehot_curr_state[2]_i_2_n_0\,
      I3 => in4(0),
      O => \FSM_onehot_curr_state[1]_i_1_n_0\
    );
\FSM_onehot_curr_state[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"444F"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I2 => \FSM_onehot_curr_state[2]_i_2_n_0\,
      I3 => in4(0),
      O => \FSM_onehot_curr_state[2]_i_1_n_0\
    );
\FSM_onehot_curr_state[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[6]\,
      I1 => in4(1),
      I2 => in4(2),
      I3 => \FSM_onehot_curr_state[5]_i_2_n_0\,
      O => \FSM_onehot_curr_state[2]_i_2_n_0\
    );
\FSM_onehot_curr_state[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFAAA8"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      I1 => \FSM_onehot_curr_state[3]_i_2_n_0\,
      I2 => \FSM_onehot_curr_state[3]_i_3_n_0\,
      I3 => \FSM_onehot_curr_state[3]_i_4_n_0\,
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      O => \FSM_onehot_curr_state[3]_i_1_n_0\
    );
\FSM_onehot_curr_state[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => num_reads_r(2),
      I1 => num_reads_r(0),
      I2 => num_reads_r(29),
      I3 => num_reads_r(28),
      I4 => \FSM_onehot_curr_state[3]_i_5_n_0\,
      O => \FSM_onehot_curr_state[3]_i_2_n_0\
    );
\FSM_onehot_curr_state[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => num_reads_r(6),
      I1 => num_reads_r(4),
      I2 => num_reads_r(20),
      I3 => num_reads_r(15),
      I4 => \FSM_onehot_curr_state[3]_i_6_n_0\,
      O => \FSM_onehot_curr_state[3]_i_3_n_0\
    );
\FSM_onehot_curr_state[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \FSM_onehot_curr_state[3]_i_7_n_0\,
      I1 => \FSM_onehot_curr_state[3]_i_8_n_0\,
      I2 => num_reads_r(9),
      I3 => num_reads_r(16),
      I4 => num_reads_r(11),
      I5 => num_reads_r(27),
      O => \FSM_onehot_curr_state[3]_i_4_n_0\
    );
\FSM_onehot_curr_state[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => num_reads_r(5),
      I1 => num_reads_r(17),
      I2 => num_reads_r(3),
      I3 => num_reads_r(25),
      O => \FSM_onehot_curr_state[3]_i_5_n_0\
    );
\FSM_onehot_curr_state[3]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => num_reads_r(7),
      I1 => num_reads_r(12),
      I2 => num_reads_r(14),
      I3 => num_reads_r(21),
      O => \FSM_onehot_curr_state[3]_i_6_n_0\
    );
\FSM_onehot_curr_state[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFFFFF"
    )
        port map (
      I0 => num_reads_r(13),
      I1 => num_reads_r(23),
      I2 => num_reads_r(19),
      I3 => num_reads_r(8),
      I4 => num_reads_r(26),
      I5 => num_reads_r(1),
      O => \FSM_onehot_curr_state[3]_i_7_n_0\
    );
\FSM_onehot_curr_state[3]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => num_reads_r(10),
      I1 => num_reads_r(22),
      I2 => num_reads_r(18),
      I3 => num_reads_r(24),
      O => \FSM_onehot_curr_state[3]_i_8_n_0\
    );
\FSM_onehot_curr_state[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_batch_int,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      O => \FSM_onehot_curr_state[4]_i_1_n_0\
    );
\FSM_onehot_curr_state[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => \FSM_onehot_curr_state[5]_i_2_n_0\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[6]\,
      I2 => in4(2),
      I3 => in4(1),
      O => \FSM_onehot_curr_state[5]_i_1_n_0\
    );
\FSM_onehot_curr_state[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => in4(6),
      I1 => in3(1),
      I2 => in4(3),
      I3 => in4(4),
      I4 => in3(0),
      I5 => in4(5),
      O => \FSM_onehot_curr_state[5]_i_2_n_0\
    );
\FSM_onehot_curr_state[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[0]\,
      I1 => VLD,
      O => config_data_int0
    );
\FSM_onehot_curr_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \FSM_onehot_curr_state[0]_i_1_n_0\,
      Q => \FSM_onehot_curr_state_reg_n_0_[0]\,
      S => RST_CFG2
    );
\FSM_onehot_curr_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \FSM_onehot_curr_state[1]_i_1_n_0\,
      Q => p_0_in2_in,
      R => RST_CFG2
    );
\FSM_onehot_curr_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \FSM_onehot_curr_state[2]_i_1_n_0\,
      Q => \FSM_onehot_curr_state_reg_n_0_[2]\,
      R => RST_CFG2
    );
\FSM_onehot_curr_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \FSM_onehot_curr_state[3]_i_1_n_0\,
      Q => \FSM_onehot_curr_state_reg_n_0_[3]\,
      R => RST_CFG2
    );
\FSM_onehot_curr_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \FSM_onehot_curr_state[4]_i_1_n_0\,
      Q => \FSM_onehot_curr_state_reg_n_0_[4]\,
      R => RST_CFG2
    );
\FSM_onehot_curr_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \FSM_onehot_curr_state[5]_i_1_n_0\,
      Q => \FSM_onehot_curr_state_reg_n_0_[5]\,
      R => RST_CFG2
    );
\FSM_onehot_curr_state_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \FSM_onehot_curr_state_reg_n_0_[7]\,
      Q => \FSM_onehot_curr_state_reg_n_0_[6]\,
      R => RST_CFG2
    );
\FSM_onehot_curr_state_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => config_data_int0,
      Q => \FSM_onehot_curr_state_reg_n_0_[7]\,
      R => RST_CFG2
    );
RDB_WR_O_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA08FFFFAA080000"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => p_0_in2_in,
      I2 => write_data_end_reg,
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => \^control\,
      I5 => RDB_WR_B,
      O => \FSM_onehot_curr_state_reg[1]_1\
    );
\_inferred__4/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__4/i__carry_n_0\,
      CO(2) => \_inferred__4/i__carry_n_1\,
      CO(1) => \_inferred__4/i__carry_n_2\,
      CO(0) => \_inferred__4/i__carry_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry_i_1_n_0\,
      DI(2) => \i__carry_i_2_n_0\,
      DI(1) => \i__carry_i_3_n_0\,
      DI(0) => \i__carry_i_4_n_0\,
      O(3 downto 0) => in18(3 downto 0),
      S(3) => \i__carry_i_5_n_0\,
      S(2) => \i__carry_i_6_n_0\,
      S(1) => \i__carry_i_7_n_0\,
      S(0) => \i__carry_i_8_n_0\
    );
\_inferred__4/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__4/i__carry_n_0\,
      CO(3) => \_inferred__4/i__carry__0_n_0\,
      CO(2) => \_inferred__4/i__carry__0_n_1\,
      CO(1) => \_inferred__4/i__carry__0_n_2\,
      CO(0) => \_inferred__4/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry__0_i_1_n_0\,
      DI(2) => \i__carry__0_i_2_n_0\,
      DI(1) => \i__carry__0_i_3_n_0\,
      DI(0) => \i__carry__0_i_4_n_0\,
      O(3 downto 0) => in18(7 downto 4),
      S(3) => \i__carry__0_i_5_n_0\,
      S(2) => \i__carry__0_i_6_n_0\,
      S(1) => \i__carry__0_i_7_n_0\,
      S(0) => \i__carry__0_i_8_n_0\
    );
\_inferred__4/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__4/i__carry__0_n_0\,
      CO(3) => \NLW__inferred__4/i__carry__1_CO_UNCONNECTED\(3),
      CO(2) => \_inferred__4/i__carry__1_n_1\,
      CO(1) => \_inferred__4/i__carry__1_n_2\,
      CO(0) => \_inferred__4/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \i__carry__1_i_1_n_0\,
      DI(1) => \i__carry__1_i_2_n_0\,
      DI(0) => \i__carry__1_i_3_n_0\,
      O(3 downto 0) => in18(11 downto 8),
      S(3) => \i__carry__1_i_4_n_0\,
      S(2) => \i__carry__1_i_5_n_0\,
      S(1) => \i__carry__1_i_6_n_0\,
      S(0) => \i__carry__1_i_7_n_0\
    );
clk_mux_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^control\,
      O => CE00
    );
\config_data_batch_int[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(0),
      I2 => VLD,
      O => p_1_in(0)
    );
\config_data_batch_int[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(10),
      I2 => VLD,
      O => p_1_in(10)
    );
\config_data_batch_int[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(11),
      I2 => VLD,
      O => p_1_in(11)
    );
\config_data_batch_int[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(12),
      I2 => VLD,
      O => p_1_in(12)
    );
\config_data_batch_int[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(13),
      I2 => VLD,
      O => p_1_in(13)
    );
\config_data_batch_int[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(14),
      I2 => VLD,
      O => p_1_in(14)
    );
\config_data_batch_int[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(15),
      I2 => VLD,
      O => p_1_in(15)
    );
\config_data_batch_int[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(16),
      I2 => VLD,
      O => p_1_in(16)
    );
\config_data_batch_int[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(17),
      I2 => VLD,
      O => p_1_in(17)
    );
\config_data_batch_int[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(18),
      I2 => VLD,
      O => p_1_in(18)
    );
\config_data_batch_int[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(19),
      I2 => VLD,
      O => p_1_in(19)
    );
\config_data_batch_int[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(1),
      I2 => VLD,
      O => p_1_in(1)
    );
\config_data_batch_int[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(20),
      I2 => VLD,
      O => p_1_in(20)
    );
\config_data_batch_int[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(21),
      I2 => VLD,
      O => p_1_in(21)
    );
\config_data_batch_int[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(22),
      I2 => VLD,
      O => p_1_in(22)
    );
\config_data_batch_int[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(23),
      I2 => VLD,
      O => p_1_in(23)
    );
\config_data_batch_int[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(24),
      I2 => VLD,
      O => p_1_in(24)
    );
\config_data_batch_int[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(25),
      I2 => VLD,
      O => p_1_in(25)
    );
\config_data_batch_int[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(26),
      I2 => VLD,
      O => p_1_in(26)
    );
\config_data_batch_int[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(27),
      I2 => VLD,
      O => p_1_in(27)
    );
\config_data_batch_int[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(28),
      I2 => VLD,
      O => p_1_in(28)
    );
\config_data_batch_int[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => VLD,
      I1 => \^control\,
      O => \config_data_batch_int[29]_i_1_n_0\
    );
\config_data_batch_int[29]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(29),
      I2 => VLD,
      O => p_1_in(29)
    );
\config_data_batch_int[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(2),
      I2 => VLD,
      O => p_1_in(2)
    );
\config_data_batch_int[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(3),
      I2 => VLD,
      O => p_1_in(3)
    );
\config_data_batch_int[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(4),
      I2 => VLD,
      O => p_1_in(4)
    );
\config_data_batch_int[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(5),
      I2 => VLD,
      O => p_1_in(5)
    );
\config_data_batch_int[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(6),
      I2 => VLD,
      O => p_1_in(6)
    );
\config_data_batch_int[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(7),
      I2 => VLD,
      O => p_1_in(7)
    );
\config_data_batch_int[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(8),
      I2 => VLD,
      O => p_1_in(8)
    );
\config_data_batch_int[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \^control\,
      I1 => DI(9),
      I2 => VLD,
      O => p_1_in(9)
    );
\config_data_batch_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(0),
      Q => config_data_batch_int(0),
      R => RST_CFG2
    );
\config_data_batch_int_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(10),
      Q => config_data_batch_int(10),
      R => RST_CFG2
    );
\config_data_batch_int_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(11),
      Q => config_data_batch_int(11),
      R => RST_CFG2
    );
\config_data_batch_int_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(12),
      Q => config_data_batch_int(12),
      R => RST_CFG2
    );
\config_data_batch_int_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(13),
      Q => config_data_batch_int(13),
      R => RST_CFG2
    );
\config_data_batch_int_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(14),
      Q => config_data_batch_int(14),
      R => RST_CFG2
    );
\config_data_batch_int_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(15),
      Q => config_data_batch_int(15),
      R => RST_CFG2
    );
\config_data_batch_int_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(16),
      Q => config_data_batch_int(16),
      R => RST_CFG2
    );
\config_data_batch_int_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(17),
      Q => config_data_batch_int(17),
      R => RST_CFG2
    );
\config_data_batch_int_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(18),
      Q => config_data_batch_int(18),
      R => RST_CFG2
    );
\config_data_batch_int_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(19),
      Q => config_data_batch_int(19),
      R => RST_CFG2
    );
\config_data_batch_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(1),
      Q => config_data_batch_int(1),
      R => RST_CFG2
    );
\config_data_batch_int_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(20),
      Q => config_data_batch_int(20),
      R => RST_CFG2
    );
\config_data_batch_int_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(21),
      Q => config_data_batch_int(21),
      R => RST_CFG2
    );
\config_data_batch_int_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(22),
      Q => config_data_batch_int(22),
      R => RST_CFG2
    );
\config_data_batch_int_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(23),
      Q => config_data_batch_int(23),
      R => RST_CFG2
    );
\config_data_batch_int_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(24),
      Q => config_data_batch_int(24),
      R => RST_CFG2
    );
\config_data_batch_int_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(25),
      Q => config_data_batch_int(25),
      R => RST_CFG2
    );
\config_data_batch_int_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(26),
      Q => config_data_batch_int(26),
      R => RST_CFG2
    );
\config_data_batch_int_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(27),
      Q => config_data_batch_int(27),
      R => RST_CFG2
    );
\config_data_batch_int_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(28),
      Q => config_data_batch_int(28),
      R => RST_CFG2
    );
\config_data_batch_int_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(29),
      Q => config_data_batch_int(29),
      R => RST_CFG2
    );
\config_data_batch_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(2),
      Q => config_data_batch_int(2),
      R => RST_CFG2
    );
\config_data_batch_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(3),
      Q => config_data_batch_int(3),
      R => RST_CFG2
    );
\config_data_batch_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(4),
      Q => config_data_batch_int(4),
      R => RST_CFG2
    );
\config_data_batch_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(5),
      Q => config_data_batch_int(5),
      R => RST_CFG2
    );
\config_data_batch_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(6),
      Q => config_data_batch_int(6),
      R => RST_CFG2
    );
\config_data_batch_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(7),
      Q => config_data_batch_int(7),
      R => RST_CFG2
    );
\config_data_batch_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(8),
      Q => config_data_batch_int(8),
      R => RST_CFG2
    );
\config_data_batch_int_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \config_data_batch_int[29]_i_1_n_0\,
      D => p_1_in(9),
      Q => config_data_batch_int(9),
      R => RST_CFG2
    );
\config_data_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(0),
      Q => \config_data_int_reg_n_0_[0]\,
      R => RST_CFG2
    );
\config_data_int_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(10),
      Q => \config_data_int_reg_n_0_[10]\,
      R => RST_CFG2
    );
\config_data_int_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(11),
      Q => \config_data_int_reg_n_0_[11]\,
      R => RST_CFG2
    );
\config_data_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(1),
      Q => \config_data_int_reg_n_0_[1]\,
      R => RST_CFG2
    );
\config_data_int_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(23),
      Q => in4(0),
      R => RST_CFG2
    );
\config_data_int_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(24),
      Q => in4(1),
      R => RST_CFG2
    );
\config_data_int_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(25),
      Q => in4(2),
      R => RST_CFG2
    );
\config_data_int_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(26),
      Q => in4(3),
      R => RST_CFG2
    );
\config_data_int_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(27),
      Q => in4(4),
      R => RST_CFG2
    );
\config_data_int_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(28),
      Q => in4(5),
      R => RST_CFG2
    );
\config_data_int_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(29),
      Q => in4(6),
      R => RST_CFG2
    );
\config_data_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(2),
      Q => \config_data_int_reg_n_0_[2]\,
      R => RST_CFG2
    );
\config_data_int_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(30),
      Q => in3(0),
      R => RST_CFG2
    );
\config_data_int_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(31),
      Q => in3(1),
      R => RST_CFG2
    );
\config_data_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(3),
      Q => \config_data_int_reg_n_0_[3]\,
      R => RST_CFG2
    );
\config_data_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(4),
      Q => \config_data_int_reg_n_0_[4]\,
      R => RST_CFG2
    );
\config_data_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(5),
      Q => \config_data_int_reg_n_0_[5]\,
      R => RST_CFG2
    );
\config_data_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(6),
      Q => \config_data_int_reg_n_0_[6]\,
      R => RST_CFG2
    );
\config_data_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(7),
      Q => \config_data_int_reg_n_0_[7]\,
      R => RST_CFG2
    );
\config_data_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(8),
      Q => \config_data_int_reg_n_0_[8]\,
      R => RST_CFG2
    );
\config_data_int_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => config_data_int0,
      D => DI(9),
      Q => \config_data_int_reg_n_0_[9]\,
      R => RST_CFG2
    );
control_batch_int_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FD55FC00"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[0]\,
      I1 => \ctrl_cnt[9]_i_4_n_0\,
      I2 => control_batch_int_i_2_n_0,
      I3 => VLD,
      I4 => control_batch_int,
      O => control_batch_int_i_1_n_0
    );
control_batch_int_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => ctrl_cnt_reg(2),
      I1 => ctrl_cnt_reg(1),
      I2 => ctrl_cnt_reg(0),
      O => control_batch_int_i_2_n_0
    );
control_batch_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => control_batch_int_i_1_n_0,
      Q => control_batch_int,
      R => RST_CFG2
    );
control_int_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F575F030"
    )
        port map (
      I0 => ctrl_idle_r1,
      I1 => DI(30),
      I2 => VLD,
      I3 => DI(31),
      I4 => \^control\,
      O => control_int_r_i_1_n_0
    );
control_int_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => control_int_r_i_1_n_0,
      Q => \^control\,
      R => RST_CFG2
    );
\ctrl_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => ctrl_cnt_reg(0),
      O => p_0_in(0)
    );
\ctrl_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => ctrl_cnt_reg(0),
      I1 => ctrl_cnt_reg(1),
      O => p_0_in(1)
    );
\ctrl_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => ctrl_cnt_reg(2),
      I1 => ctrl_cnt_reg(0),
      I2 => ctrl_cnt_reg(1),
      O => p_0_in(2)
    );
\ctrl_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => ctrl_cnt_reg(3),
      I1 => ctrl_cnt_reg(1),
      I2 => ctrl_cnt_reg(0),
      I3 => ctrl_cnt_reg(2),
      O => p_0_in(3)
    );
\ctrl_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => ctrl_cnt_reg(2),
      I1 => ctrl_cnt_reg(0),
      I2 => ctrl_cnt_reg(1),
      I3 => ctrl_cnt_reg(3),
      I4 => ctrl_cnt_reg(4),
      O => p_0_in(4)
    );
\ctrl_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => ctrl_cnt_reg(5),
      I1 => ctrl_cnt_reg(2),
      I2 => ctrl_cnt_reg(0),
      I3 => ctrl_cnt_reg(1),
      I4 => ctrl_cnt_reg(3),
      I5 => ctrl_cnt_reg(4),
      O => p_0_in(5)
    );
\ctrl_cnt[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => ctrl_cnt_reg(6),
      I1 => \ctrl_cnt[9]_i_5_n_0\,
      I2 => ctrl_cnt_reg(5),
      O => p_0_in(6)
    );
\ctrl_cnt[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => ctrl_cnt_reg(7),
      I1 => ctrl_cnt_reg(5),
      I2 => \ctrl_cnt[9]_i_5_n_0\,
      I3 => ctrl_cnt_reg(6),
      O => p_0_in(7)
    );
\ctrl_cnt[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => ctrl_cnt_reg(8),
      I1 => ctrl_cnt_reg(6),
      I2 => \ctrl_cnt[9]_i_5_n_0\,
      I3 => ctrl_cnt_reg(5),
      I4 => ctrl_cnt_reg(7),
      O => p_0_in(8)
    );
\ctrl_cnt[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AEAA"
    )
        port map (
      I0 => RST_CFG2,
      I1 => \FSM_onehot_curr_state_reg_n_0_[0]\,
      I2 => VLD,
      I3 => \ctrl_cnt[9]_i_4_n_0\,
      O => \ctrl_cnt[9]_i_1_n_0\
    );
\ctrl_cnt[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => VLD,
      I1 => ctrl_cnt_reg(2),
      I2 => ctrl_cnt_reg(1),
      I3 => ctrl_cnt_reg(0),
      I4 => \ctrl_cnt[9]_i_4_n_0\,
      O => \ctrl_cnt[9]_i_2_n_0\
    );
\ctrl_cnt[9]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => ctrl_cnt_reg(9),
      I1 => ctrl_cnt_reg(7),
      I2 => ctrl_cnt_reg(5),
      I3 => \ctrl_cnt[9]_i_5_n_0\,
      I4 => ctrl_cnt_reg(6),
      I5 => ctrl_cnt_reg(8),
      O => p_0_in(9)
    );
\ctrl_cnt[9]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \ctrl_cnt[9]_i_6_n_0\,
      I1 => ctrl_cnt_reg(5),
      I2 => ctrl_cnt_reg(6),
      I3 => ctrl_cnt_reg(4),
      O => \ctrl_cnt[9]_i_4_n_0\
    );
\ctrl_cnt[9]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => ctrl_cnt_reg(4),
      I1 => ctrl_cnt_reg(3),
      I2 => ctrl_cnt_reg(1),
      I3 => ctrl_cnt_reg(0),
      I4 => ctrl_cnt_reg(2),
      O => \ctrl_cnt[9]_i_5_n_0\
    );
\ctrl_cnt[9]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => ctrl_cnt_reg(8),
      I1 => ctrl_cnt_reg(7),
      I2 => ctrl_cnt_reg(9),
      I3 => ctrl_cnt_reg(3),
      O => \ctrl_cnt[9]_i_6_n_0\
    );
\ctrl_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \ctrl_cnt[9]_i_2_n_0\,
      D => p_0_in(0),
      Q => ctrl_cnt_reg(0),
      R => \ctrl_cnt[9]_i_1_n_0\
    );
\ctrl_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \ctrl_cnt[9]_i_2_n_0\,
      D => p_0_in(1),
      Q => ctrl_cnt_reg(1),
      R => \ctrl_cnt[9]_i_1_n_0\
    );
\ctrl_cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \ctrl_cnt[9]_i_2_n_0\,
      D => p_0_in(2),
      Q => ctrl_cnt_reg(2),
      R => \ctrl_cnt[9]_i_1_n_0\
    );
\ctrl_cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \ctrl_cnt[9]_i_2_n_0\,
      D => p_0_in(3),
      Q => ctrl_cnt_reg(3),
      R => \ctrl_cnt[9]_i_1_n_0\
    );
\ctrl_cnt_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \ctrl_cnt[9]_i_2_n_0\,
      D => p_0_in(4),
      Q => ctrl_cnt_reg(4),
      R => \ctrl_cnt[9]_i_1_n_0\
    );
\ctrl_cnt_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \ctrl_cnt[9]_i_2_n_0\,
      D => p_0_in(5),
      Q => ctrl_cnt_reg(5),
      R => \ctrl_cnt[9]_i_1_n_0\
    );
\ctrl_cnt_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \ctrl_cnt[9]_i_2_n_0\,
      D => p_0_in(6),
      Q => ctrl_cnt_reg(6),
      R => \ctrl_cnt[9]_i_1_n_0\
    );
\ctrl_cnt_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \ctrl_cnt[9]_i_2_n_0\,
      D => p_0_in(7),
      Q => ctrl_cnt_reg(7),
      R => \ctrl_cnt[9]_i_1_n_0\
    );
\ctrl_cnt_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \ctrl_cnt[9]_i_2_n_0\,
      D => p_0_in(8),
      Q => ctrl_cnt_reg(8),
      R => \ctrl_cnt[9]_i_1_n_0\
    );
\ctrl_cnt_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \ctrl_cnt[9]_i_2_n_0\,
      D => p_0_in(9),
      Q => ctrl_cnt_reg(9),
      R => \ctrl_cnt[9]_i_1_n_0\
    );
ctrl_idle_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[0]\,
      I1 => \^control\,
      O => ctrl_idle0
    );
ctrl_idle_r1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => ctrl_idle,
      Q => ctrl_idle_r1,
      R => RST_CFG2
    );
ctrl_idle_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => ctrl_idle0,
      Q => ctrl_idle,
      R => RST_CFG2
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => wr_batch_addr_incr_reg(7),
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => wr_batch_addr_incr_reg(6),
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => wr_batch_addr_incr_reg(5),
      O => \i__carry__0_i_3_n_0\
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => wr_batch_addr_incr_reg(4),
      O => \i__carry__0_i_4_n_0\
    );
\i__carry__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7748774877484848"
    )
        port map (
      I0 => wr_batch_addr_incr_reg(7),
      I1 => p_0_in2_in,
      I2 => \config_data_int_reg_n_0_[7]\,
      I3 => uram_addr_int_r(7),
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I5 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      O => \i__carry__0_i_5_n_0\
    );
\i__carry__0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7748774877484848"
    )
        port map (
      I0 => wr_batch_addr_incr_reg(6),
      I1 => p_0_in2_in,
      I2 => \config_data_int_reg_n_0_[6]\,
      I3 => uram_addr_int_r(6),
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I5 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      O => \i__carry__0_i_6_n_0\
    );
\i__carry__0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7748774877484848"
    )
        port map (
      I0 => wr_batch_addr_incr_reg(5),
      I1 => p_0_in2_in,
      I2 => \config_data_int_reg_n_0_[5]\,
      I3 => uram_addr_int_r(5),
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I5 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      O => \i__carry__0_i_7_n_0\
    );
\i__carry__0_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7748774877484848"
    )
        port map (
      I0 => wr_batch_addr_incr_reg(4),
      I1 => p_0_in2_in,
      I2 => \config_data_int_reg_n_0_[4]\,
      I3 => uram_addr_int_r(4),
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I5 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      O => \i__carry__0_i_8_n_0\
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => wr_batch_addr_incr_reg(10),
      O => \i__carry__1_i_1_n_0\
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => wr_batch_addr_incr_reg(9),
      O => \i__carry__1_i_2_n_0\
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => wr_batch_addr_incr_reg(8),
      O => \i__carry__1_i_3_n_0\
    );
\i__carry__1_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1115EEEACCC0CCC0"
    )
        port map (
      I0 => \config_data_int_reg_n_0_[11]\,
      I1 => uram_addr_int_r(11),
      I2 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I3 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      I4 => wr_batch_addr_incr_reg(11),
      I5 => p_0_in2_in,
      O => \i__carry__1_i_4_n_0\
    );
\i__carry__1_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7748774877484848"
    )
        port map (
      I0 => wr_batch_addr_incr_reg(10),
      I1 => p_0_in2_in,
      I2 => \config_data_int_reg_n_0_[10]\,
      I3 => uram_addr_int_r(10),
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I5 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      O => \i__carry__1_i_5_n_0\
    );
\i__carry__1_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7748774877484848"
    )
        port map (
      I0 => wr_batch_addr_incr_reg(9),
      I1 => p_0_in2_in,
      I2 => \config_data_int_reg_n_0_[9]\,
      I3 => uram_addr_int_r(9),
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I5 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      O => \i__carry__1_i_6_n_0\
    );
\i__carry__1_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7748774877484848"
    )
        port map (
      I0 => wr_batch_addr_incr_reg(8),
      I1 => p_0_in2_in,
      I2 => \config_data_int_reg_n_0_[8]\,
      I3 => uram_addr_int_r(8),
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I5 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      O => \i__carry__1_i_7_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => wr_batch_addr_incr_reg(3),
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => wr_batch_addr_incr_reg(2),
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => wr_batch_addr_incr_reg(1),
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEE"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      I2 => wr_batch_addr_incr_reg(0),
      I3 => p_0_in2_in,
      O => \i__carry_i_4_n_0\
    );
\i__carry_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7748774877484848"
    )
        port map (
      I0 => wr_batch_addr_incr_reg(3),
      I1 => p_0_in2_in,
      I2 => \config_data_int_reg_n_0_[3]\,
      I3 => uram_addr_int_r(3),
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I5 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      O => \i__carry_i_5_n_0\
    );
\i__carry_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7748774877484848"
    )
        port map (
      I0 => wr_batch_addr_incr_reg(2),
      I1 => p_0_in2_in,
      I2 => \config_data_int_reg_n_0_[2]\,
      I3 => uram_addr_int_r(2),
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I5 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      O => \i__carry_i_6_n_0\
    );
\i__carry_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7748774877484848"
    )
        port map (
      I0 => wr_batch_addr_incr_reg(1),
      I1 => p_0_in2_in,
      I2 => \config_data_int_reg_n_0_[1]\,
      I3 => uram_addr_int_r(1),
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I5 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      O => \i__carry_i_7_n_0\
    );
\i__carry_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"003F003F003F4848"
    )
        port map (
      I0 => wr_batch_addr_incr_reg(0),
      I1 => p_0_in2_in,
      I2 => \config_data_int_reg_n_0_[0]\,
      I3 => uram_addr_int_r(0),
      I4 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I5 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      O => \i__carry_i_8_n_0\
    );
num_reads_r0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => num_reads_r0_carry_n_0,
      CO(2) => num_reads_r0_carry_n_1,
      CO(1) => num_reads_r0_carry_n_2,
      CO(0) => num_reads_r0_carry_n_3,
      CYINIT => num_reads_r(0),
      DI(3 downto 0) => num_reads_r(4 downto 1),
      O(3 downto 0) => in22(4 downto 1),
      S(3) => num_reads_r0_carry_i_1_n_0,
      S(2) => num_reads_r0_carry_i_2_n_0,
      S(1) => num_reads_r0_carry_i_3_n_0,
      S(0) => num_reads_r0_carry_i_4_n_0
    );
\num_reads_r0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => num_reads_r0_carry_n_0,
      CO(3) => \num_reads_r0_carry__0_n_0\,
      CO(2) => \num_reads_r0_carry__0_n_1\,
      CO(1) => \num_reads_r0_carry__0_n_2\,
      CO(0) => \num_reads_r0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => num_reads_r(8 downto 5),
      O(3 downto 0) => in22(8 downto 5),
      S(3) => \num_reads_r0_carry__0_i_1_n_0\,
      S(2) => \num_reads_r0_carry__0_i_2_n_0\,
      S(1) => \num_reads_r0_carry__0_i_3_n_0\,
      S(0) => \num_reads_r0_carry__0_i_4_n_0\
    );
\num_reads_r0_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(8),
      O => \num_reads_r0_carry__0_i_1_n_0\
    );
\num_reads_r0_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(7),
      O => \num_reads_r0_carry__0_i_2_n_0\
    );
\num_reads_r0_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(6),
      O => \num_reads_r0_carry__0_i_3_n_0\
    );
\num_reads_r0_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(5),
      O => \num_reads_r0_carry__0_i_4_n_0\
    );
\num_reads_r0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \num_reads_r0_carry__0_n_0\,
      CO(3) => \num_reads_r0_carry__1_n_0\,
      CO(2) => \num_reads_r0_carry__1_n_1\,
      CO(1) => \num_reads_r0_carry__1_n_2\,
      CO(0) => \num_reads_r0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => num_reads_r(12 downto 9),
      O(3 downto 0) => in22(12 downto 9),
      S(3) => \num_reads_r0_carry__1_i_1_n_0\,
      S(2) => \num_reads_r0_carry__1_i_2_n_0\,
      S(1) => \num_reads_r0_carry__1_i_3_n_0\,
      S(0) => \num_reads_r0_carry__1_i_4_n_0\
    );
\num_reads_r0_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(12),
      O => \num_reads_r0_carry__1_i_1_n_0\
    );
\num_reads_r0_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(11),
      O => \num_reads_r0_carry__1_i_2_n_0\
    );
\num_reads_r0_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(10),
      O => \num_reads_r0_carry__1_i_3_n_0\
    );
\num_reads_r0_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(9),
      O => \num_reads_r0_carry__1_i_4_n_0\
    );
\num_reads_r0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \num_reads_r0_carry__1_n_0\,
      CO(3) => \num_reads_r0_carry__2_n_0\,
      CO(2) => \num_reads_r0_carry__2_n_1\,
      CO(1) => \num_reads_r0_carry__2_n_2\,
      CO(0) => \num_reads_r0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => num_reads_r(16 downto 13),
      O(3 downto 0) => in22(16 downto 13),
      S(3) => \num_reads_r0_carry__2_i_1_n_0\,
      S(2) => \num_reads_r0_carry__2_i_2_n_0\,
      S(1) => \num_reads_r0_carry__2_i_3_n_0\,
      S(0) => \num_reads_r0_carry__2_i_4_n_0\
    );
\num_reads_r0_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(16),
      O => \num_reads_r0_carry__2_i_1_n_0\
    );
\num_reads_r0_carry__2_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(15),
      O => \num_reads_r0_carry__2_i_2_n_0\
    );
\num_reads_r0_carry__2_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(14),
      O => \num_reads_r0_carry__2_i_3_n_0\
    );
\num_reads_r0_carry__2_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(13),
      O => \num_reads_r0_carry__2_i_4_n_0\
    );
\num_reads_r0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \num_reads_r0_carry__2_n_0\,
      CO(3) => \num_reads_r0_carry__3_n_0\,
      CO(2) => \num_reads_r0_carry__3_n_1\,
      CO(1) => \num_reads_r0_carry__3_n_2\,
      CO(0) => \num_reads_r0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => num_reads_r(20 downto 17),
      O(3 downto 0) => in22(20 downto 17),
      S(3) => \num_reads_r0_carry__3_i_1_n_0\,
      S(2) => \num_reads_r0_carry__3_i_2_n_0\,
      S(1) => \num_reads_r0_carry__3_i_3_n_0\,
      S(0) => \num_reads_r0_carry__3_i_4_n_0\
    );
\num_reads_r0_carry__3_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(20),
      O => \num_reads_r0_carry__3_i_1_n_0\
    );
\num_reads_r0_carry__3_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(19),
      O => \num_reads_r0_carry__3_i_2_n_0\
    );
\num_reads_r0_carry__3_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(18),
      O => \num_reads_r0_carry__3_i_3_n_0\
    );
\num_reads_r0_carry__3_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(17),
      O => \num_reads_r0_carry__3_i_4_n_0\
    );
\num_reads_r0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \num_reads_r0_carry__3_n_0\,
      CO(3) => \num_reads_r0_carry__4_n_0\,
      CO(2) => \num_reads_r0_carry__4_n_1\,
      CO(1) => \num_reads_r0_carry__4_n_2\,
      CO(0) => \num_reads_r0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => num_reads_r(24 downto 21),
      O(3 downto 0) => in22(24 downto 21),
      S(3) => \num_reads_r0_carry__4_i_1_n_0\,
      S(2) => \num_reads_r0_carry__4_i_2_n_0\,
      S(1) => \num_reads_r0_carry__4_i_3_n_0\,
      S(0) => \num_reads_r0_carry__4_i_4_n_0\
    );
\num_reads_r0_carry__4_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(24),
      O => \num_reads_r0_carry__4_i_1_n_0\
    );
\num_reads_r0_carry__4_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(23),
      O => \num_reads_r0_carry__4_i_2_n_0\
    );
\num_reads_r0_carry__4_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(22),
      O => \num_reads_r0_carry__4_i_3_n_0\
    );
\num_reads_r0_carry__4_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(21),
      O => \num_reads_r0_carry__4_i_4_n_0\
    );
\num_reads_r0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \num_reads_r0_carry__4_n_0\,
      CO(3) => \num_reads_r0_carry__5_n_0\,
      CO(2) => \num_reads_r0_carry__5_n_1\,
      CO(1) => \num_reads_r0_carry__5_n_2\,
      CO(0) => \num_reads_r0_carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => num_reads_r(28 downto 25),
      O(3 downto 0) => in22(28 downto 25),
      S(3) => \num_reads_r0_carry__5_i_1_n_0\,
      S(2) => \num_reads_r0_carry__5_i_2_n_0\,
      S(1) => \num_reads_r0_carry__5_i_3_n_0\,
      S(0) => \num_reads_r0_carry__5_i_4_n_0\
    );
\num_reads_r0_carry__5_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(28),
      O => \num_reads_r0_carry__5_i_1_n_0\
    );
\num_reads_r0_carry__5_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(27),
      O => \num_reads_r0_carry__5_i_2_n_0\
    );
\num_reads_r0_carry__5_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(26),
      O => \num_reads_r0_carry__5_i_3_n_0\
    );
\num_reads_r0_carry__5_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(25),
      O => \num_reads_r0_carry__5_i_4_n_0\
    );
\num_reads_r0_carry__6\: unisim.vcomponents.CARRY4
     port map (
      CI => \num_reads_r0_carry__5_n_0\,
      CO(3 downto 0) => \NLW_num_reads_r0_carry__6_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_num_reads_r0_carry__6_O_UNCONNECTED\(3 downto 1),
      O(0) => in22(29),
      S(3 downto 1) => B"000",
      S(0) => \num_reads_r0_carry__6_i_1_n_0\
    );
\num_reads_r0_carry__6_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(29),
      O => \num_reads_r0_carry__6_i_1_n_0\
    );
num_reads_r0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(4),
      O => num_reads_r0_carry_i_1_n_0
    );
num_reads_r0_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(3),
      O => num_reads_r0_carry_i_2_n_0
    );
num_reads_r0_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(2),
      O => num_reads_r0_carry_i_3_n_0
    );
num_reads_r0_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => num_reads_r(1),
      O => num_reads_r0_carry_i_4_n_0
    );
\num_reads_r[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => config_data_batch_int(0),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => num_reads_r(0),
      O => num_reads_r_1(0)
    );
\num_reads_r[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(10),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(10),
      O => num_reads_r_1(10)
    );
\num_reads_r[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(11),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(11),
      O => num_reads_r_1(11)
    );
\num_reads_r[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(12),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(12),
      O => num_reads_r_1(12)
    );
\num_reads_r[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(13),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(13),
      O => num_reads_r_1(13)
    );
\num_reads_r[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(14),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(14),
      O => num_reads_r_1(14)
    );
\num_reads_r[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(15),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(15),
      O => num_reads_r_1(15)
    );
\num_reads_r[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(16),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(16),
      O => num_reads_r_1(16)
    );
\num_reads_r[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(17),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(17),
      O => num_reads_r_1(17)
    );
\num_reads_r[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(18),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(18),
      O => num_reads_r_1(18)
    );
\num_reads_r[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(19),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(19),
      O => num_reads_r_1(19)
    );
\num_reads_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(1),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(1),
      O => num_reads_r_1(1)
    );
\num_reads_r[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(20),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(20),
      O => num_reads_r_1(20)
    );
\num_reads_r[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(21),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(21),
      O => num_reads_r_1(21)
    );
\num_reads_r[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(22),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(22),
      O => num_reads_r_1(22)
    );
\num_reads_r[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(23),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(23),
      O => num_reads_r_1(23)
    );
\num_reads_r[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(24),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(24),
      O => num_reads_r_1(24)
    );
\num_reads_r[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(25),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(25),
      O => num_reads_r_1(25)
    );
\num_reads_r[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(26),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(26),
      O => num_reads_r_1(26)
    );
\num_reads_r[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(27),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(27),
      O => num_reads_r_1(27)
    );
\num_reads_r[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(28),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(28),
      O => num_reads_r_1(28)
    );
\num_reads_r[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABAA"
    )
        port map (
      I0 => RST_CFG2,
      I1 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      I2 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I3 => \FSM_onehot_curr_state_reg_n_0_[0]\,
      O => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r[29]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[3]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      O => \num_reads_r[29]_i_2_n_0\
    );
\num_reads_r[29]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(29),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(29),
      O => num_reads_r_1(29)
    );
\num_reads_r[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(2),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(2),
      O => num_reads_r_1(2)
    );
\num_reads_r[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(3),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(3),
      O => num_reads_r_1(3)
    );
\num_reads_r[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(4),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(4),
      O => num_reads_r_1(4)
    );
\num_reads_r[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(5),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(5),
      O => num_reads_r_1(5)
    );
\num_reads_r[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(6),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(6),
      O => num_reads_r_1(6)
    );
\num_reads_r[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(7),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(7),
      O => num_reads_r_1(7)
    );
\num_reads_r[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(8),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(8),
      O => num_reads_r_1(8)
    );
\num_reads_r[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => config_data_batch_int(9),
      I1 => \FSM_onehot_curr_state_reg_n_0_[4]\,
      I2 => in22(9),
      O => num_reads_r_1(9)
    );
\num_reads_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(0),
      Q => num_reads_r(0),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(10),
      Q => num_reads_r(10),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(11),
      Q => num_reads_r(11),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(12),
      Q => num_reads_r(12),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(13),
      Q => num_reads_r(13),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(14),
      Q => num_reads_r(14),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(15),
      Q => num_reads_r(15),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(16),
      Q => num_reads_r(16),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(17),
      Q => num_reads_r(17),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(18),
      Q => num_reads_r(18),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(19),
      Q => num_reads_r(19),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(1),
      Q => num_reads_r(1),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(20),
      Q => num_reads_r(20),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(21),
      Q => num_reads_r(21),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(22),
      Q => num_reads_r(22),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(23),
      Q => num_reads_r(23),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(24),
      Q => num_reads_r(24),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(25),
      Q => num_reads_r(25),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(26),
      Q => num_reads_r(26),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(27),
      Q => num_reads_r(27),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(28),
      Q => num_reads_r(28),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(29),
      Q => num_reads_r(29),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(2),
      Q => num_reads_r(2),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(3),
      Q => num_reads_r(3),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(4),
      Q => num_reads_r(4),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(5),
      Q => num_reads_r(5),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(6),
      Q => num_reads_r(6),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(7),
      Q => num_reads_r(7),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(8),
      Q => num_reads_r(8),
      R => \num_reads_r[29]_i_1_n_0\
    );
\num_reads_r_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \num_reads_r[29]_i_2_n_0\,
      D => num_reads_r_1(9),
      Q => num_reads_r(9),
      R => \num_reads_r[29]_i_1_n_0\
    );
\uram_addr_int_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0E0E0E0E0"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I2 => \config_data_int_reg_n_0_[0]\,
      I3 => p_0_in2_in,
      I4 => \num_reads_r[29]_i_2_n_0\,
      I5 => in18(0),
      O => \uram_addr_int_r[0]_i_1_n_0\
    );
\uram_addr_int_r[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0E0E0E0E0"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I2 => \config_data_int_reg_n_0_[10]\,
      I3 => p_0_in2_in,
      I4 => \num_reads_r[29]_i_2_n_0\,
      I5 => in18(10),
      O => \uram_addr_int_r[10]_i_1_n_0\
    );
\uram_addr_int_r[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0E0E0E0E0"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I2 => \config_data_int_reg_n_0_[11]\,
      I3 => p_0_in2_in,
      I4 => \num_reads_r[29]_i_2_n_0\,
      I5 => in18(11),
      O => \uram_addr_int_r[11]_i_1_n_0\
    );
\uram_addr_int_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0E0E0E0E0"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I2 => \config_data_int_reg_n_0_[1]\,
      I3 => p_0_in2_in,
      I4 => \num_reads_r[29]_i_2_n_0\,
      I5 => in18(1),
      O => \uram_addr_int_r[1]_i_1_n_0\
    );
\uram_addr_int_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0E0E0E0E0"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I2 => \config_data_int_reg_n_0_[2]\,
      I3 => p_0_in2_in,
      I4 => \num_reads_r[29]_i_2_n_0\,
      I5 => in18(2),
      O => \uram_addr_int_r[2]_i_1_n_0\
    );
\uram_addr_int_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0E0E0E0E0"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I2 => \config_data_int_reg_n_0_[3]\,
      I3 => p_0_in2_in,
      I4 => \num_reads_r[29]_i_2_n_0\,
      I5 => in18(3),
      O => \uram_addr_int_r[3]_i_1_n_0\
    );
\uram_addr_int_r[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0E0E0E0E0"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I2 => \config_data_int_reg_n_0_[4]\,
      I3 => p_0_in2_in,
      I4 => \num_reads_r[29]_i_2_n_0\,
      I5 => in18(4),
      O => \uram_addr_int_r[4]_i_1_n_0\
    );
\uram_addr_int_r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0E0E0E0E0"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I2 => \config_data_int_reg_n_0_[5]\,
      I3 => p_0_in2_in,
      I4 => \num_reads_r[29]_i_2_n_0\,
      I5 => in18(5),
      O => \uram_addr_int_r[5]_i_1_n_0\
    );
\uram_addr_int_r[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0E0E0E0E0"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I2 => \config_data_int_reg_n_0_[6]\,
      I3 => p_0_in2_in,
      I4 => \num_reads_r[29]_i_2_n_0\,
      I5 => in18(6),
      O => \uram_addr_int_r[6]_i_1_n_0\
    );
\uram_addr_int_r[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0E0E0E0E0"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I2 => \config_data_int_reg_n_0_[7]\,
      I3 => p_0_in2_in,
      I4 => \num_reads_r[29]_i_2_n_0\,
      I5 => in18(7),
      O => \uram_addr_int_r[7]_i_1_n_0\
    );
\uram_addr_int_r[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0E0E0E0E0"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I2 => \config_data_int_reg_n_0_[8]\,
      I3 => p_0_in2_in,
      I4 => \num_reads_r[29]_i_2_n_0\,
      I5 => in18(8),
      O => \uram_addr_int_r[8]_i_1_n_0\
    );
\uram_addr_int_r[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE0E0E0E0E0"
    )
        port map (
      I0 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_curr_state_reg_n_0_[5]\,
      I2 => \config_data_int_reg_n_0_[9]\,
      I3 => p_0_in2_in,
      I4 => \num_reads_r[29]_i_2_n_0\,
      I5 => in18(9),
      O => \uram_addr_int_r[9]_i_1_n_0\
    );
\uram_addr_int_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_addr_int_r[0]_i_1_n_0\,
      Q => uram_addr_int_r(0),
      R => RST_CFG2
    );
\uram_addr_int_r_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_addr_int_r[10]_i_1_n_0\,
      Q => uram_addr_int_r(10),
      R => RST_CFG2
    );
\uram_addr_int_r_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_addr_int_r[11]_i_1_n_0\,
      Q => uram_addr_int_r(11),
      R => RST_CFG2
    );
\uram_addr_int_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_addr_int_r[1]_i_1_n_0\,
      Q => uram_addr_int_r(1),
      R => RST_CFG2
    );
\uram_addr_int_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_addr_int_r[2]_i_1_n_0\,
      Q => uram_addr_int_r(2),
      R => RST_CFG2
    );
\uram_addr_int_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_addr_int_r[3]_i_1_n_0\,
      Q => uram_addr_int_r(3),
      R => RST_CFG2
    );
\uram_addr_int_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_addr_int_r[4]_i_1_n_0\,
      Q => uram_addr_int_r(4),
      R => RST_CFG2
    );
\uram_addr_int_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_addr_int_r[5]_i_1_n_0\,
      Q => uram_addr_int_r(5),
      R => RST_CFG2
    );
\uram_addr_int_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_addr_int_r[6]_i_1_n_0\,
      Q => uram_addr_int_r(6),
      R => RST_CFG2
    );
\uram_addr_int_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_addr_int_r[7]_i_1_n_0\,
      Q => uram_addr_int_r(7),
      R => RST_CFG2
    );
\uram_addr_int_r_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_addr_int_r[8]_i_1_n_0\,
      Q => uram_addr_int_r(8),
      R => RST_CFG2
    );
\uram_addr_int_r_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_addr_int_r[9]_i_1_n_0\,
      Q => uram_addr_int_r(9),
      R => RST_CFG2
    );
\uram_data_int_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(0),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(0),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[0]_i_1_n_0\
    );
\uram_data_int_r[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(10),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(10),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[10]_i_1_n_0\
    );
\uram_data_int_r[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(11),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(11),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[11]_i_1_n_0\
    );
\uram_data_int_r[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(12),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(12),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[12]_i_1_n_0\
    );
\uram_data_int_r[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(13),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(13),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[13]_i_1_n_0\
    );
\uram_data_int_r[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(14),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(14),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[14]_i_1_n_0\
    );
\uram_data_int_r[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(15),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(15),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[15]_i_1_n_0\
    );
\uram_data_int_r[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(16),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(16),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[16]_i_1_n_0\
    );
\uram_data_int_r[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(17),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(17),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[17]_i_1_n_0\
    );
\uram_data_int_r[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(18),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(18),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[18]_i_1_n_0\
    );
\uram_data_int_r[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(19),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(19),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[19]_i_1_n_0\
    );
\uram_data_int_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(1),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(1),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[1]_i_1_n_0\
    );
\uram_data_int_r[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(20),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(20),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[20]_i_1_n_0\
    );
\uram_data_int_r[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(21),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(21),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[21]_i_1_n_0\
    );
\uram_data_int_r[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(22),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(22),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[22]_i_1_n_0\
    );
\uram_data_int_r[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(23),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(23),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[23]_i_1_n_0\
    );
\uram_data_int_r[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(24),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(24),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[24]_i_1_n_0\
    );
\uram_data_int_r[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(25),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(25),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[25]_i_1_n_0\
    );
\uram_data_int_r[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(26),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(26),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[26]_i_1_n_0\
    );
\uram_data_int_r[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(27),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(27),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[27]_i_1_n_0\
    );
\uram_data_int_r[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(28),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(28),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[28]_i_1_n_0\
    );
\uram_data_int_r[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(29),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(29),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[29]_i_1_n_0\
    );
\uram_data_int_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(2),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(2),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[2]_i_1_n_0\
    );
\uram_data_int_r[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(30),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(0),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[30]_i_1_n_0\
    );
\uram_data_int_r[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(31),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(1),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[31]_i_1_n_0\
    );
\uram_data_int_r[32]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(32),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(2),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[32]_i_1_n_0\
    );
\uram_data_int_r[33]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(33),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(3),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[33]_i_1_n_0\
    );
\uram_data_int_r[34]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(34),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(4),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[34]_i_1_n_0\
    );
\uram_data_int_r[35]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(35),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(5),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[35]_i_1_n_0\
    );
\uram_data_int_r[36]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(36),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(6),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[36]_i_1_n_0\
    );
\uram_data_int_r[37]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(37),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(7),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[37]_i_1_n_0\
    );
\uram_data_int_r[38]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(38),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(8),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[38]_i_1_n_0\
    );
\uram_data_int_r[39]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(39),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(9),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[39]_i_1_n_0\
    );
\uram_data_int_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(3),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(3),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[3]_i_1_n_0\
    );
\uram_data_int_r[40]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(40),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(10),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[40]_i_1_n_0\
    );
\uram_data_int_r[41]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(41),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(11),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[41]_i_1_n_0\
    );
\uram_data_int_r[42]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(42),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(12),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[42]_i_1_n_0\
    );
\uram_data_int_r[43]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(43),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(13),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[43]_i_1_n_0\
    );
\uram_data_int_r[44]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(44),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(14),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[44]_i_1_n_0\
    );
\uram_data_int_r[45]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(45),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(15),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[45]_i_1_n_0\
    );
\uram_data_int_r[46]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(46),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(16),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[46]_i_1_n_0\
    );
\uram_data_int_r[47]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(47),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(17),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[47]_i_1_n_0\
    );
\uram_data_int_r[48]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(48),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(18),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[48]_i_1_n_0\
    );
\uram_data_int_r[49]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(49),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(19),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[49]_i_1_n_0\
    );
\uram_data_int_r[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(4),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(4),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[4]_i_1_n_0\
    );
\uram_data_int_r[50]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(50),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(20),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[50]_i_1_n_0\
    );
\uram_data_int_r[51]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(51),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(21),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[51]_i_1_n_0\
    );
\uram_data_int_r[52]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(52),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(22),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[52]_i_1_n_0\
    );
\uram_data_int_r[53]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(53),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(23),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[53]_i_1_n_0\
    );
\uram_data_int_r[54]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(54),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(24),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[54]_i_1_n_0\
    );
\uram_data_int_r[55]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(55),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(25),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[55]_i_1_n_0\
    );
\uram_data_int_r[56]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(56),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(26),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[56]_i_1_n_0\
    );
\uram_data_int_r[57]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(57),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(27),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[57]_i_1_n_0\
    );
\uram_data_int_r[58]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(58),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(28),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[58]_i_1_n_0\
    );
\uram_data_int_r[59]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(59),
      I1 => write_config_data_2_0,
      I2 => write_config_data_1(29),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[59]_i_1_n_0\
    );
\uram_data_int_r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(5),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(5),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[5]_i_1_n_0\
    );
\uram_data_int_r[60]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(60),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(0),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[60]_i_1_n_0\
    );
\uram_data_int_r[61]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(61),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(1),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[61]_i_1_n_0\
    );
\uram_data_int_r[62]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(62),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(2),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[62]_i_1_n_0\
    );
\uram_data_int_r[63]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(63),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(3),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[63]_i_1_n_0\
    );
\uram_data_int_r[64]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(64),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(4),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[64]_i_1_n_0\
    );
\uram_data_int_r[65]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(65),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(5),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[65]_i_1_n_0\
    );
\uram_data_int_r[66]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(66),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(6),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[66]_i_1_n_0\
    );
\uram_data_int_r[67]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(67),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(7),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[67]_i_1_n_0\
    );
\uram_data_int_r[68]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(68),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(8),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[68]_i_1_n_0\
    );
\uram_data_int_r[69]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(69),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(9),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[69]_i_1_n_0\
    );
\uram_data_int_r[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(6),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(6),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[6]_i_1_n_0\
    );
\uram_data_int_r[70]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(70),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(10),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[70]_i_1_n_0\
    );
\uram_data_int_r[71]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(71),
      I1 => write_config_data_2_0,
      I2 => write_config_data_2(11),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[71]_i_1_n_0\
    );
\uram_data_int_r[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(7),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(7),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[7]_i_1_n_0\
    );
\uram_data_int_r[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(8),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(8),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[8]_i_1_n_0\
    );
\uram_data_int_r[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E200E2E2E200E200"
    )
        port map (
      I0 => uram_data_int_r(9),
      I1 => write_config_data_2_0,
      I2 => write_config_data_0(9),
      I3 => \FSM_onehot_curr_state_reg_n_0_[2]\,
      I4 => write_data_end_reg,
      I5 => p_0_in2_in,
      O => \uram_data_int_r[9]_i_1_n_0\
    );
\uram_data_int_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[0]_i_1_n_0\,
      Q => uram_data_int_r(0),
      R => RST_CFG2
    );
\uram_data_int_r_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[10]_i_1_n_0\,
      Q => uram_data_int_r(10),
      R => RST_CFG2
    );
\uram_data_int_r_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[11]_i_1_n_0\,
      Q => uram_data_int_r(11),
      R => RST_CFG2
    );
\uram_data_int_r_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[12]_i_1_n_0\,
      Q => uram_data_int_r(12),
      R => RST_CFG2
    );
\uram_data_int_r_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[13]_i_1_n_0\,
      Q => uram_data_int_r(13),
      R => RST_CFG2
    );
\uram_data_int_r_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[14]_i_1_n_0\,
      Q => uram_data_int_r(14),
      R => RST_CFG2
    );
\uram_data_int_r_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[15]_i_1_n_0\,
      Q => uram_data_int_r(15),
      R => RST_CFG2
    );
\uram_data_int_r_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[16]_i_1_n_0\,
      Q => uram_data_int_r(16),
      R => RST_CFG2
    );
\uram_data_int_r_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[17]_i_1_n_0\,
      Q => uram_data_int_r(17),
      R => RST_CFG2
    );
\uram_data_int_r_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[18]_i_1_n_0\,
      Q => uram_data_int_r(18),
      R => RST_CFG2
    );
\uram_data_int_r_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[19]_i_1_n_0\,
      Q => uram_data_int_r(19),
      R => RST_CFG2
    );
\uram_data_int_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[1]_i_1_n_0\,
      Q => uram_data_int_r(1),
      R => RST_CFG2
    );
\uram_data_int_r_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[20]_i_1_n_0\,
      Q => uram_data_int_r(20),
      R => RST_CFG2
    );
\uram_data_int_r_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[21]_i_1_n_0\,
      Q => uram_data_int_r(21),
      R => RST_CFG2
    );
\uram_data_int_r_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[22]_i_1_n_0\,
      Q => uram_data_int_r(22),
      R => RST_CFG2
    );
\uram_data_int_r_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[23]_i_1_n_0\,
      Q => uram_data_int_r(23),
      R => RST_CFG2
    );
\uram_data_int_r_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[24]_i_1_n_0\,
      Q => uram_data_int_r(24),
      R => RST_CFG2
    );
\uram_data_int_r_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[25]_i_1_n_0\,
      Q => uram_data_int_r(25),
      R => RST_CFG2
    );
\uram_data_int_r_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[26]_i_1_n_0\,
      Q => uram_data_int_r(26),
      R => RST_CFG2
    );
\uram_data_int_r_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[27]_i_1_n_0\,
      Q => uram_data_int_r(27),
      R => RST_CFG2
    );
\uram_data_int_r_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[28]_i_1_n_0\,
      Q => uram_data_int_r(28),
      R => RST_CFG2
    );
\uram_data_int_r_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[29]_i_1_n_0\,
      Q => uram_data_int_r(29),
      R => RST_CFG2
    );
\uram_data_int_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[2]_i_1_n_0\,
      Q => uram_data_int_r(2),
      R => RST_CFG2
    );
\uram_data_int_r_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[30]_i_1_n_0\,
      Q => uram_data_int_r(30),
      R => RST_CFG2
    );
\uram_data_int_r_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[31]_i_1_n_0\,
      Q => uram_data_int_r(31),
      R => RST_CFG2
    );
\uram_data_int_r_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[32]_i_1_n_0\,
      Q => uram_data_int_r(32),
      R => RST_CFG2
    );
\uram_data_int_r_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[33]_i_1_n_0\,
      Q => uram_data_int_r(33),
      R => RST_CFG2
    );
\uram_data_int_r_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[34]_i_1_n_0\,
      Q => uram_data_int_r(34),
      R => RST_CFG2
    );
\uram_data_int_r_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[35]_i_1_n_0\,
      Q => uram_data_int_r(35),
      R => RST_CFG2
    );
\uram_data_int_r_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[36]_i_1_n_0\,
      Q => uram_data_int_r(36),
      R => RST_CFG2
    );
\uram_data_int_r_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[37]_i_1_n_0\,
      Q => uram_data_int_r(37),
      R => RST_CFG2
    );
\uram_data_int_r_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[38]_i_1_n_0\,
      Q => uram_data_int_r(38),
      R => RST_CFG2
    );
\uram_data_int_r_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[39]_i_1_n_0\,
      Q => uram_data_int_r(39),
      R => RST_CFG2
    );
\uram_data_int_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[3]_i_1_n_0\,
      Q => uram_data_int_r(3),
      R => RST_CFG2
    );
\uram_data_int_r_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[40]_i_1_n_0\,
      Q => uram_data_int_r(40),
      R => RST_CFG2
    );
\uram_data_int_r_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[41]_i_1_n_0\,
      Q => uram_data_int_r(41),
      R => RST_CFG2
    );
\uram_data_int_r_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[42]_i_1_n_0\,
      Q => uram_data_int_r(42),
      R => RST_CFG2
    );
\uram_data_int_r_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[43]_i_1_n_0\,
      Q => uram_data_int_r(43),
      R => RST_CFG2
    );
\uram_data_int_r_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[44]_i_1_n_0\,
      Q => uram_data_int_r(44),
      R => RST_CFG2
    );
\uram_data_int_r_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[45]_i_1_n_0\,
      Q => uram_data_int_r(45),
      R => RST_CFG2
    );
\uram_data_int_r_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[46]_i_1_n_0\,
      Q => uram_data_int_r(46),
      R => RST_CFG2
    );
\uram_data_int_r_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[47]_i_1_n_0\,
      Q => uram_data_int_r(47),
      R => RST_CFG2
    );
\uram_data_int_r_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[48]_i_1_n_0\,
      Q => uram_data_int_r(48),
      R => RST_CFG2
    );
\uram_data_int_r_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[49]_i_1_n_0\,
      Q => uram_data_int_r(49),
      R => RST_CFG2
    );
\uram_data_int_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[4]_i_1_n_0\,
      Q => uram_data_int_r(4),
      R => RST_CFG2
    );
\uram_data_int_r_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[50]_i_1_n_0\,
      Q => uram_data_int_r(50),
      R => RST_CFG2
    );
\uram_data_int_r_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[51]_i_1_n_0\,
      Q => uram_data_int_r(51),
      R => RST_CFG2
    );
\uram_data_int_r_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[52]_i_1_n_0\,
      Q => uram_data_int_r(52),
      R => RST_CFG2
    );
\uram_data_int_r_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[53]_i_1_n_0\,
      Q => uram_data_int_r(53),
      R => RST_CFG2
    );
\uram_data_int_r_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[54]_i_1_n_0\,
      Q => uram_data_int_r(54),
      R => RST_CFG2
    );
\uram_data_int_r_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[55]_i_1_n_0\,
      Q => uram_data_int_r(55),
      R => RST_CFG2
    );
\uram_data_int_r_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[56]_i_1_n_0\,
      Q => uram_data_int_r(56),
      R => RST_CFG2
    );
\uram_data_int_r_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[57]_i_1_n_0\,
      Q => uram_data_int_r(57),
      R => RST_CFG2
    );
\uram_data_int_r_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[58]_i_1_n_0\,
      Q => uram_data_int_r(58),
      R => RST_CFG2
    );
\uram_data_int_r_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[59]_i_1_n_0\,
      Q => uram_data_int_r(59),
      R => RST_CFG2
    );
\uram_data_int_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[5]_i_1_n_0\,
      Q => uram_data_int_r(5),
      R => RST_CFG2
    );
\uram_data_int_r_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[60]_i_1_n_0\,
      Q => uram_data_int_r(60),
      R => RST_CFG2
    );
\uram_data_int_r_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[61]_i_1_n_0\,
      Q => uram_data_int_r(61),
      R => RST_CFG2
    );
\uram_data_int_r_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[62]_i_1_n_0\,
      Q => uram_data_int_r(62),
      R => RST_CFG2
    );
\uram_data_int_r_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[63]_i_1_n_0\,
      Q => uram_data_int_r(63),
      R => RST_CFG2
    );
\uram_data_int_r_reg[64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[64]_i_1_n_0\,
      Q => uram_data_int_r(64),
      R => RST_CFG2
    );
\uram_data_int_r_reg[65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[65]_i_1_n_0\,
      Q => uram_data_int_r(65),
      R => RST_CFG2
    );
\uram_data_int_r_reg[66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[66]_i_1_n_0\,
      Q => uram_data_int_r(66),
      R => RST_CFG2
    );
\uram_data_int_r_reg[67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[67]_i_1_n_0\,
      Q => uram_data_int_r(67),
      R => RST_CFG2
    );
\uram_data_int_r_reg[68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[68]_i_1_n_0\,
      Q => uram_data_int_r(68),
      R => RST_CFG2
    );
\uram_data_int_r_reg[69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[69]_i_1_n_0\,
      Q => uram_data_int_r(69),
      R => RST_CFG2
    );
\uram_data_int_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[6]_i_1_n_0\,
      Q => uram_data_int_r(6),
      R => RST_CFG2
    );
\uram_data_int_r_reg[70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[70]_i_1_n_0\,
      Q => uram_data_int_r(70),
      R => RST_CFG2
    );
\uram_data_int_r_reg[71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[71]_i_1_n_0\,
      Q => uram_data_int_r(71),
      R => RST_CFG2
    );
\uram_data_int_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[7]_i_1_n_0\,
      Q => uram_data_int_r(7),
      R => RST_CFG2
    );
\uram_data_int_r_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[8]_i_1_n_0\,
      Q => uram_data_int_r(8),
      R => RST_CFG2
    );
\uram_data_int_r_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \uram_data_int_r[9]_i_1_n_0\,
      Q => uram_data_int_r(9),
      R => RST_CFG2
    );
\wr_batch_addr_incr[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => RST_CFG2,
      I1 => write_config_data_2_0,
      I2 => \FSM_onehot_curr_state_reg_n_0_[0]\,
      O => \wr_batch_addr_incr[0]_i_1_n_0\
    );
\wr_batch_addr_incr[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \write_data_cnt_reg_n_0_[1]\,
      I1 => \write_data_cnt_reg_n_0_[0]\,
      O => write_config_data_2_0
    );
\wr_batch_addr_incr[0]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wr_batch_addr_incr_reg(0),
      O => \wr_batch_addr_incr[0]_i_4_n_0\
    );
\wr_batch_addr_incr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => write_config_data_2_0,
      D => \wr_batch_addr_incr_reg[0]_i_3_n_7\,
      Q => wr_batch_addr_incr_reg(0),
      R => \wr_batch_addr_incr[0]_i_1_n_0\
    );
\wr_batch_addr_incr_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wr_batch_addr_incr_reg[0]_i_3_n_0\,
      CO(2) => \wr_batch_addr_incr_reg[0]_i_3_n_1\,
      CO(1) => \wr_batch_addr_incr_reg[0]_i_3_n_2\,
      CO(0) => \wr_batch_addr_incr_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \wr_batch_addr_incr_reg[0]_i_3_n_4\,
      O(2) => \wr_batch_addr_incr_reg[0]_i_3_n_5\,
      O(1) => \wr_batch_addr_incr_reg[0]_i_3_n_6\,
      O(0) => \wr_batch_addr_incr_reg[0]_i_3_n_7\,
      S(3 downto 1) => wr_batch_addr_incr_reg(3 downto 1),
      S(0) => \wr_batch_addr_incr[0]_i_4_n_0\
    );
\wr_batch_addr_incr_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => write_config_data_2_0,
      D => \wr_batch_addr_incr_reg[8]_i_1_n_5\,
      Q => wr_batch_addr_incr_reg(10),
      R => \wr_batch_addr_incr[0]_i_1_n_0\
    );
\wr_batch_addr_incr_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => write_config_data_2_0,
      D => \wr_batch_addr_incr_reg[8]_i_1_n_4\,
      Q => wr_batch_addr_incr_reg(11),
      R => \wr_batch_addr_incr[0]_i_1_n_0\
    );
\wr_batch_addr_incr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => write_config_data_2_0,
      D => \wr_batch_addr_incr_reg[0]_i_3_n_6\,
      Q => wr_batch_addr_incr_reg(1),
      R => \wr_batch_addr_incr[0]_i_1_n_0\
    );
\wr_batch_addr_incr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => write_config_data_2_0,
      D => \wr_batch_addr_incr_reg[0]_i_3_n_5\,
      Q => wr_batch_addr_incr_reg(2),
      R => \wr_batch_addr_incr[0]_i_1_n_0\
    );
\wr_batch_addr_incr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => write_config_data_2_0,
      D => \wr_batch_addr_incr_reg[0]_i_3_n_4\,
      Q => wr_batch_addr_incr_reg(3),
      R => \wr_batch_addr_incr[0]_i_1_n_0\
    );
\wr_batch_addr_incr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => write_config_data_2_0,
      D => \wr_batch_addr_incr_reg[4]_i_1_n_7\,
      Q => wr_batch_addr_incr_reg(4),
      R => \wr_batch_addr_incr[0]_i_1_n_0\
    );
\wr_batch_addr_incr_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wr_batch_addr_incr_reg[0]_i_3_n_0\,
      CO(3) => \wr_batch_addr_incr_reg[4]_i_1_n_0\,
      CO(2) => \wr_batch_addr_incr_reg[4]_i_1_n_1\,
      CO(1) => \wr_batch_addr_incr_reg[4]_i_1_n_2\,
      CO(0) => \wr_batch_addr_incr_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wr_batch_addr_incr_reg[4]_i_1_n_4\,
      O(2) => \wr_batch_addr_incr_reg[4]_i_1_n_5\,
      O(1) => \wr_batch_addr_incr_reg[4]_i_1_n_6\,
      O(0) => \wr_batch_addr_incr_reg[4]_i_1_n_7\,
      S(3 downto 0) => wr_batch_addr_incr_reg(7 downto 4)
    );
\wr_batch_addr_incr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => write_config_data_2_0,
      D => \wr_batch_addr_incr_reg[4]_i_1_n_6\,
      Q => wr_batch_addr_incr_reg(5),
      R => \wr_batch_addr_incr[0]_i_1_n_0\
    );
\wr_batch_addr_incr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => write_config_data_2_0,
      D => \wr_batch_addr_incr_reg[4]_i_1_n_5\,
      Q => wr_batch_addr_incr_reg(6),
      R => \wr_batch_addr_incr[0]_i_1_n_0\
    );
\wr_batch_addr_incr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => write_config_data_2_0,
      D => \wr_batch_addr_incr_reg[4]_i_1_n_4\,
      Q => wr_batch_addr_incr_reg(7),
      R => \wr_batch_addr_incr[0]_i_1_n_0\
    );
\wr_batch_addr_incr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => write_config_data_2_0,
      D => \wr_batch_addr_incr_reg[8]_i_1_n_7\,
      Q => wr_batch_addr_incr_reg(8),
      R => \wr_batch_addr_incr[0]_i_1_n_0\
    );
\wr_batch_addr_incr_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wr_batch_addr_incr_reg[4]_i_1_n_0\,
      CO(3) => \NLW_wr_batch_addr_incr_reg[8]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \wr_batch_addr_incr_reg[8]_i_1_n_1\,
      CO(1) => \wr_batch_addr_incr_reg[8]_i_1_n_2\,
      CO(0) => \wr_batch_addr_incr_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wr_batch_addr_incr_reg[8]_i_1_n_4\,
      O(2) => \wr_batch_addr_incr_reg[8]_i_1_n_5\,
      O(1) => \wr_batch_addr_incr_reg[8]_i_1_n_6\,
      O(0) => \wr_batch_addr_incr_reg[8]_i_1_n_7\,
      S(3 downto 0) => wr_batch_addr_incr_reg(11 downto 8)
    );
\wr_batch_addr_incr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => write_config_data_2_0,
      D => \wr_batch_addr_incr_reg[8]_i_1_n_6\,
      Q => wr_batch_addr_incr_reg(9),
      R => \wr_batch_addr_incr[0]_i_1_n_0\
    );
\write_config_data_0[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(0),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[0]_i_1_n_0\
    );
\write_config_data_0[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(10),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[10]_i_1_n_0\
    );
\write_config_data_0[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(11),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[11]_i_1_n_0\
    );
\write_config_data_0[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(12),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[12]_i_1_n_0\
    );
\write_config_data_0[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(13),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[13]_i_1_n_0\
    );
\write_config_data_0[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(14),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[14]_i_1_n_0\
    );
\write_config_data_0[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(15),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[15]_i_1_n_0\
    );
\write_config_data_0[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(16),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[16]_i_1_n_0\
    );
\write_config_data_0[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(17),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[17]_i_1_n_0\
    );
\write_config_data_0[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(18),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[18]_i_1_n_0\
    );
\write_config_data_0[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(19),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[19]_i_1_n_0\
    );
\write_config_data_0[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(1),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[1]_i_1_n_0\
    );
\write_config_data_0[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(20),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[20]_i_1_n_0\
    );
\write_config_data_0[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(21),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[21]_i_1_n_0\
    );
\write_config_data_0[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(22),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[22]_i_1_n_0\
    );
\write_config_data_0[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(23),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[23]_i_1_n_0\
    );
\write_config_data_0[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(24),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[24]_i_1_n_0\
    );
\write_config_data_0[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(25),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[25]_i_1_n_0\
    );
\write_config_data_0[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(26),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[26]_i_1_n_0\
    );
\write_config_data_0[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(27),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[27]_i_1_n_0\
    );
\write_config_data_0[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(28),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[28]_i_1_n_0\
    );
\write_config_data_0[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAABAA"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => \write_data_cnt_reg_n_0_[0]\,
      I2 => DI(31),
      I3 => VLD,
      I4 => DI(30),
      I5 => \write_data_cnt_reg_n_0_[1]\,
      O => \write_config_data_0[29]_i_1_n_0\
    );
\write_config_data_0[29]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(29),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[29]_i_2_n_0\
    );
\write_config_data_0[29]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF0FFFFFFFEFF"
    )
        port map (
      I0 => \write_data_cnt_reg_n_0_[0]\,
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => DI(30),
      I3 => VLD,
      I4 => DI(31),
      I5 => p_0_in2_in,
      O => \write_config_data_0[29]_i_3_n_0\
    );
\write_config_data_0[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(2),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[2]_i_1_n_0\
    );
\write_config_data_0[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(3),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[3]_i_1_n_0\
    );
\write_config_data_0[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(4),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[4]_i_1_n_0\
    );
\write_config_data_0[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(5),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[5]_i_1_n_0\
    );
\write_config_data_0[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(6),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[6]_i_1_n_0\
    );
\write_config_data_0[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(7),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[7]_i_1_n_0\
    );
\write_config_data_0[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(8),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[8]_i_1_n_0\
    );
\write_config_data_0[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => DI(9),
      I1 => \write_config_data_0[29]_i_3_n_0\,
      O => \write_config_data_0[9]_i_1_n_0\
    );
\write_config_data_0_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[0]_i_1_n_0\,
      Q => write_config_data_0(0),
      R => RST_CFG2
    );
\write_config_data_0_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[10]_i_1_n_0\,
      Q => write_config_data_0(10),
      R => RST_CFG2
    );
\write_config_data_0_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[11]_i_1_n_0\,
      Q => write_config_data_0(11),
      R => RST_CFG2
    );
\write_config_data_0_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[12]_i_1_n_0\,
      Q => write_config_data_0(12),
      R => RST_CFG2
    );
\write_config_data_0_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[13]_i_1_n_0\,
      Q => write_config_data_0(13),
      R => RST_CFG2
    );
\write_config_data_0_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[14]_i_1_n_0\,
      Q => write_config_data_0(14),
      R => RST_CFG2
    );
\write_config_data_0_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[15]_i_1_n_0\,
      Q => write_config_data_0(15),
      R => RST_CFG2
    );
\write_config_data_0_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[16]_i_1_n_0\,
      Q => write_config_data_0(16),
      R => RST_CFG2
    );
\write_config_data_0_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[17]_i_1_n_0\,
      Q => write_config_data_0(17),
      R => RST_CFG2
    );
\write_config_data_0_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[18]_i_1_n_0\,
      Q => write_config_data_0(18),
      R => RST_CFG2
    );
\write_config_data_0_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[19]_i_1_n_0\,
      Q => write_config_data_0(19),
      R => RST_CFG2
    );
\write_config_data_0_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[1]_i_1_n_0\,
      Q => write_config_data_0(1),
      R => RST_CFG2
    );
\write_config_data_0_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[20]_i_1_n_0\,
      Q => write_config_data_0(20),
      R => RST_CFG2
    );
\write_config_data_0_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[21]_i_1_n_0\,
      Q => write_config_data_0(21),
      R => RST_CFG2
    );
\write_config_data_0_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[22]_i_1_n_0\,
      Q => write_config_data_0(22),
      R => RST_CFG2
    );
\write_config_data_0_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[23]_i_1_n_0\,
      Q => write_config_data_0(23),
      R => RST_CFG2
    );
\write_config_data_0_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[24]_i_1_n_0\,
      Q => write_config_data_0(24),
      R => RST_CFG2
    );
\write_config_data_0_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[25]_i_1_n_0\,
      Q => write_config_data_0(25),
      R => RST_CFG2
    );
\write_config_data_0_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[26]_i_1_n_0\,
      Q => write_config_data_0(26),
      R => RST_CFG2
    );
\write_config_data_0_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[27]_i_1_n_0\,
      Q => write_config_data_0(27),
      R => RST_CFG2
    );
\write_config_data_0_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[28]_i_1_n_0\,
      Q => write_config_data_0(28),
      R => RST_CFG2
    );
\write_config_data_0_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[29]_i_2_n_0\,
      Q => write_config_data_0(29),
      R => RST_CFG2
    );
\write_config_data_0_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[2]_i_1_n_0\,
      Q => write_config_data_0(2),
      R => RST_CFG2
    );
\write_config_data_0_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[3]_i_1_n_0\,
      Q => write_config_data_0(3),
      R => RST_CFG2
    );
\write_config_data_0_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[4]_i_1_n_0\,
      Q => write_config_data_0(4),
      R => RST_CFG2
    );
\write_config_data_0_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[5]_i_1_n_0\,
      Q => write_config_data_0(5),
      R => RST_CFG2
    );
\write_config_data_0_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[6]_i_1_n_0\,
      Q => write_config_data_0(6),
      R => RST_CFG2
    );
\write_config_data_0_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[7]_i_1_n_0\,
      Q => write_config_data_0(7),
      R => RST_CFG2
    );
\write_config_data_0_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[8]_i_1_n_0\,
      Q => write_config_data_0(8),
      R => RST_CFG2
    );
\write_config_data_0_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_0[29]_i_1_n_0\,
      D => \write_config_data_0[9]_i_1_n_0\,
      Q => write_config_data_0(9),
      R => RST_CFG2
    );
\write_config_data_1[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(0),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(0)
    );
\write_config_data_1[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(10),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(10)
    );
\write_config_data_1[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(11),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(11)
    );
\write_config_data_1[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(12),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(12)
    );
\write_config_data_1[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(13),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(13)
    );
\write_config_data_1[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(14),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(14)
    );
\write_config_data_1[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(15),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(15)
    );
\write_config_data_1[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(16),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(16)
    );
\write_config_data_1[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(17),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(17)
    );
\write_config_data_1[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(18),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(18)
    );
\write_config_data_1[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(19),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(19)
    );
\write_config_data_1[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(1),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(1)
    );
\write_config_data_1[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(20),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(20)
    );
\write_config_data_1[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(21),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(21)
    );
\write_config_data_1[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(22),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(22)
    );
\write_config_data_1[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(23),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(23)
    );
\write_config_data_1[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(24),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(24)
    );
\write_config_data_1[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(25),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(25)
    );
\write_config_data_1[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(26),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(26)
    );
\write_config_data_1[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(27),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(27)
    );
\write_config_data_1[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(28),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(28)
    );
\write_config_data_1[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAABAA"
    )
        port map (
      I0 => RST_CFG2,
      I1 => \write_data_cnt_reg_n_0_[0]\,
      I2 => DI(31),
      I3 => VLD,
      I4 => DI(30),
      I5 => \write_data_cnt_reg_n_0_[1]\,
      O => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAABAAAAA"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => \write_config_data_1[29]_i_2_n_0\
    );
\write_config_data_1[29]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(29),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(29)
    );
\write_config_data_1[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(2),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(2)
    );
\write_config_data_1[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(3),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(3)
    );
\write_config_data_1[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(4),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(4)
    );
\write_config_data_1[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(5),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(5)
    );
\write_config_data_1[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(6),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(6)
    );
\write_config_data_1[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(7),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(7)
    );
\write_config_data_1[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(8),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(8)
    );
\write_config_data_1[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => DI(9),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(30),
      I4 => VLD,
      I5 => DI(31),
      O => p_2_in(9)
    );
\write_config_data_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(0),
      Q => write_config_data_1(0),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(10),
      Q => write_config_data_1(10),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(11),
      Q => write_config_data_1(11),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(12),
      Q => write_config_data_1(12),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(13),
      Q => write_config_data_1(13),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(14),
      Q => write_config_data_1(14),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(15),
      Q => write_config_data_1(15),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(16),
      Q => write_config_data_1(16),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(17),
      Q => write_config_data_1(17),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(18),
      Q => write_config_data_1(18),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(19),
      Q => write_config_data_1(19),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(1),
      Q => write_config_data_1(1),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(20),
      Q => write_config_data_1(20),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(21),
      Q => write_config_data_1(21),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(22),
      Q => write_config_data_1(22),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(23),
      Q => write_config_data_1(23),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(24),
      Q => write_config_data_1(24),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(25),
      Q => write_config_data_1(25),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(26),
      Q => write_config_data_1(26),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(27),
      Q => write_config_data_1(27),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(28),
      Q => write_config_data_1(28),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(29),
      Q => write_config_data_1(29),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(2),
      Q => write_config_data_1(2),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(3),
      Q => write_config_data_1(3),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(4),
      Q => write_config_data_1(4),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(5),
      Q => write_config_data_1(5),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(6),
      Q => write_config_data_1(6),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(7),
      Q => write_config_data_1(7),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(8),
      Q => write_config_data_1(8),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_1[29]_i_2_n_0\,
      D => p_2_in(9),
      Q => write_config_data_1(9),
      R => \write_config_data_1[29]_i_1_n_0\
    );
\write_config_data_2[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => DI(0),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(31),
      I4 => VLD,
      I5 => DI(30),
      O => \write_config_data_2[0]_i_1_n_0\
    );
\write_config_data_2[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => DI(10),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(31),
      I4 => VLD,
      I5 => DI(30),
      O => \write_config_data_2[10]_i_1_n_0\
    );
\write_config_data_2[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAABAA"
    )
        port map (
      I0 => RST_CFG2,
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => DI(30),
      I3 => VLD,
      I4 => DI(31),
      O => \write_config_data_2[11]_i_1_n_0\
    );
\write_config_data_2[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAEAAAA"
    )
        port map (
      I0 => write_config_data_2_0,
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(31),
      I4 => VLD,
      I5 => DI(30),
      O => \write_config_data_2[11]_i_2_n_0\
    );
\write_config_data_2[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => DI(11),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(31),
      I4 => VLD,
      I5 => DI(30),
      O => \write_config_data_2[11]_i_3_n_0\
    );
\write_config_data_2[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => DI(1),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(31),
      I4 => VLD,
      I5 => DI(30),
      O => \write_config_data_2[1]_i_1_n_0\
    );
\write_config_data_2[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => DI(2),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(31),
      I4 => VLD,
      I5 => DI(30),
      O => \write_config_data_2[2]_i_1_n_0\
    );
\write_config_data_2[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => DI(3),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(31),
      I4 => VLD,
      I5 => DI(30),
      O => \write_config_data_2[3]_i_1_n_0\
    );
\write_config_data_2[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => DI(4),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(31),
      I4 => VLD,
      I5 => DI(30),
      O => \write_config_data_2[4]_i_1_n_0\
    );
\write_config_data_2[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => DI(5),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(31),
      I4 => VLD,
      I5 => DI(30),
      O => \write_config_data_2[5]_i_1_n_0\
    );
\write_config_data_2[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => DI(6),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(31),
      I4 => VLD,
      I5 => DI(30),
      O => \write_config_data_2[6]_i_1_n_0\
    );
\write_config_data_2[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => DI(7),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(31),
      I4 => VLD,
      I5 => DI(30),
      O => \write_config_data_2[7]_i_1_n_0\
    );
\write_config_data_2[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => DI(8),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(31),
      I4 => VLD,
      I5 => DI(30),
      O => \write_config_data_2[8]_i_1_n_0\
    );
\write_config_data_2[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => DI(9),
      I1 => \write_data_cnt_reg_n_0_[1]\,
      I2 => \write_data_cnt_reg_n_0_[0]\,
      I3 => DI(31),
      I4 => VLD,
      I5 => DI(30),
      O => \write_config_data_2[9]_i_1_n_0\
    );
\write_config_data_2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_2[11]_i_2_n_0\,
      D => \write_config_data_2[0]_i_1_n_0\,
      Q => write_config_data_2(0),
      R => \write_config_data_2[11]_i_1_n_0\
    );
\write_config_data_2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_2[11]_i_2_n_0\,
      D => \write_config_data_2[10]_i_1_n_0\,
      Q => write_config_data_2(10),
      R => \write_config_data_2[11]_i_1_n_0\
    );
\write_config_data_2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_2[11]_i_2_n_0\,
      D => \write_config_data_2[11]_i_3_n_0\,
      Q => write_config_data_2(11),
      R => \write_config_data_2[11]_i_1_n_0\
    );
\write_config_data_2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_2[11]_i_2_n_0\,
      D => \write_config_data_2[1]_i_1_n_0\,
      Q => write_config_data_2(1),
      R => \write_config_data_2[11]_i_1_n_0\
    );
\write_config_data_2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_2[11]_i_2_n_0\,
      D => \write_config_data_2[2]_i_1_n_0\,
      Q => write_config_data_2(2),
      R => \write_config_data_2[11]_i_1_n_0\
    );
\write_config_data_2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_2[11]_i_2_n_0\,
      D => \write_config_data_2[3]_i_1_n_0\,
      Q => write_config_data_2(3),
      R => \write_config_data_2[11]_i_1_n_0\
    );
\write_config_data_2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_2[11]_i_2_n_0\,
      D => \write_config_data_2[4]_i_1_n_0\,
      Q => write_config_data_2(4),
      R => \write_config_data_2[11]_i_1_n_0\
    );
\write_config_data_2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_2[11]_i_2_n_0\,
      D => \write_config_data_2[5]_i_1_n_0\,
      Q => write_config_data_2(5),
      R => \write_config_data_2[11]_i_1_n_0\
    );
\write_config_data_2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_2[11]_i_2_n_0\,
      D => \write_config_data_2[6]_i_1_n_0\,
      Q => write_config_data_2(6),
      R => \write_config_data_2[11]_i_1_n_0\
    );
\write_config_data_2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_2[11]_i_2_n_0\,
      D => \write_config_data_2[7]_i_1_n_0\,
      Q => write_config_data_2(7),
      R => \write_config_data_2[11]_i_1_n_0\
    );
\write_config_data_2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_2[11]_i_2_n_0\,
      D => \write_config_data_2[8]_i_1_n_0\,
      Q => write_config_data_2(8),
      R => \write_config_data_2[11]_i_1_n_0\
    );
\write_config_data_2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => \write_config_data_2[11]_i_2_n_0\,
      D => \write_config_data_2[9]_i_1_n_0\,
      Q => write_config_data_2(9),
      R => \write_config_data_2[11]_i_1_n_0\
    );
\write_data_cnt[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000008F800000F0F"
    )
        port map (
      I0 => \write_data_cnt_reg_n_0_[1]\,
      I1 => p_0_in2_in,
      I2 => \write_data_cnt[1]_i_2_n_0\,
      I3 => write_config_data_2_0,
      I4 => RST_CFG2,
      I5 => \write_data_cnt_reg_n_0_[0]\,
      O => \write_data_cnt[0]_i_1_n_0\
    );
\write_data_cnt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000F0002"
    )
        port map (
      I0 => \write_data_cnt_reg_n_0_[0]\,
      I1 => \write_data_cnt[1]_i_2_n_0\,
      I2 => write_config_data_2_0,
      I3 => RST_CFG2,
      I4 => \write_data_cnt_reg_n_0_[1]\,
      O => \write_data_cnt[1]_i_1_n_0\
    );
\write_data_cnt[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => DI(30),
      I1 => VLD,
      I2 => DI(31),
      O => \write_data_cnt[1]_i_2_n_0\
    );
\write_data_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \write_data_cnt[0]_i_1_n_0\,
      Q => \write_data_cnt_reg_n_0_[0]\,
      R => '0'
    );
\write_data_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => \write_data_cnt[1]_i_1_n_0\,
      Q => \write_data_cnt_reg_n_0_[1]\,
      R => '0'
    );
write_data_end_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => DI(30),
      I1 => VLD,
      I2 => DI(31),
      O => write_data_end
    );
write_data_end_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CCLK,
      CE => '1',
      D => write_data_end,
      Q => write_data_end_reg,
      R => RST_CFG2
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xilinx_ram_uram_rd_back_v1_0_0_top is
  port (
    CAS_OUT_DBITERR_A : out STD_LOGIC;
    CAS_OUT_DBITERR_B : out STD_LOGIC;
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
    RDACCESS_A : out STD_LOGIC;
    RDACCESS_B : out STD_LOGIC;
    SBITERR_A : out STD_LOGIC;
    SBITERR_B : out STD_LOGIC;
    CAS_OUT_ADDR_A : out STD_LOGIC_VECTOR ( 22 downto 0 );
    CAS_OUT_ADDR_B : out STD_LOGIC_VECTOR ( 22 downto 0 );
    CAS_OUT_DIN_A : out STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_OUT_DIN_B : out STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_OUT_DOUT_A : out STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_OUT_DOUT_B : out STD_LOGIC_VECTOR ( 71 downto 0 );
    DOUT_A : out STD_LOGIC_VECTOR ( 71 downto 0 );
    DOUT_B : out STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_OUT_BWE_A : out STD_LOGIC_VECTOR ( 8 downto 0 );
    CAS_OUT_BWE_B : out STD_LOGIC_VECTOR ( 8 downto 0 );
    DI : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VLD : in STD_LOGIC;
    CCLK : in STD_LOGIC;
    CLK : in STD_LOGIC;
    CAS_IN_DBITERR_A : in STD_LOGIC;
    CAS_IN_DBITERR_B : in STD_LOGIC;
    CAS_IN_EN_A : in STD_LOGIC;
    CAS_IN_EN_B : in STD_LOGIC;
    CAS_IN_RDACCESS_A : in STD_LOGIC;
    CAS_IN_RDACCESS_B : in STD_LOGIC;
    CAS_IN_RDB_WR_A : in STD_LOGIC;
    CAS_IN_RDB_WR_B : in STD_LOGIC;
    CAS_IN_SBITERR_A : in STD_LOGIC;
    CAS_IN_SBITERR_B : in STD_LOGIC;
    RST_A : in STD_LOGIC;
    SLEEP : in STD_LOGIC;
    CAS_IN_ADDR_A : in STD_LOGIC_VECTOR ( 22 downto 0 );
    CAS_IN_ADDR_B : in STD_LOGIC_VECTOR ( 22 downto 0 );
    CAS_IN_DIN_A : in STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_IN_DIN_B : in STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_IN_DOUT_A : in STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_IN_DOUT_B : in STD_LOGIC_VECTOR ( 71 downto 0 );
    CAS_IN_BWE_A : in STD_LOGIC_VECTOR ( 8 downto 0 );
    CAS_IN_BWE_B : in STD_LOGIC_VECTOR ( 8 downto 0 );
    RST_B : in STD_LOGIC;
    ADDR_B : in STD_LOGIC_VECTOR ( 22 downto 0 );
    INJECT_DBITERR_B : in STD_LOGIC;
    INJECT_SBITERR_B : in STD_LOGIC;
    OREG_CE_B : in STD_LOGIC;
    OREG_ECC_CE_B : in STD_LOGIC;
    EN_A : in STD_LOGIC;
    ADDR_A : in STD_LOGIC_VECTOR ( 22 downto 0 );
    BWE_A : in STD_LOGIC_VECTOR ( 8 downto 0 );
    DIN_A : in STD_LOGIC_VECTOR ( 71 downto 0 );
    INJECT_DBITERR_A : in STD_LOGIC;
    INJECT_SBITERR_A : in STD_LOGIC;
    OREG_CE_A : in STD_LOGIC;
    OREG_ECC_CE_A : in STD_LOGIC;
    RDB_WR_A : in STD_LOGIC;
    BWE_B : in STD_LOGIC_VECTOR ( 8 downto 0 );
    RDB_WR_B : in STD_LOGIC;
    DIN_B : in STD_LOGIC_VECTOR ( 71 downto 0 );
    EN_B : in STD_LOGIC
  );
end xilinx_ram_uram_rd_back_v1_0_0_top;

architecture STRUCTURE of xilinx_ram_uram_rd_back_v1_0_0_top is
  component xilinx_ram_URAM288 is
  port (
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
    SLEEP : in STD_LOGIC
  );
  end component xilinx_ram_URAM288;
  signal ADDR_A_R : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal ADDR_URAM : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal BWE_A_R : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal BWE_URAM : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal CE00 : STD_LOGIC;
  signal CLK_URAM : STD_LOGIC;
  signal DIN_A_R : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal DIN_URAM : STD_LOGIC_VECTOR ( 71 downto 0 );
  signal ENA_URAM : STD_LOGIC;
  signal EN_URAM : STD_LOGIC;
  signal INJECT_DBITERR_A_R : STD_LOGIC;
  signal INJECT_DBITERR_URAM : STD_LOGIC;
  signal INJECT_SBITERR_A_R : STD_LOGIC;
  signal INJECT_SBITERR_URAM : STD_LOGIC;
  signal OREG_CE_A_R : STD_LOGIC;
  signal OREG_CE_URAM : STD_LOGIC;
  signal OREG_ECC_CE_A_R : STD_LOGIC;
  signal OREG_ECC_CE_URAM : STD_LOGIC;
  signal RDB_WR_A_R : STD_LOGIC;
  signal RDB_WR_URAM : STD_LOGIC;
  signal RST_CFG1 : STD_LOGIC;
  signal RST_CFG2 : STD_LOGIC;
  signal RST_URAM : STD_LOGIC;
  signal control : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_1 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_10 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_11 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_12 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_13 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_14 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_15 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_16 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_17 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_18 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_19 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_2 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_20 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_21 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_22 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_23 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_24 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_25 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_26 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_27 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_28 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_29 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_3 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_30 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_31 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_32 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_33 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_34 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_35 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_36 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_37 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_38 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_39 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_4 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_40 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_41 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_42 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_43 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_44 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_45 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_46 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_47 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_48 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_49 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_5 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_50 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_51 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_52 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_53 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_54 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_55 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_56 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_57 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_58 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_59 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_6 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_60 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_61 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_62 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_63 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_64 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_65 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_66 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_67 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_68 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_69 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_7 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_70 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_71 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_72 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_73 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_74 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_75 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_76 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_77 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_78 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_79 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_8 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_80 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_81 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_82 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_83 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_85 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_86 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_87 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_88 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_89 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_9 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_90 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_91 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_92 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_93 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_94 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_95 : STD_LOGIC;
  signal uram_rdb_wrd_fsm_inst_n_96 : STD_LOGIC;
  attribute AUTO_SLEEP_LATENCY : integer;
  attribute AUTO_SLEEP_LATENCY of uram288_prim_inst : label is 8;
  attribute AVG_CONS_INACTIVE_CYCLES : integer;
  attribute AVG_CONS_INACTIVE_CYCLES of uram288_prim_inst : label is 10;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of uram288_prim_inst : label is "PRIMITIVE";
  attribute BWE_MODE_A : string;
  attribute BWE_MODE_A of uram288_prim_inst : label is "PARITY_INTERLEAVED";
  attribute BWE_MODE_B : string;
  attribute BWE_MODE_B of uram288_prim_inst : label is "PARITY_INTERLEAVED";
  attribute CASCADE_ORDER_A : string;
  attribute CASCADE_ORDER_A of uram288_prim_inst : label is "NONE";
  attribute CASCADE_ORDER_B : string;
  attribute CASCADE_ORDER_B of uram288_prim_inst : label is "NONE";
  attribute EN_AUTO_SLEEP_MODE : string;
  attribute EN_AUTO_SLEEP_MODE of uram288_prim_inst : label is "FALSE";
  attribute EN_ECC_RD_A : string;
  attribute EN_ECC_RD_A of uram288_prim_inst : label is "FALSE";
  attribute EN_ECC_RD_B : string;
  attribute EN_ECC_RD_B of uram288_prim_inst : label is "FALSE";
  attribute EN_ECC_WR_A : string;
  attribute EN_ECC_WR_A of uram288_prim_inst : label is "FALSE";
  attribute EN_ECC_WR_B : string;
  attribute EN_ECC_WR_B of uram288_prim_inst : label is "FALSE";
  attribute IREG_PRE_A : string;
  attribute IREG_PRE_A of uram288_prim_inst : label is "FALSE";
  attribute IREG_PRE_B : string;
  attribute IREG_PRE_B of uram288_prim_inst : label is "FALSE";
  attribute IS_CLK_INVERTED : string;
  attribute IS_CLK_INVERTED of uram288_prim_inst : label is "1'b0";
  attribute IS_EN_A_INVERTED : string;
  attribute IS_EN_A_INVERTED of uram288_prim_inst : label is "1'b0";
  attribute IS_EN_B_INVERTED : string;
  attribute IS_EN_B_INVERTED of uram288_prim_inst : label is "1'b0";
  attribute IS_RDB_WR_A_INVERTED : string;
  attribute IS_RDB_WR_A_INVERTED of uram288_prim_inst : label is "1'b0";
  attribute IS_RDB_WR_B_INVERTED : string;
  attribute IS_RDB_WR_B_INVERTED of uram288_prim_inst : label is "1'b0";
  attribute IS_RST_A_INVERTED : string;
  attribute IS_RST_A_INVERTED of uram288_prim_inst : label is "1'b0";
  attribute IS_RST_B_INVERTED : string;
  attribute IS_RST_B_INVERTED of uram288_prim_inst : label is "1'b0";
  attribute MATRIX_ID : string;
  attribute MATRIX_ID of uram288_prim_inst : label is "NONE";
  attribute NUM_UNIQUE_SELF_ADDR_A : integer;
  attribute NUM_UNIQUE_SELF_ADDR_A of uram288_prim_inst : label is 1;
  attribute NUM_UNIQUE_SELF_ADDR_B : integer;
  attribute NUM_UNIQUE_SELF_ADDR_B of uram288_prim_inst : label is 1;
  attribute NUM_URAM_IN_MATRIX : integer;
  attribute NUM_URAM_IN_MATRIX of uram288_prim_inst : label is 1;
  attribute OREG_A : string;
  attribute OREG_A of uram288_prim_inst : label is "FALSE";
  attribute OREG_B : string;
  attribute OREG_B of uram288_prim_inst : label is "FALSE";
  attribute OREG_ECC_A : string;
  attribute OREG_ECC_A of uram288_prim_inst : label is "FALSE";
  attribute OREG_ECC_B : string;
  attribute OREG_ECC_B of uram288_prim_inst : label is "FALSE";
  attribute REG_CAS_A : string;
  attribute REG_CAS_A of uram288_prim_inst : label is "FALSE";
  attribute REG_CAS_B : string;
  attribute REG_CAS_B of uram288_prim_inst : label is "FALSE";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of uram288_prim_inst : label is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of uram288_prim_inst : label is "SYNC";
  attribute SELF_ADDR_A : string;
  attribute SELF_ADDR_A of uram288_prim_inst : label is "11'h000";
  attribute SELF_ADDR_B : string;
  attribute SELF_ADDR_B of uram288_prim_inst : label is "11'h000";
  attribute SELF_MASK_A : string;
  attribute SELF_MASK_A of uram288_prim_inst : label is "11'h7ff";
  attribute SELF_MASK_B : string;
  attribute SELF_MASK_B of uram288_prim_inst : label is "11'h7ff";
  attribute USE_EXT_CE_A : string;
  attribute USE_EXT_CE_A of uram288_prim_inst : label is "FALSE";
  attribute USE_EXT_CE_B : string;
  attribute USE_EXT_CE_B of uram288_prim_inst : label is "FALSE";
begin
\ADDR_A_R_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(0),
      Q => ADDR_A_R(0),
      R => '0'
    );
\ADDR_A_R_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(10),
      Q => ADDR_A_R(10),
      R => '0'
    );
\ADDR_A_R_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(11),
      Q => ADDR_A_R(11),
      R => '0'
    );
\ADDR_A_R_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(12),
      Q => ADDR_A_R(12),
      R => '0'
    );
\ADDR_A_R_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(13),
      Q => ADDR_A_R(13),
      R => '0'
    );
\ADDR_A_R_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(14),
      Q => ADDR_A_R(14),
      R => '0'
    );
\ADDR_A_R_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(15),
      Q => ADDR_A_R(15),
      R => '0'
    );
\ADDR_A_R_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(16),
      Q => ADDR_A_R(16),
      R => '0'
    );
\ADDR_A_R_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(17),
      Q => ADDR_A_R(17),
      R => '0'
    );
\ADDR_A_R_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(18),
      Q => ADDR_A_R(18),
      R => '0'
    );
\ADDR_A_R_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(19),
      Q => ADDR_A_R(19),
      R => '0'
    );
\ADDR_A_R_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(1),
      Q => ADDR_A_R(1),
      R => '0'
    );
\ADDR_A_R_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(20),
      Q => ADDR_A_R(20),
      R => '0'
    );
\ADDR_A_R_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(21),
      Q => ADDR_A_R(21),
      R => '0'
    );
\ADDR_A_R_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(22),
      Q => ADDR_A_R(22),
      R => '0'
    );
\ADDR_A_R_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(2),
      Q => ADDR_A_R(2),
      R => '0'
    );
\ADDR_A_R_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(3),
      Q => ADDR_A_R(3),
      R => '0'
    );
\ADDR_A_R_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(4),
      Q => ADDR_A_R(4),
      R => '0'
    );
\ADDR_A_R_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(5),
      Q => ADDR_A_R(5),
      R => '0'
    );
\ADDR_A_R_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(6),
      Q => ADDR_A_R(6),
      R => '0'
    );
\ADDR_A_R_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(7),
      Q => ADDR_A_R(7),
      R => '0'
    );
\ADDR_A_R_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(8),
      Q => ADDR_A_R(8),
      R => '0'
    );
\ADDR_A_R_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => ADDR_A(9),
      Q => ADDR_A_R(9),
      R => '0'
    );
\BWE_A_R_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => BWE_A(0),
      Q => BWE_A_R(0),
      R => '0'
    );
\BWE_A_R_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => BWE_A(1),
      Q => BWE_A_R(1),
      R => '0'
    );
\BWE_A_R_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => BWE_A(2),
      Q => BWE_A_R(2),
      R => '0'
    );
\BWE_A_R_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => BWE_A(3),
      Q => BWE_A_R(3),
      R => '0'
    );
\BWE_A_R_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => BWE_A(4),
      Q => BWE_A_R(4),
      R => '0'
    );
\BWE_A_R_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => BWE_A(5),
      Q => BWE_A_R(5),
      R => '0'
    );
\BWE_A_R_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => BWE_A(6),
      Q => BWE_A_R(6),
      R => '0'
    );
\BWE_A_R_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => BWE_A(7),
      Q => BWE_A_R(7),
      R => '0'
    );
\BWE_A_R_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => BWE_A(8),
      Q => BWE_A_R(8),
      R => '0'
    );
\DIN_A_R_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(0),
      Q => DIN_A_R(0),
      R => '0'
    );
\DIN_A_R_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(10),
      Q => DIN_A_R(10),
      R => '0'
    );
\DIN_A_R_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(11),
      Q => DIN_A_R(11),
      R => '0'
    );
\DIN_A_R_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(12),
      Q => DIN_A_R(12),
      R => '0'
    );
\DIN_A_R_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(13),
      Q => DIN_A_R(13),
      R => '0'
    );
\DIN_A_R_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(14),
      Q => DIN_A_R(14),
      R => '0'
    );
\DIN_A_R_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(15),
      Q => DIN_A_R(15),
      R => '0'
    );
\DIN_A_R_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(16),
      Q => DIN_A_R(16),
      R => '0'
    );
\DIN_A_R_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(17),
      Q => DIN_A_R(17),
      R => '0'
    );
\DIN_A_R_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(18),
      Q => DIN_A_R(18),
      R => '0'
    );
\DIN_A_R_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(19),
      Q => DIN_A_R(19),
      R => '0'
    );
\DIN_A_R_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(1),
      Q => DIN_A_R(1),
      R => '0'
    );
\DIN_A_R_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(20),
      Q => DIN_A_R(20),
      R => '0'
    );
\DIN_A_R_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(21),
      Q => DIN_A_R(21),
      R => '0'
    );
\DIN_A_R_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(22),
      Q => DIN_A_R(22),
      R => '0'
    );
\DIN_A_R_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(23),
      Q => DIN_A_R(23),
      R => '0'
    );
\DIN_A_R_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(24),
      Q => DIN_A_R(24),
      R => '0'
    );
\DIN_A_R_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(25),
      Q => DIN_A_R(25),
      R => '0'
    );
\DIN_A_R_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(26),
      Q => DIN_A_R(26),
      R => '0'
    );
\DIN_A_R_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(27),
      Q => DIN_A_R(27),
      R => '0'
    );
\DIN_A_R_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(28),
      Q => DIN_A_R(28),
      R => '0'
    );
\DIN_A_R_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(29),
      Q => DIN_A_R(29),
      R => '0'
    );
\DIN_A_R_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(2),
      Q => DIN_A_R(2),
      R => '0'
    );
\DIN_A_R_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(30),
      Q => DIN_A_R(30),
      R => '0'
    );
\DIN_A_R_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(31),
      Q => DIN_A_R(31),
      R => '0'
    );
\DIN_A_R_reg[32]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(32),
      Q => DIN_A_R(32),
      R => '0'
    );
\DIN_A_R_reg[33]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(33),
      Q => DIN_A_R(33),
      R => '0'
    );
\DIN_A_R_reg[34]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(34),
      Q => DIN_A_R(34),
      R => '0'
    );
\DIN_A_R_reg[35]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(35),
      Q => DIN_A_R(35),
      R => '0'
    );
\DIN_A_R_reg[36]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(36),
      Q => DIN_A_R(36),
      R => '0'
    );
\DIN_A_R_reg[37]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(37),
      Q => DIN_A_R(37),
      R => '0'
    );
\DIN_A_R_reg[38]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(38),
      Q => DIN_A_R(38),
      R => '0'
    );
\DIN_A_R_reg[39]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(39),
      Q => DIN_A_R(39),
      R => '0'
    );
\DIN_A_R_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(3),
      Q => DIN_A_R(3),
      R => '0'
    );
\DIN_A_R_reg[40]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(40),
      Q => DIN_A_R(40),
      R => '0'
    );
\DIN_A_R_reg[41]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(41),
      Q => DIN_A_R(41),
      R => '0'
    );
\DIN_A_R_reg[42]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(42),
      Q => DIN_A_R(42),
      R => '0'
    );
\DIN_A_R_reg[43]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(43),
      Q => DIN_A_R(43),
      R => '0'
    );
\DIN_A_R_reg[44]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(44),
      Q => DIN_A_R(44),
      R => '0'
    );
\DIN_A_R_reg[45]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(45),
      Q => DIN_A_R(45),
      R => '0'
    );
\DIN_A_R_reg[46]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(46),
      Q => DIN_A_R(46),
      R => '0'
    );
\DIN_A_R_reg[47]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(47),
      Q => DIN_A_R(47),
      R => '0'
    );
\DIN_A_R_reg[48]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(48),
      Q => DIN_A_R(48),
      R => '0'
    );
\DIN_A_R_reg[49]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(49),
      Q => DIN_A_R(49),
      R => '0'
    );
\DIN_A_R_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(4),
      Q => DIN_A_R(4),
      R => '0'
    );
\DIN_A_R_reg[50]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(50),
      Q => DIN_A_R(50),
      R => '0'
    );
\DIN_A_R_reg[51]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(51),
      Q => DIN_A_R(51),
      R => '0'
    );
\DIN_A_R_reg[52]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(52),
      Q => DIN_A_R(52),
      R => '0'
    );
\DIN_A_R_reg[53]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(53),
      Q => DIN_A_R(53),
      R => '0'
    );
\DIN_A_R_reg[54]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(54),
      Q => DIN_A_R(54),
      R => '0'
    );
\DIN_A_R_reg[55]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(55),
      Q => DIN_A_R(55),
      R => '0'
    );
\DIN_A_R_reg[56]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(56),
      Q => DIN_A_R(56),
      R => '0'
    );
\DIN_A_R_reg[57]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(57),
      Q => DIN_A_R(57),
      R => '0'
    );
\DIN_A_R_reg[58]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(58),
      Q => DIN_A_R(58),
      R => '0'
    );
\DIN_A_R_reg[59]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(59),
      Q => DIN_A_R(59),
      R => '0'
    );
\DIN_A_R_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(5),
      Q => DIN_A_R(5),
      R => '0'
    );
\DIN_A_R_reg[60]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(60),
      Q => DIN_A_R(60),
      R => '0'
    );
\DIN_A_R_reg[61]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(61),
      Q => DIN_A_R(61),
      R => '0'
    );
\DIN_A_R_reg[62]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(62),
      Q => DIN_A_R(62),
      R => '0'
    );
\DIN_A_R_reg[63]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(63),
      Q => DIN_A_R(63),
      R => '0'
    );
\DIN_A_R_reg[64]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(64),
      Q => DIN_A_R(64),
      R => '0'
    );
\DIN_A_R_reg[65]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(65),
      Q => DIN_A_R(65),
      R => '0'
    );
\DIN_A_R_reg[66]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(66),
      Q => DIN_A_R(66),
      R => '0'
    );
\DIN_A_R_reg[67]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(67),
      Q => DIN_A_R(67),
      R => '0'
    );
\DIN_A_R_reg[68]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(68),
      Q => DIN_A_R(68),
      R => '0'
    );
\DIN_A_R_reg[69]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(69),
      Q => DIN_A_R(69),
      R => '0'
    );
\DIN_A_R_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(6),
      Q => DIN_A_R(6),
      R => '0'
    );
\DIN_A_R_reg[70]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(70),
      Q => DIN_A_R(70),
      R => '0'
    );
\DIN_A_R_reg[71]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(71),
      Q => DIN_A_R(71),
      R => '0'
    );
\DIN_A_R_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(7),
      Q => DIN_A_R(7),
      R => '0'
    );
\DIN_A_R_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(8),
      Q => DIN_A_R(8),
      R => '0'
    );
\DIN_A_R_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => DIN_A(9),
      Q => DIN_A_R(9),
      R => '0'
    );
INJECT_DBITERR_A_R_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => INJECT_DBITERR_A,
      Q => INJECT_DBITERR_A_R,
      R => '0'
    );
INJECT_SBITERR_A_R_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => INJECT_SBITERR_A,
      Q => INJECT_SBITERR_A_R,
      R => '0'
    );
OREG_CE_A_R_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => OREG_CE_A,
      Q => OREG_CE_A_R,
      R => '0'
    );
OREG_ECC_CE_A_R_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => OREG_ECC_CE_A,
      Q => OREG_ECC_CE_A_R,
      R => '0'
    );
RDB_WR_A_R_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => RDB_WR_A,
      Q => RDB_WR_A_R,
      R => '0'
    );
RST_CFG1_reg: unisim.vcomponents.FDRE
     port map (
      C => CCLK,
      CE => '1',
      D => RST_B,
      Q => RST_CFG1,
      R => '0'
    );
RST_CFG2_reg: unisim.vcomponents.FDRE
     port map (
      C => CCLK,
      CE => '1',
      D => RST_CFG1,
      Q => RST_CFG2,
      R => '0'
    );
uram288_prim_inst: component xilinx_ram_URAM288
     port map (
      ADDR_A(22 downto 0) => ADDR_A_R(22 downto 0),
      ADDR_B(22 downto 0) => ADDR_URAM(22 downto 0),
      BWE_A(8 downto 0) => BWE_A_R(8 downto 0),
      BWE_B(8 downto 0) => BWE_URAM(8 downto 0),
      CAS_IN_ADDR_A(22 downto 0) => CAS_IN_ADDR_A(22 downto 0),
      CAS_IN_ADDR_B(22 downto 0) => CAS_IN_ADDR_B(22 downto 0),
      CAS_IN_BWE_A(8 downto 0) => CAS_IN_BWE_A(8 downto 0),
      CAS_IN_BWE_B(8 downto 0) => CAS_IN_BWE_B(8 downto 0),
      CAS_IN_DBITERR_A => CAS_IN_DBITERR_A,
      CAS_IN_DBITERR_B => CAS_IN_DBITERR_B,
      CAS_IN_DIN_A(71 downto 0) => CAS_IN_DIN_A(71 downto 0),
      CAS_IN_DIN_B(71 downto 0) => CAS_IN_DIN_B(71 downto 0),
      CAS_IN_DOUT_A(71 downto 0) => CAS_IN_DOUT_A(71 downto 0),
      CAS_IN_DOUT_B(71 downto 0) => CAS_IN_DOUT_B(71 downto 0),
      CAS_IN_EN_A => CAS_IN_EN_A,
      CAS_IN_EN_B => CAS_IN_EN_B,
      CAS_IN_RDACCESS_A => CAS_IN_RDACCESS_A,
      CAS_IN_RDACCESS_B => CAS_IN_RDACCESS_B,
      CAS_IN_RDB_WR_A => CAS_IN_RDB_WR_A,
      CAS_IN_RDB_WR_B => CAS_IN_RDB_WR_B,
      CAS_IN_SBITERR_A => CAS_IN_SBITERR_A,
      CAS_IN_SBITERR_B => CAS_IN_SBITERR_B,
      CAS_OUT_ADDR_A(22 downto 0) => CAS_OUT_ADDR_A(22 downto 0),
      CAS_OUT_ADDR_B(22 downto 0) => CAS_OUT_ADDR_B(22 downto 0),
      CAS_OUT_BWE_A(8 downto 0) => CAS_OUT_BWE_A(8 downto 0),
      CAS_OUT_BWE_B(8 downto 0) => CAS_OUT_BWE_B(8 downto 0),
      CAS_OUT_DBITERR_A => CAS_OUT_DBITERR_A,
      CAS_OUT_DBITERR_B => CAS_OUT_DBITERR_B,
      CAS_OUT_DIN_A(71 downto 0) => CAS_OUT_DIN_A(71 downto 0),
      CAS_OUT_DIN_B(71 downto 0) => CAS_OUT_DIN_B(71 downto 0),
      CAS_OUT_DOUT_A(71 downto 0) => CAS_OUT_DOUT_A(71 downto 0),
      CAS_OUT_DOUT_B(71 downto 0) => CAS_OUT_DOUT_B(71 downto 0),
      CAS_OUT_EN_A => CAS_OUT_EN_A,
      CAS_OUT_EN_B => CAS_OUT_EN_B,
      CAS_OUT_RDACCESS_A => CAS_OUT_RDACCESS_A,
      CAS_OUT_RDACCESS_B => CAS_OUT_RDACCESS_B,
      CAS_OUT_RDB_WR_A => CAS_OUT_RDB_WR_A,
      CAS_OUT_RDB_WR_B => CAS_OUT_RDB_WR_B,
      CAS_OUT_SBITERR_A => CAS_OUT_SBITERR_A,
      CAS_OUT_SBITERR_B => CAS_OUT_SBITERR_B,
      CLK => CLK_URAM,
      DBITERR_A => DBITERR_A,
      DBITERR_B => DBITERR_B,
      DIN_A(71 downto 0) => DIN_A_R(71 downto 0),
      DIN_B(71 downto 0) => DIN_URAM(71 downto 0),
      DOUT_A(71 downto 0) => DOUT_A(71 downto 0),
      DOUT_B(71 downto 0) => DOUT_B(71 downto 0),
      EN_A => ENA_URAM,
      EN_B => EN_URAM,
      INJECT_DBITERR_A => INJECT_DBITERR_A_R,
      INJECT_DBITERR_B => INJECT_DBITERR_URAM,
      INJECT_SBITERR_A => INJECT_SBITERR_A_R,
      INJECT_SBITERR_B => INJECT_SBITERR_URAM,
      OREG_CE_A => OREG_CE_A_R,
      OREG_CE_B => OREG_CE_URAM,
      OREG_ECC_CE_A => OREG_ECC_CE_A_R,
      OREG_ECC_CE_B => OREG_ECC_CE_URAM,
      RDACCESS_A => RDACCESS_A,
      RDACCESS_B => RDACCESS_B,
      RDB_WR_A => RDB_WR_A_R,
      RDB_WR_B => RDB_WR_URAM,
      RST_A => RST_A,
      RST_B => RST_URAM,
      SBITERR_A => SBITERR_A,
      SBITERR_B => SBITERR_B,
      SLEEP => SLEEP
    );
uram_rdb_mux_inst: entity work.xilinx_ram_uram_rd_back_v1_0_0_uram_rdb_mux
     port map (
      ADDR_B(22 downto 0) => ADDR_URAM(22 downto 0),
      \ADDR_O_reg[22]_0\(10 downto 0) => ADDR_B(22 downto 12),
      \BWE_O_reg[8]_0\(8) => uram_rdb_wrd_fsm_inst_n_1,
      \BWE_O_reg[8]_0\(7) => uram_rdb_wrd_fsm_inst_n_2,
      \BWE_O_reg[8]_0\(6) => uram_rdb_wrd_fsm_inst_n_3,
      \BWE_O_reg[8]_0\(5) => uram_rdb_wrd_fsm_inst_n_4,
      \BWE_O_reg[8]_0\(4) => uram_rdb_wrd_fsm_inst_n_5,
      \BWE_O_reg[8]_0\(3) => uram_rdb_wrd_fsm_inst_n_6,
      \BWE_O_reg[8]_0\(2) => uram_rdb_wrd_fsm_inst_n_7,
      \BWE_O_reg[8]_0\(1) => uram_rdb_wrd_fsm_inst_n_8,
      \BWE_O_reg[8]_0\(0) => uram_rdb_wrd_fsm_inst_n_9,
      CCLK => CCLK,
      CE00 => CE00,
      CLK => CLK,
      CLK_URAM => CLK_URAM,
      D(11) => uram_rdb_wrd_fsm_inst_n_85,
      D(10) => uram_rdb_wrd_fsm_inst_n_86,
      D(9) => uram_rdb_wrd_fsm_inst_n_87,
      D(8) => uram_rdb_wrd_fsm_inst_n_88,
      D(7) => uram_rdb_wrd_fsm_inst_n_89,
      D(6) => uram_rdb_wrd_fsm_inst_n_90,
      D(5) => uram_rdb_wrd_fsm_inst_n_91,
      D(4) => uram_rdb_wrd_fsm_inst_n_92,
      D(3) => uram_rdb_wrd_fsm_inst_n_93,
      D(2) => uram_rdb_wrd_fsm_inst_n_94,
      D(1) => uram_rdb_wrd_fsm_inst_n_95,
      D(0) => uram_rdb_wrd_fsm_inst_n_96,
      \DIN_O_reg[71]_0\(71 downto 0) => DIN_URAM(71 downto 0),
      \DIN_O_reg[71]_1\(71) => uram_rdb_wrd_fsm_inst_n_12,
      \DIN_O_reg[71]_1\(70) => uram_rdb_wrd_fsm_inst_n_13,
      \DIN_O_reg[71]_1\(69) => uram_rdb_wrd_fsm_inst_n_14,
      \DIN_O_reg[71]_1\(68) => uram_rdb_wrd_fsm_inst_n_15,
      \DIN_O_reg[71]_1\(67) => uram_rdb_wrd_fsm_inst_n_16,
      \DIN_O_reg[71]_1\(66) => uram_rdb_wrd_fsm_inst_n_17,
      \DIN_O_reg[71]_1\(65) => uram_rdb_wrd_fsm_inst_n_18,
      \DIN_O_reg[71]_1\(64) => uram_rdb_wrd_fsm_inst_n_19,
      \DIN_O_reg[71]_1\(63) => uram_rdb_wrd_fsm_inst_n_20,
      \DIN_O_reg[71]_1\(62) => uram_rdb_wrd_fsm_inst_n_21,
      \DIN_O_reg[71]_1\(61) => uram_rdb_wrd_fsm_inst_n_22,
      \DIN_O_reg[71]_1\(60) => uram_rdb_wrd_fsm_inst_n_23,
      \DIN_O_reg[71]_1\(59) => uram_rdb_wrd_fsm_inst_n_24,
      \DIN_O_reg[71]_1\(58) => uram_rdb_wrd_fsm_inst_n_25,
      \DIN_O_reg[71]_1\(57) => uram_rdb_wrd_fsm_inst_n_26,
      \DIN_O_reg[71]_1\(56) => uram_rdb_wrd_fsm_inst_n_27,
      \DIN_O_reg[71]_1\(55) => uram_rdb_wrd_fsm_inst_n_28,
      \DIN_O_reg[71]_1\(54) => uram_rdb_wrd_fsm_inst_n_29,
      \DIN_O_reg[71]_1\(53) => uram_rdb_wrd_fsm_inst_n_30,
      \DIN_O_reg[71]_1\(52) => uram_rdb_wrd_fsm_inst_n_31,
      \DIN_O_reg[71]_1\(51) => uram_rdb_wrd_fsm_inst_n_32,
      \DIN_O_reg[71]_1\(50) => uram_rdb_wrd_fsm_inst_n_33,
      \DIN_O_reg[71]_1\(49) => uram_rdb_wrd_fsm_inst_n_34,
      \DIN_O_reg[71]_1\(48) => uram_rdb_wrd_fsm_inst_n_35,
      \DIN_O_reg[71]_1\(47) => uram_rdb_wrd_fsm_inst_n_36,
      \DIN_O_reg[71]_1\(46) => uram_rdb_wrd_fsm_inst_n_37,
      \DIN_O_reg[71]_1\(45) => uram_rdb_wrd_fsm_inst_n_38,
      \DIN_O_reg[71]_1\(44) => uram_rdb_wrd_fsm_inst_n_39,
      \DIN_O_reg[71]_1\(43) => uram_rdb_wrd_fsm_inst_n_40,
      \DIN_O_reg[71]_1\(42) => uram_rdb_wrd_fsm_inst_n_41,
      \DIN_O_reg[71]_1\(41) => uram_rdb_wrd_fsm_inst_n_42,
      \DIN_O_reg[71]_1\(40) => uram_rdb_wrd_fsm_inst_n_43,
      \DIN_O_reg[71]_1\(39) => uram_rdb_wrd_fsm_inst_n_44,
      \DIN_O_reg[71]_1\(38) => uram_rdb_wrd_fsm_inst_n_45,
      \DIN_O_reg[71]_1\(37) => uram_rdb_wrd_fsm_inst_n_46,
      \DIN_O_reg[71]_1\(36) => uram_rdb_wrd_fsm_inst_n_47,
      \DIN_O_reg[71]_1\(35) => uram_rdb_wrd_fsm_inst_n_48,
      \DIN_O_reg[71]_1\(34) => uram_rdb_wrd_fsm_inst_n_49,
      \DIN_O_reg[71]_1\(33) => uram_rdb_wrd_fsm_inst_n_50,
      \DIN_O_reg[71]_1\(32) => uram_rdb_wrd_fsm_inst_n_51,
      \DIN_O_reg[71]_1\(31) => uram_rdb_wrd_fsm_inst_n_52,
      \DIN_O_reg[71]_1\(30) => uram_rdb_wrd_fsm_inst_n_53,
      \DIN_O_reg[71]_1\(29) => uram_rdb_wrd_fsm_inst_n_54,
      \DIN_O_reg[71]_1\(28) => uram_rdb_wrd_fsm_inst_n_55,
      \DIN_O_reg[71]_1\(27) => uram_rdb_wrd_fsm_inst_n_56,
      \DIN_O_reg[71]_1\(26) => uram_rdb_wrd_fsm_inst_n_57,
      \DIN_O_reg[71]_1\(25) => uram_rdb_wrd_fsm_inst_n_58,
      \DIN_O_reg[71]_1\(24) => uram_rdb_wrd_fsm_inst_n_59,
      \DIN_O_reg[71]_1\(23) => uram_rdb_wrd_fsm_inst_n_60,
      \DIN_O_reg[71]_1\(22) => uram_rdb_wrd_fsm_inst_n_61,
      \DIN_O_reg[71]_1\(21) => uram_rdb_wrd_fsm_inst_n_62,
      \DIN_O_reg[71]_1\(20) => uram_rdb_wrd_fsm_inst_n_63,
      \DIN_O_reg[71]_1\(19) => uram_rdb_wrd_fsm_inst_n_64,
      \DIN_O_reg[71]_1\(18) => uram_rdb_wrd_fsm_inst_n_65,
      \DIN_O_reg[71]_1\(17) => uram_rdb_wrd_fsm_inst_n_66,
      \DIN_O_reg[71]_1\(16) => uram_rdb_wrd_fsm_inst_n_67,
      \DIN_O_reg[71]_1\(15) => uram_rdb_wrd_fsm_inst_n_68,
      \DIN_O_reg[71]_1\(14) => uram_rdb_wrd_fsm_inst_n_69,
      \DIN_O_reg[71]_1\(13) => uram_rdb_wrd_fsm_inst_n_70,
      \DIN_O_reg[71]_1\(12) => uram_rdb_wrd_fsm_inst_n_71,
      \DIN_O_reg[71]_1\(11) => uram_rdb_wrd_fsm_inst_n_72,
      \DIN_O_reg[71]_1\(10) => uram_rdb_wrd_fsm_inst_n_73,
      \DIN_O_reg[71]_1\(9) => uram_rdb_wrd_fsm_inst_n_74,
      \DIN_O_reg[71]_1\(8) => uram_rdb_wrd_fsm_inst_n_75,
      \DIN_O_reg[71]_1\(7) => uram_rdb_wrd_fsm_inst_n_76,
      \DIN_O_reg[71]_1\(6) => uram_rdb_wrd_fsm_inst_n_77,
      \DIN_O_reg[71]_1\(5) => uram_rdb_wrd_fsm_inst_n_78,
      \DIN_O_reg[71]_1\(4) => uram_rdb_wrd_fsm_inst_n_79,
      \DIN_O_reg[71]_1\(3) => uram_rdb_wrd_fsm_inst_n_80,
      \DIN_O_reg[71]_1\(2) => uram_rdb_wrd_fsm_inst_n_81,
      \DIN_O_reg[71]_1\(1) => uram_rdb_wrd_fsm_inst_n_82,
      \DIN_O_reg[71]_1\(0) => uram_rdb_wrd_fsm_inst_n_83,
      ENA_URAM => ENA_URAM,
      EN_A => EN_A,
      EN_O_reg_0 => uram_rdb_wrd_fsm_inst_n_11,
      EN_URAM => EN_URAM,
      INJECT_DBITERR_B => INJECT_DBITERR_B,
      INJECT_DBITERR_URAM => INJECT_DBITERR_URAM,
      INJECT_SBITERR_B => INJECT_SBITERR_B,
      INJECT_SBITERR_URAM => INJECT_SBITERR_URAM,
      OREG_CE_B => OREG_CE_B,
      OREG_CE_URAM => OREG_CE_URAM,
      OREG_ECC_CE_B => OREG_ECC_CE_B,
      OREG_ECC_CE_URAM => OREG_ECC_CE_URAM,
      Q(8 downto 0) => BWE_URAM(8 downto 0),
      RDB_WR_O_reg_0 => uram_rdb_wrd_fsm_inst_n_10,
      RDB_WR_URAM => RDB_WR_URAM,
      RST_B => RST_B,
      RST_URAM => RST_URAM,
      control => control
    );
uram_rdb_wrd_fsm_inst: entity work.xilinx_ram_uram_rd_back_v1_0_0_uram_rdb_wrd_fsm
     port map (
      ADDR_B(11 downto 0) => ADDR_B(11 downto 0),
      BWE_B(8 downto 0) => BWE_B(8 downto 0),
      CCLK => CCLK,
      CE00 => CE00,
      D(11) => uram_rdb_wrd_fsm_inst_n_85,
      D(10) => uram_rdb_wrd_fsm_inst_n_86,
      D(9) => uram_rdb_wrd_fsm_inst_n_87,
      D(8) => uram_rdb_wrd_fsm_inst_n_88,
      D(7) => uram_rdb_wrd_fsm_inst_n_89,
      D(6) => uram_rdb_wrd_fsm_inst_n_90,
      D(5) => uram_rdb_wrd_fsm_inst_n_91,
      D(4) => uram_rdb_wrd_fsm_inst_n_92,
      D(3) => uram_rdb_wrd_fsm_inst_n_93,
      D(2) => uram_rdb_wrd_fsm_inst_n_94,
      D(1) => uram_rdb_wrd_fsm_inst_n_95,
      D(0) => uram_rdb_wrd_fsm_inst_n_96,
      DI(31 downto 0) => DI(31 downto 0),
      DIN_B(71 downto 0) => DIN_B(71 downto 0),
      EN_B => EN_B,
      \FSM_onehot_curr_state_reg[1]_0\(8) => uram_rdb_wrd_fsm_inst_n_1,
      \FSM_onehot_curr_state_reg[1]_0\(7) => uram_rdb_wrd_fsm_inst_n_2,
      \FSM_onehot_curr_state_reg[1]_0\(6) => uram_rdb_wrd_fsm_inst_n_3,
      \FSM_onehot_curr_state_reg[1]_0\(5) => uram_rdb_wrd_fsm_inst_n_4,
      \FSM_onehot_curr_state_reg[1]_0\(4) => uram_rdb_wrd_fsm_inst_n_5,
      \FSM_onehot_curr_state_reg[1]_0\(3) => uram_rdb_wrd_fsm_inst_n_6,
      \FSM_onehot_curr_state_reg[1]_0\(2) => uram_rdb_wrd_fsm_inst_n_7,
      \FSM_onehot_curr_state_reg[1]_0\(1) => uram_rdb_wrd_fsm_inst_n_8,
      \FSM_onehot_curr_state_reg[1]_0\(0) => uram_rdb_wrd_fsm_inst_n_9,
      \FSM_onehot_curr_state_reg[1]_1\ => uram_rdb_wrd_fsm_inst_n_10,
      \FSM_onehot_curr_state_reg[3]_0\ => uram_rdb_wrd_fsm_inst_n_11,
      RDB_WR_B => RDB_WR_B,
      RST_CFG2 => RST_CFG2,
      VLD => VLD,
      control => control,
      \uram_data_int_r_reg[71]_0\(71) => uram_rdb_wrd_fsm_inst_n_12,
      \uram_data_int_r_reg[71]_0\(70) => uram_rdb_wrd_fsm_inst_n_13,
      \uram_data_int_r_reg[71]_0\(69) => uram_rdb_wrd_fsm_inst_n_14,
      \uram_data_int_r_reg[71]_0\(68) => uram_rdb_wrd_fsm_inst_n_15,
      \uram_data_int_r_reg[71]_0\(67) => uram_rdb_wrd_fsm_inst_n_16,
      \uram_data_int_r_reg[71]_0\(66) => uram_rdb_wrd_fsm_inst_n_17,
      \uram_data_int_r_reg[71]_0\(65) => uram_rdb_wrd_fsm_inst_n_18,
      \uram_data_int_r_reg[71]_0\(64) => uram_rdb_wrd_fsm_inst_n_19,
      \uram_data_int_r_reg[71]_0\(63) => uram_rdb_wrd_fsm_inst_n_20,
      \uram_data_int_r_reg[71]_0\(62) => uram_rdb_wrd_fsm_inst_n_21,
      \uram_data_int_r_reg[71]_0\(61) => uram_rdb_wrd_fsm_inst_n_22,
      \uram_data_int_r_reg[71]_0\(60) => uram_rdb_wrd_fsm_inst_n_23,
      \uram_data_int_r_reg[71]_0\(59) => uram_rdb_wrd_fsm_inst_n_24,
      \uram_data_int_r_reg[71]_0\(58) => uram_rdb_wrd_fsm_inst_n_25,
      \uram_data_int_r_reg[71]_0\(57) => uram_rdb_wrd_fsm_inst_n_26,
      \uram_data_int_r_reg[71]_0\(56) => uram_rdb_wrd_fsm_inst_n_27,
      \uram_data_int_r_reg[71]_0\(55) => uram_rdb_wrd_fsm_inst_n_28,
      \uram_data_int_r_reg[71]_0\(54) => uram_rdb_wrd_fsm_inst_n_29,
      \uram_data_int_r_reg[71]_0\(53) => uram_rdb_wrd_fsm_inst_n_30,
      \uram_data_int_r_reg[71]_0\(52) => uram_rdb_wrd_fsm_inst_n_31,
      \uram_data_int_r_reg[71]_0\(51) => uram_rdb_wrd_fsm_inst_n_32,
      \uram_data_int_r_reg[71]_0\(50) => uram_rdb_wrd_fsm_inst_n_33,
      \uram_data_int_r_reg[71]_0\(49) => uram_rdb_wrd_fsm_inst_n_34,
      \uram_data_int_r_reg[71]_0\(48) => uram_rdb_wrd_fsm_inst_n_35,
      \uram_data_int_r_reg[71]_0\(47) => uram_rdb_wrd_fsm_inst_n_36,
      \uram_data_int_r_reg[71]_0\(46) => uram_rdb_wrd_fsm_inst_n_37,
      \uram_data_int_r_reg[71]_0\(45) => uram_rdb_wrd_fsm_inst_n_38,
      \uram_data_int_r_reg[71]_0\(44) => uram_rdb_wrd_fsm_inst_n_39,
      \uram_data_int_r_reg[71]_0\(43) => uram_rdb_wrd_fsm_inst_n_40,
      \uram_data_int_r_reg[71]_0\(42) => uram_rdb_wrd_fsm_inst_n_41,
      \uram_data_int_r_reg[71]_0\(41) => uram_rdb_wrd_fsm_inst_n_42,
      \uram_data_int_r_reg[71]_0\(40) => uram_rdb_wrd_fsm_inst_n_43,
      \uram_data_int_r_reg[71]_0\(39) => uram_rdb_wrd_fsm_inst_n_44,
      \uram_data_int_r_reg[71]_0\(38) => uram_rdb_wrd_fsm_inst_n_45,
      \uram_data_int_r_reg[71]_0\(37) => uram_rdb_wrd_fsm_inst_n_46,
      \uram_data_int_r_reg[71]_0\(36) => uram_rdb_wrd_fsm_inst_n_47,
      \uram_data_int_r_reg[71]_0\(35) => uram_rdb_wrd_fsm_inst_n_48,
      \uram_data_int_r_reg[71]_0\(34) => uram_rdb_wrd_fsm_inst_n_49,
      \uram_data_int_r_reg[71]_0\(33) => uram_rdb_wrd_fsm_inst_n_50,
      \uram_data_int_r_reg[71]_0\(32) => uram_rdb_wrd_fsm_inst_n_51,
      \uram_data_int_r_reg[71]_0\(31) => uram_rdb_wrd_fsm_inst_n_52,
      \uram_data_int_r_reg[71]_0\(30) => uram_rdb_wrd_fsm_inst_n_53,
      \uram_data_int_r_reg[71]_0\(29) => uram_rdb_wrd_fsm_inst_n_54,
      \uram_data_int_r_reg[71]_0\(28) => uram_rdb_wrd_fsm_inst_n_55,
      \uram_data_int_r_reg[71]_0\(27) => uram_rdb_wrd_fsm_inst_n_56,
      \uram_data_int_r_reg[71]_0\(26) => uram_rdb_wrd_fsm_inst_n_57,
      \uram_data_int_r_reg[71]_0\(25) => uram_rdb_wrd_fsm_inst_n_58,
      \uram_data_int_r_reg[71]_0\(24) => uram_rdb_wrd_fsm_inst_n_59,
      \uram_data_int_r_reg[71]_0\(23) => uram_rdb_wrd_fsm_inst_n_60,
      \uram_data_int_r_reg[71]_0\(22) => uram_rdb_wrd_fsm_inst_n_61,
      \uram_data_int_r_reg[71]_0\(21) => uram_rdb_wrd_fsm_inst_n_62,
      \uram_data_int_r_reg[71]_0\(20) => uram_rdb_wrd_fsm_inst_n_63,
      \uram_data_int_r_reg[71]_0\(19) => uram_rdb_wrd_fsm_inst_n_64,
      \uram_data_int_r_reg[71]_0\(18) => uram_rdb_wrd_fsm_inst_n_65,
      \uram_data_int_r_reg[71]_0\(17) => uram_rdb_wrd_fsm_inst_n_66,
      \uram_data_int_r_reg[71]_0\(16) => uram_rdb_wrd_fsm_inst_n_67,
      \uram_data_int_r_reg[71]_0\(15) => uram_rdb_wrd_fsm_inst_n_68,
      \uram_data_int_r_reg[71]_0\(14) => uram_rdb_wrd_fsm_inst_n_69,
      \uram_data_int_r_reg[71]_0\(13) => uram_rdb_wrd_fsm_inst_n_70,
      \uram_data_int_r_reg[71]_0\(12) => uram_rdb_wrd_fsm_inst_n_71,
      \uram_data_int_r_reg[71]_0\(11) => uram_rdb_wrd_fsm_inst_n_72,
      \uram_data_int_r_reg[71]_0\(10) => uram_rdb_wrd_fsm_inst_n_73,
      \uram_data_int_r_reg[71]_0\(9) => uram_rdb_wrd_fsm_inst_n_74,
      \uram_data_int_r_reg[71]_0\(8) => uram_rdb_wrd_fsm_inst_n_75,
      \uram_data_int_r_reg[71]_0\(7) => uram_rdb_wrd_fsm_inst_n_76,
      \uram_data_int_r_reg[71]_0\(6) => uram_rdb_wrd_fsm_inst_n_77,
      \uram_data_int_r_reg[71]_0\(5) => uram_rdb_wrd_fsm_inst_n_78,
      \uram_data_int_r_reg[71]_0\(4) => uram_rdb_wrd_fsm_inst_n_79,
      \uram_data_int_r_reg[71]_0\(3) => uram_rdb_wrd_fsm_inst_n_80,
      \uram_data_int_r_reg[71]_0\(2) => uram_rdb_wrd_fsm_inst_n_81,
      \uram_data_int_r_reg[71]_0\(1) => uram_rdb_wrd_fsm_inst_n_82,
      \uram_data_int_r_reg[71]_0\(0) => uram_rdb_wrd_fsm_inst_n_83
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xilinx_ram_uram_rd_back_v1_0_0 is
  port (
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
  attribute AUTO_SLEEP_LATENCY : integer;
  attribute AUTO_SLEEP_LATENCY of xilinx_ram_uram_rd_back_v1_0_0 : entity is 8;
  attribute AVG_CONS_INACTIVE_CYCLES : integer;
  attribute AVG_CONS_INACTIVE_CYCLES of xilinx_ram_uram_rd_back_v1_0_0 : entity is 10;
  attribute BWE_MODE_A : string;
  attribute BWE_MODE_A of xilinx_ram_uram_rd_back_v1_0_0 : entity is "PARITY_INTERLEAVED";
  attribute BWE_MODE_B : string;
  attribute BWE_MODE_B of xilinx_ram_uram_rd_back_v1_0_0 : entity is "PARITY_INTERLEAVED";
  attribute CASCADE_ORDER_A : string;
  attribute CASCADE_ORDER_A of xilinx_ram_uram_rd_back_v1_0_0 : entity is "NONE";
  attribute CASCADE_ORDER_B : string;
  attribute CASCADE_ORDER_B of xilinx_ram_uram_rd_back_v1_0_0 : entity is "NONE";
  attribute EN_AUTO_SLEEP_MODE : string;
  attribute EN_AUTO_SLEEP_MODE of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute EN_ECC_RD_A : string;
  attribute EN_ECC_RD_A of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute EN_ECC_RD_B : string;
  attribute EN_ECC_RD_B of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute EN_ECC_WR_A : string;
  attribute EN_ECC_WR_A of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute EN_ECC_WR_B : string;
  attribute EN_ECC_WR_B of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute IREG_PRE_A : string;
  attribute IREG_PRE_A of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute IREG_PRE_B : string;
  attribute IREG_PRE_B of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute IS_CLK_INVERTED : string;
  attribute IS_CLK_INVERTED of xilinx_ram_uram_rd_back_v1_0_0 : entity is "1'b0";
  attribute IS_EN_A_INVERTED : string;
  attribute IS_EN_A_INVERTED of xilinx_ram_uram_rd_back_v1_0_0 : entity is "1'b0";
  attribute IS_EN_B_INVERTED : string;
  attribute IS_EN_B_INVERTED of xilinx_ram_uram_rd_back_v1_0_0 : entity is "1'b0";
  attribute IS_RDB_WR_A_INVERTED : string;
  attribute IS_RDB_WR_A_INVERTED of xilinx_ram_uram_rd_back_v1_0_0 : entity is "1'b0";
  attribute IS_RDB_WR_B_INVERTED : string;
  attribute IS_RDB_WR_B_INVERTED of xilinx_ram_uram_rd_back_v1_0_0 : entity is "1'b0";
  attribute IS_RST_A_INVERTED : string;
  attribute IS_RST_A_INVERTED of xilinx_ram_uram_rd_back_v1_0_0 : entity is "1'b0";
  attribute IS_RST_B_INVERTED : string;
  attribute IS_RST_B_INVERTED of xilinx_ram_uram_rd_back_v1_0_0 : entity is "1'b0";
  attribute MATRIX_ID : string;
  attribute MATRIX_ID of xilinx_ram_uram_rd_back_v1_0_0 : entity is "NONE";
  attribute NUM_UNIQUE_SELF_ADDR_A : integer;
  attribute NUM_UNIQUE_SELF_ADDR_A of xilinx_ram_uram_rd_back_v1_0_0 : entity is 1;
  attribute NUM_UNIQUE_SELF_ADDR_B : integer;
  attribute NUM_UNIQUE_SELF_ADDR_B of xilinx_ram_uram_rd_back_v1_0_0 : entity is 1;
  attribute NUM_URAM_IN_MATRIX : integer;
  attribute NUM_URAM_IN_MATRIX of xilinx_ram_uram_rd_back_v1_0_0 : entity is 1;
  attribute OREG_A : string;
  attribute OREG_A of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute OREG_B : string;
  attribute OREG_B of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute OREG_ECC_A : string;
  attribute OREG_ECC_A of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute OREG_ECC_B : string;
  attribute OREG_ECC_B of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute REG_CAS_A : string;
  attribute REG_CAS_A of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute REG_CAS_B : string;
  attribute REG_CAS_B of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of xilinx_ram_uram_rd_back_v1_0_0 : entity is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of xilinx_ram_uram_rd_back_v1_0_0 : entity is "SYNC";
  attribute SELF_ADDR_A : string;
  attribute SELF_ADDR_A of xilinx_ram_uram_rd_back_v1_0_0 : entity is "11'b00000000000";
  attribute SELF_ADDR_B : string;
  attribute SELF_ADDR_B of xilinx_ram_uram_rd_back_v1_0_0 : entity is "11'b00000000000";
  attribute SELF_MASK_A : string;
  attribute SELF_MASK_A of xilinx_ram_uram_rd_back_v1_0_0 : entity is "11'b11111111111";
  attribute SELF_MASK_B : string;
  attribute SELF_MASK_B of xilinx_ram_uram_rd_back_v1_0_0 : entity is "11'b11111111111";
  attribute USE_EXT_CE_A : string;
  attribute USE_EXT_CE_A of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
  attribute USE_EXT_CE_B : string;
  attribute USE_EXT_CE_B of xilinx_ram_uram_rd_back_v1_0_0 : entity is "FALSE";
end xilinx_ram_uram_rd_back_v1_0_0;

architecture STRUCTURE of xilinx_ram_uram_rd_back_v1_0_0 is
begin
uram_rd_back_top_inst: entity work.xilinx_ram_uram_rd_back_v1_0_0_top
     port map (
      ADDR_A(22 downto 0) => ADDR_A(22 downto 0),
      ADDR_B(22 downto 0) => ADDR_B(22 downto 0),
      BWE_A(8 downto 0) => BWE_A(8 downto 0),
      BWE_B(8 downto 0) => BWE_B(8 downto 0),
      CAS_IN_ADDR_A(22 downto 0) => CAS_IN_ADDR_A(22 downto 0),
      CAS_IN_ADDR_B(22 downto 0) => CAS_IN_ADDR_B(22 downto 0),
      CAS_IN_BWE_A(8 downto 0) => CAS_IN_BWE_A(8 downto 0),
      CAS_IN_BWE_B(8 downto 0) => CAS_IN_BWE_B(8 downto 0),
      CAS_IN_DBITERR_A => CAS_IN_DBITERR_A,
      CAS_IN_DBITERR_B => CAS_IN_DBITERR_B,
      CAS_IN_DIN_A(71 downto 0) => CAS_IN_DIN_A(71 downto 0),
      CAS_IN_DIN_B(71 downto 0) => CAS_IN_DIN_B(71 downto 0),
      CAS_IN_DOUT_A(71 downto 0) => CAS_IN_DOUT_A(71 downto 0),
      CAS_IN_DOUT_B(71 downto 0) => CAS_IN_DOUT_B(71 downto 0),
      CAS_IN_EN_A => CAS_IN_EN_A,
      CAS_IN_EN_B => CAS_IN_EN_B,
      CAS_IN_RDACCESS_A => CAS_IN_RDACCESS_A,
      CAS_IN_RDACCESS_B => CAS_IN_RDACCESS_B,
      CAS_IN_RDB_WR_A => CAS_IN_RDB_WR_A,
      CAS_IN_RDB_WR_B => CAS_IN_RDB_WR_B,
      CAS_IN_SBITERR_A => CAS_IN_SBITERR_A,
      CAS_IN_SBITERR_B => CAS_IN_SBITERR_B,
      CAS_OUT_ADDR_A(22 downto 0) => CAS_OUT_ADDR_A(22 downto 0),
      CAS_OUT_ADDR_B(22 downto 0) => CAS_OUT_ADDR_B(22 downto 0),
      CAS_OUT_BWE_A(8 downto 0) => CAS_OUT_BWE_A(8 downto 0),
      CAS_OUT_BWE_B(8 downto 0) => CAS_OUT_BWE_B(8 downto 0),
      CAS_OUT_DBITERR_A => CAS_OUT_DBITERR_A,
      CAS_OUT_DBITERR_B => CAS_OUT_DBITERR_B,
      CAS_OUT_DIN_A(71 downto 0) => CAS_OUT_DIN_A(71 downto 0),
      CAS_OUT_DIN_B(71 downto 0) => CAS_OUT_DIN_B(71 downto 0),
      CAS_OUT_DOUT_A(71 downto 0) => CAS_OUT_DOUT_A(71 downto 0),
      CAS_OUT_DOUT_B(71 downto 0) => CAS_OUT_DOUT_B(71 downto 0),
      CAS_OUT_EN_A => CAS_OUT_EN_A,
      CAS_OUT_EN_B => CAS_OUT_EN_B,
      CAS_OUT_RDACCESS_A => CAS_OUT_RDACCESS_A,
      CAS_OUT_RDACCESS_B => CAS_OUT_RDACCESS_B,
      CAS_OUT_RDB_WR_A => CAS_OUT_RDB_WR_A,
      CAS_OUT_RDB_WR_B => CAS_OUT_RDB_WR_B,
      CAS_OUT_SBITERR_A => CAS_OUT_SBITERR_A,
      CAS_OUT_SBITERR_B => CAS_OUT_SBITERR_B,
      CCLK => CCLK,
      CLK => CLK,
      DBITERR_A => DBITERR_A,
      DBITERR_B => DBITERR_B,
      DI(31 downto 0) => DI(31 downto 0),
      DIN_A(71 downto 0) => DIN_A(71 downto 0),
      DIN_B(71 downto 0) => DIN_B(71 downto 0),
      DOUT_A(71 downto 0) => DOUT_A(71 downto 0),
      DOUT_B(71 downto 0) => DOUT_B(71 downto 0),
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
      RDACCESS_A => RDACCESS_A,
      RDACCESS_B => RDACCESS_B,
      RDB_WR_A => RDB_WR_A,
      RDB_WR_B => RDB_WR_B,
      RST_A => RST_A,
      RST_B => RST_B,
      SBITERR_A => SBITERR_A,
      SBITERR_B => SBITERR_B,
      SLEEP => SLEEP,
      VLD => VLD
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xilinx_ram is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of xilinx_ram : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of xilinx_ram : entity is "nv_ram_rws_256x3,uram_rd_back_v1_0_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of xilinx_ram : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of xilinx_ram : entity is "uram_rd_back_v1_0_0,Vivado 2019.2.1";
end xilinx_ram;

architecture STRUCTURE of xilinx_ram is
  attribute AUTO_SLEEP_LATENCY : integer;
  attribute AUTO_SLEEP_LATENCY of inst : label is 8;
  attribute AVG_CONS_INACTIVE_CYCLES : integer;
  attribute AVG_CONS_INACTIVE_CYCLES of inst : label is 10;
  attribute BWE_MODE_A : string;
  attribute BWE_MODE_A of inst : label is "PARITY_INTERLEAVED";
  attribute BWE_MODE_B : string;
  attribute BWE_MODE_B of inst : label is "PARITY_INTERLEAVED";
  attribute CASCADE_ORDER_A : string;
  attribute CASCADE_ORDER_A of inst : label is "NONE";
  attribute CASCADE_ORDER_B : string;
  attribute CASCADE_ORDER_B of inst : label is "NONE";
  attribute EN_AUTO_SLEEP_MODE : string;
  attribute EN_AUTO_SLEEP_MODE of inst : label is "FALSE";
  attribute EN_ECC_RD_A : string;
  attribute EN_ECC_RD_A of inst : label is "FALSE";
  attribute EN_ECC_RD_B : string;
  attribute EN_ECC_RD_B of inst : label is "FALSE";
  attribute EN_ECC_WR_A : string;
  attribute EN_ECC_WR_A of inst : label is "FALSE";
  attribute EN_ECC_WR_B : string;
  attribute EN_ECC_WR_B of inst : label is "FALSE";
  attribute IREG_PRE_A : string;
  attribute IREG_PRE_A of inst : label is "FALSE";
  attribute IREG_PRE_B : string;
  attribute IREG_PRE_B of inst : label is "FALSE";
  attribute IS_CLK_INVERTED : string;
  attribute IS_CLK_INVERTED of inst : label is "1'b0";
  attribute IS_EN_A_INVERTED : string;
  attribute IS_EN_A_INVERTED of inst : label is "1'b0";
  attribute IS_EN_B_INVERTED : string;
  attribute IS_EN_B_INVERTED of inst : label is "1'b0";
  attribute IS_RDB_WR_A_INVERTED : string;
  attribute IS_RDB_WR_A_INVERTED of inst : label is "1'b0";
  attribute IS_RDB_WR_B_INVERTED : string;
  attribute IS_RDB_WR_B_INVERTED of inst : label is "1'b0";
  attribute IS_RST_A_INVERTED : string;
  attribute IS_RST_A_INVERTED of inst : label is "1'b0";
  attribute IS_RST_B_INVERTED : string;
  attribute IS_RST_B_INVERTED of inst : label is "1'b0";
  attribute MATRIX_ID : string;
  attribute MATRIX_ID of inst : label is "NONE";
  attribute NUM_UNIQUE_SELF_ADDR_A : integer;
  attribute NUM_UNIQUE_SELF_ADDR_A of inst : label is 1;
  attribute NUM_UNIQUE_SELF_ADDR_B : integer;
  attribute NUM_UNIQUE_SELF_ADDR_B of inst : label is 1;
  attribute NUM_URAM_IN_MATRIX : integer;
  attribute NUM_URAM_IN_MATRIX of inst : label is 1;
  attribute OREG_A : string;
  attribute OREG_A of inst : label is "FALSE";
  attribute OREG_B : string;
  attribute OREG_B of inst : label is "FALSE";
  attribute OREG_ECC_A : string;
  attribute OREG_ECC_A of inst : label is "FALSE";
  attribute OREG_ECC_B : string;
  attribute OREG_ECC_B of inst : label is "FALSE";
  attribute REG_CAS_A : string;
  attribute REG_CAS_A of inst : label is "FALSE";
  attribute REG_CAS_B : string;
  attribute REG_CAS_B of inst : label is "FALSE";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of inst : label is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of inst : label is "SYNC";
  attribute SELF_ADDR_A : string;
  attribute SELF_ADDR_A of inst : label is "11'b00000000000";
  attribute SELF_ADDR_B : string;
  attribute SELF_ADDR_B of inst : label is "11'b00000000000";
  attribute SELF_MASK_A : string;
  attribute SELF_MASK_A of inst : label is "11'b11111111111";
  attribute SELF_MASK_B : string;
  attribute SELF_MASK_B of inst : label is "11'b11111111111";
  attribute USE_EXT_CE_A : string;
  attribute USE_EXT_CE_A of inst : label is "FALSE";
  attribute USE_EXT_CE_B : string;
  attribute USE_EXT_CE_B of inst : label is "FALSE";
begin
inst: entity work.xilinx_ram_uram_rd_back_v1_0_0
     port map (
      ADDR_A(22 downto 0) => ADDR_A(22 downto 0),
      ADDR_B(22 downto 0) => ADDR_B(22 downto 0),
      BWE_A(8 downto 0) => BWE_A(8 downto 0),
      BWE_B(8 downto 0) => BWE_B(8 downto 0),
      CAS_IN_ADDR_A(22 downto 0) => CAS_IN_ADDR_A(22 downto 0),
      CAS_IN_ADDR_B(22 downto 0) => CAS_IN_ADDR_B(22 downto 0),
      CAS_IN_BWE_A(8 downto 0) => CAS_IN_BWE_A(8 downto 0),
      CAS_IN_BWE_B(8 downto 0) => CAS_IN_BWE_B(8 downto 0),
      CAS_IN_DBITERR_A => CAS_IN_DBITERR_A,
      CAS_IN_DBITERR_B => CAS_IN_DBITERR_B,
      CAS_IN_DIN_A(71 downto 0) => CAS_IN_DIN_A(71 downto 0),
      CAS_IN_DIN_B(71 downto 0) => CAS_IN_DIN_B(71 downto 0),
      CAS_IN_DOUT_A(71 downto 0) => CAS_IN_DOUT_A(71 downto 0),
      CAS_IN_DOUT_B(71 downto 0) => CAS_IN_DOUT_B(71 downto 0),
      CAS_IN_EN_A => CAS_IN_EN_A,
      CAS_IN_EN_B => CAS_IN_EN_B,
      CAS_IN_RDACCESS_A => CAS_IN_RDACCESS_A,
      CAS_IN_RDACCESS_B => CAS_IN_RDACCESS_B,
      CAS_IN_RDB_WR_A => CAS_IN_RDB_WR_A,
      CAS_IN_RDB_WR_B => CAS_IN_RDB_WR_B,
      CAS_IN_SBITERR_A => CAS_IN_SBITERR_A,
      CAS_IN_SBITERR_B => CAS_IN_SBITERR_B,
      CAS_OUT_ADDR_A(22 downto 0) => CAS_OUT_ADDR_A(22 downto 0),
      CAS_OUT_ADDR_B(22 downto 0) => CAS_OUT_ADDR_B(22 downto 0),
      CAS_OUT_BWE_A(8 downto 0) => CAS_OUT_BWE_A(8 downto 0),
      CAS_OUT_BWE_B(8 downto 0) => CAS_OUT_BWE_B(8 downto 0),
      CAS_OUT_DBITERR_A => CAS_OUT_DBITERR_A,
      CAS_OUT_DBITERR_B => CAS_OUT_DBITERR_B,
      CAS_OUT_DIN_A(71 downto 0) => CAS_OUT_DIN_A(71 downto 0),
      CAS_OUT_DIN_B(71 downto 0) => CAS_OUT_DIN_B(71 downto 0),
      CAS_OUT_DOUT_A(71 downto 0) => CAS_OUT_DOUT_A(71 downto 0),
      CAS_OUT_DOUT_B(71 downto 0) => CAS_OUT_DOUT_B(71 downto 0),
      CAS_OUT_EN_A => CAS_OUT_EN_A,
      CAS_OUT_EN_B => CAS_OUT_EN_B,
      CAS_OUT_RDACCESS_A => CAS_OUT_RDACCESS_A,
      CAS_OUT_RDACCESS_B => CAS_OUT_RDACCESS_B,
      CAS_OUT_RDB_WR_A => CAS_OUT_RDB_WR_A,
      CAS_OUT_RDB_WR_B => CAS_OUT_RDB_WR_B,
      CAS_OUT_SBITERR_A => CAS_OUT_SBITERR_A,
      CAS_OUT_SBITERR_B => CAS_OUT_SBITERR_B,
      CCLK => CCLK,
      CLK => CLK,
      DBITERR_A => DBITERR_A,
      DBITERR_B => DBITERR_B,
      DI(31 downto 0) => DI(31 downto 0),
      DIN_A(71 downto 0) => DIN_A(71 downto 0),
      DIN_B(71 downto 0) => DIN_B(71 downto 0),
      DOUT_A(71 downto 0) => DOUT_A(71 downto 0),
      DOUT_B(71 downto 0) => DOUT_B(71 downto 0),
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
      RDACCESS_A => RDACCESS_A,
      RDACCESS_B => RDACCESS_B,
      RDB_WR_A => RDB_WR_A,
      RDB_WR_B => RDB_WR_B,
      RST_A => RST_A,
      RST_B => RST_B,
      SBITERR_A => SBITERR_A,
      SBITERR_B => SBITERR_B,
      SLEEP => SLEEP,
      VLD => VLD
    );
end STRUCTURE;
