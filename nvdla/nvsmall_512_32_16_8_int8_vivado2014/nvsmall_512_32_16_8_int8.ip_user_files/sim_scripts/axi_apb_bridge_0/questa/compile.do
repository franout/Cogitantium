vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/axi_apb_bridge_v3_0_13
vlib questa_lib/msim/xil_defaultlib

vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap axi_apb_bridge_v3_0_13 questa_lib/msim/axi_apb_bridge_v3_0_13
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../ipstatic/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_apb_bridge_v3_0_13 -64 -93 \
"../../../ipstatic/hdl/axi_apb_bridge_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/ip/axi_apb_bridge_0/sim/axi_apb_bridge_0.vhd" \


