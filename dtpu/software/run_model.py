#!/usr/bin/python3.5


import tensorflow.lite as tflite
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
DTPU_lib=tflite.experimental.load_delegate("./DTPU_delegate.so")
# DTPU_lib._library.functionName()
########################################
##### RUN TENSORFLOW LITE MODELS #######
########################################

model_name="mnist_model_quant_uint8"
tflite_model_file="./"+model_name+".tflite"

# Load TFLite model and allocate tensors.
interpreter = tflite.Interpreter(model_path=tflite_model_file,experimental_delegates=[DTPU_lib])
interpreter.allocate_tensors()

# precision of accelerator 
ACTIVATE_CHAIN=0x1
INT8=0x1
INT16=0X03
INT32=0x07
INT64=0x0F
# precision of fp computation is tuned using the 
# integer precision 
NO_FP=0
ACTIVE_FP=1<<0
ACTIVE_BFP=0x03
WMEM_STARTING_ADDRESS=0 #32 MSB 
ffi=cffi.FFI()
data_type=ffi.cast("int",(WMEM_STARTING_ADDRESS<<32)|(NO_FP<<8)|(ACTIVATE_CHAIN<<4)| INT8)
DTPU_lib._library.SelectDataTypeComputation( data_type.__int__())

# Get input and output tensors.
input_details = interpreter.get_input_details() #[0]["index"]
output_details = interpreter.get_output_details()# [0]["index"]

# Test model on random input data.
input_shape = input_details[0]['shape']
input_data = np.array(np.random.random_sample(input_shape), dtype=np.float32)
interpreter.set_tensor(input_details[0]['index'], input_data)

#start a thread which sample temperature and voltages from xadc

start_time=time.time()


try:
	interpreter.invoke()
except OverflowError as overror:
	print(overror)
except ReferenceError as referror:
	print(referror)
except RuntimeError as runerror:
	print(runerror)
except OSError as oserror:
	print(oserror)
except NotImplementedError as notexisterror:
	print(notexisterror)
except NameError as namerror:
	print(namerror)
except MemoryError as memerror:
	print(memerror)
except KeyError as keyerror:
	print(keyerror)
except AttributeError as atterror:
	print(atterror)
except ValueError as valerror:
	print(valerror)


end_time=time.time()
# The function `get_tensor()` returns a copy of the tensor data.
# Use `tensor()` in order to get a pointer to the tensor.
output_data = interpreter.get_tensor(output_details[0]['index'])
print(output_data)
print("Execution time on cpu: ", end_time- start_time)


exit();

test_image = np.expand_dims(test_images[0], axis=0).astype(np.float32)

input_index = interpreter.get_input_details()[0]["index"]
output_index = interpreter.get_output_details()[0]["index"]

interpreter.set_tensor(input_index, test_image)
interpreter.invoke()
predictions = interpreter.get_tensor(output_index)
