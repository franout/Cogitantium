-makelib xcelium_lib/xilinx_vip -sv \
  "D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "D:/programmi/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/programmi/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/programmi/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_6 -sv \
  "../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/dc12/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_8 -sv \
  "../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/2d50/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/base_zynq/ip/base_zynq_processing_system7_0_0/sim/base_zynq_processing_system7_0_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/base_zynq/ip/base_zynq_rst_ps7_0_50M_0/sim/base_zynq_rst_ps7_0_50M_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/base_zynq/ip/base_zynq_apb_bridge_wrapper_0_1/sim/base_zynq_apb_bridge_wrapper_0_1.v" \
  "../../../bd/base_zynq/ip/base_zynq_nv_nvdla_wrapper_0_1/sim/base_zynq_nv_nvdla_wrapper_0_1.v" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_19 \
  "../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_20 \
  "../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_20 \
  "../../../../nv_small_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/c4a6/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/base_zynq/ip/base_zynq_auto_pc_0/sim/base_zynq_auto_pc_0.v" \
  "../../../bd/base_zynq/sim/base_zynq.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

