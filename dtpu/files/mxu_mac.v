//==================================================================================================
//  Filename      : mxu_mac.v
//  Created On    : 2020-04-25 12:25:20
//  Last Modified : 2020-04-25 15:27:06
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
module mxu_mac
#(parameter bit_width=4,
  USE_FABRIC="NO")(
     
    input clk,
    input ce,
    input sclr,
    input [1:0] enable_fp_unit,
    input [bit_width-1:0]data_input,
    input [bit_width-1:0]weight,
    input [bit_width-1:0]res_mac_p,
    output wire [bit_width-1:0]res_mac_n,
    output  wire [bit_width-1:0]data_input_next_row
    );
 
        wire [bit_width-1:0]q;
        wire [bit_width-1:0]q1;
        wire tc;
        wire SUBTRACT;
 
 `ifdef VIVADO_MAC
            assign SUBTRACT=1'b0;
        wire [47:0]PCOUT ;
    // ip mac from vivado library

    vivado_mac mac (
      .CLK(clk),            // input wire CLK
          .CE(ce),              // input wire CE
          .SCLR(sclr),          // input wire SCLR
          .A(data_input[7:0]),                // input wire [3 : 0] A
          .B(weight[7:0]),                // input wire [3 : 0] B
          .C(res_mac_p[7:0]),                // input wire [3 : 0] C
      .SUBTRACT(SUBTRACT),  // input wire SUBTRACT
      .P(res_mac_n[7:0]),                // output wire [3 : 0] P
      .PCOUT(PCOUT)        // output wire [47 : 0] PCOUT
    );
    
    assign res_mac_n[bit_width-1:8]=0;
  
/*  // (* use_dsp48 = "yes" *) in the module 
    xbip_dsp48_macro_0 vivado_mac (
  .CLK(clk),    // input wire CLK
  .CE(ce),      // input wire CE
  .SCLR(sclr),  // input wire SCLR
  .A(data_input[7:0]),        // input wire [7 : 0] A
  .B(weight[7:0]),        // input wire [7 : 0] B
  .C(res_mac_p[7:0]),        // input wire [7 : 0] C
  .P(res_mac_n[7:0])        // output wire [7 : 0] P
);*/
    
    // two delay registers because the input is retrieved from 
    //the data driving the internal ff of vivado mac 
        register  #(.N(bit_width)) delay_reg1 (
            .clk(clk),
        .reset(~sclr),
        .test_mode(test_mode),
        .enable(ce),
        .d({56'd0,data_input[7:0]}),
         .q(q1));
         
         register  #(.N(bit_width)) delay_reg2 (
                     .clk(clk),
                 .reset(~sclr),
                 .test_mode(test_mode),
                 .enable(ce),
                 .d(q1),
                  .q(q));   
 assign data_input_next_row={ 56'd0, q[7:0]};
    // data to next mac are available after 3 cc
       /*counter  #(.MAX_CNT(3)) count_enable_next_max (.clk(clk),.enable(ce),.reset(sclr),.tc(tc));
 
assign enable_next_mac=tc;*/
     `endif

    `ifndef VIVADO_MAC
    ///////////////////
    // USE SMAC //////
    //////////////////   
    smac #(.USE_FABRIC(USE_FABRIC)) smac_i (
        .clk(clk),
        .ce              (ce),
        .sclr           (sclr),
        .data_input(data_input),
        .weight          (weight),
        .res_mac_p       (res_mac_p),
        .res_mac_n       (res_mac_n),
        .select_precision(select_precision),
        .enable_fp_unit  (enable_fp_unit),
        .active_chain    (active_chain)

      );
    
    // delay registers 
    register  #(.N(bit_width)) delay_reg1 (
         .clk(clk),
        .reset(~sclr),
        .test_mode(test_mode),
        .enable(ce),
        .d(data_input),
        .q(q1));
         
         register  #(.N(bit_width)) delay_reg2 (
                 .clk(clk),
                .reset(~sclr),
                .test_mode(test_mode),
                .enable(ce),
                .d(q1),
                .q(q));   
 assign data_input_next_row=q;
    
    
    `endif
endmodule

