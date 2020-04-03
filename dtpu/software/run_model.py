#!/usr/bin/python3

import tflite_runtime.interpreter as tflite
import numpy as np
from pynq import Overlay
from pynq import allocate
from pynq import Xlnk
import time
import os


#########################################################
###### NOTE: this code has to be executed on the    #####
###### pynq z2 board with tensorflow lite installed #####
##################							#############
##################			!				#############
##################		   ! !				#############
##################		  !   !				#############
##################		 !  !  !			#############
##################		!   !   !			#############
##################	   !    !    !			#############
##################	  !     !     !			#############
##################	 !      !      !		#############
##################	!		!    	!		#############
##################	!!!!!!!!!!!!!!!!!		#############
##################							#############
#########################################################
#########################################################
##### DELEGATE METHOD FOR RUNNING INFERENCE ON DTPU #####
#########################################################

























########################################
##### RUN TENSORFLOW LITE MODELS #######
########################################

model_name="mnist_model_quant_uint8"
tflite_model_file="./"+model_name+".tflite"

# Load TFLite model and allocate tensors.
interpreter = tflite.Interpreter(model_path=tflite_model_file)
interpreter.allocate_tensors()

# Get input and output tensors.
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

# Test model on random input data.
input_shape = input_details[0]['shape']
input_data = np.array(np.random.random_sample(input_shape), dtype=np.float32)
interpreter.set_tensor(input_details[0]['index'], input_data)

interpreter.invoke()

# The function `get_tensor()` returns a copy of the tensor data.
# Use `tensor()` in order to get a pointer to the tensor.
output_data = interpreter.get_tensor(output_details[0]['index'])
print(output_data)
