onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib dsp_smac_32_opt

do {wave.do}

view wave
view structure
view signals

do {dsp_smac_32.udo}

run -all

quit -force
