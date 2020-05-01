//==================================================================================================
//  Filename      : dsp_smul_32.v
//  Created On    : 2020-05-01 19:05:16
//  Last Modified : 2020-05-01 22:57:25
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology,Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com - angione@student.chalmers.se - s262620@studenti.polito.it
//
//  Description   : 
//
//
//=================================================================================================
`timescale 1ns/1ps
module  dsp_smul_32 (

input CLK,
input CE,
input SCLR,
input [47:0]PCIN,
input SEL,
input [31:0]A,
input [31:0]B,
output reg signed [31:0]P
	);

reg signed [31:0] a_i;
reg signed [31:0] b_i;
reg signed [31:0] mult_res;

always @(posedge clk) begin : proc_
	if(SCLR) begin
		a_i <= 0;b_i <= 0;mul_temp <= 0;P<=0;
	end else begin
		 if(CE) begin 
		 	if(!SEL) begin
		 		// no chain 
		 		a_i<=A;
		 		b_i<=B;
		 		mult_res<=a_i*b_i;
		 		P<=mult_res;
		 	end else begin 
		 		// chain 
				a_i<=A;
		 		b_i<=B;
		 		mult_res<=a_i*b_i;
		 		P<=mult_res+PCIN[31:0]; // shifted outside
		 	end 

		 end else begin 
		 	a_i <= 0;b_i <= 0;mul_temp <= 0;P<=0;
		 end 
	end
end

endmodule : dsp_smul_32


/*
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--ENTITY declaration
ENTITY dsp_smul_32 is
GENERIC(
CONSTANT SIZEIN : NATURAL := 32; -- Input size
CONSTANT SIZEOUT : NATURAL := 32 -- Output size
);
PORT(
clk : in STD_LOGIC; -- Clock
resetn_glb : in STD_LOGIC; -- Global Reset
operand_i : in STD_LOGIC_VECTOR (SIZEIN-1 downto 0); -- 1st input to Multiplier(from Input cache)
operand_w : in STD_LOGIC_VECTOR (SIZEIN-1 downto 0); -- 2nd input to Multiplier(from Weight cache)
base_mul_out : out STD_LOGIC_VECTOR (SIZEOUT-1 downto 0) -- Multiplier dot output 1
);
end ENTITY dsp_smul_32;

--Architecture
ARCHITECTURE behav of dsp_smul_32 is
--SIGNAL mul_temp : STD_LOGIC_VECTOR (SIZEOUT-1 downto 0);
SIGNAL mul_temp : STD_LOGIC_VECTOR (64-1 downto 0);

--attribute declaration
attribute USE_DSP : string;
attribute USE_DSP of mul_temp: SIGNAL is "YES";
attribute USE_DSP of operand_i: SIGNAL is "YES";
attribute USE_DSP of operand_w: SIGNAL is "YES";
attribute USE_DSP of base_mul_out: SIGNAL is "YES";

begin

multiply:PROCESS (clk)
begin
if rising_edge(clk) then
if resetn_glb = '1' then --negative assert
mul_temp <= (OTHERS => '0');
else
mul_temp <= std_logic_vector(signed(operand_i) * signed(operand_w));
--mul_temp(63 downto 32) <= std_logic_vector(signed(operand_i) * signed(operand_w1));
end if;
end if;
end PROCESS;

-- Output multiplication result
base_mul_out <= mul_temp(31 downto 0);

end behav;*/