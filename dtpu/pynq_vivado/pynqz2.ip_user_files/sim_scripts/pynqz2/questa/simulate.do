onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib pynqz2_opt

do {wave.do}

view wave
view structure
view signals

do {pynqz2.udo}

run -all

quit -force
