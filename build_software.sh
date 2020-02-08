#!/bin/bash
## TODO 
# nvdla software
## build linux kernel mode driver
make KDIR=<path_to_Linux_source> ARCH=arm32 CROSS_COMPILE=/usr/bin/arm-none-eabi-gcc-4.9.3

## build user mode driver
export TOP=<path_to_umd>
make
