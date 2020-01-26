#!/bin/bash

#script for reset repositories

#nvdla hw
rm -rf ./nvdla/
mkdir ./nvdla/
cd ./nvdla/

git clone https://github.com/nvdla/hw.git
#nvdla sw

git clone https://github.com/nvdla/sw.git
cd ../




#pynq workshop
rm -rf tutorial_board
mkdir tutorial_board/
cd ./tutorial_board/
git clone https://github.com/Xilinx/PYNQ_Workshop
cd ..

rm -rf 
mkdir pynq_z2/
cd pynq_z2
git clone https://github.com/Xilinx/PYNQ
cd ..

exit
