`ifndef __CSR_DEFINITION_VH
`define __CSR_DEFINITION_VH


/////////////////////////////////////////////////////
/// MEMORY MAP OF CONTROL AND STATUS REGISTER ///////
/// 			data width 8 bit 			  ///////
/// A-> address 							  ///////
/////////////////////////////////////////////////////

`define A_ARITHMETIC_PRECISION 32'd0
`define A_FP_MODE 32'd1 // 0 -> NO FP 
`define A_BATCH_SIZE 32'd2
`define A_TRANSPARENT_DELAY_REGISTERS 32'd3
`define A_DEBUG 32'd2
`define A_TEST_MODE 32'd2


`endif