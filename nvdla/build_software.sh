#!/bin/bash
########################################################
########### KERNEL BUILD IN /lib/modules/ -- you kernel version /build/include  has to be adjusted #######
#####  remake scripts in /lib/modules/yourkernelversion/source/ make scripts! 


#############################################################
#####RUN ON THE BOARD WITH PROTOBUFF ALREADY INSTALLED ######
#############################################################
#### for protobuff and libjpeg!!#############################
### ${proto_dir}/configure --prefix=/usr/
### make 
### make check
### make install
##############################################################

##################################################
### paths are relative to the board ##############
##################################################
### build the KMD 
cd ./nvdla/sw/kmd
### only for cross compiling 
#KDIR="$HOME"/moduled/nv_small/build/tmp/work-shared/plnx-zynq7/kernel-source/
make  ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabihf-

## add kernel module to OS
mkdir /lib/modules/linux_Versions/kernel/drivers/nvdla
cp ./port/linux/opendla.ko /lib/modules/linux_Versions/kernel/drivers/nvdla
insmod /lib/modules/linux_Versions/kernel/drivers/nvdla/opendla.ko

## rmod for removing it
cd ../
## build user mode driver
cd ./nvdla/sw/umd

export LD_LIBRARY_PATH=/usr/lib/pkgconfig/
cp /usr/lib/protobuff.a ./app/compiler/
export TOP=$PWD
## petalinux compiler arm cross compiler  
export TOOLCHAIN_PREFIX=/usr/bin/arm-linux-gnueabihf-
make compiler 
make runtime
