library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real."log2";
use IEEE.math_real."ceil";

entity  pwm_generator IS 
GENERIC (N:integer:=14;
	   pwm_freq        : INTEGER := 1000    --PWM switching frequency in Hz
			);
PORT ( clk,reset,enable: IN std_logic;
	  -- data_in: IN std_logic_vector(N-1 DOWNTO 0);  -- raw data that must be processed
		pwm_out: OUT std_logic
		);
END entity  pwm_generator;

architecture beh of pwm_generator is

CONSTANT max_val: integer:= 100000000/pwm_freq;
CONSTANT num_bits: integer:=integer(ceil(log2(real((max_val-1)))));

signal counter: std_logic_vector( num_bits-1  downto 0);
signal duty: std_logic_vector(num_bits-1 downto 0);
signal data_in: std_logic_vector(n-1 downto 0);
signal ld_val_duty: std_logic:='0';
  begin

PROCESS(clk, reset)
  BEGIN
    IF(reset = '1') THEN                                                 
   	counter<=(OTHERS=>'0');
   	pwm_out<='0';
    ELSIF(clk'EVENT AND clk = '1') THEN                                    
      	IF(enable='1')THEN
      		   	counter<=std_logic_vector(unsigned(counter)+1);
      		   	IF(unsigned(counter)>=unsigned(duty))THEN
				pwm_out<='0';
				ELSE 
				pwm_out<='1';
      		   	END IF;
      	ELSE
      	pwm_out<='0';
      	END IF;
    END IF;
  END PROCESS;


-- register for the duty cycle
PROCESS(clk,reset)
BEGIN
IF(reset='1') THEN
duty<=std_logic_vector(to_unsigned((max_val)/2,num_bits)-1); -- 50 % of default duty cycle
ELSIF( rising_edge(clk)) THEN
	IF(ld_val_duty='1' and enable='1') THEN
	duty<=std_logic_vector(to_unsigned( to_integer(unsigned(data_in))*max_val*100/(2**14)-1,num_bits )) ; 
 	END IF;

END IF;
END PROCESS;


end beh;