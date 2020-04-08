`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2020 15:06:04
// Design Name: 
// Module Name: tb_filter_select
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


module tb_filter_select(

    );
    
    
    
    
      parameter clk_period= 10;
      reg clk;
       reg [64*8:0]data_in;
       reg [64*16:0]data_in16;
       wire [3:0] data_select;
       reg [3:0] data_precision;
       reg activate_chain;
       wire [64*8:0]data_out;
       wire [64*16:0]data_out16;
                integer k;
      
                
                 filter_and_select 
                #(.K(8), .bit_width(8) 
                   ) uut
                (
                .data_in(data_in),
                .data_out(data_out),
                .data_selct(data_select)
                );
                
                filter_and_select 
                                #(.K(16), .bit_width(8) 
                                   ) uut16
                                (
                                .data_in(data_in16),
                                .data_out(data_out16),
                                .data_selct(data_select)
                                );
                      always begin
                         clk = 1'b1;
                         #(clk_period/2) 
                         clk = 1'b0;
                         #(clk_period/2);
                      end
                      
                      // process for data selection
                      genvar i;
                      generate
                      for(i=0; i<4;i=i+1) begin 
                      assign data_select[i]= data_precision[i] & activate_chain;
                       end 
                       endgenerate
                       
                       
                       /// stimulus
                       initial begin 
                       activate_chain=1;
                       data_in={8{64'hCAFECAFECAFECAFE}};
                       data_in16={16{64'hCAFECAFECAFECAFE}};
                       data_precision=4'b0001;
                       $dispay("precison set to 8");
                       #clk_period;
                       data_precision=4'b0011;
                       $dispay("precison set to 16");
                       #clk_period;
                       data_precision=4'b0111;
                       $dispay("precison set to 32");
                       #clk_period;
                       data_precision=4'b1111;
                       $dispay("precison set to 64");
                       #clk_period;
                       #clk_period;
                       activate_chain=0;
                       #clk_period;
                       $display("chain is deactivated");
                       data_precision=4'b0001;
                       $dispay("precison set to 8");
                       #clk_period;
                       data_precision=4'b0011;
                       $dispay("precison set to 16");
                       #clk_period; 
                       data_precision=4'b0111;
                       $dispay("precison set to 32");
                       #clk_period;
                       data_precision=4'b1111;
                       $dispay("precison set to 64");
                       #clk_period;
                       $finish;
                       end 
endmodule
