onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib vivado_mac_opt

do {wave.do}

view wave
view structure
view signals

do {vivado_mac.udo}

run -all

quit -force
