#!/bin/bash

## deprecated
## TODO 
# nvdla software
## build linux kernel mode driver
cd nvdla/sw/kmd
make KDIR=./firmware ARCH=arm CROSS_COMPILE=/usr/bin/arm-none-eabi-gcc-4.9.3

cd ../umd
## build user mode driver
export TOP=./
make compiler 
make runtime
