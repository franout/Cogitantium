-makelib ies_lib/xilinx_vip -sv \
  "/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/home/fra/Desktop/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "/home/fra/Desktop/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/home/fra/Desktop/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/home/fra/Desktop/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/home/fra/Desktop/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_vip_v1_1_5 -sv \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/d4a8/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_7 -sv \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8c62/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_ps7_0/sim/pynqz2_ps7_0.v" \
  "../../../bd/pynqz2/sim/pynqz2.v" \
  "../../../bd/pynqz2/ip/pynqz2_nv_nvdla_wrapper_0_0/sim/pynqz2_nv_nvdla_wrapper_0_0.v" \
-endlib
-makelib ies_lib/xlconstant_v1_1_6 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/66e7/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/ip/ip_0/sim/bd_5356_one_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/ip/ip_1/sim/bd_5356_psr_aclk_0.vhd" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1ddd/hdl/sc_util_v1_0_vl_rfs.sv" \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/ip/ip_2/sim/bd_5356_s00mmu_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/ip/ip_3/sim/bd_5356_s00tr_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/7de4/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/ip/ip_4/sim/bd_5356_s00sic_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/ip/ip_5/sim/bd_5356_s00a2s_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/ip/ip_6/sim/bd_5356_sarn_0.sv" \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/ip/ip_7/sim/bd_5356_srn_0.sv" \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/ip/ip_8/sim/bd_5356_sawn_0.sv" \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/ip/ip_9/sim/bd_5356_swn_0.sv" \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/ip/ip_10/sim/bd_5356_sbn_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/ip/ip_11/sim/bd_5356_m00s2a_0.sv" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/ip/ip_12/sim/bd_5356_m00e_0.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/bd_0/sim/bd_5356.v" \
  "../../../bd/pynqz2/ip/pynqz2_axi_smc_0/sim/pynqz2_axi_smc_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_rst_ps7_30M_0/sim/pynqz2_rst_ps7_30M_0.vhd" \
-endlib
-makelib ies_lib/lib_pkg_v1_0_2 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/axi_apb_bridge_v3_0_15 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/7df3/hdl/axi_apb_bridge_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_axi_apb_bridge_0_0/sim/pynqz2_axi_apb_bridge_0_0.vhd" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_4 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_4 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_4 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_18 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_19 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_19 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/c83a/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_auto_pc_0/sim/pynqz2_auto_pc_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

