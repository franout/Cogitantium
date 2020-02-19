vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/axi_apb_bridge_v3_0_16
vlib questa_lib/msim/xil_defaultlib

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap axi_apb_bridge_v3_0_16 questa_lib/msim/axi_apb_bridge_v3_0_16
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xilinx_vip -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+D:/programmi/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"D:/programmi/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/programmi/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/programmi/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../ipstatic/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_apb_bridge_v3_0_16 -64 -93 \
"../../../ipstatic/hdl/axi_apb_bridge_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../nv_small_512_32_16_8_int8.srcs/sources_1/ip/axi_apb_bridge_0/sim/axi_apb_bridge_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

