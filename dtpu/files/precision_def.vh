
`ifndef __PRECISION_DEF_VH
`define __PRECISION_DEF_VH


`define  LOG_ALLOWED_PRECISIONS 4 //LOG 2 of total allowed precions (9) 

// integer and fp options are placed in two different memory location 
// if fp is activet the integer means fp precison (fp16,32,etc)
// integer
`define NO_COMPUTATION 4'h0
`define NO_CHAIN 1'b0
`define INT8 4'h1
`define INT16 4'h3
`define INT32 4'h7
`define INT64 4'hf
 
//FLOATING POINT
`define FP8 `INT8
`define FP16 `INT16
`define FP32 `INT32
`define FP64 `INT64

`define FP 4'h01
`define BFPP16 4'h03
// on the same 8 bit of fp in csr there is also a possible custom rounding error 

`define VIVADO_MAC 1 // mutually exclusive with below definitions
// used for different generation of design 
`define USE_ALL 0 // it can be all or the int8/16/32/64 
`define USEO_INT8 1
`define USEO_INT16 0
`define USEO_INT32 0
`define USEO_INT64 0

`endif