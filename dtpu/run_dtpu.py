#!/bin/usr/python3

#######TODO
DTPU_BASE_ADDRESS_AXI =0x43C00000  
ADDRESS_RANGE = 0x10000
DTPU_BASE_ADDRESS_SAXI_WM =0x10000000  #TODO
ADDRESS_RANGE_WM = 0x400000


DTPU_BASE_ADDRESS_SAXI_CSR =0x10000000  #TODO
ADDRESS_RANGE_CSR = 0x400000

DTPU_BASE_ADDRESS_SAXI_INFIFO = 0x1040000
ADDRESS_RANGE_INFIFO = 0x400000

DTPU_BASE_ADDRESS_SAXI_OUTFIFO =0x11000000  #TODO
ADDRESS_RANGE_OUTFIFO = 0x1000000

ADDRESS_OFFSET = 0x10

from pynq import Overlay
from pynq import MMIO
from pynq import allocate


# load overlay
overlay = Overlay("dtpu.bit") # tcl is also parsed

overlay.download() # Explicitly download bitstream to PL

if overlay.is_loaded():
 # Checks if a bitstream is loaded
 print("overlay is loaded")
else :
	print("overlay is not loaded")
	exit(-1)


### allocate buffers for input and outpuf fifo
## default 32 bit integer
input_fifo_buffer = allocate(shape=(2048),dtype='u4')
output_fifo_buffer=allocate(shape=(2048),dtype='u4')



## populate input fifo
for i in range(input_fifo_buffer.size):
    input_fifo_buffer[i]=0xcafecafe


#Flushing the buffer to ensure the updated data is visible to the programmable logic:
input_fifo_buffer.flush()


## instantiate thee memory i/o classes
wm = MMIO(DTPU_BASE_ADDRESS_SAXI_WM, ADDRESS_RANGE)
csr = MMIO(DTPU_BASE_ADDRESS_SAXI_CSR, ADDRESS_RANGE)
infifo = MMIO(DTPU_BASE_ADDRESS_SAXI_INFIFO, ADDRESS_RANGE)
outfifo = MMIO(DTPU_BASE_ADDRESS_SAXI_OUTFIFO, ADDRESS_RANGE)




data = 0xcafecafe
weight= 0x11111111

wm.write( ADDRESS_OFFSET,wwm.eight)
csr.write(  ,weight) # just check
infifo.write(,data)


result = outfifo.read(ADDRESS_OFFSET)
## print result
print(*result)






async def interrupt_handler_async(self, value):
    if self.iop.interrupt is None:
        raise RuntimeError('Interrupts not available in this Overlay')
    while(1):
        await self.iop.interrupt.wait() # Wait for interrupt
        # Do something when an interrupt is received
        print("interrupt re")
        self.iop.interrupt.clear()

interrupt_handler_async(self,89)

#####################################################
################## PACKAGES #########################
#####################################################
#         pynq.ps - Facilitates management of the Processing System (PS) and PS/PL interface.
#         pynq.pl - Facilitates management of the Programmable Logic (PL).
#         pynq.overlay - Manages the state, drivers, and and contents of overlays.
#         pynq.bitstream - Instantiates class for PL bitstream (full/partial).
#         pynq.devicetree - Instantiates the device tree segment class.

# Data Movement modules:

#         pynq.mmio - Implements PYNQ Memory Mapped IO (MMIO) API
#         pynq.gpio - Implements PYNQ General-Purpose IO (GPIO) by wrapping the Linux Sysfs API
#         pynq.xlnk - Implements Contiguous Memory Allocation for PYNQ DMA
#         pynq.buffer - Implements a buffer class for DMA engines and accelerators

# Additional modules:

#         pynq. - Implements PYNQ asyncio
#         pynq.pmbus - PYNQ class for reading power measurements from PMBus
#         pynq.uio - Interacts directly with a UIO device
#         pynq.registers - Allows users to access registers easily
#         pynq.utils - Functions for assisting with installation and testing
from pynq import alllocate
from pynq.lib import DMA

dma_ip=ol.ip_dict['axi_dma_0']
driver=dma_ip['driver']


output_buffer= allocate(shape(,),dtype=np.uint32)
driver.recvchannel.transfer(output_buffer)
drier.recvchannel.wait()


https://pynq.readthedocs.io/en/v2.4/pynq_libraries/dma.html








from pynq import Overlay
import pynq.lib.dma

# Load the overlay
overlay = Overlay('/home/xilinx/pynq/overlays/fir_accel/fir_accel.bit')

# Load the FIR DMA
dma = overlay.filter.fir_dma

In [7]:

from pynq import Xlnk
import numpy as np

# Allocate buffers for the input and output signals
xlnk = Xlnk()
in_buffer = xlnk.cma_array(shape=(n,), dtype=np.int32)
out_buffer = xlnk.cma_array(shape=(n,), dtype=np.int32)

# Copy the samples to the in_buffer
np.copyto(in_buffer,samples)

# Trigger the DMA transfer and wait for the result
import time
start_time = time.time()
dma.sendchannel.transfer(in_buffer)
dma.recvchannel.transfer(out_buffer)
dma.sendchannel.wait()
dma.recvchannel.wait()
stop_time = time.time()
hw_exec_time = stop_time-start_time
print('Hardware FIR execution time: ',hw_exec_time)
print('Hardware acceleration factor: ',sw_exec_time / hw_exec_time)

# Plot to the notebook
plot_to_notebook(t,samples,1000,out_signal=out_buffer)

# Free the buffers
in_buffer.close()
out_buffer.close()

