#!/usr/bin/python3.5

# for host
### for disabling gpu
#import os
#
#os.environ['CUDA_VISIBLE_DEVICES'] = '' 
#import tensorflow.lite as tflite

# for target
import tflite_runtime.interpreter as tflite

import numpy as np
import time
import os
import cffi

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

# load library , the design is loaded inside the embedded python code of .so 
DTPU_lib=tflite.load_delegate("./DTPU_delegate.so",options=[])

# precision of accelerator 
ACTIVATE_CHAIN=0x1
INT8=0x1
INT16=0X3
INT32=0x7
INT64=0xF
SIGNED=0x1
NO_SIGNED=0x0
# precision of fp computation is tuned using the 
# integer precision 
NO_FP=0
ACTIVE_FP=1<<0
ACTIVE_BFP=0x03
WMEM_STARTING_ADDRESS=0 #32 MSB 
ffi=cffi.FFI()
data_type=ffi.cast("int",((NO_SIGNED <<8 )| (NO_FP<<5)|(ACTIVATE_CHAIN<<4)| INT8))
DTPU_lib._library.SelectDataTypeComputation( int(data_type))

# DTPU_lib._library.functionName()
########################################
##### RUN TENSORFLOW LITE MODELS #######
########################################

model_name="mnist_model_quant_uint8" #changing model and bitwidth
tflite_model_file="./"+model_name+".tflite"
print("Executing model:" , model_name)
# Load TFLite model and allocate tensors.
interpreter = tflite.Interpreter(model_path=tflite_model_file,experimental_delegates=[DTPU_lib])
interpreter_no_delegate=tflite.Interpreter(model_path=tflite_model_file)
interpreter.allocate_tensors()
interpreter_no_delegate.allocate_tensors()

# Get input and output tensors.
input_details = interpreter.get_input_details() #[0]["index"]
output_details = interpreter.get_output_details()# [0]["index"]


# numpy array previosly generated ( shape equal to the one needed by the NN )


input_details_no_delegate = interpreter_no_delegate.get_input_details() #[0]["index"]
output_details_no_delegate = interpreter_no_delegate.get_output_details()# [0]["index"]


# Test model on random input data. 
input_shape = input_details[0]['shape']
input_data = np.array(np.random.random_sample(input_shape), dtype=np.float32)
interpreter.set_tensor(input_details[0]['index'], input_data)

interpreter_no_delegate.set_tensor(input_details[0]['index'], input_data)
#input_shape_no_delegate = input_details_no_delegate[0]['shape']
#input_data_no_delegate = np.array(np.random.random_sample(input_shape_no_delegate), dtype=np.float32)#
#interpreter_no_delegate.set_tensor(input_details_no_delegate[0]['index'], input_data_no_delegate)


DTPU_lib._library.activate_time_probe(True)
#start a thread which sample temperature and voltages from xadC
DTPU_lib._library.measure_power_consumption()

avg_time=0.00
for i in range(10):
	start_time=time.time()
	interpreter.invoke()
	end_time=time.time()
	avg_time+=end_time-start_time

avg_time=avg_time/10
DTPU_lib._library.print_power_consumption()


avg_time_no_delegate=0.00
for i in range(10):
	start_time_no_delegate=time.time()
	interpreter_no_delegate.invoke()
	end_time_no_delegate=time.time()
	avg_time_no_delegate+=end_time_no_delegate-start_time_no_delegate

avg_time_no_delegate=avg_time_no_delegate/10

# The function `get_tensor()` returns a copy of the tensor data.
# Use `tensor()` in order to get a pointer to the tensor.
print("output data  with delegate")
output_data = interpreter.get_tensor(output_details[0]['index'])
print(output_data)
print("output data without the delegate")
output_data_no_delegate = interpreter_no_delegate.get_tensor(output_details_no_delegate[0]['index'])
print(output_data_no_delegate)


print("Average execution time on cpu: ",avg_time_no_delegate)
print("Average Execution time on cpu and accelerator: ", avg_time)
DTPU_lib._library.print_execution_stats()
exit();
#### get tensor weight from tensorflow python 

#data=interpreter_no_delegate.get_tensors_details()
#
#for layer in data:
#	interpreter_no_delegate.get_tensor(layer['index'])
