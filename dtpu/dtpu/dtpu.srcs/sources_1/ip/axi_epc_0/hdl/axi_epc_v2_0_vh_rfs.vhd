-- Loadable arithmetic register.
-------------------------------------------------------------------------------
--
-- *************************************************************************
-- **                                                                     **
-- ** DISCLAIMER OF LIABILITY                                             **
-- **                                                                     **
-- ** This text/file contains proprietary, confidential                   **
-- ** information of Xilinx, Inc., is distributed under                   **
-- ** license from Xilinx, Inc., and may be used, copied                  **
-- ** and/or disclosed only pursuant to the terms of a valid              **
-- ** license agreement with Xilinx, Inc. Xilinx hereby                   **
-- ** grants you a license to use this text/file solely for               **
-- ** design, simulation, implementation and creation of                  **
-- ** design files limited to Xilinx devices or technologies.             **
-- ** Use with non-Xilinx devices or technologies is expressly            **
-- ** prohibited and immediately terminates your license unless           **
-- ** covered by a separate agreement.                                    **
-- **                                                                     **
-- ** Xilinx is providing this design, code, or information               **
-- ** "as-is" solely for use in developing programs and                   **
-- ** solutions for Xilinx devices, with no obligation on the             **
-- ** part of Xilinx to provide support. By providing this design,        **
-- ** code, or information as one possible implementation of              **
-- ** this feature, application or standard, Xilinx is making no          **
-- ** representation that this implementation is free from any            **
-- ** claims of infringement. You are responsible for obtaining           **
-- ** any rights you may require for your implementation.                 **
-- ** Xilinx expressly disclaims any warranty whatsoever with             **
-- ** respect to the adequacy of the implementation, including            **
-- ** but not limited to any warranties or representations that this      **
-- ** implementation is free from claims of infringement, implied         **
-- ** warranties of merchantability or fitness for a particular           **
-- ** purpose.                                                            **
-- **                                                                     **
-- ** Xilinx products are not intended for use in life support            **
-- ** appliances, devices, or systems. Use in such applications is        **
-- ** expressly prohibited.                                               **
-- **                                                                     **
-- ** Any modifications that are made to the Source Code are              **
-- ** done at the user’s sole risk and will be unsupported.               **
-- ** The Xilinx Support Hotline does not have access to source           **
-- ** code and therefore cannot answer specific questions related         **
-- ** to source HDL. The Xilinx Hotline support of original source        **
-- ** code IP shall only address issues and questions related             **
-- ** to the standard Netlist version of the core (and thus               **
-- ** indirectly, the original core source).                              **
-- **                                                                     **
-- ** Copyright (c) 2001-2010 Xilinx, Inc. All rights reserved.           **
-- **                                                                     **
-- ** This copyright and support notice must be retained as part          **
-- ** of this text at all times.                                          **
-- **                                                                     **
-- *************************************************************************
--
-------------------------------------------------------------------------------
-- Filename:        ld_arith_reg.vhd
-- Version:         
--------------------------------------------------------------------------------
-- Description:   A register that can be loaded and added to or subtracted from
--                (but not both). The width of the register is specified
--                with a generic. The load value and the arith
--                value, i.e. the value to be added (subtracted), may be of
--                lesser width than the register and may be
--                offset from the LSB position. (Uncovered positions
--                load or add (subtract) zero.) The register can be
--                reset, via the RST signal, to a freely selectable value.
--                The register is defined in terms of big-endian bit ordering.
--
-------------------------------------------------------------------------------
-- Structure: 
--
--              ld_arith_reg.vhd
-------------------------------------------------------------------------------
-- Author:      FO
--
--
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x" 
--      reset signals:                          "rst", "rst_n" 
--      generics:                               "C_*" 
--      user defined types:                     "*_TYPE" 
--      state machine next state:               "*_ns" 
--      state machine current state:            "*_cs" 
--      combinatorial signals:                  "*_com" 
--      pipelined or register delay signals:    "*_d#" 
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce" 
--      internal version of output port         "*_i"
--      device pins:                            "*_pin" 
--      ports:                                  - Names begin with Uppercase 
--      processes:                              "*_PROCESS" 
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ld_arith_reg is
    generic (
        ------------------------------------------------------------------------
        -- True if the arithmetic operation is add, false if subtract.
        C_ADD_SUB_NOT : boolean := false;
        ------------------------------------------------------------------------
        -- Width of the register.
        C_REG_WIDTH   : natural := 8;
        ------------------------------------------------------------------------
        -- Reset value. (No default, must be specified in the instantiation.)
        C_RESET_VALUE : std_logic_vector;
        ------------------------------------------------------------------------
        -- Width of the load data.
        C_LD_WIDTH    : natural :=  8;
        ------------------------------------------------------------------------
        -- Offset from the LSB (toward more significant) of the load data.
        C_LD_OFFSET   : natural :=  0;
        ------------------------------------------------------------------------
        -- Width of the arithmetic data.
        C_AD_WIDTH    : natural :=  8;
        ------------------------------------------------------------------------
        -- Offset from the LSB of the arithmetic data.
        C_AD_OFFSET   : natural :=  0
        ------------------------------------------------------------------------
        -- Dependencies: (1) C_LD_WIDTH + C_LD_OFFSET <= C_REG_WIDTH
        --               (2) C_AD_WIDTH + C_AD_OFFSET <= C_REG_WIDTH
        ------------------------------------------------------------------------
    );
    port (
        CK       : in  std_logic;
        RST      : in  std_logic; -- Reset to C_RESET_VALUE. (Overrides OP,LOAD)
        Q        : out std_logic_vector(0 to C_REG_WIDTH-1);
        LD       : in  std_logic_vector(0 to C_LD_WIDTH-1); -- Load data.
        AD       : in  std_logic_vector(0 to C_AD_WIDTH-1); -- Arith data.
        LOAD     : in  std_logic;  -- Enable for the load op, Q <= LD.
        OP       : in  std_logic   -- Enable for the arith op, Q <= Q + AD.
                                   -- (Q <= Q - AD if C_ADD_SUB_NOT = false.)
                                   -- (Overrrides LOAD.)
    );
end ld_arith_reg;
  

library unisim;
use unisim.all;

library ieee;
use ieee.numeric_std.all;

architecture imp of ld_arith_reg is

    component MULT_AND
       port(
          LO :  out   std_ulogic;
          I1 :  in    std_ulogic;
          I0 :  in    std_ulogic);
    end component;

    component MUXCY is
      port (
        DI : in  std_logic;
        CI : in  std_logic;
        S  : in  std_logic;
        O  : out std_logic);
    end component MUXCY;

    component XORCY is
      port (
        LI : in  std_logic;
        CI : in  std_logic;
        O  : out std_logic);
    end component XORCY;

    component FDRE is
      port (
        Q  : out std_logic;
        C  : in  std_logic;
        CE : in  std_logic;
        D  : in  std_logic;
        R  : in  std_logic
      );
    end component FDRE;
  
    component FDSE is
      port (
        Q  : out std_logic;
        C  : in  std_logic;
        CE : in  std_logic;
        D  : in  std_logic;
        S  : in  std_logic
      );
    end component FDSE;
  
    signal q_i,
           q_i_ns,
           xorcy_out,
           gen_cry_kill_n : std_logic_vector(0 to C_REG_WIDTH-1);
    signal cry : std_logic_vector(0 to C_REG_WIDTH);

begin

    -- synthesis translate_off

    assert C_LD_WIDTH + C_LD_OFFSET <= C_REG_WIDTH 
        report "ld_arith_reg, constraint does not hold: " &
               "C_LD_WIDTH + C_LD_OFFSET <= C_REG_WIDTH"
        severity error;
    assert C_AD_WIDTH + C_AD_OFFSET <= C_REG_WIDTH 
        report "ld_arith_reg, constraint does not hold: " &
               "C_AD_WIDTH + C_AD_OFFSET <= C_REG_WIDTH"
        severity error;

    -- synthesis translate_on

    Q <= q_i;

    cry(C_REG_WIDTH) <= '0' when C_ADD_SUB_NOT else OP;

    PERBIT_GEN: for j in C_REG_WIDTH-1 downto 0 generate
        signal load_bit, arith_bit, CE : std_logic;
    begin

        ------------------------------------------------------------------------
        -- Assign to load_bit either zero or the bit from input port LD.
        ------------------------------------------------------------------------
        D_ZERO_GEN: if    j > C_REG_WIDTH - 1 - C_LD_OFFSET 
                       or j < C_REG_WIDTH - C_LD_WIDTH - C_LD_OFFSET generate
            load_bit <= '0';
        end generate;
        D_NON_ZERO_GEN: if    j <= C_REG_WIDTH - 1 - C_LD_OFFSET 
                          and j >= C_REG_WIDTH - C_LD_OFFSET - C_LD_WIDTH
        generate
            load_bit <= LD(j - (C_REG_WIDTH - C_LD_WIDTH - C_LD_OFFSET));
        end generate;

        ------------------------------------------------------------------------
        -- Assign to arith_bit either zero or the bit from input port AD.
        ------------------------------------------------------------------------
        AD_ZERO_GEN: if    j > C_REG_WIDTH - 1 - C_AD_OFFSET 
                        or j < C_REG_WIDTH - C_AD_WIDTH - C_AD_OFFSET
        generate
            arith_bit <= '0';
        end generate;
        AD_NON_ZERO_GEN: if    j <= C_REG_WIDTH - 1 - C_AD_OFFSET 
                           and j >= C_REG_WIDTH - C_AD_OFFSET - C_AD_WIDTH
        generate
            arith_bit <= AD(j - (C_REG_WIDTH - C_AD_WIDTH - C_AD_OFFSET));
        end generate;


        ------------------------------------------------------------------------
        -- LUT output generation.
        -- Adder case
        ------------------------------------------------------------------------
        Q_I_GEN_ADD: if C_ADD_SUB_NOT generate
            q_i_ns(j) <= q_i(j) xor  arith_bit when  OP = '1' else load_bit;
        end generate;
        ------------------------------------------------------------------------
        -- Subtractor case
        ------------------------------------------------------------------------
        Q_I_GEN_SUB: if not C_ADD_SUB_NOT generate
            q_i_ns(j) <= q_i(j) xnor arith_bit when  OP = '1' else load_bit;
        end generate;


        ------------------------------------------------------------------------
        -- Kill carries (borrows) for loads but
        -- generate or kill carries (borrows) for add (sub).
        ------------------------------------------------------------------------
        MULT_AND_i1: MULT_AND
           port map (
              LO => gen_cry_kill_n(j),
              I1 => OP,
              I0 => Q_i(j)
           );

        ------------------------------------------------------------------------
        -- Propagate the carry (borrow) out.
        ------------------------------------------------------------------------
        MUXCY_i1: MUXCY
          port map (
            DI => gen_cry_kill_n(j),
            CI => cry(j+1),
            S  => q_i_ns(j),
            O  => cry(j)
          );

        ------------------------------------------------------------------------
        -- Apply the effect of carry (borrow) in.
        ------------------------------------------------------------------------
        XORCY_i1: XORCY
          port map (
            LI => q_i_ns(j),
            CI => cry(j+1),
            O  =>  xorcy_out(j)
          );


        CE <= LOAD or OP;


        ------------------------------------------------------------------------
        -- Generate either a resettable or setable FF for bit j, depending
        -- on C_RESET_VALUE at bit j.
        ------------------------------------------------------------------------
        FF_RST0_GEN: if C_RESET_VALUE(j) = '0' generate
            FDRE_i1: FDRE
              port map (
                Q  => q_i(j),
                C  => CK,
                CE => CE,
                D  => xorcy_out(j),
                R  => RST
              );
        end generate;
        FF_RST1_GEN: if C_RESET_VALUE(j) = '1' generate
            FDSE_i1: FDSE
              port map (
                Q  => q_i(j),
                C  => CK,
                CE => CE,
                D  => xorcy_out(j),
                S  => RST
              );
        end generate;

      end generate;

end imp;


-----------------------------------------------------------------------------
-- async_statemachine.vhd - entity/architecture pair
-----------------------------------------------------------------------------
--
-- ************************************************************************
-- ** DISCLAIMER OF LIABILITY                                            **
-- **                                                                    **
-- ** This file contains proprietary and confidential information of     **
-- ** Xilinx, Inc. ("Xilinx"), that is distributed under a license       **
-- ** from Xilinx, and may be used, copied and/or disclosed only         **
-- ** pursuant to the terms of a valid license agreement with Xilinx.    **
-- **                                                                    **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION              **
-- ** ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER         **
-- ** EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT                **
-- ** LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,          **
-- ** MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx      **
-- ** does not warrant that functions included in the Materials will     **
-- ** meet the requirements of Licensee, or that the operation of the    **
-- ** Materials will be uninterrupted or error-free, or that defects     **
-- ** in the Materials will be corrected. Furthermore, Xilinx does       **
-- ** not warrant or make any representations regarding use, or the      **
-- ** results of the use, of the Materials in terms of correctness,      **
-- ** accuracy, reliability or otherwise.                                **
-- **                                                                    **
-- ** Xilinx products are not designed or intended to be fail-safe,      **
-- ** or for use in any application requiring fail-safe performance,     **
-- ** such as life-support or safety devices or systems, Class III       **
-- ** medical devices, nuclear facilities, applications related to       **
-- ** the deployment of airbags, or any other applications that could    **
-- ** lead to death, personal injury or severe property or               **
-- ** environmental damage (individually and collectively, "critical     **
-- ** applications"). Customer assumes the sole risk and liability       **
-- ** of any use of Xilinx products in critical applications,            **
-- ** subject only to applicable laws and regulations governing          **
-- ** limitations on product liability.                                  **
-- **                                                                    **
-- ** Copyright 2005, 2006, 2008, 2009 Xilinx, Inc.                      **
-- ** All rights reserved.                                               **
-- **                                                                    **
-- ** This disclaimer and copyright notice must be retained as part      **
-- ** of this file at all times.                                         **
-- ************************************************************************

-----------------------------------------------------------------------------
-- Filename:      async_statemachine.vhd
-- Version:        v1.00.a
-- Description:    This state machine generates the control signal for --
--                     asynchronous logic of the axi_epc.
-- VHDL-Standard:  VHDL'93
-----------------------------------------------------------------------------
-- Structure:
--             axi_epc.vhd
--               -axi_lite_ipif
--               -epc_core.vhd
--               -ipic_if_decode.vhd
--               -sync_cntl.vhd
--               -async_cntl.vhd
--                  -- async_counters.vhd
--                  -- async_statemachine.vhd
--               -address_gen.vhd
--               -data_steer.vhd
--               -access_mux.vhd
-----------------------------------------------------------------------------
-- Author   : VB
-- History  :
--
--  VB           08-24-2010 --  v2_0 version for AXI
-- ^^^^^^
--            The core updated for AXI based on xps_epc_v1_02_a
-- ~~~~~~
-----------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                   "*_n"
--      clock signals:                        "clk", "clk_div#", "clk_#x"
--      reset signals:                        "rst", "rst_n"
--      generics:                             "C_*"
--      user defined types:                   "*_TYPE"
--      state machine next state:             "*_ns"
--      state machine current state:          "*_cs"
--      combinatorial signals:                "*_com"
--      pipelined or register delay signals:  "*_d#"
--      counter signals:                      "*cnt*"
--      clock enable signals:                 "*_ce"
--      internal version of output port       "*_i"
--      device pins:                          "*_pin"
--      ports:                                - Names begin with Uppercase
--      processes:                            "*_PROCESS"
--      component instantiations:             "<ENTITY_>I_<#|FUNC>
-----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.conv_std_logic_vector;

library lib_pkg_v1_0_2;
use lib_pkg_v1_0_2.lib_pkg.RESET_ACTIVE;

-----------------------------------------------------------------------------
-- Definition of Ports:
-----------------------------------------------------------------------------
-- Definition of Generics
-----------------------------------------------------------------------------
--C_ADDR_TH_CNT_WIDTH           -- Address hold counter width generic
--C_ADDR_DATA_CS_TH_CNT_WIDTH   -- Address,Data,Chip Select hold width generic
--C_CONTROL_CNT_WIDTH           -- Control width generic
--C_DEV_VALID_CNT_WIDTH         -- Device valid counter width generic
--C_DEV_RDY_CNT_WIDTH           -- Device ready counter width generic
--C_ADS_CNT_WIDTH               -- Address strobe counter width generic
--C_WR_REC_CNT_WIDTH            -- Write recovery counter width generic
--C_RD_REC_CNT_WIDTH            -- Read Recovery counter width generic
--C_NUM_PERIPHERALS             -- Number of external peripherals
-----------------------------------------------------------------------------
--      --Inputs
-----------------------------------------------------------------------------
--  BUS2IP_CS                   -- BUS-to-IP chip select
--  BUS2IP_RNW                  -- BUS-to-IP Read/Write control signal
--  Asynch_rd_req               -- asynch read request
--  Asynch_wr_req               -- asynch write request
--  Dev_in_access               -- Device in access mode with chip-select
--  Dev_FIFO_access             -- Device FIFO access
--  Asynch_prh_rdy              -- Asynch peripheral ready for communication
--  Dev_dwidth_match            -- peripheral device data width match
--  Dev_dbus_width              -- peripheral device data width
--  Dev_bus_multiplexed         -- peripheral device addr-data bus muxed
--  Asynch_cycle                -- Indication of current cycle of Asynch mode
-----------------------------------------------------------------------------
--  -- outputs
-----------------------------------------------------------------------------
-- *_load command to load the value in the counter
--    Taddr_hold_load           -- address hold counter load
--    Tdata_hold_load           -- data hold counter load
--    Tdev_valid_load           -- device validity check counter
--    Tdev_rdy_load             -- peripheral device ready counter load
--    Tcontrol_load             -- control width cntr load(in asserted state)
--    Tads_load                 -- address strobe counter load
--    Trd_recovery_load         -- read recovery counter load
--    Twr_recovery_load         -- write recovery counter load

-- *_load_ce command to start the counter operation
--    Taddr_hold_load_ce       -- address hold counter start
--    Tdata_hold_load_ce       -- data hold up counter start
--    Tcontrol_load_ce         -- control width counter start
--    Tdev_valid_load_ce       -- device validity counter start
--    Tdev_rdy_load_ce         -- device ready counter start
--    Tads_load_ce             -- address strobe counter start
--    Twr_recovery_load_ce     -- Write recovery counter start
--    Trd_muxed_recovery_load_ce     -- Read recovery counter start

--    Asynch_Rd                -- asynch read
--    Asynch_en                -- Asynch enable to latch the rd/wr cycle data
--    Asynch_Wr                -- asynch write
--    Asynch_addr_strobe       -- Address Address Latch Signal(Strobe)
--    Asynch_addr_data_sel     -- Address/Data selector
--    Asynch_data_sel          -- asynch data select mode
--    Asynch_chip_select       -- Asynch chip select
--    Asynch_addr_cnt_ld       -- asynch address latch load/Reset
--    Asynch_addr_cnt_en       -- asynch address latch enable
--    Asynch_Wrack             -- asynchronous write acknowledge
--    Asynch_Rdack             -- asynchronous read acknowledge
--    Asynch_error         -- error acknowledge
--    -- Clocks and reset
--    Clk
--    Rst
-----------------------------------------------------------------------------
-- Entity section
-----------------------------------------------------------------------------
entity async_statemachine is
  generic
      (
      C_ADDR_TH_CNT_WIDTH             : integer;
      C_ADDR_DATA_CS_TH_CNT_WIDTH     : integer;
      C_CONTROL_CNT_WIDTH             : integer;
      C_DEV_VALID_CNT_WIDTH           : integer;
      C_DEV_RDY_CNT_WIDTH             : integer;
      C_ADS_CNT_WIDTH                 : integer;

      C_WR_REC_NM_CNT_WIDTH           : integer;
      C_RD_REC_NM_CNT_WIDTH           : integer;
      C_WR_REC_M_CNT_WIDTH            : integer;
      C_RD_REC_M_CNT_WIDTH            : integer;
      C_NUM_PERIPHERALS               : integer
      );
port (
  -- inputs form asynch_cntl
     Bus2IP_CS               : in std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     Bus2IP_RNW              : in std_logic;

     Asynch_rd_req                 : in std_logic;
     Asynch_wr_req                 : in std_logic;
     Dev_in_access                 : in std_logic;
     Dev_FIFO_access               : in std_logic;
     Asynch_prh_rdy                : in std_logic;
  -- inputs from top_level_file
     Dev_dwidth_match              : in std_logic;
     Dev_bus_multiplexed           : in std_logic;
  -- input from IPIF
  -- input from data steering logic
     Asynch_cycle                  : in std_logic;
  -- outputs to IPIF
     Asynch_Wrack                  : out std_logic;
     Asynch_Rdack                  : out std_logic;
     Asynch_error                  : out std_logic;
     Asynch_start                  : out std_logic;
  -- outputs to counters
     Taddr_hold_load               : out std_logic;
     Tdata_hold_load               : out std_logic;
     Tdev_valid_load               : out std_logic;
     Tdev_rdy_load                 : out std_logic;
     Tcontrol_load                 : out std_logic;
     Tads_load                     : out std_logic;
     Twr_recovery_load             : out std_logic;
     Trd_recovery_load             : out std_logic;

     Taddr_hold_load_ce            : out std_logic;
     Tdata_hold_load_ce            : out std_logic;
     Tcontrol_load_ce              : out std_logic;
     Tdev_valid_load_ce            : out std_logic;
     Tdev_rdy_load_ce              : out std_logic;
     Tads_load_ce                  : out std_logic;
     Twr_muxed_recovery_load_ce    : out std_logic;
     Trd_muxed_recovery_load_ce    : out std_logic;
     Twr_non_muxed_recovery_load_ce: out std_logic;
     Trd_non_muxed_recovery_load_ce: out std_logic;
  -- output to data_steering_logic file
     Asynch_Rd             : out std_logic;
     Asynch_en             : out std_logic;
     Asynch_Wr             : out std_logic;
     Asynch_addr_strobe    : out std_logic;
     Asynch_addr_data_sel  : out std_logic;
     Asynch_data_sel       : out std_logic;
     Asynch_chip_select    : out std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     Asynch_addr_cnt_ld    : out std_logic;
     Asynch_addr_cnt_en    : out std_logic;

     Taddr_hold_cnt        : in std_logic_vector(0 to C_ADDR_TH_CNT_WIDTH-1);
     Tcontrol_wdth_cnt     : in std_logic_vector(0 to C_CONTROL_CNT_WIDTH-1);
     Tdevrdy_wdth_cnt      : in std_logic_vector(0 to C_DEV_RDY_CNT_WIDTH-1);

     Twr_muxed_rec_cnt     : in std_logic_vector(0 to C_WR_REC_M_CNT_WIDTH-1);
     Trd_muxed_rec_cnt     : in std_logic_vector(0 to C_RD_REC_M_CNT_WIDTH-1);
     Twr_non_muxed_rec_cnt : in std_logic_vector(0 to C_WR_REC_NM_CNT_WIDTH-1);
     Trd_non_muxed_rec_cnt : in std_logic_vector(0 to C_RD_REC_NM_CNT_WIDTH-1);

     Tdev_valid_cnt        : in std_logic_vector(0 to C_DEV_VALID_CNT_WIDTH-1);
     Tads_cnt              : in std_logic_vector(0 to C_ADS_CNT_WIDTH-1);
     Taddr_data_cs_hold_cnt: in std_logic_vector
                                          (0 to C_ADDR_DATA_CS_TH_CNT_WIDTH-1);
  -- Clocks and reset
     Clk                     : in  std_logic;
     Rst                     : in  std_logic
    );
end entity async_statemachine;
-----------------------------------------------------------------------------
-- Architecture section
-----------------------------------------------------------------------------
architecture imp of async_statemachine is
-- all outputs temp signals
signal taddr_hold_load_i        : std_logic;
signal tdev_valid_load_i        : std_logic;
signal tdev_rdy_load_i          : std_logic;
signal tads_load_i              : std_logic;
--signal tdata_hold_load_i        : std_logic;
signal tcontrol_load_i          : std_logic;
signal twr_recovery_load_i      : std_logic;
signal trd_recovery_load_i      : std_logic;

signal taddr_hold_load_ce_i     : std_logic;
signal tdata_hold_load_ce_i     : std_logic;
signal tcontrol_load_ce_i       : std_logic;
signal tdev_valid_load_ce_i     : std_logic;
signal tdev_rdy_load_ce_i       : std_logic;
signal tads_load_ce_i           : std_logic;

signal twr_muxed_recovery_ld_ce_i     : std_logic;
signal trd_muxed_recovery_ld_ce_i     : std_logic;
signal trd_non_muxed_recovery_ld_ce_i : std_logic;
signal twr_non_muxed_recovery_ld_ce_i : std_logic;

signal asynch_Rd_i              : std_logic;
signal asynch_en_i              : std_logic;-- this signal latches the data
                                        --at every read and write operation
signal asynch_Wr_i              : std_logic;
signal asynch_addr_strobe_i     : std_logic;
signal asynch_addr_data_sel_i   : std_logic;
signal asynch_chip_select_i     : std_logic;
signal asynch_chip_select_n     : std_logic_vector(0 to C_NUM_PERIPHERALS-1);
signal asynch_addr_cnt_ld_i     : std_logic;
signal asynch_addr_cnt_en_i     : std_logic;

signal asynch_Wrack_i           : std_logic;
signal asynch_Rdack_i           : std_logic;
signal asynch_error_i           : std_logic;

signal asynch_start_i           : std_logic;--start of asynch cycle
signal data_sel                 : std_logic;--asynch address phase indicator
signal asynch_data_sel_i        : std_logic;

-- The counter will start decrementing the value loaded, at the next clock. so,
-- here one clock is required to start decrementing the counter. To maintain the
-- exact count, the final value of the counter is set to '1' instaed of '0'.
constant ADDR_TH_CNTR2_END:
          std_logic_vector(0 to C_ADDR_TH_CNT_WIDTH-1)
          := conv_std_logic_vector(1,C_ADDR_TH_CNT_WIDTH);
-- control hold end count
constant CONTROL_TH_CNTR3_END:
          std_logic_vector(0 to C_CONTROL_CNT_WIDTH-1)
          := conv_std_logic_vector(1,C_CONTROL_CNT_WIDTH);
-- dev rdy pulse width end count
constant DEV_RDY_CNTR4_END:
          std_logic_vector(0 to C_DEV_RDY_CNT_WIDTH-1)
          := conv_std_logic_vector(1,C_DEV_RDY_CNT_WIDTH);
-- data set up pulse width
constant DEV_VALID_CNTR7_END
          : std_logic_vector(0 to C_DEV_VALID_CNT_WIDTH-1)
          := conv_std_logic_vector(1,C_DEV_VALID_CNT_WIDTH);
-- address strobe counter end value
constant ADS_CNTR8_END
          : std_logic_vector(0 to C_ADS_CNT_WIDTH-1)
          := conv_std_logic_vector(1,C_ADS_CNT_WIDTH);

-- address,data, chip select hold width
constant ADDR_DATA_CS_TH_CNTR12_END:
          std_logic_vector(0 to C_ADDR_DATA_CS_TH_CNT_WIDTH-1)
          := conv_std_logic_vector(1,C_ADDR_DATA_CS_TH_CNT_WIDTH);

-- read recovery pulse width end count

constant RD_MUXED_RECOVERY_CNTR9_END:
          std_logic_vector(0 to C_RD_REC_M_CNT_WIDTH-1)
          := conv_std_logic_vector(1,C_RD_REC_M_CNT_WIDTH);

constant RD_NON_MUXED_RECOVERY_CNTR9_END:
          std_logic_vector(0 to C_RD_REC_NM_CNT_WIDTH-1)
          := conv_std_logic_vector(1,C_RD_REC_NM_CNT_WIDTH);
-- write recovery pulse width end count
constant WR_MUXED_RECOVERY_CNTR5_END:
          std_logic_vector(0 to C_WR_REC_M_CNT_WIDTH-1)
          := conv_std_logic_vector(1,C_WR_REC_M_CNT_WIDTH);

constant WR_NON_MUXED_RECOVERY_CNTR5_END:
          std_logic_vector(0 to C_WR_REC_NM_CNT_WIDTH-1)
          := conv_std_logic_vector(1,C_WR_REC_NM_CNT_WIDTH);


-----------------------------------------------------------------------------
-- type declaration
type INTEGER_ARRAY is array (natural range <>) of integer;
-----------------------------------------------------------------------------
type COMMAND_STATE_TYPE is (
            IDLE,DUMMY_ADS,START_STATE,
            DUMMY_ST,
            ADS_ASSERT,             -- address set up time/ strobe time
            NM_CONTROL_ASSERT,      -- non-muxed control assert
            M_CONTROL_ASSERT,       -- muxed control assert
            DEV_VALID,              -- device valid in non-mux case
            DEV_RDY,                -- device ready check in non-mux case
            DEV_VALID_M,            -- device valid check in muxed case
            DEV_RDY_M,              -- multiplexed device ready check state
            CONTROL_DEASSERT,       -- control deassert
            ACK_GEN_NON_MUXED,      -- non-muxed acknowledge generation
            ACK_GEN_MUXED,          -- muxed acknowledge generation
            WR_MUXED_RECOVERY,      -- muxed write recovery
            WR_NON_MUXED_RECOVERY,  -- non muxed write recovery
            RD_MUXED_RECOVERY,      -- muxed read recovery
            RD_NON_MUXED_RECOVERY   -- non muxed read recovery
            );
signal command_ns        : COMMAND_STATE_TYPE;
signal command_cs        : COMMAND_STATE_TYPE;
-----------------------------------------------------------------------------
begin
-------------------------------------------------------------------------------
-- COMMAND_ASYNCH_REG: process for asynch state next state flip-flop logic
-------------------------------------------------------------------------------
COMMAND_ASYNCH_REG: process (Clk)
begin
    if (Clk'event and Clk = '1') then
        if (Rst = RESET_ACTIVE) then
            command_cs <= IDLE;
        else
            command_cs <= command_ns;
        end if;
    end if;
end process COMMAND_ASYNCH_REG;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- CMB_ASYNCH_PROCESS
-----------------------------------------------------------------------------
-- This process generates the control signals, which will communicate with
-- other part of logic. The control signals include write, read, acknowledge,
-- error acknowledge and variouos load enable signals for the epc_counter.vhd
-----------------------------------------------------------------------------
CMB_ASYNCH_PROCESS: process (
          command_cs,
          Dev_in_access,
          Dev_FIFO_access,
          Asynch_rd_req,
          Asynch_wr_req,
          Asynch_prh_rdy,
          Asynch_cycle,
          Dev_dwidth_match,
          Dev_bus_multiplexed,
          Taddr_hold_cnt,
          Tcontrol_wdth_cnt,
          Tdevrdy_wdth_cnt,
          Twr_muxed_rec_cnt,
          Trd_muxed_rec_cnt,
          Twr_non_muxed_rec_cnt,
          Trd_non_muxed_rec_cnt,
          Tdev_valid_cnt,
          Tads_cnt,
          Taddr_data_cs_hold_cnt
          )
begin
--- default signal conditions
        --these signals are activated only for single clock cycle
        asynch_Wrack_i          <= '0';
        asynch_Rdack_i          <= '0';
        asynch_error_i          <= '0';

        asynch_start_i          <= '0';
        asynch_addr_cnt_en_i    <= '0';
        asynch_addr_cnt_ld_i    <= '0';
        asynch_addr_data_sel_i  <= '0';
        asynch_addr_strobe_i    <= '0';
        asynch_chip_select_i    <= '1';
        data_sel                <= '0';
        asynch_en_i             <= '0';
        asynch_wr_i             <= '0';
        asynch_rd_i             <= '0';

        tads_load_ce_i          <= '0';
        taddr_hold_load_ce_i    <= '0';
        tcontrol_load_ce_i      <= '0';
        tdev_valid_load_ce_i    <= '0';
        tdata_hold_load_ce_i    <= '0';
        tdev_rdy_load_ce_i      <= '0';

        trd_muxed_recovery_ld_ce_i    <= '0';
        twr_muxed_recovery_ld_ce_i    <= '0';
        trd_non_muxed_recovery_ld_ce_i<= '0';
        twr_non_muxed_recovery_ld_ce_i<= '0';

        taddr_hold_load_i       <= '0';
        tdev_valid_load_i       <= '0';
        tdev_rdy_load_i         <= '0';
        tads_load_i             <= '0';
        command_ns              <= IDLE;

        tcontrol_load_i         <= '0';
        trd_recovery_load_i     <= '0';
        twr_recovery_load_i     <= '0';
       asynch_addr_cnt_ld_i     <= '0';
case command_cs is
-------------------------- IDLE --------------------------
-------------------------- IDLE --------------------------
 when IDLE =>
 -- Determines the conditional signal generation

        -- the counters should be loaded with the final value always
        -- these counters are downcounters
        taddr_hold_load_i        <= '1';
        tdev_valid_load_i        <= '1';
        tdev_rdy_load_i          <= '1';
        tads_load_i              <= '1';

        tcontrol_load_i          <= '1';
        twr_recovery_load_i      <= '1';
        trd_recovery_load_i      <= '1';

        asynch_wr_i              <= '0';
        asynch_rd_i              <= '0';
        asynch_en_i              <= '0';
        asynch_addr_strobe_i     <= '0';
        asynch_addr_data_sel_i   <= '0';
        data_sel                 <= '0';
        asynch_chip_select_i     <= '1';
        asynch_addr_cnt_ld_i     <= '1';--reset signal for cntr load
-- check if access is given and if the device is multiplexed.
-- if yes, start the address load signal. this will initialize the address
-- counter and jump to START_STATE
 if(Dev_in_access='1')then
    if (Asynch_rd_req = '1' or Asynch_wr_req = '1') then
         asynch_chip_select_i     <= '1';
         if (Dev_bus_multiplexed= '1') then
             asynch_addr_data_sel_i  <= '1';
         else
             asynch_addr_data_sel_i  <= '0';
         end if;
        command_ns         <= START_STATE;
    else
        command_ns         <= IDLE;
    end if;
else
        command_ns         <= IDLE;
end if;

-- START_STATE -- from this state onwards start the proper execution of core.
-- enable the following signals : address strobe, chip select, asynch start,
--                                asynch cntr,    address select signals

when START_STATE =>
    asynch_chip_select_i     <= '0';
    asynch_start_i           <= '1';
    if (Dev_bus_multiplexed= '1') then
        tdev_valid_load_ce_i    <= '1';-- start the device valid counter
        tdev_rdy_load_ce_i      <= '1';-- start the device max wait time countr
        asynch_addr_data_sel_i  <= '1';
        command_ns              <= DEV_VALID_M;
    else
        tads_load_ce_i          <= '1';
        command_ns              <= NM_CONTROL_ASSERT;
    end if;

-- below is non multiplexed part of the code...
-------------------------------------------------------------------------------
-- NM_CONTROL_ASSERT -> Generates the write/read control signal in non-mxed mode
-- It will check for the address hold counter to be over.
-- If the address hold cntr is asserted then the "address data select"
-- line will indicate the data phase.
-- Also starts device valid and device ready counter
-------------------------------------------------------------------------------
when NM_CONTROL_ASSERT =>
         asynch_chip_select_i     <= '0';
         tads_load_ce_i           <= '1';
         if(Tads_cnt = ADS_CNTR8_END)then
              tads_load_ce_i       <= '0';
              asynch_wr_i          <= Asynch_wr_req;
              asynch_rd_i          <= Asynch_rd_req;
              data_sel                <= '1';
              tdev_valid_load_ce_i    <= '1';
              tdev_rdy_load_ce_i      <= '1';
              command_ns              <= DEV_VALID;
         else
              command_ns              <= NM_CONTROL_ASSERT;
         end if;
-------------------------- DEV_VALID --------------------------
-- DEV_VALID -> Decides the state of the device.if the device is in valid state
-- then further communication with the device starts
-- If the device does not respond with in the given time, then state machine
-- will enter into the device ready check state.In the device ready check state
-- the design will wait till the end of device ready period. else the
-- communication is abruptly terminated and the
-- state machine will reset to IDLE state.
when DEV_VALID=>

         asynch_chip_select_i    <= '0';
         data_sel                <= '1';
         asynch_wr_i             <= Asynch_wr_req;
         asynch_rd_i             <= Asynch_rd_req;
         tdev_valid_load_ce_i    <= '1';
         tdev_rdy_load_ce_i      <= '1';
        if ((Tdev_valid_cnt = DEV_VALID_CNTR7_END)) then
             tdev_valid_load_ce_i  <= '0';
             --asynch_en_i           <= Asynch_prh_rdy;
             tdev_rdy_load_ce_i    <= '1';
             command_ns            <= DEV_RDY;
         else
             command_ns            <= DEV_VALID;
         end if;

-- DEV_RDY : is meant for confirmation that the device is ready
when DEV_RDY=>

         asynch_chip_select_i    <= '0';
         data_sel                <= '1';
         asynch_wr_i             <= Asynch_wr_req;
         asynch_rd_i             <= Asynch_rd_req;
         tdev_rdy_load_ce_i      <= '1';
         taddr_hold_load_i       <= '1';
        if (Asynch_prh_rdy='1') then
            asynch_en_i          <= '1';
            tcontrol_load_ce_i   <= '1';
            command_ns           <= CONTROL_DEASSERT;
        elsif((Tdevrdy_wdth_cnt=DEV_RDY_CNTR4_END)and(Asynch_prh_rdy='0'))then
            tdev_rdy_load_ce_i   <= '0';
            asynch_error_i       <= '1';--generate error
            asynch_Wrack_i       <= Asynch_wr_req;--generate wr ack
            asynch_Rdack_i       <= Asynch_rd_req;--generate rd ack
            asynch_chip_select_i <= '1';--deactivate chip select

            asynch_wr_i          <= '0';--deactivate control signal
            asynch_rd_i          <= '0';--deactivate control signal
            command_ns           <= IDLE;
        else
            command_ns           <= DEV_RDY;
        end if;

-------------------------- CONTROL_DEASSERT --------------------------
-- Deactivates the control signal depending upon the assertion of the signals
-- from the epc_counter.vhd. this is common state for mux and non-mux design.
-- starts the chip select deasert counter.
when CONTROL_DEASSERT =>
         asynch_chip_select_i   <= '0';
         data_sel               <= '1';
         asynch_en_i            <= '1';
         asynch_wr_i            <= Asynch_wr_req;
         asynch_rd_i            <= Asynch_rd_req;
         tcontrol_load_ce_i     <= '1';
        if((Tcontrol_wdth_cnt=CONTROL_TH_CNTR3_END)) then 
            tcontrol_load_ce_i  <= '0';
            tdata_hold_load_ce_i<= '1';
            asynch_wr_i         <= '0';
            asynch_rd_i         <= '0';
            asynch_en_i         <= '0';
            if(Dev_bus_multiplexed= '1') then
            --    asynch_en_i     <= '1';
                command_ns      <= ACK_GEN_MUXED;
            else
            --  asynch_en_i     <= '0';
                command_ns      <= ACK_GEN_NON_MUXED;
            end if;
        else
            command_ns          <= CONTROL_DEASSERT;
        end if;

--  ACK_GEN_NON_MUXED  -------------------------------
when ACK_GEN_NON_MUXED =>

         asynch_chip_select_i     <= '0';
         tdata_hold_load_ce_i     <= '1';
         data_sel                 <= '1';

         tdev_valid_load_i        <= '1';--load the device valid counter
         tads_load_i              <= '1';--load the ads counter
         trd_recovery_load_i      <= '1';--load the rd recovery cntr
         twr_recovery_load_i      <= '1';--load the wr recovery counter
         tcontrol_load_i          <= '1';--load the control width counter

         if(Taddr_data_cs_hold_cnt =  ADDR_DATA_CS_TH_CNTR12_END) then
                tdata_hold_load_ce_i <= '0';
                if(Asynch_cycle = '1' and Dev_dwidth_match = '1') then
                        asynch_addr_cnt_en_i  <= '1';
                        data_sel              <= '0';
                else
                        asynch_addr_cnt_en_i  <= '0';
                        asynch_Wrack_i        <= Asynch_wr_req;
                        asynch_Rdack_i        <= Asynch_rd_req;
                        data_sel              <= '0';
                end if;
                if(Asynch_wr_req = '1') then
                    twr_non_muxed_recovery_ld_ce_i <= '1';
                    command_ns                     <= WR_NON_MUXED_RECOVERY;
                elsif(Asynch_rd_req = '1') then
                    trd_non_muxed_recovery_ld_ce_i <= '1';
                    command_ns                     <= RD_NON_MUXED_RECOVERY;
                end if;
        else
                command_ns                         <= ACK_GEN_NON_MUXED;
        end if;

-- READ NON-MUXED RECOVERY state ->  this is the recovery period between 
----------------------------------  two consecutive reads in non-mux mode
when RD_NON_MUXED_RECOVERY =>
         trd_non_muxed_recovery_ld_ce_i <= '1';
         asynch_chip_select_i           <= '0';
         if (Trd_non_muxed_rec_cnt = RD_NON_MUXED_RECOVERY_CNTR9_END) then
                trd_non_muxed_recovery_ld_ce_i  <= '0';
                if(Asynch_cycle = '1' and Dev_dwidth_match = '1') then
                        asynch_chip_select_i    <= '0';
                        tads_load_ce_i          <= '1';
                        command_ns              <= NM_CONTROL_ASSERT;
                else
                        command_ns              <= IDLE;
                end if;
         else
            command_ns               <= RD_NON_MUXED_RECOVERY;
         end if;

-- WR_NON_MUXED_RECOVERY : this is the recovery period between two consecutive
------------------------   writes in non-mux mode
when WR_NON_MUXED_RECOVERY =>
         twr_non_muxed_recovery_ld_ce_i <= '1';
         asynch_chip_select_i           <= '0';
         if (Twr_non_muxed_rec_cnt = WR_NON_MUXED_RECOVERY_CNTR5_END) then
                twr_non_muxed_recovery_ld_ce_i  <= '0';
                if(Asynch_cycle = '1' and Dev_dwidth_match = '1') then
                        asynch_chip_select_i    <= '0';
                        tads_load_ce_i          <= '1';
                        command_ns              <=NM_CONTROL_ASSERT;
                else
                        command_ns              <= IDLE;
                end if;
         else
                command_ns                    <= WR_NON_MUXED_RECOVERY;
         end if;

-- below is part of multiplexed code
------------------------------------
-------------------------------------------------------------------------------
-- if the address set up counter ends then check whether strobe counter width
-- is over, then the address strobe signal is deasserted and address hold sgnl
-- is enabled.
when ADS_ASSERT =>

         asynch_addr_data_sel_i     <= '1';
         asynch_addr_strobe_i       <= '1';
         asynch_chip_select_i       <= '0';
         tads_load_ce_i             <= '1';
         if(Tads_cnt = ADS_CNTR8_END)then
            tads_load_ce_i       <= '0';
            asynch_addr_strobe_i <= '0';

            command_ns           <= DUMMY_ADS;
         else
            command_ns           <= ADS_ASSERT;
         end if;
-----------------------------------------------
when DUMMY_ADS =>
         asynch_addr_data_sel_i <= '0';
         asynch_chip_select_i   <= '0';
         taddr_hold_load_ce_i   <= '1';
         command_ns             <= M_CONTROL_ASSERT;

-- M_CONTROL_ASSERT state -> this state generates the multiplexed control sign
-- al
when M_CONTROL_ASSERT =>

         asynch_addr_data_sel_i <= '0';
         asynch_chip_select_i   <= '0';
         taddr_hold_load_ce_i   <= '1';
         if((Taddr_hold_cnt = ADDR_TH_CNTR2_END))then
            asynch_wr_i             <= Asynch_wr_req;
            asynch_rd_i             <= Asynch_rd_req;
            asynch_addr_data_sel_i  <= '0';

            taddr_hold_load_ce_i    <= '0';
            data_sel                <= '1';
            
            if(Asynch_wr_req = '1') then
                asynch_en_i         <= '1';
                tcontrol_load_ce_i  <= '1';
                command_ns          <= CONTROL_DEASSERT;
            elsif(Asynch_rd_req = '1') then
                 command_ns         <= DUMMY_ST;
            end if;
            
         else
            command_ns              <= M_CONTROL_ASSERT;
         end if;

---------------------------------------------------------
when DUMMY_ST =>
         asynch_chip_select_i    <= '0';
         asynch_wr_i             <= Asynch_wr_req;
         asynch_rd_i             <= Asynch_rd_req;
         asynch_en_i             <= '1';
         tcontrol_load_ce_i      <= '1';
         data_sel                <= '1';
         command_ns              <= CONTROL_DEASSERT;         

------------------------------------------------------------------------------

when ACK_GEN_MUXED =>

         asynch_chip_select_i <= '0';
         tdata_hold_load_ce_i <= '1';
         data_sel             <= '1';

         tads_load_i          <= '1';
         tdev_valid_load_i    <= '1';
         trd_recovery_load_i  <= '1';
         twr_recovery_load_i  <= '1';
         tcontrol_load_i      <= '1';
         taddr_hold_load_i    <= '1';

         if(Taddr_data_cs_hold_cnt =  ADDR_DATA_CS_TH_CNTR12_END) then
            tdata_hold_load_ce_i     <= '0';
            if(Asynch_cycle = '1' and Dev_dwidth_match = '1') then
              data_sel               <= '0';
            else
              asynch_addr_cnt_en_i   <= '0';
              asynch_Wrack_i         <= Asynch_wr_req;
              asynch_Rdack_i         <= Asynch_rd_req;
              data_sel               <= '0';
              --asynch_chip_select_i<= not(Dev_FIFO_access);
            end if;
            if(Asynch_wr_req = '1') then
              twr_muxed_recovery_ld_ce_i <= '1';
              command_ns                 <= WR_MUXED_RECOVERY;
            elsif(Asynch_rd_req = '1') then
              trd_muxed_recovery_ld_ce_i <= '1';
              command_ns                 <= RD_MUXED_RECOVERY;
            end if;
            tads_load_i              <= '1';

         else
            command_ns                <= ACK_GEN_MUXED;
         end if;

-- RD_MUXED_RECOVERY STATE ->
-- Determines the recovery time of the transaction
-- Depending upon the data width, will jump to the idle state or,
-- will generate the next write/read cycles and at the end generates
-- acknowledge to IPIF.

-- READ MUXED RECOVERY
-----------------------
when RD_MUXED_RECOVERY =>

         trd_muxed_recovery_ld_ce_i     <= '1';
         asynch_chip_select_i           <= '0';

         if (Trd_muxed_rec_cnt = RD_MUXED_RECOVERY_CNTR9_END) then
            trd_muxed_recovery_ld_ce_i  <= '0';
            if(Asynch_cycle = '1' and Dev_dwidth_match = '1') then
                if(Dev_FIFO_access = '1') then
                  taddr_hold_load_ce_i   <= '1';
                  asynch_addr_cnt_en_i   <= '1';
                  command_ns             <= M_CONTROL_ASSERT;
                else
                  tdev_rdy_load_ce_i     <= '1';
                  tdev_valid_load_ce_i   <= '1';
                  asynch_addr_cnt_en_i   <= '1';
                  asynch_addr_data_sel_i <= '1';
                  command_ns             <= DEV_VALID_M;
                end if;
            else
               command_ns               <= IDLE;
            end if;
         else
            command_ns     <= RD_MUXED_RECOVERY;
         end if;

-- These are muxed and non muxed write recovery states. Depending upon the
-- configured device mux and non mux property, particular state will be
-- executed.

-- WR_MUXED_RECOVERY
--------------------
when WR_MUXED_RECOVERY =>

         twr_muxed_recovery_ld_ce_i     <= '1';
         asynch_chip_select_i           <= '0';

         if (Twr_muxed_rec_cnt = WR_MUXED_RECOVERY_CNTR5_END) then
            twr_muxed_recovery_ld_ce_i  <= '0';
            if(Asynch_cycle = '1' and Dev_dwidth_match = '1') then
                if(Dev_FIFO_access = '1') then
                  taddr_hold_load_ce_i     <= '1';
                  asynch_addr_cnt_en_i     <= '1';
                  command_ns               <= M_CONTROL_ASSERT;
                else
                  tdev_rdy_load_ce_i       <= '1';
                  tdev_valid_load_ce_i     <= '1';
                  asynch_addr_cnt_en_i     <= '1';
                  asynch_addr_data_sel_i   <= '1';
                  command_ns               <= DEV_VALID_M;
                end if;
            else
                command_ns               <= IDLE;
            end if;
         else
            command_ns   <= WR_MUXED_RECOVERY;
         end if;

-- DEV_VALID_M state : In case of multiplexing logic, check first if the device
-- is ready for communication. this is required as the same data lines carry the
-- address (in initial phase) and data (in later phase). the external device
-- should register the address first before the lines swith over to data.
-- this is confirm check for device ready signal.
when DEV_RDY_M =>
       asynch_addr_data_sel_i  <= '1';       --address selection on common line
       asynch_chip_select_i    <= '0';       --assert chip select
       tdev_rdy_load_ce_i      <= '1';       --device ready max time counter
                                               --active signal
       if(Asynch_prh_rdy='1') then
            asynch_addr_strobe_i <= '1';--enable address strobe sig
            tads_load_ce_i       <= '1';--start the ads counter
            tdev_rdy_load_ce_i   <= '0';-- deactivate the dev max
                                                   -- time cntr,as its not
                                                   -- required now
            command_ns           <= ADS_ASSERT;

       elsif((Tdevrdy_wdth_cnt=DEV_RDY_CNTR4_END)and(Asynch_prh_rdy='0'))then
            tdev_rdy_load_ce_i      <= '0'; -- deactivate the dev max time cntr
            asynch_error_i          <= '1';          --generate error
            asynch_Wrack_i          <= Asynch_wr_req;--generate wr ack
            asynch_Rdack_i          <= Asynch_rd_req;--generate rd ack
            asynch_chip_select_i    <= '1';          --deactivate chip select
            command_ns              <= IDLE;
       else
            command_ns              <= DEV_RDY_M;
       end if;

-- DEV_VALID_M: This state validates the readiness of the device in multiplexing
-- mode
when DEV_VALID_M =>
         asynch_addr_data_sel_i  <= '1';    --address selection on common line
         asynch_chip_select_i    <= '0';    --assert chip select
         tdev_valid_load_ce_i    <= '1';    --dev valid counter is active till
                                            --the counter exits and the
                                            --external device is not ready
         tdev_rdy_load_ce_i      <= '1';    --device ready max time counter
                                            --active signal
         -- the below condition checks that the device valid counter has ended
         -- when the device is not ready
        if((Tdev_valid_cnt = DEV_VALID_CNTR7_END)or(Asynch_prh_rdy='1')) then
                tdev_valid_load_ce_i     <= '0';--deactive dev valid counter
                tdev_rdy_load_ce_i   <= '1';
                command_ns           <= DEV_RDY_M;
        else
                command_ns           <= DEV_VALID_M;
        end if;
-----------------------------------------------------------------------------
-- coverage off
when others => command_ns   <=IDLE;
-- coverage on
end case;
end process CMB_ASYNCH_PROCESS;

-----------------------------------------------------------------------------
-- NAME: ASYNC_CS_SEL_PROCESS
-----------------------------------------------------------------------------
-- Description: Drives an internal signal (ASYNC_CS_N) from the asynchronous
--              control logic to be used as the chip select for the external
--              peripheral device
-----------------------------------------------------------------------------
ASYNC_CS_SEL_PROCESS: process (Bus2IP_CS,asynch_chip_select_i) is
begin
  asynch_chip_select_n <= (others => '1');
  for i in 0 to C_NUM_PERIPHERALS-1 loop
    if (Bus2IP_CS(i) = '1') then
      asynch_chip_select_n(i) <= not(Bus2IP_CS(i) and 
                                                 (not asynch_chip_select_i));
    end if;
  end loop;
end process ASYNC_CS_SEL_PROCESS;
-----------------------------------------------------------------------------

asynch_data_sel_i <= asynch_addr_data_sel_i or (data_sel and (not BUS2IP_RNW));
-----------------------------------------------------------------------------

REGISTERED_OP: process (Clk)
begin
    if (Clk'event and Clk = '1') then
        Taddr_hold_load_ce              <= taddr_hold_load_ce_i;
        Tdata_hold_load_ce              <= tdata_hold_load_ce_i;
        Tcontrol_load_ce                <= tcontrol_load_ce_i;
        Tdev_valid_load_ce              <= tdev_valid_load_ce_i;
        Tdev_rdy_load_ce                <= tdev_rdy_load_ce_i;
        Tads_load_ce                    <= tads_load_ce_i;

        Twr_muxed_recovery_load_ce      <= twr_muxed_recovery_ld_ce_i;
        Trd_muxed_recovery_load_ce      <= trd_muxed_recovery_ld_ce_i;
        Twr_non_muxed_recovery_load_ce  <= twr_non_muxed_recovery_ld_ce_i;
        Trd_non_muxed_recovery_load_ce  <= trd_non_muxed_recovery_ld_ce_i;

        Asynch_Rd                       <= not(asynch_Rd_i);
        Asynch_Wr                       <= not(asynch_Wr_i);
        Asynch_en                       <= asynch_en_i;
        Asynch_chip_select              <= asynch_chip_select_n;
        Asynch_addr_strobe              <= asynch_addr_strobe_i;
        Asynch_addr_data_sel            <= asynch_addr_data_sel_i;
        Asynch_data_sel                 <= asynch_data_sel_i;
    end if;
end process REGISTERED_OP;
------------------------------------------------------------------------------

Tdata_hold_load                 <= '1';
Tcontrol_load                   <= tcontrol_load_i;
Trd_recovery_load               <= trd_recovery_load_i;
Twr_recovery_load               <= twr_recovery_load_i;
Taddr_hold_load                 <= taddr_hold_load_i;
Tdev_valid_load                 <= tdev_valid_load_i;
Tdev_rdy_load                   <= tdev_rdy_load_i;
Tads_load                       <= tads_load_i;

Asynch_addr_cnt_en              <= asynch_addr_cnt_en_i;
Asynch_addr_cnt_ld              <= asynch_addr_cnt_ld_i;
Asynch_Wrack                    <= asynch_Wrack_i;
Asynch_Rdack                    <= asynch_Rdack_i;
Asynch_error                    <= asynch_error_i;
Asynch_start                    <= asynch_start_i;
end imp;
------------------------------------------------------------------------------
--End of File async_statemachine.vhd
------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- async_counters.vhd - entity/architecture pair
-------------------------------------------------------------------------------
-- ************************************************************************
-- ** DISCLAIMER OF LIABILITY                                            **
-- **                                                                    **
-- ** This file contains proprietary and confidential information of     **
-- ** Xilinx, Inc. ("Xilinx"), that is distributed under a license       **
-- ** from Xilinx, and may be used, copied and/or disclosed only         **
-- ** pursuant to the terms of a valid license agreement with Xilinx.    **
-- **                                                                    **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION              **
-- ** ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER         **
-- ** EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT                **
-- ** LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,          **
-- ** MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx      **
-- ** does not warrant that functions included in the Materials will     **
-- ** meet the requirements of Licensee, or that the operation of the    **
-- ** Materials will be uninterrupted or error-free, or that defects     **
-- ** in the Materials will be corrected. Furthermore, Xilinx does       **
-- ** not warrant or make any representations regarding use, or the      **
-- ** results of the use, of the Materials in terms of correctness,      **
-- ** accuracy, reliability or otherwise.                                **
-- **                                                                    **
-- ** Xilinx products are not designed or intended to be fail-safe,      **
-- ** or for use in any application requiring fail-safe performance,     **
-- ** such as life-support or safety devices or systems, Class III       **
-- ** medical devices, nuclear facilities, applications related to       **
-- ** the deployment of airbags, or any other applications that could    **
-- ** lead to death, personal injury or severe property or               **
-- ** environmental damage (individually and collectively, "critical     **
-- ** applications"). Customer assumes the sole risk and liability       **
-- ** of any use of Xilinx products in critical applications,            **
-- ** subject only to applicable laws and regulations governing          **
-- ** limitations on product liability.                                  **
-- **                                                                    **
-- ** Copyright 2005, 2006, 2008, 2009 Xilinx, Inc.                      **
-- ** All rights reserved.                                               **
-- **                                                                    **
-- ** This disclaimer and copyright notice must be retained as part      **
-- ** of this file at all times.                                         **
-- ************************************************************************

-------------------------------------------------------------------------
-- Filename:   async_counters.vhd
-- Version:    v1.00.a
-- Description:This file contains all of the counters for the EPC Async design
--
-- VHDL-Standard: VHDL'93
-------------------------------------------------------------------------------
-- Structure:
--             axi_epc.vhd
--               -axi_lite_ipif
--               -epc_core.vhd
--               -ipic_if_decode.vhd
--               -sync_cntl.vhd
--               -async_cntl.vhd
--                  -- async_counters.vhd
--                  -- async_statemachine.vhd
--               -address_gen.vhd
--               -data_steer.vhd
--               -access_mux.vhd
-------------------------------------------------------------------------------
-- Author   : VB
-- History  :
--
--  VB           08-24-2010 --  v2_0 version for AXI
-- ^^^^^^
--            The core updated for AXI based on xps_epc_v1_02_a
-- ~~~~~~
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                    "_n"
--      clock signals:                         "clk", "clk_div#", "clk_#x"
--      reset signals:                         "rst", "rst_n"
--      generics:                              "C_*"
--      user defined types:                    "*_TYPE"
--      state machine next state:              "*_ns"
--      state machine current state:           "*_cs"
--      combinatorial signals:                 "*_com"
--      pipelined or register delay signals:   "*_d#"
--      counter signals:                       "*cnt*"
--      clock enable signals:                  "*_ce"
--      internal version of output port        "*_i"
--      device pins:                           "*_pin"
--      ports:                                 -Names begin with Uppercase
--      processes:                             "*_PROCESS"
--      component instantiations:              "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

library axi_epc_v2_0_23;
use axi_epc_v2_0_23.ld_arith_reg;

-------------------------------------------------------------------------------
-- Definition of Ports:
-------------------------------------------------------------------------------
------------Declaration of GENERICs which will go directly counters------------
-------------------------------------------------------------------------------
--C_ADDR_TH_CNT_WIDTH   -- Address hold time counter data width
--C_ADDR_DATA_CS_TH_CNT_WIDTH --Address/Data/Chip select hold counter data width
--C_CONTROL_CNT_WIDTH   -- Control signal counter width
--C_DEV_VALID_CNT_WIDTH -- Device valid signal width
--C_DEV_RDY_CNT_WIDTH   -- Control siganl assert activate counter width
--C_ADS_CNT_WIDTH       -- Address Strobe counter width
--C_WR_REC_NM_CNT_WIDTH --Non Muxed Recovery signal assert(wr)activate cntr wdth
--C_RD_REC_NM_CNT_WIDTH --Non Muxed Recovery signal assert(rd)activate cntr wdth
--C_WR_REC_M_CNT_WIDTH  -- Muxed Recovery siganl assert(write)activate cntr wdth
--C_RD_REC_M_CNT_WIDTH  -- Muxed Recovery siganl assert(read)activate cntr wdth
------------------------------------------------------------------------------
--***All inputs***
------------------------------------------------------------------------------
-- Taddr_hold_count         -- address counter width
-- Taddr_data_cs_hold_count -- address data chip select hold count
-- Tcontrol_width_data      -- control width count
-- Tdev_valid_data          -- device valid count
-- Tdevrdy_width_data       -- device ready count
-- Tads_data                -- address strobe/chip select/data set up count

-- Twr_recovery_muxed_data  -- muxed write recovery count
-- Twr_recovery_non_muxed_data  -- non muxed write recovery count
-- Trd_recovery_muxed_data  -- muxed read recovery count
-- Trd_recovery_non_muxed_data  -- non muxed read recovery count

-- Taddr_hold_load   -- Load the counter to hold the address lines
-- Tdata_hold_load   -- Load the counter to hold the data lines
-- Tcontrol_load     -- Load the counter to maintain the control signal
-- Tdev_valid_load   -- Load the device valid counter
-- Tdev_rdy_load     -- Load the device ready counter
-- Tads_load         -- Load the address strobe counter
-- Twr_recovery_load -- Load the write recovery counter
-- Trd_recovery_load -- Load the read recovery counter

-- Taddr_hold_load_ce  -- Address hold load counter enable
-- Tdata_hold_load_ce  -- Data hold load counter enable
-- Tcontrol_load_ce    -- Control load counter enable
-- Tdev_valid_load_ce  -- Device valid load counter enable
-- Tdev_rdy_load_ce    -- Device ready load counter enable
-- Tads_load_ce        -- Address Strobe load counter enable

-- Twr_muxed_recovery_load_ce -- Muxed Write recovery load counter enable
-- Trd_muxed_recovery_load_ce -- Muxed Read recovery load counter enable
-- Twr_non_muxed_recovery_load_ce --Non muxed Write recovery load counter enable
-- Trd_non_muxed_recovery_load_ce --Non muxed read recovery load counter enable
------------------------------------------------------------------------------
-- ***All outputs***
------------------------------------------------------------------------------
--Taddr_hold_cnt            -- output of address hold count
--Tcontrol_wdth_cnt         -- output of control width count
--Tdevrdy_wdth_cnt          -- output of device ready count
--Tdev_valid_cnt            -- output of device valid count
--Tads_cnt                  -- output of address-strobe/data,adress set up count
--Taddr_data_cs_hold_cnt    -- output of address,data,chip select hold count

--Twr_muxed_rec_cnt         -- output of muxed write recovery count
--Trd_muxed_rec_cnt         -- output of muxed read recovery count
--Twr_non_muxed_rec_cnt     -- output of non muxed write recovery count
--Trd_non_muxed_rec_cnt     -- output of non muxed read recovery count

------------------------------------------------------------------------------
-- ***Clocks and reset***
------------------------------------------------------------------------------
--      Clk                 -- AXI Clk
--      Rst                 -- AXI Reset
------------------------------------------------------------------------------
-- Entity section
------------------------------------------------------------------------------
entity async_counters is
  generic
        (
        C_ADDR_TH_CNT_WIDTH             : integer;
        C_ADDR_DATA_CS_TH_CNT_WIDTH     : integer;
        C_CONTROL_CNT_WIDTH             : integer;
        C_DEV_VALID_CNT_WIDTH           : integer;
        C_DEV_RDY_CNT_WIDTH             : integer;
        C_ADS_CNT_WIDTH                 : integer;
        C_WR_REC_NM_CNT_WIDTH           : integer;
        C_RD_REC_NM_CNT_WIDTH           : integer;
        C_WR_REC_M_CNT_WIDTH            : integer;
        C_RD_REC_M_CNT_WIDTH            : integer
        );
  port
        (
-- inputs from asynch_cntrl
    Taddr_hold_count        : in std_logic_vector(0 to C_ADDR_TH_CNT_WIDTH-1);
    Taddr_data_cs_hold_count: in std_logic_vector
                                          (0 to C_ADDR_DATA_CS_TH_CNT_WIDTH-1);
    Tcontrol_width_data     : in std_logic_vector(0 to C_CONTROL_CNT_WIDTH-1);
    Tdev_valid_data         : in std_logic_vector(0 to C_DEV_VALID_CNT_WIDTH-1);
    Tdevrdy_width_data      : in std_logic_vector(0 to C_DEV_RDY_CNT_WIDTH-1);
    Tads_data               : in std_logic_vector(0 to C_ADS_CNT_WIDTH-1);
    
    Twr_recovery_muxed_data     : in std_logic_vector
                                                  (0 to C_WR_REC_M_CNT_WIDTH-1);
    Twr_recovery_non_muxed_data : in std_logic_vector
                                                 (0 to C_WR_REC_NM_CNT_WIDTH-1);
    Trd_recovery_muxed_data     : in std_logic_vector
                                                  (0 to C_RD_REC_M_CNT_WIDTH-1);
    Trd_recovery_non_muxed_data : in std_logic_vector
                                                 (0 to C_RD_REC_NM_CNT_WIDTH-1);
    
    Taddr_hold_cnt         : out std_logic_vector(0 to C_ADDR_TH_CNT_WIDTH-1);
    Tcontrol_wdth_cnt      : out std_logic_vector(0 to C_CONTROL_CNT_WIDTH-1);
    Tdevrdy_wdth_cnt       : out std_logic_vector(0 to C_DEV_RDY_CNT_WIDTH-1);
    
    Twr_muxed_rec_cnt      : out std_logic_vector(0 to C_WR_REC_M_CNT_WIDTH-1);
    Trd_muxed_rec_cnt      : out std_logic_vector(0 to C_RD_REC_M_CNT_WIDTH-1);
    Twr_non_muxed_rec_cnt  : out std_logic_vector(0 to C_WR_REC_NM_CNT_WIDTH-1);
    Trd_non_muxed_rec_cnt  : out std_logic_vector(0 to C_RD_REC_NM_CNT_WIDTH-1);
    
    Tdev_valid_cnt         : out std_logic_vector(0 to C_DEV_VALID_CNT_WIDTH-1);
    Tads_cnt               : out std_logic_vector(0 to C_ADS_CNT_WIDTH-1);
    Taddr_data_cs_hold_cnt : out std_logic_vector
                                           (0 to C_ADDR_DATA_CS_TH_CNT_WIDTH-1);
    -- inputs from asynch_statemachine
    Taddr_hold_load        : in std_logic;
    Tdata_hold_load        : in std_logic;
    Tcontrol_load          : in std_logic;
    Tdev_valid_load        : in std_logic;
    Tdev_rdy_load          : in std_logic;
    Tads_load              : in std_logic;
    Twr_recovery_load      : in std_logic;
    Trd_recovery_load      : in std_logic;
    
    Taddr_hold_load_ce     : in std_logic;
    Tdata_hold_load_ce     : in std_logic;
    Tcontrol_load_ce       : in std_logic;
    Tdev_valid_load_ce     : in std_logic;
    Tdev_rdy_load_ce       : in std_logic;
    Tads_load_ce           : in std_logic;
    
    Twr_muxed_recovery_load_ce    : in std_logic;
    Trd_muxed_recovery_load_ce    : in std_logic;
    Twr_non_muxed_recovery_load_ce: in std_logic;
    Trd_non_muxed_recovery_load_ce: in std_logic;

-- Clocks and reset
    Clk               :in std_logic;
    Rst               :in std_logic
      );
end entity async_counters;
------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------
architecture imp of async_counters is
------------------------------------------------------------------------------
-- Constant declarations
------------------------------------------------------------------------------
-- reset values
-- addr hold
constant ADDR_TH_CNTR2_RST: std_logic_vector(0 to C_ADDR_TH_CNT_WIDTH-1)
          := (others => '0');
-- control hold
constant CONTROL_TH_CNTR3_RST: std_logic_vector(0 to C_CONTROL_CNT_WIDTH-1)
          := (others => '0');
-- dev rdy pulse width
constant DEV_RDY_CNTR4_RST: std_logic_vector(0 to C_DEV_RDY_CNT_WIDTH-1)
          := (others => '0');
-- device set up pulse width
constant DEV_VALID_CNTR7_RST: std_logic_vector(0 to C_DEV_VALID_CNT_WIDTH-1)
          := (others => '0');
-- address strobe counter
constant ADS_CNTR8_RST: std_logic_vector(0 to C_ADS_CNT_WIDTH-1)
          := (others => '0');
-- address,data, chip select hold width
constant ADDR_DATA_CS_TH_CNTR12_RST
          :std_logic_vector(0 to C_ADDR_DATA_CS_TH_CNT_WIDTH-1)
          := (others => '0');
-- read recovery pulse width

constant RD_MUXED_RECOVERY_CNTR9_RST:
          std_logic_vector(0 to C_RD_REC_M_CNT_WIDTH-1)
          := (others => '0');
constant RD_NON_MUXED_RECOVERY_CNTR9_RST:
          std_logic_vector(0 to C_RD_REC_NM_CNT_WIDTH-1)
          := (others => '0');

-- write recovery pulse width

constant WR_MUXED_RECOVERY_CNTR5_RST:
          std_logic_vector(0 to C_WR_REC_M_CNT_WIDTH-1)
          := (others => '0');
constant WR_NON_MUXED_RECOVERY_CNTR5_RST:
          std_logic_vector(0 to C_WR_REC_NM_CNT_WIDTH-1)
          := (others => '0');

-----------------------------------------------------------------------------
-- Signal declarations
-----------------------------------------------------------------------------
--
-----------------------------------------------------------------------------
-- Architecture start
-----------------------------------------------------------------------------
begin
-- Note: All the counters are down counters
------------------------------------------------------------------------------
-- component instantiation
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- component instantiation
------------------------------------------------------------------------------
--LD_ARITH_REG_I_CNTR2: The max time counter for address hold
------------------------------------------------------------------------------

LD_ARITH_REG_I_CNTR2: entity axi_epc_v2_0_23.ld_arith_reg
    generic map (
          C_ADD_SUB_NOT         => false,
          C_REG_WIDTH           => C_ADDR_TH_CNT_WIDTH,
          C_RESET_VALUE         => ADDR_TH_CNTR2_RST,
          C_LD_WIDTH            => C_ADDR_TH_CNT_WIDTH,
          C_LD_OFFSET           => 0,
          C_AD_WIDTH            => 1,
          C_AD_OFFSET           => 0
          )
    port map     (
          CK                    => Clk,
          RST                   => Rst,
          Q                     => Taddr_hold_cnt,
          LD                    => Taddr_hold_count,
          AD                    => "1",
          LOAD                  => Taddr_hold_load,
          OP                    => Taddr_hold_load_ce
          );
------------------------------------------------------------------------------
-- component instantiation
------------------------------------------------------------------------------
--LD_ARITH_REG_I_CNTR3: The max time counter for control width
------------------------------------------------------------------------------
LD_ARITH_REG_I_CNTR3: entity axi_epc_v2_0_23.ld_arith_reg
    generic map (
          C_ADD_SUB_NOT         => false,
          C_REG_WIDTH           => C_CONTROL_CNT_WIDTH,
          C_RESET_VALUE         => CONTROL_TH_CNTR3_RST,
          C_LD_WIDTH            => C_CONTROL_CNT_WIDTH,
          C_LD_OFFSET           => 0,
          C_AD_WIDTH            => 1,
          C_AD_OFFSET           => 0
          )
    port map     (
          CK                    => Clk,
          RST                   => Rst,
          Q                     => Tcontrol_wdth_cnt,
          LD                    => Tcontrol_width_data,
          AD                    => "1",
          LOAD                  => Tcontrol_load,
          OP                    => Tcontrol_load_ce
          );
------------------------------------------------------------------------------
-- component instantiation
------------------------------------------------------------------------------
--LD_ARITH_REG_I_CNTR4: The max time counter till device become ready for
--communication
-----------------------------------------------------------------------------
--The counter is a down counter and will be loaded with initial values.
--The initial value will be loaded from the asynch_cntl level file.
--these values are modified as per the device requirements.
--Once the counter reaches to '1', then disable signal will be activated which
--in turn "deactivates" the control signals in the state machine.Ulitmately this
--becomes the max time counter till device responds
------------------------------------------------------------------------------

LD_ARITH_REG_I_CNTR4: entity axi_epc_v2_0_23.ld_arith_reg
    generic map (
          C_ADD_SUB_NOT         => false,
          C_REG_WIDTH           => C_DEV_RDY_CNT_WIDTH,
          C_RESET_VALUE         => DEV_RDY_CNTR4_RST,
          C_LD_WIDTH            => C_DEV_RDY_CNT_WIDTH,
          C_LD_OFFSET           => 0,
          C_AD_WIDTH            => 1,
          C_AD_OFFSET           => 0
                     )
    port map     (
          CK                    => Clk,
          RST                   => Rst,
          Q                     => Tdevrdy_wdth_cnt,
          LD                    => Tdevrdy_width_data,
          AD                    => "1",
          LOAD                  => Tdev_rdy_load,
          OP                    => Tdev_rdy_load_ce
          );
------------------------------------------------------------------------------
-- component instantiation
------------------------------------------------------------------------------
-- LD_ARITH_REG_I_CNTR7: This counter is used to measure period for
-- device in to valid state
------------------------------------------------------------------------------

LD_ARITH_REG_I_CNTR7: entity axi_epc_v2_0_23.ld_arith_reg
    generic map (
          C_ADD_SUB_NOT         => false,
          C_REG_WIDTH           => C_DEV_VALID_CNT_WIDTH,
          C_RESET_VALUE         => DEV_VALID_CNTR7_RST,
          C_LD_WIDTH            => C_DEV_VALID_CNT_WIDTH,
          C_LD_OFFSET           => 0,
          C_AD_WIDTH            => 1,
          C_AD_OFFSET           => 0
                     )
    port map     (
          CK                    => Clk,
          RST                   => Rst,
          Q                     => Tdev_valid_cnt,
          LD                    => Tdev_valid_data,
          AD                    => "1",
          LOAD                  => Tdev_valid_load,
          OP                    => Tdev_valid_load_ce
          );

------------------------------------------------------------------------------
-- component instantiation
------------------------------------------------------------------------------
-- LD_ARITH_REG_I_CNTR8: This counter is used to measure period for
-- address strobe
------------------------------------------------------------------------------

LD_ARITH_REG_I_CNTR8: entity axi_epc_v2_0_23.ld_arith_reg
    generic map (
          C_ADD_SUB_NOT         => false,
          C_REG_WIDTH           => C_ADS_CNT_WIDTH,
          C_RESET_VALUE         => ADS_CNTR8_RST,
          C_LD_WIDTH            => C_ADS_CNT_WIDTH,
          C_LD_OFFSET           => 0,
          C_AD_WIDTH            => 1,
          C_AD_OFFSET           => 0
                     )
    port map     (
          CK                    => Clk,
          RST                   => Rst,
          Q                     => Tads_cnt,
          LD                    => Tads_data,
          AD                    => "1",
          LOAD                  => Tads_load,
          OP                    => Tads_load_ce
          );
------------------------------------------------------------------------------
-- component instantiation
-------------------------------------------------------------------------------
--LD_ARITH_REG_I_CNTR12: The max time counter for address,data,chip select hold
-------------------------------------------------------------------------------
LD_ARITH_REG_I_CNTR12: entity axi_epc_v2_0_23.ld_arith_reg
    generic map (
          C_ADD_SUB_NOT         => false,
          C_REG_WIDTH           => C_ADDR_DATA_CS_TH_CNT_WIDTH,
          C_RESET_VALUE         => ADDR_DATA_CS_TH_CNTR12_RST,
          C_LD_WIDTH            => C_ADDR_DATA_CS_TH_CNT_WIDTH,
          C_LD_OFFSET           => 0,
          C_AD_WIDTH            => 1,
          C_AD_OFFSET           => 0
          )
    port map     (
          CK                    => Clk,
          RST                   => Rst,
          Q                     => Taddr_data_cs_hold_cnt,
          LD                    => Taddr_data_cs_hold_count,
          AD                    => "1",
          LOAD                  => Tdata_hold_load,
          OP                    => Tdata_hold_load_ce
          );
------------------------------------------------------------------------------
-- component instantiation
------------------------------------------------------------------------------
--LD_ARITH_REG_I_MUXED_CNTR5: The max time counter for the write muxed recovery.
------------------------------------------------------------------------------
--This counter enabled the write recovery non-muxed time period data is loaded
--when write recovery muxed signal is asserted.
--The counter is a down counter and will be loaded with initial values.
--The initial value will be loaded from the asynch_cntl level file. these
--values are modified as per the device requirements.
--Once the counter reaches to '1', then assert signal will be activated
--Ulitmately this becomes the max time counter for the next transition to start
------------------------------------------------------------------------------
LD_ARITH_REG_I_MUXED_CNTR5: entity axi_epc_v2_0_23.ld_arith_reg
    generic map (
          C_ADD_SUB_NOT         => false,
          C_REG_WIDTH           => C_WR_REC_M_CNT_WIDTH,
          C_RESET_VALUE         => WR_MUXED_RECOVERY_CNTR5_RST,
          C_LD_WIDTH            => C_WR_REC_M_CNT_WIDTH,
          C_LD_OFFSET           => 0,
          C_AD_WIDTH            => 1,
          C_AD_OFFSET           => 0
                     )
    port map     (
          CK                    => Clk,
          RST                   => Rst,
          Q                     => Twr_muxed_rec_cnt,
          LD                    => Twr_recovery_muxed_data,
          AD                    => "1",
          LOAD                  => Twr_recovery_load,
          OP                    => Twr_muxed_recovery_load_ce
          );

------------------------------------------------------------------------------
-- component instantiation
------------------------------------------------------------------------------
--LD_ARITH_REG_I_NON_MUXED_CNTR5: The max time counter for the write non-muxed
--                                recovery.
------------------------------------------------------------------------------
--This counter enabled the write recovery non-muxed time period data is loaded
--when write recovery non-muxed signal is asserted.
--The counter is a down counter and will be loaded with initial values.
--The initial value will be loaded from the asynch_cntl level file. these
--values are modified as per the device requirements.
--Once the counter reaches to '1', then assert signal will be activated
--Ulitmately this becomes the max time counter for the next transition to start
------------------------------------------------------------------------------
LD_ARITH_REG_I_NON_MUXED_CNTR5: entity axi_epc_v2_0_23.ld_arith_reg
    generic map (
          C_ADD_SUB_NOT         => false,
          C_REG_WIDTH           => C_WR_REC_NM_CNT_WIDTH,
          C_RESET_VALUE         => WR_NON_MUXED_RECOVERY_CNTR5_RST,
          C_LD_WIDTH            => C_WR_REC_NM_CNT_WIDTH,
          C_LD_OFFSET           => 0,
          C_AD_WIDTH            => 1,
          C_AD_OFFSET           => 0
                     )
    port map     (
          CK                    => Clk,
          RST                   => Rst,
          Q                     => Twr_non_muxed_rec_cnt,
          LD                    => Twr_recovery_non_muxed_data,
          AD                    => "1",
          LOAD                  => Twr_recovery_load,
          OP                    => Twr_non_muxed_recovery_load_ce
          );
------------------------------------------------------------------------------
-- component instantiation
------------------------------------------------------------------------------
-- LD_ARITH_REG_I_MUXED_CNTR9: This counter is used to measure period for
-- read muxed recovery period
------------------------------------------------------------------------------
--This counter enabled the read recovery muxed time period data is loaded
--when read recovery muxed signal is asserted.
--The counter is a down counter and will be loaded with initial values.
--The initial value will be loaded from the asynch_cntl level file. these
--values are modified as per the device requirements.
--Once the counter reaches to '1', then assert signal will be activated
--Ulitmately this becomes the max time counter for the next transition to start
--LD_ARITH_REG_I_MUXED_CNTR9: The max time counter for the read muxed recovery
-------------------------------------------------------------------------------
LD_ARITH_REG_I_MUXED_CNTR9: entity axi_epc_v2_0_23.ld_arith_reg
    generic map (
          C_ADD_SUB_NOT         => false,
          C_REG_WIDTH           => C_RD_REC_M_CNT_WIDTH,
          C_RESET_VALUE         => RD_MUXED_RECOVERY_CNTR9_RST,
          C_LD_WIDTH            => C_RD_REC_M_CNT_WIDTH,
          C_LD_OFFSET           => 0,
          C_AD_WIDTH            => 1,
          C_AD_OFFSET           => 0
                     )
    port map     (
          CK                    => Clk,
          RST                   => Rst,
          Q                     => Trd_muxed_rec_cnt,
          LD                    => Trd_recovery_muxed_data,
          AD                    => "1",
          LOAD                  => Trd_recovery_load,
          OP                    => Trd_muxed_recovery_load_ce
          );
------------------------------------------------------------------------------
-- component instantiation
------------------------------------------------------------------------------
-- LD_ARITH_REG_I_NON_MUXED_CNTR9: This counter is used to measure period for
-- read non muxed recovery period
------------------------------------------------------------------------------
--This counter enabled the read recovery non muxed time period data is loaded
--when read recovery non-muxed signal is asserted.
--The counter is a down counter and will be loaded with initial values.
--The initial value will be loaded from the asynch_cntl level file. these
--values are modified as per the device requirements.
--Once the counter reaches to '1', then assert signal will be activated
--Ulitmately this becomes the max time counter for the next transition to start
--LD_ARITH_REG_I_NON_MUXED_CNTR9: The max time counter for the read
--non muxed recovery
-------------------------------------------------------------------------------
LD_ARITH_REG_I_NON_MUXED_CNTR9: entity axi_epc_v2_0_23.ld_arith_reg
    generic map (
          C_ADD_SUB_NOT         => false,
          C_REG_WIDTH           => C_RD_REC_NM_CNT_WIDTH,
          C_RESET_VALUE         => RD_NON_MUXED_RECOVERY_CNTR9_RST,
          C_LD_WIDTH            => C_RD_REC_NM_CNT_WIDTH,
          C_LD_OFFSET           => 0,
          C_AD_WIDTH            => 1,
          C_AD_OFFSET           => 0
                     )
    port map     (
          CK                    => Clk,
          RST                   => Rst,
          Q                     => Trd_non_muxed_rec_cnt,
          LD                    => Trd_recovery_non_muxed_data,
          AD                    => "1",
          LOAD                  => Trd_recovery_load,
          OP                    => Trd_non_muxed_recovery_load_ce
          );
------------------------------------------------------------------------------
end imp;
------------------------------------------------------------------------------
-- End of async_counters.vhd file
------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- sync_cntl.vhd - entity/architecture pair
-------------------------------------------------------------------------------
-- ************************************************************************
-- ** DISCLAIMER OF LIABILITY                                            **
-- **                                                                    **
-- ** This file contains proprietary and confidential information of     **
-- ** Xilinx, Inc. ("Xilinx"), that is distributed under a license       **
-- ** from Xilinx, and may be used, copied and/or disclosed only         **
-- ** pursuant to the terms of a valid license agreement with Xilinx.    **
-- **                                                                    **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION              **
-- ** ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER         **
-- ** EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT                **
-- ** LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,          **
-- ** MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx      **
-- ** does not warrant that functions included in the Materials will     **
-- ** meet the requirements of Licensee, or that the operation of the    **
-- ** Materials will be uninterrupted or error-free, or that defects     **
-- ** in the Materials will be corrected. Furthermore, Xilinx does       **
-- ** not warrant or make any representations regarding use, or the      **
-- ** results of the use, of the Materials in terms of correctness,      **
-- ** accuracy, reliability or otherwise.                                **
-- **                                                                    **
-- ** Xilinx products are not designed or intended to be fail-safe,      **
-- ** or for use in any application requiring fail-safe performance,     **
-- ** such as life-support or safety devices or systems, Class III       **
-- ** medical devices, nuclear facilities, applications related to       **
-- ** the deployment of airbags, or any other applications that could    **
-- ** lead to death, personal injury or severe property or               **
-- ** environmental damage (individually and collectively, "critical     **
-- ** applications"). Customer assumes the sole risk and liability       **
-- ** of any use of Xilinx products in critical applications,            **
-- ** subject only to applicable laws and regulations governing          **
-- ** limitations on product liability.                                  **
-- **                                                                    **
-- ** Copyright 2005, 2006, 2008, 2009 Xilinx, Inc.                      **
-- ** All rights reserved.                                               **
-- **                                                                    **
-- ** This disclaimer and copyright notice must be retained as part      **
-- ** of this file at all times.                                         **
-- ************************************************************************
--
-------------------------------------------------------------------------------
-- File          : sync_cntl.vhd
-- Company       : Xilinx
-- Version       : v1.00.a
-- Description   : External Peripheral Controller for AXI bus sync logic
-- Standard      : VHDL-93
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Structure:
--             axi_epc.vhd
--               -axi_lite_ipif
--               -epc_core.vhd
--               -ipic_if_decode.vhd
--               -sync_cntl.vhd
--               -async_cntl.vhd
--                  -- async_counters.vhd
--                  -- async_statemachine.vhd
--               -address_gen.vhd
--               -data_steer.vhd
--               -access_mux.vhd
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Author   : VB
-- History  :
--
--  VB           08-24-2010 --  v2_0 version for AXI
-- ^^^^^^
--            The core updated for AXI based on xps_epc_v1_02_a
-- ~~~~~~
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.conv_std_logic_vector;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_misc.or_reduce;

library axi_lite_ipif_v3_0_4;
library lib_pkg_v1_0_2;
library axi_epc_v2_0_23;
use axi_lite_ipif_v3_0_4.ipif_pkg.INTEGER_ARRAY_TYPE;
use axi_epc_v2_0_23.ld_arith_reg;
use lib_pkg_v1_0_2.lib_pkg.log2;
use lib_pkg_v1_0_2.lib_pkg.max2;


library unisim;
use unisim.vcomponents.FDRE;

-------------------------------------------------------------------------------
--                     Definition of Generics                                --
-------------------------------------------------------------------------------
-- C_SPLB_NATIVE_DWIDTH           -  Data bus width of OPB bus.
-- C_NUM_PERIPHERALS      -  No of peripherals.
-- C_PRH_CLK_SUPPORT      -  Indication of whether the synchronous interface
--                           operates on peripheral clock or on OPB clock
-- C_PRH(0:3)_ADDR_TSU    -  External device (0:3) address setup time with
--                           respect  to rising edge of address strobe
--                           (for multiplexed address and data bus)
-- C_PRH(0:3)_ADDR_TH     -  External device (0:3) address hold time with
--                           respect to rising edge of address strobe
--                           (for multiplexed address and data bus)
-- C_PRH(0:3)_ADS_WIDTH   -  Minimum pulse width of address strobe
-- C_PRH(0:3)_RDY_WIDTH   -  Maximum wait period for external device ready
--                           signal assertion
-- LOCAL_CLK_PERIOD_PS    -  The clock period of operational clock of
--                           peripheral interface in  picoseconds
-- MAX_PERIPHERALS        -  Maximum number of peripherals supported by the
--                           external peripheral controller
-- ADDRCNT_WIDTH          -  Width of counter generating address suffix (low
--                           order address bits) in case of data width matching
-- NO_PRH_SYNC            -  Indicates all devices are configured for
--                           asynchronous interface
-- PRH_SYNC               -  Indicates if the devices are configured for
--                           asynchronous or synchronous interface
-- NO_PRH_DWIDTH_MATCH    -  Indication that no device is employing data width
--                           matching
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                     Definition of Ports                                   --
-------------------------------------------------------------------------------
-- Bus2IP_Clk            - OPB Clock
-- Bus2IP_Rst            - OPB Reset
-- Local_Clk             - Operational clock for peripheral interface
-- Local_Rst             - Reset for peripheral interface
-- Bus2IP_BE             - Byte enables from IPIC interface
-- Dev_id                - The decoded identification vector for the currently
--                       - selected device
-- Dev_in_access         - Indicates if any of the synchronous peripheral device
--                         is currently being accessed
-- Dev_fifo_access       - Indicates if the current access is to a FIFO
--                         within the external peripheral device
-- Dev_rnw               - Read/write control indication from IPIC interface
-- Dev_bus_multiplex     - Indicates if the currently selected device employs
--                         multiplexed bus
-- Dev_dwidth_match      - Indicates if the current device employs data
--                         width matching
-- Dev_dbus_width        - Indicates decoded value for the data bus width
-- IPIC_sync_req         - Request from the IPIC interface for an access to be
--                         generated for a synchronous peripheral
-- IP_sync_req_rst       - Request reset to the IPIC control logic
-- IP_sync_ack           - Acknowledgement to the IPIC control logic
-- IPIC_sync_ack_rst     - Acknowledgement reset from the IPIC control logic
-- IP_sync_addrack       - Address acknowledgement for synchronous access
-- IP_sync_errack        - Transaction error indication for synchronous access
-- Sync_addr_cnt_ld      - Load signal for the address suffix counter for
--                         synchronous peripheral accesses
-- Sync_addr_cnt_ce      - Enable for address suffix counter for synchronous
--                         synchronous peripheral accesses
-- Sync_en               - Indication to data steering logic to latch the
--                         read data bus
-- Sync_ce               - Indication of currently read bytes from the data
--                         steering logic
-- Steer_index           - Index for data steering
-- Dev_Rdy               - Currently selected device ready indication
--                         (Decoded from multiple PRH_RDY signal)
-- Sync_ADS              - Address strobe for synchronous access
-- Sync_CS_n             - Chip select signals for synchronous peripheral
--                         devices
-- Sync_RNW              - Read/Write control for synchronous access
-- Sync_Burst            - Burst indication for synchronous access
-- Sync_addr_ph          - Address phase indication for synchronous access
--                         in case of multiplexed address and data bus
-- Sync_data_oe          - Data bus output enable for synchronous access
-------------------------------------------------------------------------------

entity sync_cntl is
  generic (
    C_SPLB_NATIVE_DWIDTH     : integer;
    C_NUM_PERIPHERALS        : integer;
    C_PRH_CLK_SUPPORT        : integer;

    C_PRH0_ADDR_TSU          : integer;
    C_PRH1_ADDR_TSU          : integer;
    C_PRH2_ADDR_TSU          : integer;
    C_PRH3_ADDR_TSU          : integer;

    C_PRH0_ADDR_TH           : integer;
    C_PRH1_ADDR_TH           : integer;
    C_PRH2_ADDR_TH           : integer;
    C_PRH3_ADDR_TH           : integer;

    C_PRH0_ADS_WIDTH         : integer;
    C_PRH1_ADS_WIDTH         : integer;
    C_PRH2_ADS_WIDTH         : integer;
    C_PRH3_ADS_WIDTH         : integer;

    C_PRH0_RDY_WIDTH         : integer;
    C_PRH1_RDY_WIDTH         : integer;
    C_PRH2_RDY_WIDTH         : integer;
    C_PRH3_RDY_WIDTH         : integer;

    LOCAL_CLK_PERIOD_PS      : integer;
    MAX_PERIPHERALS          : integer;
    ADDRCNT_WIDTH            : integer;
    NO_PRH_SYNC              : integer;
    PRH_SYNC                 : std_logic_vector;
    NO_PRH_DWIDTH_MATCH      : integer
  );

  port (
     Bus2IP_Clk         : in  std_logic;
     Bus2IP_Rst         : in  std_logic;

     Local_Clk          : in  std_logic;
     Local_Rst          : in  std_logic;

     Bus2IP_BE          : in  std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8 -1);

     Dev_id             : in  std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     Dev_in_access      : in  std_logic;
     Dev_fifo_access    : in  std_logic;
     Dev_rnw            : in  std_logic;
     Dev_bus_multiplex  : in  std_logic;
     Dev_dwidth_match   : in  std_logic;
     Dev_dbus_width     : in  std_logic_vector(0 to 2);

     IPIC_sync_req      : in  std_logic;
     IP_sync_req_rst    : out std_logic;

     IP_sync_Wrack      : out std_logic;
     IP_sync_Rdack      : out std_logic;
     IPIC_sync_ack_rst  : in  std_logic;

     IP_sync_errack     : out std_logic;

     Sync_addr_cnt_ld   : out std_logic;
     Sync_addr_cnt_ce   : out std_logic;

     Sync_en            : out std_logic;
     Sync_ce            : in  std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8 -1);

     Steer_index        : in  std_logic_vector(0 to ADDRCNT_WIDTH-1);

     Dev_Rdy            : in  std_logic;

     Sync_ADS           : out std_logic;
     Sync_CS_n          : out std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     Sync_RNW           : out std_logic;
     Sync_Burst         : out std_logic;

     Sync_addr_ph       : out std_logic;
     Sync_data_oe       : out std_logic

    );
end entity sync_cntl;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of sync_cntl is

attribute ASYNC_REG : string;

-------------------------------------------------------------------------------
-- Function Declarations
-------------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- NAME: find_effective_max
  -----------------------------------------------------------------------------
  -- Description: Given an array and an std_logic_vector indicating if
  --              the elements of the array corresponds to synchronous
  --              access, returns the maximum of those array elements that
  --              corresponds to synchronous access.
  -----------------------------------------------------------------------------
  function find_effective_max (array_size : integer;
                               sync_identify : std_logic_vector;
                               int_array : INTEGER_ARRAY_TYPE)
                               return integer is
  variable temp : integer := 1;
  begin

    for i in 0 to (array_size-1) loop
      if sync_identify(i) = '1' then
        if int_array(i) >= temp then
          temp := int_array(i);
        end if;
      end if;
    end loop;

    return temp;
  end function find_effective_max;

  -----------------------------------------------------------------------------
  -- NAME: find_effective_cnt
  -----------------------------------------------------------------------------
  -- Description: Given a signal indicating if the current access is for
  --              synchronous device and a value,  returns the effective value
  --              corresponding to the device access.  The effective value is
  --              the  input value if the access corresponds to a synchronous
  --              device else zero.
  -----------------------------------------------------------------------------
  function find_effective_cnt(sync_identify : std_logic;
                              value : integer)
                              return integer is
  variable temp : integer := 0;
  begin

    if sync_identify = '1' then
      temp := value;
    else
      temp := 0;
    end if;

    return temp;
  end function find_effective_cnt;

-------------------------------------------------------------------------------
-- Constant Declarations
-------------------------------------------------------------------------------

constant BYTE_SIZE: integer := 8;

constant ADS_ASSERT_CNT0: integer :=
         (max2((C_PRH0_ADDR_TSU/LOCAL_CLK_PERIOD_PS),
              (C_PRH0_ADS_WIDTH/LOCAL_CLK_PERIOD_PS)));
constant ADS_ASSERT_CNT1: integer :=
         (max2((C_PRH1_ADDR_TSU/LOCAL_CLK_PERIOD_PS),
              (C_PRH1_ADS_WIDTH/LOCAL_CLK_PERIOD_PS)));
constant ADS_ASSERT_CNT2: integer :=
         (max2((C_PRH2_ADDR_TSU/LOCAL_CLK_PERIOD_PS),
              (C_PRH2_ADS_WIDTH/LOCAL_CLK_PERIOD_PS)));
constant ADS_ASSERT_CNT3: integer :=
         (max2((C_PRH3_ADDR_TSU/LOCAL_CLK_PERIOD_PS),
              (C_PRH3_ADS_WIDTH/LOCAL_CLK_PERIOD_PS)));

constant ADS_ASSERT_CNT_WIDTH0: integer := max2(1,log2(ADS_ASSERT_CNT0+1));
constant ADS_ASSERT_CNT_WIDTH1: integer := max2(1,log2(ADS_ASSERT_CNT1+1));
constant ADS_ASSERT_CNT_WIDTH2: integer := max2(1,log2(ADS_ASSERT_CNT2+1));
constant ADS_ASSERT_CNT_WIDTH3: integer := max2(1,log2(ADS_ASSERT_CNT3+1));

constant ADS_ASSERT_CNT_WIDTH_ARRAY:
         INTEGER_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
         ( find_effective_cnt(PRH_SYNC(0),ADS_ASSERT_CNT_WIDTH0),
           find_effective_cnt(PRH_SYNC(1),ADS_ASSERT_CNT_WIDTH1),
           find_effective_cnt(PRH_SYNC(2),ADS_ASSERT_CNT_WIDTH2),
           find_effective_cnt(PRH_SYNC(3),ADS_ASSERT_CNT_WIDTH3)
         );

constant MAX_ADS_ASSERT_CNT_WIDTH: integer :=
         find_effective_max(C_NUM_PERIPHERALS,
                            PRH_SYNC,
                            ADS_ASSERT_CNT_WIDTH_ARRAY);

type SLV_ADS_ASSERT_ARRAY_TYPE is array (natural range <>) of
                        std_logic_vector(0 to MAX_ADS_ASSERT_CNT_WIDTH-1);

constant ADS_ASSERT_DELAY_CNT_ARRAY:
         SLV_ADS_ASSERT_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
         ( conv_std_logic_vector(ADS_ASSERT_CNT0, MAX_ADS_ASSERT_CNT_WIDTH),
           conv_std_logic_vector(ADS_ASSERT_CNT1, MAX_ADS_ASSERT_CNT_WIDTH),
           conv_std_logic_vector(ADS_ASSERT_CNT2, MAX_ADS_ASSERT_CNT_WIDTH),
           conv_std_logic_vector(ADS_ASSERT_CNT3, MAX_ADS_ASSERT_CNT_WIDTH)
         );

constant DEV_ADS_ASSERT_ADDRCNT_RST_VAL:
         std_logic_vector(0 to MAX_ADS_ASSERT_CNT_WIDTH-1) := (others => '0');

----------------------------------------------------------------------------
constant ADS_DEASSERT_CNT0: integer := (C_PRH0_ADDR_TH/LOCAL_CLK_PERIOD_PS)+1;
constant ADS_DEASSERT_CNT1: integer := (C_PRH1_ADDR_TH/LOCAL_CLK_PERIOD_PS)+1;
constant ADS_DEASSERT_CNT2: integer := (C_PRH2_ADDR_TH/LOCAL_CLK_PERIOD_PS)+1;
constant ADS_DEASSERT_CNT3: integer := (C_PRH3_ADDR_TH/LOCAL_CLK_PERIOD_PS)+1;

constant ADS_DEASSERT_CNT_WIDTH0: integer := max2(1,log2(ADS_DEASSERT_CNT0+1));
constant ADS_DEASSERT_CNT_WIDTH1: integer := max2(1,log2(ADS_DEASSERT_CNT1+1));
constant ADS_DEASSERT_CNT_WIDTH2: integer := max2(1,log2(ADS_DEASSERT_CNT2+1));
constant ADS_DEASSERT_CNT_WIDTH3: integer := max2(1,log2(ADS_DEASSERT_CNT3+1));

constant ADS_DEASSERT_CNT_WIDTH_ARRAY:
         INTEGER_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
         ( find_effective_cnt(PRH_SYNC(0),ADS_DEASSERT_CNT_WIDTH0),
           find_effective_cnt(PRH_SYNC(1),ADS_DEASSERT_CNT_WIDTH1),
           find_effective_cnt(PRH_SYNC(2),ADS_DEASSERT_CNT_WIDTH2),
           find_effective_cnt(PRH_SYNC(3),ADS_DEASSERT_CNT_WIDTH3)
         );

constant MAX_ADS_DEASSERT_CNT_WIDTH: integer :=
         find_effective_max(C_NUM_PERIPHERALS,
                            PRH_SYNC,
                            ADS_DEASSERT_CNT_WIDTH_ARRAY);

type SLV_ADS_DEASSERT_ARRAY_TYPE is array (natural range <>) of
                        std_logic_vector(0 to MAX_ADS_DEASSERT_CNT_WIDTH-1);

constant ADS_DEASSERT_DELAY_CNT_ARRAY:
         SLV_ADS_DEASSERT_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
         ( conv_std_logic_vector(ADS_DEASSERT_CNT0, MAX_ADS_DEASSERT_CNT_WIDTH),
           conv_std_logic_vector(ADS_DEASSERT_CNT1, MAX_ADS_DEASSERT_CNT_WIDTH),
           conv_std_logic_vector(ADS_DEASSERT_CNT2, MAX_ADS_DEASSERT_CNT_WIDTH),
           conv_std_logic_vector(ADS_DEASSERT_CNT3, MAX_ADS_DEASSERT_CNT_WIDTH)
         );


constant DEV_ADS_DEASSERT_ADDRCNT_RST_VAL:
         std_logic_vector(0 to MAX_ADS_DEASSERT_CNT_WIDTH-1) := (others => '0');
------------------------------------------------------------------------------
constant RDY_CNT0: integer := (C_PRH0_RDY_WIDTH/LOCAL_CLK_PERIOD_PS)+1;
constant RDY_CNT1: integer := (C_PRH1_RDY_WIDTH/LOCAL_CLK_PERIOD_PS)+1;
constant RDY_CNT2: integer := (C_PRH2_RDY_WIDTH/LOCAL_CLK_PERIOD_PS)+1;
constant RDY_CNT3: integer := (C_PRH3_RDY_WIDTH/LOCAL_CLK_PERIOD_PS)+1;

constant RDY_CNT_WIDTH0: integer := max2(1,log2(RDY_CNT0+1));
constant RDY_CNT_WIDTH1: integer := max2(1,log2(RDY_CNT1+1));
constant RDY_CNT_WIDTH2: integer := max2(1,log2(RDY_CNT2+1));
constant RDY_CNT_WIDTH3: integer := max2(1,log2(RDY_CNT3+1));

constant RDY_CNT_WIDTH_ARRAY: INTEGER_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
         ( find_effective_cnt(PRH_SYNC(0),RDY_CNT_WIDTH0),
           find_effective_cnt(PRH_SYNC(1),RDY_CNT_WIDTH1),
           find_effective_cnt(PRH_SYNC(2),RDY_CNT_WIDTH2),
           find_effective_cnt(PRH_SYNC(3),RDY_CNT_WIDTH3)
         );

constant MAX_RDY_CNT_WIDTH: integer :=
         find_effective_max(C_NUM_PERIPHERALS, PRH_SYNC, RDY_CNT_WIDTH_ARRAY);


type SLV_RDY_ARRAY_TYPE is array (natural range <>) of
                        std_logic_vector(0 to MAX_RDY_CNT_WIDTH-1);

constant RDY_DELAY_CNT_ARRAY : SLV_RDY_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
         ( conv_std_logic_vector(RDY_CNT0, MAX_RDY_CNT_WIDTH),
           conv_std_logic_vector(RDY_CNT1, MAX_RDY_CNT_WIDTH),
           conv_std_logic_vector(RDY_CNT2, MAX_RDY_CNT_WIDTH),
           conv_std_logic_vector(RDY_CNT3, MAX_RDY_CNT_WIDTH)
         );

constant DEV_RDY_ADDRCNT_RST_VAL : std_logic_vector(0 to MAX_RDY_CNT_WIDTH-1)
                                 := (others => '0');

-------------------------------------------------------------------------------
-- Type Declarations
-------------------------------------------------------------------------------
type SYNC_SM_TYPE is (
                      IDLE,             -- common state
                      -----
                      ADS_ASSERT,       -- used for muxed logic
                      ADS_DEASSERT,     -- used for muxed logic
                      ADS_PRE_DATA_PHASE,--new addition to seperate muxed logic
                      ADS_DATA_PHASE,   --new addition
                      ADS_TURN_AROUND,  -- used for muxed logic
                      ---
                      PRE_DATA_PHASE,   -- used for non-muxed logic
                      DATA_PHASE,       -- used for non-muxed logic
                      ---
                      ACK_GEN,          -- common state
                      ERRACK_GEN,       -- common state
                      TURN_AROUND       -- common state
                      );

-------------------------------------------------------------------------------
-- Signal Declarations
-------------------------------------------------------------------------------

signal state_ns              : SYNC_SM_TYPE := IDLE;
signal state_cs              : SYNC_SM_TYPE;

signal sync_ads_i            : std_logic:='0';
signal sync_cs_i             : std_logic:='0';
signal sync_cs_n_i           : std_logic_vector(0 to C_NUM_PERIPHERALS-1) :=
                               (others => '0');

signal sync_burst_en         : std_logic:='0';
signal sync_burst_i          : std_logic:='0';

signal sync_en_i             : std_logic:='0';
signal sync_wr               : std_logic:='0';

signal next_addr_ph          : std_logic:='0';
signal next_pre_data_ph      : std_logic:='0';
signal next_data_ph          : std_logic:='0';

signal sync_data_oe_i        : std_logic:='0';

signal sync_start            : std_logic:='0';
signal sync_cycle_bit_rst    :std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8-1):=
                               (others => '0');
signal sync_cycle_bit        :std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8-1):=
                               (others => '0');
signal sync_cycle_en         : std_logic:='0';
signal sync_cycle            : std_logic:='0';

signal ack                   : std_logic:='0';
signal sync_ack              : std_logic:='0';
signal ip_sync_ack_i         : std_logic:='0';
signal local_sync_ack        : std_logic:='0';
signal local_sync_ack_rst    : std_logic:='0';
signal local_sync_ack_d1     : std_logic:='0';
signal local_sync_ack_d2     : std_logic:='0';
signal local_sync_ack_d3     : std_logic:='0';

signal errack                : std_logic:='0';
signal sync_errack           : std_logic:='0';
signal local_sync_errack     : std_logic:='0';
signal local_sync_errack_rst : std_logic:='0';
signal local_sync_errack_d1  : std_logic:='0';
signal local_sync_errack_d2  : std_logic:='0';
signal local_sync_errack_d3  : std_logic:='0';

signal dev_rdy_addrcnt_ld    : std_logic:='0';
signal dev_rdy_addrcnt_ce    : std_logic:='0';
signal dev_rdy_addrcnt       : std_logic_vector(0 to MAX_RDY_CNT_WIDTH-1) :=
                               (others => '0');
signal dev_rdy_ld_val        : std_logic_vector(0 to MAX_RDY_CNT_WIDTH-1) :=
                               (others => '0');

signal dev_ads_assert_addrcnt_ld    : std_logic:='0';
signal dev_ads_assert_addrcnt_ce    : std_logic:='0';
signal dev_ads_assert_addrcnt       :
       std_logic_vector(0 to MAX_ADS_ASSERT_CNT_WIDTH-1) := (others => '0');
                --conv_std_logic_vector(1,MAX_ADS_ASSERT_CNT_WIDTH);
signal dev_ads_assert_ld_val        :
       std_logic_vector(0 to MAX_ADS_ASSERT_CNT_WIDTH-1) := (others => '0');

constant DEV_ADS_ASSERT_ADDRCNT_ZERO:
         std_logic_vector(0 to MAX_ADS_ASSERT_CNT_WIDTH-1) :=
                          conv_std_logic_vector(1,MAX_ADS_ASSERT_CNT_WIDTH);
constant DEV_ADS_DEASSERT_ADDRCNT_ZERO:
         std_logic_vector(0 to MAX_ADS_DEASSERT_CNT_WIDTH-1) :=
                           conv_std_logic_vector(1,MAX_ADS_DEASSERT_CNT_WIDTH);
constant DEV_RDY_ADDRCNT_ZERO : std_logic_vector(0 to MAX_RDY_CNT_WIDTH-1)
                              := conv_std_logic_vector(0,MAX_RDY_CNT_WIDTH);


signal dev_ads_deassert_addrcnt_ld  : std_logic:='0';
signal dev_ads_deassert_addrcnt_ce  : std_logic:='0';
signal dev_ads_deassert_addrcnt     :
       std_logic_vector(0 to MAX_ADS_DEASSERT_CNT_WIDTH-1) := (others => '0');
signal dev_ads_deassert_ld_val      :
       std_logic_vector(0 to MAX_ADS_DEASSERT_CNT_WIDTH-1) := (others => '0');
signal sig1: std_logic;
signal sig2: std_logic;
signal temp_1_rst: std_logic;
-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------
begin

-------------------------------------------------------------------------------
-- NAME: NO_DEV_SYNC_GEN
-------------------------------------------------------------------------------
-- Description: All devices are configured as asynchronous devices
-------------------------------------------------------------------------------
NO_DEV_SYNC_GEN: if NO_PRH_SYNC = 1 generate

  IP_sync_req_rst   <= '1';
  IP_sync_Wrack     <= '0';
  IP_sync_Rdack     <= '0';
  IP_sync_errack    <= '0';

  Sync_addr_cnt_ld  <= '0';
  Sync_addr_cnt_ce  <= '0';

  Sync_en           <= '0';

  Sync_ADS          <= '0';
  Sync_CS_n         <= (others => '1');
  Sync_RNW          <= '1';
  Sync_Burst        <= '0';
  Sync_addr_ph      <= '0';
  Sync_data_oe      <= '0';

end generate NO_DEV_SYNC_GEN;


-------------------------------------------------------------------------------
-- NAME: SOME_DEV_SYNC_GEN
-------------------------------------------------------------------------------
-- Description: Some devices are configured as synchronous devices
-------------------------------------------------------------------------------
SOME_DEV_SYNC_GEN: if NO_PRH_SYNC = 0 generate

attribute ASYNC_REG : string;
attribute ASYNC_REG of I_SYNC_DEV_RDY_CNT: label is "TRUE";
begin
  -----------------------------------------------------------------------------
  -- NAME: SYNC_SM_CMB_PROCESS
  -----------------------------------------------------------------------------
  -- Description: Combinational logic for state machine.
  -----------------------------------------------------------------------------
  SYNC_SM_CMB_PROCESS : process (state_cs, Dev_bus_multiplex,
                                 Dev_dwidth_match, sync_cycle,
                                 Dev_in_access, Dev_fifo_access,
                                 IPIC_sync_req,
                                 dev_ads_assert_addrcnt,
                                 dev_ads_deassert_addrcnt,
                                 Dev_Rdy, dev_rdy_addrcnt)
  begin

    state_ns <= IDLE;

    sync_start <= '0';                     -- Assigned when next state is IDLE
    sync_en_i  <= '0';                     -- Assinged when current state is
                                           -- DATA_PHASE and Rdy is asserted

    ack <= '0';                            -- Assigned when current state is
                                           -- ACK_GEN or ERRACK_GEN
    errack <= '0';                         -- Assigned when current state is
                                           -- ERRACK_GEN

    sync_ads_i <= '0';                     -- Assigned when next state is
                                           -- ADS_ASSERT
    next_addr_ph   <= '0';                 -- Assigned when next state is
                                           -- ADS_ASSERT and ADS_DEASSERT
    next_pre_data_ph   <= '0';             -- Assigned when next state is
                                           -- PRE_DATA_PHASE

    sync_cs_i  <= '0';                     -- Assigned when next state is
    next_data_ph   <= '0';                 -- DATA_PHASE

    Sync_addr_cnt_ld  <= '0';              -- Assigned when current state is
                                           -- IDLE and next state is
                                           -- ADS_ASSERT or DATA_PHASE
    Sync_addr_cnt_ce  <= '0';              -- Assigned when current state is
                                           -- DATA_PHASE and device is ready

    dev_rdy_addrcnt_ld  <= '0';            -- Assigned when  next state is
                                           -- DATA_PHASE and not both current
                                           -- state DATA_PHASE and device not
                                           -- ready is true
    dev_rdy_addrcnt_ce  <= '0';            -- Assigned when the current state
                                           -- state is DATA_PHASE and device
                                           -- not ready

    dev_ads_assert_addrcnt_ld  <= '0';     -- Assigned when next state is
                                           -- ADS_ASSERT and the current state
                                           -- is not ADS_ASSERT
    dev_ads_assert_addrcnt_ce  <= '0';     -- Assigned when the current state
                                           -- is next state is ADS_ASSERT and
                                           -- current state is ADS_ASSERT

    dev_ads_deassert_addrcnt_ld  <= '0';   -- Assigned when next state is
                                           -- ADS_DEASSERT and the current
                                           -- state is not ADS_DEASSERT
    dev_ads_deassert_addrcnt_ce  <= '0';   -- Assigned when the next state
                                           -- is ADS_DEASSERT and current
                                           -- state is ADS_DEASSERT

    case state_cs is

      when IDLE =>
      dev_ads_assert_addrcnt_ld    <= '1';
      dev_ads_deassert_addrcnt_ld  <= '1';
      Sync_addr_cnt_ld <= '1';
        if (IPIC_sync_req = '1' and Dev_bus_multiplex = '1' and
                                                       Dev_in_access = '1')then
          sync_cs_i  <= '1'; -- added 6/26/2009
          sync_ads_i <= '1';
          next_addr_ph <= '1';
          state_ns <= ADS_ASSERT;
        elsif (IPIC_sync_req = '1' and Dev_bus_multiplex = '0' and
                                                       Dev_in_access = '1')then
          next_pre_data_ph <= '1';
          --sync_cs_i  <= '1'; -- added 6/26/2009
          dev_rdy_addrcnt_ld <= '1';
          state_ns <= PRE_DATA_PHASE;
        else
          sync_start <= '1';
          state_ns <= IDLE;
        end if;
-------------------------------
--multiplexing mode FSM states - ADS_ASSERT,ADS_DEASSERT,ADS_PRE_DATA_PHASE and
-------------------------------  ADS_DATA_PHASE
      when ADS_ASSERT =>
            sync_cs_i  <= '1'; -- added 6/26/2009
            sync_ads_i <= '1';
            next_addr_ph <= '1';
            dev_ads_assert_addrcnt_ce  <= '1';
            if (dev_ads_assert_addrcnt = DEV_ADS_ASSERT_ADDRCNT_ZERO) then
                next_addr_ph <= '1';
                dev_ads_assert_addrcnt_ce  <= '0';
                sync_ads_i <= '0'; -- added on 19th June, 09
                state_ns <= ADS_DEASSERT;
            else
                dev_ads_assert_addrcnt_ce  <= '1';
                state_ns <= ADS_ASSERT;
            end if;

      when ADS_DEASSERT =>
          sync_cs_i  <= '1'; -- added 6/26/2009
          if (dev_ads_deassert_addrcnt = DEV_ADS_DEASSERT_ADDRCNT_ZERO) then
              next_pre_data_ph <= '1';
              dev_rdy_addrcnt_ld <= '1';
              sync_cs_i  <= '0'; -- added 7/15/2009
              state_ns <= ADS_PRE_DATA_PHASE; --PRE_DATA_PHASE;
          else
             dev_ads_deassert_addrcnt_ce  <= '1';
             next_addr_ph <= '1';
             state_ns <= ADS_DEASSERT;
          end if;

      when ADS_PRE_DATA_PHASE =>
             next_data_ph <= '1';
             sync_cs_i  <= '1';
             state_ns <= ADS_DATA_PHASE;

      when ADS_DATA_PHASE =>
            sync_cs_i  <= '1';
            if (Dev_Rdy = '0') then -- Device not ready
               sync_en_i  <= '0';
               dev_rdy_addrcnt_ce  <= '1';
               if (dev_rdy_addrcnt = DEV_RDY_ADDRCNT_ZERO) then
                        state_ns <= ERRACK_GEN;
               else
                        sync_cs_i  <= '1';
                        next_data_ph <= '1';
                        state_ns <= ADS_DATA_PHASE;
               end if;
            else  -- Device ready
              sync_en_i  <= '1';
              Sync_addr_cnt_ce  <= '1';
              if (Dev_dwidth_match = '1' and sync_cycle = '1') then
                if (Dev_bus_multiplex = '1' and Dev_fifo_access = '0') then
                sync_cs_i  <= '0';
                  state_ns <= ADS_TURN_AROUND;
                else
                  dev_rdy_addrcnt_ld  <= '1';
                  sync_cs_i  <= '1';
                  next_data_ph <= '1';
                  state_ns <= ADS_DATA_PHASE;
                end if;
              else
                 state_ns <= ACK_GEN;
              end if;
           end if;

      when ADS_TURN_AROUND =>
          dev_ads_assert_addrcnt_ld  <= '1';
          dev_ads_deassert_addrcnt_ld  <= '1';
          sync_cs_i  <= '1';
          sync_ads_i <= '1';
          next_addr_ph <= '1';
          state_ns <= ADS_ASSERT;

-------------------------------
--Non-multiplexing mode FSM states-PRE_DATA_PHASE,DATA_PHASE,ADS_TURN_AROUND,
-------------------------------
      when PRE_DATA_PHASE =>
          sync_cs_i  <= '1';
          next_data_ph <= '1';
          state_ns <= DATA_PHASE;

      when DATA_PHASE =>
        -- Master abort
            if (Dev_Rdy = '0') then -- Device not ready
               sync_en_i  <= '0';
               dev_rdy_addrcnt_ce  <= '1';
               if (dev_rdy_addrcnt = DEV_RDY_ADDRCNT_ZERO) then
                        state_ns <= ERRACK_GEN;
               else
                        sync_cs_i  <= '1';
                        next_data_ph <= '1';
                        state_ns <= DATA_PHASE;
               end if;

            else  -- Device ready
              sync_en_i  <= '1';
              Sync_addr_cnt_ce  <= '1';

              if (Dev_dwidth_match = '1' and sync_cycle = '1') then
                --if (Dev_bus_multiplex = '1' and Dev_fifo_access = '0') then
                --  state_ns <= ADS_TURN_AROUND;
                --else
                  dev_rdy_addrcnt_ld  <= '1';
                  sync_cs_i  <= '1';
                  next_data_ph <= '1';
                  state_ns <= DATA_PHASE;
                --end if;
              else
                 state_ns <= ACK_GEN;
              end if;
           end if;
-- common to multiplexing and non-multiplexing states
      when ACK_GEN =>
        ack <= '1';
        state_ns <= TURN_AROUND;

      when ERRACK_GEN =>
        ack <= '1';
        errack <= '1';
        state_ns <= TURN_AROUND;

      when TURN_AROUND =>
        sync_start <= '1';
        state_ns <= IDLE;

      when others =>
    end case;
  end process SYNC_SM_CMB_PROCESS;
--------------------------------------------

  Sync_en <= sync_en_i;
  sync_wr        <= (not Dev_rnw) and next_data_ph;
  sync_data_oe_i <= Dev_in_access and ( next_addr_ph or
                                        (not Dev_rnw and next_pre_data_ph) or
                                        (not Dev_rnw and next_data_ph)
                                      );

  -----------------------------------------------------------------------------
  -- NAME: SYNC_CS_SEL_PROCESS
  -----------------------------------------------------------------------------
  -- Description: Drives an internal signal (SYNC_CS_N) from the synchronous
  --              control logic to be used as the chip select for the external
  --              peripheral device
  -----------------------------------------------------------------------------
  SYNC_CS_SEL_PROCESS: process (Dev_id,sync_cs_i) is
  begin
    sync_cs_n_i <= (others => '1');
    for i in 0 to C_NUM_PERIPHERALS-1 loop
      if (Dev_id(i) = '1') then
        sync_cs_n_i(i) <= not sync_cs_i;
      end if;
    end loop;
  end process SYNC_CS_SEL_PROCESS;

  -----------------------------------------------------------------------------
  -- NAME: SYNC_SM_REG_PROCESS
  -----------------------------------------------------------------------------
  -- Description: Register state machine outputs
  -----------------------------------------------------------------------------
  SYNC_SM_REG_PROCESS : process (Local_Clk)
  begin
    if (Local_Clk'event and Local_Clk = '1') then
      if (Local_Rst = '1') then
         Sync_ADS     <= '0';
         Sync_Burst   <= '0';
         Sync_CS_n    <= (others => '1');
         Sync_RNW     <= '1';
         Sync_addr_ph <= '0';
         Sync_data_oe <= '0';
         state_cs     <= IDLE;
      else
         Sync_ADS     <= sync_ads_i;
         Sync_CS_n    <= sync_cs_n_i;
         Sync_RNW     <= not sync_wr;
         Sync_Burst   <= sync_burst_i;
         Sync_addr_ph <= next_addr_ph;
         Sync_data_oe <= sync_data_oe_i;
         state_cs     <= state_ns;
      end if;
    end if;
  end process SYNC_SM_REG_PROCESS;


  -----------------------------------------------------------------------------
  -- NAME: NO_PRH_DWIDTH_MATCH_GEN
  -----------------------------------------------------------------------------
  -- Description: If no device employs data width matching, then generate
  --              default values for SYNC_CYCLE and SYNC_BURST_I signals
  -----------------------------------------------------------------------------
  NO_PRH_DWIDTH_MATCH_GEN : if NO_PRH_DWIDTH_MATCH = 1 generate
    sync_cycle   <= '0';
    sync_burst_i <= '0';
  end generate NO_PRH_DWIDTH_MATCH_GEN;

  -----------------------------------------------------------------------------
  -- NAME: PRH_DWIDTH_MATCH_GEN
  -----------------------------------------------------------------------------
  -- Description: If any device employs data width matching, then generate
  --              SYNC_CYCLE and SYNC_BURST_I signals
  -----------------------------------------------------------------------------
  PRH_DWIDTH_MATCH_GEN : if NO_PRH_DWIDTH_MATCH = 0 generate

    ---------------------------------------------------------------------------
    -- NAME: SYNC_CYCLE_BIT_RST_GEN
    ---------------------------------------------------------------------------
    -- Generate reset for synchronous cycle bit.
    ---------------------------------------------------------------------------

    SYNC_CYCLE_BIT_RST_GEN: for i in 0 to C_SPLB_NATIVE_DWIDTH/8-1 generate
      sync_cycle_bit_rst(i) <= Local_Rst or Sync_ce(i);
    end generate SYNC_CYCLE_BIT_RST_GEN;

    ---------------------------------------------------------------------------
    -- NAME: SYNC_CYCLE_BIT_GEN
    ---------------------------------------------------------------------------
    -- Description: Generate an indication for the byte lanes read
    ---------------------------------------------------------------------------

    SYNC_CYCLE_BIT_GEN: for i in 0 to C_SPLB_NATIVE_DWIDTH/8-1 generate
      -------------------------------------------------------------------------
      -- NAME: SYNC_CYCLE_BIT_PROCESS
      -------------------------------------------------------------------------
      -- Description: Generate an indication for the byte lanes read
      -------------------------------------------------------------------------
      SYNC_CYCLE_BIT_PROCESS: process (Local_Clk)
      begin
        if (Local_Clk'event and Local_Clk = '1') then
          if (sync_cycle_bit_rst(i) = '1' ) then
            sync_cycle_bit(i) <= '0';
          elsif (sync_start = '1') then
            sync_cycle_bit(i) <= Bus2IP_BE(i);
          end if;
        end if;
      end process SYNC_CYCLE_BIT_PROCESS;
    end generate SYNC_CYCLE_BIT_GEN;

    ---------------------------------------------------------------------------
    -- NAME: SYNC_CYCLE_EN_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Generate enable for sync cycle
    --              Enable for sync cycle is generated when the next data
    --              is to be flushed to the device. For the last access
    --              sync cycle enable will remain zero
    ---------------------------------------------------------------------------
    SYNC_CYCLE_EN_PROCESS: process(Dev_dbus_width, Steer_index,
                                   sync_cycle_bit, sync_en_i)

    variable next_access : integer;
    variable next_to_next: integer;

    variable cycle_on : std_logic;
    variable next_cycle_on : std_logic;

    begin

      sync_cycle_en <= '0';
      sync_burst_en <= '0';

      case Dev_dbus_width is

      when "001"  =>
        for i in 0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1 loop
          if steer_index = conv_std_logic_vector(i, ADDRCNT_WIDTH) then

             next_access := i+1;
             next_to_next := i+2;

             if (next_access < C_SPLB_NATIVE_DWIDTH/BYTE_SIZE) then
               cycle_on := or_reduce(sync_cycle_bit(next_access to C_SPLB_NATIVE_DWIDTH/8-1));
             else
               cycle_on := '0';
             end if;

             if (next_to_next < C_SPLB_NATIVE_DWIDTH/BYTE_SIZE) then
               next_cycle_on := or_reduce(sync_cycle_bit(next_to_next  to C_SPLB_NATIVE_DWIDTH/8-1));
             else
               next_cycle_on := '0';
             end if;

             sync_cycle_en <= cycle_on;
             sync_burst_en <= cycle_on and ((not sync_en_i) or
                                            (sync_en_i and next_cycle_on));
          end if;
        end loop;

      when "010" =>
        for i in 0 to (C_SPLB_NATIVE_DWIDTH/BYTE_SIZE)/2-1 loop
          if steer_index = conv_std_logic_vector(i, ADDRCNT_WIDTH) then

             next_access := (i+1) * 2;
             next_to_next := (i+2) * 2;

             if (next_access < C_SPLB_NATIVE_DWIDTH/BYTE_SIZE) then
               cycle_on := sync_cycle_bit(next_access) or
                           sync_cycle_bit(next_access+1);
             else
               cycle_on := '0';
             end if;
             -- coverage off
             if (next_to_next < C_SPLB_NATIVE_DWIDTH/BYTE_SIZE) then
               next_cycle_on := sync_cycle_bit(next_to_next) or
                                sync_cycle_bit(next_to_next+1);
             else
             -- coverage on
               next_cycle_on := '0';
             -- coverage off
             end if;
             -- coverage on
             sync_cycle_en <= cycle_on;
             sync_burst_en <= cycle_on and ((not sync_en_i) or
                                            (sync_en_i and next_cycle_on));

          end if;
        end loop;

      when others =>
        sync_cycle_en <= '0';
        sync_burst_en <= '0';

      end case;
    end process SYNC_CYCLE_EN_PROCESS;

    sync_cycle   <= sync_cycle_en and Dev_dwidth_match;
    sync_burst_i <= sync_burst_en and next_data_ph and Dev_dwidth_match and
                    (not Dev_bus_multiplex or Dev_fifo_access);


  end generate PRH_DWIDTH_MATCH_GEN;


  -----------------------------------------------------------------------------
  -- NAME: SYNC_ACK_NO_PRH_CLK_GEN
  -----------------------------------------------------------------------------
  -- Description: Generate data ack and error ack when the synchronous logic
  --              operates on OPB Clock. IP_SYNC_REQ_RST will not be used
  --              by ipic_if_decode logic. Drive it to default value
  -----------------------------------------------------------------------------
  SYNC_ACK_NO_PRH_CLK_GEN: if C_PRH_CLK_SUPPORT = 0 generate


    IP_sync_req_rst <= '1';

    ---------------------------------------------------------------------------
    -- NAME: SYNC_ACK_NO_PRH_CLK_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Generate data ack and error ack when the synchronous logic
    --              operates on OPB Clock.
    ---------------------------------------------------------------------------

    SYNC_ACK_NO_PRH_CLK_PROCESS : process (Local_Clk)
    begin
      if (Local_Clk'event and Local_Clk = '1') then
        if (Local_Rst = '1') then
          ip_sync_ack_i <= '0';
          IP_sync_errack <= '0';
        else
          ip_sync_ack_i <= ack;
          IP_sync_errack <= errack;
        end if;
      end if;
    end process  SYNC_ACK_NO_PRH_CLK_PROCESS;


  end generate SYNC_ACK_NO_PRH_CLK_GEN;

  -----------------------------------------------------------------------------
  -- NAME: SYNC_ACK_PRH_CLK_GEN
  -----------------------------------------------------------------------------
  -- Description: Generate data ack, error ack and reset for synchronos
  --              request when the synchronous logic operates on peripheral
  --              clock
  -----------------------------------------------------------------------------
  SYNC_ACK_PRH_CLK_GEN: if C_PRH_CLK_SUPPORT = 1 generate

    attribute ASYNC_REG of REG_SYNC_ACK: label is "TRUE";
    attribute ASYNC_REG of REG_SYNC_ERRACK: label is "TRUE";

  begin

   ----------------------------------------------------------------------------
   -- NAME: SYNC_REQ_RST_PROCESS
   ----------------------------------------------------------------------------
   -- Description: Generate reset for synchronous request when the synchronous
   --              control operates on peripheral clock.
   ----------------------------------------------------------------------------
   SYNC_REQ_RST_PROCESS : process (state_cs)
   begin
     if (state_cs = ACK_GEN or state_cs = ERRACK_GEN) then
       IP_sync_req_rst <= '1';
     else
       IP_sync_req_rst <= '0';
     end if;
   end process SYNC_REQ_RST_PROCESS;

    ---------------------------------------------------------------------------
    -- NAME: SYNC_ACK_PRH_CLK_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Generate data ack and error ack when the synchronous logic
    --              operates on peripheral clock.
    ---------------------------------------------------------------------------
    SYNC_ACK_PRH_CLK_PROCESS : process (Local_Clk)
    begin
      if (Local_Clk'event and Local_Clk = '1') then
        if (Local_Rst = '1') then
          sync_ack <= '0';
          sync_errack <= '0';
        else
          sync_ack <= ack;
          sync_errack <= errack;
        end if;
      end if;
    end process  SYNC_ACK_PRH_CLK_PROCESS;

    ---------------------------------------------------------------------------
    -- NAME: ACK_HOLD_GEN_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Latch in the synchronous data ack until it is reset by the
    --              ipic_if_decode logic
    ---------------------------------------------------------------------------
    temp_1_rst <= Bus2IP_Rst or IPIC_sync_ack_rst;

    ACK_HOLD_GEN_PROCESS : process (Bus2IP_Clk)
    begin
      if(Bus2IP_Clk'event and Bus2IP_Clk = '1') then
        if(temp_1_rst = '1') then
                sig1 <= '0';
        elsif(sync_ack = '1') then
                sig1 <= '1';
        end if;
      end if;
    end process ACK_HOLD_GEN_PROCESS;
local_sync_ack <= sync_ack or ( sig1 and (not temp_1_rst));
--------------------------------------------------------------------------------
    local_sync_ack_rst <= Bus2IP_Rst or IPIC_sync_ack_rst;

    REG_SYNC_ACK: component FDRE
      port map (
                 Q  => local_sync_ack_d1,
                 C  => Bus2IP_Clk,
                 CE => '1',
                 D  => local_sync_ack,
                 R  => local_sync_ack_rst
               );


    ---------------------------------------------------------------------------
    -- NAME: ERRACK_HOLD_GEN_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Latch in the synchronous error ack until it is reset by the
    --              ipic_if_decode logic
    ---------------------------------------------------------------------------
    ERRACK_HOLD_GEN_PROCESS : process (Bus2IP_Clk)
    begin
      if(Bus2IP_Clk'event and Bus2IP_Clk = '1') then
        if(temp_1_rst = '1') then
                sig2 <= '0';
        elsif(sync_errack = '1') then
                sig2 <= '1';
        end if;
      end if;
    end process ERRACK_HOLD_GEN_PROCESS;
local_sync_errack <= sync_errack or (sig2 and (not temp_1_rst));
--------------------------------------------------------------------------------

    REG_SYNC_ERRACK: component FDRE
      port map (
                 Q  => local_sync_errack_d1,
                 C  => Bus2IP_Clk,
                 CE => '1',
                 D  => local_sync_errack,
                 R  => local_sync_ack_rst
               );

    ---------------------------------------------------------------------------
    -- NAME: DOUBLE_SYNC_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Double synchronize data ack and error ack
    ---------------------------------------------------------------------------
    DOUBLE_SYNC_PROCESS: process(Bus2IP_Clk)
    begin

      if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
        if (local_sync_ack_rst = '1') then
          local_sync_ack_d2 <= '0';
          local_sync_ack_d3 <= '0';

          local_sync_errack_d2 <= '0';
          local_sync_errack_d3 <= '0';
        else
          local_sync_ack_d2 <= local_sync_ack_d1;
          local_sync_ack_d3 <= local_sync_ack_d2;

          local_sync_errack_d2 <= local_sync_errack_d1;
          local_sync_errack_d3 <= local_sync_errack_d2;
        end if;
      end if;
    end process DOUBLE_SYNC_PROCESS;

    -- Generate a pulse for data ack and error ack when the synchronous
    -- logic operates on peripheral clock
    ip_sync_ack_i <= local_sync_ack_d2 and not local_sync_ack_d3;
    IP_sync_errack <= local_sync_errack_d2 and not local_sync_errack_d3;

  end generate SYNC_ACK_PRH_CLK_GEN;

  -----------------------------------------------------------------------------
  -- NAME: DEV_ADS_ASSERT_CNT_SEL_PROCESS
  -----------------------------------------------------------------------------
  -- Description: Selects the device ADS assert width count for the currently
  --              selected device
  -----------------------------------------------------------------------------
  DEV_ADS_ASSERT_CNT_SEL_PROCESS: process (Dev_id) is
  begin
    dev_ads_assert_ld_val <= (others => '0');
    for i in 0 to C_NUM_PERIPHERALS-1 loop
      if (Dev_id(i) = '1') then
         dev_ads_assert_ld_val <= ADS_ASSERT_DELAY_CNT_ARRAY(i);
      end if;
    end loop;
  end process DEV_ADS_ASSERT_CNT_SEL_PROCESS;

  -- Generate a counter for device ADS assert delay count
  I_SYNC_DEV_ADS_ASSERT_CNT: entity axi_epc_v2_0_23.ld_arith_reg
    generic map ( C_ADD_SUB_NOT  => false,
                  C_REG_WIDTH    => MAX_ADS_ASSERT_CNT_WIDTH,
                  C_RESET_VALUE  => DEV_ADS_ASSERT_ADDRCNT_RST_VAL,
                  C_LD_WIDTH     => MAX_ADS_ASSERT_CNT_WIDTH,
                  C_LD_OFFSET    => 0,
                  C_AD_WIDTH     => 1,
                  C_AD_OFFSET    => 0
              )
    port map ( CK             => Local_Clk,
               RST            => Local_Rst,
               Q              => dev_ads_assert_addrcnt,
               LD             => dev_ads_assert_ld_val,
               AD             => "1",
               LOAD           => dev_ads_assert_addrcnt_ld,
               OP             => dev_ads_assert_addrcnt_ce
              );


  -----------------------------------------------------------------------------
  -- NAME: DEV_ADS_DEASSERT_CNT_SEL_PROCESS
  -----------------------------------------------------------------------------
  -- Description: Selects the device ADS deassert width count for the currently
  --              selected device
  -----------------------------------------------------------------------------
  DEV_ADS_DEASSERT_CNT_SEL_PROCESS: process (Dev_id) is
  begin
    dev_ads_deassert_ld_val <= (others => '0');
    for i in 0 to C_NUM_PERIPHERALS-1 loop
      if (Dev_id(i) = '1') then
         dev_ads_deassert_ld_val <= ADS_DEASSERT_DELAY_CNT_ARRAY(i);
      end if;
    end loop;
  end process DEV_ADS_DEASSERT_CNT_SEL_PROCESS;

  -- Generate a counter for device ADS deassert delay count
  I_SYNC_DEV_ADS_DEASSERT_CNT: entity axi_epc_v2_0_23.ld_arith_reg
    generic map ( C_ADD_SUB_NOT  => false,
                  C_REG_WIDTH    => MAX_ADS_DEASSERT_CNT_WIDTH,
                  C_RESET_VALUE  => DEV_ADS_DEASSERT_ADDRCNT_RST_VAL,
                  C_LD_WIDTH     => MAX_ADS_DEASSERT_CNT_WIDTH,
                  C_LD_OFFSET    => 0,
                  C_AD_WIDTH     => 1,
                  C_AD_OFFSET    => 0
              )
    port map ( CK             => Local_Clk,
               RST            => Local_Rst,
               Q              => dev_ads_deassert_addrcnt,
               LD             => dev_ads_deassert_ld_val,
               AD             => "1",
               LOAD           => dev_ads_deassert_addrcnt_ld,
               OP             => dev_ads_deassert_addrcnt_ce
              );


  -----------------------------------------------------------------------------
  -- NAME: DEV_RDY_CNT_SEL_PROCESS
  -----------------------------------------------------------------------------
  -- Description: Selects the device ready width count for the currently
  --              selected device
  -----------------------------------------------------------------------------
  DEV_RDY_CNT_SEL_PROCESS: process (Dev_id) is
  begin
    dev_rdy_ld_val <= (others => '0');
    for i in 0 to C_NUM_PERIPHERALS-1 loop
      if (Dev_id(i) = '1') then
         dev_rdy_ld_val <= RDY_DELAY_CNT_ARRAY(i);
      end if;
    end loop;
  end process DEV_RDY_CNT_SEL_PROCESS;

  -- Generate a counter for device ready delay count
  I_SYNC_DEV_RDY_CNT: entity axi_epc_v2_0_23.ld_arith_reg
    generic map ( C_ADD_SUB_NOT  => false,
                  C_REG_WIDTH    => MAX_RDY_CNT_WIDTH,
                  C_RESET_VALUE  => DEV_RDY_ADDRCNT_RST_VAL,
                  C_LD_WIDTH     => MAX_RDY_CNT_WIDTH,
                  C_LD_OFFSET    => 0,
                  C_AD_WIDTH     => 1,
                  C_AD_OFFSET    => 0
              )
    port map ( CK             => Local_Clk,
               RST            => Local_Rst,
               Q              => dev_rdy_addrcnt,
               LD             => dev_rdy_ld_val,
               AD             => "1",
               LOAD           => dev_rdy_addrcnt_ld,
               OP             => dev_rdy_addrcnt_ce
              );

------------------------------------------------------------------------------
-- Qualify the PLB read and write ack

IP_sync_Wrack <= ip_sync_ack_i and (not Dev_rnw);
IP_sync_Rdack <= (ip_sync_ack_i and Dev_rnw);
------------------------------------------------------------------------------
end generate SOME_DEV_SYNC_GEN;
------------------------------------------------------------------------------

end architecture imp;
------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- ipic_if_decode.vhd - entity/architecture pair
-------------------------------------------------------------------------------
-- ************************************************************************
-- ** DISCLAIMER OF LIABILITY                                            **
-- **                                                                    **
-- ** This file contains proprietary and confidential information of     **
-- ** Xilinx, Inc. ("Xilinx"), that is distributed under a license       **
-- ** from Xilinx, and may be used, copied and/or disclosed only         **
-- ** pursuant to the terms of a valid license agreement with Xilinx.    **
-- **                                                                    **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION              **
-- ** ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER         **
-- ** EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT                **
-- ** LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,          **
-- ** MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx      **
-- ** does not warrant that functions included in the Materials will     **
-- ** meet the requirements of Licensee, or that the operation of the    **
-- ** Materials will be uninterrupted or error-free, or that defects     **
-- ** in the Materials will be corrected. Furthermore, Xilinx does       **
-- ** not warrant or make any representations regarding use, or the      **
-- ** results of the use, of the Materials in terms of correctness,      **
-- ** accuracy, reliability or otherwise.                                **
-- **                                                                    **
-- ** Xilinx products are not designed or intended to be fail-safe,      **
-- ** or for use in any application requiring fail-safe performance,     **
-- ** such as life-support or safety devices or systems, Class III       **
-- ** medical devices, nuclear facilities, applications related to       **
-- ** the deployment of airbags, or any other applications that could    **
-- ** lead to death, personal injury or severe property or               **
-- ** environmental damage (individually and collectively, "critical     **
-- ** applications"). Customer assumes the sole risk and liability       **
-- ** of any use of Xilinx products in critical applications,            **
-- ** subject only to applicable laws and regulations governing          **
-- ** limitations on product liability.                                  **
-- **                                                                    **
-- ** Copyright 2005, 2006, 2008, 2009 Xilinx, Inc.                      **
-- ** All rights reserved.                                               **
-- **                                                                    **
-- ** This disclaimer and copyright notice must be retained as part      **
-- ** of this file at all times.                                         **
-- ************************************************************************
-------------------------------------------------------------------------------
-- File          : ipic_if_decode.vhd
-- Company       : Xilinx
-- Version       : v1.00.a
-- Description   : External Peripheral Controller for AXI bus ipif decode logic
-- Standard      : VHDL-93
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Structure:
--             axi_epc.vhd
--               -axi_lite_ipif
--               -epc_core.vhd
--               -ipic_if_decode.vhd
--               -sync_cntl.vhd
--               -async_cntl.vhd
--                  -- async_counters.vhd
--                  -- async_statemachine.vhd
--               -address_gen.vhd
--               -data_steer.vhd
--               -access_mux.vhd
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Author   : VB
-- History  :
--
--  VB           08-24-2010 --  v2_0 version for AXI
-- ^^^^^^
--            The core updated for AXI based on xps_epc_v1_02_a
-- ~~~~~~
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_misc.or_reduce;

library unisim;
use unisim.vcomponents.FDRE;

-------------------------------------------------------------------------------
--                     Definition of Generics                                --
-------------------------------------------------------------------------------
-- C_SPLB_DWIDTH             -  Data width of PLB BUS.
-- C_NUM_PERIPHERALS        -  No of peripherals supported by external
--                             peripheral controller in the current
--                             configuration
-- C_PRH_CLK_SUPPORT        -  Indication of whether the synchronous interface
--                             operates on peripheral clock or on PLB clock
-- C_PRH(0:3)_DWIDTH_MATCH  -  Indication of whether external peripheral (0:3)
--                             supports multiple access cycle on the
--                             peripheral interface for a single PLB cycle
--                             when the peripheral data bus width is less than
--                             that of PLB bus data width
-- C_PRH(0:3)_DWIDTH        -  External peripheral (0:3) data bus width
-- MAX_PERIPHERALS          -  Maximum number of peripherals supported by the
--                             external peripheral controller
-- NO_PRH_SYNC              -  Indicates all devices are configured for
--                             asynchronous interface
-- NO_PRH_ASYNC             -  Indicates all devices are configured for
--                             synchronous interface
-- PRH_SYNC                 -  Indicates if the devices are configured for
--                             asynchronous or synchronous interface
-- NO_PRH_BUS_MULTIPLEX     -  Indicates that no device is employing
--                             multiplexed bus
-- PRH_BUS_MULTIPLEX        -  Indicates if each of the external device
--                             is configured for multiplexed bus or not
-- NO_PRH_DWIDTH_MATCH      -  Indication that no device is employing data
--                             width matching
-- PRH_DWIDTH_MATCH         -  Indicates if each of the external device
--                             is configured for data width matching or not
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--                     Definition of Ports                                   --
-------------------------------------------------------------------------------
-- Bus2IP_Clk            - IPIC clock
-- Bus2IP_Rst            - IPIC reset

-- Local_Clk             - Operational clock for peripheral interface
-- Local_Rst             - Reset for peripheral interface

-- Bus2IP_CS             - IPIC chip select signals
-- Bus2IP_RNW            - IPIC read/write control

-- IP2Bus_WrAck          - Write data acknowledgment to IPIC interface
-- IP2Bus_RdAck          - Read data acknowledgment to IPIC interface
-- IP2Bus_Error          - Error indication to IPIC interface

-- FIFO_access           - Indicates if the current access is to a FIFO
--                       - within the external peripheral device

-- Dev_id                - The decoded identification vector for the currently
--                       - selected device
-- Dev_fifo_access       - Indicates if the current access is to a FIFO
--                         within the external peripheral device. Registered
--                         output of FIFO_access
-- Dev_in_access         - Indicates if any of the peripheral device is
--                         currently being accessed
-- Dev_sync_in_access    - Indicates if any of synchronous the peripheral
--                         device is currently being accessed
-- Dev_async_in_access   - Indicates if any of asynchronous the peripheral
--                         device is currently being accessed
-- Dev_sync              - Indicates if the current device being accessed
--                         is synchronous device
-- Dev_rnw               - Read/write control indication
-- Dev_bus_multiplex     - Indicates if the currently selected device employs
--                         multiplexed bus
-- Dev_dwidth_match      - Indicates if the current device employs data
--                         width matching
-- Dev_dbus_width        - Indicates decoded value for the data bus
-- IPIC_sync_req         - Request to the synchronous control logic
-- IP_sync_req_rst       - Request reset from the synchronous control logic
-- IPIC_async_req        - Request to the asynchronous control logic
-- IP_sync_ack           - Acknowledgement from the synchronous control logic
-- IPIC_sync_ack_rst     - Acknowledgement reset to the synchronous control
-- IP_async_ack          - Acknowledgement from the asynchronous control logic

-- IP_async_addrack      - Address acknowledgement for asynchronous access from
--                         the asynchronous control logic

-- IP_sync_error        - Error indication for synchronous access from
--                         the synchronous control logic
-- IP_async_error       - Error indication for asynchronous access from
--                         the asynchronous control logic

-------------------------------------------------------------------------------


entity ipic_if_decode is
  generic (
      C_SPLB_DWIDTH            : integer;

      C_NUM_PERIPHERALS        : integer;
      C_PRH_CLK_SUPPORT        : integer;

      C_PRH0_DWIDTH_MATCH      : integer;
      C_PRH1_DWIDTH_MATCH      : integer;
      C_PRH2_DWIDTH_MATCH      : integer;
      C_PRH3_DWIDTH_MATCH      : integer;

      C_PRH0_DWIDTH            : integer;
      C_PRH1_DWIDTH            : integer;
      C_PRH2_DWIDTH            : integer;
      C_PRH3_DWIDTH            : integer;

      MAX_PERIPHERALS          : integer;
      NO_PRH_SYNC              : integer;
      NO_PRH_ASYNC             : integer;
      PRH_SYNC                 : std_logic_vector;

      NO_PRH_BUS_MULTIPLEX     : integer;
      PRH_BUS_MULTIPLEX        : std_logic_vector;
      NO_PRH_DWIDTH_MATCH      : integer;
      PRH_DWIDTH_MATCH         : std_logic_vector
    );

  port (

     Bus2IP_Clk          : in  std_logic;
     Bus2IP_Rst          : in  std_logic;

     Local_Clk           : in  std_logic;
     Local_Rst           : in  std_logic;

     -- IPIC interface
     Bus2IP_CS           : in  std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     Bus2IP_RNW          : in  std_logic;

     IP2Bus_WrAck        : out std_logic;
     IP2Bus_RdAck        : out std_logic;
     IP2Bus_Error        : out std_logic;

     FIFO_access         : in  std_logic;

     Dev_id              : out std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     Dev_fifo_access     : out std_logic;
     Dev_in_access       : out std_logic;
     Dev_sync_in_access  : out std_logic;
     Dev_async_in_access : out std_logic;
     Dev_sync            : out std_logic;
     Dev_rnw             : out std_logic;
     Dev_bus_multiplex   : out std_logic;
     Dev_dwidth_match    : out std_logic;
     Dev_dbus_width      : out std_logic_vector(0 to 2);

     -- Local interface
     IPIC_sync_req       : out std_logic;
     IPIC_async_req      : out std_logic;
     IP_sync_req_rst     : in  std_logic;

     IP_sync_Wrack       : in std_logic;
     IP_sync_Rdack       : in std_logic;
     IPIC_sync_ack_rst   : out std_logic;

     IP_async_Wrack      : in  std_logic;
     IP_async_Rdack      : in  std_logic;

     IP_sync_error       : in  std_logic;
     IP_async_error      : in  std_logic
    );


end entity ipic_if_decode;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of ipic_if_decode is

attribute ASYNC_REG : string;

-------------------------------------------------------------------------------
-- Function Declarations
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- NAME: get_dbus_width
-------------------------------------------------------------------------------
-- Description: Generate a decoded value of type std_logic_vector
--              corresponding to the current data bus width of the device
-------------------------------------------------------------------------------

function get_dbus_width(prh_width     : integer)
                        return std_logic_vector is

  variable decoded_dbus_width : std_logic_vector(0 to 2);

begin

  case prh_width is
    when 8  =>
      decoded_dbus_width := "001";
    when 16 =>
      decoded_dbus_width := "010";
    when 32 =>
      decoded_dbus_width := "100";
    -- coverage off
    when others =>
      decoded_dbus_width := (others => '0');
    -- coverage on
  end case;

  return decoded_dbus_width;
end function get_dbus_width;

-------------------------------------------------------------------------------
-- Type Declarations
-------------------------------------------------------------------------------

type SLV3_ARRAY_TYPE is array (natural range <>) of std_logic_vector(0 to 2);

-------------------------------------------------------------------------------
-- Constant Declarations
-------------------------------------------------------------------------------
constant PRH_DBUS_WIDTH : SLV3_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
    (get_dbus_width(C_PRH0_DWIDTH),
     get_dbus_width(C_PRH1_DWIDTH),
     get_dbus_width(C_PRH2_DWIDTH),
     get_dbus_width(C_PRH3_DWIDTH));

-------------------------------------------------------------------------------
-- Signal Declarations
-------------------------------------------------------------------------------

signal dev_in_access_int     : std_logic := '0';
signal dev_in_access_int_d1  : std_logic := '0';

signal access_start          : std_logic := '0';

signal ip_async_Wrack_d1     : std_logic := '0';
signal ip_async_Wrack_d2     : std_logic := '0';
signal ip_async_Wrack_d3     : std_logic := '0';
signal ip_async_Wrack_d4     : std_logic := '0';

signal ip_async_Rdack_d1     : std_logic := '0';
signal ip_async_Rdack_d2     : std_logic := '0';
signal ip_async_Rdack_d3     : std_logic := '0';
signal ip_async_Rdack_d4     : std_logic := '0';

signal async_access_on       : std_logic := '0';
signal async_req             : std_logic := '0';
signal local_async_req       : std_logic := '0';

signal ip_sync_Wrack_d1      : std_logic := '0';
signal ip_sync_Wrack_d2      : std_logic := '0';
signal ip_sync_Wrack_d3      : std_logic := '0';
signal ip_sync_Wrack_d4      : std_logic := '0';

signal ip_sync_Rdack_d1      : std_logic := '0';
signal ip_sync_Rdack_d2      : std_logic := '0';
signal ip_sync_Rdack_d3      : std_logic := '0';
signal ip_sync_Rdack_d4      : std_logic := '0';

signal sync_access_on        : std_logic := '0';
signal sync_req              : std_logic := '0';
signal local_sync_req        : std_logic := '0';


signal sync_req_d1           : std_logic := '0';
signal local_sync_req_rst    : std_logic := '0';
signal local_sync_req_d1     : std_logic := '0';
signal local_sync_req_d2     : std_logic := '0';
signal local_sync_req_d3     : std_logic := '0';

signal dev_sync_int          : std_logic := '0';
signal dev_sync_i            : std_logic := '0';

signal dev_burst_i           : std_logic := '0';

signal dev_bus_multiplex_int : std_logic := '0';
signal dev_bus_multiplex_i   : std_logic := '0';

signal dev_dwidth_match_int  : std_logic := '0';
signal dev_dwidth_match_i    : std_logic := '0';

signal dev_dbus_width_int    : std_logic_vector(0 to 2)
                             := (others => '0');
signal dev_dbus_width_i      : std_logic_vector(0 to 2)
                             := (others => '0');

signal ip2bus_Wrack_i        : std_logic := '0';
signal ip2bus_Rdack_i        : std_logic := '0';
signal temp_i                : std_logic;
signal local_sync_req_i      : std_logic;
-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------
begin

-- DEV_IN_ACCESS_INT indicates that the PLB EPC is currently accessing an
-- external peripheral device
dev_in_access_int <= or_reduce(Bus2IP_CS(0 to C_NUM_PERIPHERALS-1));

---------------------------------------------------------------------------
-- NAME: REG_IPIC_PROCESS
---------------------------------------------------------------------------
-- Description: Register the ipic signal for the local interface.
--              These signals are not stable in case of abort. Therefore,
--              registering is required
---------------------------------------------------------------------------
REG_IPIC_PROCESS : process (Bus2IP_Clk) is
begin
  if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
     if (Bus2IP_Rst = '1') then
        Dev_id  <= (others => '0');
        Dev_fifo_access <= '0';
        Dev_rnw <= '1';
     else
        if (access_start = '1') then
          Dev_id  <= Bus2IP_CS;
          Dev_fifo_access <= FIFO_access;
          Dev_rnw <= Bus2IP_RNW;
        end if;
     end if;
   end if;
end process REG_IPIC_PROCESS;

-------------------------------------------------------------------------------
-- NAME: NO_DEV_SYNC_GEN
-------------------------------------------------------------------------------
-- Description: Tie DEV_SYNC to low if there are no synchronous external
--              peripheral device
-------------------------------------------------------------------------------
NO_DEV_SYNC_GEN: if NO_PRH_SYNC = 1 generate
   dev_sync_int <= '0';
   Dev_sync     <= '0';
end generate NO_DEV_SYNC_GEN;

-------------------------------------------------------------------------------
-- NAME: DEV_SYNC_GEN
-------------------------------------------------------------------------------
-- Description: Generate DEV_SYNC if there are external peripheral devices
--              that are configured as synchronous
-------------------------------------------------------------------------------
DEV_SYNC_GEN: if NO_PRH_SYNC = 0 generate

  --------------------------------------------------------------------------
  -- NAME: DEV_SYNC_PROCESS
  --------------------------------------------------------------------------
  -- Description: Generate DEV_SYNC_INT if the current access corresponds to
  --              synchronous external peripheral device
  --------------------------------------------------------------------------
  DEV_SYNC_PROCESS: process (Bus2IP_CS)
  begin
    dev_sync_int <= '0';
    for i in 0 to C_NUM_PERIPHERALS-1 loop
      if (Bus2IP_CS(i) = '1') then
         dev_sync_int <= PRH_SYNC(i);
      end if;
    end loop;
  end process DEV_SYNC_PROCESS;

  ---------------------------------------------------------------------------
  -- NAME: REG_DEV_SYNC_PROCESS
  ---------------------------------------------------------------------------
  -- Description: Register the device synchronous indication signal
  --              DEV_SYNC_INT
  ---------------------------------------------------------------------------
  REG_DEV_SYNC_PROCESS : process(Bus2IP_Clk) is
  begin
    if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
       if (Bus2IP_Rst = '1') then
          dev_sync_i <= '0';
       else
          if (access_start = '1') then
            dev_sync_i <= dev_sync_int;
          end if;
       end if;
     end if;
  end process REG_DEV_SYNC_PROCESS;

  Dev_sync <= dev_sync_i;

end generate DEV_SYNC_GEN;

-------------------------------------------------------------------------------
-- NAME: NO_DEV_BUS_MULTIPLEX_GEN
-------------------------------------------------------------------------------
-- Description: Tie DEV_BUS_MULTIPLEX to low when no external device is
--              employing bus multiplexing
-------------------------------------------------------------------------------
NO_DEV_BUS_MULTIPLEX_GEN: if NO_PRH_BUS_MULTIPLEX = 1 generate
  Dev_bus_multiplex <= '0';
end generate NO_DEV_BUS_MULTIPLEX_GEN;

-------------------------------------------------------------------------------
-- NAME: DEV_BUS_MULTIPLEX_GEN
-------------------------------------------------------------------------------
-- Description: Generate DEV_BUS_MULTIPLEX when any of the external device is
--              employing bus multiplexing
-------------------------------------------------------------------------------
DEV_BUS_MULTIPLEX_GEN: if NO_PRH_BUS_MULTIPLEX = 0 generate

  -----------------------------------------------------------------------------
  -- NAME: DEV_BUS_MULTIPLEX_PROCESS
  -----------------------------------------------------------------------------
  -- Description: Generate DEV_BUS_MULTIPLEX_INT if the currently selected
  --              device employs bus multiplexing
  -----------------------------------------------------------------------------
  DEV_BUS_MULTIPLEX_PROCESS: process (Bus2IP_CS) is
  begin
    dev_bus_multiplex_int <= '0';
    for i in 0 to C_NUM_PERIPHERALS-1 loop
      if (Bus2IP_CS(i) = '1') then
        dev_bus_multiplex_int <= PRH_BUS_MULTIPLEX(i);
      end if;
    end loop;
  end process DEV_BUS_MULTIPLEX_PROCESS;

  ---------------------------------------------------------------------------
  -- NAME: REG_DEV_BUS_MULTIPLEX_PROCESS
  ---------------------------------------------------------------------------
  -- Description: Register the device bus multiplex indication signal,
  --              DEV_BUS_MULTIPLEX_INT
  ---------------------------------------------------------------------------
  REG_DEV_BUS_MULTIPLEX_PROCESS : process(Bus2IP_Clk) is
  begin
    if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
       if (Bus2IP_Rst = '1') then
          dev_bus_multiplex_i <= '0';
       else
          if (access_start = '1') then
            dev_bus_multiplex_i <= dev_bus_multiplex_int;
          end if;
       end if;
     end if;
  end process REG_DEV_BUS_MULTIPLEX_PROCESS;

  Dev_bus_multiplex <= dev_bus_multiplex_i;

end generate DEV_BUS_MULTIPLEX_GEN;


-------------------------------------------------------------------------------
-- NAME: NO_DEV_DWIDTH_MATCH_GEN
-------------------------------------------------------------------------------
-- Description: Tie DEV_DWIDTH_MATCH to low if data bus width matching is
--              not enabled for any of the external peripheral device
-------------------------------------------------------------------------------
NO_DEV_DWIDTH_MATCH_GEN: if NO_PRH_DWIDTH_MATCH = 1 generate
   Dev_dwidth_match <= '0';
end generate NO_DEV_DWIDTH_MATCH_GEN;

-------------------------------------------------------------------------------
-- NAME: DEV_DWIDTH_MATCH_GEN
-------------------------------------------------------------------------------
-- Description: Generate DEV_DWIDTH_MATCH if data bus width matching is
--              enabled for any external peripheral device
-------------------------------------------------------------------------------
DEV_DWIDTH_MATCH_GEN: if NO_PRH_DWIDTH_MATCH = 0 generate

  -----------------------------------------------------------------------------
  -- NAME: DEV_DWIDTH_MATCH_PROCESS
  -----------------------------------------------------------------------------
  -- Description: Generate DEV_DWIDTH_MATCH_INT for the currently selected
  --              device. DEV_DWIDTH_MATCH_INT indicates if the current device
  --              employs datawidth matching
  -----------------------------------------------------------------------------
  DEV_DWIDTH_MATCH_PROCESS: process (Bus2IP_CS) is
  begin
    Dev_dwidth_match_int <= '0';
    for i in 0 to C_NUM_PERIPHERALS-1 loop
      if (Bus2IP_CS(i) = '1') then
        Dev_dwidth_match_int <= PRH_DWIDTH_MATCH(i);
      end if;
    end loop;
  end process DEV_DWIDTH_MATCH_PROCESS;

  ---------------------------------------------------------------------------
  -- NAME: REG_DEV_DWIDTH_MATCH_PROCESS
  ---------------------------------------------------------------------------
  -- Description: Register the device dwidth match indication signal,
  --              DEV_DWIDTH_MATCH_INT
  ---------------------------------------------------------------------------
  REG_DEV_DWIDTH_MATCH_PROCESS : process(Bus2IP_Clk) is
  begin
    if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
       if (Bus2IP_Rst = '1') then
          dev_dwidth_match_i <= '0';
       else
          if (access_start = '1') then
            dev_dwidth_match_i <= dev_dwidth_match_int;
          end if;
       end if;
     end if;
  end process REG_DEV_DWIDTH_MATCH_PROCESS;

  Dev_dwidth_match <= dev_dwidth_match_i;

end generate DEV_DWIDTH_MATCH_GEN;

-------------------------------------------------------------------------------
-- NAME: DEV_DBUS_WIDTH_PROCESS
-------------------------------------------------------------------------------
-- Description: Generate DEV_DBUS_WIDTH_INT for the currently selected device
--              DEV_DBUS_WIDTH_INT indicates the data bus width of the
--              currently selected device
-------------------------------------------------------------------------------
DEV_DBUS_WIDTH_PROCESS: process (Bus2IP_CS) is
begin
  dev_dbus_width_int <= (others => '0');
  for i in 0 to C_NUM_PERIPHERALS-1 loop
    if (Bus2IP_CS(i) = '1') then
      dev_dbus_width_int <= PRH_DBUS_WIDTH(i);
    end if;
  end loop;
end process DEV_DBUS_WIDTH_PROCESS;

---------------------------------------------------------------------------
-- NAME: REG_DEV_DBUS_WIDTH_PROCESS
---------------------------------------------------------------------------
-- Description: Register the decoded value of device data bus width,
--              DEV_DBUS_WIDTH_INT
---------------------------------------------------------------------------
REG_DEV_DBUS_WIDTH_PROCESS : process(Bus2IP_Clk)
begin
  if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
     if (Bus2IP_Rst = '1') then
        dev_dbus_width_i <= (others => '0');
     else
       if (access_start = '1') then
         dev_dbus_width_i <= dev_dbus_width_int;
       end if;
     end if;
   end if;
end process REG_DEV_DBUS_WIDTH_PROCESS;

Dev_dbus_width <= dev_dbus_width_i;

-------------------------------------------------------------------------------
-- NAME: ACCESS_START_PROCESS
-------------------------------------------------------------------------------
-- Description: Register the start of the transaction
-------------------------------------------------------------------------------
ACCESS_START_PROCESS : process(Bus2IP_Clk)
begin
  if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
    if (Bus2IP_Rst = '1')then
      dev_in_access_int_d1 <= '0';
    else
      dev_in_access_int_d1 <= dev_in_access_int;
    end if;
  end if;
end process ACCESS_START_PROCESS;

-- Generate a pulse to identify start of the transaction
access_start <= dev_in_access_int and not dev_in_access_int_d1;

-------------------------------------------------------------------------------
-- NAME: ASYNC_REQ_GEN
-------------------------------------------------------------------------------
-- Description: Generate asynchronous request signal if any of the device is
--              configured for asynchronous access
-------------------------------------------------------------------------------
ASYNC_REQ_GEN: if NO_PRH_ASYNC = 0 generate

  ---------------------------------------------------------------------------
  -- NAME: DELAY_ASYNC_WR_ACK_PROCESS
  ---------------------------------------------------------------------------
  -- Description: Delay the write acknowledgement from asynchronous control logic
  --              to generate request in case of burst access
  ---------------------------------------------------------------------------
  DELAY_ASYNC_WR_ACK_PROCESS : process(Bus2IP_Clk)
  begin
    if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
       if (Bus2IP_Rst = '1' or dev_in_access_int = '0') then
          ip_async_Wrack_d1 <= '0';
          ip_async_Wrack_d2 <= '0';
          ip_async_Wrack_d3 <= '0';
          ip_async_Wrack_d4 <= '0';
       else
          ip_async_Wrack_d1 <= IP_async_Wrack;
          ip_async_Wrack_d2 <= ip_async_Wrack_d1;
          ip_async_Wrack_d3 <= ip_async_Wrack_d2;
          ip_async_Wrack_d4 <= ip_async_Wrack_d3;
       end if;
     end if;
  end process DELAY_ASYNC_WR_ACK_PROCESS;

  ---------------------------------------------------------------------------
  -- NAME: DELAY_ASYNC_RD_ACK_PROCESS
  ---------------------------------------------------------------------------
  -- Description: Delay the Read acknowledgement from asynchronous control logic
  --              to generate request in case of burst access
  ---------------------------------------------------------------------------
  DELAY_ASYNC_RD_ACK_PROCESS : process(Bus2IP_Clk)
  begin
    if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
       if (Bus2IP_Rst = '1' or dev_in_access_int = '0') then
          ip_async_Rdack_d1 <= '0';
          ip_async_Rdack_d2 <= '0';
          ip_async_Rdack_d3 <= '0';
          ip_async_Rdack_d4 <= '0';
       else
          ip_async_Rdack_d1 <= IP_async_Rdack;
          ip_async_Rdack_d2 <= ip_async_Rdack_d1;
          ip_async_Rdack_d3 <= ip_async_Rdack_d2;
          ip_async_Rdack_d4 <= ip_async_Rdack_d3;
       end if;
     end if;
  end process DELAY_ASYNC_RD_ACK_PROCESS;

  -- If the burst indication stays during delayed acknowledgement then,
  -- generate ACCESS_ON signal. This signal will be high for only
  -- one clock pulse because ip_async_Wrack_d4 and ip_async_Rdack_d4
  -- will be only one clock.
  async_access_on <= dev_in_access_int and (ip_async_Wrack_d4 or 
                                                            ip_async_Rdack_d4);

  -- Generate a one clock ASYNC_REQ signal for every access
  async_req <= dev_in_access_int and
               not dev_sync_int and
               (access_start or async_access_on);

  ---------------------------------------------------------------------------
  -- NAME: ASYNC_REQ_PROCESS
  ---------------------------------------------------------------------------
  -- Description: Register and hold the asynchronous request signal until
  --              acknowledged by the local interface or a master abort on
  --              PLB bus occurs
  ---------------------------------------------------------------------------
  ASYNC_REQ_PROCESS : process(Bus2IP_Clk)
  begin
    if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
      if (Bus2IP_Rst = '1') then
        local_async_req <= '0';
      else
        if (dev_in_access_int = '0' or IP_async_Wrack = '1'
                                    or IP_async_Rdack = '1') then
          local_async_req <= '0';
        elsif (async_req = '1') then
          local_async_req <= '1';
        end if;
      end if;
    end if;
  end process ASYNC_REQ_PROCESS;

  IPIC_async_req <= not dev_sync_int and local_async_req;
  Dev_async_in_access <= dev_in_access_int and (not dev_sync_int);

end generate ASYNC_REQ_GEN;

-------------------------------------------------------------------------------
-- NAME: NO_ASYNC_REQ_GEN
-------------------------------------------------------------------------------
-- Description: Tie asynchronous request signal and asynchronous device
--              interface in access indication low if no device is
--              configured for asynchronous access
-------------------------------------------------------------------------------
NO_ASYNC_REQ_GEN: if NO_PRH_ASYNC = 1 generate

  Dev_async_in_access <= '0';
  IPIC_async_req <=  '0';

end generate NO_ASYNC_REQ_GEN;

-------------------------------------------------------------------------------
-- NAME: NO_SYNC_REQ_GEN
-------------------------------------------------------------------------------
-- Description: Tie synchronous request signal and synchronous device
--              interface in access indication low if no device is
--              configured for synchronous access
-------------------------------------------------------------------------------
NO_SYNC_REQ_GEN: if NO_PRH_SYNC = 1 generate

  Dev_sync_in_access <= '0';

  IPIC_sync_req <=  '0';
  IPIC_sync_ack_rst <= '1';

end generate NO_SYNC_REQ_GEN;

-------------------------------------------------------------------------------
-- NAME: SYNC_REQ_GEN
-------------------------------------------------------------------------------
-- Description: Generate synchronous request signal if any of the device is
--              configured for synchronous access
-------------------------------------------------------------------------------
SYNC_REQ_GEN: if NO_PRH_SYNC = 0 generate

  ---------------------------------------------------------------------------
  -- NAME: DELAY_ACK_PROCESS
  ---------------------------------------------------------------------------
  -- Description: Delay the acknowledgement from synchronous control logic
  --              to generate request in case of burst access
  ---------------------------------------------------------------------------
  DELAY_WR_ACK_PROCESS : process(Bus2IP_Clk)
  begin
    if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
       if (Bus2IP_Rst = '1' or dev_in_access_int = '0') then
          ip_sync_Wrack_d1 <= '0';
          ip_sync_Wrack_d2 <= '0';
          ip_sync_Wrack_d3 <= '0';
          ip_sync_Wrack_d4 <= '0';
       else
          ip_sync_Wrack_d1 <= IP_sync_Wrack;
          ip_sync_Wrack_d2 <= ip_sync_Wrack_d1;
          ip_sync_Wrack_d3 <= ip_sync_Wrack_d2;
          ip_sync_Wrack_d4 <= ip_sync_Wrack_d3;
       end if;
     end if;
  end process DELAY_WR_ACK_PROCESS;

  ---------------------------------------------------------------------------
  -- NAME: DELAY_RD_ACK_PROCESS
  ---------------------------------------------------------------------------
  -- Description: Delay the read acknowledgement from synchronous control logic
  --              to generate request in case of burst access
  ---------------------------------------------------------------------------
  DELAY_RD_ACK_PROCESS : process(Bus2IP_Clk)
  begin
    if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
       if (Bus2IP_Rst = '1' or dev_in_access_int = '0') then
          ip_sync_Rdack_d1 <= '0';
          ip_sync_Rdack_d2 <= '0';
          ip_sync_Rdack_d3 <= '0';
          ip_sync_Rdack_d4 <= '0';
       else
          ip_sync_Rdack_d1 <= IP_sync_Rdack;
          ip_sync_Rdack_d2 <= ip_sync_Rdack_d1;
          ip_sync_Rdack_d3 <= ip_sync_Rdack_d2;
          ip_sync_Rdack_d4 <= ip_sync_Rdack_d3;
       end if;
     end if;
  end process DELAY_RD_ACK_PROCESS;

  -- If the burst indication stays during delayed acknowledgement then,
  -- generate ACCESS_ON signal. This signal will be high for only
  -- one clock pulse because ip_sync_Wrack_d4 will be only one clock.
  sync_access_on <= dev_in_access_int and (ip_sync_Wrack_d4 or ip_sync_Rdack_d4);

  -- Generate a one clock SYNC_REQ signal for every access
  sync_req <= dev_in_access_int and
              dev_sync_int and
              (access_start or sync_access_on);

  -----------------------------------------------------------------------------
  -- NAME: SYNC_REQ_NO_PRH_CLK_GEN
  -----------------------------------------------------------------------------
  -- Description: Generate request when the synchronous interface operates
  --              on PLB clock
  -----------------------------------------------------------------------------
  SYNC_REQ_NO_PRH_CLK_GEN: if C_PRH_CLK_SUPPORT = 0 generate

    ---------------------------------------------------------------------------
    -- NAME: SYNC_NO_PRH_CLK_REQ_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Register the request until acknowledged by the local
    --              interface or a master abort occurs
    ---------------------------------------------------------------------------
    SYNC_NO_PRH_CLK_REQ_PROCESS : process(Bus2IP_Clk)
    begin
      if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
        if (Bus2IP_Rst = '1') then
          local_sync_req <= '0';
        else
          if (dev_in_access_int='0' or IP_sync_Wrack='1' or IP_sync_Rdack='1')
                                                                            then
            local_sync_req <= '0';
          elsif (sync_req = '1') then
            local_sync_req <= '1';
          end if;
        end if;
      end if;
    end process SYNC_NO_PRH_CLK_REQ_PROCESS;

    IPIC_sync_req <= dev_sync_int and local_sync_req;
    IPIC_sync_ack_rst <= '1';

    Dev_sync_in_access <= dev_in_access_int and dev_sync_int;

  end generate SYNC_REQ_NO_PRH_CLK_GEN;

  -----------------------------------------------------------------------------
  -- NAME: SYNC_REQ_PRH_CLK_GEN
  -----------------------------------------------------------------------------
  -- Description: The synchronous interface operates on the local clock.
  --              Generate request and double synchronize it.
  -----------------------------------------------------------------------------
  SYNC_REQ_PRH_CLK_GEN: if C_PRH_CLK_SUPPORT = 1 generate
  attribute ASYNC_REG of REG_SYNC_REQ : label is "TRUE";
  begin
    ---------------------------------------------------------------------------
    -- NAME: REQ_PULSE_GEN_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Register the SYNC_REQ signal: Needs to be an output of a
    --              flip flop because this is going to be used as clocking
    --              signal for the latch generating the request for the
    --              synchronous control logic
    ---------------------------------------------------------------------------
    REQ_PULSE_GEN_PROCESS : process(Bus2IP_Clk)
    begin
      if (Bus2IP_Clk'event and Bus2IP_Clk = '1')then
         if (Bus2IP_Rst = '1') then
           sync_req_d1 <= '0';
         else
           sync_req_d1 <= sync_req;
         end if;
      end if;
    end process REQ_PULSE_GEN_PROCESS;

   temp_i <= (Local_Rst or IP_sync_req_rst) or not(dev_in_access_int);
---------------------------------------------------------------------------
-- Description: Latch the SYNC_REQ_D1 signal. Hold it until it is reset
--              from the synchronous control state machine which indicates
--              the current request is acknowledged by the local interface
-- The condition here is as soon as the sync_req_d1 is detected active the output
-- should be active "high". The output is reseted, with the condition of "temp_i".
---------------------------------------------------------------------------
        REQ_HOLD_GEN_PROCESS: process(Bus2IP_Clk)
        begin
        if(Bus2IP_Clk'event and Bus2IP_Clk = '1') then
                if (temp_i = '1') then
                        local_sync_req_i <= '0';
                elsif(sync_req_d1 = '1') then
                        local_sync_req_i <= '1';
                end if;
         end if;
         end process REQ_HOLD_GEN_PROCESS;

    local_sync_req <= sync_req_d1 or (local_sync_req_i and (not temp_i));
--------------------------------------------------------------------------------
    local_sync_req_rst <= Local_Rst or IP_sync_req_rst;


    REG_SYNC_REQ: component FDRE
      port map (
                 Q  => local_sync_req_d1,
                 C  => Local_Clk,
                 CE => '1',
                 D  => local_sync_req,
                 R  => local_sync_req_rst
               );

    ---------------------------------------------------------------------------
    -- NAME: DOUBLE_SYNC_REQ_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Double synchronize the synchronous request signal
    ---------------------------------------------------------------------------
    DOUBLE_SYNC_REQ_PROCESS: process(Local_Clk)
    begin
      if (Local_Clk'event and Local_Clk = '1') then
        if (local_sync_req_rst = '1') then
          local_sync_req_d2 <= '0';
          local_sync_req_d3 <= '0';
        else
          local_sync_req_d2 <= local_sync_req_d1;
          local_sync_req_d3 <= local_sync_req_d2;
        end if;
      end if;
    end process DOUBLE_SYNC_REQ_PROCESS;

    -- Generate request for the syncrhonous control logic
    IPIC_sync_req <= local_sync_req_d3;

    dev_sync_in_access <= local_sync_req_d3 and dev_sync_i;

    ---------------------------------------------------------------------------
    -- NAME: SYNC_ACK_RST_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Reset acknowldgement generation logic in synchronous
    --              control; This signal is inactive during an active request
    --              cycle i.e. from the time request is generated to the time
    --              it is acknowledged by the local interface
    ---------------------------------------------------------------------------
    SYNC_ACK_RST_PROCESS : process (Bus2IP_Clk)
    begin
      if (Bus2IP_Clk'event and Bus2IP_Clk = '1') then
        if (Bus2IP_Rst = '1' or dev_in_access_int = '0' ) then
          IPIC_sync_ack_rst <= '1';
        else
          if (sync_req_d1 = '1') then
            IPIC_sync_ack_rst <= '0';
          elsif (IP_sync_Wrack = '1' or IP_sync_Rdack = '1') then
            IPIC_sync_ack_rst <= '1';
          end if;
        end if;
      end if;
    end process SYNC_ACK_RST_PROCESS;

  end generate SYNC_REQ_PRH_CLK_GEN;
end generate SYNC_REQ_GEN;

Dev_in_access <= dev_in_access_int;

ip2bus_Wrack_i   <= dev_in_access_int and (IP_sync_Wrack or IP_async_Wrack);
ip2bus_Rdack_i   <= dev_in_access_int and (IP_sync_Rdack or IP_async_Rdack);

IP2Bus_WrAck  <= ip2bus_Wrack_i;
IP2Bus_RdAck  <= ip2bus_Rdack_i;

IP2Bus_Error  <= dev_in_access_int and (IP_sync_error or IP_async_error);

end architecture imp;
--------------------------------end of file------------------------------------


-------------------------------------------------------------------------------
-- data_steer.vhd - entity/architecture pair
-------------------------------------------------------------------------------

-- ************************************************************************
-- ** DISCLAIMER OF LIABILITY                                            **
-- **                                                                    **
-- ** This file contains proprietary and confidential information of     **
-- ** Xilinx, Inc. ("Xilinx"), that is distributed under a license       **
-- ** from Xilinx, and may be used, copied and/or disclosed only         **
-- ** pursuant to the terms of a valid license agreement with Xilinx.    **
-- **                                                                    **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION              **
-- ** ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER         **
-- ** EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT                **
-- ** LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,          **
-- ** MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx      **
-- ** does not warrant that functions included in the Materials will     **
-- ** meet the requirements of Licensee, or that the operation of the    **
-- ** Materials will be uninterrupted or error-free, or that defects     **
-- ** in the Materials will be corrected. Furthermore, Xilinx does       **
-- ** not warrant or make any representations regarding use, or the      **
-- ** results of the use, of the Materials in terms of correctness,      **
-- ** accuracy, reliability or otherwise.                                **
-- **                                                                    **
-- ** Xilinx products are not designed or intended to be fail-safe,      **
-- ** or for use in any application requiring fail-safe performance,     **
-- ** such as life-support or safety devices or systems, Class III       **
-- ** medical devices, nuclear facilities, applications related to       **
-- ** the deployment of airbags, or any other applications that could    **
-- ** lead to death, personal injury or severe property or               **
-- ** environmental damage (individually and collectively, "critical     **
-- ** applications"). Customer assumes the sole risk and liability       **
-- ** of any use of Xilinx products in critical applications,            **
-- ** subject only to applicable laws and regulations governing          **
-- ** limitations on product liability.                                  **
-- **                                                                    **
-- ** Copyright 2005, 2006, 2008, 2009 Xilinx, Inc.                      **
-- ** All rights reserved.                                               **
-- **                                                                    **
-- ** This disclaimer and copyright notice must be retained as part      **
-- ** of this file at all times.                                         **
-- ************************************************************************

-------------------------------------------------------------------------------
-- File          : data_steer.vhd
-- Company       : Xilinx
-- Version       : v1.00.a
-- Description   : External Peripheral Controller for AXI data steering logic
-- Structure     : VHDL-93
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Structure:
--             axi_epc.vhd
--               -axi_lite_ipif
--               -epc_core.vhd
--               -ipic_if_decode.vhd
--               -sync_cntl.vhd
--               -async_cntl.vhd
--                  -- async_counters.vhd
--                  -- async_statemachine.vhd
--               -address_gen.vhd
--               -data_steer.vhd
--               -access_mux.vhd
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Author   : VB
-- History  :
--
--  VB           08-24-2010 --  v2_0 version for AXI
-- ^^^^^^
--            The core updated for AXI based on xps_epc_v1_02_a
-- ~~~~~~
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.conv_std_logic_vector;

library unisim;
use unisim.vcomponents.FDRE;
-------------------------------------------------------------------------------
--                     Definition of Generics                                --
-------------------------------------------------------------------------------
-- C_SPLB_NATIVE_DWIDTH        -  Data bus width of PLB bus
-- C_PRH_MAX_DWIDTH     -  Maximum of data bus width of peripheral devices
-- ALL_PRH_DWIDTH_MATCH -  Indication that all devices are employing data width
--                         matching
-- NO_PRH_DWIDTH_MATCH  -  Indication that no device is employing data width
--                         matching
-- NO_PRH_SYNC          -  Indicates all devices are configured for
--                         asynchronous interface
-- NO_PRH_ASYNC         -  Indicates all devices are configured for
--                         synchronous interface
-- ADDRCNT_WIDTH        -  Width of address suffix generated by address
--                         generation logic
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                     Definition of Ports                                   --
-------------------------------------------------------------------------------
-- Bus2IP_Clk            - IPIC clock
-- Bus2IP_Rst            - IPIC reset
-- Local_Clk             - Operational clock for peripheral interface
-- Local_Rst             - Reset for peripheral interface
-- Bus2IP_RNW            - IPIC read/write control
-- Bus2IP_BE             - Byte enables from IPIC interface
-- Bus2IP_Data           - Data bus from IPIC interface
-- Dev_in_access         - Indication that peripheral interface is being
--                         accessed by the PLB master
-- Dev_sync              - Indicates if the current device being accessed
--                         is synchronous device
-- Dev_rnw               - Read/write control indication from IPIC interface
-- Dev_dwidth_match      - Indicates if the current device employs data width
--                       - matching
-- Dev_dbus_width        - Indicates decoded value for the data bus width
-- Addr_suffix           - Least significant address bits
-- Steer_index           - Index for data steering
-- Async_en              - Indication from asynchronous logic to latch the
--                         read data bus
-- Async_ce              - Indication of currently read bytes to asynchronous
--                         conrol logic
-- Sync_en               - Indication from synchronous logic to latch the
--                         read data bus
-- Sync_ce               - Indication of currently read bytes to synchronous
--                         conrol logic
-- PRH_Data_In           - Peripheral interface input bus for read access
-- PRH_BE                - Byte enables for external peripheral devices
-- Data_Int              - Internal peripheral data bus to be driven out
--                         to the external peripheral devices
-- IP2Bus_Data           - Data bus to the IPIC interface on a read access
-------------------------------------------------------------------------------

entity data_steer is
  generic (
     C_SPLB_NATIVE_DWIDTH : integer;
     C_PRH_MAX_DWIDTH     : integer;
     ALL_PRH_DWIDTH_MATCH : integer;
     NO_PRH_DWIDTH_MATCH  : integer;
     NO_PRH_SYNC          : integer;
     NO_PRH_ASYNC         : integer;
     ADDRCNT_WIDTH        : integer
  );

  port (
     Bus2IP_Clk        : in std_logic;
     Bus2IP_Rst        : in std_logic;

     Local_Clk         : in std_logic;
     Local_Rst         : in std_logic;

     Bus2IP_RNW        : in std_logic;
     Bus2IP_BE         : in std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8-1);
     Bus2IP_Data       : in std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH-1);
Dev_bus_multiplex        : in std_logic;
--dev_fifo_access        : in std_logic;
     Dev_in_access     : in std_logic;
     Dev_sync          : in std_logic;
     Dev_rnw           : in std_logic;
     Dev_dwidth_match  : in std_logic;
     Dev_dbus_width    : in std_logic_vector(0 to 2);

     Addr_suffix       : in  std_logic_vector(0 to ADDRCNT_WIDTH-1);
     Steer_index       : out std_logic_vector(0 to ADDRCNT_WIDTH-1);

     Async_en          : in  std_logic;
     Async_ce          : out std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8-1);

     Sync_en           : in  std_logic;
     Sync_ce           : out std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8-1);

     PRH_Data_In       : in  std_logic_vector(0 to C_PRH_MAX_DWIDTH-1);

     PRH_BE            : out std_logic_vector(0 to C_PRH_MAX_DWIDTH/8-1);
     Data_Int          : out std_logic_vector(0 to C_PRH_MAX_DWIDTH-1);

     IP2Bus_Data       : out std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH-1)
    );
end entity data_steer;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of data_steer is

-------------------------------------------------------------------------------
-- Constant Declarations
-------------------------------------------------------------------------------
constant BYTE_SIZE : integer := 8;

-------------------------------------------------------------------------------
-- Signal Declarations
-------------------------------------------------------------------------------
signal steer_index_i     : std_logic_vector(0 to ADDRCNT_WIDTH-1) :=
                         (others => '0');

signal steer_data_in     : std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH-1) :=
                         (others => '0');
signal no_steer_data_in  : std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH-1) :=
                         (others => '0');
signal data_in           : std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH-1) :=
                         (others => '0');

signal async_ip2bus_data : std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH-1) :=
                         (others => '0');
signal sync_ip2bus_data  : std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH-1) :=
                         (others => '0');
signal ip2bus_data_int   : std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH-1) :=
                         (others => '0');

signal no_steer_async_ce:
    std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1) := (others => '0');
signal steer_async_ce   :
    std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1) := (others => '0');
signal async_ce_i       :
    std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1) := (others => '0');

signal no_steer_sync_ce :
    std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1) := (others => '0');
signal steer_sync_ce    :
    std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1) := (others => '0');
signal sync_ce_i        :
    std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1) := (others => '0');

signal async_rd_ce      :
    std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1) := (others => '0');
signal sync_rd_ce       :
    std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1) := (others => '0');

signal steer_data       : std_logic_vector(0 to C_PRH_MAX_DWIDTH-1)
                        := (others => '0');
signal steer_be         : std_logic_vector(0 to C_PRH_MAX_DWIDTH/8-1)
                        := (others => '0');
--
signal prh_be_i         : std_logic_vector(0 to C_PRH_MAX_DWIDTH/8-1)
                        := (others => '0');
signal data_Int_i       : std_logic_vector(0 to C_PRH_MAX_DWIDTH-1)
                        := (others => '0');
--
signal sync_rd_ce_d1 :
    std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1) := (others => '0');

signal sync_rd_ce_int :
    std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1) := (others => '0');
-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------
begin

--------------------------------
-- NAME: NO_DEV_DWIDTH_MATCH_GEN
-- Description: If no device employs data width matching, then generate
--              Data_Int, PRH_BE and IP2Bus_Data
----------------------------------------------------------------------

NO_DEV_DWIDTH_MATCH_GEN: if NO_PRH_DWIDTH_MATCH = 1 generate

  Async_ce     <= (others => '0');
  Sync_ce      <= (others => '0');
  Steer_index  <= (others => '0');

  -----------------
  -- For write path
  -----------------
  Data_Int <= Bus2IP_Data(0 to C_PRH_MAX_DWIDTH-1);

  prh_be_i   <= Bus2IP_BE(0 to C_PRH_MAX_DWIDTH/8-1);

  REG_PRH_SIGS2 : process(Local_Clk)
  begin
  if (Local_Clk'event and Local_Clk = '1')then
         PRH_BE <= prh_be_i;
  end if;
  end process REG_PRH_SIGS2;

  -----------------
  -- For read path
  -----------------
  ------------------------------------------
  -- NAME: PRH_MAX_DWIDTH_32_RD_NO_STEER_GEN
  -- Description: Generate data for PLB interface
  ------------------------------------------------
  PRH_MAX_DWIDTH_32_RD_NO_STEER_GEN: if C_PRH_MAX_DWIDTH = 32 generate
    ------------------------------
    -- NAME: NO_STEER_DATA_PROCESS
    -- Description: Generate data for PLB interface
    -----------------------------------------------
    NO_STEER_DATA_PROCESS: process(Dev_dbus_width, PRH_Data_In) is
    begin

      no_steer_data_in  <= (others => '0');

      case Dev_dbus_width is

        -- Device width is 8 bits
--      when "001"  =>
--      no_steer_data_in(0 to BYTE_SIZE-1)  <= PRH_Data_In(0 to BYTE_SIZE-1);

        -- Device width is 16 bits
--      when "010" =>
--      no_steer_data_in(0 to 2*BYTE_SIZE-1)<= PRH_Data_In(0 to 2*BYTE_SIZE-1);

        -- Device width is 32 bits
        when "100" =>
        no_steer_data_in(0 to 4*BYTE_SIZE-1)<= PRH_Data_In(0 to 4*BYTE_SIZE-1);
-- coverage off
        when others =>
         no_steer_data_in <= (others => '0');
-- coverage on
        end case;
    end process NO_STEER_DATA_PROCESS;

  end generate PRH_MAX_DWIDTH_32_RD_NO_STEER_GEN;

  ---------------------------------------------------------------------------
  -- NAME: PRH_MAX_DWIDTH_16_RD_NO_STEER_GEN
  ---------------------------------------------------------------------------
  -- Description: Generate data for PLB interface
  ---------------------------------------------------------------------------

  PRH_MAX_DWIDTH_16_RD_NO_STEER_GEN: if C_PRH_MAX_DWIDTH = 16 generate

    -------------------------------------------------------------------------
    -- NAME: NO_STEER_DATA_PROCESS
    -------------------------------------------------------------------------
    -- Description: Generate data for PLB interface
    -------------------------------------------------------------------------
    NO_STEER_DATA_PROCESS: process(Dev_dbus_width, PRH_Data_In)
    begin

      no_steer_data_in  <= (others => '0');

      case Dev_dbus_width is

        when "001"  =>
          no_steer_data_in(0 to BYTE_SIZE-1)
            <= PRH_Data_In(0 to BYTE_SIZE-1);

        when "010" =>
          no_steer_data_in(0 to 2*BYTE_SIZE-1)
            <= PRH_Data_In(0 to 2*BYTE_SIZE-1);

        when others =>
          no_steer_data_in <= (others => '0');

      end case;
    end process NO_STEER_DATA_PROCESS;

  end generate PRH_MAX_DWIDTH_16_RD_NO_STEER_GEN;

  ---------------------------------------------------------------------------
  -- NAME: PRH_MAX_DWIDTH_8_RD_NO_STEER_GEN
  ---------------------------------------------------------------------------
  -- Description: Generate data for PLB interface
  ---------------------------------------------------------------------------

  PRH_MAX_DWIDTH_8_RD_NO_STEER_GEN: if C_PRH_MAX_DWIDTH = 8 generate

    -------------------------------------------------------------------------
    -- NAME: NO_STEER_DATA_PROCESS
    -------------------------------------------------------------------------
    -- Description: Generate data for PLB interface
    -------------------------------------------------------------------------
    NO_STEER_DATA_PROCESS: process(Dev_dbus_width, PRH_Data_In)
    begin

      no_steer_data_in  <= (others => '0');

      case Dev_dbus_width is

        when "001"  =>
          no_steer_data_in(0 to BYTE_SIZE-1)
            <= PRH_Data_In(0 to BYTE_SIZE-1);

        when others =>
          no_steer_data_in <= (others => '0');

      end case;
    end process NO_STEER_DATA_PROCESS;

  end generate PRH_MAX_DWIDTH_8_RD_NO_STEER_GEN;


  -----------------------------------------------------------------------------
  -- NAME: SOME_DEV_SYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: Some or all devices are configured as synchronous devices
  -----------------------------------------------------------------------------
  SOME_DEV_SYNC_GEN: if NO_PRH_SYNC = 0 generate

    ---------------------------------------------------------------------------
    -- NAME: NO_STEER_SYNC_CE_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Generate data enables for PLB interface
    ---------------------------------------------------------------------------
    NO_STEER_SYNC_CE_PROCESS: process(Dev_dbus_width, Sync_en)
    begin

      no_steer_sync_ce       <= (others => '0');

      case Dev_dbus_width is
      -- coverage off
        when "001"  =>
          no_steer_sync_ce(0) <= Sync_en;

        when "010" =>
          for i in 0 to 1 loop
            no_steer_sync_ce(i) <= Sync_en;
          end loop;
      -- coverage on
        when "100" =>
          for i in 0 to 3 loop
            no_steer_sync_ce(i) <= Sync_en;
          end loop;

        when others =>
          no_steer_sync_ce   <= (others => '0');

      end case;
    end process NO_STEER_SYNC_CE_PROCESS;


    ---------------------------------------------------------------------------
    -- NAME: SYNC_RDREG_GEN
    ---------------------------------------------------------------------------
    -- Description: Generate input data registers
    ---------------------------------------------------------------------------
    SYNC_RDREG_GEN: for i in 0 to C_PRH_MAX_DWIDTH/BYTE_SIZE-1 generate
      -------------------------------------------------------------------------
      -- NAME: SYNC_RDREG_BYTE_GEN
      -------------------------------------------------------------------------
      -- Description: Generate input data registers
      -------------------------------------------------------------------------
      SYNC_RDREG_BYTE_GEN: for j in 0 to BYTE_SIZE-1 generate
        attribute ASYNC_REG : string;
        attribute ASYNC_REG of SYNC_RDREG_BIT: label is "TRUE";
        begin

        SYNC_RDREG_BIT: component FDRE
          port map (
                    Q  => Sync_ip2bus_data(i*BYTE_SIZE+j),
                    C  => Local_Clk,
                    CE => no_steer_sync_ce(i),
                    D  => PRH_Data_In(i*BYTE_SIZE+j),
                    R  => Local_Rst
                   );
      end generate SYNC_RDREG_BYTE_GEN;
    end generate SYNC_RDREG_GEN;

    ---------------------------------------------------------------------------
    -- NAME: PRH_DWIDTH_LT_PLB_DWIDTH_GEN
    ---------------------------------------------------------------------------
    -- Description: Tie the higher order bits of data to zero
    ---------------------------------------------------------------------------
  PRH_DWIDTH_LT_PLB_DWIDTH_GEN: if C_PRH_MAX_DWIDTH < C_SPLB_NATIVE_DWIDTH
                                                                        generate
    sync_ip2bus_data(C_PRH_MAX_DWIDTH to C_SPLB_NATIVE_DWIDTH-1) <=
                                                                (others => '0');
  end generate PRH_DWIDTH_LT_PLB_DWIDTH_GEN;

end generate SOME_DEV_SYNC_GEN;

  -----------------------------------------------------------------------------
  -- NAME: SOME_DEV_ASYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: Some or all devices are configured as asynchronous devices
  -----------------------------------------------------------------------------
  SOME_DEV_ASYNC_GEN: if NO_PRH_ASYNC = 0 generate

    ---------------------------------------------------------------------------
    -- NAME: NO_STEER_ASYNC_CE_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Generate data enables for PLB interface
    ---------------------------------------------------------------------------
    NO_STEER_ASYNC_CE_PROCESS: process(Dev_dbus_width, Async_en)
    begin

      no_steer_async_ce       <= (others => '0');

      case Dev_dbus_width is
-- coverage off
        when "001"  =>
          no_steer_async_ce(0) <= Async_en;

        when "010" =>
          for i in 0 to 1 loop
            no_steer_async_ce(i) <= Async_en;
          end loop;
-- coverage on
        when "100" =>
          for i in 0 to 3 loop
            no_steer_async_ce(i) <= Async_en;
          end loop;
-- coverage off
        when others =>
          no_steer_async_ce   <= (others => '0');
-- coverage on
      end case;
    end process NO_STEER_ASYNC_CE_PROCESS;

    ---------------------------------------------------------------------------
    -- NAME: ASYNC_RDREG_GEN
    ---------------------------------------------------------------------------
    -- Description: Generate input data registers
    ---------------------------------------------------------------------------
    ASYNC_RDREG_GEN: for i in 0 to C_PRH_MAX_DWIDTH/BYTE_SIZE-1 generate
      -------------------------------------------------------------------------
      -- NAME: ASYNC_RDREG_BYTE_GEN
      -------------------------------------------------------------------------
      -- Description: Generate input data registers
      -------------------------------------------------------------------------
      ASYNC_RDREG_BYTE_GEN: for j in 0 to BYTE_SIZE-1 generate
        attribute ASYNC_REG : string;
        attribute ASYNC_REG of ASYNC_RDREG_BIT: label is "TRUE";
        begin
        ASYNC_RDREG_BIT: component FDRE
          port map (
                    Q  => async_ip2bus_data(i*BYTE_SIZE+j),
                    C  => Bus2IP_Clk,
                    CE => no_steer_async_ce(i),
                    D  => PRH_Data_In(i*BYTE_SIZE+j),
                    R  => Bus2IP_Rst
                   );
      end generate ASYNC_RDREG_BYTE_GEN;
    end generate ASYNC_RDREG_GEN;

    ---------------------------------------------------------------------------
    -- NAME: PRH_DWIDTH_LT_PLB_DWIDTH_GEN
    ---------------------------------------------------------------------------
    -- Description: Tie the higher order bits of data to zero
    ---------------------------------------------------------------------------
    PRH_DWIDTH_LT_PLB_DWIDTH_GEN: if C_PRH_MAX_DWIDTH < C_SPLB_NATIVE_DWIDTH
                                                                        generate
      async_ip2bus_data(C_PRH_MAX_DWIDTH to C_SPLB_NATIVE_DWIDTH-1) <=
                                                                (others => '0');
    end generate PRH_DWIDTH_LT_PLB_DWIDTH_GEN;

  end generate SOME_DEV_ASYNC_GEN;

  -----------------------------------------------------------------------------
  -- NAME: ALL_DEV_SYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: All devices are configured as synchronous devices
  -----------------------------------------------------------------------------
  ALL_DEV_SYNC_GEN: if NO_PRH_ASYNC = 1 generate

    async_ip2bus_data <= (others => '0');
    ip2bus_data_int <= sync_ip2bus_data;

  end generate ALL_DEV_SYNC_GEN;

  -----------------------------------------------------------------------------
  -- NAME: ALL_DEV_ASYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: All devices are configured as asynchronous devices
  -----------------------------------------------------------------------------
  ALL_DEV_ASYNC_GEN: if NO_PRH_SYNC = 1 generate

    sync_ip2bus_data <= (others => '0');
    ip2bus_data_int <= async_ip2bus_data;

  end generate ALL_DEV_ASYNC_GEN;

  -----------------------------------------------------------------------------
  -- NAME: DEV_SYNC_AND_ASYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: Some devices are configured as synchronous and some
  --              asynchronous
  -----------------------------------------------------------------------------
  DEV_SYNC_AND_ASYNC_GEN: if NO_PRH_SYNC = 0 and NO_PRH_ASYNC = 0 generate

    ip2bus_data_int <= async_ip2bus_data when Dev_sync = '0'
                       else sync_ip2bus_data;

  end generate DEV_SYNC_AND_ASYNC_GEN;


  IP2Bus_Data <= ip2bus_data_int when (Bus2IP_RNW = '1' and Dev_in_access = '1')
                 else (others => '0');

end generate NO_DEV_DWIDTH_MATCH_GEN;


-------------------------------------------------------------------------------
-- NAME: DEV_DWIDTH_MATCH_GEN
-------------------------------------------------------------------------------
-- Description: If any device employs data width matching, then generate data
--              and byte steering logic for write and read path along with data
--              registering for read path
-------------------------------------------------------------------------------
DEV_DWIDTH_MATCH_GEN: if NO_PRH_DWIDTH_MATCH = 0 generate

  ---------------------------------------------------------------------------
  -- NAME: STEER_INDEX_PROCESS
  ---------------------------------------------------------------------------
  -- Description: Generate index for steering logic from the address suffix
  ---------------------------------------------------------------------------
  STEER_INDEX_PROCESS: process(Dev_dbus_width, Addr_suffix)
  begin

    steer_index_i   <= (others => '0');

    case Dev_dbus_width is
      when "001"  =>
        steer_index_i   <= Addr_suffix;
      when "010"  =>
        steer_index_i   <= '0' & Addr_suffix(0 to ADDRCNT_WIDTH-2);
      when "100"  =>
        steer_index_i   <= (others => '0');
      when others =>
        steer_index_i   <= (others => '0');
    end case;
  end process STEER_INDEX_PROCESS;

  Steer_index  <= steer_index_i;

  -----------------------------------------------------------------------------
  -- NAME: PRH_MAX_DWIDTH_32_WR_STEER_GEN
  -----------------------------------------------------------------------------
  -- Description: Generate steering logic for write data path when the
  --              peripheral data bus is 32 bit
  -----------------------------------------------------------------------------

  PRH_MAX_DWIDTH_32_WR_STEER_GEN: if C_PRH_MAX_DWIDTH = 32 generate

    ---------------------------------------------------------------------------
    -- NAME: WR_32_STEER_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Generate steering logic for write path when the peripheral
    --              data bus width 32 bits
    ---------------------------------------------------------------------------
    WR_32_STEER_PROCESS: process(Dev_dbus_width, steer_index_i,
                                 Bus2IP_Data, Bus2IP_BE)
    begin

      steer_data  <= (others => '0');
      steer_be    <= (others => '0');

      case Dev_dbus_width is

      when "001"  =>
        for i in 0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE -1 loop
          if steer_index_i = conv_std_logic_vector(i, ADDRCNT_WIDTH) then
            steer_data(0 to BYTE_SIZE-1) <= Bus2IP_Data(i*BYTE_SIZE to
                                          i*BYTE_SIZE + BYTE_SIZE-1);
            steer_be(0) <= Bus2IP_BE(i);
          end if;
        end loop;

      when "010" =>
        for i in 0 to C_SPLB_NATIVE_DWIDTH/(BYTE_SIZE*2) -1 loop
          if steer_index_i = conv_std_logic_vector(i, ADDRCNT_WIDTH) then
            steer_data(0 to 2*BYTE_SIZE-1) <= Bus2IP_Data(i*BYTE_SIZE*2 to
                                            i*BYTE_SIZE*2 + 2*BYTE_SIZE-1);
            steer_be(0 to 1) <= Bus2IP_BE(i*2 to (i*2)+1);
          end if;
        end loop;

      when "100" =>

        steer_data <= Bus2IP_Data;
        steer_be   <= Bus2IP_BE;

      when others =>

        steer_data <= (others => '0');
        steer_be   <= (others => '0');

      end case;
    end process WR_32_STEER_PROCESS;


  end generate PRH_MAX_DWIDTH_32_WR_STEER_GEN;

  -----------------------------------------------------------------------------
  -- NAME: PRH_MAX_DWIDTH_16_WR_STEER_GEN
  -----------------------------------------------------------------------------
  -- Description: Generate steering logic for write data path when the
  --              peripheral data bus is 16 bit
  -----------------------------------------------------------------------------

  PRH_MAX_DWIDTH_16_WR_STEER_GEN: if C_PRH_MAX_DWIDTH = 16 generate

    ---------------------------------------------------------------------------
    -- NAME: WR_16_STEER_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Generate steering logic for write path when the peripheral
    --              data bus width is 16 bits
    ---------------------------------------------------------------------------
    WR_16_STEER_PROCESS: process(Dev_dbus_width, steer_index_i,
                                 Bus2IP_Data, Bus2IP_BE)
    begin

      steer_data <= (others => '0');
      steer_be   <= (others => '0');

      case Dev_dbus_width is

      when "001"  =>
        for i in 0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE -1 loop
          if steer_index_i = conv_std_logic_vector(i, ADDRCNT_WIDTH) then
            steer_data(0 to BYTE_SIZE-1) <= Bus2IP_Data(i*BYTE_SIZE to
                                            i*BYTE_SIZE + BYTE_SIZE-1);
            steer_be(0) <= Bus2IP_BE(i);
          end if;
        end loop;

      when "010" =>
        for i in 0 to C_SPLB_NATIVE_DWIDTH/(BYTE_SIZE*2) -1 loop
          if steer_index_i = conv_std_logic_vector(i, ADDRCNT_WIDTH) then
            steer_data(0 to 2*BYTE_SIZE-1) <= Bus2IP_Data(i*BYTE_SIZE*2 to
                                              i*BYTE_SIZE*2 + 2*BYTE_SIZE-1);
            steer_be(0 to 1) <= Bus2IP_BE(i*2 to (i*2)+1);
          end if;
        end loop;

      when others =>
        steer_data <= (others => '0');
        steer_be   <= (others => '0');

      end case;
    end process WR_16_STEER_PROCESS;

  end generate PRH_MAX_DWIDTH_16_WR_STEER_GEN;

  -----------------------------------------------------------------------------
  -- NAME: PRH_MAX_DWIDTH_8_WR_STEER_GEN
  -----------------------------------------------------------------------------
  -- Description: Generate steering logic for write data path when the
  --              peripheral data bus is 8 bit
  -----------------------------------------------------------------------------

  PRH_MAX_DWIDTH_8_WR_STEER_GEN: if C_PRH_MAX_DWIDTH = 8 generate

    ---------------------------------------------------------------------------
    -- NAME: WR_8_STEER_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Generate steering logic for write path when the
    --              peripheral data bus width is 8 bits
    ---------------------------------------------------------------------------
    WR_8_STEER_PROCESS: process(Dev_dbus_width, steer_index_i,
                                Bus2IP_Data, Bus2IP_BE)
    begin

      steer_data  <= (others => '0');
      steer_be    <= (others => '0');

      case Dev_dbus_width is

      when "001"  =>
        for i in 0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE -1 loop
          if steer_index_i = conv_std_logic_vector(i, ADDRCNT_WIDTH) then
            steer_data(0 to BYTE_SIZE-1) <= Bus2IP_Data(i*BYTE_SIZE to
                                          i*BYTE_SIZE + BYTE_SIZE-1);
            steer_be(0) <= Bus2IP_BE(i);
          end if;
        end loop;

      when others =>
        steer_data <= (others => '0');
        steer_be   <= (others => '0');

      end case;
    end process WR_8_STEER_PROCESS;

  end generate PRH_MAX_DWIDTH_8_WR_STEER_GEN;

  -- Generate data for peripheral interface
  Data_Int <=  Bus2IP_Data(0 to C_PRH_MAX_DWIDTH-1) when Dev_dwidth_match = '0'
                 else steer_data;

  --for STA only
  -- Generate BE for peripheral interface
  prh_be_i  <= Bus2IP_BE(0 to C_PRH_MAX_DWIDTH/8 -1) when Dev_dwidth_match = '0'
                 else steer_be;

REG_PRH_SIGS4 : process(Local_Clk)
begin
if (Local_Clk'event and Local_Clk = '1')then
    PRH_BE <= prh_be_i;
 end if;
end process REG_PRH_SIGS4;
  -----------------------------------------------------------------------------
  -- NAME: PRH_MAX_DWIDTH_32_RD_STEER_GEN
  -----------------------------------------------------------------------------
  -- Description: Generate steering logic for read path when the
  --              peripheral data bus is 32 bit
  -----------------------------------------------------------------------------
  PRH_MAX_DWIDTH_32_RD_STEER_GEN: if C_PRH_MAX_DWIDTH = 32 generate

    ---------------------------------------------------------------------------
    -- NAME: RD_32_STEER_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Generate steering logic for read path when peripheral
    --              data bus width is 32 bits
    ---------------------------------------------------------------------------
    RD_32_STEER_PROCESS: process(Dev_dbus_width, PRH_Data_In)
    begin

      steer_data_in <= (others => '0');

      case Dev_dbus_width is

      when "001"  =>
        for i in 0 to C_PRH_MAX_DWIDTH/BYTE_SIZE-1 loop
          steer_data_in(i*BYTE_SIZE to i*BYTE_SIZE+BYTE_SIZE-1) <=
                             PRH_Data_In(0 to BYTE_SIZE-1);
        end loop;

      when "010" =>
        for i in 0 to C_PRH_MAX_DWIDTH/(BYTE_SIZE*2)-1 loop
          steer_data_in(i*BYTE_SIZE*2 to i*BYTE_SIZE*2+BYTE_SIZE*2-1) <=
                                 PRH_Data_In(0 to BYTE_SIZE*2-1);
        end loop;

      when "100" =>
        steer_data_in <= PRH_Data_In;

      when others =>
        steer_data_in <= (others => '0');

      end case;
    end process RD_32_STEER_PROCESS;

  end generate PRH_MAX_DWIDTH_32_RD_STEER_GEN;

  -----------------------------------------------------------------------------
  -- NAME: PRH_MAX_DWIDTH_16_RD_STEER_GEN
  -----------------------------------------------------------------------------
  -- Description: Generate steering logic for read and write when the
  --              peripheral data bus is 16 bit
  -----------------------------------------------------------------------------
  PRH_MAX_DWIDTH_16_RD_STEER_GEN: if C_PRH_MAX_DWIDTH = 16 generate

    ---------------------------------------------------------------------------
    -- NAME: RD_16_STEER_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Generate steering logic for read path when the peripheral
    --              data bus width is 16 bits
    ---------------------------------------------------------------------------
    RD_16_STEER_PROCESS: process(Dev_dbus_width, PRH_Data_In)
    begin

      steer_data_in <= (others => '0');

      case Dev_dbus_width is

      when "001"  =>
        for i in 0 to C_PRH_MAX_DWIDTH/BYTE_SIZE-1 loop
          steer_data_in(i*BYTE_SIZE to i*BYTE_SIZE+BYTE_SIZE-1) <=
                             PRH_Data_In(0 to BYTE_SIZE-1);
        end loop;

      when "010" =>
        for i in 0 to C_PRH_MAX_DWIDTH/(BYTE_SIZE*2)-1 loop
          steer_data_in(i*BYTE_SIZE*2 to i*BYTE_SIZE*2+BYTE_SIZE*2-1) <=
                                 PRH_Data_In(0 to BYTE_SIZE*2-1);
         end loop;

      when others =>
        steer_data_in <= (others => '0');

      end case;
    end process RD_16_STEER_PROCESS;

  end generate PRH_MAX_DWIDTH_16_RD_STEER_GEN;

  -----------------------------------------------------------------------------
  -- NAME: PRH_MAX_DWIDTH_8_RD_STEER_GEN
  -----------------------------------------------------------------------------
  -- Description: Generate steering logic for read and write when the
  --              peripheral data bus is 8 bit
  -----------------------------------------------------------------------------
  PRH_MAX_DWIDTH_8_RD_STEER_GEN: if C_PRH_MAX_DWIDTH = 8 generate

    ---------------------------------------------------------------------------
    -- NAME: RD_8_STEER_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Generate steering logic for read path when the
    --              peripheral data bus width is 8 bits
    ---------------------------------------------------------------------------
    RD_8_STEER_PROCESS: process(Dev_dbus_width, PRH_Data_In)
    begin

      steer_data_in <= (others => '0');

      case Dev_dbus_width is

      when "001"  =>
        for i in 0 to C_PRH_MAX_DWIDTH/BYTE_SIZE-1 loop
          steer_data_in(i*BYTE_SIZE to i*BYTE_SIZE+BYTE_SIZE-1) <=
                             PRH_Data_In(0 to BYTE_SIZE-1);
        end loop;

      when others =>
        steer_data_in <= (others => '0');

      end case;
    end process RD_8_STEER_PROCESS;

  end generate PRH_MAX_DWIDTH_8_RD_STEER_GEN;

  ------------------------------------------------------------------------------
  -- NAME: ALL_DEV_DWIDTH_MATCH_GEN
  ------------------------------------------------------------------------------
  -- Description: If not all device employs data width matching, then generate
  --              data in without steering
  ------------------------------------------------------------------------------

  ALL_DEV_DWIDTH_MATCH_GEN: if ALL_PRH_DWIDTH_MATCH = 0 generate

    ---------------------------------------------------------------------------
    -- NAME: PRH_MAX_DWIDTH_32_RD_NO_STEER_GEN
    ---------------------------------------------------------------------------
    -- Description: Generate data for PLB interface without steering
    ---------------------------------------------------------------------------

    PRH_MAX_DWIDTH_32_RD_NO_STEER_GEN: if C_PRH_MAX_DWIDTH = 32 generate

      -------------------------------------------------------------------------
      -- NAME: NO_STEER_DATA_PROCESS
      -------------------------------------------------------------------------
      -- Description: Generate data for PLB interface without steering
      -------------------------------------------------------------------------
      NO_STEER_DATA_PROCESS: process(Dev_dbus_width, PRH_Data_In)
      begin

        no_steer_data_in  <= (others => '0');

        case Dev_dbus_width is

          when "001"  =>
            no_steer_data_in(0 to BYTE_SIZE-1)
               <= PRH_Data_In(0 to BYTE_SIZE-1);

          when "010" =>
            no_steer_data_in(0 to 2*BYTE_SIZE-1)
              <= PRH_Data_In(0 to 2*BYTE_SIZE-1);

          when "100" =>
            no_steer_data_in(0 to 4*BYTE_SIZE-1)
              <= PRH_Data_In(0 to 4*BYTE_SIZE-1);

          when others =>
            no_steer_data_in <= (others => '0');

        end case;
      end process NO_STEER_DATA_PROCESS;

    end generate PRH_MAX_DWIDTH_32_RD_NO_STEER_GEN;

    ---------------------------------------------------------------------------
    -- NAME: PRH_MAX_DWIDTH_16_RD_NO_STEER_GEN
    ---------------------------------------------------------------------------
    -- Description: Generate data for PLB interface without steering
    ---------------------------------------------------------------------------

    PRH_MAX_DWIDTH_16_RD_NO_STEER_GEN: if C_PRH_MAX_DWIDTH = 16 generate

      -------------------------------------------------------------------------
      -- NAME: NO_STEER_DATA_PROCESS
      -------------------------------------------------------------------------
      -- Description: Generate data for PLB interface without steering
      -------------------------------------------------------------------------
      NO_STEER_DATA_PROCESS: process(Dev_dbus_width, PRH_Data_In)
      begin

        no_steer_data_in  <= (others => '0');

        case Dev_dbus_width is

          when "001"  =>
            no_steer_data_in(0 to BYTE_SIZE-1)
              <= PRH_Data_In(0 to BYTE_SIZE-1);

          when "010" =>
            no_steer_data_in(0 to 2*BYTE_SIZE-1)
              <= PRH_Data_In(0 to 2*BYTE_SIZE-1);

          when others =>
            no_steer_data_in <= (others => '0');

        end case;
      end process NO_STEER_DATA_PROCESS;

    end generate PRH_MAX_DWIDTH_16_RD_NO_STEER_GEN;

    ---------------------------------------------------------------------------
    -- NAME: PRH_MAX_DWIDTH_8_RD_NO_STEER_GEN
    ---------------------------------------------------------------------------
    -- Description: Generate data for PLB interface without steering
    ---------------------------------------------------------------------------

    PRH_MAX_DWIDTH_8_RD_NO_STEER_GEN: if C_PRH_MAX_DWIDTH = 8 generate

      -------------------------------------------------------------------------
      -- NAME: NO_STEER_DATA_PROCESS
      -------------------------------------------------------------------------
      -- Description: Generate data for PLB interface without steering
      -------------------------------------------------------------------------
      NO_STEER_DATA_PROCESS: process(Dev_dbus_width, PRH_Data_In)
      begin

        no_steer_data_in  <= (others => '0');

        case Dev_dbus_width is

          when "001"  =>
            no_steer_data_in(0 to BYTE_SIZE-1)
              <= PRH_Data_In(0 to BYTE_SIZE-1);

          when others =>
            no_steer_data_in <= (others => '0');

        end case;
      end process NO_STEER_DATA_PROCESS;

    end generate PRH_MAX_DWIDTH_8_RD_NO_STEER_GEN;

  end generate ALL_DEV_DWIDTH_MATCH_GEN;

  ------------------------------------------------------------------------------
  -- NAME: NOT_ALL_DEV_DWIDTH_MATCH_GEN
  ------------------------------------------------------------------------------
  -- Description: If all device employs data width matching, then
  --              non-steered data is not required
  ------------------------------------------------------------------------------

  NOT_ALL_DEV_DWIDTH_MATCH_GEN: if ALL_PRH_DWIDTH_MATCH = 1 generate

    no_steer_data_in <= (others => '0');

  end generate NOT_ALL_DEV_DWIDTH_MATCH_GEN;

  data_in <=  no_steer_data_in  when Dev_dwidth_match = '0' else steer_data_in;

  -----------------------------------------------------------------------------
  -- NAME: SOME_DEV_SYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: Some or all devices are configured as synchronous devices
  -----------------------------------------------------------------------------
  SOME_DEV_SYNC_GEN: if NO_PRH_SYNC = 0 generate

    -------------------------------------------------------------------------
    -- NAME: STEER_SYNC_CE_PROCESS
    --------------------------------------------------------------------------
    -- Description: Generate data enables for synchronous interface
    --              after steering to the appropriate byte lane
    -------------------------------------------------------------------------
    STEER_SYNC_CE_PROCESS: process(Dev_dbus_width, steer_index_i, Sync_en)
    begin

      steer_sync_ce <= (others => '0');

      case Dev_dbus_width is

      when "001"  =>
        for i in 0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE -1 loop
          if steer_index_i = conv_std_logic_vector(i, ADDRCNT_WIDTH) then
            steer_sync_ce(i) <= Sync_en;
          end if;
        end loop;

      when "010" =>
         for i in 0 to C_SPLB_NATIVE_DWIDTH/(BYTE_SIZE*2)-1 loop
           if steer_index_i = conv_std_logic_vector(i, ADDRCNT_WIDTH) then
             steer_sync_ce(i*2)   <= Sync_en;
             steer_sync_ce(i*2+1) <= Sync_en;
           end if;
         end loop;

      when "100" =>
        for i in 0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1 loop
          steer_sync_ce(i) <= Sync_en;
        end loop;

      when others =>
        steer_sync_ce <= (others => '0');

      end case;
    end process STEER_SYNC_CE_PROCESS;

    ---------------------------------------------------------------------------
    -- NAME: ALL_DEV_DWIDTH_MATCH_GEN
    ---------------------------------------------------------------------------
    -- Description: If not all device employs data width matching, then
    --              generate data enables without steering
    ---------------------------------------------------------------------------

    ALL_DEV_DWIDTH_MATCH_GEN: if ALL_PRH_DWIDTH_MATCH = 0 generate

      -------------------------------------------------------------------------
      -- NAME: NO_STEER_SYNC_CE_PROCESS
      -------------------------------------------------------------------------
      -- Description: Generate data enables without steering for synchronous
      --              interface
      -------------------------------------------------------------------------
      NO_STEER_SYNC_CE_PROCESS: process(Dev_dbus_width, Sync_en)
      begin

        no_steer_sync_ce       <= (others => '0');

        case Dev_dbus_width is

          when "001"  =>
            no_steer_sync_ce(0) <= Sync_en;

          when "010" =>
            for i in 0 to 1 loop
              no_steer_sync_ce(i) <= Sync_en;
            end loop;

          when "100" =>
            for i in 0 to 3 loop
              no_steer_sync_ce(i) <= Sync_en;
            end loop;

          when others =>
            no_steer_sync_ce   <= (others => '0');

        end case;
      end process NO_STEER_SYNC_CE_PROCESS;

    end generate ALL_DEV_DWIDTH_MATCH_GEN;

    ---------------------------------------------------------------------------
    -- NAME: NOT_ALL_DEV_DWIDTH_MATCH_GEN
    ---------------------------------------------------------------------------
    -- Description: If all device employs data width matching, then
    --              non-steered data enables are not required
    ---------------------------------------------------------------------------

    NOT_ALL_DEV_DWIDTH_MATCH_GEN: if ALL_PRH_DWIDTH_MATCH = 1 generate

      no_steer_sync_ce <= (others => '0');

    end generate NOT_ALL_DEV_DWIDTH_MATCH_GEN;

    -- Generate data enable for the current device
    sync_ce_i <= no_steer_sync_ce  when Dev_dwidth_match = '0'
                                   else steer_sync_ce;

    Sync_ce <= sync_ce_i;

    ---------------------------------------------------------------------------
    -- NAME: SYNC_RD_CE_GEN
    ---------------------------------------------------------------------------
    -- Description: Qualify the data enable for the current device with the
    --              read signal for registering read data from synchronous
    --              interface
    ---------------------------------------------------------------------------
    SYNC_RD_CE_GEN: for i in 0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1 generate
      sync_rd_ce(i) <= sync_ce_i(i) and Dev_rnw;
    end generate SYNC_RD_CE_GEN;

  REG_SYNC_RD_CE : process(Local_Clk)
  begin
  if (Local_Clk'event and Local_Clk = '1')then
        sync_rd_ce_d1 <= sync_rd_ce;
  end if;
  end process REG_SYNC_RD_CE;

  SYNC_RD_PROCESS: process (Dev_bus_multiplex, sync_rd_ce_d1, sync_rd_ce)
  begin
        if (Dev_bus_multiplex='0') then
                sync_rd_ce_int <= sync_rd_ce_d1;
        else
                sync_rd_ce_int <= sync_rd_ce;
        end if;
  end process SYNC_RD_PROCESS;

--  sync_rd_ce_int <= sync_rd_ce_d1 when (Dev_dwidth_match='0') else
--                    sync_rd_ce;
    ---------------------------------------------------------------------------
    -- NAME: SYNC_RDREG_PLBWIDTH_GEN
    ---------------------------------------------------------------------------
    -- Description: Generate read registers for synchronous interface
    ---------------------------------------------------------------------------
  SYNC_RDREG_PLBWIDTH_GEN: for i in 0 to C_SPLB_NATIVE_DWIDTH/C_PRH_MAX_DWIDTH-1
                           generate
      -------------------------------------------------------------------------
      -- NAME: SYNC_RDREG_PRHWIDTH_GEN
      -------------------------------------------------------------------------
      -- Description: Generate read registers for synchronous interface
      -------------------------------------------------------------------------
      SYNC_RDREG_PRHWIDTH_GEN: for j in 0 to C_PRH_MAX_DWIDTH/BYTE_SIZE-1
                               generate
        -----------------------------------------------------------------------
        -- NAME: SYNC_RDREG_BYTE_GEN
        -----------------------------------------------------------------------
        -- Description: Generate read registers for synchronous interface
        -----------------------------------------------------------------------
        SYNC_RDREG_BYTE_GEN: for k in 0 to BYTE_SIZE-1 generate
        attribute ASYNC_REG : string;
        attribute ASYNC_REG of SYNC_RDREG_BIT: label is "TRUE";
        begin

          SYNC_RDREG_BIT: component FDRE
            port map (
                      Q  => sync_ip2bus_data(i*C_PRH_MAX_DWIDTH+j*BYTE_SIZE+k),
                      C  => Local_Clk,
                      CE => sync_rd_ce_int(i*C_PRH_MAX_DWIDTH/BYTE_SIZE+j),
                      D  => data_in(j*BYTE_SIZE+k),
                      R  => Local_Rst
                     );
        end generate SYNC_RDREG_BYTE_GEN;
      end generate SYNC_RDREG_PRHWIDTH_GEN;
    end generate SYNC_RDREG_PLBWIDTH_GEN;

  end generate SOME_DEV_SYNC_GEN;

  -----------------------------------------------------------------------------
  -- NAME: SOME_DEV_ASYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: Some or all devices are configured as asynchronous devices
  -----------------------------------------------------------------------------
  SOME_DEV_ASYNC_GEN: if NO_PRH_ASYNC = 0 generate

    -------------------------------------------------------------------------
    -- NAME: STEER_ASYNC_CE_PROCESS
    -------------------------------------------------------------------------
    -- Description: Generate data enables for asynchronous interface
    --              after steering to the appropriate byte lane
    -------------------------------------------------------------------------
    STEER_ASYNC_CE_PROCESS: process(Dev_dbus_width, steer_index_i, Async_en)
    begin

      steer_async_ce <= (others => '0');

      case Dev_dbus_width is

        when "001"  =>
          for i in 0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE -1 loop
            if steer_index_i = conv_std_logic_vector(i, ADDRCNT_WIDTH) then
              steer_async_ce(i) <= Async_en;
            end if;
          end loop;

        when "010" =>
           for i in 0 to C_SPLB_NATIVE_DWIDTH/(BYTE_SIZE*2) -1 loop
             if steer_index_i = conv_std_logic_vector(i, ADDRCNT_WIDTH) then
               steer_async_ce(i*2)   <= Async_en;
               steer_async_ce(i*2+1) <= Async_en;
             end if;
           end loop;

        when "100" =>
          for i in 0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1 loop
            steer_async_ce(i) <= Async_en;
          end loop;

        when others =>
          steer_async_ce <= (others => '0');
      end case;
    end process STEER_ASYNC_CE_PROCESS;


    ---------------------------------------------------------------------------
    -- NAME: ALL_DEV_DWIDTH_MATCH_GEN
    ---------------------------------------------------------------------------
    -- Description: If not all device employs data width matching, then
    --              generate data enables without steering
    ---------------------------------------------------------------------------

    ALL_DEV_DWIDTH_MATCH_GEN: if ALL_PRH_DWIDTH_MATCH = 0 generate

      -------------------------------------------------------------------------
      -- NAME: NO_STEER_ASYNC_CE_PROCESS
      -------------------------------------------------------------------------
      -- Description: Generate data enables without steering for asynchronous
      --              interface
      -------------------------------------------------------------------------
      NO_STEER_ASYNC_CE_PROCESS: process(Dev_dbus_width, Async_en)
      begin

        no_steer_async_ce       <= (others => '0');

        case Dev_dbus_width is

          when "001"  =>
            no_steer_async_ce(0) <= Async_en;

          when "010" =>
            for i in 0 to 1 loop
              no_steer_async_ce(i) <= Async_en;
            end loop;

          when "100" =>
            for i in 0 to 3 loop
              no_steer_async_ce(i) <= Async_en;
            end loop;

          when others =>
            no_steer_async_ce   <= (others => '0');

        end case;
      end process NO_STEER_ASYNC_CE_PROCESS;

    end generate ALL_DEV_DWIDTH_MATCH_GEN;

    ---------------------------------------------------------------------------
    -- NAME: NOT_ALL_DEV_DWIDTH_MATCH_GEN
    -------- ------------------------------------------------------------------
    -- Description: If all device employs data width matching, then
    --              non-steered data enables are not required
    ---------------------------------------------------------------------------

    NOT_ALL_DEV_DWIDTH_MATCH_GEN: if ALL_PRH_DWIDTH_MATCH = 1 generate

      no_steer_async_ce <= (others => '0');

    end generate NOT_ALL_DEV_DWIDTH_MATCH_GEN;


    -- Generate data enables for the current device
    async_ce_i <= no_steer_async_ce when Dev_dwidth_match = '0'
                  else steer_async_ce;

    Async_ce <= async_ce_i;

    ---------------------------------------------------------------------------
    -- NAME: ASYNC_RD_CE_GEN
    ---------------------------------------------------------------------------
    -- Description: Qualify the data enables for the current device with the
    --              read signal for registering read data from asynchronous
    --              interface
    ---------------------------------------------------------------------------
    ASYNC_RD_CE_GEN: for i in 0 to C_SPLB_NATIVE_DWIDTH/BYTE_SIZE-1 generate
      async_rd_ce(i) <= async_ce_i(i) and Dev_rnw;
    end generate ASYNC_RD_CE_GEN;

    ---------------------------------------------------------------------------
    -- NAME: ASYNC_RDREG_PLBWIDTH_GEN
    ---------------------------------------------------------------------------
    -- Description: Generate read registers for asynchronous interface
    ---------------------------------------------------------------------------
 ASYNC_RDREG_PLBWIDTH_GEN: for i in 0 to C_SPLB_NATIVE_DWIDTH/C_PRH_MAX_DWIDTH-1
                              generate
      -------------------------------------------------------------------------
      -- NAME: ASYNC_RDREG_PRHWIDTH_GEN
      -------------------------------------------------------------------------
      -- Description: Generate read registers for asynchronous interface
      -------------------------------------------------------------------------
      ASYNC_RDREG_PRHWIDTH_GEN: for j in 0 to C_PRH_MAX_DWIDTH/BYTE_SIZE-1
                                generate
        -----------------------------------------------------------------------
        -- NAME: ASYNC_RDREG_BYTE_GEN
        -----------------------------------------------------------------------
        -- Description: Generate read registers for asynchronous interface
        -----------------------------------------------------------------------
        ASYNC_RDREG_BYTE_GEN: for k in 0 to BYTE_SIZE-1 generate
        attribute ASYNC_REG : string;
        attribute ASYNC_REG of ASYNC_RDREG_BIT: label is "TRUE";
        begin
          ASYNC_RDREG_BIT: component FDRE
            port map (
                      Q  => async_ip2bus_data(i*C_PRH_MAX_DWIDTH+j*BYTE_SIZE+k),
                      C  => Bus2IP_Clk,
                      CE => async_rd_ce(i*C_PRH_MAX_DWIDTH/BYTE_SIZE+j),
                      D  => data_in(j*BYTE_SIZE+k),
                      R  => Bus2IP_Rst
                     );
        end generate ASYNC_RDREG_BYTE_GEN;
      end generate ASYNC_RDREG_PRHWIDTH_GEN;
    end generate ASYNC_RDREG_PLBWIDTH_GEN;

  end generate SOME_DEV_ASYNC_GEN;

  -----------------------------------------------------------------------------
  -- NAME: ALL_DEV_SYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: All devices are configured as synchronous devices
  -----------------------------------------------------------------------------
  ALL_DEV_SYNC_GEN: if NO_PRH_ASYNC = 1 generate

    ip2bus_data_int <= sync_ip2bus_data;
    Async_ce <= (others => '0');

  end generate ALL_DEV_SYNC_GEN;

  -----------------------------------------------------------------------------
  -- NAME: ALL_DEV_ASYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: All devices are configured as asynchronous devices
  -----------------------------------------------------------------------------
  ALL_DEV_ASYNC_GEN: if NO_PRH_SYNC = 1 generate

    ip2bus_data_int <= async_ip2bus_data;
    Sync_ce <= (others => '0');

  end generate ALL_DEV_ASYNC_GEN;

  -----------------------------------------------------------------------------
  -- NAME: DEV_SYNC_AND_ASYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: Some devices are configured as synchronous and some
  --              asynchronous
  -----------------------------------------------------------------------------
  DEV_SYNC_AND_ASYNC_GEN: if NO_PRH_SYNC = 0 and NO_PRH_ASYNC = 0 generate

    ip2bus_data_int <= async_ip2bus_data when Dev_sync = '0'
                       else sync_ip2bus_data;

  end generate DEV_SYNC_AND_ASYNC_GEN;


  IP2Bus_Data <= ip2bus_data_int when (Bus2IP_RNW = '1' and Dev_in_access = '1')
                 else (others => '0');

end generate DEV_DWIDTH_MATCH_GEN;

end architecture imp;
--------------------------------end of file------------------------------------


------------------------------------------------------------------------------
-- async_cntl.vhd - entity/architecture pair
------------------------------------------------------------------------------
-- ************************************************************************
-- ** DISCLAIMER OF LIABILITY                                            **
-- **                                                                    **
-- ** This file contains proprietary and confidential information of     **
-- ** Xilinx, Inc. ("Xilinx"), that is distributed under a license       **
-- ** from Xilinx, and may be used, copied and/or disclosed only         **
-- ** pursuant to the terms of a valid license agreement with Xilinx.    **
-- **                                                                    **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION              **
-- ** ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER         **
-- ** EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT                **
-- ** LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,          **
-- ** MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx      **
-- ** does not warrant that functions included in the Materials will     **
-- ** meet the requirements of Licensee, or that the operation of the    **
-- ** Materials will be uninterrupted or error-free, or that defects     **
-- ** in the Materials will be corrected. Furthermore, Xilinx does       **
-- ** not warrant or make any representations regarding use, or the      **
-- ** results of the use, of the Materials in terms of correctness,      **
-- ** accuracy, reliability or otherwise.                                **
-- **                                                                    **
-- ** Xilinx products are not designed or intended to be fail-safe,      **
-- ** or for use in any application requiring fail-safe performance,     **
-- ** such as life-support or safety devices or systems, Class III       **
-- ** medical devices, nuclear facilities, applications related to       **
-- ** the deployment of airbags, or any other applications that could    **
-- ** lead to death, personal injury or severe property or               **
-- ** environmental damage (individually and collectively, "critical     **
-- ** applications"). Customer assumes the sole risk and liability       **
-- ** of any use of Xilinx products in critical applications,            **
-- ** subject only to applicable laws and regulations governing          **
-- ** limitations on product liability.                                  **
-- **                                                                    **
-- ** Copyright 2005, 2006, 2008, 2009 Xilinx, Inc.                      **
-- ** All rights reserved.                                               **
-- **                                                                    **
-- ** This disclaimer and copyright notice must be retained as part      **
-- ** of this file at all times.                                         **
-- ************************************************************************

------------------------------------------------------------------------------
-- Filename:       async_cntl.vhd
-- Version:        v1.00.a
-- Description:    This is the top level file for "EPC asynch control logic",
--                 includes the logic of generation of asynch logic signals
-- VHDL-Standard:  VHDL'93
------------------------------------------------------------------------------
-- Structure:
--             axi_epc.vhd
--               -axi_lite_ipif
--               -epc_core.vhd
--               -ipic_if_decode.vhd
--               -sync_cntl.vhd
--               -async_cntl.vhd
--                  -- async_counters.vhd
--                  -- async_statemachine.vhd
--               -address_gen.vhd
--               -data_steer.vhd
--               -access_mux.vhd
------------------------------------------------------------------------------
-- Author   : VB
-- History  :
--
--  VB           08-24-2010 --  v2_0 version for AXI
-- ^^^^^^
--            The core updated for AXI based on xps_epc_v1_02_a
-- ~~~~~~
------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                 "*_n"
--      clock signals:                      "clk", "clk_div#", "clk_#x"
--      reset signals:                      "rst", "rst_n"
--      generics:                           "C_*"
--      user defined types:                 "*_TYPE"
--      state machine next state:           "*_ns"
--      state machine current state:        "*_cs"
--      combinatorial signals:              "*_com"
--      pipelined or register delay signals:"*_d#"
--      counter signals:                    "*cnt*"
--      clock enable signals:               "*_ce"
--      internal version of output port     "*_i"
--      device pins:                        "*_pin"
--      ports:                              - Names begin with Uppercase
--      processes:                          "*_PROCESS"
--      component instantiations:           "<ENTITY_>I_<#|FUNC>
------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.conv_std_logic_vector;
use IEEE.std_logic_misc.and_reduce;
use IEEE.std_logic_misc.or_reduce;

library axi_lite_ipif_v3_0_4;
library lib_pkg_v1_0_2;
use axi_lite_ipif_v3_0_4.ipif_pkg.INTEGER_ARRAY_TYPE;
use lib_pkg_v1_0_2.lib_pkg.max2;
use lib_pkg_v1_0_2.lib_pkg.log2;

library unisim;
use unisim.vcomponents.FDRE;


library axi_epc_v2_0_23;
use axi_epc_v2_0_23.async_statemachine;
use axi_epc_v2_0_23.async_counters;
------------------------------------------------------------------------------
-- Definition of Generics:
-----------------------------------------------------------------------------
--PRH_SYNC              --  To check the sync/async type of devices
--NO_PRH_SYNC           --  when = 1 : All the devices are asynchronous
--                      --  when = 0 : All the devices are synchronous
--C_SPLB_NATIVE_DWIDTH  --  PLB Bus Data Width
--C_NUM_PERIPHERALS     --  Number of peripherals present for particular case

--Note: consider x as 0  to C_NUM_PERIPHERALS-1
--C_PRHx_ADDR_TSU       --  Peripherl Device address set up time
--C_PRHx_ADDR_TH        --  Peripherl Device address hold time
--C_PRHx_WRN_WIDTH      --  Peripherl Device write control signal active width
--C_PRHx_DATA_TSU       --  Peripherl Device data set up time
--C_PRHx_RDN_WIDTH      --  Peripherl Device read control signal active width
--C_PRHx_DATA_TOUT      --  Peripherl Device data Data bus(PRH_Data) validity
--                      --  from falling edge of read signal(PRH_Rd_n)
--C_PRHx_DATA_TH        --  Device data bus(PRH_Data) hold with respect to
--                      --  rising edge of write signal(PRH_Wr_n)
--C_PRHx_DATA_TINV      --  Device data bus(PRH_Data) high impedance from
--                      --  rising edge of read (PRH_Rd_n)
--C_PRHx_RDY_TOUT       --  Device ready(PRH_Rdy)validity from the falling
--                      --  edge of read or write (PRH_Rd_n/PRH_Wr_n)
--C_PRHx_RDY_WIDTH      --  Maximum pulse width of device ready (PRH_Rdy)
--                      --  signal
--C_PRHx_ADS_WIDTH      --  Peripherl Device address strobe pulse width time
--C_PRHx_CSN_TSU        --  Peripherl Device chip select set up time
--C_PRHx_CSN_TH         --  Peripherl Device chip select hold time
--C_PRHx_WR_CYCLE       --  Peripherl Device cycle time for consecutive writes
--C_PRHx_RD_CYCLE       --  Peripherl Device cycle time for consecutive reads
--C_BUS_CLOCK_PERIOD_PS --  PLB clock period
--C_MAX_DWIDTH          --  Maximum of data bus width of all peripherals
--C_MAX_PERIPHERALS     --  Number of devices that can be connected

-----------------------------------------------------------------------------
-- Definition of Ports:
------------------------------------------------------------------------------
-- Definition of Input:
--Bus2IP_BE              --  Bus to IP byte enable
--Bus2IP_CS              --  Bus to IP chip select
--Bus2IP_RdCE            --  Bus to IP Read control enable
--Bus2IP_WrCE            --  Bus to IP Write control enable

--IPIC_Asynch_req        --  IPIC Asynch transaction request
--Dev_FIFO_access        --  Device FIFO Accress
--Dev_in_access          --  Device in access cycle

--Asynch_prh_rdy         --  Asynch Mode of Operation of external device
--Dev_dwidth_match       --  Peripherl Device Dwidth Match
--Dev_dbus_width         --  Peripherl Device Data Width
--Dev_bus_multiplexed    --  Peripherl Device address & data bus multiplexed
--Asynch_ce              --  Asynch chip enable
--Clk                    --  Input clock
--Rst                    --  Input Reset signal
-----------------------------------------------------------------------------
-- Definition of Output Ports:
-----------------------------------------------------------------------------
--Asynch_Wrack           -- asynchronous write acknowledge
--Asynch_Rdack           -- asynchronous read acknowledge
--Asynch_error           -- error acknowledge
--Asynch_Wr              --  Asynch write control signal
--Asynch_Rd              --  Asynch read control signal
--Asynch_en              --  Asynch enable to latch the read/write cycle data
--Asynch_addr_strobe     --  Asynch address latch(when bus is muxed)
--Asynch_addr_data_sel   --  Asynch address/data select(when bus is muxed)
--Asynch_chip_select     --  Asynchronous chip select
--Asynch_addr_cnt_ld     --  Asynch counter reset at the start/load for mux access
--Asynch_addr_cnt_en     --  Asynch address counter enable to increment next
-----------------------------------------------------------------------------

entity async_cntl is
  generic (

    PRH_SYNC            : std_logic_vector;
    NO_PRH_ASYNC        : integer;
    C_SPLB_NATIVE_DWIDTH: integer;
    ------------------------------------------
    C_PRH0_ADDR_TSU     : integer;
    C_PRH0_ADDR_TH      : integer;
    C_PRH0_WRN_WIDTH    : integer;
    C_PRH0_DATA_TSU     : integer;
    C_PRH0_RDN_WIDTH    : integer;
    C_PRH0_DATA_TOUT    : integer;
    C_PRH0_DATA_TH      : integer;
    C_PRH0_DATA_TINV    : integer;
    C_PRH0_RDY_TOUT     : integer;
    C_PRH0_RDY_WIDTH    : integer;
    C_PRH0_ADS_WIDTH    : integer;
    C_PRH0_CSN_TSU      : integer;
    C_PRH0_CSN_TH       : integer ;
    C_PRH0_WR_CYCLE     : integer ;
    C_PRH0_RD_CYCLE     : integer ;
     ------------------------------------------
    C_PRH1_ADDR_TSU     : integer ;
    C_PRH1_ADDR_TH      : integer ;
    C_PRH1_WRN_WIDTH    : integer ;
    C_PRH1_DATA_TSU     : integer ;
    C_PRH1_RDN_WIDTH    : integer ;
    C_PRH1_DATA_TOUT    : integer ;
    C_PRH1_DATA_TH      : integer ;
    C_PRH1_DATA_TINV    : integer ;
    C_PRH1_RDY_TOUT     : integer ;
    C_PRH1_RDY_WIDTH    : integer ;
    C_PRH1_ADS_WIDTH    : integer ;
    C_PRH1_CSN_TSU      : integer ;
    C_PRH1_CSN_TH       : integer ;
    C_PRH1_WR_CYCLE     : integer ;
    C_PRH1_RD_CYCLE     : integer ;
    ------------------------------------------
    C_PRH2_ADDR_TSU     : integer ;
    C_PRH2_ADDR_TH      : integer ;
    C_PRH2_WRN_WIDTH    : integer ;
    C_PRH2_DATA_TSU     : integer ;
    C_PRH2_RDN_WIDTH    : integer ;
    C_PRH2_DATA_TOUT    : integer ;
    C_PRH2_DATA_TH      : integer ;
    C_PRH2_DATA_TINV    : integer ;
    C_PRH2_RDY_TOUT     : integer ;
    C_PRH2_RDY_WIDTH    : integer ;
    C_PRH2_ADS_WIDTH    : integer ;
    C_PRH2_CSN_TSU      : integer ;
    C_PRH2_CSN_TH       : integer ;
    C_PRH2_WR_CYCLE     : integer ;
    C_PRH2_RD_CYCLE     : integer ;
    ------------------------------------------
    C_PRH3_ADDR_TSU     : integer ;
    C_PRH3_ADDR_TH      : integer ;
    C_PRH3_WRN_WIDTH    : integer ;
    C_PRH3_DATA_TSU     : integer ;
    C_PRH3_RDN_WIDTH    : integer ;
    C_PRH3_DATA_TOUT    : integer ;
    C_PRH3_DATA_TH      : integer ;
    C_PRH3_DATA_TINV    : integer ;
    C_PRH3_RDY_TOUT     : integer ;
    C_PRH3_RDY_WIDTH    : integer ;
    C_PRH3_ADS_WIDTH    : integer ;
    C_PRH3_CSN_TSU      : integer ;
    C_PRH3_CSN_TH       : integer ;
    C_PRH3_WR_CYCLE     : integer ;
    C_PRH3_RD_CYCLE     : integer ;
    ------------------------------------------
    C_BUS_CLOCK_PERIOD_PS : integer;
    --C_MAX_DWIDTH          : integer;
    C_NUM_PERIPHERALS     : integer;
    C_MAX_PERIPHERALS     : integer
    ------------------------------------------
    );
port (

      Bus2IP_CS           :  in std_logic_vector(0 to C_NUM_PERIPHERALS-1);
      Bus2IP_RdCE         :  in std_logic_vector(0 to C_NUM_PERIPHERALS-1);
      Bus2IP_WrCE         :  in std_logic_vector(0 to C_NUM_PERIPHERALS-1);
      Bus2IP_BE           :  in std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8 -1);
      Bus2IP_RNW          :  in std_logic;

      IPIC_Asynch_req     :  in std_logic;
      Dev_FIFO_access     :  in std_logic;
      Dev_in_access       :  in std_logic;

      Asynch_prh_rdy      :  in std_logic;
      Dev_dwidth_match    :  in std_logic;
      --Dev_dbus_width      :  in std_logic_vector(0 to 2);
      Dev_bus_multiplexed :  in std_logic;
      Asynch_ce           :  in std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8 -1);

      Asynch_Wrack        :  out std_logic;
      Asynch_Rdack        :  out std_logic;
      Asynch_error        :  out std_logic;

      Asynch_Wr           :  out std_logic;
      Asynch_Rd           :  out std_logic;
      Asynch_en           :  out std_logic;

      Asynch_addr_strobe  :  out std_logic;
      Asynch_addr_data_sel:  out std_logic;
      Asynch_data_sel     :  out std_logic;
      Asynch_chip_select  :  out std_logic_vector(0 to C_NUM_PERIPHERALS-1);
      Asynch_addr_cnt_ld  :  out std_logic;
      Asynch_addr_cnt_en  :  out std_logic;
-- Clocks and reset
      Clk                 :  in  std_logic;
      Rst                 :  in  std_logic
      );
end entity async_cntl;
------------------------------------------------------------------------------
architecture imp of async_cntl is

attribute ASYNC_REG : string;

------------------------------------------------------------------------------
-- Function : FindMaxWidth
-- This function is used by all calculations.
-- The main logic behind this function is, the max width of respective
-- parameters will be calculated, based upon whether the device is asynch
-- device or not.If the device is asynch device then only the parameter
-- of the respective array will be taken into consideration for further
-- calculation. The SYNC_ARRAY  will give the clear idea about the
-- type of devices (asynch/sync)

function FindMaxWidth(  no_of_devices  : integer;
                        prh_wait_width : INTEGER_ARRAY_TYPE;
                        sync_vector    : std_logic_vector
                        )
                        return integer is
variable temp_max : integer  := 1;
begin
for i in 0 to (no_of_devices-1) loop
    if sync_vector(i) = '0' then
       temp_max := max2(temp_max,prh_wait_width(i));
    end if;
end loop;
return temp_max;
end function FindMaxWidth;
------------------------------------------------------------------------------
-- Declaration of Constants
------------------------------------------------------------------------------
--ADDRESS HOLD TIME
--This calculation is applicable for devices with MUXed buses
--get the address hold up generics for all the peripherals
--the calculation is done by comparing 1 or C_PRHx_ADDR_TH/C_BUS_CLOCK_PERIOD_PS
--value. this gives precise values of the ADDRx_TH.

constant ADDR_TH0 : integer:=   (C_PRH0_ADDR_TH/C_BUS_CLOCK_PERIOD_PS)+1;
constant ADDR_TH1 : integer:=   (C_PRH1_ADDR_TH/C_BUS_CLOCK_PERIOD_PS)+1;
constant ADDR_TH2 : integer:=   (C_PRH2_ADDR_TH/C_BUS_CLOCK_PERIOD_PS)+1;
constant ADDR_TH3 : integer:=   (C_PRH3_ADDR_TH/C_BUS_CLOCK_PERIOD_PS)+1;

-- convert the generics into the integer to define the width of the counter
constant ADDR_TH0_WIDTH : integer := max2(1,log2(ADDR_TH0+1));
constant ADDR_TH1_WIDTH : integer := max2(1,log2(ADDR_TH1+1));
constant ADDR_TH2_WIDTH : integer := max2(1,log2(ADDR_TH2+1));
constant ADDR_TH3_WIDTH : integer := max2(1,log2(ADDR_TH3+1));

-- to make the width of counter independent of manual calculation
constant ADDR_TH_ARRAY : INTEGER_ARRAY_TYPE(0 to C_MAX_PERIPHERALS-1) :=
(
 ADDR_TH0_WIDTH,
 ADDR_TH1_WIDTH,
 ADDR_TH2_WIDTH,
 ADDR_TH3_WIDTH
);

constant MAX_ADDR_TH_CNT_WIDTH: integer :=
    FindMaxWidth(C_NUM_PERIPHERALS,ADDR_TH_ARRAY,PRH_SYNC);

constant ADDR_HOLD_CNTR0:std_logic_vector(0 to MAX_ADDR_TH_CNT_WIDTH-1)
:= conv_std_logic_vector(ADDR_TH0, MAX_ADDR_TH_CNT_WIDTH);

constant ADDR_HOLD_CNTR1:std_logic_vector(0 to MAX_ADDR_TH_CNT_WIDTH-1)
:= conv_std_logic_vector(ADDR_TH1, MAX_ADDR_TH_CNT_WIDTH);

constant ADDR_HOLD_CNTR2:std_logic_vector(0 to MAX_ADDR_TH_CNT_WIDTH-1)
:= conv_std_logic_vector(ADDR_TH2, MAX_ADDR_TH_CNT_WIDTH);

constant ADDR_HOLD_CNTR3:std_logic_vector(0 to MAX_ADDR_TH_CNT_WIDTH-1)
:= conv_std_logic_vector(ADDR_TH3, MAX_ADDR_TH_CNT_WIDTH);

-- this array stores the values for the adress hold up time for devices
type ADDR_HOLDCNT_ARRAY_TYPE is array (0 to C_MAX_PERIPHERALS-1) of
              std_logic_vector(0 to MAX_ADDR_TH_CNT_WIDTH-1);
constant ADDR_HOLDCNTR_ARRAY : ADDR_HOLDCNT_ARRAY_TYPE :=
  (
  ADDR_HOLD_CNTR0,
  ADDR_HOLD_CNTR1,
  ADDR_HOLD_CNTR2,
  ADDR_HOLD_CNTR3
  );
------------------------------------------------------------------------------
-- CHIP SELECT/DATA HOLD/ADDR HOLD calculation
-- ADDRESS HOLD TIME/DATA HOLD TIME/CHIP SELECT HOLD TIME
-- This calculation is applicable for NON-MUXed Asynch devices
-- This constant is applicable for DATA Hold and Chip Select and Address Hold
-- Time. It is a max of Chip select hold and Data Hold and Address Hold period
-- the calculation is done by comparing 1 or max of C_PRH0_DATA_TH,C_PRH0_CSN_TH
-- and C_PRH0_ADDR_TH divided by C_BUS_CLOCK_PERIOD_PS value.
-- this gives precise values of the ADDRx_TH.

constant ADDR_DATA_CS_TH0 : integer :=
(max2(1,
(max2
(max2(C_PRH0_DATA_TH,C_PRH0_CSN_TH),C_PRH0_ADDR_TH)/C_BUS_CLOCK_PERIOD_PS)+1));

constant ADDR_DATA_CS_TH1 : integer :=
(max2(1,
(max2
(max2(C_PRH1_DATA_TH,C_PRH1_CSN_TH),C_PRH1_ADDR_TH)/C_BUS_CLOCK_PERIOD_PS)+1));

constant ADDR_DATA_CS_TH2 : integer :=
(max2(1,
(max2
(max2(C_PRH2_DATA_TH,C_PRH2_CSN_TH),C_PRH2_ADDR_TH)/C_BUS_CLOCK_PERIOD_PS)+1));

constant ADDR_DATA_CS_TH3 : integer :=
(max2(1,
(max2
(max2(C_PRH3_DATA_TH,C_PRH3_CSN_TH),C_PRH3_ADDR_TH)/C_BUS_CLOCK_PERIOD_PS)+1));

-- convert the generics into the integer to define the width of the counter
constant ADDR_DATA_CS_TH0_WIDTH : integer := max2(1,log2(ADDR_DATA_CS_TH0+1));
constant ADDR_DATA_CS_TH1_WIDTH : integer := max2(1,log2(ADDR_DATA_CS_TH1+1));
constant ADDR_DATA_CS_TH2_WIDTH : integer := max2(1,log2(ADDR_DATA_CS_TH2+1));
constant ADDR_DATA_CS_TH3_WIDTH : integer := max2(1,log2(ADDR_DATA_CS_TH3+1));

-- to make the width of counter independent of manual calculation
-- Pass this array to FindMaxWidth function
constant ADDR_DATA_CS_TH_ARRAY :
        INTEGER_ARRAY_TYPE(0 to C_MAX_PERIPHERALS-1) :=
(
 ADDR_DATA_CS_TH0_WIDTH,
 ADDR_DATA_CS_TH1_WIDTH,
 ADDR_DATA_CS_TH2_WIDTH,
 ADDR_DATA_CS_TH3_WIDTH
);

-- the max value is calculated for those devices, which are asynch type
-- PRH_SYNC will be directly taken from the epc_core.vhd file
constant MAX_ADDR_DATA_CS_TH_CNT_WIDTH: integer :=
FindMaxWidth(C_NUM_PERIPHERALS,ADDR_DATA_CS_TH_ARRAY,PRH_SYNC);

constant ADDR_DATA_CS_HOLD_CNTR0:
    std_logic_vector(0 to MAX_ADDR_DATA_CS_TH_CNT_WIDTH-1)
    := conv_std_logic_vector(ADDR_DATA_CS_TH0, MAX_ADDR_DATA_CS_TH_CNT_WIDTH);

constant ADDR_DATA_CS_HOLD_CNTR1:
    std_logic_vector(0 to MAX_ADDR_DATA_CS_TH_CNT_WIDTH-1)
    := conv_std_logic_vector(ADDR_DATA_CS_TH1, MAX_ADDR_DATA_CS_TH_CNT_WIDTH);

constant ADDR_DATA_CS_HOLD_CNTR2:
    std_logic_vector(0 to MAX_ADDR_DATA_CS_TH_CNT_WIDTH-1)
    := conv_std_logic_vector(ADDR_DATA_CS_TH2, MAX_ADDR_DATA_CS_TH_CNT_WIDTH);

constant ADDR_DATA_CS_HOLD_CNTR3:
    std_logic_vector(0 to MAX_ADDR_DATA_CS_TH_CNT_WIDTH-1)
    := conv_std_logic_vector(ADDR_DATA_CS_TH3, MAX_ADDR_DATA_CS_TH_CNT_WIDTH);

-- this array stores the values for the data hold up time for devices
type ADDR_DATA_HOLD_CNT_ARRAY_TYPE is array (0 to C_MAX_PERIPHERALS-1) of
                  std_logic_vector(0 to MAX_ADDR_DATA_CS_TH_CNT_WIDTH-1);
constant ADDR_DATA_HOLD_CNTR_ARRAY : ADDR_DATA_HOLD_CNT_ARRAY_TYPE :=
  (
  ADDR_DATA_CS_HOLD_CNTR0,
  ADDR_DATA_CS_HOLD_CNTR1,
  ADDR_DATA_CS_HOLD_CNTR2,
  ADDR_DATA_CS_HOLD_CNTR3
  );
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- READ CONTROL SIGNAL
-- Read signal (PRH_RDn) low time is the maximum of C_PRHx_RDN_WIDTH and
-- C_PRHx_DATA_TOUT
-- the calculation is done by comparing 1 or max of C_PRH0_RDN_WIDTH
-- and C_PRH0_DATA_TOUT divided by C_BUS_CLOCK_PERIOD_PS value.
-- this gives precise values of the RDN_MAXx.

constant RDN_MAX0 : integer  :=
      (max2(1,
      (max2(C_PRH0_RDN_WIDTH,C_PRH0_DATA_TOUT)/C_BUS_CLOCK_PERIOD_PS)+1));
constant RDN_MAX1 : integer :=
      (max2(1,
      (max2(C_PRH1_RDN_WIDTH,C_PRH1_DATA_TOUT)/C_BUS_CLOCK_PERIOD_PS)+1));
constant RDN_MAX2 : integer :=
      (max2(1,
      (max2(C_PRH2_RDN_WIDTH,C_PRH2_DATA_TOUT)/C_BUS_CLOCK_PERIOD_PS)+1));
constant RDN_MAX3 : integer :=
      (max2(1,
      (max2(C_PRH3_RDN_WIDTH,C_PRH3_DATA_TOUT)/C_BUS_CLOCK_PERIOD_PS)+1));

constant RDN_CNT_WIDTH0: integer := max2(1,log2(RDN_MAX0+1));
constant RDN_CNT_WIDTH1: integer := max2(1,log2(RDN_MAX1+1));
constant RDN_CNT_WIDTH2: integer := max2(1,log2(RDN_MAX2+1));
constant RDN_CNT_WIDTH3: integer := max2(1,log2(RDN_MAX3+1));

constant RD_CNT_ARRAY : INTEGER_ARRAY_TYPE(0 to C_MAX_PERIPHERALS-1) :=
(
        RDN_CNT_WIDTH0,
        RDN_CNT_WIDTH1,
        RDN_CNT_WIDTH2,
        RDN_CNT_WIDTH3
 );

-- the max value is calculated for those devices, which are asynch type
-- PRH_SYNC will be directly taken from the epc_core.vhd file
constant MAX_RDN_CNT_WIDTH: integer :=
FindMaxWidth(C_NUM_PERIPHERALS,RD_CNT_ARRAY,PRH_SYNC);

------------------------------------------------------------------------------
-- WRITE CONTROL SIGNAL
-- Write signal (PRH_WRn) low time is the maximum of C_PRHx_WRN_WIDTH and
-- C_PRHx_DATA_TSU
-- the calculation is done by comparing 1 or max of C_PRH0_WRN_WIDTH
-- and C_PRH0_DATA_TSU divided by C_BUS_CLOCK_PERIOD_PS value.
-- this gives precise values of the WRN_MAXx.

constant WRN_MAX0 : integer
        :=(max2(1,
          (max2(C_PRH0_WRN_WIDTH,C_PRH0_DATA_TSU)/C_BUS_CLOCK_PERIOD_PS)+1));
constant WRN_MAX1 : integer
        :=(max2(1,
          (max2(C_PRH1_WRN_WIDTH,C_PRH1_DATA_TSU)/C_BUS_CLOCK_PERIOD_PS)+1));
constant WRN_MAX2 : integer
        :=(max2(1,
          (max2(C_PRH2_WRN_WIDTH,C_PRH2_DATA_TSU)/C_BUS_CLOCK_PERIOD_PS)+1));
constant WRN_MAX3 : integer
        :=(max2(1,
          (max2(C_PRH3_WRN_WIDTH,C_PRH3_DATA_TSU)/C_BUS_CLOCK_PERIOD_PS)+1));

constant WRN_CNT_WIDTH0 : integer := max2(1,log2(WRN_MAX0+1));
constant WRN_CNT_WIDTH1 : integer := max2(1,log2(WRN_MAX1+1));
constant WRN_CNT_WIDTH2 : integer := max2(1,log2(WRN_MAX2+1));
constant WRN_CNT_WIDTH3 : integer := max2(1,log2(WRN_MAX3+1));

constant WR_CNT_ARRAY : INTEGER_ARRAY_TYPE(0 to C_MAX_PERIPHERALS-1) :=
(
        WRN_CNT_WIDTH0,
        WRN_CNT_WIDTH1,
        WRN_CNT_WIDTH2,
        WRN_CNT_WIDTH3
 );

-- the max value is calculated for those devices, which are asynch type
-- PRH_SYNC will be directly taken from the epc_core.vhd file
constant MAX_WRN_CNT_WIDTH: integer :=
FindMaxWidth(C_NUM_PERIPHERALS,WR_CNT_ARRAY,PRH_SYNC);
------------------------------------------------------------------------------
--calculate the max width of Read and Write calculation
constant MAX_CONTROL_CNT_WIDTH : integer :=
max2(MAX_WRN_CNT_WIDTH,MAX_RDN_CNT_WIDTH);
------------------------------------------------------------------------------
constant TRDCNT_0 :
                std_logic_vector(0 to MAX_CONTROL_CNT_WIDTH-1)
                := conv_std_logic_vector(RDN_MAX0, MAX_CONTROL_CNT_WIDTH);

constant TRDCNT_1 :
                std_logic_vector(0 to MAX_CONTROL_CNT_WIDTH-1)
                := conv_std_logic_vector(RDN_MAX1, MAX_CONTROL_CNT_WIDTH);

constant TRDCNT_2 :
                std_logic_vector(0 to MAX_CONTROL_CNT_WIDTH-1)
                := conv_std_logic_vector(RDN_MAX2, MAX_CONTROL_CNT_WIDTH);

constant TRDCNT_3 :
                std_logic_vector(0 to MAX_CONTROL_CNT_WIDTH-1)
                := conv_std_logic_vector(RDN_MAX3, MAX_CONTROL_CNT_WIDTH);

--this array stores the values for read control signal activated period value
type RDCNT_ARRAY_TYPE is array (0 to C_MAX_PERIPHERALS-1) of
             std_logic_vector(0 to MAX_CONTROL_CNT_WIDTH-1);
constant TRD_CNTR_ARRAY : RDCNT_ARRAY_TYPE :=
        (
            TRDCNT_0,
            TRDCNT_1,
            TRDCNT_2,
            TRDCNT_3
        );
-----------------------------------------------------------------------------
-- convert the constants into std_logic_vector
constant TWRCNT_0 :
                std_logic_vector(0 to MAX_CONTROL_CNT_WIDTH-1)
                := conv_std_logic_vector(WRN_MAX0, MAX_CONTROL_CNT_WIDTH);
constant TWRCNT_1 :
                std_logic_vector(0 to MAX_CONTROL_CNT_WIDTH-1)
                := conv_std_logic_vector(WRN_MAX1, MAX_CONTROL_CNT_WIDTH);
constant TWRCNT_2 :
                std_logic_vector(0 to MAX_CONTROL_CNT_WIDTH-1)
                := conv_std_logic_vector(WRN_MAX2, MAX_CONTROL_CNT_WIDTH);
constant TWRCNT_3 :
                std_logic_vector(0 to MAX_CONTROL_CNT_WIDTH-1)
               := conv_std_logic_vector(WRN_MAX3, MAX_CONTROL_CNT_WIDTH);

-- define the array of the std_logic_vector. It should be 2 dimentional array
-- whose height is determined by the C_MAX_PERIPHERALS and the depth is -- --
-- defined by max of the width of the WR counters.
type WRCNT_ARRAY_TYPE is array (0 to C_MAX_PERIPHERALS-1) of
                  std_logic_vector(0 to MAX_CONTROL_CNT_WIDTH-1);
constant TWR_CNTR_ARRAY : WRCNT_ARRAY_TYPE :=
        (   TWRCNT_0,
            TWRCNT_1,
            TWRCNT_2,
            TWRCNT_3
        );
------------------------------------------------------------------------------
--ADDRESS STROBE
--This signal is used to define address strobe width, when the device is in
-- multiplexed mode
-- the calculation is done by comparing 1 or max of C_PRH0_ADDR_TSU
-- and C_PRH0_ADS_WIDTH,C_PRH0_CSN_TSU divided by C_BUS_CLOCK_PERIOD_PS value.
-- this gives precise values of the ADS_WDTHx.

constant ADS_WDTH0: integer :=
(max2(1,
(max2
(max2(C_PRH0_ADDR_TSU,C_PRH0_ADS_WIDTH),C_PRH0_CSN_TSU)/C_BUS_CLOCK_PERIOD_PS)
+1));

constant ADS_WDTH1: integer :=
(max2(1,
(max2
(max2(C_PRH1_ADDR_TSU,C_PRH1_ADS_WIDTH),C_PRH1_CSN_TSU)/C_BUS_CLOCK_PERIOD_PS)
+1));

constant ADS_WDTH2: integer :=
(max2(1,
(max2
(max2(C_PRH2_ADDR_TSU,C_PRH2_ADS_WIDTH),C_PRH2_CSN_TSU)/C_BUS_CLOCK_PERIOD_PS)
+1));

constant ADS_WDTH3: integer :=
(max2(1,
(max2
(max2(C_PRH3_ADDR_TSU,C_PRH3_ADS_WIDTH),C_PRH3_CSN_TSU)/C_BUS_CLOCK_PERIOD_PS)
+1));

constant ADS_CNT_WIDTH0: integer := max2(1,log2(ADS_WDTH0+1));
constant ADS_CNT_WIDTH1: integer := max2(1,log2(ADS_WDTH1+1));
constant ADS_CNT_WIDTH2: integer := max2(1,log2(ADS_WDTH2+1));
constant ADS_CNT_WIDTH3: integer := max2(1,log2(ADS_WDTH3+1));

constant ADS_CNT_ARRAY : INTEGER_ARRAY_TYPE(0 to C_MAX_PERIPHERALS-1) :=
(
        ADS_CNT_WIDTH0,
        ADS_CNT_WIDTH1,
        ADS_CNT_WIDTH2,
        ADS_CNT_WIDTH3
 );
-- the max value is calculated for those devices, which are asynch type
-- PRH_SYNC will be directly taken from the epc_core.vhd file
constant MAX_ADS_CNT_WIDTH: integer :=
FindMaxWidth(C_NUM_PERIPHERALS,ADS_CNT_ARRAY,PRH_SYNC);

constant TADS_CNT_0: std_logic_vector(0 to MAX_ADS_CNT_WIDTH-1)
        :=conv_std_logic_vector(ADS_WDTH0,MAX_ADS_CNT_WIDTH);

constant TADS_CNT_1: std_logic_vector(0 to MAX_ADS_CNT_WIDTH-1)
        :=conv_std_logic_vector(ADS_WDTH1,MAX_ADS_CNT_WIDTH);

constant TADS_CNT_2: std_logic_vector(0 to MAX_ADS_CNT_WIDTH-1)
        :=conv_std_logic_vector(ADS_WDTH2,MAX_ADS_CNT_WIDTH);

constant TADS_CNT_3: std_logic_vector(0 to MAX_ADS_CNT_WIDTH-1)
        :=conv_std_logic_vector(ADS_WDTH3,MAX_ADS_CNT_WIDTH);

-- this array stores the values for the address strobe time for devices
type TADS_CNT_ARRAY_TYPE is array (0 to C_MAX_PERIPHERALS-1) of
                   std_logic_vector(0 to MAX_ADS_CNT_WIDTH-1);
constant TADS_CNT_ARRAY : TADS_CNT_ARRAY_TYPE :=
  (
  TADS_CNT_0,
  TADS_CNT_1,
  TADS_CNT_2,
  TADS_CNT_3
  );
-------------------------------------------------------------------------------
-- RECOVERY
-- bus muxed            (types) -- write recovery time
--                                              -- read recovery time
-- bus non-muxed        (types) -- write recovery time
--                                              -- read recovery time
-- In parameter declaration, the Read and Write Cycle period should be always
-- more than Read and Write control width period
-------------------------------------------------------------------------------
-- common calculation for write and read recovery
constant PRH_Wr_n0 : integer :=
        (C_PRH0_WR_CYCLE-C_PRH0_WRN_WIDTH);
constant PRH_Wr_n1 : integer :=
        (C_PRH1_WR_CYCLE-C_PRH1_WRN_WIDTH);
constant PRH_Wr_n2 : integer :=
        (C_PRH2_WR_CYCLE-C_PRH2_WRN_WIDTH);
constant PRH_Wr_n3 : integer :=
        (C_PRH3_WR_CYCLE-C_PRH3_WRN_WIDTH);

constant PRH_Rd_n0 : integer:=
        (C_PRH0_Rd_CYCLE-C_PRH0_RDN_WIDTH);
constant PRH_Rd_n1 : integer :=
        (C_PRH1_Rd_CYCLE-C_PRH1_RDN_WIDTH);
constant PRH_Rd_n2 : integer :=
        (C_PRH2_Rd_CYCLE-C_PRH2_RDN_WIDTH);
constant PRH_Rd_n3 : integer :=
        (C_PRH3_Rd_CYCLE-C_PRH3_RDN_WIDTH);
--------------------------------------------------------------------------------
-- RECOVERY + BUS MUXED + WRITE
-- The recovery time is maximum
-- of C_PRHx_CSN_TH and C_PRHx_DATA_TH and
-- [(C_PRHx_WR_CYCLE)-(C_PRHx_WRN_WIDTH)]
-- (ADDRESS HOLD & DATA HOLD & PRH_Wr_n)
-- the calculation is done by comparing 1 or max of C_PRH0_CSN_TH
-- and C_PRH0_DATA_TH,PRH_Wr_n0 divided by C_BUS_CLOCK_PERIOD_PS value.
-- this gives precise values of the WR_REC_MUXEDx.

constant WR_REC_MUXED0 : integer :=
(max2(1,
(max2(max2(C_PRH0_CSN_TH,C_PRH0_DATA_TH),PRH_Wr_n0)/C_BUS_CLOCK_PERIOD_PS)+1));

constant WR_REC_MUXED1 : integer :=
(max2(1,
(max2(max2(C_PRH1_CSN_TH,C_PRH1_DATA_TH),PRH_Wr_n1)/C_BUS_CLOCK_PERIOD_PS)+1));

constant WR_REC_MUXED2 : integer :=
(max2(1,
(max2(max2(C_PRH2_CSN_TH,C_PRH2_DATA_TH),PRH_Wr_n2)/C_BUS_CLOCK_PERIOD_PS)+1));

constant WR_REC_MUXED3 : integer :=
(max2(1,
(max2(max2(C_PRH3_CSN_TH,C_PRH3_DATA_TH),PRH_Wr_n3)/C_BUS_CLOCK_PERIOD_PS)+1));

constant WR_REC_MUXED_WIDTH0 : integer := max2(1,log2(WR_REC_MUXED0+1));
constant WR_REC_MUXED_WIDTH1 : integer := max2(1,log2(WR_REC_MUXED1+1));
constant WR_REC_MUXED_WIDTH2 : integer := max2(1,log2(WR_REC_MUXED2+1));
constant WR_REC_MUXED_WIDTH3 : integer := max2(1,log2(WR_REC_MUXED3+1));

constant WR_REC_CNT_MUXED_ARRAY :
                          INTEGER_ARRAY_TYPE(0 to C_MAX_PERIPHERALS-1) :=
(
        WR_REC_MUXED_WIDTH0,
        WR_REC_MUXED_WIDTH1,
        WR_REC_MUXED_WIDTH2,
        WR_REC_MUXED_WIDTH3
 );

-- the max value is calculated for those devices, which are asynch type
-- PRH_SYNC will be directly taken from the epc_core.vhd file
constant MAX_WR_REC_MUXED_CNT_WIDTH: integer :=
FindMaxWidth(C_NUM_PERIPHERALS,WR_REC_CNT_MUXED_ARRAY,PRH_SYNC);

constant WR_REC_MUXED_CNT0:
        std_logic_vector(0 to MAX_WR_REC_MUXED_CNT_WIDTH-1)
        := conv_std_logic_vector(WR_REC_MUXED0, MAX_WR_REC_MUXED_CNT_WIDTH);
constant WR_REC_MUXED_CNT1:
        std_logic_vector(0 to MAX_WR_REC_MUXED_CNT_WIDTH-1)
        := conv_std_logic_vector(WR_REC_MUXED1, MAX_WR_REC_MUXED_CNT_WIDTH);
constant WR_REC_MUXED_CNT2:
        std_logic_vector(0 to MAX_WR_REC_MUXED_CNT_WIDTH-1)
        := conv_std_logic_vector(WR_REC_MUXED2, MAX_WR_REC_MUXED_CNT_WIDTH);
constant WR_REC_MUXED_CNT3:
        std_logic_vector(0 to MAX_WR_REC_MUXED_CNT_WIDTH-1)
        := conv_std_logic_vector(WR_REC_MUXED3, MAX_WR_REC_MUXED_CNT_WIDTH);

type WR_REC_MUXED_CNT_ARRAY_TYPE is array (0 to C_MAX_PERIPHERALS-1) of
std_logic_vector(0 to MAX_WR_REC_MUXED_CNT_WIDTH-1);
constant WR_REC_MUXED_CNTR_ARRAY : WR_REC_MUXED_CNT_ARRAY_TYPE :=
(
WR_REC_MUXED_CNT0,
WR_REC_MUXED_CNT1,
WR_REC_MUXED_CNT2,
WR_REC_MUXED_CNT3
);
-------------------------------------------------------------------------------
-- RECOVERY + BUS MUXED + READ
-- The recovery time is maximum
-- of C_PRHx_CSN_TH and C_PRHx_DATA_TINV and
-- [(C_PRHx_RD_CYCLE)-(C_PRHx_RDN_WIDTH)]
-- (ADDRESS HOLD & DATA HOLD & PRH_Rd_n)
-- the calculation is done by comparing 1 or max of C_PRH0_CSN_TH
-- and C_PRH0_DATA_TINV,PRH_Rd_n0 divided by C_BUS_CLOCK_PERIOD_PS value.
-- this gives precise values of the RD_REC_MUXEDx.

constant RD_REC_MUXED0 : integer :=
(max2(1,
(max2(max2(C_PRH0_CSN_TH,C_PRH0_DATA_TINV),PRH_Rd_n0)/C_BUS_CLOCK_PERIOD_PS)+1
));

constant RD_REC_MUXED1 : integer :=
(max2(1,
(max2(max2(C_PRH1_CSN_TH,C_PRH1_DATA_TINV),PRH_Rd_n1)/C_BUS_CLOCK_PERIOD_PS)+1
));

constant RD_REC_MUXED2 : integer :=
(max2(1,
(max2(max2(C_PRH2_CSN_TH,C_PRH2_DATA_TINV),PRH_Rd_n2)/C_BUS_CLOCK_PERIOD_PS)+1
));

constant RD_REC_MUXED3 : integer :=
(max2(1,
(max2(max2(C_PRH3_CSN_TH,C_PRH3_DATA_TINV),PRH_Rd_n3)/C_BUS_CLOCK_PERIOD_PS)+1
));

constant RD_REC_MUXED_WIDTH0 : integer := max2(1,log2(RD_REC_MUXED0+1));
constant RD_REC_MUXED_WIDTH1 : integer := max2(1,log2(RD_REC_MUXED1+1));
constant RD_REC_MUXED_WIDTH2 : integer := max2(1,log2(RD_REC_MUXED2+1));
constant RD_REC_MUXED_WIDTH3 : integer := max2(1,log2(RD_REC_MUXED3+1));

constant RD_REC_CNT_MUXED_ARRAY :
                INTEGER_ARRAY_TYPE(0 to C_MAX_PERIPHERALS-1) :=
(
        RD_REC_MUXED_WIDTH0,
        RD_REC_MUXED_WIDTH1,
        RD_REC_MUXED_WIDTH2,
        RD_REC_MUXED_WIDTH3
 );

-- the max value is calculated for those devices, which are asynch type
-- PRH_SYNC will be directly taken from the epc_core.vhd file
constant MAX_RD_REC_MUXED_CNT_WIDTH: integer :=
FindMaxWidth(C_NUM_PERIPHERALS,RD_REC_CNT_MUXED_ARRAY,PRH_SYNC);

constant RD_REC_MUXED_CNT0:
        std_logic_vector(0 to MAX_RD_REC_MUXED_CNT_WIDTH-1)
        := conv_std_logic_vector(RD_REC_MUXED0, MAX_RD_REC_MUXED_CNT_WIDTH);
constant RD_REC_MUXED_CNT1:
        std_logic_vector(0 to MAX_RD_REC_MUXED_CNT_WIDTH-1)
        := conv_std_logic_vector(RD_REC_MUXED1, MAX_RD_REC_MUXED_CNT_WIDTH);
constant RD_REC_MUXED_CNT2:
        std_logic_vector(0 to MAX_RD_REC_MUXED_CNT_WIDTH-1)
        := conv_std_logic_vector(RD_REC_MUXED2, MAX_RD_REC_MUXED_CNT_WIDTH);
constant RD_REC_MUXED_CNT3:
        std_logic_vector(0 to MAX_RD_REC_MUXED_CNT_WIDTH-1)
        := conv_std_logic_vector(RD_REC_MUXED3, MAX_RD_REC_MUXED_CNT_WIDTH);

type RD_REC_MUXED_CNT_ARRAY_TYPE is array (0 to C_MAX_PERIPHERALS-1) of
std_logic_vector(0 to MAX_RD_REC_MUXED_CNT_WIDTH-1);
constant RD_REC_MUXED_CNTR_ARRAY : RD_REC_MUXED_CNT_ARRAY_TYPE :=
(
RD_REC_MUXED_CNT0,
RD_REC_MUXED_CNT1,
RD_REC_MUXED_CNT2,
RD_REC_MUXED_CNT3
);
-------------------------------------------------------------------------------
-- RECOVERY + BUS NON-MUXED + WRITE
-- The recovery time is maximum
-- of C_PRHx_ADDR and C_PRHx_CSN_TH and C_PRHx_DATA_TH and
-- [(C_PRHx_WR_CYCLE)-(C_PRHx_WRN_WIDTH)]
-- (ADDRESS HOLD & DATA HOLD & PRH_Wr_n)
-- the calculation is done by comparing 1 or max of C_PRH0_CSN_TH
-- and C_PRH0_DATA_TH,C_PRH0_ADDR_TH, PRH_Wr_n0 divided by C_BUS_CLOCK_PERIOD_PS
-- value. this gives precise values of the WR_REC_NON_MUXEDx.

constant WR_REC_NON_MUXED0 : integer :=
(max2(1,
(max2(max2(C_PRH0_CSN_TH,C_PRH0_DATA_TH),
         max2(C_PRH0_ADDR_TH,PRH_Wr_n0))/C_BUS_CLOCK_PERIOD_PS)+1));

constant WR_REC_NON_MUXED1 : integer :=
(max2(1,
(max2(max2(C_PRH1_CSN_TH,C_PRH1_DATA_TH),
         max2(C_PRH1_ADDR_TH,PRH_Wr_n1))/C_BUS_CLOCK_PERIOD_PS)+1));

constant WR_REC_NON_MUXED2 : integer :=
(max2(1,
(max2(max2(C_PRH2_CSN_TH,C_PRH2_DATA_TH),
         max2(C_PRH1_ADDR_TH,PRH_Wr_n2))/C_BUS_CLOCK_PERIOD_PS)+1));

constant WR_REC_NON_MUXED3 : integer :=
(max2(1,
(max2(max2(C_PRH3_CSN_TH,C_PRH3_DATA_TH),
         max2(C_PRH3_ADDR_TH,PRH_Wr_n3))/C_BUS_CLOCK_PERIOD_PS)+1));

constant WR_REC_NON_MUXED_WIDTH0 : integer:= max2(1,log2(WR_REC_NON_MUXED0+1));
constant WR_REC_NON_MUXED_WIDTH1 : integer:= max2(1,log2(WR_REC_NON_MUXED1+1));
constant WR_REC_NON_MUXED_WIDTH2 : integer:= max2(1,log2(WR_REC_NON_MUXED2+1));
constant WR_REC_NON_MUXED_WIDTH3 : integer:= max2(1,log2(WR_REC_NON_MUXED3+1));

constant WR_REC_CNT_NON_MUXED_ARRAY :
                INTEGER_ARRAY_TYPE(0 to C_MAX_PERIPHERALS-1) :=
(
        WR_REC_NON_MUXED_WIDTH0,
        WR_REC_NON_MUXED_WIDTH1,
        WR_REC_NON_MUXED_WIDTH2,
        WR_REC_NON_MUXED_WIDTH3
 );

-- the max value is calculated for those devices, which are asynch type
-- PRH_SYNC will be directly taken from the epc_core.vhd file
constant MAX_WR_REC_NON_MUXED_CNT_WIDTH: integer :=
FindMaxWidth(C_NUM_PERIPHERALS,WR_REC_CNT_NON_MUXED_ARRAY,PRH_SYNC);


constant WR_REC_NON_MUXED_CNT0:
std_logic_vector(0 to MAX_WR_REC_NON_MUXED_CNT_WIDTH-1)
:= conv_std_logic_vector(WR_REC_NON_MUXED0, MAX_WR_REC_NON_MUXED_CNT_WIDTH);

constant WR_REC_NON_MUXED_CNT1:
std_logic_vector(0 to MAX_WR_REC_NON_MUXED_CNT_WIDTH-1)
:= conv_std_logic_vector(WR_REC_NON_MUXED1, MAX_WR_REC_NON_MUXED_CNT_WIDTH);

constant WR_REC_NON_MUXED_CNT2:
std_logic_vector(0 to MAX_WR_REC_NON_MUXED_CNT_WIDTH-1)
:= conv_std_logic_vector(WR_REC_NON_MUXED2, MAX_WR_REC_NON_MUXED_CNT_WIDTH);

constant WR_REC_NON_MUXED_CNT3:
std_logic_vector(0 to MAX_WR_REC_NON_MUXED_CNT_WIDTH-1)
:= conv_std_logic_vector(WR_REC_NON_MUXED3, MAX_WR_REC_NON_MUXED_CNT_WIDTH);

type WR_REC_NON_MUXED_CNT_ARRAY_TYPE is array (0 to C_MAX_PERIPHERALS-1) of
std_logic_vector(0 to MAX_WR_REC_NON_MUXED_CNT_WIDTH-1);
constant WR_REC_NON_MUXED_CNTR_ARRAY : WR_REC_NON_MUXED_CNT_ARRAY_TYPE :=
(
WR_REC_NON_MUXED_CNT0,
WR_REC_NON_MUXED_CNT1,
WR_REC_NON_MUXED_CNT2,
WR_REC_NON_MUXED_CNT3
);
-------------------------------------------------------------------------------
-- RECOVERY + BUS NON-MUXED + READ
-- The recovery time is maximum
-- of C_PRHx_CSN_TH and C_PRHx_DATA_TINV and
-- [(C_PRHx_RD_CYCLE)-(C_PRHx_RDN_WIDTH)]
-- (ADDRESS HOLD & DATA HOLD & PRH_Rd_n)
-- the calculation is done by comparing 1 or max of C_PRH0_CSN_TH
-- and C_PRH0_DATA_TINV,C_PRH0_ADDR_TH,PRH_Rd_n0 divided by C_BUS_CLOCK_PERIOD_PS
-- value. this gives precise values of the RD_REC_NON_MUXEDx.

constant RD_REC_NON_MUXED0 : integer :=
(max2(1,
(max2(max2(C_PRH0_CSN_TH,C_PRH0_DATA_TINV),
         max2(C_PRH0_ADDR_TH,PRH_Rd_n0))/C_BUS_CLOCK_PERIOD_PS)+1));

constant RD_REC_NON_MUXED1 : integer :=
(max2(1,
(max2(max2(C_PRH1_CSN_TH,C_PRH1_DATA_TINV),
         max2(C_PRH1_ADDR_TH,PRH_Rd_n1))/C_BUS_CLOCK_PERIOD_PS)+1));

constant RD_REC_NON_MUXED2 : integer :=
(max2(1,
(max2(max2(C_PRH2_CSN_TH,C_PRH2_DATA_TINV),
         max2(C_PRH2_ADDR_TH,PRH_Rd_n2))/C_BUS_CLOCK_PERIOD_PS)+1));

constant RD_REC_NON_MUXED3 : integer :=
(max2(1,
(max2(max2(C_PRH3_CSN_TH,C_PRH3_DATA_TINV),
         max2(C_PRH3_ADDR_TH,PRH_Rd_n3))/C_BUS_CLOCK_PERIOD_PS)+1));

constant RD_REC_NON_MUXED_WIDTH0 : integer:= max2(1,log2(RD_REC_NON_MUXED0+1));
constant RD_REC_NON_MUXED_WIDTH1 : integer:= max2(1,log2(RD_REC_NON_MUXED1+1));
constant RD_REC_NON_MUXED_WIDTH2 : integer:= max2(1,log2(RD_REC_NON_MUXED2+1));
constant RD_REC_NON_MUXED_WIDTH3 : integer:= max2(1,log2(RD_REC_NON_MUXED3+1));

constant RD_REC_CNT_NON_MUXED_ARRAY :
                INTEGER_ARRAY_TYPE(0 to C_MAX_PERIPHERALS-1) :=
(
        RD_REC_NON_MUXED_WIDTH0,
        RD_REC_NON_MUXED_WIDTH1,
        RD_REC_NON_MUXED_WIDTH2,
        RD_REC_NON_MUXED_WIDTH3
 );
-- the max value is calculated for those devices, which are asynch type
-- PRH_SYNC will be directly taken from the epc_core.vhd file
constant MAX_RD_REC_NON_MUXED_CNT_WIDTH: integer :=
        FindMaxWidth(C_NUM_PERIPHERALS,RD_REC_CNT_NON_MUXED_ARRAY,PRH_SYNC);

constant RD_REC_NON_MUXED_CNT0:
std_logic_vector(0 to MAX_RD_REC_NON_MUXED_CNT_WIDTH-1)
:= conv_std_logic_vector(RD_REC_NON_MUXED0, MAX_RD_REC_NON_MUXED_CNT_WIDTH);

constant RD_REC_NON_MUXED_CNT1:
std_logic_vector(0 to MAX_RD_REC_NON_MUXED_CNT_WIDTH-1)
:= conv_std_logic_vector(RD_REC_NON_MUXED1, MAX_RD_REC_NON_MUXED_CNT_WIDTH);

constant RD_REC_NON_MUXED_CNT2:
std_logic_vector(0 to MAX_RD_REC_NON_MUXED_CNT_WIDTH-1)
:= conv_std_logic_vector(RD_REC_NON_MUXED2, MAX_RD_REC_NON_MUXED_CNT_WIDTH);

constant RD_REC_NON_MUXED_CNT3:
std_logic_vector(0 to MAX_RD_REC_NON_MUXED_CNT_WIDTH-1)
:= conv_std_logic_vector(RD_REC_NON_MUXED3, MAX_RD_REC_NON_MUXED_CNT_WIDTH);

type RD_REC_NON_MUXED_CNT_ARRAY_TYPE is array (0 to C_MAX_PERIPHERALS-1) of
                    std_logic_vector(0 to MAX_RD_REC_NON_MUXED_CNT_WIDTH-1);

constant RD_REC_NON_MUXED_CNTR_ARRAY : RD_REC_NON_MUXED_CNT_ARRAY_TYPE :=
(
RD_REC_NON_MUXED_CNT0,
RD_REC_NON_MUXED_CNT1,
RD_REC_NON_MUXED_CNT2,
RD_REC_NON_MUXED_CNT3
);

------------------------------------------------------------------------------
--constant MAX_WR_M_NM_WIDTH: integer
--:= max2(MAX_WR_REC_MUXED_CNT_WIDTH,MAX_WR_REC_NON_MUXED_CNT_WIDTH);

--constant MAX_RD_M_NM_WIDTH: integer
--:= max2(MAX_RD_REC_MUXED_CNT_WIDTH,MAX_RD_REC_NON_MUXED_CNT_WIDTH);
-------------------------------------------------------------------------------
-- This calulation is for the Device Ready Validity from the activation
-- edge of the control signals
-- The control signals are activated and then it is required to check the
-- readyness of the device.The device ready validity time is the time
-- determined by C_PRHx_RDY_TOUT generics
-- the calculation is done by comparing 1 or max of C_PRH0_RDY_TOUT
-- divided by C_BUS_CLOCK_PERIOD_PS value.
-- this gives precise values of the RD_REC_NON_MUXEDx.

constant RDY_TOUT0  : integer :=
        (max2(1,
        (C_PRH0_RDY_TOUT/C_BUS_CLOCK_PERIOD_PS)+1));
constant RDY_TOUT1  : integer :=
        (max2(1,
        (C_PRH1_RDY_TOUT/C_BUS_CLOCK_PERIOD_PS)+1));
constant RDY_TOUT2  : integer :=
        (max2(1,
        (C_PRH2_RDY_TOUT/C_BUS_CLOCK_PERIOD_PS)+1));
constant RDY_TOUT3  : integer :=
        (max2(1,
        (C_PRH3_RDY_TOUT/C_BUS_CLOCK_PERIOD_PS)+1));

constant RDY_TOUT_CNT_WIDTH0 : integer := max2(1,log2(RDY_TOUT0+1));
constant RDY_TOUT_CNT_WIDTH1 : integer := max2(1,log2(RDY_TOUT1+1));
constant RDY_TOUT_CNT_WIDTH2 : integer := max2(1,log2(RDY_TOUT2+1));
constant RDY_TOUT_CNT_WIDTH3 : integer := max2(1,log2(RDY_TOUT3+1));

--for optimisation purpose the max width is calculated only for asynch devices

constant RDY_TOUT_CNT_ARRAY : INTEGER_ARRAY_TYPE(0 to C_MAX_PERIPHERALS-1) :=
(
 RDY_TOUT_CNT_WIDTH0,
 RDY_TOUT_CNT_WIDTH1,
 RDY_TOUT_CNT_WIDTH2,
 RDY_TOUT_CNT_WIDTH3
);
constant MAX_RDY_TOUT_CNT_WIDTH: integer :=
         FindMaxWidth(C_NUM_PERIPHERALS,RDY_TOUT_CNT_ARRAY,PRH_SYNC);

constant RDY_TOUT_CNT_0 :
        std_logic_vector(0 to MAX_RDY_TOUT_CNT_WIDTH-1)
        := conv_std_logic_vector(RDY_TOUT0, MAX_RDY_TOUT_CNT_WIDTH);
constant RDY_TOUT_CNT_1 :
        std_logic_vector(0 to MAX_RDY_TOUT_CNT_WIDTH-1)
        := conv_std_logic_vector(RDY_TOUT1, MAX_RDY_TOUT_CNT_WIDTH);
constant RDY_TOUT_CNT_2 :
        std_logic_vector(0 to MAX_RDY_TOUT_CNT_WIDTH-1)
        := conv_std_logic_vector(RDY_TOUT2, MAX_RDY_TOUT_CNT_WIDTH);
constant RDY_TOUT_CNT_3 :
        std_logic_vector(0 to MAX_RDY_TOUT_CNT_WIDTH-1)
        := conv_std_logic_vector(RDY_TOUT3, MAX_RDY_TOUT_CNT_WIDTH);

--RDY_TOUT_CNT_ARRAY_TYPE array stores the values for the device ready
--validity time with respect to assertion of control signals
type RDY_TOUT_CNT_ARRAY_TYPE is array (0 to C_MAX_PERIPHERALS-1) of
std_logic_vector(0 to MAX_RDY_TOUT_CNT_WIDTH-1);
constant TRDY_TOUT_CNTR_ARRAY : RDY_TOUT_CNT_ARRAY_TYPE :=
  (
  RDY_TOUT_CNT_0,
  RDY_TOUT_CNT_1,
  RDY_TOUT_CNT_2,
  RDY_TOUT_CNT_3
  );
------------------------------------------------------------------------------
-- This calulation is for the device ready period for communication with host,
-- which starts from the activation of the control signals
-- The device ready time is the time determined by C_PRHx_RDY_WIDTH generics
-- The constant is of integer type and not integer range 1 to 31
-- This is by assumption: the device ready period may be much longer
-- the calculation is done by comparing 1 or max of C_PRH0_RDY_WIDTH
-- divided by C_BUS_CLOCK_PERIOD_PS value.
-- this gives precise values of the RDY_WIDTHx.

constant RDY_WIDTH0 : integer :=
        (max2(1,
        (C_PRH0_RDY_WIDTH/C_BUS_CLOCK_PERIOD_PS)+1));
constant RDY_WIDTH1 : integer :=
        (max2(1,
        (C_PRH1_RDY_WIDTH/C_BUS_CLOCK_PERIOD_PS)+1));
constant RDY_WIDTH2 : integer :=
        (max2(1,
        (C_PRH2_RDY_WIDTH/C_BUS_CLOCK_PERIOD_PS)+1));
constant RDY_WIDTH3 : integer :=
        (max2(1,
        (C_PRH3_RDY_WIDTH/C_BUS_CLOCK_PERIOD_PS)+1));

constant RDY_WIDTH_CNT_WIDTH0 : integer := max2(1,log2(RDY_WIDTH0+1));
constant RDY_WIDTH_CNT_WIDTH1 : integer := max2(1,log2(RDY_WIDTH1+1));
constant RDY_WIDTH_CNT_WIDTH2 : integer := max2(1,log2(RDY_WIDTH2+1));
constant RDY_WIDTH_CNT_WIDTH3 : integer := max2(1,log2(RDY_WIDTH3+1));

constant PRH_WIDTH_ARRAY : INTEGER_ARRAY_TYPE(0 to C_MAX_PERIPHERALS-1) :=
(
 RDY_WIDTH_CNT_WIDTH0,
 RDY_WIDTH_CNT_WIDTH1,
 RDY_WIDTH_CNT_WIDTH2,
 RDY_WIDTH_CNT_WIDTH3
);

constant MAX_RDY_WIDTH_CNT_WIDTH: integer :=
         FindMaxWidth(C_NUM_PERIPHERALS,PRH_WIDTH_ARRAY,PRH_SYNC);

constant RDY_WIDTH_CNT_0  :
         std_logic_vector(0 to MAX_RDY_WIDTH_CNT_WIDTH-1)
         := conv_std_logic_vector(RDY_WIDTH0, MAX_RDY_WIDTH_CNT_WIDTH);
constant RDY_WIDTH_CNT_1  :
         std_logic_vector(0 to MAX_RDY_WIDTH_CNT_WIDTH-1)
         := conv_std_logic_vector(RDY_WIDTH1, MAX_RDY_WIDTH_CNT_WIDTH);
constant RDY_WIDTH_CNT_2  :
         std_logic_vector(0 to MAX_RDY_WIDTH_CNT_WIDTH-1)
         := conv_std_logic_vector(RDY_WIDTH2, MAX_RDY_WIDTH_CNT_WIDTH);
constant RDY_WIDTH_CNT_3  :
         std_logic_vector(0 to MAX_RDY_WIDTH_CNT_WIDTH-1)
         := conv_std_logic_vector(RDY_WIDTH3, MAX_RDY_WIDTH_CNT_WIDTH);
-- RDY_WIDTH_CNT_ARRAY_TYPE array stores the values for the device ready
-- validity time with respect to assertion of control signals
type RDY_WIDTH_CNT_ARRAY_TYPE is array (0 to C_MAX_PERIPHERALS-1) of
std_logic_vector(0 to MAX_RDY_WIDTH_CNT_WIDTH-1);
constant TRDY_WIDTH_CNTR_ARRAY : RDY_WIDTH_CNT_ARRAY_TYPE :=
  (
  RDY_WIDTH_CNT_0,
  RDY_WIDTH_CNT_1,
  RDY_WIDTH_CNT_2,
  RDY_WIDTH_CNT_3
  );
------------------------------------------------------------------------------
-- signal declaration
------------------------------------------------------------------------------
-- temporary output signals
signal  taddr_hold_data_i:
        std_logic_vector(0 to MAX_ADDR_TH_CNT_WIDTH-1);
-- address strobe signal when the bus is multipelxed
signal tads_data_i:
        std_logic_vector(0 to MAX_ADS_CNT_WIDTH-1);

-- control signal data
-- control width is the actual read or write signal counter width assigned
-- depedning upon the type of control activation
signal  tcontrol_width_data_i:
        std_logic_vector(0 to MAX_CONTROL_CNT_WIDTH-1);
-- device validation and max time taken by the device to be ready for the
-- communication std logic vector data
signal  tdev_valid_data_i:
        std_logic_vector(0 to MAX_RDY_TOUT_CNT_WIDTH-1);
signal  tdevrdy_width_data_i:
        std_logic_vector(0 to MAX_RDY_WIDTH_CNT_WIDTH-1);

signal taddr_data_cs_hold_count_i :
        std_logic_vector(0 to MAX_ADDR_DATA_CS_TH_CNT_WIDTH-1);

-- recovery signal data
signal trd_recovery_muxed_data_i :
                     std_logic_vector(0 to MAX_RD_REC_MUXED_CNT_WIDTH-1);
signal twr_recovery_muxed_data_i :
                     std_logic_vector(0 to MAX_WR_REC_MUXED_CNT_WIDTH-1);

signal trd_recovery_non_muxed_data_i :
                     std_logic_vector(0 to MAX_RD_REC_NON_MUXED_CNT_WIDTH-1);
signal twr_recovery_non_muxed_data_i :
                     std_logic_vector(0 to MAX_WR_REC_NON_MUXED_CNT_WIDTH-1);
------------------------------------------------------------------------------
signal asynch_rd_req_i       : std_logic;
signal asynch_wr_req_i       : std_logic;

signal taddr_hold_ld_i       : std_logic;
signal tdata_hold_ld_i       : std_logic;
signal tdev_rdy_ld_i         : std_logic;
signal tcontrol_ld_i         : std_logic;
signal tdev_valid_ld_i       : std_logic;
signal tads_ld_i             : std_logic;
signal twr_recovery_ld_i     : std_logic;
signal trd_recovery_ld_i     : std_logic;

signal taddr_hold_ld_ce_i    : std_logic;
signal tdata_hold_ld_ce_i    : std_logic;
signal tcontrol_ld_ce_i      : std_logic;
signal tdev_valid_ld_ce_i    : std_logic;
signal tdev_rdy_ld_ce_i      : std_logic;
signal tads_ld_ce_i          : std_logic;

signal twr_muxed_recovery_load_ce_i      : std_logic;
signal trd_muxed_recovery_load_ce_i      : std_logic;
signal twr_non_muxed_recovery_load_ce_i  : std_logic;
signal trd_non_muxed_recovery_load_ce_i  : std_logic;

signal asynch_prh_rdy_d1     : std_logic;
signal asynch_prh_rdy_d2     : std_logic;
signal asynch_prh_rdy_i      : std_logic;
signal async_cycle_bit_rst   : std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8-1);
signal async_cycle_bit       : std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8-1);
signal asynch_start_i        : std_logic;
signal asynch_cycle_i        : std_logic;

signal taddr_hold_cnt        : std_logic_vector(0 to MAX_ADDR_TH_CNT_WIDTH-1);
signal tcontrol_wdth_cnt     : std_logic_vector(0 to MAX_CONTROL_CNT_WIDTH-1);
signal tdevrdy_wdth_cnt      : std_logic_vector(0 to MAX_RDY_WIDTH_CNT_WIDTH-1);
signal tdev_valid_cnt        : std_logic_vector(0 to MAX_RDY_TOUT_CNT_WIDTH-1);
signal tads_cnt              : std_logic_vector(0 to MAX_ADS_CNT_WIDTH-1);
signal taddr_data_cs_hold_cnt: std_logic_vector
                                        (0 to MAX_ADDR_DATA_CS_TH_CNT_WIDTH-1);

signal twr_muxed_rec_cnt     :
                    std_logic_vector(0 to MAX_WR_REC_MUXED_CNT_WIDTH-1);
signal trd_muxed_rec_cnt      :
                    std_logic_vector(0 to MAX_RD_REC_MUXED_CNT_WIDTH-1);
signal twr_non_muxed_rec_cnt  :
                    std_logic_vector(0 to MAX_WR_REC_NON_MUXED_CNT_WIDTH-1);
signal trd_non_muxed_rec_cnt  :
                    std_logic_vector(0 to MAX_RD_REC_NON_MUXED_CNT_WIDTH-1);
--signal Asynch_Wrack_i, Asynch_rdack_i : std_logic;
------------------------------------------------------------------------------
begin
-------------------------------------------------------------------------------
-- NAME: SOME_DEV_ASYNC_GEN
-------------------------------------------------------------------------------
-- Description: Some devices are configured as asynchronous devices
-------------------------------------------------------------------------------
SOME_DEV_ASYNC_GEN: if NO_PRH_ASYNC = 0 generate
attribute ASYNC_REG of REG_PRH_RDY: label is "TRUE";
begin
ASYNC_CYCLE_BIT_RST_GEN: for i in 0 to C_SPLB_NATIVE_DWIDTH/8-1 generate
 async_cycle_bit_rst(i) <= Rst or Asynch_ce(i);-- or Asynch_Wrack_i
                                               --or Asynch_Rdack_i;
end generate ASYNC_CYCLE_BIT_RST_GEN;

--Asynch_Wrack <= Asynch_Wrack_i;
--Asynch_Rdack <= Asynch_Rdack_i;

ASYNC_CYCLE_BIT_GEN: for i in 0 to C_SPLB_NATIVE_DWIDTH/8-1 generate
---------------------------------------------------------------------------
-- NAME: ASYNC_CYCLE_BIT_PROCESS
---------------------------------------------------------------------------
-- Description: Generate an indication for the byte lanes to be read during
--              a single transaction or during the last transfer of a burst
--              transaction
--              Assumes that the burst transfers are of same size
---------------------------------------------------------------------------
ASYNC_CYCLE_BIT_PROCESS: process (async_cycle_bit_rst, Clk)
begin
  if (async_cycle_bit_rst(i) = '1' ) then
    async_cycle_bit(i) <= '0';
  elsif (Clk'event and Clk = '1') then
    if (asynch_start_i = '1') then
      async_cycle_bit(i) <= Bus2IP_BE(i);
    end if;
  end if;
end process ASYNC_CYCLE_BIT_PROCESS;
end generate ASYNC_CYCLE_BIT_GEN;

asynch_cycle_i <= or_reduce(async_cycle_bit);

----------------------------------------------------
-- DEV_RDY_PROCESS : PROCESS
----------------------------------------------------
-- This process is used to double synch the incoming
-- peripheral ready (PRH_RDY) signal
----------------------------------------------------

REG_PRH_RDY: component FDRE
  port map (
            Q  => asynch_prh_rdy_d1,
            C  => Clk,
            CE => '1',
            D  => Asynch_prh_rdy,
            R  => Rst
          );

-- DEV_RDY_PROCESS:process(Clk)
-- begin
-- if (Clk'event and Clk = '1') then
--    if (Rst = '1') then
--         asynch_prh_rdy_d2     <=  '0';
--    else
--         asynch_prh_rdy_d2     <=  asynch_prh_rdy_d1;
--    end if;
-- end if;
-- end process DEV_RDY_PROCESS;

asynch_prh_rdy_i <=   asynch_prh_rdy_d1;
----------------------------------------------------

ADDR_TH_PROCESS:process (Bus2IP_CS)
begin
    taddr_hold_data_i <= (others => '0');
    for i in 0 to C_NUM_PERIPHERALS-1 loop
        if(Bus2IP_CS(i)='1')then
            taddr_hold_data_i <= ADDR_HOLDCNTR_ARRAY(i);
        end if;
    end loop;
end process ADDR_TH_PROCESS;
----------------------------------------------------
DATA_TH_PROCESS:process (Bus2IP_CS)
begin
    taddr_data_cs_hold_count_i<=  (others => '0');
    for i in 0 to C_NUM_PERIPHERALS-1 loop
        if(Bus2IP_CS(i)='1')then
            taddr_data_cs_hold_count_i<=  ADDR_DATA_HOLD_CNTR_ARRAY(i);
        end if;
    end loop;
end process DATA_TH_PROCESS;
----------------------------------------------------
ADS_DATA_PROCESS:process (Bus2IP_CS)
begin
    tads_data_i<=  (others => '0');
    for i in 0 to C_NUM_PERIPHERALS-1 loop
        if(Bus2IP_CS(i)='1')then
            tads_data_i<=  TADS_CNT_ARRAY(i);
        end if;
    end loop;
end process ADS_DATA_PROCESS;
----------------------------------------------------
DEV_VALID_DATA_PROCESS:process (Bus2IP_CS)
begin
    tdev_valid_data_i<=  (others => '0');
    for i in 0 to C_NUM_PERIPHERALS-1 loop
        if(Bus2IP_CS(i)='1')then
            tdev_valid_data_i<=  TRDY_TOUT_CNTR_ARRAY(i);
        end if;
    end loop;
end process DEV_VALID_DATA_PROCESS;
----------------------------------------------------
DEV_RDY_DATA_PROCESS:process (Bus2IP_CS)
begin
    tdevrdy_width_data_i<=  (others => '0');
    for i in 0 to C_NUM_PERIPHERALS-1 loop
        if(Bus2IP_CS(i)='1')then
            tdevrdy_width_data_i<=  TRDY_WIDTH_CNTR_ARRAY(i);
        end if;
    end loop;
end process DEV_RDY_DATA_PROCESS;

-------------------------------------------------------------------------------
RD_REC_DATA_PROCESS:process (Bus2IP_CS,Dev_bus_multiplexed)
begin
    trd_recovery_muxed_data_i<=  (others => '0');
    trd_recovery_non_muxed_data_i<=  (others => '0');

    for i in 0 to C_NUM_PERIPHERALS-1 loop
        if(Bus2IP_CS(i)='1')then
            if(Dev_bus_multiplexed='1') then
                trd_recovery_muxed_data_i<=  RD_REC_MUXED_CNTR_ARRAY(i);
            else
                trd_recovery_non_muxed_data_i<=  RD_REC_NON_MUXED_CNTR_ARRAY(i);
            end if;
        end if;
    end loop;
end process RD_REC_DATA_PROCESS;
-------------------------------------------------------------------------------
WR_REC_DATA_PROCESS:process (Bus2IP_CS,Dev_bus_multiplexed)
begin
    twr_recovery_muxed_data_i<=  (others => '0');
    twr_recovery_non_muxed_data_i<=  (others => '0');

    for i in 0 to C_NUM_PERIPHERALS-1 loop
        if(Bus2IP_CS(i)='1')then
            if(Dev_bus_multiplexed='1') then
                twr_recovery_muxed_data_i<=  WR_REC_MUXED_CNTR_ARRAY(i);
            else
                twr_recovery_non_muxed_data_i<=  WR_REC_NON_MUXED_CNTR_ARRAY(i);
            end if;
        end if;
    end loop;
end process WR_REC_DATA_PROCESS;
-------------------------------------------------------------------------------
CONTROL_DATA_PROCESS:process (Bus2IP_CS,
                              Bus2IP_RdCE,
                              Bus2IP_WrCE)
begin
    tcontrol_width_data_i<=  (others => '0');
    for i in 0 to C_NUM_PERIPHERALS-1 loop
        if(Bus2IP_CS(i)='1')then
            if(Bus2IP_RdCE(i) = '1')then
                tcontrol_width_data_i<=  TRD_CNTR_ARRAY(i);
            elsif(Bus2IP_WrCE(i) = '1')then
                tcontrol_width_data_i<=  TWR_CNTR_ARRAY(i);
            end if;
        end if;
    end loop;
end process CONTROL_DATA_PROCESS;
----------------------------------------------------
RD_REQ_GEN_PROCESS:process(Dev_in_access,
                           Bus2IP_RdCE,
                           IPIC_Asynch_req,
                           Bus2IP_CS
                           )
begin
    asynch_rd_req_i <= '0';
    for i in 0 to C_NUM_PERIPHERALS-1 loop
        if(Bus2IP_CS(i)='1' and Bus2IP_RdCE(i)='1')then
            asynch_rd_req_i <= Dev_in_access and IPIC_Asynch_req;
        end if;
    end loop;
end process RD_REQ_GEN_PROCESS;
----------------------------------------------------
WR_REQ_GEN_PROCESS:process(Dev_in_access,
                           Bus2IP_WrCE,
                           IPIC_Asynch_req,
                           Bus2IP_CS
                           )
begin
    asynch_wr_req_i <= '0';
    for i in 0 to C_NUM_PERIPHERALS-1 loop
        if(Bus2IP_CS(i)='1' and Bus2IP_WrCE(i)='1')then
            asynch_wr_req_i <= Dev_in_access and IPIC_Asynch_req;
        end if;
    end loop;
end process WR_REQ_GEN_PROCESS;
-------------------------------------------------------------------------------
-- component instantiation
-------------------------------------------------------------------------------
-- epc_asynch_statemachine
-------------------------------------------------------------------------------
ASYNC_STATEMACHINE_I: entity axi_epc_v2_0_23.async_statemachine
  generic map
        (
        C_ADDR_TH_CNT_WIDTH             =>  MAX_ADDR_TH_CNT_WIDTH,
        C_ADDR_DATA_CS_TH_CNT_WIDTH     =>  MAX_ADDR_DATA_CS_TH_CNT_WIDTH,
        C_CONTROL_CNT_WIDTH             =>  MAX_CONTROL_CNT_WIDTH,
        C_DEV_VALID_CNT_WIDTH           =>  MAX_RDY_TOUT_CNT_WIDTH,
        C_DEV_RDY_CNT_WIDTH             =>  MAX_RDY_WIDTH_CNT_WIDTH,
        C_ADS_CNT_WIDTH                 =>  MAX_ADS_CNT_WIDTH,
        C_WR_REC_NM_CNT_WIDTH           =>  MAX_WR_REC_NON_MUXED_CNT_WIDTH,
        C_RD_REC_NM_CNT_WIDTH           =>  MAX_RD_REC_NON_MUXED_CNT_WIDTH,
        C_WR_REC_M_CNT_WIDTH            =>  MAX_WR_REC_MUXED_CNT_WIDTH,
        C_RD_REC_M_CNT_WIDTH            =>  MAX_RD_REC_MUXED_CNT_WIDTH,
        C_NUM_PERIPHERALS               =>  C_NUM_PERIPHERALS
            )
port map(
-- inputs form async_cntl
        Bus2IP_CS                     =>  Bus2IP_CS,
        Bus2IP_RNW                    =>  Bus2IP_RNW,

        Asynch_rd_req                 =>  asynch_rd_req_i,
        Asynch_wr_req                 =>  asynch_wr_req_i,
        Dev_in_access                 =>  Dev_in_access,
        Dev_FIFO_access               =>  Dev_FIFO_access,
        Asynch_prh_rdy                =>  asynch_prh_rdy_i,
    -- inputs from top_level_file
        Dev_dwidth_match              =>  Dev_dwidth_match,
        Dev_bus_multiplexed           =>  Dev_bus_multiplexed,
    -- input from data steering logic
        Asynch_cycle                  =>  asynch_cycle_i,
    -- outputs to IPIF
        Asynch_Wrack                  =>  Asynch_Wrack,
        Asynch_Rdack                  =>  Asynch_Rdack,
        Asynch_error                  =>  Asynch_error,
        Asynch_start                  =>  asynch_start_i,
    -- outputs to counters
        Taddr_hold_load               =>  taddr_hold_ld_i,
        Tdata_hold_load               =>  tdata_hold_ld_i,
        Tcontrol_load                 =>  tcontrol_ld_i,
        Tdev_valid_load               =>  tdev_valid_ld_i,
        Tdev_rdy_load                 =>  tdev_rdy_ld_i,
        Tads_load                     =>  tads_ld_i,
        Twr_recovery_load             =>  twr_recovery_ld_i,
        Trd_recovery_load             =>  trd_recovery_ld_i,

        Taddr_hold_load_ce            => taddr_hold_ld_ce_i,
        Tdata_hold_load_ce            => tdata_hold_ld_ce_i,
        Tcontrol_load_ce              => tcontrol_ld_ce_i,
        Tdev_valid_load_ce            => tdev_valid_ld_ce_i,
        Tdev_rdy_load_ce              => tdev_rdy_ld_ce_i,
        Tads_load_ce                  => tads_ld_ce_i,
        Twr_muxed_recovery_load_ce    => twr_muxed_recovery_load_ce_i,
        Trd_muxed_recovery_load_ce    => trd_muxed_recovery_load_ce_i,
        Twr_non_muxed_recovery_load_ce=> twr_non_muxed_recovery_load_ce_i,
        Trd_non_muxed_recovery_load_ce=> trd_non_muxed_recovery_load_ce_i,

    -- output to data_steering_logic file
        Asynch_Rd                     =>  Asynch_Rd,
        Asynch_en                     =>  Asynch_en,
        Asynch_Wr                     =>  Asynch_Wr,
        Asynch_addr_strobe            =>  Asynch_addr_strobe,
        Asynch_addr_data_sel          =>  Asynch_addr_data_sel,
        Asynch_data_sel               =>  Asynch_data_sel,
        Asynch_chip_select            =>  Asynch_chip_select,
        Asynch_addr_cnt_ld            =>  Asynch_addr_cnt_ld,
        Asynch_addr_cnt_en            =>  Asynch_addr_cnt_en,

        Taddr_hold_cnt                => taddr_hold_cnt,
        Tcontrol_wdth_cnt             => tcontrol_wdth_cnt,
        Tdevrdy_wdth_cnt              => tdevrdy_wdth_cnt,
        Tdev_valid_cnt                => tdev_valid_cnt,
        Tads_cnt                      => tads_cnt,
        Twr_muxed_rec_cnt             => twr_muxed_rec_cnt,
        Trd_muxed_rec_cnt             => trd_muxed_rec_cnt,
        Twr_non_muxed_rec_cnt         => twr_non_muxed_rec_cnt,
        Trd_non_muxed_rec_cnt         => trd_non_muxed_rec_cnt,

        Taddr_data_cs_hold_cnt      => taddr_data_cs_hold_cnt,

    -- Clocks and reset
         Clk                 =>     Clk,
         Rst                 =>     Rst
       );
-------------------------------------------------------------------------------
-- component instantiation
-------------------------------------------------------------------------------
-- epc_counters
-------------------------------------------------------------------------------
ASYNC_CNTR_I: entity axi_epc_v2_0_23.async_counters
  generic map
        (
        C_ADDR_TH_CNT_WIDTH             =>  MAX_ADDR_TH_CNT_WIDTH,
        C_ADDR_DATA_CS_TH_CNT_WIDTH     =>  MAX_ADDR_DATA_CS_TH_CNT_WIDTH,
        C_CONTROL_CNT_WIDTH             =>  MAX_CONTROL_CNT_WIDTH,
        C_DEV_VALID_CNT_WIDTH           =>  MAX_RDY_TOUT_CNT_WIDTH,
        C_DEV_RDY_CNT_WIDTH             =>  MAX_RDY_WIDTH_CNT_WIDTH,
        C_ADS_CNT_WIDTH                 =>  MAX_ADS_CNT_WIDTH,
        C_WR_REC_NM_CNT_WIDTH           =>  MAX_WR_REC_NON_MUXED_CNT_WIDTH,
        C_RD_REC_NM_CNT_WIDTH           =>  MAX_RD_REC_NON_MUXED_CNT_WIDTH,
        C_WR_REC_M_CNT_WIDTH            =>  MAX_WR_REC_MUXED_CNT_WIDTH,
        C_RD_REC_M_CNT_WIDTH            =>  MAX_RD_REC_MUXED_CNT_WIDTH
        )
  port map
        (
     Taddr_hold_count                   =>  taddr_hold_data_i,
     Taddr_data_cs_hold_count           =>  taddr_data_cs_hold_count_i,
     Tcontrol_width_data                =>  tcontrol_width_data_i,
     Tdev_valid_data                    =>  tdev_valid_data_i,
     Tdevrdy_width_data                 =>  tdevrdy_width_data_i,
     Tads_data                          =>  tads_data_i,
     Twr_recovery_muxed_data            =>  twr_recovery_muxed_data_i,
     Twr_recovery_non_muxed_data        =>  twr_recovery_non_muxed_data_i,
     Trd_recovery_muxed_data            =>  trd_recovery_muxed_data_i,
     Trd_recovery_non_muxed_data        =>  trd_recovery_non_muxed_data_i,

     Taddr_hold_cnt                     =>  taddr_hold_cnt,
     Tcontrol_wdth_cnt                  =>  tcontrol_wdth_cnt,
     Tdevrdy_wdth_cnt                   =>  tdevrdy_wdth_cnt,
     Twr_muxed_rec_cnt                  =>  twr_muxed_rec_cnt,
     Trd_muxed_rec_cnt                  =>  trd_muxed_rec_cnt,
     Twr_non_muxed_rec_cnt              =>  twr_non_muxed_rec_cnt,
     Trd_non_muxed_rec_cnt              =>  trd_non_muxed_rec_cnt,

     Tdev_valid_cnt                     =>  tdev_valid_cnt,
     Tads_cnt                           =>  tads_cnt,
     Taddr_data_cs_hold_cnt             =>  taddr_data_cs_hold_cnt,

     Taddr_hold_load                    =>  taddr_hold_ld_i,
     Tdata_hold_load                    =>  tdata_hold_ld_i,
     Tcontrol_load                      =>  tcontrol_ld_i,
     Tdev_valid_load                    =>  tdev_valid_ld_i,
     Tdev_rdy_load                      =>  tdev_rdy_ld_i,
     Tads_load                          =>  tads_ld_i,
     Twr_recovery_load                  =>  twr_recovery_ld_i,
     Trd_recovery_load                  =>  trd_recovery_ld_i,

     Taddr_hold_load_ce                 =>  taddr_hold_ld_ce_i,
     Tdata_hold_load_ce                 =>  tdata_hold_ld_ce_i,
     Tcontrol_load_ce                   =>  tcontrol_ld_ce_i,
     Tdev_valid_load_ce                 =>  tdev_valid_ld_ce_i,
     Tdev_rdy_load_ce                   =>  tdev_rdy_ld_ce_i,
     Tads_load_ce                       =>  tads_ld_ce_i,
     Twr_muxed_recovery_load_ce         =>  twr_muxed_recovery_load_ce_i,
     Trd_muxed_recovery_load_ce         =>  trd_muxed_recovery_load_ce_i,
     Twr_non_muxed_recovery_load_ce     =>  twr_non_muxed_recovery_load_ce_i,
     Trd_non_muxed_recovery_load_ce     =>  trd_non_muxed_recovery_load_ce_i,

     Clk                                =>  Clk,
     Rst                                =>  rst
     );

end generate SOME_DEV_ASYNC_GEN;

-------------------------------------------------------------------------------
-- NAME: NO_DEV_ASYNC_GEN
-------------------------------------------------------------------------------
-- Description: All devices are configured as synchronous devices
-------------------------------------------------------------------------------
NO_DEV_ASYNC_GEN: if NO_PRH_ASYNC = 1 generate

  Asynch_Wrack        <= '0';
  Asynch_Rdack        <= '0';
  Asynch_error        <= '0';

  Asynch_Wr           <= '1';
  Asynch_Rd           <= '1';
  Asynch_en           <= '0';

  Asynch_addr_strobe  <= '0';
  Asynch_addr_data_sel<= '0';
  Asynch_data_sel     <= '0';
  Asynch_chip_select  <= (others => '1');
  Asynch_addr_cnt_ld  <= '0';
  Asynch_addr_cnt_en  <= '0';

end generate NO_DEV_ASYNC_GEN;

end imp;
------------------------------------------------------------------------------
-- End of async_cntl.vhd file
------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- address_gen.vhd - entity/architecture pair
-------------------------------------------------------------------------------

-- ************************************************************************
-- ** DISCLAIMER OF LIABILITY                                            **
-- **                                                                    **
-- ** This file contains proprietary and confidential information of     **
-- ** Xilinx, Inc. ("Xilinx"), that is distributed under a license       **
-- ** from Xilinx, and may be used, copied and/or disclosed only         **
-- ** pursuant to the terms of a valid license agreement with Xilinx.    **
-- **                                                                    **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION              **
-- ** ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER         **
-- ** EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT                **
-- ** LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,          **
-- ** MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx      **
-- ** does not warrant that functions included in the Materials will     **
-- ** meet the requirements of Licensee, or that the operation of the    **
-- ** Materials will be uninterrupted or error-free, or that defects     **
-- ** in the Materials will be corrected. Furthermore, Xilinx does       **
-- ** not warrant or make any representations regarding use, or the      **
-- ** results of the use, of the Materials in terms of correctness,      **
-- ** accuracy, reliability or otherwise.                                **
-- **                                                                    **
-- ** Xilinx products are not designed or intended to be fail-safe,      **
-- ** or for use in any application requiring fail-safe performance,     **
-- ** such as life-support or safety devices or systems, Class III       **
-- ** medical devices, nuclear facilities, applications related to       **
-- ** the deployment of airbags, or any other applications that could    **
-- ** lead to death, personal injury or severe property or               **
-- ** environmental damage (individually and collectively, "critical     **
-- ** applications"). Customer assumes the sole risk and liability       **
-- ** of any use of Xilinx products in critical applications,            **
-- ** subject only to applicable laws and regulations governing          **
-- ** limitations on product liability.                                  **
-- **                                                                    **
-- ** Copyright 2005, 2006, 2008, 2009 Xilinx, Inc.                      **
-- ** All rights reserved.                                               **
-- **                                                                    **
-- ** This disclaimer and copyright notice must be retained as part      **
-- ** of this file at all times.                                         **
-- ************************************************************************

-------------------------------------------------------------------------------
-- File          : address_gen.vhd
-- Company       : Xilinx
-- Version       : v1.00.a
-- Description   : External Peripheral Controller for AXI bus address generation
--                 logic
-- Structure     : VHDL-93
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Structure: 
--             axi_epc.vhd
--               -axi_lite_ipif
--               -epc_core.vhd
--               -ipic_if_decode.vhd
--               -sync_cntl.vhd
--               -async_cntl.vhd
--                  -- async_counters.vhd
--                  -- async_statemachine.vhd
--               -address_gen.vhd
--               -data_steer.vhd
--               -access_mux.vhd
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Author   : VB
-- History  :
--
--  VB           08-24-2010 --  v2_0 version for AXI
-- ^^^^^^
--            The core updated for AXI based on xps_epc_v1_02_a
-- ~~~~~~
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x" 
--      reset signals:                          "rst", "rst_n" 
--      generics:                               "C_*" 
--      user defined types:                     "*_TYPE" 
--      state machine next state:               "*_ns" 
--      state machine current state:            "*_cs" 
--      combinatorial signals:                  "*_cmb" 
--      pipelined or register delay signals:    "*_d#" 
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce" 
--      internal version of output port         "*_i"
--      device pins:                            "*_pin" 
--      ports:                                  - Names begin with Uppercase 
--      processes:                              "*_PROCESS" 
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.unsigned;
use IEEE.std_logic_arith.conv_integer;

library axi_epc_v2_0_23;
use axi_epc_v2_0_23.ld_arith_reg;

-------------------------------------------------------------------------------
--                     Definition of Generics                                --
-------------------------------------------------------------------------------
-- C_PRH_MAX_AWIDTH     -  Maximum of address bus width of all peripherals 
-- NO_PRH_DWIDTH_MATCH  -  Indication that no device is employing data width 
--                         matching
-- NO_PRH_SYNC          -  Indicates all devices are configured for
--                         asynchronous interface
-- NO_PRH_ASYNC         -  Indicates all devices are configured for
--                         synchronous interface
-- ADDRCNT_WIDTH        -  Width of counter generating address suffix in case
--                         of data width matching
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                     Definition of Ports                                   --
-------------------------------------------------------------------------------
-- Bus2IP_Clk            - IPIC clock
-- Bus2IP_Rst            - IPIC reset
-- Local_Clk             - Operational clock for peripheral interface
-- Local_Rst             - Rest for peripheral interface
-- Bus2IP_Addr           - Address bus from IPIC interface
-- Dev_fifo_access       - Indicates if the current access is to a FIFO like
--                       - structure within the external peripheral device
-- Dev_sync              - Indicates if the current device being accessed 
--                         is synchronous device
-- Dev_dwidth_match      - Indicates if the current device employs data 
--                         width matching
-- Dev_dbus_width        - Indicates decoded value for the data bus width
-- Async_addr_cnt_ld     - Load signal for the address suffix counter for 
--                         asynchronous interface
-- Async_addr_cnt_ce     - Enable for address suffix counter for asynchronous
--                         interface
-- Sync_addr_cnt_ld      - Load signal for the address suffix counter for 
--                         synchronous interface
-- Sync_addr_cnt_ce      - Enable for address suffix counter for synchronous
--                         interface
-- Addr_Int              - Internal address bus for peripheral interface
-- Addr_suffix           - Address suffix (lower bits of address bus) generated
--                         within this module when data width matching is 
--                         enabled
-------------------------------------------------------------------------------

entity address_gen is
  generic (
    C_PRH_MAX_AWIDTH    : integer;
    NO_PRH_DWIDTH_MATCH : integer;
    NO_PRH_SYNC         : integer;
    NO_PRH_ASYNC        : integer;
    ADDRCNT_WIDTH       : integer
  );
 
  port (
    Bus2IP_Clk         : in  std_logic;
    Bus2IP_Rst         : in  std_logic;

    Local_Clk          : in  std_logic;
    Local_Rst          : in  std_logic;

    Bus2IP_Addr        : in  std_logic_vector(0 to C_PRH_MAX_AWIDTH-1);

    Dev_fifo_access    : in  std_logic;
    Dev_sync           : in  std_logic;
    Dev_dwidth_match   : in  std_logic;
    Dev_dbus_width     : in  std_logic_vector(0 to 2);

    Async_addr_cnt_ld  : in  std_logic;
    Async_addr_cnt_ce  : in  std_logic;

    Sync_addr_cnt_ld   : in  std_logic;
    Sync_addr_cnt_ce   : in  std_logic;

    Addr_Int           : out std_logic_vector(0 to C_PRH_MAX_AWIDTH-1);
    Addr_suffix        : out std_logic_vector(0 to ADDRCNT_WIDTH-1)
    );
end entity address_gen;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of address_gen is

-------------------------------------------------------------------------------
-- Constant Declarations
-------------------------------------------------------------------------------
constant ADDRCNT_RST  : std_logic_vector(0 to ADDRCNT_WIDTH-1) 
                      := (others => '0');

-------------------------------------------------------------------------------
-- Signal and Type Declarations
-------------------------------------------------------------------------------
signal async_addr_cnt_i      : std_logic_vector(0 to ADDRCNT_WIDTH-1) := 
                               (others => '0');
signal async_addr_ld_cnt_val : std_logic_vector(0 to ADDRCNT_WIDTH-1) := 
                               (others => '0');

signal sync_addr_cnt_i       : std_logic_vector(0 to ADDRCNT_WIDTH-1) := 
                               (others => '0');
signal sync_addr_ld_cnt_val  : std_logic_vector(0 to ADDRCNT_WIDTH-1) := 
                               (others => '0');

signal async_addr_suffix     : std_logic_vector(0 to ADDRCNT_WIDTH-1) := 
                               (others => '0');
signal sync_addr_suffix      : std_logic_vector(0 to ADDRCNT_WIDTH-1) := 
                               (others => '0');
signal addr_suffix_i         : std_logic_vector(0 to ADDRCNT_WIDTH-1) := 
                               (others => '0');

-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------
begin

-------------------------------------------------------------------------------
-- NAME: NO_DEV_DWIDTH_MATCH_GEN
-------------------------------------------------------------------------------
-- Description: If no device employs data width matching, then generate 
--              default values
-------------------------------------------------------------------------------
NO_DEV_DWIDTH_MATCH_GEN: if NO_PRH_DWIDTH_MATCH = 1 generate

   Addr_suffix  <= (others => '0');
   Addr_Int <= Bus2IP_Addr;

end generate NO_DEV_DWIDTH_MATCH_GEN;

-------------------------------------------------------------------------------
-- NAME: DEV_DWIDTH_MATCH_GEN
-------------------------------------------------------------------------------
-- Description: If any device employs data width matching, then generate 
--              address suffix, peripheral address bus, async and sync cycle 
--              indications 
-------------------------------------------------------------------------------

DEV_DWIDTH_MATCH_GEN: if NO_PRH_DWIDTH_MATCH = 0 generate

  -----------------------------------------------------------------------------
  -- NAME: SOME_DEV_SYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: Some or all devices are configured as synchronous devices
  -----------------------------------------------------------------------------
  SOME_DEV_SYNC_GEN: if NO_PRH_SYNC = 0 generate

    ---------------------------------------------------------------------------
    -- Counter for address suffix generation for synchronous peripheral 
    -- interface 
    ---------------------------------------------------------------------------

    I_SYNC_ADDRCNT: entity axi_epc_v2_0_23.ld_arith_reg
    generic map ( C_ADD_SUB_NOT  => true,
                  C_REG_WIDTH    => ADDRCNT_WIDTH,
                  C_RESET_VALUE  => ADDRCNT_RST,
                  C_LD_WIDTH     => ADDRCNT_WIDTH,
                  C_LD_OFFSET    => 0,
                  C_AD_WIDTH     => 1,
                  C_AD_OFFSET    => 0
                )
    port map ( CK             => Local_Clk,
               RST            => Local_Rst,
               Q              => sync_addr_cnt_i,
               LD             => sync_addr_ld_cnt_val,
               AD             => "1",
               LOAD           => Sync_addr_cnt_ld,
               OP             => Sync_addr_cnt_ce
             );

    ---------------------------------------------------------------------------
    -- NAME : SYNC_ADDR_LD_VAL_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Initial load value for the address suffix counter
    ---------------------------------------------------------------------------
    SYNC_ADDR_LD_VAL_PROCESS: process(Dev_dbus_width, Bus2IP_Addr)
    begin
  
      sync_addr_ld_cnt_val <= (others => '0');
 
      case Dev_dbus_width is
        when "001" =>
          sync_addr_ld_cnt_val  <= 
            Bus2IP_Addr(C_PRH_MAX_AWIDTH-ADDRCNT_WIDTH to C_PRH_MAX_AWIDTH - 1);

        when "010" =>
          sync_addr_ld_cnt_val  <= '0' & 
            Bus2IP_Addr(C_PRH_MAX_AWIDTH-ADDRCNT_WIDTH to C_PRH_MAX_AWIDTH - 2);

        when "100" =>
          sync_addr_ld_cnt_val  <= (others => '0');

        when others =>
          sync_addr_ld_cnt_val  <= (others => '0');

      end case;
    end process SYNC_ADDR_LD_VAL_PROCESS;

    ---------------------------------------------------------------------------
    -- NAME : SYNC_ADDR_SUFFIX_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Address suffix generation for synchronous interface
    ---------------------------------------------------------------------------
    SYNC_ADDR_SUFFIX_PROCESS: process(Dev_dbus_width, sync_addr_cnt_i)
    begin

      sync_addr_suffix  <= (others => '0');

      case Dev_dbus_width is
        when "001" =>
          sync_addr_suffix   <= sync_addr_cnt_i;
        when "010" =>
          sync_addr_suffix   <= sync_addr_cnt_i(1 to ADDRCNT_WIDTH-1) & '0';
        when "100" =>
          sync_addr_suffix   <= (others => '0');
        when others =>
          sync_addr_suffix   <= (others => '0');
      end case;
    end process SYNC_ADDR_SUFFIX_PROCESS;

  end generate SOME_DEV_SYNC_GEN;

  -----------------------------------------------------------------------------
  -- NAME: SOME_DEV_ASYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: Some or all devices are configured as asynchronous devices
  -----------------------------------------------------------------------------
  SOME_DEV_ASYNC_GEN: if NO_PRH_ASYNC = 0 generate

    ---------------------------------------------------------------------------
    -- Counter for address suffix generation for asynchronous peripheral 
    -- interface 
    ---------------------------------------------------------------------------

    I_ASYNC_ADDRCNT: entity axi_epc_v2_0_23.ld_arith_reg
      generic map ( C_ADD_SUB_NOT  => true,
                    C_REG_WIDTH    => ADDRCNT_WIDTH,
                    C_RESET_VALUE  => ADDRCNT_RST,
                    C_LD_WIDTH     => ADDRCNT_WIDTH,
                    C_LD_OFFSET    => 0,
                    C_AD_WIDTH     => 1,
                    C_AD_OFFSET    => 0
                  )
      port map ( CK             => Bus2IP_Clk,
                 RST            => Bus2IP_Rst,
                 Q              => async_addr_cnt_i,
                 LD             => async_addr_ld_cnt_val,
                 AD             => "1",
                 LOAD           => Async_addr_cnt_ld,
                 OP             => Async_addr_cnt_ce
               );


    ---------------------------------------------------------------------------
    -- NAME : ASYNC_ADDR_LD_VAL_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Initial load value for the address suffix counter
    ---------------------------------------------------------------------------
    ASYNC_ADDR_LD_VAL_PROCESS: process(Dev_dbus_width, Bus2IP_Addr)
    begin
  
      async_addr_ld_cnt_val <= (others => '0');
 
      case Dev_dbus_width is
        when "001" =>
          async_addr_ld_cnt_val <= 
            Bus2IP_Addr(C_PRH_MAX_AWIDTH-ADDRCNT_WIDTH to C_PRH_MAX_AWIDTH - 1);

        when "010" =>
          async_addr_ld_cnt_val <= '0' & 
            Bus2IP_Addr(C_PRH_MAX_AWIDTH-ADDRCNT_WIDTH to C_PRH_MAX_AWIDTH - 2);

        when "100" =>
          async_addr_ld_cnt_val <= (others => '0');

        when others =>
          async_addr_ld_cnt_val <= (others => '0');

       end case;
    end process ASYNC_ADDR_LD_VAL_PROCESS;

    ---------------------------------------------------------------------------
    -- NAME : ASYNC_ADDR_SUFFIX_PROCESS
    ---------------------------------------------------------------------------
    -- Description: Address suffix generation for asynchronous interface 
    ---------------------------------------------------------------------------
    ASYNC_ADDR_SUFFIX_PROCESS: process(Dev_dbus_width, async_addr_cnt_i)
    begin

      async_addr_suffix <= (others => '0');

      case Dev_dbus_width is
        when "001" =>
          async_addr_suffix  <= async_addr_cnt_i;
        when "010" =>
          async_addr_suffix  <= async_addr_cnt_i(1 to ADDRCNT_WIDTH-1) & '0';
        when "100" =>
          async_addr_suffix  <= (others => '0');
        when others =>
          async_addr_suffix  <= (others => '0');
      end case;
    end process ASYNC_ADDR_SUFFIX_PROCESS;

  end generate SOME_DEV_ASYNC_GEN;

  -----------------------------------------------------------------------------
  -- NAME: ALL_DEV_SYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: All devices are configured as synchronous devices
  -----------------------------------------------------------------------------
  ALL_DEV_SYNC_GEN: if NO_PRH_ASYNC = 1 generate

    addr_suffix_i <= sync_addr_suffix;

  end generate ALL_DEV_SYNC_GEN;

  -----------------------------------------------------------------------------
  -- NAME: ALL_DEV_ASYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: All devices are configured as asynchronous devices
  -----------------------------------------------------------------------------
  ALL_DEV_ASYNC_GEN: if NO_PRH_SYNC = 1 generate

    addr_suffix_i <= async_addr_suffix;

  end generate ALL_DEV_ASYNC_GEN;

  -----------------------------------------------------------------------------
  -- NAME: DEV_SYNC_AND_ASYNC_GEN
  -----------------------------------------------------------------------------
  -- Description: Some devices are configured as synchronous and some 
  --              asynchronous 
  -----------------------------------------------------------------------------
  DEV_SYNC_AND_ASYNC_GEN: if NO_PRH_SYNC = 0 and NO_PRH_ASYNC = 0 generate

    addr_suffix_i <= async_addr_suffix when dev_sync = '0'
                     else sync_addr_suffix;
  
  end generate DEV_SYNC_AND_ASYNC_GEN;

  Addr_suffix <= addr_suffix_i;

  Addr_Int <= Bus2IP_Addr when (Dev_dwidth_match = '0' or Dev_fifo_access = '1')
              else Bus2IP_Addr(0 to C_PRH_MAX_AWIDTH-ADDRCNT_WIDTH-1) 
                   & addr_suffix_i;


end generate DEV_DWIDTH_MATCH_GEN;

end architecture imp;
--------------------------------end of file------------------------------------



-------------------------------------------------------------------------------
-- access_mux.vhd - entity/architecture pair
-------------------------------------------------------------------------------
-- ************************************************************************
-- ** DISCLAIMER OF LIABILITY                                            **
-- **                                                                    **
-- ** This file contains proprietary and confidential information of     **
-- ** Xilinx, Inc. ("Xilinx"), that is distributed under a license       **
-- ** from Xilinx, and may be used, copied and/or disclosed only         **
-- ** pursuant to the terms of a valid license agreement with Xilinx.    **
-- **                                                                    **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION              **
-- ** ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER         **
-- ** EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT                **
-- ** LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,          **
-- ** MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx      **
-- ** does not warrant that functions included in the Materials will     **
-- ** meet the requirements of Licensee, or that the operation of the    **
-- ** Materials will be uninterrupted or error-free, or that defects     **
-- ** in the Materials will be corrected. Furthermore, Xilinx does       **
-- ** not warrant or make any representations regarding use, or the      **
-- ** results of the use, of the Materials in terms of correctness,      **
-- ** accuracy, reliability or otherwise.                                **
-- **                                                                    **
-- ** Xilinx products are not designed or intended to be fail-safe,      **
-- ** or for use in any application requiring fail-safe performance,     **
-- ** such as life-support or safety devices or systems, Class III       **
-- ** medical devices, nuclear facilities, applications related to       **
-- ** the deployment of airbags, or any other applications that could    **
-- ** lead to death, personal injury or severe property or               **
-- ** environmental damage (individually and collectively, "critical     **
-- ** applications"). Customer assumes the sole risk and liability       **
-- ** of any use of Xilinx products in critical applications,            **
-- ** subject only to applicable laws and regulations governing          **
-- ** limitations on product liability.                                  **
-- **                                                                    **
-- ** Copyright 2005, 2006, 2008, 2009 Xilinx, Inc.                      **
-- ** All rights reserved.                                               **
-- **                                                                    **
-- ** This disclaimer and copyright notice must be retained as part      **
-- ** of this file at all times.                                         **
-- ************************************************************************

-------------------------------------------------------------------------------
-- File          : access_mux.vhd
-- Company       : Xilinx
-- Version       : v1.00.a
-- Description   : Multiplexes the device ready signal from external periphera.
--              -- It also multiplexes the address and data bus to be driven out
--              -- to the external peripheral devices
-- Standard      : VHDL-93
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Structure:
--             axi_epc.vhd
--               -axi_lite_ipif
--               -epc_core.vhd
--               -ipic_if_decode.vhd
--               -sync_cntl.vhd
--               -async_cntl.vhd
--                  -- async_counters.vhd
--                  -- async_statemachine.vhd
--               -address_gen.vhd
--               -data_steer.vhd
--               -access_mux.vhd
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Author   : VB
-- History  :
--
--  VB           08-24-2010 --  v2_0 version for AXI
-- ^^^^^^
--            The core updated for AXI based on xps_epc_v1_02_a
-- ~~~~~~
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

library axi_lite_ipif_v3_0_4;
use axi_lite_ipif_v3_0_4.ipif_pkg.INTEGER_ARRAY_TYPE;             

-------------------------------------------------------------------------------
--                     Definition of Generics                                --
-------------------------------------------------------------------------------
-- C_NUM_PERIPHERALS        -  No of peripherals currently configured
-- C_PRH_MAX_AWIDTH         -  Maximum of address bus width of all peripherals
-- C_PRH_MAX_DWIDTH         -  Maximum of data bus width of all peripherals
-- C_PRH_MAX_ADWIDTH        -  Maximum of data bus width of all peripherals and
--                          -  address bus width of peripherals employing bus
--                          -  multiplexing
-- C_PRH(0:3)_AWIDTH        -  Address bus width of peripherals
-- C_PRH(0:3)_DWIDTH        -  Data bus width of peripherals
-- C_PRH(0:3)_BUS_MULTIPLEX -  Indication if the peripheral employs address/data
--                          -  bus multiplexing
-- MAX_PERIPHERALS          -  Maximum no of peripherals supported by external
--                          -  peripheral controller
-- NO_PRH_SYNC              -  Indicates all devices are configured for
--                             asynchronous interface
-- NO_PRH_ASYNC             -  Indicates all devices are configured for
--                             synchronous interface
-- NO_PRH_BUS_MULTIPLEX     -  Indicates that no device is employing
--                             multiplexed bus for address and data
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                     Definition of Ports                                   --
-------------------------------------------------------------------------------
-- Dev_id                - The decoded identification vector for the currently
--                       - selected device
-- Dev_sync              - Indicates if the current device being accessed
--                         is synchronous device
-- Dev_dbus_width        - Indicates the data bus width of current device
-- Sync_CS_n             - Chip select signals for the peripherals
--                       - from synchronous control
-- Sync_ADS              - Address strobe from synchronous control
-- Sync_RNW              - Read/Write control from synchronous control
-- Sync_Burst            - Burst indication from synchronous control
-- Sync_addr_ph          - Address phase indication from synchronous control
--                         in case of multiplexed address and data bus
-- Sync_data_oe          - Data bus output enable from synchronous control
-- Async_CS_n            - Chip select signals for the peripherals from
--                       - asynchronous control
-- Async_ADS             - Address strobe from asynchronous control
-- Async_Rd_n            - Read control from asynchronous control
-- Async_Wr_n            - Write control from asynchronous control
-- Async_addr_ph         - Address phase indication from asynchronous control
--                         in case of multiplexed address and data bus
-- Async_data_oe         - Data bus output enable from asynchronous control
-- Addr_Int              - Internal peripheral address bus
-- Data_Int              - Internal peripheral data bus
-- PRH_CS_n              - Peripheral chip select signals
-- PRH_ADS               - Peripheral address strobe
-- PRH_RNW               - Peripheral read/write control
-- PRH_Rd_n              - Peripheral read strobe
-- PRH_Wr_n              - Peripheral write strobe
-- PRH_Burst             - Peripheral burst indication
-- PRH_Rdy               - Peripheral ready indication
-- Dev_Rdy               - Device ready indication from currently selected
--                       - device driven to internal logic
-- PRH_Addr              - Peripheral address bus
-- PRH_Data_O            - Peripheral output data bus
-- PRH_Data_T            - 3-state control for peripheral output data bus
-------------------------------------------------------------------------------


entity access_mux is
  generic (
      C_NUM_PERIPHERALS    : integer;
      C_PRH_MAX_AWIDTH     : integer;
      C_PRH_MAX_DWIDTH     : integer;
      C_PRH_MAX_ADWIDTH    : integer;

      C_PRH0_AWIDTH        : integer;
      C_PRH1_AWIDTH        : integer;
      C_PRH2_AWIDTH        : integer;
      C_PRH3_AWIDTH        : integer;

      C_PRH0_DWIDTH        : integer;
      C_PRH1_DWIDTH        : integer;
      C_PRH2_DWIDTH        : integer;
      C_PRH3_DWIDTH        : integer;

      C_PRH0_BUS_MULTIPLEX : integer;
      C_PRH1_BUS_MULTIPLEX : integer;
      C_PRH2_BUS_MULTIPLEX : integer;
      C_PRH3_BUS_MULTIPLEX : integer;

      MAX_PERIPHERALS      : integer;
      NO_PRH_SYNC          : integer;
      NO_PRH_ASYNC         : integer;
      NO_PRH_BUS_MULTIPLEX : integer
  );

  port (
     Local_Clk          : in  std_logic;

     Dev_id             : in  std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     --Dev_sync           : in  std_logic;
     --Dev_dbus_width     : in  std_logic_vector(0 to 2);

     Sync_CS_n          : in  std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     Sync_ADS           : in  std_logic;
     Sync_RNW           : in  std_logic;
     Sync_Burst         : in  std_logic;
     Sync_addr_ph       : in  std_logic;
     Sync_data_oe       : in  std_logic;

     Async_CS_n         : in  std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     Async_ADS          : in  std_logic;
     Async_Rd_n         : in  std_logic;
     Async_Wr_n         : in  std_logic;
     Async_addr_ph      : in  std_logic;
     Async_data_oe      : in  std_logic;

     Addr_Int           : in  std_logic_vector(0 to C_PRH_MAX_AWIDTH-1);
     Data_Int           : in  std_logic_vector(0 to C_PRH_MAX_DWIDTH-1);

     PRH_CS_n           : out std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     PRH_ADS            : out std_logic;
     PRH_RNW            : out std_logic;
     PRH_Rd_n           : out std_logic;
     PRH_Wr_n           : out std_logic;
     PRH_Burst          : out std_logic;

     PRH_Rdy            : in  std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     Dev_Rdy            : out std_logic;

     PRH_Addr           : out std_logic_vector(0 to C_PRH_MAX_AWIDTH-1);
     PRH_Data_O         : out std_logic_vector(0 to C_PRH_MAX_ADWIDTH-1);
     PRH_Data_T         : out std_logic_vector(0 to C_PRH_MAX_ADWIDTH-1)

    );
end entity access_mux;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of access_mux is

-------------------------------------------------------------------------------
-- Function Declarations
-------------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- NAME: get_adbus_width
  -----------------------------------------------------------------------------
  -- Description: XPS EPC supports bus multiplexing. If bus is multiplexed
  --              the value of data bus width will be maximum of address bus
  --              and data bus of the device.
  -----------------------------------------------------------------------------
  function get_adbus_width (bmux        : integer;
                            awidth      : integer;
                            dwidth      : integer)
                            return integer is
    variable adwidth : integer;
    begin
      if bmux = 0 then
        adwidth := dwidth;
      else
        if dwidth > awidth then
          adwidth := dwidth;
        else
          adwidth := awidth;
        end if;
      end if;

    return adwidth;
  end function get_adbus_width;

-------------------------------------------------------------------------------
-- Constant Declarations
-------------------------------------------------------------------------------

constant PRH_ADWIDTH_ARRAY : INTEGER_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
         ( get_adbus_width(C_PRH0_BUS_MULTIPLEX, C_PRH0_AWIDTH, C_PRH0_DWIDTH),
           get_adbus_width(C_PRH1_BUS_MULTIPLEX, C_PRH1_AWIDTH, C_PRH1_DWIDTH),
           get_adbus_width(C_PRH2_BUS_MULTIPLEX, C_PRH2_AWIDTH, C_PRH2_DWIDTH),
           get_adbus_width(C_PRH3_BUS_MULTIPLEX, C_PRH3_AWIDTH, C_PRH3_DWIDTH)
         );

-------------------------------------------------------------------------------
-- Signal Declarations
-------------------------------------------------------------------------------

signal addr_ph         : std_logic := '0';

signal addr_out        : std_logic_vector(0 to C_PRH_MAX_ADWIDTH-1) :=
                         (others => '0');
signal data_out        : std_logic_vector(0 to C_PRH_MAX_ADWIDTH-1) :=
                         (others => '0');
--
signal sync_data_oe_i  : std_logic_vector(0 to C_PRH_MAX_ADWIDTH-1) :=
                         (others => '0');
signal async_data_oe_i : std_logic_vector(0 to C_PRH_MAX_ADWIDTH-1) :=
                         (others => '0');
signal sync_async_data_oe_i : std_logic_vector(0 to C_PRH_MAX_ADWIDTH-1) :=
                         (others => '0');
signal prh_cs_n_i      : std_logic_vector(0 to C_NUM_PERIPHERALS-1);
--
-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------
begin

-------------------------------------------------------------------------------
-- NAME: ALL_DEV_SYNC_GEN
-------------------------------------------------------------------------------
-- Description: All devices are configured as synchronous devices
-------------------------------------------------------------------------------
ALL_DEV_SYNC_GEN: if NO_PRH_ASYNC = 1 generate

  REG_PRH_SIGS40 : process(Local_Clk)
  begin
  if(Local_Clk'event and Local_Clk = '1')then
      PRH_CS_n   <= Sync_CS_n;
      PRH_ADS    <= Sync_ADS;
      PRH_RNW    <= Sync_RNW;
      PRH_Rd_n   <= '1';
      PRH_Wr_n   <= '1';
      PRH_Burst  <= Sync_Burst;
   end if;
  end process REG_PRH_SIGS40;

  -----------------------------------------------------------------------------
  -- NAME: REG_PRH_SIGS41
  -----------------------------------------------------------------------------
  -- Description: register output data bus enable for each bit in sync mode
  -----------------------------------------------------------------------------
  REG_PRH_SIGS41 : process(Local_Clk)
  begin
  if (Local_Clk'event and Local_Clk = '1')then
     for i in 0 to C_PRH_MAX_ADWIDTH-1 loop
         sync_data_oe_i(i) <= not (Sync_data_oe);
     end loop;
  end if;
  end process REG_PRH_SIGS41;
  -----------------------------------------------------------------------------
  -- NAME: PRH_DATA_T_GEN
  -----------------------------------------------------------------------------
  -- Description: Generate output data bus enable for each bit of data bus
  -----------------------------------------------------------------------------
  PRH_DATA_T_GEN: for i in 0 to C_PRH_MAX_ADWIDTH-1 generate
    PRH_Data_T(i) <= sync_data_oe_i(i);
  end generate PRH_DATA_T_GEN;

end generate ALL_DEV_SYNC_GEN;

-------------------------------------------------------------------------------
-- NAME: ALL_DEV_ASYNC_GEN
-------------------------------------------------------------------------------
-- Description: All devices are configured as asynchronous devices
-------------------------------------------------------------------------------
ALL_DEV_ASYNC_GEN: if NO_PRH_SYNC = 1 generate
  REG_PRH_SIGS42 : process(Local_Clk)
  begin
  if(Local_Clk'event and Local_Clk = '1')then
      PRH_CS_n   <= Async_CS_n;
      PRH_ADS    <= Async_ADS;
      PRH_RNW    <= '1';
      PRH_Rd_n   <= Async_Rd_n;
      PRH_Wr_n   <= Async_Wr_n;
      PRH_Burst  <= '0';
  end if;
  end process REG_PRH_SIGS42;

  -----------------------------------------------------------------------------
  -- NAME: PRH_DATA_T_GEN
  -----------------------------------------------------------------------------
  -- Description: Generate output data bus enable for each bit of data bus
  -----------------------------------------------------------------------------
  REG_PRH_SIGS43 : process(Local_Clk)
  begin
  if (Local_Clk'event and Local_Clk = '1')then
     for i in 0 to C_PRH_MAX_ADWIDTH-1 loop
         async_data_oe_i(i) <= not (Async_data_oe);
     end loop;
  end if;
  end process REG_PRH_SIGS43;

  PRH_DATA_T_GEN: for i in 0 to C_PRH_MAX_ADWIDTH-1 generate
    PRH_Data_T(i) <= async_data_oe_i(i);
  end generate PRH_DATA_T_GEN;

end generate ALL_DEV_ASYNC_GEN;

-------------------------------------------------------------------------------
-- NAME: DEV_SYNC_AND_ASYNC_GEN
-------------------------------------------------------------------------------
-- Description: Some devices are configured as synchronous and some
--              asynchronous
-------------------------------------------------------------------------------
DEV_SYNC_AND_ASYNC_GEN: if NO_PRH_SYNC = 0 and NO_PRH_ASYNC = 0 generate
  -----------------------------------------------------------------------------
  -- NAME: PRH_CS_N_GEN
  -----------------------------------------------------------------------------
  -- Description: Generate chip select for external peripheral device
  -----------------------------------------------------------------------------
  REG_PRH_SIGS44 : process(Local_Clk)
  begin
  if (Local_Clk'event and Local_Clk = '1')then
     for i in 0 to C_NUM_PERIPHERALS-1 loop
         prh_cs_n_i(i) <= Sync_CS_n(i) and Async_CS_n(i);
     end loop;
  end if;
  end process REG_PRH_SIGS44;

-- PRH_CS_N_GEN: Generate the PRH_CS_n signal.
  PRH_CS_N_GEN: for i in 0 to C_NUM_PERIPHERALS-1 generate
    PRH_CS_n(i)   <= prh_cs_n_i(i);
  end generate PRH_CS_N_GEN;

  -- REG_PRH_SIGS45 : Register the PRH_* signals
  REG_PRH_SIGS45 : process(Local_Clk)
  begin
  if (Local_Clk'event and Local_Clk = '1')then
      PRH_ADS    <= Sync_ADS or Async_ADS;
      PRH_RNW    <= Sync_RNW;
      PRH_Rd_n   <= Async_Rd_n;
      PRH_Wr_n   <= Async_Wr_n;
      PRH_Burst  <= Sync_Burst;
  end if;
  end process REG_PRH_SIGS45;

  -----------------------------------------------------------------------------
  -- NAME: PRH_DATA_T_GEN
  -----------------------------------------------------------------------------
  -- Description: Generate output data bus enable for each bit of data bus
  -----------------------------------------------------------------------------

  REG_PRH_SIGS46 : process(Local_Clk)
  begin
  if (Local_Clk'event and Local_Clk = '1')then
     for i in 0 to C_PRH_MAX_ADWIDTH-1 loop
         sync_async_data_oe_i(i) <= not((Async_data_oe) xor (Sync_data_oe));
     end loop;
  end if;
  end process REG_PRH_SIGS46;

  PRH_DATA_T_GEN: for i in 0 to C_PRH_MAX_ADWIDTH-1 generate
    PRH_Data_T(i) <= sync_async_data_oe_i(i);
  end generate PRH_DATA_T_GEN;

end generate DEV_SYNC_AND_ASYNC_GEN;

-------------------------------------------------------------------------------
-- NAME: NO_PRH_BUS_MULTIPLEX_GEN
-------------------------------------------------------------------------------
-- Description: No peripheral employs bus multiplexing for address/data bus
-------------------------------------------------------------------------------
NO_PRH_BUS_MULTIPLEX_GEN: if NO_PRH_BUS_MULTIPLEX = 1 generate

  addr_ph    <= '0';

  REG_PRH_SIGS47 : process(Local_Clk)
  begin
  if (Local_Clk'event and Local_Clk = '1')then
      PRH_Data_O(0 to C_PRH_MAX_DWIDTH-1) <= Data_Int;
  end if;
  end process REG_PRH_SIGS47;

end generate NO_PRH_BUS_MULTIPLEX_GEN;


-------------------------------------------------------------------------------
-- NAME: PRH_BUS_MULTIPLEX_GEN
-------------------------------------------------------------------------------
-- Description: Atleast some peripheral employs bus multiplexing
-------------------------------------------------------------------------------
PRH_BUS_MULTIPLEX_GEN: if NO_PRH_BUS_MULTIPLEX = 0 generate

  addr_ph <= Sync_addr_ph or Async_addr_ph;

  -----------------------------------------------------------------------------
  -- NAME: ADDR_OUT_PROCESS
  -----------------------------------------------------------------------------
  -- Description: Generate adddress out for the current device
  -----------------------------------------------------------------------------
  ADDR_OUT_PROCESS: process (Dev_id, Addr_Int) is
  begin
    addr_out <= (others => '0');

    for i in 0 to C_NUM_PERIPHERALS-1 loop
      if (Dev_id(i) = '1') then

        if (PRH_ADWIDTH_ARRAY(i) > C_PRH_MAX_AWIDTH) then

          addr_out(0 to PRH_ADWIDTH_ARRAY(i)-C_PRH_MAX_AWIDTH-1)
                   <= (others => '0');
          addr_out(PRH_ADWIDTH_ARRAY(i)-C_PRH_MAX_AWIDTH
                   to PRH_ADWIDTH_ARRAY(i)-1)
                   <= Addr_Int(0 to C_PRH_MAX_AWIDTH-1);

          if (PRH_ADWIDTH_ARRAY(i) < C_PRH_MAX_ADWIDTH) then
            addr_out(PRH_ADWIDTH_ARRAY(i) to C_PRH_MAX_ADWIDTH-1)
                     <= (others => '0');
          end if;

        else

          addr_out(0 to PRH_ADWIDTH_ARRAY(i)-1) <=
            Addr_Int(C_PRH_MAX_AWIDTH-PRH_ADWIDTH_ARRAY(i)
                     to C_PRH_MAX_AWIDTH-1);

          if (PRH_ADWIDTH_ARRAY(i) < C_PRH_MAX_ADWIDTH) then
            addr_out(PRH_ADWIDTH_ARRAY(i) to C_PRH_MAX_ADWIDTH-1)
                     <= (others => '0');
          end if;

        end if;

      end if;
    end loop;

  end process ADDR_OUT_PROCESS;

  data_out(0 to C_PRH_MAX_DWIDTH-1) <= Data_Int;

  -----------------------------------------------------------------------------
  -- NAME: DWIDTH_LT_ADWIDTH_GEN
  -----------------------------------------------------------------------------
  -- Description: Tie higher bits of data bus to zero
  -----------------------------------------------------------------------------
  DWIDTH_LT_ADWIDTH_GEN: if C_PRH_MAX_DWIDTH < C_PRH_MAX_ADWIDTH generate
      data_out(C_PRH_MAX_DWIDTH to C_PRH_MAX_ADWIDTH-1) <= (others => '0');
  end generate DWIDTH_LT_ADWIDTH_GEN;

  -----------------------------------------------------------------------------
  -- NAME: AD_MUX_OUT_PROCESS
  -----------------------------------------------------------------------------
  -- Description: Multiplexes the address and data bus to be driven out to the
  --              external peripheral device if the device uses multiplexed bus
  --              for address and data
  -----------------------------------------------------------------------------
  AD_MUX_OUT_PROCESS: process (Local_Clk)
  begin
  if (Local_Clk'event and Local_Clk = '1')then
      if (addr_ph = '1') then
        PRH_Data_O <= addr_out;
      else
        PRH_Data_O <= data_out;
      end if;
  end if;
end process AD_MUX_OUT_PROCESS;

end generate PRH_BUS_MULTIPLEX_GEN;

  REG_PRH_SIGS48 : process(Local_Clk)
  begin
  if (Local_Clk'event and Local_Clk = '1')then
        PRH_Addr <= Addr_Int;
  end if;
  end process REG_PRH_SIGS48;

-------------------------------------------------------------------------------
-- NAME: DEV_RDY_PROCESS
-------------------------------------------------------------------------------
-- Description: Multiplexes the device ready signal from external peripheral
--              devices and drives to the internal logic
-------------------------------------------------------------------------------
DEV_RDY_PROCESS: process (Dev_id,PRH_Rdy) is
begin
  Dev_Rdy <= '0';
  for i in 0 to C_NUM_PERIPHERALS-1 loop
    if (Dev_id(i) = '1') then
      Dev_Rdy <= PRH_Rdy(i);
    end if;
  end loop;
end process DEV_RDY_PROCESS;

end architecture imp;
--------------------------------end of file------------------------------------



-------------------------------------------------------------------------------
-- epc_core.vhd - entity/architecture pair
-------------------------------------------------------------------------------

-- ************************************************************************
-- ** DISCLAIMER OF LIABILITY                                            **
-- **                                                                    **
-- ** This file contains proprietary and confidential information of     **
-- ** Xilinx, Inc. ("Xilinx"), that is distributed under a license       **
-- ** from Xilinx, and may be used, copied and/or disclosed only         **
-- ** pursuant to the terms of a valid license agreement with Xilinx.    **
-- **                                                                    **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION              **
-- ** ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER         **
-- ** EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT                **
-- ** LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,          **
-- ** MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx      **
-- ** does not warrant that functions included in the Materials will     **
-- ** meet the requirements of Licensee, or that the operation of the    **
-- ** Materials will be uninterrupted or error-free, or that defects     **
-- ** in the Materials will be corrected. Furthermore, Xilinx does       **
-- ** not warrant or make any representations regarding use, or the      **
-- ** results of the use, of the Materials in terms of correctness,      **
-- ** accuracy, reliability or otherwise.                                **
-- **                                                                    **
-- ** Xilinx products are not designed or intended to be fail-safe,      **
-- ** or for use in any application requiring fail-safe performance,     **
-- ** such as life-support or safety devices or systems, Class III       **
-- ** medical devices, nuclear facilities, applications related to       **
-- ** the deployment of airbags, or any other applications that could    **
-- ** lead to death, personal injury or severe property or               **
-- ** environmental damage (individually and collectively, "critical     **
-- ** applications"). Customer assumes the sole risk and liability       **
-- ** of any use of Xilinx products in critical applications,            **
-- ** subject only to applicable laws and regulations governing          **
-- ** limitations on product liability.                                  **
-- **                                                                    **
-- ** Copyright 2005, 2006, 2008, 2009 Xilinx, Inc.                      **
-- ** All rights reserved.                                               **
-- **                                                                    **
-- ** This disclaimer and copyright notice must be retained as part      **
-- ** of this file at all times.                                         **
-- ************************************************************************
--
-------------------------------------------------------------------------------
-- File          : epc_core.vhd
-- Company       : Xilinx
-- Version       : v1.00.a
-- Description   : External Peripheral Controller for AXI epc core interface
-- Standard      : VHDL-93
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Structure:
--             axi_epc.vhd
--               -axi_lite_ipif
--               -epc_core.vhd
--               -ipic_if_decode.vhd
--               -sync_cntl.vhd
--               -async_cntl.vhd
--                  -- async_counters.vhd
--                  -- async_statemachine.vhd
--               -address_gen.vhd
--               -data_steer.vhd
--               -access_mux.vhd
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Author   : VB
-- History  :
--
--  VB           08-24-2010 --  v2_0 version for AXI
-- ^^^^^^
--            The core updated for AXI based on xps_epc_v1_02_a
-- ~~~~~~
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;


use IEEE.std_logic_arith.conv_std_logic_vector;

library axi_lite_ipif_v3_0_4;
use axi_lite_ipif_v3_0_4.ipif_pkg.INTEGER_ARRAY_TYPE;


library axi_epc_v2_0_23;


-------------------------------------------------------------------------------
--                     Definition of Generics :                              --
-------------------------------------------------------------------------------
-- C_SPLB_CLK_PERIOD_PS      -  The clock period of PLB Clock in picoseconds
-- C_SPLB_AWIDTH            -  Address width of PLB BUS.
-- C_SPLB_DWIDTH            -  Data width of PLB BUS.
-- C_FAMILY                 -  FPGA Family for which the external peripheral
--                             controller is targeted
-- C_NUM_PERIPHERALS        -  Number of external devices connected to XPS EPC
-- C_PRH_MAX_AWIDTH         -  Maximum of address bus width of all peripherals
-- C_PRH_MAX_DWIDTH         -  Maximum of data bus width of all peripherals
-- C_PRH_MAX_ADWIDTH        -  Maximum of data bus width of all peripherals
--                             and address bus width of peripherals employing
--                             multiplexed address/data bus
-- C_PRH_CLK_SUPPORT        -  Indication of whether the synchronous interface
--                             operates on peripheral clock or on XPSclock
-- C_PRH_BURST_SUPPORT      -  Indicates if the XPS EPC supports burst
-- C_PRH(0:3)_FIFO_ACCESS   -  Indicates if the support for accessing FIFO
--                             like structure within external device is
--                             required
-- C_PRH(0:3)_FIFO_OFFSET   -  Byte offset of FIFO from the base address
--                             assigned to peripheral
-- C_PRH(0:3)_AWIDTH        -  External peripheral (0:3) address bus width
-- C_PRH(0:3)_DWIDTH        -  External peripheral (0:3) data bus width
-- C_PRH(0:3)_DWIDTH_MATCH  -  Indication of whether external peripheral (0:3)
--                             supports multiple access cycle on the
--                             peripheral interface for a single XPScycle
--                             when the peripheral data bus width is less than
--                             that of XPSbus data width
-- C_PRH(0:3)_SYNC          -  Indicates if the external device (0:3) uses
--                             synchronous or asynchronous interface
-- C_PRH(0:3)_BUS_MULTIPLEX -  Indicates if the external device (0:3) uses a
--                             multiplexed or non-multiplexed device
-- C_PRH(0:3)_ADDR_TSU      -  External device (0:3) address setup time with
--                             respect  to rising edge of address strobe
--                             (multiplexed address and data bus) or falling
--                             edge of  read/write signal (non-multiplexed
--                             address/data bus)
-- C_PRH(0:3)_ADDR_TH       -  External device (0:3) address hold time with
--                             respect to rising edge of address strobe
--                             (multiplexed address and data bus) or rising
--                             edge of  read/write signal (non-multiplexed
--                             address/data bus)
-- C_PRH(0:3)_ADS_WIDTH     -  Minimum pulse width of address strobe
-- C_PRH(0:3)_CSN_TSU       -  External device (0:3) chip select setup time
--                             with  respect to falling edge of read/write
--                             signal
-- C_PRH(0:3)_CSN_TH        -  External device (0:3) chip select hold time with
--                             respect to rising edge of read/write signal
-- C_PRH(0:3)_WRN_WIDTH     -  External device (0:3) write signal minimum
--                             pulse width
-- C_PRH(0:3)_WR_CYCLE      -  External device (0:3) write cycle time
-- C_PRH(0:3)_DATA_TSU      -  External device (0:3) data bus setup with
--                             respect to rising edge of write signal
-- C_PRH(0:3)_DATA_TH       -  External device (0:3) data bus hold  with
--                             respect to rising edge of write signal
-- C_PRH(0:3)_RDN_WIDTH     -  External device (0:3) read signal minimum
--                             pulse width
-- C_PRH(0:3)_RD_CYCLE      -  External device (0:3) read cycle time
-- C_PRH(0:3)_DATA_TOUT     -  External device (0:3) data bus validity with
--                             respect to falling edge of read signal
-- C_PRH(0:3)_DATA_TINV     -  External device (0:3) data bus high impedence
--                             with respect to rising edge of read signal
-- C_PRH(0:3)_RDY_TOUT      -  External device (0:3) device ready validity from
--                             falling edge of read/write signal
-- C_PRH(0:3)_RDY_WIDTH     -  Maximimum wait period for external device (0:3)
--                             ready signal assertion
-- LOCAL_CLK_PERIOD_PS      -  The clock period of operating clock for
--                             synchronous interface in picoseconds
-- MAX_PERIPHERALS          -  Maximum number of peripherals supported by the
--                             external peripheral controller
-- PRH(0:3)_FIFO_ADDRESS    -  The address of external peripheral device FIFO
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                     Definition of Ports                                   --
-------------------------------------------------------------------------------
----------------------------------------
-- IPIC INTERFACE
----------------------------------------
-- Bus2IP_Clk            - IPIC clock
-- Bus2IP_Rst            - IPIC reset
-- Bus2IP_CS             - IPIC chip select signals
-- Bus2IP_RdCE           - IPIC read transaction chip enables
-- Bus2IP_WrCE           - IPIC write transaction chip enables
-- Bus2IP_Addr           - IPIC address
-- Bus2IP_RNW            - IPIC read/write indication
-- Bus2IP_BE             - IPIC byte enables
-- Bus2IP_Data           - IPIC write data

-- IP2Bus_Data           - Read data from IP to IPIC interface
-- IP2Bus_WrAck          - Write Data acknowledgment from IP to IPIC interface
-- IP2Bus_RdAck          - Read Data acknowledgment from IP to IPIC interface
-- IP2Bus_Error          - Error indication from IP to IPIC interface
----------------------------------------
-- PERIPHERAL INTERFACE
----------------------------------------
-- Local_Clk             - Operational clock for peripheral interface
-- Local_Rst             - Reset for peripheral interface
-- PRH_CS_n              - Peripheral interface chip select
-- PRH_Addr              - Peripheral interface address bus
-- PRH_ADS               - Peripheral interface address strobe
-- PRH_BE                - Peripheral interface byte enables
-- PRH_RNW               - Peripheral interface read/write control for
--                         synchronous interface
-- PRH_Rd_n              - Peripheral interface read strobe for asynchronous
--                         interface
-- PRH_Wr_n              - Peripheral interface write strobe for asynchronous
--                         interface
-- PRH_Burst             - Peripheral interface burst indication signal
-- PRH_Rdy               - Peripheral interface device ready signal
-- PRH_Data_I            - Peripheral interface input data bus
-- PRH_Data_O            - Peripehral interface output data bus
-- PRH_Data_T            - 3-state control for peripheral interface output data
--                         bus
-------------------------------------------------------------------------------

entity epc_core is
  generic (
      C_SPLB_CLK_PERIOD_PS   : integer;
      LOCAL_CLK_PERIOD_PS   : integer;
      ----------------      -------------------------
      C_SPLB_AWIDTH         : integer;
      C_SPLB_DWIDTH         : integer;
      C_SPLB_NATIVE_DWIDTH  : integer;
      C_FAMILY              : string;
      ----------------      -------------------------
      C_NUM_PERIPHERALS     : integer;
      C_PRH_MAX_AWIDTH      : integer;
      C_PRH_MAX_DWIDTH      : integer;
      C_PRH_MAX_ADWIDTH     : integer;
      C_PRH_CLK_SUPPORT     : integer;
      C_PRH_BURST_SUPPORT   : integer;
      ----------------      -------------------------
      C_PRH0_FIFO_ACCESS    : integer;
      C_PRH0_AWIDTH         : integer;
      C_PRH0_DWIDTH         : integer;
      C_PRH0_DWIDTH_MATCH   : integer;
      C_PRH0_SYNC           : integer;
      C_PRH0_BUS_MULTIPLEX  : integer;
      C_PRH0_ADDR_TSU       : integer;
      C_PRH0_ADDR_TH        : integer;
      C_PRH0_ADS_WIDTH      : integer;
      C_PRH0_CSN_TSU        : integer;
      C_PRH0_CSN_TH         : integer;
      C_PRH0_WRN_WIDTH      : integer;
      C_PRH0_WR_CYCLE       : integer;
      C_PRH0_DATA_TSU       : integer;
      C_PRH0_DATA_TH        : integer;
      C_PRH0_RDN_WIDTH      : integer;
      C_PRH0_RD_CYCLE       : integer;
      C_PRH0_DATA_TOUT      : integer;
      C_PRH0_DATA_TINV      : integer;
      C_PRH0_RDY_TOUT       : integer;
      C_PRH0_RDY_WIDTH      : integer;
      ----------------      -------------------------
      C_PRH1_FIFO_ACCESS    : integer;
      C_PRH1_AWIDTH         : integer;
      C_PRH1_DWIDTH         : integer;
      C_PRH1_DWIDTH_MATCH   : integer;
      C_PRH1_SYNC           : integer;
      C_PRH1_BUS_MULTIPLEX  : integer;
      C_PRH1_ADDR_TSU       : integer;
      C_PRH1_ADDR_TH        : integer;
      C_PRH1_ADS_WIDTH      : integer;
      C_PRH1_CSN_TSU        : integer;
      C_PRH1_CSN_TH         : integer;
      C_PRH1_WRN_WIDTH      : integer;
      C_PRH1_WR_CYCLE       : integer;
      C_PRH1_DATA_TSU       : integer;
      C_PRH1_DATA_TH        : integer;
      C_PRH1_RDN_WIDTH      : integer;
      C_PRH1_RD_CYCLE       : integer;
      C_PRH1_DATA_TOUT      : integer;
      C_PRH1_DATA_TINV      : integer;
      C_PRH1_RDY_TOUT       : integer;
      C_PRH1_RDY_WIDTH      : integer;
      ----------------      -------------------------
      C_PRH2_FIFO_ACCESS    : integer;
      C_PRH2_AWIDTH         : integer;
      C_PRH2_DWIDTH         : integer;
      C_PRH2_DWIDTH_MATCH   : integer;
      C_PRH2_SYNC           : integer;
      C_PRH2_BUS_MULTIPLEX  : integer;
      C_PRH2_ADDR_TSU       : integer;
      C_PRH2_ADDR_TH        : integer;
      C_PRH2_ADS_WIDTH      : integer;
      C_PRH2_CSN_TSU        : integer;
      C_PRH2_CSN_TH         : integer;
      C_PRH2_WRN_WIDTH      : integer;
      C_PRH2_WR_CYCLE       : integer;
      C_PRH2_DATA_TSU       : integer;
      C_PRH2_DATA_TH        : integer;
      C_PRH2_RDN_WIDTH      : integer;
      C_PRH2_RD_CYCLE       : integer;
      C_PRH2_DATA_TOUT      : integer;
      C_PRH2_DATA_TINV      : integer;
      C_PRH2_RDY_TOUT       : integer;
      C_PRH2_RDY_WIDTH      : integer;
      ----------------      -------------------------
      C_PRH3_FIFO_ACCESS    : integer;
      C_PRH3_AWIDTH         : integer;
      C_PRH3_DWIDTH         : integer;
      C_PRH3_DWIDTH_MATCH   : integer;
      C_PRH3_SYNC           : integer;
      C_PRH3_BUS_MULTIPLEX  : integer;
      C_PRH3_ADDR_TSU       : integer;
      C_PRH3_ADDR_TH        : integer;
      C_PRH3_ADS_WIDTH      : integer;
      C_PRH3_CSN_TSU        : integer;
      C_PRH3_CSN_TH         : integer;
      C_PRH3_WRN_WIDTH      : integer;
      C_PRH3_WR_CYCLE       : integer;
      C_PRH3_DATA_TSU       : integer;
      C_PRH3_DATA_TH        : integer;
      C_PRH3_RDN_WIDTH      : integer;
      C_PRH3_RD_CYCLE       : integer;
      C_PRH3_DATA_TOUT      : integer;
      C_PRH3_DATA_TINV      : integer;
      C_PRH3_RDY_TOUT       : integer;
      C_PRH3_RDY_WIDTH      : integer;
      ----------------      -------------------------
      MAX_PERIPHERALS       : integer;
      PRH0_FIFO_ADDRESS     : std_logic_vector;
      PRH1_FIFO_ADDRESS     : std_logic_vector;
      PRH2_FIFO_ADDRESS     : std_logic_vector;
      PRH3_FIFO_ADDRESS     : std_logic_vector
      ----------------      -------------------------
    );

  port (

     Bus2IP_Clk        : in  std_logic;
     Bus2IP_Rst        : in  std_logic;
     -- IPIC interface
     Bus2IP_CS         : in std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     Bus2IP_RdCE       : in std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     Bus2IP_WrCE       : in std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     Bus2IP_Addr       : in std_logic_vector(0 to C_PRH_MAX_AWIDTH-1);
     Bus2IP_RNW        : in std_logic;
     Bus2IP_BE         : in std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8-1);
     Bus2IP_Data       : in std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH-1);

     IP2Bus_Data       : out std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH-1);
     IP2Bus_WrAck      : out std_logic;
     IP2Bus_RdAck      : out std_logic;
     IP2Bus_Error      : out std_logic;

     -- Clock and Reset for peripheral interface
     Local_Clk         : in std_logic;
     Local_Rst         : in std_logic;

     -- Peripheral interface
     PRH_CS_n          : out std_logic_vector(0 to C_NUM_PERIPHERALS-1);
     PRH_Addr          : out std_logic_vector(0 to C_PRH_MAX_AWIDTH-1);
     PRH_ADS           : out std_logic;
     PRH_BE            : out std_logic_vector(0 to C_PRH_MAX_DWIDTH/8-1);
     PRH_RNW           : out std_logic;
     PRH_Rd_n          : out std_logic;
     PRH_Wr_n          : out std_logic;
     PRH_Burst         : out std_logic;

     PRH_Rdy           : in std_logic_vector(0 to C_NUM_PERIPHERALS-1);

     PRH_Data_I        : in std_logic_vector(0 to C_PRH_MAX_ADWIDTH-1);
     PRH_Data_O        : out std_logic_vector(0 to C_PRH_MAX_ADWIDTH-1);
     PRH_Data_T        : out std_logic_vector(0 to C_PRH_MAX_ADWIDTH-1)
    );
end entity epc_core;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of epc_core is

-------------------------------------------------------------------------------
-- Function Declaration
-------------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- NAME: all_zeros
-----------------------------------------------------------------------------
-- Description: Given an array returns an integer value of '1' if all elements
--              of the array are zero. Returns '0' otherwise
-----------------------------------------------------------------------------
function all_zeros ( array_size : integer;
                     int_array : INTEGER_ARRAY_TYPE) return integer is
variable temp : integer := 1;
begin

  for i in 0 to  (array_size-1) loop
    if int_array(i) = 1 then 
    	temp := 0;
    end if;
  end loop;

  return temp;
end function all_zeros;

-----------------------------------------------------------------------------
-- NAME: all_ones
-----------------------------------------------------------------------------
-- Description: Given an array returns an integer value of '1' if all elements
--              of the array are one. Returns '0' otherwise
-----------------------------------------------------------------------------
function all_ones ( array_size : integer;
                    int_array : INTEGER_ARRAY_TYPE) return integer is
variable temp : integer := 1;
begin

  for i in 0 to  (array_size-1) loop
    if int_array(i) = 0 then 
    	temp := 0;
    end if;
  end loop;

  return temp;
end function all_ones;

-----------------------------------------------------------------------------
-- NAME: IntArray_to_StdLogicVec
-----------------------------------------------------------------------------
-- Description: Given an array returns an std_logic_vector, where each
--              element of the vector represents a value of '0' if the
--              corresponding integer in the array is 0. Else, the vector
--              value denotes a '1'
-----------------------------------------------------------------------------
function IntArray_to_StdLogicVec ( array_size : integer;
                                   int_array : INTEGER_ARRAY_TYPE)
                                   return std_logic_vector is
variable temp : std_logic_vector(0 to array_size-1);
begin

  for i in 0 to  (array_size - 1) loop
    if int_array(i) = 0 then 
    	temp(i) := '0';
    else 
    	temp(i) := '1';
    end if;
  end loop;

  return temp;
end function IntArray_to_StdLogicVec;

-------------------------------------------------------------------------------
-- Type Declarations
-------------------------------------------------------------------------------
type SLV32_ARRAY_TYPE is array (natural range <>) of
                     std_logic_vector(0 to C_SPLB_AWIDTH-1);

-------------------------------------------------------------------------------
-- Constant Declarations
-------------------------------------------------------------------------------
constant ADDRCNT_WIDTH : integer := 2;

constant PRH_SYNC_ARRAY : INTEGER_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
         ( C_PRH0_SYNC,
           C_PRH1_SYNC,
           C_PRH2_SYNC,
           C_PRH3_SYNC
         );

constant NO_PRH_SYNC  : integer := all_zeros(C_NUM_PERIPHERALS, PRH_SYNC_ARRAY);
constant NO_PRH_ASYNC : integer := all_ones(C_NUM_PERIPHERALS, PRH_SYNC_ARRAY);

constant PRH_SYNC : std_logic_vector :=
                    IntArray_to_StdLogicVec(MAX_PERIPHERALS,
                                            PRH_SYNC_ARRAY);

constant PRH_BUS_MULTIPLEX_ARRAY : INTEGER_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
         ( C_PRH0_BUS_MULTIPLEX,
           C_PRH1_BUS_MULTIPLEX,
           C_PRH2_BUS_MULTIPLEX,
           C_PRH3_BUS_MULTIPLEX
         );

constant NO_PRH_BUS_MULTIPLEX : integer := all_zeros(C_NUM_PERIPHERALS,
                                                     PRH_BUS_MULTIPLEX_ARRAY);
constant PRH_BUS_MULTIPLEX : std_logic_vector :=
                             IntArray_to_StdLogicVec(MAX_PERIPHERALS,
                                                     PRH_BUS_MULTIPLEX_ARRAY);

constant PRH_DWIDTH_MATCH_ARRAY: INTEGER_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
         ( C_PRH0_DWIDTH_MATCH,
           C_PRH1_DWIDTH_MATCH,
           C_PRH2_DWIDTH_MATCH,
           C_PRH3_DWIDTH_MATCH
         );

constant NO_PRH_DWIDTH_MATCH  : integer := all_zeros(C_NUM_PERIPHERALS,
                                                     PRH_DWIDTH_MATCH_ARRAY);
constant ALL_PRH_DWIDTH_MATCH : integer := all_ones(C_NUM_PERIPHERALS,
                                                    PRH_DWIDTH_MATCH_ARRAY);
constant PRH_DWIDTH_MATCH : std_logic_vector :=
                            IntArray_to_StdLogicVec(MAX_PERIPHERALS,
                                                    PRH_DWIDTH_MATCH_ARRAY);

constant PRH_FIFO_ACCESS_ARRAY : INTEGER_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
         ( C_PRH0_FIFO_ACCESS,
           C_PRH1_FIFO_ACCESS,
           C_PRH2_FIFO_ACCESS,
           C_PRH3_FIFO_ACCESS
         );

constant PRH_FIFO_ADDRESS_ARRAY : SLV32_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
         ( PRH0_FIFO_ADDRESS,
           PRH1_FIFO_ADDRESS,
           PRH2_FIFO_ADDRESS,
           PRH3_FIFO_ADDRESS
         );

-------------------------------------------------------------------------------
-- Signal Declarations
-------------------------------------------------------------------------------

signal ipic_sync_req       : std_logic;
signal ip_sync_req_rst     : std_logic;
signal ipic_async_req      : std_logic;

signal ip_sync_Wrack       : std_logic;
signal ip_sync_Rdack       : std_logic;
signal ipic_sync_ack_rst   : std_logic;
signal ip_async_Wrack      : std_logic;
signal ip_async_Rdack      : std_logic;

signal ip_sync_error       : std_logic;
signal ip_async_error      : std_logic;

signal dev_id              : std_logic_vector(0 to C_NUM_PERIPHERALS-1);
signal dev_in_access       : std_logic;
signal dev_sync_in_access  : std_logic;
signal dev_async_in_access : std_logic;
signal dev_sync            : std_logic;
signal dev_rnw             : std_logic;
signal dev_bus_multiplex   : std_logic;
signal dev_dwidth_match    : std_logic;
signal dev_dbus_width      : std_logic_vector(0 to 2);

signal async_addr_cnt_ld   : std_logic;
signal async_addr_cnt_ce   : std_logic;
signal sync_addr_cnt_ld    : std_logic;
signal sync_addr_cnt_ce    : std_logic;
signal async_en            : std_logic;
signal async_ce            : std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8-1);
signal sync_en             : std_logic;
signal sync_ce             : std_logic_vector(0 to C_SPLB_NATIVE_DWIDTH/8-1);
signal addr_suffix         : std_logic_vector(0 to ADDRCNT_WIDTH-1);
signal steer_index         : std_logic_vector(0 to ADDRCNT_WIDTH-1);

signal dev_rdy             : std_logic;
signal sync_ads            : std_logic;
signal sync_cs_n           : std_logic_vector(0 to C_NUM_PERIPHERALS-1);
signal sync_rnw            : std_logic;
signal sync_burst          : std_logic;
signal sync_addr_ph        : std_logic;
signal sync_data_oe        : std_logic;

signal async_ads           : std_logic;
signal async_cs_n          : std_logic_vector(0 to C_NUM_PERIPHERALS-1);
signal async_rd_n          : std_logic;
signal async_wr_n          : std_logic;
signal async_addr_ph       : std_logic;
signal async_data_oe       : std_logic;

signal addr_int            : std_logic_vector(0 to C_PRH_MAX_AWIDTH-1);
signal data_int            : std_logic_vector(0 to C_PRH_MAX_DWIDTH-1);
signal prh_data_in         : std_logic_vector(0 to C_PRH_MAX_DWIDTH-1);

signal fifo_access         : std_logic := '0';
signal dev_fifo_access     : std_logic := '0';

-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------
begin

IPIC_DECODE_I : entity axi_epc_v2_0_23.ipic_if_decode

  generic map (
    C_SPLB_DWIDTH           => C_SPLB_DWIDTH,

    C_NUM_PERIPHERALS       => C_NUM_PERIPHERALS,
    C_PRH_CLK_SUPPORT       => C_PRH_CLK_SUPPORT,
    -----------------------------------------
    C_PRH0_DWIDTH_MATCH     => C_PRH0_DWIDTH_MATCH,
    C_PRH1_DWIDTH_MATCH     => C_PRH1_DWIDTH_MATCH,
    C_PRH2_DWIDTH_MATCH     => C_PRH2_DWIDTH_MATCH,
    C_PRH3_DWIDTH_MATCH     => C_PRH3_DWIDTH_MATCH,
    -----------------------------------------
    C_PRH0_DWIDTH           => C_PRH0_DWIDTH,
    C_PRH1_DWIDTH           => C_PRH1_DWIDTH,
    C_PRH2_DWIDTH           => C_PRH2_DWIDTH,
    C_PRH3_DWIDTH           => C_PRH3_DWIDTH,
    -----------------------------------------
    MAX_PERIPHERALS         => MAX_PERIPHERALS,
    NO_PRH_SYNC             => NO_PRH_SYNC,
    NO_PRH_ASYNC            => NO_PRH_ASYNC,
    PRH_SYNC                => PRH_SYNC,
    -----------------------------------------
    NO_PRH_BUS_MULTIPLEX    => NO_PRH_BUS_MULTIPLEX,
    PRH_BUS_MULTIPLEX       => PRH_BUS_MULTIPLEX,
    NO_PRH_DWIDTH_MATCH     => NO_PRH_DWIDTH_MATCH,
    PRH_DWIDTH_MATCH        => PRH_DWIDTH_MATCH
  )

  port map (
    Bus2IP_Clk              => Bus2IP_Clk,
    Bus2IP_Rst              => Bus2IP_Rst,
    ------------------------------------------
    Local_Clk               => Local_Clk,
    Local_Rst               => Local_Rst,
    ------------------------------------------
    Bus2IP_CS               => Bus2IP_CS,
    Bus2IP_RNW              => Bus2IP_RNW,
    ------------------------------------------
    IP2Bus_WrAck            => IP2Bus_WrAck,
    IP2Bus_RdAck            => IP2Bus_RdAck,
    IP2Bus_Error            => IP2Bus_Error,
    ------------------------------------------
    FIFO_access             => fifo_access,
    ------------------------------------------
    Dev_id                  => dev_id,
    Dev_fifo_access         => dev_fifo_access,
    Dev_in_access           => dev_in_access,
    Dev_sync_in_access      => dev_sync_in_access,
    Dev_async_in_access     => dev_async_in_access,
    Dev_sync                => dev_sync,
    Dev_rnw                 => dev_rnw,
    Dev_bus_multiplex       => dev_bus_multiplex,
    Dev_dwidth_match        => dev_dwidth_match,
    Dev_dbus_width          => dev_dbus_width,
    ------------------------------------------
    IPIC_sync_req           => ipic_sync_req,
    IPIC_async_req          => ipic_async_req,
    IP_sync_req_rst         => ip_sync_req_rst,
    ------------------------------------------
    IP_sync_Wrack           => ip_sync_Wrack,
    IP_sync_Rdack           => ip_sync_Rdack,
    IPIC_sync_ack_rst       => ipic_sync_ack_rst,
    ------------------------------------------
    IP_async_Wrack          => ip_async_Wrack,
    IP_async_Rdack          => ip_async_Rdack,
    ------------------------------------------
    IP_sync_error           => ip_sync_error,
    IP_async_error          => ip_async_error
   );

SYNC_CNTL_I : entity axi_epc_v2_0_23.sync_cntl

  generic map (
    C_SPLB_NATIVE_DWIDTH    => C_SPLB_NATIVE_DWIDTH,
    C_NUM_PERIPHERALS       => C_NUM_PERIPHERALS,
    C_PRH_CLK_SUPPORT       => C_PRH_CLK_SUPPORT,
    -----------------------------------------
    C_PRH0_ADDR_TSU         => C_PRH0_ADDR_TSU,
    C_PRH1_ADDR_TSU         => C_PRH1_ADDR_TSU,
    C_PRH2_ADDR_TSU         => C_PRH2_ADDR_TSU,
    C_PRH3_ADDR_TSU         => C_PRH3_ADDR_TSU,
    -----------------------------------------
    C_PRH0_ADDR_TH          => C_PRH0_ADDR_TH,
    C_PRH1_ADDR_TH          => C_PRH1_ADDR_TH,
    C_PRH2_ADDR_TH          => C_PRH2_ADDR_TH,
    C_PRH3_ADDR_TH          => C_PRH3_ADDR_TH,
    -----------------------------------------
    C_PRH0_ADS_WIDTH        => C_PRH0_ADS_WIDTH,
    C_PRH1_ADS_WIDTH        => C_PRH1_ADS_WIDTH,
    C_PRH2_ADS_WIDTH        => C_PRH2_ADS_WIDTH,
    C_PRH3_ADS_WIDTH        => C_PRH3_ADS_WIDTH,
    -----------------------------------------
    C_PRH0_RDY_WIDTH        => C_PRH0_RDY_WIDTH,
    C_PRH1_RDY_WIDTH        => C_PRH1_RDY_WIDTH,
    C_PRH2_RDY_WIDTH        => C_PRH2_RDY_WIDTH,
    C_PRH3_RDY_WIDTH        => C_PRH3_RDY_WIDTH,
    -----------------------------------------
    LOCAL_CLK_PERIOD_PS     => LOCAL_CLK_PERIOD_PS,
    MAX_PERIPHERALS         => MAX_PERIPHERALS,
    ADDRCNT_WIDTH           => ADDRCNT_WIDTH,
    NO_PRH_SYNC             => NO_PRH_SYNC,
    PRH_SYNC                => PRH_SYNC,
    NO_PRH_DWIDTH_MATCH     => NO_PRH_DWIDTH_MATCH
  )

  port map (
    Bus2IP_Clk              => Bus2IP_Clk,
    Bus2IP_Rst              => Bus2IP_Rst,
    ------------------------------------------
    Local_Clk               => Local_Clk,
    Local_Rst               => Local_Rst,
    ------------------------------------------
    Bus2IP_BE               => Bus2IP_BE,
    ------------------------------------------
    Dev_id                  => dev_id,
    Dev_fifo_access         => dev_fifo_access,
    Dev_in_access           => dev_sync_in_access,
    Dev_rnw                 => dev_rnw,
    Dev_bus_multiplex       => dev_bus_multiplex,
    Dev_dwidth_match        => dev_dwidth_match,
    Dev_dbus_width          => dev_dbus_width,
    ------------------------------------------
    IPIC_sync_req           => ipic_sync_req,
    IP_sync_req_rst         => ip_sync_req_rst,
    ------------------------------------------
    IP_sync_Wrack           => ip_sync_Wrack,
    IP_sync_Rdack           => ip_sync_Rdack,
    IPIC_sync_ack_rst       => ipic_sync_ack_rst,
    ------------------------------------------
    IP_sync_errack          => ip_sync_error,
    ------------------------------------------
    Sync_addr_cnt_ld        => sync_addr_cnt_ld,
    Sync_addr_cnt_ce        => sync_addr_cnt_ce,
    ------------------------------------------
    Sync_en                 => sync_en,
    Sync_ce                 => sync_ce,
    ------------------------------------------
    Steer_index             => steer_index,
    ------------------------------------------
    Dev_Rdy                 => dev_rdy,
    ------------------------------------------
    Sync_ADS                => sync_ads,
    Sync_CS_n               => sync_cs_n,
    Sync_RNW                => sync_rnw,
    Sync_Burst              => sync_burst,
    ------------------------------------------
    Sync_addr_ph            => sync_addr_ph,
    Sync_data_oe            => sync_data_oe
  );

ASYNC_CNTL_I : entity axi_epc_v2_0_23.async_cntl
  generic map (
    PRH_SYNC               =>  PRH_SYNC,
    NO_PRH_ASYNC           =>  NO_PRH_ASYNC,
    C_SPLB_NATIVE_DWIDTH   =>  C_SPLB_NATIVE_DWIDTH,
    ------------------------------------------
    C_PRH0_ADDR_TSU        => C_PRH0_ADDR_TSU,
    C_PRH0_ADDR_TH         => C_PRH0_ADDR_TH,
    C_PRH0_WRN_WIDTH       => C_PRH0_WRN_WIDTH,
    C_PRH0_DATA_TSU        => C_PRH0_DATA_TSU,
    C_PRH0_RDN_WIDTH       => C_PRH0_RDN_WIDTH,
    C_PRH0_DATA_TOUT       => C_PRH0_DATA_TOUT,
    C_PRH0_DATA_TH         => C_PRH0_DATA_TH,
    C_PRH0_DATA_TINV       => C_PRH0_DATA_TINV,
    C_PRH0_RDY_TOUT        => C_PRH0_RDY_TOUT,
    C_PRH0_RDY_WIDTH       => C_PRH0_RDY_WIDTH,
    C_PRH0_ADS_WIDTH       => C_PRH0_ADS_WIDTH,
    C_PRH0_CSN_TSU         => C_PRH0_CSN_TSU,
    C_PRH0_CSN_TH          => C_PRH0_CSN_TH,
    C_PRH0_WR_CYCLE        => C_PRH0_WR_CYCLE,
    C_PRH0_RD_CYCLE        => C_PRH0_RD_CYCLE,
    ------------------------------------------
    C_PRH1_ADDR_TSU        => C_PRH1_ADDR_TSU,
    C_PRH1_ADDR_TH         => C_PRH1_ADDR_TH,
    C_PRH1_WRN_WIDTH       => C_PRH1_WRN_WIDTH,
    C_PRH1_DATA_TSU        => C_PRH1_DATA_TSU,
    C_PRH1_RDN_WIDTH       => C_PRH1_RDN_WIDTH,
    C_PRH1_DATA_TOUT       => C_PRH1_DATA_TOUT,
    C_PRH1_DATA_TH         => C_PRH1_DATA_TH,
    C_PRH1_DATA_TINV       => C_PRH1_DATA_TINV,
    C_PRH1_RDY_TOUT        => C_PRH1_RDY_TOUT,
    C_PRH1_RDY_WIDTH       => C_PRH1_RDY_WIDTH,
    C_PRH1_ADS_WIDTH       => C_PRH1_ADS_WIDTH,
    C_PRH1_CSN_TSU         => C_PRH1_CSN_TSU,
    C_PRH1_CSN_TH          => C_PRH1_CSN_TH,
    C_PRH1_WR_CYCLE        => C_PRH1_WR_CYCLE,
    C_PRH1_RD_CYCLE        => C_PRH1_RD_CYCLE,
    ------------------------------------------
    C_PRH2_ADDR_TSU        => C_PRH2_ADDR_TSU,
    C_PRH2_ADDR_TH         => C_PRH2_ADDR_TH,
    C_PRH2_WRN_WIDTH       => C_PRH2_WRN_WIDTH,
    C_PRH2_DATA_TSU        => C_PRH2_DATA_TSU,
    C_PRH2_RDN_WIDTH       => C_PRH2_RDN_WIDTH,
    C_PRH2_DATA_TOUT       => C_PRH2_DATA_TOUT,
    C_PRH2_DATA_TH         => C_PRH2_DATA_TH,
    C_PRH2_DATA_TINV       => C_PRH2_DATA_TINV,
    C_PRH2_RDY_TOUT        => C_PRH2_RDY_TOUT,
    C_PRH2_RDY_WIDTH       => C_PRH2_RDY_WIDTH,
    C_PRH2_ADS_WIDTH       => C_PRH2_ADS_WIDTH,
    C_PRH2_CSN_TSU         => C_PRH2_CSN_TSU,
    C_PRH2_CSN_TH          => C_PRH2_CSN_TH,
    C_PRH2_WR_CYCLE        => C_PRH2_WR_CYCLE,
    C_PRH2_RD_CYCLE        => C_PRH2_RD_CYCLE,
    ------------------------------------------
    C_PRH3_ADDR_TSU        => C_PRH3_ADDR_TSU,
    C_PRH3_ADDR_TH         => C_PRH3_ADDR_TH,
    C_PRH3_WRN_WIDTH       => C_PRH3_WRN_WIDTH,
    C_PRH3_DATA_TSU        => C_PRH3_DATA_TSU,
    C_PRH3_RDN_WIDTH       => C_PRH3_RDN_WIDTH,
    C_PRH3_DATA_TOUT       => C_PRH3_DATA_TOUT,
    C_PRH3_DATA_TH         => C_PRH3_DATA_TH,
    C_PRH3_DATA_TINV       => C_PRH3_DATA_TINV,
    C_PRH3_RDY_TOUT        => C_PRH3_RDY_TOUT,
    C_PRH3_RDY_WIDTH       => C_PRH3_RDY_WIDTH,
    C_PRH3_ADS_WIDTH       => C_PRH3_ADS_WIDTH,
    C_PRH3_CSN_TSU         => C_PRH3_CSN_TSU,
    C_PRH3_CSN_TH          => C_PRH3_CSN_TH,
    C_PRH3_WR_CYCLE        => C_PRH3_WR_CYCLE,
    C_PRH3_RD_CYCLE        => C_PRH3_RD_CYCLE,
    ------------------------------------------
    C_BUS_CLOCK_PERIOD_PS  => C_SPLB_CLK_PERIOD_PS,
--    C_MAX_DWIDTH           => C_PRH_MAX_DWIDTH,
    C_NUM_PERIPHERALS      => C_NUM_PERIPHERALS,
    C_MAX_PERIPHERALS      => MAX_PERIPHERALS
    ------------------------------------------
  )

 port map(
    Bus2IP_CS              => Bus2IP_CS,
    Bus2IP_RdCE            => Bus2IP_RdCE,
    Bus2IP_WrCE            => Bus2IP_WrCE,
    Bus2IP_BE              => Bus2IP_BE,
    Bus2IP_RNW             => Bus2IP_RNW,
    ------------------------------------------
    IPIC_Asynch_req        => ipic_async_req,
    Dev_FIFO_access        => dev_fifo_access,
    Dev_in_access          => dev_async_in_access,
    ------------------------------------------
    Asynch_prh_rdy         => dev_rdy,
    Dev_dwidth_match       => dev_dwidth_match,
--    Dev_dbus_width         => dev_dbus_width,
    Dev_bus_multiplexed    => dev_bus_multiplex,
    Asynch_ce              => async_ce,
    ------------------------------------------
    Asynch_Wrack           => ip_async_Wrack,
    Asynch_Rdack           => ip_async_Rdack,
    Asynch_error           => ip_async_error,
    ------------------------------------------
    Asynch_Wr              => async_wr_n,
    Asynch_Rd              => async_rd_n,
    Asynch_en              => async_en,
    ------------------------------------------
    Asynch_addr_strobe     => async_ads,
    Asynch_addr_data_sel   => async_addr_ph,
    Asynch_data_sel        => async_data_oe,
    Asynch_chip_select     => async_cs_n,
    Asynch_addr_cnt_ld     => async_addr_cnt_ld,
    Asynch_addr_cnt_en     => async_addr_cnt_ce,
    ------------------------------------------
    Clk                    => Bus2IP_Clk,
    Rst                    => Bus2IP_Rst
);

ADDRESS_GEN_I: entity axi_epc_v2_0_23.address_gen

  generic map (
     C_PRH_MAX_AWIDTH       => C_PRH_MAX_AWIDTH,
     NO_PRH_DWIDTH_MATCH    => NO_PRH_DWIDTH_MATCH,
     NO_PRH_SYNC            => NO_PRH_SYNC,
     NO_PRH_ASYNC           => NO_PRH_ASYNC,
     ADDRCNT_WIDTH          => ADDRCNT_WIDTH
  )

  port map (
    Bus2IP_Clk              => Bus2IP_Clk,
    Bus2IP_Rst              => Bus2IP_Rst,
    ------------------------------------------
    Local_Clk               => Local_Clk,
    Local_Rst               => Local_Rst,
    ------------------------------------------
    Bus2IP_Addr             => bus2ip_addr,
    ------------------------------------------
    Dev_fifo_access         => dev_fifo_access,
    Dev_sync                => dev_sync,
    Dev_dwidth_match        => dev_dwidth_match,
    Dev_dbus_width          => dev_dbus_width,
    ------------------------------------------
    Async_addr_cnt_ld       => async_addr_cnt_ld,
    Async_addr_cnt_ce       => async_addr_cnt_ce,
    ------------------------------------------
    Sync_addr_cnt_ld        => sync_addr_cnt_ld,
    Sync_addr_cnt_ce        => sync_addr_cnt_ce,
    ------------------------------------------
    Addr_Int                => addr_int,
    Addr_suffix             => addr_suffix

  );

DATA_STEER_I: entity axi_epc_v2_0_23.data_steer

  generic map (
     C_SPLB_NATIVE_DWIDTH  => C_SPLB_NATIVE_DWIDTH,
     C_PRH_MAX_DWIDTH      => C_PRH_MAX_DWIDTH,
     ALL_PRH_DWIDTH_MATCH  => ALL_PRH_DWIDTH_MATCH,
     NO_PRH_DWIDTH_MATCH   => NO_PRH_DWIDTH_MATCH,
     NO_PRH_SYNC           => NO_PRH_SYNC,
     NO_PRH_ASYNC          => NO_PRH_ASYNC,
     ADDRCNT_WIDTH         => ADDRCNT_WIDTH
  )

  port map (

     Bus2IP_Clk            => Bus2IP_Clk,
     Bus2IP_Rst            => Bus2IP_Rst,
    ------------------------------------------
     Local_Clk             => Local_Clk,
     Local_Rst             => Local_Rst,
    ------------------------------------------
     Bus2IP_RNW            => Bus2IP_RNW,
     Bus2IP_BE             => Bus2IP_BE,
     Bus2IP_Data           => Bus2IP_Data,
    ------------------------------------------
     Dev_in_access         => dev_in_access,
     Dev_sync              => dev_sync,
     Dev_rnw               => dev_rnw,
     Dev_dwidth_match      => dev_dwidth_match,
     Dev_dbus_width        => dev_dbus_width,
    ------------------------------------------
     Addr_suffix           => addr_suffix,
     Steer_index           => steer_index,
    ------------------------------------------
     Async_en              => async_en,
     Async_ce              => async_ce,
    ------------------------------------------
     Sync_en               => sync_en,
     Sync_ce               => sync_ce,
    ------------------------------------------
     PRH_Data_In           => prh_data_in,
     PRH_BE                => PRH_BE,
    ------------------------------------------
     Data_Int              => data_int,
     IP2Bus_Data           => IP2Bus_Data,
     Dev_bus_multiplex         => Dev_bus_multiplex
  );


ACCESS_MUX_I : entity axi_epc_v2_0_23.access_mux

  generic map (
    C_NUM_PERIPHERALS      => C_NUM_PERIPHERALS,
    C_PRH_MAX_AWIDTH       => C_PRH_MAX_AWIDTH,
    C_PRH_MAX_DWIDTH       => C_PRH_MAX_DWIDTH,
    C_PRH_MAX_ADWIDTH      => C_PRH_MAX_ADWIDTH,
    ------------------------------------------
    C_PRH0_AWIDTH          => C_PRH0_AWIDTH,
    C_PRH1_AWIDTH          => C_PRH1_AWIDTH,
    C_PRH2_AWIDTH          => C_PRH2_AWIDTH,
    C_PRH3_AWIDTH          => C_PRH3_AWIDTH,
    ------------------------------------------
    C_PRH0_DWIDTH          => C_PRH0_DWIDTH,
    C_PRH1_DWIDTH          => C_PRH1_DWIDTH,
    C_PRH2_DWIDTH          => C_PRH2_DWIDTH,
    C_PRH3_DWIDTH          => C_PRH3_DWIDTH,
    ------------------------------------------
    C_PRH0_BUS_MULTIPLEX   => C_PRH0_BUS_MULTIPLEX,
    C_PRH1_BUS_MULTIPLEX   => C_PRH1_BUS_MULTIPLEX,
    C_PRH2_BUS_MULTIPLEX   => C_PRH2_BUS_MULTIPLEX,
    C_PRH3_BUS_MULTIPLEX   => C_PRH3_BUS_MULTIPLEX,
    ------------------------------------------
    MAX_PERIPHERALS        => MAX_PERIPHERALS,
    NO_PRH_SYNC            => NO_PRH_SYNC,
    NO_PRH_ASYNC           => NO_PRH_ASYNC,
    NO_PRH_BUS_MULTIPLEX   => NO_PRH_BUS_MULTIPLEX
  )

  port map (
    Local_Clk              => Local_Clk,
    Dev_id                 => dev_id,
    ------------------------------------------
    Sync_CS_n              => sync_cs_n,
    Sync_ADS               => sync_ads,
    Sync_RNW               => sync_rnw,
    Sync_Burst             => sync_burst,
    Sync_addr_ph           => sync_addr_ph,
    Sync_data_oe           => sync_data_oe,
    ------------------------------------------
    Async_CS_n             => async_cs_n,
    Async_ADS              => async_ads,
    Async_Rd_n             => async_rd_n,
    Async_Wr_n             => async_wr_n,
    Async_addr_ph          => async_addr_ph,
    Async_data_oe          => async_data_oe,
    ------------------------------------------
    Addr_Int               => addr_int,
    Data_Int               => data_int,
    ------------------------------------------
    PRH_CS_n               => PRH_CS_n,
    PRH_ADS                => PRH_ADS,
    PRH_RNW                => PRH_RNW,
    PRH_Rd_n               => PRH_Rd_n,
    PRH_Wr_n               => PRH_Wr_n,
    PRH_Burst              => PRH_Burst,
    ------------------------------------------
    PRH_Rdy                => PRH_Rdy,
    Dev_Rdy                => dev_rdy,
    ------------------------------------------
    PRH_Addr               => PRH_Addr,
    PRH_Data_O             => PRH_Data_O,
    PRH_Data_T             => PRH_Data_T
  );


prh_data_in <= PRH_Data_I(0 to C_PRH_MAX_DWIDTH-1);

-------------------------------------------------------------------------------
-- NAME: DEV_FIFO_ACCESS_PROCESS
-------------------------------------------------------------------------------
-- Description: Generate an indication to the internal modules that the
--              current transaction is to a FIFO like structure
-------------------------------------------------------------------------------
DEV_FIFO_ACCESS_PROCESS: process (Bus2IP_CS, Bus2IP_Addr) is
begin
   fifo_access <= '0';
   for i in 0 to C_NUM_PERIPHERALS-1 loop
     if (Bus2IP_CS(i) = '1') then
       if ( (PRH_FIFO_ACCESS_ARRAY(i) = 1) and
            (Bus2IP_Addr = PRH_FIFO_ADDRESS_ARRAY(i)
                           (C_SPLB_AWIDTH-C_PRH_MAX_AWIDTH to C_SPLB_AWIDTH-1))
          ) then
            fifo_access <= '1';
        end if;
     end if;
   end loop;
end process DEV_FIFO_ACCESS_PROCESS;

end architecture imp;
--------------------------------end of file------------------------------------


-------------------------------------------------------------------------------
-- axi_epc.vhd - entity/architecture pair
-------------------------------------------------------------------------------
-- ************************************************************************
-- ** DISCLAIMER OF LIABILITY                                            **
-- **                                                                    **
-- ** This file contains proprietary and confidential information of     **
-- ** Xilinx, Inc. ("Xilinx"), that is distributed under a license       **
-- ** from Xilinx, and may be used, copied and/or disclosed only         **
-- ** pursuant to the terms of a valid license agreement with Xilinx.    **
-- **                                                                    **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION              **
-- ** ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER         **
-- ** EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT                **
-- ** LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,          **
-- ** MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx      **
-- ** does not warrant that functions included in the Materials will     **
-- ** meet the requirements of Licensee, or that the operation of the    **
-- ** Materials will be uninterrupted or error-free, or that defects     **
-- ** in the Materials will be corrected. Furthermore, Xilinx does       **
-- ** not warrant or make any representations regarding use, or the      **
-- ** results of the use, of the Materials in terms of correctness,      **
-- ** accuracy, reliability or otherwise.                                **
-- **                                                                    **
-- ** Xilinx products are not designed or intended to be fail-safe,      **
-- ** or for use in any application requiring fail-safe performance,     **
-- ** such as life-support or safety devices or systems, Class III       **
-- ** medical devices, nuclear facilities, applications related to       **
-- ** the deployment of airbags, or any other applications that could    **
-- ** lead to death, personal injury or severe property or               **
-- ** environmental damage (individually and collectively, "critical     **
-- ** applications"). Customer assumes the sole risk and liability       **
-- ** of any use of Xilinx products in critical applications,            **
-- ** subject only to applicable laws and regulations governing          **
-- ** limitations on product liability.                                  **
-- **                                                                    **
-- ** Copyright 2005, 2006, 2008, 2009 Xilinx, Inc.                      **
-- ** All rights reserved.                                               **
-- **                                                                    **
-- ** This disclaimer and copyright notice must be retained as part      **
-- ** of this file at all times.                                         **
-- ************************************************************************
-- 
-------------------------------------------------------------------------------
-- File          : axi_epc.vhd
-- Company       : Xilinx
-- Version       : v1.00.a
-- Description   : External Peripheral Controller for AXI bus
-- Standard      : VHDL-93
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Structure:
--             axi_epc.vhd
--               -axi_lite_ipif
--               -epc_core.vhd
--               -ipic_if_decode.vhd
--               -sync_cntl.vhd
--               -async_cntl.vhd
--                  -- async_counters.vhd
--                  -- async_statemachine.vhd
--               -address_gen.vhd
--               -data_steer.vhd
--               -access_mux.vhd
-------------------------------------------------------------------------------
-- Author   : VB
-- History  :
--
--  VB          08-24-2010 --  v2_0 version for AXI 
-- ^^^^^^
--            The core updated for AXI based on axi_epc_v2_0_23
-- ~~~~~~
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

use IEEE.std_logic_arith.conv_std_logic_vector;

            

library axi_lite_ipif_v3_0_4;
use axi_lite_ipif_v3_0_4.ipif_pkg.INTEGER_ARRAY_TYPE;
use axi_lite_ipif_v3_0_4.ipif_pkg.SLV64_ARRAY_TYPE;
use axi_lite_ipif_v3_0_4.ipif_pkg.calc_num_ce;

library axi_epc_v2_0_23;


-------------------------------------------------------------------------------
--                     Definition of Generics
-------------------------------------------------------------------------------
-- C_BASEADDR               -- User logic base address
-- C_HIGHADDR               -- User logic high address
-- C_S_AXI_DATA_WIDTH       -- AXI data bus width
-- C_S_AXI_ADDR_WIDTH       -- AXI address bus width
-- C_FAMILY                 -- Default family
-- C_INSTANCE               -- Instance name of the axi_apb_bridge in the
--                          -- system
   ------------------------------------------------------
-- C_S_AXI_CLK_PERIOD_PS      -  The clock period of AXI Clock in picoseconds
-- C_PRH_CLK_PERIOD_PS      -  The clock period of peripheral clock in
--                             picoseconds
   ------------------------------------------------------
-- C_NUM_PERIPHERALS        -  Number of external devices connected to AXI EPC
-- C_PRH_MAX_AWIDTH         -  Maximum of address bus width of all peripherals
-- C_PRH_MAX_DWIDTH         -  Maximum of data bus width of all peripherals
-- C_PRH_MAX_ADWIDTH        -  Maximum of data bus width of all peripherals
--                             and address bus width of peripherals employing
--                             multiplexed address/data bus
-- C_PRH_CLK_SUPPORT        -  Indication of whether the synchronous interface
--                             operates on peripheral clock or on AXI clock
-- C_PRH_BURST_SUPPORT      -  Indicates if the AXI EPC supports burst
-- C_PRH(0:3)_BASEADDR      -  External peripheral (0:3) base address
-- C_PRH(0:3)_HIGHADDR      -  External peripheral (0:3) high address
-- C_PRH(0:3)_FIFO_ACCESS   -  Indicates if the support for accessing FIFO
--                             like structure within external device is
--                             required
-- C_PRH(0:3)_FIFO_OFFSET   -  Byte offset of FIFO from the base address
--                             assigned to peripheral
-- C_PRH(0:3)_AWIDTH        -  External peripheral (0:3) address bus width
-- C_PRH(0:3)_DWIDTH        -  External peripheral (0:3) data bus width
-- C_PRH(0:3)_DWIDTH_MATCH  -  Indication of whether external peripheral (0:3)
--                             supports multiple access cycle on the
--                             peripheral interface for a single AXI cycle
--                             when the peripheral data bus width is less than
--                             that of AXI bus data width
-- C_PRH(0:3)_SYNC          -  Indicates if the external device (0:3) uses
--                             synchronous or asynchronous interface
-- C_PRH(0:3)_BUS_MULTIPLEX -  Indicates if the external device (0:3) uses a
--                             multiplexed or non-multiplexed device
-- C_PRH(0:3)_ADDR_TSU      -  External device (0:3) address setup time with
--                             respect  to rising edge of address strobe
--                             (multiplexed address and data bus) or falling
--                             edge of  read/write signal (non-multiplexed
--                             address/data bus)
-- C_PRH(0:3)_ADDR_TH       -  External device (0:3) address hold time with
--                             respect to rising edge of address strobe
--                             (multiplexed address and data bus) or rising
--                             edge of read/write signal (non-multiplexed
--                             address/data bus)
-- C_PRH(0:3)_ADS_WIDTH     -  Minimum pulse width of address strobe
-- C_PRH(0:3)_CSN_TSU       -  External device (0:3) chip select setup time
--                             with  respect to falling edge of read/write
--                             signal
-- C_PRH(0:3)_CSN_TH        -  External device (0:3) chip select hold time with
--                             respect to rising edge of read/write signal
-- C_PRH(0:3)_WRN_WIDTH     -  External device (0:3) write signal minimum
--                             pulse width
-- C_PRH(0:3)_WR_CYCLE      -  External device (0:3) write cycle time
-- C_PRH(0:3)_DATA_TSU      -  External device (0:3) data bus setup with
--                             respect to rising edge of write signal
-- C_PRH(0:3)_DATA_TH       -  External device (0:3) data bus hold  with
--                             respect to rising edge of write signal
-- C_PRH(0:3)_RDN_WIDTH     -  External device (0:3) read signal minimum
--                             pulse width
-- C_PRH(0:3)_RD_CYCLE      -  External device (0:3) read cycle time
-- C_PRH(0:3)_DATA_TOUT     -  External device (0:3) data bus validity with
--                             respect to falling edge of read signal
-- C_PRH(0:3)_DATA_TINV     -  External device (0:3) data bus high impedence
--                             with respect to rising edge of read signal
-- C_PRH(0:3)_RDY_TOUT      -  External device (0:3) device ready validity from
--                             falling edge of read/write signal
-- C_PRH(0:3)_RDY_WIDTH     -  Maximum wait period for external device (0:3)
--                             ready signal assertion

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                  Definition of Ports
-------------------------------------------------------------------------------

------------------------------------------
-- S_AXI_ACLK            -- AXI Clock
-- S_AXI_ARESETN          -- AXI Reset
-- S_AXI_AWADDR          -- AXI Write address
-- S_AXI_AWVALID         -- Write address valid
-- S_AXI_AWREADY         -- Write address ready
-- S_AXI_WDATA           -- Write data
-- S_AXI_WSTRB           -- Write strobes
-- S_AXI_WVALID          -- Write valid
-- S_AXI_WREADY          -- Write ready
-- S_AXI_BRESP           -- Write response
-- S_AXI_BVALID          -- Write response valid
-- S_AXI_BREADY          -- Response ready
-- S_AXI_ARADDR          -- Read address
-- S_AXI_ARVALID         -- Read address valid
-- S_AXI_ARREADY         -- Read address ready
-- S_AXI_RDATA           -- Read data
-- S_AXI_RRESP           -- Read response
-- S_AXI_RVALID          -- Read valid
-- S_AXI_RREADY          -- Read ready
-----------------------------------------------------
-- PERIPHERAL INTERFACE
-----------------------------------------------------
-- PRH_Clk              -- Peripheral interface clock
-- PRH_Rst              -- Peripheral interface reset
-- PRH_CS_n             -- Peripheral interface chip select
-- PRH_Addr             -- Peripheral interface address bus
-- PRH_ADS              -- Peripheral interface address strobe
-- PRH_BE               -- Peripheral interface byte enables
-- PRH_RNW              -- Peripheral interface read/write control for
--                      -- synchronous interface
-- PRH_Rd_n             -- Peripheral interface read strobe for asynchronous
--                      -- interface
-- PRH_Wr_n             -- Peripheral interface write strobe for asynchronous
--                      -- interface
-- PRH_Burst            -- Peripheral interface burst indication signal
-- PRH_Rdy              -- Peripheral interface device ready signal
-- PRH_Data_I           -- Peripheral interface input data bus
-- PRH_Data_O           -- Peripehral interface output data bus
-- PRH_Data_T           -- 3-state control for peripheral interface output data
--                      -- bus
-------------------------------------------------------------------------------

entity axi_epc is
  generic
  (
      C_S_AXI_CLK_PERIOD_PS  : integer := 10000;
      C_PRH_CLK_PERIOD_PS   : integer := 20000;
      -----------------------------------------
      C_FAMILY                : string                        := "virtex7";
      C_INSTANCE              : string                        := "axi_epc_inst";
      C_S_AXI_ADDR_WIDTH      : integer range 32 to 32   := 32;
      --C_S_AXI_DATA_WIDTH      : integer range 32 to 128  := 32;
      C_S_AXI_DATA_WIDTH      : integer range 32 to 32  := 32;
-----------------------------------------
      C_NUM_PERIPHERALS     : integer range 1 to 4 := 1;
      C_PRH_MAX_AWIDTH      : integer range 3 to 32:= 32;
      C_PRH_MAX_DWIDTH      : integer range 8 to 32:= 32;
      C_PRH_MAX_ADWIDTH     : integer range 8 to 32:= 32;
      C_PRH_CLK_SUPPORT     : integer range 0 to 1 := 0;
      C_PRH_BURST_SUPPORT   : integer              := 0;
      -----------------------------------------
      C_PRH0_BASEADDR       : std_logic_vector := X"A500_0000";
      C_PRH0_HIGHADDR       : std_logic_vector := X"A500_FFFF";

      C_PRH0_FIFO_ACCESS    : integer range 0 to 1:= 0;
      C_PRH0_FIFO_OFFSET    : integer := 0;
      C_PRH0_AWIDTH         : integer range 3 to 32:= 32;
      C_PRH0_DWIDTH         : integer range 8 to 32 := 32;
      C_PRH0_DWIDTH_MATCH   : integer range 0 to 1:= 0;
      C_PRH0_SYNC           : integer range 0 to 1:= 1;
      C_PRH0_BUS_MULTIPLEX  : integer range 0 to 1:= 0;
      C_PRH0_ADDR_TSU       : integer := 0;
      C_PRH0_ADDR_TH        : integer := 0;
      C_PRH0_ADS_WIDTH      : integer := 0;
      C_PRH0_CSN_TSU        : integer := 0;
      C_PRH0_CSN_TH         : integer := 0;
      C_PRH0_WRN_WIDTH      : integer := 0;
      C_PRH0_WR_CYCLE       : integer := 0;
      C_PRH0_DATA_TSU       : integer := 0;
      C_PRH0_DATA_TH        : integer := 0;
      C_PRH0_RDN_WIDTH      : integer := 0;
      C_PRH0_RD_CYCLE       : integer := 0;
      C_PRH0_DATA_TOUT      : integer := 0;
      C_PRH0_DATA_TINV      : integer := 0;
      C_PRH0_RDY_TOUT       : integer := 0;
      C_PRH0_RDY_WIDTH      : integer := 0;

      -----------------------------------------
      C_PRH1_BASEADDR       : std_logic_vector := X"FFFF_FFFF";
      C_PRH1_HIGHADDR       : std_logic_vector := X"0000_0000";

      C_PRH1_FIFO_ACCESS    : integer range 0 to 1:= 0;
      C_PRH1_FIFO_OFFSET    : integer := 0;
      C_PRH1_AWIDTH         : integer range 3 to 32:= 32;
      C_PRH1_DWIDTH         : integer range 8 to 32 := 32;
      C_PRH1_DWIDTH_MATCH   : integer range 0 to 1:= 0;
      C_PRH1_SYNC           : integer range 0 to 1:= 1;
      C_PRH1_BUS_MULTIPLEX  : integer range 0 to 1:= 0;
      C_PRH1_ADDR_TSU       : integer := 0;
      C_PRH1_ADDR_TH        : integer := 0;
      C_PRH1_ADS_WIDTH      : integer := 0;
      C_PRH1_CSN_TSU        : integer := 0;
      C_PRH1_CSN_TH         : integer := 0;
      C_PRH1_WRN_WIDTH      : integer := 0;
      C_PRH1_WR_CYCLE       : integer := 0;
      C_PRH1_DATA_TSU       : integer := 0;
      C_PRH1_DATA_TH        : integer := 0;
      C_PRH1_RDN_WIDTH      : integer := 0;
      C_PRH1_RD_CYCLE       : integer := 0;
      C_PRH1_DATA_TOUT      : integer := 0;
      C_PRH1_DATA_TINV      : integer := 0;
      C_PRH1_RDY_TOUT       : integer := 0;
      C_PRH1_RDY_WIDTH      : integer := 0;

      -----------------------------------------
      C_PRH2_BASEADDR       : std_logic_vector := X"FFFF_FFFF";
      C_PRH2_HIGHADDR       : std_logic_vector := X"0000_0000";

      C_PRH2_FIFO_ACCESS    : integer range 0 to 1:= 0;
      C_PRH2_FIFO_OFFSET    : integer := 0;
      C_PRH2_AWIDTH         : integer range 3 to 32:= 32;
      C_PRH2_DWIDTH         : integer range 8 to 32 := 32;
      C_PRH2_DWIDTH_MATCH   : integer range 0 to 1:= 0;
      C_PRH2_SYNC           : integer range 0 to 1:= 1;
      C_PRH2_BUS_MULTIPLEX  : integer range 0 to 1:= 0;
      C_PRH2_ADDR_TSU       : integer := 0;
      C_PRH2_ADDR_TH        : integer := 0;
      C_PRH2_ADS_WIDTH      : integer := 0;
      C_PRH2_CSN_TSU        : integer := 0;
      C_PRH2_CSN_TH         : integer := 0;
      C_PRH2_WRN_WIDTH      : integer := 0;
      C_PRH2_WR_CYCLE       : integer := 0;
      C_PRH2_DATA_TSU       : integer := 0;
      C_PRH2_DATA_TH        : integer := 0;
      C_PRH2_RDN_WIDTH      : integer := 0;
      C_PRH2_RD_CYCLE       : integer := 0;
      C_PRH2_DATA_TOUT      : integer := 0;
      C_PRH2_DATA_TINV      : integer := 0;
      C_PRH2_RDY_TOUT       : integer := 0;
      C_PRH2_RDY_WIDTH      : integer := 0;

      -----------------------------------------
      C_PRH3_BASEADDR       : std_logic_vector := X"FFFF_FFFF";
      C_PRH3_HIGHADDR       : std_logic_vector := X"0000_0000";

      C_PRH3_FIFO_ACCESS    : integer range 0 to 1:= 0;
      C_PRH3_FIFO_OFFSET    : integer := 0;
      C_PRH3_AWIDTH         : integer range 3 to 32:= 32;
      C_PRH3_DWIDTH         : integer range 8 to 32 := 32;
      C_PRH3_DWIDTH_MATCH   : integer range 0 to 1:= 0;
      C_PRH3_SYNC           : integer range 0 to 1:= 1;
      C_PRH3_BUS_MULTIPLEX  : integer range 0 to 1:= 0;
      C_PRH3_ADDR_TSU       : integer := 0;
      C_PRH3_ADDR_TH        : integer := 0;
      C_PRH3_ADS_WIDTH      : integer := 0;
      C_PRH3_CSN_TSU        : integer := 0;
      C_PRH3_CSN_TH         : integer := 0;
      C_PRH3_WRN_WIDTH      : integer := 0;
      C_PRH3_WR_CYCLE       : integer := 0;
      C_PRH3_DATA_TSU       : integer := 0;
      C_PRH3_DATA_TH        : integer := 0;
      C_PRH3_RDN_WIDTH      : integer := 0;
      C_PRH3_RD_CYCLE       : integer := 0;
      C_PRH3_DATA_TOUT      : integer := 0;
      C_PRH3_DATA_TINV      : integer := 0;
      C_PRH3_RDY_TOUT       : integer := 0;
      C_PRH3_RDY_WIDTH      : integer := 0
      -----------------------------------------
  );
  port
  (
    -- system interface
    s_axi_aclk      : in  std_logic;
    s_axi_aresetn   : in  std_logic;
    -- axi write address channel signals
    s_axi_awaddr    : in  std_logic_vector(31 downto 0);  --((c_s_axi_addr_width-1) downto 0);
    s_axi_awvalid   : in  std_logic;
    s_axi_awready   : out std_logic;
    -- axi write data channel signals
    s_axi_wdata     : in  std_logic_vector(31 downto 0);    --((c_s_axi_data_width-1) downto 0);
    s_axi_wstrb     : in  std_logic_vector(3 downto 0);    --(((c_s_axi_data_width/8)-1) downto 0);
    s_axi_wvalid    : in  std_logic;
    s_axi_wready    : out std_logic;
    -- axi write response channel signals
    s_axi_bresp     : out std_logic_vector(1 downto 0);
    s_axi_bvalid    : out std_logic;
    s_axi_bready    : in  std_logic;
    -- axi read address channel signals
    s_axi_araddr    : in  std_logic_vector(31 downto 0);     --((c_s_axi_addr_width-1) downto 0);
    s_axi_arvalid   : in  std_logic;
    s_axi_arready   : out std_logic;
    -- axi read address channel signals
    s_axi_rdata     : out std_logic_vector(31 downto 0);    --((c_s_axi_data_width-1) downto 0);
    s_axi_rresp     : out std_logic_vector(1 downto 0);
    s_axi_rvalid    : out std_logic;
    s_axi_rready    : in  std_logic;

      -- peripheral interface
    prh_clk                 : in std_logic;
    prh_rst                 : in std_logic;

    prh_cs_n                : out std_logic_vector(0 to C_NUM_PERIPHERALS-1);
    prh_addr                : out std_logic_vector(0 to C_PRH_MAX_AWIDTH-1);
    prh_ads                 : out std_logic;
    prh_be                  : out std_logic_vector(0 to C_PRH_MAX_DWIDTH/8-1);
    prh_rnw                 : out std_logic;
    prh_rd_n                : out std_logic;
    prh_wr_n                : out std_logic;
    prh_burst               : out std_logic;

    prh_rdy                 : in std_logic_vector(0 to C_NUM_PERIPHERALS-1);

    prh_data_i              : in std_logic_vector(0 to C_PRH_MAX_ADWIDTH-1);
    prh_data_o              : out std_logic_vector(0 to C_PRH_MAX_ADWIDTH-1);
    prh_data_t              : out std_logic_vector(0 to C_PRH_MAX_ADWIDTH-1)
  );

-------------------------------------------------------------------------------
-- Attributes
-------------------------------------------------------------------------------

  -----------------------------------------------------------------
  -- Start of PSFUtil MPD attributes
  -----------------------------------------------------------------

  ATTRIBUTE SIGIS                                : string;
  ATTRIBUTE SIGIS of s_axi_aclk                    : signal is "Clk";
  ATTRIBUTE SIGIS of s_axi_aresetn                    : signal is "Rst";
  ATTRIBUTE SIGIS of prh_clk                     : signal is "Clk";
  ATTRIBUTE SIGIS of prh_rst                     : signal is "Rst";

  ATTRIBUTE XRANGE                               : string;
  ATTRIBUTE XRANGE of C_NUM_PERIPHERALS          : constant is "(1:4)";
  ATTRIBUTE XRANGE of C_PRH_BURST_SUPPORT        : constant is "(0,1)";
  ATTRIBUTE XRANGE of C_PRH_CLK_SUPPORT          : constant is "(0,1)";
  ATTRIBUTE XRANGE of C_PRH0_DWIDTH_MATCH        : constant is "(0,1)";
  ATTRIBUTE XRANGE of C_PRH1_DWIDTH_MATCH        : constant is "(0,1)";
  ATTRIBUTE XRANGE of C_PRH2_DWIDTH_MATCH        : constant is "(0,1)";
  ATTRIBUTE XRANGE of C_PRH3_DWIDTH_MATCH        : constant is "(0,1)";
  ATTRIBUTE XRANGE of C_PRH0_BUS_MULTIPLEX       : constant is "(0,1)";
  ATTRIBUTE XRANGE of C_PRH1_BUS_MULTIPLEX       : constant is "(0,1)";
  ATTRIBUTE XRANGE of C_PRH2_BUS_MULTIPLEX       : constant is "(0,1)";
  ATTRIBUTE XRANGE of C_PRH3_BUS_MULTIPLEX       : constant is "(0,1)";
  ATTRIBUTE XRANGE of C_PRH0_SYNC                : constant is "(0,1)";
  ATTRIBUTE XRANGE of C_PRH1_SYNC                : constant is "(0,1)";
  ATTRIBUTE XRANGE of C_PRH2_SYNC                : constant is "(0,1)";
  ATTRIBUTE XRANGE of C_PRH3_SYNC                : constant is "(0,1)";

  ATTRIBUTE XRANGE of C_PRH0_DWIDTH              : constant is "(8,16,32)";
  ATTRIBUTE XRANGE of C_PRH1_DWIDTH              : constant is "(8,16,32)";
  ATTRIBUTE XRANGE of C_PRH2_DWIDTH              : constant is "(8,16,32)";
  ATTRIBUTE XRANGE of C_PRH3_DWIDTH              : constant is "(8,16,32)";
  ATTRIBUTE XRANGE of C_PRH_MAX_AWIDTH           : constant is "(3:32)";
  ATTRIBUTE XRANGE of C_PRH_MAX_DWIDTH           : constant is "(8,16,32)";
  ATTRIBUTE XRANGE of C_PRH_MAX_ADWIDTH          : constant is "(8:32)";

  -----------------------------------------------------------------
  -- end of PSFUtil MPD attributes
  -----------------------------------------------------------------
end entity axi_epc;

-------------------------------------------------------------------------------
-- Architecture Section
-------------------------------------------------------------------------------

architecture imp of axi_epc is

-------------------------------------------------------------------------------
-- Function Declarations
-------------------------------------------------------------------------------
-- NAME: get_effective_val
-------------------------------------------------------------------------------
-- Description: Given two possible values that can be taken by an item and a
--              generic setting that affects the actual value taken by the
--              item, this function  returns the effective value taken by the
--              item depending on the value of the generic. This function
--              is used to calculate the effective data bus width based on
--              data bus width matching generic (C_PRHx_DWIDTH_MATCH) and
--              effective clock period of peripheral clock based on peripheral
--              clock support generic (C_PRH_CLK_SUPPORT)
-------------------------------------------------------------------------------
function get_effective_val(generic_val : integer;
                           value_1     : integer;
                           value_2     : integer)
                           return integer is
    variable effective_val : integer;
begin
    if generic_val = 0 then
        effective_val := value_1;
    else
        effective_val := value_2;
    end if;

return effective_val;
end function get_effective_val;
-------------------------------------------------------------------------------
-- NAME: get_ard_integer_array
-------------------------------------------------------------------------------
-- Description: Given an integer N, and an unconstrained INTEGER_ARRAY return
--              a constrained array of size N with the first N elements of the
--              input array. This function is used to construct IPIF generic
--              ARD_ID_ARRAY, ARD_DWIDTH_ARRAY, ARD_NUM_CE_ARRAY etc.
-------------------------------------------------------------------------------
function get_ard_integer_array( num_peripherals : integer;
                                prh_parameter   : INTEGER_ARRAY_TYPE )
                                return INTEGER_ARRAY_TYPE is

variable integer_array : INTEGER_ARRAY_TYPE(0 to num_peripherals-1);

begin
       for i in 0 to (num_peripherals - 1) loop
         integer_array(i) := prh_parameter(i);
       end loop;

return integer_array;
end function get_ard_integer_array;

-------------------------------------------------------------------------------
-- NAME: get_ard_address_range_array
-------------------------------------------------------------------------------
-- Description: Given an integer N, and an unconstrained INTEGER_ARRAY return
--              a constrained array of size N*2 with the first N*2 elements of
--              the input array. This function is used to construct IPIF
--              generic ARD_ADDR_RANGE_ARRAY
-------------------------------------------------------------------------------
function get_ard_addr_range_array ( num_peripherals      : integer;
                                    prh_addr_range_array : SLV64_ARRAY_TYPE)
                                    return SLV64_ARRAY_TYPE is

variable addr_range_array : SLV64_ARRAY_TYPE(0 to ((num_peripherals * 2) -1));

begin

    for i in 0 to (num_peripherals - 1) loop
       addr_range_array(i*2) := prh_addr_range_array(i*2);
       addr_range_array((i*2)+1) := prh_addr_range_array((i*2)+1);
    end loop;

return addr_range_array;

end function get_ard_addr_range_array;
-------------------------------------------------------------------------------
-- Type Declarations
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Constant Declarations
-------------------------------------------------------------------------------
constant MAX_PERIPHERALS : integer := 4;
constant ZERO_ADDR_PAD   : std_logic_vector(0 to 64-C_S_AXI_ADDR_WIDTH-1)
                         := (others => '0');

constant PRH_ADDR_RANGE_ARRAY : SLV64_ARRAY_TYPE :=
         (
          ZERO_ADDR_PAD & C_PRH0_BASEADDR,
          ZERO_ADDR_PAD & C_PRH0_HIGHADDR,
          ZERO_ADDR_PAD & C_PRH1_BASEADDR,
          ZERO_ADDR_PAD & C_PRH1_HIGHADDR,
          ZERO_ADDR_PAD & C_PRH2_BASEADDR,
          ZERO_ADDR_PAD & C_PRH2_HIGHADDR,
          ZERO_ADDR_PAD & C_PRH3_BASEADDR,
          ZERO_ADDR_PAD & C_PRH3_HIGHADDR
          );

constant ARD_ADDR_RANGE_ARRAY : SLV64_ARRAY_TYPE :=
                                get_ard_addr_range_array(
                                                         C_NUM_PERIPHERALS,
                                                         PRH_ADDR_RANGE_ARRAY
                                                         );

constant PRH_NUM_CE_ARRAY : INTEGER_ARRAY_TYPE(0 to MAX_PERIPHERALS-1) :=
                            (others => 1);

constant ARD_NUM_CE_ARRAY : INTEGER_ARRAY_TYPE :=
                            get_ard_integer_array(
                                                  C_NUM_PERIPHERALS,
                                                  PRH_NUM_CE_ARRAY
                                                  );

constant PRH_DWIDTH_ARRAY : INTEGER_ARRAY_TYPE :=
    (
    C_PRH0_DWIDTH,
    C_PRH1_DWIDTH,
    C_PRH2_DWIDTH,
    C_PRH3_DWIDTH
    );

constant NUM_ARD : integer := (ARD_ADDR_RANGE_ARRAY'LENGTH/2);
constant NUM_CE : integer := calc_num_ce(ARD_NUM_CE_ARRAY);

constant PRH0_FIFO_OFFSET : std_logic_vector(0 to C_S_AXI_ADDR_WIDTH-1) :=
         conv_std_logic_vector(C_PRH0_FIFO_OFFSET,C_S_AXI_ADDR_WIDTH);
constant PRH1_FIFO_OFFSET : std_logic_vector(0 to C_S_AXI_ADDR_WIDTH-1) :=
         conv_std_logic_vector(C_PRH1_FIFO_OFFSET,C_S_AXI_ADDR_WIDTH);
constant PRH2_FIFO_OFFSET : std_logic_vector(0 to C_S_AXI_ADDR_WIDTH-1) :=
         conv_std_logic_vector(C_PRH2_FIFO_OFFSET,C_S_AXI_ADDR_WIDTH);
constant PRH3_FIFO_OFFSET : std_logic_vector(0 to C_S_AXI_ADDR_WIDTH-1) :=
         conv_std_logic_vector(C_PRH3_FIFO_OFFSET,C_S_AXI_ADDR_WIDTH);


constant PRH0_FIFO_ADDRESS : std_logic_vector(0 to C_S_AXI_ADDR_WIDTH-1) :=
         C_PRH0_BASEADDR or PRH0_FIFO_OFFSET;
constant PRH1_FIFO_ADDRESS : std_logic_vector(0 to C_S_AXI_ADDR_WIDTH-1) :=
         C_PRH1_BASEADDR or PRH1_FIFO_OFFSET;
constant PRH2_FIFO_ADDRESS : std_logic_vector(0 to C_S_AXI_ADDR_WIDTH-1) :=
         C_PRH2_BASEADDR or PRH2_FIFO_OFFSET;
constant PRH3_FIFO_ADDRESS : std_logic_vector(0 to C_S_AXI_ADDR_WIDTH-1) :=
         C_PRH3_BASEADDR or PRH3_FIFO_OFFSET;

constant LOCAL_CLK_PERIOD_PS : integer :=
  get_effective_val(C_PRH_CLK_SUPPORT,C_S_AXI_CLK_PERIOD_PS,C_PRH_CLK_PERIOD_PS);
 -- AXI lite parameters
constant C_S_AXI_EPC_MIN_SIZE  : std_logic_vector(31 downto 0):= X"FFFFFFFF";
constant C_USE_WSTRB              : integer := 1;
constant C_DPHASE_TIMEOUT         : integer := 0;


-------------------------------------------------------------------------------
-- Signal and Type Declarations
-------------------------------------------------------------------------------
--bus2ip signals
signal bus2ip_clk       : std_logic;
signal bus2ip_reset_active_high     : std_logic;
signal bus2ip_reset_active_low     : std_logic;

signal bus2ip_cs        : std_logic_vector(0 to (ARD_ADDR_RANGE_ARRAY'LENGTH/2)-1);
signal bus2ip_rdce      : std_logic_vector(0 to NUM_CE-1);
signal bus2ip_wrce      : std_logic_vector(0 to NUM_CE-1);
signal bus2ip_addr      : std_logic_vector(0 to C_S_AXI_ADDR_WIDTH - 1);
signal bus2ip_rnw       : std_logic;
signal bus2ip_be        : std_logic_vector(0 to (C_S_AXI_DATA_WIDTH / 8) - 1);
signal bus2ip_be_int        : std_logic_vector((C_S_AXI_DATA_WIDTH / 8) - 1 downto 0);
signal bus2ip_data      : std_logic_vector(0 to C_S_AXI_DATA_WIDTH - 1);
signal bus2ip_data_int      : std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);

-- ip2bus signals
signal ip2bus_data      : std_logic_vector(0 to C_S_AXI_DATA_WIDTH - 1);
signal ip2bus_data_int      : std_logic_vector(C_S_AXI_DATA_WIDTH - 1 downto 0);
signal ip2bus_wrack     : std_logic;
signal ip2bus_rdack     : std_logic;
signal ip2bus_error     : std_logic;
-- local clock and reset signals
signal local_clk        : std_logic;
signal local_rst        : std_logic;
-- local signals
signal dev_bus2ip_cs    : std_logic_vector(0 to C_NUM_PERIPHERALS-1);
signal dev_bus2ip_rdce  : std_logic_vector(0 to C_NUM_PERIPHERALS-1);
signal dev_bus2ip_wrce  : std_logic_vector(0 to C_NUM_PERIPHERALS-1);
signal dev_bus2ip_addr  : std_logic_vector(0 to C_PRH_MAX_AWIDTH-1);

-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------

begin

-------------------------------------------------------------------------------
-- NAME: NO_LCLK_LRST_GEN
-------------------------------------------------------------------------------
-- Description: When the C_PRH_CLK_SUPPORT is disabled use AXI clock and
--              AXI reset as the local clock and local reset respectively.
--              The syncrhonous control logic operates on local clock.
-------------------------------------------------------------------------------
NO_LCLK_LRST_GEN: if  C_PRH_CLK_SUPPORT = 0 generate
  local_clk <= bus2ip_clk;
  local_rst <= bus2ip_reset_active_high;
end generate NO_LCLK_LRST_GEN;
-------------------------------------------------------------------------------
-- NAME: LCLK_LRST_GEN
-------------------------------------------------------------------------------
-- Description: When the C_PRH_CLK_SUPPORT is enabled use external peripheral
--              clock and peripheral reset as the local clock and local reset
--              respectively. The syncrhonous control logic operates on local
--              clock.
-------------------------------------------------------------------------------
LCLK_LRST_GEN: if  C_PRH_CLK_SUPPORT /= 0 generate
  local_clk <= PRH_Clk;
  local_rst <= PRH_Rst;
end generate LCLK_LRST_GEN;
-------------------------------------------------------------------------------
----------------------
--REG_RESET_FROM_IPIF: convert active low to active hig reset to rest of
--                     the core.
----------------------
REG_RESET_FROM_IPIF: process (S_AXI_ACLK) is
begin
     if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
         bus2ip_reset_active_high <= not(bus2ip_reset_active_low);
     end if;
end process REG_RESET_FROM_IPIF;
----------------------

----------------------------------
-- INSTANTIATE AXI Lite IPIF
----------------------------------
   AXI_LITE_IPIF_I : entity axi_lite_ipif_v3_0_4.axi_lite_ipif
     generic map
      (
       C_S_AXI_ADDR_WIDTH        => C_S_AXI_ADDR_WIDTH,
       C_S_AXI_DATA_WIDTH        => C_S_AXI_DATA_WIDTH,

       C_S_AXI_MIN_SIZE          => C_S_AXI_EPC_MIN_SIZE,
       C_USE_WSTRB               => C_USE_WSTRB,
       C_DPHASE_TIMEOUT          => C_DPHASE_TIMEOUT,

       C_ARD_ADDR_RANGE_ARRAY    => ARD_ADDR_RANGE_ARRAY,
       C_ARD_NUM_CE_ARRAY        => ARD_NUM_CE_ARRAY,
       C_FAMILY                  => C_FAMILY
      )
     port map
      (
       S_AXI_ACLK                => s_axi_aclk,           -- in
       S_AXI_ARESETN             => s_axi_aresetn,        -- in

       S_AXI_AWADDR              => s_axi_awaddr,         -- in
       S_AXI_AWVALID             => s_axi_awvalid,        -- in
       S_AXI_AWREADY             => s_axi_awready,        -- out
       S_AXI_WDATA               => s_axi_wdata,          -- in
       S_AXI_WSTRB               => s_axi_wstrb,          -- in
       S_AXI_WVALID              => s_axi_wvalid,         -- in
       S_AXI_WREADY              => s_axi_wready,         -- out
       S_AXI_BRESP               => s_axi_bresp,          -- out
       S_AXI_BVALID              => s_axi_bvalid,         -- out
       S_AXI_BREADY              => s_axi_bready,         -- in

       S_AXI_ARADDR              => s_axi_araddr,         -- in
       S_AXI_ARVALID             => s_axi_arvalid,        -- in
       S_AXI_ARREADY             => s_axi_arready,        -- out
       S_AXI_RDATA               => s_axi_rdata,          -- out
       S_AXI_RRESP               => s_axi_rresp,          -- out
       S_AXI_RVALID              => s_axi_rvalid,         -- out
       S_AXI_RREADY              => s_axi_rready,         -- in

 -- IP Interconnect (IPIC) port signals
       Bus2IP_Clk                => bus2ip_clk,           -- out
       Bus2IP_Resetn             => bus2ip_reset_active_low,     -- out

       Bus2IP_Addr               => bus2ip_addr,          -- out
       Bus2IP_RNW                => bus2ip_rnw,                 -- out
       Bus2IP_BE                 => bus2ip_be_int,            -- out
       Bus2IP_CS                 => bus2IP_CS,                -- out
       Bus2IP_RdCE               => bus2ip_rdce,          -- out
       Bus2IP_WrCE               => bus2ip_wrce,          -- out
       Bus2IP_Data               => bus2ip_data_int,          -- out
--       Bus2IP_Data               => bus2ip_data,          -- out

       IP2Bus_Data               => ip2bus_data_int,          -- in
       IP2Bus_WrAck              => ip2bus_wrack,         -- in
       IP2Bus_RdAck              => ip2bus_rdack,         -- in
       IP2Bus_Error              => ip2bus_error          -- in

      );

EPC_CORE_I : entity axi_epc_v2_0_23.epc_core
  generic map
  (
      C_SPLB_CLK_PERIOD_PS        =>  C_S_AXI_CLK_PERIOD_PS,
      LOCAL_CLK_PERIOD_PS          =>  LOCAL_CLK_PERIOD_PS,
            ----------------       -------------------------
      C_SPLB_AWIDTH           =>  C_S_AXI_ADDR_WIDTH,
      C_SPLB_DWIDTH           =>  C_S_AXI_DATA_WIDTH ,
      C_SPLB_NATIVE_DWIDTH           =>  C_S_AXI_DATA_WIDTH ,
      C_FAMILY                     =>  C_FAMILY,
            ----------------       -------------------------
      C_NUM_PERIPHERALS            =>  C_NUM_PERIPHERALS,
      C_PRH_MAX_AWIDTH             =>  C_PRH_MAX_AWIDTH,
      C_PRH_MAX_DWIDTH             =>  C_PRH_MAX_DWIDTH,
      C_PRH_MAX_ADWIDTH            =>  C_PRH_MAX_ADWIDTH,
      C_PRH_CLK_SUPPORT            =>  C_PRH_CLK_SUPPORT,
      C_PRH_BURST_SUPPORT          =>  C_PRH_BURST_SUPPORT,
            ----------------       -------------------------
      C_PRH0_FIFO_ACCESS           =>  C_PRH0_FIFO_ACCESS,
      C_PRH0_AWIDTH                =>  C_PRH0_AWIDTH,
      C_PRH0_DWIDTH                =>  C_PRH0_DWIDTH,
      C_PRH0_DWIDTH_MATCH          =>  C_PRH0_DWIDTH_MATCH,
      C_PRH0_SYNC                  =>  C_PRH0_SYNC,
      C_PRH0_BUS_MULTIPLEX         =>  C_PRH0_BUS_MULTIPLEX,
      C_PRH0_ADDR_TSU              =>  C_PRH0_ADDR_TSU,
      C_PRH0_ADDR_TH               =>  C_PRH0_ADDR_TH,
      C_PRH0_ADS_WIDTH             =>  C_PRH0_ADS_WIDTH,
      C_PRH0_CSN_TSU               =>  C_PRH0_CSN_TSU,
      C_PRH0_CSN_TH                =>  C_PRH0_CSN_TH,
      C_PRH0_WRN_WIDTH             =>  C_PRH0_WRN_WIDTH,
      C_PRH0_WR_CYCLE              =>  C_PRH0_WR_CYCLE,
      C_PRH0_DATA_TSU              =>  C_PRH0_DATA_TSU,
      C_PRH0_DATA_TH               =>  C_PRH0_DATA_TH,
      C_PRH0_RDN_WIDTH             =>  C_PRH0_RDN_WIDTH,
      C_PRH0_RD_CYCLE              =>  C_PRH0_RD_CYCLE,
      C_PRH0_DATA_TOUT             =>  C_PRH0_DATA_TOUT,
      C_PRH0_DATA_TINV             =>  C_PRH0_DATA_TINV,
      C_PRH0_RDY_TOUT              =>  C_PRH0_RDY_TOUT,
      C_PRH0_RDY_WIDTH             =>  C_PRH0_RDY_WIDTH,
            ----------------       -------------------------
      C_PRH1_FIFO_ACCESS           =>  C_PRH1_FIFO_ACCESS,
      C_PRH1_AWIDTH                =>  C_PRH1_AWIDTH,
      C_PRH1_DWIDTH                =>  C_PRH1_DWIDTH,
      C_PRH1_DWIDTH_MATCH          =>  C_PRH1_DWIDTH_MATCH,
      C_PRH1_SYNC                  =>  C_PRH1_SYNC,
      C_PRH1_BUS_MULTIPLEX         =>  C_PRH1_BUS_MULTIPLEX,
      C_PRH1_ADDR_TSU              =>  C_PRH1_ADDR_TSU,
      C_PRH1_ADDR_TH               =>  C_PRH1_ADDR_TH,
      C_PRH1_ADS_WIDTH             =>  C_PRH1_ADS_WIDTH,
      C_PRH1_CSN_TSU               =>  C_PRH1_CSN_TSU,
      C_PRH1_CSN_TH                =>  C_PRH1_CSN_TH,
      C_PRH1_WRN_WIDTH             =>  C_PRH1_WRN_WIDTH,
      C_PRH1_WR_CYCLE              =>  C_PRH1_WR_CYCLE,
      C_PRH1_DATA_TSU              =>  C_PRH1_DATA_TSU,
      C_PRH1_DATA_TH               =>  C_PRH1_DATA_TH,
      C_PRH1_RDN_WIDTH             =>  C_PRH1_RDN_WIDTH,
      C_PRH1_RD_CYCLE              =>  C_PRH1_RD_CYCLE,
      C_PRH1_DATA_TOUT             =>  C_PRH1_DATA_TOUT,
      C_PRH1_DATA_TINV             =>  C_PRH1_DATA_TINV,
      C_PRH1_RDY_TOUT              =>  C_PRH1_RDY_TOUT,
      C_PRH1_RDY_WIDTH             =>  C_PRH1_RDY_WIDTH,
            ----------------       -------------------------
      C_PRH2_FIFO_ACCESS           =>  C_PRH2_FIFO_ACCESS,
      C_PRH2_AWIDTH                =>  C_PRH2_AWIDTH,
      C_PRH2_DWIDTH                =>  C_PRH2_DWIDTH,
      C_PRH2_DWIDTH_MATCH          =>  C_PRH2_DWIDTH_MATCH,
      C_PRH2_SYNC                  =>  C_PRH2_SYNC,
      C_PRH2_BUS_MULTIPLEX         =>  C_PRH2_BUS_MULTIPLEX,
      C_PRH2_ADDR_TSU              =>  C_PRH2_ADDR_TSU,
      C_PRH2_ADDR_TH               =>  C_PRH2_ADDR_TH,
      C_PRH2_ADS_WIDTH             =>  C_PRH2_ADS_WIDTH,
      C_PRH2_CSN_TSU               =>  C_PRH2_CSN_TSU,
      C_PRH2_CSN_TH                =>  C_PRH2_CSN_TH,
      C_PRH2_WRN_WIDTH             =>  C_PRH2_WRN_WIDTH,
      C_PRH2_WR_CYCLE              =>  C_PRH2_WR_CYCLE,
      C_PRH2_DATA_TSU              =>  C_PRH2_DATA_TSU,
      C_PRH2_DATA_TH               =>  C_PRH2_DATA_TH,
      C_PRH2_RDN_WIDTH             =>  C_PRH2_RDN_WIDTH,
      C_PRH2_RD_CYCLE              =>  C_PRH2_RD_CYCLE,
      C_PRH2_DATA_TOUT             =>  C_PRH2_DATA_TOUT,
      C_PRH2_DATA_TINV             =>  C_PRH2_DATA_TINV,
      C_PRH2_RDY_TOUT              =>  C_PRH2_RDY_TOUT,
      C_PRH2_RDY_WIDTH             =>  C_PRH2_RDY_WIDTH,
            ----------------       -------------------------
      C_PRH3_FIFO_ACCESS           =>  C_PRH3_FIFO_ACCESS,
      C_PRH3_AWIDTH                =>  C_PRH3_AWIDTH,
      C_PRH3_DWIDTH                =>  C_PRH3_DWIDTH,
      C_PRH3_DWIDTH_MATCH          =>  C_PRH3_DWIDTH_MATCH,
      C_PRH3_SYNC                  =>  C_PRH3_SYNC,
      C_PRH3_BUS_MULTIPLEX         =>  C_PRH3_BUS_MULTIPLEX,
      C_PRH3_ADDR_TSU              =>  C_PRH3_ADDR_TSU,
      C_PRH3_ADDR_TH               =>  C_PRH3_ADDR_TH,
      C_PRH3_ADS_WIDTH             =>  C_PRH3_ADS_WIDTH,
      C_PRH3_CSN_TSU               =>  C_PRH3_CSN_TSU,
      C_PRH3_CSN_TH                =>  C_PRH3_CSN_TH,
      C_PRH3_WRN_WIDTH             =>  C_PRH3_WRN_WIDTH,
      C_PRH3_WR_CYCLE              =>  C_PRH3_WR_CYCLE,
      C_PRH3_DATA_TSU              =>  C_PRH3_DATA_TSU,
      C_PRH3_DATA_TH               =>  C_PRH3_DATA_TH,
      C_PRH3_RDN_WIDTH             =>  C_PRH3_RDN_WIDTH,
      C_PRH3_RD_CYCLE              =>  C_PRH3_RD_CYCLE,
      C_PRH3_DATA_TOUT             =>  C_PRH3_DATA_TOUT,
      C_PRH3_DATA_TINV             =>  C_PRH3_DATA_TINV,
      C_PRH3_RDY_TOUT              =>  C_PRH3_RDY_TOUT,
      C_PRH3_RDY_WIDTH             =>  C_PRH3_RDY_WIDTH,
            ----------------       -------------------------
      MAX_PERIPHERALS              =>  MAX_PERIPHERALS,
      PRH0_FIFO_ADDRESS            =>  PRH0_FIFO_ADDRESS,
      PRH1_FIFO_ADDRESS            =>  PRH1_FIFO_ADDRESS,
      PRH2_FIFO_ADDRESS            =>  PRH2_FIFO_ADDRESS,
      PRH3_FIFO_ADDRESS            =>  PRH3_FIFO_ADDRESS
            ----------------       -------------------------
  )

  port map (
      -- IP Interconnect (IPIC) port signals ----------
      Bus2IP_Clk                  => bus2ip_clk,
      Bus2IP_Rst                  => bus2ip_reset_active_high,
      Bus2IP_CS                   => dev_bus2ip_cs,
      Bus2IP_RdCE                 => dev_bus2ip_rdce,
      Bus2IP_WrCE                 => dev_bus2ip_wrce,
      Bus2IP_Addr                 => dev_bus2ip_addr,
      Bus2IP_RNW                  => bus2ip_rnw,
      Bus2IP_BE                   => bus2ip_be,
      Bus2IP_Data                 => bus2ip_data,
      -- ip2bus signals ---------------------------------------------------
      IP2Bus_Data                 => ip2bus_data,
      IP2Bus_WrAck                => ip2bus_wrack,
      IP2Bus_RdAck                => ip2bus_rdack,
      IP2Bus_Error                => ip2bus_error,
            ----------------       -------------------------
      Local_Clk                   => local_clk,
      Local_Rst                   => local_rst,
      PRH_CS_n                    => prh_cs_n,
      PRH_Addr                    => prh_addr,
      PRH_ADS                     => prh_ads,
      PRH_BE                      => prh_be,
      PRH_RNW                     => prh_rnw,
      PRH_Rd_n                    => prh_rd_n,
      PRH_Wr_n                    => prh_wr_n,
      PRH_Burst                   => prh_burst,
      PRH_Rdy                     => prh_rdy,
      PRH_Data_I                  => prh_data_i,
      PRH_Data_O                  => prh_data_o,
      PRH_Data_T                  => prh_data_t
);


dev_bus2ip_cs <= bus2ip_cs((NUM_ARD - C_NUM_PERIPHERALS) to (NUM_ARD -1));

-- Fix the number of CEs per device as one
dev_bus2ip_rdce <= bus2ip_rdce((NUM_CE - C_NUM_PERIPHERALS) to (NUM_CE -1));
dev_bus2ip_wrce <= bus2ip_wrce((NUM_CE - C_NUM_PERIPHERALS) to (NUM_CE -1));

dev_bus2ip_addr <= bus2ip_addr(C_S_AXI_ADDR_WIDTH-C_PRH_MAX_AWIDTH to C_S_AXI_ADDR_WIDTH-1);



-- Little endian to bigendian conversion because the EPC core is in bigendian
PRH_DWIDTH_PROCESS: process (dev_bus2ip_cs, ip2bus_data, bus2ip_data_int, bus2ip_be_int) is
begin
  bus2ip_data <= (others => '0');
  ip2bus_data_int <= (others => '0');
  bus2ip_be <= (others => '0');
  for i in 0 to C_NUM_PERIPHERALS-1 loop
    if (dev_bus2ip_cs(i) = '1') then
         case PRH_DWIDTH_ARRAY(i) is
           when 8  =>
              bus2ip_data(0 to 7) <= bus2ip_data_int(7 downto 0);
              bus2ip_data(8 to 15) <= bus2ip_data_int(15 downto 8);
              bus2ip_data(16 to 23) <= bus2ip_data_int(23 downto 16);
              bus2ip_data(24 to 31) <= bus2ip_data_int(31 downto 24);
             
              ip2bus_data_int(7 downto 0) <= ip2bus_data(0 to 7);
              ip2bus_data_int(15 downto 8) <= ip2bus_data(8 to 15);
              ip2bus_data_int(23 downto 16) <= ip2bus_data(16 to 23);
              ip2bus_data_int(31 downto 24) <= ip2bus_data(24 to 31);

              bus2ip_be(0) <= bus2ip_be_int(0);
              bus2ip_be(1) <= bus2ip_be_int(1);
              bus2ip_be(2) <= bus2ip_be_int(2);
              bus2ip_be(3) <= bus2ip_be_int(3);
           when 16 =>
              bus2ip_data(0 to 15) <= bus2ip_data_int(15 downto 0);
              bus2ip_data(16 to 31) <= bus2ip_data_int(31 downto 16);

              ip2bus_data_int(31 downto 16) <= ip2bus_data(16 to 31);
              ip2bus_data_int(15 downto 0) <= ip2bus_data(0 to 15);
              
              bus2ip_be(0 to 1) <= bus2ip_be_int(1 downto 0);
              bus2ip_be(2 to 3) <= bus2ip_be_int(3 downto 2);
           when 32 =>
              bus2ip_data <= bus2ip_data_int;
 
              ip2bus_data_int <= ip2bus_data;
              bus2ip_be <= bus2ip_be_int;
         -- coverage off
           when others =>
              bus2ip_data <= bus2ip_data_int;
               
              ip2bus_data_int <= ip2bus_data;
              bus2ip_be <= bus2ip_be_int;
        -- coverage on
        end case;

    end if;
  end loop;
end process PRH_DWIDTH_PROCESS;



end architecture imp;
--------------------------------end of file------------------------------------


