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


module tb_mxu_core();
        parameter clk_period= 10;
              reg clk,reset;
              reg [(8)*(3)-1:0]input_data;
              reg [(8)*(3)-1:0]weight;
              reg [(8)*(4)-1:0]input_data4;
                 reg [(8)*(4)-1:0]weight4;
               reg enable;
               reg [4:0]data_type=0;
              wire test_mode;
              wire [8*3-1:0]y;
              wire [8*4-1:0]y4;
              integer k;
    `define SIMULATION 1
                  `define VIVADO_MAC SIMULATION
     mxu_core #( .M(3), .K(3),.max_data_width(8)  ) uut
    (    .data_type(data_type),
        .clk(clk),
        .enable(enable),
        .reset(reset),
        .test_mode(test_mode),
        .input_data(input_data),
        .weight(weight),
        .y(y)
        );
     mxu_core #( .M(4), .K(4),.max_data_width(8)  ) uut4
            (   .data_type(data_type),
                .clk(clk),
                .enable(enable),
                .reset(reset),
                .test_mode(test_mode),
                .input_data(input_data4),
                .weight(weight4),
                .y(y4)
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
              #clk_period;
              reset=1'b0;
              input_data=24'hFECAFE;
              weight=24'hFFFFFF;
              weight4=32'habcdef12;
              input_data4=32'h22111353;
              #clk_period;
              enable=1'b1;
              #clk_period;
              for(k=0;k<8;k=k+1) begin 
              #clk_period;
              end
              // first input chaanges delay on second input of 1 cc and on third 1 of 2cc 
              // the delay of input chian depends from the number of columns 
              input_data=24'hF111FE;
              input_data4=32'h22aaa353;
              #clk_period;
              input_data=24'hF222FE;
              #clk_period;
              input_data=24'hF333FE;
              input_data4=32'h22FFF353;
              for(k=0;k<6;k=k+1) begin 
              #clk_period;
              end
              weight=24'h111111;
              weight4=32'h11111111;
              input_data=24'hF333FE1;
              input_data4=32'h22FFF353;
              for(k=0;k<10;k=k+1) begin 
              #clk_period;
              input_data=input_data+1'h1;
              input_data4=input_data4+1'h1;
              end
                              
              end 

        
        
        
        
            
endmodule
