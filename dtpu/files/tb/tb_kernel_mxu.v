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


module tb_kernel_mxu();
        parameter clk_period= 10;
              reg clk,reset;
              reg [(4)*(3)-1:0]input_data;
              reg [(4)*(3)-1:0]weight;
              reg [(4)*(4)-1:0]input_data4;
              reg [(4)*(4)-1:0]weight4;
              reg enable;
              wire test_mode;
              wire [4*3-1:0]y;
              wire [4*4-1:0]y4;
              integer k;
    
    /////////////////////////////////////
    `define SIMULATION 1
    `define VIVADO_MAC SIMULATION
     /////////////////////////////////////
     
        mxu_wrapper #(.M(4),.K(4) , .max_data_width(4)) uut4x4 (
           .data_type(data_type),
           .reset(reset),
           .enable(enable),
            .clk(clk),
            .test_mode(test_mode),
            .input_data(input_data4),
            .weight(weight4),
            .y(y4)           
         );
          
          
         mxu_wrapper #(.M(3),.K(3) , .max_data_width(4)) uut3x3 (
                    .data_type(data_type),
                     .clk(clk),
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
              reset=1'b0;
              #clk_period;
              reset=1'b1;
              input_data=12'hafe;
              weight=12'hfff;
              input_data4=16'h8253;
              weight4=16'h7312;              
              #clk_period;
              enable=1'b1;
              #clk_period;
              for(k=0;k<12;k=k+1) begin 
              #clk_period;
              end
              
              // first input chaanges delay on second input of 1 cc and on third 1 of 2cc 
              // the delay of input chian depends from the number of columns 
               input_data=12'h353;
               input_data4=16'h1253;
              #clk_period;
              input_data=12'h463;
              input_data4=16'h3253;
              #clk_period;
              input_data=12'h564;
              input_data4=16'hA253;
              for(k=0;k<6;k=k+1) begin 
              #clk_period;
              end
              
              
                            
                            weight=12'h111;
                            weight4=16'h111;
                            for(k=0;k<10;k=k+1) begin 
                                            #clk_period;
                                            end
                                             
                              
              end 

        
        
        
        
            
endmodule
