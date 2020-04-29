//==================================================================================================
//  Filename      : mxu_wrapper.v
//  Created On    : 2020-04-29 11:08:44
//  Last Modified : 2020-04-29 11:08:46
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology,Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com - angione@student.chalmers.se - s262620@studenti.polito.it
//
//  Description   : 
//
//
//==================================================================================================
`timescale 1ns / 1ps
`include "precision_def.vh"



module mxu_wrapper
#(parameter M=3, // matrix row -> weights
    K=3, // matrix columsn -> input data
    max_data_width=4 ,// it must be a divisor of 64
    MAX_BOARD_DSP=220
    )
(      data_type,
        reset,
        clk,
        enable,
        enable_in_ff,
        enable_chain,
        enable_out_ff,
        test_mode,
        input_data,
        weight,
        enable_fp_unit,
        y
    );
  localparam integer max_width_columns=(max_data_width)*(K)-1;
  localparam integer max_width_rows=(max_data_width)*(M)-1;
  input clk,reset,enable,test_mode;
  input [`LOG_ALLOWED_PRECISIONS-1:0]data_type; // precision_def.vh
  input [max_width_columns:0]input_data;
  input [max_width_rows:0]weight;
  output [max_width_rows:0]y;
  input enable_in_ff;
  input enable_out_ff;
  input enable_chain;
  input [1:0] enable_fp_unit;
   
   wire [max_width_rows:0]y_mxu;
   wire [max_width_columns:0]data_input_mxu;
   
           // registers for pipelined inputs 
       genvar j,i,k;
    wire [max_width_columns:0]synch_input_data[K-1:0];
     
    // first block of data does not need to be delayed
    assign synch_input_data[0]= input_data;//[max_width_columns:max_width_columns-max_data_width];
       generate
         for (j=0;j<K ; j=j+1) // first columns does not need to be delayed 
           begin: pipeline_reg_delayer_input_columns
               for(k=K-j-1;k<K-1;k=k+1)
                begin: incremental_step
            // incremental delay 
                register
               #(.N(max_data_width)) del_input_register_j (
                  .clk(clk),
                   .reset(reset),
                  .test_mode(test_mode),
                 .enable(enable_in_ff),
                 .d(synch_input_data[k][max_width_columns-max_data_width*j:max_width_columns-max_data_width*(j+1)+1]),
                 .q(synch_input_data[k+1][max_width_columns-max_data_width*j:max_width_columns-max_data_width*(j+1)+1]));
    
                end  
                for(k=0;k<K-j-1 ;k=k+1) 
                 begin: propagating_output_interconnection
                 assign   synch_input_data[k+1][max_width_columns-max_data_width*j:max_width_columns-max_data_width*(j+1)+1]=
                 synch_input_data[k][max_width_columns-max_data_width*j:max_width_columns-max_data_width*(j+1)+1];
                 end
            end
       endgenerate
    assign data_input_mxu=synch_input_data[K-1];
      
      
      wire [max_width_rows:0]synch_output_data[M-1:0];
       // last block of data does not need to be delayed
       assign synch_output_data[0]= y_mxu;
     // registers for pipelined outputs
     generate
                for (i=0;i<M ; i=i+1) 
                begin: pipeline_reg_delayer_output
                    for(k=0;k<(M-i-1);k=k+1) 
                    begin: incrementa_step_output
                      // incremental delay -
                      register
                      #(.N(max_data_width)) del_output_register_i (
                      .clk(clk),
                      .reset(reset),
                       .test_mode(test_mode),
                        .enable(enable_out_ff),
                 .d(synch_output_data[k][max_width_columns-max_data_width*i:max_width_columns-max_data_width*(i+1)+1]),
                 .q(synch_output_data[k+1][max_width_columns-max_data_width*i:max_width_columns-max_data_width*(i+1)+1]));
                    end
                    
                for(k=M-i-1;k<M-1;k=k+1)
                 begin: propagating_output_interconnection
                 assign   synch_output_data[k+1][max_width_columns-max_data_width*i:max_width_columns-max_data_width*(i+1)+1]=
                 synch_output_data[k][max_width_columns-max_data_width*i:max_width_columns-max_data_width*(i+1)+1];
                 end   
                end
                endgenerate
    assign y=synch_output_data[M-1];
    // mac matrix
   mxu_core #(.M(M), .K(K), .max_data_width(max_data_width) ,.MAX_BOARD_DSP(MAX_BOARD_DSP)) kernel(   
        .data_type(data_type), 
        .clk(clk),
        .enable(enable),
        .enable_chain(enable_chain),
        .reset(reset),
        .test_mode(test_mode),
        .enable_fp_unit(enable_fp_unit),
        .input_data(data_input_mxu),
        .weight(weight),
        .y(y_mxu)
        );

endmodule
