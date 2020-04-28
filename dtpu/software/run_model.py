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
##### A TensorFlow Lite delegate is a way 			#####
##### to delegate part or all of graph execution  	#####
#####  to another executor. 						#####
#########################################################





#### If a delegate was provided for specific operations, 
#### then TensorFlow Lite will split the graph into multiple 
#### subgraphs where each subgraph will be handled by a delegate
#### Each subgraph that is handled by a delegate will be replaced with a node that evaluates the subgraph on its invoked call.
#### Depending on the model, the final graph can end up with one node, 
#### which means that all of the graphs were delegated or multiple nodes 
#### handled the subgraphs. In general, you don't want to have multiple 
#### subgraphs handled by the delegate, since each time you switch from 
#### delegate to the main graph, there is an overhead for passing the 
#### results from the subgraph to the main graph. It's not always safe 
#### to share memory.


# 1)Define a kernel node that is responsible for evaluating the delegate subgraph
# 2)Create an instance of TfLiteDelegate, which is responsible for registering
#	 the kernel node and claiming the nodes that the delegate can execute


###############################
######## LOAD DESIGN ##########
###############################
overlay = Overlay("/home/xilinx/pynqz2.bit") # tcl is also parsed

overlay.download() # Explicitly download bitstream to PL

if overlay.is_loaded():
 # Checks if a bitstream is loaded
 print("overlay is loaded")
else :
	print("overlay is not loaded")
	exit(-1)

DTPU_lib=tflite.load_delegate("./DTPU_delegate.so")

WMEM_SIZE=2048
INFIFO_SIZE=2048
OUTFIFO_SIZE=2048
DATAWIDTH=64

DTPU=DTPU_lib.DTPU_delegate(WMEM_SIZE,INFIFO_SIZE,OUTFIFO_SIZE,DATAWIDTH,overlay.dtpu.axis_accelerator_ada)

########################################
##### RUN TENSORFLOW LITE MODELS #######
########################################

model_name="mnist_model_quant_uint8"
tflite_model_file="./"+model_name+".tflite"

# Load TFLite model and allocate tensors.
#experimental_delegate=
interpreter = tflite.Interpreter(model_path=tflite_model_file)
interpreter.allocate_tensors()

# Get input and output tensors.
input_details = interpreter.get_input_details() #[0]["index"]
output_details = interpreter.get_output_details()# [0]["index"]

# Test model on random input data.
input_shape = input_details[0]['shape']
input_data = np.array(np.random.random_sample(input_shape), dtype=np.uint8)
interpreter.set_tensor(input_details[0]['index'], input_data)

#start a thread which sample temperature and voltages from xadc

start_time=time.time()

#### TODO
interpreter.invoke()


end_time=time.time()
# The function `get_tensor()` returns a copy of the tensor data.
# Use `tensor()` in order to get a pointer to the tensor.
output_data = interpreter.get_tensor(output_details[0]['index'])
print(output_data)





test_image = np.expand_dims(test_images[0], axis=0).astype(np.float32)

input_index = interpreter.get_input_details()[0]["index"]
output_index = interpreter.get_output_details()[0]["index"]

interpreter.set_tensor(input_index, test_image)
interpreter.invoke()
predictions = interpreter.get_tensor(output_index)
