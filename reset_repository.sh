#!/bin/bash

#script for reset repositories

#nvdla hw
rm -rf ./nvdla/
mkdir ./nvdla/
cd ./nvdla/
mkdir ./hw
mkdir ./sw

cd ./hw/
git clone https://github.com/nvdla/hw.git
cd ./../sw/
#nvdla sw

git clone https://github.com/nvdla/sw.git
cd ../../
exit
