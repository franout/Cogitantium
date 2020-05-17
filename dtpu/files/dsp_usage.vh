`ifndef __DSP_USAGE_VH
`define __DSP_USAGE_VH


`include "precision_def.vh"
/**************************************************************
	dsp usage for generation algorithm of mac units 
		in the mxu core 
	NOTE: board and tool dependent and previously checked! 
**************************************************************/


`ifdef USEO_INT32 
	`define DSP_INC 3
`elsif USE_ALL
	`define DSP_INC 14
`elsif  USE0_FP32 
	`define DSP_INC 2
`elsif  USE0_FP16 
`elsif USE0_BFP16 
 	`define DSP_INC 2
`else 
 	`define DSP_INC 1
`endif

`endif  
