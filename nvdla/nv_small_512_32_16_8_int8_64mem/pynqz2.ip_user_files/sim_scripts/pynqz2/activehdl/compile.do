vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_5
vlib activehdl/processing_system7_vip_v1_0_7
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/xlconstant_v1_1_6
vlib activehdl/xlconcat_v2_1_3
vlib activehdl/smartconnect_v1_0
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/fifo_generator_v13_2_4
vlib activehdl/axi_data_fifo_v2_1_18
vlib activehdl/axi_register_slice_v2_1_19
vlib activehdl/axi_protocol_converter_v2_1_19
vlib activehdl/lib_pkg_v1_0_2
vlib activehdl/axi_apb_bridge_v3_0_15

vmap xilinx_vip activehdl/xilinx_vip
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_5 activehdl/axi_vip_v1_1_5
vmap processing_system7_vip_v1_0_7 activehdl/processing_system7_vip_v1_0_7
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap xlconstant_v1_1_6 activehdl/xlconstant_v1_1_6
vmap xlconcat_v2_1_3 activehdl/xlconcat_v2_1_3
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_4 activehdl/fifo_generator_v13_2_4
vmap axi_data_fifo_v2_1_18 activehdl/axi_data_fifo_v2_1_18
vmap axi_register_slice_v2_1_19 activehdl/axi_register_slice_v2_1_19
vmap axi_protocol_converter_v2_1_19 activehdl/axi_protocol_converter_v2_1_19
vmap lib_pkg_v1_0_2 activehdl/lib_pkg_v1_0_2
vmap axi_apb_bridge_v3_0_15 activehdl/axi_apb_bridge_v3_0_15

vlog -work xilinx_vip  -sv2k12 "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"/home/fra/Desktop/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/fra/Desktop/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/fra/Desktop/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/home/fra/Desktop/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_5  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/d4a8/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_7  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_ps7_0/sim/pynqz2_ps7_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/pynqz2/ip/pynqz2_rst_ps7_30M_0/sim/pynqz2_rst_ps7_30M_0.vhd" \

vlog -work xlconstant_v1_1_6  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/66e7/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_xlconstant_0_1/sim/pynqz2_xlconstant_0_1.v" \

vlog -work xlconcat_v2_1_3  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_xlconcat_0_1/sim/pynqz2_xlconcat_0_1.v" \
"../../../bd/pynqz2/ip/pynqz2_nv_nvdla_wrapper_0_3/sim/pynqz2_nv_nvdla_wrapper_0_3.v" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/sim/bd_9057.v" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/ip/ip_0/sim/bd_9057_one_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/ip/ip_1/sim/bd_9057_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/ip/ip_2/sim/bd_9057_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/ip/ip_3/sim/bd_9057_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/7de4/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/ip/ip_4/sim/bd_9057_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/ip/ip_5/sim/bd_9057_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/ip/ip_6/sim/bd_9057_sarn_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/ip/ip_7/sim/bd_9057_srn_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/ip/ip_8/sim/bd_9057_sawn_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/ip/ip_9/sim/bd_9057_swn_0.sv" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/ip/ip_10/sim/bd_9057_sbn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/ip/ip_11/sim/bd_9057_m00s2a_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/bd_0/ip/ip_12/sim/bd_9057_m00e_0.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_axi_smc_4/sim/pynqz2_axi_smc_4.v" \
"../../../bd/pynqz2/sim/pynqz2.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_4  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_4 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_4  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_18  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_19  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_19  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/c83a/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/verilog" "+incdir+../../../../pynqz2.srcs/sources_1/bd/pynqz2/ip/pynqz2_ps7_0" "+incdir+/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/include" \
"../../../bd/pynqz2/ip/pynqz2_auto_pc_0/sim/pynqz2_auto_pc_0.v" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_apb_bridge_v3_0_15 -93 \
"../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/7df3/hdl/axi_apb_bridge_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/pynqz2/ip/pynqz2_axi_apb_bridge_0_3/sim/pynqz2_axi_apb_bridge_0_3.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

