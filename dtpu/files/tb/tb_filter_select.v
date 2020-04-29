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
       reg [64*4-1:0]data_in4;
       reg [64*6-1:0]data_in6;
       reg [64*16-1:0]data_in16;
       reg [64*20-1:0]data_in20;
       wire [3:0] data_select;
       reg [3:0] data_precision;
       reg activate_chain;
       wire [64*8-1:0]data_out;
       wire [64*16-1:0]data_out16;
       wire [3*64-1:0]data_out3;
       wire [3*64-1:0]data_out3_compact;
       wire [4*64-1:0]data_out4;
       wire [4*64-1:0]data_out4_compact;
       wire [6*64-1:0]data_out6;
       wire [6*64-1:0]data_out6_compact;
       wire [8*64-1:0] data_out8_compact;
       wire [16*64-1:0]data_out16_compact;
       wire [20*64-1:0] data_out20;
       wire [20*64-1:0]data_out20_compact;
                integer k;
      
                filter_and_select 
                #(.K(3), .bit_width_so(8) 
                   ) uut3
                (
                .data_in(data_in3),
                .data_out(data_out3),
                .data_select(data_select)
                );
              compact_and_select  #(.K(3), .bit_width_so(8) 
                                  ) uut3_compacter
                               (
                   .data_in(data_out3),
                    .data_out(data_out3_compact),
                    .data_select(data_select)
                );



              /// 4x4

                filter_and_select 
                #(.K(4), .bit_width_so(8) 
                   ) uut4
                (
                .data_in(data_in4),
                .data_out(data_out4),
                .data_select(data_select)
                );
              compact_and_select  #(.K(4), .bit_width_so(8) 
                                  ) uut4_compacter
                               (
                   .data_in(data_out4),
                    .data_out(data_out4_compact),
                    .data_select(data_select)
                );


              // 6x6 

                filter_and_select 
                #(.K(6), .bit_width_so(8) 
                   ) uut6
                (
                .data_in(data_in6),
                .data_out(data_out6),
                .data_select(data_select)
                );
              compact_and_select  #(.K(3), .bit_width_so(8) 
                                  ) uut6_compacter
                               (
                   .data_in(data_out6),
                    .data_out(data_out6_compact),
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
                compact_and_select  #(.K(8), .bit_width_so(8) 
                                                  ) uut8_compacter
                                               (
                                   .data_in(data_out),
                                    .data_out(data_out8_compact),
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
                                
                            compact_and_select  #(.K(16), .bit_width_so(8) 
                                              ) uut16_compacter
                                           (
                               .data_in(data_out16),
                                .data_out(data_out16_compact),
                                .data_select(data_select)
                            );

                    filter_and_select 
                                #(.K(20), .bit_width_so(8) 
                                   ) uut20
                                (
                                .data_in(data_in20),
                                .data_out(data_out20),
                                .data_select(data_select)
                                );
                                
                            compact_and_select  #(.K(20), .bit_width_so(8) 
                                              ) uut20_compacter
                                           (
                               .data_in(data_out20),
                                .data_out(data_out20_compact),
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
                       data_in4={4{64'h0123456789ABCDEF}};
                       data_in6={6{64'h0123456789ABCDEF}};
                       data_in16={16{64'hCAFECAFECAFECAFE}};
                      data_in20={20{64'hCAFECAFECAFECAFE}};
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
                       data_in4={{3{64'h0000000000000000}},{64'h0123456789ABCDEF}};
                       data_in6={{5{64'h0000000000000000}},{64'h0123456789ABCDEF}};
                       data_in16={{15{64'h0000000000000000}},{64'hCAFECAFECAFECAFE}};
                       data_in20={{19{64'h0000000000000000}},{64'hCAFECAFECAFECAFE}};
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
                       $display("check with two input data");
                       $display("8 bit precision ");
                       data_precision=4'h1;
                       data_in={{6{64'd0}},{2{64'hCAFECAFECAFECAFE}}};
                       #clk_period;
                       $display("16 bit precision ");
                       data_precision=4'h3;
                       #clk_period;
                       $display("32 bit precision ");
                      data_precision=4'h7;
                      #clk_period;
                      $display("64 bit precision ");
                     data_precision=4'hf;
                     #clk_period;
                    $finish;
   end 
endmodule
