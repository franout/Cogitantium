onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+pynqz2 -L xilinx_vip -L xil_defaultlib -L xpm -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_5 -L processing_system7_vip_v1_0_7 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L xlconstant_v1_1_6 -L xlconcat_v2_1_3 -L smartconnect_v1_0 -L generic_baseblocks_v2_1_0 -L fifo_generator_v13_2_4 -L axi_data_fifo_v2_1_18 -L axi_register_slice_v2_1_19 -L axi_protocol_converter_v2_1_19 -L lib_pkg_v1_0_2 -L axi_apb_bridge_v3_0_15 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.pynqz2 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {pynqz2.udo}

run -all

endsim

quit -force
