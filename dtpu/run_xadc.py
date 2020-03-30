#!/usr/python3
from pynq import Overlay
from pynq import MMIO
from pynq import allocate
#from pynq.lib import dma
from pynq import Xlnk
import time

######################
##### memory map #####
######################
C_BASEADDRESS=0x43C10000 # 
SRR= C_BASEADDRESS + 0x0 # w software reset register
SR= C_BASEADDRESS + 0x04 # r status register
AOSR= C_BASEADDRESS + 0x08 # r allarm output status register
CONVSTR= C_BASEADDRESS+0x0C # w Bit[0] = ADC convert start register (3) Bit[1] = Enable temperature update logic Bit[17:2] = Wait cycle for temperature update 
SYSMONRR=C_BASEADDRESS+0x10 # w xadc hard macro reset register

GIER=C_BASEADDRESS+0x5C # rw global interrupt enable register
IPISR=C_BASEADDRESS+0x60 # r toggle on write ip interrupt status register
IPIER=C_BASEADDRESS+0x68 # rw ip interrupt enable register

TEMPERATURE=C_BASEADDRESS+0x200 # The 12-bit Most Significant Bit (MSB)  justified result of on-device temperature measurement is stored in this register
VCC_INT=C_BASEADDRESS+0x204 # The 12-bit MSB justified result of on-device V CCINT supply monitor measurement is storedin this register.
VCC_AUX=C_BASEADDRESS+0x208 # The 12-bit MSB justified result of on-device V CCAUX Data supply monitor measurement is stored in this register
VP_VN=C_BASEADDRESS+0x20C # rw When read: The 12-bit MSB justified result of A/D conversion on the dedicated analog input channel (Vp/Vn) is stored in this register.When written: Write to this register resets theXADC hard macro. No specific data isrequired.overlay = Overlay("/home/xilinx/pynqz2.bit") # tcl is also parsed
VREF_P=C_BASEADDRESS +0x210 # r The 12-bit MSB justified result of A/D conversion on the reference input V REFP is stored in this register. 
VREF_N=C_BASEADDRESS + 0x214 #r The 12-bit MSB justified result of A/D conversion on the reference input V REFN is stored in this register. 
V_BRAM=C_BASEADDRESS + 0x218 # r The 12-bit MSB justified result of A/D conversion on the reference input V BRAM is stored in this register overlay.download() # Explicitly download bitstream to PL 

SUPPLY_A_OFFSET=C_BASEADDRESS + 0x220 # r The calibration coefficient for the supply  sensor offset of ADC A is stored in this register
ADC_A_OFFSET= C_BASEADDRESS + 0x224 # r The calibration coefficient for the ADC A offset calibration is stored in this register. 
ADC_A_GAIN_ERR= C_BASEADDRESS +0x228 # r The calibration coefficient for the gain error of ADC A is stored in this register.

DEV_CORE_SUPPLY=C_BASEADDRESS +0x234 #r  The  VCCINT of PSS core supply. Present only  on Zynq-7000 devices.
DEV_AUX_CORE_SUPPLY=C_BASEADDRESS +0x238 # r The VCCAUX of PSS core supply. Present only on Zynq-7000 devices.
DEV_CORE_MEM_SUPPLY=C_BASEADDRESS +0x23C # r The VCCMEM of PSS core supply. Present only on Zynq-7000 devices

# v axux p/n
V_AUX_0= C_BASEADDRESS + 0x240 #r The 12-bit MSB justified result of A/D conversion on the auxiliary analog input 0 is  stored in this register.
V_AUX_1= C_BASEADDRESS + 0x244 #r 
V_AUX_2= C_BASEADDRESS + 0x248 #r 
V_AUX_3= C_BASEADDRESS + 0x24C #r 
V_AUX_4= C_BASEADDRESS + 0x250 #r 
V_AUX_5= C_BASEADDRESS + 0x254 #r 
V_AUX_6= C_BASEADDRESS + 0x258 #r 
V_AUX_7= C_BASEADDRESS + 0x25C #r 
V_AUX_8= C_BASEADDRESS + 0x260 #r 
V_AUX_9= C_BASEADDRESS + 0x264 #r 
V_AUX_10= C_BASEADDRESS + 0x268 #r 
V_AUX_11= C_BASEADDRESS + 0x26C #r 
V_AUX_12= C_BASEADDRESS + 0x270 #r 
V_AUX_13= C_BASEADDRESS + 0x274 #r 
V_AUX_14= C_BASEADDRESS + 0x278 #r 
V_AUX_15= C_BASEADDRESS + 0x27C #r 


## value of 12 bit msb
MAX_TMP=C_BASEADDRESS + 0x280   # r
MAX_VCC_INT=C_BASEADDRESS + 0x284   # r
MAX_VCC_AUX=C_BASEADDRESS + 0x288   # r
MAV_V_BRAM=C_BASEADDRESS + 0x28C   # r
MIN_TMP=C_BASEADDRESS + 0x290   # r
MIN_VCC_INT=C_BASEADDRESS+ 0x294   # r
MIN_VCC_AUX=C_BASEADDRESS+ 0x298   # r
MIN_V_BRAM=C_BASEADDRESS+ 0x29C   # r
MAX_VCC_PINT=C_BASEADDRESS + 0x2A0 # r 
MAX_VCC_PAUX=C_BASEADDRESS + 0x2A4 # r 
MAX_VCC_DDRO=C_BASEADDRESS + 0x2A8 # r 
MIN_VCC_PINT=C_BASEADDRESS + 0x2b0 # r 
MIN_VCC_PAUX=C_BASEADDRESS + 0x2b4 # r 
MIN_VCC_DDRO=C_BASEADDRESS + 0x2b8 # r 

SUPPLY_B_OFFSET=C_BASEADDRESS + 0x2C0 # r The calibration coefficient for the supply  sensor offset of ADC A is stored in this register
ADC_B_OFFSET= C_BASEADDRESS + 0x2C4 # r The calibration coefficient for the ADC A offset calibration is stored in this register. 
ADC_B_GAIN_ERR= C_BASEADDRESS +0x2C8 # r The calibration coefficient for the gain error of ADC A is stored in this register.


FLAGS=C_BASEADDRESS+0x2FC

if overlay.is_loaded():
 # Checks if a bitstream is loaded
 print("overlay is loaded")
else :
	print("overlay is not loaded")
	exit(-1)


xadc_mon=overlay.monitor


