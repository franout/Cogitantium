`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2020 18:17:39
// Design Name: 
// Module Name: mxu_core
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

module mxu_core
// parameters are directly related to the number of inputdat,weight and outputs
#(parameter M=3, // matrix row -> weights
    K=3, // matrix columsn -> input data
   max_data_width=4 // it must be a divisor of 64
    )
(   
   data_type, 
    clk,
    reset,
    enable,
    test_mode,
    input_data,
    weight,
    y
    );
    // they should be the same if the macm is symmetric
    localparam integer max_width_columns=(max_data_width)*(K)-1;
    localparam integer max_width_rows=(max_data_width)*(M)-1;
    input [`LOG_ALLOWED_PRECISIONS-1:0]data_type; // precision_def.vh
    input clk;
  input reset;
  input enable;
    input test_mode;
    input [max_width_columns:0]input_data;
    input [max_width_rows:0]weight;
    output [max_width_rows:0]y;    
    
    
    // muxes for allowing different precision 
    
   
   // generate the matrix's cells
   genvar i,j;
   
   wire [max_data_width-1:0] res_mac_next[0:M*K];
   wire [max_data_width-1:0]data_in_next_row[0:(M)*(K)];
   
        

   
   generate
      for(i = 0; i < M; i = i+1)
        begin: rows
          for(j=0;j<K;j=j+1)
            begin: columns 
            if (j==0) begin 
            // instantiate only the multipliers 
            mult_gen_0 mult_i (
              .CLK(clk),    // input wire CLK
              .A(input_data[(j+1)*max_data_width-1:j*max_data_width]),        // input wire [3 : 0] A
              .B(weight[(i+1)*(max_data_width)-1:i*max_data_width]),        // input wire [3 : 0] B
              .CE(enable),      // input wire CE
              .SCLR(reset),  // input wire SCLR
              .P(res_mac_next[i*K+j])        // output wire [3 : 0] P
            );
                    
             end else if ( j==K-1) begin 
                // check if it is the last column
                
                if(i==0) begin 
                mxu_mac #(4) mac_i_j(.ce(enable),.clk(clk),.sclr(reset),
                                .data_input(input_data[(j+1)*max_data_width-1:j*max_data_width]),
                                    .weight(weight[(i+1)*(max_data_width)-1:i*max_data_width]),
                                     .res_mac_p(res_mac_next[i*K+j-1]),
                                     .res_mac_n(y[(i+1)*(max_data_width)-1:i*max_data_width]),
                                     .data_input_next_row(data_in_next_row[i*K+j][max_data_width-1:0]));
                end else begin
                
                mxu_mac #(4) mac_i_j(.ce(enable),.clk(clk),.sclr(reset),
                    .data_input(data_in_next_row[(i-1)*K+j][max_data_width-1:0]),
                    .weight(weight[(i+1)*(max_data_width)-1:i*max_data_width]),
                    .res_mac_p(res_mac_next[i*K+j-1]),
                    .res_mac_n(y[(i+1)*(max_data_width)-1:i*max_data_width]),
                    .data_input_next_row(data_in_next_row[i*K+j][max_data_width-1:0]));
                
                end 
                                                         
             
            end else begin 
            
            
             if(i==0) begin 
            
                         mxu_mac #(4) mac_i_j(.ce(enable),.clk(clk),.sclr(reset),
                           .data_input(input_data[(j+1)*max_data_width-1:j*max_data_width]),
                          .weight(weight[(i+1)*(max_data_width)-1:i*max_data_width]),
                          .res_mac_p(res_mac_next[i*K+j-1]),
                          .res_mac_n(res_mac_next[i*K+j]),
                         .data_input_next_row(data_in_next_row[i*K+j][max_data_width-1:0]));
            end else begin
            
               mxu_mac #(4) mac_i_j(.ce(enable),.clk(clk),.sclr(reset),
                  .data_input(data_in_next_row[(i-1)*K+j][max_data_width-1:0]),
                   .weight(weight[(i+1)*(max_data_width)-1:i*max_data_width]),
                   .res_mac_p(res_mac_next[i*K+j-1]),
                   .res_mac_n(res_mac_next[i*K+j]),
                    .data_input_next_row(data_in_next_row[i*K+j]));
            
                        end 
            end
           end
       end
       endgenerate
   
       
endmodule
