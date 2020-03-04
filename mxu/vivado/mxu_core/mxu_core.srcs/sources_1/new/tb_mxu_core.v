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
              reg [(4)*(3)-1:0]input_data;
              reg [(4)*(3)-1:0]weight;
              reg enable;
              wire test_mode;
              wire [4*3-1:0]y;
              integer k;
    `define SIMULATION 1
                  `define VIVADO_MAC SIMULATION
     mxu_core #( .M(3), .K(3),.max_data_width(4)  ) uut
    (   
        .clk(clk),
        .enable(enable),
        .reset(reset),
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
              #clk_period;
              
              reset=1'b0;
              input_data=12'h253;
              weight=12'h312;
              #clk_period;
              enable=1'b1;
             for(k=0;k<50;k=k+1) begin 
              #clk_period;
              end
              weight=12'h000;
              for(k=0;k<50;k=k+1) begin 
                              #clk_period;
                              end
                              
              end 

        
        
        
        
            
endmodule
