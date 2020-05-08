//==================================================================================================
//  Filename      : lib_dsp.v
//  Created On    : 2020-05-01 19:05:16
//  Last Modified : 2020-05-08 22:52:50
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology,Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com - angione@student.chalmers.se - s262620@studenti.polito.it
//
//  Description   : library for 32 bit multiplier and mac 32 --> integer signed
//					in trust of the synthesizer for choose the minimal area 
//					NOTE: for a migration to another hdl software, primitives can be implemented here 
//
//
//=================================================================================================
`timescale 1ns/1ps


/*he “logic” value is used specifically for XOR structures to go into the DSP primitives. 
For “logic”, this attribute can be placed on the module/architecture level only.   

•The “yes” and “no” values instruct the tool to either put the logic into a DSP or not. 
These values can be placed in the RTL on signals, architecture, components, entities, and modules. 
The priority is: 1. Signals. 2. Architectures and components. 3. Modules and entities*/


`include "precision_def.vh"
module  dsp_smul_32 (

input   CLK,
input   CE,
input   SCLR,
input   [47:0]PCIN,
input   SEL,
input   [31:0]A,
input   [31:0]B,
(*keep="false"*)output reg  [63:0]P
	);
(*keep="false"*)reg  [31:0] a_i;
(*keep="false"*)reg  [31:0] b_i;
(*keep="false"*)reg  [63:0] p_i;


always @(posedge CLK) begin 
	if(SCLR) begin
		a_i <= 0;b_i <= 0;P<=0;p_i<=0;
	end else begin
		 if(CE) begin 
		 		a_i<=A;
		 		b_i<=B;
				p_i<= ~SEL?  a_i*b_i : (a_i*b_i+PCIN<<32) ; 			
		 		P<=p_i[31:0];
		 end else begin 
		 	a_i <= 0;b_i <= 0;P<=0;p_i<=0;
		 end
	end
	
end

endmodule : dsp_smul_32

module  dsp_smul_64 (

input   CLK,
input   [`LOG_ALLOWED_PRECISIONS-1:0]CE,
input   SCLR,
input   active_chain,
input   [63:0]A,
input   [63:0]B,
output [63:0]P
	);

// first 8 bits
reg  [7:0] a_i_8_0;
reg  [7:0] b_i_8_0;
reg  [15:0] p_i_8_0;
// second 8 bits
reg  [7:0] a_i_8_1;
reg  [7:0] b_i_8_1;
reg  [15:0] p_i_8_1;
// third 16 bits
reg  [15:0] a_i_16;
reg  [15:0] b_i_16;
reg  [31:0] p_i_16;
// fourth 32 bits
reg  [31:0] a_i_32;
reg  [31:0] b_i_32;
reg  [63:0] p_i_32;


reg  [127:0] p_i_64;

always @(posedge CLK) begin 
	if(SCLR) begin
		a_i_8_0<=0;a_i_8_1<=0;a_i_16<=0;a_i_32<=0;
		b_i_8_0<=0;b_i_8_1<=0;b_i_16<=0;b_i_32<=0;
		p_i_8_0<=0;p_i_8_1<=0;p_i_16<=0;p_i_32<=0;
		p_i_64<=0;
	end else begin
		 
		 		a_i_8_0<=CE[0] ? A[7:0] : 8'd0;
		 		a_i_8_1<=CE[1] ? A[15:8] : 8'd0;
		 		a_i_16 <=CE[2] ? A[31:16] : 16'd0;
		 		a_i_32 <=CE[3] ? A[63:32] : 32'd0;
		 		b_i_8_0<=CE[0] ? B[7:0] : 8'd0;
		 		b_i_8_1<=CE[1] ? B[15:8] : 8'd0;
		 		b_i_16 <=CE[2] ? B[31:16] : 16'd0;
		 		b_i_32 <=CE[3] ? B[63:32] : 32'd0;
				// chain active or not
				p_i_8_0<=active_chain && ~CE[0] ? 16'd0 
										:a_i_8_0*b_i_8_0;  // 7:0
				p_i_8_1<=active_chain && ~CE[1]  ? 16'd0 :
										a_i_8_1*b_i_8_1;  // 15:8
				p_i_16<= active_chain && ~CE[2]  ? 32'd0:
										a_i_16 * b_i_16; // 31:16
				p_i_32<= active_chain && ~CE[3]  ? 64'd0 : 
										a_i_32*b_i_32; //63:32
		 		p_i_64<= active_chain && CE[0] && CE[1]  && CE[2] && CE[3] ?
		 					 {a_i_32,a_i_16,a_i_8_1,a_i_8_0}*{b_i_32,b_i_16,b_i_8_1,b_i_8_0} : 128'd0;
	end
	
end
assign P=active_chain ? p_i_64[63:0] : {p_i_32[31:0],p_i_16[15:0],p_i_8_1[7:0],p_i_8_0[7:0]};
endmodule : dsp_smul_64


module dsp_smac_32 (

input   CLK,
input   CE,
input   SCLR,
input   [47:0]PCIN,
input   SEL,
input   [31:0]A,
input   [31:0]B,
input   [31:0]C,
(*keep="false"*)output reg  [63:0]P
	
);
(*keep="false"*)reg  [31:0] a_i;
(*keep="false"*)reg  [31:0] b_i;
(*keep="false"*)reg  [31:0] c_i;
(*keep="false"*)reg  [31:0] mul_res;
wire  [63:0] p_i;
wire  [63:0] mul_res_w;

assign mul_res_w=~SEL ? a_i*b_i : a_i*b_i+0 ;
assign p_i= ~SEL ? mul_res + c_i : mul_res + c_i+0 ;

always @(posedge CLK ) begin 
	if(SCLR) begin
			a_i <= 0;b_i <= 0;P<=0;c_i<=0;	 
	end else begin
		if(CE) begin 
			a_i<=A;
			b_i<=B;
			c_i<=C;
			mul_res<=mul_res_w;
			P<=p_i;
		end else begin 
			a_i <= 0;b_i <= 0;P<=0;c_i<=0; mul_res<=0;
		end 
	end
end


endmodule: dsp_smac_32


module dsp_smac_64 (
input   CLK,
input   [`LOG_ALLOWED_PRECISIONS-1:0]CE,
input   SCLR,
input   active_chain,
input   [63:0]A,
input   [63:0]B,
input   [63:0]C,
output reg [63:0]P
	);

// first 8 bits
reg  [7:0] a_i_8_0;
reg  [7:0] b_i_8_0;
reg  [7:0] c_i_8_0;
reg  [15:0] mul_i_8_0;
reg  [15:0] p_i_8_0;
// second 8 bits
reg  [7:0] a_i_8_1;
reg  [7:0] b_i_8_1;
reg  [7:0] c_i_8_1;
reg  [15:0] mul_i_8_1;
reg  [15:0] p_i_8_1;
// third 16 bits
reg  [15:0] a_i_16;
reg  [15:0] b_i_16;
reg  [15:0] c_i_16;
reg  [31:0] mul_i_16;
reg  [31:0] p_i_16;
// fourth 32 bits
reg  [31:0] a_i_32;
reg  [31:0] b_i_32;
reg  [31:0] c_i_32;
reg  [63:0] mul_i_32;
reg  [63:0] p_i_32;

always @(posedge CLK) begin 
	if(SCLR) begin
		a_i_8_0<=0;a_i_8_1<=0;a_i_16<=0;a_i_32<=0;
		b_i_8_0<=0;b_i_8_1<=0;b_i_16<=0;b_i_32<=0;
		c_i_8_0<=0;c_i_8_1<=0;c_i_16<=0;c_i_32<=0;
		p_i_8_0<=0;p_i_8_1<=0;p_i_16<=0;p_i_32<=0;
		mul_i_8_0<=0;mul_i_8_1<=0;mul_i_16<=0;mul_i_32<=0;
		P<=0;
	end else begin
		 
		 		a_i_8_0<=CE[0] ? A[7:0] : 8'd0;
		 		a_i_8_1<=CE[1] ? A[15:8] : 8'd0;
		 		a_i_16 <=CE[2] ? A[31:16] : 16'd0;
		 		a_i_32 <=CE[3] ? A[63:32] : 32'd0;
		 		b_i_8_0<=CE[0] ? B[7:0] : 8'd0;
		 		b_i_8_1<=CE[1] ? B[15:8] : 8'd0;
		 		b_i_16 <=CE[2] ? B[31:16] : 16'd0;
		 		b_i_32 <=CE[3] ? B[63:32] : 32'd0;
		 		c_i_8_0<=CE[0] ? B[7:0] : 8'd0;
		 		c_i_8_1<=CE[1] ? B[15:8] : 8'd0;
		 		c_i_16 <=CE[2] ? B[31:16] : 16'd0;
		 		c_i_32 <=CE[3] ? B[63:32] : 32'd0;
				// chain active or not
				// multiplication  
				mul_i_8_0<=active_chain && ~CE[0] ? 16'd0 
										:a_i_8_0*b_i_8_0;  // 7:0
				mul_i_8_1<=active_chain && ~CE[1]  ? 16'd0 :
										a_i_8_1*b_i_8_1;  // 15:8
				mul_i_16<= active_chain && ~CE[2]  ? 32'd0:
										a_i_16 * b_i_16; // 31:16
				mul_i_32<= active_chain && ~CE[3]  ? 64'd0 : 
										a_i_32*b_i_32; //63:32

				// additions
				p_i_8_0<=active_chain && ~CE[0] ? 16'd0 
										:mul_i_8_0+ c_i_8_0;  // 7:0
				p_i_8_1<=active_chain && ~CE[1]  ? 16'd0 :
										mul_i_8_1+ c_i_8_1;  // 15:8
				p_i_16<= active_chain && ~CE[2]  ? 32'd0:
										mul_i_16+ c_i_16; // 31:16
				p_i_32<= active_chain && ~CE[3]  ? 64'd0 : 
										mul_i_32+ c_i_32; //63:32

				P<= active_chain ?  64'hffff :  {p_i_32[31:0],p_i_16[15:0],p_i_8_1[7:0],p_i_8_0[7:0]};
	end
	
end
endmodule : dsp_smac_64
