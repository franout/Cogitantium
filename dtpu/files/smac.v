`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2020 04:58:02 PM
// Design Name: 
// Module Name: smac
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
        output  wire [bit_width*bit_width-1:0]data_input_next_row,
        /////////////////////////////////////////
        ///// CONTROL SIGNALS FOR DSP CHAIN /////
        /////////////////////////////////////////
        input wire [3:0]select_precision,
        input wire active_chain      
    );
    
        wire [bit_width*bit_width-1:0]q;
        wire [bit_width*bit_width-1:0]q1;
        wire tc;
        wire SUBTRACT;
    
     
        assign SUBTRACT=1'b0;
        wire [47:0]PCOUT[0:bit_width-1];
        wire enable[0:bit_width-1];
    // generate the dsp chain 
    genvar i;
    generate
    for (i=0;i<64/bit_width;i=i+1) begin 
    
        if(i==0) begin 
        assign enable[i]= ce & select_precision[0]; 
        end else if(i==1) begin
        assign enable[i]= ce & select_precision[1];
        end else if(i<=4) begin
        assign enable[i%bit_width]= ce & select_precision[2];
        end else if(i<=bit_width) begin
        assign enable[i]= ce & select_precision[3];
        end 
        
       
       
       chain_mac your_instance_name (
                .CLK(clk),            // input wire CLK
                .CE(enable[i]),              // input wire CE
                .SCLR(sclr),          // input wire SCLR
                .A(data_input[(i+1)*bit_width-1:i*bit_width]),                // input wire [7 : 0] A
                .B(weight[(i+1)*bit_width-1:i*bit_width]),                // input wire [7 : 0] B
                .C(res_mac_p[(i+1)*bit_width-1:i*bit_width]),                // input wire [47 : 0] C
                .PCIN(PCIN),          // input wire [47 : 0] PCIN
                .SUBTRACT(SUBTRACT),  // input wire SUBTRACT
                .P(res_mac_n[(i+1)*bit_width-1:i*bit_width]),                // output wire [8 : 0] P
                .PCOUT(PCOUT)        // output wire [47 : 0] PCOUT
            );
       
        
   
    end
    endgenerate
    
    
    
    // generate the ff delay register to next row
    
    
    
    // two delay registers because the input is retrieved from 
    //the data driving the internal ff of vivado mac 
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
     
    
    
endmodule
