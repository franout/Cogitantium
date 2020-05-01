
//==================================================================================================
//  Filename      : tb_filter_select.sv
//  Created On    : 2020-04-22 17:05:25
//  Last Modified : 2020-05-01 18:21:38
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology,Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com
//
//  Description   : 
//
//
//==================================================================================================

`timescale 1ns / 1ps
`include "precision_def.vh"
module tb_filter_select(

    );
    

    
    
    
      parameter clk_period= 10;
       logic clk;
       logic[64*8-1:0]data_in;
       logic[64*3-1:0]data_in3;
       logic[64*4-1:0]data_in4;
       logic[64*6-1:0]data_in6;
       logic[64*16-1:0]data_in16;
       logic[64*20-1:0]data_in20;
       logic [3:0] data_select;
       logic[3:0] data_precision;
       logic activate_chain;
       logic [64*8-1:0]data_out;
       logic [64*16-1:0]data_out16;
       logic [3*64-1:0]data_out3;
       logic [3*64-1:0]data_out3_compact;
       logic [4*64-1:0]data_out4;
       logic [4*64-1:0]data_out4_compact;
       logic [6*64-1:0]data_out6;
       logic [6*64-1:0]data_out6_compact;
       logic [8*64-1:0] data_out8_compact;
       logic [16*64-1:0]data_out16_compact;
       logic [20*64-1:0] data_out20;
       logic [20*64-1:0]data_out20_compact;
       
                integer k;
      
                filter_and_select 
                #(.K(3)
                   ) uut3
                (
                .data_in(data_in3),
                .data_out(data_out3),
                .data_select(data_select)
                );
              compact_and_select  #(.K(3)
                                  ) uut3_compacter
                               (
                   .data_in(data_out3),
                    .data_out(data_out3_compact),
                    .data_select(data_select)
                );



              /// 4x4

                filter_and_select 
                #(.K(4)
                   ) uut4
                (
                .data_in(data_in4),
                .data_out(data_out4),
                .data_select(data_select)
                );
              compact_and_select  #(.K(4)
                                  ) uut4_compacter
                               (
                   .data_in(data_out4),
                    .data_out(data_out4_compact),
                    .data_select(data_select)
                );


              // 6x6 

                filter_and_select 
                #(.K(6)
                   ) uut6
                (
                .data_in(data_in6),
                .data_out(data_out6),
                .data_select(data_select)
                );
              compact_and_select  #(.K(6)
                                  ) uut6_compacter
                               (
                   .data_in(data_out6),
                    .data_out(data_out6_compact),
                    .data_select(data_select)
                );


                filter_and_select 
                #(.K(8)
                   ) uut
                (
                .data_in(data_in),
                .data_out(data_out),
                .data_select(data_select)
                );
                compact_and_select  #(.K(8)
                                                  ) uut8_compacter
                                               (
                                   .data_in(data_out),
                                    .data_out(data_out8_compact),
                                    .data_select(data_select)
                                );
                    
                    filter_and_select 
                                #(.K(16)
                                   ) uut16
                                (
                                .data_in(data_in16),
                                .data_out(data_out16),
                                .data_select(data_select)
                                );
                                
                            compact_and_select  #(.K(16)
                                              ) uut16_compacter
                                           (
                               .data_in(data_out16),
                                .data_out(data_out16_compact),
                                .data_select(data_select)
                            );
                                /*
                              filter_and_select 
                                #(.K(17)
                                   ) uut17
                                (
                                .data_in(data_in17),
                                .data_out(data_out17),
                                .data_select(data_select)
                                );
                                
                            compact_and_select  #(.K(17)
                                              ) uut17_compacter
                                           (
                               .data_in(data_out17),
                                .data_out(data_out17_compact),
                                .data_select(data_select)
                            );*/
                    filter_and_select 
                                #(.K(20)
                                   ) uut20
                                (
                                .data_in(data_in20),
                                .data_out(data_out20),
                                .data_select(data_select)
                                );
                                
                            compact_and_select  #(.K(20)
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
                       data_precision=`INT8;
                       $display("precison set to 8");
                       #clk_period;
                       // sanity check
                       if({{56*3-1{0}},data_in3[8*3-1:0]}!=data_out3_compact) begin 
                        $display("compacter 3x3 error");
                        $stop();
                       end 

                      if({{56*4-1{0}},data_in4[8*4-1:0]}!=data_out4_compact) begin 
                        $display("compacter 4x4 error");
                        $stop();
                       end

                       if({{56*6-1{0}},data_in6[8*6-1:0]}!=data_out6_compact) begin 
                        $display("compacter 6x6 error");
                        $stop();
                       end
                        if({{56*8-1{0}},data_in[8*8-1:0]}!=data_out8_compact) begin 
                        $display("compacter 8x8 error");
                        $display("%h",data_out8_compact[8*8-1:0]);
                        $stop();
                       end
                       if({data_in16[8*16-1:0]}!=data_out16_compact) begin 
                        $display("compacter 16x16 error");
                        $display("%h",data_out16_compact[10*16-1:0]);
                            $stop();
                       end
                        /* problem with odd mxu
                       if({{56*17-1{0}},data_in17[8*17-1:0]}!=data_out17_compact) begin 
                        $display("compacter 17x17 error");
                        $display("%h",data_out17_compact[17*16-1:0]);  
                        $stop();
                       end
                      */
                        
                      if({{56*20-1{0}},data_in20[8*20-1:0]}!=data_out20_compact) begin 
                      $display("compacter 20x2x error");
                        $display("%h",data_out20_compact[17*16-1:0]);
                        $stop();
                       end


                       data_precision=`INT16;
                       $display("precison set to 16");
                       #clk_period;
                       /*check output*/
                       if(data_in3[16*3-1:0]!=data_out3_compact) begin 
                        $display("compacter 3x3 error int16");
                        $stop();
                       end 

                      if(data_in4[16*4-1:0]!=data_out4_compact) begin 
                        $display("compacter 4x4 error int16");
                        $stop();
                       end

                       if(data_in6[16*6-1:0]!=data_out6_compact) begin 
                        $display("compacter 6x6 error int16");
                        $stop();
                       end
                        if(data_in[16*8-1:0]!=data_out8_compact) begin 
                        $display("compacter 8x8 error int16");
                        $display("%h",data_out8_compact[10*16-1:0]);
                        $stop();
                       end
                       if(data_in16[16*16-1:0]!=data_out16_compact) begin 
                        $display("compacter 16x16 error int16");
                        $display("%h",data_out16_compact[18*16-1:0]);
                            $stop();
                       end
                       if(data_in20[16*20-1:0]!=data_out20_compact) begin 
                      $display("compacter 20x2x error int16");
                        $display("%h",data_out20_compact[10*16-1:0]);
                        $display("%h",data_out20_compact[22*16-1:10*16]);
                        $stop();
                       end

                       data_precision=`INT32;
                       $display("precison set to 32");
                       #clk_period;
                       /*check output*/
                       if(data_in3[32*3-1:0]!=data_out3_compact) begin 
                        $display("compacter 3x3 error  int32");
                        $stop();
                       end 

                      if(data_in4[32*4-1:0]!=data_out4_compact) begin 
                        $display("compacter 4x4 error  int32");
                        $stop();
                       end

                       if(data_in6[32*6-1:0]!=data_out6_compact) begin 
                        $display("compacter 6x6 error  int32");
                        $stop();
                       end
                        if(data_in[32*8-1:0]!=data_out8_compact) begin 
                        $display("compacter 8x8 error  int32");
                        $display("%h",data_out8_compact[8*8-1:0]);
                        $stop();
                       end
                       if(data_in16[32*16-1:0]!=data_out16_compact) begin 
                        $display("compacter 16x16 error  int32");
                        $display("%h",data_out16_compact[10*16-1:0]);
                            $stop();
                       end
                       if(data_in20[32*20-1:0]!=data_out20_compact) begin 
                      $display("compacter 20x2x error  int32");
                        $display("%h",data_out20_compact[17*16-1:0]);
                        $stop();
                       end

                       data_precision=`INT64;
                       $display("precison set to 64");
                       #clk_period;
                       /*check output*/
                       if(data_in3[64*3-1:0]!=data_out3_compact) begin 
                        $display("compacter 3x3 error  int64");
                        $stop();
                       end 

                      if(data_in4[64*4-1:0]!=data_out4_compact) begin 
                        $display("compacter 4x4 error int64");
                        $stop();
                       end

                       if(data_in6[64*6-1:0]!=data_out6_compact) begin 
                        $display("compacter 6x6 error");
                        $stop();
                       end
                        if(data_in[64*8-1:0]!=data_out8_compact) begin 
                        $display("compacter 8x8 error int64");
                        $display("%h",data_out8_compact[8*8-1:0]);
                        $stop();
                       end
                       if(data_in16[64*16-1:0]!=data_out16_compact) begin 
                        $display("compacter 16x16 error int64");
                        $display("%h",data_out16_compact[10*16-1:0]);
                            $stop();
                       end
                       if(data_in20[64*20-1:0]!=data_out20_compact) begin 
                      $display("compacter 20x2x error int64");
                        $display("%h",data_out20_compact[17*16-1:0]);
                        $stop();
                       end



                       #clk_period;
                       activate_chain=0;
                       #clk_period;
                       $display("chain is deactivated");
                       data_precision=`INT8;
                       $display("precison set to 8");
                       #clk_period;
                       data_precision=`INT16;
                       $display("precison set to 16");
                       #clk_period; 
                       data_precision=`INT32;
                       $display("precison set to 32");
                       #clk_period;
                       data_precision=`INT64;
                       $display("precison set to 64");
                       #clk_period;
                       data_precision=`NO_COMPUTATION;
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
                       data_precision=`INT8;
                       $display("precison set to 8");
                       #clk_period;
                       data_precision=`INT16;
                       $display("precison set to 16");
                       #clk_period;
                       data_precision=`INT32;
                       $display("precison set to 32");
                       #clk_period;
                       data_precision=`INT64;
                       $display("precison set to 64");
                       #clk_period;
                       #clk_period;
                       activate_chain=0;
                       #clk_period;
                       $display("chain is deactivated");
                       data_precision=`INT8;
                       $display("precison set to 8");
                       #clk_period;
                       data_precision=`INT16;
                       $display("precison set to 16");
                       #clk_period; 
                       data_precision=`INT32;
                       $display("precison set to 32");
                       #clk_period;
                       data_precision=`INT64;
                       $display("precison set to 64");
                       #clk_period;
                       data_precision=`NO_COMPUTATION;
                       #clk_period;
                       #clk_period;
                       #clk_period;
                       #clk_period;
                       #clk_period;
                       #clk_period;
                       $display("check with two input data");
                       $display("8 bit precision ");
                       data_precision=`INT8;
                       data_in={{6{64'd0}},{2{64'hCAFECAFECAFECAFE}}};
                       #clk_period;
                       $display("16 bit precision ");
                       data_precision=`INT16;
                       #clk_period;
                       $display("32 bit precision ");
                      data_precision=`INT32;
                      #clk_period;
                      $display("64 bit precision ");
                     data_precision=`INT64;
                     #clk_period;
                    $finish;
   end 
endmodule
