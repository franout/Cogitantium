from dtpu_lib import ffi
from pynq import Overlay
from pynq import allocate
from pynq import MMIO
from pynq import Xlnk
from pynq.lib import dma
import numpy as np
import struct # see https://docs.python.org/3/library/struct.html#struct-examples
_DEBUG_PRINT=True 
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
#####################################################
##########       CSR DEFINITIONS           ##########
##########          MEMORY MAP             ##########
##########          bitwidth 8             ##########
##########          see csr_definition.vh  ##########
#####################################################
ARITHMETIC_PRECISION=0
FP_MODE=1
BATCH_SIZE=2 # aka active rows
TRANSPARENT_DELAY_REGISTER=3
DEBUG=4
TEST_OPTIONS=5  
ACTIVATE_CHAIN=0x1
INT8=0x1
INT16=0X03
INT32=0x07
INT64=0x0F
# precision of fp computation is tuned using the 
# integer precision 
ACTIVE_FP=1
ACTIVE_BFP=0x03
ROUNDING=0x00
NO_FP=0x00
WMEM_STARTING_ADDRESS=0 #32 MSB 
##############################################
#### accelerator adapter command #############
##############################################
CMD_UPDATE_IN_ARDG=0x0
CMD_UPDATE_OUT_ARG=0x1
CMD_EXECUTE_STEP=0x2
CMD_EXECUTE_CONTINUOS=0x4
CMD_STOP_EXECUTE_CONTINOUS=0x5
##############################################
BASE_ADDRESS_INTC=0x40800000
ADDRESS_RANGE_INTC=0x10000
BASE_ADDRESS_DMA_INFIFO=0x40400000
ADDRESS_RANGE_DMA_INFIFO=0x10000
BASE_ADDRESS_DMA_WM=0x40410000
ADDRESS_RANGE_DMA_WM=0x10000
accelerator=None
input_fifo_buffer=None
output_fifo_buffer=None
weight_buffer=None
csr_buffer=None
overlay=None
driver_csr=None
driver_wm=None
driver_fifo_in=None
driver_fifo_out=None
#####################################
### DESIGN DEPENDENT DEFINITION #####
#####################################
WMEM_SIZE=131072 # 1Mbytes
INFIFO_SIZE=2048  #1Kbytes
OUTFIFO_SIZE=2048 #1Kbytes
ROWS=8
COLUMNS=8
DATAWIDTH=64
BUFFER_DEPTH=2
tot_size_weight=0
curr_data_precision=INT8
curr_bitwidth_data_computation=8
PACK_TYPE="b" # default is 1 byte #TODO CHECK SIGNED OR UNSIGNED OR ASK TO USER
FP=False
BFP=False
size_tot=0
input_size=0
output_size=0
num_weight=0
global_iteration=1 ## at least one execution of the tensor accelerator
global_iteration_shift_wm=[0]
tensors=[]
class Tensor:
  def __init__(self,data, tot_dim,size_l):
    self.tot_dim=tot_dim
    self.data=data
    self.size_l=size_l
######################################
############ LOAD DESIGN #############
######################################
@ffi.def_extern()
def load_overlay():
  global accelerator 
  global overlay
  overlay = Overlay("/home/xilinx/pynqz2.bit") # tcl is also parsed
  overlay.download() # Explicitly download bitstream to PL
  if overlay.is_loaded():
   # Checks if a bitstream is loaded
   if _DEBUG_PRINT: print("[DEBUG- PYTHON] ----overlay is loaded ----")
  else :
    if _DEBUG_PRINT: print("[DEBUG- PYTHON] ---- overlay is not loaded----")
    exit(-1)
  accelerator=overlay.dtpu.axis_accelerator_ada
  ## soft reset and accelerator configuration 
  accelerator.write(CTRL,0x0000001)
  accelerator.write(CTRL,0x0000000)
  accelerator.write(IARG_RQT_EN,0x000000007) ## all data avialable csr, weights and data
  accelerator.write(OARG_RQT_EN,1) # out fifo must be empty 
  accelerator.write(OARG_LENGTH_MODE,1) # hardware mode
  accelerator.write(OARG0_LENGTH,OUTFIFO_SIZE) # size outfifo 
  accelerator.write(ISCALAR_RQT_EN,0) # NO input SCALAR
  accelerator.write(OSCALAR_RQT_EN,0) # no output scalar
  accelerator.write(OARG0_TDEST,0) # only one output 

@ffi.def_extern()
def Init_p(tot_tensors,input_tens_size,output_tens_size): 
  global accelerator
  global overlay
  global size_tot
  global input_size
  global output_size
  print("[DEBUG - PYTHON] --- Init p function ---")
  overlay.reset()
  accelerator.write(CTRL,0x0000001)
  accelerator.write(CTRL,0x0000000)
  size_tot=tot_tensors
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- total tensors",size_tot,"---")
  input_size=input_tens_size
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- int tensors",input_size,"---")
  output_size=output_tens_size
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- out tensors",output_tens_size,"---")
  return True


@ffi.def_extern()
def SelectDataTypeComputation_p(data_type):
  global curr_data_precision
  global curr_bitwidth_data_computation
  global FP
  global BFP
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] ---  SelectDataTypeComputation DTPU class ---")
  if data_type!=0:
    #case switch 
    if ((data_type)&0x00000f)==INT8:
      curr_data_precision=INT8
      curr_bitwidth_data_computation=8
      PACK_TYPE="b"
    elif ((data_type)&0x00000f)==INT16:
      curr_data_precision=INT16
      curr_bitwidth_data_computation=16
      PACK_TYPE="h"
    elif ((data_type)&0x00000f)==INT32:
      curr_data_precision=INT32
      curr_bitwidth_data_computation=32
      PACK_TYPE="i"
    elif ((data_type)&0x00000f)==INT64:
      curr_data_precision=INT64
      curr_bitwidth_data_computation=64
      PACK_TYPE="q"
    else:
      print("ERROR PYTHON! Setting the Data type of computation")
    # floating point check 
    if ((data_type & 0x000060)>> 5)== ACTIVE_FP:
      FP=True
      BFP=False
      PACK_TYPE="f"
    elif ((data_type & 0x000060)>> 5)== ACTIVE_BFP:
      FP=True
      BFP=True
      PACK_TYPE="e"
    else:
      FP=False
      BFP=False
  else:
    curr_data_precision=INT8
    curr_bitwidth_data_computation=8
    FP=False
    BFP=False
    print("[DEBUG-PYTHON]----precision default 8 bit----")
  return True
  

@ffi.def_extern()
def push_weight_to_heap(tensor,size,dim_size):
  global tensors
  global tot_size_weight
  #push the tensor to the heap for handling their transfefr in the Prepare_p
  tot_size=1
  if not(FP) or not(BPF):
    tensor_i=ffi.cast("uint8_t *",tensor) #TODO CAST PROPERLY DEPENDING ON THE PRECISION
  else:
    tensor_i=ffi.cast("float *",tensor)
  size_i=size
  tot_size=1
  size_l=[]
  data_p=[]
  for i in range(dim_size):
    size_l.append(size[i])
    tot_size*=size[i]
  tot_size_weight+=tot_size
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]----- size of tensor weight ",tot_size_weight,"-----")
  for i in range (tot_size):
    data_p.append(tensor_i[i])
  tensors.append(Tensor(data_p,tot_size,size_l))

@ffi.def_extern()
def Prepare_p(input_size,output_size,weight_num):
  global input_fifo_buffer
  global output_fifo_buffer
  global weight_buffer
  global csr_buffer
  global overlay
  global driver_wm
  global driver_csr
  global driver_fifo_in
  global driver_fifo_out
  global num_weight
  global global_iteration
  global global_iteration_shift_wm
  global curr_data_precision
  global tensors
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] --- Prepare p of DTPU class ---")
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] --- in size",input_size,"output size",output_size," ---")
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] --- weigth size",weight_num," ---")
  #allocate buffers for data transfer
  num_weight=weight_num
  ## symmetric input/output fifo
  input_fifo_buffer = allocate(shape=(INFIFO_SIZE,),dtype='u8')
  output_fifo_buffer=allocate(shape=(INFIFO_SIZE,),dtype='u8')
  weight_buffer=allocate(shape=(WMEM_SIZE,),dtype='u8')
  csr_buffer=allocate(shape=(64,),dtype='u8')
  driver_wm=overlay.axi_dma_weight_mem
  driver_csr=overlay.axi_dma_csr_mem
  driver_fifo_in=overlay.axi_dma_infifo
  driver_fifo_out=overlay.axi_dma_outfifo
  #######################################################################
  ########### populate buffers pack depending on the precision  #########
  #######################################################################
  if _DEBUG_PRINT:
    print("[DEBUG - PYTHON ] --- Prepare p of DTPU class ",num_weight,"weight to transfer  ---")
    for i in range(num_weight):
      tmp=tensors[i]
      print("weight ",i)
      for j in range(tmp.tot_dim):
        print(tmp.data[j],end=" ")
  index=0# it eats the first data ?
  #get all tensors from the heap they will always be of 2 dims TODO
  iter=int(tot_size_weight/(WMEM_SIZE*(64/curr_bitwidth_data_computation)))
  for i in range(num_weight):
      tmp=tensors[i]
      final_shift=0
      for j in range (int(tmp.tot_dim/(64/curr_bitwidth_data_computation))+1):
        #check on the range
        if (j+1)*int(64/curr_bitwidth_data_computation)>tmp.tot_dim:
          final_shift=tmp.tot_dim
        else:
          final_shift=(j+1)*int(64/curr_bitwidth_data_computation) 
        weight_buffer[index]=int.from_bytes(struct.pack(">"+(PACK_TYPE*int(final_shift-64/curr_bitwidth_data_computation)),*tmp.data[int(64/curr_bitwidth_data_computation)*j:final_shift] ) , "little")
        index=index+1
        if index>=int(ROWS*COLUMNS):
          iter=iter+1
          global_iteration_shift_wm.append(index)
  # calculate number of runs depending on the size of weight tensor
  global_iteration=global_iteration+iter
  if _DEBUG_PRINT:
    for i in range(10):
      print(hex(weight_buffer[i]))
  ################################
  ###### transferring data #######
  ################################
  weight_buffer.flush()
  ################################################
  ###### program the dma for the weight ##########
  ################################################
  print("[DEBUG-PYTHON]--- transfering weight buffer ----")
  driver_wm.sendchannel.transfer(weight_buffer)
  driver_wm.sendchannel.wait()
  return True

@ffi.def_extern()
def Invoke_p(in_data,in_data_size,out_data,out_data_size):
  global driver_csr
  global driver_wm
  global driver_fifo_in
  global driver_fifo_out
  global csr_buffer
  global weight_buffer
  global input_fifo_buffer
  global output_fifo_buffer
  global accelerator
  global global_iteration
  global global_iteration_shift_wm
  global curr_data_precision
  #######################################################################
  ########### populate buffers pack depending on the precision  #########
  #######################################################################
  tmp=[]
  if not(FP) or not(BPF):
    in_data_i=ffi.cast("int *",in_data_i) #TODO
  else:
    in_data_i=ffi.cast("float *",in_data_i)
  for i in range(in_data_size):
    tmp.append(in_data_i[i])
    if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- in data ",in_data_i[i]," ----")
  index=0
  shift=0
  iter=int(in_data_size/(INFIFO_SIZE*(64/curr_data_precision)))
  iter_index=[]
  for j in range (int(in_data_size/(64/curr_bitwidth_data_computation))+1):
    if(j+1)*int(64/curr_bitwidth_data_computation)>in_data_size:
      final_shift=in_data_size
    else:
      final_shift=(j+1)*int(64/curr_bitwidth_data_computation) # TODO add left and right indexs and also control on their difference
    input_fifo_buffer[index]=int.from_bytes(struct.pack(">"+(PACK_TYPE*int(final_shift-64/curr_bitwidth_data_computation)),*tmp[int(64/curr_bitwidth_data_computation)*j:final_shift] ) , "little")
    index=index+1
    if(index>=INFIFO_SIZE):
      break # need another iteration TODO
  input_fifo_buffer.flush()
  if _DEBUG_PRINT:
    for i in range(10):
      print(hex(input_fifo_buffer[i]))
  ################################################
  ###### program the dma for the csr reg #########
  ################################################
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- transfering csr buffer ----")
  csr_buffer[ARITHMETIC_PRECISION]=np.uint64(global_iteration_shift_wm[0]<<32) | np.uint64(curr_data_precision) #TODO add chain and fp
  csr_buffer.flush()
  driver_csr.sendchannel.transfer(csr_buffer)
  driver_csr.sendchannel.wait()
  ######################################################
  ###### program the dma for the in/out fifos ##########
  ######################################################   
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- transfering input buffer ----")
  driver_fifo_in.sendchannel.transfer(input_fifo_buffer)
  driver_fifo_in.sendchannel.wait()
  driver_fifo_out.recvchannel.transfer(output_fifo_buffer)
  accelerator.write(CMD, (0x0000000 |(CMD_EXECUTE_CONTINOUS<<16))) # offload of processor it will continue as data will be provided
  # TODO multiple iteration 
  #for i in range (global_iteration):
  #  # modify inital starting value of weight 
  #  prev=np.uint32(csr_buffer[ARITHMETIC_PRECISION]) & 0xffffffff
  #  csr_buffer[ARITHMETIC_PRECISION]=np.uint64(global_iteration_shift_wm[i]<<32) | np.uint64(prev)
  #  csr_buffer.flush()
  #  driver_csr.sendchannel.transfer(csr_buffer)
  #  #driver_csr.sendchannel.wait()
  #  for j in range(iter):
  #    #execute the inference and retrieve the data
  #    accelerator.write(CMD, (0x0000000 |(CMD_EXECUTE_STEP<<16))) # execute one step 
  #    for k in range(INFIFO_SIZE):
  #      input_fifo_buffer[i]=output_fifo_buffer[i]
  #    ## copy the rest of input 
  #    index=0
  #    shift=0
  #    for k in range (in_data_size-j*INFIFO_SIZE):
  #      if(shift<int(64/curr_data_precision)):
  #        input_fifo_buffer[index]|=np.uint8(tmp[k+j*INFIFO_SIZE]<<(np.uint8(shift*curr_data_precision)))
  #        shift=shift+1
  #      else:
  #        index=index+1
  #        shift=0
  #        input_fifo_buffer[index]|=np.uint8(tmp[k+j*INFIFO_SIZE]<<(np.uint8(shift*curr_data_precision)))
  #      if(k>=INFIFO_SIZE):
  #        break
  #    input_fifo_buffer.flush()
  #  for l in range(INFIFO_SIZE):
  #      input_fifo_buffer[l]=output_fifo_buffer[l]
  accelerator.write(CMD,((CMD_UPDATE_OUT_ARG<<16)|(1))) # not the second time 
  accelerator.write(STATUS,0x00000003)##clear status
  if _DEBUG_PRINT: print("[DEBUG -PYTHON] ---- accelerator done ----")
  ################################################################################################
  ####### unpack the output buffer depending on the precision and give  it back to C code ########
  ################################################################################################
  driver_fifo_out.recvchannel.wait()
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]----- getting output data -----")
  if _DEBUG_PRINT:
    for i in range(10):
      print(hex(output_fifo_buffer[i]))
  out_data_i=[]
  index=0
  for i in range(int(out_data_size/(64/curr_bitwidth_data_computation))+1):
    tmp=struct.unpack( "<"+(PACK_TYPE*int(64/curr_bitwidth_data_computation)),output_fifo_buffer[index].to_bytes(curr_bitwidth_data_computation,"little"))
    for value in tmp:
      out_data_i.append(value)
    index=index+1
  out_data=ffi.cast("int *",out_data_i[0:out_data_size]) #TODO proper cast depending on the precision
  return True

@ffi.def_extern()
def ResetHardware_p():
  global accelerator
  global overlay
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] --- Reset hardware p function ---")
  overlay.reset()
  accelerator.write(CTRL,0x0000001)
  accelerator.write(CTRL,0x0000000)
  return True

@ffi.def_extern()
def destroy_p():
  global input_fifo_buffer
  global output_fifo_buffer
  global csr_buffer
  global weight_buffer
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] --- destroying the delegate and buffers ---")
  input_fifo_buffer.freebuffer()
  output_fifo_buffer.freebuffer()
  csr_buffer.freebuffer()
  weight_buffer.freebuffer()
  return True

@ffi.def_extern()
def CopyFromBufferHandle_p():
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] ---  the  from  delegate and buffers ---")
  return True

@ffi.def_extern()
def CopyToBufferHandle_p():
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] --- copying  to  the delegate and buffers ---")
  return True
@ffi.def_extern()
def FreeBufferHandle_p():
  global input_fifo_buffer
  global output_fifo_buffer
  global csr_buffer
  global weight_buffer
  global driver_csr
  global driver_wm
  global driver_fifo_in
  global driver_fifo_out
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] --- freeing buffers ---")
  input_fifo_buffer.freebuffer()
  output_fifo_buffer.freebuffer()
  csr_buffer.freebuffer()
  weight_buffer.freebuffer()
  del driver_csr
  del driver_wm
  del driver_fifo_in
  del driver_fifo_out

