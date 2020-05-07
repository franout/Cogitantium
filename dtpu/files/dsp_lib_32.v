//==================================================================================================
//  Filename      : lib_dsp.v
//  Created On    : 2020-05-01 19:05:16
//  Last Modified : 2020-05-07 16:28:24
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
wire  [63:0] p_i;


assign p_i= ~SEL?  a_i*b_i : (a_i*b_i+PCIN<<32) ;

always @(posedge CLK) begin 
	if(SCLR) begin
		a_i <= 0;b_i <= 0;P<=0;
	end else begin
		 if(CE) begin 
		 		a_i<=A;
		 		b_i<=B;
		 		P<=p_i[31:0];
		 end else begin 
		 	a_i <= 0;b_i <= 0;P<=0;
		 end
	end
	
end

endmodule : dsp_smul_32


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
