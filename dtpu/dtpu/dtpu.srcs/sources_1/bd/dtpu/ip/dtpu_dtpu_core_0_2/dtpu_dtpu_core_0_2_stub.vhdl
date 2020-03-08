-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
-- Date        : Sun Mar  8 20:37:21 2020
-- Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/uni/2019-2020/thesis/cogitantium/dtpu/dtpu/dtpu.srcs/sources_1/bd/dtpu/ip/dtpu_dtpu_core_0_2/dtpu_dtpu_core_0_2_stub.vhdl
-- Design      : dtpu_dtpu_core_0_2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dtpu_dtpu_core_0_2 is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    test_mode : in STD_LOGIC;
    enable : in STD_LOGIC;
    csr_address : out STD_LOGIC_VECTOR ( 31 downto 0 );
    csr_clk : out STD_LOGIC;
    csr_din : out STD_LOGIC_VECTOR ( 7 downto 0 );
    csr_dout : in STD_LOGIC_VECTOR ( 7 downto 0 );
    csr_ce : out STD_LOGIC;
    csr_reset : out STD_LOGIC;
    csr_we : out STD_LOGIC;
    wm_address : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wm_clk : out STD_LOGIC;
    wm_din : out STD_LOGIC_VECTOR ( 63 downto 0 );
    wm_dout : in STD_LOGIC_VECTOR ( 63 downto 0 );
    wm_ce : out STD_LOGIC;
    wm_reset : out STD_LOGIC;
    wm_we : out STD_LOGIC;
    infifo_is_empty : in STD_LOGIC;
    infifo_dout : in STD_LOGIC_VECTOR ( 63 downto 0 );
    infifo_read : out STD_LOGIC;
    outfifo_is_full : in STD_LOGIC;
    outfifo_din : out STD_LOGIC_VECTOR ( 63 downto 0 );
    outfifo_write : out STD_LOGIC;
    cs_continue : in STD_LOGIC;
    cs_done : out STD_LOGIC;
    cs_idle : out STD_LOGIC;
    cs_ready : out STD_LOGIC;
    cs_start : in STD_LOGIC
  );

end dtpu_dtpu_core_0_2;

architecture stub of dtpu_dtpu_core_0_2 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,reset,test_mode,enable,csr_address[31:0],csr_clk,csr_din[7:0],csr_dout[7:0],csr_ce,csr_reset,csr_we,wm_address[31:0],wm_clk,wm_din[63:0],wm_dout[63:0],wm_ce,wm_reset,wm_we,infifo_is_empty,infifo_dout[63:0],infifo_read,outfifo_is_full,outfifo_din[63:0],outfifo_write,cs_continue,cs_done,cs_idle,cs_ready,cs_start";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "dtpu_core,Vivado 2019.2.1";
begin
end;
