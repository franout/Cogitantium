vlib work
vlib activehdl

vlib activehdl/fifo_generator_v13_1_4
vlib activehdl/axis_accelerator_adapter_v2_1_16
vlib activehdl/xil_defaultlib

vmap fifo_generator_v13_1_4 activehdl/fifo_generator_v13_1_4
vmap axis_accelerator_adapter_v2_1_16 activehdl/axis_accelerator_adapter_v2_1_16
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work fifo_generator_v13_1_4  -v2k5 \
"../../../../dtpu.srcs/sources_1/bd/dtpu/ipshared/e6d5/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_4 -93 \
"../../../../dtpu.srcs/sources_1/bd/dtpu/ipshared/e6d5/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_4  -v2k5 \
"../../../../dtpu.srcs/sources_1/bd/dtpu/ipshared/e6d5/hdl/fifo_generator_v13_1_rfs.v" \

vcom -work axis_accelerator_adapter_v2_1_16 -93 \
"../../../../dtpu.srcs/sources_1/bd/dtpu/ipshared/2317/hdl/axis_accelerator_adapter_v2_1_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../dtpu.srcs/sources_1/bd/dtpu/ip/dtpu_axis_accelerator_ada_0_0/sim/dtpu_axis_accelerator_ada_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../dtpu.srcs/sources_1/bd/dtpu/ip/dtpu_dtpu_core_0_2/sim/dtpu_dtpu_core_0_2.v" \
"../../../../dtpu.srcs/sources_1/bd/dtpu/sim/dtpu.v" \

vlog -work xil_defaultlib \
"glbl.v"

