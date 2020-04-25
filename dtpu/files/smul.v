//==================================================================================================
//  Filename      : smul.v
//  Created On    : 2020-04-22 17:05:25
//  Last Modified : 2020-04-25 15:45:07
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology,Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com
//
//  Description   : 
//
//
//==================================================================================================

`timescale 1ns/1ps
`include "precision_def.vh"

module smul
#(parameter USE_FABRIC="NO") // if no -> it uses the dsp 
 (
	input clk,
	input ce,
	input sclr,
	///////////////////////////////////////////
  ///// DATA SIGNALS OF SubMAC unit /////////
  ///////////////////////////////////////////
  input [63:0]input_data,
	input [63:0]weight,
	output [63:0]res_mac_next,
  /////////////////////////////////////////
  ///// CONTROL SIGNALS FOR DSP CHAIN /////
  /////////////////////////////////////////
  input wire [3:0]select_precision,
  input wire [1:0] enable_fp_unit,
  input wire active_chain      
	);




   wire [3:0]enable_i;
   wire [47:0]pcout[0:7];
   
   /////////////////////////
   ///// enable network //// 
   /////////////////////////
   genvar i;
   generate 
   for(i=0;i<4;i=i+1) begin 
   assign enable_i[i]= ce & select_precision[i];
   end
   endgenerate


///////////////////////////////////
///// propagate chain network ///// 
///////////////////////////////////

generate
  for(i=1;i<8;i=i+1)  begin
    assign pcout[i]= active_chain ? pcout[i-1] : 0;
  end
endgenerate
//TODO MISSING SHIFT OF PROPAGATE VALUE
/////////////////////////////////////////
/////// integer unit  chain /////////////
/////////////////////////////////////////
   generate
     if(USE_FABRIC=="YES") begin 
      // generate fabric implementation of multipliers
        `ifdef `USE_ALL
        dsp_smul_8_fa smul_8_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(select_precision[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(input_data[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_next[7:0])          // output wire [7 : 0] P
                      );

        dsp_smul_8_fa smul_8_1_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(selecst_precision[1]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b1),      // input wire [0 : 0] SEL
                    .PCIN(pcout[1]),    // input wire [47 : 0] PCIN
                    .A(input_data[15:8]),          // input wire [7 : 0] A
                    .B(weight[15:8]),          // input wire [7 : 0] B
                    .PCOUT(pcout[2]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_next[15:8])          // output wire [7 : 0] P
                    );
        dsp_smul_16_fa smul_16_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(select_precision[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(pcout[3]),    // input wire [47 : 0] PCIN
                    .A(input_data[31:16]),          // input wire [15 : 0] A
                    .B(weight[31:16]),          // input wire [15 : 0] B
                    .PCOUT(pcout[4]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_next[31:16])          // output wire [47 : 0] P
                      );

        // 32 bit dsp logically 
        dsp_smul_16_fa smul_32_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(select_precision[3]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(pcout[4]),    // input wire [47 : 0] PCIN
                    .A(input_data[47:32]),          // input wire [15 : 0] A
                    .B(weight[47:32]),          // input wire [15 : 0] B
                    .PCOUT(pcout[5]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_next[47:32])          // output wire [47 : 0] P
                      );
        dsp_smul_16_fa smul_32_1_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(select_precision[3]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(pcout[6]),    // input wire [47 : 0] PCIN
                    .A(input_data[63:48]),          // input wire [15 : 0] A
                    .B(weight[63:48]),          // input wire [15 : 0] B
                    .PCOUT(pcout[7]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_next[63:48])          // output wire [47 : 0] P
                      );
        `elif USEO_INT8
                  dsp_smul_8_fa smul_8_0s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(select_precision[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(input_data[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_next[7:0])          // output wire [7 : 0] P
                      );
        `elif USEO_INT16
              dsp_smul_16_fa smul_16s_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(select_precision[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(input_data[15:0]),          // input wire [7 : 0] A
                    .B(weight[15:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_next[15:0])          // output wire [7 : 0] P
                      );
        `elif USEO_INT32

        // 32 bit dsp logically 
        dsp_smul_16_fa smul_32_0s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(select_precision[3]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(pcout[4]),    // input wire [47 : 0] PCIN
                    .A(input_data[15:0]),          // input wire [15 : 0] A
                    .B(weight[15:0]),          // input wire [15 : 0] B
                    .PCOUT(pcout[5]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_next[15:0])          // output wire [47 : 0] P
                      );
        dsp_smul_16_fa smul_32_1s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(select_precision[3]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(pcout[5]),    // input wire [47 : 0] PCIN
                    .A(input_data[31:16]),          // input wire [15 : 0] A
                    .B(weight[31:16]),          // input wire [15 : 0] B
                    .PCOUT(pcout[6]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_next[31:16])          // output wire [47 : 0] P
                      );
        `endif
     end else begin 
      // generate dsp implementation of multipliers
      `ifdef `USE_ALL
          dsp_smul_8 smul_8_0 (
                      .CLK(clk),      // input wire CLK
                      .CE(select_precision[0]),        // input wire CE
                      .SCLR(sclr),    // input wire SCLR
                      .SEL(1'b0),      // input wire [0 : 0] SEL
                      .PCIN(0),    // input wire [47 : 0] PCIN
                      .A(input_data[7:0]),          // input wire [7 : 0] A
                      .B(weight[7:0]),          // input wire [7 : 0] B
                      .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                      .P(res_mac_next[7:0])          // output wire [7 : 0] P
                    );
          dsp_smul_8 smul_8_1 (
                      .CLK(clk),      // input wire CLK
                      .CE(select_precision[1]),        // input wire CE
                      .SCLR(sclr),    // input wire SCLR
                      .SEL(1'b1),      // input wire [0 : 0] SEL
                      .PCIN(pcout[1]),    // input wire [47 : 0] PCIN
                      .A(input_data[15:8]),          // input wire [7 : 0] A
                      .B(weight[15:8]),          // input wire [7 : 0] B
                      .PCOUT(pcout[2]),  // output wire [47 : 0] PCOUT
                      .P(res_mac_next[15:8])          // output wire [7 : 0] P
                    );

          dsp_smul_16 smul_16_0 (
              .CLK(clk),      // input wire CLK
              .CE(select_precision[2]),        // input wire CE
              .SCLR(sclr),    // input wire SCLR
              .PCIN(pcout[3]),    // input wire [47 : 0] PCIN
              .A(input_data[31:16]),          // input wire [15 : 0] A
              .B(weight[31:16]),          // input wire [15 : 0] B
              .PCOUT(pcout[4]),  // output wire [47 : 0] PCOUT
              .P(res_mac_next[31:16])          // output wire [15 : 0] P
                  );

          // 32 bit dsp logically 

          dsp_smul_16 smul_32_0 (
              .CLK(clk),      // input wire CLK
              .CE(select_precision[3]),        // input wire CE
              .SCLR(sclr),    // input wire SCLR
              .PCIN(pcout[5]),    // input wire [47 : 0] PCIN
              .A(input_data[47:32]),          // input wire [15 : 0] A
              .B(weight[47:32]),          // input wire [15 : 0] B
              .PCOUT(pcout[6]), // output wire [47 : 0] PCOUT
              .P(res_mac_n[47:32])          // output wire [15 : 0] P
                  );

        dsp_smul_16 smul_32_1 (
              .CLK(clk),      // input wire CLK
              .CE(select_precision[3]),        // input wire CE
              .SCLR(sclr),    // input wire SCLR
              .PCIN(pcout[6]),    // input wire [47 : 0] PCIN
              .A(input_data[63:48]),          // input wire [15 : 0] A
              .B(weight[63:48]),          // input wire [15 : 0]          
              .PCOUT(pcout[7]),  // output wire [47 : 0] PCOUT
              .P(res_mac_next[63:48])          // output wire [15 : 0]              
               );
        `elif USEO_INT8
                  dsp_smul_8 smul_8_0s (
                    .CLK(clk),      // input wire CLK
                    .CE(select_precision[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(input_data[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_next[7:0])          // output wire [7 : 0] P
                      );
        `elif USEO_INT16
              dsp_smul_16 smul_16s_0 (
                    .CLK(clk),      // input wire CLK
                    .CE(select_precision[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(input_data[15:0]),          // input wire [7 : 0] A
                    .B(weight[15:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_next[15:0])          // output wire [7 : 0] P
                      );
        `elif USEO_INT32

        // 32 bit dsp logically 
        dsp_smul_16 smul_32_0s (
                    .CLK(clk),      // input wire CLK
                    .CE(select_precision[3]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(pcout[4]),    // input wire [47 : 0] PCIN
                    .A(input_data[15:0]),          // input wire [15 : 0] A
                    .B(weight[15:0]),          // input wire [15 : 0] B
                    .PCOUT(pcout[5]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_next[15:0])          // output wire [47 : 0] P
                      );
        dsp_smul_16 smul_32_1s (
                    .CLK(clk),      // input wire CLK
                    .CE(select_precision[3]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(pcout[5]),    // input wire [47 : 0] PCIN
                    .A(input_data[31:16]),          // input wire [15 : 0] A
                    .B(weight[31:16]),          // input wire [15 : 0] B
                    .PCOUT(pcout[6]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_next[31:16])          // output wire [47 : 0] P
                      );
        `elif USEO_INT16
        `elif USEO_INT32
        `endif
     end
   endgenerate


//floating point unit 
generate
  if(USE_FABRIC=="YES") begin

  end else begin 
    // use dsp
      
 end
endgenerate



endmodule