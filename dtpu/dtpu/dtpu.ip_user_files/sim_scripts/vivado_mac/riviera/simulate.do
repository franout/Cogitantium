onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+vivado_mac -L xbip_utils_v3_0_10 -L xbip_pipe_v3_0_6 -L xbip_bram18k_v3_0_6 -L mult_gen_v12_0_16 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_addsub_v3_0_6 -L xbip_dsp48_multadd_v3_0_6 -L xbip_multadd_v3_0_15 -L xil_defaultlib -L secureip -O5 xil_defaultlib.vivado_mac

do {wave.do}

view wave
view structure

do {vivado_mac.udo}

run -all

endsim

quit -force
