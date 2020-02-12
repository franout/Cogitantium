#!/bin/bash

core="/media/fra/DATA/uni/2019-2020/thesis/cogitantium/"
PETALINUX_PATH="$HOME"
# SoC name 
export MACHINE="zc702-zynq7"
source "$PETALINUX_PATH"/petalinux/settings.sh


boot_device="sd"

petalinux-create -t project   --template zynq --name nv_small 

cd  ./nv_small
## copy configuration with external local path for u-boot and linux kernel and DTB ( generated from Vitis) 
cp ../config ./project-spec/configs/config

## copy configuration from rootfs for adding libc ( otherwise nvdla appl will complain )
cp ../rootfs_config ./project-spec/configs/rootfs_config


## get hardware description generated from VIVADO
petalinux-config --get-hw-description="$core"nvdla_configurations/nv_small_512_32_8_int8/

## KMD nvdla
petalinux-create -t modules --name kmdnvdla --enable
rm -rf ./project-spec/meta-user/recipes-module/kmdnvdla/files/*
cp -r "$core"nvdla/sw/kmd/* ./project-spec/meta-user/recipes-modules/kmdnvdla/files/

## putting in package lib 
echo  "FILES_\${PN} += "${libdir}/*" FILES_\${PN}-dev = "${libdir}/* ${includedir}"" >> ./project-spec/meta-user/recipes-modules/kmdnvdla/kmdnvdla.bb

## create user application UMDnvdla
#petalinux-create -t apps --name umdnvdlaapi --enable
#rm -rf ./project-spec/meta-user/recipes-apps/umdnvdlaapi/files/*
#copy only the portability layer
#cp -r "$core"nvdla/sw/umd/port/* ./project-spec/meta-user/recipes-apps/umdnvdlaapi/files/

## put the module and application in the rootfs nd kernel  modules--> 
petalinux-config -c rootfs
petalinux-config -c kernel


## rebuild systems DO NOT CHANGE ORDER
petalinux-build -c kernel
petalinux-build -c kmdnvdla
#petalinux-build -c umdnvdla
petalinux-build -c rootfs
## install umdnvdla
#petalinux-build -c umdnvdla -x do_install

# build and add nvdla module and application to the rootfs and into the kernel
petalinux-build

exit
## generate the boot image ( boot.bin )  
## fsbl generated from vitis, configuration bitstream from vivado
petalinux-package --boot --fsbl "$core"nvdla_configurations/nv_small_512_32_8_int8/FSBL.elf --fpga "$core"nvdla_configurations/nv_small_512_32_8_int8/base_zynq_wrapper.bit --u-boot

## package bsp
petalinux-package --bsp -p ./  --hwsource "$core"/nvdla/project_3/ --output nv_small.BSP

## package sysroot
petalinux-package --sysroot

#######################################
###### boot board/prepare sd ##########
#######################################


## through jtag
if [ boot_device -e "jtag" ] then 
	##  Downloads the prebuilt FPGA bitstream and FSBL, boots theprebuilt U-Boot, and boots the prebuilt kernel on targe
#1. Power off the board.
#2. Connect the JTAG port on the board with the JTAG cable to your workstation.
#3. Connect the serial port on the board to your workstation.
#4. If your system has Ethernet, also connect the Ethernet port on the board to your localnetwork.(optional) 
#5. For Zynq-7000 device boards, ensure that the mode switches are set to JTAG mode. Refer tothe board documentation for details.
#6. Power on the board.
#7. Open a console on your workstation and start with preferred serial communication program
#(For example, kermit, minicom) with the baud rate set to 115200 on that console.
#8. Run the petalinux-boot command as follows on your workstation:$ petalinux-boot --jtag --prebuilt 3 
#9. Type user name root and password root on the serial console to log into the PetaLinuxsystem.
#10.Determine the IP address of the PetaLinux by running ifconfig on the system console.

gtkterm
echo "set serial communication with baoud rate 115200"
echo "WAIT FOR SETTING UP THE SERIAL COMMUNICATION -> PROGRAMMING  THE BOARD"
read stdin

petalinux-boot --jtag --prebuilt 3
elif [ boot_device -e "sd"  ] then
## through sd
#1. Mount the SD card on your host machine.
#2. Copy the following files from <plnx-proj-root>/pre-built/linux/images/ into the
#root directory of the firstpartition which is in FAT32 format in the SD card:
# BOOT.BIN  image.ub
# 3 Connect the serial port on the board to your workstation.
#4. Open a console on the workstation and start the preferred 
#serial communication program(For example: kermit, minicom, gtkterm) 
#with the baud rate set to 115200 on that console.
#5. Power off the board.
#6. Set the boot mode of the board to SD boot. Refer to the board documentation for details.
#7. Plug the SD card into the board.
#8. Power on the board


## check for sd card
cp ./pre-built/linux/images/BOOT.BIN  sd dest
cp ./pre-built/linux/images/image.ub
#unmount the sd card

echo "remove  THE SD CARD"

gtkterm
echo "set serial communication with baoud rate 115200"
echo "WAIT FOR SETTING UP THE SERIAL COMMUNICATION -> POWER ON THE BOARD WITH SD CARD MOUNTED AND JUMPER SETTED"
read stdin

fi

