-makelib ies_lib/xil_defaultlib -sv \
  "/home/fra/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/home/fra/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/home/fra/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/home/fra/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/axi_protocol_checker_v2_0_1 -sv \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/3b24/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/axi_vip_v1_1_1 -sv \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/a16a/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_3 -sv \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/1313/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_zynq/ip/base_zynq_processing_system7_0_0/sim/base_zynq_processing_system7_0_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_12 \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_zynq/ip/base_zynq_rst_ps7_0_50M_0/sim/base_zynq_rst_ps7_0_50M_0.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_zynq/ip/base_zynq_nv_nvdla_wrapper_0_0/sim/base_zynq_nv_nvdla_wrapper_0_0.v" \
  "../../../bd/base_zynq/ip/base_zynq_apb_bridge_wrapper_0_0/sim/base_zynq_apb_bridge_wrapper_0_0.v" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/5c35/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_14 \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/9909/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_15 \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/3ed1/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_15 \
  "../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/bd/base_zynq/ipshared/ff69/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/base_zynq/ip/base_zynq_auto_pc_0/sim/base_zynq_auto_pc_0.v" \
  "../../../bd/base_zynq/sim/base_zynq.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

