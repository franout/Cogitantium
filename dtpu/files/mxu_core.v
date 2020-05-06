//==================================================================================================
//  Filename      : mxu_core.v
//  Created On    : 2020-04-25 15:19:56
//  Last Modified : 2020-05-06 11:29:23
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology,Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com
//
//  Description   : Generate MAC units and relative interconncetion according also 
//                  to max number of dsp allowed in the board
//
//
//==================================================================================================
`timescale 1ns / 1ps
`include "precision_def.vh"

module mxu_core
// parameters are directly related to the number of inputdat,weight and outputs
#(parameter M=3, // matrix row -> weights
    K=3, // matrix columsn -> input data
   max_data_width=4, // it must be a divisor of 64
   MAX_BOARD_DSP=220
    )
(   
   data_type, 
    clk,
    reset,
    enable,
    enable_chain,
    test_mode,
    enable_fp_unit,
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
    input enable_chain;
    input [1:0] enable_fp_unit;
    // muxes for allowing different precision 
    wire  reset_mac;
   assign reset_mac=reset;
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
            `ifdef  VIVADO_MAC
            mult_gen_0 mult_i (
              .CLK(clk),    // input wire CLK
              .A(input_data[(j+1)*max_data_width-56-1:j*max_data_width]),        // input wire [3 : 0] A
              //.A(input_data[(j+1)*max_data_width-1:j*max_data_width]),        // input wire [3 : 0] A
              .B(weight[(i+1)*(max_data_width)-1-56:i*max_data_width]),        // input wire [3 : 0] B
              //.B(weight[(i+1)*(max_data_width)-1:i*max_data_width]),        // input wire [3 : 0] B
              .CE(enable),      // input wire CE
              .SCLR(reset_mac),  // input wire SCLR
              .P(res_mac_next[i*K+j][7:0])        // output wire [3 : 0] P
            );
            `else
              // smul cascade of dsp always on fabric
                        smul #(.USE_FABRIC("YES")) smul_i (
                            .clk             (clk),
                            .ce              (enable),
                            .sclr            (reset_mac),
                            .input_data      (input_data[(j+1)*max_data_width-1:j*max_data_width]),
                            .weight          (weight[(i+1)*(max_data_width)-1:i*max_data_width]),
                            .res_mac_next(res_mac_next[i*K+j]),
                            .select_precision(data_type),
                            .enable_fp_unit  (enable_fp_unit),
                            .active_chain(enable_chain)
                          );
              `endif

             end else if ( j==K-1) begin 
                // check if it is the last column
                if(i==0) begin 
                        if(i*(M-1)+ (j-1)<MAX_BOARD_DSP) begin: dsp_generation

                 mxu_mac #(.bit_width(max_data_width),.USE_FABRIC("NO")) mac_i_j(.ce(enable),.clk(clk),.sclr(reset_mac),
                                .data_input(input_data[(j+1)*max_data_width-1:j*max_data_width]),
                                    .weight(weight[(i+1)*(max_data_width)-1:i*max_data_width]),
                                     .res_mac_p(res_mac_next[i*K+j-1]),
                                     .enable_fp_unit(enable_fp_unit),
                                     .data_type(data_type),
                                     .enable_chain(enable_chain),
                                     .res_mac_n(y[(i+1)*(max_data_width)-1:i*max_data_width]),
                                     .data_input_next_row(data_in_next_row[i*K+j][max_data_width-1:0]));
                          end else begin 
                                            
                 mxu_mac #(.bit_width(max_data_width),.USE_FABRIC("YES")) mac_i_j(.ce(enable),.clk(clk),.sclr(reset_mac),
                                .data_input(input_data[(j+1)*max_data_width-1:j*max_data_width]),
                                    .weight(weight[(i+1)*(max_data_width)-1:i*max_data_width]),
                                     .res_mac_p(res_mac_next[i*K+j-1]),
                                     .data_type(data_type),
                                     .enable_chain(enable_chain),
                                     .enable_fp_unit(enable_fp_unit),
                                     .res_mac_n(y[(i+1)*(max_data_width)-1:i*max_data_width]),
                                     .data_input_next_row(data_in_next_row[i*K+j][max_data_width-1:0]));
              
                           end //dsp_generation;                                     
                            
    
                end else begin


                  if(i*(M-1)+(j-1)<MAX_BOARD_DSP) begin: dsp_generation_2
                            mxu_mac #(.bit_width(max_data_width),.USE_FABRIC("NO")) mac_i_j(.ce(enable),.clk(clk),.sclr(reset_mac),
                                .data_input(data_in_next_row[(i-1)*K+j][max_data_width-1:0]),
                                .weight(weight[(i+1)*(max_data_width)-1:i*max_data_width]),
                                .res_mac_p(res_mac_next[i*K+j-1]),
                                .data_type(data_type),
                                .enable_chain(enable_chain),
                                .enable_fp_unit(enable_fp_unit),
                                .res_mac_n(y[(i+1)*(max_data_width)-1:i*max_data_width]),
                                .data_input_next_row(data_in_next_row[i*K+j][max_data_width-1:0]));
                    end else begin 

                            mxu_mac #(.bit_width(max_data_width),.USE_FABRIC("YES")) mac_i_j(.ce(enable),.clk(clk),.sclr(reset_mac),
                                                            .data_input(data_in_next_row[(i-1)*K+j][max_data_width-1:0]),
                                                            .weight(weight[(i+1)*(max_data_width)-1:i*max_data_width]),
                                                            .res_mac_p(res_mac_next[i*K+j-1]),
                                                            .data_type(data_type),
                                                            .enable_chain(enable_chain),
                                                            .enable_fp_unit(enable_fp_unit),
                                                            .res_mac_n(y[(i+1)*(max_data_width)-1:i*max_data_width]),
                                                            .data_input_next_row(data_in_next_row[i*K+j][max_data_width-1:0]));
                    end // dsp_generation_2
                end 

            end else begin 
                 if(i==0) begin 

                         if(i*(M-1)+(j-1)<MAX_BOARD_DSP) begin: dsp_generation_3
                            mxu_mac #(.bit_width(max_data_width),.USE_FABRIC("NO")) mac_i_j(.ce(enable),.clk(clk),.sclr(reset_mac),
                               .data_input(input_data[(j+1)*max_data_width-1:j*max_data_width]),
                              .weight(weight[(i+1)*(max_data_width)-1:i*max_data_width]),
                              .res_mac_p(res_mac_next[i*K+j-1]),
                              .enable_fp_unit(enable_fp_unit),
                              .data_type(data_type),
                              .enable_chain(enable_chain),
                              .res_mac_n(res_mac_next[i*K+j]),
                             .data_input_next_row(data_in_next_row[i*K+j][max_data_width-1:0]));
                  
                           end else begin 
                              mxu_mac #(.bit_width(max_data_width),.USE_FABRIC("YES")) mac_i_j(.ce(enable),.clk(clk),.sclr(reset_mac),
                               .data_input(input_data[(j+1)*max_data_width-1:j*max_data_width]),
                              .weight(weight[(i+1)*(max_data_width)-1:i*max_data_width]),
                              .res_mac_p(res_mac_next[i*K+j-1]),
                              .enable_fp_unit(enable_fp_unit),
                              .data_type(data_type),
                              .enable_chain(enable_chain),
                              .res_mac_n(res_mac_next[i*K+j]),
                             .data_input_next_row(data_in_next_row[i*K+j][max_data_width-1:0]));
                          end
                          end else begin
                     if(i*(M-1)+(j-1)<MAX_BOARD_DSP) begin: dsp_generation_4
                     mxu_mac #(.bit_width(max_data_width),.USE_FABRIC("NO")) mac_i_j(.ce(enable),.clk(clk),.sclr(reset_mac),
                      .data_input(data_in_next_row[(i-1)*K+j][max_data_width-1:0]),
                       .weight(weight[(i+1)*(max_data_width)-1:i*max_data_width]),
                       .enable_fp_unit(enable_fp_unit),
                       .data_type(data_type),
                        .enable_chain(enable_chain),
                       .res_mac_p(res_mac_next[i*K+j-1]),
                       .res_mac_n(res_mac_next[i*K+j]),
                        .data_input_next_row(data_in_next_row[i*K+j]));
                     end else begin 
                     mxu_mac #(.bit_width(max_data_width),.USE_FABRIC("YES")) mac_i_j(.ce(enable),.clk(clk),.sclr(reset_mac),
                      .data_input(data_in_next_row[(i-1)*K+j][max_data_width-1:0]),
                       .weight(weight[(i+1)*(max_data_width)-1:i*max_data_width]),
                       .enable_fp_unit(enable_fp_unit),
                       .data_type(data_type),
                        .enable_chain(enable_chain),
                       .res_mac_p(res_mac_next[i*K+j-1]),
                       .res_mac_n(res_mac_next[i*K+j]),
                        .data_input_next_row(data_in_next_row[i*K+j]));


                     end // dsp_generation4
                   
                  end 
              end
           end
       end
       endgenerate
   
       
endmodule
