`ifndef __PRECISION_DEF_VH
`define __PRECISION_DEF_VH


`define  LOG_ALLOWED_PRECISIONS 4 //LOG 2 of total allowed precions (9) 

// integer and fp options are placed in two different memory location 
// if fp is activet the integer means fp precison (fp16,32,etc)
// integer
`define NO_COMPUTATION 4'h0
`define INT8 4'h1
`define INT16 4'h3
`define INT32 4'h7
`define INT64 4'hf
 
//FLOATING POINT
`define FP 4'h01
`define BFPP16 4'h03
// on the same 8 bit of fp in csr there is also a possible custom rounding error 

`define VIVADO_MAC 1


`endif