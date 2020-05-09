//==================================================================================================
//  Filename      : smac.v
//  Created On    : 2020-04-22 17:05:43
//  Last Modified : 2020-05-09 11:57:31
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology,Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com
//
//  Description   : 
//
//
//==================================================================================================
`timescale 1ns / 1ps

`include "precision_def.vh"
module smac
#(parameter USE_FABRIC="NO")(
    input clk,
    input  ce,
    input sclr,
        ///////////////////////////////////////////
        ///// DATA SIGNALS OF SubMAC unit /////////
        ///////////////////////////////////////////
        input [64-1:0]data_input,
        input [64-1:0]weight,
        input [64-1:0]res_mac_p, 
        output wire [64-1:0]res_mac_n,
        /////////////////////////////////////////
        ///// CONTROL SIGNALS FOR DSP CHAIN /////
        /////////////////////////////////////////
        input wire [3:0]select_precision,
        input wire [1:0]enable_fp_unit,
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



/////////////////////////////////////////
/////// integer unit  chain /////////////
/////////////////////////////////////////
   generate
     if(USE_FABRIC=="YES") begin 
      // generate fabric implementation of multipliers
        `ifdef USE_ALL
          (*use_dsp="no"*)dsp_smac_64 dsp_smac_64_inst(
                          .CLK         (clk),
                          .CE          (enable_i),
                          .SCLR        (sclr),
                          .active_chain(active_chain),
                          .A           (data_input),
                          .B           (weight),
                          .C           (res_mac_p),
                          .P           (res_mac_n)
                            );

         `elsif  USEO_INT8
                  dsp_smac_8_fa smac_8_0s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .A(data_input[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .C(res_mac_p[7:0]),
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
                assign res_mac_n=  {56'd0, pcout[1][7:0]};
       `elsif USEO_INT16
              dsp_smac_16_fa smac_16s_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[1]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .C(res_mac_p[15:0]),
                    .A(data_input[15:0]),          // input wire [7 : 0] A
                    .B(weight[15:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
        assign res_mac_n={48'd0,pcout[1][15:0] };
         `elsif USEO_INT32
    (*use_dsp="yes"*)dsp_smac_32 dsp_smac_32s (
            .CLK(clk),
            .CE  (enable_i[2]),
            .SCLR(sclr),
            .PCIN(47'd0),
            .SEL (1'b0),
            .A   (data_input[31:0]),
            .B   (weight[31:0]),
            .C   (res_mac_p[31:0]),
            .P   (pcout[0])
            );
          assign res_mac_n={32'd0,pcout[0][31:0]};
        `endif
     end else begin 
      // generate dsp implementation of multipliers
      `ifdef USE_ALL
          (*use_dsp="yes"*) dsp_smac_64 dsp_smac_64_inst(
                          .CLK         (clk),
                          .CE          (enable_i),
                          .SCLR        (sclr),
                          .active_chain(active_chain),
                          .A           (data_input),
                          .B           (weight),
                          .C           (res_mac_p),
                          .P           (res_mac_n)
                            );
      `elsif  USEO_INT8
                  dsp_smac_8 smac_8(
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .A(data_input[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .C(res_mac_p[7:0]),
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
                assign res_mac_n=  {56'd0, pcout[1][7:0]};
    `elsif USEO_INT16
              dsp_smac_16 smac_16s_0 (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[1]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .C(res_mac_p[15:0]),
                    .A(data_input[15:0]),          // input wire [7 : 0] A
                    .B(weight[15:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
        assign res_mac_n={48'd0,pcout[1][15:0] };
        `elsif USEO_INT32
         (*use_dsp="yes"*)dsp_smac_32 dsp_smac_32s (
            .CLK(clk),
            .CE  (enable_i[2]),
            .SCLR(sclr),
            .PCIN(47'd0),
            .SEL (1'b0),
            .A   (data_input[31:0]),
            .B   (weight[31:0]),
            .C   (res_mac_p[31:0]),
            .P   (pcout[0])
            );
          assign res_mac_n={32'd0,pcout[0][31:0]};
        `endif
     end
   endgenerate

//////////////////////////
//floating point unit ////
//////////////////////////


// 32 bit -> 1 sign , 8 exp , 23 mantissa
// 16 bit -> 1 sign , 5 exp , 10 mantissa
// bf16 bit -> 1 sign , 8 exp , 7 mantissa

`ifdef USE0_FP32

reg[31:0]z_sc;
reg [31:0]z_mult_add;
wire [31:0] fp_out;
wire [31:0] z_add_out;
reg [31:0]a;
reg [31:0]b;
reg [31:0]c;

always @(posedge clk ) begin
  if(sclr) begin
    a <= 0;b<=0;z_sc<=0; c<=0;
  end else begin
      if(ce && enable_fp_unit[0])begin 
        a<=data_input[31:0];
        b<=weight[31:0];
        c<=res_mac_p[31:0];
        z_sc<=fp_out;
        z_mult_add<=z_add_out;
      end 
  end
end

FPmul_sc fp_mul_32(
  .FP_A(a),
  .FP_B(b),
  .FP_Z(fp_out),
  .clk(clk));
FPadd_sc fp_add_32(
  .ADD_SUB(1'b1),
  .FP_A(z_sc),
  .FP_B(c),
  .clk(clk),
  .FP_Z(z_add_out));



assign  res_mac_n= {32'd0, z_mult_add} ;
`elsif  USE0_FP16 
`elsif  USE0_BFP16 



reg[31:0]z_sc;
reg [31:0]z_mult_add;
wire [31:0] fp_out;
wire [31:0] z_add_out;
reg [31:0]a;
reg [31:0]b;
reg [31:0]c;

always @(posedge clk ) begin
  if(sclr) begin
    a <= 0;b<=0;z_sc<=0; c<=0;
  end else begin
      if(ce && enable_fp_unit[0] && enable_fp_unit[1])begin 
        a<={data_input[15:0],16'd0};
        b<={weight[15:0],16'd0};
        c<={res_mac_p[15:0],16'd0};
        z_sc<=fp_out;
        z_mult_add<=z_add_out;
      end 
  end
end

FPmul_sc fp_mul_b16(
  .FP_A(a),
  .FP_B(b),
  .FP_Z(fp_out),
  .clk(clk));
FPadd_sc fp_add_b16(
  .ADD_SUB(1'b1),
  .FP_A(z_sc),
  .FP_B(c),
  .clk(clk),
  .FP_Z(z_add_out));



assign  res_mac_n= {32'd0, z_mult_add[31:16],16'd0} ;


`endif


endmodule
