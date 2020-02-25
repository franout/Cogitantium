# aclk {FREQ_HZ 30303030 CLK_DOMAIN pynqz2_ps7_0_FCLK_CLK0 PHASE 0.000} aclk1 {FREQ_HZ 30303030 CLK_DOMAIN pynqz2_ps7_0_FCLK_CLK0 PHASE 0.000}
# Clock Domain: pynqz2_ps7_0_FCLK_CLK0
create_clock -name aclk -period 33,000 [get_ports aclk]
# Generated clocks
create_generated_clock -name aclk1 -source [get_ports aclk] -divide_by 1 [get_ports aclk1]
