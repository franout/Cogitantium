#!/usr/bash


cd ./nvdla/hw
make

# update paths for tools
cp ../../sources ./tree.make

#compile parameters
cd ./spec/defs/
make 
cd ./../../

# compoli&build verilog rtl
./tools/bin/tmake -build vmod

# compile&build a short sanity simulatio
./tools/bin/tmake -build verif_sim


#compile&buold a systemC model
    ./tools/bin/tmake -build cmod_top
