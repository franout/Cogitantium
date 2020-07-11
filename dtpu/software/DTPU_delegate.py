from dtpu_lib import ffi
from pynq import Overlay
from pynq import allocate
from pynq import MMIO
from pynq import Xlnk
from pynq.lib import dma
import numpy as np
import math
import _thread
import sys
import time
import struct # see https://docs.python.org/3/library/struct.html#struct-examples
_DEBUG_PRINT=True
_TIME_PROBES=False
#############################
##### memory map of xadc #####
##############################
C_BASEADDRESS=0x43C10000 # 
SRR=  0x0 # w software reset register
SR=  0x04 # r status register
AOSR= 0x08 # r allarm output status register
CONVSTR= 0x0C # w Bit[0] = ADC convert start register (3) Bit[1] = Enable temperature update logic Bit[17:2] = Wait cycle for temperature update 
SYSMONRR=0x10 # w xadc hard macro reset register
GIER=0x5C # rw global interrupt enable register
IPISR=0x60 # r toggle on write ip interrupt status register
IPIER=0x68 # rw ip interrupt enable register
TEMPERATURE=0x200 # The 12-bit Most Significant Bit (MSB)  justified result of on-device temperature measurement is stored in this register
VCC_INT=0x204 # The 12-bit MSB justified result of on-device V CCINT supply monitor measurement is storedin this register.
VCC_AUX=0x208 # The 12-bit MSB justified result of on-device V CCAUX Data supply monitor measurement is stored in this register
VP_VN=0x20C # rw When read: The 12-bit MSB justified result of A/D conversion on the dedicated analog input channel (Vp/Vn) is stored in this register.When written: Write to this regiter resets theXADC hard macro
VREF_P=0x210 # r The 12-bit MSB justified result of A/D conversion on the reference input V REFP is stored in this register. 
VREF_N= 0x214 #r The 12-bit MSB justified result of A/D conversion on the reference input V REFN is stored in this register. 
VCC_BRAM= 0x218 # r The 12-bit MSB justified result of A/D conversion on the reference input V BRAM is stored in this register 
SUPPLY_A_OFFSET=0x220 # r The calibration coefficient for the supply  sensor offset of ADC A is stored in this register
ADC_A_OFFSET=  0x224 # r The calibration coefficient for the ADC A offset calibration is stored in this register. 
ADC_A_GAIN_ERR=0x228 # r The calibration coefficient for the gain error of ADC A is stored in this register.
DEV_CORE_SUPPLY=0x234 #r  The  VCCINT of PSS core supply. Present only  on Zynq-7000 devices.
DEV_AUX_CORE_SUPPLY=0x238 # r The VCCAUX of PSS core supply. Present only on Zynq-7000 devices.
DEV_CORE_MEM_SUPPLY=0x23C # r The VCCMEM of PSS core supply. Present only on Zynq-7000 devices
# v axux p/n
V_AUX_0=  0x240 #r The 12-bit MSB justified result of A/D conversion on the auxiliary analog input 0 is  stored in this register.
V_AUX_1=  0x244 #r 
V_AUX_2=  0x248 #r 
V_AUX_3=  0x24C #r 
V_AUX_4=  0x250 #r 
V_AUX_5=  0x254 #r 
V_AUX_6=  0x258 #r 
V_AUX_7=  0x25C #r 
V_AUX_8=  0x260 #r 
V_AUX_9=  0x264 #r 
V_AUX_10= 0x268 #r 
V_AUX_11= 0x26C #r 
V_AUX_12= 0x270 #r 
V_AUX_13= 0x274 #r 
V_AUX_14= 0x278 #r 
V_AUX_15= 0x27C #r 
## value of 12 bit msb
MAX_TMP= 0x280   # r
MAX_VCC_INT= 0x284   # r
MAX_VCC_AUX= 0x288   # r
MAV_V_BRAM= 0x28C   # r
MIN_TMP= 0x290   # r
MIN_VCC_INT= 0x294   # r
MIN_VCC_AUX= 0x298   # r
MIN_V_BRAM=0x29C   # r
MAX_VCC_PINT= 0x2A0 # r 
MAX_VCC_PAUX= 0x2A4 # r 
MAX_VCC_DDRO= 0x2A8 # r 
MIN_VCC_PINT= 0x2b0 # r 
MIN_VCC_PAUX= 0x2b4 # r 
MIN_VCC_DDRO= 0x2b8 # r 
SUPPLY_B_OFFSET= 0x2C0 # r The calibration coefficient for the supply  sensor offset of ADC A is stored in this register
ADC_B_OFFSET=  0x2C4 # r The calibration coefficient for the ADC A offset calibration is stored in this register. 
ADC_B_GAIN_ERR= 0x2C8 # r The calibration coefficient for the gain error of ADC A is stored in this register.
FLAGS=0x2FC # The 16-bit register gives general status information of ALARM, Over Temperature (OT), Disable XADC information. Whether the XADC is using the internal reference voltage or external reference voltage is also p 
CONF_REG_0=0x300 # rw 
CONF_REG_1=0x304 # rw 
CONF_REG_2=0x308 # rw 
SEQ_REG_0= 0x320 # r/w adc channel selection 
SEQ_REG_1= 0x324 # r/w adc channel selection 
SEQ_REG_2= 0x328 # r/w adc channel average enable 
SEQ_REG_3= 0x32C # r/w adc channel average enable 
SEQ_REG_4= 0x330 # r/w adc channel analog input mode 
SEQ_REG_5= 0x334 # r/w adc channel analog input mode 
SEQ_REG_6= 0x338 # r/w adc channel acquistion
SEQ_REG_7= 0x33C # r/w adc channel acquistion
ALLARM_THRESHOLD_0= 0x340 #rw The 12bit MSB justified alarm threshold register 0 Temperature Upper
ALLARM_THRESHOLD_1= 0x344 #rw he 12bit MSB justified alarm threshold register 1 V CCINT Upper
ALLARM_THRESHOLD_2= 0x348 #rw The 12bit MSB justified alarm threshold register 2 V CCAUX Upper
ALLARM_THRESHOLD_3= 0x34C #rw the 12bit MSB justified alarm threshold register 3 T Upper
ALLARM_THRESHOLD_4= 0x350 #rw the 12bit MSB justified alarm threshold register 4 Temperature Lower
ALLARM_THRESHOLD_5= 0x354 #rw  the 12bit MSB justified alarm threshold register 5 V CCINT Lower
ALLARM_THRESHOLD_6= 0x358 #rw The 12bit MSB justified alarm threshold register 6 V CCAUX Lower
ALLARM_THRESHOLD_7= 0x35C # rw The 12bit MSB justified alarm threshold register 7 OT Lower
ALLARM_THRESHOLD_8= 0x360 # rw The 12bit MSB justified alarm threshold register 8 VBRAM Upper
ALLARM_THRESHOLD_9= 0x364 # rw The 12bit MSB justified alarm threshold  register 9 V CCPint Upper This register is only on Zynq-7000 devices.
ALLARM_THRESHOLD_10= 0x368 # rw The 12bit MSB justified alarm threshold  register 10 V CCPaux Upper This register is only on Zynq-7000 devices
ALLARM_THRESHOLD_11= 0x36C # rw The 12bit MSB justified alarm threshold register 11  CCDDRO Upper This register is  only on Zynq-7000 devic 
ALLARM_THRESHOLD_12= 0x370 # rw he 12bit MSB justified alarm threshold register 12 VBRAM Lower
ALLARM_THRESHOLD_13= 0x374 # rw The 12Bit MSB justified alarm threshold register 13 V CCPint Lower This register is only on Zynq-7000 devices
ALLARM_THRESHOLD_14= 0x378 # rw The 12bit MSB justified alarm threshold register 14 V CCPaux Lower This register is only on Zynq-7000 devices
ALLARM_THRESHOLD_15= 0x37C # rw he 12bit MSB justified alarm threshold register 15 v CCDDRO Lower This register is only on Zynq-7000 devices
######################################################## 
############ MEMORY MAP of acceleratro #################
########################################################
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
infifo_buffer_transfer=None
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
WMEM_SIZE=16384 # 1Mbytes 
CSRMEM_SIZE=1024
INFIFO_SIZE=2048  #1Kbytes
OUTFIFO_SIZE=2048 #1Kbytes
ROWS=0
COLUMNS=0
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
output_tensors_p=[]
weight_buffer_multiple=[]
index_wm=0
class Tensor:
  def __init__(self,data, tot_dim,size_l):
    self.tot_dim=tot_dim
    self.data=data
    self.size_l=size_l
filter_height=0
filter_width=0
########################
##### time probes #####
#######################
avg_hw_execution=0.0
n_execution=0
avg_hw_execution_internal=0.00
n_execution_internal=0
#####################
###### XADC #########
#####################
xadc_mon=None
##################################################
##### Retrieve and display power consumption  ####
##### Supply sensor: Vccint,Vccaux,Vccbram    ####
#####     Vccpint, Vccpaux,Vcc0ddr           #####
##### Nominal values of resistances and Vcc ######
##################################################
# from vivado report power
# [V]
vcc_pl_int_nom=1.00
vcc_pl_aux_nom=1.80
vcc_pl_bram_nom= 1.00
vcc_ps_int_nom=1.80
vcc_ps_aux_nom=1.80
vcc_ddr_nom=1.50
# equivalent series resitstances of capacitor -> worst case
# [omh]
r_pl_int=225
r_pl_aux=300
r_pl_bram=225
r_ps_int=225
r_ps_aux=400
r_ddr= 0.005
n_sample=1
ps_power=0
pl_power=0
mem_power=0
ps_power_max=sys.float_info.min
pl_power_max=sys.float_info.min
mem_power_max=sys.float_info.min
ps_power_min=sys.float_info.max
pl_power_min=sys.float_info.max
mem_power_min=sys.float_info.max
tmp_max=sys.float_info.min
tmp_min=sys.float_info.max
tmp_avg=0.00

def sample_power( threadName, delay):
  global ps_power
  global pl_power
  global mem_power
  global n_sample
  global xadc_mon
  global vcc_ps_aux_nom
  global ps_power_max
  global pl_power_max
  global mem_power_max
  global ps_power_min
  global pl_power_min
  global mem_power_min
  global tmp_max
  global tmp_min
  global tmp_avg
  while True:
    time.sleep(0.8/1000)
    vcc_pl_int=( xadc_mon.read(VCC_INT) & 0x0000FFF0) >> 4
    vcc_pl_int= (vcc_pl_int* vcc_ps_aux_nom) / 4096
    vcc_pl_aux=( xadc_mon.read(VCC_AUX) & 0x0000FFF0) >> 4
    vcc_pl_aux= (vcc_pl_aux* vcc_ps_aux_nom) / 4096
    vcc_pl_bram= ( xadc_mon.read(VCC_BRAM) & 0x0000FFF0) >> 4
    vcc_pl_bram= (vcc_pl_bram* vcc_ps_aux_nom) / 4096
    vcc_ps_int= ( xadc_mon.read(DEV_CORE_SUPPLY) & 0x0000FFF0) >> 4
    vcc_ps_int= (vcc_ps_int* vcc_ps_aux_nom) / 4096
    vcc_ps_aux=( xadc_mon.read(DEV_AUX_CORE_SUPPLY) & 0x0000FFF0) >> 4
    vcc_ps_aux= (vcc_ps_aux* vcc_ps_aux_nom) / 4096
    vcc_ddr= ( xadc_mon.read(DEV_CORE_MEM_SUPPLY) & 0x0000FFF0) >> 4
    vcc_ddr= (vcc_ddr* 3) / 4096
    n_sample+=1
    ps_power_i=((vcc_ps_int_nom-vcc_ps_int)/r_ps_int)*vcc_ps_int_nom + ((vcc_ps_aux_nom-vcc_ps_aux)/r_ps_aux)*vcc_ps_aux_nom 
    pl_power_i= ((vcc_pl_int_nom-vcc_pl_int)/r_pl_int)*vcc_pl_int_nom + ((vcc_pl_aux_nom-vcc_pl_aux)/r_pl_aux)*vcc_pl_aux_nom + ((vcc_pl_bram_nom-vcc_pl_bram)/r_pl_bram)*vcc_pl_bram_nom 
    mem_power_i=((vcc_ddr-vcc_ddr_nom)/r_ddr)*vcc_ddr
    ## update max 
    if pl_power_i > pl_power_max:
      pl_power_max=pl_power_i
    if ps_power_i > ps_power_max:
      ps_power_max=ps_power_i
    if mem_power_i > mem_power_max:
      mem_power_max=mem_power_i
    #update min
    if pl_power_i < pl_power_min:
      pl_power_min=pl_power_i
    if ps_power_i < ps_power_min:
      ps_power_min=ps_power_i
    if mem_power_i < mem_power_min:
      mem_power_min=mem_power_i
    ## update values for the averages
    ps_power+=ps_power_i
    pl_power+=pl_power_i
    mem_power+=mem_power_i
    # temperature
    tmp=( xadc_mon.read(TEMPERATURE) & 0x0000FFF0) >> 4
    tmp=(tmp* 503.975)/4096 - 273.15
    ## update max
    if tmp > tmp_max:
      tmp_max=tmp
    ## update min
    if tmp < tmp_min:
      tmp_min=tmp
    tmp_avg+=tmp 
      
######################################
############ LOAD DESIGN #############
######################################
@ffi.def_extern()
def load_overlay():
  global accelerator 
  global overlay
  global xadc_mon
  global ROWS
  global COLUMNS
  global   ps_power
  global pl_power
  global mem_power
  global ps_power_max
  global pl_power_max
  global mem_power_max
  global ps_power_min
  global pl_power_min
  global mem_power_min
  global tmp_max
  global tmp_min
  global tmp_avg
  ## modify this part for choosing a different overlay and recompile the library
  f_clk="30mhz"
  datawidth="only_integer8"
  mxu_size="mxu_8x8"
  ROWS=8
  COLUMNS=8
  print("Hardware design space points",f_clk," ", " ", mxu_size, " ", datawidth)
  overlay = Overlay("/home/xilinx/dtpu_configurations/"+datawidth+"/"+f_clk+"/" + mxu_size+"/pynqz2.bit") # tcl is also parsed
  overlay.download() # Explicitly download bitstream to PL
  if overlay.is_loaded():
   # Checks if a bitstream is loaded
   if _DEBUG_PRINT: print("[DEBUG- PYTHON] ----overlay is loaded ----")
  else :
    if _DEBUG_PRINT: print("[DEBUG- PYTHON] ---- overlay is not loaded----")
    exit(-1)
  if overlay.monitor is not None:
    xadc_mon=overlay.monitor.xadc_wiz_0_0
    xadc_mon.write(SRR,0x0000000A) # reset
  else:
    print("ERROR NO XADC")
  if overlay.dtpu is not None:
    accelerator=overlay.dtpu.axis_accelerator_ada
  else:
    print("ERROR NO ACCELERATOR")
    exit(-1)
  overlay.reset()
  # clean power variable
  n_sample=1
  ps_power=0
  pl_power=0
  mem_power=0
  ps_power_max=sys.float_info.min
  pl_power_max=sys.float_info.min
  mem_power_max=sys.float_info.min
  ps_power_min=sys.float_info.max
  pl_power_min=sys.float_info.max
  mem_power_min=sys.float_info.max
  tmp_max=sys.float_info.min
  tmp_min=sys.float_info.max
  tmp_avg=0.00

  
@ffi.def_extern()
def Init_p(tot_tensors,input_tens_size,output_tens_size): 
  global accelerator
  global overlay
  global size_tot
  global input_size
  global output_size
  global avg_hw_execution
  global n_execution
  global avg_hw_execution_internal
  global n_execution_internal
  global tmp_avg
  if _DEBUG_PRINT: print("[DEBUG - PYTHON] --- Init p function ---")
  ## soft reset and accelerator configuration 
  accelerator.write(CTRL,0x0000001)
  accelerator.write(CTRL,0x0000000)
  accelerator.write(IARG_RQT_EN,0x000000007) ## all data avialable csr, weights and data
  accelerator.write(OARG_LENGTH_MODE,0x00000001) # software mode
  accelerator.write(OARG0_LENGTH,OUTFIFO_SIZE) # size outfifo 
  accelerator.write(ISCALAR_RQT_EN,0) # NO input SCALAR
  accelerator.write(OSCALAR_RQT_EN,0) # no output scalar
  accelerator.write(OARG0_TDEST,0) # only one output 
  size_tot=tot_tensors
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- total tensors",size_tot,"---")
  input_size=input_tens_size
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- int tensors",input_size,"---")
  output_size=output_tens_size
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- out tensors",output_tens_size,"---") 
  n_execution=0
  avg_hw_execution=0.00
  avg_hw_execution_internal=0.00
  n_execution_internal=0
  tmp_avg=0.00
  return True


@ffi.def_extern()
def SelectDataTypeComputation_p(data_type):
  global curr_data_precision
  global curr_bitwidth_data_computation
  global PACK_TYPE
  global FP
  global BFP
  global DTYPE_NP
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
  global output_tensors_p
  #push the tensor to the heap for handling their transfefr in the Prepare_p
  tot_size=1
  output_tensors_p.append(tensor)
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
    data_p.append(0) 
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
  global infifo_buffer_transfer
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
  global weight_buffer_multiple
  global index_wm
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
  csr_buffer=allocate(shape=(CSRMEM_SIZE,),dtype='u8')
  infifo_buffer_transfer=allocate(shape=(INFIFO_SIZE,),dtype='u8')
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
  index_wm=0# it eats the first data ?
  shift=int(64/curr_bitwidth_data_computation)
  iter=int(tot_size_weight/(WMEM_SIZE*(64/curr_bitwidth_data_computation))) # if it fits in th eaccelerator memory
  # always 4D tensors
  # assumptio is that the filter sizes always fit the accelerator
  if False:
    weight_buffer_multiple=1
    for w_ind in range(1): # pack only the weight for deep wise convolution 
      tmp=np.array(weight_tensors[w_ind].data, dtype=DTYPE_NP)
      tmp=tmp.reshape(*weight_tensors[w_ind].size_l)
      filter_height[w_ind],filter_width[w_ind]=tmp.shape[1:3]
      for i in range(len(tmp)):
        for l in range(weight_tensors[w_ind].size_l[3]):
          global_iteration_shift_wm.append(index_wm)
          for j in range(len(tmp[i])):
              # boundary check
              shift=int(64/curr_bitwidth_data_computation)
              if shift > len(tmp[i]):
                shift=len(tmp[i])
              weight_buffer[index_wm]=np.uint64(int.from_bytes( tmp[i,j,0:shift,l],byteorder="little",signed=False))
              index_wm+=1
          for j in range(ROWS-len(tmp[i])):
            weight_buffer[index_wm]=0
            index_wm+=1 # padding with zeros
  else:
    #print("it requires multiple iterations for the weight matrix") # multiple iteration on total weight 1MB should be enou-gh
    weight_buffer_multiple=[]*np.uint64(0)
    for w_ind in range(1): # pack only the weight for deep wise convolution 
      tmp=np.array(weight_tensors[w_ind].data, dtype=DTYPE_NP)
      tmp=tmp.reshape(*weight_tensors[w_ind].size_l)
      filter_height[w_ind],filter_width[w_ind]=tmp.shape[1:3]
      for i in range(len(tmp)):
        for l in range(weight_tensors[w_ind].size_l[3]):
          global_iteration_shift_wm.append(index_wm)
          for j in range(len(tmp[i])):
              # boundary check
              shift=int(64/curr_bitwidth_data_computation)
              if shift > len(tmp[i]):
                shift=len(tmp[i])
              weight_buffer_multiple.append(np.uint64(int.from_bytes( tmp[i,j,0:shift,l],byteorder="little",signed=False)))
              index_wm+=1
          for j in range(ROWS-len(tmp[i])):
            weight_buffer[index_wm]=0
            index_wm+=1 # padding with zeros
  if _DEBUG_PRINT:
    for i in range(10):
      print(hex(weight_buffer[i]))
  ################################
  ###### transferring data #######
  ################################
  weight_buffer.flush()
  return True

@ffi.def_extern()
def Invoke_p(only_conv2d,input_shift):
  global infifo_buffer_transfer
  global driver_csr
  global driver_wm
  global driver_fifo_in
  global driver_fifo_out
  global csr_buffer
  global weight_buffer
  global output_fifo_buffer
  global accelerator
  global global_iteration
  global global_iteration_shift_wm
  global curr_data_precision
  global input_tensors
  global output_tensors
  global filter_width
  global filter_height
  global tot_size_output
  global tot_size_input
  global output_tensors_p
  global avg_hw_execution
  global n_execution
  global avg_hw_execution_internal
  global n_execution_internal
  global weight_buffer_multiple
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
  input_fifo_buffer = []*np.uint64(0)
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
              input_fifo_buffer.append(np.uint64(int.from_bytes(tmp_ss[row,0:shift],byteorder="little",signed=False)))
              index+=1
  input_fifo_buffer=np.array(input_fifo_buffer,dtype='u8')
  input_fifo_buffer=np.reshape(input_fifo_buffer,newshape=(index,))

  for w_ind in range(len(input_tensors)):
    input_fifo_buffer=

  input_fifo_buffer=np.frombuffer(bytearray(),dtype='u8')
  if _DEBUG_PRINT:
    for i in range(10):
      print(hex(input_fifo_buffer[i]))  
  #iterate on the output matrix with also multiple weight iteration and inputs
  ## assumption is that the output tensor is always one!
  ## getting the output matrix structure
  #accelerator.write(CMD, (0x0000000 |(CMD_EXECUTE_CONTINOUS<<16))) 
  output_matrix=np.array(output_tensors[0].data, dtype=DTYPE_NP)
  output_matrix=output_matrix.reshape(*output_tensors[0].size_l)
  point_wise=np.array(weight_tensors[1].data,dtype=DTYPE_NP)
  ######################################
  ####### deepwise convolution #########
  ######################################
  if _DEBUG_PRINT:
    print("[DEBUG-PYTHON] ---------- deepwise convolution -------")
  if _TIME_PROBES:
    start_time=time.time()

  for shift_w in range(math.ceil(len(weight_buffer_multiple)/WMEM_SIZE)):
    ################################################
    ###### program the dma for the weight ##########
    ################################################
    if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- transfering weight buffer ----")
    weight_buffer[0:len(weight_buffer_multiple[WMEM_SIZE*(shift_w):WMEM_SIZE*(shift_w+1)])]=weight_buffer_multiple[WMEM_SIZE*(shift_w):WMEM_SIZE*(shift_w+1)]
    driver_wm.sendchannel.transfer(weight_buffer)
    driver_wm.sendchannel.wait()
    for batch_i in range(input_tensors[0].size_l[0]):
      for channel_i in range(input_tensors[0].size_l[-1]):
        ################################################
        ###### program the dma for the csr reg #########
        ################################################
        if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- transfering csr buffer for weight----")
        csr_buffer[ARITHMETIC_PRECISION]=(global_iteration_shift_wm[channel_i]<<32) | ((NO_FP<<8)) | (ACTIVATE_CHAIN<<4)| (curr_data_precision)
        #csr_buffer.flush() 
        driver_csr.sendchannel.transfer(csr_buffer)
        #driver_csr.sendchannel.wait()
        for infifo_shift in range(math.ceil(input_fifo_buffer.size/INFIFO_SIZE)):
          ######################################################
          ###### program the dma for the in/out fifos ##########
          ######################################################
          if _TIME_PROBES:
            start_time_i=time.time()          
          if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- transfering input buffer",infifo_shift," ----")
          infifo_buffer_transfer[0:input_fifo_buffer[INFIFO_SIZE*(infifo_shift):INFIFO_SIZE*(infifo_shift+1)].size]=input_fifo_buffer[INFIFO_SIZE*(infifo_shift):INFIFO_SIZE*(infifo_shift+1)]
          driver_fifo_in.sendchannel.transfer(infifo_buffer_transfer)
          #driver_fifo_in.sendchannel.wait()
          accelerator.write(OARG0_LENGTH,OUTFIFO_SIZE) # size outfifo
          accelerator.write(CMD, (0x0000000 |(CMD_EXECUTE_STEP<<16))) 
          accelerator.write(CMD,((CMD_UPDATE_OUT_ARG<<16)|(1))) 
          driver_fifo_out.recvchannel.transfer(output_fifo_buffer)
          if _DEBUG_PRINT: print("[DEBUG-PYTHON]----- getting output data -----")
          driver_fifo_out.recvchannel.wait()
          if _TIME_PROBES:
            end_time_i=time.time()
            avg_hw_execution_internal+=end_time_i-start_time_i
            n_execution_internal+=1
          if _DEBUG_PRINT: print(output_fifo_buffer)
          accelerator.write(CMD,((CMD_UPDATE_IN_ARG<<16)|(4))) # update input fifo
          ####################################################################
          ####### unpack the output buffer depending on the precision ########
          ####################################################################
          ## get values from output fifo buffer and put them into an array in order to sum all the data
          for i in range(output_matrix.shape[1]-1):
            for j in range(output_matrix.shape[2]-1):
              tmp_sum=np.zeros(shape=(ROWS,int(64/curr_bitwidth_data_computation)),dtype=DTYPE_NP) 
              tmp_data=output_fifo_buffer[channel_i*(ROWS*COLUMNS)+i*ROWS+j*COLUMNS:channel_i*(ROWS*COLUMNS)+(i+1)*ROWS+(j+1)*COLUMNS]
              tmp_sum=np.frombuffer(tmp_data.tobytes(),dtype=DTYPE_NP)
              #reshuffle and check if it is worth it 
              #if tmp_data.size >0:
              #  for row in range(len(tmp_data)):
              #    if row in tmp_data:
              #      tmp_sum[row]=np.frombuffer(tmp_data[row].tobytes(),dtype=DTYPE_NP)#convert(tmp_data[row])
              output_matrix[batch_i,i,j,channel_i]=np.multiply(tmp_sum.sum(dtype=DTYPE_NP),point_wise[channel_i],dtype=DTYPE_NP)
        accelerator.write(CMD,((CMD_UPDATE_IN_ARG<<16)|(1))) # update csr
      accelerator.write(CMD,((CMD_UPDATE_OUT_ARG<<16)|(1)))
    accelerator.write(CMD,((CMD_UPDATE_IN_ARG<<16)|(2))) # update w memory
  #if _DEBUG_PRINT:
  # print("[DEBUG-PYTHON]------- point wise convolution ---------")
  if _TIME_PROBES:
    end_time=time.time()
    avg_hw_execution+=end_time-start_time
    n_execution+=1
  accelerator.write(STATUS,0x00000003)##clear status
  #accelerator.write(CMD,((CMD_UPDATE_IN_ARG<<16)|(1))) # update csr
  #accelerator.write(CMD, (0x0000000 |(CMD_STOP_EXECUTE_CONTINOUS<<16)))  # stop accelerator
  ###########################################
  ######## point wise convolution ########### moved inside previous loop
  ###########################################
  #for batch_i in range(len(output_matrix)):
  #  for i in range(len(output_matrix[batch_i])):
  #    for j in range(len(output_matrix[batch_i,i])):
  #      for channel_i in range(len(output_matrix[batch_i,i,j])):
  #        output_matrix[batch_i,i,j,channel_i]=output_matrix[batch_i,i,j,channel_i]*weight_tensors[1].data[channel_i]
  if _DEBUG_PRINT: print("[DEBUG -PYTHON] ---- accelerator done ----")
  if _DEBUG_PRINT:
    print("[DEBUG-PYTHON] ------ final output data to tensorflow -----")
    print(output_matrix)
  # copy the output matrix to tensorflow environment ffi.memmove(dest,src,nbytets)
  ffi.memmove(ffi.buffer(output_tensors_p[0],output_matrix.nbytes),output_matrix,output_matrix.nbytes)
  # save the pointer to the output and then substitute the values into the point wise convolution 
  #clean up input/output 
  input_tensors=[]
  output_tensors=[]
  tot_size_input=0
  tot_size_output=0
  del input_fifo_buffer
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
  global infifo_buffer_transfer
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
  infifo_buffer_transfer.freebuffer()
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
  global output_fifo_buffer
  global csr_buffer
  global weight_buffer
  global driver_csr
  global driver_wm
  global driver_fifo_in
  global driver_fifo_out
  global accelerator
  if _DEBUG_PRINT: print("[DEBUG - PYTHON ] --- freeing buffers ---")
  output_fifo_buffer.freebuffer()
  csr_buffer.freebuffer()
  weight_buffer.freebuffer()
  del accelerator
  del driver_csr
  del driver_wm
  del driver_fifo_in
  del driver_fifo_out

@ffi.def_extern()
def start_power_consumption():
  global xadc_mon
  if _DEBUG_PRINT: print("[DEBUG-PYTHON] ---- start measurement of  power consumption ----")
  if xadc_mon is not None:
    try:
      _thread.start_new_thread( sample_power, ("Sampling power", 0.5 ) ) # every 1ms
    except:
      print("Error: unable to start thread")
  return True

@ffi.def_extern()
def print_power_consumption_p():
  global xadc_mon
  global ps_power
  global pl_power
  global mem_power
  if _DEBUG_PRINT: print("[DEBUG-PYTHON] ---- printing power consumption from xadc readings ----")
  ################################################
  ### Retrieve and display current temperature ###
  ################################################
  tmp=( xadc_mon.read(TEMPERATURE) & 0x0000FFF0) >> 4
  tmp=(tmp* 503.975)/4096 - 273.15
  print("Current temperature:",round(tmp,3)," C")
  print("Average execution temperature:", round(tmp_avg/n_sample,3)," C")
  print("Max temperature:", round(tmp_max,3) ," C")
  print("Min temperature:", round(tmp_min,3) ," C")
  # printing power consumption
  tot_power=ps_power+pl_power+mem_power
  print("Average power consumption=", round(tot_power*1000/n_sample,5)," mWatt")
  print("---> Processing System:",round(ps_power*1000/n_sample,5)," mWatt")
  print("---> Programmable Logic:",round(pl_power*1000/n_sample,5)," mWatt")
  print("---> Memory:",round(mem_power*1000/n_sample,3)," mWatt")
  print("Maximum power consumption")
  print("---> Processing System:",round(ps_power_max*1000,5)," mWatt")
  print("---> Programmable Logic:",round(pl_power_max*1000,5)," mWatt")
  print("---> Memory:",round(mem_power_max*1000,3)," mWatt")
  print("Minimum power consumption")
  print("---> Processing System:",round(ps_power_min*1000,5)," mWatt")
  print("---> Programmable Logic:",round(pl_power_min*1000,5)," mWatt")
  print("---> Memory:",round(mem_power_min*1000,5)," mWatt")
  return True

@ffi.def_extern() 
def activate_time_probe_p(activate):
  global _TIME_PROBES
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]--- activating time probe in python -----")
  if not(_TIME_PROBES) and activate:
    print("Time probes activated")
    _TIME_PROBES=True

@ffi.def_extern()
def print_python_time_probes():
  if _DEBUG_PRINT: print("[DEBUG-PYTHON]----- printing python time probes -----")
  print("Hardware execution time and rebuilding output matrix:", avg_hw_execution/n_execution," [s]")
  print("Hardware execution time:", avg_hw_execution_internal/n_execution_internal," [s]")
  #print("Hardware calls:",n_execution_internal)
  return True
