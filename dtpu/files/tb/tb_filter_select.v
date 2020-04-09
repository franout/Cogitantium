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
       reg [64*8-1:0]data_in;
       reg [64*3-1:0]data_in3;
       reg [64*16-1:0]data_in16;
       wire [3:0] data_select;
       reg [3:0] data_precision;
       reg activate_chain;
       wire [64*8-1:0]data_out;
       wire [64*16-1:0]data_out16;
       wire [3*64-1:0]data_out3;
                integer k;
      
                filter_and_select 
                #(.K(3), .bit_width_so(8) 
                   ) uut3
                (
                .data_in(data_in3),
                .data_out(data_out3),
                .data_select(data_select)
                );
                
                filter_and_select 
                #(.K(8), .bit_width_so(8) 
                   ) uut
                (
                .data_in(data_in),
                .data_out(data_out),
                .data_select(data_select)
                );
                
                filter_and_select 
                                #(.K(16), .bit_width_so(8) 
                                   ) uut16
                                (
                                .data_in(data_in16),
                                .data_out(data_out16),
                                .data_select(data_select)
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
                      assign data_select[i]= data_precision[i] ; //& activate_chain;
                       end 
                       endgenerate
                       
                       
                       /// stimulus
                       initial begin 
                       activate_chain=1;
                       data_in={8{64'hCAFECAFECAFECAFE}};
                       data_in3={3{64'h0123456789ABCDEF}};
                       data_in16={16{64'hCAFECAFECAFECAFE}};
                       data_precision=4'b0001;
                       $display("precison set to 8");
                       #clk_period;
                       data_precision=4'b0011;
                       $display("precison set to 16");
                       #clk_period;
                       data_precision=4'b0111;
                       $display("precison set to 32");
                       #clk_period;
                       data_precision=4'b1111;
                       $display("precison set to 64");
                       #clk_period;
                       #clk_period;
                       activate_chain=0;
                       #clk_period;
                       $display("chain is deactivated");
                       data_precision=4'b0001;
                       $display("precison set to 8");
                       #clk_period;
                       data_precision=4'b0011;
                       $display("precison set to 16");
                       #clk_period; 
                       data_precision=4'b0111;
                       $display("precison set to 32");
                       #clk_period;
                       data_precision=4'b1111;
                       $display("precison set to 64");
                       #clk_period;
                       data_precision=4'h0;
                       #clk_period;
                       #clk_period;
                       #clk_period;
                       #clk_period;
                       #clk_period;
                       #clk_period;
                       
                       data_in={{7{64'h0000000000000000}},{64'hCAFECAFECAFECAFE}};
                       data_in3={{2{64'h0000000000000000}},{64'h0123456789ABCDEF}};
                       data_in16={{15{64'h0000000000000000}},{64'hCAFECAFECAFECAFE}};
                       data_precision=4'b0001;
                       $display("precison set to 8");
                       #clk_period;
                       data_precision=4'b0011;
                       $display("precison set to 16");
                       #clk_period;
                       data_precision=4'b0111;
                       $display("precison set to 32");
                       #clk_period;
                       data_precision=4'b1111;
                       $display("precison set to 64");
                       #clk_period;
                       #clk_period;
                       activate_chain=0;
                       #clk_period;
                       $display("chain is deactivated");
                       data_precision=4'b0001;
                       $display("precison set to 8");
                       #clk_period;
                       data_precision=4'b0011;
                       $display("precison set to 16");
                       #clk_period; 
                       data_precision=4'b0111;
                       $display("precison set to 32");
                       #clk_period;
                       data_precision=4'b1111;
                       $display("precison set to 64");
                       #clk_period;
                       data_precision=4'h0;
                       #clk_period;
                       #clk_period;
                       #clk_period;
                       #clk_period;
                       #clk_period;
                       #clk_period;
                       $finish;
                       end 
endmodule
