
<a href="https://mytechdecisions.com"><img src="https://mytechdecisions.com/wp-content/uploads/2019/09/AdobeStock_245601545.jpeg" title="Machine Learning" ></a>

<!-- [![FVCproductions](https://avatars1.githubusercontent.com/u/4284691?v=3&s=200)](http://fvcproductions.com) -->


# Cogitantium

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Build Status](http://img.shields.io/travis/badges/badgerbadgerbadger.svg?style=flat-square)](https://travis-ci.org/badges/badgerbadgerbadger) 

Hardware accelerator for Machine Learning on TUL PYNQ™-Z2 board, based on Xilinx Zynq SoC 

Erasmus Master Thesis  @Chalmers University of Technology and Polythecnic of Turin


## Table of Contents 


- [Installation](#installation)
- [Setup](#setup)
- [Features](#features)
- [Architecture](#architecture)
- [Software](#software)
- [Tests](#tests)
- [Documentation](#documentation)
- [License](#license)


### Clone

- Clone this repo to your local machine using and feel free to contribute!
  ```shell
  $ git clone https://github.com/franout/Cogitantium.git
  ```
  
## Installation
- For using the accelerator you only need to install tensorflow wheel and python according to   <a href="https://github.com/franout/tensorflow_for_pynqz2" target="_blank">`Tensorflow for Pynq-Z2 `</a> :
The following command are used for loading and using the accelerator into the Tensorflow Lite environment:
```python
DTPU_lib=tflite.load_delegate("./DTPU_delegate.so",options=[])
interpreter = tflite.Interpreter(model_path=tflite_model_file,experimental_delegates=[DTPU_lib])
```

### Setup

- For editing, simulating and synthesizing the verilog code you can use whatever IDE and tools you prefer.
  In this project Xilinx Vivado Tools have been used

## Features
- The hardware accelerator is capable of tensor convolution, generally speaking matrix multiplication and accumulation.
## Architecture
-General architecture
-Customizable hardware parameters 
## Software
## Documentation 
- IN PROGRESS

## Tests 
For testing the solo accelerator you can use the run_dtpu.py script in dtpu/software

## Useful Link 

Reach out to me at one of the following places!

-  <a href="https://pynq.readthedocs.io/en/v2.5/getting_started/pynq_z2_setup.html" target="_blank">`Pynq Tutorial `</a>
-  <a href="https://www.tensorflow.org/">`Tensorflow `</a>
-  <a href="https://xilinx-wiki.atlassian.net/wiki/spaces/A/overview" target="_blank">`Zynq wiki `</a>
-  <a href="https://cffi.readthedocs.io/en/latest/" target="_blank">`C  function foreign interface `</a>



## License
GNU General Public License v3.0



