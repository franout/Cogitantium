onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib dsp_smul_16_fa_opt

do {wave.do}

view wave
view structure
view signals

do {dsp_smul_16_fa.udo}

run -all

quit -force
