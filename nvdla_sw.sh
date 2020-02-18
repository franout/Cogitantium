#!/bin/bash

if [ "$#" -ne 1 ]
    then 
  echo "illegal number of parameters choose if compiler or not"
exit
fi

##############################
###### NVDLA COMPILER ########
##############################
if [ "$1" -e "compile" ] then
export LD_LIBRARY_PATH=$PWD/core/src/compiler/libnvdla_compiler
export PATH=$PATH:$PWD/apps/compiler/nvdla_compiler/

### compiler the pretrained caffe model for nvdla hardware
nvdla_compiler ??????

fi





###############################
###### NVDLA RUNTIME ##########
###############################

## execute the model on hw
