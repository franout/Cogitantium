#!/bin/usr/python3
from pynq import Overlay
from pynq import MMIO
from pynq import allocate
from pynq.lib import DMA
from pynq import Xlnk
import time

######################################### 
############ MEMORY MAP #################
#########################################
BASE_ADDRESS_ACCELERATOR=0x43C00000
ADDRESS_RANGE_ACCELERATOR=0x10000
ADDRESS_OFFSET_SOFT_RESET_CSR=0x0000
ADDRESS_OFFSET_INPUT_REQUEST_EN=0x0010
ADDRESS_OFFSET_OUTPUT_REQUEST_EN=0x0014
ADDRESS_OFFSET_INSCALAR_REQUEST_EN=0x0048
ADDRESS_OFFSET_OUTSCALAR_REQUEST_EN=0x004C
ADDRESS_OFFSET_UPDATE_OUTCMD=0x0028
ADDRESS_OFFSET_TDEST_IN=0x0240 
ADDRESS_OFFSET_TDEST_FIN=0x025C
ADDDRES_OFFSET_EXECUTE_CMD_REG=0x0028
ADDRESS_OFFSET_DONE_REG=0x0004

BASE_ADDRESS_DMA_INFIFO=0x40400000
ADDRESS_RANGE_DMA_INFIFO=0x10000
BASE_ADDRESS_DMA_WM=0x40410000
ADDRESS_RANGE_DMA_WM=0x10000
# load overlay
overlay = Overlay("/home/xilinx/dtpu.bit") # tcl is also parsed

overlay.download() # Explicitly download bitstream to PL

if overlay.is_loaded():
 # Checks if a bitstream is loaded
 print("overlay is loaded")
else :
	print("overlay is not loaded")
	exit(-1)


### allocate buffers for input and outpuf fifo in main memory 
## default 32 bit integer
# Allocate buffers for the input and output signals ( contigous memory allocation )
xlnk = Xlnk()
input_fifo_buffer = xlnk.cma_array(shape=(4096,),dtype='u4')
output_fifo_buffer=xlnk.cma_array(shape=(4096,),dtype='u4')
weight_buffer=xlnk.cma_array(shape=(32768,),dtype='u4')

## populate input fifo
for i in range(input_fifo_buffer.size):
    input_fifo_buffer[i]=0xcafecafe

## populate weights
for i in range(weight_buffer.size):
    weight_buffer[i]=0xFFFFFFFF

input_fifo_buffer.flush()
weight_buffer.flush()

################################################
###### program the dma for the weight ##########
################################################

dma_ip_weight=overlay.ip_dict['axi_dma_infifo']
driver_wm=dma_ip_weight['driver']

## load in accelerator memory 
driver_wm.sendchannel.transfer(weight_buffer)
driver_wm.sendchannel.wait()




######################################################
###### program the dma for the in/out fifos ##########
######################################################
dma_ip_fifo=overlay.ip_dict['axi_dma_weight_mem']
driver_fifo=dma_ip_fifo['']


driver_fifo.sendchannel.transfer(input_fifo_buffer)
driver_fifo.sendchannel.wait()


################################################
### program accelerator&start computation ######
################################################

accelerator= MMIO(BASE_ADDRESS_ACCELERATOR,ADDRESS_RANGE_ACCELERATOR)
# soft reset 
accelerator.write( ADDRESS_SOFT_RESET_CSR,hex(1))

 #Configure Input Argument Request Enable Register (0x0010) to define input buffer
#selection for ap_start generation. start is generated only if the selected input
#argument buffer has data available. By default, all input argument buffer are considered
#for start generation
accelerator.write(ADDRESS_OFFSET_INPUT_REQUEST_EN,hex())
#Configure Output Argument Request Enable Register (0x0014) to define output buffer
#selection for ap_start generation. start is generated only if the selected output
#argument buffer has space available. By default, all input argument buffer are
#considered for start generation.
accelerator.write(ADDRESS_OFFSET_OUTPUT_REQUEST_EN,hex())
# optional configure input scalar request enable  and update them 


#Write Update Output command to adapter by writing 0x00010001 to Command Register
#(0x0028). By writing 1 to the argument, mask moves the output buffer to the next
#position on every data output on stream channel
accelerator.write(ADDRESS_OFFSET_UPDATE_OUTCMD ,hex(0x00010001))

#Write TDEST value in Output Argument TDEST Register (0x0240 to 0x025C).
accelerator.write(ADDRESS_OFFSET_TDEST_IN,hex())

#Write Execute command 0x00020000 in Command Register (0x0028) to start the
#operation.
start_time = time.time()
accelerator.write(ADDDRES_OFFSET_EXECUTE_CMD_REG,hex(0x000200000))

#After completing the Accelerator operation, done status is updated in the Status
#Register (0x0004). Output scalar data can be read now from OSCALAR_DATA and
#IO_OSCALAR_DATA.

#Write Update Output command to adapter by writing 0x00000003 to Command Register
#(0x0028). By writing 1 to the argument, mask moves the input buffer pointer to the next
#position in multi-buffer. Writing 0 reuses the same buffer.
accelerator.write(ADDDRES_OFFSET_EXECUTE_CMD_REG,hex(0x00000003))

time.sleep(3)
## check done signal 
done=accelerator.read(ADDRESS_OFFSET_DONE_REG)
if done:
    print ("accelerator is done")
else:
    print("accelerator is still working")


## retrieve the results and print 
driver_fifo.recvchannel.transfer(output_fifo_buffer)
driver_fifo.recvchannel.wait()
stop_time = time.time()

print(*output_fifo_buffer)

hw_exec_time = stop_time-start_time
print('Hardware DTPU execution time: ',hw_exec_time)


### free buffers

input_fifo_buffer.close()
output_fifo_buffer.close()


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


exit()

async def interrupt_handler_async(self, value):
    if self.iop.interrupt is None:
        raise RuntimeError('Interrupts not available in this Overlay')
    while(1):
        await self.iop.interrupt.wait() # Wait for interrupt
        # Do something when an interrupt is received
        print("interrupt re")
        self.iop.interrupt.clear()

interrupt_handler_async(self,89)
