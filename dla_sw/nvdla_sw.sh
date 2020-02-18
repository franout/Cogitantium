#!/bin/bash

if [ "$#" -ne 1 ]
    then 
  echo "illegal number of parameters choose if compiler or not"
exit
fi


##############################
###### NVDLA COMPILER ########
##############################
############# OPTIONS ###########################################
 ## -o <outputpath>                                             outputs wisdom files in 'outputpath' directory
 ##--profile <basic|default|performance|fast-math>             computation profile (default: fast-math)
 ##  --cprecision <fp16|int8>                                    compute precision (default: fp16)
 ##   --configtarget <opendla-full|opendla-large|opendla-small>   target platform (default: nv_full)
 ## --calibtable <int8 calib file>                              calibration table for INT8 networks (default: 0.00787)
 ## --quantizationMode <per-kernel|per-filter>                  quantization mode for INT8 (default: per-kernel)
 ## --batch                                                     batch size (default: 1)
 ## --informat <ncxhwx|nchw|nhwc>                               input data format (default: nhwc)

export LD_LIBRARY_PATH=$PWD/core/src/compiler/libnvdla_compiler
export PATH=$PATH:$PWD/apps/compiler/nvdla_compiler/


if [ "$1" -e "compile" ] then
export model_dir=./models/

PROFILE=""
CPRECISION=""
CALITABLE=""
QUANTIZATIONMODE=""
BATH_NUM=""
INFORMAT=""
PROTOTXT_FILE=""
CAFFEMODEL_FILE=""
### compiler the pretrained caffe model for nvdla hardware
nvdla_compiler -o ./ --profile "$PROFILE" --cprecision "$CPRECISION" --configtarget opendla-small --calibtable "$CALITABLE" --quantizationMode "$QUANTIZATIONMODE" --batch "$BATH_NUM" --informat "$INFORMAT"  --prototxt "$PROTOTXT_FILE" --caffemodel "$CAFFEMODEL_FILE"

fi


###############################
###### NVDLA RUNTIME ##########
###############################

## execute the model on hw
