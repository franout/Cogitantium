#!/bin/bash

## create scartch dir and build the boot and linux image for zynq 7000
#mkdir ./build_zynq
cd ./build_zynq
#git clone https://github.com/Xilinx/u-boot-xlnx.git
#git clone https://github.com/Xilinx/linux-xlnx.git
export PATH=$PATH:/usr/bin/make/
export CROSS_COMPILE=/usr/bin/arm-linux-gnueabihf-
echo "U-BOOT"
cd ./u-boot-xlnx/
make distclean
make -j zynq_zc702_defconfig
make -j
# export the mkimag tool.
export PATH=$PATH:/u-boot-xlnx/tools/
mv ./u-boot.elf ../u-boot.elf
cd ./../
exit
echo "LINUX----"
cd ./linux-xlnx/
make ARCH=arm xilinx_zynq_defconfig
make -j ARCH=arm  UIMAGE_LOADADDR=0x8000 uImage
make ARCH=arm zynq-zc702.dtb

cd ..
## make a bootable image
mkimage -A arm -O linux -T ramdisk -C gzip -d arm_ramdisk.image.gz uarm_ramdisk.image.gz


## TODO add the UKM of nvdla!!!

