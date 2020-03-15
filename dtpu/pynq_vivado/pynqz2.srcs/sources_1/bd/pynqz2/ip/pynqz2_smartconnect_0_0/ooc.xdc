# aclk {FREQ_HZ 50000000 CLK_DOMAIN pynqz2_ps7_0_FCLK_CLK0 PHASE 0.000}
# Clock Domain: pynqz2_ps7_0_FCLK_CLK0
create_clock -name aclk -period 20,000 [get_ports aclk]
# Generated clocks
