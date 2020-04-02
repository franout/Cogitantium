#!/usr/bin/python
import tensorflow as tf
import tensorflow_hub as hub
import os



PREFIX_PATH="./"
MODEL_NAME="resnet"
OUTPUT_FOLDER=PREFIX_PATH+"model_cache/output"
##load  pretrained models

model=hub.load(PREFIX_PATH+"model_cache/"+MODEL_NAME)


# and convert tensorflow pre trained model to tensorflow lite

converter = tf.lite.TFLiteConverter.from_saved_model(PREFIX_PATH+"model_cache/"+MODEL_NAME+"/")

## chose the preferred quantazation 

converter.optimizations = [tf.lite.Optimize.DEFAULT]
tflite_quant_model = converter.convert()

#save the file 
if !(os.path.exist(OUTPUT_FOLDER+MODEL_NAME)):
	    os.mkdir(OUTPUT_FOLDER+MODEL_NAME)

open("converted_model.tflite", "wb").write(tflite_quantized_model)

#TensorFlow Lite supports reducing precision of values from full floating point 
#to half-precision floats (float16) or 8-bit integers. 
#There are trade-offs in model size and accuracy 
#for each choice, and some operations have optimized
# implementations for these reduced precision types.

#To learn more about quantization, see Post-training quantization.



## ful integer quantazation

def representative_dataset_gen():
  for _ in range(num_calibration_steps):
    # Get sample input data as a numpy array in a method of your choosing.
    yield [input]

converter = tf.lite.TFLiteConverter.from_saved_model(saved_model_dir)
converter.optimizations = [tf.lite.Optimize.DEFAULT]
converter.representative_dataset = representative_dataset_gen
tflite_quant_model = converter.convert()

# force full quantazation w
converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS_INT8]
converter.inference_input_type = tf.uint8
converter.inference_output_type = tf.uint8


# float 16 quantazitaion of weights 
converter = tf.lite.TFLiteConverter.from_saved_model(saved_model_dir)
converter.optimizations = [tf.lite.Optimize.DEFAULT]
converter.target_spec.supported_types = [tf.lite.constants.FLOAT16]
tflite_quant_model = converter.convert()




## integer 8 


# integer 16
# integer 32
# integer 64

# floating point 16

# floating point 32