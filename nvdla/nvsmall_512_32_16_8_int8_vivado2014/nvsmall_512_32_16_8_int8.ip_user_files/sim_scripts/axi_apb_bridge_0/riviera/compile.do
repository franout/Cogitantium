vlib work
vlib riviera

vlib riviera/lib_pkg_v1_0_2
vlib riviera/axi_apb_bridge_v3_0_13
vlib riviera/xil_defaultlib

vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap axi_apb_bridge_v3_0_13 riviera/axi_apb_bridge_v3_0_13
vmap xil_defaultlib riviera/xil_defaultlib

vcom -work lib_pkg_v1_0_2 -93 \
"../../../ipstatic/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_apb_bridge_v3_0_13 -93 \
"../../../ipstatic/hdl/axi_apb_bridge_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../nvsmall_512_32_16_8_int8.srcs/sources_1/ip/axi_apb_bridge_0/sim/axi_apb_bridge_0.vhd" \


