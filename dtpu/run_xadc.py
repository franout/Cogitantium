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
VP_VN=0x20C # rw When read: The 12-bit MSB justified result of A/D conversion on the dedicated analog input channel (Vp/Vn) is stored in this register.When written: Write to this register resets theXADC hard macro. No specific data isrequired.overlay = Overlay("/home/xilinx/pynqz2.bit") # tcl is also parsed
VREF_P=0x210 # r The 12-bit MSB justified result of A/D conversion on the reference input V REFP is stored in this register. 
VREF_N= 0x214 #r The 12-bit MSB justified result of A/D conversion on the reference input V REFN is stored in this register. 
VCC_BRAM= 0x218 # r The 12-bit MSB justified result of A/D conversion on the reference input V BRAM is stored in this register overlay.download() # Explicitly download bitstream to PL 

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

ALLARM_THRESHOLD_0= 0x340 #rw The 12-bit MSB justified alarm threshold register 0 (Temperature Upper).
ALLARM_THRESHOLD_1= 0x344 #rw he 12-bit MSB justified alarm threshold register 1 (V CCINT Upper).
ALLARM_THRESHOLD_2= 0x348 #rw The 12-bit MSB justified alarm threshold register 2 (V CCAUX Upper).
ALLARM_THRESHOLD_3= 0x34C #rw the 12-bit MSB justified alarm threshold register 3 (OT Upper).
ALLARM_THRESHOLD_4= 0x350 #rw the 12-bit MSB justified alarm threshold register 4 (Temperature Lower).
ALLARM_THRESHOLD_5= 0x354 #rw  the 12-bit MSB justified alarm threshold register 5 (V CCINT Lower).
ALLARM_THRESHOLD_6= 0x358 #rw The 12-bit MSB justified alarm threshold register 6 (V CCAUX Lower).
ALLARM_THRESHOLD_7= 0x35C # rw The 12-bit MSB justified alarm threshold register 7 (OT Lower
ALLARM_THRESHOLD_8= 0x360 # rw The 12-bit MSB justified alarm threshold register 8 (VBRAM Upper
ALLARM_THRESHOLD_9= 0x364 # rw The 12-bit MSB justified alarm threshold  register 9 (V CCPint Upper). This register is only on Zynq-7000 devices.
ALLARM_THRESHOLD_10= 0x368 # rw The 12-bit MSB justified alarm threshold  register 10 (V CCPaux Upper). This register is only on Zynq-7000 devices
ALLARM_THRESHOLD_11= 0x36C # rw The 12-bit MSB justified alarm threshold register 11 (V CCDDRO Upper). This register is  only on Zynq-7000 devic 
ALLARM_THRESHOLD_12= 0x370 # rw he 12-bit MSB justified alarm threshold register 12 (VBRAM Lower) 
ALLARM_THRESHOLD_13= 0x374 # rw The 12-bit MSB justified alarm threshold register 13 (V CCPint Lower). This register is only on Zynq-7000 devices
ALLARM_THRESHOLD_14= 0x378 # rw The 12-bit MSB justified alarm threshold register 14 (V CCPaux Lower). This register is only on Zynq-7000 devices.
ALLARM_THRESHOLD_15= 0x37C # rw he 12-bit MSB justified alarm threshold register 15 (V CCDDRO Lower). This register is only on Zynq-7000 devices.



overlay = Overlay("/home/xilinx/pynqz2.bit") # tcl is also parsed

overlay.download() # Explicitly download bitstream to PL

if overlay.is_loaded():
 # Checks if a bitstream is loaded
 print("overlay is loaded")
else :
	print("overlay is not loaded")
	exit(-1)


xadc_mon=overlay.monitor


#reset
xadc_mon.write(SRR,0x0000000A)

################################################
### Retrieve and display current temperature ###
################################################
tmp=( xadc_mon.read(TEMPERATURE) & 0x0000FFF0) >> 4
tmp=(tmp* 503.975)/4096 - 273.15
print("Current temperature:",round(tmp,3),"°C")


#################################################
##### Retrieve and display power consumption ####
##### Supply sensor: Vccint,Vccaux,Vccbram   ####
##### 		Vccpint, Vccpaux,Vcc0ddr        #####
##################################################

##################################################
##### Nominal values of resistances and Vcc ######
##################################################
# from vivado report power
vcc_pl_int_nom=1.00
vcc_pl_aux_nom=1.80
vcc_pl_bram_nom= 1.00
vcc_ps_nom=1.80
vcc_ps_aux=1.80
vcc_ddr_nom=1.50

r_pl_int=
r_pl_aux
r_pl_bram=
r_ps=
r_ps_aux=
r_ddr=


vcc_pl_int=( xadc_mon.read(VCC_INT) & 0x0000FFF0) >> 4
vcc_pl_int= (vcc_pl_int* 3) / 4096

vcc_pl_aux=( xadc_mon.read(VCC_AUX) & 0x0000FFF0) >> 4
vcc_pl_aux= (vcc_pl_aux* 3) / 4096

vcc_pl_bram= ( xadc_mon.read(VCC_BRAM) & 0x0000FFF0) >> 4
vcc_pl_bram= (vcc_pl_bram* 3) / 4096

vcc_ps= ( xadc_mon.read(DEV_CORE_SUPPLY) & 0x0000FFF0) >> 4
vcc_ps= (vcc_ps* 3) / 4096

vcc_ps_aux=( xadc_mon.read(DEV_AUX_CORE_SUPPLY) & 0x0000FFF0) >> 4
vcc_ps_aux= (vcc_ps_aux* 3) / 4096


vcc_ddr= ( xadc_mon.read(DEV_CORE_MEM_SUPPLY) & 0x0000FFF0) >> 4
vcc_ddr= (vcc_ddr* 3) / 4096


ps_power=((vcc_ps_int_nom-vcc_ps_int)/r_ps_int)*vcc_ps_int_nom + ((vcc_ps_aux_nom-vcc_ps_aux)/r_ps_aux)*vcc_ps_aux_nom 
pl_power= ((vcc_pl_int_nom-vcc_pl_int)/r_pl_int)*vcc_pl_int_nom + ((vcc_pl_aux_nom-vcc_pl_aux)/r_pl_aux)*vcc_pl_aux_nom + ((vcc_pl_bram_nom-vcc_pl_bram)/r_pl_bram)*vcc_pl_bram_nom 
mem_power=((vcc_ddr_nom-vcc_ddr)/r_ddr)*vcc_ddr_nom

tot_power=ps_power+pl_power+mem_power
# printing power consumption
print("Current power consumption=", round(tot_power,3)," Watt")
print("---> Processing System:",round(ps_power,3)," Watt")
print("---> Programmable Logic:",round(pl_power,3)," Watt")
print("---> Memory:",round(mem_power,3)," Watt")