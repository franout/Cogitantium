//==================================================================================================
//  Filename      : smac.v
//  Created On    : 2020-04-22 17:05:43
//  Last Modified : 2020-04-22 17:05:43
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
#(parameter bit_width=8)(
    input clk,
    input  ce,
    input sclr,
        ///////////////////////////////////////////
        ///// DATA SIGNALS OF SubMAC unit /////////
        ///////////////////////////////////////////
        input [bit_width*bit_width-1:0]data_input,
        input [bit_width*bit_width-1:0]weight,
        input [bit_width*bit_width-1:0]res_mac_p, 
        output wire [bit_width*bit_width-1:0]res_mac_n,
        /////////////////////////////////////////
        ///// CONTROL SIGNALS FOR DSP CHAIN /////
        /////////////////////////////////////////
        input wire [3:0]select_precision,
        input wire [1:0]enable_fp_unit,
        input wire active_chain      
    );
    
   wire [47:0]carry_in;
   wire enable_i[0:3];
   wire [47:0]carrycascout[0:5];
   assign carry_in=1'b0;
   wire subtract;
   wire [47:0]PCOUT;
   assign subtract=1'b0;
   /////////////////////////
   ///// enable network //// 
   /////////////////////////
   genvar i;
   generate 
   for(i=0;i<4;i=i+1) begin 
   assign enable_i[i]= ce & select_precision[i];
   end
   endgenerate
     
   assign carry_in={48{1'b0}};
     dsp_smac_8 smac_8_0 (
          .CLK(clk),                    // input wire CLK
          .CE(enable_i[0]),                      // input wire CE
          .SCLR(sclr),                  // input wire SCLR
          .PCIN(carry_in),            // input wire CARRYIN
          .A(data_input[7:0]),                        // input wire [7 : 0] A
          .B(weight[7:0]),                        // input wire [7 : 0] B
          .C({{40{1'b0}},res_mac_p[7:0]}),                        // input wire [7 : 0] C
           .SUBTRACT(subtract),  // input wire SUBTRACT
          .PCOUT(carrycascout[0]),  // output wire CARRYCASCOUT
          .P(res_mac_n[7:0])                        // output wire [7 : 0] P
        );
        
        
      generate 
      for(i=0;i<48;i=i+1) begin
        assign carrycascout[1][i]= carrycascout[0][i] & active_chain;  
      end 
      endgenerate 
    
       
       
       dsp_smac_8 smac_8_1 (
                  .CLK(clk),                    // input wire CLK
                  .CE(enable_i[1]),                      // input wire CE
                  .SCLR(sclr),                  // input wire SCLR
                  .PCIN(carrycascout[1]),            // input wire CARRYIN
                  .A(data_input[15:8]),                        // input wire [7 : 0] A
                  .B(weight[15:8]),                        // input wire [7 : 0] B
                  .C({{40{1'b0}},res_mac_p[15:8]}),                        // input wire [7 : 0] C
                  .SUBTRACT(subtract),  // input wire SUBTRACT
                  .PCOUT(carrycascout[2]),  // output wire CARRYCASCOUT
                  .P(res_mac_n[15:8])                        // output wire [7 : 0] P
                );
                
        generate 
      for(i=0;i<48;i=i+1) begin
        assign carrycascout[3][i]= carrycascout[2][i] & active_chain;  
      end 
      endgenerate   
      
       dsp_smac_16 smac_16 (
          .CLK(clk),                    // input wire CLK
          .CE(enable_i[2]),                      // input wire CE
          .SCLR(sclr),                  // input wire SCLR
          .PCIN(carrycascout[3]),            // input wire CARRYIN
          .A(data_input[31:16]),                        // input wire [15 : 0] A
          .B(weight[31:16]),                        // input wire [15 : 0] B
          .C({{32{1'b0}},res_mac_p[31:16]}),                        // input wire [15 : 0] C
          .PCOUT(carrycascout[4]),  // output wire CARRYCASCOUT
          .P(res_mac_n[31:16]),                        // output wire [15 : 0] P
          .SUBTRACT(subtract)  // input wire SUBTRACT

        );
        
        
        generate 
      for(i=0;i<48;i=i+1) begin
        assign carrycascout[5][i]= carrycascout[4][i] & active_chain;  
      end 
      endgenerate   
      
        dsp_smac_32 smac_32 (
          .CLK(clk),            // input wire CLK
          .CE(enable_i[3]),              // input wire CE
          .SCLR(sclr),          // input wire SCLR
          .A(data_input[63:32]),                // input wire [31 : 0] A
          .B(weight[63:32]),                // input wire [31 : 0] B
          .C( { {16{1'b0}} ,res_mac_p[63:32]}),                // input wire [47 : 0] C
          .PCIN(carrycascout[5]),          // input wire [47 : 0] PCIN
          .SUBTRACT(subtract),  // input wire SUBTRACT
          .P(res_mac_n[63:32]),                // output wire [32 : 0] P
          .PCOUT(PCOUT)        // output wire [47 : 0] PCOUT
        );
   
endmodule
