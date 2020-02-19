vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_6
vlib activehdl/processing_system7_vip_v1_0_8
vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/fifo_generator_v13_2_5
vlib activehdl/axi_data_fifo_v2_1_19
vlib activehdl/axi_register_slice_v2_1_20
vlib activehdl/axi_protocol_converter_v2_1_20

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_6 activehdl/axi_vip_v1_1_6
vmap processing_system7_vip_v1_0_8 activehdl/processing_system7_vip_v1_0_8
vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_5 activehdl/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_19 activehdl/axi_data_fifo_v2_1_19
vmap axi_register_slice_v2_1_20 activehdl/axi_register_slice_v2_1_20
vmap axi_protocol_converter_v2_1_20 activehdl/axi_protocol_converter_v2_1_20

vlog -work xilinx_vip  -sv2k12 "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ip/base_zynq_processing_system7_0_0" "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"D:/programmi/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/programmi/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ip/base_zynq_processing_system7_0_0" "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_6  -sv2k12 "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ip/base_zynq_processing_system7_0_0" "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/dc12/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_8  -sv2k12 "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ip/base_zynq_processing_system7_0_0" "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ip/base_zynq_processing_system7_0_0" "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/base_zynq/ip/base_zynq_processing_system7_0_0/sim/base_zynq_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/base_zynq/ip/base_zynq_rst_ps7_0_50M_0/sim/base_zynq_rst_ps7_0_50M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ip/base_zynq_processing_system7_0_0" "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/base_zynq/ip/base_zynq_apb_bridge_wrapper_0_1/sim/base_zynq_apb_bridge_wrapper_0_1.v" \
"../../../bd/base_zynq/ip/base_zynq_nv_nvdla_wrapper_0_1/sim/base_zynq_nv_nvdla_wrapper_0_1.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ip/base_zynq_processing_system7_0_0" "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ip/base_zynq_processing_system7_0_0" "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ip/base_zynq_processing_system7_0_0" "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_19  -v2k5 "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ip/base_zynq_processing_system7_0_0" "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_20  -v2k5 "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ip/base_zynq_processing_system7_0_0" "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_20  -v2k5 "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ip/base_zynq_processing_system7_0_0" "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/c4a6/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl" "+incdir+../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ip/base_zynq_processing_system7_0_0" "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/base_zynq/ip/base_zynq_auto_pc_0/sim/base_zynq_auto_pc_0.v" \
"../../../bd/base_zynq/sim/base_zynq.v" \

vlog -work xil_defaultlib \
"glbl.v"

