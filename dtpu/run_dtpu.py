#!/bin/usr/python3
from pynq import Overlay
from pynq import MMIO
from pynq import allocate
#from pynq.lib import dma
from pynq import Xlnk
import time

######################################### 
############ MEMORY MAP #################
#########################################
BASE_ADDRESS_ACCELERATOR=0x43C00000
ADDRESS_RANGE_ACCELERATOR=0x10000

# address reg offset 
CTRL =0x0000
STATUS =0x0004
IARG_RQT_EN =0x0010
OARG_RQT_EN =0x0014
CMD =0x0028 
OARG_LENGTH_MODE =0x003C 
ISCALAR_FIFO_RST =0x0040 
OSCALAR_FIFO_RST =0x0044 
ISCALAR_RQT_EN =0x0048 
OSCALAR_RQT_EN =0x004C 
ISCALAR0_DATA =0x0080 
ISCALAR1_DATA =0x0084 
ISCALAR2_DATA =0x0088 
ISCALAR3_DATA =0x008C 
ISCALAR4_DATA =0x0090 
ISCALAR5_DATA =0x0094 
ISCALAR6_DATA =0x0098 
ISCALAR7_DATA =0x009C
ISCALAR8_DATA =0x00A0
ISCALAR9_DATA =0x00A4
ISCALAR10_DATA=0x00A8
ISCALAR11_DATA =0x00AC
ISCALAR12_DATA =0x00B0
ISCALAR13_DATA =0x00B4
ISCALAR14_DATA =0x00B8
ISCALAR15_DATA =0x00BC
OSCALAR0_DATA =0x00C0
OSCALAR1_DATA =0x00C4
OSCALAR2_DATA =0x00C8
OSCALAR3_DATA =0x00CC
OSCALAR4_DATA =0x00D0
OSCALAR5_DATA =0x00D4
OSCALAR6_DATA =0x00D8
OSCALAR7_DATA =0x00DC
IARG0_STATUS =0x0100
IARG1_STATUS =0x0104
IARG2_STATUS =0x0108
IARG3_STATUS =0x010C
IARG4_STATUS =0x0110
IARG5_STATUS =0x0114
IARG6_STATUS =0x0118
IARG7_STATUS =0x011C
OARG0_STATUS =0x0140
OARG1_STATUS =0x0144
OARG2_STATUS =0x0148
OARG3_STATUS =0x014C
OARG4_STATUS =0x0150
OARG5_STATUS =0x0154
OARG6_STATUS =0x0158
OARG7_STATUS =0x015C
ISCALAR0_STATUS =0x0180
ISCALAR1_STATUS =0x0184
ISCALAR2_STATUS =0x0188
ISCALAR3_STATUS =0x018C
ISCALAR4_STATUS =0x0190 
ISCALAR5_STATUS =0x0194 
ISCALAR6_STATUS =0x0198 
ISCALAR7_STATUS =0x019C 
ISCALAR8_STATUS =0x01A0 
ISCALAR9_STATUS =0x01A4 
ISCALAR10_STATUS =0x01A8 
ISCALAR11_STATUS =0x01AC 
ISCALAR12_STATUS =0x01B0 
ISCALAR13_STATUS =0x01B4 
ISCALAR14_STATUS =0x01B8 
ISCALAR15_STATUS =0x01BC 
OSCALAR0_STATUS =0x01C0 
OSCALAR1_STATUS =0x01C4 
OSCALAR2_STATUS =0x01C8 
OSCALAR3_STATUS =0x01CC 
OSCALAR4_STATUS =0x01D0 
OSCALAR5_STATUS =0x01D4 
OSCALAR6_STATUS =0x01D8 
OSCALAR7_STATUS =0x01DC 
OSCALAR8_STATUS =0x01E0 
OSCALAR9_STATUS =0x01E4 
OSCALAR10_STATUS =0x01E8 
OSCALAR11_STATUS =0x01EC 
OSCALAR12_STATUS =0x01F0 
OSCALAR13_STATUS =0x01F4 
OSCALAR14_STATUS =0x01F8 
OSCALAR15_STATUS =0x01FC 
OARG0_LENGTH =0x0200 
OARG1_LENGTH =0x0204 
OARG2_LENGTH =0x0208 
OARG3_LENGTH =0x020C 
OARG4_LENGTH =0x0210 
OARG5_LENGTH =0x0214 
OARG6_LENGTH =0x0218 
OARG7_LENGTH =0x021C 
OARG0_TDEST =0x0240 
OARG1_TDEST =0x0244 
OARG2_TDEST =0x0248 
OARG3_TDEST =0x024C 
OARG4_TDEST =0x0250 
OARG5_TDEST =0x0254 
OARG6_TDEST =0x0258 
OARG7_TDEST =0x025C 
BASE_ADDRESS_INTC=0x40800000
ADDRESS_RANGE_INTC=0x10000


BASE_ADDRESS_DMA_INFIFO=0x40400000
ADDRESS_RANGE_DMA_INFIFO=0x10000
BASE_ADDRESS_DMA_WM=0x40410000
ADDRESS_RANGE_DMA_WM=0x10000
# load overlay
overlay = Overlay("/home/xilinx/pynqz2.bit") # tcl is also parsed

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
input_fifo_buffer = xlnk.cma_array(shape=(1024,),dtype='u8',cacheable=True)
output_fifo_buffer=xlnk.cma_array(shape=(1024,),dtype='u8',cacheable=True)
weight_buffer=xlnk.cma_array(shape=(4096,),dtype='u8',cacheable=True)
csr_buffer=xlnk.cma_array(shape=(2048,),dtype='u8',cacheable=True)

## populate input fifo
for i in range(input_fifo_buffer.size):
    input_fifo_buffer[i]=0xcafecafecafecafe

## populate weights
for i in range(weight_buffer.size):
    weight_buffer[i]=0xFFFFFFFFFFFFFFFF

## populate csr 
for i in range(csr_buffer.size):
    csr_buffer[i]=1   


## accelerator 
accelerator=overlay.dtpu.axis_accelerator_ada
# soft reset 
accelerator.write(CTRL ,0x0000001)
accelerator.write(CTRL,0x0000000)


################################################
###### program the dma for the csr reg #########
################################################
if 'driver_csr' in locals():
    driver_csr.recvchannel.start()
else: 
    driver_csr=overlay.axi_dma_csr_mem

driver_csr.sendchannel.transfer(csr_buffer)
driver_csr.sendchannel.wait()


################################################
###### program the dma for the weight ##########
################################################
if 'driver_wm' in locals():
    driver_wm.sendchannel.start()
else:
    driver_wm=overlay.axi_dma_weight_mem

driver_wm.sendchannel.transfer(weight_buffer)
driver_wm.sendchannel.wait()




######################################################
###### program the dma for the in/out fifos ##########
######################################################
if 'driver_fifo' in locals():
    driver_fifo.sendchannel.start()
    driver_fifo.recvchannel.start()
else:
    driver_fifo=overlay.axi_dma_infifo

driver_fifo.sendchannel.transfer(input_fifo_buffer)
driver_fifo.sendchannel.wait()


################################################
### program accelerator&start computation ######
###             matrix 8x8 macs           ######
################################################



 #Configure Input Argument Request Enable Register (0x0010) to define input buffer
#selection for ap_start generation. start is generated only if the selected input
#argument buffer has data available. By default, all input argument buffer are considered
#for start generation
# with zero start independently from dava avialability
accelerator.write(IARG_RQT_EN,0x000000007) ## all data avialable csr, weights and data
#Configure Output Argument Request Enable Register (0x0014) to define output buffer
#selection for ap_start generation. start is generated only if the selected output
#argument buffer has space available. By default, all input argument buffer are
#considered for start generation.
accelerator.write(OARG_RQT_EN,1) # out fifo must be empty 
accelerator.write(OARG_LENGTH_MODE,0) # hardware mode

# optional configure input scalar request enable  and update them 
accelerator.write(ISCALAR_RQT_EN,0) # NO input SCALAR
accelerator.write(OSCALAR_RQT_EN,0) # no output scalar

#Write TDEST value in Output Argument TDEST Register (0x0240 to 0x025C).
accelerator.write(OARG0_TDEST,0) # only one output 

#Write Execute command 0x00020000 in Command Register (0x0028) to start the
#operation.
start_time = time.time()
#accelerator.write(CMD, 0x00010001)
# 5 instead of 2 for continous runs
accelerator.write(CMD, 0x00020001) # execute one step 

accelerator.read(OARG0_STATUS) # check output buffer status
#After completing the Accelerator operation, done status is updated in the Status
#Register (0x0004). Output scalar data can be read now from OSCALAR_DATA and
#IO_OSCALAR_DATA.
done=0
while (done&0x2)!=2:
  #  accelerator.write(CMD,0x0FF10001)#update output
   # accelerator.write(CMD,0x0FF20001)#update output
    #time.sleep(3)
    ## check done signal
    done=accelerator.read(STATUS)
    if (done&0x2)== 2:
        print ("accelerator is done")
    elif (done&0x4)== 4:
        print("accelerator is idle")
    elif (done&0x8) == 8:
        print("accelerator is ready")
    else:
        print("accelerator is still working",bin(done))

#Write Update Output command to adapter by writing 0x00000003 to Command Register
#(0x0028). By writing 1 to the argument, mask moves the input buffer pointer to the next

#position in multi-buffer. Writing 0 reuses the same buffer.
#accelerator.write(CMD,0x00000001)

accelerator.write(STATUS,0x00000003)##clear status

driver_fifo.recvchannel.transfer(output_fifo_buffer)
## retrieve the results and print 
driver_fifo.recvchannel.wait()
stop_time = time.time()

## first value should be 2457
print(*output_fifo_buffer[0:10])
hw_exec_time = stop_time-start_time
print('Hardware DTPU execution time: ',hw_exec_time)


### free buffers

input_fifo_buffer.close()
output_fifo_buffer.close()
csr_buffer.close()
weight_buffer.close()



############################################################
##################  PYNQ  PACKAGES #########################
############################################################
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
