-makelib ies_lib/xilinx_vip -sv \
  "/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/home/fra/Desktop/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xpm -sv \
  "/home/fra/Desktop/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/home/fra/Desktop/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/home/fra/Desktop/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/home/fra/Desktop/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_vip_v1_1_6 -sv \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/dc12/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_8 -sv \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2d50/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_ps7_0/sim/pynqz2_ps7_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_rst_ps7_30M_0/sim/pynqz2_rst_ps7_30M_0.vhd" \
-endlib
-makelib ies_lib/xlconstant_v1_1_6 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/34f7/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_xlconstant_0_1/sim/pynqz2_xlconstant_0_1.v" \
-endlib
-makelib ies_lib/util_vector_logic_v2_0_1 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_util_vector_logic_0_0/sim/pynqz2_util_vector_logic_0_0.v" \
  "../../../bd/pynqz2/ip/pynqz2_dtpu_core_0_0/sim/pynqz2_dtpu_core_0_0.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_1_4 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/e6d5/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_1_4 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/e6d5/hdl/fifo_generator_v13_1_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_1_4 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/e6d5/hdl/fifo_generator_v13_1_rfs.v" \
-endlib
-makelib ies_lib/axis_accelerator_adapter_v2_1_16 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/2317/hdl/axis_accelerator_adapter_v2_1_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_axis_accelerator_ada_0_0/sim/pynqz2_axis_accelerator_ada_0_0.vhd" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_20 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_19 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_crossbar_v2_1_21 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_xbar_10/sim/pynqz2_xbar_10.v" \
-endlib
-makelib ies_lib/lib_pkg_v1_0_2 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/lib_fifo_v1_0_14 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/lib_srl_fifo_v1_0_2 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/axi_datamover_v5_1_22 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/1e40/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
-endlib
-makelib ies_lib/axi_sg_v4_1_13 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/4919/hdl/axi_sg_v4_1_rfs.vhd" \
-endlib
-makelib ies_lib/axi_dma_v7_1_21 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/ec2a/hdl/axi_dma_v7_1_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_axi_dma_0_1/sim/pynqz2_axi_dma_0_1.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_xbar_11/sim/pynqz2_xbar_11.v" \
-endlib
-makelib ies_lib/xlconcat_v2_1_3 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_xlconcat_0_1/sim/pynqz2_xlconcat_0_1.v" \
  "../../../bd/pynqz2/ip/pynqz2_util_vector_logic_1_1/sim/pynqz2_util_vector_logic_1_1.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_axi_dma_0_2/sim/pynqz2_axi_dma_0_2.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/sim/pynqz2.v" \
-endlib
-makelib ies_lib/axi_lite_ipif_v3_0_4 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/axi_intc_v4_1_14 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/f78a/hdl/axi_intc_v4_1_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_axi_intc_0_0/sim/pynqz2_axi_intc_0_0.vhd" \
  "../../../bd/pynqz2/ip/pynqz2_axi_dma_0_3/sim/pynqz2_axi_dma_0_3.vhd" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_20 \
  "../../../../pynqz2.srcs/sources_1/bd/pynqz2/ipshared/c4a6/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/pynqz2/ip/pynqz2_auto_pc_0/sim/pynqz2_auto_pc_0.v" \
  "../../../bd/pynqz2/ip/pynqz2_auto_pc_1/sim/pynqz2_auto_pc_1.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

