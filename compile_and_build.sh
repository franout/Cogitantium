#!/bin/bash

export DESIGN="nv_small"

#nv_small nv_small_256 nv_small_256_full nv_medium_512 nv_medium_1024_full nv_large														  

#avoid since the sources file will be copied
cd ./nvdla/hw
#make

# update paths for tools
cp ../../sources ./tree.make

#compile parameters
cd ./spec/defs/
make 
cd ./../../

#compile and sanity check
#./tools/bin/tmake 

./tools/bin/tmake -build vmod_vlibs
./tools/bin/tmake -build vmod_fifos
# compoli&build verilog rtl
./tools/bin/tmake -build vmod
success=$?

## remove unuseful rams ( keeping only the ram for fpga) 
rm -rf ./outdir/nv_small/vmod/rams/



## remove logs files if no errors 
if [ $sucess -e 1  ] 
then 
echo "###################\n ########## ERROR ###########\n ###############"
else
cd ./outdir/
rm -rf *.log
find ./ -regex .*\.v\.vcp -exec rm -f {} +
cd ..
fi

# compile&build a short sanity simulatio
#./tools/bin/tmake -build verif_sim


#compile&buold a systemC model
 #   ./tools/bin/tmake -build cmod_top

