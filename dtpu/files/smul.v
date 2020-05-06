//==================================================================================================
//  Filename      : smul.v
//  Created On    : 2020-04-22 17:05:25
//  Last Modified : 2020-05-06 11:15:48
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
`ifdef USE_ALL
generate // not the last two for keeping them at 32 bit 
  for(i=1;i<6;i=i+1)  begin
    assign pcout[i]= active_chain ? pcout[i-1] : 0;
  end
endgenerate
wire [47:0]out_dsp[0:4];
`endif

/////////////////////////////////////////
/////// integer unit  chain /////////////
/////////////////////////////////////////
   generate
     if(USE_FABRIC=="YES") begin 
      // generate fabric implementation of multipliers
        `ifdef USE_ALL

        dsp_smul_8_fa smul_8_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(input_data[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(out_dsp[0])          // output wire [7 : 0] P
                      );

        dsp_smul_8_fa smul_8_1_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[1]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b1),      // input wire [0 : 0] SEL
                    .PCIN({ pcout[1][38:0], 9'b0 } ),  // SHIFT BY 9  // input wire [47 : 0] PCIN 
                    .A(input_data[15:8]),          // input wire [7 : 0] A
                    .B(weight[15:8]),          // input wire [7 : 0] B
                    .PCOUT(pcout[2]),  // output wire [47 : 0] PCOUT
                    .P(out_dsp[1])          // output wire [7 : 0] P
                    );
        dsp_smul_16_fa smul_16_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(pcout[3]),    // input wire [47 : 0] PCIN
                    .A(input_data[31:16]),          // input wire [15 : 0] A
                    .B(weight[31:16]),          // input wire [15 : 0] B
                    .PCOUT(pcout[4]),  // output wire [47 : 0] PCOUT
                    .P(out_dsp[2])          // output wire [47 : 0] P
                      );

        // 32 bit dsp logically 
        dsp_smul_16_fa smul_32_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[3]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(pcout[5]),    // input wire [47 : 0] PCIN
                    .A(input_data[47:32]),          // input wire [15 : 0] A
                    .B(weight[47:32]),          // input wire [15 : 0] B
                    .PCOUT(pcout[6]),  // output wire [47 : 0] PCOUT
                    .P(out_dsp[3])          // output wire [47 : 0] P
                      );
        dsp_smul_16_fa smul_32_1_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[3]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(pcout[6]),    // input wire [47 : 0] PCIN
                    .A(input_data[63:48]),          // input wire [15 : 0] A
                    .B(weight[63:48]),          // input wire [15 : 0] B
                    .PCOUT(pcout[7]),  // output wire [47 : 0] PCOUT
                    .P(out_dsp[4])          // output wire [47 : 0] P
                      );
            
            assign res_mac_next= {  out_dsp[4][15:0],out_dsp[3][15:0] ,out_dsp[2][15:0] ,out_dsp[1][7:0] ,out_dsp[0][7:0]};
         `elsif  USEO_INT8
                  dsp_smul_8_fa smul_8_0s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(47'd0),    // input wire [47 : 0] PCIN
                    .A(input_data[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
        assign res_mac_next=  {56'd0, pcout[1][7:0]};
        `elsif USEO_INT16
              dsp_smul_16_fa smul_16s_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[1]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b1),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(input_data[15:0]),          // input wire [7 : 0] A
                    .B(weight[15:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
        assign res_mac_next= {48'd0, pcout[1][15:0]};
         `elsif USEO_INT32

        // 32 bit dsp logically 
        /*dsp_smul_16_fa smul_32_0s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b1),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(input_data[15:0]),          // input wire [15 : 0] A
                    .B(weight[15:0]),          // input wire [15 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [47 : 0] P
                      );
        dsp_smul_16_fa smul_32_1s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(pcout[0]),    // input wire [47 : 0] PCIN
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .A(input_data[31:16]),          // input wire [15 : 0] A
                    .B(weight[31:16]),          // input wire [15 : 0] B
                    .PCOUT(pcout[5]),  // output wire [47 : 0] PCOUT
                    .P(pcout[2])          // output wire [47 : 0] P
                      );
            assign res_mac_next={  32'd0, pcout[2][15:0], pcout[1][15:0]};*/
           (*use_dsp="no"*) dsp_smul_32 smul_32s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .A(input_data[31:0]),          // input wire [15 : 0] A
                    .B(weight[31:0]),          // input wire [15 : 0] B
                    .P(pcout[2])          // output wire [32 : 0] P
                      );
            assign res_mac_next={  32'd0, pcout[2][31:0]};

        `endif
     end else begin 
      // generate dsp implementation of multipliers
     `ifdef USE_ALL
          dsp_smul_8 smul_8_0 (
                      .CLK(clk),      // input wire CLK
                      .CE(enable_i[0]),        // input wire CE
                      .SCLR(sclr),    // input wire SCLR
                      .SEL(1'b0),      // input wire [0 : 0] SEL
                      .PCIN(0),    // input wire [47 : 0] PCIN
                      .A(input_data[7:0]),          // input wire [7 : 0] A
                      .B(weight[7:0]),          // input wire [7 : 0] B
                      .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                      .P(out_dsp[0])          // output wire [7 : 0] P
                    );
          dsp_smul_8 smul_8_1 (
                      .CLK(clk),      // input wire CLK
                      .CE(enable_i[1]),        // input wire CE
                      .SCLR(sclr),    // input wire SCLR
                      .SEL(1'b1),      // input wire [0 : 0] SEL
                     .PCIN({ pcout[1][38:0], 9'b0 } ),  // SHIFT BY 9  // input wire [47 : 0] PCIN 
                      .A(input_data[15:8]),          // input wire [7 : 0] A
                      .B(weight[15:8]),          // input wire [7 : 0] B
                      .PCOUT(pcout[2]),  // output wire [47 : 0] PCOUT
                      .P(out_dsp[1])          // output wire [7 : 0] P
                    );

          dsp_smul_16 smul_16_0 (
              .CLK(clk),      // input wire CLK
              .CE(enable_i[2]),        // input wire CE
              .SCLR(sclr),    // input wire SCLR
              .PCIN(pcout[3]),    // input wire [47 : 0] PCIN
              .A(input_data[31:16]),          // input wire [15 : 0] A
              .SEL(1'b0),      // input wire [0 : 0] SEL
              .B(weight[31:16]),          // input wire [15 : 0] B
              .PCOUT(pcout[4]),  // output wire [47 : 0] PCOUT
              .P(out_dsp[2])          // output wire [15 : 0] P
                  );

          // 32 bit dsp logically 

          dsp_smul_16 smul_32_0 (
              .CLK(clk),      // input wire CLK
              .CE(enable_i[3]),        // input wire CE
              .SCLR(sclr),    // input wire SCLR
              .PCIN(pcout[5]),    // input wire [47 : 0] PCIN
              .A(input_data[47:32]),          // input wire [15 : 0] A
              .SEL(1'b0),      // input wire [0 : 0] SEL
              .B(weight[47:32]),          // input wire [15 : 0] B
              .PCOUT(pcout[6]), // output wire [47 : 0] PCOUT
              .P(out_dsp[3])          // output wire [15 : 0] P
                  );



        dsp_smul_16 smul_32_1 (
              .CLK(clk),      // input wire CLK
              .CE(enable_i[3]),        // input wire CE
              .SCLR(sclr),    // input wire SCLR
              .SEL(1'b0),      // input wire [0 : 0] SE
              .PCIN((pcout[6])),    // input wire [47 : 0] PCIN
              .A(input_data[63:48]),          // input wire [15 : 0] A
              .B(weight[63:48]),          // input wire [15 : 0]          
              .PCOUT(pcout[7]),  // output wire [47 : 0] PCOUT
              .P(out_dsp[4])          // output wire [15 : 0]              
               );

        assign res_mac_next= {  out_dsp[4][15:0],out_dsp[3][15:0] ,out_dsp[2][15:0] ,out_dsp[1][7:0] ,out_dsp[0][7:0]};
         `elsif USEO_INT8
                  dsp_smul_8 smul_8_0s (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(47'd0),    // input wire [47 : 0] PCIN
                    .A(input_data[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
        assign res_mac_next=  {56'd0, pcout[1][7:0]};
       `elsif USEO_INT16
              dsp_smul_16 smul_16s_0 (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[1]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b1),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(input_data[15:0]),          // input wire [7 : 0] A
                    .B(weight[15:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
              assign res_mac_next={48'd0,pcout[1][15:0]};
        `elsif USEO_INT32
        // 32 bit dsp logically 
        dsp_smul_16 smul_32_0s (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(input_data[15:0]),          // input wire [15 : 0] A
                    .SEL(1'b1),      // input wire [0 : 0] SEL
                    .B(weight[15:0]),          // input wire [15 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [47 : 0] P
                      );
        dsp_smul_16 smul_32_1s (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(pcout[0]),    // input wire [47 : 0] PCIN
                    .A(input_data[31:16]),          // input wire [15 : 0] A
                    .B(weight[31:16]),          // input wire [15 : 0] B
                    .PCOUT(pcout[5]),  // output wire [47 : 0] PCOUT
                    .P(pcout[2])          // output wire [47 : 0] P
                      );
              //assign res_mac_next[31:0] = enable_i[2]  && !sclr ? input_data[31:0]*weight[31:0] : 32'd0 ;
        assign res_mac_next={  32'd0, pcout[2][15:0], pcout[1][15:0]};
/*
        (*use_dsp="yes"*) dsp_smul_32 smul_32s (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .A(input_data[31:0]),          // input wire [15 : 0] A
                    .B(weight[31:0]),          // input wire [15 : 0] B
                    .P(pcout[2])          // output wire [32 : 0] P
                      );
*/                    assign res_mac_next={  32'd0, pcout[2][31:0]};

        `endif
     end
   endgenerate


//floating point unit 
/*generate
  if(USE_FABRIC=="YES") begin

  end else begin 
    // use dsp
      
 end 
endgenerate

`ifdef USE0_FP32


`endif
*/


endmodule