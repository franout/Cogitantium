#!/bin/bash

#############################################################
#####RUN ON THE BOARD WITH PROTOBUFF ALREADY INSTALLED ######
#############################################################


### paths are relative to the board

### build the KMD 
cd ./nvdla/sw/kmd
make KDIR="$HOME"/moduled/nv_small/build/tmp/work-shared/plnx-zynq7/kernel-source/ ARCH=arm CROSS_COMPILE="$HOME"/petalinux/tools/xsct/gnu/aarch64/lin/aarch64-none/bin/aarch64-none-elf-
exit

cd ../
exit
## build user mode driver
cd ./nvdla/sw/umd

export LD_LIBRARY_PATH=/usr/local/bin
export TOP=$PWD
## petalinux compiler arm cross compiler  
export TOOLCHAIN_PREFIX=/usr/bin/arm-linux-gnueabihf-
make compiler 
make runtime
