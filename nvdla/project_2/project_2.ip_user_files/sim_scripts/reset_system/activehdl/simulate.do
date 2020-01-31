onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+reset_system -L xilinx_vip -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.reset_system xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {reset_system.udo}

run -all

endsim

quit -force
