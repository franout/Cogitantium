`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2020 18:31:33
// Design Name: 
// Module Name: mxu_mac
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mxu_mac
#(parameter bit_width=4)(
     clk,
    ce,
    sclr,
    data_input,
    weight,
    res_mac_p, 
    res_mac_n,
    data_input_next_row,
    enable_next_mac
    );
 
    input clk;
    input     ce;
        input sclr;
        input [bit_width-1:0]data_input;
        input [bit_width-1:0]weight;
        input [bit_width-1:0]res_mac_p; 
        output wire [bit_width-1:0]res_mac_n;
        output  wire [bit_width-1:0]data_input_next_row;
        output wire enable_next_mac;
        wire [bit_width-1:0]q;
        wire [bit_width-1:0]q1;
        wire tc;
        
        
 /*   `ifdef VIVADO_MAC*/
            assign SUBTRACT=1'b0;

    // ip mac from vivado library

    vivado_mac mac (
      .CLK(clk),            // input wire CLK
          .CE(ce),              // input wire CE
          .SCLR(sclr),          // input wire SCLR
          .A(data_input),                // input wire [3 : 0] A
          .B(weight),                // input wire [3 : 0] B
          .C(res_mac_p),                // input wire [3 : 0] C
      .SUBTRACT(SUBTRACT),  // input wire SUBTRACT
      .P(res_mac_n),                // output wire [3 : 0] P
      .PCOUT(PCOUT)        // output wire [47 : 0] PCOUT
    );
    
        register  #(.N(bit_width)) delay_reg1 (
            .clk(clk),
        .reset(sclr),
        .test_mode(test_mode),
        .enable(ce),
        .d(data_input),
         .q(q1));
         
         register  #(.N(bit_width)) delay_reg2 (
                     .clk(clk),
                 .reset(sclr),
                 .test_mode(test_mode),
                 .enable(ce),
                 .d(q1),
                  .q(q));   
 assign data_input_next_row=q;
    // data to next mac are available after 3 cc
       /*counter  #(.MAX_CNT(3)) count_enable_next_max (.clk(clk),.enable(ce),.reset(sclr),.tc(tc));
 
assign enable_next_mac=tc;*/
    /*`else
    // my mac
    
    
    `endif*/
endmodule

