`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 16:57:45
// Design Name: 
// Module Name: tb_mxu_core
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
module tb_kernel_mxu();
        parameter clk_period= 10;
              logic clk,reset;
              logic [(64)*(3)-1:0]input_data;
              logic [(64)*3*(3)-1:0]weight;
              logic [(64)*(4)-1:0]input_data4;
              logic [(64)*4*(4)-1:0]weight4;
              logic enable;
              logic  test_mode;
              logic  [64*3-1:0]y;
              logic  [64*4-1:0]y4;
              logic [`LOG_ALLOWED_PRECISIONS-1:0]data_type;
              logic enable_in_ff;
              logic enable_chain;
              logic enable_out_ff;
              logic [1:0]enable_fp_unit;
                    integer k;

     
        mxu_wrapper #(.M(4),.K(4) , .max_data_width(64),.MAX_BOARD_DSP(220)) uut4x4 (
           .data_type(data_type),
           .reset(reset),
           .enable(enable),
            .clk(clk),
            .enable_fp_unit(enable_fp_unit),
            .enable_out_ff (enable_out_ff),
            .enable_in_ff  (enable_in_ff),
            .enable_chain  (enable_chain),
            .test_mode(test_mode),
            .input_data(input_data4),
            .weight(weight4),
            .y(y4)           
         );
          
          
         mxu_wrapper #(.M(3),.K(3) , .max_data_width(64),.MAX_BOARD_DSP(220)) uut3x3 (
                    .data_type(data_type),
                     .clk(clk),
                      .enable_fp_unit(enable_fp_unit),
                      .enable_out_ff (enable_out_ff),
                      .enable_in_ff  (enable_in_ff),
                      .enable_chain  (enable_chain),
                     .reset(reset),
                     .enable(enable),
                     .test_mode(test_mode),
                     .input_data(input_data),
                     .weight(weight),
                     .y(y)           
                  );
                   
              
                    always begin
                       clk = 1'b1;
                       #(clk_period/2) 
                       clk = 1'b0;
                       #(clk_period/2);
                    end
              

              
              initial begin 
              enable=1'b0;
              reset=1'b1;
              data_type=`INT8;
              enable_in_ff='0;
              enable_out_ff='0;
              enable_chain='0;
              enable_fp_unit='0;
              #clk_period;
              reset=1'b0;
              input_data={3{56'd0,8'hfe}};
              weight={9{56'd0,8'hff}};
              input_data4={4{56'd0,8'hca}};
              weight4={16{56'd0,8'hff}};
              #clk_period;
              enable=1'b1;
              enable_in_ff='1;
              enable_out_ff='1;
              #clk_period;
              for(k=0;k<2+3*3*3;k=k+1) begin 
              #clk_period;
              end
              $finish();   
                              
              end 

        
        
        
        
            
endmodule
