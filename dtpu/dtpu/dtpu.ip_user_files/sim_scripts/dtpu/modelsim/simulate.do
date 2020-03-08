onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L fifo_generator_v13_1_4 -L axis_accelerator_adapter_v2_1_16 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.dtpu xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {dtpu.udo}

run -all

quit -force
