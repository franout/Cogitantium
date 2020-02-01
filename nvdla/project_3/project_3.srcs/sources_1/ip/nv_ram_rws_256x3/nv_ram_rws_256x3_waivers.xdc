

set_false_path -from [get_clocks config_clk] -to [get_clocks user_clk]
set_false_path -from [get_clocks user_clk] -to [get_clocks config_clk]


create_waiver -internal -scope -type CDC -id CDC-13 -user uram_read_back  -tags "13590" -from [get_pins -quiet  -hierarchical -filter {NAME =~ *rdb_wrd_fsm_inst/control_int_r_reg/C}] -to [get_pins -quiet  -hierarchical -filter {NAME =~ *uram_rdb_mux_inst/clk_mux_inst/CE0}] -description {Waiving CDC-13 as driving URAM outputs from config clock domain is taken care in the design and it happens only when the corresponding clock is selected}
create_waiver -internal -scope -type CDC -id CDC-13 -user uram_read_back  -tags "13590" -from [get_pins -quiet  -hierarchical -filter {NAME =~ *uram_rdb_mux_inst/*_reg*/C}] -to [get_pins -quiet  -hierarchical -filter {NAME =~ *uram288_prim_inst/*}] -description {Waiving CDC-13 as driving URAM outputs from config clock domain is taken care in the design and it happens only when the corresponding clock is selected}
create_waiver -internal -scope -type CDC -id CDC-14 -user uram_read_back  -tags "13590" -from [get_pins -quiet  -hierarchical -filter {NAME =~ *top_inst/*A_R_reg*/C}] -to [get_pins -quiet  -hierarchical -filter {NAME =~ *uram288_prim_inst/*_A*}] -description {Waiving CDC-13 as driving URAM outputs from config clock domain is taken care in the design and it happens only when the corresponding clock is selected}
create_waiver -internal -scope -type CDC -id CDC-13 -user uram_read_back  -tags "13590" -from [get_pins -quiet  -hierarchical -filter {NAME =~ *top_inst/*A_R_reg*/C}] -to [get_pins -quiet  -hierarchical -filter {NAME =~ *uram288_prim_inst/*_A*}] -description {Waiving CDC-13 as driving URAM outputs from config clock domain is taken care in the design and it happens only when the corresponding clock is selected}


create_waiver -internal -scope -type CDC -id CDC-1 -user uram_read_back  -tags "13590" -from [get_pins -quiet  -hierarchical -filter {NAME =~ *rdb_wrd_fsm_inst/control_int_r_reg/C}] -to [get_pins -quiet  -hierarchical -filter {NAME =~ *uram_rdb_mux_inst/*_reg*/D}] -description {Waiving CDC-1 as driving URAM outputs from config clock domain is taken care in the design and it happens only when the corresponding clock is selected}
create_waiver -internal -scope -type CDC -id CDC-1 -user uram_read_back  -tags "13590" -from [get_pins -quiet  -hierarchical -filter {NAME =~ *rdb_wrd_fsm_inst/control_int_r_reg/C}] -to [get_pins -quiet  -hierarchical -filter {NAME =~ *uram_rdb_mux_inst/*_reg*/R}] -description {Waiving CDC-1 as driving URAM outputs from config clock domain is taken care in the design and it happens only when the corresponding clock is selected}


