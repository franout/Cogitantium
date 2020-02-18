onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L lib_pkg_v1_0_2 -L axi_apb_bridge_v3_0_16 -L xil_defaultlib -L secureip -lib xil_defaultlib xil_defaultlib.axi_apb_bridge_0

do {wave.do}

view wave
view structure
view signals

do {axi_apb_bridge_0.udo}

run -all

quit -force
