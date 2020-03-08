-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
-- Date        : Fri Mar  6 18:24:34 2020
-- Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/uni/2019-2020/thesis/cogitantium/dtpu/dtpu/dtpu.srcs/sources_1/ip/register_file/register_file_sim_netlist.vhdl
-- Design      : register_file
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity register_file_dpram is
  port (
    qspo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    a : in STD_LOGIC_VECTOR ( 9 downto 0 );
    we : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of register_file_dpram : entity is "dpram";
end register_file_dpram;

architecture STRUCTURE of register_file_dpram is
  signal dpra_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \dpra_reg_reg[0]_rep_n_0\ : STD_LOGIC;
  signal \dpra_reg_reg[1]_rep_n_0\ : STD_LOGIC;
  signal \dpra_reg_reg[2]_rep_n_0\ : STD_LOGIC;
  signal \dpra_reg_reg[3]_rep_n_0\ : STD_LOGIC;
  signal \dpra_reg_reg[4]_rep_n_0\ : STD_LOGIC;
  signal \dpra_reg_reg[5]_rep_n_0\ : STD_LOGIC;
  signal \dpra_reg_reg[6]_rep_n_0\ : STD_LOGIC;
  signal qdpo_input : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal qdpo_int : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of qdpo_int : signal is "true";
  signal \qdpo_int[0]_i_2_n_0\ : STD_LOGIC;
  signal \qdpo_int[0]_i_3_n_0\ : STD_LOGIC;
  signal \qdpo_int[1]_i_2_n_0\ : STD_LOGIC;
  signal \qdpo_int[1]_i_3_n_0\ : STD_LOGIC;
  signal \qdpo_int[2]_i_2_n_0\ : STD_LOGIC;
  signal \qdpo_int[2]_i_3_n_0\ : STD_LOGIC;
  signal \qdpo_int[3]_i_2_n_0\ : STD_LOGIC;
  signal \qdpo_int[3]_i_3_n_0\ : STD_LOGIC;
  signal \qdpo_int[4]_i_2_n_0\ : STD_LOGIC;
  signal \qdpo_int[4]_i_3_n_0\ : STD_LOGIC;
  signal \qdpo_int[5]_i_2_n_0\ : STD_LOGIC;
  signal \qdpo_int[5]_i_3_n_0\ : STD_LOGIC;
  signal \qdpo_int[6]_i_2_n_0\ : STD_LOGIC;
  signal \qdpo_int[6]_i_3_n_0\ : STD_LOGIC;
  signal \qdpo_int[7]_i_2_n_0\ : STD_LOGIC;
  signal \qdpo_int[7]_i_3_n_0\ : STD_LOGIC;
  signal qspo_input : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal qspo_int : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute RTL_KEEP of qspo_int : signal is "true";
  signal \qspo_int[0]_i_2_n_0\ : STD_LOGIC;
  signal \qspo_int[0]_i_3_n_0\ : STD_LOGIC;
  signal \qspo_int[1]_i_2_n_0\ : STD_LOGIC;
  signal \qspo_int[1]_i_3_n_0\ : STD_LOGIC;
  signal \qspo_int[2]_i_2_n_0\ : STD_LOGIC;
  signal \qspo_int[2]_i_3_n_0\ : STD_LOGIC;
  signal \qspo_int[3]_i_2_n_0\ : STD_LOGIC;
  signal \qspo_int[3]_i_3_n_0\ : STD_LOGIC;
  signal \qspo_int[4]_i_2_n_0\ : STD_LOGIC;
  signal \qspo_int[4]_i_3_n_0\ : STD_LOGIC;
  signal \qspo_int[5]_i_2_n_0\ : STD_LOGIC;
  signal \qspo_int[5]_i_3_n_0\ : STD_LOGIC;
  signal \qspo_int[6]_i_2_n_0\ : STD_LOGIC;
  signal \qspo_int[6]_i_3_n_0\ : STD_LOGIC;
  signal \qspo_int[7]_i_2_n_0\ : STD_LOGIC;
  signal \qspo_int[7]_i_3_n_0\ : STD_LOGIC;
  signal ram_reg_0_127_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_0_127_0_0_n_0 : STD_LOGIC;
  signal ram_reg_0_127_0_0_n_1 : STD_LOGIC;
  signal ram_reg_0_127_1_1_n_0 : STD_LOGIC;
  signal ram_reg_0_127_1_1_n_1 : STD_LOGIC;
  signal ram_reg_0_127_2_2_n_0 : STD_LOGIC;
  signal ram_reg_0_127_2_2_n_1 : STD_LOGIC;
  signal ram_reg_0_127_3_3_n_0 : STD_LOGIC;
  signal ram_reg_0_127_3_3_n_1 : STD_LOGIC;
  signal ram_reg_0_127_4_4_n_0 : STD_LOGIC;
  signal ram_reg_0_127_4_4_n_1 : STD_LOGIC;
  signal ram_reg_0_127_5_5_n_0 : STD_LOGIC;
  signal ram_reg_0_127_5_5_n_1 : STD_LOGIC;
  signal ram_reg_0_127_6_6_n_0 : STD_LOGIC;
  signal ram_reg_0_127_6_6_n_1 : STD_LOGIC;
  signal ram_reg_0_127_7_7_n_0 : STD_LOGIC;
  signal ram_reg_0_127_7_7_n_1 : STD_LOGIC;
  signal ram_reg_128_255_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_128_255_0_0_n_0 : STD_LOGIC;
  signal ram_reg_128_255_0_0_n_1 : STD_LOGIC;
  signal ram_reg_128_255_1_1_n_0 : STD_LOGIC;
  signal ram_reg_128_255_1_1_n_1 : STD_LOGIC;
  signal ram_reg_128_255_2_2_n_0 : STD_LOGIC;
  signal ram_reg_128_255_2_2_n_1 : STD_LOGIC;
  signal ram_reg_128_255_3_3_n_0 : STD_LOGIC;
  signal ram_reg_128_255_3_3_n_1 : STD_LOGIC;
  signal ram_reg_128_255_4_4_n_0 : STD_LOGIC;
  signal ram_reg_128_255_4_4_n_1 : STD_LOGIC;
  signal ram_reg_128_255_5_5_n_0 : STD_LOGIC;
  signal ram_reg_128_255_5_5_n_1 : STD_LOGIC;
  signal ram_reg_128_255_6_6_n_0 : STD_LOGIC;
  signal ram_reg_128_255_6_6_n_1 : STD_LOGIC;
  signal ram_reg_128_255_7_7_n_0 : STD_LOGIC;
  signal ram_reg_128_255_7_7_n_1 : STD_LOGIC;
  signal ram_reg_256_383_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_256_383_0_0_n_0 : STD_LOGIC;
  signal ram_reg_256_383_0_0_n_1 : STD_LOGIC;
  signal ram_reg_256_383_1_1_n_0 : STD_LOGIC;
  signal ram_reg_256_383_1_1_n_1 : STD_LOGIC;
  signal ram_reg_256_383_2_2_n_0 : STD_LOGIC;
  signal ram_reg_256_383_2_2_n_1 : STD_LOGIC;
  signal ram_reg_256_383_3_3_n_0 : STD_LOGIC;
  signal ram_reg_256_383_3_3_n_1 : STD_LOGIC;
  signal ram_reg_256_383_4_4_n_0 : STD_LOGIC;
  signal ram_reg_256_383_4_4_n_1 : STD_LOGIC;
  signal ram_reg_256_383_5_5_n_0 : STD_LOGIC;
  signal ram_reg_256_383_5_5_n_1 : STD_LOGIC;
  signal ram_reg_256_383_6_6_n_0 : STD_LOGIC;
  signal ram_reg_256_383_6_6_n_1 : STD_LOGIC;
  signal ram_reg_256_383_7_7_n_0 : STD_LOGIC;
  signal ram_reg_256_383_7_7_n_1 : STD_LOGIC;
  signal ram_reg_384_511_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_384_511_0_0_n_0 : STD_LOGIC;
  signal ram_reg_384_511_0_0_n_1 : STD_LOGIC;
  signal ram_reg_384_511_1_1_n_0 : STD_LOGIC;
  signal ram_reg_384_511_1_1_n_1 : STD_LOGIC;
  signal ram_reg_384_511_2_2_n_0 : STD_LOGIC;
  signal ram_reg_384_511_2_2_n_1 : STD_LOGIC;
  signal ram_reg_384_511_3_3_n_0 : STD_LOGIC;
  signal ram_reg_384_511_3_3_n_1 : STD_LOGIC;
  signal ram_reg_384_511_4_4_n_0 : STD_LOGIC;
  signal ram_reg_384_511_4_4_n_1 : STD_LOGIC;
  signal ram_reg_384_511_5_5_n_0 : STD_LOGIC;
  signal ram_reg_384_511_5_5_n_1 : STD_LOGIC;
  signal ram_reg_384_511_6_6_n_0 : STD_LOGIC;
  signal ram_reg_384_511_6_6_n_1 : STD_LOGIC;
  signal ram_reg_384_511_7_7_n_0 : STD_LOGIC;
  signal ram_reg_384_511_7_7_n_1 : STD_LOGIC;
  signal ram_reg_512_639_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_512_639_0_0_n_0 : STD_LOGIC;
  signal ram_reg_512_639_0_0_n_1 : STD_LOGIC;
  signal ram_reg_512_639_1_1_n_0 : STD_LOGIC;
  signal ram_reg_512_639_1_1_n_1 : STD_LOGIC;
  signal ram_reg_512_639_2_2_n_0 : STD_LOGIC;
  signal ram_reg_512_639_2_2_n_1 : STD_LOGIC;
  signal ram_reg_512_639_3_3_n_0 : STD_LOGIC;
  signal ram_reg_512_639_3_3_n_1 : STD_LOGIC;
  signal ram_reg_512_639_4_4_n_0 : STD_LOGIC;
  signal ram_reg_512_639_4_4_n_1 : STD_LOGIC;
  signal ram_reg_512_639_5_5_n_0 : STD_LOGIC;
  signal ram_reg_512_639_5_5_n_1 : STD_LOGIC;
  signal ram_reg_512_639_6_6_n_0 : STD_LOGIC;
  signal ram_reg_512_639_6_6_n_1 : STD_LOGIC;
  signal ram_reg_512_639_7_7_n_0 : STD_LOGIC;
  signal ram_reg_512_639_7_7_n_1 : STD_LOGIC;
  signal ram_reg_640_767_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_640_767_0_0_n_0 : STD_LOGIC;
  signal ram_reg_640_767_0_0_n_1 : STD_LOGIC;
  signal ram_reg_640_767_1_1_n_0 : STD_LOGIC;
  signal ram_reg_640_767_1_1_n_1 : STD_LOGIC;
  signal ram_reg_640_767_2_2_n_0 : STD_LOGIC;
  signal ram_reg_640_767_2_2_n_1 : STD_LOGIC;
  signal ram_reg_640_767_3_3_n_0 : STD_LOGIC;
  signal ram_reg_640_767_3_3_n_1 : STD_LOGIC;
  signal ram_reg_640_767_4_4_n_0 : STD_LOGIC;
  signal ram_reg_640_767_4_4_n_1 : STD_LOGIC;
  signal ram_reg_640_767_5_5_n_0 : STD_LOGIC;
  signal ram_reg_640_767_5_5_n_1 : STD_LOGIC;
  signal ram_reg_640_767_6_6_n_0 : STD_LOGIC;
  signal ram_reg_640_767_6_6_n_1 : STD_LOGIC;
  signal ram_reg_640_767_7_7_n_0 : STD_LOGIC;
  signal ram_reg_640_767_7_7_n_1 : STD_LOGIC;
  signal ram_reg_768_895_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_768_895_0_0_n_0 : STD_LOGIC;
  signal ram_reg_768_895_0_0_n_1 : STD_LOGIC;
  signal ram_reg_768_895_1_1_n_0 : STD_LOGIC;
  signal ram_reg_768_895_1_1_n_1 : STD_LOGIC;
  signal ram_reg_768_895_2_2_n_0 : STD_LOGIC;
  signal ram_reg_768_895_2_2_n_1 : STD_LOGIC;
  signal ram_reg_768_895_3_3_n_0 : STD_LOGIC;
  signal ram_reg_768_895_3_3_n_1 : STD_LOGIC;
  signal ram_reg_768_895_4_4_n_0 : STD_LOGIC;
  signal ram_reg_768_895_4_4_n_1 : STD_LOGIC;
  signal ram_reg_768_895_5_5_n_0 : STD_LOGIC;
  signal ram_reg_768_895_5_5_n_1 : STD_LOGIC;
  signal ram_reg_768_895_6_6_n_0 : STD_LOGIC;
  signal ram_reg_768_895_6_6_n_1 : STD_LOGIC;
  signal ram_reg_768_895_7_7_n_0 : STD_LOGIC;
  signal ram_reg_768_895_7_7_n_1 : STD_LOGIC;
  signal ram_reg_896_1023_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_896_1023_0_0_n_0 : STD_LOGIC;
  signal ram_reg_896_1023_0_0_n_1 : STD_LOGIC;
  signal ram_reg_896_1023_1_1_n_0 : STD_LOGIC;
  signal ram_reg_896_1023_1_1_n_1 : STD_LOGIC;
  signal ram_reg_896_1023_2_2_n_0 : STD_LOGIC;
  signal ram_reg_896_1023_2_2_n_1 : STD_LOGIC;
  signal ram_reg_896_1023_3_3_n_0 : STD_LOGIC;
  signal ram_reg_896_1023_3_3_n_1 : STD_LOGIC;
  signal ram_reg_896_1023_4_4_n_0 : STD_LOGIC;
  signal ram_reg_896_1023_4_4_n_1 : STD_LOGIC;
  signal ram_reg_896_1023_5_5_n_0 : STD_LOGIC;
  signal ram_reg_896_1023_5_5_n_1 : STD_LOGIC;
  signal ram_reg_896_1023_6_6_n_0 : STD_LOGIC;
  signal ram_reg_896_1023_6_6_n_1 : STD_LOGIC;
  signal ram_reg_896_1023_7_7_n_0 : STD_LOGIC;
  signal ram_reg_896_1023_7_7_n_1 : STD_LOGIC;
  attribute ORIG_CELL_NAME : string;
  attribute ORIG_CELL_NAME of \dpra_reg_reg[0]\ : label is "dpra_reg_reg[0]";
  attribute ORIG_CELL_NAME of \dpra_reg_reg[0]_rep\ : label is "dpra_reg_reg[0]";
  attribute ORIG_CELL_NAME of \dpra_reg_reg[1]\ : label is "dpra_reg_reg[1]";
  attribute ORIG_CELL_NAME of \dpra_reg_reg[1]_rep\ : label is "dpra_reg_reg[1]";
  attribute ORIG_CELL_NAME of \dpra_reg_reg[2]\ : label is "dpra_reg_reg[2]";
  attribute ORIG_CELL_NAME of \dpra_reg_reg[2]_rep\ : label is "dpra_reg_reg[2]";
  attribute ORIG_CELL_NAME of \dpra_reg_reg[3]\ : label is "dpra_reg_reg[3]";
  attribute ORIG_CELL_NAME of \dpra_reg_reg[3]_rep\ : label is "dpra_reg_reg[3]";
  attribute ORIG_CELL_NAME of \dpra_reg_reg[4]\ : label is "dpra_reg_reg[4]";
  attribute ORIG_CELL_NAME of \dpra_reg_reg[4]_rep\ : label is "dpra_reg_reg[4]";
  attribute ORIG_CELL_NAME of \dpra_reg_reg[5]\ : label is "dpra_reg_reg[5]";
  attribute ORIG_CELL_NAME of \dpra_reg_reg[5]_rep\ : label is "dpra_reg_reg[5]";
  attribute ORIG_CELL_NAME of \dpra_reg_reg[6]\ : label is "dpra_reg_reg[6]";
  attribute ORIG_CELL_NAME of \dpra_reg_reg[6]_rep\ : label is "dpra_reg_reg[6]";
  attribute KEEP : string;
  attribute KEEP of \qdpo_int_reg[0]\ : label is "yes";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \qdpo_int_reg[0]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[1]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[1]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[2]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[2]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[3]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[3]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[4]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[4]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[5]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[5]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[6]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[6]\ : label is "no";
  attribute KEEP of \qdpo_int_reg[7]\ : label is "yes";
  attribute equivalent_register_removal of \qdpo_int_reg[7]\ : label is "no";
  attribute KEEP of \qspo_int_reg[0]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[0]\ : label is "no";
  attribute KEEP of \qspo_int_reg[1]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[1]\ : label is "no";
  attribute KEEP of \qspo_int_reg[2]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[2]\ : label is "no";
  attribute KEEP of \qspo_int_reg[3]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[3]\ : label is "no";
  attribute KEEP of \qspo_int_reg[4]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[4]\ : label is "no";
  attribute KEEP of \qspo_int_reg[5]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[5]\ : label is "no";
  attribute KEEP of \qspo_int_reg[6]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[6]\ : label is "no";
  attribute KEEP of \qspo_int_reg[7]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[7]\ : label is "no";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_127_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of ram_reg_0_127_0_0 : label is 8192;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of ram_reg_0_127_0_0 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of ram_reg_0_127_0_0 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of ram_reg_0_127_0_0 : label is 127;
  attribute ram_offset : integer;
  attribute ram_offset of ram_reg_0_127_0_0 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of ram_reg_0_127_0_0 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of ram_reg_0_127_0_0 : label is 0;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_127_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_127_1_1 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_0_127_1_1 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_127_1_1 : label is 0;
  attribute ram_addr_end of ram_reg_0_127_1_1 : label is 127;
  attribute ram_offset of ram_reg_0_127_1_1 : label is 0;
  attribute ram_slice_begin of ram_reg_0_127_1_1 : label is 1;
  attribute ram_slice_end of ram_reg_0_127_1_1 : label is 1;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_127_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_127_2_2 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_0_127_2_2 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_127_2_2 : label is 0;
  attribute ram_addr_end of ram_reg_0_127_2_2 : label is 127;
  attribute ram_offset of ram_reg_0_127_2_2 : label is 0;
  attribute ram_slice_begin of ram_reg_0_127_2_2 : label is 2;
  attribute ram_slice_end of ram_reg_0_127_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_127_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_127_3_3 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_0_127_3_3 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_127_3_3 : label is 0;
  attribute ram_addr_end of ram_reg_0_127_3_3 : label is 127;
  attribute ram_offset of ram_reg_0_127_3_3 : label is 0;
  attribute ram_slice_begin of ram_reg_0_127_3_3 : label is 3;
  attribute ram_slice_end of ram_reg_0_127_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_127_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_127_4_4 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_0_127_4_4 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_127_4_4 : label is 0;
  attribute ram_addr_end of ram_reg_0_127_4_4 : label is 127;
  attribute ram_offset of ram_reg_0_127_4_4 : label is 0;
  attribute ram_slice_begin of ram_reg_0_127_4_4 : label is 4;
  attribute ram_slice_end of ram_reg_0_127_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_127_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_127_5_5 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_0_127_5_5 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_127_5_5 : label is 0;
  attribute ram_addr_end of ram_reg_0_127_5_5 : label is 127;
  attribute ram_offset of ram_reg_0_127_5_5 : label is 0;
  attribute ram_slice_begin of ram_reg_0_127_5_5 : label is 5;
  attribute ram_slice_end of ram_reg_0_127_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_127_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_127_6_6 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_0_127_6_6 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_127_6_6 : label is 0;
  attribute ram_addr_end of ram_reg_0_127_6_6 : label is 127;
  attribute ram_offset of ram_reg_0_127_6_6 : label is 0;
  attribute ram_slice_begin of ram_reg_0_127_6_6 : label is 6;
  attribute ram_slice_end of ram_reg_0_127_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_127_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_127_7_7 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_0_127_7_7 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_127_7_7 : label is 0;
  attribute ram_addr_end of ram_reg_0_127_7_7 : label is 127;
  attribute ram_offset of ram_reg_0_127_7_7 : label is 0;
  attribute ram_slice_begin of ram_reg_0_127_7_7 : label is 7;
  attribute ram_slice_end of ram_reg_0_127_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_128_255_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_128_255_0_0 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_128_255_0_0 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_128_255_0_0 : label is 128;
  attribute ram_addr_end of ram_reg_128_255_0_0 : label is 255;
  attribute ram_offset of ram_reg_128_255_0_0 : label is 0;
  attribute ram_slice_begin of ram_reg_128_255_0_0 : label is 0;
  attribute ram_slice_end of ram_reg_128_255_0_0 : label is 0;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_128_255_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_128_255_1_1 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_128_255_1_1 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_128_255_1_1 : label is 128;
  attribute ram_addr_end of ram_reg_128_255_1_1 : label is 255;
  attribute ram_offset of ram_reg_128_255_1_1 : label is 0;
  attribute ram_slice_begin of ram_reg_128_255_1_1 : label is 1;
  attribute ram_slice_end of ram_reg_128_255_1_1 : label is 1;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_128_255_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_128_255_2_2 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_128_255_2_2 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_128_255_2_2 : label is 128;
  attribute ram_addr_end of ram_reg_128_255_2_2 : label is 255;
  attribute ram_offset of ram_reg_128_255_2_2 : label is 0;
  attribute ram_slice_begin of ram_reg_128_255_2_2 : label is 2;
  attribute ram_slice_end of ram_reg_128_255_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_128_255_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_128_255_3_3 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_128_255_3_3 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_128_255_3_3 : label is 128;
  attribute ram_addr_end of ram_reg_128_255_3_3 : label is 255;
  attribute ram_offset of ram_reg_128_255_3_3 : label is 0;
  attribute ram_slice_begin of ram_reg_128_255_3_3 : label is 3;
  attribute ram_slice_end of ram_reg_128_255_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_128_255_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_128_255_4_4 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_128_255_4_4 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_128_255_4_4 : label is 128;
  attribute ram_addr_end of ram_reg_128_255_4_4 : label is 255;
  attribute ram_offset of ram_reg_128_255_4_4 : label is 0;
  attribute ram_slice_begin of ram_reg_128_255_4_4 : label is 4;
  attribute ram_slice_end of ram_reg_128_255_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_128_255_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_128_255_5_5 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_128_255_5_5 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_128_255_5_5 : label is 128;
  attribute ram_addr_end of ram_reg_128_255_5_5 : label is 255;
  attribute ram_offset of ram_reg_128_255_5_5 : label is 0;
  attribute ram_slice_begin of ram_reg_128_255_5_5 : label is 5;
  attribute ram_slice_end of ram_reg_128_255_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_128_255_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_128_255_6_6 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_128_255_6_6 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_128_255_6_6 : label is 128;
  attribute ram_addr_end of ram_reg_128_255_6_6 : label is 255;
  attribute ram_offset of ram_reg_128_255_6_6 : label is 0;
  attribute ram_slice_begin of ram_reg_128_255_6_6 : label is 6;
  attribute ram_slice_end of ram_reg_128_255_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_128_255_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_128_255_7_7 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_128_255_7_7 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_128_255_7_7 : label is 128;
  attribute ram_addr_end of ram_reg_128_255_7_7 : label is 255;
  attribute ram_offset of ram_reg_128_255_7_7 : label is 0;
  attribute ram_slice_begin of ram_reg_128_255_7_7 : label is 7;
  attribute ram_slice_end of ram_reg_128_255_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_383_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_383_0_0 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_256_383_0_0 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_383_0_0 : label is 256;
  attribute ram_addr_end of ram_reg_256_383_0_0 : label is 383;
  attribute ram_offset of ram_reg_256_383_0_0 : label is 0;
  attribute ram_slice_begin of ram_reg_256_383_0_0 : label is 0;
  attribute ram_slice_end of ram_reg_256_383_0_0 : label is 0;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_383_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_383_1_1 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_256_383_1_1 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_383_1_1 : label is 256;
  attribute ram_addr_end of ram_reg_256_383_1_1 : label is 383;
  attribute ram_offset of ram_reg_256_383_1_1 : label is 0;
  attribute ram_slice_begin of ram_reg_256_383_1_1 : label is 1;
  attribute ram_slice_end of ram_reg_256_383_1_1 : label is 1;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_383_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_383_2_2 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_256_383_2_2 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_383_2_2 : label is 256;
  attribute ram_addr_end of ram_reg_256_383_2_2 : label is 383;
  attribute ram_offset of ram_reg_256_383_2_2 : label is 0;
  attribute ram_slice_begin of ram_reg_256_383_2_2 : label is 2;
  attribute ram_slice_end of ram_reg_256_383_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_383_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_383_3_3 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_256_383_3_3 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_383_3_3 : label is 256;
  attribute ram_addr_end of ram_reg_256_383_3_3 : label is 383;
  attribute ram_offset of ram_reg_256_383_3_3 : label is 0;
  attribute ram_slice_begin of ram_reg_256_383_3_3 : label is 3;
  attribute ram_slice_end of ram_reg_256_383_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_383_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_383_4_4 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_256_383_4_4 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_383_4_4 : label is 256;
  attribute ram_addr_end of ram_reg_256_383_4_4 : label is 383;
  attribute ram_offset of ram_reg_256_383_4_4 : label is 0;
  attribute ram_slice_begin of ram_reg_256_383_4_4 : label is 4;
  attribute ram_slice_end of ram_reg_256_383_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_383_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_383_5_5 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_256_383_5_5 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_383_5_5 : label is 256;
  attribute ram_addr_end of ram_reg_256_383_5_5 : label is 383;
  attribute ram_offset of ram_reg_256_383_5_5 : label is 0;
  attribute ram_slice_begin of ram_reg_256_383_5_5 : label is 5;
  attribute ram_slice_end of ram_reg_256_383_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_383_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_383_6_6 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_256_383_6_6 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_383_6_6 : label is 256;
  attribute ram_addr_end of ram_reg_256_383_6_6 : label is 383;
  attribute ram_offset of ram_reg_256_383_6_6 : label is 0;
  attribute ram_slice_begin of ram_reg_256_383_6_6 : label is 6;
  attribute ram_slice_end of ram_reg_256_383_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_383_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_383_7_7 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_256_383_7_7 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_383_7_7 : label is 256;
  attribute ram_addr_end of ram_reg_256_383_7_7 : label is 383;
  attribute ram_offset of ram_reg_256_383_7_7 : label is 0;
  attribute ram_slice_begin of ram_reg_256_383_7_7 : label is 7;
  attribute ram_slice_end of ram_reg_256_383_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_384_511_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_384_511_0_0 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_384_511_0_0 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_384_511_0_0 : label is 384;
  attribute ram_addr_end of ram_reg_384_511_0_0 : label is 511;
  attribute ram_offset of ram_reg_384_511_0_0 : label is 0;
  attribute ram_slice_begin of ram_reg_384_511_0_0 : label is 0;
  attribute ram_slice_end of ram_reg_384_511_0_0 : label is 0;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_384_511_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_384_511_1_1 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_384_511_1_1 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_384_511_1_1 : label is 384;
  attribute ram_addr_end of ram_reg_384_511_1_1 : label is 511;
  attribute ram_offset of ram_reg_384_511_1_1 : label is 0;
  attribute ram_slice_begin of ram_reg_384_511_1_1 : label is 1;
  attribute ram_slice_end of ram_reg_384_511_1_1 : label is 1;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_384_511_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_384_511_2_2 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_384_511_2_2 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_384_511_2_2 : label is 384;
  attribute ram_addr_end of ram_reg_384_511_2_2 : label is 511;
  attribute ram_offset of ram_reg_384_511_2_2 : label is 0;
  attribute ram_slice_begin of ram_reg_384_511_2_2 : label is 2;
  attribute ram_slice_end of ram_reg_384_511_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_384_511_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_384_511_3_3 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_384_511_3_3 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_384_511_3_3 : label is 384;
  attribute ram_addr_end of ram_reg_384_511_3_3 : label is 511;
  attribute ram_offset of ram_reg_384_511_3_3 : label is 0;
  attribute ram_slice_begin of ram_reg_384_511_3_3 : label is 3;
  attribute ram_slice_end of ram_reg_384_511_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_384_511_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_384_511_4_4 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_384_511_4_4 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_384_511_4_4 : label is 384;
  attribute ram_addr_end of ram_reg_384_511_4_4 : label is 511;
  attribute ram_offset of ram_reg_384_511_4_4 : label is 0;
  attribute ram_slice_begin of ram_reg_384_511_4_4 : label is 4;
  attribute ram_slice_end of ram_reg_384_511_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_384_511_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_384_511_5_5 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_384_511_5_5 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_384_511_5_5 : label is 384;
  attribute ram_addr_end of ram_reg_384_511_5_5 : label is 511;
  attribute ram_offset of ram_reg_384_511_5_5 : label is 0;
  attribute ram_slice_begin of ram_reg_384_511_5_5 : label is 5;
  attribute ram_slice_end of ram_reg_384_511_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_384_511_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_384_511_6_6 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_384_511_6_6 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_384_511_6_6 : label is 384;
  attribute ram_addr_end of ram_reg_384_511_6_6 : label is 511;
  attribute ram_offset of ram_reg_384_511_6_6 : label is 0;
  attribute ram_slice_begin of ram_reg_384_511_6_6 : label is 6;
  attribute ram_slice_end of ram_reg_384_511_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_384_511_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_384_511_7_7 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_384_511_7_7 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_384_511_7_7 : label is 384;
  attribute ram_addr_end of ram_reg_384_511_7_7 : label is 511;
  attribute ram_offset of ram_reg_384_511_7_7 : label is 0;
  attribute ram_slice_begin of ram_reg_384_511_7_7 : label is 7;
  attribute ram_slice_end of ram_reg_384_511_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_639_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_512_639_0_0 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_512_639_0_0 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_512_639_0_0 : label is 512;
  attribute ram_addr_end of ram_reg_512_639_0_0 : label is 639;
  attribute ram_offset of ram_reg_512_639_0_0 : label is 0;
  attribute ram_slice_begin of ram_reg_512_639_0_0 : label is 0;
  attribute ram_slice_end of ram_reg_512_639_0_0 : label is 0;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_639_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_512_639_1_1 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_512_639_1_1 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_512_639_1_1 : label is 512;
  attribute ram_addr_end of ram_reg_512_639_1_1 : label is 639;
  attribute ram_offset of ram_reg_512_639_1_1 : label is 0;
  attribute ram_slice_begin of ram_reg_512_639_1_1 : label is 1;
  attribute ram_slice_end of ram_reg_512_639_1_1 : label is 1;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_639_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_512_639_2_2 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_512_639_2_2 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_512_639_2_2 : label is 512;
  attribute ram_addr_end of ram_reg_512_639_2_2 : label is 639;
  attribute ram_offset of ram_reg_512_639_2_2 : label is 0;
  attribute ram_slice_begin of ram_reg_512_639_2_2 : label is 2;
  attribute ram_slice_end of ram_reg_512_639_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_639_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_512_639_3_3 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_512_639_3_3 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_512_639_3_3 : label is 512;
  attribute ram_addr_end of ram_reg_512_639_3_3 : label is 639;
  attribute ram_offset of ram_reg_512_639_3_3 : label is 0;
  attribute ram_slice_begin of ram_reg_512_639_3_3 : label is 3;
  attribute ram_slice_end of ram_reg_512_639_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_639_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_512_639_4_4 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_512_639_4_4 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_512_639_4_4 : label is 512;
  attribute ram_addr_end of ram_reg_512_639_4_4 : label is 639;
  attribute ram_offset of ram_reg_512_639_4_4 : label is 0;
  attribute ram_slice_begin of ram_reg_512_639_4_4 : label is 4;
  attribute ram_slice_end of ram_reg_512_639_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_639_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_512_639_5_5 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_512_639_5_5 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_512_639_5_5 : label is 512;
  attribute ram_addr_end of ram_reg_512_639_5_5 : label is 639;
  attribute ram_offset of ram_reg_512_639_5_5 : label is 0;
  attribute ram_slice_begin of ram_reg_512_639_5_5 : label is 5;
  attribute ram_slice_end of ram_reg_512_639_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_639_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_512_639_6_6 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_512_639_6_6 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_512_639_6_6 : label is 512;
  attribute ram_addr_end of ram_reg_512_639_6_6 : label is 639;
  attribute ram_offset of ram_reg_512_639_6_6 : label is 0;
  attribute ram_slice_begin of ram_reg_512_639_6_6 : label is 6;
  attribute ram_slice_end of ram_reg_512_639_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_512_639_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_512_639_7_7 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_512_639_7_7 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_512_639_7_7 : label is 512;
  attribute ram_addr_end of ram_reg_512_639_7_7 : label is 639;
  attribute ram_offset of ram_reg_512_639_7_7 : label is 0;
  attribute ram_slice_begin of ram_reg_512_639_7_7 : label is 7;
  attribute ram_slice_end of ram_reg_512_639_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_640_767_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_640_767_0_0 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_640_767_0_0 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_640_767_0_0 : label is 640;
  attribute ram_addr_end of ram_reg_640_767_0_0 : label is 767;
  attribute ram_offset of ram_reg_640_767_0_0 : label is 0;
  attribute ram_slice_begin of ram_reg_640_767_0_0 : label is 0;
  attribute ram_slice_end of ram_reg_640_767_0_0 : label is 0;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_640_767_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_640_767_1_1 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_640_767_1_1 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_640_767_1_1 : label is 640;
  attribute ram_addr_end of ram_reg_640_767_1_1 : label is 767;
  attribute ram_offset of ram_reg_640_767_1_1 : label is 0;
  attribute ram_slice_begin of ram_reg_640_767_1_1 : label is 1;
  attribute ram_slice_end of ram_reg_640_767_1_1 : label is 1;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_640_767_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_640_767_2_2 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_640_767_2_2 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_640_767_2_2 : label is 640;
  attribute ram_addr_end of ram_reg_640_767_2_2 : label is 767;
  attribute ram_offset of ram_reg_640_767_2_2 : label is 0;
  attribute ram_slice_begin of ram_reg_640_767_2_2 : label is 2;
  attribute ram_slice_end of ram_reg_640_767_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_640_767_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_640_767_3_3 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_640_767_3_3 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_640_767_3_3 : label is 640;
  attribute ram_addr_end of ram_reg_640_767_3_3 : label is 767;
  attribute ram_offset of ram_reg_640_767_3_3 : label is 0;
  attribute ram_slice_begin of ram_reg_640_767_3_3 : label is 3;
  attribute ram_slice_end of ram_reg_640_767_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_640_767_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_640_767_4_4 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_640_767_4_4 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_640_767_4_4 : label is 640;
  attribute ram_addr_end of ram_reg_640_767_4_4 : label is 767;
  attribute ram_offset of ram_reg_640_767_4_4 : label is 0;
  attribute ram_slice_begin of ram_reg_640_767_4_4 : label is 4;
  attribute ram_slice_end of ram_reg_640_767_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_640_767_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_640_767_5_5 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_640_767_5_5 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_640_767_5_5 : label is 640;
  attribute ram_addr_end of ram_reg_640_767_5_5 : label is 767;
  attribute ram_offset of ram_reg_640_767_5_5 : label is 0;
  attribute ram_slice_begin of ram_reg_640_767_5_5 : label is 5;
  attribute ram_slice_end of ram_reg_640_767_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_640_767_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_640_767_6_6 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_640_767_6_6 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_640_767_6_6 : label is 640;
  attribute ram_addr_end of ram_reg_640_767_6_6 : label is 767;
  attribute ram_offset of ram_reg_640_767_6_6 : label is 0;
  attribute ram_slice_begin of ram_reg_640_767_6_6 : label is 6;
  attribute ram_slice_end of ram_reg_640_767_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_640_767_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_640_767_7_7 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_640_767_7_7 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_640_767_7_7 : label is 640;
  attribute ram_addr_end of ram_reg_640_767_7_7 : label is 767;
  attribute ram_offset of ram_reg_640_767_7_7 : label is 0;
  attribute ram_slice_begin of ram_reg_640_767_7_7 : label is 7;
  attribute ram_slice_end of ram_reg_640_767_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_895_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_768_895_0_0 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_768_895_0_0 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_768_895_0_0 : label is 768;
  attribute ram_addr_end of ram_reg_768_895_0_0 : label is 895;
  attribute ram_offset of ram_reg_768_895_0_0 : label is 0;
  attribute ram_slice_begin of ram_reg_768_895_0_0 : label is 0;
  attribute ram_slice_end of ram_reg_768_895_0_0 : label is 0;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_895_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_768_895_1_1 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_768_895_1_1 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_768_895_1_1 : label is 768;
  attribute ram_addr_end of ram_reg_768_895_1_1 : label is 895;
  attribute ram_offset of ram_reg_768_895_1_1 : label is 0;
  attribute ram_slice_begin of ram_reg_768_895_1_1 : label is 1;
  attribute ram_slice_end of ram_reg_768_895_1_1 : label is 1;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_895_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_768_895_2_2 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_768_895_2_2 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_768_895_2_2 : label is 768;
  attribute ram_addr_end of ram_reg_768_895_2_2 : label is 895;
  attribute ram_offset of ram_reg_768_895_2_2 : label is 0;
  attribute ram_slice_begin of ram_reg_768_895_2_2 : label is 2;
  attribute ram_slice_end of ram_reg_768_895_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_895_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_768_895_3_3 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_768_895_3_3 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_768_895_3_3 : label is 768;
  attribute ram_addr_end of ram_reg_768_895_3_3 : label is 895;
  attribute ram_offset of ram_reg_768_895_3_3 : label is 0;
  attribute ram_slice_begin of ram_reg_768_895_3_3 : label is 3;
  attribute ram_slice_end of ram_reg_768_895_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_895_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_768_895_4_4 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_768_895_4_4 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_768_895_4_4 : label is 768;
  attribute ram_addr_end of ram_reg_768_895_4_4 : label is 895;
  attribute ram_offset of ram_reg_768_895_4_4 : label is 0;
  attribute ram_slice_begin of ram_reg_768_895_4_4 : label is 4;
  attribute ram_slice_end of ram_reg_768_895_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_895_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_768_895_5_5 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_768_895_5_5 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_768_895_5_5 : label is 768;
  attribute ram_addr_end of ram_reg_768_895_5_5 : label is 895;
  attribute ram_offset of ram_reg_768_895_5_5 : label is 0;
  attribute ram_slice_begin of ram_reg_768_895_5_5 : label is 5;
  attribute ram_slice_end of ram_reg_768_895_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_895_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_768_895_6_6 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_768_895_6_6 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_768_895_6_6 : label is 768;
  attribute ram_addr_end of ram_reg_768_895_6_6 : label is 895;
  attribute ram_offset of ram_reg_768_895_6_6 : label is 0;
  attribute ram_slice_begin of ram_reg_768_895_6_6 : label is 6;
  attribute ram_slice_end of ram_reg_768_895_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_768_895_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_768_895_7_7 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_768_895_7_7 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_768_895_7_7 : label is 768;
  attribute ram_addr_end of ram_reg_768_895_7_7 : label is 895;
  attribute ram_offset of ram_reg_768_895_7_7 : label is 0;
  attribute ram_slice_begin of ram_reg_768_895_7_7 : label is 7;
  attribute ram_slice_end of ram_reg_768_895_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_896_1023_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_896_1023_0_0 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_896_1023_0_0 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_896_1023_0_0 : label is 896;
  attribute ram_addr_end of ram_reg_896_1023_0_0 : label is 1023;
  attribute ram_offset of ram_reg_896_1023_0_0 : label is 0;
  attribute ram_slice_begin of ram_reg_896_1023_0_0 : label is 0;
  attribute ram_slice_end of ram_reg_896_1023_0_0 : label is 0;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_896_1023_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_896_1023_1_1 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_896_1023_1_1 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_896_1023_1_1 : label is 896;
  attribute ram_addr_end of ram_reg_896_1023_1_1 : label is 1023;
  attribute ram_offset of ram_reg_896_1023_1_1 : label is 0;
  attribute ram_slice_begin of ram_reg_896_1023_1_1 : label is 1;
  attribute ram_slice_end of ram_reg_896_1023_1_1 : label is 1;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_896_1023_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_896_1023_2_2 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_896_1023_2_2 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_896_1023_2_2 : label is 896;
  attribute ram_addr_end of ram_reg_896_1023_2_2 : label is 1023;
  attribute ram_offset of ram_reg_896_1023_2_2 : label is 0;
  attribute ram_slice_begin of ram_reg_896_1023_2_2 : label is 2;
  attribute ram_slice_end of ram_reg_896_1023_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_896_1023_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_896_1023_3_3 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_896_1023_3_3 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_896_1023_3_3 : label is 896;
  attribute ram_addr_end of ram_reg_896_1023_3_3 : label is 1023;
  attribute ram_offset of ram_reg_896_1023_3_3 : label is 0;
  attribute ram_slice_begin of ram_reg_896_1023_3_3 : label is 3;
  attribute ram_slice_end of ram_reg_896_1023_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_896_1023_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_896_1023_4_4 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_896_1023_4_4 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_896_1023_4_4 : label is 896;
  attribute ram_addr_end of ram_reg_896_1023_4_4 : label is 1023;
  attribute ram_offset of ram_reg_896_1023_4_4 : label is 0;
  attribute ram_slice_begin of ram_reg_896_1023_4_4 : label is 4;
  attribute ram_slice_end of ram_reg_896_1023_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_896_1023_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_896_1023_5_5 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_896_1023_5_5 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_896_1023_5_5 : label is 896;
  attribute ram_addr_end of ram_reg_896_1023_5_5 : label is 1023;
  attribute ram_offset of ram_reg_896_1023_5_5 : label is 0;
  attribute ram_slice_begin of ram_reg_896_1023_5_5 : label is 5;
  attribute ram_slice_end of ram_reg_896_1023_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_896_1023_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_896_1023_6_6 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_896_1023_6_6 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_896_1023_6_6 : label is 896;
  attribute ram_addr_end of ram_reg_896_1023_6_6 : label is 1023;
  attribute ram_offset of ram_reg_896_1023_6_6 : label is 0;
  attribute ram_slice_begin of ram_reg_896_1023_6_6 : label is 6;
  attribute ram_slice_end of ram_reg_896_1023_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_896_1023_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_896_1023_7_7 : label is 8192;
  attribute RTL_RAM_NAME of ram_reg_896_1023_7_7 : label is "synth_options.dist_mem_inst/gen_dp_ram.dpram_inst/ram";
  attribute ram_addr_begin of ram_reg_896_1023_7_7 : label is 896;
  attribute ram_addr_end of ram_reg_896_1023_7_7 : label is 1023;
  attribute ram_offset of ram_reg_896_1023_7_7 : label is 0;
  attribute ram_slice_begin of ram_reg_896_1023_7_7 : label is 7;
  attribute ram_slice_end of ram_reg_896_1023_7_7 : label is 7;
begin
  qdpo(7 downto 0) <= qdpo_int(7 downto 0);
  qspo(7 downto 0) <= qspo_int(7 downto 0);
\dpra_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(0),
      Q => dpra_reg(0),
      R => '0'
    );
\dpra_reg_reg[0]_rep\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(0),
      Q => \dpra_reg_reg[0]_rep_n_0\,
      R => '0'
    );
\dpra_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(1),
      Q => dpra_reg(1),
      R => '0'
    );
\dpra_reg_reg[1]_rep\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(1),
      Q => \dpra_reg_reg[1]_rep_n_0\,
      R => '0'
    );
\dpra_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(2),
      Q => dpra_reg(2),
      R => '0'
    );
\dpra_reg_reg[2]_rep\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(2),
      Q => \dpra_reg_reg[2]_rep_n_0\,
      R => '0'
    );
\dpra_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(3),
      Q => dpra_reg(3),
      R => '0'
    );
\dpra_reg_reg[3]_rep\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(3),
      Q => \dpra_reg_reg[3]_rep_n_0\,
      R => '0'
    );
\dpra_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(4),
      Q => dpra_reg(4),
      R => '0'
    );
\dpra_reg_reg[4]_rep\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(4),
      Q => \dpra_reg_reg[4]_rep_n_0\,
      R => '0'
    );
\dpra_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(5),
      Q => dpra_reg(5),
      R => '0'
    );
\dpra_reg_reg[5]_rep\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(5),
      Q => \dpra_reg_reg[5]_rep_n_0\,
      R => '0'
    );
\dpra_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(6),
      Q => dpra_reg(6),
      R => '0'
    );
\dpra_reg_reg[6]_rep\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(6),
      Q => \dpra_reg_reg[6]_rep_n_0\,
      R => '0'
    );
\dpra_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(7),
      Q => dpra_reg(7),
      R => '0'
    );
\dpra_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(8),
      Q => dpra_reg(8),
      R => '0'
    );
\dpra_reg_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => dpra(9),
      Q => dpra_reg(9),
      R => '0'
    );
\qdpo_int[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_0_0_n_0,
      I1 => ram_reg_256_383_0_0_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_128_255_0_0_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_0_127_0_0_n_0,
      O => \qdpo_int[0]_i_2_n_0\
    );
\qdpo_int[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_0_0_n_0,
      I1 => ram_reg_768_895_0_0_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_640_767_0_0_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_512_639_0_0_n_0,
      O => \qdpo_int[0]_i_3_n_0\
    );
\qdpo_int[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_1_1_n_0,
      I1 => ram_reg_256_383_1_1_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_128_255_1_1_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_0_127_1_1_n_0,
      O => \qdpo_int[1]_i_2_n_0\
    );
\qdpo_int[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_1_1_n_0,
      I1 => ram_reg_768_895_1_1_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_640_767_1_1_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_512_639_1_1_n_0,
      O => \qdpo_int[1]_i_3_n_0\
    );
\qdpo_int[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_2_2_n_0,
      I1 => ram_reg_256_383_2_2_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_128_255_2_2_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_0_127_2_2_n_0,
      O => \qdpo_int[2]_i_2_n_0\
    );
\qdpo_int[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_2_2_n_0,
      I1 => ram_reg_768_895_2_2_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_640_767_2_2_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_512_639_2_2_n_0,
      O => \qdpo_int[2]_i_3_n_0\
    );
\qdpo_int[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_3_3_n_0,
      I1 => ram_reg_256_383_3_3_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_128_255_3_3_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_0_127_3_3_n_0,
      O => \qdpo_int[3]_i_2_n_0\
    );
\qdpo_int[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_3_3_n_0,
      I1 => ram_reg_768_895_3_3_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_640_767_3_3_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_512_639_3_3_n_0,
      O => \qdpo_int[3]_i_3_n_0\
    );
\qdpo_int[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_4_4_n_0,
      I1 => ram_reg_256_383_4_4_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_128_255_4_4_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_0_127_4_4_n_0,
      O => \qdpo_int[4]_i_2_n_0\
    );
\qdpo_int[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_4_4_n_0,
      I1 => ram_reg_768_895_4_4_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_640_767_4_4_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_512_639_4_4_n_0,
      O => \qdpo_int[4]_i_3_n_0\
    );
\qdpo_int[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_5_5_n_0,
      I1 => ram_reg_256_383_5_5_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_128_255_5_5_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_0_127_5_5_n_0,
      O => \qdpo_int[5]_i_2_n_0\
    );
\qdpo_int[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_5_5_n_0,
      I1 => ram_reg_768_895_5_5_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_640_767_5_5_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_512_639_5_5_n_0,
      O => \qdpo_int[5]_i_3_n_0\
    );
\qdpo_int[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_6_6_n_0,
      I1 => ram_reg_256_383_6_6_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_128_255_6_6_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_0_127_6_6_n_0,
      O => \qdpo_int[6]_i_2_n_0\
    );
\qdpo_int[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_6_6_n_0,
      I1 => ram_reg_768_895_6_6_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_640_767_6_6_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_512_639_6_6_n_0,
      O => \qdpo_int[6]_i_3_n_0\
    );
\qdpo_int[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_7_7_n_0,
      I1 => ram_reg_256_383_7_7_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_128_255_7_7_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_0_127_7_7_n_0,
      O => \qdpo_int[7]_i_2_n_0\
    );
\qdpo_int[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_7_7_n_0,
      I1 => ram_reg_768_895_7_7_n_0,
      I2 => dpra_reg(8),
      I3 => ram_reg_640_767_7_7_n_0,
      I4 => dpra_reg(7),
      I5 => ram_reg_512_639_7_7_n_0,
      O => \qdpo_int[7]_i_3_n_0\
    );
\qdpo_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qdpo_input(0),
      Q => qdpo_int(0),
      R => qdpo_srst
    );
\qdpo_int_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qdpo_int[0]_i_2_n_0\,
      I1 => \qdpo_int[0]_i_3_n_0\,
      O => qdpo_input(0),
      S => dpra_reg(9)
    );
\qdpo_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qdpo_input(1),
      Q => qdpo_int(1),
      R => qdpo_srst
    );
\qdpo_int_reg[1]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qdpo_int[1]_i_2_n_0\,
      I1 => \qdpo_int[1]_i_3_n_0\,
      O => qdpo_input(1),
      S => dpra_reg(9)
    );
\qdpo_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qdpo_input(2),
      Q => qdpo_int(2),
      R => qdpo_srst
    );
\qdpo_int_reg[2]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qdpo_int[2]_i_2_n_0\,
      I1 => \qdpo_int[2]_i_3_n_0\,
      O => qdpo_input(2),
      S => dpra_reg(9)
    );
\qdpo_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qdpo_input(3),
      Q => qdpo_int(3),
      R => qdpo_srst
    );
\qdpo_int_reg[3]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qdpo_int[3]_i_2_n_0\,
      I1 => \qdpo_int[3]_i_3_n_0\,
      O => qdpo_input(3),
      S => dpra_reg(9)
    );
\qdpo_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qdpo_input(4),
      Q => qdpo_int(4),
      R => qdpo_srst
    );
\qdpo_int_reg[4]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qdpo_int[4]_i_2_n_0\,
      I1 => \qdpo_int[4]_i_3_n_0\,
      O => qdpo_input(4),
      S => dpra_reg(9)
    );
\qdpo_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qdpo_input(5),
      Q => qdpo_int(5),
      R => qdpo_srst
    );
\qdpo_int_reg[5]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qdpo_int[5]_i_2_n_0\,
      I1 => \qdpo_int[5]_i_3_n_0\,
      O => qdpo_input(5),
      S => dpra_reg(9)
    );
\qdpo_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qdpo_input(6),
      Q => qdpo_int(6),
      R => qdpo_srst
    );
\qdpo_int_reg[6]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qdpo_int[6]_i_2_n_0\,
      I1 => \qdpo_int[6]_i_3_n_0\,
      O => qdpo_input(6),
      S => dpra_reg(9)
    );
\qdpo_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qdpo_input(7),
      Q => qdpo_int(7),
      R => qdpo_srst
    );
\qdpo_int_reg[7]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qdpo_int[7]_i_2_n_0\,
      I1 => \qdpo_int[7]_i_3_n_0\,
      O => qdpo_input(7),
      S => dpra_reg(9)
    );
\qspo_int[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_0_0_n_1,
      I1 => ram_reg_256_383_0_0_n_1,
      I2 => a(8),
      I3 => ram_reg_128_255_0_0_n_1,
      I4 => a(7),
      I5 => ram_reg_0_127_0_0_n_1,
      O => \qspo_int[0]_i_2_n_0\
    );
\qspo_int[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_0_0_n_1,
      I1 => ram_reg_768_895_0_0_n_1,
      I2 => a(8),
      I3 => ram_reg_640_767_0_0_n_1,
      I4 => a(7),
      I5 => ram_reg_512_639_0_0_n_1,
      O => \qspo_int[0]_i_3_n_0\
    );
\qspo_int[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_1_1_n_1,
      I1 => ram_reg_256_383_1_1_n_1,
      I2 => a(8),
      I3 => ram_reg_128_255_1_1_n_1,
      I4 => a(7),
      I5 => ram_reg_0_127_1_1_n_1,
      O => \qspo_int[1]_i_2_n_0\
    );
\qspo_int[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_1_1_n_1,
      I1 => ram_reg_768_895_1_1_n_1,
      I2 => a(8),
      I3 => ram_reg_640_767_1_1_n_1,
      I4 => a(7),
      I5 => ram_reg_512_639_1_1_n_1,
      O => \qspo_int[1]_i_3_n_0\
    );
\qspo_int[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_2_2_n_1,
      I1 => ram_reg_256_383_2_2_n_1,
      I2 => a(8),
      I3 => ram_reg_128_255_2_2_n_1,
      I4 => a(7),
      I5 => ram_reg_0_127_2_2_n_1,
      O => \qspo_int[2]_i_2_n_0\
    );
\qspo_int[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_2_2_n_1,
      I1 => ram_reg_768_895_2_2_n_1,
      I2 => a(8),
      I3 => ram_reg_640_767_2_2_n_1,
      I4 => a(7),
      I5 => ram_reg_512_639_2_2_n_1,
      O => \qspo_int[2]_i_3_n_0\
    );
\qspo_int[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_3_3_n_1,
      I1 => ram_reg_256_383_3_3_n_1,
      I2 => a(8),
      I3 => ram_reg_128_255_3_3_n_1,
      I4 => a(7),
      I5 => ram_reg_0_127_3_3_n_1,
      O => \qspo_int[3]_i_2_n_0\
    );
\qspo_int[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_3_3_n_1,
      I1 => ram_reg_768_895_3_3_n_1,
      I2 => a(8),
      I3 => ram_reg_640_767_3_3_n_1,
      I4 => a(7),
      I5 => ram_reg_512_639_3_3_n_1,
      O => \qspo_int[3]_i_3_n_0\
    );
\qspo_int[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_4_4_n_1,
      I1 => ram_reg_256_383_4_4_n_1,
      I2 => a(8),
      I3 => ram_reg_128_255_4_4_n_1,
      I4 => a(7),
      I5 => ram_reg_0_127_4_4_n_1,
      O => \qspo_int[4]_i_2_n_0\
    );
\qspo_int[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_4_4_n_1,
      I1 => ram_reg_768_895_4_4_n_1,
      I2 => a(8),
      I3 => ram_reg_640_767_4_4_n_1,
      I4 => a(7),
      I5 => ram_reg_512_639_4_4_n_1,
      O => \qspo_int[4]_i_3_n_0\
    );
\qspo_int[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_5_5_n_1,
      I1 => ram_reg_256_383_5_5_n_1,
      I2 => a(8),
      I3 => ram_reg_128_255_5_5_n_1,
      I4 => a(7),
      I5 => ram_reg_0_127_5_5_n_1,
      O => \qspo_int[5]_i_2_n_0\
    );
\qspo_int[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_5_5_n_1,
      I1 => ram_reg_768_895_5_5_n_1,
      I2 => a(8),
      I3 => ram_reg_640_767_5_5_n_1,
      I4 => a(7),
      I5 => ram_reg_512_639_5_5_n_1,
      O => \qspo_int[5]_i_3_n_0\
    );
\qspo_int[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_6_6_n_1,
      I1 => ram_reg_256_383_6_6_n_1,
      I2 => a(8),
      I3 => ram_reg_128_255_6_6_n_1,
      I4 => a(7),
      I5 => ram_reg_0_127_6_6_n_1,
      O => \qspo_int[6]_i_2_n_0\
    );
\qspo_int[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_6_6_n_1,
      I1 => ram_reg_768_895_6_6_n_1,
      I2 => a(8),
      I3 => ram_reg_640_767_6_6_n_1,
      I4 => a(7),
      I5 => ram_reg_512_639_6_6_n_1,
      O => \qspo_int[6]_i_3_n_0\
    );
\qspo_int[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_384_511_7_7_n_1,
      I1 => ram_reg_256_383_7_7_n_1,
      I2 => a(8),
      I3 => ram_reg_128_255_7_7_n_1,
      I4 => a(7),
      I5 => ram_reg_0_127_7_7_n_1,
      O => \qspo_int[7]_i_2_n_0\
    );
\qspo_int[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => ram_reg_896_1023_7_7_n_1,
      I1 => ram_reg_768_895_7_7_n_1,
      I2 => a(8),
      I3 => ram_reg_640_767_7_7_n_1,
      I4 => a(7),
      I5 => ram_reg_512_639_7_7_n_1,
      O => \qspo_int[7]_i_3_n_0\
    );
\qspo_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qspo_input(0),
      Q => qspo_int(0),
      R => qspo_srst
    );
\qspo_int_reg[0]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qspo_int[0]_i_2_n_0\,
      I1 => \qspo_int[0]_i_3_n_0\,
      O => qspo_input(0),
      S => a(9)
    );
\qspo_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qspo_input(1),
      Q => qspo_int(1),
      R => qspo_srst
    );
\qspo_int_reg[1]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qspo_int[1]_i_2_n_0\,
      I1 => \qspo_int[1]_i_3_n_0\,
      O => qspo_input(1),
      S => a(9)
    );
\qspo_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qspo_input(2),
      Q => qspo_int(2),
      R => qspo_srst
    );
\qspo_int_reg[2]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qspo_int[2]_i_2_n_0\,
      I1 => \qspo_int[2]_i_3_n_0\,
      O => qspo_input(2),
      S => a(9)
    );
\qspo_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qspo_input(3),
      Q => qspo_int(3),
      R => qspo_srst
    );
\qspo_int_reg[3]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qspo_int[3]_i_2_n_0\,
      I1 => \qspo_int[3]_i_3_n_0\,
      O => qspo_input(3),
      S => a(9)
    );
\qspo_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qspo_input(4),
      Q => qspo_int(4),
      R => qspo_srst
    );
\qspo_int_reg[4]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qspo_int[4]_i_2_n_0\,
      I1 => \qspo_int[4]_i_3_n_0\,
      O => qspo_input(4),
      S => a(9)
    );
\qspo_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qspo_input(5),
      Q => qspo_int(5),
      R => qspo_srst
    );
\qspo_int_reg[5]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qspo_int[5]_i_2_n_0\,
      I1 => \qspo_int[5]_i_3_n_0\,
      O => qspo_input(5),
      S => a(9)
    );
\qspo_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qspo_input(6),
      Q => qspo_int(6),
      R => qspo_srst
    );
\qspo_int_reg[6]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qspo_int[6]_i_2_n_0\,
      I1 => \qspo_int[6]_i_3_n_0\,
      O => qspo_input(6),
      S => a(9)
    );
\qspo_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => qspo_input(7),
      Q => qspo_int(7),
      R => qspo_srst
    );
\qspo_int_reg[7]_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \qspo_int[7]_i_2_n_0\,
      I1 => \qspo_int[7]_i_3_n_0\,
      O => qspo_input(7),
      S => a(9)
    );
ram_reg_0_127_0_0: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(0),
      DPO => ram_reg_0_127_0_0_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_0_127_0_0_n_1,
      WCLK => clk,
      WE => ram_reg_0_127_0_0_i_1_n_0
    );
ram_reg_0_127_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => we,
      I1 => a(9),
      I2 => a(7),
      I3 => a(8),
      O => ram_reg_0_127_0_0_i_1_n_0
    );
ram_reg_0_127_1_1: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(1),
      DPO => ram_reg_0_127_1_1_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_0_127_1_1_n_1,
      WCLK => clk,
      WE => ram_reg_0_127_0_0_i_1_n_0
    );
ram_reg_0_127_2_2: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(2),
      DPO => ram_reg_0_127_2_2_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_0_127_2_2_n_1,
      WCLK => clk,
      WE => ram_reg_0_127_0_0_i_1_n_0
    );
ram_reg_0_127_3_3: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(3),
      DPO => ram_reg_0_127_3_3_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_0_127_3_3_n_1,
      WCLK => clk,
      WE => ram_reg_0_127_0_0_i_1_n_0
    );
ram_reg_0_127_4_4: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(4),
      DPO => ram_reg_0_127_4_4_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_0_127_4_4_n_1,
      WCLK => clk,
      WE => ram_reg_0_127_0_0_i_1_n_0
    );
ram_reg_0_127_5_5: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(5),
      DPO => ram_reg_0_127_5_5_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_0_127_5_5_n_1,
      WCLK => clk,
      WE => ram_reg_0_127_0_0_i_1_n_0
    );
ram_reg_0_127_6_6: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(6),
      DPO => ram_reg_0_127_6_6_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_0_127_6_6_n_1,
      WCLK => clk,
      WE => ram_reg_0_127_0_0_i_1_n_0
    );
ram_reg_0_127_7_7: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(7),
      DPO => ram_reg_0_127_7_7_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_0_127_7_7_n_1,
      WCLK => clk,
      WE => ram_reg_0_127_0_0_i_1_n_0
    );
ram_reg_128_255_0_0: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(0),
      DPO => ram_reg_128_255_0_0_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_128_255_0_0_n_1,
      WCLK => clk,
      WE => ram_reg_128_255_0_0_i_1_n_0
    );
ram_reg_128_255_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => a(8),
      I1 => a(9),
      I2 => a(7),
      I3 => we,
      O => ram_reg_128_255_0_0_i_1_n_0
    );
ram_reg_128_255_1_1: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(1),
      DPO => ram_reg_128_255_1_1_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_128_255_1_1_n_1,
      WCLK => clk,
      WE => ram_reg_128_255_0_0_i_1_n_0
    );
ram_reg_128_255_2_2: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(2),
      DPO => ram_reg_128_255_2_2_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_128_255_2_2_n_1,
      WCLK => clk,
      WE => ram_reg_128_255_0_0_i_1_n_0
    );
ram_reg_128_255_3_3: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(3),
      DPO => ram_reg_128_255_3_3_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_128_255_3_3_n_1,
      WCLK => clk,
      WE => ram_reg_128_255_0_0_i_1_n_0
    );
ram_reg_128_255_4_4: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(4),
      DPO => ram_reg_128_255_4_4_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_128_255_4_4_n_1,
      WCLK => clk,
      WE => ram_reg_128_255_0_0_i_1_n_0
    );
ram_reg_128_255_5_5: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(5),
      DPO => ram_reg_128_255_5_5_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_128_255_5_5_n_1,
      WCLK => clk,
      WE => ram_reg_128_255_0_0_i_1_n_0
    );
ram_reg_128_255_6_6: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(6),
      DPO => ram_reg_128_255_6_6_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_128_255_6_6_n_1,
      WCLK => clk,
      WE => ram_reg_128_255_0_0_i_1_n_0
    );
ram_reg_128_255_7_7: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(7),
      DPO => ram_reg_128_255_7_7_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_128_255_7_7_n_1,
      WCLK => clk,
      WE => ram_reg_128_255_0_0_i_1_n_0
    );
ram_reg_256_383_0_0: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(0),
      DPO => ram_reg_256_383_0_0_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_256_383_0_0_n_1,
      WCLK => clk,
      WE => ram_reg_256_383_0_0_i_1_n_0
    );
ram_reg_256_383_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => a(7),
      I1 => a(9),
      I2 => a(8),
      I3 => we,
      O => ram_reg_256_383_0_0_i_1_n_0
    );
ram_reg_256_383_1_1: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(1),
      DPO => ram_reg_256_383_1_1_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_256_383_1_1_n_1,
      WCLK => clk,
      WE => ram_reg_256_383_0_0_i_1_n_0
    );
ram_reg_256_383_2_2: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(2),
      DPO => ram_reg_256_383_2_2_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_256_383_2_2_n_1,
      WCLK => clk,
      WE => ram_reg_256_383_0_0_i_1_n_0
    );
ram_reg_256_383_3_3: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(3),
      DPO => ram_reg_256_383_3_3_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_256_383_3_3_n_1,
      WCLK => clk,
      WE => ram_reg_256_383_0_0_i_1_n_0
    );
ram_reg_256_383_4_4: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(4),
      DPO => ram_reg_256_383_4_4_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_256_383_4_4_n_1,
      WCLK => clk,
      WE => ram_reg_256_383_0_0_i_1_n_0
    );
ram_reg_256_383_5_5: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(5),
      DPO => ram_reg_256_383_5_5_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_256_383_5_5_n_1,
      WCLK => clk,
      WE => ram_reg_256_383_0_0_i_1_n_0
    );
ram_reg_256_383_6_6: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(6),
      DPO => ram_reg_256_383_6_6_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_256_383_6_6_n_1,
      WCLK => clk,
      WE => ram_reg_256_383_0_0_i_1_n_0
    );
ram_reg_256_383_7_7: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(7),
      DPO => ram_reg_256_383_7_7_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_256_383_7_7_n_1,
      WCLK => clk,
      WE => ram_reg_256_383_0_0_i_1_n_0
    );
ram_reg_384_511_0_0: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(0),
      DPO => ram_reg_384_511_0_0_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_384_511_0_0_n_1,
      WCLK => clk,
      WE => ram_reg_384_511_0_0_i_1_n_0
    );
ram_reg_384_511_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => we,
      I1 => a(9),
      I2 => a(7),
      I3 => a(8),
      O => ram_reg_384_511_0_0_i_1_n_0
    );
ram_reg_384_511_1_1: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(1),
      DPO => ram_reg_384_511_1_1_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_384_511_1_1_n_1,
      WCLK => clk,
      WE => ram_reg_384_511_0_0_i_1_n_0
    );
ram_reg_384_511_2_2: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(2),
      DPO => ram_reg_384_511_2_2_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_384_511_2_2_n_1,
      WCLK => clk,
      WE => ram_reg_384_511_0_0_i_1_n_0
    );
ram_reg_384_511_3_3: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(3),
      DPO => ram_reg_384_511_3_3_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_384_511_3_3_n_1,
      WCLK => clk,
      WE => ram_reg_384_511_0_0_i_1_n_0
    );
ram_reg_384_511_4_4: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(4),
      DPO => ram_reg_384_511_4_4_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_384_511_4_4_n_1,
      WCLK => clk,
      WE => ram_reg_384_511_0_0_i_1_n_0
    );
ram_reg_384_511_5_5: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(5),
      DPO => ram_reg_384_511_5_5_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_384_511_5_5_n_1,
      WCLK => clk,
      WE => ram_reg_384_511_0_0_i_1_n_0
    );
ram_reg_384_511_6_6: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(6),
      DPO => ram_reg_384_511_6_6_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_384_511_6_6_n_1,
      WCLK => clk,
      WE => ram_reg_384_511_0_0_i_1_n_0
    );
ram_reg_384_511_7_7: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(7),
      DPO => ram_reg_384_511_7_7_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_384_511_7_7_n_1,
      WCLK => clk,
      WE => ram_reg_384_511_0_0_i_1_n_0
    );
ram_reg_512_639_0_0: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(0),
      DPO => ram_reg_512_639_0_0_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_512_639_0_0_n_1,
      WCLK => clk,
      WE => ram_reg_512_639_0_0_i_1_n_0
    );
ram_reg_512_639_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => a(7),
      I1 => a(8),
      I2 => a(9),
      I3 => we,
      O => ram_reg_512_639_0_0_i_1_n_0
    );
ram_reg_512_639_1_1: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(1),
      DPO => ram_reg_512_639_1_1_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_512_639_1_1_n_1,
      WCLK => clk,
      WE => ram_reg_512_639_0_0_i_1_n_0
    );
ram_reg_512_639_2_2: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(2),
      DPO => ram_reg_512_639_2_2_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_512_639_2_2_n_1,
      WCLK => clk,
      WE => ram_reg_512_639_0_0_i_1_n_0
    );
ram_reg_512_639_3_3: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(3),
      DPO => ram_reg_512_639_3_3_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_512_639_3_3_n_1,
      WCLK => clk,
      WE => ram_reg_512_639_0_0_i_1_n_0
    );
ram_reg_512_639_4_4: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(4),
      DPO => ram_reg_512_639_4_4_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_512_639_4_4_n_1,
      WCLK => clk,
      WE => ram_reg_512_639_0_0_i_1_n_0
    );
ram_reg_512_639_5_5: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(5),
      DPO => ram_reg_512_639_5_5_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_512_639_5_5_n_1,
      WCLK => clk,
      WE => ram_reg_512_639_0_0_i_1_n_0
    );
ram_reg_512_639_6_6: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(6),
      DPO => ram_reg_512_639_6_6_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_512_639_6_6_n_1,
      WCLK => clk,
      WE => ram_reg_512_639_0_0_i_1_n_0
    );
ram_reg_512_639_7_7: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(7),
      DPO => ram_reg_512_639_7_7_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_512_639_7_7_n_1,
      WCLK => clk,
      WE => ram_reg_512_639_0_0_i_1_n_0
    );
ram_reg_640_767_0_0: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(0),
      DPO => ram_reg_640_767_0_0_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_640_767_0_0_n_1,
      WCLK => clk,
      WE => ram_reg_640_767_0_0_i_1_n_0
    );
ram_reg_640_767_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => we,
      I1 => a(8),
      I2 => a(7),
      I3 => a(9),
      O => ram_reg_640_767_0_0_i_1_n_0
    );
ram_reg_640_767_1_1: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(1),
      DPO => ram_reg_640_767_1_1_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_640_767_1_1_n_1,
      WCLK => clk,
      WE => ram_reg_640_767_0_0_i_1_n_0
    );
ram_reg_640_767_2_2: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(2),
      DPO => ram_reg_640_767_2_2_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_640_767_2_2_n_1,
      WCLK => clk,
      WE => ram_reg_640_767_0_0_i_1_n_0
    );
ram_reg_640_767_3_3: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(3),
      DPO => ram_reg_640_767_3_3_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_640_767_3_3_n_1,
      WCLK => clk,
      WE => ram_reg_640_767_0_0_i_1_n_0
    );
ram_reg_640_767_4_4: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(4),
      DPO => ram_reg_640_767_4_4_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_640_767_4_4_n_1,
      WCLK => clk,
      WE => ram_reg_640_767_0_0_i_1_n_0
    );
ram_reg_640_767_5_5: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(5),
      DPO => ram_reg_640_767_5_5_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_640_767_5_5_n_1,
      WCLK => clk,
      WE => ram_reg_640_767_0_0_i_1_n_0
    );
ram_reg_640_767_6_6: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(6),
      DPO => ram_reg_640_767_6_6_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_640_767_6_6_n_1,
      WCLK => clk,
      WE => ram_reg_640_767_0_0_i_1_n_0
    );
ram_reg_640_767_7_7: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(7),
      DPO => ram_reg_640_767_7_7_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_640_767_7_7_n_1,
      WCLK => clk,
      WE => ram_reg_640_767_0_0_i_1_n_0
    );
ram_reg_768_895_0_0: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(0),
      DPO => ram_reg_768_895_0_0_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_768_895_0_0_n_1,
      WCLK => clk,
      WE => ram_reg_768_895_0_0_i_1_n_0
    );
ram_reg_768_895_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => we,
      I1 => a(7),
      I2 => a(8),
      I3 => a(9),
      O => ram_reg_768_895_0_0_i_1_n_0
    );
ram_reg_768_895_1_1: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(1),
      DPO => ram_reg_768_895_1_1_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_768_895_1_1_n_1,
      WCLK => clk,
      WE => ram_reg_768_895_0_0_i_1_n_0
    );
ram_reg_768_895_2_2: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(2),
      DPO => ram_reg_768_895_2_2_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_768_895_2_2_n_1,
      WCLK => clk,
      WE => ram_reg_768_895_0_0_i_1_n_0
    );
ram_reg_768_895_3_3: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(3),
      DPO => ram_reg_768_895_3_3_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_768_895_3_3_n_1,
      WCLK => clk,
      WE => ram_reg_768_895_0_0_i_1_n_0
    );
ram_reg_768_895_4_4: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(4),
      DPO => ram_reg_768_895_4_4_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_768_895_4_4_n_1,
      WCLK => clk,
      WE => ram_reg_768_895_0_0_i_1_n_0
    );
ram_reg_768_895_5_5: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(5),
      DPO => ram_reg_768_895_5_5_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_768_895_5_5_n_1,
      WCLK => clk,
      WE => ram_reg_768_895_0_0_i_1_n_0
    );
ram_reg_768_895_6_6: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(6),
      DPO => ram_reg_768_895_6_6_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_768_895_6_6_n_1,
      WCLK => clk,
      WE => ram_reg_768_895_0_0_i_1_n_0
    );
ram_reg_768_895_7_7: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(7),
      DPO => ram_reg_768_895_7_7_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_768_895_7_7_n_1,
      WCLK => clk,
      WE => ram_reg_768_895_0_0_i_1_n_0
    );
ram_reg_896_1023_0_0: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(0),
      DPO => ram_reg_896_1023_0_0_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_896_1023_0_0_n_1,
      WCLK => clk,
      WE => ram_reg_896_1023_0_0_i_1_n_0
    );
ram_reg_896_1023_0_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => a(9),
      I1 => we,
      I2 => a(7),
      I3 => a(8),
      O => ram_reg_896_1023_0_0_i_1_n_0
    );
ram_reg_896_1023_1_1: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(1),
      DPO => ram_reg_896_1023_1_1_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_896_1023_1_1_n_1,
      WCLK => clk,
      WE => ram_reg_896_1023_0_0_i_1_n_0
    );
ram_reg_896_1023_2_2: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(2),
      DPO => ram_reg_896_1023_2_2_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_896_1023_2_2_n_1,
      WCLK => clk,
      WE => ram_reg_896_1023_0_0_i_1_n_0
    );
ram_reg_896_1023_3_3: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(3),
      DPO => ram_reg_896_1023_3_3_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_896_1023_3_3_n_1,
      WCLK => clk,
      WE => ram_reg_896_1023_0_0_i_1_n_0
    );
ram_reg_896_1023_4_4: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(4),
      DPO => ram_reg_896_1023_4_4_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_896_1023_4_4_n_1,
      WCLK => clk,
      WE => ram_reg_896_1023_0_0_i_1_n_0
    );
ram_reg_896_1023_5_5: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(5),
      DPO => ram_reg_896_1023_5_5_n_0,
      DPRA(6 downto 0) => dpra_reg(6 downto 0),
      SPO => ram_reg_896_1023_5_5_n_1,
      WCLK => clk,
      WE => ram_reg_896_1023_0_0_i_1_n_0
    );
ram_reg_896_1023_6_6: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(6),
      DPO => ram_reg_896_1023_6_6_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_896_1023_6_6_n_1,
      WCLK => clk,
      WE => ram_reg_896_1023_0_0_i_1_n_0
    );
ram_reg_896_1023_7_7: unisim.vcomponents.RAM128X1D
    generic map(
      INIT => X"00000000000000000000000000000000"
    )
        port map (
      A(6 downto 0) => a(6 downto 0),
      D => d(7),
      DPO => ram_reg_896_1023_7_7_n_0,
      DPRA(6) => \dpra_reg_reg[6]_rep_n_0\,
      DPRA(5) => \dpra_reg_reg[5]_rep_n_0\,
      DPRA(4) => \dpra_reg_reg[4]_rep_n_0\,
      DPRA(3) => \dpra_reg_reg[3]_rep_n_0\,
      DPRA(2) => \dpra_reg_reg[2]_rep_n_0\,
      DPRA(1) => \dpra_reg_reg[1]_rep_n_0\,
      DPRA(0) => \dpra_reg_reg[0]_rep_n_0\,
      SPO => ram_reg_896_1023_7_7_n_1,
      WCLK => clk,
      WE => ram_reg_896_1023_0_0_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity register_file_dist_mem_gen_v8_0_13_synth is
  port (
    qspo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    a : in STD_LOGIC_VECTOR ( 9 downto 0 );
    we : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of register_file_dist_mem_gen_v8_0_13_synth : entity is "dist_mem_gen_v8_0_13_synth";
end register_file_dist_mem_gen_v8_0_13_synth;

architecture STRUCTURE of register_file_dist_mem_gen_v8_0_13_synth is
begin
\gen_dp_ram.dpram_inst\: entity work.register_file_dpram
     port map (
      a(9 downto 0) => a(9 downto 0),
      clk => clk,
      d(7 downto 0) => d(7 downto 0),
      dpra(9 downto 0) => dpra(9 downto 0),
      qdpo(7 downto 0) => qdpo(7 downto 0),
      qdpo_srst => qdpo_srst,
      qspo(7 downto 0) => qspo(7 downto 0),
      qspo_srst => qspo_srst,
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity register_file_dist_mem_gen_v8_0_13 is
  port (
    a : in STD_LOGIC_VECTOR ( 9 downto 0 );
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of register_file_dist_mem_gen_v8_0_13 : entity is 10;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of register_file_dist_mem_gen_v8_0_13 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of register_file_dist_mem_gen_v8_0_13 : entity is 1024;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of register_file_dist_mem_gen_v8_0_13 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of register_file_dist_mem_gen_v8_0_13 : entity is "zynq";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of register_file_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of register_file_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of register_file_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of register_file_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of register_file_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of register_file_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of register_file_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of register_file_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of register_file_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of register_file_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of register_file_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of register_file_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of register_file_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of register_file_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of register_file_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of register_file_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of register_file_dist_mem_gen_v8_0_13 : entity is "no_coe_file_loaded";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of register_file_dist_mem_gen_v8_0_13 : entity is 2;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of register_file_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of register_file_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of register_file_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of register_file_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of register_file_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of register_file_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of register_file_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of register_file_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of register_file_dist_mem_gen_v8_0_13 : entity is 8;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of register_file_dist_mem_gen_v8_0_13 : entity is "dist_mem_gen_v8_0_13";
end register_file_dist_mem_gen_v8_0_13;

architecture STRUCTURE of register_file_dist_mem_gen_v8_0_13 is
  signal \<const0>\ : STD_LOGIC;
begin
  dpo(7) <= \<const0>\;
  dpo(6) <= \<const0>\;
  dpo(5) <= \<const0>\;
  dpo(4) <= \<const0>\;
  dpo(3) <= \<const0>\;
  dpo(2) <= \<const0>\;
  dpo(1) <= \<const0>\;
  dpo(0) <= \<const0>\;
  spo(7) <= \<const0>\;
  spo(6) <= \<const0>\;
  spo(5) <= \<const0>\;
  spo(4) <= \<const0>\;
  spo(3) <= \<const0>\;
  spo(2) <= \<const0>\;
  spo(1) <= \<const0>\;
  spo(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\synth_options.dist_mem_inst\: entity work.register_file_dist_mem_gen_v8_0_13_synth
     port map (
      a(9 downto 0) => a(9 downto 0),
      clk => clk,
      d(7 downto 0) => d(7 downto 0),
      dpra(9 downto 0) => dpra(9 downto 0),
      qdpo(7 downto 0) => qdpo(7 downto 0),
      qdpo_srst => qdpo_srst,
      qspo(7 downto 0) => qspo(7 downto 0),
      qspo_srst => qspo_srst,
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity register_file is
  port (
    a : in STD_LOGIC_VECTOR ( 9 downto 0 );
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    qspo : out STD_LOGIC_VECTOR ( 7 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of register_file : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of register_file : entity is "register_file,dist_mem_gen_v8_0_13,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of register_file : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of register_file : entity is "dist_mem_gen_v8_0_13,Vivado 2019.2.1";
end register_file;

architecture STRUCTURE of register_file is
  signal NLW_U0_dpo_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_spo_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "zynq";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of U0 : label is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 2;
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 10;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 1024;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_dpo : integer;
  attribute c_has_dpo of U0 : label is 0;
  attribute c_has_dpra : integer;
  attribute c_has_dpra of U0 : label is 1;
  attribute c_has_i_ce : integer;
  attribute c_has_i_ce of U0 : label is 0;
  attribute c_has_qdpo : integer;
  attribute c_has_qdpo of U0 : label is 1;
  attribute c_has_qdpo_ce : integer;
  attribute c_has_qdpo_ce of U0 : label is 0;
  attribute c_has_qdpo_clk : integer;
  attribute c_has_qdpo_clk of U0 : label is 0;
  attribute c_has_qdpo_rst : integer;
  attribute c_has_qdpo_rst of U0 : label is 0;
  attribute c_has_qdpo_srst : integer;
  attribute c_has_qdpo_srst of U0 : label is 1;
  attribute c_has_qspo : integer;
  attribute c_has_qspo of U0 : label is 1;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_has_qspo_rst : integer;
  attribute c_has_qspo_rst of U0 : label is 0;
  attribute c_has_qspo_srst : integer;
  attribute c_has_qspo_srst of U0 : label is 1;
  attribute c_has_spo : integer;
  attribute c_has_spo of U0 : label is 0;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "no_coe_file_loaded";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_pipeline_stages : integer;
  attribute c_pipeline_stages of U0 : label is 0;
  attribute c_qce_joined : integer;
  attribute c_qce_joined of U0 : label is 0;
  attribute c_qualify_we : integer;
  attribute c_qualify_we of U0 : label is 0;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 0;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_reg_dpra_input : integer;
  attribute c_reg_dpra_input of U0 : label is 1;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 8;
begin
U0: entity work.register_file_dist_mem_gen_v8_0_13
     port map (
      a(9 downto 0) => a(9 downto 0),
      clk => clk,
      d(7 downto 0) => d(7 downto 0),
      dpo(7 downto 0) => NLW_U0_dpo_UNCONNECTED(7 downto 0),
      dpra(9 downto 0) => dpra(9 downto 0),
      i_ce => '1',
      qdpo(7 downto 0) => qdpo(7 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => qdpo_srst,
      qspo(7 downto 0) => qspo(7 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => qspo_srst,
      spo(7 downto 0) => NLW_U0_spo_UNCONNECTED(7 downto 0),
      we => we
    );
end STRUCTURE;
