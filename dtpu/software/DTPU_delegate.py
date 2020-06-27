from dtpu_lib import ffi
from pynq import Overlay
from pynq import allocate
from pynq import MMIO
from pynq import Xlnk
from pynq.lib import dma
import numpy as np
import math
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
INT16=0X3
INT32=0x7
INT64=0xF
# precision of fp computation is tuned using the 
# integer precision 
ACTIVE_FP=1
ACTIVE_BFP=0x03
ROUNDING=0x00
NO_FP=0x00
SIGNED=0x1
NO_SIGNED=0x0
WMEM_STARTING_ADDRESS=0 #32 MSB 
##############################################
#### accelerator adapter command #############
##############################################
CMD_UPDATE_IN_ARG=0x0
CMD_UPDATE_OUT_ARG=0x1
CMD_EXECUTE_STEP=0x2
CMD_EXECUTE_CONTINOUS=0x4
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
output_size=0
input_size=0
tot_size_weight=0
tot_size_input=0
tot_size_output=0
curr_data_precision=INT8
curr_bitwidth_data_computation=8
PACK_TYPE="b" # default is 1 byte signed for integer lower case -> signed upper case-> unsigned
DTYPE_NP=np.uint8
FP=False
BFP=False
size_tot=0
num_weight=0
global_iteration=1 ## at least one execution of the tensor accelerator
global_iteration_shift_wm=[]
weight_tensors=[]
input_tensors=[]
output_tensors=[]
class Tensor:
  def __init__(self,data, tot_dim,size_l):
    self.tot_dim=tot_dim
    self.data=data
    self.size_l=size_l
filter_height=0
filter_width=0
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
  global PACK_TYPE
  global FP
  global BFP
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] ---  SelectDataTypeComputation DTPU class ---")
  if data_type!=0:
    #case switch 
    if ((data_type)&0x00000f)==INT8:
      curr_data_precision=INT8
      curr_bitwidth_data_computation=8
      if (data_type&0x00100)==SIGNED:
        PACK_TYPE="b"
        DTYPE_NP=np.int8
      else:
        PACK_TYPE="B"
        DTYPE_NP=np.uint8
    elif ((data_type)&0x00000f)==INT16:
      curr_data_precision=INT16
      curr_bitwidth_data_computation=16
      if (data_type&0x00100)==SIGNED:
        PACK_TYPE="h"
        DTYPE_NP=np.int16
      else:
        PACK_TYPE="H"
        DTYPE_NP=np.uint16
    elif ((data_type)&0x00000f)==INT32:
      curr_data_precision=INT32
      curr_bitwidth_data_computation=32
      if (data_type&0x00100)==SIGNED:
        PACK_TYPE="i"
        DTYPE_NP=np.int32
      else:
        PACK_TYPE="I"
        DTYPE_NP=np.uint32
    elif ((data_type)&0x00000f)==INT64:
      curr_data_precision=INT64
      curr_bitwidth_data_computation=64
      if (data_type&0x00100)==SIGNED:
        PACK_TYPE="q"
        DTYPE_NP=np.int64
      else:
        PACK_TYPE="Q"
        DTYPE_NP=np.uint64
    else:
      print("ERROR PYTHON! Setting the Data type of computation")
    # floating point check 
    if ((data_type & 0x000060)>> 5)== ACTIVE_FP:
      FP=True
      BFP=False
      PACK_TYPE="f"
      DTYPE_NP=np.float32
    elif ((data_type & 0x000060)>> 5)== ACTIVE_BFP:
      FP=True
      BFP=True
      PACK_TYPE="e"
      DTYPE_NP=np.uint16 ## accroding to tensorflow bfp16 representation
    else:
      FP=False
      BFP=False
  else:
    curr_data_precision=INT8
    curr_bitwidth_data_computation=8
    FP=False
    BFP=False
  if _DEBUG_PRINT: 
    print("[DEBUG-PYTHON]----precision default 8 bit signed----")
    print("[DEBUG-PYTHON]---- Signed :",PACK_TYPE.islower(),"type: ",curr_data_precision, "  ->", curr_bitwidth_data_computation,"------")
  return True

@ffi.def_extern()
def push_input_tensor_to_heap( tensor,size,dim_size):
  global input_tensors
  global tot_size_input
  #push the tensor to the heap for handling their transfefr in the Prepare_p
  tot_size=1
  if not(FP) or not(BPF):
    if PACK_TYPE.islower(): # signed
      if curr_data_precision==INT8:
        tensor_i=ffi.cast("int8_t *",tensor)
      elif curr_data_precision==INT16:
        tensor_i=ffi.cast("int16_t *",tensor)
      elif curr_data_precision==INT32:
        tensor_i=ffi.cast("int32_t *",tensor)
      else: # int64
        tensor_i=ffi.cast("int64_t *",tensor)
    else: #unsigned
      if curr_data_precision==INT8:
        tensor_i=ffi.cast("uint8_t *",tensor)
      elif curr_data_precision==INT16:
        tensor_i=ffi.cast("uint16_t *",tensor)
      elif curr_data_precision==INT32:
        tensor_i=ffi.cast("uint32_t *",tensor)
      else: # int64
        tensor_i=ffi.cast("uint64_t *",tensor)
  else:
    if BFP:
      tensor_i=ffi.cast("uint16_t *",tensor)
    else:
      tensor_i=ffi.cast("float *",tensor)
  size_i=ffi.cast("int *",size)
  tot_size=1
  size_l=4*[1]
  data_p=[]
  for i in range(dim_size):
    size_l[i]=size[i]
    tot_size*=size[i]
  tot_size_input+=tot_size
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]----- size of tensor input ",tot_size_input,"-----")
  for i in range (tot_size):
    data_p.append(tensor_i[i])
  input_tensors.append(Tensor(data_p,tot_size,size_l))

@ffi.def_extern()
def push_output_tensor_to_heap(tensor, size,dim_size):
  global output_tensors
  global tot_size_output
  #push the tensor to the heap for handling their transfefr in the Prepare_p
  tot_size=1
  if not(FP) or not(BPF):
    if PACK_TYPE.islower(): # signed
      if curr_data_precision==INT8:
        tensor_i=ffi.cast("int8_t *",tensor)
      elif curr_data_precision==INT16:
        tensor_i=ffi.cast("int16_t *",tensor)
      elif curr_data_precision==INT32:
        tensor_i=ffi.cast("int32_t *",tensor)
      else: # int64
        tensor_i=ffi.cast("int64_t *",tensor)
    else: #unsigned
      if curr_data_precision==INT8:
        tensor_i=ffi.cast("uint8_t *",tensor)
      elif curr_data_precision==INT16:
        tensor_i=ffi.cast("uint16_t *",tensor)
      elif curr_data_precision==INT32:
        tensor_i=ffi.cast("uint32_t *",tensor)
      else: # int64
        tensor_i=ffi.cast("uint64_t *",tensor)
  else:
    if BFP:
      tensor_i=ffi.cast("uint16_t *",tensor)
    else:
      tensor_i=ffi.cast("float *",tensor)
  size_i=ffi.cast("int *",size)
  tot_size=1
  size_l=4*[1]
  data_p=[]
  for i in range(dim_size):
    size_l[i]=size[i]
    tot_size*=size[i]
  tot_size_output+=tot_size
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]----- size of tensor output ",tot_size,"-----")
  for i in range (tot_size):
    data_p.append(0) ## appending zeros
  output_tensors.append(Tensor(data_p,tot_size,size_l))

@ffi.def_extern()
def push_weight_to_heap(tensor,size,dim_size):
  global weight_tensors
  global tot_size_weight
  #push the tensor to the heap for handling their transfefr in the Prepare_p
  tot_size=1
  if not(FP) or not(BPF):
    if PACK_TYPE.islower(): # signed
      if curr_data_precision==INT8:
        tensor_i=ffi.cast("int8_t *",tensor)
      elif curr_data_precision==INT16:
        tensor_i=ffi.cast("int16_t *",tensor)
      elif curr_data_precision==INT32:
        tensor_i=ffi.cast("int32_t *",tensor)
      else: # int64
        tensor_i=ffi.cast("int64_t *",tensor)
    else: #unsigned
      if curr_data_precision==INT8:
        tensor_i=ffi.cast("uint8_t *",tensor)
      elif curr_data_precision==INT16:
        tensor_i=ffi.cast("uint16_t *",tensor)
      elif curr_data_precision==INT32:
        tensor_i=ffi.cast("uint32_t *",tensor)
      else: # int64
        tensor_i=ffi.cast("uint64_t *",tensor)
  else:
    if BFP:
      tensor_i=ffi.cast("uint16_t *",tensor)
    else:
      tensor_i=ffi.cast("float *",tensor)
  size_i=ffi.cast("int *",size)
  tot_size=1
  size_l=4*[1]
  data_p=[]
  for i in range(dim_size):
    size_l[i]=size[i]
    tot_size*=size[i]
  tot_size_weight+=tot_size
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]----- size of tensor weight ",tot_size_weight,"-----")
  for i in range (tot_size):
    data_p.append(tensor_i[i])
  weight_tensors.append(Tensor(data_p,tot_size,size_l))

@ffi.def_extern()
def Prepare_p(weight_num):
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
  global weight_tensors
  global filter_height
  global filter_width
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] --- Prepare p of DTPU class ---")
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] --- in size",input_size,"output size",output_size," ---")
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] --- weigth size",weight_num," ---")
  #allocate buffers for data transfer
  num_weight=weight_num
  filter_height=num_weight*[0]
  filter_width=num_weight*[0]
  ## symmetric input/output fifo
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
      tmp=weight_tensors[i]
      print("[DEBUG-PYTHON] ---- weight ",i,"-----")
      print("[DEBUG-PYTHON] ---- size ",*tmp.size_l,"-----")
      for j in range(tmp.tot_dim):
        print(tmp.data[j],end=" ")
    print("",end="\n")
  index=0# it eats the first data ?
  shift=int(64/curr_bitwidth_data_computation)
  iter=int(tot_size_weight/(WMEM_SIZE*(64/curr_bitwidth_data_computation))) # if it fits in th eaccelerator memory
  # always 4D tensors
  # assumptio is that the filter sizes always fit the accelerator
  if iter<=1:
    for w_ind in range(1): # pack only the weight for deep wise convolution 
      tmp=np.array(weight_tensors[w_ind].data, dtype=DTYPE_NP)
      tmp=tmp.reshape(*weight_tensors[w_ind].size_l)
      filter_height[w_ind],filter_width[w_ind]=tmp.shape[1:3]
      for i in range(len(tmp)):
        for l in range(weight_tensors[w_ind].size_l[3]):
          global_iteration_shift_wm.append(index)
          for j in range(len(tmp[i])):
              # boundary check
              shift=int(64/curr_bitwidth_data_computation)
              if shift > len(tmp[i]):
                shift=len(tmp[i])
              weight_buffer[index]=np.uint64(int.from_bytes( tmp[i,j,0:shift,l],byteorder="little",signed=False))
              index+=1
          for j in range(ROWS-len(tmp[i])):
            weight_buffer[index]=0
            index+=1 # padding with zeros
  else:
    print("it requires multiple iterations for the weight matrix") # multiple iteration on total weight 1MB should be enou-gh
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
def Invoke_p(only_conv2d):
  global input_fifo_buffer
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
  global input_tensors
  global output_tensors
  global filter_width
  global filter_height
  #######################################################################
  ########### populate buffers pack depending on the precision  #########
  #######################################################################
  tmp=[]
  if _DEBUG_PRINT:
    print("[DEBUG - PYTHON ] --- Invoke p of DTPU class",input_size-num_weight,"input tensors to transfer ---")
    for i in range( input_size-num_weight):
      tmp=input_tensors[i]
      print("[DEBUG-PYTHON] ---- input tensor ",i,"-----")
      print("[DEBUG-PYTHON] ---- size ",*tmp.size_l,"-----")
      for j in range(tmp.tot_dim):
        print(tmp.data[j],end=" ")
  index=0
  shift=int(64/curr_bitwidth_data_computation)
  # check if it fits the inputs
  # always 4D tensors
  # assumptio is that the filter sizes always fit the accelerator
  #then compact
  ## split the input shape into submatrices equalt to filter sizes
  applyed_weight=0
  #over allocate input_fifo_buffer
  input_fifo_buffer = allocate(shape=(int((tot_size_output*filter_height[applyed_weight]*filter_width[applyed_weight])/(64/curr_bitwidth_data_computation))*COLUMNS,),dtype='u8') 
  for w_ind in range(len(input_tensors)):
    tmp=np.array(input_tensors[w_ind].data, dtype=DTYPE_NP)
    tmp=tmp.reshape(*input_tensors[w_ind].size_l)
    for batch in range(len(tmp)):
      for channel in range(tmp.shape[-1]):
        tmp_s=tmp[batch,:,:,channel]
        #iteration for the whole matrix 
        for i in range(len(tmp_s)-filter_height[applyed_weight]):
          for j in range(len(tmp_s[i])-filter_width[applyed_weight]):
            tmp_ss=tmp_s[i:i+filter_height[applyed_weight],j:j+filter_width[applyed_weight]]
            for row in range(len(tmp_ss)):
              shift=int(64/curr_bitwidth_data_computation)
              if shift> len(tmp_ss):
                shift=len(tmp_ss)
              input_fifo_buffer[index]=np.uint64(int.from_bytes(tmp_ss[row,0:shift],byteorder="little",signed=False))
              index+=1

  input_fifo_buffer.flush()
  if _DEBUG_PRINT:
    for i in range(10):
      print(hex(input_fifo_buffer[i]))  
  accelerator.write(CMD, (0x0000000 |(CMD_EXECUTE_STEP<<16))) # offload of processor it will continue as data will be provided
  convert = lambda n : [int(i) for i in n.to_bytes(int(64/curr_bitwidth_data_computation), byteorder='little', signed=True)] # lamda function for casting from int64 to desired value
  #iterate on the output matrix with also multiple weight iteration and inputs
  ## assumption is that the output tensor is always one!
  ## getting the output matrix structure
  ################################################
  ###### program the dma for the csr reg #########
  ################################################
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- transfering csr buffer for weight----")
  csr_buffer[ARITHMETIC_PRECISION]=np.uint64(global_iteration_shift_wm[0]<<32) | np.uint64(curr_data_precision)| (np.uint64(NO_FP<<5))
  csr_buffer.flush()
  driver_csr.sendchannel.transfer(csr_buffer)
  driver_csr.sendchannel.wait()
  output_matrix=np.array(output_tensors[0].data, dtype=DTYPE_NP)
  output_matrix=output_matrix.reshape(*output_tensors[0].size_l)
  ######################################
  ####### deepwise convolution #########
  ######################################
  for batch_i in range(len(output_matrix)):
    for channel_i in range(output_matrix.shape[-1]):
      ## buffer depth  check
      #if ((batch_i+channel_i)%BUFFER_DEPTH)==1:
      #  accelerator.write(CMD,((CMD_UPDATE_IN_ARG<<16)|(3))) # update inputs to next buffers
      #  accelerator.write(CMD,((CMD_UPDATE_OUT_ARG<<16)|(1))) # not the second time 
      ######################################################
      ###### program the dma for the in/out fifos ##########
      ######################################################   
      for infifo_shift in range(int(input_fifo_buffer.size/INFIFO_SIZE)):
        if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- transfering input buffer",infifo_shift," ----")
        driver_fifo_in.sendchannel.transfer(input_fifo_buffer[INFIFO_SIZE*(infifo_shift):INFIFO_SIZE*(infifo_shift+1)-1])
        driver_fifo_in.sendchannel.wait()
        driver_fifo_out.recvchannel.transfer(output_fifo_buffer)
        if _DEBUG_PRINT: print("[DEBUG-PYTHON]----- getting output data -----")
        driver_fifo_out.recvchannel.wait()
        ####################################################################
        ####### unpack the output buffer depending on the precision ########
        ####################################################################
        ## get values from output fifo buffer and put them into an array in order to sum all the data
        for i in range(output_matrix.shape[1]):
          for j in range(output_matrix.shape[2]):
            tmp_sum=np.zeros(shape=(ROWS,COLUMNS),dtype=DTYPE_NP)
            tmp=output_fifo_buffer[channel_i*(ROWS*COLUMNS)+i*ROWS+j*COLUMNS:channel_i*(ROWS*COLUMNS)+(i+1)*ROWS+(j+1)*COLUMNS].copy()
            #reshuffle
            for row in range(len(tmp_sum)):
              tmp_sum[row]=convert(int(tmp[row]))
            output_matrix[batch_i,i,j,channel_i]=tmp_sum.sum()
  accelerator.write(STATUS,0x00000003)##clear status
  ###########################################
  ######## point wise convolution ###########
  ###########################################
  for batch_i in range(len(output_matrix)):
    for i in range(len(output_matrix[batch_i])):
      for j in range(len(output_matrix[batch_i,i])):
        for channel_i in range(len(output_matrix[batch_i,i,j])):
          output_matrix[batch_i,i,j,channel_i]=output_matrix[batch_i,i,j,channel_i]*weight_tensors[1].data[channel_i]
  if _DEBUG_PRINT: print("[DEBUG -PYTHON] ---- accelerator done ----")
  driver_fifo_out.recvchannel.wait()
  if _DEBUG_PRINT:
    print("[DEBUG-PYTHON] ------ final output data from accelerator-----")
    for i in range(10):
      print(hex(output_fifo_buffer[i]))
    print("[DEBUG-PYTHON] ------ final output data to tensorflow -----")
    print(output_matrix)
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
  global accelerator
  global overlay
  global global_iteration_shift_wm
  global weight_tensors
  global input_tensors
  global output_tensors
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] --- destroying the buffers ---")
  input_fifo_buffer.freebuffer()
  output_fifo_buffer.freebuffer()
  csr_buffer.freebuffer()
  weight_buffer.freebuffer()
  del accelerator
  del overlay
  del global_iteration_shift_wm
  del weight_tensors
  del input_tensors
  del output_tensors
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
  global accelerator
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] --- freeing buffers ---")
  input_fifo_buffer.freebuffer()
  output_fifo_buffer.freebuffer()
  csr_buffer.freebuffer()
  weight_buffer.freebuffer()
  del accelerator
  del driver_csr
  del driver_wm
  del driver_fifo_in
  del driver_fifo_out

##TODO ADD xadc for power consumption 

def print_power_consumption():
  if _DEBUG_PRINT: print("[ÐEBUG-PYTHON] ---- printing power consumption from xadc readings ----")
  return True