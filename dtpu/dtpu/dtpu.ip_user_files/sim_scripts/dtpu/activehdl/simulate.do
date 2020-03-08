onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+dtpu -L fifo_generator_v13_1_4 -L axis_accelerator_adapter_v2_1_16 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.dtpu xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {dtpu.udo}

run -all

endsim

quit -force
