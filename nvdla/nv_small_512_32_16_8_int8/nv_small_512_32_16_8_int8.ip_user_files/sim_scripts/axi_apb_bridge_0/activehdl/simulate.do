onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+axi_apb_bridge_0 -L lib_pkg_v1_0_2 -L axi_apb_bridge_v3_0_16 -L xil_defaultlib -L secureip -O5 xil_defaultlib.axi_apb_bridge_0

do {wave.do}

view wave
view structure

do {axi_apb_bridge_0.udo}

run -all

endsim

quit -force
