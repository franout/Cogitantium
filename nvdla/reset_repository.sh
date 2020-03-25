#!/bin/bash

#script for reset repositories
branch="master" ; # nvdla1 for large nv_small for small
#nvdla hw
rm -rf ./nvdla/hw/
rm -rf ./nvdla/sw/
mkdir ./nvdla/hw
mkdir ./nvdla/sw
cd ./nvdla/

git clone --single-branch --branch $branch https://github.com/nvdla/hw.git  
#nvdla sw

git clone https://github.com/nvdla/sw.git
cd ../




#pynq workshop
rm -rf tutorial_board
mkdir tutorial_board/
cd ./tutorial_board/
git clone https://github.com/Xilinx/PYNQ_Workshop
cd ..

rm -rf ./PYNQ/
mkdir./PYNQ/
cd PYNQ
git clone https://github.com/Xilinx/PYNQ
cd ..

exit
