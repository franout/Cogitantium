-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : xd_adapter_pkg.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2012-11-05
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE IEEE.std_logic_misc.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


package xd_adapter_pkg is
  type int_vector is array (natural range <>) of integer;

  CONSTANT TFF : time := 100 ps;
  constant SW_LENGTH_WIDTH : integer := 16;

  constant AP_ARG_MEM_MAP_TYPE : integer := 0;
  constant AP_ARG_STREAM_TYPE  : integer := 1;

  constant FORMAT_TYPE_NONE               : integer := 0;
  constant FORMAT_TYPE_RESHAPE_BLOCK      : integer := 1;
  constant FORMAT_TYPE_RESHAPE_CYCLIC     : integer := 2;
  constant FORMAT_TYPE_RESHAPE_COMPLETE   : integer := 3;
  constant FORMAT_TYPE_PARTITION_BLOCK    : integer := 4;
  constant FORMAT_TYPE_PARTITION_CYCLIC   : integer := 5;
  constant FORMAT_TYPE_PARTITION_COMPLETE : integer := 6;

  function and_reduce(A : std_logic_vector) return std_logic;
  function or_reduce(A  : std_logic_vector) return std_logic;

  function log2(x         : natural) return integer;
  function max(A          : integer; B : integer) return integer;
  function min_size(A     : integer; B : integer) return integer;
  function div_round_up(t : integer; Tclk : integer) return integer;

  function int2lv (A     : integer; width : integer          := 32) return std_logic_vector;
  function lv2int(A      : std_logic_vector) return integer;
  function int2l (A      : integer) return std_logic;
  function ext_lv (value : std_logic_vector; width : natural := 32) return std_logic_vector;

  function get_int_element(A : std_logic_vector; index : natural) return integer;
  function get_int_vector(A  : std_logic_vector; x : natural; y : natural) return int_vector;

  -- These next two functions are used to calculate the LSB and MSB for
  -- "compacted" buses, e.g., output scalar data bus
  function get_compact_LSB(A : std_logic_vector; index : natural) return integer;
  function get_compact_MSB(A : std_logic_vector; index : natural) return integer;
  function get_compact_LSB_IO(A : std_logic_vector; index : natural) return integer;
  function get_compact_MSB_IO(A : std_logic_vector; index : natural) return integer;

  function calc_fifo_depth(x : integer) return integer;

  function bin2gray(bin      : std_logic_vector) return std_logic_vector;
  function bin2gray(bin      : integer; N : natural) return std_logic_vector;
  function gray2bin(gray     : std_logic_vector) return std_logic_vector;
  function gray_inc(gray     : std_logic_vector; k : integer := 1) return std_logic_vector;
  function calc_gray_width(N : integer) return integer;

     FUNCTION bin2gray_fifo (
      indata : std_logic_vector; 
      length : integer)
    RETURN std_logic_vector;
  
    FUNCTION gray2bin_fifo (
      indata : std_logic_vector; 
      length : integer)
    RETURN std_logic_vector;

        FUNCTION if_then_else (
      condition : integer; 
      true_case : integer; 
      false_case : integer)
    RETURN integer;

    
    FUNCTION if_then_else (
      condition : boolean; 
      true_case : integer; 
      false_case : integer)
    RETURN integer;




end xd_adapter_pkg;


package body xd_adapter_pkg is

  function and_reduce (A : std_logic_vector) return std_logic is
    variable aux : std_logic := '1';
  begin
    for i in A'range loop
      aux := aux and A(i);
    end loop;
    return aux;
  end function and_reduce;

  function or_reduce (A : std_logic_vector) return std_logic is
    variable aux : std_logic := '0';
  begin
    for i in A'range loop
      aux := aux or A(i);
    end loop;
    return aux;
  end function or_reduce;

  function log2(x : natural) return integer is
    variable i : integer := 0;
  begin
    if (x = 0) then
      return 0;
    else
      while (x > (2**i)) loop
        i := i+1;
      end loop;
      return i;
    end if;
  end function log2;

  function max(A : integer; B : integer) return integer is
  begin
    if(A > B) then
      return A;
    else
      return B;
    end if;
  end function max;

  function min_size(A : integer; B : integer) return integer is
  begin
    if(A < B) then
      return A;
    else
      return B;
    end if;
  end function min_size;

  function div_round_up(t : integer; Tclk : integer) return integer is
  begin
    -- integer division give the integer part of the results (no rounding). To
    -- obtain round up (excess), add to dividend, the divisor minus one.
    return (t + Tclk-1) / Tclk;
  end function div_round_up;

  function int2lv (A : integer; width : integer := 32) return std_logic_vector is
    variable value : std_logic_vector(width-1 downto 0);
  begin
    value := std_logic_vector(to_signed(A, width));
    return value;
  end function int2lv;

  function lv2int(A : std_logic_vector) return integer is
    variable value : integer;
  begin
    value := to_integer(signed(A));
    return value;
  end function lv2int;

  function int2l (A : integer) return std_logic is
    variable value : std_logic;
  begin
    if(A = 0) then
      value := '0';
    else
      value := '1';
    end if;
    return value;
  end function int2l;

     ------------------------------------------------------------------------------
    -- This function is used to implement an IF..THEN when such a statement is not
    --  allowed. 
    ------------------------------------------------------------------------------
    FUNCTION if_then_else (
      condition : boolean; 
      true_case : integer; 
      false_case : integer) 
    RETURN integer IS
      VARIABLE retval : integer := 0;
    BEGIN
      IF NOT condition THEN
        retval:=false_case;
      ELSE
        retval:=true_case;
      END IF;
      RETURN retval;
    END if_then_else;


      FUNCTION if_then_else (
      condition : integer; 
      true_case : integer; 
      false_case : integer) 
    RETURN integer IS
      VARIABLE retval : integer := 0;
    BEGIN
      IF condition=0 THEN
        retval:=false_case;
      ELSE
        retval:=true_case;
      END IF;
      RETURN retval;
    END if_then_else;




  function ext_lv (value : std_logic_vector; width : natural := 32)
    return std_logic_vector is
    constant N   : integer := value'length;
    variable ret : std_logic_vector(width-1 downto 0);
  begin
    ret               := (others => '0');
    ret(N-1 downto 0) := value;
    return ret;
  end function ext_lv;

  function get_int_element(A : std_logic_vector; index : natural)
    return integer is
    constant N       : integer := A'length;
    alias A_dw       : std_logic_vector(N-1 downto 0) is A;
    variable element : std_logic_vector(31 downto 0);
  begin
    element := A_dw(32*(index+1)-1 downto 32*index);
    return to_integer(signed(element));
  end function get_int_element;

  function get_int_vector(A : std_logic_vector; x : natural; y : natural)
    return int_vector is
    constant N       : integer := A'length;
    alias A_dw       : std_logic_vector(N-1 downto 0) is A;
    variable element : std_logic_vector(31 downto 0);

    constant first      : integer                           := min_size(x, y);
    constant last       : integer                           := max(x, y);
    constant N_elements : integer                           := last - first + 1;
    variable ret_value  : int_vector(N_elements-1 downto 0) := (others => 0);
  begin
    for i in first to last loop
      ret_value(i-first) := get_int_element(A_dw, i);
    end loop;
    return ret_value;
  end function get_int_vector;

  function get_compact_LSB_IO(A : std_logic_vector; index : natural)
    return integer is
    constant N       : integer := A'length;
    alias A_dw       : std_logic_vector(N-1 downto 0) is A;
    variable element : std_logic_vector(31 downto 0);
    variable acc_1     : integer := 256;
  begin
    for k in 8 to index-1 loop
      element := A_dw(32*(k+1)-1 downto 32*k);
      acc_1     := acc_1 + to_integer(signed(element));
    end loop;
    return acc_1;
  end function get_compact_LSB_IO;
  function get_compact_LSB(A : std_logic_vector; index : natural)
    return integer is
    constant N       : integer := A'length;
    alias A_dw       : std_logic_vector(N-1 downto 0) is A;
    variable element : std_logic_vector(31 downto 0);
    variable acc     : integer := 0;
  begin
    for k in 0 to index-1 loop
      element := A_dw(32*(k+1)-1 downto 32*k);
      acc     := acc + to_integer(signed(element));
    end loop;
    return acc;
  end function get_compact_LSB;

  function get_compact_MSB_IO(A : std_logic_vector; index : natural)
    return integer is
    constant N       : integer := A'length;
    alias A_dw       : std_logic_vector(N-1 downto 0) is A;
    variable element : std_logic_vector(31 downto 0);
    variable acc_1     : integer := 256;
  begin
    for k in 8 to index loop
      element := A_dw(32*(k+1)-1 downto 32*k);
      acc_1     := acc_1 + to_integer(signed(element));
    end loop;
    return acc_1-1;
  end function get_compact_MSB_IO;

  function get_compact_MSB(A : std_logic_vector; index : natural)
    return integer is
    constant N       : integer := A'length;
    alias A_dw       : std_logic_vector(N-1 downto 0) is A;
    variable element : std_logic_vector(31 downto 0);
    variable acc     : integer := 0;
  begin
    for k in 0 to index loop
      element := A_dw(32*(k+1)-1 downto 32*k);
      acc     := acc + to_integer(signed(element));
    end loop;
    return acc-1;
  end function get_compact_MSB;

  ---------------------------------------------------------------------
  -- calculate the power inmediately above or equal to the provided depth and
  -- substract one
  function calc_fifo_depth(x : integer) return integer is
    variable i : integer := 0;
  begin
    if (x = 0) then
      return 0;
    else
      while (x > (2**i)) loop
        i := i+1;
      end loop;
      return (2**i)-1;
    end if;
  end function calc_fifo_depth;

  -- Functions to convert from gray code to bin codes and viceversa
  function bin2gray(bin : std_logic_vector) return std_logic_vector is
    constant N    : integer := (bin'length);
    alias bin_dw  : std_logic_vector(N-1 downto 0) is bin;
    variable gray : std_logic_vector(N-1 downto 0);
  begin
    gray(N-1) := bin_dw(N-1);
    for i in 0 to N-2 loop
      gray(i) := bin_dw(i) xor bin_dw(i+1);
    end loop;
    return gray;
  end function bin2gray;

  function bin2gray(bin : integer; N : natural) return std_logic_vector is
    variable gray : std_logic_vector(N-1 downto 0);
  begin
    gray := bin2gray(std_logic_vector(to_signed(bin, N)));
    return gray;
  end function bin2gray;

  function gray2bin(gray : std_logic_vector) return std_logic_vector is
    constant N    : integer := gray'length;
    alias gray_dw : std_logic_vector(N-1 downto 0) is gray;
    variable bin  : std_logic_vector(N-1 downto 0);
  begin
    bin(N-1) := gray_dw(N-1);
    for i in N-2 downto 0 loop
      bin(i) := bin(i+1) xor gray(i);
    end loop;
    return bin;
  end function gray2bin;

      -----------------------------------------------------------------------------
    -- FUNCTION : bin2gray
    -----------------------------------------------------------------------------
    -- This function receives a binary value, and returns the associated 
    -- graycoded value. 
  
    FUNCTION bin2gray_fifo (
      indata : std_logic_vector; 
      length : integer)
    RETURN std_logic_vector IS
      VARIABLE tmp_value : std_logic_vector(length-1 DOWNTO 0);
    BEGIN
      tmp_value(length-1) := indata(length-1);
  
      gray_loop : FOR I IN length-2 DOWNTO 0 LOOP
        tmp_value(I) := indata(I) XOR indata(I+1);
      END LOOP;
  
      RETURN tmp_value;
    END bin2gray_fifo;
  
    -----------------------------------------------------------------------------
    -- FUNCTION : gray2bin
    -----------------------------------------------------------------------------
    -- This function receives a gray-coded value, and returns the associated 
    -- binary value.
  
    FUNCTION gray2bin_fifo (
      indata : std_logic_vector; 
      length : integer)
    RETURN std_logic_vector IS
      VARIABLE tmp_value : std_logic_vector(length-1 DOWNTO 0);
    BEGIN
      tmp_value(length-1) := indata(length-1);
  
      gray_loop : FOR I IN length-2 DOWNTO 0 LOOP
        tmp_value(I) := XOR_REDUCE(indata(length-1 DOWNTO I));
      END LOOP;
  
      RETURN tmp_value;
    END gray2bin_fifo;


  function gray_inc(gray : std_logic_vector; k : integer := 1) return std_logic_vector is
    constant N   : integer := gray'length;
    variable bin : unsigned(N-1 downto 0);
  begin
    bin := unsigned(gray2bin(gray));
    bin := bin + k;
    return bin2gray(std_logic_vector(bin));
  end function gray_inc;

  function calc_gray_width(N : integer) return integer is
    variable bin_width : integer;
  begin
    bin_width := log2(N);
    -- If number of elements is a power of 2, we need an additinal bit,
    -- otherwise when full condition is asserted both gray pointer would be
    -- equal. this is the same condition that shows-up for the empty condition.
    if(N = 2**bin_width) then
      bin_width := bin_width + 1;
    end if;
    return bin_width;
  end function calc_gray_width;

end xd_adapter_pkg;



-------------------------------------------------------------------------------
-- $Id: synchronizer_ff.vhd,v 1.1 2011/06/02 09:44:03 robertb Exp $ 
-- Title      : Binary Counter Module for Write Logic
-- Project    : FIFO Generator
-------------------------------------------------------------------------------
-- (c) Copyright 2006 - 2009 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- File       : synchronizer_ff.vhd
-- Author     : Xilinx
-------------------------------------------------------------------------------
-- Structure:
--  synchronizer_ff.vhd
--
-------------------------------------------------------------------------------
-- Description:
-- A basic Flip Flop with asynchronous reset
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;

ENTITY synchronizer_ff IS
  GENERIC (
    C_HAS_RST : integer := 0;
    C_WIDTH   : integer := 0
  	);
  PORT ( 
    RST       : IN  std_logic := '0' ;
    CLK       : IN  std_logic := '0' ;
    D         : IN  std_logic_vector(C_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
    Q         : OUT std_logic_vector(C_WIDTH-1 DOWNTO 0) := (OTHERS => '0')
    );
END synchronizer_ff;

ARCHITECTURE xilinx OF synchronizer_ff IS

  ATTRIBUTE DowngradeIPIdentifiedWarnings: STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF xilinx : ARCHITECTURE IS "yes";

  signal Q_reg : std_logic_vector(C_WIDTH-1 downto 0) := (OTHERS => '0');
  ATTRIBUTE async_reg           : STRING;
  ATTRIBUTE async_reg OF Q_reg  : SIGNAL IS "true";
  ATTRIBUTE msgon                        : STRING;
  ATTRIBUTE msgon OF Q_reg    : SIGNAL IS "true";
 
--  attribute dont_touch : string;
--  attribute dont_touch of Q_reg  : signal is "true";
--  ATTRIBUTE KEEP_HIERARCHY : STRING;
--  ATTRIBUTE KEEP_HIERARCHY of xilinx : ARCHITECTURE IS "yes";
BEGIN
  PROCESS (CLK, RST)
  BEGIN  
    IF (RST = '1' AND C_HAS_RST = 1) THEN
      Q_reg <= (OTHERS => '0');
--      Q <= (OTHERS => '0');
    ELSIF CLK'EVENT AND CLK = '1' THEN  
      Q_reg <= D AFTER TFF;
--      Q <= D AFTER TFF;
    END IF;
  END PROCESS;
  Q <= Q_reg;
END xilinx;


-------------------------------------------------------------------------------
-- $Id: clk_x_pntrs.vhd,v 1.1 2011/06/02 09:43:59 robertb Exp $ 
-- Title      : Clock Crossing Logic 
-- Project    : FIFO Generator
-------------------------------------------------------------------------------
-- (c) Copyright 2006 - 2009 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- File       : clk_x_pntrs.vhd
-- Author     : Xilinx
-------------------------------------------------------------------------------
--
-- Description: This module is used only for Asynchronous FIFOs to pass the 
--              read pointer from RD_CLK domain to WR_CLK domain and the
--              write pointer from WR_CLK domain to RD_CLK domain. 
--              In the process of passing the pointers from one clock domain to 
--              another, registers might fall into meta-stable state. In order 
--              to avoid this undesired situation, two-register-stage 
--              synchronization logic is implemented after data is passed into 
--              the different clock domain.
--
--              I. Functionality:
--              
--              1. Input binary write pointer is converted into gray code. 
--              
--              2. The gray encoded write pointer is registered in the WR_CLK 
--                 domain. The content of these flops are guaranteed to contain
--                 either the current value or the next value in the sequence,
--                 since only one bit can change at a time. Therefore, using 
--                 gray code guarantees valid pointer values across clock 
--                 domains. For implementing these gray counters, it is more 
--                 efficient to implement a binary counter and then XOR the 
--                 outputs to create a gray code output than to build a gray 
--                 counter directly.
--
--              3. It is then registered twice in the RD_CLK domain. As the 
--                 Gray-encoded counter values are passed across cross domains
--                 from the WR_CLK domain to the RD_CLK domain, or vice-versa, 
--                 it is possible that the counter value may be in a state of 
--                 transition at the time that the flops latch in their data. 
--                 Since the counter value is gray-coded, only one bit will be 
--                 transitioning at any given time, and therefore it is expected 
---                that only one flop is likely to be metastable. Under these 
--                 circumstances, it is acceptable for the metastable flop to 
--                 latch in either the old or the new value.
--
--              4. In the RD_CLK domain, it is converted back to binary and 
--                 registered.
--
--              5. Steps 1-4 are repeated for the read pointer (passed from
--                 RD_CLK domain to WR_CLK domain)
--
--
--              II. Module I/O
--              Inputs: WR_CLK, RD_CLK, WR_RST, RD_RST, 
--                      RD_PNTR (C_RD_PNTR_WIDTH-1:0), 
--                      WR_PNTR (C_WR_PNTR_WIDTH-1:0)
--
--              Outputs: RD_PNTR_WR (C_RD_PNTR_WIDTH-1:0), 
--                       WR_PNTR_RW (C_WR_PNTR_WIDTH-1:0) 
--
-------------------------------------------------------------------------------
------------------------------------------------------------------------------- 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;

ENTITY clk_x_pntrs IS
  GENERIC (
    ---------------------------------------------------------------------------
    -- Generic Declarations (alphabetical)
    ---------------------------------------------------------------------------
    C_HAS_RST            : integer := 0;
    C_RD_PNTR_WIDTH      : integer := 4;
    C_WR_PNTR_WIDTH      : integer := 4;
    C_MSGON_VAL          : integer := 1;
    C_SYNCHRONIZER_STAGE : integer := 2
    );
  
  PORT(
    ---------------------------------------------------------------------------
    -- Input and Output Declarations
    ---------------------------------------------------------------------------

    -- Inputs
    WR_CLK       : IN  std_logic := '0';
    RD_CLK       : IN  std_logic := '0';

    WR_RST       : IN  std_logic := '0';
    RD_RST       : IN  std_logic := '0';

    WR_PNTR      : IN  std_logic_vector (C_WR_PNTR_WIDTH-1 DOWNTO 0) 
                       := (OTHERS => '0');
    RD_PNTR      : IN  std_logic_vector (C_RD_PNTR_WIDTH-1 DOWNTO 0) 
                       := (OTHERS => '0');

    -- Outputs
    WR_PNTR_RD   : OUT std_logic_vector (C_WR_PNTR_WIDTH-1 DOWNTO 0)
                       := (OTHERS => '0');
    RD_PNTR_WR   : OUT std_logic_vector (C_RD_PNTR_WIDTH-1 DOWNTO 0)
                       := (OTHERS => '0')   
  );

END clk_x_pntrs;

-------------------------------------------------------------------------------
-- Port Definitions:
-------------------------------------------------------------------------------
-- WR_PNTR_RD  : Write Pointer synchronized to RD_CLK
-- RD_PNTR_WR  : Read Pointer synchronized to WR_CLK
-------------------------------------------------------------------------------

ARCHITECTURE xilinx OF clk_x_pntrs IS

  ATTRIBUTE DowngradeIPIdentifiedWarnings: STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF xilinx : ARCHITECTURE IS "yes";

  -----------------------------------------------------------------------------
  -- Internal Constants
  -----------------------------------------------------------------------------
  CONSTANT zeros_wr : std_logic_vector(C_WR_PNTR_WIDTH-1 DOWNTO 0) 
                      := (OTHERS => '0');
  CONSTANT zeros_rd : std_logic_vector(C_RD_PNTR_WIDTH-1 DOWNTO 0) 
                      := (OTHERS => '0');
  --CONSTANT MSGONATTR : string := int_2_strbool(C_MSGON_VAL);

  -----------------------------------------------------------------------------
  -- Internal Signals
  -----------------------------------------------------------------------------
  -- The following 6 signals are initialized to 0. Because they are gray coded 
  -- signals, the initial value "0" is actually the gray code for binary "0".
  -- If they have to be initialized to a non-zero value, make sure to use the 
  -- bin2gray function.
  SIGNAL wr_pntr_gc : std_logic_vector(C_WR_PNTR_WIDTH-1 DOWNTO 0) := zeros_wr;
  SIGNAL rd_pntr_gc : std_logic_vector(C_RD_PNTR_WIDTH-1 DOWNTO 0) := zeros_rd; 

--  SIGNAL wr_pntr_gc_asreg    : std_logic_vector(C_WR_PNTR_WIDTH-1 DOWNTO 0) := zeros_wr;
--  SIGNAL rd_pntr_gc_asreg    : std_logic_vector(C_RD_PNTR_WIDTH-1 DOWNTO 0) := zeros_rd;

  SIGNAL wr_pntr_gc_asreg_last : std_logic_vector(C_WR_PNTR_WIDTH-1 DOWNTO 0) := zeros_wr;
  SIGNAL rd_pntr_gc_asreg_last : std_logic_vector(C_RD_PNTR_WIDTH-1 DOWNTO 0) := zeros_rd;

  SIGNAL wr_pntr_bin : std_logic_vector(C_WR_PNTR_WIDTH-1 DOWNTO 0) := zeros_wr; 
  SIGNAL rd_pntr_bin : std_logic_vector(C_RD_PNTR_WIDTH-1 DOWNTO 0) := zeros_rd;
  
  -- Defined to connect data output of one FIFO to data input of another 
  TYPE wr_sync_array IS ARRAY (0 TO C_SYNCHRONIZER_STAGE) OF std_logic_vector(C_WR_PNTR_WIDTH-1 DOWNTO 0);
  TYPE rd_sync_array IS ARRAY (0 TO C_SYNCHRONIZER_STAGE) OF std_logic_vector(C_RD_PNTR_WIDTH-1 DOWNTO 0);
  SIGNAL wr_q : wr_sync_array := (OTHERS => (OTHERS => '0'));
  SIGNAL rd_q : rd_sync_array := (OTHERS => (OTHERS => '0'));

  -----------------------------------------------------------------------------
  -- ATTRIBUTE Declarations
  -----------------------------------------------------------------------------
  -- Prevent x-propagation on clock-domain crossing register
--  ATTRIBUTE async_reg                      : STRING;
--  ATTRIBUTE async_reg OF wr_pntr_gc_asreg  : SIGNAL IS "true"; 
--  ATTRIBUTE async_reg OF rd_pntr_gc_asreg  : SIGNAL IS "true";
--  ATTRIBUTE async_reg OF wr_q  : SIGNAL IS "true"; 
--  ATTRIBUTE async_reg OF rd_q  : SIGNAL IS "true";
--
--  ATTRIBUTE msgon                        : STRING;
--  ATTRIBUTE msgon OF wr_pntr_gc_asreg    : SIGNAL IS MSGONATTR;
--  ATTRIBUTE msgon OF rd_pntr_gc_asreg    : SIGNAL IS MSGONATTR;    
--  ATTRIBUTE msgon OF wr_q    : SIGNAL IS MSGONATTR;
--  ATTRIBUTE msgon OF rd_q    : SIGNAL IS MSGONATTR;    
  -----------------------------------------------------------------------------

BEGIN --xilinx

-------------------------------------------------------------------------------
-- Asynchronous FIFO
--
-- Pass WR_PNTR from WR_CLK domain to RD_CLK domain
-------------------------------------------------------------------------------
--
--
--            STAGE 1    |       STAGE 2      STAGE 3       STAGE 4
--                       |
--                       | 
--                       |           wr_pntr_gc   wr_pntr_gc 
--                 wr_pntr_gc        _asreg      _asreg_d1     wr_pntr_bin
--            +------+   |     +------+     +------+     +------+
--         --\| bin2 |--------\|      |----\|      |----\|      |----\
--         --/| gray |--------/|      |----/|      |----/|      |----/
--   WR_PNTR  |      |   |     |      |     |      |     |      |  WR_PNTR_RD
--         +--|>  a  |   |   +-|>  a  |   +-|>  a  |   +-|>  a  |  
--         |  +------+   |   | +------+   | +------+   | +------+
--         |      ^      |   |     ^      |     ^      |     ^
--         |      |      |   |     |      |     |      |     |  
--         |      |      |   |     +------|-----+------|-----+------- RD_RST
--       --+      |      |   |            |            |   
--    WR_CLK      |      |   +------------+------------+-------------- RD_CLK
--                |      |         
--      ---------+       |
--   WR_RST              |
--                       |
--                       |
--     WR_CLK domain     |                 RD_CLK domain 
--                       |
--
-- 
-- a = asynchronous reset of the register

  -----------------------------------------------------------------------------
  -- First stage of clock domain crossing 
  -- Clock binary to gray value of the write pointer in WR_CLK domain
  -----------------------------------------------------------------------------
  -- wr_pntr_gc is reset to 0. Because it is a gray coded signal the reset 
  -- value "0" is actually the gray code for binary "0". If it has to be 
  -- initialized to a non-zero value, make sure to use the bin2gray function.

  pwgc : PROCESS (WR_CLK, WR_RST)
  BEGIN
    if (WR_RST='1') then
      wr_pntr_gc <= zeros_wr;
    ELSIF (WR_CLK'event AND WR_CLK='1') THEN
      wr_pntr_gc <= bin2gray(WR_PNTR) AFTER TFF;
    END IF;
  END PROCESS pwgc;

--  -----------------------------------------------------------------------------
--  -- Second and third stages of clock domain crossing
--  -- Clock gray value of the write pointer with RD_CLK
--  -----------------------------------------------------------------------------
--  -- wr_pntr_gc_asreg and wr_pntr_gc_asreg_last are reset to 0. Because they are 
--  -- gray coded signals, the reset value "0" is actually the gray code for 
--  -- binary "0". If they have to be initialized to a non-zero value, make sure
--  -- to use the bin2gray function.
--
--  -- rd_pntr_gc_asreg and rd_pntr_gc_asreg_last are reset to 0. Because they are 
--  -- gray coded signals, the reset value "0" is actually the gray code for 
--  -- binary "0". If they have to be initialized to a non-zero value, make sure
--  -- to use the bin2gray function.
--
--  g2stage_synch: IF (C_SYNCHRONIZER_STAGE = 2) GENERATE
--    SIGNAL wr_pntr_gc_asreg    : std_logic_vector(C_WR_PNTR_WIDTH-1 DOWNTO 0) := zeros_wr;
--    SIGNAL rd_pntr_gc_asreg    : std_logic_vector(C_RD_PNTR_WIDTH-1 DOWNTO 0) := zeros_rd;
--    ATTRIBUTE async_reg                         : STRING;
--    ATTRIBUTE async_reg OF wr_pntr_gc_asreg     : SIGNAL IS "true"; 
--    ATTRIBUTE async_reg OF rd_pntr_gc_asreg     : SIGNAL IS "true";
--
--    ATTRIBUTE msgon                             : STRING;
--    ATTRIBUTE msgon OF wr_pntr_gc_asreg         : SIGNAL IS MSGONATTR;
--    ATTRIBUTE msgon OF rd_pntr_gc_asreg         : SIGNAL IS MSGONATTR;
--  BEGIN
--    pwx: PROCESS (RD_CLK, RD_RST)
--    BEGIN  
--      if (RD_RST='1') then
--        wr_pntr_gc_asreg      <= zeros_wr; 
--        wr_pntr_gc_asreg_last <= zeros_wr; 
--      ELSIF RD_CLK'event AND RD_CLK = '1' THEN 
--        wr_pntr_gc_asreg      <= wr_pntr_gc AFTER TFF;
--        wr_pntr_gc_asreg_last <= wr_pntr_gc_asreg AFTER TFF;
--      END IF;
--    END PROCESS pwx;
--
--    prx: PROCESS (WR_CLK, WR_RST)
--    BEGIN  
--      if (WR_RST='1') then
--        rd_pntr_gc_asreg      <= zeros_rd; 
--        rd_pntr_gc_asreg_last <= zeros_rd; 
--      ELSIF WR_CLK'event AND WR_CLK = '1' THEN 
--        rd_pntr_gc_asreg      <= rd_pntr_gc AFTER TFF;
--        rd_pntr_gc_asreg_last <= rd_pntr_gc_asreg AFTER TFF;
--      END IF;
--    END PROCESS prx;
--  END GENERATE g2stage_synch;
--
--  g3stage_synch: IF (C_SYNCHRONIZER_STAGE = 3) GENERATE
--    SIGNAL wr_pntr_gc_asreg    : std_logic_vector(C_WR_PNTR_WIDTH-1 DOWNTO 0) := zeros_wr;
--    SIGNAL wr_pntr_gc_asreg_d1 : std_logic_vector(C_WR_PNTR_WIDTH-1 DOWNTO 0) := zeros_wr;
--    SIGNAL rd_pntr_gc_asreg    : std_logic_vector(C_RD_PNTR_WIDTH-1 DOWNTO 0) := zeros_rd;
--    SIGNAL rd_pntr_gc_asreg_d1 : std_logic_vector(C_RD_PNTR_WIDTH-1 DOWNTO 0) := zeros_rd;
--    ATTRIBUTE async_reg                         : STRING;
--    ATTRIBUTE async_reg OF wr_pntr_gc_asreg     : SIGNAL IS "true"; 
--    ATTRIBUTE async_reg OF wr_pntr_gc_asreg_d1  : SIGNAL IS "true"; 
--    ATTRIBUTE async_reg OF rd_pntr_gc_asreg     : SIGNAL IS "true";
--    ATTRIBUTE async_reg OF rd_pntr_gc_asreg_d1  : SIGNAL IS "true"; 
--
--    ATTRIBUTE msgon                             : STRING;
--    ATTRIBUTE msgon OF wr_pntr_gc_asreg         : SIGNAL IS MSGONATTR;
--    ATTRIBUTE msgon OF wr_pntr_gc_asreg_d1      : SIGNAL IS MSGONATTR;
--    ATTRIBUTE msgon OF rd_pntr_gc_asreg         : SIGNAL IS MSGONATTR;
--    ATTRIBUTE msgon OF rd_pntr_gc_asreg_d1      : SIGNAL IS MSGONATTR;
--  BEGIN
--    pwx: PROCESS (RD_CLK, RD_RST)
--    BEGIN  
--      if (RD_RST='1') then
--        wr_pntr_gc_asreg      <= zeros_wr; 
--        wr_pntr_gc_asreg_d1   <= zeros_wr; 
--        wr_pntr_gc_asreg_last <= zeros_wr; 
--      ELSIF RD_CLK'event AND RD_CLK = '1' THEN 
--        wr_pntr_gc_asreg      <= wr_pntr_gc AFTER TFF;
--        wr_pntr_gc_asreg_d1   <= wr_pntr_gc_asreg AFTER TFF;
--        wr_pntr_gc_asreg_last <= wr_pntr_gc_asreg_d1 AFTER TFF;
--      END IF;
--    END PROCESS pwx;
--
--    prx: PROCESS (WR_CLK, WR_RST)
--    BEGIN  
--      if (WR_RST='1') then
--        rd_pntr_gc_asreg      <= zeros_rd; 
--        rd_pntr_gc_asreg_d1   <= zeros_rd; 
--        rd_pntr_gc_asreg_last <= zeros_rd; 
--      ELSIF WR_CLK'event AND WR_CLK = '1' THEN 
--        rd_pntr_gc_asreg      <= rd_pntr_gc AFTER TFF;
--        rd_pntr_gc_asreg_d1   <= rd_pntr_gc_asreg AFTER TFF;
--        rd_pntr_gc_asreg_last <= rd_pntr_gc_asreg_d1 AFTER TFF;
--      END IF;
--    END PROCESS prx;
--  END GENERATE g3stage_synch;
--
--  g4stage_synch: IF (C_SYNCHRONIZER_STAGE = 4) GENERATE
--    SIGNAL wr_pntr_gc_asreg    : std_logic_vector(C_WR_PNTR_WIDTH-1 DOWNTO 0) := zeros_wr;
--    SIGNAL wr_pntr_gc_asreg_d1 : std_logic_vector(C_WR_PNTR_WIDTH-1 DOWNTO 0) := zeros_wr;
--    SIGNAL wr_pntr_gc_asreg_d2 : std_logic_vector(C_WR_PNTR_WIDTH-1 DOWNTO 0) := zeros_wr;
--    SIGNAL rd_pntr_gc_asreg    : std_logic_vector(C_RD_PNTR_WIDTH-1 DOWNTO 0) := zeros_rd;
--    SIGNAL rd_pntr_gc_asreg_d1 : std_logic_vector(C_RD_PNTR_WIDTH-1 DOWNTO 0) := zeros_rd;
--    SIGNAL rd_pntr_gc_asreg_d2 : std_logic_vector(C_RD_PNTR_WIDTH-1 DOWNTO 0) := zeros_rd;
--    ATTRIBUTE async_reg                         : STRING;
--    ATTRIBUTE async_reg OF wr_pntr_gc_asreg     : SIGNAL IS "true"; 
--    ATTRIBUTE async_reg OF wr_pntr_gc_asreg_d1  : SIGNAL IS "true"; 
--    ATTRIBUTE async_reg OF wr_pntr_gc_asreg_d2  : SIGNAL IS "true"; 
--    ATTRIBUTE async_reg OF rd_pntr_gc_asreg     : SIGNAL IS "true";
--    ATTRIBUTE async_reg OF rd_pntr_gc_asreg_d1  : SIGNAL IS "true"; 
--    ATTRIBUTE async_reg OF rd_pntr_gc_asreg_d2  : SIGNAL IS "true"; 
--
--    ATTRIBUTE msgon                             : STRING;
--    ATTRIBUTE msgon OF wr_pntr_gc_asreg         : SIGNAL IS MSGONATTR;
--    ATTRIBUTE msgon OF wr_pntr_gc_asreg_d1      : SIGNAL IS MSGONATTR;
--    ATTRIBUTE msgon OF wr_pntr_gc_asreg_d2      : SIGNAL IS MSGONATTR;
--    ATTRIBUTE msgon OF rd_pntr_gc_asreg         : SIGNAL IS MSGONATTR;
--    ATTRIBUTE msgon OF rd_pntr_gc_asreg_d1      : SIGNAL IS MSGONATTR;
--    ATTRIBUTE msgon OF rd_pntr_gc_asreg_d2      : SIGNAL IS MSGONATTR;
--  BEGIN
--    pwx: PROCESS (RD_CLK, RD_RST)
--    BEGIN  
--      if (RD_RST='1') then
--        wr_pntr_gc_asreg      <= zeros_wr; 
--        wr_pntr_gc_asreg_d1   <= zeros_wr; 
--        wr_pntr_gc_asreg_d2   <= zeros_wr; 
--        wr_pntr_gc_asreg_last <= zeros_wr; 
--      ELSIF RD_CLK'event AND RD_CLK = '1' THEN 
--        wr_pntr_gc_asreg      <= wr_pntr_gc AFTER TFF;
--        wr_pntr_gc_asreg_d1   <= wr_pntr_gc_asreg AFTER TFF;
--        wr_pntr_gc_asreg_d2   <= wr_pntr_gc_asreg_d1 AFTER TFF;
--        wr_pntr_gc_asreg_last <= wr_pntr_gc_asreg_d2 AFTER TFF;
--      END IF;
--    END PROCESS pwx;
--
--    prx: PROCESS (WR_CLK, WR_RST)
--    BEGIN  
--      if (WR_RST='1') then
--        rd_pntr_gc_asreg      <= zeros_rd; 
--        rd_pntr_gc_asreg_d1   <= zeros_rd; 
--        rd_pntr_gc_asreg_d2   <= zeros_rd; 
--        rd_pntr_gc_asreg_last <= zeros_rd; 
--      ELSIF WR_CLK'event AND WR_CLK = '1' THEN 
--        rd_pntr_gc_asreg      <= rd_pntr_gc AFTER TFF;
--        rd_pntr_gc_asreg_d1   <= rd_pntr_gc_asreg AFTER TFF;
--        rd_pntr_gc_asreg_d2   <= rd_pntr_gc_asreg_d1 AFTER TFF;
--        rd_pntr_gc_asreg_last <= rd_pntr_gc_asreg_d2 AFTER TFF;
--      END IF;
--    END PROCESS prx;
--  END GENERATE g4stage_synch;

  gsync_stage: FOR I IN 1 TO C_SYNCHRONIZER_STAGE GENERATE
  BEGIN
      rd_stg_inst: ENTITY axis_accelerator_adapter_v2_1_16.synchronizer_ff
          GENERIC MAP (
            C_HAS_RST => C_HAS_RST,
            C_WIDTH   => C_WR_PNTR_WIDTH
            )
          PORT MAP ( 
            RST       => RD_RST,
            CLK       => RD_CLK,   
            D         => wr_q(i-1),
            Q         => wr_q(i)
            );    

      wr_stg_inst: ENTITY axis_accelerator_adapter_v2_1_16.synchronizer_ff
          GENERIC MAP (
            C_HAS_RST => C_HAS_RST,
            C_WIDTH   => C_RD_PNTR_WIDTH
            )
          PORT MAP ( 
            RST       => WR_RST,
            CLK       => WR_CLK,   
            D         => rd_q(i-1),
            Q         => rd_q(i)
            );    
  END GENERATE gsync_stage;

  wr_q(0)                    <= wr_pntr_gc;
  wr_pntr_gc_asreg_last      <= wr_q(C_SYNCHRONIZER_STAGE);
  rd_q(0)                    <= rd_pntr_gc;
  rd_pntr_gc_asreg_last      <= rd_q(C_SYNCHRONIZER_STAGE);

--  pwr_sync : PROCESS (RD_CLK, RD_RST)
--  BEGIN
--    if (RD_RST='1' AND C_HAS_RST = 1) then
--      wr_q <= (OTHERS => (OTHERS => '0')); 
--    ELSIF (RD_CLK'event AND RD_CLK='1') THEN
--      FOR I IN 1 TO C_SYNCHRONIZER_STAGE LOOP
--        wr_q(i) <= wr_q(i-1);
--      END LOOP;
--    END IF;
--  END PROCESS pwr_sync;
--
--  prd_sync : PROCESS (WR_CLK, WR_RST)
--  BEGIN
--    if (WR_RST='1' AND C_HAS_RST = 1) then
--      rd_q <= (OTHERS => (OTHERS => '0')); 
--    ELSIF (WR_CLK'event AND WR_CLK='1') THEN
--      FOR I IN 1 TO C_SYNCHRONIZER_STAGE LOOP
--        rd_q(i) <= rd_q(i-1);
--      END LOOP;
--    END IF;
--  END PROCESS prd_sync;


  -----------------------------------------------------------------------------
  -- Fourth stage of clock domain crossing 
  -- Clock gray to binary value of the write pointer in RD_CLK domain
  -----------------------------------------------------------------------------
  pwbin : PROCESS (RD_CLK, RD_RST)
  BEGIN
    if (RD_RST='1' AND C_HAS_RST = 1) then
      wr_pntr_bin <= zeros_wr; 
    ELSIF (RD_CLK'event AND RD_CLK='1') THEN
      wr_pntr_bin <= gray2bin(wr_pntr_gc_asreg_last) AFTER TFF;
    END IF;
  END PROCESS pwbin;

  -----------------------------------------------------------------------------
  -- Asynchronous FIFO
  --
  -- Pass RD_PNTR from RD_CLK domain to WR_CLK domain
  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- First stage of clock domain crossing 
  -- Clock binary to gray value of the read pointer in RD_CLK domain
  -----------------------------------------------------------------------------
  -- rd_pntr_gc is reset to 0. Because it is a gray coded signal the reset 
  -- value "0" is actually the gray code for binary "0". If it has to be 
  -- initialized to a non-zero value, make sure to use the bin2gray function.

  prgc : PROCESS (RD_CLK, RD_RST)
  BEGIN
    if (RD_RST='1' AND C_HAS_RST = 1) then
      rd_pntr_gc <= zeros_rd;
    ELSIF (RD_CLK'event AND RD_CLK='1') THEN
      rd_pntr_gc <= bin2gray(RD_PNTR) AFTER TFF;
    END IF;
  END PROCESS prgc;

  -----------------------------------------------------------------------------
  -- Fourth stage of clock domain crossing 
  -- Clock gray to binary value of the read pointer in WR_CLK domain
  -----------------------------------------------------------------------------
  prbin : PROCESS (WR_CLK, WR_RST)
  BEGIN
    if (WR_RST='1' AND C_HAS_RST = 1) then
      rd_pntr_bin <= zeros_rd; 
    ELSIF (WR_CLK'event AND WR_CLK='1') THEN
      rd_pntr_bin <= gray2bin(rd_pntr_gc_asreg_last ) AFTER TFF;
    END IF;
  END PROCESS prbin;

  -- Connect the output ports
  WR_PNTR_RD <= wr_pntr_bin;
  RD_PNTR_WR <= rd_pntr_bin;

END xilinx;



--Generic Help
--C_CDC_TYPE : Defines the type of CDC needed
--             0 means pulse synchronizer. Used to transfer one clock pulse 
--               from prmry domain to scndry domain.
--             1 means level synchronizer. Used to transfer level signal.
--             2 means level synchronizer with ack. Used to transfer level 
--               signal. Input signal should change only when prmry_ack is detected
--
--C_FLOP_INPUT : when set to 1 adds one flop stage to the input prmry_in signal
--               Set to 0 when incoming signal is purely floped signal.
--
--C_RESET_STATE : Generally sync flops need not have resets. However, in some cases
--                it might be needed.
--              0 means reset not needed for sync flops 
--              1 means reset needed for sync flops. i
--                In this case prmry_resetn should be in prmry clock, 
--                while scndry_reset should be in scndry clock.
--
--C_SINGLE_BIT : CDC should normally be done for single bit signals only. 
--               However, based on design buses can also be CDC'ed.
--               0 means it is a bus. In this case input be connected to prmry_vect_in.
--                 Output is on scndry_vect_out.
--               1 means it is a single bit. In this case input be connected to prmry_in. 
--                 Output is on scndry_out.
--
--C_VECTOR_WIDTH : defines the size of bus. This is irrelevant when C_SINGLE_BIT = 1
--
--C_MTBF_STAGES : Defines the number of sync stages needed. Allowed values are 0 to 6.
--                Value of 0, 1 is allowed only for level CDC.
--                Min value for Pulse CDC is 2
--
--Whenever this file is used following XDC constraint has to be added 

--         set_false_path -to [get_pins -hier *cdc_to*/D]        


--IO Ports 
--
--        prmry_aclk      : clock of originating domain (source domain)
--        prmry_resetn    : sync reset of originating clock domain (source domain)
--        prmry_in        : input signal bit. This should be a pure flop output without 
--                          any combi logic. This is source. 
--        prmry_vect_in   : bus signal. From Source domain.
--        prmry_ack       : Ack signal, valid for one clock period, in prmry_aclk domain.
--                          Used only when C_CDC_TYPE = 2
--        scndry_aclk     : destination clock.
--        scndry_resetn   : sync reset of destination domain
--        scndry_out      : sync'ed output in destination domain. Single bit.
--        scndry_vect_out : sync'ed output in destination domain. bus.




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;



entity  axis_acc_adapter_cdc_sync is
    generic (
        C_CDC_TYPE                  : integer range 0 to 2 := 1                 ;
                                    -- 0 is pulse synch
                                    -- 1 is level synch
                                    -- 2 is ack based level sync
        C_RESET_STATE               : integer range 0 to 1 := 0                 ;
                                    -- 0 is reset not needed 
                                    -- 1 is reset needed 
        C_SINGLE_BIT                : integer range 0 to 1 := 1                 ; 
                                    -- 0 is bus input
                                    -- 1 is single bit input
        C_FLOP_INPUT                : integer range 0 to 1 := 0                 ;
        C_VECTOR_WIDTH              : integer range 0 to 32 := 32                             ;
        C_MTBF_STAGES               : integer range 0 to 6 := 2                 
            -- Vector Data witdth
    );

    port (
        prmry_aclk                  : in  std_logic                             ;               --
        prmry_resetn                : in  std_logic                             ;               --
        prmry_in                    : in  std_logic                             ;               --
        prmry_vect_in               : in  std_logic_vector                                      --
                                        (C_VECTOR_WIDTH - 1 downto 0)           ;               --
        prmry_ack                   : out std_logic                             ;
                                                                                                --
        scndry_aclk                 : in  std_logic                             ;               --
        scndry_resetn               : in  std_logic                             ;               --
                                                                                                --
        -- Primary to Secondary Clock Crossing                                                  --
        scndry_out                  : out std_logic                             ;               --
                                                                                                --
        scndry_vect_out             : out std_logic_vector                                      --
                                        (C_VECTOR_WIDTH - 1 downto 0)                           --

    );

end axis_acc_adapter_cdc_sync;

-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------
architecture implementation of axis_acc_adapter_cdc_sync is

    attribute DowngradeIPIdentifiedWarnings: string;
    attribute DowngradeIPIdentifiedWarnings of implementation : architecture is "yes";

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------

-- No Functions Declared

-------------------------------------------------------------------------------
-- Constants Declarations
-------------------------------------------------------------------------------

-- No Constants Declared

-------------------------------------------------------------------------------
-- Begin architecture logic
-------------------------------------------------------------------------------
begin
-- Generate PULSE clock domain crossing
GENERATE_PULSE_P_S_CDC_OPEN_ENDED : if C_CDC_TYPE = 0 generate

-- Primary to Secondary
signal s_out_d1_cdc_to          : std_logic := '0';
signal s_out_d2             : std_logic := '0';
signal s_out_d3             : std_logic := '0';
signal s_out_d4             : std_logic := '0';
signal s_out_d5             : std_logic := '0';
signal s_out_d6             : std_logic := '0';
signal s_out_d7             : std_logic := '0';
signal s_out_re             : std_logic := '0';
signal prmry_in_xored           : std_logic := '0';
signal p_in_d1_cdc_from     : std_logic := '0';



 -----------------------------------------------------------------------------
  -- ATTRIBUTE Declarations
  -----------------------------------------------------------------------------
  -- Prevent x-propagation on clock-domain crossing register
  ATTRIBUTE async_reg                       : STRING;
  ATTRIBUTE async_reg OF s_out_d1_cdc_to    : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_out_d2       : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_out_d3       : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_out_d4       : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_out_d5       : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_out_d6       : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_out_d7       : SIGNAL IS "true"; 

begin

    --*****************************************************************************
    --**                  Asynchronous Pulse Clock Crossing                      **
    --**                  PRIMARY TO SECONDARY OPEN-ENDED                        **
    --*****************************************************************************

scndry_vect_out <= (others => '0');
prmry_ack <= '0';

prmry_in_xored <= prmry_in xor p_in_d1_cdc_from;
 
    REG_P_IN : process(prmry_aclk)
        begin
            if(prmry_aclk'EVENT and prmry_aclk ='1')then
                if(prmry_resetn = '0')then
                    p_in_d1_cdc_from  <= '0';
                else
                    p_in_d1_cdc_from  <= prmry_in_xored;
                end if;
            end if;
        end process REG_P_IN;


    P_IN_CROSS2SCNDRY : process(scndry_aclk)
        begin
            if(scndry_aclk'EVENT and scndry_aclk ='1')then
                if(scndry_resetn = '0' and C_RESET_STATE = 1)then
                    s_out_d1_cdc_to     <= '0';
                    s_out_d2        <= '0';
                    s_out_d3        <= '0';
                    s_out_d4        <= '0';
                    s_out_d5        <= '0';
                    s_out_d6        <= '0';
                    s_out_d7        <= '0';
                    scndry_out          <= '0';
                else
                    s_out_d1_cdc_to     <= p_in_d1_cdc_from;
                    s_out_d2        <= s_out_d1_cdc_to;
                    s_out_d3        <= s_out_d2;
                    s_out_d4        <= s_out_d3;
                    s_out_d5        <= s_out_d4;
                    s_out_d6        <= s_out_d5;
                    s_out_d7        <= s_out_d6;
                    scndry_out          <= s_out_re;
                end if;
            end if;
        end process P_IN_CROSS2SCNDRY;

MTBF_2 : if C_MTBF_STAGES = 2 generate
begin
                    s_out_re  <= s_out_d2 xor s_out_d3;

end generate MTBF_2;

MTBF_3 : if C_MTBF_STAGES = 3 generate
begin
                    s_out_re  <= s_out_d3 xor s_out_d4;

end generate MTBF_3;

MTBF_4 : if C_MTBF_STAGES = 4 generate
begin
                    s_out_re  <= s_out_d4 xor s_out_d5;

end generate MTBF_4;

MTBF_5 : if C_MTBF_STAGES = 5 generate
begin
                    s_out_re  <= s_out_d5 xor s_out_d6;

end generate MTBF_5;

MTBF_6 : if C_MTBF_STAGES = 6 generate
begin
                    s_out_re  <= s_out_d6 xor s_out_d7;

end generate MTBF_6;

   -- Feed secondary pulse out

end generate GENERATE_PULSE_P_S_CDC_OPEN_ENDED;


-- Generate LEVEL clock domain crossing with reset state = 0
GENERATE_LEVEL_P_S_CDC : if C_CDC_TYPE = 1 generate
begin
-- Primary to Secondary

SINGLE_BIT : if C_SINGLE_BIT = 1 generate 

signal p_level_in_d1_cdc_from        : std_logic := '0';
signal p_level_in_int        : std_logic := '0';
signal s_level_out_d1_cdc_to       : std_logic := '0';
signal s_level_out_d2       : std_logic := '0';
signal s_level_out_d3       : std_logic := '0';
signal s_level_out_d4       : std_logic := '0';
signal s_level_out_d5       : std_logic := '0';
signal s_level_out_d6       : std_logic := '0';
 -----------------------------------------------------------------------------
  -- ATTRIBUTE Declarations
  -----------------------------------------------------------------------------
  -- Prevent x-propagation on clock-domain crossing register
  ATTRIBUTE async_reg                      : STRING;
  ATTRIBUTE async_reg OF s_level_out_d1_cdc_to  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_d2  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_d3  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_d4  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_d5  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_d6  : SIGNAL IS "true"; 

begin

    --*****************************************************************************
    --**                  Asynchronous Level Clock Crossing                      **
    --**                        PRIMARY TO SECONDARY                             **
    --*****************************************************************************
    -- register is scndry to provide clean ff output to clock crossing logic

scndry_vect_out <= (others => '0');
prmry_ack <= '0';


INPUT_FLOP : if C_FLOP_INPUT = 1 generate
begin

    REG_PLEVEL_IN : process(prmry_aclk)
        begin
            if(prmry_aclk'EVENT and prmry_aclk ='1')then
                if(prmry_resetn = '0' and C_RESET_STATE = 1)then
                    p_level_in_d1_cdc_from  <= '0';
                else
                    p_level_in_d1_cdc_from  <= prmry_in;
                end if;
            end if;
        end process REG_PLEVEL_IN;

         p_level_in_int <= p_level_in_d1_cdc_from;

end generate INPUT_FLOP;


NO_INPUT_FLOP : if C_FLOP_INPUT = 0 generate
begin

       p_level_in_int <= prmry_in;

end generate NO_INPUT_FLOP;

    CROSS_PLEVEL_IN2SCNDRY : process(scndry_aclk)
        begin
            if(scndry_aclk'EVENT and scndry_aclk ='1')then
                if(scndry_resetn = '0' and C_RESET_STATE = 1)then
                    s_level_out_d1_cdc_to  <= '0';
                    s_level_out_d2  <= '0';
                    s_level_out_d3  <= '0';
                    s_level_out_d4  <= '0';
                    s_level_out_d5  <= '0';
                    s_level_out_d6  <= '0';
                else
                    s_level_out_d1_cdc_to  <= p_level_in_int;
                    s_level_out_d2  <= s_level_out_d1_cdc_to;
                    s_level_out_d3  <= s_level_out_d2;
                    s_level_out_d4  <= s_level_out_d3;
                    s_level_out_d5  <= s_level_out_d4;
                    s_level_out_d6  <= s_level_out_d5;
                end if;
            end if;
        end process CROSS_PLEVEL_IN2SCNDRY;




MTBF_L1 : if C_MTBF_STAGES = 1 generate
begin
    scndry_out <= s_level_out_d1_cdc_to;
                   

end generate MTBF_L1;

MTBF_L2 : if C_MTBF_STAGES = 2 generate
begin

    scndry_out <= s_level_out_d2;
                   

end generate MTBF_L2;

MTBF_L3 : if C_MTBF_STAGES = 3 generate
begin
    
   scndry_out <= s_level_out_d3;



end generate MTBF_L3;

MTBF_L4 : if C_MTBF_STAGES = 4 generate
begin
    scndry_out <= s_level_out_d4;

               

end generate MTBF_L4;

MTBF_L5 : if C_MTBF_STAGES = 5 generate
begin

    scndry_out <= s_level_out_d5;
             

end generate MTBF_L5;

MTBF_L6 : if C_MTBF_STAGES = 6 generate
begin

    scndry_out <= s_level_out_d6;
           

end generate MTBF_L6;

end generate SINGLE_BIT;



MULTI_BIT : if C_SINGLE_BIT = 0 generate 

signal p_level_in_bus_int : std_logic_vector (C_VECTOR_WIDTH - 1 downto 0);
signal p_level_in_bus_d1_cdc_from      : std_logic_vector(C_VECTOR_WIDTH - 1 downto 0);
signal s_level_out_bus_d1_cdc_to       : std_logic_vector(C_VECTOR_WIDTH - 1 downto 0);
signal s_level_out_bus_d1_cdc_tig       : std_logic_vector(C_VECTOR_WIDTH - 1 downto 0);
signal s_level_out_bus_d2       : std_logic_vector(C_VECTOR_WIDTH - 1 downto 0);
signal s_level_out_bus_d3       : std_logic_vector(C_VECTOR_WIDTH - 1 downto 0);
signal s_level_out_bus_d4       : std_logic_vector(C_VECTOR_WIDTH - 1 downto 0);
signal s_level_out_bus_d5       : std_logic_vector(C_VECTOR_WIDTH - 1 downto 0);
signal s_level_out_bus_d6       : std_logic_vector(C_VECTOR_WIDTH - 1 downto 0);
 -----------------------------------------------------------------------------
  -- ATTRIBUTE Declarations
  -----------------------------------------------------------------------------
  -- Prevent x-propagation on clock-domain crossing register
  ATTRIBUTE async_reg                      : STRING;
  ATTRIBUTE async_reg OF s_level_out_bus_d1_cdc_to  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_bus_d2  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_bus_d3  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_bus_d4  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_bus_d5  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_bus_d6  : SIGNAL IS "true"; 

begin

    --*****************************************************************************
    --**                  Asynchronous Level Clock Crossing                      **
    --**                        PRIMARY TO SECONDARY                             **
    --*****************************************************************************
    -- register is scndry to provide clean ff output to clock crossing logic

scndry_out <= '0';
prmry_ack <= '0';


INPUT_FLOP_BUS : if C_FLOP_INPUT = 1 generate
begin
    REG_PLEVEL_IN : process(prmry_aclk)
        begin
            if(prmry_aclk'EVENT and prmry_aclk ='1')then
                if(prmry_resetn = '0' and C_RESET_STATE = 1)then
                    p_level_in_bus_d1_cdc_from  <= (others => '0');
                else
                    p_level_in_bus_d1_cdc_from  <= prmry_vect_in;
                end if;
            end if;
        end process REG_PLEVEL_IN;

            p_level_in_bus_int <= p_level_in_bus_d1_cdc_from;

end generate INPUT_FLOP_BUS;


NO_INPUT_FLOP_BUS : if C_FLOP_INPUT = 0 generate
begin

p_level_in_bus_int <= prmry_vect_in;

end generate NO_INPUT_FLOP_BUS;

    CROSS_PLEVEL_IN2SCNDRY : process(scndry_aclk)
        begin
            if(scndry_aclk'EVENT and scndry_aclk ='1')then
                if(scndry_resetn = '0' and C_RESET_STATE = 1)then
                    s_level_out_bus_d1_cdc_to  <= (others => '0');
                    s_level_out_bus_d2  <= (others => '0');
                    s_level_out_bus_d3  <= (others => '0');
                    s_level_out_bus_d4  <= (others => '0');
                    s_level_out_bus_d5  <= (others => '0');
                    s_level_out_bus_d6  <= (others => '0');
                else
                    s_level_out_bus_d1_cdc_to  <= p_level_in_bus_int;
                    s_level_out_bus_d2  <= s_level_out_bus_d1_cdc_to;
                    s_level_out_bus_d3  <= s_level_out_bus_d2;
                    s_level_out_bus_d4  <= s_level_out_bus_d3;
                    s_level_out_bus_d5  <= s_level_out_bus_d4;
                    s_level_out_bus_d6  <= s_level_out_bus_d5;
                end if;
            end if;
        end process CROSS_PLEVEL_IN2SCNDRY;



MTBF_L1 : if C_MTBF_STAGES = 1 generate
begin

    scndry_vect_out <= s_level_out_bus_d1_cdc_to;
                   

end generate MTBF_L1;

MTBF_L2 : if C_MTBF_STAGES = 2 generate
begin

    scndry_vect_out <= s_level_out_bus_d2;
                   

end generate MTBF_L2;

MTBF_L3 : if C_MTBF_STAGES = 3 generate
begin
    
   scndry_vect_out <= s_level_out_bus_d3;



end generate MTBF_L3;

MTBF_L4 : if C_MTBF_STAGES = 4 generate
begin
    scndry_vect_out <= s_level_out_bus_d4;

               

end generate MTBF_L4;

MTBF_L5 : if C_MTBF_STAGES = 5 generate
begin

    scndry_vect_out <= s_level_out_bus_d5;
             

end generate MTBF_L5;

MTBF_L6 : if C_MTBF_STAGES = 6 generate
begin

    scndry_vect_out <= s_level_out_bus_d6;
           

end generate MTBF_L6;

end generate MULTI_BIT;


end generate GENERATE_LEVEL_P_S_CDC;


GENERATE_LEVEL_ACK_P_S_CDC : if C_CDC_TYPE = 2 generate
-- Primary to Secondary


signal p_level_in_d1_cdc_from        : std_logic := '0';
signal p_level_in_int              : std_logic := '0';
signal s_level_out_d1_cdc_to       : std_logic := '0';
signal s_level_out_d2       : std_logic := '0';
signal s_level_out_d3       : std_logic := '0';
signal s_level_out_d4       : std_logic := '0';
signal s_level_out_d5       : std_logic := '0';
signal s_level_out_d6       : std_logic := '0';
signal p_level_out_d1_cdc_to       : std_logic := '0';
signal p_level_out_d2       : std_logic := '0';
signal p_level_out_d3       : std_logic := '0';
signal p_level_out_d4       : std_logic := '0';
signal p_level_out_d5       : std_logic := '0';
signal p_level_out_d6       : std_logic := '0';
signal p_level_out_d7       : std_logic := '0';
signal scndry_out_int       : std_logic := '0';
signal prmry_pulse_ack      : std_logic := '0';
 -----------------------------------------------------------------------------
  -- ATTRIBUTE Declarations
  -----------------------------------------------------------------------------
  -- Prevent x-propagation on clock-domain crossing register
  ATTRIBUTE async_reg                      : STRING;
  ATTRIBUTE async_reg OF s_level_out_d1_cdc_to  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_d2  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_d3  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_d4  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_d5  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF s_level_out_d6  : SIGNAL IS "true"; 

  ATTRIBUTE async_reg OF p_level_out_d1_cdc_to  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF p_level_out_d2  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF p_level_out_d3  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF p_level_out_d4  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF p_level_out_d5  : SIGNAL IS "true"; 
  ATTRIBUTE async_reg OF p_level_out_d6  : SIGNAL IS "true"; 

begin

    --*****************************************************************************
    --**                  Asynchronous Level Clock Crossing                      **
    --**                        PRIMARY TO SECONDARY                             **
    --*****************************************************************************
    -- register is scndry to provide clean ff output to clock crossing logic
scndry_vect_out <= (others => '0');


INPUT_FLOP : if C_FLOP_INPUT = 1 generate
begin

    REG_PLEVEL_IN : process(prmry_aclk)
        begin
            if(prmry_aclk'EVENT and prmry_aclk ='1')then
                if(prmry_resetn = '0' and C_RESET_STATE = 1)then
                    p_level_in_d1_cdc_from  <= '0';
                else
                    p_level_in_d1_cdc_from  <= prmry_in;
                end if;
            end if;
        end process REG_PLEVEL_IN;

    p_level_in_int <= p_level_in_d1_cdc_from;

end generate INPUT_FLOP;


NO_INPUT_FLOP : if C_FLOP_INPUT = 0 generate
begin

    p_level_in_int <= prmry_in;

end generate NO_INPUT_FLOP;

    CROSS_PLEVEL_IN2SCNDRY : process(scndry_aclk)
        begin
            if(scndry_aclk'EVENT and scndry_aclk ='1')then
                if(scndry_resetn = '0' and C_RESET_STATE = 1)then
                    s_level_out_d1_cdc_to  <= '0';
                    s_level_out_d2  <= '0';
                    s_level_out_d3  <= '0';
                    s_level_out_d4  <= '0';
                    s_level_out_d5  <= '0';
                    s_level_out_d6  <= '0';
                else
                    s_level_out_d1_cdc_to  <= p_level_in_int;
                    s_level_out_d2  <= s_level_out_d1_cdc_to;
                    s_level_out_d3  <= s_level_out_d2;
                    s_level_out_d4  <= s_level_out_d3;
                    s_level_out_d5  <= s_level_out_d4;
                    s_level_out_d6  <= s_level_out_d5;
                end if;
            end if;
        end process CROSS_PLEVEL_IN2SCNDRY;


    CROSS_PLEVEL_SCNDRY2PRMRY : process(prmry_aclk)
        begin
            if(prmry_aclk'EVENT and prmry_aclk ='1')then
                if(prmry_resetn = '0' and C_RESET_STATE = 1)then
                    p_level_out_d1_cdc_to  <= '0';
                    p_level_out_d2  <= '0';
                    p_level_out_d3  <= '0';
                    p_level_out_d4  <= '0';
                    p_level_out_d5  <= '0';
                    p_level_out_d6  <= '0';
                    p_level_out_d7  <= '0';
                    prmry_ack       <= '0';
                else
                    p_level_out_d1_cdc_to  <= scndry_out_int;
                    p_level_out_d2  <= p_level_out_d1_cdc_to;
                    p_level_out_d3  <= p_level_out_d2;
                    p_level_out_d4  <= p_level_out_d3;
                    p_level_out_d5  <= p_level_out_d4;
                    p_level_out_d6  <= p_level_out_d5;
                    p_level_out_d7  <= p_level_out_d6;
                    prmry_ack       <= prmry_pulse_ack;
                end if;
            end if;
        end process CROSS_PLEVEL_SCNDRY2PRMRY;




MTBF_L2 : if C_MTBF_STAGES = 2 or C_MTBF_STAGES = 1 generate
begin

    scndry_out_int <= s_level_out_d2;
    --prmry_pulse_ack <= p_level_out_d3 xor p_level_out_d2;
    prmry_pulse_ack <= (not p_level_out_d3) and p_level_out_d2;
                   

end generate MTBF_L2;

MTBF_L3 : if C_MTBF_STAGES = 3 generate
begin
    
   scndry_out_int <= s_level_out_d3;
   --prmry_pulse_ack <= p_level_out_d4 xor p_level_out_d3;
   prmry_pulse_ack <= (not p_level_out_d4) and p_level_out_d3;



end generate MTBF_L3;

MTBF_L4 : if C_MTBF_STAGES = 4 generate
begin
    scndry_out_int <= s_level_out_d4;
   --prmry_pulse_ack <= p_level_out_d5 xor p_level_out_d4;
   prmry_pulse_ack <= (not p_level_out_d5) and p_level_out_d4;

               

end generate MTBF_L4;

MTBF_L5 : if C_MTBF_STAGES = 5 generate
begin

    scndry_out_int <= s_level_out_d5;
   --prmry_pulse_ack <= p_level_out_d6 xor p_level_out_d5;
   prmry_pulse_ack <= (not p_level_out_d6) and p_level_out_d5;
             

end generate MTBF_L5;

MTBF_L6 : if C_MTBF_STAGES = 6 generate
begin

    scndry_out_int <= s_level_out_d6;
   --prmry_pulse_ack <= p_level_out_d7 xor p_level_out_d6;
   prmry_pulse_ack <= (not p_level_out_d7) and p_level_out_d6;
           

end generate MTBF_L6;

       scndry_out <= scndry_out_int;


end generate GENERATE_LEVEL_ACK_P_S_CDC;


end implementation;


-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : symmetric_dp_bank_v6.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-10-25
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;

entity symmetric_dp_bank_v6 is
  generic (
    C_FAMILY      : string;
    C_BRAM_TYPE   : string := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2
    C_SELECT_XPM  : integer := 0;
    C_BANK_AWIDTH : integer;
    C_BANK_DWIDTH : integer);
  port (
    rst    : in  std_logic;
    clk_a  : in  std_logic;
    ce_a   : in  std_logic;
    we_a   : in  std_logic;
    addr_a : in  std_logic_vector(C_BANK_AWIDTH-1 downto 0);
    din_a  : in  std_logic_vector(C_BANK_DWIDTH-1 downto 0);
    dout_a : out std_logic_vector(C_BANK_DWIDTH-1 downto 0);
    clk_b  : in  std_logic;
    ce_b   : in  std_logic;
    we_b   : in  std_logic;
    addr_b : in  std_logic_vector(C_BANK_AWIDTH-1 downto 0);
    din_b  : in  std_logic_vector(C_BANK_DWIDTH-1 downto 0);
    dout_b : out std_logic_vector(C_BANK_DWIDTH-1 downto 0));
end symmetric_dp_bank_v6;

architecture rtl of symmetric_dp_bank_v6 is
  constant MAX_BRAM_AWIDTH : integer := 15;  -- 32Kx1
  constant MIN_BRAM_AWIDTH : integer := 10;  -- 1Kx32
  constant MAX_BRAM_DWIDTH : integer := 32;  -- 1Kx32
  constant MIN_BRAM_DWIDTH : integer := 1;   -- 32Kx1

component  xpm_memory_tdpram
  generic (
  MEMORY_SIZE         : integer := 4096*32;
  MEMORY_PRIMITIVE    : string  := "auto";
  CLOCKING_MODE       : string  := "common_clock";
  ECC_MODE            : string  := "no_ecc";
  MEMORY_INIT_FILE    : string  := "none";
  MEMORY_INIT_PARAM   : string  := "";
  WAKEUP_TIME         : string  := "disable_sleep";
  MESSAGE_CONTROL     : integer :=  0;

  WRITE_DATA_WIDTH_A  : integer := 32;
  READ_DATA_WIDTH_A   : integer := 32;
  BYTE_WRITE_WIDTH_A  : integer :=  8;
  ADDR_WIDTH_A        : integer := 12; 
  READ_RESET_VALUE_A  : string  := "0";
  READ_LATENCY_A      : integer :=  1;
  WRITE_MODE_A        : string  :=  "read_first";

  WRITE_DATA_WIDTH_B  : integer := 32;
  READ_DATA_WIDTH_B   : integer := 32;
  BYTE_WRITE_WIDTH_B  : integer :=  8;
  ADDR_WIDTH_B        : integer := 12;
  READ_RESET_VALUE_B  : string  := "0";
  READ_LATENCY_B      : integer :=  1;
  WRITE_MODE_B        : string  :=  "read_first"

); 
  port (

  -- Common module ports
   sleep              : in std_logic;

  -- Port A module ports
   clka               : in std_logic;
   rsta               : in std_logic;
   ena                : in std_logic;
   regcea             : in std_logic;
   wea                : in std_logic;  -- (WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1:0]
   addra              : in std_logic_vector (ADDR_WIDTH_A-1 downto 0);  -- [ADDR_WIDTH_A-1:0]   
   dina               : in std_logic_vector (WRITE_DATA_WIDTH_A-1  downto 0);  -- [WRITE_DATA_WIDTH_A-1:0] 
   injectsbiterra     : in std_logic;
   injectdbiterra     : in std_logic;
   douta              : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);                -- [READ_DATA_WIDTH_A-1:0]  
   sbiterra           : out std_logic;
   dbiterra           : out std_logic;

  -- Port B module ports
   clkb               : in std_logic;
   rstb               : in std_logic;
   enb                : in std_logic;
   regceb             : in std_logic;
   web                : in std_logic;  -- (WRITE_DATA_WIDTH_B/BYTE_WRITE_WIDTH_B)-1:0]
   addrb              : in std_logic_vector (ADDR_WIDTH_B-1 downto 0);   -- [ADDR_WIDTH_B-1:0]   
   dinb               : in std_logic_vector (WRITE_DATA_WIDTH_B-1 downto 0);  -- [WRITE_DATA_WIDTH_B-1:0] 
   injectsbiterrb     : in std_logic;
   injectdbiterrb     : in std_logic;
   doutb              : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0);                -- [READ_DATA_WIDTH_B-1:0]  
   sbiterrb           : out std_logic;
   dbiterrb           : out std_logic
  );
end component;


  function calc_cfg_bram_dwidth(awidth : natural) return integer is
    variable dwidth : integer;
  begin
    if(awidth > MAX_BRAM_AWIDTH) then
      -- If required address bitwidth is bigger than possible bitwidth, then we
      -- have to increase depth. In this case, the BRAMs are configured x1.
      dwidth := 1;
    else
      -- bitwidth for data bus is calculated using the following expression:
      dwidth := 2**(MAX_BRAM_AWIDTH-awidth);
      -- assuming that we do not go above max possible bitwidth:
      if(dwidth > MAX_BRAM_DWIDTH) then
        dwidth := MAX_BRAM_DWIDTH;
      end if;
    end if;
    return dwidth;
  end function calc_cfg_bram_dwidth;

  function calc_cfg_bram_awidth(bank_awidth : natural) return integer is
    variable awidth : integer;
  begin
    if(bank_awidth > MAX_BRAM_AWIDTH) then
      -- If bitwidth of address for bank is bigger than max possible BRAM
      -- configuration, we should increase depth. in this case, we use max
      -- bitwidth for BRAMs
      awidth := MAX_BRAM_AWIDTH;
    else
      -- otherwise, we use same bitwidth as the bank, given that it's not less
      -- than the BRAM bitwidth
      if(bank_awidth < MIN_BRAM_AWIDTH) then
        awidth := MIN_BRAM_AWIDTH;
      else
        awidth := bank_awidth;
      end if;
    end if;
    return awidth;
  end function calc_cfg_bram_awidth;

  function calc_col_size(bank_awidth : natural) return integer is
    variable col_size : integer;
  begin
    if(bank_awidth > MAX_BRAM_AWIDTH) then
      col_size := 2**(bank_awidth-MAX_BRAM_AWIDTH);
    else
      col_size := 1;
    end if;
    return col_size;
  end function calc_col_size;

  constant BRAM_CFG_AWIDTH : integer := calc_cfg_bram_awidth(C_BANK_AWIDTH);
  constant BRAM_AWIDTH     : integer := min_size(BRAM_CFG_AWIDTH, C_BANK_AWIDTH);
  constant COL_SIZE        : integer := calc_col_size(C_BANK_AWIDTH);

  constant BRAM_CFG_DWIDTH : integer := calc_cfg_bram_dwidth(BRAM_CFG_AWIDTH);
  constant BRAM_DWIDTH     : integer := min_size(BRAM_CFG_DWIDTH, C_BANK_DWIDTH);
  constant ROW_SIZE        : integer := div_round_up(C_BANK_DWIDTH, BRAM_CFG_DWIDTH);

begin

  ONE_COL_GEN : if (COL_SIZE = 1) generate
    signal   bram_addr_a   : std_logic_vector(15 downto 0);
    signal   bram_addr_b   : std_logic_vector(15 downto 0);
    -- address bus for primitive has a width of MAX_BRAM_AWIDTH+1 bits (15),
    -- but when we use configurations with widths bigger than x1, then LSB's
    -- are not used. In this case, the efective LSB is given by BRAM_CFG_DWIDTH
    -- and efective bitwidth is given by the bank C_BANK_AWIDTH
    constant BRAM_ADDR_LSB : integer := log2(BRAM_CFG_DWIDTH);
    constant BRAM_ADDR_MSB : integer := BRAM_ADDR_LSB+C_BANK_AWIDTH-1;

  begin

    process(addr_a)
    begin
      bram_addr_a                                     <= (others => '0');
      bram_addr_a(BRAM_ADDR_MSB downto BRAM_ADDR_LSB) <= addr_a;
    end process;

    process(addr_b)
    begin
      bram_addr_b                                     <= (others => '0');
      bram_addr_b(BRAM_ADDR_MSB downto BRAM_ADDR_LSB) <= addr_b;
    end process;

    MEM_BANK_GEN : for i in 0 to ROW_SIZE-1 generate
      signal bram_din_a  : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      signal bram_dout_a : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      signal bram_we_a   : std_logic_vector(3 downto 0);

      signal bram_din_b  : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      signal bram_dout_b : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      signal bram_we_b   : std_logic_vector(7 downto 0);

    begin

      -- In the BRAM input port, only BRAM_DWIDTH LS bits are used
      process(din_a)
      begin
        bram_din_a                         <= (others => '0');
        bram_din_a(BRAM_DWIDTH-1 downto 0) <= din_a(BRAM_DWIDTH*(i+1)-1 downto BRAM_DWIDTH*i);
      end process;

      process(din_b)
      begin
        bram_din_b                         <= (others => '0');
        bram_din_b(BRAM_DWIDTH-1 downto 0) <= din_b(BRAM_DWIDTH*(i+1)-1 downto BRAM_DWIDTH*i);
      end process;

      -- same approach is used on output port
      dout_a(BRAM_DWIDTH*(i+1)-1 downto BRAM_DWIDTH*i) <= bram_dout_a(BRAM_DWIDTH-1 downto 0);
      dout_b(BRAM_DWIDTH*(i+1)-1 downto BRAM_DWIDTH*i) <= bram_dout_b(BRAM_DWIDTH-1 downto 0);

      -- we signals are comon; dont support byte-level we signals
      bram_we_a <= (others => we_a);
      bram_we_b <= (others => we_b);

      --------------------------
      -- 7 Series BRAM Primitive
      --------------------------
      BRAM_7_SERIES : if (C_BRAM_TYPE = "7_SERIES") generate
      xpm_mem_gen : if (C_SELECT_XPM = 1) generate
      xpm_memory_inst: xpm_memory_tdpram

       generic map (
          MEMORY_SIZE             => 36864,   --- 36K
          MEMORY_PRIMITIVE        => "blockram",
          CLOCKING_MODE           => "independent_clock",
          ECC_MODE                => "no_ecc",
          MEMORY_INIT_FILE        => "none",
          MEMORY_INIT_PARAM       => "",
          WAKEUP_TIME             => "disable_sleep",
          MESSAGE_CONTROL         =>  1,
    
          WRITE_DATA_WIDTH_A      =>  MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_A       =>  MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_A      =>  MAX_BRAM_DWIDTH,
          ADDR_WIDTH_A            =>  16, 
          READ_RESET_VALUE_A      => "0",
          READ_LATENCY_A          =>  1,
          WRITE_MODE_A            => "read_first",  --READ_FIRST
    
          WRITE_DATA_WIDTH_B      => MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_B       => MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_B      => MAX_BRAM_DWIDTH,
          ADDR_WIDTH_B            =>  16,
          READ_RESET_VALUE_B      => "0",
          READ_LATENCY_B          =>  1,
          WRITE_MODE_B            => "read_first"
          )
          port map (
           -- Common module ports
          sleep                   =>  '0',
        
         -- Port A module ports
          clka                    => clk_a,
          rsta                    => rst, 
          ena                     => ce_a, 
          regcea                  => '1',
          wea                     => we_a,
          addra                   => bram_addr_a,
          dina                    => bram_din_a,
          injectsbiterra          => '0',
          injectdbiterra          => '0',
          douta                   => bram_dout_a,
          sbiterra                => open,
          dbiterra                => open,
        
         -- Port B module ports
          clkb                    => clk_b,
          rstb                    => rst,
          enb                     => ce_b,
          regceb                  => '1',
          web                     => we_b,
          addrb                   => bram_addr_b,
          dinb                    => bram_din_b,
          injectsbiterrb          => '0',
          injectdbiterrb          => '0',
          doutb                   => bram_dout_b,
          sbiterrb                => open,
          dbiterrb                => open
          );
    end generate;

    bram : if (C_SELECT_XPM = 0) generate
      begin
      BRAM_I : RAMB36E1
        generic map (
          SIM_COLLISION_CHECK       => "ALL",  -- Colision check: Values ("ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE")
          RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",  -- "PERFORMANCE" or "DELAYED_WRITE"
          DOA_REG                   => 0,  -- DOA_REG, DOB_REG: Optional output register (0 or 1)
          DOB_REG                   => 0,
          EN_ECC_READ               => false,  -- Error Correction Circuitry (ECC): Encoder/decoder enable (TRUE/FALSE)
          EN_ECC_WRITE              => false,
          INIT_A                    => x"000000000",  -- INIT_A, INIT_B: Initial values on output ports
          INIT_B                    => x"000000000",
          INIT_FILE                 => "NONE",  -- RAM initialization file
          RAM_EXTENSION_A           => "NONE",  -- RAM_EXTENSION_A, RAM_EXTENSION_B: Selects cascade mode ("UPPER", "LOWER", or "NONE")
          RAM_EXTENSION_B           => "NONE",
          RAM_MODE                  => "TDP",  -- "SDP" or "TDP"
          READ_WIDTH_A              => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- READ_WIDTH_A:  0, 1, 2, 4, 9, 18, 36, 72
          WRITE_WIDTH_A             => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- WRITE_WIDTH_A: 0, 1, 2, 4, 9, 18, 36
          READ_WIDTH_B              => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- READ_WIDTH_B:  0, 1, 2, 4, 9, 18, 36
          WRITE_WIDTH_B             => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- WRITE_WIDTH_B: 0, 1, 2, 4, 9, 18, 36, 72
          RSTREG_PRIORITY_A         => "REGCE",  -- RSTREG_PRIORITY_A, RSTREG_PRIORITY_B: Reset or enable priority ("RSTREG" or "REGCE")
          RSTREG_PRIORITY_B         => "REGCE",
          SRVAL_A                   => x"000000000",  -- SRVAL_A, SRVAL_B: Set/reset value for output
          SRVAL_B                   => x"000000000",
          WRITE_MODE_A              => "READ_FIRST",  -- WriteMode: Value on output upon a write ("WRITE_FIRST", "READ_FIRST", or "NO_CHANGE")
          WRITE_MODE_B              => "READ_FIRST")
        port map (
          -- ECC Signals: 1-bit (each) output Error Correction Circuitry ports
          INJECTDBITERR => '0',  -- 1-bit input Inject a double bit error
          INJECTSBITERR => '0',  -- 1-bit input Inject a single bit error
          DBITERR       => open,  -- 1-bit output double bit error status output
          ECCPARITY     => open,  -- 8-bit output generated error correction parity
          RDADDRECC     => open,        -- 9-bit output ECC read address
          SBITERR       => open,  -- 1-bit output Single bit error status output
          CASCADEINA    => '0',         -- 1-bit input A port cascade input
          CASCADEOUTA   => open,        -- 1-bit output A port cascade output
          DIADI         => bram_din_a,  -- 32-bit input A port data/LSB data input
          DIPADIP       => x"0",  -- 4-bit input A port parity/LSB parity input
          DOADO         => bram_dout_a,  -- 32-bit output A port data/LSB data output
          DOPADOP       => open,  -- 4-bit output A port parity/LSB parity output
          ADDRARDADDR   => bram_addr_a,  -- 16-bit input A port address/Read address input
          CLKARDCLK     => clk_a,  -- 1-bit input A port clock/Read clock input
          ENARDEN       => ce_a,  -- 1-bit input A port enable/Read enable input
          REGCEAREGCE   => '1',  -- 1-bit input A port register enable/Register enable input
          RSTRAMARSTRAM => rst,         -- 1-bit input A port set/reset input
          RSTREGARSTREG => '0',  -- 1-bit input A port register set/reset input
          WEA           => bram_we_a,  -- 4-bit input A port write enable input
          CASCADEINB    => '0',         -- 1-bit input B port cascade input
          CASCADEOUTB   => open,        -- 1-bit output B port cascade output
          DIBDI         => bram_din_b,  -- 32-bit input B port data/MSB data input
          DIPBDIP       => x"0",  -- 4-bit input B port parity/MSB parity input
          DOBDO         => bram_dout_b,  -- 32-bit output B port data/MSB data output
          DOPBDOP       => open,  -- 4-bit output B port parity/MSB parity output
          ADDRBWRADDR   => bram_addr_b,  -- 16-bit input B port address/Write address input
          CLKBWRCLK     => clk_b,  -- 1-bit input B port clock/Write clock input
          ENBWREN       => ce_b,  -- 1-bit input B port enable/Write enable input
          REGCEB        => '1',  -- 1-bit input B port register enable input
          RSTRAMB       => rst,  -- Reset del latch de salida de la memoria (1 bit)
          RSTREGB       => '0',  -- Reset del registro opcional de salida (1 bit)
          --WEBWE         => x"FF");          -- 8-bit input B port write enable/Write enable input
          WEBWE         => bram_we_b);  -- 8-bit input B port write enable/Write enable input
        end generate;
    end generate BRAM_7_SERIES;
    
      --------------------------
      -- 8 Series BRAM Primitive
      --------------------------
   BRAM_8_SERIES : if (C_BRAM_TYPE = "ULTRASCALE") generate
      xpm_mem_gen : if (C_SELECT_XPM = 1 ) generate
      xpm_memory_inst: xpm_memory_tdpram
    generic map (
          MEMORY_SIZE             => 36864,   --- 36K
          MEMORY_PRIMITIVE        => "blockram",
          CLOCKING_MODE           => "independent_clock",
          ECC_MODE                => "no_ecc",
          MEMORY_INIT_FILE        => "none",
          MEMORY_INIT_PARAM       => "",
          WAKEUP_TIME             => "disable_sleep",
          MESSAGE_CONTROL         =>  1,
    
          WRITE_DATA_WIDTH_A      => MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_A       => MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_A      => MAX_BRAM_DWIDTH,
          ADDR_WIDTH_A            => 15, 
          READ_RESET_VALUE_A      => "0",
          READ_LATENCY_A          => 1,
          WRITE_MODE_A            => "read_first",  
    
          WRITE_DATA_WIDTH_B      => MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_B       => MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_B      => MAX_BRAM_DWIDTH,
          ADDR_WIDTH_B            => 15,
          READ_RESET_VALUE_B      => "0",
          READ_LATENCY_B          => 1,
          WRITE_MODE_B            => "read_first"
          )
          port map (
           -- Common module ports
          sleep                   =>  '0',
        
         -- Port A module ports
          clka                    => clk_a,
          rsta                    => rst, 
          ena                     => ce_a, 
          regcea                  => '1',
          wea                     => we_a,
          addra                   => bram_addr_a(14 downto 0),
          dina                    => bram_din_a,
          injectsbiterra          => '0',
          injectdbiterra          => '0',
          douta                   => bram_dout_a,
          sbiterra                => open,
          dbiterra                => open,
        
         -- Port B module ports
          clkb                    => clk_b,
          rstb                    => rst,
          enb                     => ce_b,
          regceb                  => '1',
          web                     => we_b,
          addrb                   => bram_addr_b(14 downto 0),
          dinb                    => bram_din_b,
          injectsbiterrb          => '0',
          injectdbiterrb          => '0',
          doutb                   => bram_dout_b,
          sbiterrb                => open,
          dbiterrb                => open
          );
    end generate;

    bram : if (C_SELECT_XPM = 0) generate
      begin
 
       BRAM_I: RAMB36E2
         GENERIC MAP (
           CASCADE_ORDER_A      => "NONE",
           CASCADE_ORDER_B      => "NONE",
           CLOCK_DOMAINS        => "INDEPENDENT",
           DOA_REG              => 0, -- DOA_REG, DOB_REG: Optional output register (0 or 1)
           DOB_REG              => 0,
           ENADDRENA            => "FALSE",
           ENADDRENB            => "FALSE",
           EN_ECC_PIPE          => "FALSE",
           EN_ECC_READ          => "FALSE",
           EN_ECC_WRITE         => "FALSE",
           INIT_A               => X"000000000",
           INIT_B               => X"000000000",
           INIT_FILE            => "NONE",   -- RAM initialization file
           RDADDRCHANGEA        => "FALSE",
           RDADDRCHANGEB        => "FALSE",
           READ_WIDTH_A         => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- READ_WIDTH_A:  0, 1, 2, 4, 9, 18, 36, 72,
           READ_WIDTH_B         => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- READ_WIDTH_B:  0, 1, 2, 4, 9, 18, 36,
           RSTREG_PRIORITY_A    => "REGCE",
           RSTREG_PRIORITY_B    => "REGCE",
           SIM_COLLISION_CHECK  => "ALL",
           SLEEP_ASYNC          => "FALSE",
           SRVAL_A              => X"000000000",  -- SRVAL_A, SRVAL_B: Set/reset value for output,
           SRVAL_B              => X"000000000",
           WRITE_MODE_A         => "READ_FIRST",  -- WriteMode: Value on output upon a write ("WRITE_FIRST", "READ_FIRST", or "NO_CHANGE"),
           WRITE_MODE_B         => "READ_FIRST",
           WRITE_WIDTH_A        => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- WRITE_WIDTH_A: 0, 1, 2, 4, 9, 18, 36,
           WRITE_WIDTH_B        => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8)  -- WRITE_WIDTH_B: 0, 1, 2, 4, 9, 18, 36, 72
         )
         PORT MAP (
           CASDOUTA         => open,
           CASDOUTB         => open,
           CASDOUTPA        => open,
           CASDOUTPB        => open,
           CASOUTDBITERR    => open, 
           CASOUTSBITERR    => open, 
           DBITERR          => open,
           DOUTADOUT        => bram_dout_a,  -- 32-bit output A port data/LSB data output
           DOUTBDOUT        => bram_dout_b,  -- 32-bit output B port data/MSB data output
           DOUTPADOUTP      => open,
           DOUTPBDOUTP      => open,
           ECCPARITY        => open,
           RDADDRECC        => open,
           SBITERR          => open,
           ADDRARDADDR      => bram_addr_a(14 downto 0), -- 16-bit input A port address/Read address input
           ADDRBWRADDR      => bram_addr_b(14 downto 0),  -- 16-bit input B port address/Write address input
           ADDRENA          => '0',
           ADDRENB          => '0',
           CASDIMUXA        => '0',
           CASDIMUXB        => '0',
           CASDOMUXEN_A     => '0',
           CASDOMUXEN_B     => '0',
           CASOREGIMUXEN_A  => '0',
           CASOREGIMUXEN_B  => '0',
           CASDINA          => (OTHERS => '0'),
           CASDINB          => (OTHERS => '0'),
           CASDINPA         => (OTHERS => '0'),
           CASDINPB         => (OTHERS => '0'),
           CASDOMUXA        => '0',
           CASDOMUXB        => '0',
           CASINDBITERR     => '0',
           CASINSBITERR     => '0',
           CASOREGIMUXA     => '0',
           CASOREGIMUXB     => '0',
           CLKARDCLK        => clk_a,
           CLKBWRCLK        => clk_b,
           DINADIN          => bram_din_a,  -- 32-bit input A port data/LSB data input
           DINBDIN          => bram_din_b,  -- 32-bit input B port data/MSB data input
           DINPADINP        => x"0",  -- 4-bit input A port parity/LSB parity input,
           DINPBDINP        => x"0",  -- 4-bit input B port parity/MSB parity input
           ECCPIPECE        => '0',
           ENARDEN          => ce_a,  -- 1-bit input A port enable/Read enable input
           ENBWREN          => ce_b,  -- 1-bit input B port enable/Write enable input
           INJECTDBITERR    => '0',
           INJECTSBITERR    => '0',
           REGCEAREGCE      => '1',
           REGCEB           => '1',
           RSTRAMARSTRAM    => rst,
           RSTRAMB          => rst,
           RSTREGARSTREG    => '0',
           RSTREGB          => '0',
           SLEEP            => '0', 
           WEA              => bram_we_a,  -- 4-bit input A port write enable input
           WEBWE            => bram_we_b  -- 8-bit input B port write enable/Write enable input
         );
        end generate;
    end generate BRAM_8_SERIES;

 
 
  end generate MEM_BANK_GEN;

  end generate ONE_COL_GEN;

  DEPTH_EXPANSION_GEN : if (COL_SIZE > 1) generate
    constant BRAM_ADDR_LSB : integer := log2(BRAM_CFG_DWIDTH);
    constant BRAM_ADDR_MSB : integer := BRAM_ADDR_LSB+C_BANK_AWIDTH-1;
    constant WORD_AWIDTH   : integer := log2(COL_SIZE);
    constant ADDR_LSB      : integer := 0;
    constant ADDR_MSB      : integer := MAX_BRAM_AWIDTH-1;
    constant BRAM_SEL_LSB  : integer := ADDR_MSB+1;
    constant BRAM_SEL_MSB  : integer := C_BANK_AWIDTH-1;

    signal bram_addr_a     : std_logic_vector(15 downto 0);
    signal bram_addr_b     : std_logic_vector(15 downto 0);
    signal bram_ce_a       : std_logic_vector(COL_SIZE-1 downto 0);
    signal bram_ce_b       : std_logic_vector(COL_SIZE-1 downto 0);
    signal bram_sel_addr_a : std_logic_vector(WORD_AWIDTH-1 downto 0);
    signal bram_sel_addr_b : std_logic_vector(WORD_AWIDTH-1 downto 0);

  begin

    -- we use WORD_AWIDTH MS bits to select the BRAM inside a column
    process(addr_a, ce_a)
    begin
      bram_ce_a <= (others => '0');
      if (ce_a = '1') then
        for i in 0 to COL_SIZE-1 loop
          if (unsigned(addr_a(BRAM_SEL_MSB downto BRAM_SEL_LSB)) = i) then
            bram_ce_a(i) <= '1';
          end if;
        end loop;
      end if;
    end process;

    process(addr_b, ce_b)
    begin
      bram_ce_b <= (others => '0');
      if (ce_b = '1') then
        for i in 0 to COL_SIZE-1 loop
          if (unsigned(addr_b(BRAM_SEL_MSB downto BRAM_SEL_LSB)) = i) then
            bram_ce_b(i) <= '1';
          end if;
        end loop;
      end if;
    end process;

    -- This set of bits have to be registered to generate the selection signal
    -- on the mux's in the output datapath
    process(clk_a)
    begin
      if (clk_a'event and clk_a = '1') then
        if (ce_a = '1') then
          bram_sel_addr_a <= addr_a(BRAM_SEL_MSB downto BRAM_SEL_LSB);
        end if;
      end if;
    end process;

    process(clk_b)
    begin
      if (clk_b'event and clk_b = '1') then
        if (ce_b = '1') then
          bram_sel_addr_b <= addr_b(BRAM_SEL_MSB downto BRAM_SEL_LSB);
        end if;
      end if;
    end process;

    -- In this case, given that it is a depth increase, we use all width for
    -- address bus on BRAMs

    process(addr_a)
    begin
      bram_addr_a                             <= (others => '0');
      bram_addr_a(MAX_BRAM_AWIDTH-1 downto 0) <= addr_a(MAX_BRAM_AWIDTH-1 downto 0);
    end process;

    process(addr_b)
    begin
      bram_addr_b                             <= (others => '0');
      bram_addr_b(MAX_BRAM_AWIDTH-1 downto 0) <= addr_b(MAX_BRAM_AWIDTH-1 downto 0);
    end process;

    MEM_BANK_GEN : for i in 0 to ROW_SIZE-1 generate
      signal bram_din_a : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      signal bram_we_a  : std_logic_vector(3 downto 0);
      signal bram_din_b : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      signal bram_we_b  : std_logic_vector(7 downto 0);
      -- These "superbusses" represent all data busses at the output of all
      -- BRAM's in the same column. In reality, BRAM_DWIDTH is always 1.
      signal col_dout_a : std_logic_vector(COL_SIZE*BRAM_DWIDTH-1 downto 0);
      signal col_dout_b : std_logic_vector(COL_SIZE*BRAM_DWIDTH-1 downto 0);

    begin

      -- In each BRAM column, the input data is applied in parallel to all
      -- BRAMs. we only use BRAM_DWIDTH LS bits:
      process(din_a)
      begin
        bram_din_a                         <= (others => '0');
        bram_din_a(BRAM_DWIDTH-1 downto 0) <= din_a(BRAM_DWIDTH*(i+1)-1 downto BRAM_DWIDTH*i);
      end process;

      process(din_b)
      begin
        bram_din_b                         <= (others => '0');
        bram_din_b(BRAM_DWIDTH-1 downto 0) <= din_b(BRAM_DWIDTH*(i+1)-1 downto BRAM_DWIDTH*i);
      end process;

      -- mux's on output busses on the same column
      process(col_dout_a, bram_sel_addr_a)
        variable mux_dout : std_logic_vector(BRAM_DWIDTH-1 downto 0);
      begin
        mux_dout := (others => '0');
        for k in 0 to COL_SIZE-1 loop
          if (unsigned(bram_sel_addr_a) = k) then
            mux_dout := col_dout_a(BRAM_DWIDTH*(k+1)-1 downto BRAM_DWIDTH*k);
          end if;
        end loop;
        dout_a(BRAM_DWIDTH*(i+1)-1 downto BRAM_DWIDTH*i) <= mux_dout;
      end process;

      process(col_dout_b, bram_sel_addr_b)
        variable mux_dout : std_logic_vector(BRAM_DWIDTH-1 downto 0);
      begin
        mux_dout := (others => '0');
        for k in 0 to COL_SIZE-1 loop
          if (unsigned(bram_sel_addr_b) = k) then
            mux_dout := col_dout_b(BRAM_DWIDTH*(k+1)-1 downto BRAM_DWIDTH*k);
          end if;
        end loop;
        dout_b(BRAM_DWIDTH*(i+1)-1 downto BRAM_DWIDTH*i) <= mux_dout;
      end process;

      -- not supported byte-level we signals. All bystes written at the same time.
      bram_we_a <= (others => we_a);
      bram_we_b <= (others => we_b);

      BRAM_COL_GEN : for k in 0 to COL_SIZE-1 generate
        signal bram_dout_a : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
        signal bram_dout_b : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      begin

        -- this superbus groups all datapath at memory outputs
        col_dout_a(BRAM_DWIDTH*(k+1)-1 downto BRAM_DWIDTH*k) <= bram_dout_a(BRAM_DWIDTH-1 downto 0);
        col_dout_b(BRAM_DWIDTH*(k+1)-1 downto BRAM_DWIDTH*k) <= bram_dout_b(BRAM_DWIDTH-1 downto 0);

      --------------------------
      -- 7 Series BRAM Primitive
      --------------------------

      BRAM_7_SERIES : if (C_BRAM_TYPE = "7_SERIES") generate
            xpm_mem_gen : if (C_SELECT_XPM = 1) generate
      xpm_memory_inst: xpm_memory_tdpram

       generic map (
          MEMORY_SIZE             => 36864,   --- 36K
          MEMORY_PRIMITIVE        => "blockram",
          CLOCKING_MODE           => "independent_clock",
          ECC_MODE                => "no_ecc",
          MEMORY_INIT_FILE        => "none",
          MEMORY_INIT_PARAM       => "",
          WAKEUP_TIME             => "disable_sleep",
          MESSAGE_CONTROL         =>  0,
    
          WRITE_DATA_WIDTH_A      => MAX_BRAM_DWIDTH, 
          READ_DATA_WIDTH_A       => MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_A      => MAX_BRAM_DWIDTH,
          ADDR_WIDTH_A            =>  16, 
          READ_RESET_VALUE_A      => "0",
          READ_LATENCY_A          =>  1,
          WRITE_MODE_A            => "read_first",  --READ_FIRST
    
          WRITE_DATA_WIDTH_B      => MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_B       => MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_B      => MAX_BRAM_DWIDTH,
          ADDR_WIDTH_B            =>  16,
          READ_RESET_VALUE_B      => "0",
          READ_LATENCY_B          =>  1,
          WRITE_MODE_B            => "read_first"
          )
          port map (
           -- Common module ports
          sleep                   =>  '0',
        
         -- Port A module ports
          clka                    => clk_a,
          rsta                    => rst, 
          ena                     => bram_ce_a(k), 
          regcea                  => '1',
          wea                     => we_a,
          addra                   => bram_addr_a,
          dina                    => bram_din_a,
          injectsbiterra          => '0',
          injectdbiterra          => '0',
          douta                   => bram_dout_a,
          sbiterra                => open,
          dbiterra                => open,
        
         -- Port B module ports
          clkb                    => clk_b,
          rstb                    => rst,
          enb                     => ce_b,
          regceb                  => '1',
          web                     => we_b,
          addrb                   => bram_addr_b,
          dinb                    => bram_din_b,
          injectsbiterrb          => '0',
          injectdbiterrb          => '0',
          doutb                   => bram_dout_b,
          sbiterrb                => open,
          dbiterrb                => open
          );
    end generate;


    bram_361 : if (C_SELECT_XPM = 0) generate
      begin

        BRAM_I : RAMB36E1
          generic map (
            SIM_COLLISION_CHECK       => "ALL",  -- Colision check: Values ("ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE")
            RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",  -- "PERFORMANCE" or "DELAYED_WRITE"
            DOA_REG                   => 0,  -- DOA_REG, DOB_REG: Optional output register (0 or 1)
            DOB_REG                   => 0,
            EN_ECC_READ               => false,  -- Error Correction Circuitry (ECC): Encoder/decoder enable (TRUE/FALSE)
            EN_ECC_WRITE              => false,
            INIT_A                    => x"000000000",  -- INIT_A, INIT_B: Initial values on output ports
            INIT_B                    => x"000000000",
            INIT_FILE                 => "NONE",  -- RAM initialization file
            RAM_EXTENSION_A           => "NONE",  -- RAM_EXTENSION_A, RAM_EXTENSION_B: Selects cascade mode ("UPPER", "LOWER", or "NONE")
            RAM_EXTENSION_B           => "NONE",
            RAM_MODE                  => "TDP",  -- "SDP" or "TDP"
            READ_WIDTH_A              => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- READ_WIDTH_A:  0, 1, 2, 4, 9, 18, 36, 72
            WRITE_WIDTH_A             => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- WRITE_WIDTH_A: 0, 1, 2, 4, 9, 18, 36
            READ_WIDTH_B              => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- READ_WIDTH_B:  0, 1, 2, 4, 9, 18, 36
            WRITE_WIDTH_B             => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- WRITE_WIDTH_B: 0, 1, 2, 4, 9, 18, 36, 72
            RSTREG_PRIORITY_A         => "REGCE",  -- RSTREG_PRIORITY_A, RSTREG_PRIORITY_B: Reset or enable priority ("RSTREG" or "REGCE")
            RSTREG_PRIORITY_B         => "REGCE",
            SRVAL_A                   => x"000000000",  -- SRVAL_A, SRVAL_B: Set/reset value for output
            SRVAL_B                   => x"000000000",
            WRITE_MODE_A              => "READ_FIRST",  -- WriteMode: Value on output upon a write ("WRITE_FIRST", "READ_FIRST", or "NO_CHANGE")
            WRITE_MODE_B              => "READ_FIRST")
          port map (
            -- ECC Signals: 1-bit (each) output Error Correction Circuitry ports
            INJECTDBITERR => '0',  -- 1-bit input Inject a double bit error
            INJECTSBITERR => '0',  -- 1-bit input Inject a single bit error
            DBITERR       => open,  -- 1-bit output double bit error status output
            ECCPARITY     => open,  -- 8-bit output generated error correction parity
            RDADDRECC     => open,      -- 9-bit output ECC read address
            SBITERR       => open,  -- 1-bit output Single bit error status output
            CASCADEINA    => '0',       -- 1-bit input A port cascade input
            CASCADEOUTA   => open,      -- 1-bit output A port cascade output
            DIADI         => bram_din_a,  -- 32-bit input A port data/LSB data input
            DIPADIP       => x"0",  -- 4-bit input A port parity/LSB parity input
            DOADO         => bram_dout_a,  -- 32-bit output A port data/LSB data output
            DOPADOP       => open,  -- 4-bit output A port parity/LSB parity output
            ADDRARDADDR   => bram_addr_a,  -- 16-bit input A port address/Read address input
            CLKARDCLK     => clk_a,  -- 1-bit input A port clock/Read clock input
            ENARDEN       => bram_ce_a(k),  -- 1-bit input A port enable/Read enable input
            REGCEAREGCE   => '1',  -- 1-bit input A port register enable/Register enable input
            RSTRAMARSTRAM => rst,       -- 1-bit input A port set/reset input
            RSTREGARSTREG => '0',  -- 1-bit input A port register set/reset input
            WEA           => bram_we_a,  -- 4-bit input A port write enable input
            CASCADEINB    => '0',       -- 1-bit input B port cascade input
            CASCADEOUTB   => open,      -- 1-bit output B port cascade output
            DIBDI         => bram_din_b,  -- 32-bit input B port data/MSB data input
            DIPBDIP       => x"0",  -- 4-bit input B port parity/MSB parity input
            DOBDO         => bram_dout_b,  -- 32-bit output B port data/MSB data output
            DOPBDOP       => open,  -- 4-bit output B port parity/MSB parity output
            ADDRBWRADDR   => bram_addr_b,  -- 16-bit input B port address/Write address input
            CLKBWRCLK     => clk_b,  -- 1-bit input B port clock/Write clock input
            ENBWREN       => bram_ce_b(k),  -- 1-bit input B port enable/Write enable input
            REGCEB        => '1',  -- 1-bit input B port register enable input
            RSTRAMB       => rst,  -- Reset del latch de salida de la memoria (1 bit)
            RSTREGB       => '0',  -- Reset del registro opcional de salida (1 bit)
            WEBWE         => bram_we_b);  -- 8-bit input B port write enable/Write enable input
        end generate;
   end generate BRAM_7_SERIES;


      --------------------------
      -- 8 Series BRAM Primitive
      --------------------------
      BRAM_8_SERIES : if (C_BRAM_TYPE = "ULTRASCALE") generate
      xpm_mem_gen : if (C_SELECT_XPM = 1) generate
      xpm_memory_inst: xpm_memory_tdpram

       generic map (
          MEMORY_SIZE             => 36864,   --- 36K
          MEMORY_PRIMITIVE        => "blockram",
          CLOCKING_MODE           => "independent_clock",
          ECC_MODE                => "no_ecc",
          MEMORY_INIT_FILE        => "none",
          MEMORY_INIT_PARAM       => "",
          WAKEUP_TIME             => "disable_sleep",
          MESSAGE_CONTROL         =>  1,
    
          WRITE_DATA_WIDTH_A      =>  MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_A       =>  MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_A      =>  MAX_BRAM_DWIDTH,
          ADDR_WIDTH_A            =>  15, 
          READ_RESET_VALUE_A      => "0",
          READ_LATENCY_A          =>  1,
          WRITE_MODE_A            => "read_first",  --READ_FIRST
    
          WRITE_DATA_WIDTH_B      => MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_B       => MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_B      => MAX_BRAM_DWIDTH,
          ADDR_WIDTH_B            =>  15,
          READ_RESET_VALUE_B      => "0",
          READ_LATENCY_B          =>  1,
          WRITE_MODE_B            => "read_first"
          )
          port map (
           -- Common module ports
          sleep                   =>  '0',
        
         -- Port A module ports
          clka                    => clk_a,
          rsta                    => rst, 
          ena                     => bram_ce_a(k), 
          regcea                  => '1',
          wea                     => we_a,
          addra                   => bram_addr_a(14 downto 0),
          dina                    => bram_din_a,
          injectsbiterra          => '0',
          injectdbiterra          => '0',
          douta                   => bram_dout_a,
          sbiterra                => open,
          dbiterra                => open,
        
         -- Port B module ports
          clkb                    => clk_b,
          rstb                    => rst,
          enb                     => bram_ce_b(k),
          regceb                  => '1',
          web                     => we_b,
          addrb                   => bram_addr_b(14 downto 0),
          dinb                    => bram_din_b,
          injectsbiterrb          => '0',
          injectdbiterrb          => '0',
          doutb                   => bram_dout_b,
          sbiterrb                => open,
          dbiterrb                => open
          );
    end generate;

    bram_361 : if (C_SELECT_XPM = 0) generate

      begin

      BRAM_I: RAMB36E2
        GENERIC MAP (
          CASCADE_ORDER_A => "NONE",
          CASCADE_ORDER_B => "NONE",
          CLOCK_DOMAINS   => "INDEPENDENT",
          DOA_REG      => 0, -- DOA_REG, DOB_REG: Optional output register (0 or 1)
          DOB_REG      => 0,
          ENADDRENA    => "FALSE",
          ENADDRENB    => "FALSE",
          EN_ECC_PIPE  => "FALSE",
          EN_ECC_READ  => "FALSE",
          EN_ECC_WRITE => "FALSE",
          INIT_A       => X"000000000",
          INIT_B       => X"000000000",
          INIT_FILE    => "NONE",   -- RAM initialization file
          RDADDRCHANGEA => "FALSE",
          RDADDRCHANGEB => "FALSE",
          READ_WIDTH_A => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- READ_WIDTH_A:  0, 1, 2, 4, 9, 18, 36, 72,
          READ_WIDTH_B => BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- READ_WIDTH_B:  0, 1, 2, 4, 9, 18, 36,
          RSTREG_PRIORITY_A   => "REGCE",
          RSTREG_PRIORITY_B   => "REGCE",
          SIM_COLLISION_CHECK => "ALL",
          SLEEP_ASYNC => "FALSE",
          SRVAL_A      => X"000000000",  -- SRVAL_A, SRVAL_B: Set/reset value for output,
          SRVAL_B      => X"000000000",
          WRITE_MODE_A => "READ_FIRST",  -- WriteMode: Value on output upon a write ("WRITE_FIRST", "READ_FIRST", or "NO_CHANGE"),
          WRITE_MODE_B => "READ_FIRST",
          WRITE_WIDTH_A=> BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8),  -- WRITE_WIDTH_A: 0, 1, 2, 4, 9, 18, 36,
          WRITE_WIDTH_B=> BRAM_CFG_DWIDTH+(BRAM_CFG_DWIDTH/8)  -- WRITE_WIDTH_B: 0, 1, 2, 4, 9, 18, 36, 72
        )
        PORT MAP (
          CASDOUTA  => open,
          CASDOUTB  => open,
          CASDOUTPA  => open,
          CASDOUTPB  => open,
          CASOUTDBITERR  => open, 
          CASOUTSBITERR  => open, 
          DBITERR      => open,
          DOUTADOUT        => bram_dout_a,  -- 32-bit output A port data/LSB data output
          DOUTBDOUT        => bram_dout_b,  -- 32-bit output B port data/MSB data output
          DOUTPADOUTP      => open,
          DOUTPBDOUTP      => open,
          ECCPARITY    => open,
          RDADDRECC    => open,
          SBITERR      => open,
          ADDRARDADDR  => bram_addr_a(14 downto 0), -- 16-bit input A port address/Read address input
          ADDRBWRADDR  => bram_addr_b(14 downto 0),  -- 16-bit input B port address/Write address input
          ADDRENA => '0',
          ADDRENB => '0',
          CASDIMUXA => '0',
          CASDIMUXB => '0',
          CASDOMUXEN_A => '0',
          CASDOMUXEN_B => '0',
          CASOREGIMUXEN_A => '0',
          CASOREGIMUXEN_B => '0',
          CASDINA   => (OTHERS => '0'),
          CASDINB   => (OTHERS => '0'),
          CASDINPA   => (OTHERS => '0'),
          CASDINPB   => (OTHERS => '0'),
          CASDOMUXA   => '0',
          CASDOMUXB   => '0',
          CASINDBITERR => '0',
          CASINSBITERR => '0',
          CASOREGIMUXA => '0',
          CASOREGIMUXB => '0',
          CLKARDCLK    => clk_a,
          CLKBWRCLK    => clk_b,
          DINADIN        => bram_din_a,  -- 32-bit input A port data/LSB data input
          DINBDIN        => bram_din_b,  -- 32-bit input B port data/MSB data input
          DINPADINP      => x"0",  -- 4-bit input A port parity/LSB parity input,
          DINPBDINP      => x"0",  -- 4-bit input B port parity/MSB parity input
          ECCPIPECE    => '0',
          ENARDEN      => bram_ce_a(k),  -- 1-bit input A port enable/Read enable input
          ENBWREN      => bram_ce_b(k),  -- 1-bit input B port enable/Write enable input
          INJECTDBITERR=> '0',
          INJECTSBITERR=> '0',
          REGCEAREGCE  => '1',
          REGCEB       => '1',
          RSTRAMARSTRAM=> rst,
          RSTRAMB      => rst,
          RSTREGARSTREG=> '0',
          RSTREGB      => '0',
          SLEEP        => '0', 
          WEA          => bram_we_a,  -- 4-bit input A port write enable input
          WEBWE        => bram_we_b  -- 8-bit input B port write enable/Write enable input
        );
         end generate;
        end generate BRAM_8_SERIES;


      end generate BRAM_COL_GEN;

    end generate MEM_BANK_GEN;

  end generate DEPTH_EXPANSION_GEN;

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : dp_bank_sdp_v6.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2012-11-04
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-- 2013-08-25  2.0      pvk     Updated BRAM data input pin correctly when standard SDP mode is used. 
--                              Lower bits mapped to DIBDI in standard SDP. In Extra wide SDP 
--                              configuration, higher 32 bit mapped to DIBDI.
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;

entity dp_bank_sdp_v6 is
  generic (
    C_FAMILY    : string;
    C_BRAM_TYPE : string := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2
    C_SDP_WIDE  : integer;  
    C_SELECT_XPM: integer := 0;
    C_RD_AWIDTH : integer;
    C_RD_DWIDTH : integer;
    C_WR_AWIDTH : integer;
    C_WR_DWIDTH : integer);
  port (
    rst     : in  std_logic;
    wr_clk  : in  std_logic;
    wr_en   : in  std_logic;
    wr_addr : in  std_logic_vector(C_WR_AWIDTH-1 downto 0);
    din     : in  std_logic_vector(C_WR_DWIDTH-1 downto 0);
    rd_clk  : in  std_logic;
    rd_en   : in  std_logic;
    rd_addr : in  std_logic_vector(C_RD_AWIDTH-1 downto 0);
    dout    : out std_logic_vector(C_RD_DWIDTH-1 downto 0));
end dp_bank_sdp_v6;

architecture rtl of dp_bank_sdp_v6 is

  signal bram_din     : std_logic_vector(63 downto 0);
  signal bram_dout    : std_logic_vector(63 downto 0);
  signal bram_wr_addr : std_logic_vector(15 downto 0);
  signal bram_rd_addr : std_logic_vector(15 downto 0);
  signal bram_we      : std_logic_vector(7 downto 0);

  constant USE_RAMB36E1 : boolean  := ((C_WR_DWIDTH = 64 and C_RD_DWIDTH <= 64) or
                                      (C_RD_DWIDTH = 64 and C_WR_DWIDTH <= 64));

  constant USE_RAMB18E1 : boolean  := ((C_WR_DWIDTH = 32 and C_RD_DWIDTH <= 32) or
                                      (C_RD_DWIDTH = 32 and C_WR_DWIDTH <= 32));
  component  xpm_memory_sdpram
  generic (
  MEMORY_SIZE        : integer   := 2048;
  MEMORY_PRIMITIVE   : string    := "auto";
  CLOCKING_MODE      : string    := "common_clock";
  ECC_MODE           : string    := "no_ecc";
  MEMORY_INIT_FILE   : string    := "none";
  MEMORY_INIT_PARAM  : string    := "";
  USE_MEM_INIT       : integer   := 0;
  WAKEUP_TIME        : string    := "disable_sleep";
  AUTO_SLEEP_TIME    : integer   := 0;
  MESSAGE_CONTROL    : integer   := 1;

  -- Port A module parameters
  WRITE_DATA_WIDTH_A : integer   := 32;
  BYTE_WRITE_WIDTH_A : integer   := 32;
  ADDR_WIDTH_A       : integer   := 32;

  -- Port B module parameters
  READ_DATA_WIDTH_B  : integer   := 32;
  ADDR_WIDTH_B       : integer   := 32;
  READ_RESET_VALUE_B : string    := "0";
  READ_LATENCY_B     : integer   := 2;
  WRITE_MODE_B       : string    := "no_change"
   );
   port (

  -- Common module ports

   sleep              : in std_logic;

  -- Port A module ports
   clka               : in std_logic;
   ena                : in std_logic;
   wea                : in std_logic;  
   addra              : in std_logic_vector (ADDR_WIDTH_A-1 downto 0);  -- [ADDR_WIDTH_A-1:0]   
   dina               : in std_logic_vector (WRITE_DATA_WIDTH_A-1  downto 0);  -- [WRITE_DATA_WIDTH_A-1:0] 
   injectsbiterra     : in std_logic;
   injectdbiterra     : in std_logic;

  -- Port B module ports
   clkb               : in std_logic;
   rstb               : in std_logic;
   enb                : in std_logic;
   regceb             : in std_logic;
   addrb              : in std_logic_vector (ADDR_WIDTH_B-1 downto 0);   -- [ADDR_WIDTH_B-1:0]   
   doutb              : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0);                -- [READ_DATA_WIDTH_B-1:0]  
   sbiterrb           : out std_logic;
   dbiterrb           : out std_logic
   );
  end component;

   
  begin  
  PORT_64_GEN : if USE_RAMB36E1 generate
  begin

    process(wr_addr)
      constant ADDR_LSB : integer := log2(C_WR_DWIDTH);
      constant ADDR_MSB : integer := ADDR_LSB+C_WR_AWIDTH-1;
    begin
      bram_wr_addr                           <= (others => '0');
      bram_wr_addr(ADDR_MSB downto ADDR_LSB) <= wr_addr;
    end process;

    process(rd_addr)
      constant ADDR_LSB : integer := log2(C_RD_DWIDTH);
      constant ADDR_MSB : integer := ADDR_LSB+C_RD_AWIDTH-1;
    begin
      bram_rd_addr                           <= (others => '0');
      bram_rd_addr(ADDR_MSB downto ADDR_LSB) <= rd_addr;
    end process;


        SDP_EXTRA_WIDE_GEN : if C_SDP_WIDE = 1 generate
        begin

          bram_din(C_WR_DWIDTH-1 downto 0) <= din;
          bram_din(63 downto C_WR_DWIDTH)  <= (others => '0');
        end generate SDP_EXTRA_WIDE_GEN;


        SDP_STD_GEN : if C_SDP_WIDE = 0 generate
        begin

          bram_din(32+C_WR_DWIDTH-1 downto 32) <= din;
          bram_din(C_WR_DWIDTH-1 downto 0)     <= din;
          bram_din(31 downto C_WR_DWIDTH)      <= (others => '0');
          bram_din(63 downto 32+C_WR_DWIDTH)   <= (others => '0');
          
        end generate SDP_STD_GEN;

 --   process(din)
 --   begin
 --     bram_din                         <= (others => '0');
 --     bram_din(C_WR_DWIDTH-1 downto 0) <= din;
 --   end process;

    dout <= bram_dout(C_RD_DWIDTH-1 downto 0);

    -- Port A: read
    -- Port B: write

      --------------------------
      -- 7 Series BRAM Primitive
      --------------------------
      BRAM_7_SERIES : if (C_BRAM_TYPE = "7_SERIES") generate
      xpm_mem_gen : if (C_SELECT_XPM = 1) generate
      xpm_memory_inst: xpm_memory_sdpram
      generic map (
       MEMORY_SIZE                => 36864,     --- 36K
       MEMORY_PRIMITIVE           => "blockram",
       CLOCKING_MODE              => "independent_clock",
       ECC_MODE                   => "no_ecc",
       MEMORY_INIT_FILE           => "none",
       MEMORY_INIT_PARAM          => "",
       USE_MEM_INIT               => 0,
       WAKEUP_TIME                => "disable_sleep",
       AUTO_SLEEP_TIME            => 0,
       MESSAGE_CONTROL            => 1,
     
       -- Port A module parameters
       WRITE_DATA_WIDTH_A         => 64,
       BYTE_WRITE_WIDTH_A         => 64,
       ADDR_WIDTH_A               => 16,
     
       -- Port B module parameters
       READ_DATA_WIDTH_B          => 64,
       ADDR_WIDTH_B               => 16,
       READ_RESET_VALUE_B         => "0",
       READ_LATENCY_B             => 1,
       WRITE_MODE_B               => "read_first"
       )
       port map (
       -- Common module ports
        sleep                     => '0',
     
       -- Port A module ports, For BMG write and read ports are swapped
        clka                      => wr_clk,
        ena                       => '1',
        wea                       => wr_en,
        addra                     => bram_wr_addr,
        dina                      => bram_din,
        injectsbiterra            => '0',
        injectdbiterra            => '0',
     
       -- Port B module ports
        clkb                      => rd_clk,
        rstb                      => rst,
        enb                       => rd_en,
        regceb                    => '1',
        addrb                     => bram_rd_addr,
        doutb                     => bram_dout,
        sbiterrb                  => open,
        dbiterrb                  => open
      ); 
      end generate;
      
      bram : if (C_SELECT_XPM = 0) generate
        BRAM_I : RAMB36E1
          generic map (
        SIM_COLLISION_CHECK       => "ALL",  -- Colision check: Values ("ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE")      
        RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",  -- "PERFORMANCE" or "DELAYED_WRITE" 
        DOA_REG                   => 0,  -- DOA_REG, DOB_REG: Optional output register (0 or 1)
        DOB_REG                   => 0,
        EN_ECC_READ               => false,  -- Error Correction Circuitry (ECC): Encoder/decoder enable (TRUE/FALSE)
        EN_ECC_WRITE              => false,
        INIT_A                    => x"000000000",  -- INIT_A, INIT_B: Initial values on output ports
        INIT_B                    => x"000000000",
        INIT_FILE                 => "NONE",  -- RAM initialization file
        RAM_EXTENSION_A           => "NONE",  -- RAM_EXTENSION_A, RAM_EXTENSION_B: Selects cascade mode ("UPPER", "LOWER", or "NONE")
        RAM_EXTENSION_B           => "NONE",
        RAM_MODE                  => "SDP",  -- "SDP" or "TDP" 
        READ_WIDTH_A              => C_RD_DWIDTH+(C_RD_DWIDTH/8),  -- READ_WIDTH_A:  0, 1, 2, 4, 9, 18, 36, 72
        WRITE_WIDTH_A             => 0,  -- WRITE_WIDTH_A: 0, 1, 2, 4, 9, 18, 36
        READ_WIDTH_B              => 0,  -- READ_WIDTH_B:  0, 1, 2, 4, 9, 18, 36
        WRITE_WIDTH_B             => C_WR_DWIDTH+(C_WR_DWIDTH/8),  -- WRITE_WIDTH_B: 0, 1, 2, 4, 9, 18, 36, 72
        RSTREG_PRIORITY_A         => "REGCE",  -- RSTREG_PRIORITY_A, RSTREG_PRIORITY_B: Reset or enable priority ("RSTREG" or "REGCE")
        RSTREG_PRIORITY_B         => "REGCE",
        SRVAL_A                   => x"000000000",  -- SRVAL_A, SRVAL_B: Set/reset value for output
        SRVAL_B                   => x"000000000",
        WRITE_MODE_A              => "READ_FIRST",  -- WriteMode: Value on output upon a write ("WRITE_FIRST", "READ_FIRST", or "NO_CHANGE")
        WRITE_MODE_B              => "READ_FIRST")
          port map (
        -- ECC Signals: 1-bit (each) output Error Correction Circuitry ports
        INJECTDBITERR => '0',  -- 1-bit input Inject a double bit error
        INJECTSBITERR => '0',  -- 1-bit input Inject a single bit error
        DBITERR       => open,  -- 1-bit output double bit error status output
        ECCPARITY     => open,  -- 8-bit output generated error correction parity
        RDADDRECC     => open,          -- 9-bit output ECC read address
        SBITERR       => open,  -- 1-bit output Single bit error status output
        CASCADEINA    => '0',           -- 1-bit input A port cascade input
        CASCADEOUTA   => open,          -- 1-bit output A port cascade output
        DIADI         => bram_din(31 downto 0),  -- 32-bit input A port data/LSB data input
        DIPADIP       => x"0",  -- 4-bit input A port parity/LSB parity input
        DOADO         => bram_dout(31 downto 0),  -- 32-bit output A port data/LSB data output
        DOPADOP       => open,  -- 4-bit output A port parity/LSB parity output
        ADDRARDADDR   => bram_rd_addr,  -- 16-bit input A port address/Read address input
        CLKARDCLK     => rd_clk,  -- 1-bit input A port clock/Read clock input
        ENARDEN       => rd_en,  -- 1-bit input A port enable/Read enable input
        REGCEAREGCE   => '1',  -- 1-bit input A port register enable/Register enable input
        RSTRAMARSTRAM => rst,           -- 1-bit input A port set/reset input
        RSTREGARSTREG => '0',  -- 1-bit input A port register set/reset input
        WEA           => x"0",  -- 4-bit input A port write enable input
        CASCADEINB    => '0',           -- 1-bit input B port cascade input
        CASCADEOUTB   => open,          -- 1-bit output B port cascade output
        DIBDI         => bram_din(63 downto 32),  -- 32-bit input B port data/MSB data input
        DIPBDIP       => x"0",  -- 4-bit input B port parity/MSB parity input
        DOBDO         => bram_dout(63 downto 32),  -- 32-bit output B port data/MSB data output
        DOPBDOP       => open,  -- 4-bit output B port parity/MSB parity output
        ADDRBWRADDR   => bram_wr_addr,  -- 16-bit input B port address/Write address input
        CLKBWRCLK     => wr_clk,  -- 1-bit input B port clock/Write clock input
        ENBWREN       => wr_en,  -- 1-bit input B port enable/Write enable input
        REGCEB        => '1',  -- 1-bit input B port register enable input
        RSTRAMB       => rst,  -- Reset del latch de salida de la memoria (1 bit)
        RSTREGB       => '0',  -- Reset del registro opcional de salida (1 bit)
        WEBWE         => x"FF");  -- 8-bit input B port write enable/Write enable input
       end generate;
      end generate BRAM_7_SERIES;


      --------------------------
      -- 8 Series BRAM Primitive
      --------------------------
      BRAM_8_SERIES : if (C_BRAM_TYPE = "ULTRASCALE") generate
      xpm_mem_gen : if (C_SELECT_XPM = 1) generate
      xpm_memory_inst: xpm_memory_sdpram
        generic map (
       MEMORY_SIZE                => 36864,     --- 36K
       MEMORY_PRIMITIVE           => "blockram",
       CLOCKING_MODE              => "independent_clock",
       ECC_MODE                   => "no_ecc",
       MEMORY_INIT_FILE           => "none",
       MEMORY_INIT_PARAM          => "",
       USE_MEM_INIT               => 1,
       WAKEUP_TIME                => "disable_sleep",
       AUTO_SLEEP_TIME            => 0,
       MESSAGE_CONTROL            => 1,
     
       -- Port A module parameters
       WRITE_DATA_WIDTH_A         => 64,
       BYTE_WRITE_WIDTH_A         => 64,
       ADDR_WIDTH_A               => 15,
     
       -- Port B module parameters
       READ_DATA_WIDTH_B          => 64,
       ADDR_WIDTH_B               => 15,
       READ_RESET_VALUE_B         => "0",
       READ_LATENCY_B             => 1,
       WRITE_MODE_B               => "read_first"
       )
       port map (
       -- Common module ports

        sleep                     => '0',
     
       -- Port A module ports, For BMG write and read ports are swapped
        clka                      => wr_clk,
        ena                       => '1', 
        wea                       => wr_en,
        addra                     => bram_wr_addr(14 downto 0),
        dina                      => bram_din,
        injectsbiterra            => '0',
        injectdbiterra            => '0',
     
       -- Port B module ports
        clkb                      => rd_clk,       
        rstb                      => rst, 
        enb                       => rd_en,
        regceb                    => '1',
        addrb                     => bram_rd_addr(14 downto 0),
        doutb                     => bram_dout,
        sbiterrb                  => open,
        dbiterrb                  => open
      ); 

      end generate;
      bram : if (C_SELECT_XPM =0) generate
       BRAM_I: RAMB36E2
         GENERIC MAP (
           SIM_COLLISION_CHECK => "ALL",
           CASCADE_ORDER_A     => "NONE",
           CASCADE_ORDER_B     => "NONE",
           CLOCK_DOMAINS       => "INDEPENDENT",
           DOA_REG             => 0, -- DOA_REG, DOB_REG: Optional output register (0 or 1)
           DOB_REG             => 0,
           ENADDRENA           => "FALSE",
           ENADDRENB           => "FALSE",
           EN_ECC_PIPE         => "FALSE",
           EN_ECC_READ         => "FALSE",
           EN_ECC_WRITE        => "FALSE",
           INIT_A              => X"000000000",
           INIT_B              => X"000000000",
           INIT_FILE           => "NONE",   -- RAM initialization file
           RDADDRCHANGEA       => "FALSE",
           RDADDRCHANGEB       => "FALSE",
           READ_WIDTH_A        => C_RD_DWIDTH+(C_RD_DWIDTH/8),  -- READ_WIDTH_A:  0, 1, 2, 4, 9, 18, 36, 72
           WRITE_WIDTH_A       => 0,  -- WRITE_WIDTH_A: 0, 1, 2, 4, 9, 18, 36,
           READ_WIDTH_B        => 0,  -- READ_WIDTH_B:  0, 1, 2, 4, 9, 18, 36,
           WRITE_WIDTH_B       => C_WR_DWIDTH+(C_WR_DWIDTH/8),  -- WRITE_WIDTH_B: 0, 1, 2, 4, 9, 18, 36, 72
           RSTREG_PRIORITY_A   => "REGCE",
           RSTREG_PRIORITY_B   => "REGCE",
           SLEEP_ASYNC         => "FALSE",
           SRVAL_A             => X"000000000",  -- SRVAL_A, SRVAL_B: Set/reset value for output,
           SRVAL_B             => X"000000000",
           WRITE_MODE_A        => "READ_FIRST",  -- WriteMode: Value on output upon a write ("WRITE_FIRST", "READ_FIRST", or "NO_CHANGE"),
           WRITE_MODE_B        => "READ_FIRST"
         )
         PORT MAP (
           INJECTDBITERR    => '0',
           INJECTSBITERR    => '0',
           DBITERR          => open,
           ECCPARITY        => open,
           RDADDRECC        => open,
           SBITERR          => open,
           CASDOUTA         => open,
           CASDOUTB         => open,
           CASDOUTPA        => open,
           CASDOUTPB        => open,
           CASOUTDBITERR    => open, 
           CASOUTSBITERR    => open, 
           CASDIMUXA        => '0',
           CASDIMUXB        => '0',
           CASDOMUXEN_A     => '0',
           CASDOMUXEN_B     => '0',
           CASOREGIMUXEN_A  => '0',
           CASOREGIMUXEN_B  => '0',
           CASDINA          => (OTHERS => '0'),
           CASDINB          => (OTHERS => '0'),
           CASDINPA         => (OTHERS => '0'),
           CASDINPB         => (OTHERS => '0'),
           CASDOMUXA        => '0',
           CASDOMUXB        => '0',
           CASINDBITERR     => '0',
           CASINSBITERR     => '0',
           CASOREGIMUXA     => '0',
           CASOREGIMUXB     => '0',
 
           DINADIN          => bram_din(31 downto 0),  -- 32-bit input A port data/LSB data input
           DINPADINP        => x"0",  -- 4-bit input A port parity/LSB parity input,
           DOUTADOUT        => bram_dout(31 downto 0),  -- 32-bit output A port data/LSB data output
           DOUTPADOUTP      => open,
    
           ADDRARDADDR      => bram_rd_addr(14 downto 0), -- 16-bit input A port address/Read address input
           CLKARDCLK        => rd_clk,
           ENARDEN          => rd_en,  -- 1-bit input A port enable/Read enable input
           ADDRENA          => '0',
           REGCEAREGCE      => '1',
           RSTRAMARSTRAM    => rst,
           RSTREGARSTREG    => '0',
           WEA              => x"0",  -- 4-bit input A port write enable input

           DINBDIN          => bram_din(63 downto 32),  -- 32-bit input B port data/MSB data input
           DINPBDINP        => x"0",  -- 4-bit input B port parity/MSB parity input
           DOUTBDOUT        => bram_dout(63 downto 32),  -- 32-bit output B port data/MSB data output
           DOUTPBDOUTP      => open,

           ADDRBWRADDR      => bram_wr_addr(14 downto 0),  -- 16-bit input B port address/Write address input
           CLKBWRCLK        => wr_clk,
           ENBWREN          => wr_en,  -- 1-bit input B port enable/Write enable input
           ADDRENB          => '0',
           ECCPIPECE        => '0',
           REGCEB           => '1',
           RSTRAMB          => rst,
           RSTREGB          => '0',
           SLEEP            => '0', 
           WEBWE            => x"FF"  -- 8-bit input B port write enable/Write enable input
         );
       end generate;
      end generate BRAM_8_SERIES;

  end generate PORT_64_GEN;

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : asymmetric_dp_bank_v6.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-10-25
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;

-- Assumption: Port A is always wider

entity asymmetric_dp_bank_v6 is
  generic (
    C_FAMILY        : string;
    C_BRAM_TYPE     : string := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2
    C_PRINT_INFO    : boolean := false;
    C_BANK_AWIDTH_A : integer;
    C_SELECT_XPM    : integer;
    C_BANK_DWIDTH_A : integer;
    C_BANK_AWIDTH_B : integer;
    C_BANK_DWIDTH_B : integer);
  port (
    rst    : in  std_logic;
    clk_a  : in  std_logic;
    ce_a   : in  std_logic;
    we_a   : in  std_logic;
    addr_a : in  std_logic_vector(C_BANK_AWIDTH_A-1 downto 0);
    din_a  : in  std_logic_vector(C_BANK_DWIDTH_A-1 downto 0);
    dout_a : out std_logic_vector(C_BANK_DWIDTH_A-1 downto 0);
    clk_b  : in  std_logic;
    ce_b   : in  std_logic;
    we_b   : in  std_logic;
    addr_b : in  std_logic_vector(C_BANK_AWIDTH_B-1 downto 0);
    din_b  : in  std_logic_vector(C_BANK_DWIDTH_B-1 downto 0);
    dout_b : out std_logic_vector(C_BANK_DWIDTH_B-1 downto 0));
end asymmetric_dp_bank_v6;

architecture rtl of asymmetric_dp_bank_v6 is
  constant MAX_BRAM_AWIDTH : integer := 15;  -- 32Kx1
  constant MIN_BRAM_AWIDTH : integer := 10;  -- 1Kx32
  constant MAX_BRAM_DWIDTH : integer := 32;  -- 1Kx32
  constant MIN_BRAM_DWIDTH : integer := 1;   -- 32Kx1
  constant DATA_RATIO : integer := C_BANK_DWIDTH_A/C_BANK_DWIDTH_B;
component  xpm_memory_tdpram
  generic (
  MEMORY_SIZE         : integer := 4096*32;
  MEMORY_PRIMITIVE    : string  := "auto";
  CLOCKING_MODE       : string  := "common_clock";
  ECC_MODE            : string  := "no_ecc";
  MEMORY_INIT_FILE    : string  := "none";
  MEMORY_INIT_PARAM   : string  := "";
  WAKEUP_TIME         : string  := "disable_sleep";
  MESSAGE_CONTROL     : integer :=  0;

  WRITE_DATA_WIDTH_A  : integer := 32;
  READ_DATA_WIDTH_A   : integer := 32;
  BYTE_WRITE_WIDTH_A  : integer :=  8;
  ADDR_WIDTH_A        : integer := 12; 
  READ_RESET_VALUE_A  : string  := "0";
  READ_LATENCY_A      : integer :=  1;
  WRITE_MODE_A        : string  :=  "read_first";

  WRITE_DATA_WIDTH_B  : integer := 32;
  READ_DATA_WIDTH_B   : integer := 32;
  BYTE_WRITE_WIDTH_B  : integer :=  8;
  ADDR_WIDTH_B        : integer := 12;
  READ_RESET_VALUE_B  : string  := "0";
  READ_LATENCY_B      : integer :=  1;
  WRITE_MODE_B        : string  :=  "read_first"

); 
  port (

  -- Common module ports
   sleep              : in std_logic;

  -- Port A module ports
   clka               : in std_logic;
   rsta               : in std_logic;
   ena                : in std_logic;
   regcea             : in std_logic;
--   wea                : in std_logic_vector (0  downto 0);  -- (WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1:0]
   wea                : in std_logic;  -- (WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1:0]
   addra              : in std_logic_vector (ADDR_WIDTH_A-1 downto 0);  -- [ADDR_WIDTH_A-1:0]   
   dina               : in std_logic_vector (WRITE_DATA_WIDTH_A-1  downto 0); 
   injectsbiterra     : in std_logic;
   injectdbiterra     : in std_logic;
   douta              : out std_logic_vector (READ_DATA_WIDTH_A-1 downto 0);                -- [READ_DATA_WIDTH_A-1:0]  
   sbiterra           : out std_logic;
   dbiterra           : out std_logic;

  -- Port B module ports
   clkb               : in std_logic;
   rstb               : in std_logic;
   enb                : in std_logic;
   regceb             : in std_logic;
--   web                : in std_logic_vector (0  downto 0);  -- (WRITE_DATA_WIDTH_B/BYTE_WRITE_WIDTH_B)-1:0]
   web                : in std_logic; -- (0  downto 0);  -- (WRITE_DATA_WIDTH_B/BYTE_WRITE_WIDTH_B)-1:0]
   addrb              : in std_logic_vector (ADDR_WIDTH_B-1 downto 0);   -- [ADDR_WIDTH_B-1:0]   
   dinb               : in std_logic_vector (WRITE_DATA_WIDTH_B-1 downto 0);  -- [WRITE_DATA_WIDTH_B-1:0] 
   injectsbiterrb     : in std_logic;
   injectdbiterrb     : in std_logic;
   doutb              : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0);                -- [READ_DATA_WIDTH_B-1:0]  
   sbiterrb           : out std_logic;
   dbiterrb           : out std_logic
  );
end component;

  function calc_bram_dwidth(bank_awidth : natural; bank_dwidth : natural) return integer is
    variable dwidth : integer;
  begin
    if(bank_awidth > MAX_BRAM_AWIDTH) then
      -- If required address bitwidth is bigger than possible bitwidth, then we
      -- have to increase depth. In this case, the BRAMs are configured x1.
      dwidth := 1;
    else
      -- bitwidth for data bus is calculated using the following expression:
      dwidth := 2**(MAX_BRAM_AWIDTH-bank_awidth);
      -- assuming that we do not go above max possible bitwidth:
      if(dwidth > MAX_BRAM_DWIDTH) then
        dwidth := MAX_BRAM_DWIDTH;
      end if;

      -- But, if it goes above the width of the bank, we limit to such width
      if(dwidth > bank_dwidth) then
        dwidth := bank_dwidth;
      end if;

      if(dwidth*DATA_RATIO > MAX_BRAM_DWIDTH) then
        dwidth := MAX_BRAM_DWIDTH/DATA_RATIO;
      end if;


    end if;
    return dwidth;
  end function calc_bram_dwidth;

  -- Dimensioning of bank according to narrow port
  constant BRAM_AWIDTH_B : integer := min_size(C_BANK_AWIDTH_B, MAX_BRAM_AWIDTH);
  constant BRAM_DWIDTH_B : integer := calc_bram_dwidth(C_BANK_AWIDTH_B, C_BANK_DWIDTH_B);
  constant N_BRAM        : integer := div_round_up(C_BANK_DWIDTH_B, BRAM_DWIDTH_B);
  constant BRAM_AWIDTH_A : integer := BRAM_AWIDTH_B-log2(DATA_RATIO);
  constant BRAM_DWIDTH_A : integer := BRAM_DWIDTH_B*DATA_RATIO;
  constant COL_SIZE : integer := 2**(C_BANK_AWIDTH_B-BRAM_AWIDTH_B);

begin

  NO_DEPTH_EXPANSION_GEN : if (C_BANK_AWIDTH_B <= MAX_BRAM_AWIDTH) generate
    signal bram_addr_a : std_logic_vector(15 downto 0);
    signal bram_addr_b : std_logic_vector(15 downto 0);
  begin

    process(addr_a)
      constant BRAM_ADDR_LSB : integer := log2(BRAM_DWIDTH_A);
      constant BRAM_ADDR_MSB : integer := BRAM_ADDR_LSB+BRAM_AWIDTH_A-1;
    begin
      bram_addr_a                                     <= (others => '0');
      bram_addr_a(BRAM_ADDR_MSB downto BRAM_ADDR_LSB) <= addr_a;
    end process;

    process(addr_b)
      constant BRAM_ADDR_LSB : integer := log2(BRAM_DWIDTH_B);
      constant BRAM_ADDR_MSB : integer := BRAM_ADDR_LSB+BRAM_AWIDTH_B-1;
    begin
      bram_addr_b                                     <= (others => '0');
      bram_addr_b(BRAM_ADDR_MSB downto BRAM_ADDR_LSB) <= addr_b;
    end process;

    MEM_BANK_GEN : for i in 0 to N_BRAM-1 generate
      signal bram_din_a  : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      signal bram_dout_a : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      signal bram_we_a   : std_logic_vector(3 downto 0);
      signal bram_din_b  : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      signal bram_dout_b : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      signal bram_we_b   : std_logic_vector(7 downto 0);

    begin

      -- In the input dus (wide), BRAM i gives support to slice i of each of
      -- the DATA_RATIO subwords.

      process(din_a)
      begin
        bram_din_a <= (others => '1');
        for k in 0 to DATA_RATIO-1 loop
          -- from each subwordk, we take slice i
          bram_din_a(BRAM_DWIDTH_B*(k+1)-1 downto BRAM_DWIDTH_B*k) <=
            din_a(BRAM_DWIDTH_B*(i+1)-1+C_BANK_DWIDTH_B*k downto BRAM_DWIDTH_B*i+C_BANK_DWIDTH_B*k);
        end loop;
      end process;


      DOUT_A_GEN : for k in 0 to DATA_RATIO-1 generate
      begin
        dout_a(BRAM_DWIDTH_B*(i+1)-1+C_BANK_DWIDTH_B*k downto BRAM_DWIDTH_B*i+C_BANK_DWIDTH_B*k) <=
          bram_dout_a(BRAM_DWIDTH_B*(k+1)-1 downto BRAM_DWIDTH_B*k);
      end generate DOUT_A_GEN;

      -- narrow port (B), we group the slices:

      process(din_b)
      begin
        bram_din_b                           <= (others => '0');
        bram_din_b(BRAM_DWIDTH_B-1 downto 0) <= din_b(BRAM_DWIDTH_B*(i+1)-1 downto BRAM_DWIDTH_B*i);
      end process;

      dout_b(BRAM_DWIDTH_B*(i+1)-1 downto BRAM_DWIDTH_B*i) <= bram_dout_b(BRAM_DWIDTH_B-1 downto 0);

      -- No support for byte-enable we signals
      bram_we_a <= (others => we_a);
      bram_we_b <= (others => we_b);

      --------------------------
      -- 7 Series BRAM Primitive
      --------------------------
     BRAM_7_SERIES : if (C_BRAM_TYPE = "7_SERIES") generate
      xpm_mem_gen : if (C_SELECT_XPM = 1) generate
      xpm_memory_inst: xpm_memory_tdpram

       generic map (
          MEMORY_SIZE             => 36864,   --- 36K
          MEMORY_PRIMITIVE        => "blockram",
          CLOCKING_MODE           => "independent_clock",
          ECC_MODE                => "no_ecc",
          MEMORY_INIT_FILE        => "none",
          MEMORY_INIT_PARAM       => "",
          WAKEUP_TIME             => "disable_sleep",
          MESSAGE_CONTROL         =>  1,
    
          WRITE_DATA_WIDTH_A      =>  MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_A       =>  MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_A      =>  MAX_BRAM_DWIDTH,
          ADDR_WIDTH_A            =>  16, 
          READ_RESET_VALUE_A      => "0",
          READ_LATENCY_A          =>  1,
          WRITE_MODE_A            => "read_first",  --READ_FIRST
    
          WRITE_DATA_WIDTH_B      => MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_B       => MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_B      => MAX_BRAM_DWIDTH,
          ADDR_WIDTH_B            => 16,
          READ_RESET_VALUE_B      => "0",
          READ_LATENCY_B          =>  1,
          WRITE_MODE_B            => "read_first"
          )
          port map (
           -- Common module ports
          sleep                   =>  '0',
        
         -- Port A module ports
          clka                    => clk_a,
          rsta                    => rst, 
          ena                     => ce_a, 
          regcea                  => '0',
--          wea                     => bram_we_a(0),
          wea                     => we_a,
          addra                   => bram_addr_a,
          dina                    => bram_din_a,
          injectsbiterra          => '0',
          injectdbiterra          => '0',
          douta                   => bram_dout_a,
          sbiterra                => open,
          dbiterra                => open,
        
         -- Port B module ports
          clkb                    => clk_b,
          rstb                    => rst,
          enb                     => ce_b,
          regceb                  => '0',
--          web                     => bram_we_b(0),
          web                     => we_b,
          addrb                   => bram_addr_b,
          dinb                    => bram_din_b,
          injectsbiterrb          => '0',
          injectdbiterrb          => '0',
          doutb                   => bram_dout_b,
          sbiterrb                => open,
          dbiterrb                => open
          );
    end generate;

    bram : if (C_SELECT_XPM = 0) generate

      begin
        BRAM_I : RAMB36E1
          generic map (
            SIM_COLLISION_CHECK       => "ALL",  -- Colision check: Values ("ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE")
            RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",  -- "PERFORMANCE" or "DELAYED_WRITE"
            DOA_REG                   => 0,  -- DOA_REG, DOB_REG: Optional output register (0 or 1)
            DOB_REG                   => 0,
            EN_ECC_READ               => false,  -- Error Correction Circuitry (ECC): Encoder/decoder enable (TRUE/FALSE)
            EN_ECC_WRITE              => false,
            INIT_A                    => x"000000000",  -- INIT_A, INIT_B: Initial values on output ports
            INIT_B                    => x"000000000",
            INIT_FILE                 => "NONE",  -- RAM initialization file
            RAM_EXTENSION_A           => "NONE",  -- RAM_EXTENSION_A, RAM_EXTENSION_B: Selects cascade mode ("UPPER", "LOWER", or "NONE")
            RAM_EXTENSION_B           => "NONE",
            RAM_MODE                  => "TDP",  -- "SDP" or "TDP"
            READ_WIDTH_A              => BRAM_DWIDTH_A+(BRAM_DWIDTH_A/8),  -- READ_WIDTH_A:  0, 1, 2, 4, 9, 18, 36, 72
            WRITE_WIDTH_A             => BRAM_DWIDTH_A+(BRAM_DWIDTH_A/8),  -- WRITE_WIDTH_A: 0, 1, 2, 4, 9, 18, 36
            READ_WIDTH_B              => BRAM_DWIDTH_B+(BRAM_DWIDTH_B/8),  -- READ_WIDTH_B:  0, 1, 2, 4, 9, 18, 36
            WRITE_WIDTH_B             => BRAM_DWIDTH_B+(BRAM_DWIDTH_B/8),  -- WRITE_WIDTH_B: 0, 1, 2, 4, 9, 18, 36, 72
            RSTREG_PRIORITY_A         => "REGCE",  -- RSTREG_PRIORITY_A, RSTREG_PRIORITY_B: Reset or enable priority ("RSTREG" or "REGCE")
            RSTREG_PRIORITY_B         => "REGCE",
            SRVAL_A                   => x"000000000",  -- SRVAL_A, SRVAL_B: Set/reset value for output
            SRVAL_B                   => x"000000000",
            WRITE_MODE_A              => "READ_FIRST",  -- WriteMode: Value on output upon a write ("WRITE_FIRST", "READ_FIRST", or "NO_CHANGE")
            WRITE_MODE_B              => "READ_FIRST")
          port map (
            -- ECC Signals: 1-bit (each) output Error Correction Circuitry ports
            INJECTDBITERR   => '0',   -- 1-bit input Inject a double bit error
            INJECTSBITERR   => '0',   -- 1-bit input Inject a single bit error
            DBITERR         => open,  -- 1-bit output double bit error status output
            ECCPARITY       => open,  -- 8-bit output generated error correction parity
            RDADDRECC       => open,        -- 9-bit output ECC read address
            SBITERR         => open,  -- 1-bit output Single bit error status output
  
            CASCADEINA      => '0',           -- 1-bit input A port cascade input
            CASCADEOUTA     => open,          -- 1-bit output A port cascade output
            DIADI           => bram_din_a,  -- 32-bit input A port data/LSB data input
            DIPADIP         => x"0",  -- 4-bit input A port parity/LSB parity input
            DOADO           => bram_dout_a,  -- 32-bit output A port data/LSB data output
            DOPADOP         => open,  -- 4-bit output A port parity/LSB parity output
  
            ADDRARDADDR     => bram_addr_a,  -- 16-bit input A port address/Read address input
            CLKARDCLK       => clk_a,  -- 1-bit input A port clock/Read clock input
            ENARDEN         => ce_a,  -- 1-bit input A port enable/Read enable input
            REGCEAREGCE     => '1',  -- 1-bit input A port register enable/Register enable input
            RSTRAMARSTRAM   => rst,         -- 1-bit input A port set/reset input
            RSTREGARSTREG   => '0',  -- 1-bit input A port register set/reset input
            WEA             => bram_we_a,  -- 4-bit input A port write enable input
  
            CASCADEINB      => '0',           -- 1-bit input B port cascade input
            CASCADEOUTB     => open,          -- 1-bit output B port cascade output
            DIBDI           => bram_din_b,  -- 32-bit input B port data/MSB data input
            DIPBDIP         => x"0",  -- 4-bit input B port parity/MSB parity input
            DOBDO           => bram_dout_b,  -- 32-bit output B port data/MSB data output
            DOPBDOP         => open,  -- 4-bit output B port parity/MSB parity output
    
            ADDRBWRADDR     => bram_addr_b,  -- 16-bit input B port address/Write address input
            CLKBWRCLK       => clk_b,  -- 1-bit input B port clock/Write clock input
            ENBWREN         => ce_b,  -- 1-bit input B port enable/Write enable input
            REGCEB          => '1',  -- 1-bit input B port register enable input
            RSTRAMB         => rst,  -- Reset del latch de salida de la memoria (1 bit)
            RSTREGB         => '0',  -- Reset del registro opcional de salida (1 bit)
            --WEBWE         => x"FF");          -- 8-bit input B port write enable/Write enable input
            WEBWE           => bram_we_b);  -- 8-bit input B port write enable/Write enable input

         end generate;
      end generate BRAM_7_SERIES;


      --------------------------
      -- 8 Series BRAM Primitive
      --------------------------

    BRAM_8_SERIES : if (C_BRAM_TYPE = "ULTRASCALE") generate
      xpm_mem_gen : if (C_SELECT_XPM = 1 ) generate
      xpm_memory_inst: xpm_memory_tdpram
    generic map (
          MEMORY_SIZE             => 36864,   --- 36K
          MEMORY_PRIMITIVE        => "blockram",
          CLOCKING_MODE           => "independent_clock",
          ECC_MODE                => "no_ecc",
          MEMORY_INIT_FILE        => "none",
          MEMORY_INIT_PARAM       => "",
          WAKEUP_TIME             => "disable_sleep",
          MESSAGE_CONTROL         =>  1,
    
          WRITE_DATA_WIDTH_A      => MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_A       => MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_A      => MAX_BRAM_DWIDTH,
          ADDR_WIDTH_A            => 15, 
          READ_RESET_VALUE_A      => "0",
          READ_LATENCY_A          => 1,
          WRITE_MODE_A            => "read_first",  
    
          WRITE_DATA_WIDTH_B      => MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_B       => MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_B      => MAX_BRAM_DWIDTH,
          ADDR_WIDTH_B            => 15,
          READ_RESET_VALUE_B      => "0",
          READ_LATENCY_B          => 1,
          WRITE_MODE_B            => "read_first"
          )
          port map (
           -- Common module ports
          sleep                   =>  '0',
        
         -- Port A module ports
          clka                    => clk_a,
          rsta                    => rst, 
          ena                     => ce_a, 
          regcea                  => '1',
--        wea                     => bram_we_a(0),
          wea                     => we_a,
          addra                   => bram_addr_a(14 downto 0),
          dina                    => bram_din_a,
          injectsbiterra          => '0',
          injectdbiterra          => '0',
          douta                   => bram_dout_a,
          sbiterra                => open,
          dbiterra                => open,
        
         -- Port B module ports
          clkb                    => clk_b,
          rstb                    => rst,
          enb                     => ce_b,
          regceb                  => '1',
--        web                     => bram_we_b(0),
          web                     => we_b,
          addrb                   => bram_addr_b(14 downto 0),
          dinb                    => bram_din_b,
          injectsbiterrb          => '0',
          injectdbiterrb          => '0',
          doutb                   => bram_dout_b,
          sbiterrb                => open,
          dbiterrb                => open
          );
    end generate;

    bram : if (C_SELECT_XPM = 0) generate

      begin
       BRAM_I: RAMB36E2
         GENERIC MAP (
           SIM_COLLISION_CHECK  => "ALL",
           CASCADE_ORDER_A      => "NONE",
           CASCADE_ORDER_B      => "NONE",
           CLOCK_DOMAINS        => "INDEPENDENT",
           DOA_REG              => 0, -- DOA_REG, DOB_REG: Optional output register (0 or 1)
           DOB_REG              => 0,
           ENADDRENA            => "FALSE",
           ENADDRENB            => "FALSE",
           EN_ECC_PIPE          => "FALSE",
           EN_ECC_READ          => "FALSE",
           EN_ECC_WRITE         => "FALSE",
           INIT_A               => X"000000000",
           INIT_B               => X"000000000",
           INIT_FILE            => "NONE",   -- RAM initialization file
           RDADDRCHANGEA        => "FALSE",
           RDADDRCHANGEB        => "FALSE",
           READ_WIDTH_A         => BRAM_DWIDTH_A+(BRAM_DWIDTH_A/8),  -- READ_WIDTH_A:  0, 1, 2, 4, 9, 18, 36, 72,
           WRITE_WIDTH_A        => BRAM_DWIDTH_A+(BRAM_DWIDTH_A/8),  -- WRITE_WIDTH_A: 0, 1, 2, 4, 9, 18, 36,
           READ_WIDTH_B         => BRAM_DWIDTH_B+(BRAM_DWIDTH_B/8),  -- READ_WIDTH_B:  0, 1, 2, 4, 9, 18, 36,
           WRITE_WIDTH_B        => BRAM_DWIDTH_B+(BRAM_DWIDTH_B/8),  -- WRITE_WIDTH_B: 0, 1, 2, 4, 9, 18, 36, 72
           RSTREG_PRIORITY_A    => "REGCE",
           RSTREG_PRIORITY_B    => "REGCE",
           SLEEP_ASYNC          => "FALSE",
           SRVAL_A              => X"000000000",  -- SRVAL_A, SRVAL_B: Set/reset value for output,
           SRVAL_B              => X"000000000",
           WRITE_MODE_A         => "READ_FIRST",  -- WriteMode: Value on output upon a write ("WRITE_FIRST", "READ_FIRST", or "NO_CHANGE"),
           WRITE_MODE_B         => "READ_FIRST"
         )
         PORT MAP (
           INJECTDBITERR    => '0',
           INJECTSBITERR    => '0',
           DBITERR          => open,
           ECCPARITY        => open,
           RDADDRECC        => open,
           SBITERR          => open,
           CASDOUTA         => open,
           CASDOUTB         => open,
           CASDOUTPA        => open,
           CASDOUTPB        => open,
           CASOUTDBITERR    => open, 
           CASOUTSBITERR    => open, 
           CASDIMUXA        => '0',
           CASDIMUXB        => '0',
           CASDOMUXEN_A     => '0',
           CASDOMUXEN_B     => '0',
           CASOREGIMUXEN_A  => '0',
           CASOREGIMUXEN_B  => '0',
           CASDINA          => (OTHERS => '0'),
           CASDINB          => (OTHERS => '0'),
           CASDINPA         => (OTHERS => '0'),
           CASDINPB         => (OTHERS => '0'),
           CASDOMUXA        => '0',
           CASDOMUXB        => '0',
           CASINDBITERR     => '0',
           CASINSBITERR     => '0',
           CASOREGIMUXA     => '0',
           CASOREGIMUXB     => '0',
 
           DINADIN          => bram_din_a,  -- 32-bit input A port data/LSB data input
           DINPADINP        => x"0",  -- 4-bit input A port parity/LSB parity input,
           DOUTADOUT        => bram_dout_a,  -- 32-bit output A port data/LSB data output
           DOUTPADOUTP      => open,
    
           ADDRARDADDR      => bram_addr_a(14 downto 0), -- 16-bit input A port address/Read address input
           CLKARDCLK        => clk_a,
           ENARDEN          => ce_a,  -- 1-bit input A port enable/Read enable input
           ADDRENA          => '0',
           REGCEAREGCE      => '1',
           RSTRAMARSTRAM    => rst,
           RSTREGARSTREG    => '0',
           WEA              => bram_we_a,  -- 4-bit input A port write enable input

           DINBDIN          => bram_din_b,  -- 32-bit input B port data/MSB data input
           DINPBDINP        => x"0",  -- 4-bit input B port parity/MSB parity input
           DOUTBDOUT        => bram_dout_b,  -- 32-bit output B port data/MSB data output
           DOUTPBDOUTP      => open,

           ADDRBWRADDR      => bram_addr_b(14 downto 0),  -- 16-bit input B port address/Write address input
           CLKBWRCLK        => clk_b,
           ENBWREN          => ce_b,  -- 1-bit input B port enable/Write enable input
           ADDRENB          => '0',
           ECCPIPECE        => '0',
           REGCEB           => '1',
           RSTRAMB          => rst,
           RSTREGB          => '0',
           SLEEP            => '0', 
           WEBWE            => bram_we_b  -- 8-bit input B port write enable/Write enable input
         );
        end generate;
    end generate BRAM_8_SERIES;


    end generate MEM_BANK_GEN;

  end generate NO_DEPTH_EXPANSION_GEN;


  DEPTH_EXPANSION_GEN : if (C_BANK_AWIDTH_B > MAX_BRAM_AWIDTH) generate
    signal bram_addr_a : std_logic_vector(15 downto 0);
    signal bram_addr_b : std_logic_vector(15 downto 0);

    constant WORD_AWIDTH    : integer := log2(COL_SIZE);
    constant BRAM_SEL_A_MSB : integer := C_BANK_AWIDTH_A-1;
    constant BRAM_SEL_A_LSB : integer := BRAM_SEL_A_MSB-(WORD_AWIDTH-1);
    constant BRAM_SEL_B_MSB : integer := C_BANK_AWIDTH_B-1;
    constant BRAM_SEL_B_LSB : integer := BRAM_SEL_B_MSB-(WORD_AWIDTH-1);

    signal bram_ce_a : std_logic_vector(COL_SIZE-1 downto 0);
    signal bram_ce_b : std_logic_vector(COL_SIZE-1 downto 0);

    signal bram_sel_addr_a : std_logic_vector(WORD_AWIDTH-1 downto 0);
    signal bram_sel_addr_b : std_logic_vector(WORD_AWIDTH-1 downto 0);

  begin

    -- Use the WORD_AWIDTH MS bits to select the BRAM inside the column
    process(addr_a, ce_a)
    begin
      bram_ce_a <= (others => '0');
      if (ce_a = '1') then
        for i in 0 to COL_SIZE-1 loop
          if (unsigned(addr_a(BRAM_SEL_A_MSB downto BRAM_SEL_A_LSB)) = i) then
            bram_ce_a(i) <= '1';
          end if;
        end loop;
      end if;
    end process;

    process(addr_b, ce_b)
    begin
      bram_ce_b <= (others => '0');
      if (ce_b = '1') then
        for i in 0 to COL_SIZE-1 loop
          if (unsigned(addr_b(BRAM_SEL_B_MSB downto BRAM_SEL_B_LSB)) = i) then
            bram_ce_b(i) <= '1';
          end if;
        end loop;
      end if;
    end process;

    -- this section of bits has to be registered to generate the selection
    -- signal for the mux's of output datapath
    process(clk_a)
    begin
      if (clk_a'event and clk_a = '1') then
        if (ce_a = '1') then
          bram_sel_addr_a <= addr_a(BRAM_SEL_A_MSB downto BRAM_SEL_A_LSB);
        end if;
      end if;
    end process;

    process(clk_b)
    begin
      if (clk_b'event and clk_b = '1') then
        if (ce_b = '1') then
          bram_sel_addr_b <= addr_b(BRAM_SEL_B_MSB downto BRAM_SEL_B_LSB);
        end if;
      end if;
    end process;

    -- In this case, given that it is depth increase we use all width of BRAM
    -- address bus of wide port

    process(addr_b)
      constant BRAM_ADDR_LSB : integer := log2(BRAM_DWIDTH_B);
      constant BRAM_ADDR_MSB : integer := BRAM_ADDR_LSB+BRAM_AWIDTH_B-1;

      constant ADDR_LSB : integer := 0;
      constant ADDR_MSB : integer := MAX_BRAM_AWIDTH-1;
    begin
      bram_addr_b                                     <= (others => '0');
      bram_addr_b(BRAM_ADDR_MSB downto BRAM_ADDR_LSB) <= addr_b(ADDR_MSB downto ADDR_LSB);
    end process;

    -- and, in the narrow port, it's the same but reducing the width log2(DATA_RATIO):

    process(addr_a)
      constant BRAM_ADDR_LSB : integer := log2(BRAM_DWIDTH_A);
      constant BRAM_ADDR_MSB : integer := BRAM_ADDR_LSB+BRAM_AWIDTH_A-1;

      -- same as wide port minus log2(DATA_RATIO):
      constant ADDR_LSB : integer := 0;
      constant ADDR_MSB : integer := (MAX_BRAM_AWIDTH-log2(DATA_RATIO))-1;
    begin
      bram_addr_a                                     <= (others => '0');
      bram_addr_a(BRAM_ADDR_MSB downto BRAM_ADDR_LSB) <= addr_a(ADDR_MSB downto ADDR_LSB);
    end process;


    MEM_BANK_GEN : for i in 0 to N_BRAM-1 generate
      signal bram_din_a : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      signal bram_we_a  : std_logic_vector(3 downto 0);

      signal bram_din_b : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      signal bram_we_b  : std_logic_vector(7 downto 0);

      -- These superbusses represent group data busses at the output of BRAMs
      -- in same column
      signal col_dout_a : std_logic_vector(COL_SIZE*BRAM_DWIDTH_A-1 downto 0);
      signal col_dout_b : std_logic_vector(COL_SIZE*BRAM_DWIDTH_B-1 downto 0);

      -- this is for the output mux
      signal mux_dout_a : std_logic_vector(BRAM_DWIDTH_A-1 downto 0);
      signal mux_dout_b : std_logic_vector(BRAM_DWIDTH_B-1 downto 0);

      signal bram_dout_a : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      signal bram_dout_b : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);

    begin

      -- In the input port of wide bus, BRAM i gives support to slide i of each
      -- of DATA_RATIO subwords

      process(din_a)
      begin
        bram_din_a <= (others => '1');
        for k in 0 to DATA_RATIO-1 loop
          -- from each subword k, we take slice i
          bram_din_a(BRAM_DWIDTH_B*(k+1)-1 downto BRAM_DWIDTH_B*k) <=
            din_a(BRAM_DWIDTH_B*(i+1)-1+C_BANK_DWIDTH_B*k downto BRAM_DWIDTH_B*i+C_BANK_DWIDTH_B*k);
        end loop;
      end process;

      -- in the narrow port(B), we group the slices:
      process(din_b)
      begin
        bram_din_b                           <= (others => '0');
        bram_din_b(BRAM_DWIDTH_B-1 downto 0) <= din_b(BRAM_DWIDTH_B*(i+1)-1 downto BRAM_DWIDTH_B*i);
      end process;

      -- mux's in the output data busses in the same column
      process(col_dout_a, bram_sel_addr_a)
      begin
        mux_dout_a <= (others => '0');
        for k in 0 to COL_SIZE-1 loop
          if (unsigned(bram_sel_addr_a) = k) then
            mux_dout_a <= col_dout_a(BRAM_DWIDTH_A*(k+1)-1 downto BRAM_DWIDTH_A*k);
          end if;
        end loop;
      end process;

      process(col_dout_b, bram_sel_addr_b)
      begin
        mux_dout_b <= (others => '0');
        for k in 0 to COL_SIZE-1 loop
          if (unsigned(bram_sel_addr_b) = k) then
            mux_dout_b <= col_dout_b(BRAM_DWIDTH_B*(k+1)-1 downto BRAM_DWIDTH_B*k);
          end if;
        end loop;
      end process;

      -- For the output datapath, we apply the same criterio that in the input
      -- datapath

      -- For the wide port, we apply interleave with the output of the mux
      DOUT_A_GEN : for k in 0 to DATA_RATIO-1 generate
      begin
        dout_a(BRAM_DWIDTH_B*(i+1)-1+C_BANK_DWIDTH_B*k downto BRAM_DWIDTH_B*i+C_BANK_DWIDTH_B*k) <=
          mux_dout_a(BRAM_DWIDTH_B*(k+1)-1 downto BRAM_DWIDTH_B*k);
      end generate DOUT_A_GEN;

      -- for the narrow port, we directly take the slice
      dout_b(BRAM_DWIDTH_B*(i+1)-1 downto BRAM_DWIDTH_B*i) <= mux_dout_b(BRAM_DWIDTH_B-1 downto 0);


      -- No byte-enable for we signals
      bram_we_a <= (others => we_a);
      bram_we_b <= (others => we_b);

      BRAM_COL_GEN : for k in 0 to COL_SIZE-1 generate
        signal bram_dout_a : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
        signal bram_dout_b : std_logic_vector(MAX_BRAM_DWIDTH-1 downto 0);
      begin
        -- This superbus groups the output datapaths
        col_dout_a(BRAM_DWIDTH_A*(k+1)-1 downto BRAM_DWIDTH_A*k) <= bram_dout_a(BRAM_DWIDTH_A-1 downto 0);
        col_dout_b(BRAM_DWIDTH_B*(k+1)-1 downto BRAM_DWIDTH_B*k) <= bram_dout_b(BRAM_DWIDTH_B-1 downto 0);

      --------------------------
      -- 7 Series BRAM Primitive
      --------------------------
      BRAM_7_SERIES : if (C_BRAM_TYPE = "7_SERIES") generate
      xpm_mem_gen : if (C_SELECT_XPM = 1) generate
      xpm_memory_inst: xpm_memory_tdpram

       generic map (
          MEMORY_SIZE             => 36864,   --- 36K
          MEMORY_PRIMITIVE        => "blockram",
          CLOCKING_MODE           => "independent_clock",
          ECC_MODE                => "no_ecc",
          MEMORY_INIT_FILE        => "none",
          MEMORY_INIT_PARAM       => "",
          WAKEUP_TIME             => "disable_sleep",
          MESSAGE_CONTROL         =>  1,
    
          WRITE_DATA_WIDTH_A      =>  MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_A       =>  MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_A      =>  MAX_BRAM_DWIDTH,
          ADDR_WIDTH_A            =>  16, 
          READ_RESET_VALUE_A      => "0",
          READ_LATENCY_A          =>  1,
          WRITE_MODE_A            => "read_first",  --READ_FIRST
    
          WRITE_DATA_WIDTH_B      => MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_B       => MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_B      => MAX_BRAM_DWIDTH,
          ADDR_WIDTH_B            =>  16,
          READ_RESET_VALUE_B      => "0",
          READ_LATENCY_B          =>  1,
          WRITE_MODE_B            => "read_first"
          )
          port map (
           -- Common module ports
          sleep                   =>  '0',
        
         -- Port A module ports
          clka                    => clk_a,
          rsta                    => rst, 
          ena                     => bram_ce_a(k), 
          regcea                  => '1',
--        wea                     => bram_we_a(0),
          wea                     => we_a,
          addra                   => bram_addr_a,
          dina                    => bram_din_a,
          injectsbiterra          => '0',
          injectdbiterra          => '0',
          douta                   => bram_dout_a,
          sbiterra                => open,
          dbiterra                => open,
        
         -- Port B module ports
          clkb                    => clk_b,
          rstb                    => rst,
          enb                     => bram_ce_b(k),
          regceb                  => '1',
--        web                     => bram_we_b(0),
          web                     => we_b,
          addrb                   => bram_addr_b,
          dinb                    => bram_din_b,
          injectsbiterrb          => '0',
          injectdbiterrb          => '0',
          doutb                   => bram_dout_b,
          sbiterrb                => open,
          dbiterrb                => open
          );
    end generate;

    bram_361 : if (C_SELECT_XPM = 0) generate
      begin
        BRAM_I : RAMB36E1
          generic map (
            SIM_COLLISION_CHECK       => "ALL",  -- Colision check: Values ("ALL", "WARNING_ONLY", "GENERATE_X_ONLY" or "NONE")
            RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",  -- "PERFORMANCE" or "DELAYED_WRITE"
            DOA_REG                   => 0,  -- DOA_REG, DOB_REG: Optional output register (0 or 1)
            DOB_REG                   => 0,
            EN_ECC_READ               => false,  -- Error Correction Circuitry (ECC): Encoder/decoder enable (TRUE/FALSE)
            EN_ECC_WRITE              => false,
            INIT_A                    => x"000000000",  -- INIT_A, INIT_B: Initial values on output ports
            INIT_B                    => x"000000000",
            INIT_FILE                 => "NONE",  -- RAM initialization file
            RAM_EXTENSION_A           => "NONE",  -- RAM_EXTENSION_A, RAM_EXTENSION_B: Selects cascade mode ("UPPER", "LOWER", or "NONE")
            RAM_EXTENSION_B           => "NONE",
            RAM_MODE                  => "TDP",  -- "SDP" or "TDP"
            READ_WIDTH_A              => BRAM_DWIDTH_A+(BRAM_DWIDTH_A/8),  -- READ_WIDTH_A:  0, 1, 2, 4, 9, 18, 36, 72
            WRITE_WIDTH_A             => BRAM_DWIDTH_A+(BRAM_DWIDTH_A/8),  -- WRITE_WIDTH_A: 0, 1, 2, 4, 9, 18, 36
            READ_WIDTH_B              => BRAM_DWIDTH_B+(BRAM_DWIDTH_B/8),  -- READ_WIDTH_B:  0, 1, 2, 4, 9, 18, 36
            WRITE_WIDTH_B             => BRAM_DWIDTH_B+(BRAM_DWIDTH_B/8),  -- WRITE_WIDTH_B: 0, 1, 2, 4, 9, 18, 36, 72
            RSTREG_PRIORITY_A         => "REGCE",  -- RSTREG_PRIORITY_A, RSTREG_PRIORITY_B: Reset or enable priority ("RSTREG" or "REGCE")
            RSTREG_PRIORITY_B         => "REGCE",
            SRVAL_A                   => x"000000000",  -- SRVAL_A, SRVAL_B: Set/reset value for output
            SRVAL_B                   => x"000000000",
            WRITE_MODE_A              => "READ_FIRST",  -- WriteMode: Value on output upon a write ("WRITE_FIRST", "READ_FIRST", or "NO_CHANGE")
            WRITE_MODE_B              => "READ_FIRST")
          port map (
            -- ECC Signals: 1-bit (each) output Error Correction Circuitry ports
            INJECTDBITERR   => '0',   -- 1-bit input Inject a double bit error
            INJECTSBITERR   => '0',   -- 1-bit input Inject a single bit error
            DBITERR         => open,  -- 1-bit output double bit error status output
            ECCPARITY       => open,  -- 8-bit output generated error correction parity
            RDADDRECC       => open,      -- 9-bit output ECC read address
            SBITERR         => open,  -- 1-bit output Single bit error status output
   
            CASCADEINA      => '0',         -- 1-bit input A port cascade input
            CASCADEOUTA     => open,        -- 1-bit output A port cascade output
            DIADI           => bram_din_a,  -- 32-bit input A port data/LSB data input
            DIPADIP         => x"0",  -- 4-bit input A port parity/LSB parity input
            DOADO           => bram_dout_a,  -- 32-bit output A port data/LSB data output
            DOPADOP         => open,  -- 4-bit output A port parity/LSB parity output
   
            ADDRARDADDR     => bram_addr_a,  -- 16-bit input A port address/Read address input
            CLKARDCLK       => clk_a,  -- 1-bit input A port clock/Read clock input
            ENARDEN         => bram_ce_a(k),  -- 1-bit input A port enable/Read enable input
            REGCEAREGCE     => '1',  -- 1-bit input A port register enable/Register enable input
            RSTRAMARSTRAM   => rst,       -- 1-bit input A port set/reset input
            RSTREGARSTREG   => '0',  -- 1-bit input A port register set/reset input
            WEA             => bram_we_a,  -- 4-bit input A port write enable input
   
            CASCADEINB      => '0',         -- 1-bit input B port cascade input
            CASCADEOUTB     => open,        -- 1-bit output B port cascade output
            DIBDI           => bram_din_b,  -- 32-bit input B port data/MSB data input
            DIPBDIP         => x"0",  -- 4-bit input B port parity/MSB parity input
            DOBDO           => bram_dout_b,  -- 32-bit output B port data/MSB data output
            DOPBDOP         => open,  -- 4-bit output B port parity/MSB parity output
    
            ADDRBWRADDR     => bram_addr_b,  -- 16-bit input B port address/Write address input
            CLKBWRCLK       => clk_b,  -- 1-bit input B port clock/Write clock input
            ENBWREN         => bram_ce_b(k),  -- 1-bit input B port enable/Write enable input
            REGCEB          => '1',  -- 1-bit input B port register enable input
            RSTRAMB         => rst,  -- Reset del latch de salida de la memoria (1 bit)
            RSTREGB         => '0',  -- Reset del registro opcional de salida (1 bit)
            --WEBWE         => x"FF");          -- 8-bit input B port write enable/Write enable input
            WEBWE           => bram_we_b);  -- 8-bit input B port write enable/Write enable input

      end generate;
      end generate BRAM_7_SERIES;


      --------------------------
      -- 8 Series BRAM Primitive
      --------------------------
      BRAM_8_SERIES : if (C_BRAM_TYPE = "ULTRASCALE") generate
      xpm_mem_gen : if (C_SELECT_XPM = 1) generate
      xpm_memory_inst: xpm_memory_tdpram

       generic map (
          MEMORY_SIZE             => 36864,   --- 36K
          MEMORY_PRIMITIVE        => "blockram",
          CLOCKING_MODE           => "independent_clock",
          ECC_MODE                => "no_ecc",
          MEMORY_INIT_FILE        => "none",
          MEMORY_INIT_PARAM       => "",
          WAKEUP_TIME             => "disable_sleep",
          MESSAGE_CONTROL         =>  1,
    
          WRITE_DATA_WIDTH_A      =>  MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_A       =>  MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_A      =>  MAX_BRAM_DWIDTH,
          ADDR_WIDTH_A            =>  15, 
          READ_RESET_VALUE_A      => "0",
          READ_LATENCY_A          =>  1,
          WRITE_MODE_A            => "read_first",  --READ_FIRST
    
          WRITE_DATA_WIDTH_B      => MAX_BRAM_DWIDTH,
          READ_DATA_WIDTH_B       => MAX_BRAM_DWIDTH,
          BYTE_WRITE_WIDTH_B      => MAX_BRAM_DWIDTH,
          ADDR_WIDTH_B            =>  15,
          READ_RESET_VALUE_B      => "0",
          READ_LATENCY_B          =>  1,
          WRITE_MODE_B            => "read_first"
          )
          port map (
           -- Common module ports
          sleep                   =>  '0',
        
         -- Port A module ports
          clka                    => clk_a,
          rsta                    => rst, 
          ena                     => bram_ce_a(k), 
          regcea                  => '1',
          wea                     => we_a,
          addra                   => bram_addr_a(14 downto 0),
          dina                    => bram_din_a,
          injectsbiterra          => '0',
          injectdbiterra          => '0',
          douta                   => bram_dout_a,
          sbiterra                => open,
          dbiterra                => open,
        
         -- Port B module ports
          clkb                    => clk_b,
          rstb                    => rst,
          enb                     => bram_ce_b(k),
          regceb                  => '1',
--        web                     => bram_we_b(0),
          web                     => we_b,
          addrb                   => bram_addr_b(14 downto 0),
          dinb                    => bram_din_b,
          injectsbiterrb          => '0',
          injectdbiterrb          => '0',
          doutb                   => bram_dout_b,
          sbiterrb                => open,
          dbiterrb                => open
          );
    end generate;


    bram_361 : if (C_SELECT_XPM = 0) generate
      begin

       BRAM_I: RAMB36E2
         GENERIC MAP (
           SIM_COLLISION_CHECK  => "ALL",
           CASCADE_ORDER_A      => "NONE",
           CASCADE_ORDER_B      => "NONE",
           CLOCK_DOMAINS        => "INDEPENDENT",
           DOA_REG              => 0, -- DOA_REG, DOB_REG: Optional output register (0 or 1)
           DOB_REG              => 0,
           ENADDRENA            => "FALSE",
           ENADDRENB            => "FALSE",
           EN_ECC_PIPE          => "FALSE",
           EN_ECC_READ          => "FALSE",
           EN_ECC_WRITE         => "FALSE",
           INIT_A               => X"000000000",
           INIT_B               => X"000000000",
           INIT_FILE            => "NONE",   -- RAM initialization file
           RDADDRCHANGEA        => "FALSE",
           RDADDRCHANGEB        => "FALSE",
           READ_WIDTH_A         => BRAM_DWIDTH_A+(BRAM_DWIDTH_A/8),  -- READ_WIDTH_A:  0, 1, 2, 4, 9, 18, 36, 72,
           WRITE_WIDTH_A        => BRAM_DWIDTH_A+(BRAM_DWIDTH_A/8),  -- WRITE_WIDTH_A: 0, 1, 2, 4, 9, 18, 36,
           READ_WIDTH_B         => BRAM_DWIDTH_B+(BRAM_DWIDTH_B/8),  -- READ_WIDTH_B:  0, 1, 2, 4, 9, 18, 36,
           WRITE_WIDTH_B        => BRAM_DWIDTH_B+(BRAM_DWIDTH_B/8),  -- WRITE_WIDTH_B: 0, 1, 2, 4, 9, 18, 36, 72
           RSTREG_PRIORITY_A    => "REGCE",
           RSTREG_PRIORITY_B    => "REGCE",
           SLEEP_ASYNC          => "FALSE",
           SRVAL_A              => X"000000000",  -- SRVAL_A, SRVAL_B: Set/reset value for output,
           SRVAL_B              => X"000000000",
           WRITE_MODE_A         => "READ_FIRST",  -- WriteMode: Value on output upon a write ("WRITE_FIRST", "READ_FIRST", or "NO_CHANGE"),
           WRITE_MODE_B         => "READ_FIRST"
         )
         PORT MAP (
           INJECTDBITERR   => '0',
           INJECTSBITERR   => '0',
           DBITERR         => open,
           ECCPARITY       => open,
           RDADDRECC       => open,
           SBITERR         => open,
           CASDOUTA        => open,
           CASDOUTB        => open,
           CASDOUTPA       => open,
           CASDOUTPB       => open,
           CASOUTDBITERR   => open, 
           CASOUTSBITERR   => open, 
           CASDIMUXA       => '0',
           CASDIMUXB       => '0',
           CASDOMUXEN_A    => '0',
           CASDOMUXEN_B    => '0',
           CASOREGIMUXEN_A => '0',
           CASOREGIMUXEN_B => '0',
           CASDINA         => (OTHERS => '0'),
           CASDINB         => (OTHERS => '0'),
           CASDINPA        => (OTHERS => '0'),
           CASDINPB        => (OTHERS => '0'),
           CASDOMUXA       => '0',
           CASDOMUXB       => '0',
           CASINDBITERR    => '0',
           CASINSBITERR    => '0',
           CASOREGIMUXA    => '0',
           CASOREGIMUXB    => '0',
 
           DINADIN         => bram_din_a,  -- 32-bit input A port data/LSB data input
           DINPADINP       => x"0",  -- 4-bit input A port parity/LSB parity input,
           DOUTADOUT       => bram_dout_a,  -- 32-bit output A port data/LSB data output
           DOUTPADOUTP     => open,

           ADDRARDADDR     => bram_addr_a(14 downto 0), -- 16-bit input A port address/Read address input
           CLKARDCLK       => clk_a,
           ENARDEN         => bram_ce_a(k),  -- 1-bit input A port enable/Read enable input
           ADDRENA         => '0',
           REGCEAREGCE     => '1',
           RSTRAMARSTRAM   => rst,
           RSTREGARSTREG   => '0',
           WEA             => bram_we_a,  -- 4-bit input A port write enable input
 
           DINBDIN         => bram_din_b,  -- 32-bit input B port data/MSB data input
           DINPBDINP       => x"0",  -- 4-bit input B port parity/MSB parity input
           DOUTBDOUT       => bram_dout_b,  -- 32-bit output B port data/MSB data output
           DOUTPBDOUTP     => open,
 
           ADDRBWRADDR     => bram_addr_b(14 downto 0),  -- 16-bit input B port address/Write address input
           CLKBWRCLK       => clk_b,
           ENBWREN         => bram_ce_b(k),  -- 1-bit input B port enable/Write enable input
           ADDRENB         => '0',
           ECCPIPECE       => '0',
           REGCEB          => '1',
           RSTRAMB         => rst,
           RSTREGB         => '0',
           SLEEP           => '0', 
           WEBWE           => bram_we_b  -- 8-bit input B port write enable/Write enable input
         );

         end generate; 
      end generate BRAM_8_SERIES;

      end generate BRAM_COL_GEN;

    end generate MEM_BANK_GEN;

  end generate DEPTH_EXPANSION_GEN;

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : arg_mem_bank_v6.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-10-25
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.asymmetric_dp_bank_v6;
use axis_accelerator_adapter_v2_1_16.symmetric_dp_bank_v6;
use axis_accelerator_adapter_v2_1_16.dp_bank_sdp_v6;


entity arg_mem_bank_v6 is
  generic (
    C_FAMILY       : string;
    C_BRAM_TYPE    : string := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2
    C_PRINT_INFO   : boolean              := false;
    C_IS_UNIDIR    : integer range 0 to 1 := 0;
    C_SELECT_XPM   : integer := 0;
    C_OPORT_AWIDTH : integer;
    C_OPORT_DWIDTH : integer;
    C_IPORT_AWIDTH : integer;
    C_IPORT_DWIDTH : integer);
  port (
    rst        : in  std_logic;
    oport_clk  : in  std_logic;
    oport_ce   : in  std_logic;
    oport_we   : in  std_logic;
    oport_addr : in  std_logic_vector(C_OPORT_AWIDTH-1 downto 0);
    oport_din  : in  std_logic_vector(C_OPORT_DWIDTH-1 downto 0);
    oport_dout : out std_logic_vector(C_OPORT_DWIDTH-1 downto 0);
    iport_clk  : in  std_logic;
    iport_ce   : in  std_logic;
    iport_we   : in  std_logic;
    iport_addr : in  std_logic_vector(C_IPORT_AWIDTH-1 downto 0);
    iport_din  : in  std_logic_vector(C_IPORT_DWIDTH-1 downto 0);
    iport_dout : out std_logic_vector(C_IPORT_DWIDTH-1 downto 0));
end arg_mem_bank_v6;

architecture rtl of arg_mem_bank_v6 is

  function calc_use_sdp(is_unidir : natural) return integer is
    variable use_sdp : integer;
  begin
    if(C_IS_UNIDIR = 0) then
      use_sdp := 0;
    else
      use_sdp                                   := 0;
      if(C_OPORT_DWIDTH = 64 and C_IPORT_DWIDTH <= 64 and C_OPORT_AWIDTH <= 9) then
        -- SDP, WR port 64 bits
        use_sdp := 1;
      elsif(C_IPORT_DWIDTH = 64 and C_OPORT_DWIDTH <= 64 and C_IPORT_AWIDTH <= 9) then
        -- SDP, RD port 64 bits
        use_sdp := 1;
      end if;
    end if;
    return use_sdp;
  end function calc_use_sdp;

  constant USE_SDP : integer := calc_use_sdp(C_IS_UNIDIR);

begin

  WR_PORT_WIDER_GEN : if (C_IPORT_DWIDTH > C_OPORT_DWIDTH) generate
  begin

    USE_SDP_GEN : if (use_sdp /= 0) generate
    begin

      BANK_I : entity axis_accelerator_adapter_v2_1_16.dp_bank_sdp_v6
        generic map (
          C_FAMILY    => C_FAMILY,
          C_BRAM_TYPE => C_BRAM_TYPE,
          C_SDP_WIDE  => 1,
          C_RD_AWIDTH => C_OPORT_AWIDTH,
          C_RD_DWIDTH => C_OPORT_DWIDTH,
          C_WR_AWIDTH => C_IPORT_AWIDTH,
          C_WR_DWIDTH => C_IPORT_DWIDTH)
        port map (
          rst => rst,
          rd_clk  => oport_clk,
          rd_en   => oport_ce,
          rd_addr => oport_addr,
          dout    => oport_dout,
          wr_clk  => iport_clk,
          wr_en   => iport_ce,
          wr_addr => iport_addr,
          din     => iport_din);

      iport_dout <= (others => '0');

    end generate USE_SDP_GEN;

    DONT_USE_SDP_GEN : if (use_sdp = 0) generate
    begin
      -- Port A is always the wider port
      BANK_I : entity axis_accelerator_adapter_v2_1_16.asymmetric_dp_bank_v6
        generic map (
          C_FAMILY        => C_FAMILY,
          C_BRAM_TYPE     => C_BRAM_TYPE,
          C_BANK_AWIDTH_A => C_IPORT_AWIDTH,
          C_SELECT_XPM    => C_SELECT_XPM,
          C_BANK_DWIDTH_A => C_IPORT_DWIDTH,
          C_BANK_AWIDTH_B => C_OPORT_AWIDTH,
          C_BANK_DWIDTH_B => C_OPORT_DWIDTH)
        port map (
          rst    => rst,
          clk_a  => iport_clk,
          ce_a   => iport_ce,
          we_a   => iport_we,
          addr_a => iport_addr,
          din_a  => iport_din,
          dout_a => iport_dout,
          clk_b  => oport_clk,
          ce_b   => oport_ce,
          we_b   => oport_we,
          addr_b => oport_addr,
          din_b  => oport_din,
          dout_b => oport_dout);

    end generate DONT_USE_SDP_GEN;

  end generate WR_PORT_WIDER_GEN;


  ---------------------------------------------------------------------------------------
  WR_PORT_NARROWER_GEN : if (C_IPORT_DWIDTH < C_OPORT_DWIDTH) generate
  begin

    USE_SDP_GEN : if (use_sdp /= 0) generate
    begin

      BANK_I : entity axis_accelerator_adapter_v2_1_16.dp_bank_sdp_v6
        generic map (
          C_FAMILY        => C_FAMILY,
          C_BRAM_TYPE     => C_BRAM_TYPE,
          C_SDP_WIDE      => 0,
          C_SELECT_XPM    => C_SELECT_XPM,
          C_RD_AWIDTH     => C_OPORT_AWIDTH,
          C_RD_DWIDTH     => C_OPORT_DWIDTH,
          C_WR_AWIDTH     => C_IPORT_AWIDTH,
          C_WR_DWIDTH     => C_IPORT_DWIDTH)
        port map (
          rst => rst,
          rd_clk  => oport_clk,
          rd_en   => oport_ce,
          rd_addr => oport_addr,
          dout    => oport_dout,
          wr_clk  => iport_clk,
          wr_en   => iport_ce,
          wr_addr => iport_addr,
          din     => iport_din);

      iport_dout <= (others => '0');

    end generate USE_SDP_GEN;

    DONT_USE_SDP_GEN : if (use_sdp = 0) generate
    begin

      -- Port A is always the wider port
      BANK_I : entity axis_accelerator_adapter_v2_1_16.asymmetric_dp_bank_v6
        generic map (
          C_FAMILY        => C_FAMILY,
          C_BRAM_TYPE     => C_BRAM_TYPE,
          C_BANK_AWIDTH_B => C_IPORT_AWIDTH,
          C_SELECT_XPM    => C_SELECT_XPM,
          C_BANK_DWIDTH_B => C_IPORT_DWIDTH,
          C_BANK_AWIDTH_A => C_OPORT_AWIDTH,
          C_BANK_DWIDTH_A => C_OPORT_DWIDTH)
        port map (
          rst    => rst,
          clk_b  => iport_clk,
          ce_b   => iport_ce,
          we_b   => iport_we,
          addr_b => iport_addr,
          din_b  => iport_din,
          dout_b => iport_dout,
          clk_a  => oport_clk,
          ce_a   => oport_ce,
          we_a   => oport_we,
          addr_a => oport_addr,
          din_a  => oport_din,
          dout_a => oport_dout);

    end generate DONT_USE_SDP_GEN;

  end generate WR_PORT_NARROWER_GEN;

  SAME_WIDTH_GEN : if (C_OPORT_DWIDTH = C_IPORT_DWIDTH) generate
  begin

    BANK_I : entity axis_accelerator_adapter_v2_1_16.symmetric_dp_bank_v6
      generic map (
        C_FAMILY      => C_FAMILY,
        C_BRAM_TYPE   => C_BRAM_TYPE,
        C_SELECT_XPM  => C_SELECT_XPM,
        C_BANK_AWIDTH => C_OPORT_AWIDTH,
        C_BANK_DWIDTH => C_OPORT_DWIDTH)
      port map (
        rst    => rst,
        clk_a  => oport_clk,
        ce_a   => oport_ce,
        we_a   => oport_we,
        addr_a => oport_addr,
        din_a  => oport_din,
        dout_a => oport_dout,
        clk_b  => iport_clk,
        ce_b   => iport_ce,
        we_b   => iport_we,
        addr_b => iport_addr,
        din_b  => iport_din,
        dout_b => iport_dout);

  end generate SAME_WIDTH_GEN;

end rtl;


-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : arg_mem_bank.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-04
-- Last update: 2013-10-25
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-04  1.0      rmg/jn	Created
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws. 
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.arg_mem_bank_v6;


entity arg_mem_bank is
  generic (
    C_FAMILY       : string;
    C_BRAM_TYPE    : string := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2
    C_IS_UNIDIR    : integer range 0 to 1 := 0;
    C_OPORT_AWIDTH : integer;
    C_SELECT_XPM   : integer := 0;
    C_OPORT_DWIDTH : integer;
    C_IPORT_AWIDTH : integer;
    C_IPORT_DWIDTH : integer);
  port (
    rst        : in  std_logic;
    oport_clk  : in  std_logic;
    oport_ce   : in  std_logic;
    oport_we   : in  std_logic;
    oport_addr : in  std_logic_vector(C_OPORT_AWIDTH-1 downto 0);
    oport_din  : in  std_logic_vector(C_OPORT_DWIDTH-1 downto 0);
    oport_dout : out std_logic_vector(C_OPORT_DWIDTH-1 downto 0);

    iport_clk  : in  std_logic;
    iport_ce   : in  std_logic;
    iport_we   : in  std_logic;
    iport_addr : in  std_logic_vector(C_IPORT_AWIDTH-1 downto 0);
    iport_din  : in  std_logic_vector(C_IPORT_DWIDTH-1 downto 0);
    iport_dout : out std_logic_vector(C_IPORT_DWIDTH-1 downto 0));
end arg_mem_bank;

architecture rtl of arg_mem_bank is

begin



    ARG_MEM_I : entity axis_accelerator_adapter_v2_1_16.arg_mem_bank_v6
      generic map (
        C_FAMILY       => C_FAMILY,
        C_BRAM_TYPE    => C_BRAM_TYPE,
        C_IS_UNIDIR    => C_IS_UNIDIR,
        C_SELECT_XPM   => C_SELECT_XPM,
        C_OPORT_AWIDTH => C_OPORT_AWIDTH,
        C_OPORT_DWIDTH => C_OPORT_DWIDTH,
        C_IPORT_AWIDTH => C_IPORT_AWIDTH,
        C_IPORT_DWIDTH => C_IPORT_DWIDTH)
      port map (
        rst        => rst,
        oport_clk  => oport_clk,
        oport_ce   => oport_ce,
        oport_we   => oport_we,
        oport_addr => oport_addr,
        oport_din  => oport_din,
        oport_dout => oport_dout,

        iport_clk  => iport_clk,
        iport_ce   => iport_ce,
        iport_we   => iport_we,
        iport_addr => iport_addr,
        iport_din  => iport_din,
        iport_dout => iport_dout);


end rtl;


-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : srl_fifo_32_wt.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2012-11-04
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity srl_fifo_32_wt is
  generic (
    C_FAMILY : string  := "spartan6";
    WIDTH    : integer := 16);
  port (
    rst      : in  std_logic;
    clk      : in  std_logic;
    din      : in  std_logic_vector(WIDTH-1 downto 0);
    din_vld  : in  std_logic;
    din_rdy  : out std_logic;
    dout     : out std_logic_vector(WIDTH-1 downto 0);
    dout_vld : out std_logic;
    dout_rdy : in  std_logic);
end srl_fifo_32_wt;

architecture rtl of srl_fifo_32_wt is
  constant ADDR_WIDTH     : integer := 5;
  constant CNT_MAX        : integer := 2**ADDR_WIDTH;
  constant FIFO_CNT_WIDTH : integer := ADDR_WIDTH+1;

  signal addr       : unsigned(ADDR_WIDTH-1 downto 0);
  signal fifo_cnt_i : unsigned(FIFO_CNT_WIDTH-1 downto 0);
  signal fifo_re    : std_logic;
  signal fifo_we    : std_logic;
  signal empty_i    : std_logic;
  signal mem_out    : std_logic_vector(WIDTH-1 downto 0);
  signal din_rdy_i  : std_logic;
  signal rd_en      : std_logic;
  signal dout_vld_i : std_logic;

begin

  MEM_GEN : for i in 0 to WIDTH-1 generate
  begin
    SRL_I : SRLC32E
      generic map (
        INIT => x"00000000")
      port map (
        D   => din(i),
        CE  => fifo_we,
        CLK => clk,
        A   => std_logic_vector(addr),
        Q   => mem_out(i),
        Q31 => open);
  end generate;

  process(clk)
  begin
    if (clk'event and clk = '1') then
      if(rst = '1') then
        dout <= (others => '0');
      elsif(fifo_re = '1') then
        dout <= mem_out;
      end if;
    end if;
  end process;

  din_rdy <= din_rdy_i;

  fifo_re <= rd_en and not(empty_i);
  fifo_we <= din_vld and din_rdy_i;

  process(clk)
  begin
    if (clk'event and clk = '1') then
      if(rst = '1') then
        fifo_cnt_i <= (others => '0');
        addr       <= (others => '1');
      elsif(fifo_we = '1' and fifo_re = '0') then
        fifo_cnt_i <= fifo_cnt_i + 1;
        addr       <= addr + 1;
      elsif(fifo_we = '0' and fifo_re = '1') then
        fifo_cnt_i <= fifo_cnt_i - 1;
        addr       <= addr - 1;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if (clk'event and clk = '1') then
      if(rst = '1') then
        empty_i <= '1';
      else
        if(fifo_cnt_i(FIFO_CNT_WIDTH-1 downto 1) = 0) then  -- cnt = 0 or 1
          empty_i <= not(fifo_we) and (fifo_re or not(fifo_cnt_i(0)));
        else
          empty_i <= '0';
        end if;
      end if;
    end if;
  end process;

  process(clk)
    constant ones : unsigned(addr'range) := (others => '1');
  begin
    if (clk'event and clk = '1') then
      if(rst = '1') then
        din_rdy_i <= '0';
      else
        if(fifo_cnt_i(FIFO_CNT_WIDTH-1) = '1') then  -- cnt = MAX
          din_rdy_i <= (fifo_re);
        elsif(fifo_cnt_i(addr'range) = ones) then    -- cnt = MAX-1
          din_rdy_i <= not(not(fifo_re) and fifo_we);
        else
          din_rdy_i <= '1';
        end if;
      end if;
    end if;
  end process;

  rd_en <= not(dout_vld_i) or (dout_vld_i and dout_rdy);
  process(clk, rst)
  begin
    if(rst = '1') then
      dout_vld_i <= '0';
    elsif(clk'event and clk = '1') then
      if(rd_en = '1') then
        dout_vld_i <= not(empty_i);
      end if;
    end if;
  end process;

  dout_vld <= dout_vld_i;

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : oarg_columnized_mem_bank.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-10-25
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.arg_mem_bank;

entity oarg_columnized_mem_bank is
  generic (
    C_FAMILY       : string;
    C_BRAM_TYPE    : string := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2
    C_FACTOR       : integer;
    C_BUFFER_WIDTH : integer;
    C_CONV_AWIDTH  : integer;
    C_CONV_DWIDTH  : integer;
    C_ARG_WIDTH    : integer;
    C_ARG_AWIDTH   : integer);
  port (
    ap_rst        : in  std_logic;
    ap_clk        : in  std_logic;
    ap_arg_ce     : in  std_logic;
    ap_arg_we     : in  std_logic;
    ap_arg_buffer : in  std_logic_vector(C_BUFFER_WIDTH-1 downto 0);
    ap_arg_addr   : in  std_logic_vector(C_ARG_AWIDTH-1 downto 0);
    ap_arg_din    : in  std_logic_vector(C_ARG_WIDTH*C_FACTOR-1 downto 0);
    ap_arg_dout   : out std_logic_vector(C_ARG_WIDTH*C_FACTOR-1 downto 0);
    clk           : in  std_logic;
    conv_ce       : in  std_logic;
    conv_we       : in  std_logic;
    conv_buffer   : in  std_logic_vector(C_BUFFER_WIDTH-1 downto 0);
    conv_addr     : in  std_logic_vector(C_CONV_AWIDTH-1 downto 0);
    conv_data     : out std_logic_vector(C_CONV_DWIDTH-1 downto 0));

end oarg_columnized_mem_bank;

architecture rtl of oarg_columnized_mem_bank is

  constant BANK_AWIDTH  : integer := log2(C_FACTOR);
  constant IPORT_AWIDTH : integer := C_BUFFER_WIDTH+C_ARG_AWIDTH;
  constant OPORT_AWIDTH : integer := C_BUFFER_WIDTH+(C_CONV_AWIDTH-BANK_AWIDTH);

  signal oport_addr : std_logic_vector(OPORT_AWIDTH-1 downto 0);
  signal iport_addr : std_logic_vector(IPORT_AWIDTH-1 downto 0);
  signal oport_ce   : std_logic_vector(C_FACTOR-1 downto 0);
  signal oport_din  : std_logic_vector(C_CONV_DWIDTH*C_FACTOR-1 downto 0);
  signal oport_dout : std_logic_vector(C_CONV_DWIDTH*C_FACTOR-1 downto 0);

begin

  ONLY_ONE_BANK : if (C_FACTOR = 1) generate
  begin
    oport_ce(0) <= conv_ce;
    iport_addr  <= ap_arg_buffer & ap_arg_addr;
    oport_addr  <= conv_buffer & conv_addr;
    conv_data   <= oport_dout;
  end generate ONLY_ONE_BANK;

  SEVERAL_BANKS : if (C_FACTOR > 1) generate

    constant OFFSET_WIDTH : integer := C_CONV_AWIDTH-BANK_AWIDTH;
    constant BANK_MSB     : integer := C_CONV_AWIDTH-1;
    constant BANK_LSB     : integer := BANK_MSB-BANK_AWIDTH+1;
    constant OFFSET_MSB   : integer := BANK_LSB-1;
    constant OFFSET_LSB   : integer := 0;

    signal conv_bank   : std_logic_vector(BANK_AWIDTH-1 downto 0);
    signal conv_offset : std_logic_vector(OFFSET_WIDTH-1 downto 0);
    signal conv_bank_r : std_logic_vector(BANK_AWIDTH-1 downto 0);
    
  begin

    iport_addr <= ap_arg_buffer & ap_arg_addr;

    conv_bank   <= conv_addr(BANK_MSB downto BANK_LSB);
    conv_offset <= conv_addr(OFFSET_MSB downto OFFSET_LSB);

    process(conv_ce, conv_bank)
    begin
      oport_ce <= (others => '0');
      for i in 0 to C_FACTOR-1 loop
        if(unsigned(conv_bank) = i) then
          oport_ce(i) <= conv_ce;
        end if;
      end loop;
    end process;

    oport_addr <= conv_buffer & conv_offset;

    -- Register part of address used to select the bank
    process(clk)
    begin
      if(clk'event and clk = '1') then
        if(conv_ce = '1') then
          conv_bank_r <= conv_bank;
        end if;
      end if;
    end process;

    -- use conv_bank_r to select the mux at the output
    process(conv_bank_r, oport_dout)
    begin
      conv_data <= (others => '0');
      for i in 0 to C_FACTOR-1 loop
        if(unsigned(conv_bank_r) = i) then
          conv_data <= oport_dout(C_CONV_DWIDTH*(i+1)-1 downto C_CONV_DWIDTH*i);
        end if;
      end loop;
    end process;

  end generate SEVERAL_BANKS;

  BANK_GEN : for i in 0 to C_FACTOR-1 generate
  begin

    MEM_I : entity axis_accelerator_adapter_v2_1_16.arg_mem_bank
      generic map (
        C_FAMILY       => C_FAMILY,
        C_BRAM_TYPE    => C_BRAM_TYPE,
        C_IS_UNIDIR    => 0,
        C_IPORT_DWIDTH => C_ARG_WIDTH,
        C_IPORT_AWIDTH => IPORT_AWIDTH,
        C_OPORT_DWIDTH => C_CONV_DWIDTH,
        C_OPORT_AWIDTH => OPORT_AWIDTH)
      port map (
        rst        => ap_rst,
        iport_clk  => ap_clk,
        iport_ce   => ap_arg_ce,
        iport_we   => ap_arg_we,
        iport_addr => iport_addr,
        iport_din  => ap_arg_din(C_ARG_WIDTH*(i+1)-1 downto C_ARG_WIDTH*i),
        iport_dout => ap_arg_dout(C_ARG_WIDTH*(i+1)-1 downto C_ARG_WIDTH*i),
        oport_clk  => clk,
        oport_ce   => oport_ce(i),
        oport_we   => conv_we,
        oport_addr => oport_addr,
        oport_din  => oport_din(C_CONV_DWIDTH*(i+1)-1 downto C_CONV_DWIDTH*i),
        oport_dout => oport_dout(C_CONV_DWIDTH*(i+1)-1 downto C_CONV_DWIDTH*i));

  end generate BANK_GEN;

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : iarg_columnized_mem_bank.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-10-25
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created 
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.arg_mem_bank;


entity iarg_columnized_mem_bank is
  generic (
    C_FAMILY       : string;
    C_BRAM_TYPE    : string := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2
    C_FACTOR       : integer;
    C_BUFFER_WIDTH : integer;
    C_CONV_AWIDTH  : integer;
    C_CONV_DWIDTH  : integer;
    C_ARG_WIDTH    : integer;
    C_ARG_AWIDTH   : integer);
  port (
    ap_rst        : in  std_logic;
    clk           : in  std_logic;
    conv_ce       : in  std_logic;
    conv_we       : in  std_logic;
    conv_buffer   : in  std_logic_vector(C_BUFFER_WIDTH-1 downto 0);
    conv_addr     : in  std_logic_vector(C_CONV_AWIDTH-1 downto 0);
    conv_data     : in  std_logic_vector(C_CONV_DWIDTH-1 downto 0);
    ap_clk        : in  std_logic;
    ap_arg_ce     : in  std_logic;
    ap_arg_we     : in  std_logic;
    ap_arg_buffer : in  std_logic_vector(C_BUFFER_WIDTH-1 downto 0);
    ap_arg_addr   : in  std_logic_vector(C_ARG_AWIDTH-1 downto 0);
    ap_arg_din    : in  std_logic_vector(C_ARG_WIDTH*C_FACTOR-1 downto 0);
    ap_arg_dout   : out std_logic_vector(C_ARG_WIDTH*C_FACTOR-1 downto 0));
end iarg_columnized_mem_bank;

architecture rtl of iarg_columnized_mem_bank is

  constant BANK_AWIDTH  : integer := log2(C_FACTOR);
  constant IPORT_AWIDTH : integer := C_BUFFER_WIDTH+(C_CONV_AWIDTH-BANK_AWIDTH);
  constant OPORT_AWIDTH : integer := C_BUFFER_WIDTH+C_ARG_AWIDTH;

  signal iport_addr : std_logic_vector(IPORT_AWIDTH-1 downto 0);
  signal oport_addr : std_logic_vector(OPORT_AWIDTH-1 downto 0);
  signal iport_ce   : std_logic_vector(C_FACTOR-1 downto 0);

begin

  ONLY_ONE_BANK : if (C_FACTOR = 1) generate
  begin
    iport_ce(0) <= conv_ce;
    iport_addr  <= conv_buffer & conv_addr;
    oport_addr  <= ap_arg_buffer & ap_arg_addr;
  end generate ONLY_ONE_BANK;

  SEVERAL_BANKS : if (C_FACTOR > 1) generate

    constant OFFSET_WIDTH : integer := C_CONV_AWIDTH-BANK_AWIDTH;
    constant BANK_MSB     : integer := C_CONV_AWIDTH-1;
    constant BANK_LSB     : integer := BANK_MSB-BANK_AWIDTH+1;
    constant OFFSET_MSB   : integer := BANK_LSB-1;
    constant OFFSET_LSB   : integer := 0;

    signal conv_bank   : std_logic_vector(BANK_AWIDTH-1 downto 0);
    signal conv_offset : std_logic_vector(OFFSET_WIDTH-1 downto 0);
    
  begin

    conv_bank   <= conv_addr(BANK_MSB downto BANK_LSB);
    conv_offset <= conv_addr(OFFSET_MSB downto OFFSET_LSB);

    process(conv_ce, conv_bank)
    begin
      iport_ce <= (others => '0');
      for i in 0 to C_FACTOR-1 loop
        if(unsigned(conv_bank) = i) then
          iport_ce(i) <= conv_ce;
        end if;
      end loop;
    end process;

    iport_addr <= conv_buffer & conv_offset;
    oport_addr <= ap_arg_buffer & ap_arg_addr;

  end generate SEVERAL_BANKS;

  BANK_GEN : for i in 0 to C_FACTOR-1 generate
  begin

    MEM_I : entity axis_accelerator_adapter_v2_1_16.arg_mem_bank
      generic map (
        C_FAMILY       => C_FAMILY,
        C_BRAM_TYPE    => C_BRAM_TYPE,
        C_IS_UNIDIR    => 1,
        C_IPORT_DWIDTH => C_CONV_DWIDTH,
        C_IPORT_AWIDTH => IPORT_AWIDTH,
        C_OPORT_DWIDTH => C_ARG_WIDTH,
        C_OPORT_AWIDTH => OPORT_AWIDTH)
      port map (
        rst        => ap_rst,
        iport_clk  => clk,
        iport_ce   => iport_ce(i),
        iport_we   => '1',
        iport_addr => iport_addr,
        iport_din  => conv_data,
        iport_dout => open,
        oport_clk  => ap_clk,
        oport_ce   => ap_arg_ce,
        oport_we   => ap_arg_we,
        oport_addr => oport_addr,
        oport_din  => ap_arg_din(C_ARG_WIDTH*(i+1)-1 downto C_ARG_WIDTH*i),
        oport_dout => ap_arg_dout(C_ARG_WIDTH*(i+1)-1 downto C_ARG_WIDTH*i));

  end generate BANK_GEN;

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : xd_s2m_memory_dc.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-10-25
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

-- Design note: Normally, a gray counter is implemented using a binary counter
-- and transfor the output to gray. However, in this design, the number of bit
-- for the gray counters is 4 worst case (C_MULTIBUFFER_DEPTH = 8). In this
-- situation we can use a look-up based approach (LUT4 for each bit). For a
-- gray counter of N bits, gray_inc function should infer a table of 2**N elements.
  
library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.arg_mem_bank;
use axis_accelerator_adapter_v2_1_16.iarg_columnized_mem_bank;




entity xd_s2m_memory_dc is
  generic (
    -- System generics:
    C_FAMILY               : string;     -- Xilinx FPGA family
    C_MTBF_STAGES          : integer;
    C_BRAM_TYPE            : string := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2
    C_SELECT_XPM           : integer := 1;
    CONV_DATA_WIDTH        : integer;
    CONV_ADDR_WIDTH        : integer;
    C_AP_ARG_WIDTH         : integer;
    C_AP_ARG_N_DIM         : integer;
    C_AP_ARG_DIM_1         : integer;
    C_AP_ARG_DIM_2         : integer;
    C_AP_ARG_FORMAT_TYPE   : integer;
    C_AP_ARG_FORMAT_FACTOR : integer;
    C_AP_ARG_FORMAT_DIM    : integer;
    C_AP_ARG_DATA_WIDTH    : integer;
    C_AP_ARG_ADDR_WIDTH    : integer;
    C_MULTIBUFFER_DEPTH    : integer;
    C_NONE                 : integer := 2;
    C_EXTRA_SYNCS          : integer := 1);
  port (
    clk          : in  std_logic;
    rst          : in  std_logic;
    conv_addr    : in  std_logic_vector(CONV_ADDR_WIDTH-1 downto 0);
    conv_ce      : in  std_logic;
    conv_we      : in  std_logic;
    conv_last    : in  std_logic;
    conv_rdy     : out std_logic;
    conv_data    : in  std_logic_vector(CONV_DATA_WIDTH-1 downto 0);
    ap_clk       : in  std_logic;
    ap_rst       : in  std_logic;
    ap_arg_addr  : in  std_logic_vector(C_AP_ARG_ADDR_WIDTH-1 downto 0);
    ap_arg_ce    : in  std_logic;
    ap_arg_we    : in  std_logic;
    ap_arg_din   : in  std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    ap_arg_dout  : out std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    mb_arg_rdy   : out std_logic;
    mb_arg_done  : in  std_logic;
    status_empty : out std_logic := '0';
    status_full  : out std_logic := '1';
    status_used  : out std_logic_vector(3 downto 0));  -- Number of used buffers
end entity;

architecture rtl of xd_s2m_memory_dc is

  ------------------------------------
  function calc_use_columnized_bank return boolean is
    variable ret : boolean := false;
  begin
    if (C_AP_ARG_N_DIM = 2) then
      if(C_AP_ARG_FORMAT_TYPE = FORMAT_TYPE_RESHAPE_BLOCK) then
        if(C_AP_ARG_FORMAT_DIM = 1 and C_AP_ARG_FORMAT_FACTOR > 1) then
          ret := true;
        end if;
      end if;
    end if;
    return ret;
  end function calc_use_columnized_bank;


  constant PTR_WIDTH           : integer := if_then_else((C_MULTIBUFFER_DEPTH = 1),1,log2(C_MULTIBUFFER_DEPTH));
  constant GRAY_WIDTH          : integer := calc_gray_width(C_MULTIBUFFER_DEPTH);
  constant INIT_RD_GRAY        : integer := 0;
  constant INIT_WR_GRAY        : integer := INIT_RD_GRAY;
  constant INIT_WR_GRAY_AHEAD  : integer := INIT_RD_GRAY-C_MULTIBUFFER_DEPTH+1;
  constant USE_COLUMNIZED_BANK : boolean := calc_use_columnized_bank;

  signal empty_n        : std_logic;
  signal ap_rstn        : std_logic;
  signal rstn        : std_logic;
  signal mb_arg_rdy_i        : std_logic;
  signal full_n         : std_logic;
  -- pragma translate_off
  signal empty          : std_logic;
  signal full           : std_logic;
  -- pragma translate_on
  signal status_empty_i : std_logic;
  -- Multibuffer push/pop
  signal mb_push        : std_logic;
  signal m_axis_tlast        : std_logic;
  signal m_axis_tvalid        : std_logic;
  signal mb_pop         : std_logic;
  signal mb_push_ok     : std_logic;
  signal mb_pop_ok      : std_logic;
  -- Selection for read buffer
  signal rd_ptr         : unsigned(PTR_WIDTH-1 downto 0);
  signal rd_pntr         : std_logic_vector(PTR_WIDTH-1 downto 0);
  signal rd_pntr_wr      : std_logic_vector(PTR_WIDTH-1 downto 0);
  signal axis_rd_data_count         : std_logic_vector(PTR_WIDTH downto 0);
  signal rd_ptr_dec     : std_logic_vector(C_MULTIBUFFER_DEPTH-1 downto 0);
  signal rd_gray        : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal rd_gray_wr     : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal next_rd_gray   : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal next_rd_gray_wr: std_logic_vector(GRAY_WIDTH-1 downto 0);
  -- Gray read counter synchronized with read clk
  signal rd_gray_sync   : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal rd_bin         : unsigned(GRAY_WIDTH-1 downto 0);
  signal rd_bins         : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal wr_bin         : unsigned(GRAY_WIDTH-1 downto 0);
  signal wr_bins         : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal ptr_dist       : unsigned(GRAY_WIDTH-1 downto 0);
  signal pntr_dist       : std_logic_vector(PTR_WIDTH-1 downto 0);
  -- Selection for write buffer
  signal wr_ptr         : unsigned(PTR_WIDTH-1 downto 0);
  signal wr_pntr         : std_logic_vector(PTR_WIDTH-1 downto 0);
  signal wr_pntr_rd         : std_logic_vector(PTR_WIDTH-1 downto 0);
  signal axis_wr_data_count         : std_logic_vector(PTR_WIDTH downto 0);
  signal wr_ptr_dec     : std_logic_vector(C_MULTIBUFFER_DEPTH-1 downto 0);
  signal wr_gray        : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal wr_gray_rd        : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal wr_gray_ahead  : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal wr_gray_ahead_rd  : std_logic_vector(GRAY_WIDTH-1 downto 0);

begin


EXISTING : if (C_EXTRA_SYNCS = 0) generate

begin

  -- pragma translate_off
  empty <= not(empty_n);
  full  <= not(full_n);
  -- pragma translate_on

  -- New buffer is filled is last data beat is written and the multibuffer is
  -- not full
  mb_push <= full_n and conv_ce and conv_last;
  -- Active buffer has been consumed when signal "mb_arg_done" is activated and
  -- the multibuffer is not empty.
  mb_pop  <= empty_n and mb_arg_done;

  -- Pointer to write buffer
  process(clk, ap_rst)
  begin
    if(ap_rst = '1') then
      wr_ptr        <= (others => '0');
      wr_ptr_dec    <= (others => '0');
      wr_ptr_dec(0) <= '1';
    elsif(clk'event and clk = '1') then
      if (mb_push_ok = '1') then
        if(wr_ptr = C_MULTIBUFFER_DEPTH-1) then
          wr_ptr <= (others => '0');
        else
          wr_ptr <= wr_ptr + 1;
        end if;
        wr_ptr_dec <= wr_ptr_dec(C_MULTIBUFFER_DEPTH-2 downto 0) & wr_ptr_dec(C_MULTIBUFFER_DEPTH-1);
      end if;
    end if;
  end process;

  -- Gray pointers (write) to manage status of multibuffer
  process(clk, ap_rst)
  begin
    if(ap_rst = '1') then
      wr_gray_ahead <= bin2gray(INIT_WR_GRAY_AHEAD,GRAY_WIDTH);
      wr_gray       <= bin2gray(INIT_WR_GRAY, GRAY_WIDTH);
    elsif(clk'event and clk = '1') then
      if (mb_push_ok = '1') then
        wr_gray_ahead <= gray_inc(wr_gray_ahead);
        wr_gray       <= gray_inc(wr_gray);
      end if;
    end if;
  end process;

  -- Generation of status full signal
  process(clk, ap_rst)
  begin
    if(ap_rst = '1') then
      full_n <= '0';
    elsif(clk'event and clk = '1') then
      if(full_n = '0') then
        -- Stay in full if wr_gray_ahead = next_rd_gray
        if(wr_gray_ahead = next_rd_gray) then
          full_n <= '0';
        else
          full_n <= '1';
        end if;
      else
        -- Move to full if writting and wr_gray_ahead = rd_gray
        if(wr_gray_ahead = rd_gray) then
          full_n <= not(mb_push_ok);
        else
          full_n <= '1';
        end if;
      end if;
    end if;
  end process;

  -- Selection pointer for read buffer (pop)
  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      rd_ptr        <= (others => '0');
      rd_ptr_dec    <= (others => '0');
      rd_ptr_dec(0) <= '1';
    elsif(ap_clk'event and ap_clk = '1') then
      if (mb_pop_ok = '1') then
        if(rd_ptr = C_MULTIBUFFER_DEPTH-1) then
          rd_ptr <= (others => '0');
        else
          rd_ptr <= rd_ptr + 1;
        end if;
        rd_ptr_dec <= rd_ptr_dec(C_MULTIBUFFER_DEPTH-2 downto 0) & rd_ptr_dec(C_MULTIBUFFER_DEPTH-1);
      end if;
    end if;
  end process;

  -- Gray pointers (read) to manage the status of multibuffer
  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      next_rd_gray <= bin2gray(INIT_RD_GRAY+1, GRAY_WIDTH);
      rd_gray      <= bin2gray(INIT_RD_GRAY, GRAY_WIDTH);
    elsif(ap_clk'event and ap_clk = '1') then
      if (mb_pop_ok = '1') then
        next_rd_gray <= gray_inc(next_rd_gray);
        rd_gray      <= next_rd_gray;
      end if;
    end if;
  end process;

  -- Generation of empty status signal 
  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      empty_n <= '0';
    elsif(ap_clk'event and ap_clk = '1') then
      if(empty_n = '0') then
        -- Stay in empty if rd_gray = wr_gray
        if(rd_gray = wr_gray) then
          empty_n <= '0';
        else
          empty_n <= '1';
        end if;
      else
        -- Move to empty if reading and next_rd_gray = wr_gray
        if(next_rd_gray = wr_gray) then
          empty_n <= not(mb_pop_ok);
        else
          empty_n <= '1';
        end if;
      end if;
    end if;
  end process;

  mb_push_ok <= mb_push and full_n;
  mb_pop_ok  <= mb_pop and empty_n;

  conv_rdy   <= full_n;
  mb_arg_rdy <= empty_n;


  -----------------
  -- STATUS INFO --
  -----------------

  -- Following logic is used to provide status information to software. Among
  -- others this information includes:
  --  * empty signal
  --  * full signal
  --  * Number of buffers used
  -- All this status information should be provided on the AXI clock domain

  -- NUMBER OF USED BUFFERS:
  -- this value is calculated based on the distance between the read and write
  -- pointers.

  -- Synchronization of rd_gray to reduce metastability issues. This will
  -- introduce a latency of one clock on rd_clk
  process(clk, ap_rst)
  begin
    if(ap_rst = '1') then
      rd_gray_sync <= bin2gray(INIT_RD_GRAY, GRAY_WIDTH);
    elsif(clk'event and clk = '1') then
      rd_gray_sync <= rd_gray;
    end if;
  end process;

  rd_bin <= unsigned(gray2bin(rd_gray_sync));

  process(clk, ap_rst)
  begin
    if(ap_rst = '1') then
      wr_bin <= to_unsigned(INIT_WR_GRAY, GRAY_WIDTH);
    elsif(clk'event and clk = '1') then
      if (mb_push_ok = '1') then
        wr_bin <= wr_bin + 1;
      end if;
    end if;
  end process;

  -- If comparing pointers happens during write, then there will be a one cycle
  -- latency to reflect the status of the fifo. To refresh inmediately, during
  -- a write we increment the counter.
  process(clk, ap_rst)
  begin
    if(ap_rst = '1') then
      ptr_dist <= (others => '0');
    elsif(clk'event and clk = '1') then
      if (mb_push_ok = '1') then
        ptr_dist <= ptr_dist + 1;
      else
        -- This is also valid when we arrive at the end of counting sequence
        -- for wr_bin < rd_bin
        ptr_dist <= wr_bin - rd_bin;
      end if;
    end if;
  end process;

  process(ptr_dist)
  begin
    status_used                 <= (others => '0');
    status_used(ptr_dist'range) <= std_logic_vector(ptr_dist);
  end process;

  -- STATUS FULL:
  -- this signal is generated in the AXI clock domain; Hence, status_full
  -- is just a simple copy of the internal signal
  status_full <= not(full_n);

  -- STATUS EMPTY:
  -- This signal represents the empty status of the multibiffer from the point
  -- of view of the write port (AXI clock domain)
  process(clk, ap_rst)
  begin
    if(ap_rst = '1') then
      status_empty_i <= '1';
    elsif(clk'event and clk = '1') then
      -- If write, we exit the empty condition inmediately
      if(mb_push_ok = '1') then
        status_empty_i <= '0';
      else
        -- Stay in empty if rd_gray = wr_gray
        if(rd_gray = wr_gray) then
          status_empty_i <= '1';
        else
          status_empty_i <= '0';
        end if;
      end if;
    end if;
  end process;

  status_empty <= status_empty_i;

end generate EXISTING;
------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
NEW_INTRO : if (C_EXTRA_SYNCS = 1) generate
   CONSTANT LOG2DEPTH                       : integer := log2(C_MULTIBUFFER_DEPTH);
     CONSTANT ONE       : std_logic_vector(PTR_WIDTH-1 DOWNTO 0) 
    := int2lv(1, PTR_WIDTH);

 begin  

   
  -- pragma translate_off
  empty <= not(empty_n);
  full  <= not(full_n);
  ap_rstn  <= not(ap_rst);
  rstn  <= not(rst);
  -- pragma translate_on

  -- New buffer is filled is last data beat is written and the multibuffer is
  -- not full
  mb_push <= full_n and conv_ce and conv_last;
  -- Active buffer has been consumed when signal "mb_arg_done" is activated and
  -- the multibuffer is not empty.
  mb_pop  <= empty_n and mb_arg_done;

  -- Pointer to write buffer
  process(clk, rst)
  begin
    if(rst = '1') then
      wr_pntr        <= (others => '0');
    elsif(clk'event and clk = '1') then
      if (mb_push_ok = '1') then
        if(wr_pntr = int2lv(C_MULTIBUFFER_DEPTH-1,PTR_WIDTH)) then
          wr_pntr <= (others => '0');
        else
          wr_pntr <= wr_pntr + ONE;
        end if;
      end if;
    end if;
  end process;


 process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      rd_pntr        <= (others => '0');
    elsif(ap_clk'event and ap_clk = '1') then
      if (mb_pop_ok = '1') then
        if(rd_pntr =int2lv(C_MULTIBUFFER_DEPTH-1,PTR_WIDTH)) then
          rd_pntr <= (others => '0');
        else
          rd_pntr <= rd_pntr + ONE;
        end if;
      end if;
    end if;
  end process;




    -- Gray pointers (write) to manage status of multibuffer
  process(clk, rst)
  begin
    if(rst = '1') then
      wr_gray_ahead <= bin2gray(INIT_WR_GRAY_AHEAD,GRAY_WIDTH);
      wr_gray       <= bin2gray(INIT_WR_GRAY, GRAY_WIDTH);
    elsif(clk'event and clk = '1') then
      if (mb_push_ok = '1') then
        wr_gray_ahead <= gray_inc(wr_gray_ahead);
        wr_gray       <= gray_inc(wr_gray);
      end if;
    end if;
  end process;


    -- Gray pointers (read) to manage the status of multibuffer
  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      next_rd_gray <= bin2gray(INIT_RD_GRAY+1, GRAY_WIDTH);
      rd_gray      <= bin2gray(INIT_RD_GRAY, GRAY_WIDTH);
    elsif(ap_clk'event and ap_clk = '1') then
      if (mb_pop_ok = '1') then
        next_rd_gray <= gray_inc(next_rd_gray);
        rd_gray      <= next_rd_gray;
      end if;
    end if;
  end process;


  
      clkx_1: ENTITY axis_accelerator_adapter_v2_1_16.clk_x_pntrs
        GENERIC MAP(
          C_HAS_RST              => 1,
          C_RD_PNTR_WIDTH        => GRAY_WIDTH,     
          C_WR_PNTR_WIDTH        => GRAY_WIDTH,
          C_MSGON_VAL            => 1,
          C_SYNCHRONIZER_STAGE   => C_MTBF_STAGES
          )
        PORT MAP(
          WR_CLK         => clk,   
          RD_CLK         => ap_clk,   
          WR_RST         => rst,   
          RD_RST         => ap_rst,   
          WR_PNTR        => wr_gray,   
          RD_PNTR        => rd_gray,   
          WR_PNTR_RD     => wr_gray_rd,   
          RD_PNTR_WR     => rd_gray_wr     
          );

      clkx_2: ENTITY axis_accelerator_adapter_v2_1_16.clk_x_pntrs
        GENERIC MAP(
          C_HAS_RST              => 1,
          C_RD_PNTR_WIDTH        => GRAY_WIDTH,     
          C_WR_PNTR_WIDTH        => GRAY_WIDTH,
          C_MSGON_VAL            => 1,
          C_SYNCHRONIZER_STAGE   => C_MTBF_STAGES
          )
        PORT MAP(
          WR_CLK         => clk,   
          RD_CLK         => ap_clk,   
          WR_RST         => rst,   
          RD_RST         => ap_rst,   
          WR_PNTR        => wr_gray_ahead,   
          RD_PNTR        => next_rd_gray,   
          WR_PNTR_RD     => wr_gray_ahead_rd,   
          RD_PNTR_WR     => next_rd_gray_wr     
          );

       clkx_3: ENTITY axis_accelerator_adapter_v2_1_16.clk_x_pntrs
        GENERIC MAP(
          C_HAS_RST              => 1,
          C_RD_PNTR_WIDTH        => PTR_WIDTH,     
          C_WR_PNTR_WIDTH        => PTR_WIDTH,
          C_MSGON_VAL            => 1,
          C_SYNCHRONIZER_STAGE   => C_MTBF_STAGES
          )
        PORT MAP(
          WR_CLK         => clk,   
          RD_CLK         => ap_clk,   
          WR_RST         => rst,   
          RD_RST         => ap_rst,   
          WR_PNTR        => wr_pntr,   
          RD_PNTR        => rd_pntr,   
          WR_PNTR_RD     => wr_pntr_rd,   
          RD_PNTR_WR     => rd_pntr_wr     
          );





       -- Generation of status full signal
  process(clk, rst)
  begin
    if(rst = '1') then
      full_n <= '0';
    elsif(clk'event and clk = '1') then
      if(full_n = '0') then
        -- Stay in full if wr_gray_ahead = next_rd_gray
        if(wr_gray_ahead = next_rd_gray_wr) then
          full_n <= '0';
        else
          full_n <= '1';
        end if;
      else
        -- Move to full if writting and wr_gray_ahead = rd_gray
        if(wr_gray_ahead = rd_gray_wr) then
          full_n <= not(mb_push_ok);
        else
          full_n <= '1';
        end if;
      end if;
    end if;
  end process;

    -- Generation of empty status signal 
  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      empty_n <= '0';
    elsif(ap_clk'event and ap_clk = '1') then
      if(empty_n = '0') then
        -- Stay in empty if rd_gray = wr_gray
        if(rd_gray = wr_gray_rd) then
          empty_n <= '0';
        else
          empty_n <= '1';
        end if;
      else
        -- Move to empty if reading and next_rd_gray = wr_gray
        if(next_rd_gray = wr_gray_rd) then
          empty_n <= not(mb_pop_ok);
        else
          empty_n <= '1';
        end if;
      end if;
    end if;
  end process;

  mb_push_ok <= mb_push and full_n;
  mb_pop_ok  <= mb_pop and empty_n;

  conv_rdy   <= full_n;
  mb_arg_rdy <= empty_n;

--          AP_IRGRDY_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
--        generic map (
--        C_CDC_TYPE                 => 1,
--        C_RESET_STATE              => 0,
--        C_SINGLE_BIT               => 1,
--        C_FLOP_INPUT               => 1,
--        C_VECTOR_WIDTH             => 2,
--        C_MTBF_STAGES              => C_MTBF_STAGES
--        )
--        port map (
--        prmry_aclk                 => ap_clk,
--        prmry_resetn               => ap_rstn,
--	prmry_in                   => mb_arg_rdy_i,
--        prmry_vect_in              => (others=>'0'),
--
--        scndry_aclk                => clk,
--        scndry_resetn              => rstn,
--        scndry_out                 => mb_arg_rdy,
--        scndry_vect_out            => open
--        );


  


MBn : if (C_MULTIBUFFER_DEPTH > 1) generate
begin
 process(clk, rst)
  begin
    if(rst = '1') then
      pntr_dist <= (others => '0');
    elsif(clk'event and clk = '1') then
      if (mb_push_ok = '1') then
        pntr_dist <= pntr_dist + 1;
     else
      --  pntr_dist <= ('0' & wr_pntr) - ( '0' & rd_pntr_wr);
        pntr_dist <= ( wr_pntr) - ( rd_pntr_wr);
        --pntr_dist <= ( wr_bins) - ( rd_bins);
      end if;
    end if;
  end process;
end generate MBn;

MB1 : if (C_MULTIBUFFER_DEPTH = 1) generate
begin

    rd_bins <= rd_gray_wr;

  process(clk, rst)
  begin
    if(rst = '1') then
      wr_bins <= (others => '0');
    elsif(clk'event and clk = '1') then
      if (mb_push_ok = '1') then
        wr_bins <= wr_bins + 1;
      end if;
    end if;
  end process;

 process(clk, rst)
  begin
    if(rst = '1') then
      pntr_dist <= (others => '0');
    elsif(clk'event and clk = '1') then
      if (mb_push_ok = '1') then
        pntr_dist <= pntr_dist + 1;
     else
        pntr_dist <= ( wr_bins) - ( rd_bins);
      end if;
    end if;
  end process;
end generate MB1;


  process(pntr_dist)
  begin
    status_used                 <= (others => '0');
    status_used(pntr_dist'range) <= (pntr_dist);
  end process;

    -- STATUS FULL:
  -- this signal is generated in the AXI clock domain; Hence, status_full
  -- is just a simple copy of the internal signal
  status_full <= not(full_n);

  -- STATUS EMPTY:
  -- This signal represents the empty status of the multibiffer from the point
  -- of view of the write port (AXI clock domain)


 process(clk, rst)
  begin
    if(rst = '1') then
      status_empty_i <= '1';
    elsif(clk'event and clk = '1') then
      -- If write, we exit the empty condition inmediately
      if(mb_push_ok = '1') then
        status_empty_i <= '0';
      else
        -- Stay in empty if rd_gray = wr_gray
        if(rd_gray_wr = wr_gray) then
          status_empty_i <= '1';
        else
          status_empty_i <= '0';
        end if;
      end if;
    end if;
  end process;

  status_empty <= status_empty_i;



end generate NEW_INTRO;



    LINEAR_BANK_GEN : if not(USE_COLUMNIZED_BANK) generate
    -- Efective width for input address bus (conv_addr)
    function calc_eff_addr_width return integer is
      variable addr_width : integer;
    begin
      if(CONV_DATA_WIDTH > C_AP_ARG_DATA_WIDTH) then
        addr_width := C_AP_ARG_ADDR_WIDTH-log2(CONV_DATA_WIDTH/C_AP_ARG_DATA_WIDTH);
      else
        addr_width := C_AP_ARG_ADDR_WIDTH+log2(C_AP_ARG_DATA_WIDTH/CONV_DATA_WIDTH);
      end if;
      return addr_width;
    end function calc_eff_addr_width;

    constant EFF_ADDR_WIDTH   : integer := calc_eff_addr_width;
    constant IPORT_ADDR_WIDTH : integer := EFF_ADDR_WIDTH+log2(C_MULTIBUFFER_DEPTH);
    constant OPORT_ADDR_WIDTH : integer := C_AP_ARG_ADDR_WIDTH+log2(C_MULTIBUFFER_DEPTH);

    signal iport_addr : std_logic_vector(IPORT_ADDR_WIDTH-1 downto 0);
    -- Width of address bus of output port is the addition of number of bits
    -- required by input argument plus the required bits to select the
    -- appropiate bank (PTR_WIDTH).
    signal oport_addr : std_logic_vector(OPORT_ADDR_WIDTH-1 downto 0);

  begin
    MB1_addr : if (C_MULTIBUFFER_DEPTH = 1) generate
    begin
    iport_addr <= conv_addr(EFF_ADDR_WIDTH-1 downto 0);
    oport_addr <= ap_arg_addr;
    end generate MB1_addr;

    MBn_addr : if (C_MULTIBUFFER_DEPTH > 1) generate
    begin
     iport_addr <= std_logic_vector(wr_pntr) & conv_addr(EFF_ADDR_WIDTH-1 downto 0);
     oport_addr <= std_logic_vector(rd_pntr) & ap_arg_addr;
    end generate MBn_addr;


    MEM_I : entity axis_accelerator_adapter_v2_1_16.arg_mem_bank
      generic map (
        C_FAMILY       => C_FAMILY,
        C_BRAM_TYPE    => C_BRAM_TYPE,
        C_IS_UNIDIR    => 1,
        C_SELECT_XPM   => C_SELECT_XPM,
        C_IPORT_DWIDTH => CONV_DATA_WIDTH,
        C_IPORT_AWIDTH => IPORT_ADDR_WIDTH,
        C_OPORT_DWIDTH => C_AP_ARG_DATA_WIDTH,
        C_OPORT_AWIDTH => OPORT_ADDR_WIDTH)
      port map (
        rst        => ap_rst,
        iport_clk  => clk,
        iport_ce   => conv_ce,
        iport_we   => '1',
        iport_addr => iport_addr,
        iport_din  => conv_data,
        iport_dout => open,
        oport_clk  => ap_clk,
        oport_ce   => ap_arg_ce,
        oport_we   => ap_arg_we,
        oport_addr => oport_addr,
        oport_din  => ap_arg_din,
        oport_dout => ap_arg_dout);
  end generate LINEAR_BANK_GEN;

  COLUMNIZED_BANK_GEN : if (USE_COLUMNIZED_BANK) generate
  begin

    MEM_I : entity axis_accelerator_adapter_v2_1_16.iarg_columnized_mem_bank
      generic map (
        C_FAMILY       => C_FAMILY,
        C_BRAM_TYPE    => C_BRAM_TYPE,
        C_FACTOR       => C_AP_ARG_FORMAT_FACTOR,
        C_BUFFER_WIDTH => PTR_WIDTH,
        C_CONV_AWIDTH  => CONV_ADDR_WIDTH,
        C_CONV_DWIDTH  => CONV_DATA_WIDTH,
        C_ARG_WIDTH    => C_AP_ARG_WIDTH,
        C_ARG_AWIDTH   => C_AP_ARG_ADDR_WIDTH)
      port map (
        ap_rst        => ap_rst,
        clk           => clk,
        conv_ce       => conv_ce,
        conv_we       => conv_we,
        conv_buffer   => std_logic_vector(wr_ptr),
        conv_addr     => conv_addr,
        conv_data     => conv_data,
        ap_clk        => ap_clk,
        ap_arg_ce     => ap_arg_ce,
        ap_arg_we     => ap_arg_we,
        ap_arg_buffer => std_logic_vector(rd_ptr),
        ap_arg_addr   => ap_arg_addr,
        ap_arg_din    => ap_arg_din,
        ap_arg_dout   => ap_arg_dout);

  end generate COLUMNIZED_BANK_GEN;


end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : xd_s2m_converter.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2012-11-04
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-- 2013-08-01  2.0	pvk     Removed conv_bank port.Not being used.
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;

entity xd_s2m_converter is
  generic (
    -- System generics:
    C_FAMILY       : string;            -- Xilinx FPGA family
    AXI_DATA_WIDTH : integer;
    AXI_ADDR_WIDTH : integer;
    C_EXTRA_SYNCS  : integer);
  port (
    axi_clk   : in  std_logic;
    axi_rst   : in  std_logic;
    axis_vld  : in  std_logic;
    axis_rdy  : out std_logic;
    axis_last : in  std_logic;
    axis_keep : in  std_logic_vector((AXI_DATA_WIDTH/8)-1 downto 0);
    axis_data : in  std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    --conv_bank : out std_logic_vector(5 downto 0);
    conv_addr : out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    conv_ce   : out std_logic;
    conv_we   : out std_logic;
    conv_last : out std_logic;
    conv_rdy  : in  std_logic;
    conv_data : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0));
end entity;

architecture rtl of xd_s2m_converter is
  signal axis_rdy_i : std_logic;
  signal addr_cnt   : unsigned(AXI_ADDR_WIDTH-1 downto 0);

begin

  axis_rdy <= axis_rdy_i;

  process(axi_clk)
  begin
    if(axi_clk'event and axi_clk = '1') then
      if(axi_rst = '1' or (axis_vld and axis_rdy_i and axis_last) = '1') then
        addr_cnt <= (others => '0');
      elsif((axis_vld and axis_rdy_i) = '1') then
        addr_cnt <= addr_cnt + 1;
      end if;
    end if;
  end process;

  -- Used a simple approach; would be good to elaborate more in the long term.
  conv_we    <= or_reduce(axis_keep);
  conv_ce    <= axis_vld;
  conv_data  <= axis_data;
  conv_last  <= axis_last;
  axis_rdy_i <= conv_rdy;
  conv_addr  <= std_logic_vector(addr_cnt);

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : xd_m2s_memory_dc.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-10-25
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.arg_mem_bank;
use axis_accelerator_adapter_v2_1_16.oarg_columnized_mem_bank;
use axis_accelerator_adapter_v2_1_16.srl_fifo_32_wt;


entity xd_m2s_memory_dc is
  generic (
    -- System generics:
    C_FAMILY               : string ;      -- Xilinx FPGA family
    C_MTBF_STAGES          : integer;
    C_BRAM_TYPE            : string := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2
    SIZE_WIDTH             : integer;
    CONV_DATA_WIDTH        : integer;
    CONV_ADDR_WIDTH        : integer;
    C_AP_ARG_DATA_WIDTH    : integer;
    C_SELECT_XPM           : integer := 0;
    C_AP_ARG_ADDR_WIDTH    : integer;
    C_MULTIBUFFER_DEPTH    : integer;
    C_AP_ARG_WIDTH         : integer;
    C_AP_ARG_N_DIM         : integer;
    C_AP_ARG_DIMS          : int_vector;
    C_AP_ARG_DIM_1         : integer;
    C_AP_ARG_DIM_2         : integer;
    C_AP_ARG_FORMAT_TYPE   : integer;
    C_AP_ARG_FORMAT_FACTOR : integer;
    C_AP_ARG_FORMAT_DIM    : integer;
    C_NONE                 : integer := 2);
  port (
    clk           : in  std_logic;
    rst           : in  std_logic;
    conv_addr     : in  std_logic_vector(CONV_ADDR_WIDTH-1 downto 0);
    conv_ce       : in  std_logic;
    conv_we       : in  std_logic;
    conv_last     : in  std_logic;
    conv_rdy      : out std_logic;
    conv_data     : out std_logic_vector(CONV_DATA_WIDTH-1 downto 0);
    conv_size     : out std_logic_vector(SIZE_WIDTH-1 downto 0);
    sw_length     : in  std_logic_vector(31 downto 0);
    sw_length_we  : in  std_logic;
    use_sw_length : in  std_logic;
    ap_clk        : in  std_logic;
    ap_rst        : in  std_logic;
    ap_arg_addr   : in  std_logic_vector(C_AP_ARG_ADDR_WIDTH-1 downto 0);
    ap_arg_ce     : in  std_logic;
    ap_arg_we     : in  std_logic;
    ap_arg_din    : in  std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    ap_arg_dout   : out std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    ap_arg_rqt    : out std_logic;
    ap_arg_ack    : in  std_logic;
    -- Status info
    ap_arg_empty  : out std_logic;
    ap_arg_full   : out std_logic;
    ap_arg_used   : out std_logic_vector(3 downto 0));  -- Number of used buffers
end entity;

architecture rtl of xd_m2s_memory_dc is

  function calc_sw_length_fifo_width return integer is
    variable N_elements : integer;
  begin
    if (C_AP_ARG_N_DIM = 2) then
      N_elements := C_AP_ARG_DIM_1*C_AP_ARG_DIM_2;
    else
      N_elements := C_AP_ARG_DIM_1;
    end if;
    return log2(N_elements)+1;
  end function calc_sw_length_fifo_width;

  function calc_use_columnized_bank return boolean is
    variable ret : boolean := false;
  begin
    if (C_AP_ARG_N_DIM = 2) then
      if(C_AP_ARG_FORMAT_TYPE = FORMAT_TYPE_RESHAPE_BLOCK) then
        if(C_AP_ARG_FORMAT_DIM = 1 and C_AP_ARG_FORMAT_FACTOR > 1) then
          ret := true;
        end if;
      end if;
    end if;
    return ret;
  end function calc_use_columnized_bank;

  --------------------------------------------------------------------------
  -- C_AP_ARG_DIMS generic is a vector with range between 1 and C_AP_ARG_N_DIM.
  -- It follows VivadoHLS approach (i.e., dimension 1 is the closest to the
  -- varibale declaration). For example, A[2][4][8]:
  --  C_AP_ARG_DIMS[1] = 2
  --  C_AP_ARG_DIMS[2] = 4
  --  C_AP_ARG_DIMS[3] = 8
  -- For the memory bank organization, it's easier to have this sorted
  -- differently, so it reflects the linear organization in which is stored in
  -- memory. That is, the dimension more far away from definition is 0 and
  -- closest is C_AP_ARG_N_DIM-1. For previous example:
  --  ARG_DIMS[2] = 2
  --  ARG_DIMS[1] = 4
  --  ARG_DIMS[0] = 8
  constant ARG_DIMS     : int_vector(0 to C_AP_ARG_N_DIM-1) := C_AP_ARG_DIMS;
  
  function calc_addr_lsb return int_vector is
    variable lsb_vector : int_vector(C_AP_ARG_N_DIM-1 downto 0);
    variable msb_vector : int_vector(C_AP_ARG_N_DIM-1 downto 0);
    variable lsb        : integer := 0;
    variable dim_width  : integer;
  begin
    for i in 0 to C_AP_ARG_N_DIM-1 loop
      dim_width     := log2(ARG_DIMS(i));
      lsb_vector(i) := lsb;
      msb_vector(i) := lsb+dim_width-1;
      lsb           := lsb + dim_width;
    end loop;
    return lsb_vector;
  end function calc_addr_lsb;

  function calc_addr_msb return int_vector is
    variable lsb_vector : int_vector(C_AP_ARG_N_DIM-1 downto 0);
    variable msb_vector : int_vector(C_AP_ARG_N_DIM-1 downto 0);
    variable lsb        : integer := 0;
    variable dim_width  : integer;
  begin
    for i in 0 to C_AP_ARG_N_DIM-1 loop
      dim_width     := log2(ARG_DIMS(i));
      lsb_vector(i) := lsb;
      msb_vector(i) := lsb+dim_width-1;
      lsb           := lsb + dim_width;
    end loop;
    return msb_vector;
  end function calc_addr_msb;
  
  --constant PTR_WIDTH            : integer                                      := log2(C_MULTIBUFFER_DEPTH);
  constant PTR_WIDTH           : integer := if_then_else((C_MULTIBUFFER_DEPTH = 1),1,log2(C_MULTIBUFFER_DEPTH));
  constant GRAY_WIDTH           : integer                                      := calc_gray_width(C_MULTIBUFFER_DEPTH);
  constant INIT_RD_GRAY         : integer                                      := 0;
  constant INIT_WR_GRAY         : integer                                      := INIT_RD_GRAY;
  constant INIT_WR_GRAY_AHEAD   : integer                                      := INIT_RD_GRAY-C_MULTIBUFFER_DEPTH+1;
  constant conv_din_zero        : std_logic_vector(CONV_DATA_WIDTH-1 downto 0) := (others => '0');
  constant SW_LENGTH_FIFO_WIDTH : integer                                      := calc_sw_length_fifo_width;
  constant USE_COLUMNIZED_BANK  : boolean                                      := calc_use_columnized_bank;

  signal empty_n       : std_logic;
  signal full_n        : std_logic;
  -- Multibuffer push/pop
  signal mb_push       : std_logic;
  signal mb_pop        : std_logic;
  signal mb_push_ok    : std_logic;
  signal mb_pop_ok     : std_logic;
  signal mb_pop_ok1     : std_logic;
  signal mb_pop_ok_rd  : std_logic;
  signal mb_pop_ok_vect: std_logic_vector(0 downto 0);
  --
  signal iport_ce      : std_logic;     -- ap_arg_ce validated with full_n 
  signal oport_ce      : std_logic;     -- conv_ce validated with empty_n
  -- Read buffer selection
  signal rd_ptr        : unsigned(PTR_WIDTH-1 downto 0); 
  signal rd_pntr       : std_logic_vector(PTR_WIDTH-1 downto 0); 
  signal rd_pntr_wr    : std_logic_vector(PTR_WIDTH-1 downto 0); 
  signal rd_ptr_dec    : std_logic_vector(C_MULTIBUFFER_DEPTH-1 downto 0); 
  signal rd_gray       : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal rd_gray_wr    : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal next_rd_gray  : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal next_rd_gray_wr: std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal prev_rd_gray  : std_logic_vector(GRAY_WIDTH-1 downto 0);
  -- Gray counter for writes synchronized with read clock
  signal wr_gray_sync  : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal rd_bin        : unsigned(GRAY_WIDTH-1 downto 0);
  signal rd_bins        : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal wr_bin        : unsigned(GRAY_WIDTH-1 downto 0);
  signal wr_bins        : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal ptr_dist      : unsigned(GRAY_WIDTH-1 downto 0);
  signal pntr_dist     : std_logic_vector(PTR_WIDTH-1 downto 0);
  -- Write buffer selection
  signal wr_ptr        : unsigned(PTR_WIDTH-1 downto 0);
  signal wr_pntr       : std_logic_vector(PTR_WIDTH-1 downto 0);
  signal wr_pntr_rd    : std_logic_vector(PTR_WIDTH-1 downto 0);
  signal wr_ptr_dec    : std_logic_vector(C_MULTIBUFFER_DEPTH-1 downto 0);
  signal wr_gray       : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal wr_gray_rd    : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal wr_gray_ahead : std_logic_vector(GRAY_WIDTH-1 downto 0);
  signal wr_gray_ahead_rd : std_logic_vector(GRAY_WIDTH-1 downto 0);
  -- Only required for almost empty:
  signal prev_wr_gray  : std_logic_vector(GRAY_WIDTH-1 downto 0);

  -- pragma translate_off
  signal empty : std_logic;
  signal full  : std_logic;
  -- pragma translate_on

  signal ap_arg_hw_length : unsigned(C_AP_ARG_ADDR_WIDTH downto 0);
  signal ap_arg_length    : std_logic_vector(C_AP_ARG_ADDR_WIDTH downto 0);

  signal sw_length_fifo_dout : std_logic_vector(SW_LENGTH_FIFO_WIDTH-1 downto 0);
  signal sw_length_wr : std_logic_vector(SW_LENGTH_FIFO_WIDTH-1 downto 0);
  signal sw_length_rd : std_logic_vector(SW_LENGTH_FIFO_WIDTH-1 downto 0);
  signal sw_length_we_vector       : std_logic_vector(0 downto 0);
  signal sw_length_we_rd       : std_logic;
  signal sw_length_we_rd_vector       : std_logic_vector(0 downto 0);
  signal ap_arg_full_i       : std_logic;

  type   length_mem_type is array (2**PTR_WIDTH-1 downto 0) of std_logic_vector(C_AP_ARG_ADDR_WIDTH downto 0);
  signal hw_length_mem      : length_mem_type;
  signal hw_length_mem_dout : std_logic_vector(C_AP_ARG_ADDR_WIDTH downto 0);
  signal hw_length_mem_dout_rd : std_logic_vector(C_AP_ARG_ADDR_WIDTH downto 0);

  attribute ram_style                  : string;
  attribute ram_style of hw_length_mem : signal is "distributed";

  constant C_EXTRA_SYNCS  : integer   := 1; 

begin

  
EXISTING : if (C_EXTRA_SYNCS = 0) generate

begin


  -- pragma translate_off
  empty <= not(empty_n);
  full  <= not(full_n);
  -- pragma translate_on

  -- New buffer has been produced when accelerator generates ack and the
  -- multibuffer is not full.
  mb_push <= full_n and ap_arg_ack;
  -- New buffer consumed when the last data is read and the multibuffer is not
  -- empty.
  mb_pop  <= empty_n and conv_ce and conv_last;

  -- Selection pointer to write buffer (push)
  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      wr_ptr        <= (others => '0');
      wr_ptr_dec    <= (others => '0');
      wr_ptr_dec(0) <= '1';
    elsif(ap_clk'event and ap_clk = '1') then
      if (mb_push_ok = '1') then
        if(wr_ptr = C_MULTIBUFFER_DEPTH-1) then
          wr_ptr <= (others => '0');
        else
          wr_ptr <= wr_ptr + 1;
        end if;
        wr_ptr_dec <= wr_ptr_dec(C_MULTIBUFFER_DEPTH-2 downto 0) & wr_ptr_dec(C_MULTIBUFFER_DEPTH-1);
      end if;
    end if;
  end process;

  -- Gray pointers (write) to manage status of multibuffer
  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      wr_gray_ahead <= bin2gray(INIT_WR_GRAY_AHEAD, GRAY_WIDTH);
      wr_gray       <= bin2gray(INIT_WR_GRAY, GRAY_WIDTH);
      prev_wr_gray  <= bin2gray(INIT_WR_GRAY-1, GRAY_WIDTH);
    elsif(ap_clk'event and ap_clk = '1') then
      if (mb_push_ok = '1') then
        wr_gray_ahead <= gray_inc(wr_gray_ahead);
        wr_gray       <= gray_inc(wr_gray);
        prev_wr_gray  <= wr_gray;
      end if;
    end if;
  end process;

  -- Full status signal generation
  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      full_n <= '0';
    elsif(ap_clk'event and ap_clk = '1') then
      if(full_n = '0') then
        -- Stay in full if wr_gray_ahead = next_rd_gray
        if(wr_gray_ahead = next_rd_gray) then
          full_n <= '0';
        else
          full_n <= '1';
        end if;
      else
        -- Go to full if writting and wr_gray_ahead = rd_gray
        if(wr_gray_ahead = rd_gray) then
          full_n <= not(mb_push_ok);
        else
          full_n <= '1';
        end if;
      end if;
    end if;
  end process;

  -- Read buffer selection pointer (pop)
  process(clk, rst)
  begin
    if(rst = '1') then
      rd_ptr        <= (others => '0');
      rd_ptr_dec    <= (others => '0');
      rd_ptr_dec(0) <= '1';
    elsif(clk'event and clk = '1') then
      if (mb_pop_ok = '1') then
        if(rd_ptr = C_MULTIBUFFER_DEPTH-1) then
          rd_ptr <= (others => '0');
        else
          rd_ptr <= rd_ptr + 1;
        end if;
        rd_ptr_dec <= rd_ptr_dec(C_MULTIBUFFER_DEPTH-2 downto 0) & rd_ptr_dec(C_MULTIBUFFER_DEPTH-1);
      end if;
    end if;
  end process;

  -- Gray pointers (read) to manage status of multibuffer
  process(clk, rst)
  begin
    if(rst = '1') then
      next_rd_gray <= bin2gray(INIT_RD_GRAY+1, GRAY_WIDTH);
      rd_gray      <= bin2gray(INIT_RD_GRAY, GRAY_WIDTH);
      prev_rd_gray <= bin2gray(INIT_RD_GRAY-1, GRAY_WIDTH);
    elsif(clk'event and clk = '1') then
      if (mb_pop_ok = '1') then
        next_rd_gray <= gray_inc(next_rd_gray);
        rd_gray      <= next_rd_gray;
        prev_rd_gray <= rd_gray;
      end if;
    end if;
  end process;

  -- Empty status signal generation:
  process(clk, rst)
  begin
    if(rst = '1') then
      empty_n <= '0';
    elsif(clk'event and clk = '1') then
      if(empty_n = '0') then
        -- Stay in empty if rd_gray = wr_gray
        if(rd_gray = wr_gray) then
          empty_n <= '0';
        else
          empty_n <= '1';
        end if;
      else
        -- Move to empty if reading and next_rd_gray = wr_gray
        if(next_rd_gray = wr_gray) then
          empty_n <= not(mb_pop_ok);
        else
          empty_n <= '1';
        end if;
      end if;
    end if;
  end process;

  mb_push_ok <= mb_push and full_n;

  -- Management of pseudo-static buffers
  -- Para los argumentos de salida no hay buffers pseudo-estáticos.
  mb_pop_ok <= mb_pop and empty_n;

  ---------------------------------------------
  conv_rdy   <= empty_n;
  ap_arg_rqt <= full_n;

  iport_ce <= ap_arg_ce and full_n;
  oport_ce <= conv_ce and empty_n;


  -- Number of used buffers it's calculated as the distance between read/write
  -- pointers

  -- synch wr_gray to reduce metastability. Added one cycle clock latency on rd_clk
  process(clk, rst)
  begin
    if(rst = '1') then
      wr_gray_sync <= bin2gray(INIT_WR_GRAY, GRAY_WIDTH);
    elsif(clk'event and clk = '1') then
      wr_gray_sync <= wr_gray;
    end if;
  end process;

  wr_bin <= unsigned(gray2bin(wr_gray_sync));

  process(clk, rst)
  begin
    if(rst = '1') then
      rd_bin <= to_unsigned(INIT_RD_GRAY, GRAY_WIDTH);
    elsif(clk'event and clk = '1') then
      if (mb_pop_ok = '1') then
        rd_bin <= rd_bin + 1;
      end if;
    end if;
  end process;

  -- If we only look at the pointers, there will be one cycle latency to reflect
  -- the status of the fifo. To refresh inmediately during a read, we decrement
  -- the counter
  process(clk, rst)
  begin
    if(rst = '1') then
      ptr_dist <= (others => '0');
    elsif(clk'event and clk = '1') then
      if (mb_pop_ok = '1') then
        ptr_dist <= ptr_dist - 1;
      else
        -- This ia also valid when we arrive at the end of sequence counter wr_bin < rd_bin
        ptr_dist <= wr_bin - rd_bin;
      end if;
    end if;
  end process;

  process(ptr_dist)
  begin
    ap_arg_used                 <= (others => '0');
    ap_arg_used(ptr_dist'range) <= std_logic_vector(ptr_dist);
  end process;

  -- Status signals empty/full should be synchronized with AXI clk
  ap_arg_empty <= not(empty_n);

  process(clk, rst)
  begin
    if(rst = '1') then
      ap_arg_full_i <= '1';
    elsif(clk'event and clk = '1') then
      -- If read, we move out of full state
      if(mb_pop_ok = '1') then
        ap_arg_full_i <= '0';
      else
        -- Stay in full if wr_gray_ahead = next_rd_gray
        if(wr_gray_ahead = next_rd_gray) then
          ap_arg_full_i <= '1';
        else
          ap_arg_full_i <= '0';
        end if;
      end if;
    end if;
  end process;

  ap_arg_full <= ap_arg_full_i;

end generate EXISTING;


NEW_INTRO : if (C_EXTRA_SYNCS = 1) generate
   CONSTANT LOG2DEPTH                       : integer := log2(C_MULTIBUFFER_DEPTH);
     CONSTANT ONE       : std_logic_vector(PTR_WIDTH-1 DOWNTO 0) 
    := int2lv(1, PTR_WIDTH);

 begin  

   
  -- pragma translate_off
  empty <= not(empty_n);
  full  <= not(full_n);
  -- pragma translate_on

  -- New buffer has been produced when accelerator generates ack and the
  -- multibuffer is not full.
  mb_push <= full_n and ap_arg_ack;
  -- New buffer consumed when the last data is read and the multibuffer is not
  -- empty.
  mb_pop  <= empty_n and conv_ce and conv_last;

  -- Selection pointer to write buffer (push)
  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      wr_pntr        <= (others => '0');
    elsif(ap_clk'event and ap_clk = '1') then
      if (mb_push_ok = '1') then
        if(wr_pntr = int2lv(C_MULTIBUFFER_DEPTH-1,PTR_WIDTH)) then
          wr_pntr <= (others => '0');
        else
          wr_pntr <= wr_pntr + ONE;
        end if;
      end if;
    end if;
  end process;


  process(clk, rst)
  begin
    if(rst = '1') then
      rd_pntr        <= (others => '0');
    elsif(clk'event and clk = '1') then
      if (mb_pop_ok_rd = '1') then
        if(rd_pntr = int2lv(C_MULTIBUFFER_DEPTH-1,PTR_WIDTH)) then
          rd_pntr <= (others => '0');
        else
          rd_pntr <= rd_pntr + ONE;
        end if;
      end if;
    end if;
  end process;


    -- Gray pointers (write) to manage status of multibuffer
  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      wr_gray_ahead <= bin2gray(INIT_WR_GRAY_AHEAD, GRAY_WIDTH);
      wr_gray       <= bin2gray(INIT_WR_GRAY, GRAY_WIDTH);
      prev_wr_gray  <= bin2gray(INIT_WR_GRAY-1, GRAY_WIDTH);
    elsif(ap_clk'event and ap_clk = '1') then
      if (mb_push_ok = '1') then
        wr_gray_ahead <= gray_inc(wr_gray_ahead);
        wr_gray       <= gray_inc(wr_gray);
        prev_wr_gray  <= wr_gray;
      end if;
    end if;
  end process;

    -- Gray pointers (read) to manage status of multibuffer
  process(clk, rst)
  begin
    if(rst = '1') then
      next_rd_gray <= bin2gray(INIT_RD_GRAY+1, GRAY_WIDTH);
      rd_gray      <= bin2gray(INIT_RD_GRAY, GRAY_WIDTH);
      prev_rd_gray <= bin2gray(INIT_RD_GRAY-1, GRAY_WIDTH);
    elsif(clk'event and clk = '1') then
      if (mb_pop_ok_rd = '1') then
        next_rd_gray <= gray_inc(next_rd_gray);
        rd_gray      <= next_rd_gray;
        prev_rd_gray <= rd_gray;
      end if;
    end if;
  end process;


  
      clkx_1: ENTITY axis_accelerator_adapter_v2_1_16.clk_x_pntrs
        GENERIC MAP(
          C_HAS_RST              => 1,
          C_RD_PNTR_WIDTH        => GRAY_WIDTH,     
          C_WR_PNTR_WIDTH        => GRAY_WIDTH,
          C_MSGON_VAL            => 1,
          C_SYNCHRONIZER_STAGE   => C_MTBF_STAGES
          )
        PORT MAP(
          WR_CLK         => ap_clk,   
          RD_CLK         => clk,   
          WR_RST         => ap_rst,   
          RD_RST         => rst,   
          WR_PNTR        => wr_gray,   
          RD_PNTR        => rd_gray,   
          WR_PNTR_RD     => wr_gray_rd,   
          RD_PNTR_WR     => rd_gray_wr     
          );

      clkx_2: ENTITY axis_accelerator_adapter_v2_1_16.clk_x_pntrs
        GENERIC MAP(
          C_HAS_RST              => 1,
          C_RD_PNTR_WIDTH        => GRAY_WIDTH,     
          C_WR_PNTR_WIDTH        => GRAY_WIDTH,
          C_MSGON_VAL            => 1,
          C_SYNCHRONIZER_STAGE   => C_MTBF_STAGES
          )
        PORT MAP(
          WR_CLK         => ap_clk,   
          RD_CLK         => clk,   
          WR_RST         => ap_rst,   
          RD_RST         => rst,   
          WR_PNTR        => wr_gray_ahead,   
          RD_PNTR        => next_rd_gray,   
          WR_PNTR_RD     => wr_gray_ahead_rd,   
          RD_PNTR_WR     => next_rd_gray_wr     
          );

       clkx_3: ENTITY axis_accelerator_adapter_v2_1_16.clk_x_pntrs
        GENERIC MAP(
          C_HAS_RST              => 1,
          C_RD_PNTR_WIDTH        => PTR_WIDTH,     
          C_WR_PNTR_WIDTH        => PTR_WIDTH,
          C_MSGON_VAL            => 1,
          C_SYNCHRONIZER_STAGE   => C_MTBF_STAGES
          )
        PORT MAP(
          WR_CLK         => ap_clk,   
          RD_CLK         => clk,   
          WR_RST         => ap_rst,   
          RD_RST         => rst,   
          WR_PNTR        => wr_pntr,   
          RD_PNTR        => rd_pntr,   
          WR_PNTR_RD     => wr_pntr_rd,   
          RD_PNTR_WR     => rd_pntr_wr     
          );




    -- Full status signal generation
  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      full_n <= '0';
    elsif(ap_clk'event and ap_clk = '1') then
      if(full_n = '0') then
        -- Stay in full if wr_gray_ahead = next_rd_gray
        if(wr_gray_ahead = next_rd_gray_wr) then
          full_n <= '0';
        else
          full_n <= '1';
        end if;
      else
        -- Go to full if writting and wr_gray_ahead = rd_gray
        if(wr_gray_ahead = rd_gray_wr) then
          full_n <= not(mb_push_ok);
        else
          full_n <= '1';
        end if;
      end if;
    end if;
  end process;





      prd1: PROCESS (clk, rst)
      BEGIN
       -- Register Stage #1 
        IF (rst = '1') THEN
          mb_pop_ok1 <= '0';
          mb_pop_ok_rd <= '0';
        ELSIF (clk'event and clk = '1') THEN
          mb_pop_ok1 <= mb_pop_ok;
          mb_pop_ok_rd <= mb_pop_ok1;
        END IF;
        END PROCESS prd1;



    -- Empty status signal generation:
  process(clk, rst)
  begin
    if(rst = '1') then
      empty_n <= '0';
    elsif(clk'event and clk = '1') then
      if(empty_n = '0') then
        -- Stay in empty if rd_gray = wr_gray
        if(rd_gray = wr_gray_rd) then
          empty_n <= '0';
        else
          empty_n <= '1';
        end if;
      else
        -- Move to empty if reading and next_rd_gray = wr_gray
        if(next_rd_gray = wr_gray_rd) then
          empty_n <= not(mb_pop_ok_rd);
        else
          empty_n <= '1';
        end if;
      end if;
    end if;
  end process;

  mb_push_ok <= mb_push and full_n;

  -- Management of pseudo-static buffers
  -- Para los argumentos de salida no hay buffers pseudo-estáticos.
  mb_pop_ok <= mb_pop and empty_n;

  ---------------------------------------------
  conv_rdy   <= empty_n;
  ap_arg_rqt <= full_n;

  iport_ce <= ap_arg_ce and full_n;
  oport_ce <= conv_ce and empty_n;

  -- If we only look at the pointers, there will be one cycle latency to reflect
  -- the status of the fifo. To refresh inmediately during a read, we decrement
  -- the counter
MBn : if (C_MULTIBUFFER_DEPTH > 1) generate
begin
  process(clk, rst)
  begin
    if(rst = '1') then
      pntr_dist <= (others => '0');
    elsif(clk'event and clk = '1') then
      if (mb_pop_ok_rd = '1') then
        pntr_dist <= pntr_dist - 1;
      else
        -- This ia also valid when we arrive at the end of sequence counter wr_bin < rd_bin
        --pntr_dist <= ('0' & wr_pntr_rd) - ('0' & rd_pntr);
        pntr_dist <= (wr_pntr_rd) - (rd_pntr);
      end if;
    end if;
  end process;

end generate MBn;


MB1 : if (C_MULTIBUFFER_DEPTH = 1) generate
begin

  process(clk, rst)
  begin
    if(rst = '1') then
      rd_bins <= (others => '0');
    elsif(clk'event and clk = '1') then
      if (mb_pop_ok_rd = '1') then
        rd_bins <= rd_bins + 1;
      end if;
    end if;
  end process;

  wr_bins <= wr_gray_rd;

  process(clk, rst)
  begin
    if(rst = '1') then
      pntr_dist <= (others => '0');
    elsif(clk'event and clk = '1') then
      if (mb_pop_ok_rd = '1') then
        pntr_dist <= pntr_dist - 1;
      else
        -- This ia also valid when we arrive at the end of sequence counter wr_bin < rd_bin
        --pntr_dist <= ('0' & wr_pntr_rd) - ('0' & rd_pntr);
        pntr_dist <= (wr_bins) - (rd_bins);
      end if;
    end if;
  end process;
end generate MB1;

  process(pntr_dist)
  begin
    ap_arg_used                 <= (others => '0');
    ap_arg_used(pntr_dist'range) <= (pntr_dist);
  end process;

  -- Status signals empty/full should be synchronized with AXI clk
  ap_arg_empty <= not(empty_n);

  process(clk, rst)
  begin
    if(rst = '1') then
      ap_arg_full_i <= '1';
    elsif(clk'event and clk = '1') then
      -- If read, we move out of full state
      if(mb_pop_ok_rd = '1') then
        ap_arg_full_i <= '0';
      else
        -- Stay in full if wr_gray_ahead = next_rd_gray
        if(wr_gray_ahead_rd = next_rd_gray) then
          ap_arg_full_i <= '1';
        else
          ap_arg_full_i <= '0';
        end if;
      end if;
    end if;
  end process;

  ap_arg_full <= ap_arg_full_i;

   
end generate NEW_INTRO;



    LINEAR_BANK_GEN : if not(USE_COLUMNIZED_BANK) generate
    -- address width for input port is the addition of required bits for the
    -- argument plus the required bits to select buffer (PTR_WIDTH).
    constant IPORT_ADDR_WIDTH : integer := C_AP_ARG_ADDR_WIDTH+log2(C_MULTIBUFFER_DEPTH);
    constant OPORT_ADDR_WIDTH : integer := CONV_ADDR_WIDTH+log2(C_MULTIBUFFER_DEPTH);

    signal iport_addr : std_logic_vector(IPORT_ADDR_WIDTH-1 downto 0);
    signal oport_addr : std_logic_vector(OPORT_ADDR_WIDTH-1 downto 0);

  begin
    MB1_addr : if (C_MULTIBUFFER_DEPTH = 1) generate
    begin
     iport_addr <= ap_arg_addr;
     oport_addr <= conv_addr;
    end generate MB1_addr;

    MBn_addr : if (C_MULTIBUFFER_DEPTH > 1) generate
    begin
     iport_addr <= std_logic_vector(wr_pntr) & ap_arg_addr;
     oport_addr <= std_logic_vector(rd_pntr) & conv_addr;
    end generate MBn_addr;

    MEM_I : entity axis_accelerator_adapter_v2_1_16.arg_mem_bank
      generic map (
        C_FAMILY       => C_FAMILY,
        C_BRAM_TYPE    => C_BRAM_TYPE,
        C_IS_UNIDIR    => 0,
        C_SELECT_XPM   => C_SELECT_XPM,
        C_IPORT_DWIDTH => C_AP_ARG_DATA_WIDTH,
        C_IPORT_AWIDTH => IPORT_ADDR_WIDTH,
        C_OPORT_DWIDTH => CONV_DATA_WIDTH,
        C_OPORT_AWIDTH => OPORT_ADDR_WIDTH)
      port map (
        rst        => ap_rst,
        iport_clk  => ap_clk,
        iport_ce   => iport_ce,
        iport_we   => ap_arg_we,
        iport_addr => iport_addr,
        iport_din  => ap_arg_din,
        iport_dout => ap_arg_dout,
        oport_clk  => clk,
        oport_ce   => oport_ce,
        oport_we   => conv_we,
        oport_addr => oport_addr,
        oport_din  => conv_din_zero,
        oport_dout => conv_data);
  end generate LINEAR_BANK_GEN;

  COLUMNIZED_BANK_GEN : if (USE_COLUMNIZED_BANK) generate
  begin

    MEM_I : entity axis_accelerator_adapter_v2_1_16.oarg_columnized_mem_bank
      generic map (
        C_FAMILY       => C_FAMILY,
        C_BRAM_TYPE    => C_BRAM_TYPE,
        C_FACTOR       => C_AP_ARG_FORMAT_FACTOR,
        C_BUFFER_WIDTH => PTR_WIDTH,
        C_CONV_AWIDTH  => CONV_ADDR_WIDTH,
        C_CONV_DWIDTH  => CONV_DATA_WIDTH,
        C_ARG_WIDTH    => C_AP_ARG_WIDTH,
        C_ARG_AWIDTH   => C_AP_ARG_ADDR_WIDTH)
      port map (
        ap_rst        => ap_rst,
        ap_clk        => ap_clk,
        ap_arg_ce     => ap_arg_ce,
        ap_arg_we     => ap_arg_we,
        ap_arg_buffer => std_logic_vector(wr_ptr),
        ap_arg_addr   => ap_arg_addr,
        ap_arg_din    => ap_arg_din,
        ap_arg_dout   => ap_arg_dout,
        clk           => clk,
        conv_ce       => conv_ce,
        conv_we       => conv_we,
        conv_buffer   => std_logic_vector(rd_ptr),
        conv_addr     => conv_addr,
        conv_data     => conv_data);

  end generate COLUMNIZED_BANK_GEN;

  -- To know how many beats to produce on output stream, we track the highest
  -- address written
  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      ap_arg_hw_length <= (others => '0');
    elsif(ap_clk'event and ap_clk = '1') then
      if(ap_arg_ack = '1') then
        ap_arg_hw_length <= (others => '0');
      elsif(iport_ce = '1' and ap_arg_we = '1') then
        if(unsigned(ap_arg_addr) >= ap_arg_hw_length) then
          ap_arg_hw_length <= unsigned('0' & ap_arg_addr) + 1;
        end if;
      end if;
    end if;
  end process;

  -- length memory modeling (XST infer)
  process(ap_clk)
  begin
    if(ap_clk'event and ap_clk = '1') then
      if(ap_arg_ack = '1') then
        hw_length_mem(to_integer(wr_ptr)) <= std_logic_vector(ap_arg_hw_length);
      end if;
    end if;
  end process;

  hw_length_mem_dout <= hw_length_mem(to_integer(rd_ptr));

--        clkx_4: ENTITY axis_accelerator_adapter_v2_1_16.clk_x_pntrs
--        GENERIC MAP(
--          C_HAS_RST              => 1,
--          C_RD_PNTR_WIDTH        => SW_LENGTH_FIFO_WIDTH,     
--          C_WR_PNTR_WIDTH        => SW_LENGTH_FIFO_WIDTH,
--          C_MSGON_VAL            => 1,
--          C_SYNCHRONIZER_STAGE   => 2
--          )
--        PORT MAP(
--          WR_CLK         => ap_clk,   
--          RD_CLK         => clk,   
--          WR_RST         => ap_rst,   
--          RD_RST         => rst,   
--          WR_PNTR        => sw_length_wr,   
--          RD_PNTR        => open,   
--          WR_PNTR_RD     => sw_length_rd,   
--          RD_PNTR_WR     => open     
--          );

--     SW_LENGTH_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
--        generic map (
--        C_CDC_TYPE                 => 1,
--        C_RESET_STATE              => 0,
--        C_SINGLE_BIT               => 0,
--        C_VECTOR_WIDTH             => SW_LENGTH_FIFO_WIDTH,
--        C_MTBF_STAGES              => 2
--        )
--        port map (
--        prmry_aclk                 => '0',
--        prmry_resetn               => '0',
--        prmry_in                   => '0',
--        prmry_vect_in              => sw_length_wr,
--
--        scndry_aclk                => clk,
--        scndry_resetn              => rst,
--        scndry_out                 => open,
--        scndry_vect_out            => sw_length_rd
--        );


       clkx_5: ENTITY axis_accelerator_adapter_v2_1_16.clk_x_pntrs
        GENERIC MAP(
          C_HAS_RST              => 1,
          C_RD_PNTR_WIDTH        => C_AP_ARG_ADDR_WIDTH+1,     
          C_WR_PNTR_WIDTH        => C_AP_ARG_ADDR_WIDTH+1,
          C_MSGON_VAL            => 1,
          C_SYNCHRONIZER_STAGE   => 2
          )
        PORT MAP(
          WR_CLK         => ap_clk,   
          RD_CLK         => clk,   
          WR_RST         => ap_rst,   
          RD_RST         => rst,   
          WR_PNTR        => hw_length_mem_dout,   
          RD_PNTR        => open,   
          WR_PNTR_RD     => hw_length_mem_dout_rd,   
          RD_PNTR_WR     => open     
          );



  sw_length_rd <= sw_length(SW_LENGTH_FIFO_WIDTH-1 downto 0);
  sw_length_we_vector(0) <= sw_length_we;
  sw_length_we_rd        <= sw_length_we_rd_vector(0);

   wr_stg_inst: ENTITY axis_accelerator_adapter_v2_1_16.synchronizer_ff
    GENERIC MAP (
     C_HAS_RST => 1,
     C_WIDTH   => 1
     )
    PORT MAP ( 
     RST       => rst,
     CLK       => clk,   
     D         => sw_length_we_vector,
     Q         => sw_length_we_rd_vector
     );    


  SW_LENGTH_FIFO : entity axis_accelerator_adapter_v2_1_16.srl_fifo_32_wt
    generic map (
      C_FAMILY => C_FAMILY,
      WIDTH    => SW_LENGTH_FIFO_WIDTH)
    port map (
      rst      => rst,
      clk      => clk,
      din      => sw_length_rd,
      din_vld  => sw_length_we_rd,
      din_rdy  => open,
      dout     => sw_length_fifo_dout,
      dout_vld => open,
      dout_rdy => mb_pop_ok_rd
    );

  process(use_sw_length, hw_length_mem_dout_rd, sw_length_fifo_dout)
    constant HW_LSB : integer := log2(C_AP_ARG_DATA_WIDTH/8);
    constant SW_LSB : integer := log2(C_AP_ARG_WIDTH/8);
    constant SW_MSB : integer := SW_LSB+SW_LENGTH_FIFO_WIDTH-1;
  begin
    conv_size <= (others => '0');
    if(use_sw_length = '0') then
      conv_size(SIZE_WIDTH-1 downto HW_LSB) <= hw_length_mem_dout_rd;
    else
      conv_size(SW_MSB downto SW_LSB) <= sw_length_fifo_dout;
    end if;
  end process;


end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : xd_m2s_converter.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2012-11-04
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-- 2013-07-31  2.0      pvk	Updated Tvalid generattion logic to remove stream
--                              protocol error where tvalid was deasserting 
--                              tlast
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;

entity xd_m2s_converter is
  generic (
    -- System generics:
    C_FAMILY       : string;            -- Xilinx FPGA family
    SIZE_WIDTH     : integer;
    AXI_DATA_WIDTH : integer;
    AXI_ADDR_WIDTH : integer;
    AXI_USER_WIDTH : integer;
    AXI_ID_WIDTH   : integer;
    AXI_DEST_WIDTH : integer);
  port (
    axi_clk         : in  std_logic;
    axi_rst         : in  std_logic;
    axis_vld        : out std_logic;
    axis_rdy        : in  std_logic;
    axis_data       : out std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    axis_keep       : out std_logic_vector((AXI_DATA_WIDTH/8)-1 downto 0);
    axis_strb       : out std_logic_vector((AXI_DATA_WIDTH/8)-1 downto 0);
    axis_last       : out std_logic;
    axis_id         : out std_logic_vector(AXI_ID_WIDTH-1 downto 0);
    axis_dest       : out std_logic_vector(AXI_DEST_WIDTH-1 downto 0);
    axis_user       : out std_logic_vector(AXI_USER_WIDTH-1 downto 0);
    conv_size       : in  std_logic_vector(SIZE_WIDTH-1 downto 0);
    conv_addr       : out std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
    conv_ce         : out std_logic;
    conv_we         : out std_logic;
    conv_last       : out std_logic;
    conv_rdy        : in  std_logic;
    conv_data       : in  std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
    host_oarg_tdest : in  std_logic_vector(AXI_DEST_WIDTH-1 downto 0));
end entity;

architecture rtl of xd_m2s_converter is
  constant STRB_WIDTH : integer := AXI_DATA_WIDTH/8;
  type state_type is (
    idle,
    running, wait_last);
  signal state : state_type;

  constant SUBWORD_WIDTH  : integer := log2(AXI_DATA_WIDTH/8);
  constant WORD_CNT_WIDTH : integer := SIZE_WIDTH - SUBWORD_WIDTH;
  constant WORD_CNT_LSB   : integer := SUBWORD_WIDTH;
  constant WORD_CNT_MSB   : integer := SIZE_WIDTH-1;

  signal word_cnt       : unsigned(WORD_CNT_WIDTH-1 downto 0);
  signal init_cnt       : std_logic;
  signal word_cnt_0     : std_logic;
  signal word_cnt_1     : std_logic;
  signal full_last_word : std_logic;
  signal last_word      : std_logic;
  signal last_strb      : std_logic_vector(STRB_WIDTH-1 downto 0);
  --
  signal conv_addr_i    : unsigned(AXI_ADDR_WIDTH-1 downto 0);
  signal conv_ce_i      : std_logic;
  signal conv_data_vld  : std_logic;
  signal conv_data_last : std_logic;
  signal conv_data_strb : std_logic_vector(STRB_WIDTH-1 downto 0);
  signal fill_pipe      : std_logic;
  -- 
  signal dout_vld       : std_logic;
  signal dout_last      : std_logic;
  signal dout_rdy       : std_logic;
  signal dout           : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
  signal dout_strb      : std_logic_vector(STRB_WIDTH-1 downto 0);


begin

  -- Each time we send a stream out, we initialize to zero its buffer
  conv_we <= '0';

  -- count the words to read:
  process(axi_clk)
    variable aux : unsigned(WORD_CNT_WIDTH-1 downto 0);
  begin
    if(axi_clk'event and axi_clk = '1') then
      if(init_cnt = '1') then
        aux        := unsigned(conv_size(WORD_CNT_MSB downto WORD_CNT_LSB));
        word_cnt   <= aux;
        word_cnt_0 <= '0';
        word_cnt_1 <= '0';
        if(aux(WORD_CNT_WIDTH-1 downto 1) = 0) then
          word_cnt_1 <= aux(0);
          word_cnt_0 <= not(aux(0));
        end if;
      elsif(conv_ce_i = '1') then
        word_cnt <= word_cnt - 1;
        if(word_cnt = 2) then
          word_cnt_1 <= '1';
        else
          word_cnt_1 <= '0';
        end if;
        word_cnt_0 <= word_cnt_1;
      end if;
    end if;
  end process;

  -- Address to access:
  process(axi_clk)
    variable aux : unsigned(WORD_CNT_WIDTH-1 downto 0);
  begin
    if(axi_clk'event and axi_clk = '1') then
      if(init_cnt = '1') then
        conv_addr_i <= (others => '0');
      elsif(conv_ce_i = '1') then
        conv_addr_i <= conv_addr_i + 1;
      end if;
    end if;
  end process;

  conv_addr <= std_logic_vector(conv_addr_i);

  -- Last read; although last_strb seems complex, each bit generated should be
  -- a simple LUT with 3 inputs (SUBWORD_WIDTH = 3)
  process(axi_clk)
    constant zeros : std_logic_vector(SUBWORD_WIDTH-1 downto 0) := (others => '0');
    variable aux   : integer range 0 to (2**SUBWORD_WIDTH)-1;
  begin
    if(axi_clk'event and axi_clk = '1') then
      if(init_cnt = '1') then
        aux := to_integer(unsigned(conv_size(SUBWORD_WIDTH-1 downto 0)));
        if(aux = 0) then
          full_last_word <= '1';
          last_strb      <= (others => '1');
        else
          full_last_word <= '0';
          last_strb      <= std_logic_vector(to_unsigned(2**aux-1, STRB_WIDTH));
        end if;
      end if;
    end if;
  end process;

  last_word <= word_cnt_1 when (full_last_word = '1') else word_cnt_0;

  -- This module behaves like a two-stage pipeline
  -- first stage is BRAM outputs (from multibuffer)
  -- second stage is te registered output of the module

  -- TAP 1: BRAM output
  process(axi_clk)
  begin
    if (axi_clk'event and axi_clk = '1') then
      if (axi_rst = '1') then
        conv_data_vld  <= '0';
        conv_data_last <= '0';
        conv_data_strb <= (others => '0');
      elsif(conv_data_vld = '0' or dout_vld = '0' or (dout_vld and dout_rdy) = '1') then
        -- this tage happens if any of the following conditions:
        -- 1.- stage is empty => refresh continous of the input values to the stage
        -- 2.- next stage is empty => data in this stage move to next stage
        -- 3.- pipeline moves => consumed data in last stage
        conv_data_vld  <= conv_ce_i;
        conv_data_last <= last_word;
        if(last_word = '1') then
          conv_data_strb <= last_strb;
        else
          conv_data_strb <= (others => '1');
        end if;
      end if;
    end if;
  end process;

  -- TAP 2: Output register.
  process(axi_clk)
  begin
    if (axi_clk'event and axi_clk = '1') then
      if (axi_rst = '1') then
        dout_vld <= '0';
      elsif(dout_vld = '0' or (dout_vld and dout_rdy) = '1') then
        dout_vld <= conv_data_vld;
      end if;
    end if;
  end process;

  process(axi_clk)
  begin
    if (axi_clk'event and axi_clk = '1') then
      if(dout_vld = '0' or (dout_vld and dout_rdy) = '1') then
        dout      <= conv_data;
        dout_last <= conv_data_last;
        dout_strb <= conv_data_strb;
      end if;
    end if;
  end process;

  -- Control of reads during filling the pipe:
  process(axi_clk)
  begin
    if (axi_clk'event and axi_clk = '1') then
      if (axi_rst = '1') then
        fill_pipe <= '0';
      else
        if(dout_vld = '1') then          -- last stage is busy 
          -- Stop if  first stage is full or about to be filled (new data coming)
          fill_pipe <= not(conv_data_vld or conv_ce_i);
        elsif(conv_data_vld = '1') then  -- second to last stage busy
          -- if new data coming, stop reads
          fill_pipe <= not(conv_ce_i);
        else                             -- pipe is empty 
          fill_pipe <= '1';
        end if;
      end if;
    end if;
  end process;

  -- FSM:
  process(axi_clk, axi_rst)
  begin
    if(axi_rst = '1') then
      state <= idle;
    elsif(axi_clk'event and axi_clk = '1') then
      case state is
        when idle =>
          if(conv_rdy = '1') then
            state <= running;
          end if;
        when running =>
          if(last_word = '1' and conv_ce_i = '1') then
            --state <= idle;
              state <= wait_last;
          end if;
        when wait_last =>
          if(dout_last = '1' and axis_rdy = '1') then
             state <= idle;
          end if;
        when others =>
      end case;
    end if;
  end process;

  process(state, conv_rdy, last_word, dout_vld, dout_rdy, fill_pipe)
  begin
    init_cnt  <= '0';
    conv_last <= '0';
    conv_ce_i <= '0';
    case state is
      when idle =>
        -- init_cnt <= conv_rdy;
        init_cnt <= '1';
      when running =>
        conv_ce_i <= (dout_vld and dout_rdy) or fill_pipe;
        conv_last <= last_word and ((dout_vld and dout_rdy) or fill_pipe);
      when others =>
    end case;
  end process;

  conv_ce <= conv_ce_i;

  axis_vld  <= dout_vld;
  dout_rdy  <= axis_rdy;
  axis_data <= dout;
  axis_keep <= dout_strb;
  axis_strb <= dout_strb;
  axis_last <= dout_last;
  axis_id   <= (others => '0');
  axis_dest <= host_oarg_tdest;
  axis_user <= (others => '0');

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : s2s_async_fifo_wt.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-01-22
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;

library fifo_generator_v13_1_4;
use fifo_generator_v13_1_4.all;



entity s2s_async_fifo_wt is
  generic (
    C_FAMILY : string  := "virtex6";
    C_MTBF_STAGES    : integer := 31;
    DEPTH    : integer := 31;
    WIDTH    : integer := 16);
  port (
    din      : in  std_logic_vector(WIDTH-1 downto 0);
    din_vld  : in  std_logic;
    din_rdy  : out std_logic;
    wr_clk   : in  std_logic;
    wr_rst   : in  std_logic;
    dout     : out std_logic_vector(WIDTH-1 downto 0);
    dout_vld : out std_logic;
    dout_rdy : in  std_logic;
    rd_clk   : in  std_logic;
    rd_rst   : in  std_logic);
end s2s_async_fifo_wt;

architecture rtl of s2s_async_fifo_wt is

  constant FIFO_DEPTH : integer := calc_fifo_depth(DEPTH)+1;
  constant ADDR_BITS  : integer := log2(FIFO_DEPTH);

  signal rd_addr : unsigned(ADDR_BITS-1 downto 0);
  signal wr_addr : unsigned(ADDR_BITS-1 downto 0);

  -- Following signals have gray values
  signal wr_cnt      : std_logic_vector(ADDR_BITS-1 downto 0);
  signal wr_cnt_wr      : std_logic_vector(ADDR_BITS-1 downto 0);
  signal wr_cnt_rd   : std_logic_vector(ADDR_BITS-1 downto 0);
  signal next_wr_cnt : std_logic_vector(ADDR_BITS-1 downto 0);
  signal next_wr_cnt_wr : std_logic_vector(ADDR_BITS-1 downto 0);
  signal dummy_next_wr_cnt : std_logic_vector(ADDR_BITS-1 downto 0);
  signal rd_cnt      : std_logic_vector(ADDR_BITS-1 downto 0);
  signal rd_cnt_rd      : std_logic_vector(ADDR_BITS-1 downto 0);
  signal next_rd_cnt : std_logic_vector(ADDR_BITS-1 downto 0);
  signal next_rd_cnt_rd : std_logic_vector(ADDR_BITS-1 downto 0);
  signal dummy_next_rd_cnt : std_logic_vector(ADDR_BITS-1 downto 0);
  signal prev_rd_cnt : std_logic_vector(ADDR_BITS-1 downto 0);
  signal prev_rd_cnt_wr : std_logic_vector(ADDR_BITS-1 downto 0);
  signal fifo_we     : std_logic;
  signal fifo_re     : std_logic;
  signal din_rdy_i   : std_logic;
  signal empty_i     : std_logic;
  signal rd_en       : std_logic;
  signal dout_vld_i  : std_logic;
  signal full  : std_logic;
  signal empty  : std_logic;
  
  signal almost_full :std_logic;    
  signal wr_ack :std_logic;    
  signal overflow :std_logic;    
  signal almost_empty :std_logic;    
  signal valid :std_logic;    
  signal underflow :std_logic;    
  signal data_count :std_logic_vector(ADDR_BITS-1 downto 0);    
  signal rd_data_count :std_logic_vector(ADDR_BITS-1 downto 0);    
  signal wr_data_count :std_logic_vector(ADDR_BITS-1 downto 0);    
  signal prog_full :std_logic;    
  signal prog_empty :std_logic;    
  signal sbiterr :std_logic;    
  signal dbiterr :std_logic;    
  signal wr_rst_busy :std_logic;    
  signal rd_rst_busy :std_logic;    
  signal m_axi_awid :std_logic_vector(0 downto 0);    
  signal m_axi_awaddr :std_logic_vector(31 downto 0);    
  signal m_axi_awlen :std_logic_vector(7 downto 0);    
  signal m_axi_awsize :std_logic_vector(2 downto 0);    
  signal m_axi_awburst :std_logic_vector(1 downto 0);    
  signal m_axi_awlock :std_logic_vector(0 downto 0);    
  signal m_axi_awcache :std_logic_vector(3 downto 0);    
  signal m_axi_awprot :std_logic_vector(2 downto 0);    
  signal m_axi_awqos :std_logic_vector(3 downto 0);    
  signal m_axi_awregion :std_logic_vector(3 downto 0);    
  signal m_axi_awuser :std_logic_vector(0 downto 0);    
  signal m_axi_awvalid :std_logic;
  signal m_axi_wid :std_logic_vector(0 downto 0);    
  signal m_axi_wdata :std_logic_vector(63 downto 0);    
  signal m_axi_wstrb :std_logic_vector(7 downto 0);    
  signal m_axi_wlast :std_logic;
  signal m_axi_wuser :std_logic_vector(0 downto 0);    
  signal m_axi_wvalid :std_logic;
  signal m_axi_bready :std_logic;
  signal s_axi_awready :std_logic;
  signal s_axi_wready :std_logic;
  signal s_axi_bid :std_logic_vector(0 downto 0);    
  signal s_axi_bresp :std_logic_vector(1 downto 0);    
  signal s_axi_buser :std_logic_vector(0 downto 0);    
  signal m_axi_arid :std_logic_vector(0 downto 0);    
  signal m_axi_araddr :std_logic_vector(31 downto 0);    
  signal m_axi_arlen :std_logic_vector(7 downto 0);    
  signal m_axi_arsize :std_logic_vector(2 downto 0);    
  signal m_axi_arburst :std_logic_vector(1 downto 0);    
  signal m_axi_arlock :std_logic_vector(0 downto 0);    
  signal m_axi_arcache :std_logic_vector(3 downto 0);    
  signal m_axi_arprot :std_logic_vector(2 downto 0);    
  signal m_axi_arqos :std_logic_vector(3 downto 0);    
  signal m_axi_arregion :std_logic_vector(3 downto 0);    
  signal m_axi_aruser :std_logic_vector(0 downto 0);    
  signal m_axi_arvalid :std_logic;
  signal m_axi_rready :std_logic;
  signal s_axi_arready :std_logic;
  signal s_axi_rid :std_logic_vector(0 downto 0);    
  signal s_axi_rdata :std_logic_vector(63 downto 0);    
  signal s_axi_rresp :std_logic_vector(1 downto 0);    
  signal s_axi_rlast :std_logic;
  signal s_axi_ruser :std_logic_vector(0 downto 0);    
  signal m_axis_tvalid :std_logic;
  signal m_axis_tdata :std_logic_vector(7 downto 0);    
  signal m_axis_tstrb :std_logic_vector(0 downto 0);    
  signal m_axis_tlast :std_logic;
  signal m_axis_tkeep :std_logic_vector(0 downto 0);    
  signal m_axis_tid :std_logic_vector(0 downto 0);    
  signal m_axis_tdest :std_logic_vector(0 downto 0);    
  signal m_axis_tuser :std_logic_vector(3 downto 0);    
  signal s_axis_tready :std_logic;
  signal axi_aw_data_count :std_logic_vector(4 downto 0);    
  signal axi_aw_wr_data_count :std_logic_vector(4 downto 0);    
  signal axi_aw_rd_data_count :std_logic_vector(4 downto 0);    
  signal axi_aw_sbiterr :std_logic;    
  signal axi_aw_dbiterr :std_logic;    
  signal axi_aw_overflow :std_logic;    
  signal axi_aw_underflow :std_logic;    
  signal axi_aw_prog_full :std_logic;    
  signal axi_aw_prog_empty :std_logic;    
  signal axi_w_data_count :std_logic_vector(10 downto 0);    
  signal axi_w_wr_data_count :std_logic_vector(10 downto 0);    
  signal axi_w_rd_data_count :std_logic_vector(10 downto 0);    
  signal axi_w_sbiterr :std_logic;    
  signal axi_w_dbiterr :std_logic;    
  signal axi_w_overflow :std_logic;    
  signal axi_w_underflow :std_logic;    
  signal axi_w_prog_full :std_logic;    
  signal axi_w_prog_empty :std_logic;    
  signal axi_b_data_count :std_logic_vector(4 downto 0);    
  signal axi_b_wr_data_count :std_logic_vector(4 downto 0);    
  signal axi_b_rd_data_count :std_logic_vector(4 downto 0);    
  signal axi_b_sbiterr :std_logic;    
  signal axi_b_dbiterr :std_logic;    
  signal axi_b_overflow :std_logic;    
  signal axi_b_underflow :std_logic;    
  signal axi_b_prog_full :std_logic;    
  signal axi_b_prog_empty :std_logic;    
  signal axi_ar_data_count :std_logic_vector(4 downto 0);    
  signal axi_ar_wr_data_count :std_logic_vector(4 downto 0);    
  signal axi_ar_rd_data_count :std_logic_vector(4 downto 0);    
  signal axi_ar_sbiterr :std_logic;    
  signal axi_ar_dbiterr :std_logic;    
  signal axi_ar_overflow :std_logic;    
  signal axi_ar_underflow :std_logic;    
  signal axi_ar_prog_full :std_logic;    
  signal axi_ar_prog_empty :std_logic;    
  signal axi_r_data_count :std_logic_vector(10 downto 0);    
  signal axi_r_wr_data_count :std_logic_vector(10 downto 0);    
  signal axi_r_rd_data_count :std_logic_vector(10 downto 0);    
  signal axi_r_sbiterr :std_logic;    
  signal axi_r_dbiterr :std_logic;    
  signal axi_r_overflow :std_logic;    
  signal axi_r_underflow :std_logic;    
  signal axi_r_prog_full :std_logic;    
  signal axi_r_prog_empty :std_logic;    
  signal axis_data_count :std_logic_vector(10 downto 0);    
  signal axis_wr_data_count :std_logic_vector(10 downto 0);    
  signal axis_rd_data_count :std_logic_vector(10 downto 0);    
  signal axis_sbiterr :std_logic;    
  signal axis_dbiterr :std_logic;    
  signal axis_overflow :std_logic;    
  signal axis_underflow :std_logic;    
  signal axis_prog_full :std_logic;    
  signal axis_prog_empty :std_logic;    



  function calc_ram_style(is_unidir : natural) return boolean is
    variable bram_style : boolean := false;
  begin
    return bram_style;
  end function calc_ram_style;

  constant USE_BRAM : boolean := (ADDR_BITS > 5);

  -- pragma translate_off
  signal dbg_ADDR_BITS : integer := ADDR_BITS;
  -- pragma translate_on
  constant C_EXTRA_SYNCS      : integer := 1;

begin

EXISTING : if (C_EXTRA_SYNCS = 0) generate
 begin  

  fifo_we <= din_vld and din_rdy_i;

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      wr_addr <= (others => '0');
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_addr <= wr_addr + 1;
      end if;
    end if;
  end process;

  fifo_re <= rd_en and not(empty_i);

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      rd_addr <= (others => '0');
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        rd_addr <= rd_addr + 1;
      end if;
    end if;
  end process;

  ---------------------------------------------------------
  -- From all gray signals, only next_rd_cnt and next_wr_cnt are counters. all
  -- the rest are registers. It's simpler to use a binary counter and then use
  -- a table to transfor to gray. Given that the address counter is initialized
  -- to zero, signal next_XX_cnt will load code gray(0) after first increment.
  -- Hence, it should be initialized to gray(N-1). that is, the initial values
  -- will be:
  --  * next_XX_cnt = gray(N-1)
  --  * XX_cnt = gray(N-2)
  --  * prev_XX_cnt = gray(N-3)

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      next_rd_cnt <= bin2gray(2**ADDR_BITS-1, ADDR_BITS);
      rd_cnt      <= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
      prev_rd_cnt <= bin2gray(2**ADDR_BITS-3, ADDR_BITS);
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        prev_rd_cnt <= rd_cnt;
        rd_cnt      <= next_rd_cnt;
        next_rd_cnt <= bin2gray(std_logic_vector(rd_addr));
      end if;
    end if;
  end process;

-- process(rd_clk, rd_rst)
--  begin
--    if(rd_rst = '1') then
--      wr_cnt_rd   <= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
--      dummy_next_wr_cnt<= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
--    elsif(rd_clk'event and rd_clk = '1') then
--      --if(fifo_we = '1') then
--        dummy_next_wr_cnt <= bin2gray(std_logic_vector(wr_addr));
--        wr_cnt_rd      <= dummy_next_wr_cnt;
--      --end if;
--    end if;
--  end process;

        --dummy_next_rd_cnt <= bin2gray(std_logic_vector(rd_addr));

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      next_wr_cnt <= bin2gray(2**ADDR_BITS-1, ADDR_BITS);
      wr_cnt      <= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_cnt      <= next_wr_cnt;
        next_wr_cnt <= bin2gray(std_logic_vector(wr_addr));
      end if;
    end if;
  end process;

--  process(wr_clk, wr_rst)
--  begin
--    if(wr_rst = '1') then
--      prev_rd_cnt_wr   <= bin2gray(2**ADDR_BITS-3, ADDR_BITS);
--      dummy_next_rd_cnt<= bin2gray(2**ADDR_BITS-3, ADDR_BITS);
--    elsif(rd_clk'event and rd_clk = '1') then
--      --if(fifo_re = '1') then
--        dummy_next_rd_cnt <= bin2gray(std_logic_vector(rd_addr ));
--        prev_rd_cnt_wr      <= dummy_next_rd_cnt;
--      --end if;
--    end if;
--  end process;

        --dummy_next_wr_cnt <= bin2gray(std_logic_vector(wr_addr));

  -----------------------------------------------------------------
  -- Flag FULL:
  -- 1.- move to full condition (not din_rdy) when there is an efective
  -- write next_wr_cnt = prev_rd_cnt
  -- 2.- stay in full condition (not din_rdy) while this condition is true:
  -- next_wr_cnt = rd_cnt


  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      din_rdy_i <= '0';
    elsif(wr_clk'event and wr_clk = '1') then
      if((not(din_rdy_i) or fifo_we) = '1') then
        if(din_rdy_i = '1') then
          if (next_wr_cnt = prev_rd_cnt) then
            din_rdy_i <= '0';
          else
            din_rdy_i <= '1';
          end if;
        else
          if (wr_cnt = prev_rd_cnt) then
            din_rdy_i <= '0';
          else
            din_rdy_i <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;

  din_rdy <= din_rdy_i;

  -- Flag EMPTY:
  -- 1.- move to empty condition when there is read (next_rd_cnt = wr_cnt)
  -- 2.- stay in empty condition while the two pointers are the same (wr_cnt = rd_cnt)

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      empty_i <= '1';
    elsif(rd_clk'event and rd_clk = '1') then
      if((empty_i or fifo_re) = '1') then
        if(empty_i = '0') then
          if(next_rd_cnt = wr_cnt) then
            empty_i <= '1';
          else
            empty_i <= '0';
          end if;
        else
          if(rd_cnt = wr_cnt) then
            empty_i <= '1';
          else
            empty_i <= '0';
          end if;
        end if;
      end if;
    end if;
  end process;


  rd_en <= not(dout_vld_i) or (dout_vld_i and dout_rdy);

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      dout_vld_i <= '0';
    elsif(rd_clk'event and rd_clk = '1') then
      if(rd_en = '1') then
        dout_vld_i <= not(empty_i);
      end if;
    end if;
  end process;

  dout_vld <= dout_vld_i;

  -----------------------------------------------------------------------
  -- memory modeling (XST to infer)

  DIST_MEM_GEN : if not(USE_BRAM) generate
    type   mem_type is array (2**ADDR_BITS-1 downto 0) of std_logic_vector (WIDTH-1 downto 0);
    signal mem                 : mem_type;
    attribute ram_style        : string;
    attribute ram_style of mem : signal is "distributed";

    signal mem_dout : std_logic_vector(WIDTH-1 downto 0);

  begin

    process(wr_clk)
    begin
      if(wr_clk'event and wr_clk = '1') then
        if(fifo_we = '1') then
          mem(to_integer(wr_addr)) <= din;
        end if;
      end if;
    end process;

    mem_dout <= mem(to_integer(rd_addr));

    process(rd_clk, rd_rst)
    begin
      if(rd_rst = '1') then
        dout <= (others => '0');
      elsif(rd_clk'event and rd_clk = '1') then
        if(fifo_re = '1') then
          dout <= mem_dout;
        end if;
      end if;
    end process;

  end generate DIST_MEM_GEN;

  BRAM_MEM_GEN : if (USE_BRAM) generate
    type   mem_type is array (2**ADDR_BITS-1 downto 0) of std_logic_vector (WIDTH-1 downto 0);
    signal mem                 : mem_type;
    attribute ram_style        : string;
    attribute ram_style of mem : signal is "block";
  begin

    process(wr_clk)
    begin
      if(wr_clk'event and wr_clk = '1') then
        if(fifo_we = '1') then
          mem(to_integer(wr_addr)) <= din;
        end if;
      end if;
    end process;

    process(rd_clk, rd_rst)
    begin
      if(rd_rst = '1') then
        dout <= (others => '0');
      elsif(rd_clk'event and rd_clk = '1') then
        if(fifo_re = '1') then
          dout <= mem(to_integer(rd_addr));
        end if;
      end if;
    end process;

  end generate BRAM_MEM_GEN;
end generate EXISTING;

  NEW_INTRO : if (C_EXTRA_SYNCS = 1) generate
 begin  

       din_rdy  <= not(full);
    dout_vld <= not(empty);


  DIST_MEM_GEN : if not(USE_BRAM) generate
  begin
   FIF_DMG_INST : entity fifo_generator_v13_1_4.fifo_generator_v13_1_4
    GENERIC MAP (
      C_COMMON_CLOCK => 0,
      C_COUNT_TYPE => 0,
      C_DATA_COUNT_WIDTH => ADDR_BITS,
      C_DEFAULT_VALUE => "BlankString",
      C_DIN_WIDTH => WIDTH,
      C_DOUT_RST_VAL => "0",
      C_DOUT_WIDTH => WIDTH,
      C_ENABLE_RLOCS => 0,
      C_FAMILY => C_FAMILY,
      C_FULL_FLAGS_RST_VAL => 0,
      C_HAS_ALMOST_EMPTY => 0,
      C_HAS_ALMOST_FULL => 0,
      C_HAS_BACKUP => 0,
      C_HAS_DATA_COUNT => 0,
      C_HAS_INT_CLK => 0,
      C_HAS_MEMINIT_FILE => 0,
      C_HAS_OVERFLOW => 0,
      C_HAS_RD_DATA_COUNT => 0,
      C_HAS_RD_RST => 0,
      C_HAS_RST => 1,
      C_HAS_SRST => 0,
      C_HAS_UNDERFLOW => 0,
      C_HAS_VALID => 0,
      C_HAS_WR_ACK => 0,
      C_HAS_WR_DATA_COUNT => 0,
      C_HAS_WR_RST => 0,
      C_IMPLEMENTATION_TYPE => 2,
      C_INIT_WR_PNTR_VAL => 0,
      C_MEMORY_TYPE => 2,
      C_MIF_FILE_NAME => "BlankString",
      C_OPTIMIZATION_MODE => 0,
      C_OVERFLOW_LOW => 0,
      C_PRELOAD_LATENCY => 0,
      C_PRELOAD_REGS => 1,
      C_PRIM_FIFO_TYPE => "512x36",
      C_PROG_EMPTY_THRESH_ASSERT_VAL => 2,
      C_PROG_EMPTY_THRESH_NEGATE_VAL => 3,
      C_PROG_EMPTY_TYPE => 0,
      C_PROG_FULL_THRESH_ASSERT_VAL => 29,
      C_PROG_FULL_THRESH_NEGATE_VAL => 28,
      C_PROG_FULL_TYPE => 0,
      C_RD_DATA_COUNT_WIDTH => ADDR_BITS,
      C_RD_DEPTH => FIFO_DEPTH,
      C_RD_FREQ => 1,
      C_RD_PNTR_WIDTH => ADDR_BITS,
      C_UNDERFLOW_LOW => 0,
      C_USE_DOUT_RST => 1,
      C_USE_ECC => 0,
      C_USE_EMBEDDED_REG => 0,
      C_USE_PIPELINE_REG => 0,
      C_POWER_SAVING_MODE => 0,
      C_USE_FIFO16_FLAGS => 0,
      C_USE_FWFT_DATA_COUNT => 0,
      C_VALID_LOW => 0,
      C_WR_ACK_LOW => 0,
      C_WR_DATA_COUNT_WIDTH => ADDR_BITS,
      C_WR_DEPTH => FIFO_DEPTH,
      C_WR_FREQ => 1,
      C_WR_PNTR_WIDTH => ADDR_BITS,
      C_WR_RESPONSE_LATENCY => 1,
      C_MSGON_VAL => 1,
      C_ENABLE_RST_SYNC => 0,
      C_ERROR_INJECTION_TYPE => 0,
      C_SYNCHRONIZER_STAGE => C_MTBF_STAGES,
      C_INTERFACE_TYPE => 0,
      C_AXI_TYPE => 1,
      C_HAS_AXI_WR_CHANNEL => 1,
      C_HAS_AXI_RD_CHANNEL => 1,
      C_HAS_SLAVE_CE => 0,
      C_HAS_MASTER_CE => 0,
      C_ADD_NGC_CONSTRAINT => 0,
      C_USE_COMMON_OVERFLOW => 0,
      C_USE_COMMON_UNDERFLOW => 0,
      C_USE_DEFAULT_SETTINGS => 0,
      C_AXI_ID_WIDTH => 1,
      C_AXI_ADDR_WIDTH => 32,
      C_AXI_DATA_WIDTH => 64,
      C_AXI_LEN_WIDTH => 8,
      C_AXI_LOCK_WIDTH => 1,
      C_HAS_AXI_ID => 0,
      C_HAS_AXI_AWUSER => 0,
      C_HAS_AXI_WUSER => 0,
      C_HAS_AXI_BUSER => 0,
      C_HAS_AXI_ARUSER => 0,
      C_HAS_AXI_RUSER => 0,
      C_AXI_ARUSER_WIDTH => 1,
      C_AXI_AWUSER_WIDTH => 1,
      C_AXI_WUSER_WIDTH => 1,
      C_AXI_BUSER_WIDTH => 1,
      C_AXI_RUSER_WIDTH => 1,
      C_HAS_AXIS_TDATA => 1,
      C_HAS_AXIS_TID => 0,
      C_HAS_AXIS_TDEST => 0,
      C_HAS_AXIS_TUSER => 1,
      C_HAS_AXIS_TREADY => 1,
      C_HAS_AXIS_TLAST => 0,
      C_HAS_AXIS_TSTRB => 0,
      C_HAS_AXIS_TKEEP => 0,
      C_AXIS_TDATA_WIDTH => 8,
      C_AXIS_TID_WIDTH => 1,
      C_AXIS_TDEST_WIDTH => 1,
      C_AXIS_TUSER_WIDTH => 4,
      C_AXIS_TSTRB_WIDTH => 1,
      C_AXIS_TKEEP_WIDTH => 1,
      C_WACH_TYPE => 0,
      C_WDCH_TYPE => 0,
      C_WRCH_TYPE => 0,
      C_RACH_TYPE => 0,
      C_RDCH_TYPE => 0,
      C_AXIS_TYPE => 0,
      C_IMPLEMENTATION_TYPE_WACH => 1,
      C_IMPLEMENTATION_TYPE_WDCH => 1,
      C_IMPLEMENTATION_TYPE_WRCH => 1,
      C_IMPLEMENTATION_TYPE_RACH => 1,
      C_IMPLEMENTATION_TYPE_RDCH => 1,
      C_IMPLEMENTATION_TYPE_AXIS => 1,
      C_APPLICATION_TYPE_WACH => 0,
      C_APPLICATION_TYPE_WDCH => 0,
      C_APPLICATION_TYPE_WRCH => 0,
      C_APPLICATION_TYPE_RACH => 0,
      C_APPLICATION_TYPE_RDCH => 0,
      C_APPLICATION_TYPE_AXIS => 0,
      C_PRIM_FIFO_TYPE_WACH => "512x36",
      C_PRIM_FIFO_TYPE_WDCH => "1kx36",
      C_PRIM_FIFO_TYPE_WRCH => "512x36",
      C_PRIM_FIFO_TYPE_RACH => "512x36",
      C_PRIM_FIFO_TYPE_RDCH => "1kx36",
      C_PRIM_FIFO_TYPE_AXIS => "1kx18",
      C_USE_ECC_WACH => 0,
      C_USE_ECC_WDCH => 0,
      C_USE_ECC_WRCH => 0,
      C_USE_ECC_RACH => 0,
      C_USE_ECC_RDCH => 0,
      C_USE_ECC_AXIS => 0,
      C_ERROR_INJECTION_TYPE_WACH => 0,
      C_ERROR_INJECTION_TYPE_WDCH => 0,
      C_ERROR_INJECTION_TYPE_WRCH => 0,
      C_ERROR_INJECTION_TYPE_RACH => 0,
      C_ERROR_INJECTION_TYPE_RDCH => 0,
      C_ERROR_INJECTION_TYPE_AXIS => 0,
      C_DIN_WIDTH_WACH => 32,
      C_DIN_WIDTH_WDCH => 64,
      C_DIN_WIDTH_WRCH => 2,
      C_DIN_WIDTH_RACH => 32,
      C_DIN_WIDTH_RDCH => 64,
      C_DIN_WIDTH_AXIS => 1,
      C_WR_DEPTH_WACH => 16,
      C_WR_DEPTH_WDCH => 1024,
      C_WR_DEPTH_WRCH => 16,
      C_WR_DEPTH_RACH => 16,
      C_WR_DEPTH_RDCH => 1024,
      C_WR_DEPTH_AXIS => 1024,
      C_WR_PNTR_WIDTH_WACH => 4,
      C_WR_PNTR_WIDTH_WDCH => 10,
      C_WR_PNTR_WIDTH_WRCH => 4,
      C_WR_PNTR_WIDTH_RACH => 4,
      C_WR_PNTR_WIDTH_RDCH => 10,
      C_WR_PNTR_WIDTH_AXIS => 10,
      C_HAS_DATA_COUNTS_WACH => 0,
      C_HAS_DATA_COUNTS_WDCH => 0,
      C_HAS_DATA_COUNTS_WRCH => 0,
      C_HAS_DATA_COUNTS_RACH => 0,
      C_HAS_DATA_COUNTS_RDCH => 0,
      C_HAS_DATA_COUNTS_AXIS => 0,
      C_HAS_PROG_FLAGS_WACH => 0,
      C_HAS_PROG_FLAGS_WDCH => 0,
      C_HAS_PROG_FLAGS_WRCH => 0,
      C_HAS_PROG_FLAGS_RACH => 0,
      C_HAS_PROG_FLAGS_RDCH => 0,
      C_HAS_PROG_FLAGS_AXIS => 0,
      C_PROG_FULL_TYPE_WACH => 0,
      C_PROG_FULL_TYPE_WDCH => 0,
      C_PROG_FULL_TYPE_WRCH => 0,
      C_PROG_FULL_TYPE_RACH => 0,
      C_PROG_FULL_TYPE_RDCH => 0,
      C_PROG_FULL_TYPE_AXIS => 0,
      C_PROG_FULL_THRESH_ASSERT_VAL_WACH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_WDCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_WRCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_RACH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_RDCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_AXIS => 1023,
      C_PROG_EMPTY_TYPE_WACH => 0,
      C_PROG_EMPTY_TYPE_WDCH => 0,
      C_PROG_EMPTY_TYPE_WRCH => 0,
      C_PROG_EMPTY_TYPE_RACH => 0,
      C_PROG_EMPTY_TYPE_RDCH => 0,
      C_PROG_EMPTY_TYPE_AXIS => 0,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS => 1022,
      C_REG_SLICE_MODE_WACH => 0,
      C_REG_SLICE_MODE_WDCH => 0,
      C_REG_SLICE_MODE_WRCH => 0,
      C_REG_SLICE_MODE_RACH => 0,
      C_REG_SLICE_MODE_RDCH => 0,
      C_REG_SLICE_MODE_AXIS => 0
    )
    PORT MAP (
      backup                              => '0',
      backup_marker                       => '0',
      clk                                 => '0',
      rst                                 => '0',
      srst                                => '0',
      wr_clk                              => wr_clk,
      wr_rst                              => wr_rst,
      rd_clk                              => rd_clk,
      rd_rst                              => rd_rst,
      din                                 => din,
      wr_en                               => din_vld,
      rd_en                               => dout_rdy,
      prog_empty_thresh                   => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_empty_thresh_assert            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_empty_thresh_negate            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_full_thresh                    => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_full_thresh_assert             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_full_thresh_negate             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      int_clk                             => '0',
      injectdbiterr                       => '0',
      injectsbiterr                       => '0',
      sleep                               => '0',
      dout                                => dout,
      full                                => full,
      almost_full                         => almost_full,
      wr_ack                              => wr_ack,
      overflow                            => overflow,
      empty                               => empty,
      almost_empty                        => almost_empty,
      valid                               => valid,
      underflow                           => underflow,
      data_count                          => data_count,
      rd_data_count                       => rd_data_count,
      wr_data_count                       => wr_data_count,
      prog_full                           => prog_full,
      prog_empty                          => prog_empty,
      sbiterr                             => sbiterr,
      dbiterr                             => dbiterr,
      wr_rst_busy                         => wr_rst_busy,
      rd_rst_busy                         => rd_rst_busy,

      m_aclk                              => '0',
      s_aclk                              => '0',
      s_aresetn                           => '0',
      m_aclk_en                           => '0',
      s_aclk_en                           => '0',
      m_axi_awid                          => m_axi_awid,
      m_axi_awaddr                        => m_axi_awaddr,
      m_axi_awlen                         => m_axi_awlen,
      m_axi_awsize                        => m_axi_awsize,
      m_axi_awburst                       => m_axi_awburst,
      m_axi_awlock                        => m_axi_awlock,
      m_axi_awcache                       => m_axi_awcache,
      m_axi_awprot                        => m_axi_awprot,
      m_axi_awqos                         => m_axi_awqos,
      m_axi_awregion                      => m_axi_awregion,
      m_axi_awuser                        => m_axi_awuser,
      m_axi_awvalid                       => m_axi_awvalid,
      m_axi_awready                       => '0',
      m_axi_wid                           => m_axi_wid,
      m_axi_wdata                         => m_axi_wdata,
      m_axi_wstrb                         => m_axi_wstrb,
      m_axi_wlast                         => m_axi_wlast,
      m_axi_wuser                         => m_axi_wuser,
      m_axi_wvalid                        => m_axi_wvalid,
      m_axi_wready                        => '0',
      m_axi_bid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_bresp                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      m_axi_buser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_bvalid                        => '0',
      m_axi_bready                        => m_axi_bready,
      s_axi_awid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awaddr                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axi_awlen                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_awsize                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_awburst                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      s_axi_awlock                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awcache                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awprot                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_awqos                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awregion                      => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awuser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awvalid                       => '0',
      s_axi_awready                       => s_axi_awready,
      s_axi_wid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_wdata                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
      s_axi_wstrb                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_wlast                         => '0',
      s_axi_wuser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_wvalid                        => '0',
      s_axi_wready                        => s_axi_wready,
        
      s_axi_bid                           => s_axi_bid,
      s_axi_bresp                         => s_axi_bresp,
      s_axi_buser                         => s_axi_buser,
      s_axi_bready                        => '0',
      m_axi_arid                          => m_axi_arid,
      m_axi_araddr                        => m_axi_araddr,
      m_axi_arlen                         => m_axi_arlen,
      m_axi_arsize                        => m_axi_arsize,
      m_axi_arburst                       => m_axi_arburst,
      m_axi_arlock                        => m_axi_arlock,
      m_axi_arcache                       => m_axi_arcache,
      m_axi_arprot                        => m_axi_arprot,
      m_axi_arqos                         => m_axi_arqos,
      m_axi_arregion                      => m_axi_arregion,
      m_axi_aruser                        => m_axi_aruser,
      m_axi_arvalid                       => m_axi_arvalid,
      m_axi_arready                       => '0',
        
      m_axi_rid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_rdata                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
      m_axi_rresp                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      m_axi_rlast                         => '0',
      m_axi_ruser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_rvalid                        => '0',
      m_axi_rready                        => m_axi_rready,

      s_axi_arid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_araddr                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axi_arlen                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_arsize                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_arburst                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      s_axi_arlock                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_arcache                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_arprot                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_arqos                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_arregion                      => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_aruser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_arvalid                       => '0',
      s_axi_arready                       => s_axi_arready,
      s_axi_rid                           => s_axi_rid,
      s_axi_rdata                         => s_axi_rdata,
      s_axi_rresp                         => s_axi_rresp,
      s_axi_rlast                         => s_axi_rlast,
      s_axi_ruser                         => s_axi_ruser,
      s_axi_rready                        => '0',
      m_axis_tvalid                       => m_axis_tvalid,
      m_axis_tready                       => '0',
      m_axis_tdata                        => m_axis_tdata ,
      m_axis_tstrb                        => m_axis_tstrb ,
      m_axis_tkeep                        => m_axis_tkeep ,
      m_axis_tlast                        => m_axis_tlast ,
      m_axis_tid                          => m_axis_tid   ,
      m_axis_tdest                        => m_axis_tdest ,
      m_axis_tuser                        => m_axis_tuser ,
      s_axis_tvalid                       => '0',
      s_axis_tready                       => s_axis_tready,
      s_axis_tdata                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axis_tstrb                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tkeep                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tlast                        => '0',
      s_axis_tid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tdest                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tuser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_injectsbiterr                => '0',
      axi_aw_injectdbiterr                => '0',
      axi_aw_prog_full_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_prog_empty_thresh            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_data_count                   => axi_aw_data_count,
      axi_aw_wr_data_count                => axi_aw_wr_data_count,
      axi_aw_rd_data_count                => axi_aw_rd_data_count,
      axi_aw_sbiterr                      => axi_aw_sbiterr,
      axi_aw_dbiterr                      => axi_aw_dbiterr,
      axi_aw_overflow                     => axi_aw_overflow,
      axi_aw_underflow                    => axi_aw_underflow,
      axi_aw_prog_full                    => axi_aw_prog_full,
      axi_aw_prog_empty                   => axi_aw_prog_empty,
      axi_w_injectsbiterr                 => '0',
      axi_w_injectdbiterr                 => '0',
      axi_w_prog_full_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_w_prog_empty_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_w_data_count                    => axi_w_data_count,
      axi_w_wr_data_count                 => axi_w_wr_data_count,
      axi_w_rd_data_count                 => axi_w_rd_data_count,
      axi_w_sbiterr                       => axi_w_sbiterr,
      axi_w_dbiterr                       => axi_w_dbiterr,
      axi_w_overflow                      => axi_w_overflow,
      axi_w_underflow                     => axi_w_underflow,
      axi_w_prog_full                     => axi_w_prog_full,
      axi_w_prog_empty                    => axi_w_prog_empty,

      axi_b_injectsbiterr                 => '0',
      axi_b_injectdbiterr                 => '0',
      axi_b_prog_full_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_b_prog_empty_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_b_data_count                    => axi_b_data_count,
      axi_b_wr_data_count                 => axi_b_wr_data_count,
      axi_b_rd_data_count                 => axi_b_rd_data_count,
      axi_b_sbiterr                       => axi_b_sbiterr,
      axi_b_dbiterr                       => axi_b_dbiterr,
      axi_b_overflow                      => axi_b_overflow,
      axi_b_underflow                     => axi_b_underflow,
      axi_b_prog_full                     => axi_b_prog_full,
      axi_b_prog_empty                    => axi_b_prog_empty,
      axi_ar_injectsbiterr                => '0',
      axi_ar_injectdbiterr                => '0',
      axi_ar_prog_full_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_ar_prog_empty_thresh            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_ar_data_count                    => axi_ar_data_count,
      axi_ar_wr_data_count                 => axi_ar_wr_data_count,
      axi_ar_rd_data_count                 => axi_ar_rd_data_count,
      axi_ar_sbiterr                       => axi_ar_sbiterr,
      axi_ar_dbiterr                       => axi_ar_dbiterr,
      axi_ar_overflow                      => axi_ar_overflow,
      axi_ar_underflow                     => axi_ar_underflow,
      axi_ar_prog_full                     => axi_ar_prog_full,
      axi_ar_prog_empty                    => axi_ar_prog_empty,
      axi_r_injectsbiterr                  => '0',
      axi_r_injectdbiterr                  => '0',
      axi_r_prog_full_thresh               => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_r_prog_empty_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_r_data_count                     => axi_r_data_count,
      axi_r_wr_data_count                  => axi_r_wr_data_count,
      axi_r_rd_data_count                  => axi_r_rd_data_count,
      axi_r_sbiterr                        => axi_r_sbiterr,
      axi_r_dbiterr                        => axi_r_dbiterr,
      axi_r_overflow                       => axi_r_overflow,
      axi_r_underflow                      => axi_r_underflow,
      axi_r_prog_full                      => axi_r_prog_full,
      axi_r_prog_empty                     => axi_r_prog_empty,
      axis_injectsbiterr                   => '0',
      axis_injectdbiterr                   => '0',
      axis_prog_full_thresh                => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axis_prog_empty_thresh               => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axis_data_count                      => axis_data_count,
      axis_wr_data_count                   => axis_wr_data_count,
      axis_rd_data_count                   => axis_rd_data_count,
      axis_sbiterr                         => axis_sbiterr,
      axis_dbiterr                         => axis_dbiterr,
      axis_overflow                        => axis_overflow,
      axis_underflow                       => axis_underflow,
      axis_prog_full                       => axis_prog_full,
      axis_prog_empty                      => axis_prog_empty
    );

  end generate DIST_MEM_GEN;

  BRAM_MEM_GEN : if (USE_BRAM) generate
  begin
   FIF_BMG_INST : entity fifo_generator_v13_1_4.fifo_generator_v13_1_4
    GENERIC MAP (
      C_COMMON_CLOCK => 0,
      C_COUNT_TYPE => 0,
      C_DATA_COUNT_WIDTH => ADDR_BITS,
      C_DEFAULT_VALUE => "BlankString",
      C_DIN_WIDTH => WIDTH,
      C_DOUT_RST_VAL => "0",
      C_DOUT_WIDTH => WIDTH,
      C_ENABLE_RLOCS => 0,
      C_FAMILY => C_FAMILY,
      C_FULL_FLAGS_RST_VAL => 0,
      C_HAS_ALMOST_EMPTY => 0,
      C_HAS_ALMOST_FULL => 0,
      C_HAS_BACKUP => 0,
      C_HAS_DATA_COUNT => 0,
      C_HAS_INT_CLK => 0,
      C_HAS_MEMINIT_FILE => 0,
      C_HAS_OVERFLOW => 0,
      C_HAS_RD_DATA_COUNT => 0,
      C_HAS_RD_RST => 0,
      C_HAS_RST => 1,
      C_HAS_SRST => 0,
      C_HAS_UNDERFLOW => 0,
      C_HAS_VALID => 0,
      C_HAS_WR_ACK => 0,
      C_HAS_WR_DATA_COUNT => 0,
      C_HAS_WR_RST => 0,
      C_IMPLEMENTATION_TYPE => 2,
      C_INIT_WR_PNTR_VAL => 0,
      C_MEMORY_TYPE => 1,
      C_MIF_FILE_NAME => "BlankString",
      C_OPTIMIZATION_MODE => 0,
      C_OVERFLOW_LOW => 0,
      C_PRELOAD_LATENCY => 0,
      C_PRELOAD_REGS => 1,
      C_PRIM_FIFO_TYPE => "512x36",
      C_PROG_EMPTY_THRESH_ASSERT_VAL => 2,
      C_PROG_EMPTY_THRESH_NEGATE_VAL => 3,
      C_PROG_EMPTY_TYPE => 0,
      C_PROG_FULL_THRESH_ASSERT_VAL => 29,
      C_PROG_FULL_THRESH_NEGATE_VAL => 28,
      C_PROG_FULL_TYPE => 0,
      C_RD_DATA_COUNT_WIDTH => ADDR_BITS,
      C_RD_DEPTH => FIFO_DEPTH,
      C_RD_FREQ => 1,
      C_RD_PNTR_WIDTH => ADDR_BITS,
      C_UNDERFLOW_LOW => 0,
      C_USE_DOUT_RST => 1,
      C_USE_ECC => 0,
      C_USE_EMBEDDED_REG => 0,
      C_USE_PIPELINE_REG => 0,
      C_POWER_SAVING_MODE => 0,
      C_USE_FIFO16_FLAGS => 0,
      C_USE_FWFT_DATA_COUNT => 0,
      C_VALID_LOW => 0,
      C_WR_ACK_LOW => 0,
      C_WR_DATA_COUNT_WIDTH => ADDR_BITS,
      C_WR_DEPTH => FIFO_DEPTH,
      C_WR_FREQ => 1,
      C_WR_PNTR_WIDTH => ADDR_BITS,
      C_WR_RESPONSE_LATENCY => 1,
      C_MSGON_VAL => 1,
      C_ENABLE_RST_SYNC => 0,
      C_ERROR_INJECTION_TYPE => 0,
      C_SYNCHRONIZER_STAGE => C_MTBF_STAGES,
      C_INTERFACE_TYPE => 0,
      C_AXI_TYPE => 1,
      C_HAS_AXI_WR_CHANNEL => 1,
      C_HAS_AXI_RD_CHANNEL => 1,
      C_HAS_SLAVE_CE => 0,
      C_HAS_MASTER_CE => 0,
      C_ADD_NGC_CONSTRAINT => 0,
      C_USE_COMMON_OVERFLOW => 0,
      C_USE_COMMON_UNDERFLOW => 0,
      C_USE_DEFAULT_SETTINGS => 0,
      C_AXI_ID_WIDTH => 1,
      C_AXI_ADDR_WIDTH => 32,
      C_AXI_DATA_WIDTH => 64,
      C_AXI_LEN_WIDTH => 8,
      C_AXI_LOCK_WIDTH => 1,
      C_HAS_AXI_ID => 0,
      C_HAS_AXI_AWUSER => 0,
      C_HAS_AXI_WUSER => 0,
      C_HAS_AXI_BUSER => 0,
      C_HAS_AXI_ARUSER => 0,
      C_HAS_AXI_RUSER => 0,
      C_AXI_ARUSER_WIDTH => 1,
      C_AXI_AWUSER_WIDTH => 1,
      C_AXI_WUSER_WIDTH => 1,
      C_AXI_BUSER_WIDTH => 1,
      C_AXI_RUSER_WIDTH => 1,
      C_HAS_AXIS_TDATA => 1,
      C_HAS_AXIS_TID => 0,
      C_HAS_AXIS_TDEST => 0,
      C_HAS_AXIS_TUSER => 1,
      C_HAS_AXIS_TREADY => 1,
      C_HAS_AXIS_TLAST => 0,
      C_HAS_AXIS_TSTRB => 0,
      C_HAS_AXIS_TKEEP => 0,
      C_AXIS_TDATA_WIDTH => 8,
      C_AXIS_TID_WIDTH => 1,
      C_AXIS_TDEST_WIDTH => 1,
      C_AXIS_TUSER_WIDTH => 4,
      C_AXIS_TSTRB_WIDTH => 1,
      C_AXIS_TKEEP_WIDTH => 1,
      C_WACH_TYPE => 0,
      C_WDCH_TYPE => 0,
      C_WRCH_TYPE => 0,
      C_RACH_TYPE => 0,
      C_RDCH_TYPE => 0,
      C_AXIS_TYPE => 0,
      C_IMPLEMENTATION_TYPE_WACH => 1,
      C_IMPLEMENTATION_TYPE_WDCH => 1,
      C_IMPLEMENTATION_TYPE_WRCH => 1,
      C_IMPLEMENTATION_TYPE_RACH => 1,
      C_IMPLEMENTATION_TYPE_RDCH => 1,
      C_IMPLEMENTATION_TYPE_AXIS => 1,
      C_APPLICATION_TYPE_WACH => 0,
      C_APPLICATION_TYPE_WDCH => 0,
      C_APPLICATION_TYPE_WRCH => 0,
      C_APPLICATION_TYPE_RACH => 0,
      C_APPLICATION_TYPE_RDCH => 0,
      C_APPLICATION_TYPE_AXIS => 0,
      C_PRIM_FIFO_TYPE_WACH => "512x36",
      C_PRIM_FIFO_TYPE_WDCH => "1kx36",
      C_PRIM_FIFO_TYPE_WRCH => "512x36",
      C_PRIM_FIFO_TYPE_RACH => "512x36",
      C_PRIM_FIFO_TYPE_RDCH => "1kx36",
      C_PRIM_FIFO_TYPE_AXIS => "1kx18",
      C_USE_ECC_WACH => 0,
      C_USE_ECC_WDCH => 0,
      C_USE_ECC_WRCH => 0,
      C_USE_ECC_RACH => 0,
      C_USE_ECC_RDCH => 0,
      C_USE_ECC_AXIS => 0,
      C_ERROR_INJECTION_TYPE_WACH => 0,
      C_ERROR_INJECTION_TYPE_WDCH => 0,
      C_ERROR_INJECTION_TYPE_WRCH => 0,
      C_ERROR_INJECTION_TYPE_RACH => 0,
      C_ERROR_INJECTION_TYPE_RDCH => 0,
      C_ERROR_INJECTION_TYPE_AXIS => 0,
      C_DIN_WIDTH_WACH => 32,
      C_DIN_WIDTH_WDCH => 64,
      C_DIN_WIDTH_WRCH => 2,
      C_DIN_WIDTH_RACH => 32,
      C_DIN_WIDTH_RDCH => 64,
      C_DIN_WIDTH_AXIS => 1,
      C_WR_DEPTH_WACH => 16,
      C_WR_DEPTH_WDCH => 1024,
      C_WR_DEPTH_WRCH => 16,
      C_WR_DEPTH_RACH => 16,
      C_WR_DEPTH_RDCH => 1024,
      C_WR_DEPTH_AXIS => 1024,
      C_WR_PNTR_WIDTH_WACH => 4,
      C_WR_PNTR_WIDTH_WDCH => 10,
      C_WR_PNTR_WIDTH_WRCH => 4,
      C_WR_PNTR_WIDTH_RACH => 4,
      C_WR_PNTR_WIDTH_RDCH => 10,
      C_WR_PNTR_WIDTH_AXIS => 10,
      C_HAS_DATA_COUNTS_WACH => 0,
      C_HAS_DATA_COUNTS_WDCH => 0,
      C_HAS_DATA_COUNTS_WRCH => 0,
      C_HAS_DATA_COUNTS_RACH => 0,
      C_HAS_DATA_COUNTS_RDCH => 0,
      C_HAS_DATA_COUNTS_AXIS => 0,
      C_HAS_PROG_FLAGS_WACH => 0,
      C_HAS_PROG_FLAGS_WDCH => 0,
      C_HAS_PROG_FLAGS_WRCH => 0,
      C_HAS_PROG_FLAGS_RACH => 0,
      C_HAS_PROG_FLAGS_RDCH => 0,
      C_HAS_PROG_FLAGS_AXIS => 0,
      C_PROG_FULL_TYPE_WACH => 0,
      C_PROG_FULL_TYPE_WDCH => 0,
      C_PROG_FULL_TYPE_WRCH => 0,
      C_PROG_FULL_TYPE_RACH => 0,
      C_PROG_FULL_TYPE_RDCH => 0,
      C_PROG_FULL_TYPE_AXIS => 0,
      C_PROG_FULL_THRESH_ASSERT_VAL_WACH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_WDCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_WRCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_RACH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_RDCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_AXIS => 1023,
      C_PROG_EMPTY_TYPE_WACH => 0,
      C_PROG_EMPTY_TYPE_WDCH => 0,
      C_PROG_EMPTY_TYPE_WRCH => 0,
      C_PROG_EMPTY_TYPE_RACH => 0,
      C_PROG_EMPTY_TYPE_RDCH => 0,
      C_PROG_EMPTY_TYPE_AXIS => 0,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS => 1022,
      C_REG_SLICE_MODE_WACH => 0,
      C_REG_SLICE_MODE_WDCH => 0,
      C_REG_SLICE_MODE_WRCH => 0,
      C_REG_SLICE_MODE_RACH => 0,
      C_REG_SLICE_MODE_RDCH => 0,
      C_REG_SLICE_MODE_AXIS => 0
    )
    PORT MAP (
      backup                              => '0',
      backup_marker                       => '0',
      clk                                 => '0',
      rst                                 => '0',
      srst                                => '0',
      wr_clk                              => wr_clk,
      wr_rst                              => wr_rst,
      rd_clk                              => rd_clk,
      rd_rst                              => rd_rst,
      din                                 => din,
      wr_en                               => din_vld,
      rd_en                               => dout_rdy,
      prog_empty_thresh                   => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_empty_thresh_assert            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_empty_thresh_negate            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_full_thresh                    => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_full_thresh_assert             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_full_thresh_negate             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      int_clk                             => '0',
      injectdbiterr                       => '0',
      injectsbiterr                       => '0',
      sleep                               => '0',
      dout                                => dout,
      full                                => full,
      almost_full                         => almost_full,
      wr_ack                              => wr_ack,
      overflow                            => overflow,
      empty                               => empty,
      almost_empty                        => almost_empty,
      valid                               => valid,
      underflow                           => underflow,
      data_count                          => data_count,
      rd_data_count                       => rd_data_count,
      wr_data_count                       => wr_data_count,
      prog_full                           => prog_full,
      prog_empty                          => prog_empty,
      sbiterr                             => sbiterr,
      dbiterr                             => dbiterr,
      wr_rst_busy                         => wr_rst_busy,
      rd_rst_busy                         => rd_rst_busy,

      m_aclk                              => '0',
      s_aclk                              => '0',
      s_aresetn                           => '0',
      m_aclk_en                           => '0',
      s_aclk_en                           => '0',
      m_axi_awid                          => m_axi_awid,
      m_axi_awaddr                        => m_axi_awaddr,
      m_axi_awlen                         => m_axi_awlen,
      m_axi_awsize                        => m_axi_awsize,
      m_axi_awburst                       => m_axi_awburst,
      m_axi_awlock                        => m_axi_awlock,
      m_axi_awcache                       => m_axi_awcache,
      m_axi_awprot                        => m_axi_awprot,
      m_axi_awqos                         => m_axi_awqos,
      m_axi_awregion                      => m_axi_awregion,
      m_axi_awuser                        => m_axi_awuser,
      m_axi_awvalid                       => m_axi_awvalid,
      m_axi_awready                       => '0',
      m_axi_wid                           => m_axi_wid,
      m_axi_wdata                         => m_axi_wdata,
      m_axi_wstrb                         => m_axi_wstrb,
      m_axi_wlast                         => m_axi_wlast,
      m_axi_wuser                         => m_axi_wuser,
      m_axi_wvalid                        => m_axi_wvalid,
      m_axi_wready                        => '0',
      m_axi_bid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_bresp                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      m_axi_buser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_bvalid                        => '0',
      m_axi_bready                        => m_axi_bready,
      s_axi_awid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awaddr                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axi_awlen                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_awsize                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_awburst                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      s_axi_awlock                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awcache                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awprot                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_awqos                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awregion                      => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awuser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awvalid                       => '0',
      s_axi_awready                       => s_axi_awready,
      s_axi_wid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_wdata                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
      s_axi_wstrb                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_wlast                         => '0',
      s_axi_wuser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_wvalid                        => '0',
      s_axi_wready                        => s_axi_wready,
        
      s_axi_bid                           => s_axi_bid,
      s_axi_bresp                         => s_axi_bresp,
      s_axi_buser                         => s_axi_buser,
      s_axi_bready                        => '0',
      m_axi_arid                          => m_axi_arid,
      m_axi_araddr                        => m_axi_araddr,
      m_axi_arlen                         => m_axi_arlen,
      m_axi_arsize                        => m_axi_arsize,
      m_axi_arburst                       => m_axi_arburst,
      m_axi_arlock                        => m_axi_arlock,
      m_axi_arcache                       => m_axi_arcache,
      m_axi_arprot                        => m_axi_arprot,
      m_axi_arqos                         => m_axi_arqos,
      m_axi_arregion                      => m_axi_arregion,
      m_axi_aruser                        => m_axi_aruser,
      m_axi_arvalid                       => m_axi_arvalid,
      m_axi_arready                       => '0',
        
      m_axi_rid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_rdata                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
      m_axi_rresp                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      m_axi_rlast                         => '0',
      m_axi_ruser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_rvalid                        => '0',
      m_axi_rready                        => m_axi_rready,

      s_axi_arid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_araddr                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axi_arlen                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_arsize                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_arburst                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      s_axi_arlock                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_arcache                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_arprot                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_arqos                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_arregion                      => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_aruser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_arvalid                       => '0',
      s_axi_arready                       => s_axi_arready,
      s_axi_rid                           => s_axi_rid,
      s_axi_rdata                         => s_axi_rdata,
      s_axi_rresp                         => s_axi_rresp,
      s_axi_rlast                         => s_axi_rlast,
      s_axi_ruser                         => s_axi_ruser,
      s_axi_rready                        => '0',
      m_axis_tvalid                       => m_axis_tvalid,
      m_axis_tready                       => '0',
      m_axis_tdata                        => m_axis_tdata ,
      m_axis_tstrb                        => m_axis_tstrb ,
      m_axis_tkeep                        => m_axis_tkeep ,
      m_axis_tlast                        => m_axis_tlast ,
      m_axis_tid                          => m_axis_tid   ,
      m_axis_tdest                        => m_axis_tdest ,
      m_axis_tuser                        => m_axis_tuser ,
      s_axis_tvalid                       => '0',
      s_axis_tready                       => s_axis_tready,
      s_axis_tdata                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axis_tstrb                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tkeep                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tlast                        => '0',
      s_axis_tid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tdest                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tuser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_injectsbiterr                => '0',
      axi_aw_injectdbiterr                => '0',
      axi_aw_prog_full_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_prog_empty_thresh            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_data_count                   => axi_aw_data_count,
      axi_aw_wr_data_count                => axi_aw_wr_data_count,
      axi_aw_rd_data_count                => axi_aw_rd_data_count,
      axi_aw_sbiterr                      => axi_aw_sbiterr,
      axi_aw_dbiterr                      => axi_aw_dbiterr,
      axi_aw_overflow                     => axi_aw_overflow,
      axi_aw_underflow                    => axi_aw_underflow,
      axi_aw_prog_full                    => axi_aw_prog_full,
      axi_aw_prog_empty                   => axi_aw_prog_empty,
      axi_w_injectsbiterr                 => '0',
      axi_w_injectdbiterr                 => '0',
      axi_w_prog_full_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_w_prog_empty_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_w_data_count                    => axi_w_data_count,
      axi_w_wr_data_count                 => axi_w_wr_data_count,
      axi_w_rd_data_count                 => axi_w_rd_data_count,
      axi_w_sbiterr                       => axi_w_sbiterr,
      axi_w_dbiterr                       => axi_w_dbiterr,
      axi_w_overflow                      => axi_w_overflow,
      axi_w_underflow                     => axi_w_underflow,
      axi_w_prog_full                     => axi_w_prog_full,
      axi_w_prog_empty                    => axi_w_prog_empty,

      axi_b_injectsbiterr                 => '0',
      axi_b_injectdbiterr                 => '0',
      axi_b_prog_full_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_b_prog_empty_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_b_data_count                    => axi_b_data_count,
      axi_b_wr_data_count                 => axi_b_wr_data_count,
      axi_b_rd_data_count                 => axi_b_rd_data_count,
      axi_b_sbiterr                       => axi_b_sbiterr,
      axi_b_dbiterr                       => axi_b_dbiterr,
      axi_b_overflow                      => axi_b_overflow,
      axi_b_underflow                     => axi_b_underflow,
      axi_b_prog_full                     => axi_b_prog_full,
      axi_b_prog_empty                    => axi_b_prog_empty,
      axi_ar_injectsbiterr                => '0',
      axi_ar_injectdbiterr                => '0',
      axi_ar_prog_full_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_ar_prog_empty_thresh            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_ar_data_count                    => axi_ar_data_count,
      axi_ar_wr_data_count                 => axi_ar_wr_data_count,
      axi_ar_rd_data_count                 => axi_ar_rd_data_count,
      axi_ar_sbiterr                       => axi_ar_sbiterr,
      axi_ar_dbiterr                       => axi_ar_dbiterr,
      axi_ar_overflow                      => axi_ar_overflow,
      axi_ar_underflow                     => axi_ar_underflow,
      axi_ar_prog_full                     => axi_ar_prog_full,
      axi_ar_prog_empty                    => axi_ar_prog_empty,
      axi_r_injectsbiterr                  => '0',
      axi_r_injectdbiterr                  => '0',
      axi_r_prog_full_thresh               => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_r_prog_empty_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_r_data_count                     => axi_r_data_count,
      axi_r_wr_data_count                  => axi_r_wr_data_count,
      axi_r_rd_data_count                  => axi_r_rd_data_count,
      axi_r_sbiterr                        => axi_r_sbiterr,
      axi_r_dbiterr                        => axi_r_dbiterr,
      axi_r_overflow                       => axi_r_overflow,
      axi_r_underflow                      => axi_r_underflow,
      axi_r_prog_full                      => axi_r_prog_full,
      axi_r_prog_empty                     => axi_r_prog_empty,
      axis_injectsbiterr                   => '0',
      axis_injectdbiterr                   => '0',
      axis_prog_full_thresh                => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axis_prog_empty_thresh               => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axis_data_count                      => axis_data_count,
      axis_wr_data_count                   => axis_wr_data_count,
      axis_rd_data_count                   => axis_rd_data_count,
      axis_sbiterr                         => axis_sbiterr,
      axis_dbiterr                         => axis_dbiterr,
      axis_overflow                        => axis_overflow,
      axis_underflow                       => axis_underflow,
      axis_prog_full                       => axis_prog_full,
      axis_prog_empty                      => axis_prog_empty
    );

  end generate BRAM_MEM_GEN;



  

end generate NEW_INTRO;


end rtl;


-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : xd_s2m_adapter.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-10-25
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.xd_s2m_converter;
use axis_accelerator_adapter_v2_1_16.xd_s2m_memory_dc;
use axis_accelerator_adapter_v2_1_16.srl_fifo_32_wt;



entity xd_s2m_adapter is
  generic (
    -- System generics:
    C_FAMILY               : string := "virtex7";
    C_MTBF_STAGES          : integer;
    C_BRAM_TYPE            : string := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2
    C_SELECT_XPM           : integer := 0;
    C_S_AXIS_TDATA_WIDTH   : integer;
    C_S_AXIS_TUSER_WIDTH   : integer;
    C_S_AXIS_TID_WIDTH     : integer;
    C_S_AXIS_TDEST_WIDTH   : integer;
    C_AP_ARG_DATA_WIDTH    : integer;
    C_AP_ARG_ADDR_WIDTH    : integer;
    C_MULTIBUFFER_DEPTH    : integer;
    C_AP_ARG_WIDTH         : integer;
    C_AP_ARG_N_DIM         : integer;
    C_AP_ARG_DIM_1         : integer;
    C_AP_ARG_DIM_2         : integer;
    C_AP_ARG_FORMAT_TYPE   : integer;
    C_AP_ARG_FORMAT_FACTOR : integer;
    C_AP_ARG_FORMAT_DIM    : integer;
    C_EXTRA_SYNCS          : integer);
  port (
    -- Input streams
    S_AXIS_ACLK       : in  std_logic;
    S_AXIS_ARESETN    : in  std_logic;
    S_AXIS_TVALID     : in  std_logic;
    S_AXIS_TREADY     : out std_logic;
    S_AXIS_TDATA      : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
    S_AXIS_TSTRB      : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0);
    S_AXIS_TKEEP      : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0);
    S_AXIS_TLAST      : in  std_logic;
    S_AXIS_TID        : in  std_logic_vector(C_S_AXIS_TID_WIDTH-1 downto 0);
    S_AXIS_TDEST      : in  std_logic_vector(C_S_AXIS_TDEST_WIDTH-1 downto 0);
    S_AXIS_TUSER      : in  std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0);
    dbg_stream_nwords : out std_logic_vector(15 downto 0);
    dbg_buffer_nwords : out std_logic_vector(15 downto 0);
    dbg_ap_start      : in  std_logic;
    ap_clk            : in  std_logic;
    ap_rst_sync       : in  std_logic;
    ap_rst            : in  std_logic;
    ap_arg_addr       : in  std_logic_vector(C_AP_ARG_ADDR_WIDTH-1 downto 0);
    ap_arg_ce         : in  std_logic;
    ap_arg_we         : in  std_logic;
    ap_arg_din        : in  std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    ap_arg_dout       : out std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    mb_arg_rdy        : out std_logic;
    mb_arg_done       : in  std_logic;
    status_empty      : out std_logic;
    status_full       : out std_logic;
    status_used       : out std_logic_vector(3 downto 0));  -- Number of used buffers
end entity;

architecture rtl of xd_s2m_adapter is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";

  signal axi_rst : std_logic;
  signal axi_rst1 : std_logic;
  signal axi_rst2 : std_logic;

  function calc_axi_addr_width return integer is
    variable addr_width : integer := 0;
  begin
    if (C_S_AXIS_TDATA_WIDTH > C_AP_ARG_DATA_WIDTH) then
      addr_width := C_AP_ARG_ADDR_WIDTH-log2(C_S_AXIS_TDATA_WIDTH/C_AP_ARG_DATA_WIDTH);
    else
      addr_width := C_AP_ARG_ADDR_WIDTH+log2(C_AP_ARG_DATA_WIDTH/C_S_AXIS_TDATA_WIDTH);
    end if;
    return addr_width;
  end function calc_axi_addr_width;

  constant AXI_DATA_WIDTH : integer := C_S_AXIS_TDATA_WIDTH;
  constant AXI_ADDR_WIDTH : integer := calc_axi_addr_width;

  signal ap_rst_vec         : std_logic_vector(0 downto 0);
--  signal ap_rst_sync        : std_logic;
--  signal ap_rst_sync1        : std_logic;
  signal axisn_rst            : std_logic;
  signal conv_addr          : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal conv_ce            : std_logic;
  signal conv_we            : std_logic;
  signal conv_last          : std_logic;
  signal conv_rdy           : std_logic;
  signal conv_data          : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
  -- Control for number of words receided in the stream
  signal last_conv_addr_vld : std_logic;
  signal stream_nwords      : unsigned(AXI_ADDR_WIDTH downto 0);
  signal stream_nwords_vld  : std_logic;
  signal buffer_nwords      : std_logic_vector(AXI_ADDR_WIDTH downto 0);
  signal buffer_nwords_vld  : std_logic;
  signal buffer_nwords_rdy  : std_logic;

    ATTRIBUTE async_reg           : STRING;
  ATTRIBUTE async_reg OF axi_rst  : SIGNAL IS "true";
  ATTRIBUTE async_reg OF axi_rst1  : SIGNAL IS "true";
--  ATTRIBUTE async_reg OF ap_rst_sync1  : SIGNAL IS "true";
--  ATTRIBUTE async_reg OF ap_rst_sync  : SIGNAL IS "true";


begin


  -- undriven ports 
  dbg_stream_nwords <= (others => '0');
  dbg_buffer_nwords <= (others => '0');
  
  -- core reset generation


--      prd1: PROCESS (S_AXIS_ACLK, ap_rst)
--      BEGIN
--       -- Register Stage #1 
--        IF (ap_rst = '1') THEN
--          ap_rst_sync1 <= '1';
--          ap_rst_sync <= '1';
--        ELSIF (S_AXIS_ACLK'event and S_AXIS_ACLK = '1') THEN
--          ap_rst_sync1 <= '0';
--          ap_rst_sync <= ap_rst_sync1;
--        END IF;
--        END PROCESS prd1;

	axi_rst2 <= not(S_AXIS_ARESETN) or ap_rst_sync; 

      prd2: PROCESS (S_AXIS_ACLK, axi_rst2)
      BEGIN
       -- Register Stage #1 
        IF (axi_rst2 = '1') THEN
          axi_rst1 <= '1';
          axi_rst <= '1';
        ELSIF (S_AXIS_ACLK'event and S_AXIS_ACLK = '1') THEN
          axi_rst1 <= '0';
          axi_rst <= axi_rst1;
        END IF;
        END PROCESS prd2;


  CONVERTER_I : entity axis_accelerator_adapter_v2_1_16.xd_s2m_converter
    generic map (
      C_FAMILY       => C_FAMILY,
      AXI_DATA_WIDTH => AXI_DATA_WIDTH,
      AXI_ADDR_WIDTH => AXI_ADDR_WIDTH,
      C_EXTRA_SYNCS  => C_EXTRA_SYNCS)
    port map (
      axi_clk   => S_AXIS_ACLK,
      axi_rst   => axi_rst,
      axis_vld  => S_AXIS_TVALID,
      axis_rdy  => S_AXIS_TREADY,
      axis_last => S_AXIS_TLAST,
      axis_keep => S_AXIS_TKEEP,
      axis_data => S_AXIS_TDATA,
      conv_addr => conv_addr,
      conv_ce   => conv_ce,
      conv_we   => conv_we,
      conv_last => conv_last,
      conv_rdy  => conv_rdy,
      conv_data => conv_data);

  MEM_CTRL_I : entity axis_accelerator_adapter_v2_1_16.xd_s2m_memory_dc
    generic map (
      -- System generics:
      C_FAMILY               => C_FAMILY,
      C_MTBF_STAGES          => C_MTBF_STAGES,
      C_BRAM_TYPE            => C_BRAM_TYPE,
      C_SELECT_XPM           => C_SELECT_XPM,
      CONV_DATA_WIDTH        => AXI_DATA_WIDTH,
      CONV_ADDR_WIDTH        => AXI_ADDR_WIDTH,
      C_AP_ARG_WIDTH         => C_AP_ARG_WIDTH,
      C_AP_ARG_N_DIM         => C_AP_ARG_N_DIM,
      C_AP_ARG_DIM_1         => C_AP_ARG_DIM_1,
      C_AP_ARG_DIM_2         => C_AP_ARG_DIM_2,
      C_AP_ARG_FORMAT_TYPE   => C_AP_ARG_FORMAT_TYPE,
      C_AP_ARG_FORMAT_FACTOR => C_AP_ARG_FORMAT_FACTOR,
      C_AP_ARG_FORMAT_DIM    => C_AP_ARG_FORMAT_DIM,
      C_AP_ARG_DATA_WIDTH    => C_AP_ARG_DATA_WIDTH,
      C_AP_ARG_ADDR_WIDTH    => C_AP_ARG_ADDR_WIDTH,
      C_MULTIBUFFER_DEPTH    => C_MULTIBUFFER_DEPTH,
      C_EXTRA_SYNCS          => C_EXTRA_SYNCS)
    port map (
      clk          => S_AXIS_ACLK,
      rst          => axi_rst,
      conv_addr    => conv_addr,
      conv_ce      => conv_ce,
      conv_we      => conv_we,
      conv_last    => conv_last,
      conv_rdy     => conv_rdy,
      conv_data    => conv_data,
      ap_clk       => ap_clk,
      ap_rst       => ap_rst,
      ap_arg_addr  => ap_arg_addr,
      ap_arg_ce    => ap_arg_ce,
      ap_arg_we    => ap_arg_we,
      ap_arg_din   => ap_arg_din,
      ap_arg_dout  => ap_arg_dout,
      mb_arg_rdy   => mb_arg_rdy,
      mb_arg_done  => mb_arg_done,
      status_empty => status_empty,
      status_full  => status_full,
      status_used  => status_used);

  ---------------------------
  -- The following logic is used for debugging purposes (provide number of
  -- words received in the axi_stream. TODO: design not finished.

  last_conv_addr_vld <= conv_ce and conv_rdy and conv_last;

  process(S_AXIS_ACLK)
  begin
    if (S_AXIS_ACLK'event and S_AXIS_ACLK = '1') then
      if(last_conv_addr_vld = '1') then
        stream_nwords <= unsigned('0' & conv_addr) + 1;
      end if;
    end if;
  end process;

  process(S_AXIS_ACLK, axi_rst)
  begin
    if (axi_rst = '1') then
      stream_nwords_vld <= '0';
    elsif (S_AXIS_ACLK'event and S_AXIS_ACLK = '1') then
      stream_nwords_vld <= last_conv_addr_vld;
    end if;
  end process;

  NWORDS_FIFO_I : entity axis_accelerator_adapter_v2_1_16.srl_fifo_32_wt
    generic map (
      C_FAMILY => C_FAMILY,
      WIDTH    => AXI_ADDR_WIDTH+1)
    port map (
      rst      => axi_rst,
      clk      => S_AXIS_ACLK,
      din      => std_logic_vector(stream_nwords),
      din_vld  => stream_nwords_vld,
      din_rdy  => open,
      dout     => buffer_nwords,
      dout_vld => buffer_nwords_vld,
      dout_rdy => buffer_nwords_rdy);

  buffer_nwords_rdy <= '0';

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : xd_output_scalars_fifo.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2012-11-04
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;

library fifo_generator_v13_1_4;
use fifo_generator_v13_1_4.all;

entity xd_output_scalars_fifo is
  generic (
    C_FAMILY : string  := "virtex6";              -- Xilinx FPGA family
    C_MTBF_STAGES : integer  := 4;
    WIDTH    : integer := 16);
  port (
    din      : in  std_logic_vector(WIDTH-1 downto 0);
    din_vld  : in  std_logic;
    din_rdy  : out std_logic;
    wr_clk   : in  std_logic;
    dout     : out std_logic_vector(WIDTH-1 downto 0);
    dout_vld : out std_logic;
    dout_rdy : in  std_logic;
    rd_used  : out std_logic_vector(3 downto 0);  -- Additional bit needed
    rd_empty : out std_logic;
    rd_full  : out std_logic;
    rd_clk   : in  std_logic;
    rst      : in  std_logic);
end xd_output_scalars_fifo;

architecture rtl of xd_output_scalars_fifo is

  -- FIFO constants
  constant DEPTH              : integer := 15;
  constant FIFO_DEPTH         : integer := calc_fifo_depth(DEPTH)+1;
  constant ADDR_BITS          : integer := log2(FIFO_DEPTH);
  constant INIT_NEXT_RD_GRAY  : integer := 2**ADDR_BITS-1;
  constant INIT_RD_GRAY       : integer := 2**ADDR_BITS-2;
  constant INIT_PREV_RD_GRAY  : integer := 2**ADDR_BITS-3;
  constant INIT_NEXT_WR_GRAY  : integer := INIT_NEXT_RD_GRAY;
  constant INIT_WR_GRAY       : integer := INIT_RD_GRAY;
  constant INIT_WR_GRAY_AHEAD : integer := 2**ADDR_BITS-0;

  signal rst_vec : std_logic_vector(0 downto 0);
  signal wr_rst_vec : std_logic_vector(0 downto 0);
  signal rd_rst_vec : std_logic_vector(0 downto 0);
  signal wr_rst : std_logic;
  signal rd_rst : std_logic;
  signal rd_addr       : unsigned(ADDR_BITS-1 downto 0);
  signal wr_addr       : unsigned(ADDR_BITS-1 downto 0);
  -- Next signals are gray values:
  signal wr_gray       : std_logic_vector(ADDR_BITS-1 downto 0);
  signal next_wr_gray  : std_logic_vector(ADDR_BITS-1 downto 0);
  signal wr_gray_ahead : std_logic_vector(ADDR_BITS-1 downto 0);
  signal rd_gray       : std_logic_vector(ADDR_BITS-1 downto 0);
  signal next_rd_gray  : std_logic_vector(ADDR_BITS-1 downto 0);
  signal prev_rd_gray  : std_logic_vector(ADDR_BITS-1 downto 0);
  -- 
  signal fifo_we       : std_logic;
  signal fifo_re       : std_logic;
  -- 
  signal din_rdy_i     : std_logic;
  signal empty_i       : std_logic;
  signal rd_en         : std_logic;
  signal dout_vld_i    : std_logic;
  signal dout_trf_ok   : std_logic;

  type   mem_type is array (2**ADDR_BITS-1 downto 0) of std_logic_vector (WIDTH-1 downto 0);
  signal mem : mem_type;

  attribute ram_style        : string;
  attribute ram_style of mem : signal is "distributed";

  signal mem_dout     : std_logic_vector(WIDTH-1 downto 0);
  -- 
  signal wr_gray_sync : std_logic_vector(ADDR_BITS-1 downto 0);
  signal rd_bin       : unsigned(ADDR_BITS-1 downto 0);
  signal wr_bin       : unsigned(ADDR_BITS-1 downto 0);
  signal ptr_dist     : unsigned(ADDR_BITS-1 downto 0);
  signal rd_used_i     : std_logic_vector(ADDR_BITS-1 downto 0);
  signal rd_full_i    : std_logic;
  signal empty    : std_logic;
  signal full    : std_logic;
  signal rstn    : std_logic;
  signal almost_full :std_logic;    
  signal wr_ack :std_logic;    
  signal overflow :std_logic;    
  signal almost_empty :std_logic;    
  signal valid :std_logic;    
  signal underflow :std_logic;    
  signal data_count :std_logic_vector(ADDR_BITS-1 downto 0);    
  signal rd_data_count :std_logic_vector(ADDR_BITS-1 downto 0);    
  signal wr_data_count :std_logic_vector(ADDR_BITS-1 downto 0);    
  signal prog_full :std_logic;    
  signal prog_empty :std_logic;    
  signal sbiterr :std_logic;    
  signal dbiterr :std_logic;    
  signal wr_rst_busy :std_logic;    
  signal rd_rst_busy :std_logic;    
  signal m_axi_awid :std_logic_vector(0 downto 0);    
  signal m_axi_awaddr :std_logic_vector(31 downto 0);    
  signal m_axi_awlen :std_logic_vector(7 downto 0);    
  signal m_axi_awsize :std_logic_vector(2 downto 0);    
  signal m_axi_awburst :std_logic_vector(1 downto 0);    
  signal m_axi_awlock :std_logic_vector(0 downto 0);    
  signal m_axi_awcache :std_logic_vector(3 downto 0);    
  signal m_axi_awprot :std_logic_vector(2 downto 0);    
  signal m_axi_awqos :std_logic_vector(3 downto 0);    
  signal m_axi_awregion :std_logic_vector(3 downto 0);    
  signal m_axi_awuser :std_logic_vector(0 downto 0);    
  signal m_axi_awvalid :std_logic;
  signal m_axi_wid :std_logic_vector(0 downto 0);    
  signal m_axi_wdata :std_logic_vector(63 downto 0);    
  signal m_axi_wstrb :std_logic_vector(7 downto 0);    
  signal m_axi_wlast :std_logic;
  signal m_axi_wuser :std_logic_vector(0 downto 0);    
  signal m_axi_wvalid :std_logic;
  signal m_axi_bready :std_logic;
  signal s_axi_awready :std_logic;
  signal s_axi_wready :std_logic;
  signal s_axi_bid :std_logic_vector(0 downto 0);    
  signal s_axi_bresp :std_logic_vector(1 downto 0);    
  signal s_axi_buser :std_logic_vector(0 downto 0);    
  signal m_axi_arid :std_logic_vector(0 downto 0);    
  signal m_axi_araddr :std_logic_vector(31 downto 0);    
  signal m_axi_arlen :std_logic_vector(7 downto 0);    
  signal m_axi_arsize :std_logic_vector(2 downto 0);    
  signal m_axi_arburst :std_logic_vector(1 downto 0);    
  signal m_axi_arlock :std_logic_vector(0 downto 0);    
  signal m_axi_arcache :std_logic_vector(3 downto 0);    
  signal m_axi_arprot :std_logic_vector(2 downto 0);    
  signal m_axi_arqos :std_logic_vector(3 downto 0);    
  signal m_axi_arregion :std_logic_vector(3 downto 0);    
  signal m_axi_aruser :std_logic_vector(0 downto 0);    
  signal m_axi_arvalid :std_logic;
  signal m_axi_rready :std_logic;
  signal s_axi_arready :std_logic;
  signal s_axi_rid :std_logic_vector(0 downto 0);    
  signal s_axi_rdata :std_logic_vector(63 downto 0);    
  signal s_axi_rresp :std_logic_vector(1 downto 0);    
  signal s_axi_rlast :std_logic;
  signal s_axi_ruser :std_logic_vector(0 downto 0);    
  signal m_axis_tvalid :std_logic;
  signal m_axis_tdata :std_logic_vector(7 downto 0);    
  signal m_axis_tstrb :std_logic_vector(0 downto 0);    
  signal m_axis_tlast :std_logic;
  signal m_axis_tkeep :std_logic_vector(0 downto 0);    
  signal m_axis_tid :std_logic_vector(0 downto 0);    
  signal m_axis_tdest :std_logic_vector(0 downto 0);    
  signal m_axis_tuser :std_logic_vector(3 downto 0);    
  signal s_axis_tready :std_logic;
  signal axi_aw_data_count :std_logic_vector(4 downto 0);    
  signal axi_aw_wr_data_count :std_logic_vector(4 downto 0);    
  signal axi_aw_rd_data_count :std_logic_vector(4 downto 0);    
  signal axi_aw_sbiterr :std_logic;    
  signal axi_aw_dbiterr :std_logic;    
  signal axi_aw_overflow :std_logic;    
  signal axi_aw_underflow :std_logic;    
  signal axi_aw_prog_full :std_logic;    
  signal axi_aw_prog_empty :std_logic;    
  signal axi_w_data_count :std_logic_vector(10 downto 0);    
  signal axi_w_wr_data_count :std_logic_vector(10 downto 0);    
  signal axi_w_rd_data_count :std_logic_vector(10 downto 0);    
  signal axi_w_sbiterr :std_logic;    
  signal axi_w_dbiterr :std_logic;    
  signal axi_w_overflow :std_logic;    
  signal axi_w_underflow :std_logic;    
  signal axi_w_prog_full :std_logic;    
  signal axi_w_prog_empty :std_logic;    
  signal axi_b_data_count :std_logic_vector(4 downto 0);    
  signal axi_b_wr_data_count :std_logic_vector(4 downto 0);    
  signal axi_b_rd_data_count :std_logic_vector(4 downto 0);    
  signal axi_b_sbiterr :std_logic;    
  signal axi_b_dbiterr :std_logic;    
  signal axi_b_overflow :std_logic;    
  signal axi_b_underflow :std_logic;    
  signal axi_b_prog_full :std_logic;    
  signal axi_b_prog_empty :std_logic;    
  signal axi_ar_data_count :std_logic_vector(4 downto 0);    
  signal axi_ar_wr_data_count :std_logic_vector(4 downto 0);    
  signal axi_ar_rd_data_count :std_logic_vector(4 downto 0);    
  signal axi_ar_sbiterr :std_logic;    
  signal axi_ar_dbiterr :std_logic;    
  signal axi_ar_overflow :std_logic;    
  signal axi_ar_underflow :std_logic;    
  signal axi_ar_prog_full :std_logic;    
  signal axi_ar_prog_empty :std_logic;    
  signal axi_r_data_count :std_logic_vector(10 downto 0);    
  signal axi_r_wr_data_count :std_logic_vector(10 downto 0);    
  signal axi_r_rd_data_count :std_logic_vector(10 downto 0);    
  signal axi_r_sbiterr :std_logic;    
  signal axi_r_dbiterr :std_logic;    
  signal axi_r_overflow :std_logic;    
  signal axi_r_underflow :std_logic;    
  signal axi_r_prog_full :std_logic;    
  signal axi_r_prog_empty :std_logic;    
  signal axis_data_count :std_logic_vector(10 downto 0);    
  signal axis_wr_data_count :std_logic_vector(10 downto 0);    
  signal axis_rd_data_count :std_logic_vector(10 downto 0);    
  signal axis_sbiterr :std_logic;    
  signal axis_dbiterr :std_logic;    
  signal axis_overflow :std_logic;    
  signal axis_underflow :std_logic;    
  signal axis_prog_full :std_logic;    
  signal axis_prog_empty :std_logic;    


  
  constant C_EXTRA_SYNCS      : integer := 5;

begin

EXISTING : if (C_EXTRA_SYNCS = 0) generate

begin


  fifo_we <= din_vld and din_rdy_i;

  process(wr_clk, rst)
  begin
    if(rst = '1') then
      wr_addr <= (others => '0');
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_addr <= wr_addr + 1;
      end if;
    end if;
  end process;

  fifo_re <= rd_en and not(empty_i);

  process(rd_clk, rst)
  begin
    if(rst = '1') then
      rd_addr <= (others => '0');
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        rd_addr <= rd_addr + 1;
      end if;
    end if;
  end process;

  ---------------------------------------------------------
  process(rd_clk, rst)
  begin
    if(rst = '1') then
      next_rd_gray <= bin2gray(INIT_NEXT_RD_GRAY, ADDR_BITS);
      rd_gray      <= bin2gray(INIT_RD_GRAY, ADDR_BITS);
      prev_rd_gray <= bin2gray(INIT_PREV_RD_GRAY, ADDR_BITS);
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        prev_rd_gray <= rd_gray;
        rd_gray      <= next_rd_gray;
        next_rd_gray <= bin2gray(std_logic_vector(rd_addr));
      end if;
    end if;
  end process;

  process(wr_clk, rst)
  begin
    if(rst = '1') then
      next_wr_gray <= bin2gray(INIT_NEXT_WR_GRAY, ADDR_BITS);
      wr_gray      <= bin2gray(INIT_WR_GRAY, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_gray      <= next_wr_gray;
        next_wr_gray <= bin2gray(std_logic_vector(wr_addr));
      end if;
    end if;
  end process;

  process(wr_clk, rst)
  begin
    if(rst = '1') then
      wr_gray_ahead <= bin2gray(INIT_WR_GRAY_AHEAD, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_gray_ahead <= gray_inc(wr_gray_ahead);
      end if;
    end if;
  end process;

  -----------------------------------------------------------------
--  process(wr_clk, rst)
--  begin
--    if(rst = '1') then
--      din_rdy_i <= '0';
--    elsif(wr_clk'event and wr_clk = '1') then
--      if(din_rdy_i = '1') then
--        if (wr_gray_ahead = prev_rd_gray) then
--          din_rdy_i <= not(fifo_we);
--        else
--          din_rdy_i <= '1';
--        end if;
--      else
--        if (wr_gray_ahead = rd_gray) then
--          din_rdy_i <= '0';
--        else
--          din_rdy_i <= '1';
--        end if;
--      end if;
--    end if;
--  end process;
--   CR 741423 fix
-- If the oscalar_fifo_depth needs to be 16, din_rdy_i signal has to be validated on
-- next_wr_gray instead of wr_gray_ahead. wr_gray_ahead should be used
-- to keep the oscalar_fifo_depth equal to 15.
  process(wr_clk, rst)
  begin
    if(rst = '1') then
      din_rdy_i <= '0';
    elsif(wr_clk'event and wr_clk = '1') then
      if(din_rdy_i = '1') then
        if (next_wr_gray = prev_rd_gray) then
          din_rdy_i <= not(fifo_we);
        else
          din_rdy_i <= '1';
        end if;
      else
        if (next_wr_gray = rd_gray) then
          din_rdy_i <= '0';
        else
          din_rdy_i <= '1';
        end if;
      end if;
    end if;
  end process;


  din_rdy <= din_rdy_i;

  process(rd_clk, rst)
  begin
    if(rst = '1') then
      empty_i <= '1';
    elsif(rd_clk'event and rd_clk = '1') then
      if(empty_i = '0') then
        if(next_rd_gray = wr_gray) then
          empty_i <= fifo_re;
        else
          empty_i <= '0';
        end if;
      else
        if(rd_gray = wr_gray) then
          empty_i <= '1';
        else
          empty_i <= '0';
        end if;
      end if;
    end if;
  end process;

  rd_en <= not(dout_vld_i) or (dout_vld_i and dout_rdy);
  process(rd_clk, rst)
  begin
    if(rst = '1') then
      dout_vld_i <= '0';
    elsif(rd_clk'event and rd_clk = '1') then
      if(rd_en = '1') then
        dout_vld_i <= not(empty_i);
      end if;
    end if;
  end process;

  dout_vld <= dout_vld_i;

  dout_trf_ok <= dout_vld_i and dout_rdy;

  -----------------------------------------------------------------------
  -- Memory bank modeling. Let's allow XST do it for us:
  process(wr_clk)
  begin
    if(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        mem(to_integer(wr_addr)) <= din;
      end if;
    end if;
  end process;

  mem_dout <= mem(to_integer(rd_addr));

  process(rd_clk, rst)
  begin
    if(rst = '1') then
      dout <= (others => '0');
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        dout <= mem_dout;
      end if;
    end if;
  end process;

  -----------------------------------------------------------------------
  -- wr_gray is synchronized with rd_clk to reduce metastability.
  -- This inserts an extra rd_clk cycle latency
  process(rd_clk, rst)
  begin
    if(rst = '1') then
      wr_gray_sync <= bin2gray(INIT_WR_GRAY, ADDR_BITS);
    elsif(rd_clk'event and rd_clk = '1') then
      wr_gray_sync <= wr_gray;
    end if;
  end process;

  wr_bin <= unsigned(gray2bin(wr_gray_sync));

  process(rd_clk, rst)
  begin
    if(rst = '1') then
      rd_bin <= to_unsigned(INIT_RD_GRAY, ADDR_BITS);
    elsif(rd_clk'event and rd_clk = '1') then
      if (dout_trf_ok = '1') then
        rd_bin <= rd_bin + 1;
      end if;
    end if;
  end process;

  process(rd_clk, rst)
  begin
    if(rst = '1') then
      ptr_dist <= (others => '0');
    elsif(rd_clk'event and rd_clk = '1') then
      if (dout_trf_ok = '1') then
        ptr_dist <= ptr_dist - 1;
      else
        -- this is also valid at the end of count sequence:
        -- wr_bin < rd_bin
        ptr_dist <= wr_bin - rd_bin;
      end if;
    end if;
  end process;

  rd_used <= std_logic_vector(ptr_dist);

  ----
  process(rd_clk, rst)
  begin
    if(rst = '1') then
      rd_full_i <= '1';
    elsif(rd_clk'event and rd_clk = '1') then
      -- If there is a read, we exit inmediately the full state
      if(dout_trf_ok = '1') then
        rd_full_i <= '0';
      else
        -- Stay in full if next_wr_gray = rd_gray
        if(next_wr_gray = rd_gray) then
          rd_full_i <= '1';
        else
          rd_full_i <= '0';
        end if;
      end if;
    end if;
  end process;

  rd_full <= rd_full_i;

  rd_empty <= not(dout_vld_i);



end generate EXISTING;


NEW_INTRO : if (C_EXTRA_SYNCS = 2) generate
 begin  

   rst_vec(0) <= rst;
   wr_rst <= wr_rst_vec(0);
   rd_rst <= rd_rst_vec(0);

    wr_rst_sync: ENTITY axis_accelerator_adapter_v2_1_16.synchronizer_ff
    GENERIC MAP (
     C_HAS_RST => 0,
     C_WIDTH   => 1
     )
    PORT MAP ( 
     RST       => open,
     CLK       => wr_clk,   
     D         => rst_vec,
     Q         => wr_rst_vec
     );    

    rd_rst_sync: ENTITY axis_accelerator_adapter_v2_1_16.synchronizer_ff
    GENERIC MAP (
     C_HAS_RST => 0,
     C_WIDTH   => 1
     )
    PORT MAP ( 
     RST       => open,
     CLK       => rd_clk,   
     D         => rst_vec,
     Q         => rd_rst_vec
     );    

     fifo_we <= din_vld and din_rdy_i;

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      wr_addr <= (others => '0');
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_addr <= wr_addr + 1;
      end if;
    end if;
  end process;

  fifo_re <= rd_en and not(empty_i);

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      rd_addr <= (others => '0');
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        rd_addr <= rd_addr + 1;
      end if;
    end if;
  end process;

  ---------------------------------------------------------
  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      next_rd_gray <= bin2gray(INIT_NEXT_RD_GRAY, ADDR_BITS);
      rd_gray      <= bin2gray(INIT_RD_GRAY, ADDR_BITS);
      prev_rd_gray <= bin2gray(INIT_PREV_RD_GRAY, ADDR_BITS);
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        prev_rd_gray <= rd_gray;
        rd_gray      <= next_rd_gray;
        next_rd_gray <= bin2gray(std_logic_vector(rd_addr));
      end if;
    end if;
  end process;

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      next_wr_gray <= bin2gray(INIT_NEXT_WR_GRAY, ADDR_BITS);
      wr_gray      <= bin2gray(INIT_WR_GRAY, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_gray      <= next_wr_gray;
        next_wr_gray <= bin2gray(std_logic_vector(wr_addr));
      end if;
    end if;
  end process;

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      wr_gray_ahead <= bin2gray(INIT_WR_GRAY_AHEAD, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_gray_ahead <= gray_inc(wr_gray_ahead);
      end if;
    end if;
  end process;

  -----------------------------------------------------------------
--  process(wr_clk, rst)
--  begin
--    if(rst = '1') then
--      din_rdy_i <= '0';
--    elsif(wr_clk'event and wr_clk = '1') then
--      if(din_rdy_i = '1') then
--        if (wr_gray_ahead = prev_rd_gray) then
--          din_rdy_i <= not(fifo_we);
--        else
--          din_rdy_i <= '1';
--        end if;
--      else
--        if (wr_gray_ahead = rd_gray) then
--          din_rdy_i <= '0';
--        else
--          din_rdy_i <= '1';
--        end if;
--      end if;
--    end if;
--  end process;
--   CR 741423 fix
-- If the oscalar_fifo_depth needs to be 16, din_rdy_i signal has to be validated on
-- next_wr_gray instead of wr_gray_ahead. wr_gray_ahead should be used
-- to keep the oscalar_fifo_depth equal to 15.
  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      din_rdy_i <= '0';
    elsif(wr_clk'event and wr_clk = '1') then
      if(din_rdy_i = '1') then
        if (next_wr_gray = prev_rd_gray) then
          din_rdy_i <= not(fifo_we);
        else
          din_rdy_i <= '1';
        end if;
      else
        if (next_wr_gray = rd_gray) then
          din_rdy_i <= '0';
        else
          din_rdy_i <= '1';
        end if;
      end if;
    end if;
  end process;


  din_rdy <= din_rdy_i;

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      empty_i <= '1';
    elsif(rd_clk'event and rd_clk = '1') then
      if(empty_i = '0') then
        if(next_rd_gray = wr_gray) then
          empty_i <= fifo_re;
        else
          empty_i <= '0';
        end if;
      else
        if(rd_gray = wr_gray) then
          empty_i <= '1';
        else
          empty_i <= '0';
        end if;
      end if;
    end if;
  end process;

  rd_en <= not(dout_vld_i) or (dout_vld_i and dout_rdy);
  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      dout_vld_i <= '0';
    elsif(rd_clk'event and rd_clk = '1') then
      if(rd_en = '1') then
        dout_vld_i <= not(empty_i);
      end if;
    end if;
  end process;

  dout_vld <= dout_vld_i;

  dout_trf_ok <= dout_vld_i and dout_rdy;

  -----------------------------------------------------------------------
  -- Memory bank modeling. Let's allow XST do it for us:
  process(wr_clk)
  begin
    if(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        mem(to_integer(wr_addr)) <= din;
      end if;
    end if;
  end process;

  mem_dout <= mem(to_integer(rd_addr));

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      dout <= (others => '0');
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        dout <= mem_dout;
      end if;
    end if;
  end process;

  -----------------------------------------------------------------------
  -- wr_gray is synchronized with rd_clk to reduce metastability.
  -- This inserts an extra rd_clk cycle latency


--       clkx_1: ENTITY axis_accelerator_adapter_v2_1_16.clk_x_pntrs
--        GENERIC MAP(
--          C_HAS_RST              => 1,
--          C_RD_PNTR_WIDTH        => ADDR_BITS,     
--          C_WR_PNTR_WIDTH        => ADDR_BITS,
--          C_MSGON_VAL            => 1,
--          C_SYNCHRONIZER_STAGE   => 2
--          )
--        PORT MAP(
--          WR_CLK         => wr_clk,   
--          RD_CLK         => rd_clk,   
--          WR_RST         => wr_rst,   
--          RD_RST         => rd_rst,   
--          WR_PNTR        => wr_gray,   
--          RD_PNTR        => open,   
--          WR_PNTR_RD     => wr_gray_sync,   
--          RD_PNTR_WR     => open     
--          );

--  process(rd_clk, rd_rst)
--  begin
--    if(rd_rst = '1') then
--      wr_gray_sync <= bin2gray(INIT_WR_GRAY, ADDR_BITS);
--    elsif(rd_clk'event and rd_clk = '1') then
--      wr_gray_sync <= wr_gray;
--    end if;
--  end process;

  wr_bin <= unsigned(gray2bin(wr_gray_sync));

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      rd_bin <= to_unsigned(INIT_RD_GRAY, ADDR_BITS);
    elsif(rd_clk'event and rd_clk = '1') then
      if (dout_trf_ok = '1') then
        rd_bin <= rd_bin + 1;
      end if;
    end if;
  end process;

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      ptr_dist <= (others => '0');
    elsif(rd_clk'event and rd_clk = '1') then
      if (dout_trf_ok = '1') then
        ptr_dist <= ptr_dist - 1;
      else
        -- this is also valid at the end of count sequence:
        -- wr_bin < rd_bin
        ptr_dist <= wr_bin - rd_bin;
      end if;
    end if;
  end process;

  rd_used <= std_logic_vector(ptr_dist(3 downto 0));

  ----
  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      rd_full_i <= '1';
    elsif(rd_clk'event and rd_clk = '1') then
      -- If there is a read, we exit inmediately the full state
      if(dout_trf_ok = '1') then
        rd_full_i <= '0';
      else
        -- Stay in full if next_wr_gray = rd_gray
        if(next_wr_gray = rd_gray) then
          rd_full_i <= '1';
        else
          rd_full_i <= '0';
        end if;
      end if;
    end if;
  end process;

  rd_full <= rd_full_i;

  rd_empty <= not(dout_vld_i);


end generate NEW_INTRO;

NEW_INTRO2 : if (C_EXTRA_SYNCS = 1) generate
 begin  
   
    din_rdy  <= not(full);
    dout_vld <= not(empty);
    rd_empty <= (empty);
    rd_full <= (full);



--  FIF_DMG_INST : entity fifo_generator_v12_0.fifo_generator_v12_0
--    GENERIC MAP (
--      C_COMMON_CLOCK => 0,
--      C_COUNT_TYPE => 0,
--      C_DATA_COUNT_WIDTH => ADDR_BITS,
--      C_DEFAULT_VALUE => "BlankString",
--      C_DIN_WIDTH => WIDTH,
--      C_DOUT_RST_VAL => "0",
--      C_DOUT_WIDTH => WIDTH,
--      C_ENABLE_RLOCS => 0,
--      C_FAMILY => C_FAMILY,
--      C_FULL_FLAGS_RST_VAL => 0,
--      C_HAS_ALMOST_EMPTY => 0,
--      C_HAS_ALMOST_FULL => 0,
--      C_HAS_BACKUP => 0,
--      C_HAS_DATA_COUNT => 0,
--      C_HAS_INT_CLK => 0,
--      C_HAS_MEMINIT_FILE => 0,
--      C_HAS_OVERFLOW => 0,
--      C_HAS_RD_DATA_COUNT => 1,
--      C_HAS_RD_RST => 0,
--      C_HAS_RST => 1,
--      C_HAS_SRST => 0,
--      C_HAS_UNDERFLOW => 0,
--      C_HAS_VALID => 0,
--      C_HAS_WR_ACK => 0,
--      C_HAS_WR_DATA_COUNT => 0,
--      C_HAS_WR_RST => 0,
--      C_IMPLEMENTATION_TYPE => 2,
--      C_INIT_WR_PNTR_VAL => 0,
--      C_MEMORY_TYPE => 2,
--      C_MIF_FILE_NAME => "BlankString",
--      C_OPTIMIZATION_MODE => 0,
--      C_OVERFLOW_LOW => 0,
--      C_PRELOAD_LATENCY => 0,
--      C_PRELOAD_REGS => 1,
--      C_PRIM_FIFO_TYPE => "512x36",
--      C_PROG_EMPTY_THRESH_ASSERT_VAL => 2,
--      C_PROG_EMPTY_THRESH_NEGATE_VAL => 3,
--      C_PROG_EMPTY_TYPE => 0,
--      C_PROG_FULL_THRESH_ASSERT_VAL => 29,
--      C_PROG_FULL_THRESH_NEGATE_VAL => 28,
--      C_PROG_FULL_TYPE => 0,
--      C_RD_DATA_COUNT_WIDTH => 4,
--      C_RD_DEPTH => FIFO_DEPTH,
--      C_RD_FREQ => 1,
--      C_RD_PNTR_WIDTH => ADDR_BITS,
--      C_UNDERFLOW_LOW => 0,
--      C_USE_DOUT_RST => 1,
--      C_USE_ECC => 0,
--      C_USE_EMBEDDED_REG => 0,
--      C_USE_PIPELINE_REG => 0,
--      C_POWER_SAVING_MODE => 0,
--      C_USE_FIFO16_FLAGS => 0,
--      C_USE_FWFT_DATA_COUNT => 0,
--      C_VALID_LOW => 0,
--      C_WR_ACK_LOW => 0,
--      C_WR_DATA_COUNT_WIDTH => ADDR_BITS,
--      C_WR_DEPTH => FIFO_DEPTH,
--      C_WR_FREQ => 1,
--      C_WR_PNTR_WIDTH => ADDR_BITS,
--      C_WR_RESPONSE_LATENCY => 1,
--      C_MSGON_VAL => 1,
--      C_ENABLE_RST_SYNC => 1,
--      C_ERROR_INJECTION_TYPE => 0,
--      C_SYNCHRONIZER_STAGE => 2,
--      C_INTERFACE_TYPE => 0,
--      C_AXI_TYPE => 1,
--      C_HAS_AXI_WR_CHANNEL => 1,
--      C_HAS_AXI_RD_CHANNEL => 1,
--      C_HAS_SLAVE_CE => 0,
--      C_HAS_MASTER_CE => 0,
--      C_ADD_NGC_CONSTRAINT => 0,
--      C_USE_COMMON_OVERFLOW => 0,
--      C_USE_COMMON_UNDERFLOW => 0,
--      C_USE_DEFAULT_SETTINGS => 0,
--      C_AXI_ID_WIDTH => 1,
--      C_AXI_ADDR_WIDTH => 32,
--      C_AXI_DATA_WIDTH => 64,
--      C_AXI_LEN_WIDTH => 8,
--      C_AXI_LOCK_WIDTH => 1,
--      C_HAS_AXI_ID => 0,
--      C_HAS_AXI_AWUSER => 0,
--      C_HAS_AXI_WUSER => 0,
--      C_HAS_AXI_BUSER => 0,
--      C_HAS_AXI_ARUSER => 0,
--      C_HAS_AXI_RUSER => 0,
--      C_AXI_ARUSER_WIDTH => 1,
--      C_AXI_AWUSER_WIDTH => 1,
--      C_AXI_WUSER_WIDTH => 1,
--      C_AXI_BUSER_WIDTH => 1,
--      C_AXI_RUSER_WIDTH => 1,
--      C_HAS_AXIS_TDATA => 1,
--      C_HAS_AXIS_TID => 0,
--      C_HAS_AXIS_TDEST => 0,
--      C_HAS_AXIS_TUSER => 1,
--      C_HAS_AXIS_TREADY => 1,
--      C_HAS_AXIS_TLAST => 0,
--      C_HAS_AXIS_TSTRB => 0,
--      C_HAS_AXIS_TKEEP => 0,
--      C_AXIS_TDATA_WIDTH => WIDTH,
--      C_AXIS_TID_WIDTH => 1,
--      C_AXIS_TDEST_WIDTH => 1,
--      C_AXIS_TUSER_WIDTH => 4,
--      C_AXIS_TSTRB_WIDTH => 1,
--      C_AXIS_TKEEP_WIDTH => 1,
--      C_WACH_TYPE => 0,
--      C_WDCH_TYPE => 0,
--      C_WRCH_TYPE => 0,
--      C_RACH_TYPE => 0,
--      C_RDCH_TYPE => 0,
--      C_AXIS_TYPE => 0,
--      C_IMPLEMENTATION_TYPE_WACH => 1,
--      C_IMPLEMENTATION_TYPE_WDCH => 1,
--      C_IMPLEMENTATION_TYPE_WRCH => 1,
--      C_IMPLEMENTATION_TYPE_RACH => 1,
--      C_IMPLEMENTATION_TYPE_RDCH => 1,
--      C_IMPLEMENTATION_TYPE_AXIS => 1,
--      C_APPLICATION_TYPE_WACH => 0,
--      C_APPLICATION_TYPE_WDCH => 0,
--      C_APPLICATION_TYPE_WRCH => 0,
--      C_APPLICATION_TYPE_RACH => 0,
--      C_APPLICATION_TYPE_RDCH => 0,
--      C_APPLICATION_TYPE_AXIS => 0,
--      C_PRIM_FIFO_TYPE_WACH => "512x36",
--      C_PRIM_FIFO_TYPE_WDCH => "1kx36",
--      C_PRIM_FIFO_TYPE_WRCH => "512x36",
--      C_PRIM_FIFO_TYPE_RACH => "512x36",
--      C_PRIM_FIFO_TYPE_RDCH => "1kx36",
--      C_PRIM_FIFO_TYPE_AXIS => "1kx18",
--      C_USE_ECC_WACH => 0,
--      C_USE_ECC_WDCH => 0,
--      C_USE_ECC_WRCH => 0,
--      C_USE_ECC_RACH => 0,
--      C_USE_ECC_RDCH => 0,
--      C_USE_ECC_AXIS => 0,
--      C_ERROR_INJECTION_TYPE_WACH => 0,
--      C_ERROR_INJECTION_TYPE_WDCH => 0,
--      C_ERROR_INJECTION_TYPE_WRCH => 0,
--      C_ERROR_INJECTION_TYPE_RACH => 0,
--      C_ERROR_INJECTION_TYPE_RDCH => 0,
--      C_ERROR_INJECTION_TYPE_AXIS => 0,
--      C_DIN_WIDTH_WACH => 32,
--      C_DIN_WIDTH_WDCH => 64,
--      C_DIN_WIDTH_WRCH => 2,
--      C_DIN_WIDTH_RACH => 32,
--      C_DIN_WIDTH_RDCH => 64,
--      C_DIN_WIDTH_AXIS => 1,
--      C_WR_DEPTH_WACH => 16,
--      C_WR_DEPTH_WDCH => 1024,
--      C_WR_DEPTH_WRCH => 16,
--      C_WR_DEPTH_RACH => 16,
--      C_WR_DEPTH_RDCH => 1024,
--      C_WR_DEPTH_AXIS => 1024,
--      C_WR_PNTR_WIDTH_WACH => 4,
--      C_WR_PNTR_WIDTH_WDCH => 10,
--      C_WR_PNTR_WIDTH_WRCH => 4,
--      C_WR_PNTR_WIDTH_RACH => 4,
--      C_WR_PNTR_WIDTH_RDCH => 10,
--      C_WR_PNTR_WIDTH_AXIS => 10,
--      C_HAS_DATA_COUNTS_WACH => 0,
--      C_HAS_DATA_COUNTS_WDCH => 0,
--      C_HAS_DATA_COUNTS_WRCH => 0,
--      C_HAS_DATA_COUNTS_RACH => 0,
--      C_HAS_DATA_COUNTS_RDCH => 0,
--      C_HAS_DATA_COUNTS_AXIS => 0,
--      C_HAS_PROG_FLAGS_WACH => 0,
--      C_HAS_PROG_FLAGS_WDCH => 0,
--      C_HAS_PROG_FLAGS_WRCH => 0,
--      C_HAS_PROG_FLAGS_RACH => 0,
--      C_HAS_PROG_FLAGS_RDCH => 0,
--      C_HAS_PROG_FLAGS_AXIS => 0,
--      C_PROG_FULL_TYPE_WACH => 0,
--      C_PROG_FULL_TYPE_WDCH => 0,
--      C_PROG_FULL_TYPE_WRCH => 0,
--      C_PROG_FULL_TYPE_RACH => 0,
--      C_PROG_FULL_TYPE_RDCH => 0,
--      C_PROG_FULL_TYPE_AXIS => 0,
--      C_PROG_FULL_THRESH_ASSERT_VAL_WACH => 1023,
--      C_PROG_FULL_THRESH_ASSERT_VAL_WDCH => 1023,
--      C_PROG_FULL_THRESH_ASSERT_VAL_WRCH => 1023,
--      C_PROG_FULL_THRESH_ASSERT_VAL_RACH => 1023,
--      C_PROG_FULL_THRESH_ASSERT_VAL_RDCH => 1023,
--      C_PROG_FULL_THRESH_ASSERT_VAL_AXIS => 1023,
--      C_PROG_EMPTY_TYPE_WACH => 0,
--      C_PROG_EMPTY_TYPE_WDCH => 0,
--      C_PROG_EMPTY_TYPE_WRCH => 0,
--      C_PROG_EMPTY_TYPE_RACH => 0,
--      C_PROG_EMPTY_TYPE_RDCH => 0,
--      C_PROG_EMPTY_TYPE_AXIS => 0,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH => 1022,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH => 1022,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH => 1022,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH => 1022,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH => 1022,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS => 1022,
--      C_REG_SLICE_MODE_WACH => 0,
--      C_REG_SLICE_MODE_WDCH => 0,
--      C_REG_SLICE_MODE_WRCH => 0,
--      C_REG_SLICE_MODE_RACH => 0,
--      C_REG_SLICE_MODE_RDCH => 0,
--      C_REG_SLICE_MODE_AXIS => 0
--    )
--    PORT MAP (
--      backup => '0',
--      backup_marker => '0',
--      clk => '0',
--      rst => rst,
--      srst => '0',
--      wr_clk => wr_clk,
--      rd_clk => rd_clk,
--      din => din,
--      wr_en => din_vld,
--      rd_en => dout_rdy,
--      prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      prog_empty_thresh_assert => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      prog_empty_thresh_negate => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      prog_full_thresh_assert => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      prog_full_thresh_negate => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      int_clk => '0',
--      injectdbiterr => '0',
--      injectsbiterr => '0',
--      sleep => '0',
--      dout => dout,
--      full => full,
--      empty => empty,
--      rd_data_count => rd_used,
--      m_aclk => '0',
--      s_aclk => '0',
--      s_aresetn => '0',
--      m_aclk_en => '0',
--      s_aclk_en => '0',
--      s_axi_awid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_awaddr => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
--      s_axi_awlen => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
--      s_axi_awsize => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
--      s_axi_awburst => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
--      s_axi_awlock => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_awcache => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_awprot => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
--      s_axi_awqos => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_awregion => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_awuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_awvalid => '0',
--      s_axi_wid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_wdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
--      s_axi_wstrb => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
--      s_axi_wlast => '0',
--      s_axi_wuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_wvalid => '0',
--      s_axi_bready => '0',
--      m_axi_awready => '0',
--      m_axi_wready => '0',
--      m_axi_bid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axi_bresp => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
--      m_axi_buser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axi_bvalid => '0',
--      s_axi_arid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_araddr => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
--      s_axi_arlen => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
--      s_axi_arsize => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
--      s_axi_arburst => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
--      s_axi_arlock => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_arcache => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_arprot => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
--      s_axi_arqos => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_arregion => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_aruser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_arvalid => '0',
--      s_axi_rready => '0',
--      m_axi_arready => '0',
--      m_axi_rid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axi_rdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
--      m_axi_rresp => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
--      m_axi_rlast => '0',
--      m_axi_ruser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axi_rvalid => '0',
--      s_axis_tvalid => '0',
--      s_axis_tdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
--      s_axis_tstrb => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axis_tkeep => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axis_tlast => '0',
--      s_axis_tid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axis_tdest => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axis_tuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      m_axis_tready => '0',
--      axi_aw_injectsbiterr => '0',
--      axi_aw_injectdbiterr => '0',
--      axi_aw_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      axi_aw_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      axi_w_injectsbiterr => '0',
--      axi_w_injectdbiterr => '0',
--      axi_w_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
--      axi_w_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
--      axi_b_injectsbiterr => '0',
--      axi_b_injectdbiterr => '0',
--      axi_b_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      axi_b_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      axi_ar_injectsbiterr => '0',
--      axi_ar_injectdbiterr => '0',
--      axi_ar_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      axi_ar_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      axi_r_injectsbiterr => '0',
--      axi_r_injectdbiterr => '0',
--      axi_r_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
--      axi_r_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
--      axis_injectsbiterr => '0',
--      axis_injectdbiterr => '0',
--      axis_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
--      axis_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10))
--    );


end generate NEW_INTRO2;

NEW_INTRO3 : if (C_EXTRA_SYNCS = 5) generate
 begin  
   
    rstn  <= not(rst);
    din_rdy  <= not(full);
    din_rdy_i  <= not(full);
    dout_vld <= not(empty);
    rd_empty <= (empty);
    rd_full <= (full);
 --   din_rdy  <= din_rdy_i;
 --   dout_vld <= dout_vld_i;
 --   rd_empty <= not(dout_vld_i);
 --   rd_full <= not(din_rdy_i);
    rd_used <= rd_used_i(3 downto 0);



  FIF_DMG_INST : entity fifo_generator_v13_1_4.fifo_generator_v13_1_4
    GENERIC MAP (
      C_COMMON_CLOCK => 0,
      C_COUNT_TYPE => 0,
      C_DATA_COUNT_WIDTH => ADDR_BITS,
      C_DEFAULT_VALUE => "BlankString",
      C_DIN_WIDTH => WIDTH,
      C_DOUT_RST_VAL => "0",
      C_DOUT_WIDTH => WIDTH,
      C_ENABLE_RLOCS => 0,
      C_FAMILY => C_FAMILY,
      C_FULL_FLAGS_RST_VAL => 0,
      C_HAS_ALMOST_EMPTY => 0,
      C_HAS_ALMOST_FULL => 0,
      C_HAS_BACKUP => 0,
      C_HAS_DATA_COUNT => 0,
      C_HAS_INT_CLK => 0,
      C_HAS_MEMINIT_FILE => 0,
      C_HAS_OVERFLOW => 0,
      C_HAS_RD_DATA_COUNT => 1,
      C_HAS_RD_RST => 0,
      C_HAS_RST => 1,
      C_HAS_SRST => 0,
      C_HAS_UNDERFLOW => 0,
      C_HAS_VALID => 0,
      C_HAS_WR_ACK => 0,
      C_HAS_WR_DATA_COUNT => 1,
      C_HAS_WR_RST => 0,
      C_IMPLEMENTATION_TYPE => 2,
      C_INIT_WR_PNTR_VAL => 0,
      C_MEMORY_TYPE => 2,
      C_MIF_FILE_NAME => "BlankString",
      C_OPTIMIZATION_MODE => 0,
      C_OVERFLOW_LOW => 0,
      C_PRELOAD_LATENCY => 0,
      C_PRELOAD_REGS => 1,
      C_PRIM_FIFO_TYPE => "512x36",
      C_PROG_EMPTY_THRESH_ASSERT_VAL => 2,
      C_PROG_EMPTY_THRESH_NEGATE_VAL => 3,
      C_PROG_EMPTY_TYPE => 0,
      C_PROG_FULL_THRESH_ASSERT_VAL => 29,
      C_PROG_FULL_THRESH_NEGATE_VAL => 28,
      C_PROG_FULL_TYPE => 0,
      C_RD_DATA_COUNT_WIDTH => 4,
      C_RD_DEPTH => FIFO_DEPTH,
      C_RD_FREQ => 1,
      C_RD_PNTR_WIDTH => ADDR_BITS,
      C_UNDERFLOW_LOW => 0,
      C_USE_DOUT_RST => 1,
      C_USE_ECC => 0,
      C_USE_EMBEDDED_REG => 0,
      C_USE_PIPELINE_REG => 0,
      C_POWER_SAVING_MODE => 0,
      C_USE_FIFO16_FLAGS => 0,
      C_USE_FWFT_DATA_COUNT => 1,
      C_VALID_LOW => 0,
      C_WR_ACK_LOW => 0,
      C_WR_DATA_COUNT_WIDTH => ADDR_BITS,
      C_WR_DEPTH => FIFO_DEPTH,
      C_WR_FREQ => 1,
      C_WR_PNTR_WIDTH => ADDR_BITS,
      C_WR_RESPONSE_LATENCY => 1,
      C_MSGON_VAL => 1,
      C_ENABLE_RST_SYNC => 1,
      C_ERROR_INJECTION_TYPE => 0,
      C_SYNCHRONIZER_STAGE => 2,
      C_INTERFACE_TYPE => 0,
      C_AXI_TYPE => 1,
      C_HAS_AXI_WR_CHANNEL => 1,
      C_HAS_AXI_RD_CHANNEL => 1,
      C_HAS_SLAVE_CE => 0,
      C_HAS_MASTER_CE => 0,
      C_ADD_NGC_CONSTRAINT => 0,
      C_USE_COMMON_OVERFLOW => 0,
      C_USE_COMMON_UNDERFLOW => 0,
      C_USE_DEFAULT_SETTINGS => 0,
      C_AXI_ID_WIDTH => 1,
      C_AXI_ADDR_WIDTH => 32,
      C_AXI_DATA_WIDTH => 64,
      C_AXI_LEN_WIDTH => 8,
      C_AXI_LOCK_WIDTH => 1,
      C_HAS_AXI_ID => 0,
      C_HAS_AXI_AWUSER => 0,
      C_HAS_AXI_WUSER => 0,
      C_HAS_AXI_BUSER => 0,
      C_HAS_AXI_ARUSER => 0,
      C_HAS_AXI_RUSER => 0,
      C_AXI_ARUSER_WIDTH => 1,
      C_AXI_AWUSER_WIDTH => 1,
      C_AXI_WUSER_WIDTH => 1,
      C_AXI_BUSER_WIDTH => 1,
      C_AXI_RUSER_WIDTH => 1,
      C_HAS_AXIS_TDATA => 1,
      C_HAS_AXIS_TID => 0,
      C_HAS_AXIS_TDEST => 0,
      C_HAS_AXIS_TUSER => 1,
      C_HAS_AXIS_TREADY => 1,
      C_HAS_AXIS_TLAST => 0,
      C_HAS_AXIS_TSTRB => 0,
      C_HAS_AXIS_TKEEP => 0,
      C_AXIS_TDATA_WIDTH => 8,
      C_AXIS_TID_WIDTH => 1,
      C_AXIS_TDEST_WIDTH => 1,
      C_AXIS_TUSER_WIDTH => 4,
      C_AXIS_TSTRB_WIDTH => 1,
      C_AXIS_TKEEP_WIDTH => 1,
      C_WACH_TYPE => 0,
      C_WDCH_TYPE => 0,
      C_WRCH_TYPE => 0,
      C_RACH_TYPE => 0,
      C_RDCH_TYPE => 0,
      C_AXIS_TYPE => 0,
      C_IMPLEMENTATION_TYPE_WACH => 1,
      C_IMPLEMENTATION_TYPE_WDCH => 1,
      C_IMPLEMENTATION_TYPE_WRCH => 1,
      C_IMPLEMENTATION_TYPE_RACH => 1,
      C_IMPLEMENTATION_TYPE_RDCH => 1,
      C_IMPLEMENTATION_TYPE_AXIS => 1,
      C_APPLICATION_TYPE_WACH => 0,
      C_APPLICATION_TYPE_WDCH => 0,
      C_APPLICATION_TYPE_WRCH => 0,
      C_APPLICATION_TYPE_RACH => 0,
      C_APPLICATION_TYPE_RDCH => 0,
      C_APPLICATION_TYPE_AXIS => 0,
      C_PRIM_FIFO_TYPE_WACH => "512x36",
      C_PRIM_FIFO_TYPE_WDCH => "1kx36",
      C_PRIM_FIFO_TYPE_WRCH => "512x36",
      C_PRIM_FIFO_TYPE_RACH => "512x36",
      C_PRIM_FIFO_TYPE_RDCH => "1kx36",
      C_PRIM_FIFO_TYPE_AXIS => "1kx18",
      C_USE_ECC_WACH => 0,
      C_USE_ECC_WDCH => 0,
      C_USE_ECC_WRCH => 0,
      C_USE_ECC_RACH => 0,
      C_USE_ECC_RDCH => 0,
      C_USE_ECC_AXIS => 0,
      C_ERROR_INJECTION_TYPE_WACH => 0,
      C_ERROR_INJECTION_TYPE_WDCH => 0,
      C_ERROR_INJECTION_TYPE_WRCH => 0,
      C_ERROR_INJECTION_TYPE_RACH => 0,
      C_ERROR_INJECTION_TYPE_RDCH => 0,
      C_ERROR_INJECTION_TYPE_AXIS => 0,
      C_DIN_WIDTH_WACH => 32,
      C_DIN_WIDTH_WDCH => 64,
      C_DIN_WIDTH_WRCH => 2,
      C_DIN_WIDTH_RACH => 32,
      C_DIN_WIDTH_RDCH => 64,
      C_DIN_WIDTH_AXIS => 1,
      C_WR_DEPTH_WACH => 16,
      C_WR_DEPTH_WDCH => 1024,
      C_WR_DEPTH_WRCH => 16,
      C_WR_DEPTH_RACH => 16,
      C_WR_DEPTH_RDCH => 1024,
      C_WR_DEPTH_AXIS => 1024,
      C_WR_PNTR_WIDTH_WACH => 4,
      C_WR_PNTR_WIDTH_WDCH => 10,
      C_WR_PNTR_WIDTH_WRCH => 4,
      C_WR_PNTR_WIDTH_RACH => 4,
      C_WR_PNTR_WIDTH_RDCH => 10,
      C_WR_PNTR_WIDTH_AXIS => 10,
      C_HAS_DATA_COUNTS_WACH => 0,
      C_HAS_DATA_COUNTS_WDCH => 0,
      C_HAS_DATA_COUNTS_WRCH => 0,
      C_HAS_DATA_COUNTS_RACH => 0,
      C_HAS_DATA_COUNTS_RDCH => 0,
      C_HAS_DATA_COUNTS_AXIS => 3,
      C_HAS_PROG_FLAGS_WACH => 0,
      C_HAS_PROG_FLAGS_WDCH => 0,
      C_HAS_PROG_FLAGS_WRCH => 0,
      C_HAS_PROG_FLAGS_RACH => 0,
      C_HAS_PROG_FLAGS_RDCH => 0,
      C_HAS_PROG_FLAGS_AXIS => 0,
      C_PROG_FULL_TYPE_WACH => 0,
      C_PROG_FULL_TYPE_WDCH => 0,
      C_PROG_FULL_TYPE_WRCH => 0,
      C_PROG_FULL_TYPE_RACH => 0,
      C_PROG_FULL_TYPE_RDCH => 0,
      C_PROG_FULL_TYPE_AXIS => 0,
      C_PROG_FULL_THRESH_ASSERT_VAL_WACH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_WDCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_WRCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_RACH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_RDCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_AXIS => 1023,
      C_PROG_EMPTY_TYPE_WACH => 0,
      C_PROG_EMPTY_TYPE_WDCH => 0,
      C_PROG_EMPTY_TYPE_WRCH => 0,
      C_PROG_EMPTY_TYPE_RACH => 0,
      C_PROG_EMPTY_TYPE_RDCH => 0,
      C_PROG_EMPTY_TYPE_AXIS => 0,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS => 1022,
      C_REG_SLICE_MODE_WACH => 0,
      C_REG_SLICE_MODE_WDCH => 0,
      C_REG_SLICE_MODE_WRCH => 0,
      C_REG_SLICE_MODE_RACH => 0,
      C_REG_SLICE_MODE_RDCH => 0,
      C_REG_SLICE_MODE_AXIS => 0
    )
    PORT MAP (
      backup                              => '0',
      backup_marker                       => '0',
      clk                                 => '0',
      rst                                 => rst,
      srst                                => '0',
      wr_clk                              => wr_clk,
      wr_rst                              => '0',
      rd_clk                              => rd_clk,
      rd_rst                              => '0',
      din                                 => din,
      wr_en                               => din_vld,
      rd_en                               => dout_rdy,
      prog_empty_thresh                   => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_empty_thresh_assert            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_empty_thresh_negate            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_full_thresh                    => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_full_thresh_assert             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_full_thresh_negate             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      int_clk                             => '0',
      injectdbiterr                       => '0',
      injectsbiterr                       => '0',
      sleep                               => '0',
      dout                                => dout,
      full                                => full,
      almost_full                         => almost_full,
      wr_ack                              => wr_ack,
      overflow                            => overflow,
      empty                               => empty,
      almost_empty                        => almost_empty,
      valid                               => valid,
      underflow                           => underflow,
      data_count                          => data_count,
      rd_data_count                       => rd_data_count,
      wr_data_count                       => rd_used_i,
      prog_full                           => prog_full,
      prog_empty                          => prog_empty,
      sbiterr                             => sbiterr,
      dbiterr                             => dbiterr,
      wr_rst_busy                         => wr_rst_busy,
      rd_rst_busy                         => rd_rst_busy,

      m_aclk                              => '0',
      s_aclk                              => '0',
      s_aresetn                           => '0',
      m_aclk_en                           => '0',
      s_aclk_en                           => '0',
      m_axi_awid                          => m_axi_awid,
      m_axi_awaddr                        => m_axi_awaddr,
      m_axi_awlen                         => m_axi_awlen,
      m_axi_awsize                        => m_axi_awsize,
      m_axi_awburst                       => m_axi_awburst,
      m_axi_awlock                        => m_axi_awlock,
      m_axi_awcache                       => m_axi_awcache,
      m_axi_awprot                        => m_axi_awprot,
      m_axi_awqos                         => m_axi_awqos,
      m_axi_awregion                      => m_axi_awregion,
      m_axi_awuser                        => m_axi_awuser,
      m_axi_awvalid                       => m_axi_awvalid,
      m_axi_awready                       => '0',
      m_axi_wid                           => m_axi_wid,
      m_axi_wdata                         => m_axi_wdata,
      m_axi_wstrb                         => m_axi_wstrb,
      m_axi_wlast                         => m_axi_wlast,
      m_axi_wuser                         => m_axi_wuser,
      m_axi_wvalid                        => m_axi_wvalid,
      m_axi_wready                        => '0',
      m_axi_bid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_bresp                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      m_axi_buser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_bvalid                        => '0',
      m_axi_bready                        => m_axi_bready,
      s_axi_awid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awaddr                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axi_awlen                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_awsize                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_awburst                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      s_axi_awlock                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awcache                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awprot                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_awqos                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awregion                      => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awuser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awvalid                       => '0',
      s_axi_awready                       => s_axi_awready,
      s_axi_wid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_wdata                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
      s_axi_wstrb                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_wlast                         => '0',
      s_axi_wuser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_wvalid                        => '0',
      s_axi_wready                        => s_axi_wready,
        
      s_axi_bid                           => s_axi_bid,
      s_axi_bresp                         => s_axi_bresp,
      s_axi_buser                         => s_axi_buser,
      s_axi_bready                        => '0',
      m_axi_arid                          => m_axi_arid,
      m_axi_araddr                        => m_axi_araddr,
      m_axi_arlen                         => m_axi_arlen,
      m_axi_arsize                        => m_axi_arsize,
      m_axi_arburst                       => m_axi_arburst,
      m_axi_arlock                        => m_axi_arlock,
      m_axi_arcache                       => m_axi_arcache,
      m_axi_arprot                        => m_axi_arprot,
      m_axi_arqos                         => m_axi_arqos,
      m_axi_arregion                      => m_axi_arregion,
      m_axi_aruser                        => m_axi_aruser,
      m_axi_arvalid                       => m_axi_arvalid,
      m_axi_arready                       => '0',
        
      m_axi_rid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_rdata                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
      m_axi_rresp                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      m_axi_rlast                         => '0',
      m_axi_ruser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_rvalid                        => '0',
      m_axi_rready                        => m_axi_rready,

      s_axi_arid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_araddr                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axi_arlen                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_arsize                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_arburst                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      s_axi_arlock                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_arcache                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_arprot                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_arqos                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_arregion                      => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_aruser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_arvalid                       => '0',
      s_axi_arready                       => s_axi_arready,
      s_axi_rid                           => s_axi_rid,
      s_axi_rdata                         => s_axi_rdata,
      s_axi_rresp                         => s_axi_rresp,
      s_axi_rlast                         => s_axi_rlast,
      s_axi_ruser                         => s_axi_ruser,
      s_axi_rready                        => '0',
      m_axis_tvalid                       => m_axis_tvalid,
      m_axis_tready                       => '0',
      m_axis_tdata                        => m_axis_tdata ,
      m_axis_tstrb                        => m_axis_tstrb ,
      m_axis_tkeep                        => m_axis_tkeep ,
      m_axis_tlast                        => m_axis_tlast ,
      m_axis_tid                          => m_axis_tid   ,
      m_axis_tdest                        => m_axis_tdest ,
      m_axis_tuser                        => m_axis_tuser ,
      s_axis_tvalid                       => '0',
      s_axis_tready                       => s_axis_tready,
      s_axis_tdata                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axis_tstrb                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tkeep                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tlast                        => '0',
      s_axis_tid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tdest                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tuser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_injectsbiterr                => '0',
      axi_aw_injectdbiterr                => '0',
      axi_aw_prog_full_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_prog_empty_thresh            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_data_count                   => axi_aw_data_count,
      axi_aw_wr_data_count                => axi_aw_wr_data_count,
      axi_aw_rd_data_count                => axi_aw_rd_data_count,
      axi_aw_sbiterr                      => axi_aw_sbiterr,
      axi_aw_dbiterr                      => axi_aw_dbiterr,
      axi_aw_overflow                     => axi_aw_overflow,
      axi_aw_underflow                    => axi_aw_underflow,
      axi_aw_prog_full                    => axi_aw_prog_full,
      axi_aw_prog_empty                   => axi_aw_prog_empty,
      axi_w_injectsbiterr                 => '0',
      axi_w_injectdbiterr                 => '0',
      axi_w_prog_full_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_w_prog_empty_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_w_data_count                    => axi_w_data_count,
      axi_w_wr_data_count                 => axi_w_wr_data_count,
      axi_w_rd_data_count                 => axi_w_rd_data_count,
      axi_w_sbiterr                       => axi_w_sbiterr,
      axi_w_dbiterr                       => axi_w_dbiterr,
      axi_w_overflow                      => axi_w_overflow,
      axi_w_underflow                     => axi_w_underflow,
      axi_w_prog_full                     => axi_w_prog_full,
      axi_w_prog_empty                    => axi_w_prog_empty,

      axi_b_injectsbiterr                 => '0',
      axi_b_injectdbiterr                 => '0',
      axi_b_prog_full_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_b_prog_empty_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_b_data_count                    => axi_b_data_count,
      axi_b_wr_data_count                 => axi_b_wr_data_count,
      axi_b_rd_data_count                 => axi_b_rd_data_count,
      axi_b_sbiterr                       => axi_b_sbiterr,
      axi_b_dbiterr                       => axi_b_dbiterr,
      axi_b_overflow                      => axi_b_overflow,
      axi_b_underflow                     => axi_b_underflow,
      axi_b_prog_full                     => axi_b_prog_full,
      axi_b_prog_empty                    => axi_b_prog_empty,
      axi_ar_injectsbiterr                => '0',
      axi_ar_injectdbiterr                => '0',
      axi_ar_prog_full_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_ar_prog_empty_thresh            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_ar_data_count                    => axi_ar_data_count,
      axi_ar_wr_data_count                 => axi_ar_wr_data_count,
      axi_ar_rd_data_count                 => axi_ar_rd_data_count,
      axi_ar_sbiterr                       => axi_ar_sbiterr,
      axi_ar_dbiterr                       => axi_ar_dbiterr,
      axi_ar_overflow                      => axi_ar_overflow,
      axi_ar_underflow                     => axi_ar_underflow,
      axi_ar_prog_full                     => axi_ar_prog_full,
      axi_ar_prog_empty                    => axi_ar_prog_empty,
      axi_r_injectsbiterr                  => '0',
      axi_r_injectdbiterr                  => '0',
      axi_r_prog_full_thresh               => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_r_prog_empty_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_r_data_count                     => axi_r_data_count,
      axi_r_wr_data_count                  => axi_r_wr_data_count,
      axi_r_rd_data_count                  => axi_r_rd_data_count,
      axi_r_sbiterr                        => axi_r_sbiterr,
      axi_r_dbiterr                        => axi_r_dbiterr,
      axi_r_overflow                       => axi_r_overflow,
      axi_r_underflow                      => axi_r_underflow,
      axi_r_prog_full                      => axi_r_prog_full,
      axi_r_prog_empty                     => axi_r_prog_empty,
      axis_injectsbiterr                   => '0',
      axis_injectdbiterr                   => '0',
      axis_prog_full_thresh                => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axis_prog_empty_thresh               => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axis_data_count                      => axis_data_count,
      axis_wr_data_count                   => axis_wr_data_count,
      axis_rd_data_count                   => axis_rd_data_count,
      axis_sbiterr                         => axis_sbiterr,
      axis_dbiterr                         => axis_dbiterr,
      axis_overflow                        => axis_overflow,
      axis_underflow                       => axis_underflow,
      axis_prog_full                       => axis_prog_full,
      axis_prog_empty                      => axis_prog_empty
    );

--         COMP_FIFO : entity fifo_generator_v12_0.fifo_generator_v12_0
-- generic map (
--      C_COMMON_CLOCK => 0,
--      C_COUNT_TYPE => 0,
--      C_DATA_COUNT_WIDTH => 10,
--      C_DEFAULT_VALUE => "BlankString",
--      C_DIN_WIDTH => 18,
--      C_DOUT_RST_VAL => "0",
--      C_DOUT_WIDTH => 18,
--      C_ENABLE_RLOCS => 0,
--      C_FAMILY => C_FAMILY,
--      C_FULL_FLAGS_RST_VAL => 1,
--      C_HAS_ALMOST_EMPTY => 0,
--      C_HAS_ALMOST_FULL => 0,
--      C_HAS_BACKUP => 0,
--      C_HAS_DATA_COUNT => 0,
--      C_HAS_INT_CLK => 0,
--      C_HAS_MEMINIT_FILE => 0,
--      C_HAS_OVERFLOW => 0,
--      C_HAS_RD_DATA_COUNT => 0,
--      C_HAS_RD_RST => 0,
--      C_HAS_RST => 1,
--      C_HAS_SRST => 0,
--      C_HAS_UNDERFLOW => 0,
--      C_HAS_VALID => 0,
--      C_HAS_WR_ACK => 0,
--      C_HAS_WR_DATA_COUNT => 0,
--      C_HAS_WR_RST => 0,
--      C_IMPLEMENTATION_TYPE => 0,
--      C_INIT_WR_PNTR_VAL => 0,
--      C_MEMORY_TYPE => 1,
--      C_MIF_FILE_NAME => "BlankString",
--      C_OPTIMIZATION_MODE => 0,
--      C_OVERFLOW_LOW => 0,
--      C_PRELOAD_LATENCY => 1,
--      C_PRELOAD_REGS => 0,
--      C_PRIM_FIFO_TYPE => "4kx4",
--      C_PROG_EMPTY_THRESH_ASSERT_VAL => 2,
--      C_PROG_EMPTY_THRESH_NEGATE_VAL => 3,
--      C_PROG_EMPTY_TYPE => 0,
--      C_PROG_FULL_THRESH_ASSERT_VAL => 1022,
--      C_PROG_FULL_THRESH_NEGATE_VAL => 1021,
--      C_PROG_FULL_TYPE => 0,
--      C_RD_DATA_COUNT_WIDTH => 10,
--      C_RD_DEPTH => 16,
--      C_RD_FREQ => 1,
--      C_RD_PNTR_WIDTH => ADDR_BITS,
--      C_UNDERFLOW_LOW => 0,
--      C_USE_DOUT_RST => 1,
--      C_USE_ECC => 0,
--      C_USE_EMBEDDED_REG => 0,
--      C_USE_PIPELINE_REG => 0,
--      C_POWER_SAVING_MODE => 0,
--      C_USE_FIFO16_FLAGS => 0,
--      C_USE_FWFT_DATA_COUNT => 0,
--      C_VALID_LOW => 0,
--      C_WR_ACK_LOW => 0,
--      C_WR_DATA_COUNT_WIDTH => 10,
--      C_WR_DEPTH => 16,
--      C_WR_FREQ => 1,
--      C_WR_PNTR_WIDTH => ADDR_BITS,
--      C_WR_RESPONSE_LATENCY => 1,
--      C_MSGON_VAL => 1,
--      C_ENABLE_RST_SYNC => 1,
--      C_ERROR_INJECTION_TYPE => 0,
--      C_SYNCHRONIZER_STAGE => 2,
--      C_INTERFACE_TYPE => 1,
--      C_AXI_TYPE => 1,
--      C_HAS_AXI_WR_CHANNEL => 1,
--      C_HAS_AXI_RD_CHANNEL => 1,
--      C_HAS_SLAVE_CE => 0,
--      C_HAS_MASTER_CE => 0,
--      C_ADD_NGC_CONSTRAINT => 0,
--      C_USE_COMMON_OVERFLOW => 0,
--      C_USE_COMMON_UNDERFLOW => 0,
--      C_USE_DEFAULT_SETTINGS => 0,
--      C_AXI_ID_WIDTH => 1,
--      C_AXI_ADDR_WIDTH => 32,
--      C_AXI_DATA_WIDTH => 64,
--      C_AXI_LEN_WIDTH => 8,
--      C_AXI_LOCK_WIDTH => 1,
--      C_HAS_AXI_ID => 0,
--      C_HAS_AXI_AWUSER => 0,
--      C_HAS_AXI_WUSER => 0,
--      C_HAS_AXI_BUSER => 0,
--      C_HAS_AXI_ARUSER => 0,
--      C_HAS_AXI_RUSER => 0,
--      C_AXI_ARUSER_WIDTH => 1,
--      C_AXI_AWUSER_WIDTH => 1,
--      C_AXI_WUSER_WIDTH => 1,
--      C_AXI_BUSER_WIDTH => 1,
--      C_AXI_RUSER_WIDTH => 1,
--      C_HAS_AXIS_TDATA => 0,
--      C_HAS_AXIS_TID => 0,
--      C_HAS_AXIS_TDEST => 0,
--      C_HAS_AXIS_TUSER => 0,
--      C_HAS_AXIS_TREADY => 1,
--      C_HAS_AXIS_TLAST => 1,
--      C_HAS_AXIS_TSTRB => 0,
--      C_HAS_AXIS_TKEEP => 0,
--      C_AXIS_TDATA_WIDTH => 1,
--      C_AXIS_TID_WIDTH => 1,
--      C_AXIS_TDEST_WIDTH => 1,
--      C_AXIS_TUSER_WIDTH => 1,
--      C_AXIS_TSTRB_WIDTH => 1,
--      C_AXIS_TKEEP_WIDTH => 1,
--      C_WACH_TYPE => 0,
--      C_WDCH_TYPE => 0,
--      C_WRCH_TYPE => 0,
--      C_RACH_TYPE => 0,
--      C_RDCH_TYPE => 0,
--      C_AXIS_TYPE => 0,
--      C_IMPLEMENTATION_TYPE_WACH => 12,
--      C_IMPLEMENTATION_TYPE_WDCH => 11,
--      C_IMPLEMENTATION_TYPE_WRCH => 12,
--      C_IMPLEMENTATION_TYPE_RACH => 12,
--      C_IMPLEMENTATION_TYPE_RDCH => 11,
--      C_IMPLEMENTATION_TYPE_AXIS => 11,
--      C_APPLICATION_TYPE_WACH => 0,
--      C_APPLICATION_TYPE_WDCH => 0,
--      C_APPLICATION_TYPE_WRCH => 0,
--      C_APPLICATION_TYPE_RACH => 0,
--      C_APPLICATION_TYPE_RDCH => 0,
--      C_APPLICATION_TYPE_AXIS => 1,
--      C_PRIM_FIFO_TYPE_WACH => "512x36",
--      C_PRIM_FIFO_TYPE_WDCH => "1kx36",
--      C_PRIM_FIFO_TYPE_WRCH => "512x36",
--      C_PRIM_FIFO_TYPE_RACH => "512x36",
--      C_PRIM_FIFO_TYPE_RDCH => "1kx36",
--      C_PRIM_FIFO_TYPE_AXIS => "512x36",
--      C_USE_ECC_WACH => 0,
--      C_USE_ECC_WDCH => 0,
--      C_USE_ECC_WRCH => 0,
--      C_USE_ECC_RACH => 0,
--      C_USE_ECC_RDCH => 0,
--      C_USE_ECC_AXIS => 0,
--      C_ERROR_INJECTION_TYPE_WACH => 0,
--      C_ERROR_INJECTION_TYPE_WDCH => 0,
--      C_ERROR_INJECTION_TYPE_WRCH => 0,
--      C_ERROR_INJECTION_TYPE_RACH => 0,
--      C_ERROR_INJECTION_TYPE_RDCH => 0,
--      C_ERROR_INJECTION_TYPE_AXIS => 0,
--      C_DIN_WIDTH_WACH => 32,
--      C_DIN_WIDTH_WDCH => 64,
--      C_DIN_WIDTH_WRCH => 2,
--      C_DIN_WIDTH_RACH => 32,
--      C_DIN_WIDTH_RDCH => 64,
--      C_DIN_WIDTH_AXIS => 1,
--      C_WR_DEPTH_WACH => 16,
--      C_WR_DEPTH_WDCH => 1024,
--      C_WR_DEPTH_WRCH => 16,
--      C_WR_DEPTH_RACH => 16,
--      C_WR_DEPTH_RDCH => 1024,
--      C_WR_DEPTH_AXIS => 16,
--      C_WR_PNTR_WIDTH_WACH => ADDR_BITS,
--      C_WR_PNTR_WIDTH_WDCH => 10,
--      C_WR_PNTR_WIDTH_WRCH => ADDR_BITS,
--      C_WR_PNTR_WIDTH_RACH => ADDR_BITS,
--      C_WR_PNTR_WIDTH_RDCH => 10,
--      C_WR_PNTR_WIDTH_AXIS => ADDR_BITS,
--      C_HAS_DATA_COUNTS_WACH => 0,
--      C_HAS_DATA_COUNTS_WDCH => 0,
--      C_HAS_DATA_COUNTS_WRCH => 0,
--      C_HAS_DATA_COUNTS_RACH => 0,
--      C_HAS_DATA_COUNTS_RDCH => 0,
--      C_HAS_DATA_COUNTS_AXIS => 3,
--      C_HAS_PROG_FLAGS_WACH => 0,
--      C_HAS_PROG_FLAGS_WDCH => 0,
--      C_HAS_PROG_FLAGS_WRCH => 0,
--      C_HAS_PROG_FLAGS_RACH => 0,
--      C_HAS_PROG_FLAGS_RDCH => 0,
--      C_HAS_PROG_FLAGS_AXIS => 0,
--      C_PROG_FULL_TYPE_WACH => 0,
--      C_PROG_FULL_TYPE_WDCH => 0,
--      C_PROG_FULL_TYPE_WRCH => 0,
--      C_PROG_FULL_TYPE_RACH => 0,
--      C_PROG_FULL_TYPE_RDCH => 0,
--      C_PROG_FULL_TYPE_AXIS => 0,
--      C_PROG_FULL_THRESH_ASSERT_VAL_WACH => 15,
--      C_PROG_FULL_THRESH_ASSERT_VAL_WDCH => 1023,
--      C_PROG_FULL_THRESH_ASSERT_VAL_WRCH => 15,
--      C_PROG_FULL_THRESH_ASSERT_VAL_RACH => 15,
--      C_PROG_FULL_THRESH_ASSERT_VAL_RDCH => 1023,
--      C_PROG_FULL_THRESH_ASSERT_VAL_AXIS => 15,
--      C_PROG_EMPTY_TYPE_WACH => 0,
--      C_PROG_EMPTY_TYPE_WDCH => 0,
--      C_PROG_EMPTY_TYPE_WRCH => 0,
--      C_PROG_EMPTY_TYPE_RACH => 0,
--      C_PROG_EMPTY_TYPE_RDCH => 0,
--      C_PROG_EMPTY_TYPE_AXIS => 0,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH => 13,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH => 1021,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH => 13,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH => 13,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH => 1021,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS => 13,
--      C_REG_SLICE_MODE_WACH => 0,
--      C_REG_SLICE_MODE_WDCH => 0,
--      C_REG_SLICE_MODE_WRCH => 0,
--      C_REG_SLICE_MODE_RACH => 0,
--      C_REG_SLICE_MODE_RDCH => 0,
--      C_REG_SLICE_MODE_AXIS => 0
--    )
--    PORT MAP (
--      backup => '0',
--      backup_marker => '0',
--      clk => '0',
--      rst => '0',
--      srst => '0',
--      wr_clk => '0',
--      wr_rst => '0',
--      rd_clk => '0',
--      rd_rst => '0',
--      din => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 18)),
--      wr_en => '0',
--      rd_en => '0',
--      prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0,ADDR_BITS)),
--      prog_empty_thresh_assert => STD_LOGIC_VECTOR(TO_UNSIGNED(0,ADDR_BITS)),
--      prog_empty_thresh_negate => STD_LOGIC_VECTOR(TO_UNSIGNED(0,ADDR_BITS)),
--      prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      prog_full_thresh_assert => STD_LOGIC_VECTOR(TO_UNSIGNED(0,ADDR_BITS)),
--      prog_full_thresh_negate => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      int_clk => '0',
--      injectdbiterr => '0',
--      injectsbiterr => '0',
--      sleep => '0',
--      m_aclk => rd_clk,
--      s_aclk => wr_clk,
--      s_aresetn => rstn,
--      m_aclk_en => '0',
--      s_aclk_en => '0',
--      s_axi_awid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_awaddr => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
--      s_axi_awlen => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
--      s_axi_awsize => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
--      s_axi_awburst => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
--      s_axi_awlock => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_awcache => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_awprot => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
--      s_axi_awqos => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_awregion => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_awuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_awvalid => '0',
--      s_axi_wid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_wdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
--      s_axi_wstrb => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
--      s_axi_wlast => '0',
--      s_axi_wuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_wvalid => '0',
--      s_axi_bready => '0',
--      m_axi_awready => '0',
--      m_axi_wready => '0',
--      m_axi_bid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axi_bresp => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
--      m_axi_buser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axi_bvalid => '0',
--      s_axi_arid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_araddr => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
--      s_axi_arlen => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
--      s_axi_arsize => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
--      s_axi_arburst => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
--      s_axi_arlock => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_arcache => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_arprot => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
--      s_axi_arqos => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_arregion => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_aruser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_arvalid => '0',
--      s_axi_rready => '0',
--      m_axi_arready => '0',
--      m_axi_rid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axi_rdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
--      m_axi_rresp => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
--      m_axi_rlast => '0',
--      m_axi_ruser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axi_rvalid => '0',
--      s_axis_tvalid => din_vld,
--      s_axis_tready => open,
--      s_axis_tdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      --s_axis_tdata => din,
--      s_axis_tstrb => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axis_tkeep => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axis_tlast => '1',
--      s_axis_tid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axis_tdest => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axis_tuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axis_tvalid => open,
--      m_axis_tready => m_axis_tready,
--      m_axis_tlast => m_axis_tlast,
--      axi_aw_injectsbiterr => '0',
--      axi_aw_injectdbiterr => '0',
--      axi_aw_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axi_aw_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axi_w_injectsbiterr => '0',
--      axi_w_injectdbiterr => '0',
--      axi_w_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
--      axi_w_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
--      axi_b_injectsbiterr => '0',
--      axi_b_injectdbiterr => '0',
--      axi_b_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axi_b_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0,ADDR_BITS)),
--      axi_ar_injectsbiterr => '0',
--      axi_ar_injectdbiterr => '0',
--      axi_ar_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axi_ar_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axi_r_injectsbiterr => '0',
--      axi_r_injectdbiterr => '0',
--      axi_r_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
--      axi_r_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
--      axis_injectsbiterr => '0',
--      axis_injectdbiterr => '0',
--      axis_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axis_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axis_wr_data_count => rd_used_i,
--      axis_rd_data_count => open
--    );



end generate NEW_INTRO3;

end rtl;




-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : xd_oarg_s2s_adapter.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-01-22
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

-- Design note: The main issue in this module is TLAST generation, specially in
-- the case where AXI stream wisth is not the same as accelerator data width.
-- Last data beat generated by accelerator is the one generated just before
-- ap_done is generated.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;


library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.srl_fifo_32_wt;
use axis_accelerator_adapter_v2_1_16.s2s_async_fifo_wt;


entity xd_oarg_s2s_adapter is
  generic (
    -- System generics:
    C_FAMILY              : string ;     -- Xilinx FPGA family
    C_MTBF_STAGES         : integer;
    C_M_AXIS_TDATA_WIDTH  : integer;
    C_M_AXIS_TUSER_WIDTH  : integer;
    C_M_AXIS_TID_WIDTH    : integer;
    C_M_AXIS_TDEST_WIDTH  : integer;

    C_AP_ARG_DATA_WIDTH   : integer;
    C_AP_ARG_ADDR_WIDTH   : integer;
    C_MULTIBUFFER_DEPTH   : integer);
  port (
    -- Output streams
    M_AXIS_ACLK       : in  std_logic;
    M_AXIS_ARESETN    : in  std_logic;
    M_AXIS_TVALID     : out std_logic;
    M_AXIS_TREADY     : in  std_logic;
    M_AXIS_TDATA      : out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
    M_AXIS_TSTRB      : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    M_AXIS_TKEEP      : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    M_AXIS_TLAST      : out std_logic;
    M_AXIS_TID        : out std_logic_vector(C_M_AXIS_TID_WIDTH-1 downto 0);
    M_AXIS_TDEST      : out std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0);
    M_AXIS_TUSER      : out std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0);
    ---
    sw_length         : in  std_logic_vector(31 downto 0);
    sw_length_we      : in  std_logic;
    use_sw_length     : in  std_logic;
    host_oarg_tdest   : in  std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0);
    ---
    ap_clk            : in  std_logic;
    ap_rst_sync       : in  std_logic;
    ap_rst            : in  std_logic;
    ap_oarg_din       : in  std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    ap_oarg_we        : in  std_logic;
    ap_oarg_full_n    : out std_logic;
    ap_arg_rqt        : out std_logic;
    ap_arg_ack        : in  std_logic;

    ap_start          : in  std_logic;
    ap_done           : in  std_logic;

    none              : out std_logic);
end entity;

architecture rtl of xd_oarg_s2s_adapter is
  signal axis_data   : std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
  signal axis_keep   : std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
  -- pragma translate_off
  signal axis_start  : std_logic;
  signal axis_end    : std_logic;
  -- pragma translate_on
  signal axis_last   : std_logic;
  signal axis_vld    : std_logic;
  signal axis_rdy    : std_logic;
  signal axis_rst    : std_logic;
  signal axis_rst1    : std_logic;
  signal axis_rst2    : std_logic;
  signal axis_trf_ok : std_logic;
  signal ap_rst_vec  : std_logic_vector(0 downto 0);
  signal ap_rst_reg  : std_logic;
--  signal ap_rst_sync : std_logic;
--  signal ap_rst_sync1 : std_logic;
  signal ap_rst_axi  : std_logic;
  signal ap_rst_axi1  : std_logic;

  -- SW_LENGTH_WIDTH is defined in xd_adapter_pkg
  signal sw_length_wr : std_logic_vector(SW_LENGTH_WIDTH-1 downto 0);
  signal sw_length_rd : std_logic_vector(SW_LENGTH_WIDTH-1 downto 0);
  signal sw_length_we_vector       : std_logic_vector(0 downto 0);
  signal sw_length_we_rd       : std_logic;
  signal sw_length_we_rd_vector       : std_logic_vector(0 downto 0);
  signal xd_sw_length        : std_logic_vector(SW_LENGTH_WIDTH-1 downto 0);
  signal xd_sw_length_vld    : std_logic;
  signal xd_sw_length_rdy    : std_logic;
  signal sw_length_fifo_dout : std_logic_vector(SW_LENGTH_WIDTH-1 downto 0);

      ATTRIBUTE async_reg           : STRING;
  ATTRIBUTE async_reg OF ap_rst_axi  : SIGNAL IS "true";
        ATTRIBUTE async_reg OF axis_rst1    : SIGNAL IS "true"; 
      ATTRIBUTE async_reg OF axis_rst    : SIGNAL IS "true"; 
--        ATTRIBUTE async_reg OF ap_rst_sync1    : SIGNAL IS "true"; 
--      ATTRIBUTE async_reg OF ap_rst_sync    : SIGNAL IS "true"; 



begin


      prd0: PROCESS (M_AXIS_ACLK, M_AXIS_ARESETN)
      BEGIN
       -- Register Stage #1 
        IF (M_AXIS_ARESETN = '0') THEN
          axis_rst1 <= '1';
          axis_rst <= '1';
        ELSIF (M_AXIS_ACLK'event and M_AXIS_ACLK = '1') THEN
          axis_rst1 <= '0';
          axis_rst <= axis_rst1;
        END IF;
        END PROCESS prd0;




  M_AXIS_TVALID <= axis_vld;
  M_AXIS_TDATA  <= axis_data;
  M_AXIS_TSTRB  <= (others => '0');
  M_AXIS_TKEEP  <= axis_keep;
  M_AXIS_TLAST  <= axis_last;
  M_AXIS_TID    <= (others => '0');
  M_AXIS_TDEST  <= host_oarg_tdest;
  M_AXIS_TUSER  <= (others => '0');


  axis_trf_ok <= axis_vld and axis_rdy;

 --     PROCESS (ap_clk)
 --     BEGIN
 --       IF (ap_clk'event and ap_clk = '1') THEN
 --         ap_rst_reg <= ap_rst;
 --       END IF;
 --       END PROCESS;
      
--      prd1: PROCESS (M_AXIS_ACLK)
--      BEGIN
--       -- Register Stage #1 
--        IF (M_AXIS_ACLK'event and M_AXIS_ACLK = '1') THEN
--          ap_rst_sync1 <= ap_rst;
--          ap_rst_sync <= ap_rst_sync1;
--        END IF;
--        END PROCESS prd1;

	axis_rst2 <= axis_rst or ap_rst_sync; 

      prd2: PROCESS (M_AXIS_ACLK, axis_rst2)
      BEGIN
       -- Register Stage #1 
        IF (axis_rst2 = '1') THEN
          ap_rst_axi1 <= '1';
          ap_rst_axi <= '1';
        ELSIF (M_AXIS_ACLK'event and M_AXIS_ACLK = '1') THEN
          ap_rst_axi1 <= '0';
          ap_rst_axi <= ap_rst_axi1;
        END IF;
        END PROCESS prd2;



--      rst_sync : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
--        generic map (
--        C_CDC_TYPE                 => 0,
--        C_RESET_STATE              => 1,
--        C_SINGLE_BIT               => 1,
--        C_FLOP_INPUT               => 0,
--        C_VECTOR_WIDTH             => 1,
--        C_MTBF_STAGES              => 2
--        )
--        port map (
--        prmry_aclk                 => '0',
--        prmry_resetn               => '0',
--        prmry_in                   => ap_rst,
--        prmry_vect_in              => (others=>'0'),
--
--        scndry_aclk                => M_AXIS_ACLK,
--        scndry_resetn              => M_AXIS_ARESETN,
--        scndry_out                 => ap_rst_axi,
--        scndry_vect_out            => open
--        );




  -- SW programmable length:

--  sw_length_wr <= sw_length(SW_LENGTH_WIDTH-1 downto 0);
    sw_length_rd <= sw_length(SW_LENGTH_WIDTH-1 downto 0);
  sw_length_we_vector(0) <= sw_length_we;
  sw_length_we_rd        <= sw_length_we_rd_vector(0);

   wr_stg_inst: ENTITY axis_accelerator_adapter_v2_1_16.synchronizer_ff
    GENERIC MAP (
     C_HAS_RST => 1,
     C_WIDTH   => 1
     )
    PORT MAP ( 
     RST       => axis_rst,
     CLK       => M_AXIS_ACLK,   
     D         => sw_length_we_vector,
     Q         => sw_length_we_rd_vector
     );    

--       SW_LENGTH_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
--        generic map (
--        C_CDC_TYPE                 => 1,
--        C_RESET_STATE              => 0,
--        C_SINGLE_BIT               => 0,
--        C_VECTOR_WIDTH             => SW_LENGTH_WIDTH,
--        C_MTBF_STAGES              => 2
--        )
--        port map (
--        prmry_aclk                 => '0',
--        prmry_resetn               => '0',
--        prmry_in                   => '0',
--        prmry_vect_in              => sw_length_wr,
--
--        scndry_aclk                => M_AXIS_ACLK,
--        scndry_resetn              => axis_rst,
--        scndry_out                 => open,
--        scndry_vect_out            => sw_length_rd
--        );

	
  SW_LENGTH_FIFO : entity axis_accelerator_adapter_v2_1_16.srl_fifo_32_wt
    generic map (
      C_FAMILY => C_FAMILY,
      WIDTH    => SW_LENGTH_WIDTH)
    port map (
      rst      => axis_rst,--ap_rst,
      clk      => M_AXIS_ACLK,
      din      => sw_length_rd,
      din_vld  => sw_length_we_rd,
      din_rdy  => open,
      dout     => xd_sw_length,
      dout_vld => xd_sw_length_vld,
      dout_rdy => xd_sw_length_rdy);

  -----------------------------------------------------

  SAME_WIDTH_GEN : if (C_M_AXIS_TDATA_WIDTH = C_AP_ARG_DATA_WIDTH) generate
    signal tap_0       : std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    signal tap_0_we    : std_logic;
    signal tap_0_vld   : std_logic;
    signal tap_0_rdy   : std_logic;
    signal tap_0_start : std_logic;
    signal tap_0_end   : std_logic;

    constant FIFO_DATA_LSB  : integer := 0;
    constant FIFO_DATA_MSB  : integer := C_AP_ARG_DATA_WIDTH-1;
    constant FIFO_START_BIT : integer := FIFO_DATA_MSB+1;
    constant FIFO_END_BIT   : integer := FIFO_START_BIT+1;
    constant FIFO_WIDTH     : integer := FIFO_END_BIT+1;

    signal fifo_din     : std_logic_vector(FIFO_WIDTH-1 downto 0);
    signal fifo_dout    : std_logic_vector(FIFO_WIDTH-1 downto 0);
    signal fifo_din_vld : std_logic;
    signal fifo_din_rdy : std_logic;

    type state_type is (
      -- pragma translate_off
      stop,
      -- pragma translate_on
      idle,
      running,
      pending_last);
    signal state : state_type;

    -- tap_0 is an extra position in the FIFO; substract one
    constant FIFO_DEPTH : integer := (2**C_AP_ARG_ADDR_WIDTH)-1;

    type axis_state_type is (
      -- pragma translate_off
      stop,
      -- pragma translate_on
      idle,
      running,
      discarding,
      padding);

    signal axis_state      : axis_state_type;
    signal apply_sw_length : std_logic;

    -- Output FIFO signals
    signal dout       : std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
    signal dout_start : std_logic;
    signal dout_end   : std_logic;
    signal dout_vld   : std_logic;
    signal dout_rdy   : std_logic;

    constant AXIS_BEAT_CNT_WIDTH : integer := SW_LENGTH_WIDTH;

    -- AXI stream beat counter:
    signal axis_beat_cnt : unsigned(AXIS_BEAT_CNT_WIDTH-1 downto 0);
    signal axis_beat_dec : std_logic;
    signal axis_beat_clr : std_logic;
    signal axis_beat_end : std_logic;

    -- Output stage control:
    signal axis_ce        : std_logic;
    signal axis_we        : std_logic;
    signal next_axis_last : std_logic;
    signal axis_word_vld  : std_logic;

  begin

    process(ap_clk)
    begin
      if(ap_clk'event and ap_clk = '1') then
        if(tap_0_we = '1') then
          tap_0 <= ap_oarg_din;
        end if;
      end if;
    end process;

    process(ap_clk, ap_rst)
    begin
      if(ap_rst = '1') then
        tap_0_vld <= '0';
      elsif(ap_clk'event and ap_clk = '1') then
        if(tap_0_vld = '0' or (tap_0_vld and tap_0_rdy) = '1') then
          tap_0_vld <= tap_0_we;
        end if;
      end if;
    end process;

    process(ap_clk, ap_rst)
    begin
      if(ap_rst = '1') then
        state       <= idle;
        tap_0_start <= '0';
        ap_arg_rqt  <= '1';
      elsif(ap_clk'event and ap_clk = '1') then
        case state is
          when idle =>
            if(ap_start = '1') then
              state       <= running;
              tap_0_start <= '1';
            end if;
          when running =>
            if(ap_done = '1') then
              if (ap_oarg_we = '0' and fifo_din_rdy = '1') then
                state <= idle;
              else
                state      <= pending_last;
                ap_arg_rqt <= '0';
              end if;
            end if;

            if((fifo_din_vld and fifo_din_rdy) = '1') then
              tap_0_start <= '0';
            end if;

          when pending_last =>
            if(tap_0_vld = '0' or (tap_0_vld and fifo_din_rdy) = '1') then
              state      <= idle;
              ap_arg_rqt <= '1';
            end if;
          when others =>
        end case;
      end if;
    end process;

    process(state, ap_oarg_we, tap_0_vld, fifo_din_rdy, ap_done)
    begin
      ap_oarg_full_n <= '0';

      tap_0_we  <= '0';
      tap_0_rdy <= '0';
      tap_0_end <= '0';

      fifo_din_vld <= '0';

      case state is
        when idle =>
          ap_oarg_full_n <= '1';

        when running =>
          -- We enable writes in tap_0 when:
          --  1. it's empty or
          --  2. it's full and we can transfer the contents to the FIFO.
          -- Write is efective when the above conditions are valid and a new
          -- data value is received
          tap_0_we <= ap_oarg_we and (not(tap_0_vld) or (tap_0_vld and fifo_din_rdy));

          -- We enable receive data values if:
          -- 1. tap_0 is empty
          -- 2. tap_0 is full amd it's content can be transfered to the FIFO.
          ap_oarg_full_n <= not(tap_0_vld) or (tap_0_vld and fifo_din_rdy);

          -- We write in the FIFO when tap_0 is full and:
          --  1. arrives a new value at the input or
          --  2. finishes execution (ap_done = '1')
          fifo_din_vld <= tap_0_vld and (ap_oarg_we or ap_done);

          -- If the write in the fifo is efective, we take the contents of tap_0:
          -- take the contents of tap_0 when the FIFO accepts the data value.
          tap_0_rdy <= (tap_0_vld and (ap_oarg_we or ap_done)) and fifo_din_rdy;

          -- Last data value written in the FIFO because we've received an ap_done
          tap_0_end <= tap_0_vld and ap_done;

        when pending_last =>
          tap_0_end <= '1';

          -- Write in the fifo when tap_0 is full and arrives a new data value
          -- at the input
          fifo_din_vld <= tap_0_vld;
          -- In that moment, we take the content of tap_0
          tap_0_rdy    <= tap_0_vld and fifo_din_rdy;

        when others =>
      end case;
    end process;

    fifo_din(FIFO_DATA_MSB downto FIFO_DATA_LSB) <= tap_0;
    fifo_din(FIFO_START_BIT)                     <= tap_0_start;
    fifo_din(FIFO_END_BIT)                       <= tap_0_end;

    FIFO_I : entity axis_accelerator_adapter_v2_1_16.s2s_async_fifo_wt
      generic map (
        C_FAMILY => C_FAMILY,
        C_MTBF_STAGES => C_MTBF_STAGES,
        DEPTH    => FIFO_DEPTH,
        WIDTH    => FIFO_WIDTH)
      port map (
        din      => fifo_din,
        din_vld  => fifo_din_vld,
        din_rdy  => fifo_din_rdy,
        wr_clk   => ap_clk,
        wr_rst   => ap_rst,
        dout     => fifo_dout,
        dout_vld => dout_vld,
        dout_rdy => dout_rdy,
        rd_clk   => M_AXIS_ACLK,
        rd_rst   => axis_rst);

    dout       <= fifo_dout(FIFO_DATA_MSB downto FIFO_DATA_LSB);
    dout_start <= fifo_dout(FIFO_START_BIT);
    dout_end   <= fifo_dout(FIFO_END_BIT);


    process(M_AXIS_ACLK)
    begin
      if(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        if(axis_beat_clr = '1') then
          axis_beat_cnt <= unsigned(xd_sw_length);
        elsif(axis_beat_dec = '1') then
          axis_beat_cnt <= axis_beat_cnt-1;
        end if;
      end if;
    end process;

    axis_beat_end <= '1' when (axis_beat_cnt = 1) else '0';

    process(M_AXIS_ACLK, ap_rst_axi)
    begin
      if(ap_rst_axi = '1') then
        axis_state      <= idle;
        apply_sw_length <= '0';
      elsif(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        case axis_state is
          when idle =>
            -- Don't start until the first data value of a new frame
            -- is available:
            if((dout_vld and dout_start) = '1') then
              apply_sw_length <= use_sw_length;
              -- Wait for a valid SW length if it's going to be used
              if(use_sw_length = '1') then
                if(xd_sw_length_vld = '1') then
                  axis_state <= running;
                end if;
              else
                axis_state <= running;
              end if;
            end if;
          when running =>
            if((axis_ce and dout_vld) = '1') then
              if(apply_sw_length = '0') then
                if(dout_end = '1') then
                  axis_state <= idle;
                end if;
              else
                if(axis_beat_end = '0' and dout_end = '1') then
                  axis_state <= padding;
                elsif(axis_beat_end = '1' and dout_end = '0') then
                  axis_state <= discarding;
                elsif(axis_beat_end = '1' and dout_end = '1') then
                  axis_state <= idle;
                end if;
              end if;
            end if;
          when discarding =>
            if(dout_end = '1') then
              axis_state <= idle;
            end if;
          when padding =>
            if((axis_ce and axis_beat_end) = '1') then
              axis_state <= idle;
            end if;
          when others =>
        end case;
      end if;
    end process;

    process(axis_state, use_sw_length, dout_start, dout_vld, axis_ce, axis_beat_end, dout_end)
    begin
      xd_sw_length_rdy <= '0';
      axis_beat_clr    <= '0';
      axis_beat_dec    <= '0';
      dout_rdy         <= '0';
      axis_we          <= '0';
      next_axis_last   <= '0';
      axis_word_vld    <= '0';

      case axis_state is
        when idle =>
          xd_sw_length_rdy <= use_sw_length and dout_start and dout_vld;
          axis_beat_clr    <= '1';
        when running =>
          axis_we       <= dout_vld;
          dout_rdy      <= axis_ce and dout_vld;
          axis_beat_dec <= axis_ce and dout_vld;

          if(use_sw_length = '0') then
            next_axis_last <= dout_end;
            axis_word_vld  <= '1';
          else
            if(axis_beat_end = '0' and dout_end = '0') then     -- normal opperation
              next_axis_last <= '0';
              axis_word_vld  <= '1';
            elsif(axis_beat_end = '0' and dout_end = '1') then  -- doing padding
              next_axis_last <= '0';
              axis_word_vld  <= '1';
            elsif(axis_beat_end = '1' and dout_end = '0') then  -- doing discarding
              next_axis_last <= '1';
              axis_word_vld  <= '1';
            elsif(axis_beat_end = '1' and dout_end = '1') then  -- sw_length = hw_length
              next_axis_last <= '1';
              axis_word_vld  <= '1';
            end if;
          end if;
        when discarding =>
          dout_rdy <= '1';
        when padding =>
          axis_we        <= '1';
          axis_beat_dec  <= axis_ce;
          next_axis_last <= axis_beat_end;
          axis_word_vld  <= '0';

        when others =>
      end case;
    end process;

    axis_ce <= not(axis_vld) or (axis_vld and axis_rdy);

    process(M_AXIS_ACLK, ap_rst_axi)
    begin
      if(ap_rst_axi = '1') then
        axis_vld <= '0';
      elsif(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        if(axis_ce = '1') then
          axis_vld <= axis_we;
        end if;
      end if;
    end process;

    process(M_AXIS_ACLK)
    begin
      if(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        if(axis_ce = '1') then
          axis_data <= (others => '0');
          if(axis_word_vld = '1') then
            axis_data <= dout;
          end if;
          axis_last <= next_axis_last;
        end if;
      end if;
    end process;

    axis_keep <= (others => '1');

    axis_rdy <= M_AXIS_TREADY;

  end generate SAME_WIDTH_GEN;


  AXI_WIDER_GEN : if (C_M_AXIS_TDATA_WIDTH > C_AP_ARG_DATA_WIDTH) generate
    -- Notes:
    -- This design is based on using a temporal register, where input data is
    -- stored before pushing to the FIFO. This register is used to pack
    -- received data and form an AXI-stream data beat. the last AXI-stream beat
    -- (TLAST high) will be the data stored in the register when we receive an
    -- ap_done. When we receive ap_done, two things could happen:
    --
    -- 1. New data is being written. this means ap_oarg_we = '1' and ap_oarg_full_n =
    --    '1'; that is, tap_0_we = '1'. the input data value should be accepted
    --    otherwise ap_done would not go high.
    --    a. if the temporal register is full, this new write will push the
    --       data to the fifo (fifo will always accept otherwise ap_oarg_full_n
    --       would be active and ap_done will not be generated). At the same time,
    --       this new data value into the temporal register. in the next cycle,
    --       we're in pending_last state, we have a incomplete data beat to write
    --       in the fifo (last AXI-stream beat).
    --    b. If the temporal register (tap_0) is incomplete, it can complete or
    --       not with this data write. In any case, the final content will be
    --       available next cycle (pendign_last state). in this state, it will
    --       be pushed to the FIFO labeled as last beat in stream.
    --
    -- 2. NO new data is being written. In this case, temporal register can be:
    --    * complete (full). signal tap_0_vld = '1'
    --    * partially complete. signal tap_0_strb(0)='1'. that is, at least,
    --      firt ap_word has data.
    --    * completely empty. This is not impossible case.
    --
    --    if regiter is complete or partially complete, it's content should be
    --    pushed to the FIFO. these two cases can be characterized by tap_0_strb(0)='1'
    --    to mantain coherence with case 1, this transfer to fifo will occur in
    --    the next state (pending_last), although in theory could happen in
    --    running state.
    --    there is a special condition. if we receive ap_done and we're not
    --    receiving new data and register is complete, we could try to transfer
    --    to the fifo.

    constant WORDS_PER_BEAT : integer := C_M_AXIS_TDATA_WIDTH/C_AP_ARG_DATA_WIDTH;
    signal   word_sel       : std_logic_vector(WORDS_PER_BEAT-1 downto 0);
    signal   word_clr       : std_logic;

    type state_type is (
      -- pragma translate_off
      stop,
      -- pragma translate_on
      idle,
      running,
      pending_last);
    signal state : state_type;

    signal tap_0       : std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
    signal tap_0_we    : std_logic;
    signal tap_0_vld   : std_logic;
    signal tap_0_rdy   : std_logic;
    signal tap_0_start : std_logic;
    signal tap_0_end   : std_logic;
    signal tap_0_strb  : std_logic_vector(WORDS_PER_BEAT-1 downto 0);

    constant FIFO_DATA_LSB  : integer := 0;
    constant FIFO_DATA_MSB  : integer := C_M_AXIS_TDATA_WIDTH-1;
    constant FIFO_STRB_LSB  : integer := FIFO_DATA_MSB+1;
    constant FIFO_STRB_MSB  : integer := FIFO_STRB_LSB+WORDS_PER_BEAT-1;
    constant FIFO_START_BIT : integer := FIFO_STRB_MSB+1;
    constant FIFO_END_BIT   : integer := FIFO_START_BIT+1;
    constant FIFO_WIDTH     : integer := FIFO_END_BIT+1;

    signal fifo_din     : std_logic_vector(FIFO_WIDTH-1 downto 0);
    signal fifo_dout    : std_logic_vector(FIFO_WIDTH-1 downto 0);
    signal fifo_din_vld : std_logic;
    signal fifo_din_rdy : std_logic;

    -- tap_0 is an extra position for the FIFO; substract one
    constant DATA_RATIO : integer := C_M_AXIS_TDATA_WIDTH/C_AP_ARG_DATA_WIDTH;
    constant FIFO_DEPTH : integer := (2**(C_AP_ARG_ADDR_WIDTH-log2(DATA_RATIO)))-1;

    type axis_state_type is (
      -- pragma translate_off
      stop,
      -- pragma translate_on
      idle,
      running,
      discarding,
      padding);

    signal axis_state      : axis_state_type;
    signal apply_sw_length : std_logic;

    -- These are the signal for the FIFO output:
    signal dout         : std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
    signal dout_word_en : std_logic_vector(WORDS_PER_BEAT-1 downto 0);
    signal dout_start   : std_logic;
    signal dout_end     : std_logic;
    signal dout_vld     : std_logic;
    signal dout_rdy     : std_logic;

    constant AXIS_BEAT_REM_WIDTH : integer := log2(DATA_RATIO);
    constant AXIS_BEAT_CNT_WIDTH : integer := SW_LENGTH_WIDTH-AXIS_BEAT_REM_WIDTH;
    constant AXIS_BEAT_CNT_LSB   : integer := AXIS_BEAT_REM_WIDTH;
    constant AXIS_BEAT_CNT_MSB   : integer := SW_LENGTH_WIDTH-1;

    -- AXI stream beat counter:
    signal axis_beat_cnt   : unsigned(AXIS_BEAT_CNT_WIDTH-1 downto 0);
    signal axis_beat_dec   : std_logic;
    signal axis_beat_clr   : std_logic;
    signal axis_beat_cnt_0 : std_logic;
    signal axis_beat_cnt_1 : std_logic;
    signal axis_beat_end   : std_logic;

    -- sw_length_with_rem is set when the configured SW length is not
    -- a integer multiple of C_M_AXIS_TDATA_WIDTH
    signal sw_length_with_rem : std_logic;
    -- In this case, sw_last_word_en provides the enabled words
    -- for last AXIS beat
    signal sw_last_word_en    : std_logic_vector(WORDS_PER_BEAT-1 downto 0);

    -- Output stage control:
    signal axis_ce : std_logic;
    signal axis_we : std_logic;

    -- These signals are used to generate tlast and tkeep for the output
    -- stage. next_axis_last marks the last beat. next_axis_word_en indicates
    -- the enabled words (those which have the tkeep bits activated). It will
    -- be unrolled to generate tkee. Finally, axis_word_vld indicates which
    -- words are going to keep their original value. Not valid words will be
    -- forced to zero during padding.
    signal next_axis_last    : std_logic;
    signal next_axis_word_en : std_logic_vector(WORDS_PER_BEAT-1 downto 0);
    signal axis_word_vld     : std_logic_vector(WORDS_PER_BEAT-1 downto 0);

    
    signal ap_oarg_full_n_i   : std_logic;

  begin
    -- With this shift register, we select the destination word within the
    -- temporal register
    process(ap_clk, ap_rst)
    begin
      if(ap_rst = '1') then
        word_sel    <= (others => '0');
        word_sel(0) <= '1';
      elsif(ap_clk'event and ap_clk = '1') then
        if(word_clr = '1') then
          word_sel    <= (others => '0');
          word_sel(0) <= '1';
        elsif(tap_0_we = '1') then
          word_sel <= word_sel(WORDS_PER_BEAT-2 downto 0) & word_sel(WORDS_PER_BEAT-1);
        end if;
      end if;
    end process;
    
    process(ap_clk)
    begin
      if(ap_clk'event and ap_clk = '1') then
        if(tap_0_we = '1') then
          for i in 0 to WORDS_PER_BEAT-1 loop
            if(word_sel(i) = '1') then
              tap_0(C_AP_ARG_DATA_WIDTH*(i+1)-1 downto C_AP_ARG_DATA_WIDTH*i) <= ap_oarg_din;
            end if;
          end loop;
        end if;
      end if;
    end process;

    process(ap_clk, ap_rst)
    begin
      if(ap_rst = '1') then
        tap_0_strb <= (others => '0');
      elsif(ap_clk'event and ap_clk = '1') then
        -- when the register value is taken, we clean strb, unless we are
        -- receiving the first word of the following beat
        if((fifo_din_vld and fifo_din_rdy) = '1') then
          tap_0_strb    <= (others => '0');
          tap_0_strb(0) <= tap_0_we;
        elsif(tap_0_we = '1') then
          -- In the rest of cases, we activate the correct bit
          tap_0_strb <= tap_0_strb or word_sel;
        end if;
      end if;
    end process;

    process(ap_clk, ap_rst)
    begin
      if(ap_rst = '1') then
        tap_0_vld <= '0';
      elsif(ap_clk'event and ap_clk = '1') then
        if(tap_0_vld = '0' or (tap_0_vld and tap_0_rdy) = '1') then
          -- The input reg has a new valid data value when:
          -- 1. a new data value is written to complte the fifo word (bit width)
          -- 2. a new data value is written at the same time ap_done is active
          -- (fifo word might be complete/incomplete)
          -- 3. we receive ap_done and there is data remaining in the register
          tap_0_vld <= (tap_0_we and (word_sel(WORDS_PER_BEAT-1))) or
                       (tap_0_we and ap_done);
        end if;
      end if;
    end process;


    process(ap_clk, ap_rst)
    begin
      if(ap_rst = '1') then
        state       <= idle;
        tap_0_start <= '0';
        ap_arg_rqt  <= '1';
      elsif(ap_clk'event and ap_clk = '1') then
        case state is
          when idle =>
            if(ap_start = '1') then
              state       <= running;
              tap_0_start <= '1';
            end if;
          when running =>
            if(ap_done = '1') then
              state      <= pending_last;
              ap_arg_rqt <= '0';
            end if;

            if((fifo_din_vld and fifo_din_rdy) = '1') then
              tap_0_start <= '0';
            end if;

          when pending_last =>
            if(tap_0_strb(0) = '0' or (tap_0_strb(0) and fifo_din_rdy) = '1') then
              state      <= idle;
              ap_arg_rqt <= '1';
            end if;
          when others =>
        end case;
      end if;
    end process;

    process(state, ap_oarg_we, tap_0_vld, fifo_din_rdy, tap_0_strb)
    begin
      ap_oarg_full_n_i <= '0';

      tap_0_we  <= '0';
      tap_0_rdy <= '0';

      tap_0_end <= '0';

      fifo_din_vld <= '0';
      
      word_clr <= '0';

      case state is
        when idle =>
          word_clr <= '1';
          ap_oarg_full_n_i <= '1';

        when running =>
          -- We enable writting in tap_0 when:
          --  1. it's empty or
          --  2. it's full and its contents can be transfered to the FIFO
          -- Write is efective when these two conditions are met and a new data
          -- value is received.
          tap_0_we <= ap_oarg_we and (not(tap_0_vld) or (tap_0_vld and fifo_din_rdy));

          -- We enable received new data if:
          -- 1. tap_0 is empty
          -- 2. tap_0 is full and its contents can be transfered ot the FIFO
          ap_oarg_full_n_i <= not(tap_0_vld) or (tap_0_vld and fifo_din_rdy);

          -- we write in the FIFO when:
          --  1. tap_0 is full and arrives a new input value or
          --  2. finishes execution (ap_done = '1'), no new data received (ap_oarg_we = '0')
          --  and tap_0 is not empty (tap_0_strb(0) = '1').
          fifo_din_vld <= (tap_0_vld and ap_oarg_we);

          -- If fifo write is efective, we take the contents of tap_0
          tap_0_rdy <= (tap_0_vld and ap_oarg_we);

        when pending_last =>
          tap_0_end <= '1';

          fifo_din_vld <= tap_0_strb(0);
          tap_0_rdy    <= fifo_din_rdy;

        when others =>
      end case;
    end process;

    ap_oarg_full_n <= ap_oarg_full_n_i;
    
    fifo_din(FIFO_DATA_MSB downto FIFO_DATA_LSB) <= tap_0;
    fifo_din(FIFO_STRB_MSB downto FIFO_STRB_LSB) <= tap_0_strb;
    fifo_din(FIFO_START_BIT)                     <= tap_0_start;
    fifo_din(FIFO_END_BIT)                       <= tap_0_end;


    FIFO_I : entity axis_accelerator_adapter_v2_1_16.s2s_async_fifo_wt
      generic map (
        C_FAMILY => C_FAMILY,
        C_MTBF_STAGES => C_MTBF_STAGES,
        DEPTH    => FIFO_DEPTH,
        WIDTH    => FIFO_WIDTH)
      port map (
        din      => fifo_din,
        din_vld  => fifo_din_vld,
        din_rdy  => fifo_din_rdy,
        wr_clk   => ap_clk,
        wr_rst   => ap_rst,
        dout     => fifo_dout,
        dout_vld => dout_vld,
        dout_rdy => dout_rdy,
        rd_clk   => M_AXIS_ACLK,
        rd_rst   => axis_rst);

    dout         <= fifo_dout(FIFO_DATA_MSB downto FIFO_DATA_LSB);
    dout_word_en <= fifo_dout(FIFO_STRB_MSB downto FIFO_STRB_LSB);
    dout_start   <= fifo_dout(FIFO_START_BIT);
    dout_end     <= fifo_dout(FIFO_END_BIT);

    -- This counter is used to control the number of AXIS beats set by the SW length
    process(M_AXIS_ACLK)
      variable aux : unsigned(AXIS_BEAT_CNT_WIDTH-1 downto 0);
    begin
      if(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        if(axis_beat_clr = '1') then
          aux           := unsigned(xd_sw_length(AXIS_BEAT_CNT_MSB downto AXIS_BEAT_CNT_LSB));
          axis_beat_cnt <= aux;
        elsif(axis_beat_dec = '1') then
          axis_beat_cnt <= axis_beat_cnt-1;
        end if;
      end if;
    end process;

    -- This register is initialized when the axis_beat_cnt counter (SW length) is
    -- loaded. It's used to determine if the last beat is full (no remainder)
    process(M_AXIS_ACLK)
      variable beat_rem       : unsigned(AXIS_BEAT_REM_WIDTH-1 downto 0);
      variable upper_word_en  : unsigned(AXIS_BEAT_REM_WIDTH-1 downto 0);
      constant BYTES_PER_WORD : integer := C_AP_ARG_DATA_WIDTH/8;
    begin
      if(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        if(axis_beat_clr = '1') then
          beat_rem := unsigned(xd_sw_length(AXIS_BEAT_REM_WIDTH-1 downto 0));
          if(beat_rem = 0) then
            sw_length_with_rem <= '0';
          else
            sw_length_with_rem <= '1';
          end if;

          upper_word_en := unsigned(xd_sw_length(AXIS_BEAT_CNT_LSB-1 downto 0)) - 1;
          for i in 0 to WORDS_PER_BEAT-1 loop
            if(i > upper_word_en) then
              sw_last_word_en(i) <= '0';
            else
              sw_last_word_en(i) <= '1';
            end if;
          end loop;
        end if;
      end if;
    end process;

    process(axis_beat_cnt)
    begin
      axis_beat_cnt_0 <= '0';
      axis_beat_cnt_1 <= '0';
      if(axis_beat_cnt(axis_beat_CNT_WIDTH-1 downto 1) = 0) then
        axis_beat_cnt_0 <= not(axis_beat_cnt(0));
        axis_beat_cnt_1 <= axis_beat_cnt(0);
      end if;
    end process;

    axis_beat_end <= axis_beat_cnt_1 when (sw_length_with_rem = '0') else axis_beat_cnt_0;

    process(M_AXIS_ACLK, ap_rst_axi)
    begin
      if(ap_rst_axi = '1') then
        axis_state      <= idle;
        apply_sw_length <= '0';
      elsif(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        case axis_state is
          when idle =>
            -- Don't start until the first data value of a new frame
            -- is available:
            if((dout_vld and dout_start) = '1') then
              apply_sw_length <= use_sw_length;
              -- Wait for a valid SW length if it's going to be used
              if(use_sw_length = '1') then
                if(xd_sw_length_vld = '1') then
                  axis_state <= running;
                end if;
              else
                axis_state <= running;
              end if;
            end if;
          when running =>
            if((axis_ce and dout_vld) = '1') then
              if(apply_sw_length = '0') then
                if(dout_end = '1') then
                  axis_state <= idle;
                end if;
              else
                if(axis_beat_end = '0' and dout_end = '1') then
                  axis_state <= padding;
                elsif(axis_beat_end = '1' and dout_end = '0') then
                  axis_state <= discarding;
                elsif(axis_beat_end = '1' and dout_end = '1') then
                  axis_state <= idle;
                end if;
              end if;
            end if;
          when discarding =>
            if(dout_end = '1') then
              axis_state <= idle;
            end if;
          when padding =>
            if((axis_ce and axis_beat_end) = '1') then
              axis_state <= idle;
            end if;
          when others =>
        end case;
      end if;
    end process;

    process(axis_state, use_sw_length, dout_start, dout_vld, axis_ce, dout_end, dout_word_en, axis_beat_end, sw_last_word_en)
      constant BYTES_PER_WORD  : integer := C_AP_ARG_DATA_WIDTH/8;
      constant AXIS_KEEP_WIDTH : integer := C_M_AXIS_TDATA_WIDTH/8;
    begin
      xd_sw_length_rdy <= '0';

      axis_beat_clr <= '0';
      axis_beat_dec <= '0';

      dout_rdy <= '0';
      axis_we  <= '0';

      next_axis_last    <= '0';
      axis_word_vld     <= (others => '0');  -- used during padding to fill with zeros
      next_axis_word_en <= (others => '0');  -- used to generate axis_keep


      case axis_state is
        when idle =>
          xd_sw_length_rdy <= use_sw_length and dout_start and dout_vld;
          axis_beat_clr    <= '1';
        when running =>
          axis_we       <= dout_vld;
          dout_rdy      <= axis_ce and dout_vld;
          axis_beat_dec <= axis_ce and dout_vld;

          if(use_sw_length = '0') then
            next_axis_last    <= dout_end;
            next_axis_word_en <= dout_word_en;
            axis_word_vld     <= dout_word_en;
          else
            if(axis_beat_end = '0' and dout_end = '0') then  -- normal opperation
              next_axis_last    <= '0';
              next_axis_word_en <= (others => '1');
              axis_word_vld     <= dout_word_en;
            elsif(axis_beat_end = '0' and dout_end = '1') then  -- doing padding
              next_axis_last    <= '0';
              next_axis_word_en <= (others => '1');
              axis_word_vld     <= dout_word_en;
            elsif(axis_beat_end = '1' and dout_end = '0') then  -- doing discarding
              next_axis_last    <= '1';
              next_axis_word_en <= sw_last_word_en;
              axis_word_vld     <= sw_last_word_en;
            elsif(axis_beat_end = '1' and dout_end = '1') then  -- sw_length = hw_length
              -- We get here when the number of HW beats is equal to the number of
              -- SW beats. It doesn't necessary mean that sw_length = hw_length
              -- because the remainders can be different.
              -- In this case the enabled words (the ones which have tkeep
              -- at '1') are controled by SW. The valid words (the ones which
              -- are not forced to zero) are most restrictive one because
              -- padding or discarding can being carried out.
              next_axis_last    <= '1';
              next_axis_word_en <= sw_last_word_en;
              axis_word_vld     <= dout_word_en and sw_last_word_en;
            end if;
          end if;

        when discarding =>
          dout_rdy <= '1';

        when padding =>
          axis_we        <= '1';
          axis_beat_dec  <= axis_ce;
          next_axis_last <= axis_beat_end;
          if(axis_beat_end = '0') then
            next_axis_word_en <= (others => '1');
          else
            next_axis_word_en <= sw_last_word_en;
          end if;
        when others =>
      end case;
    end process;

    axis_ce <= not(axis_vld) or (axis_vld and axis_rdy);

    process(M_AXIS_ACLK, ap_rst_axi)
    begin
      if(ap_rst_axi = '1') then
        axis_vld <= '0';
      elsif(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        if(axis_ce = '1') then
          axis_vld <= axis_we;
        end if;
      end if;
    end process;

    process(M_AXIS_ACLK)
      constant BYTES_PER_WORD : integer := C_AP_ARG_DATA_WIDTH/8;
    begin
      if(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        if(axis_ce = '1') then
          axis_data <= (others => '0');
          for i in 0 to WORDS_PER_BEAT-1 loop
            if (axis_word_vld(i) = '1') then
              axis_data(C_AP_ARG_DATA_WIDTH*(i+1)-1 downto C_AP_ARG_DATA_WIDTH*i) <=
                dout(C_AP_ARG_DATA_WIDTH*(i+1)-1 downto C_AP_ARG_DATA_WIDTH*i);
            end if;
          end loop;
          axis_last <= next_axis_last;
          -- unroll axis_beat_en to get axis_keep
          for i in 0 to WORDS_PER_BEAT-1 loop
            axis_keep(BYTES_PER_WORD*(i+1)-1 downto BYTES_PER_WORD*i) <=
              (others => next_axis_word_en(i));
          end loop;
        end if;
      end if;
    end process;

    axis_rdy <= M_AXIS_TREADY;

  end generate AXI_WIDER_GEN;

  AXI_NARROWER_GEN : if (C_M_AXIS_TDATA_WIDTH < C_AP_ARG_DATA_WIDTH) generate
    signal tap_0       : std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    signal tap_0_we    : std_logic;
    signal tap_0_vld   : std_logic;
    signal tap_0_rdy   : std_logic;
    signal tap_0_start : std_logic;
    signal tap_0_end   : std_logic;

    constant FIFO_DATA_LSB  : integer := 0;
    constant FIFO_DATA_MSB  : integer := C_AP_ARG_DATA_WIDTH-1;
    constant FIFO_START_BIT : integer := FIFO_DATA_MSB+1;
    constant FIFO_END_BIT   : integer := FIFO_START_BIT+1;
    constant FIFO_WIDTH     : integer := FIFO_END_BIT+1;

    signal fifo_din      : std_logic_vector(FIFO_WIDTH-1 downto 0);
    signal fifo_din_vld  : std_logic;
    signal fifo_din_rdy  : std_logic;
    signal fifo_dout     : std_logic_vector(FIFO_WIDTH-1 downto 0);
    signal fifo_dout_vld : std_logic;
    signal fifo_dout_rdy : std_logic;

    type state_type is (
      -- pragma translate_off
      stop,
      -- pragma translate_on
      idle,
      running,
      pending_last);
    signal state : state_type;

    -- tap_0 is an extra position for the FIFO; substract one
    constant FIFO_DEPTH : integer := (2**C_AP_ARG_ADDR_WIDTH)-1;

    type axis_state_type is (
      -- pragma translate_off
      stop,
      -- pragma translate_on
      idle,
      running,
      discarding,
      padding);

    signal axis_state      : axis_state_type;
    signal apply_sw_length : std_logic;

    -- These are the signal for the FIFO output:
    signal dout       : std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    signal dout_start : std_logic;
    signal dout_end   : std_logic;
    signal dout_vld   : std_logic;
    signal dout_rdy   : std_logic;

    -- Next signals are used to implement a counter to count the
    -- axi beats needed to transmit each core word.
    constant BEATS_PER_WORD : integer := C_AP_ARG_DATA_WIDTH/C_M_AXIS_TDATA_WIDTH;
    constant BEAT_CNT_WIDTH : integer := log2(BEATS_PER_WORD);
    signal   beat_cnt       : unsigned(BEAT_CNT_WIDTH-1 downto 0);
    signal   beat_inc       : std_logic;
    signal   beat_clr       : std_logic;
    signal   beat_end       : std_logic;

    constant AXIS_WORD_CNT_WIDTH : integer := SW_LENGTH_WIDTH;

    -- AXI stream ap_word counter:
    signal axis_word_cnt : unsigned(AXIS_WORD_CNT_WIDTH-1 downto 0);
    signal axis_word_dec : std_logic;
    signal axis_word_clr : std_logic;
    signal axis_word_end : std_logic;

    -- Output stage control:
    signal axis_ce        : std_logic;
    signal axis_we        : std_logic;
    signal next_axis_last : std_logic;
    signal axis_word_vld  : std_logic;

  begin

    process(ap_clk)
    begin
      if(ap_clk'event and ap_clk = '1') then
        if(tap_0_we = '1') then
          tap_0 <= ap_oarg_din;
        end if;
      end if;
    end process;

    process(ap_clk, ap_rst)
    begin
      if(ap_rst = '1') then
        tap_0_vld <= '0';
      elsif(ap_clk'event and ap_clk = '1') then
        if(tap_0_vld = '0' or (tap_0_vld and tap_0_rdy) = '1') then
          tap_0_vld <= tap_0_we;
        end if;
      end if;
    end process;

    process(ap_clk, ap_rst)
    begin
      if(ap_rst = '1') then
        state       <= idle;
        tap_0_start <= '0';
        ap_arg_rqt  <= '1';
      elsif(ap_clk'event and ap_clk = '1') then
        case state is
          when idle =>
            if(ap_start = '1') then
              state       <= running;
              tap_0_start <= '1';
            end if;
          when running =>
            if(ap_done = '1') then
              if (ap_oarg_we = '0' and fifo_din_rdy = '1') then
                state <= idle;
              else
                state      <= pending_last;
                ap_arg_rqt <= '0';
              end if;
            end if;

            if((fifo_din_vld and fifo_din_rdy) = '1') then
              tap_0_start <= '0';
            end if;

          when pending_last =>
            if(tap_0_vld = '0' or (tap_0_vld and fifo_din_rdy) = '1') then
              state      <= idle;
              ap_arg_rqt <= '1';
            end if;
          when others =>
        end case;
      end if;
    end process;

    process(state, ap_oarg_we, tap_0_vld, fifo_din_rdy, ap_done)
    begin
      ap_oarg_full_n <= '0';

      tap_0_we  <= '0';
      tap_0_rdy <= '0';
      tap_0_end <= '0';

      fifo_din_vld <= '0';

      case state is
        when idle =>
          ap_oarg_full_n <= '1';

        when running =>
          -- We write in tap_0 when:
          --  1. it's empty or
          --  2. it's full and it's content can be transfered to the FIFO.
          -- Write is efective when these two conditions are met and new data arrives.
          tap_0_we <= ap_oarg_we and (not(tap_0_vld) or (tap_0_vld and fifo_din_rdy));

          -- We enable receiving new data if:
          -- 1. tap_0 is empty
          -- 2. tap_0 is full and its contents can be transfered to the FIFO
          ap_oarg_full_n <= not(tap_0_vld) or (tap_0_vld and fifo_din_rdy);

          -- Write in the FIFO when tap_0 is full and:
          --  1. arrived a new data value at the input or
          --  2. we've received the last data beat (ap_done = '1')
          fifo_din_vld <= tap_0_vld and (ap_oarg_we or ap_done);

          -- If write in the fifo is efective, we take the contents of tap_0:
          -- We take contents of tap_0 when FIFO accepts the data
          tap_0_rdy <= tap_0_vld and (ap_oarg_we or ap_done) and fifo_din_rdy;

          -- It's the last data if the write in the fifo is due to ap_done:
          tap_0_end <= tap_0_vld and ap_done;

        when pending_last =>
          tap_0_end <= '1';

          -- Write in the fifo when tap_0 is full and arrives a new data at the
          -- input:
          fifo_din_vld <= tap_0_vld;
          -- At that moment, we take the contents of tap_0:
          tap_0_rdy    <= tap_0_vld and fifo_din_rdy;

        when others =>
      end case;
    end process;

    fifo_din(FIFO_DATA_MSB downto FIFO_DATA_LSB) <= tap_0;
    fifo_din(FIFO_START_BIT)                     <= tap_0_start;
    fifo_din(FIFO_END_BIT)                       <= tap_0_end;

    FIFO_I : entity axis_accelerator_adapter_v2_1_16.s2s_async_fifo_wt
      generic map (
        C_FAMILY => C_FAMILY,
        C_MTBF_STAGES => C_MTBF_STAGES,
        DEPTH    => FIFO_DEPTH,
        WIDTH    => FIFO_WIDTH)
      port map (
        din      => fifo_din,
        din_vld  => fifo_din_vld,
        din_rdy  => fifo_din_rdy,
        wr_clk   => ap_clk,
        wr_rst   => ap_rst,
        dout     => fifo_dout,
        dout_vld => dout_vld,
        dout_rdy => dout_rdy,
        rd_clk   => M_AXIS_ACLK,
        rd_rst   => axis_rst);

    dout       <= fifo_dout(FIFO_DATA_MSB downto FIFO_DATA_LSB);
    dout_start <= fifo_dout(FIFO_START_BIT);
    dout_end   <= fifo_dout(FIFO_END_BIT);

    process(M_AXIS_ACLK)
    begin
      if(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        if(axis_word_clr = '1') then
          axis_word_cnt <= unsigned(xd_sw_length);
        elsif(axis_word_dec = '1') then
          axis_word_cnt <= axis_word_cnt-1;
        end if;
      end if;
    end process;

    axis_word_end <= '1' when (axis_word_cnt = 1) else '0';

    process(M_AXIS_ACLK, ap_rst_axi)
    begin
      if(ap_rst_axi = '1') then
        axis_state      <= idle;
        apply_sw_length <= '0';
      elsif(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        case axis_state is
          when idle =>
            -- Don't start until the first datum of a new frame
            -- is available:
            if((dout_vld and dout_start) = '1') then
              apply_sw_length <= use_sw_length;
              -- Wait for a valid SW length if it's going to be used
              if(use_sw_length = '1') then
                if(xd_sw_length_vld = '1') then
                  axis_state <= running;
                end if;
              else
                axis_state <= running;
              end if;
            end if;
          when running =>
            if((axis_ce and dout_vld and beat_end) = '1') then
              if(apply_sw_length = '0') then
                if(dout_end = '1') then
                  axis_state <= idle;
                end if;
              else
                if(axis_word_end = '0' and dout_end = '1') then
                  axis_state <= padding;
                elsif(axis_word_end = '1' and dout_end = '0') then
                  axis_state <= discarding;
                elsif(axis_word_end = '1' and dout_end = '1') then
                  axis_state <= idle;
                end if;
              end if;
            end if;
          when discarding =>
            if(dout_end = '1') then
              axis_state <= idle;
            end if;
          when padding =>
            if((axis_ce and axis_word_end and beat_end) = '1') then
              axis_state <= idle;
            end if;
          when others =>
        end case;
      end if;
    end process;

    process(axis_state, use_sw_length, dout_start, dout_vld, axis_ce, axis_word_end, dout_end, beat_end)
    begin
      xd_sw_length_rdy <= '0';
      axis_word_clr    <= '0';
      axis_word_dec    <= '0';
      dout_rdy         <= '0';
      axis_we          <= '0';
      next_axis_last   <= '0';
      axis_word_vld    <= '0';
      beat_inc         <= '0';

      case axis_state is
        when idle =>
          xd_sw_length_rdy <= use_sw_length and dout_start and dout_vld;
          axis_word_clr    <= '1';
        when running =>
          axis_word_clr <= '0';
          axis_we       <= dout_vld;

          -- Consume the FIFO output when the last beat of the ap_word is
          -- transfered to the output reg:
          dout_rdy      <= axis_ce and dout_vld and beat_end;
          axis_word_dec <= axis_ce and dout_vld and beat_end;
          beat_inc      <= axis_ce and dout_vld;

          if(use_sw_length = '0') then
            next_axis_last <= dout_end and beat_end;
            axis_word_vld  <= '1';
          else
            if(axis_word_end = '0' and dout_end = '0') then  -- normal opperation
              next_axis_last <= '0';
              axis_word_vld  <= '1';
            elsif(axis_word_end = '0' and dout_end = '1') then  -- doing padding
              next_axis_last <= '0';
              axis_word_vld  <= '1';
            elsif(axis_word_end = '1' and dout_end = '0') then  -- doing discarding
              next_axis_last <= beat_end;
              axis_word_vld  <= '1';
            elsif(axis_word_end = '1' and dout_end = '1') then  -- sw_length = hw_length
              next_axis_last <= beat_end;
              axis_word_vld  <= '1';
            end if;
          end if;
        when discarding =>
          dout_rdy <= '1';
        when padding =>
          axis_we       <= '1';
          axis_word_dec <= axis_ce and beat_end;
          beat_inc      <= axis_ce;

          next_axis_last <= axis_word_end and beat_end;
          axis_word_vld  <= '0';
        when others =>
      end case;
    end process;

    -- Increment beat_cnt each time a beat is transfered to the output tap:
    process(M_AXIS_ACLK, axis_rst)
    begin
      if(axis_rst = '1') then
        beat_cnt <= (others => '0');
      elsif(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        if(beat_inc = '1') then
          beat_cnt <= beat_cnt + 1;
        end if;
      end if;
    end process;

    beat_end <= '1' when (beat_cnt = BEATS_PER_WORD-1) else '0';

    axis_ce <= not(axis_vld) or (axis_vld and axis_rdy);

    process(M_AXIS_ACLK, axis_rst)
    begin
      if(axis_rst = '1') then
        axis_vld <= '0';
      elsif(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        if(axis_ce = '1') then
          axis_vld <= axis_we;
        end if;
      end if;
    end process;

    -- Output register:
    process(M_AXIS_ACLK)
      variable aux : std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    begin
      if(M_AXIS_ACLK'event and M_AXIS_ACLK = '1') then
        if(axis_ce = '1') then
          axis_data <= (others => '0');
          if(axis_word_vld = '1') then
            aux := fifo_dout(FIFO_DATA_MSB downto FIFO_DATA_LSB);
            for i in 0 to BEATS_PER_WORD-1 loop
              if (i = beat_cnt) then
                axis_data <= aux(C_M_AXIS_TDATA_WIDTH*(i+1)-1 downto C_M_AXIS_TDATA_WIDTH*i);
              end if;
            end loop;
          end if;
          axis_last <= next_axis_last;
        end if;
      end if;
    end process;

    axis_keep <= (others => '1');

    axis_rdy <= M_AXIS_TREADY;

  end generate AXI_NARROWER_GEN;

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : xd_m2s_adapter.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-10-25
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.xd_m2s_converter;
use axis_accelerator_adapter_v2_1_16.xd_m2s_memory_dc;




entity xd_m2s_adapter is
  generic (
    C_FAMILY               : string;         -- Xilinx FPGA family
    C_MTBF_STAGES          : integer;
    C_BRAM_TYPE            : string := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2
    C_SELECT_XPM           : integer := 1;
    C_M_AXIS_TDATA_WIDTH   : integer;
    C_M_AXIS_TUSER_WIDTH   : integer;
    C_M_AXIS_TID_WIDTH     : integer;
    C_M_AXIS_TDEST_WIDTH   : integer;
    C_AP_ARG_DATA_WIDTH    : integer;
    C_AP_ARG_ADDR_WIDTH    : integer;
    C_MULTIBUFFER_DEPTH    : integer;
    C_AP_ARG_WIDTH         : integer;
    C_AP_ARG_N_DIM         : integer;
    C_AP_ARG_DIMS          : int_vector;
    C_AP_ARG_DIM_1         : integer;
    C_AP_ARG_DIM_2         : integer;
    C_AP_ARG_FORMAT_TYPE   : integer;
    C_AP_ARG_FORMAT_FACTOR : integer;
    C_AP_ARG_FORMAT_DIM    : integer);
  port (
    -- Output streams
    M_AXIS_ACLK     : in  std_logic;
    M_AXIS_ARESETN  : in  std_logic;
    M_AXIS_TVALID   : out std_logic;
    M_AXIS_TREADY   : in  std_logic;
    M_AXIS_TDATA    : out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
    M_AXIS_TSTRB    : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    M_AXIS_TKEEP    : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    M_AXIS_TLAST    : out std_logic;
    M_AXIS_TID      : out std_logic_vector(C_M_AXIS_TID_WIDTH-1 downto 0);
    M_AXIS_TDEST    : out std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0);
    M_AXIS_TUSER    : out std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0);
    sw_length       : in  std_logic_vector(31 downto 0);
    sw_length_we    : in  std_logic;
    use_sw_length   : in  std_logic;
    host_oarg_tdest : in  std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0);
    ap_clk          : in  std_logic;
    ap_rst_sync     : in  std_logic;
    ap_rst          : in  std_logic;
    ap_arg_addr     : in  std_logic_vector(C_AP_ARG_ADDR_WIDTH-1 downto 0);
    ap_arg_ce       : in  std_logic;
    ap_arg_we       : in  std_logic;
    ap_arg_din      : in  std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    ap_arg_dout     : out std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    ap_arg_rqt      : out std_logic;
    ap_arg_ack      : in  std_logic;
    ap_arg_empty    : out std_logic;
    ap_arg_full     : out std_logic;
    ap_arg_used     : out std_logic_vector(3 downto 0));  -- Number of used buffers
end entity;

architecture rtl of xd_m2s_adapter is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";

  function calc_axi_addr_width return integer is
    variable addr_width : integer := 0;
  begin
    if (C_M_AXIS_TDATA_WIDTH > C_AP_ARG_DATA_WIDTH) then
      addr_width := C_AP_ARG_ADDR_WIDTH-log2(C_M_AXIS_TDATA_WIDTH/C_AP_ARG_DATA_WIDTH);
    else
      addr_width := C_AP_ARG_ADDR_WIDTH+log2(C_AP_ARG_DATA_WIDTH/C_M_AXIS_TDATA_WIDTH);
    end if;
    return addr_width;
  end function calc_axi_addr_width;

  constant AXI_DATA_WIDTH : integer := C_M_AXIS_TDATA_WIDTH;
  constant AXI_ADDR_WIDTH : integer := calc_axi_addr_width;
  constant SIZE_WIDTH     : integer := C_AP_ARG_ADDR_WIDTH+1+log2(C_AP_ARG_DATA_WIDTH/8);

--  signal ap_rst_sync1   : std_logic;
--  signal ap_rst_sync  : std_logic;
  signal axis_rst2            : std_logic;
  signal axis_rst1            : std_logic;
  signal conv_addr    : std_logic_vector(AXI_ADDR_WIDTH-1 downto 0);
  signal conv_ce      : std_logic;
  signal conv_we      : std_logic;
  signal conv_last    : std_logic;
  signal conv_rdy     : std_logic;
  signal conv_data    : std_logic_vector(AXI_DATA_WIDTH-1 downto 0);
  -- Number of bytes written by accelerator
  signal conv_size    : std_logic_vector(SIZE_WIDTH-1 downto 0);
  signal axis_rst     : std_logic;
  signal ap_arg_rqt_i : std_logic;
      ATTRIBUTE async_reg           : STRING;
  ATTRIBUTE async_reg OF axis_rst  : SIGNAL IS "true";
  ATTRIBUTE async_reg OF axis_rst1  : SIGNAL IS "true";
 -- ATTRIBUTE async_reg OF ap_rst_sync  : SIGNAL IS "true";
 -- ATTRIBUTE async_reg OF ap_rst_sync1  : SIGNAL IS "true";


begin

--      prd1: PROCESS (M_AXIS_ACLK, ap_rst)
--      BEGIN
--       -- Register Stage #1 
--        IF (ap_rst = '1') THEN
--          ap_rst_sync1 <= '1';
--          ap_rst_sync <= '1';
--        ELSIF (M_AXIS_ACLK'event and M_AXIS_ACLK = '1') THEN
--          ap_rst_sync1 <= '0';
--          ap_rst_sync <= ap_rst_sync1;
--        END IF;
--        END PROCESS prd1;


	
--      prd1: PROCESS (M_AXIS_ACLK)
--      BEGIN
--       -- Register Stage #1 
--        IF (M_AXIS_ACLK'event and M_AXIS_ACLK = '1') THEN
--          ap_rst_sync1 <= ap_rst;
--          ap_rst_sync <= ap_rst_sync1;
--        END IF;
--        END PROCESS prd1;


	axis_rst2 <= not(M_AXIS_ARESETN) or ap_rst_sync; 

      prd2: PROCESS (M_AXIS_ACLK, axis_rst2)
      BEGIN
       -- Register Stage #1 
        IF (axis_rst2 = '1') THEN
          axis_rst1 <= '1';
          axis_rst <= '1';
        ELSIF (M_AXIS_ACLK'event and M_AXIS_ACLK = '1') THEN
          axis_rst1 <= '0';
          axis_rst <= axis_rst1;
        END IF;
        END PROCESS prd2;




  
  --      rst_sync : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
  --      generic map (
  --      C_CDC_TYPE                 => 0,
  --      C_RESET_STATE              => 1,
  --      C_SINGLE_BIT               => 1,
  --      C_FLOP_INPUT               => 0,
  --      C_VECTOR_WIDTH             => 1,
  --      C_MTBF_STAGES              => 2
  --      )
  --      port map (
  --      prmry_aclk                 => '0',
  --      prmry_resetn               => '0',
  --      prmry_in                   => ap_rst,
  --      prmry_vect_in              => (others=>'0'),

  --      scndry_aclk                => M_AXIS_ACLK,
  --      scndry_resetn              => axisn_rst,
  --      scndry_out                 => axis_rst,
  --      scndry_vect_out            => open
  --      );


  CONVERTER_I : entity axis_accelerator_adapter_v2_1_16.xd_m2s_converter
    generic map (
      C_FAMILY       => C_FAMILY,
      SIZE_WIDTH     => SIZE_WIDTH,
      AXI_DATA_WIDTH => AXI_DATA_WIDTH,
      AXI_ADDR_WIDTH => AXI_ADDR_WIDTH,
      AXI_USER_WIDTH => C_M_AXIS_TUSER_WIDTH,
      AXI_ID_WIDTH   => C_M_AXIS_TID_WIDTH,
      AXI_DEST_WIDTH => C_M_AXIS_TDEST_WIDTH)
    port map (
      axi_clk         => M_AXIS_ACLK,
      axi_rst         => axis_rst,
      axis_vld        => M_AXIS_TVALID,
      axis_rdy        => M_AXIS_TREADY,
      axis_data       => M_AXIS_TDATA,
      axis_keep       => M_AXIS_TKEEP,
      axis_strb       => M_AXIS_TSTRB,
      axis_last       => M_AXIS_TLAST,
      axis_id         => M_AXIS_TID,
      axis_dest       => M_AXIS_TDEST,
      axis_user       => M_AXIS_TUSER,
      conv_size       => conv_size,
      conv_addr       => conv_addr,
      conv_ce         => conv_ce,
      conv_we         => conv_we,
      conv_last       => conv_last,
      conv_rdy        => conv_rdy,
      conv_data       => conv_data,
      host_oarg_tdest => host_oarg_tdest);

  MEM_CTRL_I : entity axis_accelerator_adapter_v2_1_16.xd_m2s_memory_dc
    generic map (
      -- System generics:
      C_FAMILY               => C_FAMILY,
      C_MTBF_STAGES          => C_MTBF_STAGES,
      C_SELECT_XPM           => C_SELECT_XPM,
      C_BRAM_TYPE            => C_BRAM_TYPE,
      SIZE_WIDTH             => SIZE_WIDTH,
      CONV_DATA_WIDTH        => AXI_DATA_WIDTH,
      CONV_ADDR_WIDTH        => AXI_ADDR_WIDTH,
      C_AP_ARG_DATA_WIDTH    => C_AP_ARG_DATA_WIDTH,
      C_AP_ARG_ADDR_WIDTH    => C_AP_ARG_ADDR_WIDTH,
      C_MULTIBUFFER_DEPTH    => C_MULTIBUFFER_DEPTH,
      C_AP_ARG_WIDTH         => C_AP_ARG_WIDTH,
      C_AP_ARG_N_DIM         => C_AP_ARG_N_DIM,
      C_AP_ARG_DIMS          => C_AP_ARG_DIMS,
      C_AP_ARG_DIM_1         => C_AP_ARG_DIM_1,
      C_AP_ARG_DIM_2         => C_AP_ARG_DIM_2,
      C_AP_ARG_FORMAT_TYPE   => C_AP_ARG_FORMAT_TYPE,
      C_AP_ARG_FORMAT_FACTOR => C_AP_ARG_FORMAT_FACTOR,
      C_AP_ARG_FORMAT_DIM    => C_AP_ARG_FORMAT_DIM,
      C_NONE                 => 2)
    port map (
      clk           => M_AXIS_ACLK,
      rst           => axis_rst,
      conv_size     => conv_size,
      conv_addr     => conv_addr,
      conv_ce       => conv_ce,
      conv_we       => conv_we,
      conv_last     => conv_last,
      conv_rdy      => conv_rdy,
      conv_data     => conv_data,
      sw_length     => sw_length,
      sw_length_we  => sw_length_we,
      use_sw_length => use_sw_length,
      ap_clk        => ap_clk,
      ap_rst        => ap_rst,
      ap_arg_addr   => ap_arg_addr,
      ap_arg_ce     => ap_arg_ce,
      ap_arg_we     => ap_arg_we,
      ap_arg_din    => ap_arg_din,
      ap_arg_dout   => ap_arg_dout,
      ap_arg_rqt    => ap_arg_rqt_i,
      ap_arg_ack    => ap_arg_ack,
      ap_arg_empty  => ap_arg_empty,
      ap_arg_full   => ap_arg_full,
      ap_arg_used   => ap_arg_used);

  ap_arg_rqt <= ap_arg_rqt_i;

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : xd_input_scalars_fifo.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2012-11-04
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;

library fifo_generator_v13_1_4;
use fifo_generator_v13_1_4.all;


entity xd_input_scalars_fifo is
  generic (
    C_FAMILY : string  := "virtex6";
    C_MTBF_STAGES : integer  := 4;
    WIDTH    : integer := 16);
  port (
    din      : in  std_logic_vector(WIDTH-1 downto 0);
    din_vld  : in  std_logic;
    din_rdy  : out std_logic;
    wr_used  : out std_logic_vector(3 downto 0);
    wr_empty : out std_logic;
    wr_full  : out std_logic;
    wr_clk   : in  std_logic;
    dout     : out std_logic_vector(WIDTH-1 downto 0);
    dout_vld : out std_logic;
    dout_rdy : in  std_logic;
    rd_clk   : in  std_logic;
    rst      : in  std_logic);
end xd_input_scalars_fifo;

architecture rtl of xd_input_scalars_fifo is


  constant DEPTH      : integer := 16;
  constant FIFO_DEPTH : integer := calc_fifo_depth(DEPTH)+ 1;
  constant ADDR_BITS  : integer := log2(FIFO_DEPTH);

  signal rst_vec : std_logic_vector(0 downto 0);
  signal wr_rst_vec : std_logic_vector(0 downto 0);
  signal rd_rst_vec : std_logic_vector(0 downto 0);
  signal wr_rst : std_logic;
  signal rd_rst : std_logic;
  signal rd_addr : unsigned(ADDR_BITS-1 downto 0);
  signal wr_addr : unsigned(ADDR_BITS-1 downto 0);

  -- Next signals are gray values:
  signal wr_gray       : std_logic_vector(ADDR_BITS-1 downto 0);
  signal next_wr_gray  : std_logic_vector(ADDR_BITS-1 downto 0);
  signal wr_gray_ahead : std_logic_vector(ADDR_BITS-1 downto 0);

  signal rd_gray      : std_logic_vector(ADDR_BITS-1 downto 0);
  signal next_rd_gray : std_logic_vector(ADDR_BITS-1 downto 0);
  signal prev_rd_gray : std_logic_vector(ADDR_BITS-1 downto 0);

  signal fifo_we : std_logic;
  signal fifo_re : std_logic;

  signal din_rdy_i  : std_logic;
  signal empty_i    : std_logic;
  signal rd_en      : std_logic;
  signal dout_vld_i : std_logic;
  signal empty : std_logic;
  signal rd_en_dly : std_logic;
  signal wr_en_dly : std_logic;
  signal din_dly : std_logic_vector(WIDTH-1 downto 0);
  signal full : std_logic;
  signal rstn : std_logic;

  signal almost_full :std_logic;    
  signal wr_ack :std_logic;    
  signal overflow :std_logic;    
  signal almost_empty :std_logic;    
  signal valid :std_logic;    
  signal underflow :std_logic;    
  signal data_count :std_logic_vector(ADDR_BITS-1 downto 0);    
  signal rd_data_count :std_logic_vector(ADDR_BITS-1 downto 0);    
  signal wr_data_count :std_logic_vector(ADDR_BITS-1 downto 0);    
  signal prog_full :std_logic;    
  signal prog_empty :std_logic;    
  signal sbiterr :std_logic;    
  signal dbiterr :std_logic;    
  signal wr_rst_busy :std_logic;    
  signal rd_rst_busy :std_logic;    
  signal m_axi_awid :std_logic_vector(0 downto 0);    
  signal m_axi_awaddr :std_logic_vector(31 downto 0);    
  signal m_axi_awlen :std_logic_vector(7 downto 0);    
  signal m_axi_awsize :std_logic_vector(2 downto 0);    
  signal m_axi_awburst :std_logic_vector(1 downto 0);    
  signal m_axi_awlock :std_logic_vector(0 downto 0);    
  signal m_axi_awcache :std_logic_vector(3 downto 0);    
  signal m_axi_awprot :std_logic_vector(2 downto 0);    
  signal m_axi_awqos :std_logic_vector(3 downto 0);    
  signal m_axi_awregion :std_logic_vector(3 downto 0);    
  signal m_axi_awuser :std_logic_vector(0 downto 0);    
  signal m_axi_awvalid :std_logic;
  signal m_axi_wid :std_logic_vector(0 downto 0);    
  signal m_axi_wdata :std_logic_vector(63 downto 0);    
  signal m_axi_wstrb :std_logic_vector(7 downto 0);    
  signal m_axi_wlast :std_logic;
  signal m_axi_wuser :std_logic_vector(0 downto 0);    
  signal m_axi_wvalid :std_logic;
  signal m_axi_bready :std_logic;
  signal s_axi_awready :std_logic;
  signal s_axi_wready :std_logic;
  signal s_axi_bid :std_logic_vector(0 downto 0);    
  signal s_axi_bresp :std_logic_vector(1 downto 0);    
  signal s_axi_buser :std_logic_vector(0 downto 0);    
  signal m_axi_arid :std_logic_vector(0 downto 0);    
  signal m_axi_araddr :std_logic_vector(31 downto 0);    
  signal m_axi_arlen :std_logic_vector(7 downto 0);    
  signal m_axi_arsize :std_logic_vector(2 downto 0);    
  signal m_axi_arburst :std_logic_vector(1 downto 0);    
  signal m_axi_arlock :std_logic_vector(0 downto 0);    
  signal m_axi_arcache :std_logic_vector(3 downto 0);    
  signal m_axi_arprot :std_logic_vector(2 downto 0);    
  signal m_axi_arqos :std_logic_vector(3 downto 0);    
  signal m_axi_arregion :std_logic_vector(3 downto 0);    
  signal m_axi_aruser :std_logic_vector(0 downto 0);    
  signal m_axi_arvalid :std_logic;
  signal m_axi_rready :std_logic;
  signal s_axi_arready :std_logic;
  signal s_axi_rid :std_logic_vector(0 downto 0);    
  signal s_axi_rdata :std_logic_vector(63 downto 0);    
  signal s_axi_rresp :std_logic_vector(1 downto 0);    
  signal s_axi_rlast :std_logic;
  signal s_axi_ruser :std_logic_vector(0 downto 0);    
  signal m_axis_tvalid :std_logic;
  signal m_axis_tdata :std_logic_vector(7 downto 0);    
  signal m_axis_tstrb :std_logic_vector(0 downto 0);    
  signal m_axis_tlast :std_logic;
  signal m_axis_tkeep :std_logic_vector(0 downto 0);    
  signal m_axis_tid :std_logic_vector(0 downto 0);    
  signal m_axis_tdest :std_logic_vector(0 downto 0);    
  signal m_axis_tuser :std_logic_vector(3 downto 0);    
  signal s_axis_tready :std_logic;
  signal axi_aw_data_count :std_logic_vector(4 downto 0);    
  signal axi_aw_wr_data_count :std_logic_vector(4 downto 0);    
  signal axi_aw_rd_data_count :std_logic_vector(4 downto 0);    
  signal axi_aw_sbiterr :std_logic;    
  signal axi_aw_dbiterr :std_logic;    
  signal axi_aw_overflow :std_logic;    
  signal axi_aw_underflow :std_logic;    
  signal axi_aw_prog_full :std_logic;    
  signal axi_aw_prog_empty :std_logic;    
  signal axi_w_data_count :std_logic_vector(10 downto 0);    
  signal axi_w_wr_data_count :std_logic_vector(10 downto 0);    
  signal axi_w_rd_data_count :std_logic_vector(10 downto 0);    
  signal axi_w_sbiterr :std_logic;    
  signal axi_w_dbiterr :std_logic;    
  signal axi_w_overflow :std_logic;    
  signal axi_w_underflow :std_logic;    
  signal axi_w_prog_full :std_logic;    
  signal axi_w_prog_empty :std_logic;    
  signal axi_b_data_count :std_logic_vector(4 downto 0);    
  signal axi_b_wr_data_count :std_logic_vector(4 downto 0);    
  signal axi_b_rd_data_count :std_logic_vector(4 downto 0);    
  signal axi_b_sbiterr :std_logic;    
  signal axi_b_dbiterr :std_logic;    
  signal axi_b_overflow :std_logic;    
  signal axi_b_underflow :std_logic;    
  signal axi_b_prog_full :std_logic;    
  signal axi_b_prog_empty :std_logic;    
  signal axi_ar_data_count :std_logic_vector(4 downto 0);    
  signal axi_ar_wr_data_count :std_logic_vector(4 downto 0);    
  signal axi_ar_rd_data_count :std_logic_vector(4 downto 0);    
  signal axi_ar_sbiterr :std_logic;    
  signal axi_ar_dbiterr :std_logic;    
  signal axi_ar_overflow :std_logic;    
  signal axi_ar_underflow :std_logic;    
  signal axi_ar_prog_full :std_logic;    
  signal axi_ar_prog_empty :std_logic;    
  signal axi_r_data_count :std_logic_vector(10 downto 0);    
  signal axi_r_wr_data_count :std_logic_vector(10 downto 0);    
  signal axi_r_rd_data_count :std_logic_vector(10 downto 0);    
  signal axi_r_sbiterr :std_logic;    
  signal axi_r_dbiterr :std_logic;    
  signal axi_r_overflow :std_logic;    
  signal axi_r_underflow :std_logic;    
  signal axi_r_prog_full :std_logic;    
  signal axi_r_prog_empty :std_logic;    
  signal axis_data_count :std_logic_vector(10 downto 0);    
  signal axis_wr_data_count :std_logic_vector(10 downto 0);    
  signal axis_rd_data_count :std_logic_vector(10 downto 0);    
  signal axis_sbiterr :std_logic;    
  signal axis_dbiterr :std_logic;    
  signal axis_overflow :std_logic;    
  signal axis_underflow :std_logic;    
  signal axis_prog_full :std_logic;    
  signal axis_prog_empty :std_logic;    

  type   mem_type is array (2**ADDR_BITS-1 downto 0) of std_logic_vector (WIDTH-1 downto 0);
  signal mem : mem_type;

  attribute ram_style        : string;
  attribute ram_style of mem : signal is "distributed";

  signal mem_dout : std_logic_vector(WIDTH-1 downto 0);

  -- Read gray counter synchronized with write clock.
  signal reg_rd_gray : std_logic_vector(ADDR_BITS-1 downto 0);

  signal rd_gray_sync : std_logic_vector(ADDR_BITS-1 downto 0);
  signal rd_bin       : unsigned(ADDR_BITS-1 downto 0);
  signal wr_bin       : unsigned(ADDR_BITS-1 downto 0);
  signal ptr_dist     : unsigned(ADDR_BITS-1 downto 0);
  signal wr_used_i     : std_logic_vector(ADDR_BITS-1 downto 0);

  signal wr_empty_i : std_logic;
  constant C_EXTRA_SYNCS      : integer := 5;

begin

EXISTING : if (C_EXTRA_SYNCS = 0) generate

begin

  fifo_we <= din_vld and din_rdy_i;

  process(wr_clk, rst)
  begin
    if(rst = '1') then
      wr_addr <= (others => '0');
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_addr <= wr_addr + 1;
      end if;
    end if;
  end process;

  fifo_re <= rd_en and not(empty_i);

  process(rd_clk, rst)
  begin
    if(rst = '1') then
      rd_addr <= (others => '0');
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        rd_addr <= rd_addr + 1;
      end if;
    end if;
  end process;

  ---------------------------------------------------------

  process(rd_clk, rst)
  begin
    if(rst = '1') then
      next_rd_gray <= bin2gray(2**ADDR_BITS-1, ADDR_BITS);
      rd_gray      <= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
      prev_rd_gray <= bin2gray(2**ADDR_BITS-3, ADDR_BITS);
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        prev_rd_gray <= rd_gray;
        rd_gray      <= next_rd_gray;
        next_rd_gray <= bin2gray(std_logic_vector(rd_addr));
      end if;
    end if;
  end process;

  process(wr_clk, rst)
  begin
    if(rst = '1') then
      next_wr_gray <= bin2gray(2**ADDR_BITS-1, ADDR_BITS);
      wr_gray      <= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_gray      <= next_wr_gray;
        next_wr_gray <= bin2gray(std_logic_vector(wr_addr));
      end if;
    end if;
  end process;

  process(wr_clk, rst)
  begin
    if(rst = '1') then
      wr_gray_ahead <= bin2gray(2**ADDR_BITS-0, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_gray_ahead <= gray_inc(wr_gray_ahead);
      end if;
    end if;
  end process;

  -----------------------------------------------------------------

  process(wr_clk, rst)
  begin
    if(rst = '1') then
      din_rdy_i <= '0';
    elsif(wr_clk'event and wr_clk = '1') then
      if(din_rdy_i = '1') then
        if (wr_gray_ahead = prev_rd_gray) then
          din_rdy_i <= not(fifo_we);
        else
          din_rdy_i <= '1';
        end if;
      else
        if (wr_gray_ahead = rd_gray) then
          din_rdy_i <= '0';
        else
          din_rdy_i <= '1';
        end if;
      end if;
    end if;
  end process;

  din_rdy <= din_rdy_i;

  process(rd_clk, rst)
  begin
    if(rst = '1') then
      empty_i <= '1';
    elsif(rd_clk'event and rd_clk = '1') then
      if(empty_i = '0') then
        if(next_rd_gray = wr_gray) then
          empty_i <= fifo_re;
        else
          empty_i <= '0';
        end if;
      else
        if(rd_gray = wr_gray) then
          empty_i <= '1';
        else
          empty_i <= '0';
        end if;
      end if;
    end if;
  end process;

  rd_en <= not(dout_vld_i) or (dout_vld_i and dout_rdy);
  process(rd_clk, rst)
  begin
    if(rst = '1') then
      dout_vld_i <= '0';
    elsif(rd_clk'event and rd_clk = '1') then
      if(rd_en = '1') then
        dout_vld_i <= not(empty_i);
      end if;
    end if;
  end process;

  dout_vld <= dout_vld_i;

  -----------------------------------------------------------------------
  -- Memory bank modeling. Tool to infer the memory.

  process(wr_clk)
  begin
    if(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        mem(to_integer(wr_addr)) <= din;
      end if;
    end if;
  end process;

  mem_dout <= mem(to_integer(rd_addr));

  process(rd_clk, rst)
  begin
    if(rst = '1') then
      dout <= (others => '0');
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        dout <= mem_dout;
      end if;
    end if;
  end process;

  -----------------------------------------------------------------------

  process(rd_clk, rst)
  begin
    if(rst = '1') then
      reg_rd_gray <= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
    elsif(rd_clk'event and rd_clk = '1') then
      if(rd_en = '1') then
        reg_rd_gray <= rd_gray;
      end if;
    end if;
  end process;

  process(wr_clk, rst)
  begin
    if(rst = '1') then
      rd_gray_sync <= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      rd_gray_sync <= reg_rd_gray;
    end if;
  end process;

  rd_bin <= unsigned(gray2bin(rd_gray_sync));

  process(wr_clk, rst)
  begin
    if(rst = '1') then
      wr_bin <= to_unsigned(2**ADDR_BITS-2, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      if (fifo_we = '1') then
        wr_bin <= wr_bin + 1;
      end if;
    end if;
  end process;

  process(wr_clk, rst)
  begin
    if(rst = '1') then
      ptr_dist <= (others => '0');
    elsif(wr_clk'event and wr_clk = '1') then
      if (fifo_we = '1') then
        ptr_dist <= ptr_dist + 1;
      else
        ptr_dist <= wr_bin - rd_bin;
      end if;
    end if;
  end process;

  wr_used <= std_logic_vector(ptr_dist);
  wr_full <= not(din_rdy_i);

  process(wr_clk, rst)
  begin
    if(rst = '1') then
      wr_empty_i <= '1';
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_empty_i <= '0';
      else
        if(rd_gray_sync = wr_gray) then
          wr_empty_i <= '1';
        else
          wr_empty_i <= '0';
        end if;
      end if;
    end if;
  end process;

  wr_empty <= wr_empty_i;

end generate EXISTING;


NEW_INTRO : if (C_EXTRA_SYNCS = 2) generate
 begin  

   rst_vec(0) <= rst;
   wr_rst <= wr_rst_vec(0);
   rd_rst <= rd_rst_vec(0);

    wr_rst_sync: ENTITY axis_accelerator_adapter_v2_1_16.synchronizer_ff
    GENERIC MAP (
     C_HAS_RST => 0,
     C_WIDTH   => 1
     )
    PORT MAP ( 
     RST       => open,
     CLK       => wr_clk,   
     D         => rst_vec,
     Q         => wr_rst_vec
     );    

    rd_rst_sync: ENTITY axis_accelerator_adapter_v2_1_16.synchronizer_ff
    GENERIC MAP (
     C_HAS_RST => 0,
     C_WIDTH   => 1
     )
    PORT MAP ( 
     RST       => open,
     CLK       => rd_clk,   
     D         => rst_vec,
     Q         => rd_rst_vec
     );    


  fifo_we <= din_vld and din_rdy_i;

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      wr_addr <= (others => '0');
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_addr <= wr_addr + 1;
      end if;
    end if;
  end process;

  fifo_re <= rd_en and not(empty_i);

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      rd_addr <= (others => '0');
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        rd_addr <= rd_addr + 1;
      end if;
    end if;
  end process;

  ---------------------------------------------------------

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      next_rd_gray <= bin2gray(2**ADDR_BITS-1, ADDR_BITS);
      rd_gray      <= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
      prev_rd_gray <= bin2gray(2**ADDR_BITS-3, ADDR_BITS);
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        prev_rd_gray <= rd_gray;
        rd_gray      <= next_rd_gray;
        next_rd_gray <= bin2gray(std_logic_vector(rd_addr));
      end if;
    end if;
  end process;

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      next_wr_gray <= bin2gray(2**ADDR_BITS-1, ADDR_BITS);
      wr_gray      <= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_gray      <= next_wr_gray;
        next_wr_gray <= bin2gray(std_logic_vector(wr_addr));
      end if;
    end if;
  end process;

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      wr_gray_ahead <= bin2gray(2**ADDR_BITS-0, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_gray_ahead <= gray_inc(wr_gray_ahead);
      end if;
    end if;
  end process;

  -----------------------------------------------------------------

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      din_rdy_i <= '0';
    elsif(wr_clk'event and wr_clk = '1') then
      if(din_rdy_i = '1') then
        if (wr_gray_ahead = prev_rd_gray) then
          din_rdy_i <= not(fifo_we);
        else
          din_rdy_i <= '1';
        end if;
      else
        if (wr_gray_ahead = rd_gray) then
          din_rdy_i <= '0';
        else
          din_rdy_i <= '1';
        end if;
      end if;
    end if;
  end process;

  din_rdy <= din_rdy_i;

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      empty_i <= '1';
    elsif(rd_clk'event and rd_clk = '1') then
      if(empty_i = '0') then
        if(next_rd_gray = wr_gray) then
          empty_i <= fifo_re;
        else
          empty_i <= '0';
        end if;
      else
        if(rd_gray = wr_gray) then
          empty_i <= '1';
        else
          empty_i <= '0';
        end if;
      end if;
    end if;
  end process;

  rd_en <= not(dout_vld_i) or (dout_vld_i and dout_rdy);
  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      dout_vld_i <= '0';
    elsif(rd_clk'event and rd_clk = '1') then
      if(rd_en = '1') then
        dout_vld_i <= not(empty_i);
      end if;
    end if;
  end process;

  dout_vld <= dout_vld_i;

  -----------------------------------------------------------------------
  -- Memory bank modeling. Tool to infer the memory.

  process(wr_clk)
  begin
    if(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        mem(to_integer(wr_addr)) <= din;
      end if;
    end if;
  end process;

  mem_dout <= mem(to_integer(rd_addr));

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      dout <= (others => '0');
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        dout <= mem_dout;
      end if;
    end if;
  end process;

  -----------------------------------------------------------------------

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      reg_rd_gray <= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
    elsif(rd_clk'event and rd_clk = '1') then
      if(rd_en = '1') then
        reg_rd_gray <= rd_gray;
      end if;
    end if;
  end process;

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      rd_gray_sync <= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      rd_gray_sync <= reg_rd_gray;
    end if;
  end process;

  rd_bin <= unsigned(gray2bin(rd_gray_sync));

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      wr_bin <= to_unsigned(2**ADDR_BITS-2, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      if (fifo_we = '1') then
        wr_bin <= wr_bin + 1;
      end if;
    end if;
  end process;

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      ptr_dist <= (others => '0');
    elsif(wr_clk'event and wr_clk = '1') then
      if (fifo_we = '1') then
        ptr_dist <= ptr_dist + 1;
      else
        ptr_dist <= wr_bin - rd_bin;
      end if;
    end if;
  end process;

  wr_used <= std_logic_vector(ptr_dist(3 downto 0));
  wr_full <= not(din_rdy_i);

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      wr_empty_i <= '1';
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_empty_i <= '0';
      else
        if(rd_gray_sync = wr_gray) then
          wr_empty_i <= '1';
        else
          wr_empty_i <= '0';
        end if;
      end if;
    end if;
  end process;


  wr_empty <= wr_empty_i;


end generate NEW_INTRO;




NEW_INTRO3 : if (C_EXTRA_SYNCS = 5) generate
 begin  

    rstn  <= not(rst);
    din_rdy  <= not(full);
    din_rdy_i  <= not(full);
    wr_full  <= (full);
    wr_empty  <= (empty);
    dout_vld <= not(empty);
    wr_en_dly <= din_vld ;--AFTER 100ps;
    rd_en_dly <= dout_rdy ;--AFTER 100ps;
    din_dly <= din ;--AFTER 100ps;
    wr_used <= wr_used_i(3 downto 0);



  FIF_DMG_INST : entity fifo_generator_v13_1_4.fifo_generator_v13_1_4
    GENERIC MAP (
      C_COMMON_CLOCK => 0,
      C_COUNT_TYPE => 0,
      C_DATA_COUNT_WIDTH => 4,
      C_DEFAULT_VALUE => "BlankString",
      C_DIN_WIDTH => WIDTH,
      C_DOUT_RST_VAL => "0",
      C_DOUT_WIDTH => WIDTH,
      C_ENABLE_RLOCS => 0,
      C_FAMILY => C_FAMILY,
      C_FULL_FLAGS_RST_VAL => 0,
      C_HAS_ALMOST_EMPTY => 0,
      C_HAS_ALMOST_FULL => 0,
      C_HAS_BACKUP => 0,
      C_HAS_DATA_COUNT => 0,
      C_HAS_INT_CLK => 0,
      C_HAS_MEMINIT_FILE => 0,
      C_HAS_OVERFLOW => 0,
      C_HAS_RD_DATA_COUNT => 0,
      C_HAS_RD_RST => 0,
      C_HAS_RST => 1,
      C_HAS_SRST => 0,
      C_HAS_UNDERFLOW => 0,
      C_HAS_VALID => 0,
      C_HAS_WR_ACK => 0,
      C_HAS_WR_DATA_COUNT => 1,
      C_HAS_WR_RST => 0,
      C_IMPLEMENTATION_TYPE => 2,
      C_INIT_WR_PNTR_VAL => 0,
      C_MEMORY_TYPE => 2,
      C_MIF_FILE_NAME => "BlankString",
      C_OPTIMIZATION_MODE => 0,
      C_OVERFLOW_LOW => 0,
      C_PRELOAD_LATENCY => 0,
      C_PRELOAD_REGS => 1,
      C_PRIM_FIFO_TYPE => "512x36",
      C_PROG_EMPTY_THRESH_ASSERT_VAL => 2,
      C_PROG_EMPTY_THRESH_NEGATE_VAL => 3,
      C_PROG_EMPTY_TYPE => 0,
      C_PROG_FULL_THRESH_ASSERT_VAL => 29,
      C_PROG_FULL_THRESH_NEGATE_VAL => 28,
      C_PROG_FULL_TYPE => 0,
      C_RD_DATA_COUNT_WIDTH => ADDR_BITS,
      C_RD_DEPTH => FIFO_DEPTH,
      C_RD_FREQ => 1,
      C_RD_PNTR_WIDTH => ADDR_BITS,
      C_UNDERFLOW_LOW => 0,
      C_USE_DOUT_RST => 1,
      C_USE_ECC => 0,
      C_USE_EMBEDDED_REG => 0,
      C_USE_PIPELINE_REG => 0,
      C_POWER_SAVING_MODE => 0,
      C_USE_FIFO16_FLAGS => 0,
      C_USE_FWFT_DATA_COUNT => 1,
      C_VALID_LOW => 0,
      C_WR_ACK_LOW => 0,
      C_WR_DATA_COUNT_WIDTH => ADDR_BITS,
      C_WR_DEPTH => FIFO_DEPTH,
      C_WR_FREQ => 1,
      C_WR_PNTR_WIDTH => ADDR_BITS,
      C_WR_RESPONSE_LATENCY => 1,
      C_MSGON_VAL => 1,
      C_ENABLE_RST_SYNC => 1,
      C_ERROR_INJECTION_TYPE => 0,
      C_SYNCHRONIZER_STAGE => C_MTBF_STAGES,
      C_INTERFACE_TYPE => 0,
      C_AXI_TYPE => 1,
      C_HAS_AXI_WR_CHANNEL => 1,
      C_HAS_AXI_RD_CHANNEL => 1,
      C_HAS_SLAVE_CE => 0,
      C_HAS_MASTER_CE => 0,
      C_ADD_NGC_CONSTRAINT => 0,
      C_USE_COMMON_OVERFLOW => 0,
      C_USE_COMMON_UNDERFLOW => 0,
      C_USE_DEFAULT_SETTINGS => 0,
      C_AXI_ID_WIDTH => 1,
      C_AXI_ADDR_WIDTH => 32,
      C_AXI_DATA_WIDTH => 64,
      C_AXI_LEN_WIDTH => 8,
      C_AXI_LOCK_WIDTH => 1,
      C_HAS_AXI_ID => 0,
      C_HAS_AXI_AWUSER => 0,
      C_HAS_AXI_WUSER => 0,
      C_HAS_AXI_BUSER => 0,
      C_HAS_AXI_ARUSER => 0,
      C_HAS_AXI_RUSER => 0,
      C_AXI_ARUSER_WIDTH => 1,
      C_AXI_AWUSER_WIDTH => 1,
      C_AXI_WUSER_WIDTH => 1,
      C_AXI_BUSER_WIDTH => 1,
      C_AXI_RUSER_WIDTH => 1,
      C_HAS_AXIS_TDATA => 1,
      C_HAS_AXIS_TID => 0,
      C_HAS_AXIS_TDEST => 0,
      C_HAS_AXIS_TUSER => 1,
      C_HAS_AXIS_TREADY => 1,
      C_HAS_AXIS_TLAST => 0,
      C_HAS_AXIS_TSTRB => 0,
      C_HAS_AXIS_TKEEP => 0,
      C_AXIS_TDATA_WIDTH => 8,
      C_AXIS_TID_WIDTH => 1,
      C_AXIS_TDEST_WIDTH => 1,
      C_AXIS_TUSER_WIDTH => 4,
      C_AXIS_TSTRB_WIDTH => 1,
      C_AXIS_TKEEP_WIDTH => 1,
      C_WACH_TYPE => 0,
      C_WDCH_TYPE => 0,
      C_WRCH_TYPE => 0,
      C_RACH_TYPE => 0,
      C_RDCH_TYPE => 0,
      C_AXIS_TYPE => 0,
      C_IMPLEMENTATION_TYPE_WACH => 1,
      C_IMPLEMENTATION_TYPE_WDCH => 1,
      C_IMPLEMENTATION_TYPE_WRCH => 1,
      C_IMPLEMENTATION_TYPE_RACH => 1,
      C_IMPLEMENTATION_TYPE_RDCH => 1,
      C_IMPLEMENTATION_TYPE_AXIS => 1,
      C_APPLICATION_TYPE_WACH => 0,
      C_APPLICATION_TYPE_WDCH => 0,
      C_APPLICATION_TYPE_WRCH => 0,
      C_APPLICATION_TYPE_RACH => 0,
      C_APPLICATION_TYPE_RDCH => 0,
      C_APPLICATION_TYPE_AXIS => 0,
      C_PRIM_FIFO_TYPE_WACH => "512x36",
      C_PRIM_FIFO_TYPE_WDCH => "1kx36",
      C_PRIM_FIFO_TYPE_WRCH => "512x36",
      C_PRIM_FIFO_TYPE_RACH => "512x36",
      C_PRIM_FIFO_TYPE_RDCH => "1kx36",
      C_PRIM_FIFO_TYPE_AXIS => "1kx18",
      C_USE_ECC_WACH => 0,
      C_USE_ECC_WDCH => 0,
      C_USE_ECC_WRCH => 0,
      C_USE_ECC_RACH => 0,
      C_USE_ECC_RDCH => 0,
      C_USE_ECC_AXIS => 0,
      C_ERROR_INJECTION_TYPE_WACH => 0,
      C_ERROR_INJECTION_TYPE_WDCH => 0,
      C_ERROR_INJECTION_TYPE_WRCH => 0,
      C_ERROR_INJECTION_TYPE_RACH => 0,
      C_ERROR_INJECTION_TYPE_RDCH => 0,
      C_ERROR_INJECTION_TYPE_AXIS => 0,
      C_DIN_WIDTH_WACH => 32,
      C_DIN_WIDTH_WDCH => 64,
      C_DIN_WIDTH_WRCH => 2,
      C_DIN_WIDTH_RACH => 32,
      C_DIN_WIDTH_RDCH => 64,
      C_DIN_WIDTH_AXIS => 1,
      C_WR_DEPTH_WACH => 16,
      C_WR_DEPTH_WDCH => 1024,
      C_WR_DEPTH_WRCH => 16,
      C_WR_DEPTH_RACH => 16,
      C_WR_DEPTH_RDCH => 1024,
      C_WR_DEPTH_AXIS => 1024,
      C_WR_PNTR_WIDTH_WACH => 4,
      C_WR_PNTR_WIDTH_WDCH => 10,
      C_WR_PNTR_WIDTH_WRCH => 4,
      C_WR_PNTR_WIDTH_RACH => 4,
      C_WR_PNTR_WIDTH_RDCH => 10,
      C_WR_PNTR_WIDTH_AXIS => 10,
      C_HAS_DATA_COUNTS_WACH => 0,
      C_HAS_DATA_COUNTS_WDCH => 0,
      C_HAS_DATA_COUNTS_WRCH => 0,
      C_HAS_DATA_COUNTS_RACH => 0,
      C_HAS_DATA_COUNTS_RDCH => 0,
      C_HAS_DATA_COUNTS_AXIS => 3,
      C_HAS_PROG_FLAGS_WACH => 0,
      C_HAS_PROG_FLAGS_WDCH => 0,
      C_HAS_PROG_FLAGS_WRCH => 0,
      C_HAS_PROG_FLAGS_RACH => 0,
      C_HAS_PROG_FLAGS_RDCH => 0,
      C_HAS_PROG_FLAGS_AXIS => 0,
      C_PROG_FULL_TYPE_WACH => 0,
      C_PROG_FULL_TYPE_WDCH => 0,
      C_PROG_FULL_TYPE_WRCH => 0,
      C_PROG_FULL_TYPE_RACH => 0,
      C_PROG_FULL_TYPE_RDCH => 0,
      C_PROG_FULL_TYPE_AXIS => 0,
      C_PROG_FULL_THRESH_ASSERT_VAL_WACH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_WDCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_WRCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_RACH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_RDCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_AXIS => 1023,
      C_PROG_EMPTY_TYPE_WACH => 0,
      C_PROG_EMPTY_TYPE_WDCH => 0,
      C_PROG_EMPTY_TYPE_WRCH => 0,
      C_PROG_EMPTY_TYPE_RACH => 0,
      C_PROG_EMPTY_TYPE_RDCH => 0,
      C_PROG_EMPTY_TYPE_AXIS => 0,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS => 1022,
      C_REG_SLICE_MODE_WACH => 0,
      C_REG_SLICE_MODE_WDCH => 0,
      C_REG_SLICE_MODE_WRCH => 0,
      C_REG_SLICE_MODE_RACH => 0,
      C_REG_SLICE_MODE_RDCH => 0,
      C_REG_SLICE_MODE_AXIS => 0
    )
    PORT MAP (
      backup                              => '0',
      backup_marker                       => '0',
      clk                                 => '0',
      rst                                 => rst,
      srst                                => '0',
      wr_clk                              => wr_clk,
      wr_rst                              => '0',
      rd_clk                              => rd_clk,
      rd_rst                              => '0',
      din                                 => din_dly,
      wr_en                               => wr_en_dly,
      rd_en                               => rd_en_dly,
      prog_empty_thresh                   => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_empty_thresh_assert            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_empty_thresh_negate            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_full_thresh                    => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_full_thresh_assert             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      prog_full_thresh_negate             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
      int_clk                             => '0',
      injectdbiterr                       => '0',
      injectsbiterr                       => '0',
      sleep                               => '0',
      dout                                => dout,
      full                                => full,
      almost_full                         => almost_full,
      wr_ack                              => wr_ack,
      overflow                            => overflow,
      empty                               => empty,
      almost_empty                        => almost_empty,
      valid                               => valid,
      underflow                           => underflow,
      data_count                          => data_count,
      rd_data_count                       => rd_data_count,
      wr_data_count                       => wr_used_i,
      prog_full                           => prog_full,
      prog_empty                          => prog_empty,
      sbiterr                             => sbiterr,
      dbiterr                             => dbiterr,
      wr_rst_busy                         => wr_rst_busy,
      rd_rst_busy                         => rd_rst_busy,

      m_aclk                              => '0',
      s_aclk                              => '0',
      s_aresetn                           => '0',
      m_aclk_en                           => '0',
      s_aclk_en                           => '0',
      m_axi_awid                          => m_axi_awid,
      m_axi_awaddr                        => m_axi_awaddr,
      m_axi_awlen                         => m_axi_awlen,
      m_axi_awsize                        => m_axi_awsize,
      m_axi_awburst                       => m_axi_awburst,
      m_axi_awlock                        => m_axi_awlock,
      m_axi_awcache                       => m_axi_awcache,
      m_axi_awprot                        => m_axi_awprot,
      m_axi_awqos                         => m_axi_awqos,
      m_axi_awregion                      => m_axi_awregion,
      m_axi_awuser                        => m_axi_awuser,
      m_axi_awvalid                       => m_axi_awvalid,
      m_axi_awready                       => '0',
      m_axi_wid                           => m_axi_wid,
      m_axi_wdata                         => m_axi_wdata,
      m_axi_wstrb                         => m_axi_wstrb,
      m_axi_wlast                         => m_axi_wlast,
      m_axi_wuser                         => m_axi_wuser,
      m_axi_wvalid                        => m_axi_wvalid,
      m_axi_wready                        => '0',
      m_axi_bid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_bresp                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      m_axi_buser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_bvalid                        => '0',
      m_axi_bready                        => m_axi_bready,
      s_axi_awid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awaddr                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axi_awlen                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_awsize                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_awburst                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      s_axi_awlock                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awcache                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awprot                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_awqos                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awregion                      => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awuser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awvalid                       => '0',
      s_axi_awready                       => s_axi_awready,
      s_axi_wid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_wdata                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
      s_axi_wstrb                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_wlast                         => '0',
      s_axi_wuser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_wvalid                        => '0',
      s_axi_wready                        => s_axi_wready,
        
      s_axi_bid                           => s_axi_bid,
      s_axi_bresp                         => s_axi_bresp,
      s_axi_buser                         => s_axi_buser,
      s_axi_bready                        => '0',
      m_axi_arid                          => m_axi_arid,
      m_axi_araddr                        => m_axi_araddr,
      m_axi_arlen                         => m_axi_arlen,
      m_axi_arsize                        => m_axi_arsize,
      m_axi_arburst                       => m_axi_arburst,
      m_axi_arlock                        => m_axi_arlock,
      m_axi_arcache                       => m_axi_arcache,
      m_axi_arprot                        => m_axi_arprot,
      m_axi_arqos                         => m_axi_arqos,
      m_axi_arregion                      => m_axi_arregion,
      m_axi_aruser                        => m_axi_aruser,
      m_axi_arvalid                       => m_axi_arvalid,
      m_axi_arready                       => '0',
        
      m_axi_rid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_rdata                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
      m_axi_rresp                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      m_axi_rlast                         => '0',
      m_axi_ruser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_rvalid                        => '0',
      m_axi_rready                        => m_axi_rready,

      s_axi_arid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_araddr                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axi_arlen                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_arsize                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_arburst                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      s_axi_arlock                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_arcache                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_arprot                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_arqos                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_arregion                      => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_aruser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_arvalid                       => '0',
      s_axi_arready                       => s_axi_arready,
      s_axi_rid                           => s_axi_rid,
      s_axi_rdata                         => s_axi_rdata,
      s_axi_rresp                         => s_axi_rresp,
      s_axi_rlast                         => s_axi_rlast,
      s_axi_ruser                         => s_axi_ruser,
      s_axi_rready                        => '0',
      m_axis_tvalid                       => m_axis_tvalid,
      m_axis_tready                       => '0',
      m_axis_tdata                        => m_axis_tdata ,
      m_axis_tstrb                        => m_axis_tstrb ,
      m_axis_tkeep                        => m_axis_tkeep ,
      m_axis_tlast                        => m_axis_tlast ,
      m_axis_tid                          => m_axis_tid   ,
      m_axis_tdest                        => m_axis_tdest ,
      m_axis_tuser                        => m_axis_tuser ,
      s_axis_tvalid                       => '0',
      s_axis_tready                       => s_axis_tready,
      s_axis_tdata                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axis_tstrb                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tkeep                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tlast                        => '0',
      s_axis_tid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tdest                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tuser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_injectsbiterr                => '0',
      axi_aw_injectdbiterr                => '0',
      axi_aw_prog_full_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_prog_empty_thresh            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_data_count                   => axi_aw_data_count,
      axi_aw_wr_data_count                => axi_aw_wr_data_count,
      axi_aw_rd_data_count                => axi_aw_rd_data_count,
      axi_aw_sbiterr                      => axi_aw_sbiterr,
      axi_aw_dbiterr                      => axi_aw_dbiterr,
      axi_aw_overflow                     => axi_aw_overflow,
      axi_aw_underflow                    => axi_aw_underflow,
      axi_aw_prog_full                    => axi_aw_prog_full,
      axi_aw_prog_empty                   => axi_aw_prog_empty,
      axi_w_injectsbiterr                 => '0',
      axi_w_injectdbiterr                 => '0',
      axi_w_prog_full_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_w_prog_empty_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_w_data_count                    => axi_w_data_count,
      axi_w_wr_data_count                 => axi_w_wr_data_count,
      axi_w_rd_data_count                 => axi_w_rd_data_count,
      axi_w_sbiterr                       => axi_w_sbiterr,
      axi_w_dbiterr                       => axi_w_dbiterr,
      axi_w_overflow                      => axi_w_overflow,
      axi_w_underflow                     => axi_w_underflow,
      axi_w_prog_full                     => axi_w_prog_full,
      axi_w_prog_empty                    => axi_w_prog_empty,

      axi_b_injectsbiterr                 => '0',
      axi_b_injectdbiterr                 => '0',
      axi_b_prog_full_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_b_prog_empty_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_b_data_count                    => axi_b_data_count,
      axi_b_wr_data_count                 => axi_b_wr_data_count,
      axi_b_rd_data_count                 => axi_b_rd_data_count,
      axi_b_sbiterr                       => axi_b_sbiterr,
      axi_b_dbiterr                       => axi_b_dbiterr,
      axi_b_overflow                      => axi_b_overflow,
      axi_b_underflow                     => axi_b_underflow,
      axi_b_prog_full                     => axi_b_prog_full,
      axi_b_prog_empty                    => axi_b_prog_empty,
      axi_ar_injectsbiterr                => '0',
      axi_ar_injectdbiterr                => '0',
      axi_ar_prog_full_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_ar_prog_empty_thresh            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_ar_data_count                    => axi_ar_data_count,
      axi_ar_wr_data_count                 => axi_ar_wr_data_count,
      axi_ar_rd_data_count                 => axi_ar_rd_data_count,
      axi_ar_sbiterr                       => axi_ar_sbiterr,
      axi_ar_dbiterr                       => axi_ar_dbiterr,
      axi_ar_overflow                      => axi_ar_overflow,
      axi_ar_underflow                     => axi_ar_underflow,
      axi_ar_prog_full                     => axi_ar_prog_full,
      axi_ar_prog_empty                    => axi_ar_prog_empty,
      axi_r_injectsbiterr                  => '0',
      axi_r_injectdbiterr                  => '0',
      axi_r_prog_full_thresh               => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_r_prog_empty_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_r_data_count                     => axi_r_data_count,
      axi_r_wr_data_count                  => axi_r_wr_data_count,
      axi_r_rd_data_count                  => axi_r_rd_data_count,
      axi_r_sbiterr                        => axi_r_sbiterr,
      axi_r_dbiterr                        => axi_r_dbiterr,
      axi_r_overflow                       => axi_r_overflow,
      axi_r_underflow                      => axi_r_underflow,
      axi_r_prog_full                      => axi_r_prog_full,
      axi_r_prog_empty                     => axi_r_prog_empty,
      axis_injectsbiterr                   => '0',
      axis_injectdbiterr                   => '0',
      axis_prog_full_thresh                => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axis_prog_empty_thresh               => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axis_data_count                      => axis_data_count,
      axis_wr_data_count                   => axis_wr_data_count,
      axis_rd_data_count                   => axis_rd_data_count,
      axis_sbiterr                         => axis_sbiterr,
      axis_dbiterr                         => axis_dbiterr,
      axis_overflow                        => axis_overflow,
      axis_underflow                       => axis_underflow,
      axis_prog_full                       => axis_prog_full,
      axis_prog_empty                      => axis_prog_empty
    );

--     COMP_FIFO : entity fifo_generator_v12_0.fifo_generator_v12_0
-- generic map (
--      C_COMMON_CLOCK => 0,
--      C_COUNT_TYPE => 0,
--      C_DATA_COUNT_WIDTH => 10,
--      C_DEFAULT_VALUE => "BlankString",
--      C_DIN_WIDTH => 18,
--      C_DOUT_RST_VAL => "0",
--      C_DOUT_WIDTH => 18,
--      C_ENABLE_RLOCS => 0,
--      C_FAMILY => C_FAMILY,
--      C_FULL_FLAGS_RST_VAL => 1,
--      C_HAS_ALMOST_EMPTY => 0,
--      C_HAS_ALMOST_FULL => 0,
--      C_HAS_BACKUP => 0,
--      C_HAS_DATA_COUNT => 0,
--      C_HAS_INT_CLK => 0,
--      C_HAS_MEMINIT_FILE => 0,
--      C_HAS_OVERFLOW => 0,
--      C_HAS_RD_DATA_COUNT => 0,
--      C_HAS_RD_RST => 0,
--      C_HAS_RST => 1,
--      C_HAS_SRST => 0,
--      C_HAS_UNDERFLOW => 0,
--      C_HAS_VALID => 0,
--      C_HAS_WR_ACK => 0,
--      C_HAS_WR_DATA_COUNT => 0,
--      C_HAS_WR_RST => 0,
--      C_IMPLEMENTATION_TYPE => 0,
--      C_INIT_WR_PNTR_VAL => 0,
--      C_MEMORY_TYPE => 1,
--      C_MIF_FILE_NAME => "BlankString",
--      C_OPTIMIZATION_MODE => 0,
--      C_OVERFLOW_LOW => 0,
--      C_PRELOAD_LATENCY => 1,
--      C_PRELOAD_REGS => 0,
--      C_PRIM_FIFO_TYPE => "4kx4",
--      C_PROG_EMPTY_THRESH_ASSERT_VAL => 2,
--      C_PROG_EMPTY_THRESH_NEGATE_VAL => 3,
--      C_PROG_EMPTY_TYPE => 0,
--      C_PROG_FULL_THRESH_ASSERT_VAL => 1022,
--      C_PROG_FULL_THRESH_NEGATE_VAL => 1021,
--      C_PROG_FULL_TYPE => 0,
--      C_RD_DATA_COUNT_WIDTH => 10,
--      C_RD_DEPTH => 16,
--      C_RD_FREQ => 1,
--      C_RD_PNTR_WIDTH => ADDR_BITS,
--      C_UNDERFLOW_LOW => 0,
--      C_USE_DOUT_RST => 1,
--      C_USE_ECC => 0,
--      C_USE_EMBEDDED_REG => 0,
--      C_USE_PIPELINE_REG => 0,
--      C_POWER_SAVING_MODE => 0,
--      C_USE_FIFO16_FLAGS => 0,
--      C_USE_FWFT_DATA_COUNT => 0,
--      C_VALID_LOW => 0,
--      C_WR_ACK_LOW => 0,
--      C_WR_DATA_COUNT_WIDTH => 10,
--      C_WR_DEPTH => 16,
--      C_WR_FREQ => 1,
--      C_WR_PNTR_WIDTH => ADDR_BITS,
--      C_WR_RESPONSE_LATENCY => 1,
--      C_MSGON_VAL => 1,
--      C_ENABLE_RST_SYNC => 1,
--      C_ERROR_INJECTION_TYPE => 0,
--      C_SYNCHRONIZER_STAGE => 2,
--      C_INTERFACE_TYPE => 1,
--      C_AXI_TYPE => 1,
--      C_HAS_AXI_WR_CHANNEL => 1,
--      C_HAS_AXI_RD_CHANNEL => 1,
--      C_HAS_SLAVE_CE => 0,
--      C_HAS_MASTER_CE => 0,
--      C_ADD_NGC_CONSTRAINT => 0,
--      C_USE_COMMON_OVERFLOW => 0,
--      C_USE_COMMON_UNDERFLOW => 0,
--      C_USE_DEFAULT_SETTINGS => 0,
--      C_AXI_ID_WIDTH => 1,
--      C_AXI_ADDR_WIDTH => 32,
--      C_AXI_DATA_WIDTH => 64,
--      C_AXI_LEN_WIDTH => 8,
--      C_AXI_LOCK_WIDTH => 1,
--      C_HAS_AXI_ID => 0,
--      C_HAS_AXI_AWUSER => 0,
--      C_HAS_AXI_WUSER => 0,
--      C_HAS_AXI_BUSER => 0,
--      C_HAS_AXI_ARUSER => 0,
--      C_HAS_AXI_RUSER => 0,
--      C_AXI_ARUSER_WIDTH => 1,
--      C_AXI_AWUSER_WIDTH => 1,
--      C_AXI_WUSER_WIDTH => 1,
--      C_AXI_BUSER_WIDTH => 1,
--      C_AXI_RUSER_WIDTH => 1,
--      C_HAS_AXIS_TDATA => 0,
--      C_HAS_AXIS_TID => 0,
--      C_HAS_AXIS_TDEST => 0,
--      C_HAS_AXIS_TUSER => 0,
--      C_HAS_AXIS_TREADY => 1,
--      C_HAS_AXIS_TLAST => 1,
--      C_HAS_AXIS_TSTRB => 0,
--      C_HAS_AXIS_TKEEP => 0,
--      C_AXIS_TDATA_WIDTH => 1,
--      C_AXIS_TID_WIDTH => 1,
--      C_AXIS_TDEST_WIDTH => 1,
--      C_AXIS_TUSER_WIDTH => 1,
--      C_AXIS_TSTRB_WIDTH => 1,
--      C_AXIS_TKEEP_WIDTH => 1,
--      C_WACH_TYPE => 0,
--      C_WDCH_TYPE => 0,
--      C_WRCH_TYPE => 0,
--      C_RACH_TYPE => 0,
--      C_RDCH_TYPE => 0,
--      C_AXIS_TYPE => 0,
--      C_IMPLEMENTATION_TYPE_WACH => 12,
--      C_IMPLEMENTATION_TYPE_WDCH => 11,
--      C_IMPLEMENTATION_TYPE_WRCH => 12,
--      C_IMPLEMENTATION_TYPE_RACH => 12,
--      C_IMPLEMENTATION_TYPE_RDCH => 11,
--      C_IMPLEMENTATION_TYPE_AXIS => 11,
--      C_APPLICATION_TYPE_WACH => 0,
--      C_APPLICATION_TYPE_WDCH => 0,
--      C_APPLICATION_TYPE_WRCH => 0,
--      C_APPLICATION_TYPE_RACH => 0,
--      C_APPLICATION_TYPE_RDCH => 0,
--      C_APPLICATION_TYPE_AXIS => 1,
--      C_PRIM_FIFO_TYPE_WACH => "512x36",
--      C_PRIM_FIFO_TYPE_WDCH => "1kx36",
--      C_PRIM_FIFO_TYPE_WRCH => "512x36",
--      C_PRIM_FIFO_TYPE_RACH => "512x36",
--      C_PRIM_FIFO_TYPE_RDCH => "1kx36",
--      C_PRIM_FIFO_TYPE_AXIS => "512x36",
--      C_USE_ECC_WACH => 0,
--      C_USE_ECC_WDCH => 0,
--      C_USE_ECC_WRCH => 0,
--      C_USE_ECC_RACH => 0,
--      C_USE_ECC_RDCH => 0,
--      C_USE_ECC_AXIS => 0,
--      C_ERROR_INJECTION_TYPE_WACH => 0,
--      C_ERROR_INJECTION_TYPE_WDCH => 0,
--      C_ERROR_INJECTION_TYPE_WRCH => 0,
--      C_ERROR_INJECTION_TYPE_RACH => 0,
--      C_ERROR_INJECTION_TYPE_RDCH => 0,
--      C_ERROR_INJECTION_TYPE_AXIS => 0,
--      C_DIN_WIDTH_WACH => 32,
--      C_DIN_WIDTH_WDCH => 64,
--      C_DIN_WIDTH_WRCH => 2,
--      C_DIN_WIDTH_RACH => 32,
--      C_DIN_WIDTH_RDCH => 64,
--      C_DIN_WIDTH_AXIS => 1,
--      C_WR_DEPTH_WACH => 16,
--      C_WR_DEPTH_WDCH => 1024,
--      C_WR_DEPTH_WRCH => 16,
--      C_WR_DEPTH_RACH => 16,
--      C_WR_DEPTH_RDCH => 1024,
--      C_WR_DEPTH_AXIS => 16,
--      C_WR_PNTR_WIDTH_WACH => ADDR_BITS,
--      C_WR_PNTR_WIDTH_WDCH => 10,
--      C_WR_PNTR_WIDTH_WRCH => ADDR_BITS,
--      C_WR_PNTR_WIDTH_RACH => ADDR_BITS,
--      C_WR_PNTR_WIDTH_RDCH => 10,
--      C_WR_PNTR_WIDTH_AXIS => ADDR_BITS,
--      C_HAS_DATA_COUNTS_WACH => 0,
--      C_HAS_DATA_COUNTS_WDCH => 0,
--      C_HAS_DATA_COUNTS_WRCH => 0,
--      C_HAS_DATA_COUNTS_RACH => 0,
--      C_HAS_DATA_COUNTS_RDCH => 0,
--      C_HAS_DATA_COUNTS_AXIS => 3,
--      C_HAS_PROG_FLAGS_WACH => 0,
--      C_HAS_PROG_FLAGS_WDCH => 0,
--      C_HAS_PROG_FLAGS_WRCH => 0,
--      C_HAS_PROG_FLAGS_RACH => 0,
--      C_HAS_PROG_FLAGS_RDCH => 0,
--      C_HAS_PROG_FLAGS_AXIS => 0,
--      C_PROG_FULL_TYPE_WACH => 0,
--      C_PROG_FULL_TYPE_WDCH => 0,
--      C_PROG_FULL_TYPE_WRCH => 0,
--      C_PROG_FULL_TYPE_RACH => 0,
--      C_PROG_FULL_TYPE_RDCH => 0,
--      C_PROG_FULL_TYPE_AXIS => 0,
--      C_PROG_FULL_THRESH_ASSERT_VAL_WACH => 15,
--      C_PROG_FULL_THRESH_ASSERT_VAL_WDCH => 1023,
--      C_PROG_FULL_THRESH_ASSERT_VAL_WRCH => 15,
--      C_PROG_FULL_THRESH_ASSERT_VAL_RACH => 15,
--      C_PROG_FULL_THRESH_ASSERT_VAL_RDCH => 1023,
--      C_PROG_FULL_THRESH_ASSERT_VAL_AXIS => 15,
--      C_PROG_EMPTY_TYPE_WACH => 0,
--      C_PROG_EMPTY_TYPE_WDCH => 0,
--      C_PROG_EMPTY_TYPE_WRCH => 0,
--      C_PROG_EMPTY_TYPE_RACH => 0,
--      C_PROG_EMPTY_TYPE_RDCH => 0,
--      C_PROG_EMPTY_TYPE_AXIS => 0,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH => 13,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH => 1021,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH => 13,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH => 13,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH => 1021,
--      C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS => 13,
--      C_REG_SLICE_MODE_WACH => 0,
--      C_REG_SLICE_MODE_WDCH => 0,
--      C_REG_SLICE_MODE_WRCH => 0,
--      C_REG_SLICE_MODE_RACH => 0,
--      C_REG_SLICE_MODE_RDCH => 0,
--      C_REG_SLICE_MODE_AXIS => 0
--    )
--    PORT MAP (
--      backup => '0',
--      backup_marker => '0',
--      clk => '0',
--      rst => '0',
--      srst => '0',
--      wr_clk => '0',
--      wr_rst => '0',
--      rd_clk => '0',
--      rd_rst => '0',
--      din => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 18)),
--      wr_en => '0',
--      rd_en => '0',
--      prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0,ADDR_BITS)),
--      prog_empty_thresh_assert => STD_LOGIC_VECTOR(TO_UNSIGNED(0,ADDR_BITS)),
--      prog_empty_thresh_negate => STD_LOGIC_VECTOR(TO_UNSIGNED(0,ADDR_BITS)),
--      prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      prog_full_thresh_assert => STD_LOGIC_VECTOR(TO_UNSIGNED(0,ADDR_BITS)),
--      prog_full_thresh_negate => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      int_clk => '0',
--      injectdbiterr => '0',
--      injectsbiterr => '0',
--      sleep => '0',
--      m_aclk => rd_clk,
--      s_aclk => wr_clk,
--      s_aresetn => rstn,
--      m_aclk_en => '0',
--      s_aclk_en => '0',
--      s_axi_awid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_awaddr => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
--      s_axi_awlen => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
--      s_axi_awsize => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
--      s_axi_awburst => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
--      s_axi_awlock => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_awcache => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_awprot => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
--      s_axi_awqos => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_awregion => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_awuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_awvalid => '0',
--      s_axi_wid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_wdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
--      s_axi_wstrb => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
--      s_axi_wlast => '0',
--      s_axi_wuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_wvalid => '0',
--      s_axi_bready => '0',
--      m_axi_awready => '0',
--      m_axi_wready => '0',
--      m_axi_bid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axi_bresp => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
--      m_axi_buser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axi_bvalid => '0',
--      s_axi_arid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_araddr => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
--      s_axi_arlen => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
--      s_axi_arsize => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
--      s_axi_arburst => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
--      s_axi_arlock => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_arcache => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_arprot => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
--      s_axi_arqos => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_arregion => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
--      s_axi_aruser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axi_arvalid => '0',
--      s_axi_rready => '0',
--      m_axi_arready => '0',
--      m_axi_rid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axi_rdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
--      m_axi_rresp => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
--      m_axi_rlast => '0',
--      m_axi_ruser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axi_rvalid => '0',
--      s_axis_tvalid => din_vld,
--      s_axis_tready => open,
--      s_axis_tdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axis_tstrb => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axis_tkeep => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axis_tlast => din_rdy_i,
--      s_axis_tid => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axis_tdest => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      s_axis_tuser => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
--      m_axis_tvalid => dout_vld_i,
--      m_axis_tready => m_axis_tready,
--      m_axis_tlast => m_axis_tlast,
--      axi_aw_injectsbiterr => '0',
--      axi_aw_injectdbiterr => '0',
--      axi_aw_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axi_aw_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axi_w_injectsbiterr => '0',
--      axi_w_injectdbiterr => '0',
--      axi_w_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
--      axi_w_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
--      axi_b_injectsbiterr => '0',
--      axi_b_injectdbiterr => '0',
--      axi_b_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axi_b_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0,ADDR_BITS)),
--      axi_ar_injectsbiterr => '0',
--      axi_ar_injectdbiterr => '0',
--      axi_ar_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axi_ar_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axi_r_injectsbiterr => '0',
--      axi_r_injectdbiterr => '0',
--      axi_r_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
--      axi_r_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
--      axis_injectsbiterr => '0',
--      axis_injectdbiterr => '0',
--      axis_prog_full_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axis_prog_empty_thresh => STD_LOGIC_VECTOR(TO_UNSIGNED(0, ADDR_BITS)),
--      axis_wr_data_count => wr_used_i,
--      axis_rd_data_count => open
--    );



end generate NEW_INTRO3;

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : xd_iarg_s2s_adapter.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-01-22
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.s2s_async_fifo_wt;

entity xd_iarg_s2s_adapter is
  generic (
    -- System generics:
    C_FAMILY             : string := "virtex6";  -- Xilinx FPGA family
    C_MTBF_STAGES        : integer;
    C_S_AXIS_TDATA_WIDTH : integer;
    C_S_AXIS_TUSER_WIDTH : integer;
    C_S_AXIS_TID_WIDTH   : integer;
    C_S_AXIS_TDEST_WIDTH : integer;
    C_AP_ARG_DATA_WIDTH  : integer;
    C_AP_ARG_ADDR_WIDTH  : integer;
    C_MULTIBUFFER_DEPTH  : integer);
  port (
    -- Input streams
    S_AXIS_ACLK     : in  std_logic;
    S_AXIS_ARESETN  : in  std_logic;
    S_AXIS_TVALID   : in  std_logic;
    S_AXIS_TREADY   : out std_logic;
    S_AXIS_TDATA    : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
    S_AXIS_TSTRB    : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0);
    S_AXIS_TKEEP    : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0);
    S_AXIS_TLAST    : in  std_logic;
    S_AXIS_TID      : in  std_logic_vector(C_S_AXIS_TID_WIDTH-1 downto 0);
    S_AXIS_TDEST    : in  std_logic_vector(C_S_AXIS_TDEST_WIDTH-1 downto 0);
    S_AXIS_TUSER    : in  std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0);
    ---
    ap_clk          : in  std_logic;
    ap_rst          : in  std_logic;
    ap_iarg_dout    : out std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    ap_iarg_re      : in  std_logic;
    ap_iarg_empty_n : out std_logic;
    mb_arg_rdy      : out std_logic;
    mb_arg_done     : in  std_logic);
end entity;

architecture rtl of xd_iarg_s2s_adapter is

  signal axis_rst : std_logic;
  signal axis_rst1 : std_logic;
      ATTRIBUTE async_reg           : STRING;
        ATTRIBUTE async_reg OF axis_rst1    : SIGNAL IS "true"; 
      ATTRIBUTE async_reg OF axis_rst    : SIGNAL IS "true"; 

begin

  mb_arg_rdy <= '1';

  --axis_rst <= not(S_AXIS_ARESETN);

      prd1: PROCESS (S_AXIS_ACLK, S_AXIS_ARESETN)
      BEGIN
       -- Register Stage #1 
        IF (S_AXIS_ARESETN = '0') THEN
          axis_rst1 <= '1';
          axis_rst <= '1';
        ELSIF (S_AXIS_ACLK'event and S_AXIS_ACLK = '1') THEN
          axis_rst1 <= '0';
          axis_rst <= axis_rst1;
        END IF;
        END PROCESS prd1;


  SAME_WIDTH_GEN : if (C_S_AXIS_TDATA_WIDTH = C_AP_ARG_DATA_WIDTH) generate
    constant FIFO_DATA_LSB : integer := 0;
    constant FIFO_DATA_MSB : integer := C_S_AXIS_TDATA_WIDTH-1;
    constant FIFO_LAST_BIT : integer := FIFO_DATA_MSB+1;
    constant FIFO_WIDTH    : integer := FIFO_LAST_BIT+1;

    signal fifo_din      : std_logic_vector(FIFO_WIDTH-1 downto 0);
    signal fifo_dout     : std_logic_vector(FIFO_WIDTH-1 downto 0);
    signal fifo_dout_vld : std_logic;
    signal fifo_dout_rdy : std_logic;

    -- FIFO depth calculation
    constant FIFO_DEPTH : integer := (2**C_AP_ARG_ADDR_WIDTH)-1;

  begin

    fifo_din(FIFO_DATA_MSB downto FIFO_DATA_LSB) <= S_AXIS_TDATA;
    fifo_din(FIFO_LAST_BIT)                      <= S_AXIS_TLAST;

    FIFO_I : entity axis_accelerator_adapter_v2_1_16.s2s_async_fifo_wt
      generic map (
        C_FAMILY => C_FAMILY,
        C_MTBF_STAGES   => C_MTBF_STAGES, 
        DEPTH    => FIFO_DEPTH,
        WIDTH    => FIFO_WIDTH)
      port map (
        din      => fifo_din,
        din_vld  => S_AXIS_TVALID,
        din_rdy  => S_AXIS_TREADY,
        wr_clk   => S_AXIS_ACLK,
        wr_rst   => axis_rst,
        dout     => fifo_dout,
        dout_vld => fifo_dout_vld,
        dout_rdy => fifo_dout_rdy,
        rd_clk   => ap_clk,
        rd_rst   => ap_rst);

    ap_iarg_dout    <= fifo_dout(FIFO_DATA_MSB downto FIFO_DATA_LSB);
    ap_iarg_empty_n <= fifo_dout_vld;
    fifo_dout_rdy   <= ap_iarg_re;

  end generate SAME_WIDTH_GEN;

  AXI_WIDER_GEN : if (C_S_AXIS_TDATA_WIDTH > C_AP_ARG_DATA_WIDTH) generate
    constant WORDS_PER_BEAT : integer := C_S_AXIS_TDATA_WIDTH/C_AP_ARG_DATA_WIDTH;
    constant WORD_CNT_WIDTH : integer := log2(WORDS_PER_BEAT);
    constant REM_WIDTH      : integer := WORD_CNT_WIDTH;
    constant FIFO_DATA_LSB  : integer := 0;
    constant FIFO_DATA_MSB  : integer := C_S_AXIS_TDATA_WIDTH-1;
    constant FIFO_REM_LSB   : integer := FIFO_DATA_MSB+1;
    constant FIFO_REM_MSB   : integer := FIFO_REM_LSB+REM_WIDTH-1;
    constant FIFO_LAST_BIT  : integer := FIFO_REM_MSB+1;
    constant FIFO_WIDTH     : integer := FIFO_LAST_BIT+1;
    -- Output register is an additional position to the FIFO. Substract one.
    constant DATA_RATIO     : integer := C_S_AXIS_TDATA_WIDTH/C_AP_ARG_DATA_WIDTH;
    constant FIFO_DEPTH     : integer := (2**(C_AP_ARG_ADDR_WIDTH-log2(DATA_RATIO)))-1;

    signal word_cnt : unsigned(WORD_CNT_WIDTH-1 downto 0);
    signal word_inc : std_logic;
    signal axi_rem  : std_logic_vector(REM_WIDTH-1 downto 0);

    signal fifo_din      : std_logic_vector(FIFO_WIDTH-1 downto 0);
    signal fifo_dout     : std_logic_vector(FIFO_WIDTH-1 downto 0);
    signal fifo_dout_vld : std_logic;
    signal fifo_dout_rdy : std_logic;

    -- Ouput for decoupling fifo
    signal ap_data : std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
    signal ap_rem  : std_logic_vector(REM_WIDTH-1 downto 0);
    signal ap_last : std_logic;

    signal dout     : std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    signal dout_ce  : std_logic;
    signal dout_vld : std_logic;
    signal dout_rdy : std_logic;

  begin

    -- This logic should generate a set of LUTs (w.c. 8 inputs, 3 outputs)
    process(S_AXIS_TKEEP)
      constant BYTES_PER_WORD : integer                                     := C_AP_ARG_DATA_WIDTH/8;
      constant ones           : std_logic_vector(BYTES_PER_WORD-1 downto 0) := (others => '1');
      variable aux            : integer range 0 to WORDS_PER_BEAT-1;
    begin
      aux := 0;
      for i in 0 to WORDS_PER_BEAT-1 loop
        if(S_AXIS_TKEEP(BYTES_PER_WORD*(i+1)-1 downto BYTES_PER_WORD*i) = ones) then
          aux := i;
        else
          exit;
        end if;
      end loop;
      axi_rem <= std_logic_vector(to_unsigned(aux, WORD_CNT_WIDTH));
    end process;

    fifo_din(FIFO_DATA_MSB downto FIFO_DATA_LSB) <= S_AXIS_TDATA;
    fifo_din(FIFO_REM_MSB downto FIFO_REM_LSB)   <= axi_rem;
    fifo_din(FIFO_LAST_BIT)                      <= S_AXIS_TLAST;

    FIFO_I : entity axis_accelerator_adapter_v2_1_16.s2s_async_fifo_wt
      generic map (
        C_FAMILY => C_FAMILY,
        C_MTBF_STAGES   => C_MTBF_STAGES, 
        DEPTH    => FIFO_DEPTH,
        WIDTH    => FIFO_WIDTH)
      port map (
        din      => fifo_din,
        din_vld  => S_AXIS_TVALID,
        din_rdy  => S_AXIS_TREADY,
        wr_clk   => S_AXIS_ACLK,
        wr_rst   => axis_rst,
        dout     => fifo_dout,
        dout_vld => fifo_dout_vld,
        dout_rdy => fifo_dout_rdy,
        rd_clk   => ap_clk,
        rd_rst   => ap_rst);

    ap_data <= fifo_dout(FIFO_DATA_MSB downto FIFO_DATA_LSB);
    ap_rem  <= fifo_dout(FIFO_REM_MSB downto FIFO_REM_LSB);
    ap_last <= fifo_dout(FIFO_LAST_BIT);

    -- Set the output register when output is not valid or if it's valid it's
    -- being taken (same cycle)
    dout_ce <= not(dout_vld) or (dout_vld and dout_rdy);

    -- Take output of the fifo when we move to the output the last word of the
    -- beat
    fifo_dout_rdy <= dout_ce when (word_cnt = unsigned(ap_rem)) else '0';

    -- Increment word counter when we transfer one word at the output
    word_inc <= fifo_dout_vld and dout_ce;

    -- Counter of words transferd to output port:
    process(ap_clk, ap_rst)
    begin
      if(ap_rst = '1') then
        word_cnt <= (others => '0');
      elsif(ap_clk'event and ap_clk = '1') then
        if(word_inc = '1') then
          if(word_cnt = unsigned(ap_rem)) then
            word_cnt <= (others => '0');
          else
            word_cnt <= word_cnt + 1;
          end if;
        end if;
      end if;
    end process;

    process(ap_clk, ap_rst)
    begin
      if(ap_rst = '1') then
        dout_vld <= '0';
      elsif(ap_clk'event and ap_clk = '1') then
        if(dout_ce = '1') then
          dout_vld <= fifo_dout_vld;
        end if;
      end if;
    end process;

    -- Register + mux for output port
    process(ap_clk, ap_rst)
    begin
      if(ap_rst = '1') then
        dout <= (others => '0');
      elsif(ap_clk'event and ap_clk = '1') then
        if(dout_ce = '1') then
          for i in 0 to WORDS_PER_BEAT-1 loop
            if(i = word_cnt) then
              dout <= fifo_dout(C_AP_ARG_DATA_WIDTH*(i+1)-1 downto C_AP_ARG_DATA_WIDTH*i);
            end if;
          end loop;
        end if;
      end if;
    end process;

    ap_iarg_dout    <= dout;
    ap_iarg_empty_n <= dout_vld;
    dout_rdy        <= ap_iarg_re;

  end generate AXI_WIDER_GEN;

  AXI_NARROWER_GEN : if (C_S_AXIS_TDATA_WIDTH < C_AP_ARG_DATA_WIDTH) generate
    constant BEATS_PER_WORD : integer := C_AP_ARG_DATA_WIDTH/C_S_AXIS_TDATA_WIDTH;
    constant FIFO_DATA_LSB  : integer := 0;
    constant FIFO_DATA_MSB  : integer := C_AP_ARG_DATA_WIDTH-1;
    constant FIFO_WIDTH     : integer := FIFO_DATA_MSB+1;

    signal beat_sel  : std_logic_vector(BEATS_PER_WORD-1 downto 0);
    signal tap_0     : std_logic_vector(C_AP_ARG_DATA_WIDTH-1 downto 0);
    signal tap_0_we  : std_logic;
    signal tap_0_vld : std_logic;
    signal tap_0_rdy : std_logic;
    signal axis_vld  : std_logic;
    signal axis_rdy  : std_logic;

    signal fifo_din      : std_logic_vector(FIFO_WIDTH-1 downto 0);
    signal fifo_din_vld  : std_logic;
    signal fifo_din_rdy  : std_logic;
    signal fifo_dout     : std_logic_vector(FIFO_WIDTH-1 downto 0);
    signal fifo_dout_vld : std_logic;
    signal fifo_dout_rdy : std_logic;

    -- register tap_0 is an extra position to the fifo. substract 1.
    constant FIFO_DEPTH : integer := (2**C_AP_ARG_ADDR_WIDTH)-1;

  begin

    axis_vld      <= S_AXIS_TVALID;
    S_AXIS_TREADY <= axis_rdy;

    process(S_AXIS_ACLK)
    begin
      if(S_AXIS_ACLK'event and S_AXIS_ACLK = '1') then
        if(axis_rst = '1' or (S_AXIS_TLAST and tap_0_we) = '1') then
          beat_sel    <= (others => '0');
          beat_sel(0) <= '1';
        elsif(tap_0_we = '1') then
          beat_sel <= beat_sel(BEATS_PER_WORD-2 downto 0) & beat_sel(BEATS_PER_WORD-1);
        end if;
      end if;
    end process;

    process(S_AXIS_ACLK)
    begin
      if(S_AXIS_ACLK'event and S_AXIS_ACLK = '1') then
        if(tap_0_we = '1') then
          for i in 0 to BEATS_PER_WORD-1 loop
            if(beat_sel(i) = '1') then
              tap_0(C_S_AXIS_TDATA_WIDTH*(i+1)-1 downto C_S_AXIS_TDATA_WIDTH*i) <= S_AXIS_TDATA;
            end if;
          end loop;
        end if;
      end if;
    end process;

    process(S_AXIS_ACLK, axis_rst)
    begin
      if(axis_rst = '1') then
        tap_0_vld <= '0';
      elsif(S_AXIS_ACLK'event and S_AXIS_ACLK = '1') then
        if(tap_0_vld = '0' or (tap_0_vld and tap_0_rdy) = '1') then
          tap_0_vld <= tap_0_we and (beat_sel(BEATS_PER_WORD-1) or S_AXIS_TLAST);
        end if;
      end if;
    end process;

    -- We accept new input data when:
    --  1. tap_0 is empty
    --  2. tap_0 is full but it's content is being moved to fifo
    axis_rdy <= not(tap_0_vld) or (tap_0_vld and fifo_din_rdy);

    -- under this conditions, a new write will occur on tap_0, if additionally
    -- there is a new data at the input
    tap_0_we <= axis_vld and (not(tap_0_vld) or (tap_0_vld and fifo_din_rdy));

    -- fifo shows a data valid at the input when tap_0 is valid
    fifo_din_vld <= tap_0_vld;

    -- take tap_0 when it's moved the data to the fifo:
    tap_0_rdy <= fifo_din_vld and fifo_din_rdy;


    fifo_din(FIFO_DATA_MSB downto FIFO_DATA_LSB) <= tap_0;

    FIFO_I : entity axis_accelerator_adapter_v2_1_16.s2s_async_fifo_wt
      generic map (
        C_FAMILY => C_FAMILY,
        C_MTBF_STAGES   => C_MTBF_STAGES, 
        DEPTH    => FIFO_DEPTH,
        WIDTH    => FIFO_WIDTH)
      port map (
        din      => fifo_din,
        din_vld  => fifo_din_vld,
        din_rdy  => fifo_din_rdy,
        wr_clk   => S_AXIS_ACLK,
        wr_rst   => axis_rst,
        dout     => fifo_dout,
        dout_vld => fifo_dout_vld,
        dout_rdy => fifo_dout_rdy,
        rd_clk   => ap_clk,
        rd_rst   => ap_rst);

    ap_iarg_dout    <= fifo_dout(FIFO_DATA_MSB downto FIFO_DATA_LSB);
    ap_iarg_empty_n <= fifo_dout_vld;

    fifo_dout_rdy <= ap_iarg_re;

  end generate AXI_NARROWER_GEN;

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : sync_ap_status.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2012-11-04
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-- 2013-08-25  2.0      pvk	Changed reset polarity to active low
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

-- this is a synchronizer module for ap_start and ap_done (between accelerator
-- clock and AXI clock)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;

entity sync_ap_status is
  port (
    rst      : in  std_logic;
    ap_clk   : in  std_logic;
    ap_flag  : in  std_logic;
    axi_clk  : in  std_logic;
    flag     : out std_logic;
    flag_clr : in  std_logic);
end entity;

architecture rtl of sync_ap_status is
  signal wr_cnt  : std_logic;
  signal rd_cnt  : std_logic;
  signal wr_en   : std_logic;
  signal rd_en   : std_logic;
  signal full_n  : std_logic;
  signal empty_n : std_logic;

begin

  wr_en <= ap_flag and full_n;

  process(ap_clk, rst)
  begin
    if(rst = '1') then
      wr_cnt <= '0';
    elsif(ap_clk'event and ap_clk = '1') then
      if(wr_en = '1') then
        wr_cnt <= not(wr_cnt);
      end if;
    end if;
  end process;

  rd_en <= flag_clr and empty_n;

  process(axi_clk, rst)
  begin
    if(rst = '1') then
      rd_cnt <= '0';
    elsif(axi_clk'event and axi_clk = '1') then
      if(rd_en = '1') then
        rd_cnt <= not(rd_cnt);
      end if;
    end if;
  end process;

  process(ap_clk, rst)
  begin
    if(rst = '1') then
      full_n <= '0';
    elsif(ap_clk'event and ap_clk = '1') then
      if(full_n = '1') then
        full_n <= not(wr_en);
      else
        full_n <= not(wr_cnt xor rd_cnt);
      end if;
    end if;
  end process;

  process(axi_clk, rst)
  begin
    if(rst = '1') then
      empty_n <= '0';
    elsif(axi_clk'event and axi_clk = '1') then
      if(empty_n = '1') then
        empty_n <= not(rd_en);
      else
        empty_n <= (wr_cnt xor rd_cnt);
      end if;
    end if;
  end process;

  flag <= empty_n;

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : async_fifo_dist_wt.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-01-22
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;

entity async_fifo_dist_wt is
  generic (
    C_FAMILY : string  := "virtex6";    -- Xilinx FPGA family
    DEPTH    : integer := 31;
    WIDTH    : integer := 16);
  port (
    din      : in  std_logic_vector(WIDTH-1 downto 0);
    din_vld  : in  std_logic;
    din_rdy  : out std_logic;
    wr_clk   : in  std_logic;
    wr_rst   : in  std_logic;
    dout     : out std_logic_vector(WIDTH-1 downto 0);
    dout_vld : out std_logic;
    dout_rdy : in  std_logic;
    rd_clk   : in  std_logic;
    rd_rst   : in  std_logic);
end async_fifo_dist_wt;

architecture rtl of async_fifo_dist_wt is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";


  constant FIFO_DEPTH : integer := calc_fifo_depth(DEPTH);
  constant ADDR_BITS  : integer := log2(FIFO_DEPTH);

  signal rd_addr : unsigned(ADDR_BITS-1 downto 0);
  signal wr_addr : unsigned(ADDR_BITS-1 downto 0);

  -- Following signals have gray values
  signal wr_cnt      : std_logic_vector(ADDR_BITS-1 downto 0);
  signal next_wr_cnt : std_logic_vector(ADDR_BITS-1 downto 0);
  signal rd_cnt      : std_logic_vector(ADDR_BITS-1 downto 0);
  signal next_rd_cnt : std_logic_vector(ADDR_BITS-1 downto 0);
  signal prev_rd_cnt : std_logic_vector(ADDR_BITS-1 downto 0);
  signal fifo_we     : std_logic;
  signal fifo_re     : std_logic;
  signal din_rdy_i   : std_logic;
  signal empty_i     : std_logic;
  signal rd_en       : std_logic;
  signal dout_vld_i  : std_logic;

  type   mem_type is array (2**ADDR_BITS-1 downto 0) of std_logic_vector (WIDTH-1 downto 0);
  signal mem                 : mem_type;
  attribute ram_style        : string;
  attribute ram_style of mem : signal is "distributed";

  signal mem_dout : std_logic_vector(WIDTH-1 downto 0);

begin

  ---------------------------------------------------------
  fifo_we <= din_vld and din_rdy_i;

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      wr_addr <= (others => '0');
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_addr <= wr_addr + 1;
      end if;
    end if;
  end process;


  fifo_re <= rd_en and not(empty_i);

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      rd_addr <= (others => '0');
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        rd_addr <= rd_addr + 1;
      end if;
    end if;
  end process;

  ---------------------------------------------------------
  -- From all gray signals, only next_rd_cnt and next_wr_cnt are counters. all
  -- the rest are registers. It's simpler to use a binary counter and then use
  -- a table to transfor to gray. Given that the address counter is initialized
  -- to zero, signal next_XX_cnt will load code gray(0) after first increment.
  -- Hence, it should be initialized to gray(N-1). that is, the initial values
  -- will be:
  --  * next_XX_cnt = gray(N-1)
  --  * XX_cnt = gray(N-2)
  --  * prev_XX_cnt = gray(N-3)

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      next_rd_cnt <= bin2gray(2**ADDR_BITS-1, ADDR_BITS);
      rd_cnt      <= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
      prev_rd_cnt <= bin2gray(2**ADDR_BITS-3, ADDR_BITS);
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        prev_rd_cnt <= rd_cnt;
        rd_cnt      <= next_rd_cnt;
        next_rd_cnt <= bin2gray(std_logic_vector(rd_addr));
      end if;
    end if;
  end process;

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      next_wr_cnt <= bin2gray(2**ADDR_BITS-1, ADDR_BITS);
      wr_cnt      <= bin2gray(2**ADDR_BITS-2, ADDR_BITS);
    elsif(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        wr_cnt      <= next_wr_cnt;
        next_wr_cnt <= bin2gray(std_logic_vector(wr_addr));
      end if;
    end if;
  end process;

  -----------------------------------------------------------------
  -- Flag FULL:
  -- 1.- move to full condition (not din_rdy) when there is an efective
  -- write next_wr_cnt = prev_rd_cnt
  -- 2.- stay in full condition (not din_rdy) while this condition is true:
  -- next_wr_cnt = rd_cnt

  process(wr_clk, wr_rst)
  begin
    if(wr_rst = '1') then
      din_rdy_i <= '0';
    elsif(wr_clk'event and wr_clk = '1') then
      if((not(din_rdy_i) or fifo_we) = '1') then
        if(din_rdy_i = '1') then
          if (next_wr_cnt = prev_rd_cnt) then
            din_rdy_i <= '0';
          else
            din_rdy_i <= '1';
          end if;
        else
          if (wr_cnt = prev_rd_cnt) then
            din_rdy_i <= '0';
          else
            din_rdy_i <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;

  din_rdy <= din_rdy_i;

  -- Flag EMPTY:
  -- 1.- move to empty condition when there is read (next_rd_cnt = wr_cnt)
  -- 2.- stay in empty condition while the two pointers are the same (wr_cnt = rd_cnt)

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      empty_i <= '1';
    elsif(rd_clk'event and rd_clk = '1') then
      if((empty_i or fifo_re) = '1') then
        if(empty_i = '0') then
          if(next_rd_cnt = wr_cnt) then
            empty_i <= '1';
          else
            empty_i <= '0';
          end if;
        else
          if(rd_cnt = wr_cnt) then
            empty_i <= '1';
          else
            empty_i <= '0';
          end if;
        end if;
      end if;
    end if;
  end process;

  rd_en <= not(dout_vld_i) or (dout_vld_i and dout_rdy);
  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      dout_vld_i <= '0';
    elsif(rd_clk'event and rd_clk = '1') then
      if(rd_en = '1') then
        dout_vld_i <= not(empty_i);
      end if;
    end if;
  end process;

  dout_vld <= dout_vld_i;


  -----------------------------------------------------------------------
  -- memory modeling (XST to infer)

  process(wr_clk)
  begin
    if(wr_clk'event and wr_clk = '1') then
      if(fifo_we = '1') then
        mem(to_integer(wr_addr)) <= din;
      end if;
    end if;
  end process;

  mem_dout <= mem(to_integer(rd_addr));

  process(rd_clk, rd_rst)
  begin
    if(rd_rst = '1') then
      dout <= (others => '0');
    elsif(rd_clk'event and rd_clk = '1') then
      if(fifo_re = '1') then
        dout <= mem_dout;
      end if;
    end if;
  end process;

end rtl;




-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : async_fifo_dist_inst.vhd
-- Author     : ghanash
-- Company    : Xilinx, Inc.
-- Created    : 2014-11-21
-- Last update: 
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-11-21  1.0      ghanash Created
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;

library fifo_generator_v13_1_4;
use fifo_generator_v13_1_4.all;

entity async_fifo_dist_inst is
  generic (
    C_FAMILY : string  := "virtex6";    -- Xilinx FPGA family
    DEPTH    : integer := 31;
    WIDTH    : integer := 32);
  port (
    din      : in  std_logic_vector(WIDTH-1 downto 0);
    din_vld  : in  std_logic;
    din_rdy  : out std_logic;
    wr_clk   : in  std_logic;
    wr_rst   : in  std_logic;
    dout     : out std_logic_vector(WIDTH-1 downto 0);
    dout_vld : out std_logic;
    dout_rdy : in  std_logic;
    rd_clk   : in  std_logic;
    rd_rst   : in  std_logic);
end async_fifo_dist_inst;

architecture rtl of async_fifo_dist_inst is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";


  --constant FIFO_DEPTH : integer := calc_fifo_depth(DEPTH);
  --constant ADDR_BITS  : integer := log2(FIFO_DEPTH);
  signal din_rdy_n   : std_logic;
  signal dout_vld_i  : std_logic;
  signal fifo_we     : std_logic;
  signal fifo_re     : std_logic;
  signal empty       : std_logic;
  signal full        : std_logic;

  signal almost_full :std_logic;    
  signal wr_ack :std_logic;    
  signal overflow :std_logic;    
  signal almost_empty :std_logic;    
  signal valid :std_logic;    
  signal underflow :std_logic;    
  signal data_count :std_logic_vector(4 downto 0);    
  signal rd_data_count :std_logic_vector(4 downto 0);    
  signal wr_data_count :std_logic_vector(4 downto 0);    
  signal prog_full :std_logic;    
  signal prog_empty :std_logic;    
  signal sbiterr :std_logic;    
  signal dbiterr :std_logic;    
  signal wr_rst_busy :std_logic;    
  signal rd_rst_busy :std_logic;    
  signal m_axi_awid :std_logic_vector(0 downto 0);    
  signal m_axi_awaddr :std_logic_vector(31 downto 0);    
  signal m_axi_awlen :std_logic_vector(7 downto 0);    
  signal m_axi_awsize :std_logic_vector(2 downto 0);    
  signal m_axi_awburst :std_logic_vector(1 downto 0);    
  signal m_axi_awlock :std_logic_vector(0 downto 0);    
  signal m_axi_awcache :std_logic_vector(3 downto 0);    
  signal m_axi_awprot :std_logic_vector(2 downto 0);    
  signal m_axi_awqos :std_logic_vector(3 downto 0);    
  signal m_axi_awregion :std_logic_vector(3 downto 0);    
  signal m_axi_awuser :std_logic_vector(0 downto 0);    
  signal m_axi_awvalid :std_logic;
  signal m_axi_wid :std_logic_vector(0 downto 0);    
  signal m_axi_wdata :std_logic_vector(63 downto 0);    
  signal m_axi_wstrb :std_logic_vector(7 downto 0);    
  signal m_axi_wlast :std_logic;
  signal m_axi_wuser :std_logic_vector(0 downto 0);    
  signal m_axi_wvalid :std_logic;
  signal m_axi_bready :std_logic;
  signal s_axi_awready :std_logic;
  signal s_axi_wready :std_logic;
  signal s_axi_bid :std_logic_vector(0 downto 0);    
  signal s_axi_bresp :std_logic_vector(1 downto 0);    
  signal s_axi_buser :std_logic_vector(0 downto 0);    
  signal m_axi_arid :std_logic_vector(0 downto 0);    
  signal m_axi_araddr :std_logic_vector(31 downto 0);    
  signal m_axi_arlen :std_logic_vector(7 downto 0);    
  signal m_axi_arsize :std_logic_vector(2 downto 0);    
  signal m_axi_arburst :std_logic_vector(1 downto 0);    
  signal m_axi_arlock :std_logic_vector(0 downto 0);    
  signal m_axi_arcache :std_logic_vector(3 downto 0);    
  signal m_axi_arprot :std_logic_vector(2 downto 0);    
  signal m_axi_arqos :std_logic_vector(3 downto 0);    
  signal m_axi_arregion :std_logic_vector(3 downto 0);    
  signal m_axi_aruser :std_logic_vector(0 downto 0);    
  signal m_axi_arvalid :std_logic;
  signal m_axi_rready :std_logic;
  signal s_axi_arready :std_logic;
  signal s_axi_rid :std_logic_vector(0 downto 0);    
  signal s_axi_rdata :std_logic_vector(63 downto 0);    
  signal s_axi_rresp :std_logic_vector(1 downto 0);    
  signal s_axi_rlast :std_logic;
  signal s_axi_ruser :std_logic_vector(0 downto 0);    
  signal m_axis_tvalid :std_logic;
  signal m_axis_tdata :std_logic_vector(7 downto 0);    
  signal m_axis_tstrb :std_logic_vector(0 downto 0);    
  signal m_axis_tlast :std_logic;
  signal m_axis_tkeep :std_logic_vector(0 downto 0);    
  signal m_axis_tid :std_logic_vector(0 downto 0);    
  signal m_axis_tdest :std_logic_vector(0 downto 0);    
  signal m_axis_tuser :std_logic_vector(3 downto 0);    
  signal s_axis_tready :std_logic;
  signal axi_aw_data_count :std_logic_vector(4 downto 0);    
  signal axi_aw_wr_data_count :std_logic_vector(4 downto 0);    
  signal axi_aw_rd_data_count :std_logic_vector(4 downto 0);    
  signal axi_aw_sbiterr :std_logic;    
  signal axi_aw_dbiterr :std_logic;    
  signal axi_aw_overflow :std_logic;    
  signal axi_aw_underflow :std_logic;    
  signal axi_aw_prog_full :std_logic;    
  signal axi_aw_prog_empty :std_logic;    
  signal axi_w_data_count :std_logic_vector(10 downto 0);    
  signal axi_w_wr_data_count :std_logic_vector(10 downto 0);    
  signal axi_w_rd_data_count :std_logic_vector(10 downto 0);    
  signal axi_w_sbiterr :std_logic;    
  signal axi_w_dbiterr :std_logic;    
  signal axi_w_overflow :std_logic;    
  signal axi_w_underflow :std_logic;    
  signal axi_w_prog_full :std_logic;    
  signal axi_w_prog_empty :std_logic;    
  signal axi_b_data_count :std_logic_vector(4 downto 0);    
  signal axi_b_wr_data_count :std_logic_vector(4 downto 0);    
  signal axi_b_rd_data_count :std_logic_vector(4 downto 0);    
  signal axi_b_sbiterr :std_logic;    
  signal axi_b_dbiterr :std_logic;    
  signal axi_b_overflow :std_logic;    
  signal axi_b_underflow :std_logic;    
  signal axi_b_prog_full :std_logic;    
  signal axi_b_prog_empty :std_logic;    
  signal axi_ar_data_count :std_logic_vector(4 downto 0);    
  signal axi_ar_wr_data_count :std_logic_vector(4 downto 0);    
  signal axi_ar_rd_data_count :std_logic_vector(4 downto 0);    
  signal axi_ar_sbiterr :std_logic;    
  signal axi_ar_dbiterr :std_logic;    
  signal axi_ar_overflow :std_logic;    
  signal axi_ar_underflow :std_logic;    
  signal axi_ar_prog_full :std_logic;    
  signal axi_ar_prog_empty :std_logic;    
  signal axi_r_data_count :std_logic_vector(10 downto 0);    
  signal axi_r_wr_data_count :std_logic_vector(10 downto 0);    
  signal axi_r_rd_data_count :std_logic_vector(10 downto 0);    
  signal axi_r_sbiterr :std_logic;    
  signal axi_r_dbiterr :std_logic;    
  signal axi_r_overflow :std_logic;    
  signal axi_r_underflow :std_logic;    
  signal axi_r_prog_full :std_logic;    
  signal axi_r_prog_empty :std_logic;    
  signal axis_data_count :std_logic_vector(10 downto 0);    
  signal axis_wr_data_count :std_logic_vector(10 downto 0);    
  signal axis_rd_data_count :std_logic_vector(10 downto 0);    
  signal axis_sbiterr :std_logic;    
  signal axis_dbiterr :std_logic;    
  signal axis_overflow :std_logic;    
  signal axis_underflow :std_logic;    
  signal axis_prog_full :std_logic;    
  signal axis_prog_empty :std_logic;    

  begin

--    fifo_we  <= din_vld and (not(full));
--    fifo_re  <= (not(dout_vld_i) or (dout_vld_i and dout_rdy)) and (not(empty));
    din_rdy  <= not(full);
    dout_vld <= dout_vld_i;

--    fifo_we  <= din_vld and (not(full));
--    fifo_re  <= dout_rdy and (not(empty));
--
--
--
--  process(wr_clk, wr_rst)
--  begin
--    if(wr_rst = '1') then
--      din_rdy <= '0';
--    elsif(wr_clk'event and wr_clk = '1') then
--      if(fifo_we = '1') then
--      dout_vld <= not(empty);
--      end if;
--    end if;
--  end process;



--  process(rd_clk, rd_rst)
--  begin
--    if(rd_rst = '1') then
--      dout_vld_i <= '0';
--    elsif(rd_clk'event and rd_clk = '1') then
--      if((not(dout_vld_i) or (dout_vld_i and dout_rdy)) = '1') then
        dout_vld_i <= not(empty);
--      end if;
--    end if;
--  end process;


  FIF_DMG_INST : entity fifo_generator_v13_1_4.fifo_generator_v13_1_4
    GENERIC MAP (
      C_COMMON_CLOCK => 0,
      C_COUNT_TYPE => 0,
      C_DATA_COUNT_WIDTH => 5,
      C_DEFAULT_VALUE => "BlankString",
      C_DIN_WIDTH => 32,
      C_DOUT_RST_VAL => "0",
      C_DOUT_WIDTH => 32,
      C_ENABLE_RLOCS => 0,
      C_FAMILY => C_FAMILY,
      C_FULL_FLAGS_RST_VAL => 0,
      C_HAS_ALMOST_EMPTY => 0,
      C_HAS_ALMOST_FULL => 0,
      C_HAS_BACKUP => 0,
      C_HAS_DATA_COUNT => 0,
      C_HAS_INT_CLK => 0,
      C_HAS_MEMINIT_FILE => 0,
      C_HAS_OVERFLOW => 0,
      C_HAS_RD_DATA_COUNT => 0,
      C_HAS_RD_RST => 0,
      C_HAS_RST => 1,
      C_HAS_SRST => 0,
      C_HAS_UNDERFLOW => 0,
      C_HAS_VALID => 0,
      C_HAS_WR_ACK => 0,
      C_HAS_WR_DATA_COUNT => 0,
      C_HAS_WR_RST => 0,
      C_IMPLEMENTATION_TYPE => 2,
      C_INIT_WR_PNTR_VAL => 0,
      C_MEMORY_TYPE => 2,
      C_MIF_FILE_NAME => "BlankString",
      C_OPTIMIZATION_MODE => 0,
      C_OVERFLOW_LOW => 0,
      C_PRELOAD_LATENCY => 0,
      C_PRELOAD_REGS => 1,
      C_PRIM_FIFO_TYPE => "512x36",
      C_PROG_EMPTY_THRESH_ASSERT_VAL => 2,
      C_PROG_EMPTY_THRESH_NEGATE_VAL => 3,
      C_PROG_EMPTY_TYPE => 0,
      C_PROG_FULL_THRESH_ASSERT_VAL => 29,
      C_PROG_FULL_THRESH_NEGATE_VAL => 28,
      C_PROG_FULL_TYPE => 0,
      C_RD_DATA_COUNT_WIDTH => 5,
      C_RD_DEPTH => 32,
      C_RD_FREQ => 1,
      C_RD_PNTR_WIDTH => 5,
      C_UNDERFLOW_LOW => 0,
      C_USE_DOUT_RST => 1,
      C_USE_ECC => 0,
      C_USE_EMBEDDED_REG => 0,
      C_USE_PIPELINE_REG => 0,
      C_POWER_SAVING_MODE => 0,
      C_USE_FIFO16_FLAGS => 0,
      C_USE_FWFT_DATA_COUNT => 0,
      C_VALID_LOW => 0,
      C_WR_ACK_LOW => 0,
      C_WR_DATA_COUNT_WIDTH => 5,
      C_WR_DEPTH => 32,
      C_WR_FREQ => 1,
      C_WR_PNTR_WIDTH => 5,
      C_WR_RESPONSE_LATENCY => 1,
      C_MSGON_VAL => 1,
      C_ENABLE_RST_SYNC => 0,
      C_ERROR_INJECTION_TYPE => 0,
      C_SYNCHRONIZER_STAGE => 2,
      C_INTERFACE_TYPE => 0,
      C_AXI_TYPE => 1,
      C_HAS_AXI_WR_CHANNEL => 1,
      C_HAS_AXI_RD_CHANNEL => 1,
      C_HAS_SLAVE_CE => 0,
      C_HAS_MASTER_CE => 0,
      C_ADD_NGC_CONSTRAINT => 0,
      C_USE_COMMON_OVERFLOW => 0,
      C_USE_COMMON_UNDERFLOW => 0,
      C_USE_DEFAULT_SETTINGS => 0,
      C_AXI_ID_WIDTH => 1,
      C_AXI_ADDR_WIDTH => 32,
      C_AXI_DATA_WIDTH => 64,
      C_AXI_LEN_WIDTH => 8,
      C_AXI_LOCK_WIDTH => 1,
      C_HAS_AXI_ID => 0,
      C_HAS_AXI_AWUSER => 0,
      C_HAS_AXI_WUSER => 0,
      C_HAS_AXI_BUSER => 0,
      C_HAS_AXI_ARUSER => 0,
      C_HAS_AXI_RUSER => 0,
      C_AXI_ARUSER_WIDTH => 1,
      C_AXI_AWUSER_WIDTH => 1,
      C_AXI_WUSER_WIDTH => 1,
      C_AXI_BUSER_WIDTH => 1,
      C_AXI_RUSER_WIDTH => 1,
      C_HAS_AXIS_TDATA => 1,
      C_HAS_AXIS_TID => 0,
      C_HAS_AXIS_TDEST => 0,
      C_HAS_AXIS_TUSER => 1,
      C_HAS_AXIS_TREADY => 1,
      C_HAS_AXIS_TLAST => 0,
      C_HAS_AXIS_TSTRB => 0,
      C_HAS_AXIS_TKEEP => 0,
      C_AXIS_TDATA_WIDTH => 8,
      C_AXIS_TID_WIDTH => 1,
      C_AXIS_TDEST_WIDTH => 1,
      C_AXIS_TUSER_WIDTH => 4,
      C_AXIS_TSTRB_WIDTH => 1,
      C_AXIS_TKEEP_WIDTH => 1,
      C_WACH_TYPE => 0,
      C_WDCH_TYPE => 0,
      C_WRCH_TYPE => 0,
      C_RACH_TYPE => 0,
      C_RDCH_TYPE => 0,
      C_AXIS_TYPE => 0,
      C_IMPLEMENTATION_TYPE_WACH => 1,
      C_IMPLEMENTATION_TYPE_WDCH => 1,
      C_IMPLEMENTATION_TYPE_WRCH => 1,
      C_IMPLEMENTATION_TYPE_RACH => 1,
      C_IMPLEMENTATION_TYPE_RDCH => 1,
      C_IMPLEMENTATION_TYPE_AXIS => 1,
      C_APPLICATION_TYPE_WACH => 0,
      C_APPLICATION_TYPE_WDCH => 0,
      C_APPLICATION_TYPE_WRCH => 0,
      C_APPLICATION_TYPE_RACH => 0,
      C_APPLICATION_TYPE_RDCH => 0,
      C_APPLICATION_TYPE_AXIS => 0,
      C_PRIM_FIFO_TYPE_WACH => "512x36",
      C_PRIM_FIFO_TYPE_WDCH => "1kx36",
      C_PRIM_FIFO_TYPE_WRCH => "512x36",
      C_PRIM_FIFO_TYPE_RACH => "512x36",
      C_PRIM_FIFO_TYPE_RDCH => "1kx36",
      C_PRIM_FIFO_TYPE_AXIS => "1kx18",
      C_USE_ECC_WACH => 0,
      C_USE_ECC_WDCH => 0,
      C_USE_ECC_WRCH => 0,
      C_USE_ECC_RACH => 0,
      C_USE_ECC_RDCH => 0,
      C_USE_ECC_AXIS => 0,
      C_ERROR_INJECTION_TYPE_WACH => 0,
      C_ERROR_INJECTION_TYPE_WDCH => 0,
      C_ERROR_INJECTION_TYPE_WRCH => 0,
      C_ERROR_INJECTION_TYPE_RACH => 0,
      C_ERROR_INJECTION_TYPE_RDCH => 0,
      C_ERROR_INJECTION_TYPE_AXIS => 0,
      C_DIN_WIDTH_WACH => 32,
      C_DIN_WIDTH_WDCH => 64,
      C_DIN_WIDTH_WRCH => 2,
      C_DIN_WIDTH_RACH => 32,
      C_DIN_WIDTH_RDCH => 64,
      C_DIN_WIDTH_AXIS => 1,
      C_WR_DEPTH_WACH => 16,
      C_WR_DEPTH_WDCH => 1024,
      C_WR_DEPTH_WRCH => 16,
      C_WR_DEPTH_RACH => 16,
      C_WR_DEPTH_RDCH => 1024,
      C_WR_DEPTH_AXIS => 1024,
      C_WR_PNTR_WIDTH_WACH => 4,
      C_WR_PNTR_WIDTH_WDCH => 10,
      C_WR_PNTR_WIDTH_WRCH => 4,
      C_WR_PNTR_WIDTH_RACH => 4,
      C_WR_PNTR_WIDTH_RDCH => 10,
      C_WR_PNTR_WIDTH_AXIS => 10,
      C_HAS_DATA_COUNTS_WACH => 0,
      C_HAS_DATA_COUNTS_WDCH => 0,
      C_HAS_DATA_COUNTS_WRCH => 0,
      C_HAS_DATA_COUNTS_RACH => 0,
      C_HAS_DATA_COUNTS_RDCH => 0,
      C_HAS_DATA_COUNTS_AXIS => 0,
      C_HAS_PROG_FLAGS_WACH => 0,
      C_HAS_PROG_FLAGS_WDCH => 0,
      C_HAS_PROG_FLAGS_WRCH => 0,
      C_HAS_PROG_FLAGS_RACH => 0,
      C_HAS_PROG_FLAGS_RDCH => 0,
      C_HAS_PROG_FLAGS_AXIS => 0,
      C_PROG_FULL_TYPE_WACH => 0,
      C_PROG_FULL_TYPE_WDCH => 0,
      C_PROG_FULL_TYPE_WRCH => 0,
      C_PROG_FULL_TYPE_RACH => 0,
      C_PROG_FULL_TYPE_RDCH => 0,
      C_PROG_FULL_TYPE_AXIS => 0,
      C_PROG_FULL_THRESH_ASSERT_VAL_WACH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_WDCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_WRCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_RACH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_RDCH => 1023,
      C_PROG_FULL_THRESH_ASSERT_VAL_AXIS => 1023,
      C_PROG_EMPTY_TYPE_WACH => 0,
      C_PROG_EMPTY_TYPE_WDCH => 0,
      C_PROG_EMPTY_TYPE_WRCH => 0,
      C_PROG_EMPTY_TYPE_RACH => 0,
      C_PROG_EMPTY_TYPE_RDCH => 0,
      C_PROG_EMPTY_TYPE_AXIS => 0,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH => 1022,
      C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS => 1022,
      C_REG_SLICE_MODE_WACH => 0,
      C_REG_SLICE_MODE_WDCH => 0,
      C_REG_SLICE_MODE_WRCH => 0,
      C_REG_SLICE_MODE_RACH => 0,
      C_REG_SLICE_MODE_RDCH => 0,
      C_REG_SLICE_MODE_AXIS => 0
    )
    PORT MAP (
      backup                              => '0',
      backup_marker                       => '0',
      clk                                 => '0',
      rst                                 => '0',
      srst                                => '0',
      wr_clk                              => wr_clk,
      wr_rst                              => wr_rst,
      rd_clk                              => rd_clk,
      rd_rst                              => rd_rst,
      din                                 => din,
      wr_en                               => din_vld,
      rd_en                               => dout_rdy,
      prog_empty_thresh                   => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 5)),
      prog_empty_thresh_assert            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 5)),
      prog_empty_thresh_negate            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 5)),
      prog_full_thresh                    => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 5)),
      prog_full_thresh_assert             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 5)),
      prog_full_thresh_negate             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 5)),
      int_clk                             => '0',
      injectdbiterr                       => '0',
      injectsbiterr                       => '0',
      sleep                               => '0',
      dout                                => dout,
      full                                => full,
      almost_full                         => almost_full,
      wr_ack                              => wr_ack,
      overflow                            => overflow,
      empty                               => empty,
      almost_empty                        => almost_empty,
      valid                               => valid,
      underflow                           => underflow,
      data_count                          => data_count,
      rd_data_count                       => rd_data_count,
      wr_data_count                       => wr_data_count,
      prog_full                           => prog_full,
      prog_empty                          => prog_empty,
      sbiterr                             => sbiterr,
      dbiterr                             => dbiterr,
      wr_rst_busy                         => wr_rst_busy,
      rd_rst_busy                         => rd_rst_busy,

      m_aclk                              => '0',
      s_aclk                              => '0',
      s_aresetn                           => '0',
      m_aclk_en                           => '0',
      s_aclk_en                           => '0',
      m_axi_awid                          => m_axi_awid,
      m_axi_awaddr                        => m_axi_awaddr,
      m_axi_awlen                         => m_axi_awlen,
      m_axi_awsize                        => m_axi_awsize,
      m_axi_awburst                       => m_axi_awburst,
      m_axi_awlock                        => m_axi_awlock,
      m_axi_awcache                       => m_axi_awcache,
      m_axi_awprot                        => m_axi_awprot,
      m_axi_awqos                         => m_axi_awqos,
      m_axi_awregion                      => m_axi_awregion,
      m_axi_awuser                        => m_axi_awuser,
      m_axi_awvalid                       => m_axi_awvalid,
      m_axi_awready                       => '0',
      m_axi_wid                           => m_axi_wid,
      m_axi_wdata                         => m_axi_wdata,
      m_axi_wstrb                         => m_axi_wstrb,
      m_axi_wlast                         => m_axi_wlast,
      m_axi_wuser                         => m_axi_wuser,
      m_axi_wvalid                        => m_axi_wvalid,
      m_axi_wready                        => '0',
      m_axi_bid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_bresp                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      m_axi_buser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_bvalid                        => '0',
      m_axi_bready                        => m_axi_bready,
      s_axi_awid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awaddr                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axi_awlen                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_awsize                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_awburst                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      s_axi_awlock                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awcache                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awprot                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_awqos                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awregion                      => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_awuser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_awvalid                       => '0',
      s_axi_awready                       => s_axi_awready,
      s_axi_wid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_wdata                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
      s_axi_wstrb                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_wlast                         => '0',
      s_axi_wuser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_wvalid                        => '0',
      s_axi_wready                        => s_axi_wready,
        
      s_axi_bid                           => s_axi_bid,
      s_axi_bresp                         => s_axi_bresp,
      s_axi_buser                         => s_axi_buser,
      s_axi_bready                        => '0',
      m_axi_arid                          => m_axi_arid,
      m_axi_araddr                        => m_axi_araddr,
      m_axi_arlen                         => m_axi_arlen,
      m_axi_arsize                        => m_axi_arsize,
      m_axi_arburst                       => m_axi_arburst,
      m_axi_arlock                        => m_axi_arlock,
      m_axi_arcache                       => m_axi_arcache,
      m_axi_arprot                        => m_axi_arprot,
      m_axi_arqos                         => m_axi_arqos,
      m_axi_arregion                      => m_axi_arregion,
      m_axi_aruser                        => m_axi_aruser,
      m_axi_arvalid                       => m_axi_arvalid,
      m_axi_arready                       => '0',
        
      m_axi_rid                           => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_rdata                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
      m_axi_rresp                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      m_axi_rlast                         => '0',
      m_axi_ruser                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_rvalid                        => '0',
      m_axi_rready                        => m_axi_rready,

      s_axi_arid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_araddr                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axi_arlen                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axi_arsize                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_arburst                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      s_axi_arlock                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_arcache                       => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_arprot                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      s_axi_arqos                         => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_arregion                      => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_aruser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axi_arvalid                       => '0',
      s_axi_arready                       => s_axi_arready,
      s_axi_rid                           => s_axi_rid,
      s_axi_rdata                         => s_axi_rdata,
      s_axi_rresp                         => s_axi_rresp,
      s_axi_rlast                         => s_axi_rlast,
      s_axi_ruser                         => s_axi_ruser,
      s_axi_rready                        => '0',
      m_axis_tvalid                       => m_axis_tvalid,
      m_axis_tready                       => '0',
      m_axis_tdata                        => m_axis_tdata ,
      m_axis_tstrb                        => m_axis_tstrb ,
      m_axis_tkeep                        => m_axis_tkeep ,
      m_axis_tlast                        => m_axis_tlast ,
      m_axis_tid                          => m_axis_tid   ,
      m_axis_tdest                        => m_axis_tdest ,
      m_axis_tuser                        => m_axis_tuser ,
      s_axis_tvalid                       => '0',
      s_axis_tready                       => s_axis_tready,
      s_axis_tdata                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 8)),
      s_axis_tstrb                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tkeep                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tlast                        => '0',
      s_axis_tid                          => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tdest                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      s_axis_tuser                        => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_injectsbiterr                => '0',
      axi_aw_injectdbiterr                => '0',
      axi_aw_prog_full_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_prog_empty_thresh            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_aw_data_count                   => axi_aw_data_count,
      axi_aw_wr_data_count                => axi_aw_wr_data_count,
      axi_aw_rd_data_count                => axi_aw_rd_data_count,
      axi_aw_sbiterr                      => axi_aw_sbiterr,
      axi_aw_dbiterr                      => axi_aw_dbiterr,
      axi_aw_overflow                     => axi_aw_overflow,
      axi_aw_underflow                    => axi_aw_underflow,
      axi_aw_prog_full                    => axi_aw_prog_full,
      axi_aw_prog_empty                   => axi_aw_prog_empty,
      axi_w_injectsbiterr                 => '0',
      axi_w_injectdbiterr                 => '0',
      axi_w_prog_full_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_w_prog_empty_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_w_data_count                    => axi_w_data_count,
      axi_w_wr_data_count                 => axi_w_wr_data_count,
      axi_w_rd_data_count                 => axi_w_rd_data_count,
      axi_w_sbiterr                       => axi_w_sbiterr,
      axi_w_dbiterr                       => axi_w_dbiterr,
      axi_w_overflow                      => axi_w_overflow,
      axi_w_underflow                     => axi_w_underflow,
      axi_w_prog_full                     => axi_w_prog_full,
      axi_w_prog_empty                    => axi_w_prog_empty,

      axi_b_injectsbiterr                 => '0',
      axi_b_injectdbiterr                 => '0',
      axi_b_prog_full_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_b_prog_empty_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_b_data_count                    => axi_b_data_count,
      axi_b_wr_data_count                 => axi_b_wr_data_count,
      axi_b_rd_data_count                 => axi_b_rd_data_count,
      axi_b_sbiterr                       => axi_b_sbiterr,
      axi_b_dbiterr                       => axi_b_dbiterr,
      axi_b_overflow                      => axi_b_overflow,
      axi_b_underflow                     => axi_b_underflow,
      axi_b_prog_full                     => axi_b_prog_full,
      axi_b_prog_empty                    => axi_b_prog_empty,
      axi_ar_injectsbiterr                => '0',
      axi_ar_injectdbiterr                => '0',
      axi_ar_prog_full_thresh             => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_ar_prog_empty_thresh            => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      axi_ar_data_count                    => axi_ar_data_count,
      axi_ar_wr_data_count                 => axi_ar_wr_data_count,
      axi_ar_rd_data_count                 => axi_ar_rd_data_count,
      axi_ar_sbiterr                       => axi_ar_sbiterr,
      axi_ar_dbiterr                       => axi_ar_dbiterr,
      axi_ar_overflow                      => axi_ar_overflow,
      axi_ar_underflow                     => axi_ar_underflow,
      axi_ar_prog_full                     => axi_ar_prog_full,
      axi_ar_prog_empty                    => axi_ar_prog_empty,
      axi_r_injectsbiterr                  => '0',
      axi_r_injectdbiterr                  => '0',
      axi_r_prog_full_thresh               => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_r_prog_empty_thresh              => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axi_r_data_count                     => axi_r_data_count,
      axi_r_wr_data_count                  => axi_r_wr_data_count,
      axi_r_rd_data_count                  => axi_r_rd_data_count,
      axi_r_sbiterr                        => axi_r_sbiterr,
      axi_r_dbiterr                        => axi_r_dbiterr,
      axi_r_overflow                       => axi_r_overflow,
      axi_r_underflow                      => axi_r_underflow,
      axi_r_prog_full                      => axi_r_prog_full,
      axi_r_prog_empty                     => axi_r_prog_empty,
      axis_injectsbiterr                   => '0',
      axis_injectdbiterr                   => '0',
      axis_prog_full_thresh                => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axis_prog_empty_thresh               => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 10)),
      axis_data_count                      => axis_data_count,
      axis_wr_data_count                   => axis_wr_data_count,
      axis_rd_data_count                   => axis_rd_data_count,
      axis_sbiterr                         => axis_sbiterr,
      axis_dbiterr                         => axis_dbiterr,
      axis_overflow                        => axis_overflow,
      axis_underflow                       => axis_underflow,
      axis_prog_full                       => axis_prog_full,
      axis_prog_empty                      => axis_prog_empty
    );
end rtl;




-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : xd_sync_module.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-01-22
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-- 2013-07-12  2.0      pankajk Added new ports iscalar_rqt_enable & 
--                              iscalar_rqt_enable to qualify with 
--                              iscalar_start & oscalar_start
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.async_fifo_dist_wt;
use axis_accelerator_adapter_v2_1_16.sync_ap_status;
use axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync;


entity xd_sync_module is
  generic (
    -- System generics:
    C_FAMILY              : string;  -- Xilinx FPGA family
    C_MAX_N_IARGS         : integer;
    C_MAX_N_OARGS         : integer;
    C_N_INPUT_ARGS        : integer;
    C_N_OUTPUT_ARGS       : integer;
    C_PRMRY_IS_ACLK_ASYNC : integer;
    C_MTBF_STAGES         : integer;
    C_MAX_N_ISCALARS      : integer;
    C_N_INPUT_SCALARS     : integer;
    C_MAX_N_OSCALARS      : integer;
    C_N_INOUT_SCALARS     : integer;
    C_MAX_N_IOSCALARS     : integer;
    C_N_OUTPUT_SCALARS    : integer;
    C_NONE                : integer := 2);
  port (
    -- SLAVE AXI LITE:
    S_AXI_ACLK          : in  std_logic;
    S_AXI_ARESETN       : in  std_logic;
    -- Host command input port
    host_cmd_data       : in  std_logic_vector(31 downto 0);
    host_cmd_we         : in  std_logic;
    host_cmd_rdy        : out std_logic;
    host_complete_re    : in  std_logic;
    host_cmd_error      : out std_logic;
    ---
    iarg_rqt_enable     : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    oarg_rqt_enable     : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    ---
    status_ap_start     : out std_logic;
    status_ap_done      : out std_logic;
    status_ap_idle      : out std_logic;
    status_ap_ready     : out std_logic;
    status_ap_start_clr : in  std_logic;
    status_ap_done_clr  : in  std_logic;
    status_ap_idle_clr  : in  std_logic;
    status_ap_ready_clr : in  std_logic;
    ---
    status_iarg_rqt     : out std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    status_iarg_ack     : out std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    status_oarg_rqt     : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    status_oarg_ack     : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    ---
    ap_clk              : in  std_logic;
    soft_rst            : in  std_logic;
    ap_rst              : in  std_logic;
    
    --- Control and status signals for multibuffers
    mb_iarg_rdy         : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    mb_iarg_done        : out std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    mb_oarg_rdy         : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    mb_oarg_done        : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    -- AP control handshaking
    ap_start            : out std_logic;
    ap_ready            : in  std_logic;
    ap_done             : in  std_logic;
    ap_continue         : out std_logic;
    ap_idle             : in  std_logic;
    ap_start_one_shot   : out std_logic;
    ---
    iscalar_rqt_enable  : in std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
    oscalar_rqt_enable  : in std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);

    ---
    ap_iscalar_rdy      : in  std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
    ap_iscalar_done     : out std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
    ---
    ap_oscalar_vld      : out std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
    ap_oscalar_rdy      : in  std_logic_vector(C_MAX_N_OSCALARS-1 downto 0));
end entity;

architecture rtl of xd_sync_module is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";


  type state_type is (
    idle,
    apply_input_mask,
    wait_start,
    wait_done,
    stop);
  signal state : state_type;

  signal ap_start_i : std_logic;

  ---------------------------------------
  constant OPCODE_WIDTH : integer := 4;

  constant ARG_MASK_LSB    : integer                                   := 0;
  constant ARG_MASK_MSB    : integer                                   := 7;
  constant SCALAR_MASK_LSB : integer                                   := 8;
  constant SCALAR_MASK_MSB : integer                                   := 15;
  constant OPCODE_LSB      : integer                                   := 16;
  constant OPCODE_MSB      : integer                                   := OPCODE_LSB+OPCODE_WIDTH-1;
  constant ISCALAR_MASK_LSB: integer                                   := OPCODE_MSB+1;
  constant ISCALAR_MASK_MSB: integer                                   := ISCALAR_MASK_LSB+7;


  -- input commands
  constant UPDATE_INPUT    : std_logic_vector(OPCODE_WIDTH-1 downto 0) := "0000";
  constant UPDATE_OUTPUT   : std_logic_vector(OPCODE_WIDTH-1 downto 0) := "0001";
  constant EXECUTE_STEP    : std_logic_vector(OPCODE_WIDTH-1 downto 0) := "0010";
  constant EXECUTE_RESUME  : std_logic_vector(OPCODE_WIDTH-1 downto 0) := "0100";
  constant EXECUTE_STOP    : std_logic_vector(OPCODE_WIDTH-1 downto 0) := "0101";
  --
  constant EXECUTE         : std_logic_vector(1 downto 0)              := "10";
  constant IARG_UM_LSB     : integer                                   := 0;
  constant OARG_UM_LSB     : integer                                   := 8;
  constant ISCALAR_UM_LSB  : integer                                   := 16;
  constant OSCALAR_UM_LSB  : integer                                   := 24;

-- pragma translate_off
  type dbg_opcode_type is (
    op_update_input,
    op_update_output,
    op_exec_step,
    op_exec_resume,
    op_exec_stop,
    op_invalid);

  signal dbg_opcode : dbg_opcode_type;
-- pragma translate_on


  signal command_full     : std_logic;
  signal command          : std_logic_vector(31 downto 0);
  signal command_vld      : std_logic;
  signal command_rdy      : std_logic;
  --
  signal arg_mask         : std_logic_vector(7 downto 0);
  signal scalar_mask      : std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
  signal opcode           : std_logic_vector(OPCODE_WIDTH-1 downto 0);
  --
  signal input_mask_we    : std_logic;
  signal input_mask_clr   : std_logic;
  signal output_mask_we   : std_logic;
  signal output_mask_clr  : std_logic;
  --
  signal iarg_mask        : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal oarg_mask        : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal iscalar_mask     : std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
  signal oscalar_mask     : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
  --
  signal iarg_start       : std_logic;
  signal iarg_start_sync  : std_logic;
  signal oarg_start       : std_logic;
  signal oarg_start_sync  : std_logic;
  signal iscalar_start    : std_logic;
  signal iscalar_start_sync: std_logic;
  signal oscalar_start    : std_logic;
  signal oscalar_start_sync    : std_logic;
  signal global_start     : std_logic;
  --
  signal mb_iarg_done_i   : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal mb_oarg_done_i   : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  --
  -- Core ap_start delayed version.
  signal core_ap_start    : std_logic;
  signal set_ap_start     : std_logic;
  signal set_ap_start_r   : std_logic;
  signal clr_ap_start     : std_logic;
  
  signal run_continous    : std_logic;
  signal ap_cmd_error     : std_logic;
  signal host_cmd_error_i : std_logic;

  signal axi_rst         : std_logic;
  
  --- Syncrhonizer signals
  signal iarg_rqt_enable_sync : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal oarg_rqt_enable_sync : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal ap_start_i_sync      : std_logic;
  signal ap_done_sync         : std_logic;
  signal ap_idle_sync         : std_logic;
  signal ap_ready_sync        : std_logic;
  signal ap_cmd_error_sync    : std_logic;
  signal ap_rstn              : std_logic;
  signal ap_rst_vec         : std_logic_vector(0 downto 0);
  signal ap_rst_axi_sync    : std_logic;
  signal ap_rst_sync        : std_logic_vector(0 downto 0);
  signal axin_rst            : std_logic;

  constant C_EXTRA_SYNCS  : integer            := 1;

      ATTRIBUTE async_reg           : STRING;
  ATTRIBUTE async_reg OF axi_rst  : SIGNAL IS "true";

begin

 
   -- Active low ap_rst
   ap_rstn <= not ap_rst;
   
   
   ----------------------
   --- Reset Synchronizer
   ----------------------
--   EN_SYNC_GEN : if (C_PRMRY_IS_ACLK_ASYNC = 1) generate
--   begin
--   
--
--    XD_IARG_RQT_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
--        generic map (
--        C_CDC_TYPE                 => 1,
--        C_RESET_STATE              => 0,
--        C_SINGLE_BIT               => 0,
--        C_FLOP_INPUT               => 1,
--        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
--        C_MTBF_STAGES              => C_MTBF_STAGES
--        )
--        port map (
--        prmry_aclk                 => S_AXI_ACLK,
--        prmry_resetn               => S_AXI_ARESETN,
--        prmry_in                   => '0',
--        prmry_vect_in              => iarg_rqt_enable,
--
--        scndry_aclk                => ap_clk,
--        scndry_resetn              => ap_rstn,
--        scndry_out                 => open,
--        scndry_vect_out            => iarg_rqt_enable_sync
--        );
--
--
--    XD_OARG_RQT_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
--        generic map (
--        C_CDC_TYPE                 => 1,
--        C_RESET_STATE              => 0,
--        C_SINGLE_BIT               => 0,
--        C_FLOP_INPUT               => 0,
--        C_VECTOR_WIDTH             => C_MAX_N_OARGS,
--        C_MTBF_STAGES              => C_MTBF_STAGES
--        )
--        port map (
--        prmry_aclk                 => S_AXI_ACLK,
--        prmry_resetn               => S_AXI_ARESETN,
--        prmry_in                   => '0',
--        prmry_vect_in              => oarg_rqt_enable,
--
--        scndry_aclk                => ap_clk,
--        scndry_resetn              => ap_rstn,
--        scndry_out                 => open,
--        scndry_vect_out            => oarg_rqt_enable_sync
--        );
--    
--   end generate EN_SYNC_GEN;
--
--   NO_SYNC_GEN : if (C_PRMRY_IS_ACLK_ASYNC = 0) generate
--   begin
   
       iarg_rqt_enable_sync <= iarg_rqt_enable;
       oarg_rqt_enable_sync <= oarg_rqt_enable;
    
--   end generate NO_SYNC_GEN;


   ----------------------
   --- Reset Synchronizer
   ----------------------
   EN_APCLK_LITE_SYNC_GEN : if (C_PRMRY_IS_ACLK_ASYNC = 1) generate
   begin
   

    AP_START_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 0,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 0,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => ap_rstn,
        prmry_in                   => ap_start_i,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => ap_start_i_sync,
        scndry_vect_out            => open
        );


    AP_DONE_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 0,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => ap_rstn,
        prmry_in                   => ap_done,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => ap_done_sync,
        scndry_vect_out            => open
        );

    AP_IDLE_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 0,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => ap_rstn,
        prmry_in                   => ap_idle,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => ap_idle_sync,
        scndry_vect_out            => open
        );

    AP_READY_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 0,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => ap_rstn,
        prmry_in                   => ap_ready,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => ap_ready_sync,
        scndry_vect_out            => open
        );
    
    AP_CMDERR_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 0,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 0,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => ap_rstn,
        prmry_in                   => ap_cmd_error,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => ap_cmd_error_sync,
        scndry_vect_out            => open
        );

	
   end generate EN_APCLK_LITE_SYNC_GEN;


   NO_APCLK_LITE_SYNC_GEN : if (C_PRMRY_IS_ACLK_ASYNC = 0) generate
   begin
--   
--       ap_start_i_sync   <= ap_start_i;
--       ap_done_sync      <= ap_done;
--       ap_idle_sync      <= ap_idle;
--       ap_ready_sync     <= ap_ready;
--       ap_cmd_error_sync <= ap_cmd_error;
--    
     AP_START_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 0,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 0,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => 2--C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => ap_rstn,
        prmry_in                   => ap_start_i,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => ap_start_i_sync,
        scndry_vect_out            => open
        );


    AP_DONE_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 0,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => 2--C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => ap_rstn,
        prmry_in                   => ap_done,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => ap_done_sync,
        scndry_vect_out            => open
        );

    AP_IDLE_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 0,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => 2--C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => ap_rstn,
        prmry_in                   => ap_idle,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => ap_idle_sync,
        scndry_vect_out            => open
        );

    AP_READY_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 0,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => 2--C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => ap_rstn,
        prmry_in                   => ap_ready,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => ap_ready_sync,
        scndry_vect_out            => open
        );
    
    AP_CMDERR_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 0,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 0,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => 2--C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => ap_rstn,
        prmry_in                   => ap_cmd_error,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => ap_cmd_error_sync,
        scndry_vect_out            => open
        );

   end generate NO_APCLK_LITE_SYNC_GEN;


   ----------------------
   --- Reset Synchronizer
   ----------------------
 
 
  mb_iarg_done <= mb_iarg_done_i;
  mb_oarg_done <= mb_oarg_done_i;

  axin_rst <= not(S_AXI_ARESETN);
 -- axi_rst <= not(S_AXI_ARESETN) or ap_rst;
--    ap_rst_vec(0) <=  ap_rst;
--
--    rst_sync: ENTITY axis_accelerator_adapter_v2_1_16.synchronizer_ff
--    GENERIC MAP (
--     C_HAS_RST => 1,
--     C_WIDTH   => 1
--     )
--    PORT MAP ( 
--     RST       => S_AXI_ARESETN,
--     CLK       => S_AXI_ACLK,   
--     D         => ap_rst_vec,
--     Q         => ap_rst_sync
--     );    

--     process(S_AXI_ACLK)
--       begin
--         if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
--             ap_rst_vec(0) <=  ap_rst;
--             ap_rst_sync(0) <= ap_rst_vec(0);
--         end if;
--     end process;

--     process(S_AXI_ACLK, S_AXI_ARESETN)
--       begin
--         if(S_AXI_ARESETN='0') then
--             axi_rst    <= '1';
--         elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
--             axi_rst    <= ap_rst_axi_sync;
--         end if;
--     end process;

      ap_rst_axi_sync1 : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
       generic map (
       C_CDC_TYPE                 => 1,
       C_RESET_STATE              => 1,
       C_SINGLE_BIT               => 1,
       C_FLOP_INPUT               => 0,
       C_VECTOR_WIDTH             => 1,
       C_MTBF_STAGES              => 2
       )
       port map (
       prmry_aclk                 => '0',
       prmry_resetn               => '0',
       prmry_in                   => ap_rst,
       prmry_vect_in              => (others=>'0'),

       scndry_aclk                => S_AXI_ACLK,
       scndry_resetn              => S_AXI_ARESETN,
       scndry_out                 => axi_rst,
       scndry_vect_out            => open
       );




  ---------------------------------------
  COMMAND_FIFO_NEW : entity axis_accelerator_adapter_v2_1_16.async_fifo_dist_inst
    generic map (
      C_FAMILY => C_FAMILY,
      DEPTH    => 32,
      WIDTH    => 32)
    port map (
      din      => host_cmd_data,
      din_vld  => host_cmd_we,
      din_rdy  => host_cmd_rdy,
      wr_clk   => S_AXI_ACLK,
      wr_rst   => axi_rst,
      dout     => command,
      dout_vld => command_vld,
      dout_rdy => command_rdy,
      rd_clk   => ap_clk,
      rd_rst   => ap_rst);

  arg_mask    <= command(ARG_MASK_MSB downto ARG_MASK_LSB);
  scalar_mask <= command(ISCALAR_MASK_MSB downto ISCALAR_MASK_LSB) & command(SCALAR_MASK_MSB downto SCALAR_MASK_LSB);
  --scalar_mask <= command(SCALAR_MASK_MSB downto SCALAR_MASK_LSB);
  opcode      <= command(OPCODE_MSB downto OPCODE_LSB);

  process(ap_clk)
  begin
    if(ap_clk'event and ap_clk = '1') then
      if(ap_rst = '1' or input_mask_clr = '1') then
        iarg_mask    <= (others => '0');
        iscalar_mask <= (others => '0');
      elsif(input_mask_we = '1') then
        iarg_mask    <= iarg_mask or arg_mask;
        iscalar_mask <= iscalar_mask or scalar_mask;
      end if;
    end if;
  end process;

  process(ap_clk)
  begin
    if(ap_clk'event and ap_clk = '1') then
      if(ap_rst = '1' or output_mask_clr = '1') then
        oarg_mask    <= (others => '0');
        oscalar_mask <= (others => '0');
      elsif(output_mask_we = '1') then
        oarg_mask    <= oarg_mask or arg_mask;
        oscalar_mask <= oscalar_mask or scalar_mask(15 downto 0);
      end if;
    end if;
  end process;

  ----------------------------------------

  
  USE_INPUT_ARGS_GEN : if (C_N_INPUT_ARGS > 0) generate
  begin
    iarg_start <= and_reduce(mb_iarg_rdy(C_N_INPUT_ARGS-1 downto 0) or not(iarg_rqt_enable_sync(C_N_INPUT_ARGS-1 downto 0)));
  end generate USE_INPUT_ARGS_GEN;

  NO_INPUT_ARGS_GEN : if (C_N_INPUT_ARGS = 0) generate
  begin
    iarg_start <= '1';
  end generate NO_INPUT_ARGS_GEN;

  USE_OUTPUT_ARGS_GEN : if (C_N_OUTPUT_ARGS > 0) generate
  begin
    oarg_start <= and_reduce(mb_oarg_rdy(C_N_OUTPUT_ARGS-1 downto 0) or not(oarg_rqt_enable_sync(C_N_OUTPUT_ARGS-1 downto 0)));
  end generate USE_OUTPUT_ARGS_GEN;

  NO_OUTPUT_ARGS_GEN : if (C_N_OUTPUT_ARGS = 0) generate
  begin
    oarg_start <= '1';
  end generate NO_OUTPUT_ARGS_GEN;

  USE_INPUT_SCALAR_GEN1 : if (C_N_INPUT_SCALARS+C_N_INOUT_SCALARS > 0 ) generate
  begin
    iscalar_start <= and_reduce((ap_iscalar_rdy(C_MAX_N_ISCALARS-1 downto 0)) or not(iscalar_rqt_enable(C_MAX_N_ISCALARS-1 downto 0)));
    --iscalar_start <= and_reduce(ap_iscalar_rdy(C_N_INPUT_SCALARS-1 downto 0) or not(iscalar_rqt_enable(C_N_INPUT_SCALARS-1 downto 0))) and and_reduce(ap_iscalar_rdy(C_MAX_N_ISCALARS+C_N_INOUT_SCALARS-1 downto C_MAX_N_ISCALARS) or not(iscalar_rqt_enable(C_MAX_N_ISCALARS+C_N_INOUT_SCALARS-1 downto C_MAX_N_ISCALARS)));
  end generate USE_INPUT_SCALAR_GEN1;

--  USE_INPUT_SCALAR_GEN2 : if (C_N_INPUT_SCALARS > 0 and C_N_INOUT_SCALARS = 0) generate
--  begin
--    --iscalar_start <= and_reduce(ap_iscalar_rdy(C_N_INPUT_SCALARS-1 downto 0));
--    iscalar_start <= and_reduce(ap_iscalar_rdy(C_N_INPUT_SCALARS-1 downto 0) or not(iscalar_rqt_enable(C_N_INPUT_SCALARS-1 downto 0)));
--  end generate USE_INPUT_SCALAR_GEN2;
--
--  USE_INPUT_SCALAR_GEN3 : if (C_N_INPUT_SCALARS = 0 and C_N_INOUT_SCALARS > 0) generate
--  begin
--    --iscalar_start <= and_reduce(ap_iscalar_rdy(C_N_INPUT_SCALARS-1 downto 0));
--    iscalar_start <= and_reduce(ap_iscalar_rdy(C_N_INOUT_SCALARS+C_MAX_N_ISCALARS-1 downto C_MAX_N_ISCALARS) or not(iscalar_rqt_enable(C_N_INOUT_SCALARS+C_MAX_N_ISCALARS-1 downto C_MAX_N_ISCALARS)));
--  end generate USE_INPUT_SCALAR_GEN3;


  NO_INPUT_SCALAR_GEN : if (C_N_INPUT_SCALARS = 0 and C_N_INOUT_SCALARS = 0) generate
  begin
    iscalar_start <= '1';
  end generate NO_INPUT_SCALAR_GEN;

  USE_OUTPUT_SCALAR_GEN1 : if (C_N_OUTPUT_SCALARS+C_N_INOUT_SCALARS > 0 ) generate
  begin
    oscalar_start <= and_reduce((ap_oscalar_rdy(C_MAX_N_OSCALARS-1 downto 0)) or not(oscalar_rqt_enable(C_MAX_N_OSCALARS-1 downto 0)));
    --oscalar_start <= and_reduce(ap_oscalar_rdy(C_N_OUTPUT_SCALARS-1 downto 0) or not(oscalar_rqt_enable(C_N_OUTPUT_SCALARS-1 downto 0)));
  end generate USE_OUTPUT_SCALAR_GEN1;

--  USE_OUTPUT_SCALAR_GEN2 : if (C_N_OUTPUT_SCALARS > 0 and C_N_INOUT_SCALARS > 0) generate
--  begin
--    --oscalar_start <= and_reduce(ap_oscalar_rdy(C_N_OUTPUT_SCALARS-1 downto 0));
--    oscalar_start <= and_reduce(ap_oscalar_rdy(C_N_INOUT_SCALARS+C_MAX_N_OSCALARS-1 downto C_MAX_N_OSCALARS) or not(oscalar_rqt_enable(C_N_INOUT_SCALARS+C_MAX_N_OSCALARS-1 downto C_MAX_N_OSCALARS))) and and_reduce(ap_oscalar_rdy(C_N_OUTPUT_SCALARS-1 downto 0) or not(oscalar_rqt_enable(C_N_OUTPUT_SCALARS-1 downto 0)));
--  end generate USE_OUTPUT_SCALAR_GEN2;
--
--  USE_OUTPUT_SCALAR_GEN3 : if (C_N_OUTPUT_SCALARS = 0 and C_N_INOUT_SCALARS > 0) generate
--  begin
--    --oscalar_start <= and_reduce(ap_oscalar_rdy(C_N_OUTPUT_SCALARS-1 downto 0));
--    oscalar_start <= and_reduce(ap_oscalar_rdy(C_N_INOUT_SCALARS+C_MAX_N_OSCALARS-1 downto C_MAX_N_OSCALARS) or not(oscalar_rqt_enable(C_N_INOUT_SCALARS+C_MAX_N_OSCALARS-1 downto C_MAX_N_OSCALARS)));
--  end generate USE_OUTPUT_SCALAR_GEN3;

  NO_OUTPUT_SCALAR_GEN : if (C_N_OUTPUT_SCALARS = 0 and C_N_INOUT_SCALARS = 0) generate
  begin
    oscalar_start <= '1';
  end generate NO_OUTPUT_SCALAR_GEN;


-- pragma translate_off
  process(opcode)
  begin
    dbg_opcode <= op_invalid;
    case opcode is
      when UPDATE_INPUT   => dbg_opcode <= op_update_input;
      when UPDATE_OUTPUT  => dbg_opcode <= op_update_output;
      when EXECUTE_STEP   => dbg_opcode <= op_exec_step;
      when EXECUTE_RESUME => dbg_opcode <= op_exec_resume;
      when EXECUTE_STOP   => dbg_opcode <= op_exec_stop;
      when others         => null;
    end case;
  end process;
-- pragma translate_on

EXISTING : if (C_EXTRA_SYNCS = 0) generate
begin

  global_start <= iarg_start and oarg_start and iscalar_start and oscalar_start;
end generate EXISTING;

NEW_INTRO : if (C_EXTRA_SYNCS = 1) generate
begin

         AP_IARGSTART_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => ap_rst,
	prmry_in                   => iarg_start,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => ap_clk,
        scndry_resetn              => ap_rst,
        scndry_out                 => iarg_start_sync,
        scndry_vect_out            => open
        );

    AP_OARGSTART_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => S_AXI_ACLK,
        prmry_resetn               => S_AXI_ARESETN,
	prmry_in                   => oarg_start,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => ap_clk,
        scndry_resetn              => ap_rst,
        scndry_out                 => oarg_start_sync,
        scndry_vect_out            => open
        );

   AP_ISCALARSTART_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => S_AXI_ACLK,
        prmry_resetn               => S_AXI_ARESETN,
	prmry_in                   => iscalar_start,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => ap_clk,
        scndry_resetn              => ap_rst,
	scndry_out                 => iscalar_start_sync,
        scndry_vect_out            => open
        );

   AP_OSCALARSTART_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => S_AXI_ACLK,
        prmry_resetn               => S_AXI_ARESETN,
	prmry_in                   => oscalar_start,
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => ap_clk,
        scndry_resetn              => ap_rst,
	scndry_out                 => oscalar_start_sync,
        scndry_vect_out            => open
        );


  global_start <= iarg_start_sync and oarg_start_sync and iscalar_start_sync and oscalar_start_sync;
end generate NEW_INTRO;

  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      state             <= idle;
      ap_start_i        <= '0';
      ap_start_one_shot <= '0';
      run_continous     <= '0';
    elsif(ap_clk'event and ap_clk = '1') then
      ap_start_i        <= '0';
      ap_start_one_shot <= '0';
      case state is
        when idle =>
          -- Wait until there is a command available
          if (command_vld = '1') then
            case opcode is
              when EXECUTE_STEP =>
                state <= wait_start;
              when EXECUTE_RESUME =>
                run_continous <= '1';
                state         <= wait_start;
              when others =>
            end case;
          end if;

        when apply_input_mask =>
          -- In this state we apply the command. For input arguments and
          -- scalars we give a "done" of the elements.
          state <= wait_start;

        when wait_start =>
          if (run_continous = '0') then
            -- accelerator start is given when:
            -- 1.- all input arguments have data valid to process.
            -- 2.- all ouput arguments have free memory where to wite the
            -- processed data.
            if (global_start = '1') then
              state             <= wait_done;
              ap_start_i        <= '1';
              ap_start_one_shot <= '1';
            end if;

          else

            if (command_vld = '1') then
              case opcode is
                when EXECUTE_STOP =>
                  run_continous <= '0';
                  state         <= idle;
                when others =>
                  state <= stop;
              end case;
            elsif (global_start = '1') then
              state             <= wait_done;
              ap_start_i        <= '1';
              ap_start_one_shot <= '1';
            end if;

          end if;

        when wait_done =>
          if(ap_done = '1') then
            if (run_continous = '0') then
              state <= idle;
            else
              state <= apply_input_mask;
            end if;
          end if;

        when others =>
      end case;
    end if;
  end process;

  ap_start <= core_ap_start;

  process(state, global_start, run_continous, command_vld, opcode, iarg_mask, iscalar_mask,
          arg_mask, scalar_mask,
          ap_done, oarg_mask, oscalar_mask)
  begin
    command_rdy    <= '0';
    input_mask_we  <= '0';
    output_mask_we <= '0';

    input_mask_clr  <= '0';
    output_mask_clr <= '0';

    mb_iarg_done_i  <= (others => '0');
    ap_iscalar_done <= (others => '0');
    mb_oarg_done_i  <= (others => '0');
    ap_oscalar_vld  <= (others => '0');

    set_ap_start <= '0';
    ap_cmd_error <= '0';

    case state is
      when idle =>
        command_rdy <= command_vld;

        if(command_vld = '1') then
          case opcode is
            when UPDATE_INPUT =>
              input_mask_we   <= '1';
              mb_iarg_done_i  <= arg_mask;
              ap_iscalar_done <= scalar_mask;
            when UPDATE_OUTPUT =>
              output_mask_we <= '1';
            when EXECUTE_STEP   =>
            when EXECUTE_RESUME =>
            when EXECUTE_STOP   =>
            when others         =>
          end case;
        end if;

      when apply_input_mask =>
        mb_iarg_done_i  <= iarg_mask;
        ap_iscalar_done <= iscalar_mask;

      when wait_start =>
        if (run_continous = '0') then
          set_ap_start <= global_start;
        else
          if (command_vld = '1') then
            command_rdy <= '1';
            if (opcode = EXECUTE_STOP) then
              input_mask_clr  <= '1';
              output_mask_clr <= '1';
            else
              ap_cmd_error <= '1';
            end if;
          else
            set_ap_start <= global_start;
          end if;
        end if;

      when wait_done =>
        if(ap_done = '1') then
          -- Toggle the output argument multibuffer (if enabled)
          if (C_N_OUTPUT_ARGS > 0) then
            mb_oarg_done_i(C_N_OUTPUT_ARGS-1 downto 0) <= oarg_mask(C_N_OUTPUT_ARGS-1 downto 0);
          end if;
          -- Write values in output FIFOs (if enabled)
          if (C_N_OUTPUT_SCALARS+C_N_INOUT_SCALARS > 0) then
            ap_oscalar_vld(C_MAX_N_OSCALARS-1 downto 0) <= oscalar_mask(C_MAX_N_OSCALARS-1 downto 0);
          end if;
         -- if (C_N_INOUT_SCALARS > 0) then
         --   ap_oscalar_vld(C_MAX_N_OSCALARS+C_N_INOUT_SCALARS-1 downto C_MAX_N_OSCALARS) <= oscalar_mask(C_MAX_N_OSCALARS+C_N_INOUT_SCALARS-1 downto C_MAX_N_OSCALARS);
         -- end if;
          -- clear input/output masks before we start a new iteration
          input_mask_clr  <= not(run_continous);
          output_mask_clr <= not(run_continous);
        end if;

      when others =>
    end case;
  end process;

  clr_ap_start <= ap_ready;

  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      set_ap_start_r <= '0';
    elsif(ap_clk'event and ap_clk = '1') then
      set_ap_start_r <= set_ap_start;
    end if;
  end process;

  process(ap_clk, ap_rst)
  begin
    if(ap_rst = '1') then
      core_ap_start <= '0';
    elsif(ap_clk'event and ap_clk = '1') then
      -- Core ap_start delayed version.
      if(core_ap_start = '0') then
        core_ap_start <= set_ap_start_r;
      else
        core_ap_start <= not(clr_ap_start);
      end if;
    end if;
  end process;

  ---------------------------
  SYNC_AP_START_I : entity axis_accelerator_adapter_v2_1_16.sync_ap_status
    port map (
      rst      => soft_rst,
      ap_clk   => S_AXI_ACLK,
      ap_flag  => ap_start_i_sync,
      axi_clk  => S_AXI_ACLK,
      flag     => status_ap_start,
      flag_clr => status_ap_start_clr);

  SYNC_AP_DONE_I : entity axis_accelerator_adapter_v2_1_16.sync_ap_status
    port map (
      rst      => soft_rst,
      ap_clk   => S_AXI_ACLK,
      ap_flag  => ap_done_sync,
      axi_clk  => S_AXI_ACLK,
      flag     => status_ap_done,
      flag_clr => status_ap_done_clr);

  STATUS_AP_IDLE_I : entity axis_accelerator_adapter_v2_1_16.sync_ap_status
    port map (
      rst      => soft_rst,
      ap_clk   => S_AXI_ACLK,
      ap_flag  => ap_idle_sync,
      axi_clk  => S_AXI_ACLK,
      flag     => status_ap_idle,
      flag_clr => status_ap_idle_clr);

  STATUS_AP_READY_I : entity axis_accelerator_adapter_v2_1_16.sync_ap_status
    port map (
      rst      => soft_rst,
      ap_clk   => S_AXI_ACLK,
      ap_flag  => ap_ready_sync,
      axi_clk  => S_AXI_ACLK,
      flag     => status_ap_ready,
      flag_clr => status_ap_ready_clr);

  SYNC_AP_CMD_ERROR_I : entity work.sync_ap_status
    port map (
      rst      => soft_rst,
      ap_clk   => S_AXI_ACLK,
      ap_flag  => ap_cmd_error_sync,
      axi_clk  => S_AXI_ACLK,
      flag     => host_cmd_error_i,
      flag_clr => host_cmd_error_i);

  host_cmd_error <= host_cmd_error_i;

  -- TODO:
  status_iarg_rqt <= (others => '0');
  status_iarg_ack <= (others => '0');
  status_oarg_rqt <= (others => '0');
  status_oarg_ack <= (others => '0');

  ap_continue <= ap_done;
  
  
  

end rtl;


-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : xd_output_scalars_module.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2012-11-04
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.xd_output_scalars_fifo;

entity xd_output_scalars_module is
  generic (
    -- System generics:
    C_FAMILY               : string  := "virtex6";  -- Xilinx FPGA family
    C_MTBF_STAGES          : integer;
    C_PRMRY_IS_ACLK_ASYNC  : integer;
    C_MAX_N_OSCALARS       : integer;
    C_MAX_SCALAR_DWIDTH    : integer;
    C_N_OUTPUT_SCALARS     : integer;
    C_N_INOUT_SCALARS      : integer;
    C_OUTPUT_SCALAR_DWIDTH : std_logic_vector;
    C_AP_OSCALAR_DIN_WIDTH : integer;
    C_NONE                 : integer := 2);
  port (
    --- AP output arguments
    ap_clk               : in  std_logic;
    ap_rst               : in  std_logic;
    ap_rst_s_axi_aclk    : in  std_logic;
    ap_oscalar_vld       : in  std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
    ap_oscalar_rdy       : out std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
    ap_oscalar_din       : in  std_logic_vector(C_AP_OSCALAR_DIN_WIDTH-1 downto 0);
    clk                  : in  std_logic;
    rst                  : in  std_logic;
    oscalar_rst          : in  std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
    oscalar_data         : out std_logic_vector(C_MAX_N_OSCALARS*C_MAX_SCALAR_DWIDTH-1 downto 0);
    oscalar_re           : in  std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
    status_oscalar_empty : out std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
    status_oscalar_full  : out std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
    status_oscalar_used  : out std_logic_vector(C_MAX_N_OSCALARS*4-1 downto 0));
end entity;

architecture rtl of xd_output_scalars_module is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";
  signal status_oscalar_full_i : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
  signal status_oscalar_full_i1 : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
  signal ap_oscalar_rdy_i : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
  signal ap_oscalar_rdy_i1 : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);

begin

  OUTPUT_SCALARS_GEN : for i in 0 to C_MAX_N_OSCALARS-1 generate
  begin

    ACTIVE_GEN : if (i < C_N_OUTPUT_SCALARS) generate
      constant OSCALAR_DWIDTH : integer := get_int_element(C_OUTPUT_SCALAR_DWIDTH, i);
      constant OSCALAR_LSB    : integer := get_compact_LSB(C_OUTPUT_SCALAR_DWIDTH, i);
      constant OSCALAR_MSB    : integer := get_compact_MSB(C_OUTPUT_SCALAR_DWIDTH, i);

      signal dout_i   : std_logic_vector(OSCALAR_DWIDTH-1 downto 0);
      signal fifo_rst_reg : std_logic;

    begin

  --    fifo_rst <= ap_rst_s_axi_aclk or oscalar_rst(i);
  process(clk, ap_rst_s_axi_aclk)
  begin
    if(ap_rst_s_axi_aclk = '1') then
      fifo_rst_reg <= '1';
    elsif(clk'event and clk = '1') then
      fifo_rst_reg <= oscalar_rst(i);
    end if;
  end process;

      -- We might need to generate one hot for ap_oscalar_vld if there is no full handshake for output scalar vld
      -- accelerator might hold valid high for more than one clock
      -- TBD
      
      -- oscalar_re signals are generated at the begining of the data phase;
      -- not required a write-through fifo.
      FIFO_I : entity axis_accelerator_adapter_v2_1_16.xd_output_scalars_fifo
        generic map (
          C_FAMILY => C_FAMILY,
          C_MTBF_STAGES => C_MTBF_STAGES,
          WIDTH    => OSCALAR_DWIDTH)
        port map (
          din      => ap_oscalar_din(OSCALAR_MSB downto OSCALAR_LSB),
          din_vld  => ap_oscalar_vld(i),
          din_rdy  => ap_oscalar_rdy_i(i),
          wr_clk   => ap_clk,
          dout     => dout_i,
          dout_vld => open,
          dout_rdy => oscalar_re(i),
          rd_used  => status_oscalar_used(4*(i+1)-1 downto 4*i),
          rd_empty => status_oscalar_empty(i),
          rd_full  => status_oscalar_full_i(i),
          rd_clk   => clk,
          rst      => fifo_rst_reg);

      process(dout_i)
      begin
        oscalar_data((i+1)*C_MAX_SCALAR_DWIDTH-1 downto i*C_MAX_SCALAR_DWIDTH)            <= (others => '0');
        oscalar_data(i*C_MAX_SCALAR_DWIDTH+OSCALAR_DWIDTH-1 downto i*C_MAX_SCALAR_DWIDTH) <= dout_i;
      end process;


        EN_SYNC_GEN_OSCALAR : if (C_PRMRY_IS_ACLK_ASYNC = 1) generate
   begin
   

    XD_OSCALAR_FULL_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_OSCALARS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => '1',
        prmry_in                   => status_oscalar_full_i(i),
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => clk,
        scndry_resetn              => '1',
        scndry_out                 => status_oscalar_full(i),
        scndry_vect_out            => open
        );

	
    XD_OSCALAR_RDY_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_OSCALARS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => '1',
        prmry_in                   => ap_oscalar_rdy_i(i),
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => clk,
        scndry_resetn              => '1',
        scndry_out                 => ap_oscalar_rdy(i),
        scndry_vect_out            => open
        );

	


   end generate EN_SYNC_GEN_OSCALAR;

       NO_SYNC_GEN_OSCALAR : if (C_PRMRY_IS_ACLK_ASYNC = 0) generate
   begin

      status_oscalar_full(i)                     <= status_oscalar_full_i(i);
      ap_oscalar_rdy(i)                     <= ap_oscalar_rdy_i(i);

   end generate NO_SYNC_GEN_OSCALAR;


    end generate ACTIVE_GEN;

    INACTIVE_GEN : if (i > C_N_OUTPUT_SCALARS-1 and i < 8) generate
    begin
      oscalar_data((i+1)*C_MAX_SCALAR_DWIDTH-1 downto i*C_MAX_SCALAR_DWIDTH) <= (others => '0');

      -- A non used scalar is always ready:
      ap_oscalar_rdy(i) <= '1';

      status_oscalar_empty(i)                   <= '0';
      status_oscalar_full(i)                    <= '0';
      status_oscalar_used(4*(i+1)-1 downto 4*i) <= (others => '0');
    end generate INACTIVE_GEN;

-- Pankaj
    INOUT_ACTIVE_GEN : if (i > 7 and i < C_N_INOUT_SCALARS) generate
      constant OSCALAR_DWIDTH : integer := get_int_element(C_OUTPUT_SCALAR_DWIDTH, i);
      constant OSCALAR_LSB    : integer := get_compact_LSB_IO(C_OUTPUT_SCALAR_DWIDTH, i);
      constant OSCALAR_MSB    : integer := get_compact_MSB_IO(C_OUTPUT_SCALAR_DWIDTH, i);

      signal dout_i   : std_logic_vector(OSCALAR_DWIDTH-1 downto 0);
      signal fifo_rst_reg : std_logic;

    begin

  --    fifo_rst <= ap_rst_s_axi_aclk or oscalar_rst(i);
  process(clk, ap_rst_s_axi_aclk)
  begin
    if(ap_rst_s_axi_aclk = '1') then
      fifo_rst_reg <= '1';
    elsif(clk'event and clk = '1') then
      fifo_rst_reg <= oscalar_rst(i);
    end if;
  end process;

      -- We might need to generate one hot for ap_oscalar_vld if there is no full handshake for output scalar vld
      -- accelerator might hold valid high for more than one clock
      -- TBD
      
      -- oscalar_re signals are generated at the begining of the data phase;
      -- not required a write-through fifo.
      FIFO_I : entity axis_accelerator_adapter_v2_1_16.xd_output_scalars_fifo
        generic map (
          C_FAMILY => C_FAMILY,
          C_MTBF_STAGES => C_MTBF_STAGES,
          WIDTH    => OSCALAR_DWIDTH)
        port map (
          din      => ap_oscalar_din(OSCALAR_MSB downto OSCALAR_LSB),
          din_vld  => ap_oscalar_vld(i),
          din_rdy  => ap_oscalar_rdy_i(i),
          wr_clk   => ap_clk,
          dout     => dout_i,
          dout_vld => open,
          dout_rdy => oscalar_re(i),
          rd_used  => status_oscalar_used(4*(i+1)-1 downto 4*i),
          rd_empty => status_oscalar_empty(i),
          rd_full  => status_oscalar_full_i(i),
          rd_clk   => clk,
          rst      => fifo_rst_reg);

      process(dout_i)
      begin
        oscalar_data((i+1)*C_MAX_SCALAR_DWIDTH-1 downto i*C_MAX_SCALAR_DWIDTH)            <= (others => '0');
        oscalar_data(i*C_MAX_SCALAR_DWIDTH+OSCALAR_DWIDTH-1 downto i*C_MAX_SCALAR_DWIDTH) <= dout_i;
      end process;

      
        EN_SYNC_GEN_OSCALAR : if (C_PRMRY_IS_ACLK_ASYNC = 1) generate
   begin
   

    XD_OSCALAR_FULL_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_OSCALARS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => '1',
        prmry_in                   => status_oscalar_full_i(i),
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => clk,
        scndry_resetn              => '1',
        scndry_out                 => status_oscalar_full(i),
        scndry_vect_out            => open
        );

    XD_OSCALAR_RDY_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_OSCALARS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => '1',
        prmry_in                   => ap_oscalar_rdy_i(i),
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => clk,
        scndry_resetn              => '1',
        scndry_out                 => ap_oscalar_rdy(i),
        scndry_vect_out            => open
        );

--  process(clk, rst)
--  begin
--   if(clk'event and clk = '1') then
--    if(rst = '1') then
--      status_oscalar_full_i1(i) <= '0';
--      status_oscalar_full(i) <= '0';
--    else
--      status_oscalar_full_i1(i) <=status_oscalar_full_i(i) ;
--      status_oscalar_full(i) <= status_oscalar_full_i1(i);
--    end if;
--   end if;
--  end process;
--
--
--  process(clk, rst)
--  begin
--   if(clk'event and clk = '1') then
--    if(rst = '1') then
--      ap_oscalar_rdy_i1(i) <= '1';
--      ap_oscalar_rdy(i) <= '1';
--    else
--      ap_oscalar_rdy_i1(i) <=ap_oscalar_rdy_i(i) ;
--      ap_oscalar_rdy(i) <= ap_oscalar_rdy_i1(i);
--    end if;
--   end if;
--  end process;



	


   end generate EN_SYNC_GEN_OSCALAR;

       NO_SYNC_GEN_OSCALAR : if (C_PRMRY_IS_ACLK_ASYNC = 0) generate
   begin

      status_oscalar_full(i)                     <= status_oscalar_full_i(i);
      ap_oscalar_rdy(i)                     <= ap_oscalar_rdy_i(i);

   end generate NO_SYNC_GEN_OSCALAR;


    end generate INOUT_ACTIVE_GEN;

    INOUT_INACTIVE_GEN : if(i > C_N_INOUT_SCALARS-1) generate
    begin
      oscalar_data((i+1)*C_MAX_SCALAR_DWIDTH-1 downto i*C_MAX_SCALAR_DWIDTH) <= (others => '0');

      -- A non used scalar is always ready:
      ap_oscalar_rdy(i) <= '1';

      status_oscalar_empty(i)                   <= '0';
      status_oscalar_full(i)                    <= '0';
      status_oscalar_used(4*(i+1)-1 downto 4*i) <= (others => '0');
    end generate INOUT_INACTIVE_GEN;

---


  end generate OUTPUT_SCALARS_GEN;

end rtl;


-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : xd_output_args_module.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-10-25
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.xd_m2s_adapter;
use axis_accelerator_adapter_v2_1_16.xd_oarg_s2s_adapter;
use axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync;


entity xd_output_args_module is
  generic (
    -- System generics:
    C_FAMILY                : string ;  -- Xilinx FPGA family
    C_BRAM_TYPE             : string := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2
    C_SELECT_XPM            : integer := 1;
    C_MAX_ARG_DWIDTH        : integer;
    C_MAX_ARG_AWIDTH        : integer;
    C_MAX_ARG_N_DIM         : integer;
    C_MAX_MB_DEPTH          : integer;
    C_MAX_N_OARGS           : integer;
    C_PRMRY_IS_ACLK_ASYNC   : integer;
    C_MTBF_STAGES           : integer;
    C_N_OUTPUT_ARGS         : integer;
    C_M_AXIS_TDATA_WIDTH    : integer;
    C_M_AXIS_TUSER_WIDTH    : integer;
    C_M_AXIS_TID_WIDTH      : integer;
    C_M_AXIS_TDEST_WIDTH    : integer;
    C_AP_OARG_TYPE          : std_logic_vector;
    C_AP_OARG_DWIDTH        : std_logic_vector;  -- Interface width 
    C_AP_OARG_MB_DEPTH      : std_logic_vector;
    C_AP_OARG_WIDTH         : std_logic_vector;  -- Native width of data
    C_AP_OARG_N_DIM         : std_logic_vector;
    C_AP_OARG_DIM           : std_logic_vector;
    C_AP_OARG_DIM_1         : std_logic_vector;
    C_AP_OARG_DIM_2         : std_logic_vector;
    C_AP_OARG_FORMAT_TYPE   : std_logic_vector;
    C_AP_OARG_FORMAT_FACTOR : std_logic_vector;
    C_AP_OARG_FORMAT_DIM    : std_logic_vector;
    C_NONE                  : integer := 2);
  port (
    --- Slave AXI streams (output arguments)
    M_AXIS_ACLK         : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    M_AXIS_ARESETN      : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    M_AXIS_TVALID       : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    M_AXIS_TREADY       : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    M_AXIS_TDATA        : out std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TDATA_WIDTH-1 downto 0);
    M_AXIS_TSTRB        : out std_logic_vector(C_MAX_N_OARGS*(C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
    M_AXIS_TKEEP        : out std_logic_vector(C_MAX_N_OARGS*(C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
    M_AXIS_TLAST        : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    M_AXIS_TID          : out std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TID_WIDTH-1 downto 0);
    M_AXIS_TDEST        : out std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TDEST_WIDTH-1 downto 0);
    M_AXIS_TUSER        : out std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TUSER_WIDTH-1 downto 0);
    ---
    oarg_sw_length      : in  std_logic_vector(31 downto 0);
    oarg_sw_length_m2s  : in  std_logic_vector(31 downto 0);
    oarg_sw_length_we   : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    oarg_use_sw_length  : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    host_oarg_tdest     : in  std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TDEST_WIDTH-1 downto 0);
    ---
    dbg_stream_nwords   : out std_logic_vector(C_MAX_N_OARGS*16-1 downto 0);
    dbg_buffer_nwords   : out std_logic_vector(C_MAX_N_OARGS*16-1 downto 0);
    dbg_ap_done         : in  std_logic;
    --- AP output arguments
    ap_clk              : in  std_logic;
    ap_rst_maclk        : in  std_logic;
    ap_rst              : in  std_logic;
    ap_oarg_rst         : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    ap_oarg_addr        : in  std_logic_vector(C_MAX_N_OARGS*C_MAX_ARG_AWIDTH-1 downto 0);
    ap_oarg_ce          : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    ap_oarg_we          : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    ap_oarg_din         : in  std_logic_vector(C_MAX_N_OARGS*C_MAX_ARG_DWIDTH-1 downto 0);
    ap_oarg_dout        : out std_logic_vector(C_MAX_N_OARGS*C_MAX_ARG_DWIDTH-1 downto 0);
    ap_oarg_rdy         : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    ap_oarg_done        : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    status_oarg_empty   : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    status_oarg_full    : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    status_oarg_used    : out std_logic_vector(C_MAX_N_OARGS*4-1 downto 0);
    ap_fifo_oarg_din    : in  std_logic_vector(C_MAX_N_OARGS*C_MAX_ARG_DWIDTH-1 downto 0);
    ap_fifo_oarg_write  : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    ap_fifo_oarg_full_n : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    ap_start            : in  std_logic;
    ap_done             : in  std_logic);
end entity;

architecture rtl of xd_output_args_module is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";

  constant C_M_AXIS_TSTRB_WIDTH : integer := C_M_AXIS_TDATA_WIDTH/8;
  constant C_M_AXIS_TKEEP_WIDTH : integer := C_M_AXIS_TDATA_WIDTH/8;

  alias C_AP_OARG_DIM_dw : std_logic_vector(C_MAX_N_OARGS*C_MAX_ARG_N_DIM*32-1 downto 0) is C_AP_OARG_DIM;


  -- Syncrhonizer Signals
  signal oarg_use_sw_length_sync  : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal oarg_sw_length_we_sync   : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal m_aresetn : std_logic;
  signal m_aclk    : std_logic;

  signal axis_rst    : std_logic;
  signal axis_rst1    : std_logic;
  signal oarg_sw_length_sync_s2s      : std_logic_vector(31 downto 0);
  signal oarg_sw_length_sync_m2s      : std_logic_vector(31 downto 0);
  signal ap_rst_sync1_maclk   : std_logic;
  signal ap_rst_sync_maclk  : std_logic;
  ATTRIBUTE async_reg           : STRING;
  ATTRIBUTE async_reg OF ap_rst_sync_maclk  : SIGNAL IS "true";
  ATTRIBUTE async_reg OF ap_rst_sync1_maclk  : SIGNAL IS "true";
  

begin

  -- undriven ports 
  dbg_stream_nwords <= (others => '0');
  dbg_buffer_nwords <= (others => '0');
  
  
  m_aresetn <=  M_AXIS_ARESETN(0);
  m_aclk    <=  M_AXIS_ACLK(0);

   ------------------------------------
   --- aclk to m_axis_aclk Synchronizer
   ------------------------------------
--   EN_LITE_TO_STRM_SYNC_GEN : if (C_PRMRY_IS_ACLK_ASYNC = 1) generate
--   begin
   
      PROCESS (m_aclk, m_aresetn)
      BEGIN
       -- Register Stage #1 
        IF (m_aresetn = '0') THEN
          axis_rst1 <= '1';
          axis_rst <= '1';
        ELSIF (m_aclk'event and m_aclk = '1') THEN
          axis_rst1 <= '0';
          axis_rst <= axis_rst1;
        END IF;
        END PROCESS;


--     prd1: PROCESS (m_aclk)
--      BEGIN
--       -- Register Stage #1 
--        IF (m_aclk'event and m_aclk = '1') THEN
--          ap_rst_sync1_maclk <= ap_rst;
--          ap_rst_sync_maclk <= ap_rst_sync1_maclk;
--        END IF;
--        END PROCESS prd1;


       SW_LENGTH_SYNC_M2S : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_VECTOR_WIDTH             => 32,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => '0',
        prmry_resetn               => '0',
        prmry_in                   => '0',
        prmry_vect_in              => oarg_sw_length_m2s,

        scndry_aclk                => m_aclk,
        scndry_resetn              => axis_rst,
        scndry_out                 => open,
        scndry_vect_out            => oarg_sw_length_sync_m2s
        );
       SW_LENGTH_SYNC_S2S : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_VECTOR_WIDTH             => 32,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => '0',
        prmry_resetn               => '0',
        prmry_in                   => '0',
        prmry_vect_in              => oarg_sw_length,

        scndry_aclk                => m_aclk,
        scndry_resetn              => axis_rst,
        scndry_out                 => open,
        scndry_vect_out            => oarg_sw_length_sync_s2s
        );

    XD_SW_LENGTH_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_VECTOR_WIDTH             => C_MAX_N_OARGS,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => '0',
        prmry_resetn               => '0',
        prmry_in                   => '0',
        prmry_vect_in              => oarg_use_sw_length,

        scndry_aclk                => m_aclk,
        scndry_resetn              => m_aresetn,
        scndry_out                 => open,
        scndry_vect_out            => oarg_use_sw_length_sync
        );

    XD_SW_LENGTH_WE_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_VECTOR_WIDTH             => C_MAX_N_OARGS,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => '0',
        prmry_resetn               => '0',
        prmry_in                   => '0',
        prmry_vect_in              => oarg_sw_length_we,

        scndry_aclk                => m_aclk,
        scndry_resetn              => m_aresetn,
        scndry_out                 => open,
        scndry_vect_out            => oarg_sw_length_we_sync
        );
    
--   end generate EN_LITE_TO_STRM_SYNC_GEN;

   ------------------------------------
   --- Clocks are synchronous
   ------------------------------------
--   NO_SYNC_GEN : if (C_PRMRY_IS_ACLK_ASYNC = 0) generate
--   begin
--   
--   
--       oarg_use_sw_length_sync <= oarg_use_sw_length;
--      -- oarg_sw_length_we_sync  <= oarg_sw_length_we;
--
--        process(m_aclk)
--        begin
--          if(m_aclk'event and m_aclk = '1') then
--            if(m_aresetn = '0') then
--                oarg_sw_length_we_sync  <= (others=>'0');
--            else
--                oarg_sw_length_we_sync  <= oarg_sw_length_we;
--            end if;
--          end if;
--        end process;
--    
--   end generate NO_SYNC_GEN;



  ------------------------------------
  --- Output Argument generation
  ------------------------------------
  OARGS_GEN : if (C_N_OUTPUT_ARGS > 0) generate
  begin

    OUTPUT_ARGS_GEN : for i in 0 to C_N_OUTPUT_ARGS-1 generate

      constant OARG_TYPE          : integer          := get_int_element(C_AP_OARG_TYPE, i);
      constant OARG_DWIDTH        : integer          := get_int_element(C_AP_OARG_DWIDTH, i);
      constant OARG_MB_DEPTH      : integer          := get_int_element(C_AP_OARG_MB_DEPTH, i);
      constant OARG_WIDTH         : integer          := get_int_element(C_AP_OARG_WIDTH, i);
      constant OARG_N_DIM         : integer          := get_int_element(C_AP_OARG_N_DIM, i);
      constant OARG_DIM_1         : integer          := get_int_element(C_AP_OARG_DIM_1, i);
      constant OARG_DIM_2         : integer          := get_int_element(C_AP_OARG_DIM_2, i);
      constant OARG_FORMAT_TYPE   : integer          := get_int_element(C_AP_OARG_FORMAT_TYPE, i);
      constant OARG_FORMAT_FACTOR : integer          := get_int_element(C_AP_OARG_FORMAT_FACTOR, i);
      constant OARG_FORMAT_DIM    : integer          := get_int_element(C_AP_OARG_FORMAT_DIM, i);
      constant OARG_DIM           : std_logic_vector := C_AP_OARG_DIM_dw(C_MAX_ARG_N_DIM*32*(i+1)-1 downto C_MAX_ARG_N_DIM*32*i);

      constant OARG_DIMS : int_vector(C_MAX_ARG_N_DIM downto 1) := get_int_vector(C_AP_OARG_DIM, C_MAX_ARG_N_DIM*(i+1)-1, C_MAX_ARG_N_DIM*i);

      function calc_arg_addr_width2 return integer is
        variable addr_width : integer := 10;
        variable N_elements : integer := 1;
      begin

        if (OARG_TYPE = AP_ARG_MEM_MAP_TYPE) then  -- Memory map interface
          for i in 1 to OARG_N_DIM loop
            N_elements := N_elements * OARG_DIMS(i);
          end loop;

          case OARG_FORMAT_TYPE is
            when FORMAT_TYPE_NONE               =>
            when FORMAT_TYPE_RESHAPE_BLOCK      => N_elements := N_elements / OARG_FORMAT_FACTOR;
            when FORMAT_TYPE_RESHAPE_CYCLIC     => N_elements := N_elements / OARG_FORMAT_FACTOR;
            when FORMAT_TYPE_RESHAPE_COMPLETE   =>
            when FORMAT_TYPE_PARTITION_BLOCK    => N_elements := N_elements / OARG_FORMAT_FACTOR;
            when FORMAT_TYPE_PARTITION_CYCLIC   => N_elements := N_elements / OARG_FORMAT_FACTOR;
            when FORMAT_TYPE_PARTITION_COMPLETE =>
            when others                         =>
          end case;
          addr_width := log2(N_elements);
        elsif (OARG_TYPE = AP_ARG_STREAM_TYPE) then  -- FIFO interface
          -- FIFO interface is considered a unidimentional array; taking the
          -- number of elements from dimension 1
          N_elements := OARG_DIMS(1);
          addr_width := log2(N_elements);
        end if;
        return addr_width;
      end function calc_arg_addr_width2;

      signal dbg_arg_addr_width : integer := calc_arg_addr_width2;

      function calc_arg_addr_width return integer is
        variable addr_width : integer;
        variable N_elements : integer;
      begin
        if (OARG_TYPE = AP_ARG_MEM_MAP_TYPE) then  -- Memory map interface
          if (OARG_N_DIM = 1) then
            N_elements := OARG_DIM_1;

            addr_width := log2(N_elements);
          elsif (OARG_N_DIM = 2) then
            if (OARG_FORMAT_TYPE = FORMAT_TYPE_RESHAPE_BLOCK) then
              N_elements := (OARG_DIM_1*OARG_DIM_2)/OARG_FORMAT_FACTOR;
            else
              N_elements := (OARG_DIM_1*OARG_DIM_2);
            end if;
            addr_width := log2(N_elements);
          end if;
        elsif (OARG_TYPE = AP_ARG_STREAM_TYPE) then  -- FIFO interface
          N_elements := OARG_DIM_1;
          addr_width := log2(N_elements);
        end if;

        return addr_width;
      end function calc_arg_addr_width;

      constant OARG_AWIDTH : integer := calc_arg_addr_width;

      signal test_dim : int_vector(0 to OARG_N_DIM-1) :=
        get_int_vector(C_AP_OARG_DIM, OARG_N_DIM-1+C_MAX_ARG_N_DIM*i, C_MAX_ARG_N_DIM*i);

    begin

      -- BRAM Interface towards accelerator
      M2S_GEN : if (OARG_TYPE = AP_ARG_MEM_MAP_TYPE) generate
      begin
        OARG_M2S_I : entity axis_accelerator_adapter_v2_1_16.xd_m2s_adapter
          generic map (
            C_FAMILY               => C_FAMILY,
            C_MTBF_STAGES          => C_MTBF_STAGES,
            C_BRAM_TYPE            => C_BRAM_TYPE,
            C_SELECT_XPM           => C_SELECT_XPM,
            C_M_AXIS_TDATA_WIDTH   => C_M_AXIS_TDATA_WIDTH,
            C_M_AXIS_TUSER_WIDTH   => C_M_AXIS_TUSER_WIDTH,
            C_M_AXIS_TID_WIDTH     => C_M_AXIS_TID_WIDTH,
            C_M_AXIS_TDEST_WIDTH   => C_M_AXIS_TDEST_WIDTH,
            C_AP_ARG_DATA_WIDTH    => OARG_DWIDTH,
            C_AP_ARG_ADDR_WIDTH    => OARG_AWIDTH,
            C_MULTIBUFFER_DEPTH    => OARG_MB_DEPTH,
            C_AP_ARG_WIDTH         => OARG_WIDTH,
            C_AP_ARG_N_DIM         => OARG_N_DIM,
            C_AP_ARG_DIMS          => OARG_DIMS(OARG_N_DIM downto 1),
            C_AP_ARG_DIM_1         => OARG_DIM_1,
            C_AP_ARG_DIM_2         => OARG_DIM_2,
            C_AP_ARG_FORMAT_TYPE   => OARG_FORMAT_TYPE,
            C_AP_ARG_FORMAT_FACTOR => OARG_FORMAT_FACTOR,
            C_AP_ARG_FORMAT_DIM    => OARG_FORMAT_DIM)
          port map (
            M_AXIS_ACLK     => M_AXIS_ACLK(i),
            M_AXIS_ARESETN  => M_AXIS_ARESETN(i),
            M_AXIS_TVALID   => M_AXIS_TVALID(i),
            M_AXIS_TREADY   => M_AXIS_TREADY(i),
            M_AXIS_TDATA    => M_AXIS_TDATA(C_M_AXIS_TDATA_WIDTH*(i+1)-1 downto C_M_AXIS_TDATA_WIDTH*i),
            M_AXIS_TSTRB    => M_AXIS_TSTRB(C_M_AXIS_TSTRB_WIDTH*(i+1)-1 downto C_M_AXIS_TSTRB_WIDTH*i),
            M_AXIS_TKEEP    => M_AXIS_TKEEP(C_M_AXIS_TKEEP_WIDTH*(i+1)-1 downto C_M_AXIS_TKEEP_WIDTH*i),
            M_AXIS_TLAST    => M_AXIS_TLAST(i),
            M_AXIS_TID      => M_AXIS_TID(C_M_AXIS_TID_WIDTH*(i+1)-1 downto C_M_AXIS_TID_WIDTH*i),
            M_AXIS_TDEST    => M_AXIS_TDEST(C_M_AXIS_TDEST_WIDTH*(i+1)-1 downto C_M_AXIS_TDEST_WIDTH*i),
            M_AXIS_TUSER    => M_AXIS_TUSER(C_M_AXIS_TUSER_WIDTH*(i+1)-1 downto C_M_AXIS_TUSER_WIDTH*i),
            ---
            sw_length       => oarg_sw_length_sync_m2s,
            sw_length_we    => oarg_sw_length_we_sync(i),
            use_sw_length   => oarg_use_sw_length_sync(i),
            host_oarg_tdest => host_oarg_tdest(C_M_AXIS_TDEST_WIDTH*(i+1)-1 downto C_M_AXIS_TDEST_WIDTH*i),
            ---
            ap_clk          => ap_clk,
            ap_rst_sync     => ap_rst_maclk,
            ap_rst          => ap_rst,
            ap_arg_addr     => ap_oarg_addr(OARG_AWIDTH-1+C_MAX_ARG_AWIDTH*i downto C_MAX_ARG_AWIDTH*i),
            ap_arg_ce       => ap_oarg_ce(i),
            ap_arg_we       => ap_oarg_we(i),
            ap_arg_din      => ap_oarg_din(OARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto C_MAX_ARG_DWIDTH*i),
            ap_arg_dout     => ap_oarg_dout(OARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto C_MAX_ARG_DWIDTH*i),
            ap_arg_rqt      => ap_oarg_rdy(i),
            ap_arg_ack      => ap_oarg_done(i),
            -- Status info
            ap_arg_empty    => status_oarg_empty(i),
            ap_arg_full     => status_oarg_full(i),
            ap_arg_used     => status_oarg_used(4*(i+1)-1 downto 4*i));

          -- Unused signals
          ap_fifo_oarg_full_n(i) <= '0';

      end generate M2S_GEN;

      -- FIFO Interface towards accelerator
      S2S_GEN : if (OARG_TYPE = AP_ARG_STREAM_TYPE) generate
      begin

        OARG_S2S_I : entity axis_accelerator_adapter_v2_1_16.xd_oarg_s2s_adapter
          generic map (
            C_FAMILY             => C_FAMILY,
            C_MTBF_STAGES          => C_MTBF_STAGES,
            C_M_AXIS_TDATA_WIDTH => C_M_AXIS_TDATA_WIDTH,
            C_M_AXIS_TUSER_WIDTH => C_M_AXIS_TUSER_WIDTH,
            C_M_AXIS_TID_WIDTH   => C_M_AXIS_TID_WIDTH,
            C_M_AXIS_TDEST_WIDTH => C_M_AXIS_TDEST_WIDTH,
            C_AP_ARG_DATA_WIDTH  => OARG_DWIDTH,
            C_AP_ARG_ADDR_WIDTH  => OARG_AWIDTH,
            C_MULTIBUFFER_DEPTH  => OARG_MB_DEPTH)
          port map (
            M_AXIS_ACLK     => M_AXIS_ACLK(i),
            M_AXIS_ARESETN  => M_AXIS_ARESETN(i),
            M_AXIS_TVALID   => M_AXIS_TVALID(i),
            M_AXIS_TREADY   => M_AXIS_TREADY(i),
            M_AXIS_TDATA    => M_AXIS_TDATA(C_M_AXIS_TDATA_WIDTH*(i+1)-1 downto C_M_AXIS_TDATA_WIDTH*i),
            M_AXIS_TSTRB    => M_AXIS_TSTRB(C_M_AXIS_TSTRB_WIDTH*(i+1)-1 downto C_M_AXIS_TSTRB_WIDTH*i),
            M_AXIS_TKEEP    => M_AXIS_TKEEP(C_M_AXIS_TKEEP_WIDTH*(i+1)-1 downto C_M_AXIS_TKEEP_WIDTH*i),
            M_AXIS_TLAST    => M_AXIS_TLAST(i),
            M_AXIS_TID      => M_AXIS_TID(C_M_AXIS_TID_WIDTH*(i+1)-1 downto C_M_AXIS_TID_WIDTH*i),
            M_AXIS_TDEST    => M_AXIS_TDEST(C_M_AXIS_TDEST_WIDTH*(i+1)-1 downto C_M_AXIS_TDEST_WIDTH*i),
            M_AXIS_TUSER    => M_AXIS_TUSER(C_M_AXIS_TUSER_WIDTH*(i+1)-1 downto C_M_AXIS_TUSER_WIDTH*i),
            ---
            sw_length       => oarg_sw_length_sync_s2s,
            sw_length_we    => oarg_sw_length_we_sync(i),
            use_sw_length   => oarg_use_sw_length_sync(i),
            host_oarg_tdest => host_oarg_tdest(C_M_AXIS_TDEST_WIDTH*(i+1)-1 downto C_M_AXIS_TDEST_WIDTH*i),
            ---
            ap_clk          => ap_clk,
            ap_rst_sync     => ap_rst_maclk,
            ap_rst          => ap_rst,
            ap_oarg_din     => ap_fifo_oarg_din(OARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto C_MAX_ARG_DWIDTH*i),
            ap_oarg_we      => ap_fifo_oarg_write(i),
            ap_oarg_full_n  => ap_fifo_oarg_full_n(i),
            ap_arg_rqt      => ap_oarg_rdy(i),
            ap_arg_ack      => ap_oarg_done(i),
            ap_start        => ap_start,
            ap_done         => ap_done);

          -- Unused signals
          ap_oarg_dout(OARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto C_MAX_ARG_DWIDTH*i) <= (others => '0');
          status_oarg_empty(i) <= '1';
          status_oarg_full(i)  <= '0';
          status_oarg_used(4*(i+1)-1 downto 4*i) <= (others => '0');

      end generate S2S_GEN;

      ap_oarg_dout(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto OARG_DWIDTH+C_MAX_ARG_DWIDTH*i)<= (others => '0');

    end generate OUTPUT_ARGS_GEN;


    OARGS_DEFAULT_GEN : if (C_N_OUTPUT_ARGS < C_MAX_N_OARGS) generate
    begin


        OUTPUT_ARGS_HIGHER_GEN : for i in C_N_OUTPUT_ARGS to C_MAX_N_OARGS-1 generate
        constant OARG_DWIDTH        : integer := get_int_element(C_AP_OARG_DWIDTH, C_N_OUTPUT_ARGS-1);
        begin    
          M_AXIS_TVALID(i) <= '0';
          M_AXIS_TLAST(i)  <= '0';
          ap_oarg_rdy(i)     <= '0';
          ap_fifo_oarg_full_n(i) <= '0';
          status_oarg_empty(i) <= '0';
          status_oarg_full(i)  <= '0';
          status_oarg_used(4*(i+1)-1 downto 4*i) <= (others => '0');
          M_AXIS_TDATA(C_M_AXIS_TDATA_WIDTH*(i+1)-1 downto C_M_AXIS_TDATA_WIDTH*i) <= (others => '0');
          M_AXIS_TSTRB(C_M_AXIS_TSTRB_WIDTH*(i+1)-1 downto C_M_AXIS_TSTRB_WIDTH*i) <= (others => '0');
          M_AXIS_TKEEP(C_M_AXIS_TKEEP_WIDTH*(i+1)-1 downto C_M_AXIS_TKEEP_WIDTH*i) <= (others => '0');
          M_AXIS_TID(C_M_AXIS_TID_WIDTH*(i+1)-1 downto C_M_AXIS_TID_WIDTH*i)       <= (others => '0');
          M_AXIS_TDEST(C_M_AXIS_TDEST_WIDTH*(i+1)-1 downto C_M_AXIS_TDEST_WIDTH*i) <= (others => '0');
          M_AXIS_TUSER(C_M_AXIS_TUSER_WIDTH*(i+1)-1 downto C_M_AXIS_TUSER_WIDTH*i) <= (others => '0');
          ap_oarg_dout(OARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto C_MAX_ARG_DWIDTH*i) <= (others => '0');


          ap_oarg_dout(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto OARG_DWIDTH+C_MAX_ARG_DWIDTH*i)<= (others => '0');
    
        end generate OUTPUT_ARGS_HIGHER_GEN;


        --ap_iarg_dout(C_MAX_N_IARGS*C_MAX_ARG_DWIDTH-1 downto C_MAX_ARG_DWIDTH*C_N_INPUT_ARGS) <= (others=>'0');
        
    end generate OARGS_DEFAULT_GEN;


  end generate OARGS_GEN;

end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : xd_input_scalars_module.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2012-11-04
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn	Created
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.xd_input_scalars_fifo;




entity xd_input_scalars_module is
  generic (
    -- System generics:
    C_FAMILY                : string  := "virtex6";  -- Xilinx FPGA family
    C_MTBF_STAGES           : integer;
    C_PRMRY_IS_ACLK_ASYNC   : integer;
    C_MAX_N_ISCALARS        : integer;
    C_N_INPUT_SCALARS       : integer;
    C_N_INOUT_SCALARS       : integer;
    C_INPUT_SCALAR_DWIDTH   : std_logic_vector;
    C_AP_ISCALAR_DOUT_WIDTH : integer;
    C_NONE                  : integer := 2);
  port (
    clk                  : in  std_logic;
    rst                  : in  std_logic;
    iscalar_rst          : in  std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
    iscalar_din          : in  std_logic_vector(31 downto 0);
    iscalar_we           : in  std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
    status_iscalar_empty : out std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
    status_iscalar_full  : out std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
    status_iscalar_used  : out std_logic_vector(C_MAX_N_ISCALARS*4-1 downto 0);
    --- AP input scalars
    ap_clk               : in  std_logic;
    ap_rst               : in  std_logic;
    ap_rst_s_axi_aclk    : in  std_logic;
    ap_iscalar_rdy       : out std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
    ap_iscalar_done      : in  std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
    ap_iscalar_dout      : out std_logic_vector(C_AP_ISCALAR_DOUT_WIDTH-1 downto 0));
end entity;

architecture rtl of xd_input_scalars_module is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";
  signal status_iscalar_used_i : std_logic_vector(C_MAX_N_ISCALARS*4-1 downto 0);
  signal status_iscalar_empty_i : std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
  signal ap_iscalar_rdy_i : std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);

begin

  INPUT_SCALARS_GEN : for i in 0 to C_MAX_N_ISCALARS-1 generate
  begin
    
    ACTIVE_GEN : if (i < C_N_INPUT_SCALARS) generate
      constant ISCALAR_DWIDTH : integer := get_int_element(C_INPUT_SCALAR_DWIDTH, i);
      constant ISCALAR_LSB    : integer := get_compact_LSB(C_INPUT_SCALAR_DWIDTH, i);
      constant ISCALAR_MSB    : integer := get_compact_MSB(C_INPUT_SCALAR_DWIDTH, i);

      signal dout_i   : std_logic_vector(ISCALAR_DWIDTH-1 downto 0);
      signal empty    : std_logic;
      signal fifo_rst_reg : std_logic;
    begin

    --  fifo_rst <= ap_rst_s_axi_aclk or iscalar_rst(i);
  process(clk, ap_rst_s_axi_aclk)
  begin
    if(ap_rst_s_axi_aclk = '1') then
      fifo_rst_reg <= '1';
    elsif(clk'event and clk = '1') then
      fifo_rst_reg <= iscalar_rst(i);
    end if;
  end process;


      -- Input scalars must show a behaviour equal to the input arguments in 
      -- the sense that written data by the processor must be inmediatelly 
      -- available for the accelerator. So a write-through FIFO is used.

      FIFO_I : entity axis_accelerator_adapter_v2_1_16.xd_input_scalars_fifo
        generic map (
          C_FAMILY => C_FAMILY,
          C_MTBF_STAGES   => C_MTBF_STAGES, 
          WIDTH    => ISCALAR_DWIDTH)
        port map (
          din      => iscalar_din(ISCALAR_DWIDTH-1 downto 0),
          din_vld  => iscalar_we(i),
          din_rdy  => open,
          wr_used  => status_iscalar_used_i(4*(i+1)-1 downto 4*i),
          wr_empty => status_iscalar_empty_i(i),
          wr_full  => status_iscalar_full(i),
          wr_clk   => clk,
          dout     => dout_i,
          dout_vld => ap_iscalar_rdy_i(i),
          dout_rdy => ap_iscalar_done(i),
          rd_clk   => ap_clk,
          rst      => fifo_rst_reg);

      ap_iscalar_dout(ISCALAR_MSB downto ISCALAR_LSB) <= dout_i;
   EN_SYNC_GEN_ISCALAR : if (C_PRMRY_IS_ACLK_ASYNC = 1) generate
   begin
   

    XD_ISCALAR_STATUS_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => 4,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => '1',
        prmry_in                   => '0',
        prmry_vect_in              => status_iscalar_used_i(4*(i+1)-1 downto 4*i),

        scndry_aclk                => clk,
        scndry_resetn              => '1',
        scndry_out                 => open,
        scndry_vect_out            => status_iscalar_used(4*(i+1)-1 downto 4*i)
        );

    XD_ISCALAR_EMPTY_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_ISCALARS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => '1',
        prmry_in                   => status_iscalar_empty_i(i),
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => clk,
        scndry_resetn              => '1',
        scndry_out                 => status_iscalar_empty(i),
        scndry_vect_out            => open
        );

    XD_ISCALAR_RDY_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_ISCALARS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => '1',
        prmry_in                   => ap_iscalar_rdy_i(i),
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => clk,
        scndry_resetn              => '1',
        scndry_out                 => ap_iscalar_rdy(i),
        scndry_vect_out            => open
        );

	


   end generate EN_SYNC_GEN_ISCALAR;

       NO_SYNC_GEN_ISCALAR : if (C_PRMRY_IS_ACLK_ASYNC = 0) generate
   begin

      status_iscalar_empty(i)                     <= status_iscalar_empty_i(i);
      ap_iscalar_rdy(i)                     <= ap_iscalar_rdy_i(i);
      status_iscalar_used(4*(i+1)-1 downto 4*i)  <= status_iscalar_used_i(4*(i+1)-1 downto 4*i);

   end generate NO_SYNC_GEN_ISCALAR;


    end generate ACTIVE_GEN;

    INACTIVE_GEN : if (i > C_N_INPUT_SCALARS-1 and i < 8) generate
      constant ISCALAR_DWIDTH : integer := get_int_element(C_INPUT_SCALAR_DWIDTH, i);
      constant ISCALAR_LSB    : integer := get_compact_LSB(C_INPUT_SCALAR_DWIDTH, i);
      constant ISCALAR_MSB    : integer := get_compact_MSB(C_INPUT_SCALAR_DWIDTH, i);

    begin
      --ap_iscalar_dout(ISCALAR_MSB downto ISCALAR_LSB) <= (others => '0');
      status_iscalar_empty(i)                   <= '0';
      status_iscalar_full(i)                    <= '0';
      status_iscalar_used(4*(i+1)-1 downto 4*i) <= (others => '0');

      -- A non used input scalar is always ready:
      ap_iscalar_rdy(i) <= '1';
    end generate INACTIVE_GEN;


--Pankaj
    INOUT_ACTIVE_GEN : if (i > 7 and i < C_N_INOUT_SCALARS) generate
      constant ISCALAR_DWIDTH : integer := get_int_element(C_INPUT_SCALAR_DWIDTH, i);
      constant ISCALAR_LSB    : integer := get_compact_LSB_IO(C_INPUT_SCALAR_DWIDTH, i);
      constant ISCALAR_MSB    : integer := get_compact_MSB_IO(C_INPUT_SCALAR_DWIDTH, i);

      signal dout_i   : std_logic_vector(ISCALAR_DWIDTH-1 downto 0);
      signal empty    : std_logic;
      signal fifo_rst_reg : std_logic;
    begin

  --    fifo_rst <= ap_rst_s_axi_aclk or iscalar_rst(i);
  process(clk, ap_rst_s_axi_aclk)
  begin
    if(ap_rst_s_axi_aclk = '1') then
      fifo_rst_reg <= '1';
    elsif(clk'event and clk = '1') then
      fifo_rst_reg <= iscalar_rst(i);
    end if;
  end process;

      -- Input scalars must show a behaviour equal to the input arguments in 
      -- the sense that written data by the processor must be inmediatelly 
      -- available for the accelerator. So a write-through FIFO is used.

      FIFO_I : entity axis_accelerator_adapter_v2_1_16.xd_input_scalars_fifo
        generic map (
          C_FAMILY => C_FAMILY,
          C_MTBF_STAGES   => C_MTBF_STAGES, 
          WIDTH    => ISCALAR_DWIDTH)
        port map (
          din      => iscalar_din(ISCALAR_DWIDTH-1 downto 0),
          din_vld  => iscalar_we(i),
          din_rdy  => open,
          wr_used  => status_iscalar_used_i(4*(i+1)-1 downto 4*i),
          wr_empty => status_iscalar_empty_i(i),
          wr_full  => status_iscalar_full(i),
          wr_clk   => clk,
          dout     => dout_i,
          dout_vld => ap_iscalar_rdy_i(i),
          dout_rdy => ap_iscalar_done(i),
          rd_clk   => ap_clk,
          rst      => fifo_rst_reg);

      ap_iscalar_dout(ISCALAR_MSB downto ISCALAR_LSB) <= dout_i;

         EN_SYNC_GEN_ISCALAR : if (C_PRMRY_IS_ACLK_ASYNC = 1) generate
   begin
   

    XD_ISCALAR_STATUS_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => 4,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => '1',
        prmry_in                   => '0',
        prmry_vect_in              => status_iscalar_used_i(4*(i+1)-1 downto 4*i),

        scndry_aclk                => clk,
        scndry_resetn              => '1',
        scndry_out                 => open,
        scndry_vect_out            => status_iscalar_used(4*(i+1)-1 downto 4*i)
        );

    XD_ISCALAR_EMPTY_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_ISCALARS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => '1',
        prmry_in                   => status_iscalar_empty_i(i),
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => clk,
        scndry_resetn              => '1',
        scndry_out                 => status_iscalar_empty(i),
        scndry_vect_out            => open
        );

    XD_ISCALAR_RDY_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_ISCALARS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => '1',
        prmry_in                   => ap_iscalar_rdy_i(i),
        prmry_vect_in              => (others=>'0'),

        scndry_aclk                => clk,
        scndry_resetn              => '1',
        scndry_out                 => ap_iscalar_rdy(i),
        scndry_vect_out            => open
        );

	


   end generate EN_SYNC_GEN_ISCALAR;

       NO_SYNC_GEN_ISCALAR : if (C_PRMRY_IS_ACLK_ASYNC = 0) generate
   begin

      status_iscalar_empty(i)                     <= status_iscalar_empty_i(i);
      ap_iscalar_rdy(i)                     <= ap_iscalar_rdy_i(i);
      status_iscalar_used(4*(i+1)-1 downto 4*i)  <= status_iscalar_used_i(4*(i+1)-1 downto 4*i);

   end generate NO_SYNC_GEN_ISCALAR;


    end generate INOUT_ACTIVE_GEN;

    INOUT_INACTIVE_GEN : if (i > C_N_INOUT_SCALARS-1) generate
    begin
      status_iscalar_empty(i)                   <= '0';
      status_iscalar_full(i)                    <= '0';
      status_iscalar_used(4*(i+1)-1 downto 4*i) <= (others => '0');

      -- A non used input scalar is always ready:
      ap_iscalar_rdy(i) <= '1';


    end generate INOUT_INACTIVE_GEN;

 
---

  end generate INPUT_SCALARS_GEN;

  NO_INPUT_SCALAR_GEN : if (C_N_INPUT_SCALARS = 0 and (C_N_INOUT_SCALARS-8) = 0) generate
  begin
    ap_iscalar_dout <= (others => '0');
  end generate NO_INPUT_SCALAR_GEN;

end rtl;


-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : xd_input_args_module.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-10-25
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.xd_s2m_adapter;
use axis_accelerator_adapter_v2_1_16.xd_iarg_s2s_adapter;



entity xd_input_args_module is
  generic (
    -- System generics:
    C_FAMILY                : string;  -- Xilinx FPGA family
    C_BRAM_TYPE             : string := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2
    C_SELECT_XPM            : integer := 1;
    C_MAX_ARG_DWIDTH        : integer;
    C_MAX_ARG_AWIDTH        : integer;
    C_MAX_ARG_N_DIM         : integer;
    C_MAX_MB_DEPTH          : integer;
    C_MAX_N_IARGS           : integer;
    C_N_INPUT_ARGS          : integer;
    C_S_AXIS_TDATA_WIDTH    : integer;
    C_S_AXIS_TUSER_WIDTH    : integer;
    C_S_AXIS_TID_WIDTH      : integer;
    C_S_AXIS_TDEST_WIDTH    : integer;
    C_AP_IARG_TYPE          : std_logic_vector;
    C_AP_IARG_DWIDTH        : std_logic_vector;
    C_AP_IARG_MB_DEPTH      : std_logic_vector;
    C_AP_IARG_WIDTH         : std_logic_vector;
    C_AP_IARG_N_DIM         : std_logic_vector;
    C_AP_IARG_DIM_1         : std_logic_vector;
    C_AP_IARG_DIM_2         : std_logic_vector;
    C_AP_IARG_FORMAT_TYPE   : std_logic_vector;
    C_AP_IARG_FORMAT_FACTOR : std_logic_vector;
    C_AP_IARG_FORMAT_DIM    : std_logic_vector;
    C_MTBF_STAGES           : integer;
    C_EXTRA_SYNCS           : integer;
    C_NONE                  : integer := 2);
  port (
    --- Slave AXI streams (input arguments)
    S_AXIS_ACLK          : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    S_AXIS_ARESETN       : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    S_AXIS_TVALID        : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    S_AXIS_TREADY        : out std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    S_AXIS_TDATA         : in  std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TDATA_WIDTH-1 downto 0);
    S_AXIS_TSTRB         : in  std_logic_vector(C_MAX_N_IARGS*(C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
    S_AXIS_TKEEP         : in  std_logic_vector(C_MAX_N_IARGS*(C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
    S_AXIS_TLAST         : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    S_AXIS_TID           : in  std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TID_WIDTH-1 downto 0);
    S_AXIS_TDEST         : in  std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TDEST_WIDTH-1 downto 0);
    S_AXIS_TUSER         : in  std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TUSER_WIDTH-1 downto 0);
    dbg_stream_nwords    : out std_logic_vector(C_MAX_N_IARGS*16-1 downto 0);
    dbg_buffer_nwords    : out std_logic_vector(C_MAX_N_IARGS*16-1 downto 0);
    dbg_ap_start         : in  std_logic;
    --- AP input arguments
    ap_clk               : in  std_logic;
    ap_rst_saclk               : in  std_logic;
    ap_rst               : in  std_logic;
    ap_iarg_rst          : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    ap_iarg_addr         : in  std_logic_vector(C_MAX_N_IARGS*C_MAX_ARG_AWIDTH-1 downto 0);
    ap_iarg_ce           : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    ap_iarg_we           : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    ap_iarg_din          : in  std_logic_vector(C_MAX_N_IARGS*C_MAX_ARG_DWIDTH-1 downto 0);
    ap_iarg_dout         : out std_logic_vector(C_MAX_N_IARGS*C_MAX_ARG_DWIDTH-1 downto 0);
    mb_iarg_rdy          : out std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    mb_iarg_done         : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    status_iarg_empty    : out std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    status_iarg_full     : out std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    status_iarg_used     : out std_logic_vector(C_MAX_N_IARGS*4-1 downto 0);
    status_iarg_n_words  : out std_logic_vector(C_MAX_N_IARGS*(C_MAX_ARG_AWIDTH+1)-1 downto 0);
    ap_fifo_iarg_dout    : out std_logic_vector(C_MAX_N_IARGS*C_MAX_ARG_DWIDTH-1 downto 0);
    ap_fifo_iarg_read    : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    ap_fifo_iarg_empty_n : out std_logic_vector(C_MAX_N_IARGS-1 downto 0));
end entity;

architecture rtl of xd_input_args_module is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";

  constant C_S_AXIS_TSTRB_WIDTH : integer := C_S_AXIS_TDATA_WIDTH/8;
  constant C_S_AXIS_TKEEP_WIDTH : integer := C_S_AXIS_TDATA_WIDTH/8;
  signal s_aclk    : std_logic;
  signal ap_rst_sync1_saclk   : std_logic;
  signal ap_rst_sync_saclk  : std_logic;
  ATTRIBUTE async_reg           : STRING;
  ATTRIBUTE async_reg OF ap_rst_sync_saclk  : SIGNAL IS "true";
  ATTRIBUTE async_reg OF ap_rst_sync1_saclk  : SIGNAL IS "true";

begin


  s_aclk    <=  S_AXIS_ACLK(0);
  -- Unused signal
  status_iarg_n_words <= (others => '0');


--      prd1: PROCESS (s_aclk)
--      BEGIN
--       -- Register Stage #1 
--        IF (s_aclk'event and s_aclk = '1') THEN
--          ap_rst_sync1_saclk <= ap_rst;
--          ap_rst_sync_saclk <= ap_rst_sync1_saclk;
--        END IF;
--        END PROCESS prd1;



  IARGS_GEN : if (C_N_INPUT_ARGS > 0) generate
  begin

    INPUT_ARGS_GEN : for i in 0 to C_N_INPUT_ARGS-1 generate

      constant IARG_TYPE          : integer := get_int_element(C_AP_IARG_TYPE, i);
      constant IARG_DWIDTH        : integer := get_int_element(C_AP_IARG_DWIDTH, i);
      constant IARG_MB_DEPTH      : integer := get_int_element(C_AP_IARG_MB_DEPTH, i);
      constant IARG_WIDTH         : integer := get_int_element(C_AP_IARG_WIDTH, i);
      constant IARG_N_DIM         : integer := get_int_element(C_AP_IARG_N_DIM, i);
      constant IARG_DIM_1         : integer := get_int_element(C_AP_IARG_DIM_1, i);
      constant IARG_DIM_2         : integer := get_int_element(C_AP_IARG_DIM_2, i);
      constant IARG_FORMAT_TYPE   : integer := get_int_element(C_AP_IARG_FORMAT_TYPE, i);
      constant IARG_FORMAT_FACTOR : integer := get_int_element(C_AP_IARG_FORMAT_FACTOR, i);
      constant IARG_FORMAT_DIM    : integer := get_int_element(C_AP_IARG_FORMAT_DIM, i);

      function calc_arg_addr_width return integer is
        variable addr_width : integer := 10;
        variable N_elements : integer;
      begin
        if (IARG_TYPE = AP_ARG_MEM_MAP_TYPE) then  -- Memory map interface
          if (IARG_N_DIM = 1) then
            N_elements := IARG_DIM_1;

            addr_width := log2(N_elements);
          elsif (IARG_N_DIM = 2) then
            if (IARG_FORMAT_TYPE = FORMAT_TYPE_RESHAPE_BLOCK) then
              N_elements := (IARG_DIM_1*IARG_DIM_2)/IARG_FORMAT_FACTOR;
            else
              N_elements := (IARG_DIM_1*IARG_DIM_2);
            end if;
            addr_width := log2(N_elements);
          end if;
        elsif (IARG_TYPE = AP_ARG_STREAM_TYPE) then  -- FIFO interface
          N_elements := IARG_DIM_1;
          addr_width := log2(N_elements);
        end if;

        return addr_width;
      end function calc_arg_addr_width;

      constant IARG_AWIDTH : integer := calc_arg_addr_width;

    begin

      -- BRAM Interface towards accelerator
      S2M_GEN : if (IARG_TYPE = AP_ARG_MEM_MAP_TYPE) generate
      begin

        IARG_AP_S2M_I : entity axis_accelerator_adapter_v2_1_16.xd_s2m_adapter
          generic map (
            C_FAMILY               => C_FAMILY,
            C_MTBF_STAGES          => C_MTBF_STAGES, 
            C_BRAM_TYPE            => C_BRAM_TYPE,
            C_SELECT_XPM           => C_SELECT_XPM,
            C_S_AXIS_TDATA_WIDTH   => C_S_AXIS_TDATA_WIDTH,
            C_S_AXIS_TUSER_WIDTH   => C_S_AXIS_TUSER_WIDTH,
            C_S_AXIS_TID_WIDTH     => C_S_AXIS_TID_WIDTH,
            C_S_AXIS_TDEST_WIDTH   => C_S_AXIS_TDEST_WIDTH,
            C_AP_ARG_DATA_WIDTH    => IARG_DWIDTH,
            C_AP_ARG_ADDR_WIDTH    => IARG_AWIDTH,
            C_MULTIBUFFER_DEPTH    => IARG_MB_DEPTH,
            C_AP_ARG_WIDTH         => IARG_WIDTH,
            C_AP_ARG_N_DIM         => IARG_N_DIM,
            C_AP_ARG_DIM_1         => IARG_DIM_1,
            C_AP_ARG_DIM_2         => IARG_DIM_2,
            C_AP_ARG_FORMAT_TYPE   => IARG_FORMAT_TYPE,
            C_AP_ARG_FORMAT_FACTOR => IARG_FORMAT_FACTOR,
            C_AP_ARG_FORMAT_DIM    => IARG_FORMAT_DIM,
            C_EXTRA_SYNCS          => C_EXTRA_SYNCS)
          port map (
            S_AXIS_ACLK       => S_AXIS_ACLK(i),
            S_AXIS_ARESETN    => S_AXIS_ARESETN(i),
            S_AXIS_TVALID     => S_AXIS_TVALID(i),
            S_AXIS_TREADY     => S_AXIS_TREADY(i),
            S_AXIS_TDATA      => S_AXIS_TDATA(C_S_AXIS_TDATA_WIDTH*(i+1)-1 downto C_S_AXIS_TDATA_WIDTH*i),
            S_AXIS_TSTRB      => S_AXIS_TSTRB(C_S_AXIS_TSTRB_WIDTH*(i+1)-1 downto C_S_AXIS_TSTRB_WIDTH*i),
            S_AXIS_TKEEP      => S_AXIS_TKEEP(C_S_AXIS_TKEEP_WIDTH*(i+1)-1 downto C_S_AXIS_TKEEP_WIDTH*i),
            S_AXIS_TLAST      => S_AXIS_TLAST(i),
            S_AXIS_TID        => S_AXIS_TID(C_S_AXIS_TID_WIDTH*(i+1)-1 downto C_S_AXIS_TID_WIDTH*i),
            S_AXIS_TDEST      => S_AXIS_TDEST(C_S_AXIS_TDEST_WIDTH*(i+1)-1 downto C_S_AXIS_TDEST_WIDTH*i),
            S_AXIS_TUSER      => S_AXIS_TUSER(C_S_AXIS_TUSER_WIDTH*(i+1)-1 downto C_S_AXIS_TUSER_WIDTH*i),
            dbg_stream_nwords => dbg_stream_nwords(16*(i+1)-1 downto 16*i),
            dbg_buffer_nwords => dbg_buffer_nwords(16*(i+1)-1 downto 16*i),
            dbg_ap_start      => dbg_ap_start,
            ap_clk            => ap_clk,
            ap_rst_sync       => ap_rst_saclk,
            ap_rst            => ap_rst,
            ap_arg_addr       => ap_iarg_addr(IARG_AWIDTH-1+C_MAX_ARG_AWIDTH*i downto C_MAX_ARG_AWIDTH*i),
            ap_arg_ce         => ap_iarg_ce(i),
            ap_arg_we         => ap_iarg_we(i),
            ap_arg_din        => ap_iarg_din(IARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto C_MAX_ARG_DWIDTH*i),
            ap_arg_dout       => ap_iarg_dout(IARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto C_MAX_ARG_DWIDTH*i),
            mb_arg_rdy        => mb_iarg_rdy(i),
            mb_arg_done       => mb_iarg_done(i),
            -- Status info
            status_empty      => status_iarg_empty(i),
            status_full       => status_iarg_full(i),
            status_used       => status_iarg_used(4*(i+1)-1 downto 4*i));

          
       
          -- Unused signals
          ap_fifo_iarg_dout(IARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto C_MAX_ARG_DWIDTH*i)    <= (others => '0');
          
          ap_fifo_iarg_empty_n(i) <= '0';
          

      end generate S2M_GEN;
      
      
      -- FIFO Interface towards accelerator
      S2S_GEN : if (IARG_TYPE = AP_ARG_STREAM_TYPE) generate
      begin
        IARG_AP_S2S_I : entity axis_accelerator_adapter_v2_1_16.xd_iarg_s2s_adapter
          generic map (
            C_FAMILY             => C_FAMILY,
            C_MTBF_STAGES        => C_MTBF_STAGES, 
            C_S_AXIS_TDATA_WIDTH => C_S_AXIS_TDATA_WIDTH,
            C_S_AXIS_TUSER_WIDTH => C_S_AXIS_TUSER_WIDTH,
            C_S_AXIS_TID_WIDTH   => C_S_AXIS_TID_WIDTH,
            C_S_AXIS_TDEST_WIDTH => C_S_AXIS_TDEST_WIDTH,
            C_AP_ARG_DATA_WIDTH  => IARG_DWIDTH,
            C_AP_ARG_ADDR_WIDTH  => IARG_AWIDTH,
            C_MULTIBUFFER_DEPTH  => IARG_MB_DEPTH)
          port map (
            S_AXIS_ACLK     => S_AXIS_ACLK(i),
            S_AXIS_ARESETN  => S_AXIS_ARESETN(i),
            S_AXIS_TVALID   => S_AXIS_TVALID(i),
            S_AXIS_TREADY   => S_AXIS_TREADY(i),
            S_AXIS_TDATA    => S_AXIS_TDATA(C_S_AXIS_TDATA_WIDTH*(i+1)-1 downto C_S_AXIS_TDATA_WIDTH*i),
            S_AXIS_TSTRB    => S_AXIS_TSTRB(C_S_AXIS_TSTRB_WIDTH*(i+1)-1 downto C_S_AXIS_TSTRB_WIDTH*i),
            S_AXIS_TKEEP    => S_AXIS_TKEEP(C_S_AXIS_TKEEP_WIDTH*(i+1)-1 downto C_S_AXIS_TKEEP_WIDTH*i),
            S_AXIS_TLAST    => S_AXIS_TLAST(i),
            S_AXIS_TID      => S_AXIS_TID(C_S_AXIS_TID_WIDTH*(i+1)-1 downto C_S_AXIS_TID_WIDTH*i),
            S_AXIS_TDEST    => S_AXIS_TDEST(C_S_AXIS_TDEST_WIDTH*(i+1)-1 downto C_S_AXIS_TDEST_WIDTH*i),
            S_AXIS_TUSER    => S_AXIS_TUSER(C_S_AXIS_TUSER_WIDTH*(i+1)-1 downto C_S_AXIS_TUSER_WIDTH*i),
            ap_clk          => ap_clk,
            ap_rst          => ap_rst,
            ap_iarg_dout    => ap_fifo_iarg_dout(IARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto C_MAX_ARG_DWIDTH*i),
            ap_iarg_re      => ap_fifo_iarg_read(i),
            ap_iarg_empty_n => ap_fifo_iarg_empty_n(i),
            mb_arg_rdy      => mb_iarg_rdy(i),
            mb_arg_done     => mb_iarg_done(i));
            
          -- Unused signals
          status_iarg_empty(i)   <= '1';
          status_iarg_full(i)    <= '0';
          status_iarg_used(4*(i+1)-1 downto 4*i) <=(others => '0');
          ap_iarg_dout(IARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto C_MAX_ARG_DWIDTH*i) <= (others => '0');
          dbg_stream_nwords(16*(i+1)-1 downto 16*i) <= (others => '0');
          dbg_buffer_nwords(16*(i+1)-1 downto 16*i) <= (others => '0');
   
      end generate S2S_GEN;
      
      
      ap_iarg_dout(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto IARG_DWIDTH+C_MAX_ARG_DWIDTH*i)<= (others => '0');
      ap_fifo_iarg_dout(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto IARG_DWIDTH+C_MAX_ARG_DWIDTH*i)<= (others => '0');
      

    end generate INPUT_ARGS_GEN;




    IARGS_DEFAULT_GEN : if (C_N_INPUT_ARGS < C_MAX_N_IARGS) generate

    constant IARG_DWIDTH        : integer := get_int_element(C_AP_IARG_DWIDTH, C_N_INPUT_ARGS-1);

    begin


        INPUT_ARGS_HIGHER_GEN : for i in C_N_INPUT_ARGS to C_MAX_N_IARGS-1 generate
        constant IARG_DWIDTH        : integer := get_int_element(C_AP_IARG_DWIDTH, C_N_INPUT_ARGS-1);
        begin    
            S_AXIS_TREADY(i) <= '0';
	  mb_iarg_rdy(i)     <= '0';
	  ap_fifo_iarg_empty_n(i) <= '0';
          status_iarg_empty(i)   <= '0';
          status_iarg_full(i)    <= '0';
          status_iarg_used(4*(i+1)-1 downto 4*i) <=(others => '0');
          dbg_stream_nwords(16*(i+1)-1 downto 16*i) <= (others => '0');
          dbg_buffer_nwords(16*(i+1)-1 downto 16*i) <= (others => '0');
          ap_fifo_iarg_dout(IARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto C_MAX_ARG_DWIDTH*i)    <= (others => '0');
          ap_iarg_dout(IARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto C_MAX_ARG_DWIDTH*i) <= (others => '0');

	ap_iarg_dout(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto IARG_DWIDTH+C_MAX_ARG_DWIDTH*i)<= (others => '0');
	ap_fifo_iarg_dout(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*i downto IARG_DWIDTH+C_MAX_ARG_DWIDTH*i)<= (others => '0');
	
        end generate INPUT_ARGS_HIGHER_GEN;


        --ap_iarg_dout(C_MAX_N_IARGS*C_MAX_ARG_DWIDTH-1 downto C_MAX_ARG_DWIDTH*C_N_INPUT_ARGS) <= (others=>'0');
        
    end generate IARGS_DEFAULT_GEN;
    
    
  end generate IARGS_GEN;




end rtl;



-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : axi_lite_adapter.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2012-12-03
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- (c) Copyright 2012 Xilinx, Inc. All rights reserved.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-- 2013-08-05  2.0      pvk     updated
-------------------------------------------------------------------------------
-- ****************************************************************************
--
-- (c) Copyright 2010, 2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- ****************************************************************************
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync;

entity axi_lite_adapter is
  generic (
    -- System generics:
    C_FAMILY              : string                        := "virtex7";  -- Xilinx FPGA family
    -- AXI generics: 
    C_S_AXI_ADDR_WIDTH    : integer                       := 13;
    C_S_AXI_DATA_WIDTH    : integer range 32 to 128       := 32;
    C_MAX_N_IARGS         : integer;
    C_MAX_N_OARGS         : integer;
    C_MAX_MB_DEPTH        : integer;
    C_N_INPUT_ARGS        : integer;
    C_N_OUTPUT_ARGS       : integer;
    C_PRMRY_IS_ACLK_ASYNC : integer;
    C_MTBF_STAGES         : integer;
    C_MAX_ARG_AWIDTH      : integer;
    C_MAX_N_ISCALARS      : integer;
    C_N_INOUT_SCALARS     : integer;
    C_MAX_N_IOSCALARS     : integer;
    C_N_INPUT_SCALARS     : integer;
    C_MAX_N_OSCALARS      : integer;
    C_N_OUTPUT_SCALARS    : integer;
    C_MAX_SCALAR_DWIDTH   : integer;
    C_M_AXIS_TDEST_WIDTH  : integer);
  port (
    -- AXI LITE interface signals:
    S_AXI_ACLK             : in  std_logic;  --  AXI Clock
    S_AXI_ARESETN          : in  std_logic;  --  AXI Reset, active low
    S_AXI_AWADDR           : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);  --  AXI Write address
    S_AXI_AWVALID          : in  std_logic;  --  Write address valid
    S_AXI_AWREADY          : out std_logic;  --  Write address ready
    S_AXI_WDATA            : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);  --  Write data
    S_AXI_WSTRB            : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);  --  Write strobes
    S_AXI_WVALID           : in  std_logic;  --  Write valid
    S_AXI_WREADY           : out std_logic;  --  Write ready
    S_AXI_BRESP            : out std_logic_vector(1 downto 0);  --  Write response
    S_AXI_BVALID           : out std_logic;  --  Write response valid
    S_AXI_BREADY           : in  std_logic;  --  Response ready
    S_AXI_ARADDR           : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);  --  Read address
    S_AXI_ARVALID          : in  std_logic;  --  Read address valid
    S_AXI_ARREADY          : out std_logic;  --  Read address ready
    S_AXI_RDATA            : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);  --  Read data
    S_AXI_RRESP            : out std_logic_vector(1 downto 0);  --  Read response
    S_AXI_RVALID           : out std_logic;  --  Read valid
    S_AXI_RREADY           : in  std_logic;  --  Read ready
    --- App. ports
    ap_rst                 : out std_logic;  --  Read valid
    -- Command input port:
    host_cmd_data          : out std_logic_vector(31 downto 0);
    host_cmd_we            : out std_logic;
    host_cmd_rdy           : in  std_logic;
    host_complete_re       : out std_logic;
    host_cmd_error         : in  std_logic;
    -- AP core status signals:
    status_ap_start        : in  std_logic;
    status_ap_done         : in  std_logic;
    status_ap_idle         : in  std_logic;
    status_ap_ready        : in  std_logic;
    status_ap_start_clr    : out std_logic;
    status_ap_done_clr     : out std_logic;
    status_ap_idle_clr     : out std_logic;
    status_ap_ready_clr    : out std_logic;
    -- Input arguments management:
    host_iarg_rst          : out std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    iarg_rqt_enable        : out std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    status_iarg_empty      : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    status_iarg_full       : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    status_iarg_used       : in  std_logic_vector(C_MAX_N_IARGS*4-1 downto 0);
    status_iarg_n_words    : in  std_logic_vector(C_MAX_N_IARGS*(C_MAX_ARG_AWIDTH+1)-1 downto 0);
    -- Output arguments management:
    host_oarg_rst          : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    oarg_rqt_enable        : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    oarg_sw_length         : out std_logic_vector(31 downto 0);
    oarg_sw_length_m2s     : out std_logic_vector(31 downto 0);
    oarg_sw_length_we      : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    oarg_use_sw_length     : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    host_oarg_tdest        : out std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TDEST_WIDTH-1 downto 0);
    status_oarg_empty      : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    status_oarg_full       : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    status_oarg_used       : in  std_logic_vector(C_MAX_N_OARGS*4-1 downto 0);
    -- Input scalar management:
    host_iscalar_rst       : out std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS-1 downto 0);
    host_iscalar_dout      : out std_logic_vector(31 downto 0);
    host_iscalar_we        : out std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS-1 downto 0);
    host_iscalar_rdy       : in  std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS-1 downto 0);
    status_iscalar_empty   : in  std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS-1 downto 0);
    status_iscalar_full    : in  std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS-1 downto 0);
    status_iscalar_used    : in  std_logic_vector((C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS)*4-1 downto 0);
    -- Output scalar management:                  
    host_oscalar_rst       : out std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS-1 downto 0);
    host_oscalar_din       : in  std_logic_vector((C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS)*C_MAX_SCALAR_DWIDTH-1 downto 0);
    host_oscalar_re        : out std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS-1 downto 0);
    host_oscalar_rdy       : in  std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS-1 downto 0);
    status_oscalar_empty   : in  std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS-1 downto 0);
    status_oscalar_full    : in  std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS-1 downto 0);
    status_oscalar_used    : in  std_logic_vector((C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS)*4-1 downto 0);
    dbg_iarg_stream_nwords : in  std_logic_vector(C_MAX_N_IARGS*16-1 downto 0);
    dbg_iarg_buffer_nwords : in  std_logic_vector(C_MAX_N_IARGS*16-1 downto 0);
    dbg_oarg_stream_nwords : in  std_logic_vector(C_MAX_N_OARGS*16-1 downto 0);
    dbg_oarg_buffer_nwords : in  std_logic_vector(C_MAX_N_OARGS*16-1 downto 0);
    iscalar_rqt_enable     : out std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS-1 downto 0);
    oscalar_rqt_enable     : out std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS-1 downto 0);
    ---
    interrupt              : out std_logic);

  attribute SIGIS                  : string;
  attribute SIGIS of S_AXI_ACLK    : signal is "CLK";
  attribute SIGIS of S_AXI_ARESETN : signal is "RST";


end entity;

architecture rtl of axi_lite_adapter is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";

  constant DATA_WIDTH      : integer                      := 32;
  constant STRB_WIDTH      : integer                      := (C_S_AXI_DATA_WIDTH/8);
  constant AXI_RESP_OKAY   : std_logic_vector(1 downto 0) := "00";
  constant AXI_RESP_EXOKAY : std_logic_vector(1 downto 0) := "01";
  constant AXI_RESP_SLVERR : std_logic_vector(1 downto 0) := "10";
  constant AXI_RESP_DECERR : std_logic_vector(1 downto 0) := "11";


  function ext_32 (
    value : std_logic_vector;
    width : natural := 32) 
    return std_logic_vector is
    constant N   : integer := value'length;
    variable ret : std_logic_vector(width-1 downto 0);
  begin
    ret               := (others => '0');
    ret(N-1 downto 0) := value;
    return ret;
  end function ext_32;

  function sext_32 (
    value : std_logic_vector;
    width : natural := 32) 
    return std_logic_vector is
    constant N   : integer := value'length;
    alias val_dn : std_logic_vector (N-1 downto 0) is value;
    variable ret : std_logic_vector(width-1 downto 0);
  begin
    ret(N-1 downto 0) := val_dn;
    if(N < 32) then
      ret(31 downto N) := (others => val_dn(N-1));
    end if;
    return ret;
  end function sext_32;

  signal axi_rst   : std_logic;
  signal ap_rst_fb   : std_logic;
  signal axi_rst1   : std_logic;
  signal ap_rst_i   : std_logic;
  signal axi_addr  : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);  --  AXI Write address
  signal wr_data_i : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);

  --------------------------------------------------
  -- We use banks of 16 registers (32 bits, 4 bytes):
  constant BANK_ADDR_WIDTH : integer := 4;  -- Up to 16 banks can be used.
  constant BANK_ADDR_LSB   : integer := log2(16*4);
  constant BANK_ADDR_MSB   : integer := BANK_ADDR_LSB+BANK_ADDR_WIDTH-1;

  constant GP_REGS_BANK_ADDR        : integer := 0;
  constant GP_REGS_BANK1_ADDR       : integer := 1;
  constant ISCALAR_BANK_ADDR        : integer := 2;
  constant OSCALAR_BANK_ADDR        : integer := 3;
  constant IARG_STATUS_BANK_ADDR    : integer := 4;
  constant OARG_STATUS_BANK_ADDR    : integer := 5;
  constant ISCALAR_STATUS_BANK_ADDR : integer := 6;
  constant OSCALAR_STATUS_BANK_ADDR : integer := 7;
  constant OARG_LENGTH_BANK_ADDR    : integer := 8;
  constant OARG_TDEST_BANK_ADDR     : integer := 9;

  constant CTRL_REG_INDEX               : integer := 0;
  constant STATUS_REG_INDEX             : integer := 1;
  constant IARG_RST_REG_INDEX           : integer := 2;
  constant OARG_RST_REG_INDEX           : integer := 3;
  constant IARG_RQT_ENABLE_REG_INDEX    : integer := 4;
  constant OARG_RQT_ENABLE_REG_INDEX    : integer := 5;
  constant COMMAND_REG_INDEX            : integer := 10;
  constant COMPLETE_REG_INDEX           : integer := 11;
  constant INT_ENABLE_REG_INDEX         : integer := 12;
  constant INT_FLAG_REG_INDEX           : integer := 13;
  constant OARG_LENGTH_MODE_REG_INDEX   : integer := 15;
  constant ISCALAR_RST_REG_INDEX        : integer := 16;
  constant OSCALAR_RST_REG_INDEX        : integer := 17;
  constant ISCALAR_RQT_ENABLE_REG_INDEX : integer := 18;
  constant OSCALAR_RQT_ENABLE_REG_INDEX : integer := 19;

  constant BANK1_INDEX : integer := 16;

  signal gp_bank             : std_logic;  -- bank 0
  signal gp_bank1            : std_logic;  -- bank 1
  signal iscalar_bank        : std_logic;  -- bank 2
  signal oscalar_bank        : std_logic;  -- bank 3
  signal iarg_status_bank    : std_logic;  -- bank 4
  signal oarg_status_bank    : std_logic;  -- bank 5
  signal iscalar_status_bank : std_logic;  -- bank 6
  signal oscalar_status_bank : std_logic;  -- bank 7
  signal oarg_length_bank    : std_logic;  -- bank 8
  signal oarg_tdest_bank     : std_logic;  -- bank 9

  signal mux_gp_regs         : std_logic_vector(31 downto 0);
  signal mux_oscalar_data    : std_logic_vector(31 downto 0);
  signal mux_iarg_status     : std_logic_vector(31 downto 0);
  signal mux_oarg_status     : std_logic_vector(31 downto 0);
  signal mux_iscalar_status  : std_logic_vector(31 downto 0);
  signal mux_oscalar_status  : std_logic_vector(31 downto 0);
  signal mux_oarg_tdest_regs : std_logic_vector(31 downto 0);

  signal rd_bank_addr : std_logic_vector(BANK_ADDR_WIDTH-1 downto 0);

  constant REGS_ADDR_WIDTH : integer := 4;  -- Inner address width.
  constant N_REGS          : integer := 2**REGS_ADDR_WIDTH;
  signal   reg_sel         : std_logic_vector(N_REGS-1 downto 0);
  signal   rd_reg_addr     : std_logic_vector(REGS_ADDR_WIDTH-1 downto 0);

  signal ctrl_reg            : std_logic_vector(31 downto 0);
  signal status_reg          : std_logic_vector(31 downto 0);
  signal ap_iarg_rst_reg     : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal ap_oarg_rst_reg     : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal iarg_rqt_enable_reg : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal oarg_rqt_enable_reg : std_logic_vector(C_MAX_N_OARGS-1 downto 0);

  signal oarg_length_mode_reg : std_logic_vector(C_MAX_N_OARGS-1 downto 0);

  signal reg_sel1 : std_logic_vector(N_REGS-1 downto 0);

  signal iscalar_rst_reg        : std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS-1 downto 0);
  signal oscalar_rst_reg        : std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS-1 downto 0);
  signal iscalar_rqt_enable_reg : std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS-1 downto 0);
  signal oscalar_rqt_enable_reg : std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS-1 downto 0);

  ------------------------------------------------
  type state_type is (
    -- pragma translate_off
    stop,
    -- pragma translate_on
    idle,
    read_regs,
    write_regs,
    send_resp);

  signal state : state_type;

  signal wr_addr_rdy : std_logic;
  signal rd_addr_rdy : std_logic;

  signal wr_resp_vld : std_logic;
  signal wr_data_rdy : std_logic;

  signal rd_data_vld : std_logic;
  signal rd_data_ce  : std_logic;
  signal rd_data     : std_logic_vector(31 downto 0);

  signal gp_reg_start : std_logic;
  signal rd_start     : std_logic;
  signal wr_start     : std_logic;
  signal access_start : std_logic;

  signal gp_reg_start1 : std_logic;

  --------------------------------------------------------------------

  -- pragma translate_off
  signal mem_rd : std_logic;
  signal mem_wr : std_logic;
  -- pragma translate_on

  signal scalar_reg_start : std_logic;
  signal glb_int_en       : std_logic;

  ---------------------
  -- INTERRUPT REGs: --
  ---------------------
  constant N_INTS         : integer := 8;
  signal   int_enable_reg : std_logic_vector(N_INTS-1 downto 0);
  signal   int_flag_reg   : std_logic_vector(N_INTS-1 downto 0);
  signal   int_rqt        : std_logic_vector(N_INTS-1 downto 0);
  
  ---------------------
  -- Syncrhpnoaer signals
  ---------------------
  signal status_iarg_empty_sync   : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal oarg_sw_length_we_event  : std_logic;
  signal oarg_sw_length_we_i      : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  
  
  signal host_ioscalar_re_i : std_logic_vector(C_MAX_N_ISCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_ISCALARS);
  signal host_oscalar_re_i : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
  
      ATTRIBUTE async_reg           : STRING;
        ATTRIBUTE async_reg OF axi_rst1    : SIGNAL IS "true"; 
      ATTRIBUTE async_reg OF axi_rst    : SIGNAL IS "true"; 

begin



   ----------------------
   --- status_iarg_empty Synchronizer
   ----------------------
   EN_STRM_TO_LITE_SYNC_GEN : if (C_PRMRY_IS_ACLK_ASYNC = 1) generate
   begin
   

    XD_IARG_RQT_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => 2 --C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => '0',
        prmry_resetn               => '0',
        prmry_in                   => '0',
        prmry_vect_in              => status_iarg_empty,

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => open,
        scndry_vect_out            => status_iarg_empty_sync
        );

    
   end generate EN_STRM_TO_LITE_SYNC_GEN;

   NO_SYNC_GEN : if (C_PRMRY_IS_ACLK_ASYNC = 0) generate
   begin
   
       status_iarg_empty_sync <= status_iarg_empty;
    
   end generate NO_SYNC_GEN;

   ----------------------
   --- status_iarg_empty Synchronizer
   ----------------------



  --axi_rst <= not(S_AXI_ARESETN);

      prd1: PROCESS (S_AXI_ACLK, S_AXI_ARESETN)
      BEGIN
       -- Register Stage #1 
        IF (S_AXI_ARESETN = '0') THEN
          axi_rst1 <= '1';
          axi_rst <= '1';
        ELSIF (S_AXI_ACLK'event and S_AXI_ACLK = '1') THEN
          axi_rst1 <= '0';
          axi_rst <= axi_rst1;
        END IF;
        END PROCESS prd1;


  S_AXI_AWREADY <= wr_addr_rdy;
  S_AXI_ARREADY <= rd_addr_rdy;
  S_AXI_WREADY  <= wr_data_rdy;

  S_AXI_BVALID <= wr_resp_vld;
  S_AXI_BRESP  <= AXI_RESP_OKAY;

  S_AXI_RDATA  <= rd_data;
  S_AXI_RVALID <= rd_data_vld;
  S_AXI_RRESP  <= AXI_RESP_OKAY;

  -------------------------------------------

  axi_addr <= S_AXI_ARADDR when (S_AXI_ARVALID = '1') else S_AXI_AWADDR;

  process(axi_addr)
    variable int_addr : integer range 0 to (2**BANK_ADDR_WIDTH)-1;
  begin
    gp_bank             <= '0';
    gp_bank1            <= '0';
    iscalar_bank        <= '0';
    oscalar_bank        <= '0';
    iarg_status_bank    <= '0';
    oarg_status_bank    <= '0';
    iscalar_status_bank <= '0';
    oscalar_status_bank <= '0';
    oarg_length_bank    <= '0';
    oarg_tdest_bank     <= '0';

    int_addr := to_integer(unsigned(axi_addr(BANK_ADDR_MSB downto BANK_ADDR_LSB)));
    case int_addr is
      when GP_REGS_BANK_ADDR        => gp_bank             <= '1';
      when GP_REGS_BANK1_ADDR       => gp_bank1            <= '1';
      when ISCALAR_BANK_ADDR        => iscalar_bank        <= '1';
      when OSCALAR_BANK_ADDR        => oscalar_bank        <= '1';
      when IARG_STATUS_BANK_ADDR    => iarg_status_bank    <= '1';
      when OARG_STATUS_BANK_ADDR    => oarg_status_bank    <= '1';
      when ISCALAR_STATUS_BANK_ADDR => iscalar_status_bank <= '1';
      when OSCALAR_STATUS_BANK_ADDR => oscalar_status_bank <= '1';
      when OARG_LENGTH_BANK_ADDR    => oarg_length_bank    <= '1';
      when OARG_TDEST_BANK_ADDR     => oarg_tdest_bank     <= '1';
      when others                   =>
    end case;
  end process;

  process(S_AXI_ACLK)
    constant LSB : integer := log2(C_S_AXI_DATA_WIDTH/8);
    constant MSB : integer := LSB+REGS_ADDR_WIDTH-1;
  begin
    if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      if(rd_start = '1') then
        rd_reg_addr <= S_AXI_ARADDR(MSB downto LSB);
      end if;
    end if;
  end process;

  process(S_AXI_ACLK)
  begin
    if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      if(rd_start = '1') then
        rd_bank_addr <= S_AXI_ARADDR(BANK_ADDR_MSB downto BANK_ADDR_LSB);
      end if;
    end if;
  end process;

  process(S_AXI_ACLK, axi_rst)
  begin
    if(axi_rst = '1') then
      state       <= idle;
      wr_resp_vld <= '0';
      rd_data_vld <= '0';
      rd_addr_rdy <= '0';
      wr_addr_rdy <= '0';
      wr_data_rdy <= '0';
      -- pragma translate_off
      mem_rd      <= '0';
      mem_wr      <= '0';
      -- pragma translate_on
    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      rd_addr_rdy <= '0';
      wr_addr_rdy <= '0';
      wr_data_rdy <= '0';
      -- pragma translate_off
      mem_rd      <= '0';
      mem_wr      <= '0';
      -- pragma translate_on
      case state is
        when idle =>
          if(S_AXI_ARVALID = '1') then
            state       <= read_regs;
            rd_addr_rdy <= '1';
          elsif(S_AXI_AWVALID = '1' and S_AXI_WVALID = '1') then
            -- During write accesses it's waited until both both address and 
            -- write data are stables.
            state       <= write_regs;
            wr_addr_rdy <= '1';
            wr_data_rdy <= '1';
          end if;
        when read_regs =>
          state       <= send_resp;
          rd_data_vld <= '1';
        when write_regs =>
          state       <= send_resp;
          wr_resp_vld <= '1';

        when send_resp =>
          if ((wr_resp_vld = '1' and S_AXI_BREADY = '1') or
              (rd_data_vld = '1' and S_AXI_RREADY = '1')) then
            wr_resp_vld <= '0';
            rd_data_vld <= '0';
            state       <= idle;
          end if;
        when others =>
      end case;
    end if;
  end process;

  process(state, gp_bank, gp_bank1, S_AXI_ARVALID, S_AXI_AWVALID, S_AXI_WVALID)
  begin
    rd_data_ce       <= '0';
    gp_reg_start     <= '0';
    gp_reg_start1    <= '0';
    scalar_reg_start <= '0';
    rd_start         <= '0';
    wr_start         <= '0';
    access_start     <= '0';

    case state is
      when idle =>
        rd_start      <= S_AXI_ARVALID;
        wr_start      <= S_AXI_AWVALID and S_AXI_WVALID;
        access_start  <= S_AXI_ARVALID or (S_AXI_AWVALID and S_AXI_WVALID);
        gp_reg_start  <= gp_bank and (S_AXI_ARVALID or (S_AXI_AWVALID and S_AXI_WVALID));
        gp_reg_start1 <= gp_bank1 and (S_AXI_ARVALID or (S_AXI_AWVALID and S_AXI_WVALID));

      when read_regs =>
        rd_data_ce <= '1';

      when write_regs =>

      when send_resp =>

      when others =>
    end case;
  end process;

  --------------------
  -- INPUT DATAPATH --
  --------------------

  process(S_AXI_ACLK)
  begin
    if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      wr_data_i <= S_AXI_WDATA;
    end if;
  end process;

  -----------------------------------------
  --- BANK 0: GENERAL PURPOSE REGISTERS ---
  -----------------------------------------

  -- Selection signal generation for inner registers:
  process(S_AXI_ACLK)
    variable offset : unsigned(REGS_ADDR_WIDTH-1 downto 0);
    constant LSB    : integer := log2(C_S_AXI_DATA_WIDTH/8);
    constant MSB    : integer := LSB+REGS_ADDR_WIDTH-1;
  begin
    if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      if(axi_rst = '1' or wr_data_rdy = '1' or rd_data_vld = '1') then
        reg_sel <= (others => '0');
      elsif(gp_reg_start = '1') then
        offset := unsigned(axi_addr(MSB downto LSB));
        for i in reg_sel'range loop
          if(offset = i) then
            reg_sel(i) <= '1';
          else
            reg_sel(i) <= '0';
          end if;
        end loop;
      end if;
    end if;
  end process;

  ---------------------------------
  -- CONTROL REGISTER (INDEX  0) --
  ---------------------------------

  process(S_AXI_ACLK, axi_rst)
  begin
    if(axi_rst = '1') then
      ctrl_reg <= (others => '0');
    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      if(reg_sel(CTRL_REG_INDEX) = '1' and wr_data_rdy = '1') then
        for i in 0 to STRB_WIDTH-1 loop
          if(S_AXI_WSTRB(i) = '1') then
            ctrl_reg(8*(i+1)-1 downto 8*i) <= S_AXI_WDATA(8*(i+1)-1 downto 8*i);
          end if;
        end loop;
      end if;
    end if;
  end process;

  ap_rst_i     <= ctrl_reg(0) or axi_rst;
  glb_int_en <= ctrl_reg(1);

 process(S_AXI_ACLK, axi_rst)
  begin
    if(axi_rst = '1') then
      ap_rst <= '1';
      ap_rst_fb <= '1';
    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      ap_rst <= ap_rst_i;
      ap_rst_fb <= ap_rst_i;
    end if;
  end process;


  --------------------------------
  -- STATUS REGISTER (INDEX  1) --
  --------------------------------

  status_reg(0)           <= status_ap_start;
  status_reg(1)           <= status_ap_done;
  status_reg(2)           <= status_ap_idle;
  status_reg(3)           <= status_ap_ready;
  status_reg(31 downto 4) <= (others => '0');

  process(S_AXI_ACLK, ap_rst_fb)
  begin
    if(ap_rst_fb = '1') then
      status_ap_start_clr <= '0';
      status_ap_done_clr  <= '0';
      status_ap_idle_clr  <= '0';
      status_ap_ready_clr <= '0';
    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      status_ap_start_clr <= reg_sel(STATUS_REG_INDEX) and wr_data_rdy and S_AXI_WSTRB(0) and S_AXI_WDATA(0);
      status_ap_done_clr  <= reg_sel(STATUS_REG_INDEX) and wr_data_rdy and S_AXI_WSTRB(0) and S_AXI_WDATA(1);
      status_ap_idle_clr  <= reg_sel(STATUS_REG_INDEX) and wr_data_rdy and S_AXI_WSTRB(0) and S_AXI_WDATA(2);
      status_ap_ready_clr <= reg_sel(STATUS_REG_INDEX) and wr_data_rdy and S_AXI_WSTRB(0) and S_AXI_WDATA(3);
    end if;
  end process;

  -----------------------------------------------------
  -- INPUT ARG MULTIBUFFER RESET REGISTER (INDEX  2) --
  -----------------------------------------------------

  IARGS_RST_GEN : if (C_N_INPUT_ARGS > 0) generate
    signal reg : std_logic_vector(C_N_INPUT_ARGS-1 downto 0);
  begin

    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        reg <= (others => '0');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if(reg_sel(IARG_RST_REG_INDEX) = '1' and wr_data_rdy = '1') then
          for i in 0 to C_N_INPUT_ARGS-1 loop
            reg(i) <= S_AXI_WDATA(i) and S_AXI_WSTRB(i/8);
          end loop;
        end if;
      end if;
    end process;

    process(reg)
    begin
      host_iarg_rst              <= (others => '0');
      ap_iarg_rst_reg            <= (others => '0');
      host_iarg_rst(reg'range)   <= reg;
      ap_iarg_rst_reg(reg'range) <= reg;
    end process;

  end generate IARGS_RST_GEN;


  NO_IARGS_RST_GEN : if (C_N_INPUT_ARGS = 0) generate
  begin
    host_iarg_rst   <= (others => '0');
    ap_iarg_rst_reg <= (others => '0');
  end generate NO_IARGS_RST_GEN;

  ------------------------------------------------------
  -- OUTPUT ARG MULTIBUFFER RESET REGISTER (INDEX  3) --
  ------------------------------------------------------

  OARGS_RST_GEN : if (C_N_OUTPUT_ARGS > 0) generate
    signal reg : std_logic_vector(C_N_OUTPUT_ARGS-1 downto 0);
  begin

    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        reg <= (others => '0');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if(reg_sel(OARG_RST_REG_INDEX) = '1' and wr_data_rdy = '1') then
          for i in 0 to C_N_OUTPUT_ARGS-1 loop
            reg(i) <= S_AXI_WDATA(i) and S_AXI_WSTRB(i/8);
          end loop;
        end if;
      end if;
    end process;

    process(reg)
    begin
      host_oarg_rst              <= (others => '0');
      ap_oarg_rst_reg            <= (others => '0');
      host_oarg_rst(reg'range)   <= reg;
      ap_oarg_rst_reg(reg'range) <= reg;
    end process;
    
  end generate OARGS_RST_GEN;


  NO_OARGS_RST_GEN : if (C_N_OUTPUT_ARGS = 0) generate
  begin
    host_oarg_rst   <= (others => '0');
    ap_oarg_rst_reg <= (others => '0');
  end generate NO_OARGS_RST_GEN;

  --------------------------------------------------
  -- INPUT ARG REQUEST ENABLE REGISTER (INDEX  4) --
  --------------------------------------------------

  IARG_RQT_ENABLE_GEN : if (C_N_INPUT_ARGS > 0) generate
    signal reg : std_logic_vector(C_N_INPUT_ARGS-1 downto 0);
  begin
    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        -- reg <= (others => '0');
        reg <= (others => '1');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if(reg_sel(IARG_RQT_ENABLE_REG_INDEX) = '1' and wr_data_rdy = '1') then
          for i in 0 to C_N_INPUT_ARGS-1 loop
            reg(i) <= S_AXI_WDATA(i) and S_AXI_WSTRB(i/8);
          end loop;
        end if;
      end if;
    end process;

    process(reg)
    begin
      iarg_rqt_enable                <= (others => '0');
      iarg_rqt_enable_reg            <= (others => '0');
      iarg_rqt_enable(reg'range)     <= reg;
      iarg_rqt_enable_reg(reg'range) <= reg;
    end process;

  end generate IARG_RQT_ENABLE_GEN;

  NO_IARG_RQT_ENABLE_GEN : if (C_N_INPUT_ARGS = 0) generate
  begin
    iarg_rqt_enable     <= (others => '0');
    iarg_rqt_enable_reg <= (others => '0');
  end generate NO_IARG_RQT_ENABLE_GEN;


  ---------------------------------------------------
  -- OUTPUT ARG REQUEST ENABLE REGISTER (INDEX  5) --
  ---------------------------------------------------

  OARG_RQT_ENABLE_GEN : if (C_N_OUTPUT_ARGS > 0) generate
    signal reg : std_logic_vector(C_N_OUTPUT_ARGS-1 downto 0);
  begin

    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        -- reg <= (others => '0');
        reg <= (others => '1');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if(reg_sel(OARG_RQT_ENABLE_REG_INDEX) = '1' and wr_data_rdy = '1') then
          for i in 0 to C_N_OUTPUT_ARGS-1 loop
            reg(i) <= S_AXI_WDATA(i) and S_AXI_WSTRB(i/8);
          end loop;
        end if;
      end if;
    end process;

    process(reg)
    begin
      oarg_rqt_enable                <= (others => '0');
      oarg_rqt_enable_reg            <= (others => '0');
      oarg_rqt_enable(reg'range)     <= reg;
      oarg_rqt_enable_reg(reg'range) <= reg;
    end process;
    
  end generate OARG_RQT_ENABLE_GEN;

  NO_OARG_RQT_ENABLE_GEN : if (C_N_OUTPUT_ARGS = 0) generate
  begin
    oarg_rqt_enable     <= (others => '0');
    oarg_rqt_enable_reg <= (others => '0');
  end generate NO_OARG_RQT_ENABLE_GEN;

  ---------------------------------
  -- COMMAND REGISTER (INDEX 10) --
  ---------------------------------

  process(S_AXI_ACLK, ap_rst_fb)
  begin
    if(ap_rst_fb = '1') then
      host_cmd_we <= '0';
    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      host_cmd_we <= reg_sel(COMMAND_REG_INDEX) and wr_data_rdy;
    end if;
  end process;

  host_cmd_data <= wr_data_i;

  -----------------------------------
  -- COMPLETE REGISTER (INDEX 11) --
  -----------------------------------

  process(S_AXI_ACLK, ap_rst_fb)
  begin
    if(ap_rst_fb = '1') then
      host_complete_re <= '0';
    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      host_complete_re <= reg_sel(COMPLETE_REG_INDEX) and rd_data_vld;  -- ????
    end if;
  end process;


  --------------------------
  -- INTERRUPT MANAGEMENT --
  --------------------------

  ------------------------------------------
  -- INTERRUPT ENABLE REGISTER (INDEX 12) --
  ------------------------------------------

  process(S_AXI_ACLK, ap_rst_fb)
  begin
    if(ap_rst_fb = '1') then
      int_enable_reg <= (others => '0');
    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      if(reg_sel(INT_ENABLE_REG_INDEX) = '1' and wr_data_rdy = '1') then
        int_enable_reg <= S_AXI_WDATA(N_INTS-1 downto 0);
      end if;
    end if;
  end process;

  -- Individual asigment for each interrupt source:
  int_rqt(0)                 <= host_cmd_error;
  int_rqt(N_INTS-1 downto 1) <= (others => '0');

  ----------------------------------------
  -- INTERRUPT FLAG REGISTER (INDEX 13) --
  ----------------------------------------

  process(S_AXI_ACLK, ap_rst_fb)
  begin
    if(ap_rst_fb = '1') then
      int_flag_reg <= (others => '0');
    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      if(reg_sel(INT_FLAG_REG_INDEX) = '1' and wr_data_rdy = '1') then
        int_flag_reg <= int_flag_reg and not(S_AXI_WDATA(N_INTS-1 downto 0));
      else
        int_flag_reg <= int_flag_reg or int_rqt;
      end if;
    end if;
  end process;

  process(S_AXI_ACLK, ap_rst_fb)
  begin
    if(ap_rst_fb = '1') then
      interrupt <= '0';
    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      interrupt <= or_reduce(int_flag_reg and int_enable_reg) and glb_int_en;
    end if;
  end process;

  -----------------------------------------
  --- BANK 1: GENERAL PURPOSE REGISTERS ---
  -----------------------------------------

  -- Selection signal generation for inner registers:
  process(S_AXI_ACLK)
    variable offset : unsigned(REGS_ADDR_WIDTH-1 downto 0);
    constant LSB    : integer := log2(C_S_AXI_DATA_WIDTH/8);
    constant MSB    : integer := LSB+REGS_ADDR_WIDTH-1;
  begin
    if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      if(ap_rst_fb = '1' or wr_data_rdy = '1' or rd_data_vld = '1') then
        reg_sel1 <= (others => '0');
      elsif(gp_reg_start1 = '1') then
        offset := unsigned(axi_addr(MSB downto LSB));
        for i in reg_sel1'range loop
          if(offset = i) then
            reg_sel1(i) <= '1';
          else
            reg_sel1(i) <= '0';
          end if;
        end loop;
      end if;
    end if;
  end process;


  -------------------------------------------------
  -- INPUT SCALAR FIFO RESET REGISTER (INDEX 16) --
  -------------------------------------------------

  ISCALAR_RST_GEN : if (C_N_INPUT_SCALARS > 0) generate
    signal rst_reg : std_logic_vector(C_N_INPUT_SCALARS-1 downto 0);
  begin

    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        rst_reg <= (others => '0');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if(reg_sel1(ISCALAR_RST_REG_INDEX-BANK1_INDEX) = '1' and wr_data_rdy = '1') then
          for i in 0 to C_N_INPUT_SCALARS-1 loop
            rst_reg(i) <= S_AXI_WDATA(i) and S_AXI_WSTRB(i/8);
          end loop;
        end if;
      end if;
    end process;

    process(rst_reg)
    begin
      host_iscalar_rst(C_MAX_N_ISCALARS-1 downto 0)            <= (others => '0');
      iscalar_rst_reg(C_MAX_N_ISCALARS-1 downto 0)             <= (others => '0');
      host_iscalar_rst(rst_reg'range) <= rst_reg;
      iscalar_rst_reg(rst_reg'range)  <= rst_reg;
    end process;

  end generate ISCALAR_RST_GEN;

  NO_ISCALAR_RST_GEN : if (C_N_INPUT_SCALARS = 0) generate
  begin
    host_iscalar_rst(C_MAX_N_ISCALARS-1 downto 0) <= (others => '0');
    iscalar_rst_reg(C_MAX_N_ISCALARS-1 downto 0)  <= (others => '0');
  end generate NO_ISCALAR_RST_GEN;

  ISCALAR_IO_RST_GEN : if (C_N_INOUT_SCALARS > 0) generate
    signal rst_reg : std_logic_vector(C_N_INOUT_SCALARS-1 downto 0);
  begin

    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        rst_reg <= (others => '0');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if(reg_sel1(ISCALAR_RST_REG_INDEX-BANK1_INDEX) = '1' and wr_data_rdy = '1') then
          for i in 0 to C_N_INOUT_SCALARS-1 loop
            rst_reg(i) <= S_AXI_WDATA(i+C_MAX_N_ISCALARS) and S_AXI_WSTRB((i+C_MAX_N_ISCALARS)/8);
          end loop;
        end if;
      end if;
    end process;

    process(rst_reg)
    begin
      host_iscalar_rst(C_MAX_N_ISCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_ISCALARS)            <= (others => '0');
      iscalar_rst_reg(C_MAX_N_ISCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_ISCALARS)             <= (others => '0');
      host_iscalar_rst(C_MAX_N_ISCALARS+C_N_INOUT_SCALARS-1 downto C_MAX_N_ISCALARS) <= rst_reg;
      iscalar_rst_reg(C_MAX_N_ISCALARS+C_N_INOUT_SCALARS-1 downto C_MAX_N_ISCALARS)  <= rst_reg;
    end process;

  end generate ISCALAR_IO_RST_GEN;

  NO_ISCALAR_IO_RST_GEN : if (C_N_INOUT_SCALARS = 0) generate
  begin
    host_iscalar_rst(C_MAX_N_ISCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_ISCALARS) <= (others => '0');
    iscalar_rst_reg(C_MAX_N_ISCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_ISCALARS)  <= (others => '0');
  end generate NO_ISCALAR_IO_RST_GEN;


  --------------------------------------------------
  -- OUTPUT SCALAR FIFO RESET REGISTER (INDEX 17) --
  --------------------------------------------------

  OSCALAR_RST_GEN : if (C_N_OUTPUT_SCALARS > 0) generate
    signal rst_reg : std_logic_vector(C_N_OUTPUT_SCALARS-1 downto 0);
  begin

    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        rst_reg <= (others => '0');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if(reg_sel1(OSCALAR_RST_REG_INDEX-BANK1_INDEX) = '1' and wr_data_rdy = '1') then
          for i in 0 to C_N_OUTPUT_SCALARS-1 loop
            rst_reg(i) <= S_AXI_WDATA(i) and S_AXI_WSTRB(i/8);
          end loop;
        end if;
      end if;
    end process;

    process(rst_reg)
    begin
      host_oscalar_rst(C_MAX_N_OSCALARS-1 downto 0)            <= (others => '0');
      oscalar_rst_reg(C_MAX_N_OSCALARS-1 downto 0)             <= (others => '0');
      host_oscalar_rst(rst_reg'range) <= rst_reg;
      oscalar_rst_reg(rst_reg'range)  <= rst_reg;
    end process;

  end generate OSCALAR_RST_GEN;

  NO_OSCALAR_RST_GEN : if (C_N_OUTPUT_SCALARS = 0) generate
  begin
    host_oscalar_rst(C_MAX_N_OSCALARS-1 downto 0) <= (others => '0');
    oscalar_rst_reg(C_MAX_N_OSCALARS-1 downto 0)  <= (others => '0');
  end generate NO_OSCALAR_RST_GEN;

  OSCALAR_IO_RST_GEN : if (C_N_INOUT_SCALARS > 0) generate
    signal os_rst_reg : std_logic_vector(C_N_INOUT_SCALARS-1 downto 0);
  begin

    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        os_rst_reg <= (others => '0');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if(reg_sel1(OSCALAR_RST_REG_INDEX-BANK1_INDEX) = '1' and wr_data_rdy = '1') then
          for i in 0 to C_N_INOUT_SCALARS-1 loop
            os_rst_reg(i) <= S_AXI_WDATA(i+C_MAX_N_OSCALARS) and S_AXI_WSTRB((i+C_MAX_N_OSCALARS)/8);
          end loop;
        end if;
      end if;
    end process;

    process(os_rst_reg)
    begin
      host_oscalar_rst(C_MAX_N_OSCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_OSCALARS)            <= (others => '0');
      oscalar_rst_reg(C_MAX_N_OSCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_OSCALARS)             <= (others => '0');
      host_oscalar_rst(C_MAX_N_OSCALARS+C_N_INOUT_SCALARS-1 downto C_MAX_N_OSCALARS) <= os_rst_reg;
      oscalar_rst_reg(C_MAX_N_OSCALARS+C_N_INOUT_SCALARS-1 downto C_MAX_N_OSCALARS)  <= os_rst_reg;
    end process;

  end generate OSCALAR_IO_RST_GEN;

  NO_OSCALAR_IO_RST_GEN : if (C_N_INOUT_SCALARS = 0) generate
  begin
    host_oscalar_rst(C_MAX_N_OSCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_OSCALARS) <= (others => '0');
    oscalar_rst_reg(C_MAX_N_OSCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_OSCALARS)  <= (others => '0');
  end generate NO_OSCALAR_IO_RST_GEN;

  -----------------------------------------------------
  -- INPUT SCALAR REQUEST ENABLE REGISTER (INDEX 18) --
  -----------------------------------------------------

  ISCALAR_RQT_ENABLE_GEN : if (C_N_INPUT_SCALARS > 0) generate
    signal reg : std_logic_vector(C_N_INPUT_SCALARS-1 downto 0);
  begin

    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        -- reg <= (others => '0');
        reg <= (others => '1');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if(reg_sel1(ISCALAR_RQT_ENABLE_REG_INDEX-BANK1_INDEX) = '1' and wr_data_rdy = '1') then
          for i in 0 to C_N_INPUT_SCALARS-1 loop
            reg(i) <= S_AXI_WDATA(i) and S_AXI_WSTRB(i/8);
          end loop;
        end if;
      end if;
    end process;

    process(reg)
    begin
      iscalar_rqt_enable(C_MAX_N_ISCALARS-1 downto 0)                <= (others => '0');
      iscalar_rqt_enable_reg(C_MAX_N_ISCALARS-1 downto 0)            <= (others => '0');
      iscalar_rqt_enable(reg'range)     <= reg;
      iscalar_rqt_enable_reg(reg'range) <= reg;
    end process;

  end generate ISCALAR_RQT_ENABLE_GEN;


  NO_ISCALAR_RQT_ENABLE_GEN : if (C_N_INPUT_SCALARS = 0) generate
  begin
    iscalar_rqt_enable(C_MAX_N_ISCALARS-1 downto 0)     <= (others => '0');
    iscalar_rqt_enable_reg(C_MAX_N_ISCALARS-1 downto 0) <= (others => '0');
  end generate NO_ISCALAR_RQT_ENABLE_GEN;

  ISCALAR_IO_RQT_ENABLE_GEN : if (C_N_INOUT_SCALARS > 0) generate
    signal rqt_reg : std_logic_vector(C_N_INOUT_SCALARS-1 downto 0);
  begin

    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        -- reg <= (others => '0');
        rqt_reg <= (others => '1');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if(reg_sel1(ISCALAR_RQT_ENABLE_REG_INDEX-BANK1_INDEX) = '1' and wr_data_rdy = '1') then
          for i in 0 to C_N_INOUT_SCALARS-1 loop
            rqt_reg(i) <= S_AXI_WDATA(i+C_MAX_N_ISCALARS) and S_AXI_WSTRB((i+C_MAX_N_ISCALARS)/8);
          end loop;
        end if;
      end if;
    end process;

    process(rqt_reg)
    begin
      iscalar_rqt_enable(C_MAX_N_ISCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_ISCALARS)                <= (others => '0');
      iscalar_rqt_enable_reg(C_MAX_N_ISCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_ISCALARS)            <= (others => '0');
      iscalar_rqt_enable(C_MAX_N_ISCALARS+C_N_INOUT_SCALARS-1 downto C_MAX_N_ISCALARS)     <= rqt_reg;
      iscalar_rqt_enable_reg(C_MAX_N_ISCALARS+C_N_INOUT_SCALARS-1 downto C_MAX_N_ISCALARS) <= rqt_reg;
    end process;

  end generate ISCALAR_IO_RQT_ENABLE_GEN;


  NO_ISCALAR_IO_RQT_ENABLE_GEN : if (C_N_INOUT_SCALARS = 0) generate
  begin
    iscalar_rqt_enable(C_MAX_N_ISCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_ISCALARS)     <= (others => '0');
    iscalar_rqt_enable_reg(C_MAX_N_ISCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_ISCALARS) <= (others => '0');
  end generate NO_ISCALAR_IO_RQT_ENABLE_GEN;


  ------------------------------------------------------
  -- OUTPUT SCALAR REQUEST ENABLE REGISTER (INDEX 19) --
  ------------------------------------------------------

  OSCALAR_RQT_ENABLE_GEN : if (C_N_OUTPUT_SCALARS > 0) generate
    signal reg : std_logic_vector(C_N_OUTPUT_SCALARS-1 downto 0);
  begin

    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        -- reg <= (others => '0');
        reg <= (others => '1');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if(reg_sel1(OSCALAR_RQT_ENABLE_REG_INDEX-BANK1_INDEX) = '1' and wr_data_rdy = '1') then
          for i in 0 to C_N_OUTPUT_SCALARS-1 loop
            reg(i) <= S_AXI_WDATA(i) and S_AXI_WSTRB(i/8);
          end loop;
        end if;
      end if;
    end process;

    process(reg)
    begin
      oscalar_rqt_enable(C_MAX_N_OSCALARS-1 downto 0)                <= (others => '0');
      oscalar_rqt_enable_reg(C_MAX_N_OSCALARS-1 downto 0)            <= (others => '0');
      oscalar_rqt_enable(reg'range)     <= reg;
      oscalar_rqt_enable_reg(reg'range) <= reg;
    end process;
    
  end generate OSCALAR_RQT_ENABLE_GEN;

  NO_OSCALAR_RQT_ENABLE_GEN : if (C_N_OUTPUT_SCALARS = 0) generate
  begin
    oscalar_rqt_enable(C_MAX_N_OSCALARS-1 downto 0)     <= (others => '0');
    oscalar_rqt_enable_reg(C_MAX_N_OSCALARS-1 downto 0) <= (others => '0');
  end generate NO_OSCALAR_RQT_ENABLE_GEN;


  OSCALAR_IO_RQT_ENABLE_GEN : if (C_N_INOUT_SCALARS > 0) generate
    signal os_rqt_reg : std_logic_vector(C_N_INOUT_SCALARS-1 downto 0);
  begin

    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        -- reg <= (others => '0');
        os_rqt_reg <= (others => '1');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if(reg_sel1(OSCALAR_RQT_ENABLE_REG_INDEX-BANK1_INDEX) = '1' and wr_data_rdy = '1') then
          for i in 0 to C_N_INOUT_SCALARS-1 loop
            os_rqt_reg(i) <= S_AXI_WDATA(i+C_MAX_N_OSCALARS) and S_AXI_WSTRB((i+C_MAX_N_OSCALARS)/8);
          end loop;
        end if;
      end if;
    end process;

    process(os_rqt_reg)
    begin
      oscalar_rqt_enable(C_MAX_N_OSCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_OSCALARS)                <= (others => '0');
      oscalar_rqt_enable_reg(C_MAX_N_OSCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_OSCALARS)            <= (others => '0');
      oscalar_rqt_enable(C_MAX_N_OSCALARS+C_N_INOUT_SCALARS-1 downto C_MAX_N_OSCALARS)     <= os_rqt_reg;
      oscalar_rqt_enable_reg(C_MAX_N_OSCALARS+C_N_INOUT_SCALARS-1 downto C_MAX_N_OSCALARS) <= os_rqt_reg;
    end process;
    
  end generate OSCALAR_IO_RQT_ENABLE_GEN;

  NO_OSCALAR_IO_RQT_ENABLE_GEN : if (C_N_INOUT_SCALARS = 0) generate
  begin
    oscalar_rqt_enable(C_MAX_N_OSCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_OSCALARS)     <= (others => '0');
    oscalar_rqt_enable_reg(C_MAX_N_OSCALARS+C_MAX_N_IOSCALARS-1 downto C_MAX_N_OSCALARS) <= (others => '0');
  end generate NO_OSCALAR_IO_RQT_ENABLE_GEN;



  -------------------------------------------------
  -- OUTPUT ARGS LENGTH MODE REGISTER (INDEX 15) --
  -------------------------------------------------

  OARG_USE_SW_LENGTH_GEN : if (C_N_OUTPUT_ARGS > 0) generate
    signal reg : std_logic_vector(C_N_OUTPUT_ARGS-1 downto 0);
  begin

    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        reg <= (others => '0');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        if(reg_sel(OARG_LENGTH_MODE_REG_INDEX) = '1' and wr_data_rdy = '1') then
          for i in 0 to C_N_OUTPUT_ARGS-1 loop
            reg(i) <= S_AXI_WDATA(i) and S_AXI_WSTRB(i/8);
          end loop;
        end if;
      end if;
    end process;

    process(reg)
    begin
      oarg_use_sw_length              <= (others => '0');
      oarg_length_mode_reg            <= (others => '0');
      oarg_use_sw_length(reg'range)   <= reg;
      oarg_length_mode_reg(reg'range) <= reg;
    end process;
    
  end generate OARG_USE_SW_LENGTH_GEN;


  NO_OARG_USE_SW_LENGTH_GEN : if (C_N_OUTPUT_ARGS = 0) generate
  begin
    oarg_use_sw_length   <= (others => '0');
    oarg_length_mode_reg <= (others => '0');
  end generate NO_OARG_USE_SW_LENGTH_GEN;


  ----------------------------
  -- BANK 0 OUTPUT DATAPATH --
  ----------------------------

  -- For V6/S6, when the number of channel of the multiplexer is lower than 16 it's more
  -- efficient to use a mux with binary selection input.

  -- Mux for general purpose register read datapath:
  process(rd_reg_addr,
          ctrl_reg, status_reg,
          ap_iarg_rst_reg, ap_oarg_rst_reg,
          iarg_rqt_enable_reg, oarg_rqt_enable_reg,
          oarg_length_mode_reg)
    variable addr : integer range 0 to N_REGS-1;
  begin
    mux_gp_regs <= (others => '0');
    addr        := to_integer(unsigned(rd_reg_addr));
    case addr is
      when CTRL_REG_INDEX             => mux_gp_regs <= ext_32(ctrl_reg);
      when STATUS_REG_INDEX           => mux_gp_regs <= ext_32(status_reg);
      when IARG_RST_REG_INDEX         => mux_gp_regs <= ext_32(ap_iarg_rst_reg);
      when OARG_RST_REG_INDEX         => mux_gp_regs <= ext_32(ap_oarg_rst_reg);
      when IARG_RQT_ENABLE_REG_INDEX  => mux_gp_regs <= ext_32(iarg_rqt_enable_reg);
      when OARG_RQT_ENABLE_REG_INDEX  => mux_gp_regs <= ext_32(oarg_rqt_enable_reg);
      when OARG_LENGTH_MODE_REG_INDEX => mux_gp_regs <= ext_32(oarg_length_mode_reg);
      when others                     =>
    end case;
  end process;

  ----------------------------------
  --- BANK 2: INPUT SCALAR FIFOs ---
  ----------------------------------

  process(S_AXI_ACLK, ap_rst_fb)
    constant N_ELEMENTS      : integer := C_MAX_N_ISCALARS + C_MAX_N_IOSCALARS;
    constant BANK_ADDR_WIDTH : integer := log2(N_ELEMENTS);
    variable offset          : unsigned(BANK_ADDR_WIDTH-1 downto 0);
    constant LSB             : integer := log2(C_S_AXI_DATA_WIDTH/8);
    constant MSB             : integer := LSB+BANK_ADDR_WIDTH-1;
  begin
    if(ap_rst_fb = '1') then
      host_iscalar_we <= (others => '0');
      --host_oscalar_re(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS -1 downto C_MAX_N_OSCALARS) <= (others => '0');
      host_ioscalar_re_i <= (others => '0');
    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      host_iscalar_we <= (others => '0');
      --host_oscalar_re(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS -1 downto C_MAX_N_OSCALARS) <= (others => '0');
      host_ioscalar_re_i <= (others => '0');
      if(iscalar_bank = '1' and wr_start = '1') then
        offset := unsigned(axi_addr(MSB downto LSB));
        for i in 0 to N_ELEMENTS-1 loop
          if(offset = i) then
            host_iscalar_we(i) <= '1';
          else
            host_iscalar_we(i) <= '0';
          end if;
        end loop;
      end if;
      if(iscalar_bank = '1' and rd_start = '1') then
        offset := unsigned(axi_addr(MSB downto LSB));
        for i in C_MAX_N_ISCALARS to C_MAX_N_ISCALARS + C_MAX_N_IOSCALARS-1 loop
          if(offset = i) then
            --host_oscalar_re(i) <= '1';
            host_ioscalar_re_i(i) <= '1';
          else
            --host_oscalar_re(i) <= '0';
            host_ioscalar_re_i(i) <= '0';
          end if;
        end loop;
      end if;
    end if;
  end process;

  host_iscalar_dout <= wr_data_i;

  host_oscalar_re <= host_ioscalar_re_i & host_oscalar_re_i;
  -----------------------------------
  --- BANK 3: OUTPUT SCALAR FIFOs ---
  -----------------------------------


  process(S_AXI_ACLK, ap_rst_fb)
    constant N_ELEMENTS : integer := C_MAX_N_OSCALARS;

    constant BANK_ADDR_WIDTH : integer := log2(N_ELEMENTS);
    variable offset          : unsigned(BANK_ADDR_WIDTH-1 downto 0);
    constant LSB             : integer := log2(C_S_AXI_DATA_WIDTH/8);
    constant MSB             : integer := LSB+BANK_ADDR_WIDTH-1;
  begin
    if(ap_rst_fb = '1') then
      --host_oscalar_re(C_MAX_N_OSCALARS-1 downto 0) <= (others => '0');
      host_oscalar_re_i(C_MAX_N_OSCALARS-1 downto 0) <=(others => '0');
    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      --host_oscalar_re(C_MAX_N_OSCALARS-1 downto 0) <= (others => '0');
      host_oscalar_re_i(C_MAX_N_OSCALARS-1 downto 0) <=(others => '0');
      if(oscalar_bank = '1' and rd_start = '1') then
        offset := unsigned(axi_addr(MSB downto LSB));
        for i in 0 to N_ELEMENTS-1 loop
          if(offset = i) then
            --host_oscalar_re(i) <= '1';
            host_oscalar_re_i(i) <='1';
          else
           -- host_oscalar_re(i) <= '0';
            host_oscalar_re_i(i) <='0';
          end if;
        end loop;
      end if;
    end if;
  end process;


--  process(S_AXI_ACLK, ap_rst_fb)
--    constant N_ELEMENTS : integer := C_MAX_N_OSCALARS;
--
--    constant BANK_ADDR_WIDTH : integer := log2(N_ELEMENTS);
--    variable offset          : unsigned(BANK_ADDR_WIDTH-1 downto 0);
--    constant LSB             : integer := log2(C_S_AXI_DATA_WIDTH/8);
--    constant MSB             : integer := LSB+BANK_ADDR_WIDTH-1;
--  begin
--    if(ap_rst_fb = '1') then
--      host_oscalar_re(7 downto 0) <= (others => '0');
--    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
--      host_oscalar_re(7 downto 0) <= (others => '0');
--      if(oscalar_bank = '1' and rd_start = '1') then
--        offset := unsigned(axi_addr(MSB downto LSB));
--        for i in 0 to 7 loop
--          if(offset = i) then
--            host_oscalar_re(i) <= '1';
--          else
--            host_oscalar_re(i) <= '0';
--          end if;
--        end loop;
--      end if;
--    end if;
--  end process;

  -- Output scalar data mux:
  process(rd_reg_addr, host_oscalar_din)
  begin
    mux_oscalar_data <= (others => '0');
    for i in 0 to C_MAX_N_OSCALARS+C_MAX_N_IOSCALARS-1 loop
      if(i = unsigned(rd_reg_addr)) then
        mux_oscalar_data <= ext_32(host_oscalar_din(C_MAX_SCALAR_DWIDTH*(i+1)-1 downto C_MAX_SCALAR_DWIDTH*i));
      end if;
    end loop;
  end process;

--  -----------------------------------
--  --- BANK 2: INOUT SCALAR FIFOs ---
--  -----------------------------------
--
--  process(S_AXI_ACLK, ap_rst_fb)
--    constant N_ELEMENTS : integer := C_MAX_N_OSCALARS + C_MAX_N_IOSCALARS;
--
--    constant BANK_ADDR_WIDTH : integer := log2(N_ELEMENTS);
--    variable offset          : unsigned(BANK_ADDR_WIDTH-1 downto 0);
--    constant LSB             : integer := log2(C_S_AXI_DATA_WIDTH/8);
--    constant MSB             : integer := LSB+BANK_ADDR_WIDTH-1;
--  begin
--    if(ap_rst_fb = '1') then
--      host_oscalar_re(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS-1 downto C_MAX_N_OSCALARS) <= (others => '0');
--      host_iscalar_we(C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS-1 downto C_MAX_N_ISCALARS) <= (others => '0');
--    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
--      host_oscalar_re(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS-1 downto C_MAX_N_OSCALARS) <= (others => '0');
--      host_iscalar_we(C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS-1 downto C_MAX_N_ISCALARS) <= (others => '0');
--      if(iscalar_bank = '1' and wr_start = '1') then
--        offset := unsigned(axi_addr(MSB downto LSB));
--        for i in 8 to N_ELEMENTS-1 loop
--          if(offset = i) then
--            host_iscalar_we(i) <= '1';
--          else
--            host_iscalar_we(i) <= '0';
--          end if;
--        end loop;
--      end if;
--      if(iscalar_bank = '1' and rd_start = '1') then
--        offset := unsigned(axi_addr(MSB downto LSB));
--        for i in 8 to N_ELEMENTS-1 loop
--          if(offset = i) then
--            host_oscalar_re(i) <= '1';
--          else
--            host_oscalar_re(i) <= '0';
--          end if;
--        end loop;
--      end if;
--    end if;
--  end process;
--

  ------------------------------------------
  --- BANK 4: INPUT ARG STATUS REGISTERS ---
  ------------------------------------------

  -- Status registers for input arguments:
  process(rd_reg_addr, status_iarg_used, status_iarg_empty_sync, status_iarg_full)
  begin
    mux_iarg_status <= (others => '0');
    for i in 0 to C_MAX_N_IARGS-1 loop
      if(i = unsigned(rd_reg_addr)) then
        mux_iarg_status(3 downto 0) <= status_iarg_used(4*(i+1)-1 downto 4*i);
        mux_iarg_status(4)          <= status_iarg_empty_sync(i);
        mux_iarg_status(5)          <= status_iarg_full(i);
      end if;
    end loop;
  end process;


  -------------------------------------------
  --- BANK 5: OUTPUT ARG STATUS REGISTERS ---
  -------------------------------------------

  -- Status registers for output arguments:
  process(rd_reg_addr, status_oarg_used, status_oarg_empty, status_oarg_full)
  begin
    mux_oarg_status <= (others => '0');
    for i in 0 to C_MAX_N_OARGS-1 loop
      if(i = unsigned(rd_reg_addr)) then
        mux_oarg_status(3 downto 0) <= status_oarg_used(4*(i+1)-1 downto 4*i);
        mux_oarg_status(4)          <= status_oarg_empty(i);
        mux_oarg_status(5)          <= status_oarg_full(i);
      end if;
    end loop;
  end process;

  ---------------------------------------------
  --- BANK 6: INPUT SCALAR STATUS REGISTERS ---
  ---------------------------------------------

  -- Status registers for input scalars:
  process(rd_reg_addr, status_iscalar_used, status_iscalar_empty, status_iscalar_full)
  begin
    mux_iscalar_status <= (others => '0');
    for i in 0 to C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS-1 loop
      if(i = unsigned(rd_reg_addr)) then
        mux_iscalar_status(3 downto 0) <= status_iscalar_used(4*(i+1)-1 downto 4*i);
        mux_iscalar_status(4)          <= status_iscalar_empty(i);
        mux_iscalar_status(5)          <= status_iscalar_full(i);
      end if;
    end loop;
  end process;

  ----------------------------------------------
  --- BANK 7: OUTPUT SCALAR STATUS REGISTERS ---
  ----------------------------------------------

  -- Status registers for output scalars:
  process(rd_reg_addr, status_oscalar_used, status_oscalar_empty, status_oscalar_full)
  begin
    mux_oscalar_status <= (others => '0');
    for i in 0 to C_MAX_N_OSCALARS+C_MAX_N_IOSCALARS-1 loop
      if(i = unsigned(rd_reg_addr)) then
        mux_oscalar_status(3 downto 0) <= status_oscalar_used(4*(i+1)-1 downto 4*i);
        mux_oscalar_status(4)          <= status_oscalar_empty(i);
        mux_oscalar_status(5)          <= status_oscalar_full(i);
      end if;
    end loop;
  end process;

  -------------------------------------------
  --- BANK 8: OUTPUT ARGS SW LENGTH FIFOs ---
  --------------------------------------------

  process(S_AXI_ACLK, ap_rst_fb)
    constant N_ELEMENTS      : integer := C_MAX_N_OARGS;
    constant BANK_ADDR_WIDTH : integer := log2(N_ELEMENTS);
    variable offset          : unsigned(BANK_ADDR_WIDTH-1 downto 0);
    constant LSB             : integer := log2(C_S_AXI_DATA_WIDTH/8);
    constant MSB             : integer := LSB+BANK_ADDR_WIDTH-1;
  begin
    if(ap_rst_fb = '1') then
      oarg_sw_length_we_i <= (others => '0');
    elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      oarg_sw_length_we_i <= (others => '0');
      if(oarg_length_bank = '1' and wr_start = '1') then
        offset := unsigned(axi_addr(MSB downto LSB));
        for i in 0 to N_ELEMENTS-1 loop
          if(offset = i) then
            oarg_sw_length_we_i(i) <= '1';
          else
            oarg_sw_length_we_i(i) <= '0';
          end if;
        end loop;
      end if;
    end if;
  end process;

  --oarg_sw_length <= wr_data_i;
    oarg_sw_length_we_event <= or_reduce(oarg_sw_length_we_i);
    oarg_sw_length_we <= oarg_sw_length_we_i;
    
    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        oarg_sw_length <= (others => '0');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
          if(oarg_sw_length_we_event = '1') then
            oarg_sw_length <= wr_data_i;
          end if;
      end if;
    end process;
    process(S_AXI_ACLK)
    begin
      if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
          if(oarg_sw_length_we_event = '1') then
            oarg_sw_length_m2s <= wr_data_i;
          end if;
      end if;
    end process;

  -------------------------------------------
  --- BANK 9: OUTPUT ARGS TDEST REGISTERS ---
  -------------------------------------------

  OARG_TDEST_GEN : if (C_N_OUTPUT_ARGS > 0) generate
    signal oarg_tdest_reg_we : std_logic_vector(N_REGS-1 downto 0);
    signal oarg_tdest_reg    : std_logic_vector(C_N_OUTPUT_ARGS*C_M_AXIS_TDEST_WIDTH-1 downto 0);
  begin

    process(S_AXI_ACLK, ap_rst_fb)
      constant N_ELEMENTS      : integer := C_MAX_N_OARGS;
      constant BANK_ADDR_WIDTH : integer := log2(N_ELEMENTS);
      variable offset          : unsigned(BANK_ADDR_WIDTH-1 downto 0);
      constant LSB             : integer := log2(C_S_AXI_DATA_WIDTH/8);
      constant MSB             : integer := LSB+BANK_ADDR_WIDTH-1;
    begin
      if(ap_rst_fb = '1') then
        oarg_tdest_reg_we <= (others => '0');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        oarg_tdest_reg_we <= (others => '0');
        if(oarg_tdest_bank = '1' and wr_start = '1') then
          offset := unsigned(axi_addr(MSB downto LSB));
          for i in 0 to N_ELEMENTS-1 loop
            if(offset = i) then
              oarg_tdest_reg_we(i) <= '1';
            else
              oarg_tdest_reg_we(i) <= '0';
            end if;
          end loop;
        end if;
      end if;
    end process;

    process(S_AXI_ACLK, ap_rst_fb)
    begin
      if(ap_rst_fb = '1') then
        oarg_tdest_reg <= (others => '0');
      elsif(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
        for i in 0 to C_N_OUTPUT_ARGS-1 loop
          if(oarg_tdest_reg_we(i) = '1') then
            oarg_tdest_reg(C_M_AXIS_TDEST_WIDTH*(i+1)-1 downto C_M_AXIS_TDEST_WIDTH*i) <=
              S_AXI_WDATA(C_M_AXIS_TDEST_WIDTH-1 downto 0);
          end if;
        end loop;
      end if;
    end process;

    process(rd_reg_addr, oarg_tdest_reg)
      variable addr : integer range 0 to N_REGS-1;
    begin
      mux_oarg_tdest_regs <= (others => '0');
      addr                := to_integer(unsigned(rd_reg_addr));
      for i in 0 to C_N_OUTPUT_ARGS-1 loop
        if(i = addr) then
          mux_oarg_tdest_regs <= ext_32(oarg_tdest_reg(C_M_AXIS_TDEST_WIDTH*(i+1)-1 downto C_M_AXIS_TDEST_WIDTH*i));
        end if;
      end loop;
    end process;

    process(oarg_tdest_reg)
    begin
      host_oarg_tdest                                                  <= (others => '0');
      host_oarg_tdest(C_N_OUTPUT_ARGS*C_M_AXIS_TDEST_WIDTH-1 downto 0) <= oarg_tdest_reg;
    end process;

  end generate OARG_TDEST_GEN;


  NO_OARG_TDEST_GEN : if (C_N_OUTPUT_ARGS = 0) generate
  begin
    mux_oarg_tdest_regs <= (others => '0');
    host_oarg_tdest     <= (others => '0');
  end generate NO_OARG_TDEST_GEN;


  ---------------------
  -- OUTPUT DATAPATH --
  ---------------------

  process(S_AXI_ACLK)
    variable int_addr : integer range 0 to (2**BANK_ADDR_WIDTH)-1;
  begin
    if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
      if(axi_rst = '1' or (rd_data_vld and S_AXI_RREADY) = '1') then
        rd_data <= (others => '0');
      elsif(rd_data_ce = '1') then
        int_addr := to_integer(unsigned(rd_bank_addr));
        case int_addr is
          when GP_REGS_BANK_ADDR        => rd_data <= mux_gp_regs;
          when OSCALAR_BANK_ADDR        => rd_data <= mux_oscalar_data;
          when ISCALAR_BANK_ADDR        => rd_data <= mux_oscalar_data;
          when IARG_STATUS_BANK_ADDR    => rd_data <= mux_iarg_status;
          when OARG_STATUS_BANK_ADDR    => rd_data <= mux_oarg_status;
          when ISCALAR_STATUS_BANK_ADDR => rd_data <= mux_iscalar_status;
          when OSCALAR_STATUS_BANK_ADDR => rd_data <= mux_oscalar_status;
          when OARG_TDEST_BANK_ADDR     => rd_data <= mux_oarg_tdest_regs;
          when others                   => rd_data <= (others => '0');
        end case;
      end if;
    end if;
  end process;

end rtl;



-------------------------------------------------------------------------------
-- axis_accelerator_adapter_core.vhd - Entity and architecture
-------------------------------------------------------------------------------
--
-- *******************************************************************
-- ** (c) Copyright [2010] - [2013] Xilinx, Inc. All rights reserved.*
-- **                                                                *
-- ** This file contains confidential and proprietary information    *
-- ** of Xilinx, Inc. and is protected under U.S. and                *
-- ** international copyright and other intellectual property        *
-- ** laws.                                                          *
-- **                                                                *
-- ** DISCLAIMER                                                     *
-- ** This disclaimer is not a license and does not grant any        *
-- ** rights to the materials distributed herewith. Except as        *
-- ** otherwise provided in a valid license issued to you by         *
-- ** Xilinx, and to the maximum extent permitted by applicable      *
-- ** law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND        *
-- ** WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES    *
-- ** AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING      *
-- ** BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-         *
-- ** INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and       *
-- ** (2) Xilinx shall not be liable (whether in contract or tort,   *
-- ** including negligence, or under any other theory of             *
-- ** liability) for any loss or damage of any kind or nature        *
-- ** related to, arising under or in connection with these          *
-- ** materials, including for any direct, or any indirect,          *
-- ** special, incidental, or consequential loss or damage           *
-- ** (including loss of data, profits, goodwill, or any type of     *
-- ** loss or damage suffered as a result of any action brought      *
-- ** by a third party) even if such damage or loss was              *
-- ** reasonably foreseeable or Xilinx had been advised of the       *
-- ** possibility of the same.                                       *
-- **                                                                *
-- ** CRITICAL APPLICATIONS                                          *
-- ** Xilinx products are not designed or intended to be fail-       *
-- ** safe, or for use in any application requiring fail-safe        *
-- ** performance, such as life-support or safety devices or         *
-- ** systems, Class III medical devices, nuclear facilities,        *
-- ** applications related to the deployment of airbags, or any      *
-- ** other applications that could lead to death, personal          *
-- ** injury, or severe property or environmental damage             *
-- ** (individually and collectively, "Critical                      *
-- ** Applications"). Customer assumes the sole risk and             *
-- ** liability of any use of Xilinx products in Critical            *
-- ** Applications, subject only to applicable laws and              *
-- ** regulations governing limitations on product liability.        *
-- **                                                                *
-- ** THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS       *
-- ** PART OF THIS FILE AT ALL TIMES.                                *
-- *******************************************************************
--
-------------------------------------------------------------------------------
-- Title      : Accelerator Adapter
-- Project    :
-------------------------------------------------------------------------------
-- File       : axis_accelerator_adapter_core.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-10-25
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Structure:
--
--              axis_accelerator_adapter.vhd
--              xd_adapter_pkg.vhd
--              axis_accelerator_adapter_core.vhd
--                   |-- axi_lite_adapter
--                   |-- cdc_sync.vhd
--                   |-- xd_input_args_module.vhd
--                     |-- xd_s2m_adapter.vhd
--                        |-- xd_s2m_converter.vhd
--                        |-- xd_s2m_memory_dc.vhd
--                     |-- xd_iarg_s2s_adapter.vhd
--                        |-- s2s_async_fifo_wt.vhd
--                   |-- xd_output_args_module.vhd
--                     |-- cdc_sync.vhd
--                     |-- xd_m2s_adapter.vhd
--                        |-- xd_m2s_converter.vhd
--                        |-- xd_m2s_memory_dc.vhd
--                           |-- arg_mem_bank.vhd
--                              |-- asymmetric_dp_bank_v6.vhd
--                              |-- symmetric_dp_bank_v6.vhd
--                              |-- dp_bank_sdp_v6.vhd
--                           |-- oarg_columnized_mem_bank.vhd
--                           |-- srl_fifo_32_wt.vhd
--                     |-- xd_oarg_s2s_adapter.vhd
--                        |-- s2s_async_fifo_wt.vhd
--                   |-- xd_sync_module.vhd
--                       |-- cdc_sync.vhd
--                       |-- sync_ap_status.vhd
--                       |-- async_fifo_dist_wt.vhd
--                   |-- xd_input_scalars_module.vhd
--                       |-- xd_input_scalars_fifo.vhd
--                   |-- xd_output_scalars_module.vhd
--                       |-- xd_output_scalars_fifo.vhd
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-- 2013-07-19  2.0      pvk     New ports added for scalar valid and ack
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.axi_lite_adapter;
use axis_accelerator_adapter_v2_1_16.xd_input_args_module;
use axis_accelerator_adapter_v2_1_16.xd_output_args_module;
use axis_accelerator_adapter_v2_1_16.xd_sync_module;
use axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync;
use axis_accelerator_adapter_v2_1_16.xd_input_scalars_module;
use axis_accelerator_adapter_v2_1_16.xd_output_scalars_module;


entity axis_accelerator_adapter_core is
  generic (
    -- System generics:
    C_FAMILY                : string                    := "virtex7";  -- Xilinx FPGA family
    C_BRAM_TYPE             : string                    := "7_SERIES";  -- 7_SERIES = RAMB36E1. ULTRASCALE = RAMB36E2

    ---
    C_S_AXI_ADDR_WIDTH      : integer                   := 13;
    C_S_AXI_DATA_WIDTH      : integer range 32 to 32    := 32;
    C_PRMRY_IS_ACLK_ASYNC   : integer := 0;
    C_SELECT_XPM            : integer := 1;
    C_MTBF_STAGES           : integer := 2;
    ---
    C_AP_ADAPTER_ID         : integer range 0 to 15;
    C_MAX_SCALAR_DWIDTH     : integer;
    C_MAX_ARG_DWIDTH        : integer;
    C_MAX_ARG_AWIDTH        : integer;
    C_MAX_ARG_N_DIM         : integer;
    C_MAX_MB_DEPTH          : integer;
    C_MAX_N_IARGS           : integer;
    C_MAX_N_OARGS           : integer;
    C_MAX_N_ISCALARS        : integer;
    C_MAX_N_OSCALARS        : integer;
    C_MAX_N_IOSCALARS       : integer;
    ---
    C_N_INPUT_ARGS          : integer;
    C_N_OUTPUT_ARGS         : integer;
    ---
    C_S_AXIS_TDATA_WIDTH    : integer;
    C_S_AXIS_TUSER_WIDTH    : integer;
    C_S_AXIS_TID_WIDTH      : integer;
    C_S_AXIS_TDEST_WIDTH    : integer;
    ---
    C_AP_IARG_TYPE          : std_logic_vector;
    C_AP_IARG_DWIDTH        : std_logic_vector;
    C_AP_IARG_MB_DEPTH      : std_logic_vector;
    C_AP_IARG_WIDTH         : std_logic_vector;
    C_AP_IARG_N_DIM         : std_logic_vector;
    C_AP_IARG_DIM_1         : std_logic_vector;
    C_AP_IARG_DIM_2         : std_logic_vector;
    C_AP_IARG_FORMAT_TYPE   : std_logic_vector;
    C_AP_IARG_FORMAT_FACTOR : std_logic_vector;
    C_AP_IARG_FORMAT_DIM    : std_logic_vector;
    ---
    C_M_AXIS_TDATA_WIDTH    : integer;
    C_M_AXIS_TUSER_WIDTH    : integer;
    C_M_AXIS_TID_WIDTH      : integer;
    C_M_AXIS_TDEST_WIDTH    : integer;
    ---
    C_AP_OARG_TYPE          : std_logic_vector;
    C_AP_OARG_DWIDTH        : std_logic_vector;
    C_AP_OARG_MB_DEPTH      : std_logic_vector;
    C_AP_OARG_WIDTH         : std_logic_vector;
    C_AP_OARG_N_DIM         : std_logic_vector;
    C_AP_OARG_DIM           : std_logic_vector;
    C_AP_OARG_DIM_1         : std_logic_vector;
    C_AP_OARG_DIM_2         : std_logic_vector;
    C_AP_OARG_FORMAT_TYPE   : std_logic_vector;
    C_AP_OARG_FORMAT_FACTOR : std_logic_vector;
    C_AP_OARG_FORMAT_DIM    : std_logic_vector;
    ---
    C_N_INOUT_SCALARS       : integer;
    C_N_INPUT_SCALARS       : integer;
    C_INPUT_SCALAR_MODE     : std_logic_vector(63 downto 0);
    C_OUTPUT_SCALAR_MODE    : std_logic_vector(63 downto 0);
    C_INPUT_SCALAR_DWIDTH   : std_logic_vector;
    C_AP_ISCALAR_DOUT_WIDTH : integer;
    C_N_OUTPUT_SCALARS      : integer;
    C_OUTPUT_SCALAR_DWIDTH  : std_logic_vector;
    C_AP_OSCALAR_DIN_WIDTH  : integer;
    C_AP_ISCALAR_IO_DOUT_WIDTH : integer;
    C_AP_OSCALAR_IO_DIN_WIDTH : integer;
    ---
    C_EXTRA_SYNCS           : integer := 1;
    C_NONE                  : integer := 2);
  port (
    -- SLAVE AXI LITE:
    S_AXI_ACLK           : in  std_logic;
    S_AXI_ARESETN        : in  std_logic;
    S_AXI_AWADDR         : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_AWVALID        : in  std_logic;
    S_AXI_AWREADY        : out std_logic;
    S_AXI_WDATA          : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB          : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    S_AXI_WVALID         : in  std_logic;
    S_AXI_WREADY         : out std_logic;
    S_AXI_BRESP          : out std_logic_vector(1 downto 0);
    S_AXI_BVALID         : out std_logic;
    S_AXI_BREADY         : in  std_logic;
    S_AXI_ARADDR         : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_ARVALID        : in  std_logic;
    S_AXI_ARREADY        : out std_logic;
    S_AXI_RDATA          : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_RRESP          : out std_logic_vector(1 downto 0);
    S_AXI_RVALID         : out std_logic;
    S_AXI_RREADY         : in  std_logic;
    --- Slave AXI streams (input arguments)
    S_AXIS_ACLK          : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    S_AXIS_ARESETN       : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    S_AXIS_TVALID        : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    S_AXIS_TREADY        : out std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    S_AXIS_TDATA         : in  std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TDATA_WIDTH-1 downto 0);
    S_AXIS_TSTRB         : in  std_logic_vector(C_MAX_N_IARGS*(C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
    S_AXIS_TKEEP         : in  std_logic_vector(C_MAX_N_IARGS*(C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
    S_AXIS_TLAST         : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    S_AXIS_TID           : in  std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TID_WIDTH-1 downto 0);
    S_AXIS_TDEST         : in  std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TDEST_WIDTH-1 downto 0);
    S_AXIS_TUSER         : in  std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TUSER_WIDTH-1 downto 0);
    --- AP input arguments, memory map interface
    ap_iarg_addr         : in  std_logic_vector(C_MAX_N_IARGS*C_MAX_ARG_AWIDTH-1 downto 0);
    ap_iarg_ce           : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    ap_iarg_we           : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    ap_iarg_din          : in  std_logic_vector(C_MAX_N_IARGS*C_MAX_ARG_DWIDTH-1 downto 0);
    ap_iarg_dout         : out std_logic_vector(C_MAX_N_IARGS*C_MAX_ARG_DWIDTH-1 downto 0);
    --- AP input arguments, fifo interface
    ap_fifo_iarg_dout    : out std_logic_vector(C_MAX_N_IARGS*C_MAX_ARG_DWIDTH-1 downto 0);
    ap_fifo_iarg_read    : in  std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    ap_fifo_iarg_empty_n : out std_logic_vector(C_MAX_N_IARGS-1 downto 0);
    --- Master AXI streams (output arguments)
    M_AXIS_ACLK          : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    M_AXIS_ARESETN       : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    M_AXIS_TVALID        : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    M_AXIS_TREADY        : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    M_AXIS_TDATA         : out std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TDATA_WIDTH-1 downto 0);
    M_AXIS_TSTRB         : out std_logic_vector(C_MAX_N_OARGS*(C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
    M_AXIS_TKEEP         : out std_logic_vector(C_MAX_N_OARGS*(C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
    M_AXIS_TLAST         : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    M_AXIS_TID           : out std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TID_WIDTH-1 downto 0);
    M_AXIS_TDEST         : out std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TDEST_WIDTH-1 downto 0);
    M_AXIS_TUSER         : out std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TUSER_WIDTH-1 downto 0);
    --- AP output arguments, memory map interface
    ap_oarg_addr         : in  std_logic_vector(C_MAX_N_OARGS*C_MAX_ARG_AWIDTH-1 downto 0);
    ap_oarg_ce           : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    ap_oarg_we           : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    ap_oarg_din          : in  std_logic_vector(C_MAX_N_OARGS*C_MAX_ARG_DWIDTH-1 downto 0);
    ap_oarg_dout         : out std_logic_vector(C_MAX_N_OARGS*C_MAX_ARG_DWIDTH-1 downto 0);
    --- AP output arguments, fifo interface
    ap_fifo_oarg_din     : in  std_logic_vector(C_MAX_N_OARGS*C_MAX_ARG_DWIDTH-1 downto 0);
    ap_fifo_oarg_write   : in  std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    ap_fifo_oarg_full_n  : out std_logic_vector(C_MAX_N_OARGS-1 downto 0);
    -- AP system signals
    ap_clk               : in  std_logic;
    ap_rst               : out std_logic;
    -- AP control handshaking
    ap_start             : out std_logic;
    ap_ready             : in  std_logic;
    ap_done              : in  std_logic;
    ap_continue          : out std_logic;
    ap_idle              : in  std_logic;
    -- AP scalar interface
    ap_iscalar_dout      : out std_logic_vector(511 downto 0);
    ap_oscalar_din       : in  std_logic_vector(511 downto 0);
    ap_oscalar_vld       : in  std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
    ap_oscalar_ack       : out std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
    ap_iscalar_vld       : out std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
    ap_iscalar_ack       : in  std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
    interrupt            : out std_logic);
end entity;

architecture rtl of axis_accelerator_adapter_core is


  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";


  signal s_aclk        : std_logic;
  signal m_aclk        : std_logic;
  signal S_AXI_ARESET        : std_logic;
  signal axi_ap_rst          : std_logic;
  signal ap_rst_i            : std_logic;
  signal ap_rst_s_axi_aclk        : std_logic;
  signal ap_rst_saclk        : std_logic;
  signal ap_rst_maclk        : std_logic;
  signal ap_rst_i_n            : std_logic;
  signal ap_start_i          : std_logic;
  signal ap_start_one_shot   : std_logic;
  --- COMMAND INPUT PORT:
  signal host_cmd_data       : std_logic_vector(31 downto 0);
  signal host_cmd_we         : std_logic;
  signal host_cmd_rdy        : std_logic;
  signal host_complete_re    : std_logic;
  signal host_cmd_error      : std_logic;
  --- AP CORE STATUS MANAGEMENT:
  signal status_ap_start     : std_logic;
  signal status_ap_done      : std_logic;
  signal status_ap_idle      : std_logic;
  signal status_ap_ready     : std_logic;
  signal status_ap_start_clr : std_logic;
  signal status_ap_done_clr  : std_logic;
  signal status_ap_idle_clr  : std_logic;
  signal status_ap_ready_clr : std_logic;
  -- INPUT ARGUMENTS MANAGEMENT:
  signal host_iarg_rst       : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal iarg_rqt_enable     : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal iarg_rqt_enable_i     : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal status_iarg_empty   : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal status_iarg_empty_i   : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal status_iarg_empty_int   : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal status_iarg_full    : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal status_iarg_full_i    : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal status_iarg_full_int    : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal status_iarg_used    : std_logic_vector(C_MAX_N_IARGS*4-1 downto 0);
  signal status_iarg_used_i    : std_logic_vector(C_MAX_N_IARGS*4-1 downto 0);
  signal status_iarg_n_words : std_logic_vector(C_MAX_N_IARGS*(C_MAX_ARG_AWIDTH+1)-1 downto 0);
  -- TODO:
  signal status_iarg_rqt     : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal status_iarg_ack     : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  -- Input args, multibuffer management:
  signal mb_iarg_rdy         : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal mb_iarg_rdy_i         : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal mb_iarg_done        : std_logic_vector(C_MAX_N_IARGS-1 downto 0);

  -- OUTPUT ARGUMENTS MANAGEMENT:
  signal host_oarg_rst      : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal oarg_rqt_enable    : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal oarg_rqt_enable_i    : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal oarg_sw_length     : std_logic_vector(31 downto 0);
  signal oarg_sw_length_m2s : std_logic_vector(31 downto 0);
  signal oarg_sw_length_we  : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal oarg_use_sw_length : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal host_oarg_tdest    : std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TDEST_WIDTH-1 downto 0);

  signal status_oarg_empty : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal status_oarg_empty_i : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal status_oarg_empty_int : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal status_oarg_full  : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal status_oarg_full_i  : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal status_oarg_full_int  : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal status_oarg_used  : std_logic_vector(C_MAX_N_OARGS*4-1 downto 0);
  signal status_oarg_used_i  : std_logic_vector(C_MAX_N_OARGS*4-1 downto 0);
  -- TODO:
  signal status_oarg_rqt   : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal status_oarg_ack   : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  -- Output args, multibuffer management:
  signal mb_oarg_rdy       : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal mb_oarg_rdy_i       : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal mb_oarg_done      : std_logic_vector(C_MAX_N_OARGS-1 downto 0);

  -- Debugging signals:
  signal dbg_iarg_stream_nwords : std_logic_vector(C_MAX_N_IARGS*16-1 downto 0);
  signal dbg_iarg_buffer_nwords : std_logic_vector(C_MAX_N_IARGS*16-1 downto 0);
  signal dbg_ap_start           : std_logic;
  signal dbg_oarg_stream_nwords : std_logic_vector(C_MAX_N_OARGS*16-1 downto 0);
  signal dbg_oarg_buffer_nwords : std_logic_vector(C_MAX_N_OARGS*16-1 downto 0);
  signal dbg_ap_done            : std_logic;

  -----------------------
  -- INPUT SCALARS MANAGEMENT:
  signal host_iscalar_rst     : std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
  signal host_iscalar_dout    : std_logic_vector(31 downto 0);
  signal host_iscalar_we      : std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
  signal host_iscalar_rdy     : std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
  signal status_iscalar_empty : std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
  signal status_iscalar_full  : std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
  signal status_iscalar_used  : std_logic_vector((C_MAX_N_ISCALARS)*4-1 downto 0);
  ---
  signal ap_iscalar_rdy       : std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
  signal ap_iscalar_done      : std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
  -- TODO:
  signal iscalar_rqt_enable   : std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);

  -- OUTPUT SCALARS MANAGEMENT:
  signal host_oscalar_rst     : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
--  signal host_oscalar_din     : std_logic_vector((C_MAX_N_OSCALARS+C_MAX_N_IOSCALARS)*C_MAX_SCALAR_DWIDTH-1 downto 0);
  signal host_oscalar_din     : std_logic_vector(C_MAX_N_OSCALARS*C_MAX_SCALAR_DWIDTH-1 downto 0);
  signal host_oscalar_re      : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
  signal host_oscalar_rdy     : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
  signal status_oscalar_empty : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
  signal status_oscalar_full  : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
  signal status_oscalar_used  : std_logic_vector((C_MAX_N_OSCALARS)*4-1 downto 0);
  ---
  signal ap_oscalar_vld_sync  : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0); -- Generated with ap_done
  signal ap_iscalar_done_sync : std_logic_vector(C_MAX_N_ISCALARS-1 downto 0);
  signal ap_oscalar_vld_i     : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0); 
  
  signal ap_oscalar_rdy       : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);
  -- TODO:
  signal oscalar_rqt_enable   : std_logic_vector(C_MAX_N_OSCALARS-1 downto 0);

begin

  -- Reset for AXI clk domain
  S_AXI_ARESET <= not(S_AXI_ARESETN);
  s_aclk <= S_AXIS_ACLK(0);
  m_aclk <= M_AXIS_ACLK(0);
  -- Reset for Accelerator clock domain (assign to output port)
  -- Changed to active low reset for accelerator
  ap_rst       <= not(ap_rst_i);
  ap_rst_i_n       <= not(ap_rst_i);

  -----------------------------------------------------------------------------------------
  -- AXI_LITE_IF_I : AXI4-Lite register interface module
  -----------------------------------------------------------------------------------------
  AXI_LITE_IF_I : entity axis_accelerator_adapter_v2_1_16.axi_lite_adapter
    generic map (
      C_FAMILY              => C_FAMILY,
      C_S_AXI_ADDR_WIDTH    => C_S_AXI_ADDR_WIDTH,
      C_S_AXI_DATA_WIDTH    => C_S_AXI_DATA_WIDTH,
      C_MAX_N_IARGS         => C_MAX_N_IARGS,
      C_MAX_N_OARGS         => C_MAX_N_OARGS,
      C_PRMRY_IS_ACLK_ASYNC => C_PRMRY_IS_ACLK_ASYNC,
      C_MTBF_STAGES         => C_MTBF_STAGES,

      C_MAX_MB_DEPTH        => C_MAX_MB_DEPTH,
      C_N_INPUT_ARGS        => C_N_INPUT_ARGS,
      C_N_OUTPUT_ARGS       => C_N_OUTPUT_ARGS,
      C_MAX_ARG_AWIDTH      => C_MAX_ARG_AWIDTH,
      ---  
      C_MAX_N_ISCALARS      => C_MAX_N_ISCALARS-C_MAX_N_IOSCALARS,
      C_N_INPUT_SCALARS     => C_N_INPUT_SCALARS,
      C_MAX_N_OSCALARS      => C_MAX_N_OSCALARS-C_MAX_N_IOSCALARS,
      C_N_INOUT_SCALARS     => C_N_INOUT_SCALARS,
      C_MAX_N_IOSCALARS     => C_MAX_N_IOSCALARS,
      C_N_OUTPUT_SCALARS    => C_N_OUTPUT_SCALARS,
      C_MAX_SCALAR_DWIDTH   => C_MAX_SCALAR_DWIDTH,
      C_M_AXIS_TDEST_WIDTH  => C_M_AXIS_TDEST_WIDTH)
    port map (
      S_AXI_ACLK             => S_AXI_ACLK,
      S_AXI_ARESETN          => S_AXI_ARESETN,
      S_AXI_AWADDR           => S_AXI_AWADDR,
      S_AXI_AWVALID          => S_AXI_AWVALID,
      S_AXI_AWREADY          => S_AXI_AWREADY,
      S_AXI_WDATA            => S_AXI_WDATA,
      S_AXI_WSTRB            => S_AXI_WSTRB,
      S_AXI_WVALID           => S_AXI_WVALID,
      S_AXI_WREADY           => S_AXI_WREADY,
      S_AXI_BRESP            => S_AXI_BRESP,
      S_AXI_BVALID           => S_AXI_BVALID,
      S_AXI_BREADY           => S_AXI_BREADY,
      S_AXI_ARADDR           => S_AXI_ARADDR,
      S_AXI_ARVALID          => S_AXI_ARVALID,
      S_AXI_ARREADY          => S_AXI_ARREADY,
      S_AXI_RDATA            => S_AXI_RDATA,
      S_AXI_RRESP            => S_AXI_RRESP,
      S_AXI_RVALID           => S_AXI_RVALID,
      S_AXI_RREADY           => S_AXI_RREADY,
      --- App. ports
      ap_rst                 => axi_ap_rst,
      --- Command input port:
      host_cmd_data          => host_cmd_data,
      host_cmd_we            => host_cmd_we,
      host_cmd_rdy           => host_cmd_rdy,
      host_complete_re       => host_complete_re,
      host_cmd_error         => host_cmd_error,
      --- AP core status signals:
      status_ap_start        => status_ap_start,
      status_ap_done         => status_ap_done,
      status_ap_idle         => status_ap_idle,
      status_ap_ready        => status_ap_ready,
      status_ap_start_clr    => status_ap_start_clr,
      status_ap_done_clr     => status_ap_done_clr,
      status_ap_idle_clr     => status_ap_idle_clr,
      status_ap_ready_clr    => status_ap_ready_clr,
      -- Input arguments management:
      host_iarg_rst          => host_iarg_rst,
      iarg_rqt_enable        => iarg_rqt_enable_i,
      status_iarg_empty      => status_iarg_empty,
      status_iarg_full       => status_iarg_full,
      status_iarg_used       => status_iarg_used,
      status_iarg_n_words    => status_iarg_n_words,
      -- Output arguments management:
      host_oarg_rst          => host_oarg_rst,
      oarg_rqt_enable        => oarg_rqt_enable_i,
      oarg_sw_length         => oarg_sw_length,
      oarg_sw_length_m2s     => oarg_sw_length_m2s,
      oarg_sw_length_we      => oarg_sw_length_we,
      oarg_use_sw_length     => oarg_use_sw_length,
      host_oarg_tdest        => host_oarg_tdest,
      status_oarg_empty      => status_oarg_empty,
      status_oarg_full       => status_oarg_full,
      status_oarg_used       => status_oarg_used,
      --- Input scalars management:
      host_iscalar_rst       => host_iscalar_rst,
      host_iscalar_dout      => host_iscalar_dout,
      host_iscalar_we        => host_iscalar_we,
      host_iscalar_rdy       => host_iscalar_rdy,
      status_iscalar_empty   => status_iscalar_empty,
      status_iscalar_full    => status_iscalar_full,
      status_iscalar_used    => status_iscalar_used,
      -- Output scalars management:
      host_oscalar_rst       => host_oscalar_rst,
      host_oscalar_din       => host_oscalar_din,
      host_oscalar_re        => host_oscalar_re,
      host_oscalar_rdy       => host_oscalar_rdy,
      status_oscalar_empty   => status_oscalar_empty,
      status_oscalar_full    => status_oscalar_full,
      status_oscalar_used    => status_oscalar_used,
      ---
      dbg_iarg_stream_nwords => dbg_iarg_stream_nwords,
      dbg_iarg_buffer_nwords => dbg_iarg_buffer_nwords,
      dbg_oarg_stream_nwords => dbg_oarg_stream_nwords,
      dbg_oarg_buffer_nwords => dbg_oarg_buffer_nwords,
      ---
      iscalar_rqt_enable     => iscalar_rqt_enable,
      oscalar_rqt_enable     => oscalar_rqt_enable,
      ---
      interrupt              => interrupt);

     
  -----------------------------------------------------------------------------------------
  -- XD_RESET_SYNC : Reset Synchronizer
  -----------------------------------------------------------------------------------------
    XD_RESET_SYNC : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 0,
        C_VECTOR_WIDTH             => 32,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => S_AXI_ACLK,
        prmry_resetn               => '0',
        prmry_in                   => axi_ap_rst,
        prmry_vect_in              => (others => '0'),

        scndry_aclk                => ap_clk,
        scndry_resetn              => '0',
        scndry_out                 => ap_rst_i,
        scndry_vect_out            => open
        );

      XD_RESET_SYNC_s_axi_aclk : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 0,
        C_VECTOR_WIDTH             => 32,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => S_AXI_ACLK,
        prmry_resetn               => '0',
        prmry_in                   => axi_ap_rst,
        prmry_vect_in              => (others => '0'),

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => '0',
        scndry_out                 => ap_rst_s_axi_aclk,
        scndry_vect_out            => open
        );


      XD_RESET_SYNC_saclk : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 0,
        C_VECTOR_WIDTH             => 32,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => S_AXI_ACLK,
        prmry_resetn               => '0',
        prmry_in                   => axi_ap_rst,
        prmry_vect_in              => (others => '0'),

        scndry_aclk                => s_aclk,
        scndry_resetn              => '0',
        scndry_out                 => ap_rst_saclk,
        scndry_vect_out            => open
        );

      XD_RESET_SYNC_maclk : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 1,
        C_FLOP_INPUT               => 0,
        C_VECTOR_WIDTH             => 32,
        C_MTBF_STAGES              => C_MTBF_STAGES
        )
        port map (
        prmry_aclk                 => S_AXI_ACLK,
        prmry_resetn               => '0',
        prmry_in                   => axi_ap_rst,
        prmry_vect_in              => (others => '0'),

        scndry_aclk                => m_aclk,
        scndry_resetn              => '0',
        scndry_out                 => ap_rst_maclk,
        scndry_vect_out            => open
        );




  -----------------------------------------------------------------------------------------
  -- XD_INPUT_ARGS_I : Input argument generation module
  -----------------------------------------------------------------------------------------
  XD_INPUT_ARGS_I : entity axis_accelerator_adapter_v2_1_16.xd_input_args_module
    generic map (
      -- System generics:
      C_FAMILY                => C_FAMILY,
      C_BRAM_TYPE             => C_BRAM_TYPE,
      C_SELECT_XPM            => C_SELECT_XPM,
      C_MAX_ARG_DWIDTH        => C_MAX_ARG_DWIDTH,
      C_MAX_ARG_AWIDTH        => C_MAX_ARG_AWIDTH,
      C_MAX_ARG_N_DIM         => C_MAX_ARG_N_DIM,
      C_MAX_MB_DEPTH          => C_MAX_MB_DEPTH,
      C_MAX_N_IARGS           => C_MAX_N_IARGS,
      C_N_INPUT_ARGS          => C_N_INPUT_ARGS,
      ---
      C_S_AXIS_TDATA_WIDTH    => C_S_AXIS_TDATA_WIDTH,
      C_S_AXIS_TUSER_WIDTH    => C_S_AXIS_TUSER_WIDTH,
      C_S_AXIS_TID_WIDTH      => C_S_AXIS_TID_WIDTH,
      C_S_AXIS_TDEST_WIDTH    => C_S_AXIS_TDEST_WIDTH,
      ---
      C_AP_IARG_TYPE          => C_AP_IARG_TYPE,
      C_AP_IARG_DWIDTH        => C_AP_IARG_DWIDTH,
      C_AP_IARG_MB_DEPTH      => C_AP_IARG_MB_DEPTH,
      C_AP_IARG_WIDTH         => C_AP_IARG_WIDTH,
      C_AP_IARG_N_DIM         => C_AP_IARG_N_DIM,
      C_AP_IARG_DIM_1         => C_AP_IARG_DIM_1,
      C_AP_IARG_DIM_2         => C_AP_IARG_DIM_2,
      C_AP_IARG_FORMAT_TYPE   => C_AP_IARG_FORMAT_TYPE,
      C_AP_IARG_FORMAT_FACTOR => C_AP_IARG_FORMAT_FACTOR,
      C_AP_IARG_FORMAT_DIM    => C_AP_IARG_FORMAT_DIM,
      C_MTBF_STAGES           => C_MTBF_STAGES,
      C_EXTRA_SYNCS           => C_EXTRA_SYNCS)
    port map (
      --- Slave AXI streams (input arguments)
      S_AXIS_ACLK          => S_AXIS_ACLK,
      S_AXIS_ARESETN       => S_AXIS_ARESETN,
      S_AXIS_TVALID        => S_AXIS_TVALID,
      S_AXIS_TREADY        => S_AXIS_TREADY,
      S_AXIS_TDATA         => S_AXIS_TDATA,
      S_AXIS_TSTRB         => S_AXIS_TSTRB,
      S_AXIS_TKEEP         => S_AXIS_TKEEP,
      S_AXIS_TLAST         => S_AXIS_TLAST,
      S_AXIS_TID           => S_AXIS_TID,
      S_AXIS_TDEST         => S_AXIS_TDEST,
      S_AXIS_TUSER         => S_AXIS_TUSER,
      dbg_stream_nwords    => dbg_iarg_stream_nwords,
      dbg_buffer_nwords    => dbg_iarg_buffer_nwords,
      dbg_ap_start         => dbg_ap_start,
      --- AP input arguments
      ap_clk               => ap_clk,
      ap_rst               => ap_rst_i,
      ap_rst_saclk         => ap_rst_saclk,
      ap_iarg_rst          => host_iarg_rst,
      ap_iarg_addr         => ap_iarg_addr,
      ap_iarg_ce           => ap_iarg_ce,
      ap_iarg_we           => ap_iarg_we,
      ap_iarg_din          => ap_iarg_din,
      ap_iarg_dout         => ap_iarg_dout,
      mb_iarg_rdy          => mb_iarg_rdy_i,
      mb_iarg_done         => mb_iarg_done,
      status_iarg_empty    => status_iarg_empty_i,
      status_iarg_full     => status_iarg_full_i,
      status_iarg_used     => status_iarg_used_i,
      status_iarg_n_words  => status_iarg_n_words,
      ---
      ap_fifo_iarg_dout    => ap_fifo_iarg_dout,
      ap_fifo_iarg_read    => ap_fifo_iarg_read,
      ap_fifo_iarg_empty_n => ap_fifo_iarg_empty_n);

 


  -----------------------------------------------------------------------------------------
  -- XD_OUTPUT_ARGS_I : Output argument generation module
  -----------------------------------------------------------------------------------------
  XD_OUTPUT_ARGS_I : entity axis_accelerator_adapter_v2_1_16.xd_output_args_module
    generic map (
      -- System generics:
      C_FAMILY                => C_FAMILY,
      C_BRAM_TYPE             => C_BRAM_TYPE,
      C_SELECT_XPM            => C_SELECT_XPM,
      C_MAX_ARG_DWIDTH        => C_MAX_ARG_DWIDTH,
      C_MAX_ARG_AWIDTH        => C_MAX_ARG_AWIDTH,
      C_MAX_ARG_N_DIM         => C_MAX_ARG_N_DIM,
      C_MAX_MB_DEPTH          => C_MAX_MB_DEPTH,
      C_MAX_N_OARGS           => C_MAX_N_OARGS,
      C_N_OUTPUT_ARGS         => C_N_OUTPUT_ARGS,
      C_PRMRY_IS_ACLK_ASYNC   => C_PRMRY_IS_ACLK_ASYNC,
      C_MTBF_STAGES           => C_MTBF_STAGES,
      ---
      C_M_AXIS_TDATA_WIDTH    => C_M_AXIS_TDATA_WIDTH,
      C_M_AXIS_TUSER_WIDTH    => C_M_AXIS_TUSER_WIDTH,
      C_M_AXIS_TID_WIDTH      => C_M_AXIS_TID_WIDTH,
      C_M_AXIS_TDEST_WIDTH    => C_M_AXIS_TDEST_WIDTH,
      ---
      C_AP_OARG_TYPE          => C_AP_OARG_TYPE,
      C_AP_OARG_DWIDTH        => C_AP_OARG_DWIDTH,
      C_AP_OARG_MB_DEPTH      => C_AP_OARG_MB_DEPTH,
      ---
      C_AP_OARG_WIDTH         => C_AP_OARG_WIDTH,
      C_AP_OARG_N_DIM         => C_AP_OARG_N_DIM,
      C_AP_OARG_DIM           => C_AP_OARG_DIM,
      C_AP_OARG_DIM_1         => C_AP_OARG_DIM_1,
      C_AP_OARG_DIM_2         => C_AP_OARG_DIM_2,
      C_AP_OARG_FORMAT_TYPE   => C_AP_OARG_FORMAT_TYPE,
      C_AP_OARG_FORMAT_FACTOR => C_AP_OARG_FORMAT_FACTOR,
      C_AP_OARG_FORMAT_DIM    => C_AP_OARG_FORMAT_DIM)
    port map (
      --- Master AXI streams (output arguments)
      M_AXIS_ACLK         => M_AXIS_ACLK,
      M_AXIS_ARESETN      => M_AXIS_ARESETN,
      M_AXIS_TVALID       => M_AXIS_TVALID,
      M_AXIS_TREADY       => M_AXIS_TREADY,
      M_AXIS_TDATA        => M_AXIS_TDATA,
      M_AXIS_TSTRB        => M_AXIS_TSTRB,
      M_AXIS_TKEEP        => M_AXIS_TKEEP,
      M_AXIS_TLAST        => M_AXIS_TLAST,
      M_AXIS_TID          => M_AXIS_TID,
      M_AXIS_TDEST        => M_AXIS_TDEST,
      M_AXIS_TUSER        => M_AXIS_TUSER,
      ---
      oarg_sw_length      => oarg_sw_length,
      oarg_sw_length_m2s     => oarg_sw_length_m2s,
      oarg_sw_length_we   => oarg_sw_length_we,
      oarg_use_sw_length  => oarg_use_sw_length,
      host_oarg_tdest     => host_oarg_tdest,
      ---
      dbg_stream_nwords   => dbg_oarg_stream_nwords,
      dbg_buffer_nwords   => dbg_oarg_buffer_nwords,
      dbg_ap_done         => dbg_ap_done,
      --- AP output arguments
      ap_clk              => ap_clk,
      ap_rst              => ap_rst_i,
      ap_rst_maclk        => ap_rst_maclk,
      ap_oarg_rst         => host_oarg_rst,
      ap_oarg_addr        => ap_oarg_addr,
      ap_oarg_ce          => ap_oarg_ce,
      ap_oarg_we          => ap_oarg_we,
      ap_oarg_din         => ap_oarg_din,
      ap_oarg_dout        => ap_oarg_dout,
      ap_oarg_rdy         => mb_oarg_rdy_i,
      ap_oarg_done        => mb_oarg_done,
      status_oarg_empty   => status_oarg_empty_i,
      status_oarg_full    => status_oarg_full_i,
      status_oarg_used    => status_oarg_used_i,
      ---
      ap_fifo_oarg_din    => ap_fifo_oarg_din,
      ap_fifo_oarg_write  => ap_fifo_oarg_write,
      ap_fifo_oarg_full_n => ap_fifo_oarg_full_n,
      ap_start            => ap_start_one_shot,
      ap_done             => ap_done);


   EN_APCLK_LITE_SYNC_GEN : if (C_PRMRY_IS_ACLK_ASYNC = 1) generate
   begin


      AP_OARGFULL_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_OARGS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => M_AXIS_ACLK(0),
        prmry_resetn               => M_AXIS_ARESETN(0),
	prmry_in                   => '0',
        prmry_vect_in              => status_oarg_full_i,

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => open,
        scndry_vect_out            => status_oarg_full_int
        );

        AP_OARGEMPTY_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_OARGS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => M_AXIS_ACLK(0),
        prmry_resetn               => M_AXIS_ARESETN(0),
	prmry_in                   => '0',
        prmry_vect_in              => status_oarg_empty_i,

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => open,
        scndry_vect_out            => status_oarg_empty_int
        );
--      status_oarg_empty <= status_oarg_empty_i;
	

      AP_OARGUSED_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_OARGS*4,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => M_AXIS_ACLK(0),
        prmry_resetn               => M_AXIS_ARESETN(0),
	prmry_in                   => '0',
        prmry_vect_in              => status_oarg_used_i,

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => open,
        scndry_vect_out            => status_oarg_used
        );


  AP_ORGRDY_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_OARGS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => ap_clk,
        prmry_resetn               => ap_rst_i_n,
	prmry_in                   => '0',
        prmry_vect_in              => mb_oarg_rdy_i,

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => open,
        scndry_vect_out            => mb_oarg_rdy
        );


      AP_IARGFULL_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => S_AXIS_ACLK(0),
        prmry_resetn               => S_AXIS_ARESETN(0),
	prmry_in                   => '0',
        prmry_vect_in              => status_iarg_full_i,

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => open,
        scndry_vect_out            => status_iarg_full_int
        );

        AP_IARGEMPTY_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => S_AXIS_ACLK(0),
        prmry_resetn               => S_AXIS_ARESETN(0),
	prmry_in                   => '0',
        prmry_vect_in              => status_iarg_empty_i,

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => open,
        scndry_vect_out            => status_iarg_empty_int
        );
	

      AP_IARGUSED_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS*4,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => S_AXIS_ACLK(0),
        prmry_resetn               => S_AXIS_ARESETN(0),
	prmry_in                   => '0',
        prmry_vect_in              => status_iarg_used_i,

        scndry_aclk                => S_AXI_ACLK,
        scndry_resetn              => S_AXI_ARESETN,
        scndry_out                 => open,
        scndry_vect_out            => status_iarg_used
        );


    AP_IRGRQT_SYNC_I : entity  axis_accelerator_adapter_v2_1_16.axis_acc_adapter_cdc_sync
        generic map (
        C_CDC_TYPE                 => 1,
        C_RESET_STATE              => 0,
        C_SINGLE_BIT               => 0,
        C_FLOP_INPUT               => 1,
        C_VECTOR_WIDTH             => C_MAX_N_IARGS,
        C_MTBF_STAGES              => 2
        )
        port map (
        prmry_aclk                 => S_AXI_ACLK,
        prmry_resetn               => S_AXI_ARESETN,
	prmry_in                   => '0',
        prmry_vect_in              => iarg_rqt_enable_i,

        scndry_aclk                => ap_clk,
        scndry_resetn              => ap_rst_i_n,
        scndry_out                 => open,
        scndry_vect_out            => iarg_rqt_enable
        );

      mb_iarg_rdy <= mb_iarg_rdy_i;
      oarg_rqt_enable <= oarg_rqt_enable_i;

  OARGS_GEN_INT : if (C_N_OUTPUT_ARGS > 0) generate
  begin

    OUTPUT_ARGS_GEN_INT : for i in 0 to C_N_OUTPUT_ARGS-1 generate

      constant OARG_TYPE          : integer          := get_int_element(C_AP_OARG_TYPE, i);

    begin

     M2S_gen_INT: if (OARG_TYPE = AP_ARG_MEM_MAP_TYPE) generate 
     begin
      status_oarg_full(i) <= status_oarg_full_int(i);
      status_oarg_empty(i) <= status_oarg_empty_int(i);
      end generate M2S_gen_INT;


     S2S_gen_INT: if (OARG_TYPE = AP_ARG_STREAM_TYPE) generate 
     begin
      status_oarg_full(i) <= '0';
      status_oarg_empty(i) <= '0';
      end generate S2S_gen_INT;

    end generate OUTPUT_ARGS_GEN_INT;

   end generate OARGS_GEN_INT;

 IARGS_GEN_INT : if (C_N_INPUT_ARGS > 0) generate
  begin

    INPUT_ARGS_GEN_INT : for i in 0 to C_N_INPUT_ARGS-1 generate

      constant IARG_TYPE          : integer          := get_int_element(C_AP_IARG_TYPE, i);

    begin

     M2S_gen_INT: if (IARG_TYPE = AP_ARG_MEM_MAP_TYPE) generate 
     begin
      status_iarg_full(i) <= status_iarg_full_int(i);
      status_iarg_empty(i) <= status_iarg_empty_int(i);
      end generate M2S_gen_INT;


     S2S_gen_INT: if (IARG_TYPE = AP_ARG_STREAM_TYPE) generate 
     begin
      status_iarg_full(i) <= '0';
      status_iarg_empty(i) <= '0';
      end generate S2S_gen_INT;

    end generate INPUT_ARGS_GEN_INT;

   end generate IARGS_GEN_INT;


 end generate EN_APCLK_LITE_SYNC_GEN;

   NO_APCLK_LITE_SYNC_GEN : if (C_PRMRY_IS_ACLK_ASYNC = 0) generate
   begin
      status_oarg_full <= status_oarg_full_i;
      status_oarg_empty <= status_oarg_empty_i;
      status_oarg_used <= status_oarg_used_i;
      status_iarg_full <= status_iarg_full_i;
      status_iarg_empty <= status_iarg_empty_i;
      status_iarg_used <= status_iarg_used_i;
      mb_iarg_rdy <= mb_iarg_rdy_i;
      iarg_rqt_enable <= iarg_rqt_enable_i;
      oarg_rqt_enable <= oarg_rqt_enable_i;
      mb_oarg_rdy <= mb_oarg_rdy_i;

   end generate NO_APCLK_LITE_SYNC_GEN;


 
  -----------------------------------------------------------------------------------------
  -- XD_SYNC_I : Accelerator Synchronizer module
  -----------------------------------------------------------------------------------------
  XD_SYNC_I : entity axis_accelerator_adapter_v2_1_16.xd_sync_module
    generic map (
      C_FAMILY              => C_FAMILY,
      C_MAX_N_IARGS         => C_MAX_N_IARGS,
      C_MAX_N_OARGS         => C_MAX_N_OARGS,
      C_N_INPUT_ARGS        => C_N_INPUT_ARGS,
      C_N_OUTPUT_ARGS       => C_N_OUTPUT_ARGS,
      C_PRMRY_IS_ACLK_ASYNC => C_PRMRY_IS_ACLK_ASYNC,
      C_MTBF_STAGES         => C_MTBF_STAGES, 
      ---
      C_MAX_N_ISCALARS     => C_MAX_N_ISCALARS,
      C_N_INPUT_SCALARS    => C_N_INPUT_SCALARS,
      C_MAX_N_OSCALARS     => C_MAX_N_OSCALARS,
      C_N_INOUT_SCALARS    => C_N_INOUT_SCALARS,
      C_MAX_N_IOSCALARS    => C_MAX_N_IOSCALARS,
      C_N_OUTPUT_SCALARS   => C_N_OUTPUT_SCALARS)
    port map (
      ---
      S_AXI_ACLK          => S_AXI_ACLK,
      S_AXI_ARESETN       => S_AXI_ARESETN,

      host_cmd_data       => host_cmd_data,
      host_cmd_we         => host_cmd_we,
      host_cmd_rdy        => host_cmd_rdy,
      host_complete_re    => host_complete_re,
      host_cmd_error      => host_cmd_error,
      ---
      iarg_rqt_enable     => iarg_rqt_enable,
      oarg_rqt_enable     => oarg_rqt_enable,
      ---
      status_ap_start     => status_ap_start,
      status_ap_done      => status_ap_done,
      status_ap_idle      => status_ap_idle,
      status_ap_ready     => status_ap_ready,
      status_ap_start_clr => status_ap_start_clr,
      status_ap_done_clr  => status_ap_done_clr,
      status_ap_idle_clr  => status_ap_idle_clr,
      status_ap_ready_clr => status_ap_ready_clr,
      ---
      status_iarg_rqt     => status_iarg_rqt,
      status_iarg_ack     => status_iarg_ack,
      status_oarg_rqt     => status_oarg_rqt,
      status_oarg_ack     => status_oarg_ack,
      ---
      ap_clk              => ap_clk,
      soft_rst            => ap_rst_s_axi_aclk,
      ap_rst              => ap_rst_i,
      ---
      mb_iarg_rdy         => mb_iarg_rdy,
      mb_iarg_done        => mb_iarg_done,
      mb_oarg_rdy         => mb_oarg_rdy,
      mb_oarg_done        => mb_oarg_done,
      -- AP control handshaking:
      ap_start            => ap_start,
      ap_ready            => ap_ready,
      ap_done             => ap_done,
      ap_continue         => ap_continue,
      ap_idle             => ap_idle,
      ap_start_one_shot   => ap_start_one_shot,
      ---
      iscalar_rqt_enable     => iscalar_rqt_enable,
      oscalar_rqt_enable     => oscalar_rqt_enable,
      ---
      ap_iscalar_rdy      => ap_iscalar_rdy,
      ap_iscalar_done     => ap_iscalar_done_sync,
      ap_oscalar_vld      => ap_oscalar_vld_sync,
      ap_oscalar_rdy      => ap_oscalar_rdy);

  -----------------------------------------------------------------------------------------
  -- XD_INPUT_SCALARS_I : Input scalar generation module
  -----------------------------------------------------------------------------------------
  IN_ACTIVE_GEN1 : if (C_N_INOUT_SCALARS > 0) generate
  XD_INPUT_SCALARS_I : entity axis_accelerator_adapter_v2_1_16.xd_input_scalars_module
    generic map (
      C_FAMILY                => C_FAMILY,
      C_MTBF_STAGES           => C_MTBF_STAGES, 
      C_PRMRY_IS_ACLK_ASYNC   => C_PRMRY_IS_ACLK_ASYNC,
      C_MAX_N_ISCALARS        => C_MAX_N_ISCALARS,
      C_N_INPUT_SCALARS       => C_N_INPUT_SCALARS,
      C_N_INOUT_SCALARS       => C_N_INOUT_SCALARS+C_MAX_N_ISCALARS-C_MAX_N_IOSCALARS,
      C_INPUT_SCALAR_DWIDTH   => C_INPUT_SCALAR_DWIDTH,
      C_AP_ISCALAR_DOUT_WIDTH => 32*(C_MAX_N_ISCALARS-C_MAX_N_IOSCALARS)+ C_AP_ISCALAR_IO_DOUT_WIDTH)
    port map (
      clk                  => S_AXI_ACLK,
      rst                  => S_AXI_ARESET,
      iscalar_rst          => host_iscalar_rst,
      iscalar_din          => host_iscalar_dout,
      iscalar_we           => host_iscalar_we,
      status_iscalar_empty => status_iscalar_empty,
      status_iscalar_full  => status_iscalar_full,
      status_iscalar_used  => status_iscalar_used,
      --- AP input scalars
      ap_clk               => ap_clk,
      ap_rst               => ap_rst_i,
      ap_rst_s_axi_aclk    => ap_rst_s_axi_aclk,
      ap_iscalar_rdy       => ap_iscalar_rdy,
      ap_iscalar_done      => ap_iscalar_done,
      ap_iscalar_dout      => ap_iscalar_dout(32*(C_MAX_N_ISCALARS-C_MAX_N_IOSCALARS) + C_AP_ISCALAR_IO_DOUT_WIDTH-1 downto 0));
    end generate IN_ACTIVE_GEN1;

  IN_ACTIVE_GEN2 : if (C_N_INOUT_SCALARS = 0) generate
  XD_INPUT_SCALARS_I : entity axis_accelerator_adapter_v2_1_16.xd_input_scalars_module
    generic map (
      C_FAMILY                => C_FAMILY,
      C_MTBF_STAGES           => C_MTBF_STAGES,
      C_PRMRY_IS_ACLK_ASYNC   => C_PRMRY_IS_ACLK_ASYNC,
      C_MAX_N_ISCALARS        => C_MAX_N_ISCALARS,--+C_MAX_N_IOSCALARS,
      --C_N_INPUT_SCALARS       => C_N_INPUT_SCALARS+C_N_INOUT_SCALARS,
      C_N_INPUT_SCALARS       => C_N_INPUT_SCALARS,
      C_N_INOUT_SCALARS       => C_N_INOUT_SCALARS+C_MAX_N_ISCALARS-C_MAX_N_IOSCALARS,
      C_INPUT_SCALAR_DWIDTH   => C_INPUT_SCALAR_DWIDTH,
      C_AP_ISCALAR_DOUT_WIDTH => C_AP_ISCALAR_DOUT_WIDTH)
    port map (
      clk                  => S_AXI_ACLK,
      rst                  => S_AXI_ARESET,
      iscalar_rst          => host_iscalar_rst,
      iscalar_din          => host_iscalar_dout,
      iscalar_we           => host_iscalar_we,
      status_iscalar_empty => status_iscalar_empty,
      status_iscalar_full  => status_iscalar_full,
      status_iscalar_used  => status_iscalar_used,
      --- AP input scalars
      ap_clk               => ap_clk,
      ap_rst_s_axi_aclk    => ap_rst_s_axi_aclk,
      ap_rst               => ap_rst_i,
      ap_iscalar_rdy       => ap_iscalar_rdy,
      ap_iscalar_done      => ap_iscalar_done,
      ap_iscalar_dout      => ap_iscalar_dout(C_AP_ISCALAR_DOUT_WIDTH-1 downto 0));
    end generate IN_ACTIVE_GEN2;

  -----------------------------------------------------------------------------------------
  -- XD_OUTPUT_SCALARS_I : Output scalar generation module
  -----------------------------------------------------------------------------------------
  ACTIVE_GEN1 : if (C_N_INOUT_SCALARS > 0) generate
  XD_OUTPUT_SCALARS_I : entity axis_accelerator_adapter_v2_1_16.xd_output_scalars_module
    generic map (
      C_FAMILY                => C_FAMILY,
      C_MTBF_STAGES           => C_MTBF_STAGES, 
      C_PRMRY_IS_ACLK_ASYNC   => C_PRMRY_IS_ACLK_ASYNC,
      C_MAX_SCALAR_DWIDTH     => C_MAX_SCALAR_DWIDTH,
      C_MAX_N_OSCALARS        => C_MAX_N_OSCALARS,
      C_N_OUTPUT_SCALARS      => C_N_OUTPUT_SCALARS,
      C_N_INOUT_SCALARS       => C_N_INOUT_SCALARS+C_MAX_N_OSCALARS-C_MAX_N_IOSCALARS,
      C_OUTPUT_SCALAR_DWIDTH  => C_OUTPUT_SCALAR_DWIDTH,
      C_AP_OSCALAR_DIN_WIDTH  => 32*(C_MAX_N_OSCALARS-C_MAX_N_IOSCALARS) + C_AP_OSCALAR_IO_DIN_WIDTH)
    port map (
      --- AP output scalars
      ap_clk               => ap_clk,
      ap_rst               => ap_rst_i,
      ap_rst_s_axi_aclk    => ap_rst_s_axi_aclk,
      ap_oscalar_vld       => ap_oscalar_vld_i,
      ap_oscalar_rdy       => ap_oscalar_rdy,
      ap_oscalar_din       => ap_oscalar_din(32*(C_MAX_N_OSCALARS-C_MAX_N_IOSCALARS) + C_AP_OSCALAR_IO_DIN_WIDTH-1 downto 0),
      ---
      clk                  => S_AXI_ACLK,
      rst                  => S_AXI_ARESET,
      oscalar_rst          => host_oscalar_rst,
      oscalar_data         => host_oscalar_din,
      oscalar_re           => host_oscalar_re,
      status_oscalar_empty => status_oscalar_empty,
      status_oscalar_full  => status_oscalar_full,
      status_oscalar_used  => status_oscalar_used);

    end generate ACTIVE_GEN1;

  ACTIVE_GEN2 : if (C_N_INOUT_SCALARS = 0) generate
  XD_OUTPUT_SCALARS_I : entity axis_accelerator_adapter_v2_1_16.xd_output_scalars_module
    generic map (
      C_FAMILY                => C_FAMILY,
      C_MTBF_STAGES           => C_MTBF_STAGES, 
      C_PRMRY_IS_ACLK_ASYNC   => C_PRMRY_IS_ACLK_ASYNC,
      C_MAX_SCALAR_DWIDTH     => C_MAX_SCALAR_DWIDTH,
      C_MAX_N_OSCALARS        => C_MAX_N_OSCALARS,
      C_N_OUTPUT_SCALARS      => C_N_OUTPUT_SCALARS,
      C_N_INOUT_SCALARS       => C_N_INOUT_SCALARS+C_MAX_N_OSCALARS-C_MAX_N_IOSCALARS,
      C_OUTPUT_SCALAR_DWIDTH  => C_OUTPUT_SCALAR_DWIDTH,
      C_AP_OSCALAR_DIN_WIDTH  => C_AP_OSCALAR_DIN_WIDTH)
    port map (
      --- AP output scalars
      ap_clk               => ap_clk,
      ap_rst               => ap_rst_i,
      ap_rst_s_axi_aclk    => ap_rst_s_axi_aclk,
      ap_oscalar_vld       => ap_oscalar_vld_i,
      ap_oscalar_rdy       => ap_oscalar_rdy,
      ap_oscalar_din       => ap_oscalar_din(C_AP_OSCALAR_DIN_WIDTH-1 downto 0),
      ---
      clk                  => S_AXI_ACLK,
      rst                  => S_AXI_ARESET,
      oscalar_rst          => host_oscalar_rst,
      oscalar_data         => host_oscalar_din,
      oscalar_re           => host_oscalar_re,
      status_oscalar_empty => status_oscalar_empty,
      status_oscalar_full  => status_oscalar_full,
      status_oscalar_used  => status_oscalar_used);
    end generate ACTIVE_GEN2;
      
   
   -----------------------------------------------------------------------------------------
   -- OUTPUT_SCALARS_MODE_GEN : Output Scalar IO mode logic
   -----------------------------------------------------------------------------------------
   OUTPUT_SCALARS_MODE_GEN : for i in 0 to C_MAX_N_OSCALARS-1 generate
   
     -- AP_HS mode
     OSCALAR_HS_MODE : if (C_OUTPUT_SCALAR_MODE(4*(i+1)-1 downto 4*i) = "0010") generate 
     
        ap_oscalar_ack(i)   <= ap_oscalar_rdy(i);
        ap_oscalar_vld_i(i) <= ap_oscalar_vld(i);

     
     end generate OSCALAR_HS_MODE;
    
     -- AP_VLD mode
     OSCALAR_VLD_MODE : if (C_OUTPUT_SCALAR_MODE(4*(i+1)-1 downto 4*i) = "0001") generate 
        ap_oscalar_ack(i)   <= '0';
        ap_oscalar_vld_i(i) <= ap_oscalar_vld(i);
     end generate OSCALAR_VLD_MODE;


     -- AP_NONE mode
     OSCALAR_NONE_MODE : if (C_OUTPUT_SCALAR_MODE(4*(i+1)-1 downto 4*i) = "0000") generate 
        ap_oscalar_ack(i)   <= '0';
        ap_oscalar_vld_i(i) <= ap_oscalar_vld_sync(i);
     end generate OSCALAR_NONE_MODE;

      
  end generate OUTPUT_SCALARS_MODE_GEN;
      
      
   -----------------------------------------------------------------------------------------
   -- INPUT_SCALARS_MODE_GEN : Input Scalar IO mode logic
   -----------------------------------------------------------------------------------------
   INPUT_SCALARS_MODE_GEN : for i in 0 to C_MAX_N_ISCALARS-1 generate
   
     -- AP_HS mode
     ISCALAR_HS_MODE : if (C_INPUT_SCALAR_MODE(4*(i+1)-1 downto 4*i) = "0010") generate 
     
        ap_iscalar_vld(i)  <= ap_iscalar_rdy(i);
        ap_iscalar_done(i) <= ap_iscalar_ack(i);
        
     
     end generate ISCALAR_HS_MODE;
    
     -- AP_VLD mode
     ISCALAR_VLD_MODE : if (C_INPUT_SCALAR_MODE(4*(i+1)-1 downto 4*i) = "0001") generate 
        ap_iscalar_vld(i)  <= ap_iscalar_rdy(i);
        ap_iscalar_done(i) <= ap_iscalar_done_sync(i);
     end generate ISCALAR_VLD_MODE;


     -- AP_NONE mode
     ISCALAR_NONE_MODE : if (C_INPUT_SCALAR_MODE(4*(i+1)-1 downto 4*i) = "0000") generate 
        ap_iscalar_vld(i)  <= '0';
        ap_iscalar_done(i) <= ap_iscalar_done_sync(i);
     end generate ISCALAR_NONE_MODE;

      
  end generate INPUT_SCALARS_MODE_GEN;
      
  -- Unused nets 
   host_iscalar_rdy <= (others => '0');
   host_oscalar_rdy <= (others => '0');  
   dbg_ap_start     <= '0';
   dbg_ap_done      <= '0';   
   
end rtl;



-------------------------------------------------------------------------------
-- axis_accelerator_adpater.vhd - Entity and architecture
-------------------------------------------------------------------------------
--
-- *******************************************************************
-- ** (c) Copyright [2010] - [2013] Xilinx, Inc. All rights reserved.*
-- **                                                                *
-- ** This file contains confidential and proprietary information    *
-- ** of Xilinx, Inc. and is protected under U.S. and                *
-- ** international copyright and other intellectual property        *
-- ** laws.                                                          *
-- **                                                                *
-- ** DISCLAIMER                                                     *
-- ** This disclaimer is not a license and does not grant any        *
-- ** rights to the materials distributed herewith. Except as        *
-- ** otherwise provided in a valid license issued to you by         *
-- ** Xilinx, and to the maximum extent permitted by applicable      *
-- ** law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND        *
-- ** WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES    *
-- ** AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING      *
-- ** BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-         *
-- ** INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and       *
-- ** (2) Xilinx shall not be liable (whether in contract or tort,   *
-- ** including negligence, or under any other theory of             *
-- ** liability) for any loss or damage of any kind or nature        *
-- ** related to, arising under or in connection with these          *
-- ** materials, including for any direct, or any indirect,          *
-- ** special, incidental, or consequential loss or damage           *
-- ** (including loss of data, profits, goodwill, or any type of     *
-- ** loss or damage suffered as a result of any action brought      *
-- ** by a third party) even if such damage or loss was              *
-- ** reasonably foreseeable or Xilinx had been advised of the       *
-- ** possibility of the same.                                       *
-- **                                                                *
-- ** CRITICAL APPLICATIONS                                          *
-- ** Xilinx products are not designed or intended to be fail-       *
-- ** safe, or for use in any application requiring fail-safe        *
-- ** performance, such as life-support or safety devices or         *
-- ** systems, Class III medical devices, nuclear facilities,        *
-- ** applications related to the deployment of airbags, or any      *
-- ** other applications that could lead to death, personal          *
-- ** injury, or severe property or environmental damage             *
-- ** (individually and collectively, "Critical                      *
-- ** Applications"). Customer assumes the sole risk and             *
-- ** liability of any use of Xilinx products in Critical            *
-- ** Applications, subject only to applicable laws and              *
-- ** regulations governing limitations on product liability.        *
-- **                                                                *
-- ** THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS       *
-- ** PART OF THIS FILE AT ALL TIMES.                                *
-- *******************************************************************
--
-------------------------------------------------------------------------------
-- Title      : AXI4-Stream Accelerator Adapter
-- Project    : 
-------------------------------------------------------------------------------
-- File       : axis_accelerator_adapter.vhd
-- Author     : rmg/jn
-- Company    : Xilinx, Inc.
-- Created    : 2012-09-05
-- Last update: 2013-10-25
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: This is the Accelerator Adapter top-level module. It is 
-- implemented as a wrapper that uses buses for all input/output arguments.
-- This top-level module supports up-to eight input/output arguments.
-- Then, it instantiates the "xd_adapter_core", which is a completely
-- parametrizable module.
-------------------------------------------------------------------------------
-- Structure:
--
--              axis_accelerator_adapter.vhd
--              xd_adapter_pkg.vhd
--              axis_accelerator_adapter_core.vhd
--                   |-- axi_lite_adapter
--                   |-- axis_acc_adapter_cdc_sync.vhd
--                   |-- xd_input_args_module.vhd
--                     |-- xd_s2m_adapter.vhd
--                        |-- xd_s2m_converter.vhd
--                        |-- xd_s2m_memory_dc.vhd
--                     |-- xd_iarg_s2s_adapter.vhd
--                        |-- s2s_async_fifo_wt.vhd
--                   |-- xd_output_args_module.vhd
--                     |-- axis_acc_adapter_cdc_sync.vhd
--                     |-- xd_m2s_adapter.vhd
--                        |-- xd_m2s_converter.vhd
--                        |-- xd_m2s_memory_dc.vhd
--                           |-- arg_mem_bank.vhd
--                              |-- asymmetric_dp_bank_v6.vhd
--                              |-- symmetric_dp_bank_v6.vhd
--                              |-- dp_bank_sdp_v6.vhd
--                           |-- oarg_columnized_mem_bank.vhd
--                           |-- srl_fifo_32_wt.vhd
--                     |-- xd_oarg_s2s_adapter.vhd
--                        |-- s2s_async_fifo_wt.vhd
--                   |-- xd_sync_module.vhd
--                       |-- axis_acc_adapter_cdc_sync.vhd
--                       |-- sync_ap_status.vhd
--                       |-- async_fifo_dist_wt.vhd
--                   |-- xd_input_scalars_module.vhd
--                       |-- xd_input_scalars_fifo.vhd
--                   |-- xd_output_scalars_module.vhd
--                       |-- xd_output_scalars_fifo.vhd
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "aclk","clk_div#", "clk_#x"
--      reset signals:                          "rst", "aresetn","rst_n"
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
-- History:
-- ~~~~~~
-- Revisions  :
-- Date        Version  Author  Description
-- 2012-09-05  1.0      rmg/jn  Created
-- 2013-01-31  1.0      pankajk removed perf mon ports, all ports in lower case
-- 2013-05-10  1.1      pankajk Seperated scalar port and brought those to top 
--                      entity 
-- 2013-07-22  2.0      pankajk New scalar ports (*.vld, *.ack) and parameter 
--                              scalar_mode added to support accelerator IP 
--                              interface ap_none, ap_hs, ap_vld
-- 2013-10-25  2.0      pvk     Added support for UltraScale primitives. 
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library axis_accelerator_adapter_v2_1_16;
use axis_accelerator_adapter_v2_1_16.xd_adapter_pkg.all;
use axis_accelerator_adapter_v2_1_16.axis_accelerator_adapter_core;


entity axis_accelerator_adapter is
  generic (
    -- System generics:
    C_FAMILY                : string                  := "virtex7";  -- Xilinx FPGA family
    C_SELECT_XPM            : integer := 1;
    --
    C_S_AXI_ADDR_WIDTH      : integer                 := 13;
    C_S_AXI_DATA_WIDTH      : integer range 32 to 32  := 32;
    --
    C_AP_ADAPTER_ID         : integer range 0 to 15 :=1;
    C_N_INPUT_ARGS          : integer := 2;
    C_N_OUTPUT_ARGS         : integer := 1;
    C_ENABLE_STREAM_CLK     : integer := 0;
    C_PRMRY_IS_ACLK_ASYNC   : integer := 1;
    C_S_AXIS_HAS_TSTRB      : integer := 0;
    C_S_AXIS_HAS_TKEEP      : integer := 0;

    --
    C_S_AXIS_TDATA_WIDTH    : integer := 64;
    C_S_AXIS_TUSER_WIDTH    : integer := 8;
    C_S_AXIS_TID_WIDTH      : integer := 4;
    C_S_AXIS_TDEST_WIDTH    : integer := 8;
    --
    C_AP_IARG_TYPE          : std_logic_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    C_AP_IARG_MB_DEPTH      : std_logic_vector := X"0000000400000004000000040000000400000004000000040000000400000004";
    C_AP_IARG_WIDTH         : std_logic_vector := X"0000002000000020000000200000002000000020000000200000002000000020";
    C_AP_IARG_N_DIM         : std_logic_vector := X"0000000100000001000000010000000100000001000000010000000100000001";
    C_AP_IARG_DIM_1         : std_logic_vector := X"0000040000000400000004000000040000000400000004000000040000000400";
    C_AP_IARG_DIM_2         : std_logic_vector := X"0000000100000001000000010000000100000001000000010000000100000001";
    C_AP_IARG_FORMAT_TYPE   : std_logic_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    C_AP_IARG_FORMAT_FACTOR : std_logic_vector := X"0000000100000001000000010000000100000001000000010000000100000001";
    C_AP_IARG_FORMAT_DIM    : std_logic_vector := X"0000000100000001000000010000000100000001000000010000000100000001";
    --
    C_AP_IARG_0_DWIDTH      : integer := 32;
    C_AP_IARG_1_DWIDTH      : integer := 32;
    C_AP_IARG_2_DWIDTH      : integer := 32;
    C_AP_IARG_3_DWIDTH      : integer := 32;
    C_AP_IARG_4_DWIDTH      : integer := 32;
    C_AP_IARG_5_DWIDTH      : integer := 32;
    C_AP_IARG_6_DWIDTH      : integer := 32;
    C_AP_IARG_7_DWIDTH      : integer := 32;
    --
    C_M_AXIS_TDATA_WIDTH    : integer := 64;
    C_M_AXIS_TUSER_WIDTH    : integer := 8;
    C_M_AXIS_TID_WIDTH      : integer := 4;
    C_M_AXIS_TDEST_WIDTH    : integer := 8;
    --
    C_AP_OARG_TYPE          : std_logic_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    C_AP_OARG_MB_DEPTH      : std_logic_vector := X"0000000400000004000000040000000400000004000000040000000400000004";
    C_AP_OARG_WIDTH         : std_logic_vector := X"0000002000000020000000200000002000000020000000200000002000000020";
    C_AP_OARG_N_DIM         : std_logic_vector := X"0000000100000001000000010000000100000001000000010000000100000001";
    C_AP_OARG_DIM           : std_logic_vector := X"0000000100000001000000010000040000000001000000010000000100000400000000010000000100000001000004000000000100000001000000010000040000000001000000010000000100000400000000010000000100000001000004000000000100000001000000010000080000000001000000010000000100000008";
    C_AP_OARG_DIM_1         : std_logic_vector := X"0000040000000400000004000000040000000400000004000000080000000008";
    C_AP_OARG_DIM_2         : std_logic_vector := X"0000000100000001000000010000000100000001000000010000000100000001";
    C_AP_OARG_FORMAT_TYPE   : std_logic_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
    C_AP_OARG_FORMAT_FACTOR : std_logic_vector := X"0000000100000001000000010000000100000001000000010000000100000001";
    C_AP_OARG_FORMAT_DIM    : std_logic_vector := X"0000000100000001000000010000000100000001000000010000000100000001";
    --
    C_AP_OARG_0_DWIDTH      : integer := 32;
    C_AP_OARG_1_DWIDTH      : integer := 32;
    C_AP_OARG_2_DWIDTH      : integer := 32;
    C_AP_OARG_3_DWIDTH      : integer := 32;
    C_AP_OARG_4_DWIDTH      : integer := 32;
    C_AP_OARG_5_DWIDTH      : integer := 32;
    C_AP_OARG_6_DWIDTH      : integer := 32;
    C_AP_OARG_7_DWIDTH      : integer := 32;
    --

    C_INPUT_SCALAR_0_WIDTH  : integer := 0;
    C_INPUT_SCALAR_1_WIDTH  : integer := 0;
    C_INPUT_SCALAR_2_WIDTH  : integer := 0;
    C_INPUT_SCALAR_3_WIDTH  : integer := 0;
    C_INPUT_SCALAR_4_WIDTH  : integer := 0;
    C_INPUT_SCALAR_5_WIDTH  : integer := 0;
    C_INPUT_SCALAR_6_WIDTH  : integer := 0;
    C_INPUT_SCALAR_7_WIDTH  : integer := 0;
    C_INPUT_SCALAR_8_WIDTH  : integer := 0;
    C_INPUT_SCALAR_9_WIDTH  : integer := 0;
    C_INPUT_SCALAR_10_WIDTH : integer := 0;
    C_INPUT_SCALAR_11_WIDTH : integer := 0;
    C_INPUT_SCALAR_12_WIDTH : integer := 0;
    C_INPUT_SCALAR_13_WIDTH : integer := 0;
    C_INPUT_SCALAR_14_WIDTH : integer := 0;
    C_INPUT_SCALAR_15_WIDTH : integer := 0;

    C_OUTPUT_SCALAR_0_WIDTH  : integer := 0;   
    C_OUTPUT_SCALAR_1_WIDTH  : integer := 0;   
    C_OUTPUT_SCALAR_2_WIDTH  : integer := 0;   
    C_OUTPUT_SCALAR_3_WIDTH  : integer := 0;   
    C_OUTPUT_SCALAR_4_WIDTH  : integer := 0;   
    C_OUTPUT_SCALAR_5_WIDTH  : integer := 0;   
    C_OUTPUT_SCALAR_6_WIDTH  : integer := 0;   
    C_OUTPUT_SCALAR_7_WIDTH  : integer := 0;   
    C_OUTPUT_SCALAR_8_WIDTH  : integer := 0;
    C_OUTPUT_SCALAR_9_WIDTH  : integer := 0;
    C_OUTPUT_SCALAR_10_WIDTH : integer := 0;
    C_OUTPUT_SCALAR_11_WIDTH : integer := 0;
    C_OUTPUT_SCALAR_12_WIDTH : integer := 0;
    C_OUTPUT_SCALAR_13_WIDTH : integer := 0;
    C_OUTPUT_SCALAR_14_WIDTH : integer := 0;
    C_OUTPUT_SCALAR_15_WIDTH : integer := 0;
    
    C_N_INOUT_SCALARS       : integer := 0;
    C_N_INPUT_SCALARS       : integer := 0;
    C_INPUT_SCALAR_DWIDTH   : std_logic_vector := X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020";
    C_AP_ISCALAR_DOUT_WIDTH : integer := 32;
    C_INPUT_SCALAR_MODE     : std_logic_vector(63 downto 0) := X"0000000000000000";
    
    -- 
    C_N_OUTPUT_SCALARS      : integer := 0;
    C_OUTPUT_SCALAR_DWIDTH  : std_logic_vector := X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020";
    C_AP_OSCALAR_DIN_WIDTH  : integer := 32;
    C_AP_ISCALAR_IO_DOUT_WIDTH : integer := 32;
    C_AP_OSCALAR_IO_DIN_WIDTH : integer := 32;
    C_OUTPUT_SCALAR_MODE    : std_logic_vector(63 downto 0) := X"0000000000000000";

    C_NONE : integer := 2);
  port (
    -------------------------------
    -- AXI4-Lite Slave Interface --
    -------------------------------
    s_axi_aclk       : in  std_logic;
    s_axi_aresetn    : in  std_logic;
    s_axi_awaddr     : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    s_axi_awvalid    : in  std_logic;
    s_axi_awready    : out std_logic;
    s_axi_wdata      : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    s_axi_wstrb      : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    s_axi_wvalid     : in  std_logic;
    s_axi_wready     : out std_logic;
    s_axi_bresp      : out std_logic_vector(1 downto 0);
    s_axi_bvalid     : out std_logic;
    s_axi_bready     : in  std_logic;
    s_axi_araddr     : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    s_axi_arvalid    : in  std_logic;
    s_axi_arready    : out std_logic;
    s_axi_rdata      : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    s_axi_rresp      : out std_logic_vector(1 downto 0);
    s_axi_rvalid     : out std_logic;
    s_axi_rready     : in  std_logic;

    ----------------------------------------------
    -- AXI4-Stream slave interface clock reset
    ----------------------------------------------
    s_axis_aclk      : in  std_logic;
    s_axis_aresetn   : in  std_logic;
    
    ----------------------------------------------
    -- AXI4-Stream master interface clock reset
    ----------------------------------------------
    m_axis_aclk      : in  std_logic;
    m_axis_aresetn   : in  std_logic;


    ----------------------------------------------
    -- Accelerator clock --
    ----------------------------------------------
    aclk                  : in  std_logic;

    -------------------------------
    -- AXI4-Stream Slave Interface --
    -------------------------------
    s_axis_0_aclk    : in  std_logic;
    s_axis_0_aresetn : in  std_logic;
    s_axis_0_tvalid  : in  std_logic;
    s_axis_0_tready  : out std_logic;
    s_axis_0_tdata   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
    s_axis_0_tstrb   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_0_tkeep   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_0_tlast   : in  std_logic;
    s_axis_0_tid     : in  std_logic_vector(C_S_AXIS_TID_WIDTH-1 downto 0);
    s_axis_0_tdest   : in  std_logic_vector(C_S_AXIS_TDEST_WIDTH-1 downto 0);
    s_axis_0_tuser   : in  std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0);

    s_axis_1_aclk    : in  std_logic;
    s_axis_1_aresetn : in  std_logic;
    s_axis_1_tvalid  : in  std_logic;
    s_axis_1_tready  : out std_logic;
    s_axis_1_tdata   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
    s_axis_1_tstrb   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_1_tkeep   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_1_tlast   : in  std_logic;
    s_axis_1_tid     : in  std_logic_vector(C_S_AXIS_TID_WIDTH-1 downto 0);
    s_axis_1_tdest   : in  std_logic_vector(C_S_AXIS_TDEST_WIDTH-1 downto 0);
    s_axis_1_tuser   : in  std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0);

    s_axis_2_aclk    : in  std_logic;
    s_axis_2_aresetn : in  std_logic;
    s_axis_2_tvalid  : in  std_logic;
    s_axis_2_tready  : out std_logic;
    s_axis_2_tdata   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
    s_axis_2_tstrb   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_2_tkeep   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_2_tlast   : in  std_logic;
    s_axis_2_tid     : in  std_logic_vector(C_S_AXIS_TID_WIDTH-1 downto 0);
    s_axis_2_tdest   : in  std_logic_vector(C_S_AXIS_TDEST_WIDTH-1 downto 0);
    s_axis_2_tuser   : in  std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0);

    s_axis_3_aclk    : in  std_logic;
    s_axis_3_aresetn : in  std_logic;
    s_axis_3_tvalid  : in  std_logic;
    s_axis_3_tready  : out std_logic;
    s_axis_3_tdata   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
    s_axis_3_tstrb   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_3_tkeep   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_3_tlast   : in  std_logic;
    s_axis_3_tid     : in  std_logic_vector(C_S_AXIS_TID_WIDTH-1 downto 0);
    s_axis_3_tdest   : in  std_logic_vector(C_S_AXIS_TDEST_WIDTH-1 downto 0);
    s_axis_3_tuser   : in  std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0);

    s_axis_4_aclk    : in  std_logic;
    s_axis_4_aresetn : in  std_logic;
    s_axis_4_tvalid  : in  std_logic;
    s_axis_4_tready  : out std_logic;
    s_axis_4_tdata   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
    s_axis_4_tstrb   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_4_tkeep   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_4_tlast   : in  std_logic;
    s_axis_4_tid     : in  std_logic_vector(C_S_AXIS_TID_WIDTH-1 downto 0);
    s_axis_4_tdest   : in  std_logic_vector(C_S_AXIS_TDEST_WIDTH-1 downto 0);
    s_axis_4_tuser   : in  std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0);

    s_axis_5_aclk    : in  std_logic;
    s_axis_5_aresetn : in  std_logic;
    s_axis_5_tvalid  : in  std_logic;
    s_axis_5_tready  : out std_logic;
    s_axis_5_tdata   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
    s_axis_5_tstrb   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_5_tkeep   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_5_tlast   : in  std_logic;
    s_axis_5_tid     : in  std_logic_vector(C_S_AXIS_TID_WIDTH-1 downto 0);
    s_axis_5_tdest   : in  std_logic_vector(C_S_AXIS_TDEST_WIDTH-1 downto 0);
    s_axis_5_tuser   : in  std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0);

    s_axis_6_aclk    : in  std_logic;
    s_axis_6_aresetn : in  std_logic;
    s_axis_6_tvalid  : in  std_logic;
    s_axis_6_tready  : out std_logic;
    s_axis_6_tdata   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
    s_axis_6_tstrb   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_6_tkeep   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_6_tlast   : in  std_logic;
    s_axis_6_tid     : in  std_logic_vector(C_S_AXIS_TID_WIDTH-1 downto 0);
    s_axis_6_tdest   : in  std_logic_vector(C_S_AXIS_TDEST_WIDTH-1 downto 0);
    s_axis_6_tuser   : in  std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0);

    s_axis_7_aclk    : in  std_logic;
    s_axis_7_aresetn : in  std_logic;
    s_axis_7_tvalid  : in  std_logic;
    s_axis_7_tready  : out std_logic;
    s_axis_7_tdata   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
    s_axis_7_tstrb   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_7_tkeep   : in  std_logic_vector(C_S_AXIS_TDATA_WIDTH/8-1 downto 0):= (others => '1');
    s_axis_7_tlast   : in  std_logic;
    s_axis_7_tid     : in  std_logic_vector(C_S_AXIS_TID_WIDTH-1 downto 0);
    s_axis_7_tdest   : in  std_logic_vector(C_S_AXIS_TDEST_WIDTH-1 downto 0);
    s_axis_7_tuser   : in  std_logic_vector(C_S_AXIS_TUSER_WIDTH-1 downto 0);

    ------------------------------------------
    -- Accelerator Port input arguments (BRAM)
    ------------------------------------------
    ap_iarg_0_clk  : in  std_logic;
    ap_iarg_0_rst  : in  std_logic;
    ap_iarg_0_addr : in  std_logic_vector(31 downto 0);
    ap_iarg_0_ce   : in  std_logic;
    ap_iarg_0_we   : in  std_logic_vector(C_AP_IARG_0_DWIDTH/8-1 downto 0);
    ap_iarg_0_din  : in  std_logic_vector(C_AP_IARG_0_DWIDTH-1 downto 0);
    ap_iarg_0_dout : out std_logic_vector(C_AP_IARG_0_DWIDTH-1 downto 0);
    ---
    ap_iarg_1_clk  : in  std_logic;
    ap_iarg_1_rst  : in  std_logic;
    ap_iarg_1_addr : in  std_logic_vector(31 downto 0);
    ap_iarg_1_ce   : in  std_logic;
    ap_iarg_1_we   : in  std_logic_vector(C_AP_IARG_1_DWIDTH/8-1 downto 0);
    ap_iarg_1_din  : in  std_logic_vector(C_AP_IARG_1_DWIDTH-1 downto 0);
    ap_iarg_1_dout : out std_logic_vector(C_AP_IARG_1_DWIDTH-1 downto 0);
    ---
    ap_iarg_2_clk  : in  std_logic;
    ap_iarg_2_rst  : in  std_logic;
    ap_iarg_2_addr : in  std_logic_vector(31 downto 0);
    ap_iarg_2_ce   : in  std_logic;
    ap_iarg_2_we   : in  std_logic_vector(C_AP_IARG_2_DWIDTH/8-1 downto 0);
    ap_iarg_2_din  : in  std_logic_vector(C_AP_IARG_2_DWIDTH-1 downto 0);
    ap_iarg_2_dout : out std_logic_vector(C_AP_IARG_2_DWIDTH-1 downto 0);
    ---
    ap_iarg_3_clk  : in  std_logic;
    ap_iarg_3_rst  : in  std_logic;
    ap_iarg_3_addr : in  std_logic_vector(31 downto 0);
    ap_iarg_3_ce   : in  std_logic;
    ap_iarg_3_we   : in  std_logic_vector(C_AP_IARG_3_DWIDTH/8-1 downto 0);
    ap_iarg_3_din  : in  std_logic_vector(C_AP_IARG_3_DWIDTH-1 downto 0);
    ap_iarg_3_dout : out std_logic_vector(C_AP_IARG_3_DWIDTH-1 downto 0);
    ---
    ap_iarg_4_clk  : in  std_logic;
    ap_iarg_4_rst  : in  std_logic;
    ap_iarg_4_addr : in  std_logic_vector(31 downto 0);
    ap_iarg_4_ce   : in  std_logic;
    ap_iarg_4_we   : in  std_logic_vector(C_AP_IARG_4_DWIDTH/8-1 downto 0);
    ap_iarg_4_din  : in  std_logic_vector(C_AP_IARG_4_DWIDTH-1 downto 0);
    ap_iarg_4_dout : out std_logic_vector(C_AP_IARG_4_DWIDTH-1 downto 0);
    ---
    ap_iarg_5_clk  : in  std_logic;
    ap_iarg_5_rst  : in  std_logic;
    ap_iarg_5_addr : in  std_logic_vector(31 downto 0);
    ap_iarg_5_ce   : in  std_logic;
    ap_iarg_5_we   : in  std_logic_vector(C_AP_IARG_5_DWIDTH/8-1 downto 0);
    ap_iarg_5_din  : in  std_logic_vector(C_AP_IARG_5_DWIDTH-1 downto 0);
    ap_iarg_5_dout : out std_logic_vector(C_AP_IARG_5_DWIDTH-1 downto 0);
    ---
    ap_iarg_6_clk  : in  std_logic;
    ap_iarg_6_rst  : in  std_logic;
    ap_iarg_6_addr : in  std_logic_vector(31 downto 0);
    ap_iarg_6_ce   : in  std_logic;
    ap_iarg_6_we   : in  std_logic_vector(C_AP_IARG_6_DWIDTH/8-1 downto 0);
    ap_iarg_6_din  : in  std_logic_vector(C_AP_IARG_6_DWIDTH-1 downto 0);
    ap_iarg_6_dout : out std_logic_vector(C_AP_IARG_6_DWIDTH-1 downto 0);
    ---
    ap_iarg_7_clk  : in  std_logic;
    ap_iarg_7_rst  : in  std_logic;
    ap_iarg_7_addr : in  std_logic_vector(31 downto 0);
    ap_iarg_7_ce   : in  std_logic;
    ap_iarg_7_we   : in  std_logic_vector(C_AP_IARG_7_DWIDTH/8-1 downto 0);
    ap_iarg_7_din  : in  std_logic_vector(C_AP_IARG_7_DWIDTH-1 downto 0);
    ap_iarg_7_dout : out std_logic_vector(C_AP_IARG_7_DWIDTH-1 downto 0);

    ---------------------------------------------
    -- Accelerator Port input arguments (FIFO) --
    ---------------------------------------------
    ap_fifo_iarg_0_dout    : out std_logic_vector(C_AP_IARG_0_DWIDTH-1 downto 0);
    ap_fifo_iarg_0_read    : in  std_logic;
    ap_fifo_iarg_0_empty_n : out std_logic;

    ap_fifo_iarg_1_dout    : out std_logic_vector(C_AP_IARG_1_DWIDTH-1 downto 0);
    ap_fifo_iarg_1_read    : in  std_logic;
    ap_fifo_iarg_1_empty_n : out std_logic;

    ap_fifo_iarg_2_dout    : out std_logic_vector(C_AP_IARG_2_DWIDTH-1 downto 0);
    ap_fifo_iarg_2_read    : in  std_logic;
    ap_fifo_iarg_2_empty_n : out std_logic;

    ap_fifo_iarg_3_dout    : out std_logic_vector(C_AP_IARG_3_DWIDTH-1 downto 0);
    ap_fifo_iarg_3_read    : in  std_logic;
    ap_fifo_iarg_3_empty_n : out std_logic;

    ap_fifo_iarg_4_dout    : out std_logic_vector(C_AP_IARG_4_DWIDTH-1 downto 0);
    ap_fifo_iarg_4_read    : in  std_logic;
    ap_fifo_iarg_4_empty_n : out std_logic;

    ap_fifo_iarg_5_dout    : out std_logic_vector(C_AP_IARG_5_DWIDTH-1 downto 0);
    ap_fifo_iarg_5_read    : in  std_logic;
    ap_fifo_iarg_5_empty_n : out std_logic;

    ap_fifo_iarg_6_dout    : out std_logic_vector(C_AP_IARG_6_DWIDTH-1 downto 0);
    ap_fifo_iarg_6_read    : in  std_logic;
    ap_fifo_iarg_6_empty_n : out std_logic;

    ap_fifo_iarg_7_dout    : out std_logic_vector(C_AP_IARG_7_DWIDTH-1 downto 0);
    ap_fifo_iarg_7_read    : in  std_logic;
    ap_fifo_iarg_7_empty_n : out std_logic;

    -------------------------------
    --* AXI4-Stream Slave Interface* --
    -- Output Arguments
    -------------------------------
    m_axis_0_aclk    : in  std_logic;
    m_axis_0_aresetn : in  std_logic;
    m_axis_0_tvalid  : out std_logic;
    m_axis_0_tready  : in  std_logic;
    m_axis_0_tdata   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
    m_axis_0_tstrb   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_0_tkeep   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_0_tlast   : out std_logic;
    m_axis_0_tid     : out std_logic_vector(C_M_AXIS_TID_WIDTH-1 downto 0);
    m_axis_0_tdest   : out std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0);
    m_axis_0_tuser   : out std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0);

    m_axis_1_aclk    : in  std_logic;
    m_axis_1_aresetn : in  std_logic;
    m_axis_1_tvalid  : out std_logic;
    m_axis_1_tready  : in  std_logic;
    m_axis_1_tdata   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
    m_axis_1_tstrb   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_1_tkeep   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_1_tlast   : out std_logic;
    m_axis_1_tid     : out std_logic_vector(C_M_AXIS_TID_WIDTH-1 downto 0);
    m_axis_1_tdest   : out std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0);
    m_axis_1_tuser   : out std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0);

    m_axis_2_aclk    : in  std_logic;
    m_axis_2_aresetn : in  std_logic;
    m_axis_2_tvalid  : out std_logic;
    m_axis_2_tready  : in  std_logic;
    m_axis_2_tdata   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
    m_axis_2_tstrb   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_2_tkeep   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_2_tlast   : out std_logic;
    m_axis_2_tid     : out std_logic_vector(C_M_AXIS_TID_WIDTH-1 downto 0);
    m_axis_2_tdest   : out std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0);
    m_axis_2_tuser   : out std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0);

    m_axis_3_aclk    : in  std_logic;
    m_axis_3_aresetn : in  std_logic;
    m_axis_3_tvalid  : out std_logic;
    m_axis_3_tready  : in  std_logic;
    m_axis_3_tdata   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
    m_axis_3_tstrb   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_3_tkeep   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_3_tlast   : out std_logic;
    m_axis_3_tid     : out std_logic_vector(C_M_AXIS_TID_WIDTH-1 downto 0);
    m_axis_3_tdest   : out std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0);
    m_axis_3_tuser   : out std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0);

    m_axis_4_aclk    : in  std_logic;
    m_axis_4_aresetn : in  std_logic;
    m_axis_4_tvalid  : out std_logic;
    m_axis_4_tready  : in  std_logic;
    m_axis_4_tdata   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
    m_axis_4_tstrb   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_4_tkeep   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_4_tlast   : out std_logic;
    m_axis_4_tid     : out std_logic_vector(C_M_AXIS_TID_WIDTH-1 downto 0);
    m_axis_4_tdest   : out std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0);
    m_axis_4_tuser   : out std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0);

    m_axis_5_aclk    : in  std_logic;
    m_axis_5_aresetn : in  std_logic;
    m_axis_5_tvalid  : out std_logic;
    m_axis_5_tready  : in  std_logic;
    m_axis_5_tdata   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
    m_axis_5_tstrb   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_5_tkeep   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_5_tlast   : out std_logic;
    m_axis_5_tid     : out std_logic_vector(C_M_AXIS_TID_WIDTH-1 downto 0);
    m_axis_5_tdest   : out std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0);
    m_axis_5_tuser   : out std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0);

    m_axis_6_aclk    : in  std_logic;
    m_axis_6_aresetn : in  std_logic;
    m_axis_6_tvalid  : out std_logic;
    m_axis_6_tready  : in  std_logic;
    m_axis_6_tdata   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
    m_axis_6_tstrb   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_6_tkeep   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_6_tlast   : out std_logic;
    m_axis_6_tid     : out std_logic_vector(C_M_AXIS_TID_WIDTH-1 downto 0);
    m_axis_6_tdest   : out std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0);
    m_axis_6_tuser   : out std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0);

    m_axis_7_aclk    : in  std_logic;
    m_axis_7_aresetn : in  std_logic;
    m_axis_7_tvalid  : out std_logic;
    m_axis_7_tready  : in  std_logic;
    m_axis_7_tdata   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
    m_axis_7_tstrb   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_7_tkeep   : out std_logic_vector(C_M_AXIS_TDATA_WIDTH/8-1 downto 0);
    m_axis_7_tlast   : out std_logic;
    m_axis_7_tid     : out std_logic_vector(C_M_AXIS_TID_WIDTH-1 downto 0);
    m_axis_7_tdest   : out std_logic_vector(C_M_AXIS_TDEST_WIDTH-1 downto 0);
    m_axis_7_tuser   : out std_logic_vector(C_M_AXIS_TUSER_WIDTH-1 downto 0);

    ----------------------------------------------
    -- Accelerator Port output arguments (BRAM) --
    ----------------------------------------------
    --- AP output arguments
    ap_oarg_0_clk  : in  std_logic;
    ap_oarg_0_rst  : in  std_logic;
    ap_oarg_0_addr : in  std_logic_vector(31 downto 0);
    ap_oarg_0_ce   : in  std_logic;
    ap_oarg_0_we   : in  std_logic_vector(C_AP_OARG_0_DWIDTH/8-1 downto 0);
    ap_oarg_0_din  : in  std_logic_vector(C_AP_OARG_0_DWIDTH-1 downto 0);
    ap_oarg_0_dout : out std_logic_vector(C_AP_OARG_0_DWIDTH-1 downto 0);
    ---
    ap_oarg_1_clk  : in  std_logic;
    ap_oarg_1_rst  : in  std_logic;
    ap_oarg_1_addr : in  std_logic_vector(31 downto 0);
    ap_oarg_1_ce   : in  std_logic;
    ap_oarg_1_we   : in  std_logic_vector(C_AP_OARG_1_DWIDTH/8-1 downto 0);
    ap_oarg_1_din  : in  std_logic_vector(C_AP_OARG_1_DWIDTH-1 downto 0);
    ap_oarg_1_dout : out std_logic_vector(C_AP_OARG_1_DWIDTH-1 downto 0);
    ---
    ap_oarg_2_clk  : in  std_logic;
    ap_oarg_2_rst  : in  std_logic;
    ap_oarg_2_addr : in  std_logic_vector(31 downto 0);
    ap_oarg_2_ce   : in  std_logic;
    ap_oarg_2_we   : in  std_logic_vector(C_AP_OARG_2_DWIDTH/8-1 downto 0);
    ap_oarg_2_din  : in  std_logic_vector(C_AP_OARG_2_DWIDTH-1 downto 0);
    ap_oarg_2_dout : out std_logic_vector(C_AP_OARG_2_DWIDTH-1 downto 0);
    ---
    ap_oarg_3_clk  : in  std_logic;
    ap_oarg_3_rst  : in  std_logic;
    ap_oarg_3_addr : in  std_logic_vector(31 downto 0);
    ap_oarg_3_ce   : in  std_logic;
    ap_oarg_3_we   : in  std_logic_vector(C_AP_OARG_3_DWIDTH/8-1 downto 0);
    ap_oarg_3_din  : in  std_logic_vector(C_AP_OARG_3_DWIDTH-1 downto 0);
    ap_oarg_3_dout : out std_logic_vector(C_AP_OARG_3_DWIDTH-1 downto 0);
    ---
    ap_oarg_4_clk  : in  std_logic;
    ap_oarg_4_rst  : in  std_logic;
    ap_oarg_4_addr : in  std_logic_vector(31 downto 0);
    ap_oarg_4_ce   : in  std_logic;
    ap_oarg_4_we   : in  std_logic_vector(C_AP_OARG_4_DWIDTH/8-1 downto 0);
    ap_oarg_4_din  : in  std_logic_vector(C_AP_OARG_4_DWIDTH-1 downto 0);
    ap_oarg_4_dout : out std_logic_vector(C_AP_OARG_4_DWIDTH-1 downto 0);
    ---
    ap_oarg_5_clk  : in  std_logic;
    ap_oarg_5_rst  : in  std_logic;
    ap_oarg_5_addr : in  std_logic_vector(31 downto 0);
    ap_oarg_5_ce   : in  std_logic;
    ap_oarg_5_we   : in  std_logic_vector(C_AP_OARG_5_DWIDTH/8-1 downto 0);
    ap_oarg_5_din  : in  std_logic_vector(C_AP_OARG_5_DWIDTH-1 downto 0);
    ap_oarg_5_dout : out std_logic_vector(C_AP_OARG_5_DWIDTH-1 downto 0);
    ---
    ap_oarg_6_clk  : in  std_logic;
    ap_oarg_6_rst  : in  std_logic;
    ap_oarg_6_addr : in  std_logic_vector(31 downto 0);
    ap_oarg_6_ce   : in  std_logic;
    ap_oarg_6_we   : in  std_logic_vector(C_AP_OARG_6_DWIDTH/8-1 downto 0);
    ap_oarg_6_din  : in  std_logic_vector(C_AP_OARG_6_DWIDTH-1 downto 0);
    ap_oarg_6_dout : out std_logic_vector(C_AP_OARG_6_DWIDTH-1 downto 0);
    ---
    ap_oarg_7_clk  : in  std_logic;
    ap_oarg_7_rst  : in  std_logic;
    ap_oarg_7_addr : in  std_logic_vector(31 downto 0);
    ap_oarg_7_ce   : in  std_logic;
    ap_oarg_7_we   : in  std_logic_vector(C_AP_OARG_7_DWIDTH/8-1 downto 0);
    ap_oarg_7_din  : in  std_logic_vector(C_AP_OARG_7_DWIDTH-1 downto 0);
    ap_oarg_7_dout : out std_logic_vector(C_AP_OARG_7_DWIDTH-1 downto 0);

    ----------------------------------------------
    -- Accelerator Port output arguments (FIFO) --
    ----------------------------------------------
    ap_fifo_oarg_0_din    : in  std_logic_vector(C_AP_OARG_0_DWIDTH-1 downto 0);
    ap_fifo_oarg_0_write  : in  std_logic;
    ap_fifo_oarg_0_full_n : out std_logic;

    ap_fifo_oarg_1_din    : in  std_logic_vector(C_AP_OARG_1_DWIDTH-1 downto 0);
    ap_fifo_oarg_1_write  : in  std_logic;
    ap_fifo_oarg_1_full_n : out std_logic;

    ap_fifo_oarg_2_din    : in  std_logic_vector(C_AP_OARG_2_DWIDTH-1 downto 0);
    ap_fifo_oarg_2_write  : in  std_logic;
    ap_fifo_oarg_2_full_n : out std_logic;

    ap_fifo_oarg_3_din    : in  std_logic_vector(C_AP_OARG_3_DWIDTH-1 downto 0);
    ap_fifo_oarg_3_write  : in  std_logic;
    ap_fifo_oarg_3_full_n : out std_logic;

    ap_fifo_oarg_4_din    : in  std_logic_vector(C_AP_OARG_4_DWIDTH-1 downto 0);
    ap_fifo_oarg_4_write  : in  std_logic;
    ap_fifo_oarg_4_full_n : out std_logic;

    ap_fifo_oarg_5_din    : in  std_logic_vector(C_AP_OARG_5_DWIDTH-1 downto 0);
    ap_fifo_oarg_5_write  : in  std_logic;
    ap_fifo_oarg_5_full_n : out std_logic;

    ap_fifo_oarg_6_din    : in  std_logic_vector(C_AP_OARG_6_DWIDTH-1 downto 0);
    ap_fifo_oarg_6_write  : in  std_logic;
    ap_fifo_oarg_6_full_n : out std_logic;

    ap_fifo_oarg_7_din    : in  std_logic_vector(C_AP_OARG_7_DWIDTH-1 downto 0);
    ap_fifo_oarg_7_write  : in  std_logic;
    ap_fifo_oarg_7_full_n : out std_logic;


    ----------------------------------------------
    -- Accelerator Control Interface --
    ----------------------------------------------
    ap_start              : out std_logic;
    ap_ready              : in  std_logic;
    ap_done               : in  std_logic;
    ap_continue           : out std_logic;
    ap_idle               : in  std_logic;
    aresetn               : out std_logic;

    ----------------------------------------------
    -- Accelerator Input Scalar Interface --
    ----------------------------------------------
    ap_iscalar_0_dout     : out std_logic_vector(C_INPUT_SCALAR_0_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_1_dout     : out std_logic_vector(C_INPUT_SCALAR_1_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_2_dout     : out std_logic_vector(C_INPUT_SCALAR_2_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_3_dout     : out std_logic_vector(C_INPUT_SCALAR_3_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_4_dout     : out std_logic_vector(C_INPUT_SCALAR_4_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_5_dout     : out std_logic_vector(C_INPUT_SCALAR_5_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_6_dout     : out std_logic_vector(C_INPUT_SCALAR_6_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_7_dout     : out std_logic_vector(C_INPUT_SCALAR_7_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_8_dout     : out std_logic_vector(C_INPUT_SCALAR_8_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_9_dout     : out std_logic_vector(C_INPUT_SCALAR_9_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_10_dout    : out std_logic_vector(C_INPUT_SCALAR_10_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_11_dout    : out std_logic_vector(C_INPUT_SCALAR_11_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_12_dout    : out std_logic_vector(C_INPUT_SCALAR_12_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_13_dout    : out std_logic_vector(C_INPUT_SCALAR_13_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_14_dout    : out std_logic_vector(C_INPUT_SCALAR_14_WIDTH-1 downto 0) := (others=>'0');
    ap_iscalar_15_dout    : out std_logic_vector(C_INPUT_SCALAR_15_WIDTH-1 downto 0) := (others=>'0');
    
    -- Inpput scalar Valid signals (valid for AP_HS & AP_VLD modes)
    ap_iscalar_0_vld      : out  std_logic;
    ap_iscalar_1_vld      : out  std_logic;
    ap_iscalar_2_vld      : out  std_logic;
    ap_iscalar_3_vld      : out  std_logic;
    ap_iscalar_4_vld      : out  std_logic;
    ap_iscalar_5_vld      : out  std_logic;
    ap_iscalar_6_vld      : out  std_logic;
    ap_iscalar_7_vld      : out  std_logic;
    ap_iscalar_8_vld      : out  std_logic;
    ap_iscalar_9_vld      : out  std_logic;
    ap_iscalar_10_vld     : out  std_logic;
    ap_iscalar_11_vld     : out  std_logic;
    ap_iscalar_12_vld     : out  std_logic;
    ap_iscalar_13_vld     : out  std_logic;
    ap_iscalar_14_vld     : out  std_logic;
    ap_iscalar_15_vld     : out  std_logic;
    -- Input Scalar ack - (valid for AP_HS mode)
    ap_iscalar_0_ack      : in  std_logic;
    ap_iscalar_1_ack      : in  std_logic;
    ap_iscalar_2_ack      : in  std_logic;
    ap_iscalar_3_ack      : in  std_logic;
    ap_iscalar_4_ack      : in  std_logic;
    ap_iscalar_5_ack      : in  std_logic;
    ap_iscalar_6_ack      : in  std_logic;
    ap_iscalar_7_ack      : in  std_logic;
    ap_iscalar_8_ack      : in  std_logic;
    ap_iscalar_9_ack      : in  std_logic;
    ap_iscalar_10_ack     : in  std_logic;
    ap_iscalar_11_ack     : in  std_logic;
    ap_iscalar_12_ack     : in  std_logic;
    ap_iscalar_13_ack     : in  std_logic;
    ap_iscalar_14_ack     : in  std_logic;
    ap_iscalar_15_ack     : in  std_logic;

    ----------------------------------------------
    -- Accelerator Output Scalar Interface --
    ----------------------------------------------
    ap_oscalar_0_din      : in  std_logic_vector(C_OUTPUT_SCALAR_0_WIDTH-1 downto 0);
    ap_oscalar_1_din      : in  std_logic_vector(C_OUTPUT_SCALAR_1_WIDTH-1 downto 0);
    ap_oscalar_2_din      : in  std_logic_vector(C_OUTPUT_SCALAR_2_WIDTH-1 downto 0);
    ap_oscalar_3_din      : in  std_logic_vector(C_OUTPUT_SCALAR_3_WIDTH-1 downto 0);
    ap_oscalar_4_din      : in  std_logic_vector(C_OUTPUT_SCALAR_4_WIDTH-1 downto 0);
    ap_oscalar_5_din      : in  std_logic_vector(C_OUTPUT_SCALAR_5_WIDTH-1 downto 0);
    ap_oscalar_6_din      : in  std_logic_vector(C_OUTPUT_SCALAR_6_WIDTH-1 downto 0);
    ap_oscalar_7_din      : in  std_logic_vector(C_OUTPUT_SCALAR_7_WIDTH-1 downto 0);
    ap_oscalar_8_din      : in  std_logic_vector(C_OUTPUT_SCALAR_8_WIDTH-1 downto 0);
    ap_oscalar_9_din      : in  std_logic_vector(C_OUTPUT_SCALAR_9_WIDTH-1 downto 0);
    ap_oscalar_10_din     : in  std_logic_vector(C_OUTPUT_SCALAR_10_WIDTH-1 downto 0);
    ap_oscalar_11_din     : in  std_logic_vector(C_OUTPUT_SCALAR_11_WIDTH-1 downto 0);
    ap_oscalar_12_din     : in  std_logic_vector(C_OUTPUT_SCALAR_12_WIDTH-1 downto 0);
    ap_oscalar_13_din     : in  std_logic_vector(C_OUTPUT_SCALAR_13_WIDTH-1 downto 0);
    ap_oscalar_14_din     : in  std_logic_vector(C_OUTPUT_SCALAR_14_WIDTH-1 downto 0);
    ap_oscalar_15_din     : in  std_logic_vector(C_OUTPUT_SCALAR_15_WIDTH-1 downto 0);

    -- Output scalar Valid signals (valid for AP_HS & AP_VLD modes)
    ap_oscalar_0_vld      : in  std_logic;
    ap_oscalar_1_vld      : in  std_logic;
    ap_oscalar_2_vld      : in  std_logic;
    ap_oscalar_3_vld      : in  std_logic;
    ap_oscalar_4_vld      : in  std_logic;
    ap_oscalar_5_vld      : in  std_logic;
    ap_oscalar_6_vld      : in  std_logic;
    ap_oscalar_7_vld      : in  std_logic;
    ap_oscalar_8_vld      : in  std_logic;
    ap_oscalar_9_vld      : in  std_logic;
    ap_oscalar_10_vld     : in  std_logic;
    ap_oscalar_11_vld     : in  std_logic;
    ap_oscalar_12_vld     : in  std_logic;
    ap_oscalar_13_vld     : in  std_logic;
    ap_oscalar_14_vld     : in  std_logic;
    ap_oscalar_15_vld     : in  std_logic;
    -- Output Scalar ack - (valid for AP_HS mode)
    ap_oscalar_0_ack      : out  std_logic;
    ap_oscalar_1_ack      : out  std_logic;
    ap_oscalar_2_ack      : out  std_logic;
    ap_oscalar_3_ack      : out  std_logic;
    ap_oscalar_4_ack      : out  std_logic;
    ap_oscalar_5_ack      : out  std_logic;
    ap_oscalar_6_ack      : out  std_logic;
    ap_oscalar_7_ack      : out  std_logic;
    ap_oscalar_8_ack      : out  std_logic;
    ap_oscalar_9_ack      : out  std_logic;
    ap_oscalar_10_ack     : out  std_logic;
    ap_oscalar_11_ack     : out  std_logic;
    ap_oscalar_12_ack     : out  std_logic;
    ap_oscalar_13_ack     : out  std_logic;
    ap_oscalar_14_ack     : out  std_logic;
    ap_oscalar_15_ack     : out  std_logic;

    ---
    interrupt             : out std_logic);
end entity;

architecture rtl of axis_accelerator_adapter is

  attribute DowngradeIPIdentifiedWarnings: string;
  attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";


  -- Constant declaration
  constant C_S_AXIS_TSTRB_WIDTH : integer := C_S_AXIS_TDATA_WIDTH/8;
  constant C_S_AXIS_TKEEP_WIDTH : integer := C_S_AXIS_TDATA_WIDTH/8;
  constant C_M_AXIS_TSTRB_WIDTH : integer := C_M_AXIS_TDATA_WIDTH/8;
  constant C_M_AXIS_TKEEP_WIDTH : integer := C_M_AXIS_TDATA_WIDTH/8;
  constant C_MAX_SCALAR_DWIDTH  : integer := 32;
  constant C_MAX_ARG_DWIDTH     : integer := 1024;
  constant C_MAX_ARG_SWIDTH     : integer := 16;  -- Strobe width
  constant C_MAX_ARG_AWIDTH     : integer := 16;
  constant C_MAX_ARG_N_DIM      : integer := 4;
  constant C_MAX_MB_DEPTH       : integer := 8;
  constant C_MAX_N_IARGS        : integer := 8;
  constant C_MAX_N_OARGS        : integer := 8;
  constant C_MAX_N_ISCALARS     : integer := 8;
  constant C_MAX_N_OSCALARS     : integer := 8;
  constant C_MAX_N_IOSCALARS    : integer := 8;
  constant C_MTBF_STAGES        : integer := 4;


  -------------------------
  -- Scaler Data Width
  
  -------------------------
  -- GENERIC GROUPING: INPUT ARGUMENTS:
  function calc_iarg_dwidth return std_logic_vector is
    variable value : std_logic_vector(C_MAX_N_IARGS*32-1 downto 0) := (others => '0');
  begin
    value(32*(0+1)-1 downto 32*0) := int2lv(C_AP_IARG_0_DWIDTH);
    value(32*(1+1)-1 downto 32*1) := int2lv(C_AP_IARG_1_DWIDTH);
    value(32*(2+1)-1 downto 32*2) := int2lv(C_AP_IARG_2_DWIDTH);
    value(32*(3+1)-1 downto 32*3) := int2lv(C_AP_IARG_3_DWIDTH);
    value(32*(4+1)-1 downto 32*4) := int2lv(C_AP_IARG_4_DWIDTH);
    value(32*(5+1)-1 downto 32*5) := int2lv(C_AP_IARG_5_DWIDTH);
    value(32*(6+1)-1 downto 32*6) := int2lv(C_AP_IARG_6_DWIDTH);
    value(32*(7+1)-1 downto 32*7) := int2lv(C_AP_IARG_7_DWIDTH);
    return value;
  end function calc_iarg_dwidth;

  ---------------------------------------------------------
  -- GENERIC GROUPING: OUTPUT ARGUMENTS
  function calc_oarg_dwidth return std_logic_vector is
    variable value : std_logic_vector(C_MAX_N_OARGS*32-1 downto 0) := (others => '0');
  begin
    value(32*(0+1)-1 downto 32*0) := int2lv(C_AP_OARG_0_DWIDTH);
    value(32*(1+1)-1 downto 32*1) := int2lv(C_AP_OARG_1_DWIDTH);
    value(32*(2+1)-1 downto 32*2) := int2lv(C_AP_OARG_2_DWIDTH);
    value(32*(3+1)-1 downto 32*3) := int2lv(C_AP_OARG_3_DWIDTH);
    value(32*(4+1)-1 downto 32*4) := int2lv(C_AP_OARG_4_DWIDTH);
    value(32*(5+1)-1 downto 32*5) := int2lv(C_AP_OARG_5_DWIDTH);
    value(32*(6+1)-1 downto 32*6) := int2lv(C_AP_OARG_6_DWIDTH);
    value(32*(7+1)-1 downto 32*7) := int2lv(C_AP_OARG_7_DWIDTH);
    return value;
  end function calc_oarg_dwidth;


  -------------------------
  -- BRAM PRIMITIVE TYPE 
  -- 7_SERIES : RAMB36E1,  ULRASCALE : RAMB36E2
  -------------------------
  function calc_bram_type return string is
  begin
 
    if (C_FAMILY = "virtexu" or C_FAMILY = "kintexu" or C_FAMILY = "artixu" or C_FAMILY = "virtexuplus" or C_FAMILY = "virtexuplushbm" or C_FAMILY = "kintexuplus" or C_FAMILY = "zynquplus" or C_FAMILY = "zynquplusrfsoc") then
	return "ULTRASCALE";
    else 
	return "7_SERIES";
    end if ;
   
  end function calc_bram_type;


  constant BRAM_PRIMITIVE_TYPE : string := calc_bram_type;

  constant C_AP_OARG_DWIDTH : std_logic_vector(C_MAX_N_OARGS*32-1 downto 0) := calc_oarg_dwidth;
  constant C_AP_IARG_DWIDTH : std_logic_vector(C_MAX_N_IARGS*32-1 downto 0) := calc_iarg_dwidth;

  -- SUPERBUSSES DECLARATION:
  signal s_axis_aclk_i    : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal s_axis_aresetn_i : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal s_axis_tvalid  : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal s_axis_tready  : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal s_axis_tdata   : std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TDATA_WIDTH-1 downto 0);
  signal s_axis_tstrb   : std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TSTRB_WIDTH-1 downto 0);
  signal s_axis_tkeep   : std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TKEEP_WIDTH-1 downto 0);
  signal s_axis_tlast   : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal s_axis_tid     : std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TID_WIDTH-1 downto 0);
  signal s_axis_tdest   : std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TDEST_WIDTH-1 downto 0);
  signal s_axis_tuser   : std_logic_vector(C_MAX_N_IARGS*C_S_AXIS_TUSER_WIDTH-1 downto 0);

  signal m_axis_aclk_i    : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal m_axis_aresetn_i : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal m_axis_tvalid  : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal m_axis_tready  : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal m_axis_tdata   : std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TDATA_WIDTH-1 downto 0);
  signal m_axis_tstrb   : std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TSTRB_WIDTH-1 downto 0);
  signal m_axis_tkeep   : std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TKEEP_WIDTH-1 downto 0);
  signal m_axis_tlast   : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal m_axis_tid     : std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TID_WIDTH-1 downto 0);
  signal m_axis_tdest   : std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TDEST_WIDTH-1 downto 0);
  signal m_axis_tuser   : std_logic_vector(C_MAX_N_OARGS*C_M_AXIS_TUSER_WIDTH-1 downto 0);

  signal ap_iarg_addr : std_logic_vector(C_MAX_N_IARGS*C_MAX_ARG_AWIDTH-1 downto 0);
  signal ap_iarg_ce   : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal ap_iarg_we   : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal ap_iarg_din  : std_logic_vector(C_MAX_N_IARGS*C_MAX_ARG_DWIDTH-1 downto 0);
  signal ap_iarg_dout : std_logic_vector(C_MAX_N_IARGS*C_MAX_ARG_DWIDTH-1 downto 0);

  signal ap_oarg_addr : std_logic_vector(C_MAX_N_OARGS*C_MAX_ARG_AWIDTH-1 downto 0);
  signal ap_oarg_ce   : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal ap_oarg_we   : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal ap_oarg_din  : std_logic_vector(C_MAX_N_OARGS*C_MAX_ARG_DWIDTH-1 downto 0);
  signal ap_oarg_dout : std_logic_vector(C_MAX_N_OARGS*C_MAX_ARG_DWIDTH-1 downto 0);

  -------------------------------------------------------
  constant AP_IARG_0_OFFSET : integer := log2(C_AP_IARG_0_DWIDTH/8);
  constant AP_IARG_1_OFFSET : integer := log2(C_AP_IARG_1_DWIDTH/8);
  constant AP_IARG_2_OFFSET : integer := log2(C_AP_IARG_2_DWIDTH/8);
  constant AP_IARG_3_OFFSET : integer := log2(C_AP_IARG_3_DWIDTH/8);
  constant AP_IARG_4_OFFSET : integer := log2(C_AP_IARG_4_DWIDTH/8);
  constant AP_IARG_5_OFFSET : integer := log2(C_AP_IARG_5_DWIDTH/8);
  constant AP_IARG_6_OFFSET : integer := log2(C_AP_IARG_6_DWIDTH/8);
  constant AP_IARG_7_OFFSET : integer := log2(C_AP_IARG_7_DWIDTH/8);

  constant AP_OARG_0_OFFSET : integer := log2(C_AP_OARG_0_DWIDTH/8);
  constant AP_OARG_1_OFFSET : integer := log2(C_AP_OARG_1_DWIDTH/8);
  constant AP_OARG_2_OFFSET : integer := log2(C_AP_OARG_2_DWIDTH/8);
  constant AP_OARG_3_OFFSET : integer := log2(C_AP_OARG_3_DWIDTH/8);
  constant AP_OARG_4_OFFSET : integer := log2(C_AP_OARG_4_DWIDTH/8);
  constant AP_OARG_5_OFFSET : integer := log2(C_AP_OARG_5_DWIDTH/8);
  constant AP_OARG_6_OFFSET : integer := log2(C_AP_OARG_6_DWIDTH/8);
  constant AP_OARG_7_OFFSET : integer := log2(C_AP_OARG_7_DWIDTH/8);

  -------------------------------------------------
  signal ap_fifo_iarg_dout    : std_logic_vector(C_MAX_N_IARGS*C_MAX_ARG_DWIDTH-1 downto 0);
  signal ap_fifo_iarg_read    : std_logic_vector(C_MAX_N_IARGS-1 downto 0);
  signal ap_fifo_iarg_empty_n : std_logic_vector(C_MAX_N_IARGS-1 downto 0);

  signal ap_fifo_oarg_din    : std_logic_vector(C_MAX_N_OARGS*C_MAX_ARG_DWIDTH-1 downto 0);
  signal ap_fifo_oarg_write  : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  signal ap_fifo_oarg_full_n : std_logic_vector(C_MAX_N_OARGS-1 downto 0);
  -------------------------------------------------
   
  --  Scaler signals 
  signal ap_iscalar_dout_i     : std_logic_vector(511 downto 0);
  signal ap_oscalar_din_i      : std_logic_vector(511 downto 0);
  signal ap_oscalar_din_int    : std_logic_vector(C_AP_OSCALAR_DIN_WIDTH-1 downto 0);
  signal ap_ioscalar_din_int   : std_logic_vector(C_AP_OSCALAR_IO_DIN_WIDTH-1 downto 0);
  signal ap_oscalar_vld_i      : std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS-1 downto 0);
  signal ap_iscalar_vld_i      : std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS-1 downto 0);
  signal ap_oscalar_ack_i      : std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_OSCALARS-1 downto 0);
  signal ap_iscalar_ack_i      : std_logic_vector(C_MAX_N_IOSCALARS+C_MAX_N_ISCALARS-1 downto 0);

  signal zeros1    : std_logic_vector(256-C_AP_OSCALAR_DIN_WIDTH-1 downto 0);
  signal zeros256    : std_logic_vector(255 downto 0);

begin

zeros1 <= (others => '0');
zeros256 <= (others => '0');
    ----------------------------------------------
    -- Scalar signals assignments
    ----------------------------------------------
    ap_oscalar_vld_i <= ap_oscalar_15_vld & ap_oscalar_14_vld & ap_oscalar_13_vld &
                        ap_oscalar_12_vld & ap_oscalar_11_vld & ap_oscalar_10_vld & 
                        ap_oscalar_9_vld & ap_oscalar_8_vld & ap_oscalar_7_vld & 
                        ap_oscalar_6_vld & ap_oscalar_5_vld & ap_oscalar_4_vld & 
                        ap_oscalar_3_vld & ap_oscalar_2_vld & ap_oscalar_1_vld & 
                        ap_oscalar_0_vld;
                        
    ap_iscalar_ack_i <= ap_iscalar_15_ack & ap_iscalar_14_ack & ap_iscalar_13_ack &
                        ap_iscalar_12_ack & ap_iscalar_11_ack & ap_iscalar_10_ack & 
                        ap_iscalar_9_ack & ap_iscalar_8_ack & ap_iscalar_7_ack & 
                        ap_iscalar_6_ack & ap_iscalar_5_ack & ap_iscalar_4_ack & 
                        ap_iscalar_3_ack & ap_iscalar_2_ack & ap_iscalar_1_ack & 
                        ap_iscalar_0_ack;
  

    -- Output scalar ack generation
    ap_oscalar_0_ack  <= ap_oscalar_ack_i(0);
    ap_oscalar_1_ack  <= ap_oscalar_ack_i(1);
    ap_oscalar_2_ack  <= ap_oscalar_ack_i(2);
    ap_oscalar_3_ack  <= ap_oscalar_ack_i(3);
    ap_oscalar_4_ack  <= ap_oscalar_ack_i(4);
    ap_oscalar_5_ack  <= ap_oscalar_ack_i(5);
    ap_oscalar_6_ack  <= ap_oscalar_ack_i(6);
    ap_oscalar_7_ack  <= ap_oscalar_ack_i(7);
    ap_oscalar_8_ack  <= ap_oscalar_ack_i(8);
    ap_oscalar_9_ack  <= ap_oscalar_ack_i(9);
    ap_oscalar_10_ack  <= ap_oscalar_ack_i(10);
    ap_oscalar_11_ack  <= ap_oscalar_ack_i(11);
    ap_oscalar_12_ack  <= ap_oscalar_ack_i(12);
    ap_oscalar_13_ack  <= ap_oscalar_ack_i(13);
    ap_oscalar_14_ack  <= ap_oscalar_ack_i(14);
    ap_oscalar_15_ack  <= ap_oscalar_ack_i(15);
    
    -- input scalar valid generation
    ap_iscalar_0_vld  <= ap_iscalar_vld_i(0);
    ap_iscalar_1_vld  <= ap_iscalar_vld_i(1);
    ap_iscalar_2_vld  <= ap_iscalar_vld_i(2);
    ap_iscalar_3_vld  <= ap_iscalar_vld_i(3);
    ap_iscalar_4_vld  <= ap_iscalar_vld_i(4);
    ap_iscalar_5_vld  <= ap_iscalar_vld_i(5);
    ap_iscalar_6_vld  <= ap_iscalar_vld_i(6);
    ap_iscalar_7_vld  <= ap_iscalar_vld_i(7);
    ap_iscalar_8_vld  <= ap_iscalar_vld_i(8);
    ap_iscalar_9_vld  <= ap_iscalar_vld_i(9);
    ap_iscalar_10_vld  <= ap_iscalar_vld_i(10);
    ap_iscalar_11_vld  <= ap_iscalar_vld_i(11);
    ap_iscalar_12_vld  <= ap_iscalar_vld_i(12);
    ap_iscalar_13_vld  <= ap_iscalar_vld_i(13);
    ap_iscalar_14_vld  <= ap_iscalar_vld_i(14);
    ap_iscalar_15_vld  <= ap_iscalar_vld_i(15);



    ----------------------------------------------
    -- Output Scalar signals assignments
    ----------------------------------------------
    OSCALER_0_GEN : if (C_N_OUTPUT_SCALARS = 0) generate
    begin
      ap_oscalar_din_int <= (others=>'0'); 
    end generate OSCALER_0_GEN;    
    
    OSCALER_1_GEN : if (C_N_OUTPUT_SCALARS = 1) generate
    begin
      ap_oscalar_din_int <= ap_oscalar_0_din; 
    end generate OSCALER_1_GEN;    
    
    OSCALER_2_GEN : if (C_N_OUTPUT_SCALARS = 2) generate
    begin
      ap_oscalar_din_int <= ap_oscalar_1_din & ap_oscalar_0_din; 
    end generate OSCALER_2_GEN;    
    
    OSCALER_3_GEN : if (C_N_OUTPUT_SCALARS = 3) generate
    begin
      ap_oscalar_din_int <= ap_oscalar_2_din & ap_oscalar_1_din & ap_oscalar_0_din; 
    end generate OSCALER_3_GEN;    
    
    OSCALER_4_GEN : if (C_N_OUTPUT_SCALARS = 4) generate
    begin
      ap_oscalar_din_int <= ap_oscalar_3_din & ap_oscalar_2_din & ap_oscalar_1_din & ap_oscalar_0_din; 
    end generate OSCALER_4_GEN;    
    
    OSCALER_5_GEN : if (C_N_OUTPUT_SCALARS = 5) generate
    begin
      ap_oscalar_din_int <= ap_oscalar_4_din & ap_oscalar_3_din & ap_oscalar_2_din & ap_oscalar_1_din & ap_oscalar_0_din; 
    end generate OSCALER_5_GEN;    
    
    OSCALER_6_GEN : if (C_N_OUTPUT_SCALARS = 6) generate
    begin
      ap_oscalar_din_int <= ap_oscalar_5_din & ap_oscalar_4_din & ap_oscalar_3_din & ap_oscalar_2_din & ap_oscalar_1_din & ap_oscalar_0_din; 
    end generate OSCALER_6_GEN;    
    
    OSCALER_7_GEN : if (C_N_OUTPUT_SCALARS = 7) generate
    begin
      ap_oscalar_din_int <= ap_oscalar_6_din & ap_oscalar_5_din & ap_oscalar_4_din & ap_oscalar_3_din & ap_oscalar_2_din & ap_oscalar_1_din & ap_oscalar_0_din; 
    end generate OSCALER_7_GEN;    
    
    OSCALER_8_GEN : if (C_N_OUTPUT_SCALARS = 8) generate
    begin
      ap_oscalar_din_int <= ap_oscalar_7_din & ap_oscalar_6_din & ap_oscalar_5_din & ap_oscalar_4_din & ap_oscalar_3_din & ap_oscalar_2_din & ap_oscalar_1_din & ap_oscalar_0_din; 
    end generate OSCALER_8_GEN;    

    IOSCALER_0_GEN : if (C_N_INOUT_SCALARS = 0) generate
    begin
      ap_ioscalar_din_int <= (others=>'0'); 
    end generate IOSCALER_0_GEN;    

    OSCALER_9_GEN : if (C_N_INOUT_SCALARS = 1) generate
    begin
      ap_ioscalar_din_int <= ap_oscalar_8_din; 
    end generate OSCALER_9_GEN;    

    OSCALER_10_GEN : if (C_N_INOUT_SCALARS = 2) generate
    begin
      ap_ioscalar_din_int <= ap_oscalar_9_din & ap_oscalar_8_din; 
    end generate OSCALER_10_GEN;    

    OSCALER_11_GEN : if (C_N_INOUT_SCALARS = 3) generate
    begin
      ap_ioscalar_din_int <= ap_oscalar_10_din & ap_oscalar_9_din & ap_oscalar_8_din; 
    end generate OSCALER_11_GEN;    

    OSCALER_12_GEN : if (C_N_INOUT_SCALARS = 4) generate
    begin
      ap_ioscalar_din_int <= ap_oscalar_11_din & ap_oscalar_10_din & ap_oscalar_9_din & ap_oscalar_8_din; 
    end generate OSCALER_12_GEN;    

    OSCALER_13_GEN : if (C_N_INOUT_SCALARS = 5) generate
    begin
      ap_ioscalar_din_int <= ap_oscalar_12_din & ap_oscalar_11_din & ap_oscalar_10_din & ap_oscalar_9_din & ap_oscalar_8_din; 
    end generate OSCALER_13_GEN;    

    OSCALER_14_GEN : if (C_N_INOUT_SCALARS = 6) generate
    begin
      ap_ioscalar_din_int <= ap_oscalar_13_din & ap_oscalar_12_din & ap_oscalar_11_din & ap_oscalar_10_din & ap_oscalar_9_din & ap_oscalar_8_din; 
    end generate OSCALER_14_GEN;    

    OSCALER_15_GEN : if (C_N_INOUT_SCALARS = 7) generate
    begin
      ap_ioscalar_din_int <= ap_oscalar_14_din & ap_oscalar_13_din & ap_oscalar_12_din & ap_oscalar_11_din & ap_oscalar_10_din & ap_oscalar_9_din & ap_oscalar_8_din; 
    end generate OSCALER_15_GEN;    

    OSCALER_16_GEN : if (C_N_INOUT_SCALARS = 8) generate
    begin
      ap_ioscalar_din_int <= ap_oscalar_15_din & ap_oscalar_14_din & ap_oscalar_13_din & ap_oscalar_12_din & ap_oscalar_11_din & ap_oscalar_10_din & ap_oscalar_9_din & ap_oscalar_8_din; 
    end generate OSCALER_16_GEN;    

    OSCALER_GEN_1 : if (C_N_INOUT_SCALARS > 0 and C_N_OUTPUT_SCALARS > 0) generate
    begin
       ap_oscalar_din_i(256+C_AP_OSCALAR_IO_DIN_WIDTH-1 downto 0) <= ap_ioscalar_din_int & zeros1 & ap_oscalar_din_int;
       OSCALER_ZERO_GEN_1 : if (C_AP_OSCALAR_IO_DIN_WIDTH < 256 ) generate
       ap_oscalar_din_i(511 downto 256+C_AP_OSCALAR_IO_DIN_WIDTH) <= (others =>'0') ;
       end generate OSCALER_ZERO_GEN_1;    
    end generate OSCALER_GEN_1;    

    OSCALER_GEN_2 : if (C_N_INOUT_SCALARS = 0 and C_N_OUTPUT_SCALARS > 0) generate
    begin
       ap_oscalar_din_i(C_AP_OSCALAR_DIN_WIDTH-1 downto 0) <=  ap_oscalar_din_int;
       ap_oscalar_din_i(511 downto C_AP_OSCALAR_DIN_WIDTH) <=  (others => '0');
    end generate OSCALER_GEN_2;    

    OSCALER_GEN_3 : if (C_N_INOUT_SCALARS > 0 and C_N_OUTPUT_SCALARS = 0) generate
    begin
       ap_oscalar_din_i(256+C_AP_OSCALAR_IO_DIN_WIDTH-1 downto 0) <= ap_ioscalar_din_int & zeros256 ;
       OSCALER_ZERO_GEN_3 : if (C_AP_OSCALAR_IO_DIN_WIDTH < 256 ) generate
       ap_oscalar_din_i(511 downto 256+C_AP_OSCALAR_IO_DIN_WIDTH) <= (others =>'0') ;
       end generate OSCALER_ZERO_GEN_3;    
    end generate OSCALER_GEN_3;    

    OSCALER_GEN_4 : if (C_N_INOUT_SCALARS = 0 and C_N_OUTPUT_SCALARS = 0) generate
    begin
       ap_oscalar_din_i <= (others => '0');
    end generate OSCALER_GEN_4;    



    ----------------------------------------------
    -- Input Scalar signals assignments
    ----------------------------------------------
    ISCALER_1_GEN : if (C_N_INPUT_SCALARS > 0) generate
    begin
        ap_iscalar_0_dout <= ap_iscalar_dout_i((get_compact_MSB(C_INPUT_SCALAR_DWIDTH, 0)) downto (get_compact_LSB(C_INPUT_SCALAR_DWIDTH, 0)));
    end generate ISCALER_1_GEN;    
    
    ISCALER_2_GEN : if (C_N_INPUT_SCALARS > 1) generate
    begin
        ap_iscalar_1_dout <= ap_iscalar_dout_i((get_compact_MSB(C_INPUT_SCALAR_DWIDTH, 1)) downto (get_compact_LSB(C_INPUT_SCALAR_DWIDTH, 1)));  
    end generate ISCALER_2_GEN;    
    
    ISCALER_3_GEN : if (C_N_INPUT_SCALARS > 2) generate
    begin
        ap_iscalar_2_dout <= ap_iscalar_dout_i((get_compact_MSB(C_INPUT_SCALAR_DWIDTH, 2)) downto (get_compact_LSB(C_INPUT_SCALAR_DWIDTH, 2)));
    end generate ISCALER_3_GEN;    
    
    ISCALER_4_GEN : if (C_N_INPUT_SCALARS > 3) generate
    begin
        ap_iscalar_3_dout <= ap_iscalar_dout_i((get_compact_MSB(C_INPUT_SCALAR_DWIDTH, 3)) downto (get_compact_LSB(C_INPUT_SCALAR_DWIDTH, 3)));
    end generate ISCALER_4_GEN;    
    
    ISCALER_5_GEN : if (C_N_INPUT_SCALARS > 4) generate
    begin
        ap_iscalar_4_dout <= ap_iscalar_dout_i((get_compact_MSB(C_INPUT_SCALAR_DWIDTH, 4)) downto (get_compact_LSB(C_INPUT_SCALAR_DWIDTH, 4)));
    end generate ISCALER_5_GEN;    
    
    ISCALER_6_GEN : if (C_N_INPUT_SCALARS > 5) generate
    begin
        ap_iscalar_5_dout <= ap_iscalar_dout_i((get_compact_MSB(C_INPUT_SCALAR_DWIDTH, 5)) downto (get_compact_LSB(C_INPUT_SCALAR_DWIDTH, 5)));
    end generate ISCALER_6_GEN;    
    
    ISCALER_7_GEN : if (C_N_INPUT_SCALARS > 6) generate
    begin
        ap_iscalar_6_dout <= ap_iscalar_dout_i((get_compact_MSB(C_INPUT_SCALAR_DWIDTH, 6)) downto (get_compact_LSB(C_INPUT_SCALAR_DWIDTH, 6)));
    end generate ISCALER_7_GEN;    
    
    ISCALER_8_GEN : if (C_N_INPUT_SCALARS > 7) generate
    begin
        ap_iscalar_7_dout <= ap_iscalar_dout_i((get_compact_MSB(C_INPUT_SCALAR_DWIDTH, 7)) downto (get_compact_LSB(C_INPUT_SCALAR_DWIDTH, 7)));
    end generate ISCALER_8_GEN;    
    
    ISCALER_9_GEN : if (C_N_INOUT_SCALARS > 0) generate
    begin
        ap_iscalar_8_dout <= ap_iscalar_dout_i((get_compact_MSB_IO(C_INPUT_SCALAR_DWIDTH, 8)) downto (get_compact_LSB_IO(C_INPUT_SCALAR_DWIDTH, 8)));
    end generate ISCALER_9_GEN;    
    
    ISCALER_10_GEN : if (C_N_INOUT_SCALARS > 1) generate
    begin
        ap_iscalar_9_dout <= ap_iscalar_dout_i((get_compact_MSB_IO(C_INPUT_SCALAR_DWIDTH, 9)) downto (get_compact_LSB_IO(C_INPUT_SCALAR_DWIDTH, 9)));  
    end generate ISCALER_10_GEN;    
    
    ISCALER_11_GEN : if (C_N_INOUT_SCALARS > 2) generate
    begin
        ap_iscalar_10_dout <= ap_iscalar_dout_i((get_compact_MSB_IO(C_INPUT_SCALAR_DWIDTH, 10)) downto (get_compact_LSB_IO(C_INPUT_SCALAR_DWIDTH, 10)));
    end generate ISCALER_11_GEN;    
    
    ISCALER_12_GEN : if (C_N_INOUT_SCALARS > 3) generate
    begin
        ap_iscalar_11_dout <= ap_iscalar_dout_i((get_compact_MSB_IO(C_INPUT_SCALAR_DWIDTH, 11)) downto (get_compact_LSB_IO(C_INPUT_SCALAR_DWIDTH, 11)));
    end generate ISCALER_12_GEN;    
    
    ISCALER_13_GEN : if (C_N_INOUT_SCALARS > 4) generate
    begin
        ap_iscalar_12_dout <= ap_iscalar_dout_i((get_compact_MSB_IO(C_INPUT_SCALAR_DWIDTH, 12)) downto (get_compact_LSB_IO(C_INPUT_SCALAR_DWIDTH, 12)));
    end generate ISCALER_13_GEN;    
    
    ISCALER_14_GEN : if (C_N_INOUT_SCALARS > 5) generate
    begin
        ap_iscalar_13_dout <= ap_iscalar_dout_i((get_compact_MSB_IO(C_INPUT_SCALAR_DWIDTH, 13)) downto (get_compact_LSB_IO(C_INPUT_SCALAR_DWIDTH, 13)));
    end generate ISCALER_14_GEN;    
    
    ISCALER_15_GEN : if (C_N_INOUT_SCALARS > 6) generate
    begin
        ap_iscalar_14_dout <= ap_iscalar_dout_i((get_compact_MSB_IO(C_INPUT_SCALAR_DWIDTH, 14)) downto (get_compact_LSB_IO(C_INPUT_SCALAR_DWIDTH, 14)));
    end generate ISCALER_15_GEN;    
    
    ISCALER_16_GEN : if (C_N_INOUT_SCALARS > 7) generate
    begin
        ap_iscalar_15_dout <= ap_iscalar_dout_i((get_compact_MSB_IO(C_INPUT_SCALAR_DWIDTH, 15)) downto (get_compact_LSB_IO(C_INPUT_SCALAR_DWIDTH, 15)));
    end generate ISCALER_16_GEN;    
 
 
 
  
                     
    -----------------------------------------------------------------------------------------
    -- AXI4-Stream Slave interface signal Generation
    -- Single stremaing clock and reset port exposed to user. Asynchronous clocks between the 
    -- different streaming channel not supported
    -----------------------------------------------------------------------------------------
    SINGLE_CLK_RST_GEN : if (C_ENABLE_STREAM_CLK = 0) generate

      s_axis_aclk_i(0) <= s_axis_aclk;
      s_axis_aclk_i(1) <= s_axis_aclk;
      s_axis_aclk_i(2) <= s_axis_aclk;
      s_axis_aclk_i(3) <= s_axis_aclk;
      s_axis_aclk_i(4) <= s_axis_aclk;
      s_axis_aclk_i(5) <= s_axis_aclk;
      s_axis_aclk_i(6) <= s_axis_aclk;
      s_axis_aclk_i(7) <= s_axis_aclk;

      s_axis_aresetn_i(0) <= s_axis_aresetn;
      s_axis_aresetn_i(1) <= s_axis_aresetn;
      s_axis_aresetn_i(2) <= s_axis_aresetn;
      s_axis_aresetn_i(3) <= s_axis_aresetn;
      s_axis_aresetn_i(4) <= s_axis_aresetn;
      s_axis_aresetn_i(5) <= s_axis_aresetn;
      s_axis_aresetn_i(6) <= s_axis_aresetn;
      s_axis_aresetn_i(7) <= s_axis_aresetn;

      m_axis_aclk_i(0) <= m_axis_aclk;
      m_axis_aclk_i(1) <= m_axis_aclk;
      m_axis_aclk_i(2) <= m_axis_aclk;
      m_axis_aclk_i(3) <= m_axis_aclk;
      m_axis_aclk_i(4) <= m_axis_aclk;
      m_axis_aclk_i(5) <= m_axis_aclk;
      m_axis_aclk_i(6) <= m_axis_aclk;
      m_axis_aclk_i(7) <= m_axis_aclk;

      m_axis_aresetn_i(0) <= m_axis_aresetn;
      m_axis_aresetn_i(1) <= m_axis_aresetn;
      m_axis_aresetn_i(2) <= m_axis_aresetn;
      m_axis_aresetn_i(3) <= m_axis_aresetn;
      m_axis_aresetn_i(4) <= m_axis_aresetn;
      m_axis_aresetn_i(5) <= m_axis_aresetn;
      m_axis_aresetn_i(6) <= m_axis_aresetn;
      m_axis_aresetn_i(7) <= m_axis_aresetn;
      
    end generate SINGLE_CLK_RST_GEN;    


    -----------------------------------------------------------------------------------------
    -- AXI4-Stream Slave interface signal Generation
    -- Asynchronous clocks between the different streaming channel supported
    -----------------------------------------------------------------------------------------
    ASYNC_CLK_RST_GEN : if (C_ENABLE_STREAM_CLK = 1) generate

      s_axis_aclk_i(0) <= s_axis_0_aclk;
      s_axis_aclk_i(1) <= s_axis_1_aclk;
      s_axis_aclk_i(2) <= s_axis_2_aclk;
      s_axis_aclk_i(3) <= s_axis_3_aclk;
      s_axis_aclk_i(4) <= s_axis_4_aclk;
      s_axis_aclk_i(5) <= s_axis_5_aclk;
      s_axis_aclk_i(6) <= s_axis_6_aclk;
      s_axis_aclk_i(7) <= s_axis_7_aclk;

      s_axis_aresetn_i(0) <= s_axis_0_aresetn;
      s_axis_aresetn_i(1) <= s_axis_1_aresetn;
      s_axis_aresetn_i(2) <= s_axis_2_aresetn;
      s_axis_aresetn_i(3) <= s_axis_3_aresetn;
      s_axis_aresetn_i(4) <= s_axis_4_aresetn;
      s_axis_aresetn_i(5) <= s_axis_5_aresetn;
      s_axis_aresetn_i(6) <= s_axis_6_aresetn;
      s_axis_aresetn_i(7) <= s_axis_7_aresetn;

      m_axis_aclk_i(0) <= m_axis_0_aclk;
      m_axis_aclk_i(1) <= m_axis_1_aclk;
      m_axis_aclk_i(2) <= m_axis_2_aclk;
      m_axis_aclk_i(3) <= m_axis_3_aclk;
      m_axis_aclk_i(4) <= m_axis_4_aclk;
      m_axis_aclk_i(5) <= m_axis_5_aclk;
      m_axis_aclk_i(6) <= m_axis_6_aclk;
      m_axis_aclk_i(7) <= m_axis_7_aclk;

      m_axis_aresetn_i(0) <= m_axis_0_aresetn;
      m_axis_aresetn_i(1) <= m_axis_1_aresetn;
      m_axis_aresetn_i(2) <= m_axis_2_aresetn;
      m_axis_aresetn_i(3) <= m_axis_3_aresetn;
      m_axis_aresetn_i(4) <= m_axis_4_aresetn;
      m_axis_aresetn_i(5) <= m_axis_5_aresetn;
      m_axis_aresetn_i(6) <= m_axis_6_aresetn;
      m_axis_aresetn_i(7) <= m_axis_7_aresetn;

    end generate ASYNC_CLK_RST_GEN;    
    

    -------------------------------------------------------------------------------------------------
    -- Assiging default value '1' when TSTRB and TKEEP signals are not present in the Input stream. 
    -- When Input stream STROBE and KEEP are available, no need to drive default values. 
    -- This is work around to resolve the Vivado wrapper issue which does not drive default input '1' 
    -- properly when signla widht is less than 4 bits.
    -------------------------------------------------------------------------------------------------
    EN_TSTRB_GEN : if (C_S_AXIS_HAS_TSTRB = 1) generate
      s_axis_tstrb(C_S_AXIS_TSTRB_WIDTH*(0+1)-1 downto C_S_AXIS_TSTRB_WIDTH*0) <= s_axis_0_tstrb;
      s_axis_tstrb(C_S_AXIS_TSTRB_WIDTH*(1+1)-1 downto C_S_AXIS_TSTRB_WIDTH*1) <= s_axis_1_tstrb;
      s_axis_tstrb(C_S_AXIS_TSTRB_WIDTH*(2+1)-1 downto C_S_AXIS_TSTRB_WIDTH*2) <= s_axis_2_tstrb;
      s_axis_tstrb(C_S_AXIS_TSTRB_WIDTH*(3+1)-1 downto C_S_AXIS_TSTRB_WIDTH*3) <= s_axis_3_tstrb;
      s_axis_tstrb(C_S_AXIS_TSTRB_WIDTH*(4+1)-1 downto C_S_AXIS_TSTRB_WIDTH*4) <= s_axis_4_tstrb;
      s_axis_tstrb(C_S_AXIS_TSTRB_WIDTH*(5+1)-1 downto C_S_AXIS_TSTRB_WIDTH*5) <= s_axis_5_tstrb;
      s_axis_tstrb(C_S_AXIS_TSTRB_WIDTH*(6+1)-1 downto C_S_AXIS_TSTRB_WIDTH*6) <= s_axis_6_tstrb;
      s_axis_tstrb(C_S_AXIS_TSTRB_WIDTH*(7+1)-1 downto C_S_AXIS_TSTRB_WIDTH*7) <= s_axis_7_tstrb;
    end generate EN_TSTRB_GEN;    
  
    NO_TSTRB_GEN : if (C_S_AXIS_HAS_TSTRB = 0) generate
      s_axis_tstrb <= (others => '1') ;
    end generate NO_TSTRB_GEN;    


    -- TKEEP generation
    EN_TKEEP_GEN : if (C_S_AXIS_HAS_TKEEP = 1) generate
      s_axis_tkeep(C_S_AXIS_TKEEP_WIDTH*(0+1)-1 downto C_S_AXIS_TKEEP_WIDTH*0) <= s_axis_0_tkeep;
      s_axis_tkeep(C_S_AXIS_TKEEP_WIDTH*(1+1)-1 downto C_S_AXIS_TKEEP_WIDTH*1) <= s_axis_1_tkeep;
      s_axis_tkeep(C_S_AXIS_TKEEP_WIDTH*(2+1)-1 downto C_S_AXIS_TKEEP_WIDTH*2) <= s_axis_2_tkeep;
      s_axis_tkeep(C_S_AXIS_TKEEP_WIDTH*(3+1)-1 downto C_S_AXIS_TKEEP_WIDTH*3) <= s_axis_3_tkeep;
      s_axis_tkeep(C_S_AXIS_TKEEP_WIDTH*(4+1)-1 downto C_S_AXIS_TKEEP_WIDTH*4) <= s_axis_4_tkeep;
      s_axis_tkeep(C_S_AXIS_TKEEP_WIDTH*(5+1)-1 downto C_S_AXIS_TKEEP_WIDTH*5) <= s_axis_5_tkeep;
      s_axis_tkeep(C_S_AXIS_TKEEP_WIDTH*(6+1)-1 downto C_S_AXIS_TKEEP_WIDTH*6) <= s_axis_6_tkeep;
      s_axis_tkeep(C_S_AXIS_TKEEP_WIDTH*(7+1)-1 downto C_S_AXIS_TKEEP_WIDTH*7) <= s_axis_7_tkeep;
    end generate EN_TKEEP_GEN;    
  
    NO_TKEEP_GEN : if (C_S_AXIS_HAS_TKEEP = 0) generate
      s_axis_tkeep <= (others => '1') ;
    end generate NO_TKEEP_GEN;    


    -----------------------------------------------------------------------------------------
    -- AXI4-Stream Slave interface signal Generation
    -- SUPERBUSES BUILDING: SLAVE AXI STREAMS (INPUT ARGUMENTS):
    -- NOTE FOR SIMULATION: This concatenation inserts a delta delay for clocks signals. In
    -- the case of input signals causality is preserved becouse another delta delay is
    -- inserted during their concatenation. For input signals, there is no problem
    -----------------------------------------------------------------------------------------
    --AXI4-Stream slave interface TVALID generation
    s_axis_tvalid(0) <= s_axis_0_tvalid;
    s_axis_tvalid(1) <= s_axis_1_tvalid;
    s_axis_tvalid(2) <= s_axis_2_tvalid;
    s_axis_tvalid(3) <= s_axis_3_tvalid;
    s_axis_tvalid(4) <= s_axis_4_tvalid;
    s_axis_tvalid(5) <= s_axis_5_tvalid;
    s_axis_tvalid(6) <= s_axis_6_tvalid;
    s_axis_tvalid(7) <= s_axis_7_tvalid;

    --AXI4-Stream slave interface TREADY generation
    s_axis_0_tready <= s_axis_tready(0);
    s_axis_1_tready <= s_axis_tready(1);
    s_axis_2_tready <= s_axis_tready(2);
    s_axis_3_tready <= s_axis_tready(3);
    s_axis_4_tready <= s_axis_tready(4);
    s_axis_5_tready <= s_axis_tready(5);
    s_axis_6_tready <= s_axis_tready(6);
    s_axis_7_tready <= s_axis_tready(7);

    --AXI4-Stream slave interface TDATA generation
    s_axis_tdata(C_S_AXIS_TDATA_WIDTH*(0+1)-1 downto C_S_AXIS_TDATA_WIDTH*0) <= s_axis_0_tdata;
    s_axis_tdata(C_S_AXIS_TDATA_WIDTH*(1+1)-1 downto C_S_AXIS_TDATA_WIDTH*1) <= s_axis_1_tdata;
    s_axis_tdata(C_S_AXIS_TDATA_WIDTH*(2+1)-1 downto C_S_AXIS_TDATA_WIDTH*2) <= s_axis_2_tdata;
    s_axis_tdata(C_S_AXIS_TDATA_WIDTH*(3+1)-1 downto C_S_AXIS_TDATA_WIDTH*3) <= s_axis_3_tdata;
    s_axis_tdata(C_S_AXIS_TDATA_WIDTH*(4+1)-1 downto C_S_AXIS_TDATA_WIDTH*4) <= s_axis_4_tdata;
    s_axis_tdata(C_S_AXIS_TDATA_WIDTH*(5+1)-1 downto C_S_AXIS_TDATA_WIDTH*5) <= s_axis_5_tdata;
    s_axis_tdata(C_S_AXIS_TDATA_WIDTH*(6+1)-1 downto C_S_AXIS_TDATA_WIDTH*6) <= s_axis_6_tdata;
    s_axis_tdata(C_S_AXIS_TDATA_WIDTH*(7+1)-1 downto C_S_AXIS_TDATA_WIDTH*7) <= s_axis_7_tdata;

    --AXI4-Stream slave interface TLAST generation
    s_axis_tlast(0) <= s_axis_0_tlast;
    s_axis_tlast(1) <= s_axis_1_tlast;
    s_axis_tlast(2) <= s_axis_2_tlast;
    s_axis_tlast(3) <= s_axis_3_tlast;
    s_axis_tlast(4) <= s_axis_4_tlast;
    s_axis_tlast(5) <= s_axis_5_tlast;
    s_axis_tlast(6) <= s_axis_6_tlast;
    s_axis_tlast(7) <= s_axis_7_tlast;

    --AXI4-Stream slave interface TID generation
    s_axis_tid(C_S_AXIS_TID_WIDTH*(0+1)-1 downto C_S_AXIS_TID_WIDTH*0) <= s_axis_0_tid;
    s_axis_tid(C_S_AXIS_TID_WIDTH*(1+1)-1 downto C_S_AXIS_TID_WIDTH*1) <= s_axis_1_tid;
    s_axis_tid(C_S_AXIS_TID_WIDTH*(2+1)-1 downto C_S_AXIS_TID_WIDTH*2) <= s_axis_2_tid;
    s_axis_tid(C_S_AXIS_TID_WIDTH*(3+1)-1 downto C_S_AXIS_TID_WIDTH*3) <= s_axis_3_tid;
    s_axis_tid(C_S_AXIS_TID_WIDTH*(4+1)-1 downto C_S_AXIS_TID_WIDTH*4) <= s_axis_4_tid;
    s_axis_tid(C_S_AXIS_TID_WIDTH*(5+1)-1 downto C_S_AXIS_TID_WIDTH*5) <= s_axis_5_tid;
    s_axis_tid(C_S_AXIS_TID_WIDTH*(6+1)-1 downto C_S_AXIS_TID_WIDTH*6) <= s_axis_6_tid;
    s_axis_tid(C_S_AXIS_TID_WIDTH*(7+1)-1 downto C_S_AXIS_TID_WIDTH*7) <= s_axis_7_tid;

    --AXI4-Stream slave interface TDEST generation
    s_axis_tdest(C_S_AXIS_TDEST_WIDTH*(0+1)-1 downto C_S_AXIS_TDEST_WIDTH*0) <= s_axis_0_tdest;
    s_axis_tdest(C_S_AXIS_TDEST_WIDTH*(1+1)-1 downto C_S_AXIS_TDEST_WIDTH*1) <= s_axis_1_tdest;
    s_axis_tdest(C_S_AXIS_TDEST_WIDTH*(2+1)-1 downto C_S_AXIS_TDEST_WIDTH*2) <= s_axis_2_tdest;
    s_axis_tdest(C_S_AXIS_TDEST_WIDTH*(3+1)-1 downto C_S_AXIS_TDEST_WIDTH*3) <= s_axis_3_tdest;
    s_axis_tdest(C_S_AXIS_TDEST_WIDTH*(4+1)-1 downto C_S_AXIS_TDEST_WIDTH*4) <= s_axis_4_tdest;
    s_axis_tdest(C_S_AXIS_TDEST_WIDTH*(5+1)-1 downto C_S_AXIS_TDEST_WIDTH*5) <= s_axis_5_tdest;
    s_axis_tdest(C_S_AXIS_TDEST_WIDTH*(6+1)-1 downto C_S_AXIS_TDEST_WIDTH*6) <= s_axis_6_tdest;
    s_axis_tdest(C_S_AXIS_TDEST_WIDTH*(7+1)-1 downto C_S_AXIS_TDEST_WIDTH*7) <= s_axis_7_tdest;

    --AXI4-Stream slave interface TUSER generation
    s_axis_tuser(C_S_AXIS_TUSER_WIDTH*(0+1)-1 downto C_S_AXIS_TUSER_WIDTH*0) <= s_axis_0_tuser;
    s_axis_tuser(C_S_AXIS_TUSER_WIDTH*(1+1)-1 downto C_S_AXIS_TUSER_WIDTH*1) <= s_axis_1_tuser;
    s_axis_tuser(C_S_AXIS_TUSER_WIDTH*(2+1)-1 downto C_S_AXIS_TUSER_WIDTH*2) <= s_axis_2_tuser;
    s_axis_tuser(C_S_AXIS_TUSER_WIDTH*(3+1)-1 downto C_S_AXIS_TUSER_WIDTH*3) <= s_axis_3_tuser;
    s_axis_tuser(C_S_AXIS_TUSER_WIDTH*(4+1)-1 downto C_S_AXIS_TUSER_WIDTH*4) <= s_axis_4_tuser;
    s_axis_tuser(C_S_AXIS_TUSER_WIDTH*(5+1)-1 downto C_S_AXIS_TUSER_WIDTH*5) <= s_axis_5_tuser;
    s_axis_tuser(C_S_AXIS_TUSER_WIDTH*(6+1)-1 downto C_S_AXIS_TUSER_WIDTH*6) <= s_axis_6_tuser;
    s_axis_tuser(C_S_AXIS_TUSER_WIDTH*(7+1)-1 downto C_S_AXIS_TUSER_WIDTH*7) <= s_axis_7_tuser;

    -----------------------------------------------------------------------------------------
    -- Accelerator Input Argument interface signal Generation
    -- SUPERBUSES BUILDING: AP INPUT ARGUMENTS:
    -----------------------------------------------------------------------------------------
    -- Input Argument BRAM interface addr generation
    ap_iarg_addr(C_MAX_ARG_AWIDTH*(0+1)-1 downto C_MAX_ARG_AWIDTH*0) <= ap_iarg_0_addr(C_MAX_ARG_AWIDTH+AP_IARG_0_OFFSET-1 downto AP_IARG_0_OFFSET);
    ap_iarg_addr(C_MAX_ARG_AWIDTH*(1+1)-1 downto C_MAX_ARG_AWIDTH*1) <= ap_iarg_1_addr(C_MAX_ARG_AWIDTH+AP_IARG_1_OFFSET-1 downto AP_IARG_1_OFFSET);
    ap_iarg_addr(C_MAX_ARG_AWIDTH*(2+1)-1 downto C_MAX_ARG_AWIDTH*2) <= ap_iarg_2_addr(C_MAX_ARG_AWIDTH+AP_IARG_2_OFFSET-1 downto AP_IARG_2_OFFSET);
    ap_iarg_addr(C_MAX_ARG_AWIDTH*(3+1)-1 downto C_MAX_ARG_AWIDTH*3) <= ap_iarg_3_addr(C_MAX_ARG_AWIDTH+AP_IARG_3_OFFSET-1 downto AP_IARG_3_OFFSET);
    ap_iarg_addr(C_MAX_ARG_AWIDTH*(4+1)-1 downto C_MAX_ARG_AWIDTH*4) <= ap_iarg_4_addr(C_MAX_ARG_AWIDTH+AP_IARG_4_OFFSET-1 downto AP_IARG_4_OFFSET);
    ap_iarg_addr(C_MAX_ARG_AWIDTH*(5+1)-1 downto C_MAX_ARG_AWIDTH*5) <= ap_iarg_5_addr(C_MAX_ARG_AWIDTH+AP_IARG_5_OFFSET-1 downto AP_IARG_5_OFFSET);
    ap_iarg_addr(C_MAX_ARG_AWIDTH*(6+1)-1 downto C_MAX_ARG_AWIDTH*6) <= ap_iarg_6_addr(C_MAX_ARG_AWIDTH+AP_IARG_6_OFFSET-1 downto AP_IARG_6_OFFSET);
    ap_iarg_addr(C_MAX_ARG_AWIDTH*(7+1)-1 downto C_MAX_ARG_AWIDTH*7) <= ap_iarg_7_addr(C_MAX_ARG_AWIDTH+AP_IARG_7_OFFSET-1 downto AP_IARG_7_OFFSET);

    -- Input Argument BRAM interface ce generation
    ap_iarg_ce(0) <= ap_iarg_0_ce;
    ap_iarg_ce(1) <= ap_iarg_1_ce;
    ap_iarg_ce(2) <= ap_iarg_2_ce;
    ap_iarg_ce(3) <= ap_iarg_3_ce;
    ap_iarg_ce(4) <= ap_iarg_4_ce;
    ap_iarg_ce(5) <= ap_iarg_5_ce;
    ap_iarg_ce(6) <= ap_iarg_6_ce;
    ap_iarg_ce(7) <= ap_iarg_7_ce;

    -- Input Argument BRAM interface we generation
    ap_iarg_we(0) <= ap_iarg_0_we(0);
    ap_iarg_we(1) <= ap_iarg_1_we(0);
    ap_iarg_we(2) <= ap_iarg_2_we(0);
    ap_iarg_we(3) <= ap_iarg_3_we(0);
    ap_iarg_we(4) <= ap_iarg_4_we(0);
    ap_iarg_we(5) <= ap_iarg_5_we(0);
    ap_iarg_we(6) <= ap_iarg_6_we(0);
    ap_iarg_we(7) <= ap_iarg_7_we(0);

    -- Input Argument BRAM interface din generation
    ap_iarg_din(C_MAX_ARG_DWIDTH*(0+1)-1 downto C_MAX_ARG_DWIDTH*0) <= ext_lv(ap_iarg_0_din, C_MAX_ARG_DWIDTH);
    ap_iarg_din(C_MAX_ARG_DWIDTH*(1+1)-1 downto C_MAX_ARG_DWIDTH*1) <= ext_lv(ap_iarg_1_din, C_MAX_ARG_DWIDTH);
    ap_iarg_din(C_MAX_ARG_DWIDTH*(2+1)-1 downto C_MAX_ARG_DWIDTH*2) <= ext_lv(ap_iarg_2_din, C_MAX_ARG_DWIDTH);
    ap_iarg_din(C_MAX_ARG_DWIDTH*(3+1)-1 downto C_MAX_ARG_DWIDTH*3) <= ext_lv(ap_iarg_3_din, C_MAX_ARG_DWIDTH);
    ap_iarg_din(C_MAX_ARG_DWIDTH*(4+1)-1 downto C_MAX_ARG_DWIDTH*4) <= ext_lv(ap_iarg_4_din, C_MAX_ARG_DWIDTH);
    ap_iarg_din(C_MAX_ARG_DWIDTH*(5+1)-1 downto C_MAX_ARG_DWIDTH*5) <= ext_lv(ap_iarg_5_din, C_MAX_ARG_DWIDTH);
    ap_iarg_din(C_MAX_ARG_DWIDTH*(6+1)-1 downto C_MAX_ARG_DWIDTH*6) <= ext_lv(ap_iarg_6_din, C_MAX_ARG_DWIDTH);
    ap_iarg_din(C_MAX_ARG_DWIDTH*(7+1)-1 downto C_MAX_ARG_DWIDTH*7) <= ext_lv(ap_iarg_7_din, C_MAX_ARG_DWIDTH);

    -- Input Argument BRAM interface dout generation
    ap_iarg_0_dout <= ap_iarg_dout(C_AP_IARG_0_DWIDTH-1+C_MAX_ARG_DWIDTH*0 downto C_MAX_ARG_DWIDTH*0);
    ap_iarg_1_dout <= ap_iarg_dout(C_AP_IARG_1_DWIDTH-1+C_MAX_ARG_DWIDTH*1 downto C_MAX_ARG_DWIDTH*1);
    ap_iarg_2_dout <= ap_iarg_dout(C_AP_IARG_2_DWIDTH-1+C_MAX_ARG_DWIDTH*2 downto C_MAX_ARG_DWIDTH*2);
    ap_iarg_3_dout <= ap_iarg_dout(C_AP_IARG_3_DWIDTH-1+C_MAX_ARG_DWIDTH*3 downto C_MAX_ARG_DWIDTH*3);
    ap_iarg_4_dout <= ap_iarg_dout(C_AP_IARG_4_DWIDTH-1+C_MAX_ARG_DWIDTH*4 downto C_MAX_ARG_DWIDTH*4);
    ap_iarg_5_dout <= ap_iarg_dout(C_AP_IARG_5_DWIDTH-1+C_MAX_ARG_DWIDTH*5 downto C_MAX_ARG_DWIDTH*5);
    ap_iarg_6_dout <= ap_iarg_dout(C_AP_IARG_6_DWIDTH-1+C_MAX_ARG_DWIDTH*6 downto C_MAX_ARG_DWIDTH*6);
    ap_iarg_7_dout <= ap_iarg_dout(C_AP_IARG_7_DWIDTH-1+C_MAX_ARG_DWIDTH*7 downto C_MAX_ARG_DWIDTH*7);

    
    -- Input Argument FIFO interface dout generation
    ap_fifo_iarg_0_dout <= ap_fifo_iarg_dout(C_AP_IARG_0_DWIDTH-1+C_MAX_ARG_DWIDTH*0 downto C_MAX_ARG_DWIDTH*0);
    ap_fifo_iarg_1_dout <= ap_fifo_iarg_dout(C_AP_IARG_1_DWIDTH-1+C_MAX_ARG_DWIDTH*1 downto C_MAX_ARG_DWIDTH*1);
    ap_fifo_iarg_2_dout <= ap_fifo_iarg_dout(C_AP_IARG_2_DWIDTH-1+C_MAX_ARG_DWIDTH*2 downto C_MAX_ARG_DWIDTH*2);
    ap_fifo_iarg_3_dout <= ap_fifo_iarg_dout(C_AP_IARG_3_DWIDTH-1+C_MAX_ARG_DWIDTH*3 downto C_MAX_ARG_DWIDTH*3);
    ap_fifo_iarg_4_dout <= ap_fifo_iarg_dout(C_AP_IARG_4_DWIDTH-1+C_MAX_ARG_DWIDTH*4 downto C_MAX_ARG_DWIDTH*4);
    ap_fifo_iarg_5_dout <= ap_fifo_iarg_dout(C_AP_IARG_5_DWIDTH-1+C_MAX_ARG_DWIDTH*5 downto C_MAX_ARG_DWIDTH*5);
    ap_fifo_iarg_6_dout <= ap_fifo_iarg_dout(C_AP_IARG_6_DWIDTH-1+C_MAX_ARG_DWIDTH*6 downto C_MAX_ARG_DWIDTH*6);
    ap_fifo_iarg_7_dout <= ap_fifo_iarg_dout(C_AP_IARG_7_DWIDTH-1+C_MAX_ARG_DWIDTH*7 downto C_MAX_ARG_DWIDTH*7);

    -- Input Argument FIFO interface read generation
    ap_fifo_iarg_read(0) <= ap_fifo_iarg_0_read;
    ap_fifo_iarg_read(1) <= ap_fifo_iarg_1_read;
    ap_fifo_iarg_read(2) <= ap_fifo_iarg_2_read;
    ap_fifo_iarg_read(3) <= ap_fifo_iarg_3_read;
    ap_fifo_iarg_read(4) <= ap_fifo_iarg_4_read;
    ap_fifo_iarg_read(5) <= ap_fifo_iarg_5_read;
    ap_fifo_iarg_read(6) <= ap_fifo_iarg_6_read;
    ap_fifo_iarg_read(7) <= ap_fifo_iarg_7_read;

    -- Input Argument FIFO interface empty generation
    ap_fifo_iarg_0_empty_n <= ap_fifo_iarg_empty_n(0);
    ap_fifo_iarg_1_empty_n <= ap_fifo_iarg_empty_n(1);
    ap_fifo_iarg_2_empty_n <= ap_fifo_iarg_empty_n(2);
    ap_fifo_iarg_3_empty_n <= ap_fifo_iarg_empty_n(3);
    ap_fifo_iarg_4_empty_n <= ap_fifo_iarg_empty_n(4);
    ap_fifo_iarg_5_empty_n <= ap_fifo_iarg_empty_n(5);
    ap_fifo_iarg_6_empty_n <= ap_fifo_iarg_empty_n(6);
    ap_fifo_iarg_7_empty_n <= ap_fifo_iarg_empty_n(7);
    
    
    -----------------------------------------------------------------------------------------
    -- AXI4-Stream Slave interface signal Generation
    -- SUPERBUSES BUILDING: MASTER AXI STREAMS (OUTPUT ARGUMENTS):
    -- NOTE FOR SIMULATION: This concatenation inserts a delta delay for clocks signals. In
    -- the case of input signals causality is preserved becouse another delta delay is
    -- inserted during their concatenation. For input signals, there is no problem
    -----------------------------------------------------------------------------------------
    --AXI4-Stream master interface TVALID generation
    m_axis_0_tvalid <= m_axis_tvalid(0);
    m_axis_1_tvalid <= m_axis_tvalid(1);
    m_axis_2_tvalid <= m_axis_tvalid(2);
    m_axis_3_tvalid <= m_axis_tvalid(3);
    m_axis_4_tvalid <= m_axis_tvalid(4);
    m_axis_5_tvalid <= m_axis_tvalid(5);
    m_axis_6_tvalid <= m_axis_tvalid(6);
    m_axis_7_tvalid <= m_axis_tvalid(7);

    --AXI4-Stream master interface TREADY generation
    m_axis_tready(0) <= m_axis_0_tready;
    m_axis_tready(1) <= m_axis_1_tready;
    m_axis_tready(2) <= m_axis_2_tready;
    m_axis_tready(3) <= m_axis_3_tready;
    m_axis_tready(4) <= m_axis_4_tready;
    m_axis_tready(5) <= m_axis_5_tready;
    m_axis_tready(6) <= m_axis_6_tready;
    m_axis_tready(7) <= m_axis_7_tready;

    --AXI4-Stream master interface TDATA generation
    m_axis_0_tdata <= m_axis_tdata(C_M_AXIS_TDATA_WIDTH*(0+1)-1 downto C_M_AXIS_TDATA_WIDTH*0);
    m_axis_1_tdata <= m_axis_tdata(C_M_AXIS_TDATA_WIDTH*(1+1)-1 downto C_M_AXIS_TDATA_WIDTH*1);
    m_axis_2_tdata <= m_axis_tdata(C_M_AXIS_TDATA_WIDTH*(2+1)-1 downto C_M_AXIS_TDATA_WIDTH*2);
    m_axis_3_tdata <= m_axis_tdata(C_M_AXIS_TDATA_WIDTH*(3+1)-1 downto C_M_AXIS_TDATA_WIDTH*3);
    m_axis_4_tdata <= m_axis_tdata(C_M_AXIS_TDATA_WIDTH*(4+1)-1 downto C_M_AXIS_TDATA_WIDTH*4);
    m_axis_5_tdata <= m_axis_tdata(C_M_AXIS_TDATA_WIDTH*(5+1)-1 downto C_M_AXIS_TDATA_WIDTH*5);
    m_axis_6_tdata <= m_axis_tdata(C_M_AXIS_TDATA_WIDTH*(6+1)-1 downto C_M_AXIS_TDATA_WIDTH*6);
    m_axis_7_tdata <= m_axis_tdata(C_M_AXIS_TDATA_WIDTH*(7+1)-1 downto C_M_AXIS_TDATA_WIDTH*7);

    --AXI4-Stream master interface TSTRB generation
    m_axis_0_tstrb <= m_axis_tstrb(C_M_AXIS_TSTRB_WIDTH*(0+1)-1 downto C_M_AXIS_TSTRB_WIDTH*0);
    m_axis_1_tstrb <= m_axis_tstrb(C_M_AXIS_TSTRB_WIDTH*(1+1)-1 downto C_M_AXIS_TSTRB_WIDTH*1);
    m_axis_2_tstrb <= m_axis_tstrb(C_M_AXIS_TSTRB_WIDTH*(2+1)-1 downto C_M_AXIS_TSTRB_WIDTH*2);
    m_axis_3_tstrb <= m_axis_tstrb(C_M_AXIS_TSTRB_WIDTH*(3+1)-1 downto C_M_AXIS_TSTRB_WIDTH*3);
    m_axis_4_tstrb <= m_axis_tstrb(C_M_AXIS_TSTRB_WIDTH*(4+1)-1 downto C_M_AXIS_TSTRB_WIDTH*4);
    m_axis_5_tstrb <= m_axis_tstrb(C_M_AXIS_TSTRB_WIDTH*(5+1)-1 downto C_M_AXIS_TSTRB_WIDTH*5);
    m_axis_6_tstrb <= m_axis_tstrb(C_M_AXIS_TSTRB_WIDTH*(6+1)-1 downto C_M_AXIS_TSTRB_WIDTH*6);
    m_axis_7_tstrb <= m_axis_tstrb(C_M_AXIS_TSTRB_WIDTH*(7+1)-1 downto C_M_AXIS_TSTRB_WIDTH*7);

    --AXI4-Stream master interface TKEEP generation
    m_axis_0_tkeep <= m_axis_tkeep(C_M_AXIS_TKEEP_WIDTH*(0+1)-1 downto C_M_AXIS_TKEEP_WIDTH*0);
    m_axis_1_tkeep <= m_axis_tkeep(C_M_AXIS_TKEEP_WIDTH*(1+1)-1 downto C_M_AXIS_TKEEP_WIDTH*1);
    m_axis_2_tkeep <= m_axis_tkeep(C_M_AXIS_TKEEP_WIDTH*(2+1)-1 downto C_M_AXIS_TKEEP_WIDTH*2);
    m_axis_3_tkeep <= m_axis_tkeep(C_M_AXIS_TKEEP_WIDTH*(3+1)-1 downto C_M_AXIS_TKEEP_WIDTH*3);
    m_axis_4_tkeep <= m_axis_tkeep(C_M_AXIS_TKEEP_WIDTH*(4+1)-1 downto C_M_AXIS_TKEEP_WIDTH*4);
    m_axis_5_tkeep <= m_axis_tkeep(C_M_AXIS_TKEEP_WIDTH*(5+1)-1 downto C_M_AXIS_TKEEP_WIDTH*5);
    m_axis_6_tkeep <= m_axis_tkeep(C_M_AXIS_TKEEP_WIDTH*(6+1)-1 downto C_M_AXIS_TKEEP_WIDTH*6);
    m_axis_7_tkeep <= m_axis_tkeep(C_M_AXIS_TKEEP_WIDTH*(7+1)-1 downto C_M_AXIS_TKEEP_WIDTH*7);

    --AXI4-Stream master interface TLAST generation
    m_axis_0_tlast <= m_axis_tlast(0);
    m_axis_1_tlast <= m_axis_tlast(1);
    m_axis_2_tlast <= m_axis_tlast(2);
    m_axis_3_tlast <= m_axis_tlast(3);
    m_axis_4_tlast <= m_axis_tlast(4);
    m_axis_5_tlast <= m_axis_tlast(5);
    m_axis_6_tlast <= m_axis_tlast(6);
    m_axis_7_tlast <= m_axis_tlast(7);

    --AXI4-Stream master interface TID generation
    m_axis_0_tid <= m_axis_tid(C_M_AXIS_TID_WIDTH*(0+1)-1 downto C_M_AXIS_TID_WIDTH*0);
    m_axis_1_tid <= m_axis_tid(C_M_AXIS_TID_WIDTH*(1+1)-1 downto C_M_AXIS_TID_WIDTH*1);
    m_axis_2_tid <= m_axis_tid(C_M_AXIS_TID_WIDTH*(2+1)-1 downto C_M_AXIS_TID_WIDTH*2);
    m_axis_3_tid <= m_axis_tid(C_M_AXIS_TID_WIDTH*(3+1)-1 downto C_M_AXIS_TID_WIDTH*3);
    m_axis_4_tid <= m_axis_tid(C_M_AXIS_TID_WIDTH*(4+1)-1 downto C_M_AXIS_TID_WIDTH*4);
    m_axis_5_tid <= m_axis_tid(C_M_AXIS_TID_WIDTH*(5+1)-1 downto C_M_AXIS_TID_WIDTH*5);
    m_axis_6_tid <= m_axis_tid(C_M_AXIS_TID_WIDTH*(6+1)-1 downto C_M_AXIS_TID_WIDTH*6);
    m_axis_7_tid <= m_axis_tid(C_M_AXIS_TID_WIDTH*(7+1)-1 downto C_M_AXIS_TID_WIDTH*7);

    --AXI4-Stream master interface TDEST generation
    m_axis_0_tdest <= m_axis_tdest(C_M_AXIS_TDEST_WIDTH*(0+1)-1 downto C_M_AXIS_TDEST_WIDTH*0);
    m_axis_1_tdest <= m_axis_tdest(C_M_AXIS_TDEST_WIDTH*(1+1)-1 downto C_M_AXIS_TDEST_WIDTH*1);
    m_axis_2_tdest <= m_axis_tdest(C_M_AXIS_TDEST_WIDTH*(2+1)-1 downto C_M_AXIS_TDEST_WIDTH*2);
    m_axis_3_tdest <= m_axis_tdest(C_M_AXIS_TDEST_WIDTH*(3+1)-1 downto C_M_AXIS_TDEST_WIDTH*3);
    m_axis_4_tdest <= m_axis_tdest(C_M_AXIS_TDEST_WIDTH*(4+1)-1 downto C_M_AXIS_TDEST_WIDTH*4);
    m_axis_5_tdest <= m_axis_tdest(C_M_AXIS_TDEST_WIDTH*(5+1)-1 downto C_M_AXIS_TDEST_WIDTH*5);
    m_axis_6_tdest <= m_axis_tdest(C_M_AXIS_TDEST_WIDTH*(6+1)-1 downto C_M_AXIS_TDEST_WIDTH*6);
    m_axis_7_tdest <= m_axis_tdest(C_M_AXIS_TDEST_WIDTH*(7+1)-1 downto C_M_AXIS_TDEST_WIDTH*7);

    --AXI4-Stream master interface TKEEP generation
    m_axis_0_tuser <= m_axis_tuser(C_M_AXIS_TUSER_WIDTH*(0+1)-1 downto C_M_AXIS_TUSER_WIDTH*0);
    m_axis_1_tuser <= m_axis_tuser(C_M_AXIS_TUSER_WIDTH*(1+1)-1 downto C_M_AXIS_TUSER_WIDTH*1);
    m_axis_2_tuser <= m_axis_tuser(C_M_AXIS_TUSER_WIDTH*(2+1)-1 downto C_M_AXIS_TUSER_WIDTH*2);
    m_axis_3_tuser <= m_axis_tuser(C_M_AXIS_TUSER_WIDTH*(3+1)-1 downto C_M_AXIS_TUSER_WIDTH*3);
    m_axis_4_tuser <= m_axis_tuser(C_M_AXIS_TUSER_WIDTH*(4+1)-1 downto C_M_AXIS_TUSER_WIDTH*4);
    m_axis_5_tuser <= m_axis_tuser(C_M_AXIS_TUSER_WIDTH*(5+1)-1 downto C_M_AXIS_TUSER_WIDTH*5);
    m_axis_6_tuser <= m_axis_tuser(C_M_AXIS_TUSER_WIDTH*(6+1)-1 downto C_M_AXIS_TUSER_WIDTH*6);
    m_axis_7_tuser <= m_axis_tuser(C_M_AXIS_TUSER_WIDTH*(7+1)-1 downto C_M_AXIS_TUSER_WIDTH*7);

    -----------------------------------------------------------------------------------------
    -- Accelerator Output Argument interface signal Generation
    -- SUPERBUSES BUILDING: AP Output ARGUMENTS:
    -----------------------------------------------------------------------------------------
    -- Output Argument BRAM interface addr generation
    ap_oarg_addr(C_MAX_ARG_AWIDTH*(0+1)-1 downto C_MAX_ARG_AWIDTH*0) <= ap_oarg_0_addr(C_MAX_ARG_AWIDTH+AP_OARG_0_OFFSET-1 downto AP_OARG_0_OFFSET);
    ap_oarg_addr(C_MAX_ARG_AWIDTH*(1+1)-1 downto C_MAX_ARG_AWIDTH*1) <= ap_oarg_1_addr(C_MAX_ARG_AWIDTH+AP_OARG_1_OFFSET-1 downto AP_OARG_1_OFFSET);
    ap_oarg_addr(C_MAX_ARG_AWIDTH*(2+1)-1 downto C_MAX_ARG_AWIDTH*2) <= ap_oarg_2_addr(C_MAX_ARG_AWIDTH+AP_OARG_2_OFFSET-1 downto AP_OARG_2_OFFSET);
    ap_oarg_addr(C_MAX_ARG_AWIDTH*(3+1)-1 downto C_MAX_ARG_AWIDTH*3) <= ap_oarg_3_addr(C_MAX_ARG_AWIDTH+AP_OARG_3_OFFSET-1 downto AP_OARG_3_OFFSET);
    ap_oarg_addr(C_MAX_ARG_AWIDTH*(4+1)-1 downto C_MAX_ARG_AWIDTH*4) <= ap_oarg_4_addr(C_MAX_ARG_AWIDTH+AP_OARG_4_OFFSET-1 downto AP_OARG_4_OFFSET);
    ap_oarg_addr(C_MAX_ARG_AWIDTH*(5+1)-1 downto C_MAX_ARG_AWIDTH*5) <= ap_oarg_5_addr(C_MAX_ARG_AWIDTH+AP_OARG_5_OFFSET-1 downto AP_OARG_5_OFFSET);
    ap_oarg_addr(C_MAX_ARG_AWIDTH*(6+1)-1 downto C_MAX_ARG_AWIDTH*6) <= ap_oarg_6_addr(C_MAX_ARG_AWIDTH+AP_OARG_6_OFFSET-1 downto AP_OARG_6_OFFSET);
    ap_oarg_addr(C_MAX_ARG_AWIDTH*(7+1)-1 downto C_MAX_ARG_AWIDTH*7) <= ap_oarg_7_addr(C_MAX_ARG_AWIDTH+AP_OARG_7_OFFSET-1 downto AP_OARG_7_OFFSET);

    -- Output Argument BRAM interface ce generation
    ap_oarg_ce(0) <= ap_oarg_0_ce;
    ap_oarg_ce(1) <= ap_oarg_1_ce;
    ap_oarg_ce(2) <= ap_oarg_2_ce;
    ap_oarg_ce(3) <= ap_oarg_3_ce;
    ap_oarg_ce(4) <= ap_oarg_4_ce;
    ap_oarg_ce(5) <= ap_oarg_5_ce;
    ap_oarg_ce(6) <= ap_oarg_6_ce;
    ap_oarg_ce(7) <= ap_oarg_7_ce;

    -- Output Argument BRAM interface we generation
    ap_oarg_we(0) <= ap_oarg_0_we(0);
    ap_oarg_we(1) <= ap_oarg_1_we(0);
    ap_oarg_we(2) <= ap_oarg_2_we(0);
    ap_oarg_we(3) <= ap_oarg_3_we(0);
    ap_oarg_we(4) <= ap_oarg_4_we(0);
    ap_oarg_we(5) <= ap_oarg_5_we(0);
    ap_oarg_we(6) <= ap_oarg_6_we(0);
    ap_oarg_we(7) <= ap_oarg_7_we(0);

    -- Output Argument BRAM interface din generation
    ap_oarg_din(C_MAX_ARG_DWIDTH*(0+1)-1 downto C_MAX_ARG_DWIDTH*0) <= ext_lv(ap_oarg_0_din, C_MAX_ARG_DWIDTH);
    ap_oarg_din(C_MAX_ARG_DWIDTH*(1+1)-1 downto C_MAX_ARG_DWIDTH*1) <= ext_lv(ap_oarg_1_din, C_MAX_ARG_DWIDTH);
    ap_oarg_din(C_MAX_ARG_DWIDTH*(2+1)-1 downto C_MAX_ARG_DWIDTH*2) <= ext_lv(ap_oarg_2_din, C_MAX_ARG_DWIDTH);
    ap_oarg_din(C_MAX_ARG_DWIDTH*(3+1)-1 downto C_MAX_ARG_DWIDTH*3) <= ext_lv(ap_oarg_3_din, C_MAX_ARG_DWIDTH);
    ap_oarg_din(C_MAX_ARG_DWIDTH*(4+1)-1 downto C_MAX_ARG_DWIDTH*4) <= ext_lv(ap_oarg_4_din, C_MAX_ARG_DWIDTH);
    ap_oarg_din(C_MAX_ARG_DWIDTH*(5+1)-1 downto C_MAX_ARG_DWIDTH*5) <= ext_lv(ap_oarg_5_din, C_MAX_ARG_DWIDTH);
    ap_oarg_din(C_MAX_ARG_DWIDTH*(6+1)-1 downto C_MAX_ARG_DWIDTH*6) <= ext_lv(ap_oarg_6_din, C_MAX_ARG_DWIDTH);
    ap_oarg_din(C_MAX_ARG_DWIDTH*(7+1)-1 downto C_MAX_ARG_DWIDTH*7) <= ext_lv(ap_oarg_7_din, C_MAX_ARG_DWIDTH);

    -- Output Argument BRAM interface dout generation
    ap_oarg_0_dout <= ap_oarg_dout(C_AP_OARG_0_DWIDTH-1+C_MAX_ARG_DWIDTH*0 downto C_MAX_ARG_DWIDTH*0);
    ap_oarg_1_dout <= ap_oarg_dout(C_AP_OARG_1_DWIDTH-1+C_MAX_ARG_DWIDTH*1 downto C_MAX_ARG_DWIDTH*1);
    ap_oarg_2_dout <= ap_oarg_dout(C_AP_OARG_2_DWIDTH-1+C_MAX_ARG_DWIDTH*2 downto C_MAX_ARG_DWIDTH*2);
    ap_oarg_3_dout <= ap_oarg_dout(C_AP_OARG_3_DWIDTH-1+C_MAX_ARG_DWIDTH*3 downto C_MAX_ARG_DWIDTH*3);
    ap_oarg_4_dout <= ap_oarg_dout(C_AP_OARG_4_DWIDTH-1+C_MAX_ARG_DWIDTH*4 downto C_MAX_ARG_DWIDTH*4);
    ap_oarg_5_dout <= ap_oarg_dout(C_AP_OARG_5_DWIDTH-1+C_MAX_ARG_DWIDTH*5 downto C_MAX_ARG_DWIDTH*5);
    ap_oarg_6_dout <= ap_oarg_dout(C_AP_OARG_6_DWIDTH-1+C_MAX_ARG_DWIDTH*6 downto C_MAX_ARG_DWIDTH*6);
    ap_oarg_7_dout <= ap_oarg_dout(C_AP_OARG_7_DWIDTH-1+C_MAX_ARG_DWIDTH*7 downto C_MAX_ARG_DWIDTH*7);


    -- Output Argument FIFO interface din generation
    ap_fifo_oarg_din(C_AP_OARG_0_DWIDTH-1+C_MAX_ARG_DWIDTH*0 downto C_MAX_ARG_DWIDTH*0) <= ap_fifo_oarg_0_din;
    ap_fifo_oarg_din(C_AP_OARG_1_DWIDTH-1+C_MAX_ARG_DWIDTH*1 downto C_MAX_ARG_DWIDTH*1) <= ap_fifo_oarg_1_din;
    ap_fifo_oarg_din(C_AP_OARG_2_DWIDTH-1+C_MAX_ARG_DWIDTH*2 downto C_MAX_ARG_DWIDTH*2) <= ap_fifo_oarg_2_din;
    ap_fifo_oarg_din(C_AP_OARG_3_DWIDTH-1+C_MAX_ARG_DWIDTH*3 downto C_MAX_ARG_DWIDTH*3) <= ap_fifo_oarg_3_din;
    ap_fifo_oarg_din(C_AP_OARG_4_DWIDTH-1+C_MAX_ARG_DWIDTH*4 downto C_MAX_ARG_DWIDTH*4) <= ap_fifo_oarg_4_din;
    ap_fifo_oarg_din(C_AP_OARG_5_DWIDTH-1+C_MAX_ARG_DWIDTH*5 downto C_MAX_ARG_DWIDTH*5) <= ap_fifo_oarg_5_din;
    ap_fifo_oarg_din(C_AP_OARG_6_DWIDTH-1+C_MAX_ARG_DWIDTH*6 downto C_MAX_ARG_DWIDTH*6) <= ap_fifo_oarg_6_din;
    ap_fifo_oarg_din(C_AP_OARG_7_DWIDTH-1+C_MAX_ARG_DWIDTH*7 downto C_MAX_ARG_DWIDTH*7) <= ap_fifo_oarg_7_din;

    -- Assining unused bits in the vector to default value to reduce synthesis warnings.
    ap_fifo_oarg_din(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*0 downto C_AP_OARG_0_DWIDTH+C_MAX_ARG_DWIDTH*0) <= (others => '0');
    ap_fifo_oarg_din(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*1 downto C_AP_OARG_1_DWIDTH+C_MAX_ARG_DWIDTH*1) <= (others => '0');
    ap_fifo_oarg_din(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*2 downto C_AP_OARG_2_DWIDTH+C_MAX_ARG_DWIDTH*2) <= (others => '0');
    ap_fifo_oarg_din(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*3 downto C_AP_OARG_3_DWIDTH+C_MAX_ARG_DWIDTH*3) <= (others => '0');
    ap_fifo_oarg_din(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*4 downto C_AP_OARG_4_DWIDTH+C_MAX_ARG_DWIDTH*4) <= (others => '0');
    ap_fifo_oarg_din(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*5 downto C_AP_OARG_5_DWIDTH+C_MAX_ARG_DWIDTH*5) <= (others => '0');
    ap_fifo_oarg_din(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*6 downto C_AP_OARG_6_DWIDTH+C_MAX_ARG_DWIDTH*6) <= (others => '0');
    ap_fifo_oarg_din(C_MAX_ARG_DWIDTH-1+C_MAX_ARG_DWIDTH*7 downto C_AP_OARG_7_DWIDTH+C_MAX_ARG_DWIDTH*7) <= (others => '0');


    -- Output Argument FIFO interface fifo_write generation
    ap_fifo_oarg_write(0) <= ap_fifo_oarg_0_write;
    ap_fifo_oarg_write(1) <= ap_fifo_oarg_1_write;
    ap_fifo_oarg_write(2) <= ap_fifo_oarg_2_write;
    ap_fifo_oarg_write(3) <= ap_fifo_oarg_3_write;
    ap_fifo_oarg_write(4) <= ap_fifo_oarg_4_write;
    ap_fifo_oarg_write(5) <= ap_fifo_oarg_5_write;
    ap_fifo_oarg_write(6) <= ap_fifo_oarg_6_write;
    ap_fifo_oarg_write(7) <= ap_fifo_oarg_7_write;

    -- Output Argument FIFO interface fifo_full generation
    ap_fifo_oarg_0_full_n <= ap_fifo_oarg_full_n(0);
    ap_fifo_oarg_1_full_n <= ap_fifo_oarg_full_n(1);
    ap_fifo_oarg_2_full_n <= ap_fifo_oarg_full_n(2);
    ap_fifo_oarg_3_full_n <= ap_fifo_oarg_full_n(3);
    ap_fifo_oarg_4_full_n <= ap_fifo_oarg_full_n(4);
    ap_fifo_oarg_5_full_n <= ap_fifo_oarg_full_n(5);
    ap_fifo_oarg_6_full_n <= ap_fifo_oarg_full_n(6);
    ap_fifo_oarg_7_full_n <= ap_fifo_oarg_full_n(7);

  --------------------------------------------------------------------------------

    -----------------------------------------------------------------------------------------
    -- XD_ADAPTER_CORE_I : Adapter core logic
    -----------------------------------------------------------------------------------------
    XD_ADAPTER_CORE_I : entity axis_accelerator_adapter_v2_1_16.axis_accelerator_adapter_core
    generic map (
      -- System generics:
      C_FAMILY                => C_FAMILY,
      C_BRAM_TYPE             => BRAM_PRIMITIVE_TYPE,
      C_SELECT_XPM            => C_SELECT_XPM,
      C_S_AXI_ADDR_WIDTH      => C_S_AXI_ADDR_WIDTH,
      C_S_AXI_DATA_WIDTH      => C_S_AXI_DATA_WIDTH,
      C_PRMRY_IS_ACLK_ASYNC   => C_PRMRY_IS_ACLK_ASYNC,
      C_MTBF_STAGES           => C_MTBF_STAGES,
      --
      
      C_AP_ADAPTER_ID         => C_AP_ADAPTER_ID,
      C_MAX_SCALAR_DWIDTH     => C_MAX_SCALAR_DWIDTH,
      C_MAX_ARG_DWIDTH        => C_MAX_ARG_DWIDTH,
      C_MAX_ARG_AWIDTH        => C_MAX_ARG_AWIDTH,
      C_MAX_ARG_N_DIM         => C_MAX_ARG_N_DIM,
      C_MAX_MB_DEPTH          => C_MAX_MB_DEPTH,
      C_MAX_N_IARGS           => C_MAX_N_IARGS,
      C_MAX_N_OARGS           => C_MAX_N_OARGS,
      C_MAX_N_ISCALARS        => C_MAX_N_ISCALARS+C_MAX_N_IOSCALARS,
      C_MAX_N_OSCALARS        => C_MAX_N_OSCALARS+C_MAX_N_IOSCALARS,
      C_MAX_N_IOSCALARS       => C_MAX_N_IOSCALARS,
      --
      C_N_INPUT_ARGS          => C_N_INPUT_ARGS,
      C_N_OUTPUT_ARGS         => C_N_OUTPUT_ARGS,
      --
      C_S_AXIS_TDATA_WIDTH    => C_S_AXIS_TDATA_WIDTH,
      C_S_AXIS_TUSER_WIDTH    => C_S_AXIS_TUSER_WIDTH,
      C_S_AXIS_TID_WIDTH      => C_S_AXIS_TID_WIDTH,
      C_S_AXIS_TDEST_WIDTH    => C_S_AXIS_TDEST_WIDTH,
      --
      C_AP_IARG_TYPE          => C_AP_IARG_TYPE,
      C_AP_IARG_DWIDTH        => C_AP_IARG_DWIDTH,
      C_AP_IARG_MB_DEPTH      => C_AP_IARG_MB_DEPTH,
      --
      C_AP_IARG_WIDTH         => C_AP_IARG_WIDTH,
      C_AP_IARG_N_DIM         => C_AP_IARG_N_DIM,
      C_AP_IARG_DIM_1         => C_AP_IARG_DIM_1,
      C_AP_IARG_DIM_2         => C_AP_IARG_DIM_2,
      C_AP_IARG_FORMAT_TYPE   => C_AP_IARG_FORMAT_TYPE,
      C_AP_IARG_FORMAT_FACTOR => C_AP_IARG_FORMAT_FACTOR,
      C_AP_IARG_FORMAT_DIM    => C_AP_IARG_FORMAT_DIM,
      --
      C_M_AXIS_TDATA_WIDTH    => C_M_AXIS_TDATA_WIDTH,
      C_M_AXIS_TUSER_WIDTH    => C_M_AXIS_TUSER_WIDTH,
      C_M_AXIS_TID_WIDTH      => C_M_AXIS_TID_WIDTH,
      C_M_AXIS_TDEST_WIDTH    => C_M_AXIS_TDEST_WIDTH,
      --
      C_AP_OARG_TYPE          => C_AP_OARG_TYPE,
      C_AP_OARG_DWIDTH        => C_AP_OARG_DWIDTH,
      C_AP_OARG_MB_DEPTH      => C_AP_OARG_MB_DEPTH,
      --
      C_AP_OARG_WIDTH         => C_AP_OARG_WIDTH,
      C_AP_OARG_N_DIM         => C_AP_OARG_N_DIM,
      C_AP_OARG_DIM           => C_AP_OARG_DIM,
      C_AP_OARG_DIM_1         => C_AP_OARG_DIM_1,
      C_AP_OARG_DIM_2         => C_AP_OARG_DIM_2,
      C_AP_OARG_FORMAT_TYPE   => C_AP_OARG_FORMAT_TYPE,
      C_AP_OARG_FORMAT_FACTOR => C_AP_OARG_FORMAT_FACTOR,
      C_AP_OARG_FORMAT_DIM    => C_AP_OARG_FORMAT_DIM,
      --
      C_N_INOUT_SCALARS       => C_N_INOUT_SCALARS,
      C_N_INPUT_SCALARS       => C_N_INPUT_SCALARS,
      C_INPUT_SCALAR_DWIDTH   => C_INPUT_SCALAR_DWIDTH,
      C_AP_ISCALAR_DOUT_WIDTH => C_AP_ISCALAR_DOUT_WIDTH,
      C_INPUT_SCALAR_MODE     => C_INPUT_SCALAR_MODE,      
      --
      C_OUTPUT_SCALAR_MODE    => C_OUTPUT_SCALAR_MODE,
      C_N_OUTPUT_SCALARS      => C_N_OUTPUT_SCALARS,
      C_OUTPUT_SCALAR_DWIDTH  => C_OUTPUT_SCALAR_DWIDTH,
      C_AP_OSCALAR_DIN_WIDTH  => C_AP_OSCALAR_DIN_WIDTH,
      C_AP_ISCALAR_IO_DOUT_WIDTH  => C_AP_ISCALAR_IO_DOUT_WIDTH,
      C_AP_OSCALAR_IO_DIN_WIDTH  => C_AP_OSCALAR_IO_DIN_WIDTH)
    port map (
      -- SLAVE AXI LITE:
      s_axi_aclk           => s_axi_aclk,
      s_axi_aresetn        => s_axi_aresetn,
      s_axi_awaddr         => s_axi_awaddr,
      s_axi_awvalid        => s_axi_awvalid,
      s_axi_awready        => s_axi_awready,
      s_axi_wdata          => s_axi_wdata,
      s_axi_wstrb          => s_axi_wstrb,
      s_axi_wvalid         => s_axi_wvalid,
      s_axi_wready         => s_axi_wready,
      s_axi_bresp          => s_axi_bresp,
      s_axi_bvalid         => s_axi_bvalid,
      s_axi_bready         => s_axi_bready,
      s_axi_araddr         => s_axi_araddr,
      s_axi_arvalid        => s_axi_arvalid,
      s_axi_arready        => s_axi_arready,
      s_axi_rdata          => s_axi_rdata,
      s_axi_rresp          => s_axi_rresp,
      s_axi_rvalid         => s_axi_rvalid,
      s_axi_rready         => s_axi_rready,
      --- Slave AXI streams (input arguments)
      s_axis_aclk          => s_axis_aclk_i,
      s_axis_aresetn       => s_axis_aresetn_i,
      s_axis_tvalid        => s_axis_tvalid,
      s_axis_tready        => s_axis_tready,
      s_axis_tdata         => s_axis_tdata,
      s_axis_tstrb         => s_axis_tstrb,
      s_axis_tkeep         => s_axis_tkeep,
      s_axis_tlast         => s_axis_tlast,
      s_axis_tid           => s_axis_tid,
      s_axis_tdest         => s_axis_tdest,
      s_axis_tuser         => s_axis_tuser,
      --- AP input arguments
      ap_iarg_addr         => ap_iarg_addr,
      ap_iarg_ce           => ap_iarg_ce,
      ap_iarg_we           => ap_iarg_we,
      ap_iarg_din          => ap_iarg_din,
      ap_iarg_dout         => ap_iarg_dout,
      ---
      ap_fifo_iarg_dout    => ap_fifo_iarg_dout,
      ap_fifo_iarg_read    => ap_fifo_iarg_read,
      ap_fifo_iarg_empty_n => ap_fifo_iarg_empty_n,
      --- Master AXI streams (output arguments)
      m_axis_aclk          => m_axis_aclk_i,
      m_axis_aresetn       => m_axis_aresetn_i,
      m_axis_tvalid        => m_axis_tvalid,
      m_axis_tready        => m_axis_tready,
      m_axis_tdata         => m_axis_tdata,
      m_axis_tstrb         => m_axis_tstrb,
      m_axis_tkeep         => m_axis_tkeep,
      m_axis_tlast         => m_axis_tlast,
      m_axis_tid           => m_axis_tid,
      m_axis_tdest         => m_axis_tdest,
      m_axis_tuser         => m_axis_tuser,
      --- AP output arguments
      ap_oarg_addr         => ap_oarg_addr,
      ap_oarg_ce           => ap_oarg_ce,
      ap_oarg_we           => ap_oarg_we,
      ap_oarg_din          => ap_oarg_din,
      ap_oarg_dout         => ap_oarg_dout,
      ---
      ap_fifo_oarg_din     => ap_fifo_oarg_din,
      ap_fifo_oarg_write   => ap_fifo_oarg_write,
      ap_fifo_oarg_full_n  => ap_fifo_oarg_full_n,
      ---
      ap_clk               => aclk,
      ap_rst               => aresetn,
      -- AP control handshaking:
      ap_start             => ap_start,
      ap_ready             => ap_ready,
      ap_done              => ap_done,
      ap_continue          => ap_continue,
      ap_idle              => ap_idle,
      ---
      ap_iscalar_dout      => ap_iscalar_dout_i,
      ap_oscalar_din       => ap_oscalar_din_i,
      ap_oscalar_vld       => ap_oscalar_vld_i,
      ap_oscalar_ack       => ap_oscalar_ack_i,
      ap_iscalar_vld       => ap_iscalar_vld_i,
      ap_iscalar_ack       => ap_iscalar_ack_i,
      ---
      interrupt            => interrupt);


end rtl;



