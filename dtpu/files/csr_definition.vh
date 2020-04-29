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

/* arithmetic precison and window wm are in the same data access 
	A_ARITHMETIC_PRECISION -> 31:0
	A_WINDOW_WM -> 63:32  
	the windows of wm will be added into the counter weight page 
	in the ls array module, this means that the weight memory  
	is divide into pages for which the size is equal to the 
	number of rows.
	It is due to the fact that the weigth can be reused and thus 
	only once transferred
	*/

///////////////////////////////////////////////////////
// definition of starting address for weight memory ///
///////////////////////////////////////////////////////
`define A_WINDOW_WM 32'd0
`define A_WINDOW_WM_MSB 64
`define A_WINDOW_WM_LSB 32
/////////////////////////////////////////////////
////// NOTE -> no check on validity 	  ///////
//////   		of generated address	 ////////
////// 			 and the size of memory  ////////
/////////////////////////////////////////////////
`endif