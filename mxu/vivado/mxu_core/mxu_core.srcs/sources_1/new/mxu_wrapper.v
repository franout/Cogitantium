`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2020 18:49:36
// Design Name: 
// Module Name: mxu_wrapper
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

module mxu_wrapper
#(parameter M=3, // matrix row -> weights
    K=3, // matrix columsn -> input data
    max_data_width=4 // it must be a divisor of 64
    )
(

    );
    
    
    
           // registers for pipelined inputs
       
           generate
           for (j=1;j<K-1 ; j=j+1) // first columns does not need to be delayed 
           begin: pipeline_reg_delayer
               // the number of register delayer depends from the actual # of cc of a sumac
               
           end
           endgenerate
           
     
    // register file for the weights is distribuited amoung all the sumac ( sub unit mac) 
    //weight_rf #(.size(M*K),.data_width(data_width))
    // mxu core

    mxu_core #(.M(M), .K(K), .max_data_width(max_data_width) ) kernel(   
        data_type, 
        clk,
        reset,
        test_mode,
        input_data,
        weight,
        y
        );

endmodule
