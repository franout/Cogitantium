#!/bin/bash
source ~/petalinux/settings.sh

## deprecated
## create scartch dir and build the boot and linux image for zynq 7000
#mkdir ./build_zynq
cd ./build_zynq
#git clone https://github.com/Xilinx/u-boot-xlnx.git
#git clone https://github.com/Xilinx/linux-xlnx.git
#git clone git://github.com/Xilinx/device-tree-xlnx.git
export PATH=$PATH:/usr/bin/make/

#linato cross compiler
#export CROSS_COMPILE=~/petalinux/tools/xsct/gnu/aarch64/lin/aarch64-none/bin/aarch64-none-elf-
export CROSS_COMPILE=~/petalinux/tools/xsct/gnu/armr5/lin/gcc-arm-none-eabi/bin/armr5-none-eabi-
echo "U-BOOT"
cd ./u-boot-xlnx/
make distclean
make -j zynq_zc702_defconfig
make 

mv ./u-boot.elf ../u-boot.elf
echo "device tree generated from vitis"
# add the UKM of nvdla to kernel TODO
cd ./../




echo "LINUX----kernel"
cd ./linux-xlnx/
make distclean
make ARCH=arm xilinx_zynq_defconfig
make -j ARCH=arm  UIMAGE_LOADADDR=0x8000 uImage
#make ARCH=arm zynq-zc702.dtb

# not compressed kernel 
mv  ./arch/arm/boot/Image ../Image
# compressed kernle
mv ./arch/arm/boot/zImage ../zImage
cd ..
echo " make a bootable image  in vitis"
#./u-boot-xlnx/mkimage -A arm -O linux -T ramdisk -C gzip -d arm_ramdisk.image.gz uarm_ramdisk.image.gz



