#!/usr/bin/python
import tensorflow as tf
import tensorflow_hub as hub
import os

PREFIX_PATH="./"
MODEL_NAME="try"
OUTPUT_FOLDER=PREFIX_PATH+"model_cache/output"

###########################
#### build mnist model ####
###########################

#setup
import logging
logging.getLogger("tensorflow").setLevel(logging.DEBUG)

try:
  # %tensorflow_version only exists in Colab.
  import tensorflow.compat.v2 as tf
except Exception:
  pass
tf.enable_v2_behavior()

from tensorflow import keras
import numpy as np
import pathlib


# Load MNIST dataset
mnist = keras.datasets.mnist
(train_images, train_labels), (test_images, test_labels) = mnist.load_data()

# Normalize the input image so that each pixel value is between 0 to 1.
train_images = train_images / 255.0
test_images = test_images / 255.0

# Define the model architecture
model = keras.Sequential([
  keras.layers.InputLayer(input_shape=(28, 28)),
  keras.layers.Reshape(target_shape=(28, 28, 1)),
  keras.layers.Conv2D(filters=12, kernel_size=(3, 3), activation=tf.nn.relu),
  keras.layers.MaxPooling2D(pool_size=(2, 2)),
  keras.layers.Flatten(),
  keras.layers.Dense(10, activation=tf.nn.softmax)
])

# Train the digit classification model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])
model.fit(
  train_images,
  train_labels,
  epochs=1,
  validation_data=(test_images, test_labels)
)


converter = tf.lite.TFLiteConverter.from_keras_model(model)
tflite_model = converter.convert()


tflite_models_dir = pathlib.Path("./model_cache/output/mnist")
tflite_models_dir.mkdir(exist_ok=True, parents=True)


tflite_model_file = tflite_models_dir/"mnist_model.tflite"
tflite_model_file.write_bytes(tflite_model)

#To quantize the model on export, set the optimizations flag to optimize for size:
converter.optimizations = [tf.lite.Optimize.OPTIMIZE_FOR_SIZE]
tflite_quant_model = converter.convert()
tflite_model_quant_file = tflite_models_dir/"mnist_model_quant.tflite"
tflite_model_quant_file.write_bytes(tflite_quant_model)



#### run the tflite model

## load model into the interpreter
interpreter = tf.lite.Interpreter(model_path=str(tflite_model_file))
interpreter.allocate_tensors()

interpreter_quant = tf.lite.Interpreter(model_path=str(tflite_model_quant_file))
interpreter_quant.allocate_tensors()

# test model on one image
test_image = np.expand_dims(test_images[0], axis=0).astype(np.float32)

input_index = interpreter.get_input_details()[0]["index"]
output_index = interpreter.get_output_details()[0]["index"]

interpreter.set_tensor(input_index, test_image)
interpreter.invoke()
predictions = interpreter.get_tensor(output_index)


import matplotlib.pylab as plt

plt.imshow(test_images[0])
template = "True:{true}, predicted:{predict}"
_ = plt.title(template.format(true= str(test_labels[0]),
                              predict=str(np.argmax(predictions[0]))))
plt.grid(False)



## evaluate model 
# A helper function to evaluate the TF Lite model using "test" dataset.
def evaluate_model(interpreter):
	input_index = interpreter.get_input_details()[0]["index"]
	output_index = interpreter.get_output_details()[0]["index"]

	# Run predictions on every image in the "test" dataset.
	prediction_digits = []
	for test_image in test_images:
  		# Pre-processing: add batch dimension and convert to float32 to match with
    	# the model's input data format.
    	test_image = np.expand_dims(test_image, axis=0).astype(np.float32)
    	interpreter.set_tensor(input_index, test_image)
	# Run inference.
	interpreter.invoke()
	# Post-processing: remove batch dimension and find the digit with highest
	# probability.
	output = interpreter.tensor(output_index)
	digit = np.argmax(output()[0])
	prediction_digits.append(digit)
	# Compare prediction results with ground truth labels to calculate accuracy.	
	accurate_count = 0
	for index in range(len(prediction_digits)):
		if prediction_digits[index] == test_labels[index]:
			accurate_count += 1
	accuracy = accurate_count * 1.0 / len(prediction_digits)
	return accuracy


print(evaluate_model(interpreter))

print(evaluate_model(interpreter_quant))




### optimize resnet for vision application 
import tensorflow_hub as hub

resnet_v2_101 = tf.keras.Sequential([
  keras.layers.InputLayer(input_shape=(224, 224, 3)),
  hub.KerasLayer("https://tfhub.dev/google/imagenet/resnet_v2_101/classification/4")
])

converter = tf.lite.TFLiteConverter.from_keras_model(resnet_v2_101)

# Convert to TF Lite without quantization

tflite_models_dir = pathlib.Path("./model_cache/output/resnet_v2_101")
tflite_models_dir.mkdir(exist_ok=True, parents=True)

resnet_tflite_file = tflite_models_dir/"resnet_v2_101.tflite"
resnet_tflite_file.write_bytes(converter.convert())


# Convert to TF Lite with quantization
converter.optimizations = [tf.lite.Optimize.OPTIMIZE_FOR_SIZE]
resnet_quantized_tflite_file = tflite_models_dir/"resnet_v2_101_quantized.tflite"
resnet_quantized_tflite_file.write_bytes(converter.convert())


#The model size reduces from 171 MB to 43 MB. 
#The accuracy of this model on imagenet can be evaluated using the 
#scripts provided for TFLite accuracy measurement.
#https://github.com/tensorflow/tensorflow/tree/master/tensorflow/lite/tools/accuracy/ilsvrc

### quantization guide
# https://www.tensorflow.org/lite/performance/model_optimization
