set_property SRC_FILE_INFO {cfile:d:/uni/2019-2020/thesis/cogitantium/nvdla/project_2/project_2.srcs/sources_1/ip/reset_system/reset_system/reset_system_in_context.xdc rfile:../../../../../project_2.srcs/sources_1/ip/reset_system/reset_system/reset_system_in_context.xdc id:1 order:EARLY scoped_inst:top_reset_system} [current_design]
set_property SRC_FILE_INFO {cfile:d:/uni/2019-2020/thesis/cogitantium/nvdla/project_2/project_2.srcs/sources_1/ip/processing_system7_0_1/processing_system7_0.xdc rfile:../../../../../project_2.srcs/sources_1/ip/processing_system7_0_1/processing_system7_0.xdc id:2 order:EARLY scoped_inst:cores_and_memory_controller/inst} [current_design]
set_property SRC_FILE_INFO {cfile:D:/uni/2019-2020/thesis/cogitantium/nvdla/project_2/project_2.runs/synth_1/dont_touch.xdc rfile:../../../dont_touch.xdc id:3} [current_design]
current_instance top_reset_system
set_property src_info {type:SCOPED_XDC file:1 line:1 export:INPUT save:INPUT read:READ} [current_design]
set_property CLOCK_PERIOD_OOC_TARGET 10 [get_ports -scoped_to_current_instance slowest_sync_clk]
current_instance
set_property src_info {type:SCOPED_XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property IS_IP_OOC_CELL true [get_cells top_reset_system]
current_instance cores_and_memory_controller/inst
set_property src_info {type:SCOPED_XDC file:2 line:20 export:INPUT save:INPUT read:READ} [current_design]
create_clock -period 20.000 -name clk_fpga_0 [get_pins {PS7_i/FCLKCLK[0]}]
current_instance
set_property src_info {type:XDC file:3 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property DONT_TOUCH true [get_cells cores_and_memory_controller/inst]
set_property src_info {type:TCL file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
set_property DONT_TOUCH true [get_cells cores_and_memory_controller]
set_property src_info {type:TCL file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
set_property DONT_TOUCH true [get_cells top_reset_system]
