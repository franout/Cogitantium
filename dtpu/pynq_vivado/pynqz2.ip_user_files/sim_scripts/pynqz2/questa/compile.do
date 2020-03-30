vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_6
vlib questa_lib/msim/processing_system7_vip_v1_0_8
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/xlconstant_v1_1_6
vlib questa_lib/msim/util_vector_logic_v2_0_1
vlib questa_lib/msim/fifo_generator_v13_1_4
vlib questa_lib/msim/axis_accelerator_adapter_v2_1_16
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/fifo_generator_v13_2_5
vlib questa_lib/msim/lib_fifo_v1_0_14
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/axi_datamover_v5_1_22
vlib questa_lib/msim/axi_sg_v4_1_13
vlib questa_lib/msim/axi_dma_v7_1_21
vlib questa_lib/msim/xlconcat_v2_1_3
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/axi_intc_v4_1_14
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_20
vlib questa_lib/msim/axi_data_fifo_v2_1_19
vlib questa_lib/msim/axi_crossbar_v2_1_21
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/axi_protocol_converter_v2_1_20

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_6 questa_lib/msim/axi_vip_v1_1_6
vmap processing_system7_vip_v1_0_8 questa_lib/msim/processing_system7_vip_v1_0_8
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap xlconstant_v1_1_6 questa_lib/msim/xlconstant_v1_1_6
vmap util_vector_logic_v2_0_1 questa_lib/msim/util_vector_logic_v2_0_1
vmap fifo_generator_v13_1_4 questa_lib/msim/fifo_generator_v13_1_4
vmap axis_accelerator_adapter_v2_1_16 questa_lib/msim/axis_accelerator_adapter_v2_1_16
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_5 questa_lib/msim/fifo_generator_v13_2_5
vmap lib_fifo_v1_0_14 questa_lib/msim/lib_fifo_v1_0_14
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_datamover_v5_1_22 questa_lib/msim/axi_datamover_v5_1_22
vmap axi_sg_v4_1_13 questa_lib/msim/axi_sg_v4_1_13
vmap axi_dma_v7_1_21 questa_lib/msim/axi_dma_v7_1_21
vmap xlconcat_v2_1_3 questa_lib/msim/xlconcat_v2_1_3
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap axi_intc_v4_1_14 questa_lib/msim/axi_intc_v4_1_14
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_20 questa_lib/msim/axi_register_slice_v2_1_20
vmap axi_data_fifo_v2_1_19 questa_lib/msim/axi_data_fifo_v2_1_19
vmap axi_crossbar_v2_1_21 questa_lib/msim/axi_crossbar_v2_1_21
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap axi_protocol_converter_v2_1_20 questa_lib/msim/axi_protocol_converter_v2_1_20

vlog -work xilinx_vip -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"/home/fra/Desktop/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/fra/Desktop/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/fra/Desktop/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/home/fra/Desktop/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_6 -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/dc12/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_8 -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_ps7_0/sim/pynqz2_ps7_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pynqz2/ip/pynqz2_rst_ps7_30M_0/sim/pynqz2_rst_ps7_30M_0.vhd" \

vlog -work xlconstant_v1_1_6 -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/34f7/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_xlconstant_0_1/sim/pynqz2_xlconstant_0_1.v" \

vlog -work util_vector_logic_v2_0_1 -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_util_vector_logic_0_0/sim/pynqz2_util_vector_logic_0_0.v" \
"../../../bd/pynqz2/ip/pynqz2_dtpu_core_0_0/sim/pynqz2_dtpu_core_0_0.v" \

vlog -work fifo_generator_v13_1_4 -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/e6d5/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_4 -64 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/e6d5/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_4 -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/e6d5/hdl/fifo_generator_v13_1_rfs.v" \

vcom -work axis_accelerator_adapter_v2_1_16 -64 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2317/hdl/axis_accelerator_adapter_v2_1_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pynqz2/ip/pynqz2_axis_accelerator_ada_0_0/sim/pynqz2_axis_accelerator_ada_0_0.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -64 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_14 -64 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_22 -64 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1e40/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_13 -64 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/4919/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_21 -64 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec2a/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pynqz2/ip/pynqz2_axi_dma_0_1/sim/pynqz2_axi_dma_0_1.vhd" \

vlog -work xlconcat_v2_1_3 -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_xlconcat_0_1/sim/pynqz2_xlconcat_0_1.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pynqz2/ip/pynqz2_axi_dma_0_2/sim/pynqz2_axi_dma_0_2.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work axi_intc_v4_1_14 -64 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/f78a/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pynqz2/ip/pynqz2_axi_intc_0_0/sim/pynqz2_axi_intc_0_0.vhd" \
"../../../bd/pynqz2/ip/pynqz2_axi_dma_0_3/sim/pynqz2_axi_dma_0_3.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_util_vector_logic_1_2/sim/pynqz2_util_vector_logic_1_2.v" \

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_20 -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_19 -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_21 -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_xbar_14/sim/pynqz2_xbar_14.v" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/sim/bd_7d7d.v" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_7d7d_one_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_7d7d_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_7d7d_arsw_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_7d7d_rsw_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_7d7d_awsw_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_7d7d_wsw_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_7d7d_bsw_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2508/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_7d7d_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_7d7d_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/9d43/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_7d7d_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_7d7d_s00a2s_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_7d7d_sarn_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_7d7d_srn_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_7d7d_s01mmu_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_7d7d_s01tr_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_7d7d_s01sic_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_7d7d_s01a2s_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_7d7d_sarn_1.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_7d7d_srn_1.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_7d7d_s02mmu_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_7d7d_s02tr_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_7d7d_s02sic_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_7d7d_s02a2s_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_7d7d_sawn_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_7d7d_swn_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_7d7d_sbn_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_7d7d_s03mmu_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_27/sim/bd_7d7d_s03tr_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_28/sim/bd_7d7d_s03sic_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_29/sim/bd_7d7d_s03a2s_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_30/sim/bd_7d7d_sarn_2.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_31/sim/bd_7d7d_srn_2.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_32/sim/bd_7d7d_m00s2a_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_33/sim/bd_7d7d_m00arn_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_34/sim/bd_7d7d_m00rn_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_35/sim/bd_7d7d_m00awn_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_36/sim/bd_7d7d_m00wn_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_37/sim/bd_7d7d_m00bn_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/901a/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/bd_0/ip/ip_38/sim/bd_7d7d_m00e_0.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_smartconnect_0_0/sim/pynqz2_smartconnect_0_0.v" \
"../../../bd/pynqz2/sim/pynqz2.v" \

vlog -work axi_protocol_converter_v2_1_20 -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/c4a6/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_auto_pc_0/sim/pynqz2_auto_pc_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/pynqz2_xadc_wiz_0_0_conv_funs_pkg.vhd" \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/pynqz2_xadc_wiz_0_0_proc_common_pkg.vhd" \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/pynqz2_xadc_wiz_0_0_ipif_pkg.vhd" \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/pynqz2_xadc_wiz_0_0_family_support.vhd" \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/pynqz2_xadc_wiz_0_0_family.vhd" \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/pynqz2_xadc_wiz_0_0_soft_reset.vhd" \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/proc_common_v3_30_a/hdl/src/vhdl/pynqz2_xadc_wiz_0_0_pselect_f.vhd" \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/pynqz2_xadc_wiz_0_0_address_decoder.vhd" \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/pynqz2_xadc_wiz_0_0_slave_attachment.vhd" \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/interrupt_control_v2_01_a/hdl/src/vhdl/pynqz2_xadc_wiz_0_0_interrupt_control.vhd" \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/axi_lite_ipif_v1_01_a/hdl/src/vhdl/pynqz2_xadc_wiz_0_0_axi_lite_ipif.vhd" \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/pynqz2_xadc_wiz_0_0_xadc_core_drp.vhd" \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/pynqz2_xadc_wiz_0_0_axi_xadc.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_xadc_wiz_0_0/pynqz2_xadc_wiz_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

