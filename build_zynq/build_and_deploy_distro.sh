#!/bin/bash

core="/media/fra/DATA/uni/2019-2020/thesis/cogitantium/"
PETALINUX_PATH="$HOME"
# SoC name 
export MACHINE="zc702-zynq7"
export ARCH="arm"
source "$PETALINUX_PATH"/petalinux/settings.sh


boot_device="sd"

petalinux-create -t project   --template zynq --name nv_small 

cd  ./nv_small
## copy configuration with external local path for u-boot and linux kernel and DTB ( generated from Vitis) 
#cp ../config ./project-spec/configs/config

## copy configuration from rootfs for adding libc ( otherwise nvdla appl will complain )
#cp ../rootfs_config ./project-spec/configs/rootfs_config


## get hardware description generated from VIVADO
petalinux-config --get-hw-description="$core"nvdla_configurations/nv_small_512_32_8_int8/

## KMD nvdla
#petalinux-create -t modules --name kmdnvdla --enable
#rm -rf ./project-spec/meta-user/recipes-module/kmdnvdla/files/*
#cp -r "$core"nvdla/sw/kmd/* ./project-spec/meta-user/recipes-modules/kmdnvdla/files/

#echo "inherit module" >> ./project-spec/meta-user/recipes-modules/kmdnvdla/kmdnvdla.bb
#EXTRA_OEMAKE = 'KERNEL_src="${STAGING_KERNEL_DIR}" \
#                O=${STAGING_KERNEL_BUILDDIR} \" 


## putting in package lib
#echo "FILES_\${PN} += \"\${base_libdir}/modules/\""  >> ./project-spec/meta-user/recipes-modules/kmdnvdla/kmdnvdla.bb
#echo "FILES_\${PN} += libs/ " >> ./project-spec/meta-user/recipes-modules/kmdnvdla/kmdnvdla.bb

## create api for  UMDnvdla ( portability layer for linux ) 
#petalinux-create -t apps --name umdnvdlaapi --enable
#rm -rf ./project-spec/meta-user/recipes-apps/umdnvdlaapi/files/*
#copy only the portability layer
#cp -r "$core"nvdla/sw/umd/port/linux/* ./project-spec/meta-user/recipes-apps/umdnvdlaapi/files/
#mv ./project-spec/meta-user/recipes-apps/umdnvdlaapi/files/nvdla.c ./project-spec/meta-user/recipes-apps/umdnvdlaapi/files/umdnvdlaapi.c
## put the module and application in the rootfs nd kernel  modules--> 
petalinux-config -c rootfs
petalinux-config -c kernel

## rebuild systems DO NOT CHANGE ORDER
#petalinux-build -c kernel
#petalinux-build -c kmdnvdla
#petalinux-build -c kmdnvdla -x do_install

#petalinux-build -c umdnvdla
#petalinux-build -c rootfs
## install umdnvdla
#petalinux-build -c umdnvdla -x do_install

# build and add nvdla module and application to the rootfs and into the kernel
petalinux-build

## generate the boot image ( boot.bin )  
## fsbl generated from vitis, configuration bitstream from vivado
petalinux-package --boot --fsbl "$core"nvdla_configurations/nv_small_512_32_8_int8/fsbl.elf --fpga "$core"nvdla_configurations/nv_small_512_32_8_int8/base_zynq_wrapper.bit --u-boot
#######################################
###### boot board/prepare sd ##########
#######################################
#petalinux-package --image

## through jtag
if [ $boot_device -e "jtag" ] then 
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
#7. Open a console on your workstation and start with preferred serial communication program
#(For example, kermit, minicom) with the baud rate set to 115200 on that console.
#8. Run the petalinux-boot command as follows on your workstation:$ petalinux-boot --jtag --prebuilt 3 
#9. Type user name root and password root on the serial console to log into the PetaLinuxsystem.
#10.Determine the IP address of the PetaLinux by running ifconfig on the system console.

gtkterm
echo "set serial communication with baoud rate 115200"
echo "WAIT FOR SETTING UP THE SERIAL COMMUNICATION -> PROGRAMMING  THE BOARD"
read stdin
petalinux-package --prebuilt --fpga "$core"/nvdla_configurations/nv_small_512_32_8_int8/base_zynq_wrapper.bit
petalinux-boot --jtag --prebuilt 3
elif [ $boot_device -e "sd"  ] then
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
 cp images/linux/BOOT.BIN /media/fra/BOOT/
 cp images/linux/image.ub /media/fra/BOOT/

sudo tar xvf ./images/linux/rootfs.tar.gz -C /media/fra/rootfs

#unmount the sd card

echo "remove  THE SD CARD"

gtkterm
echo "set serial communication with baoud rate 115200"
echo "WAIT FOR SETTING UP THE SERIAL COMMUNICATION -> POWER ON THE BOARD WITH SD CARD MOUNTED AND JUMPER SETTED"


fi

#1. The SD card is formatted with two partitions using a partition editor such as gparted.
#2. The first partition should be at least 500 MB in size and formatted as a FAT32 file system.
#Ensure that there is 4 MB of free space preceding the partition. The first partition will contain
#the boot loader, device tree, and kernel images. Label this partition as BOOT.
#3. The second partition should be formatted as an ext4 files system and can take up the
#remaining space on the SD card. This partition will store the system root file system. Label
#this partition as RootFS.
#For optimal performance ensure that the SD card partitions are 4 MB aligned.
