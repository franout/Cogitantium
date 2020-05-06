//==================================================================================================
//  Filename      : tb_dtpu.sv
//  Created On    : 2020-04-22 17:05:25
//  Last Modified : 2020-05-06 11:24:35
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
`include "csr_definition.vh"


module tb_dtpu();
        parameter clk_period= 10;
              logic clk,reset, enable,test_mode;
              integer k;
              ////////////////////////////
              ////// CSR INTERFACE ///////
              ////////////////////////////
              logic [31:0]csr_address;
              logic csr_clk;
              logic [63:0]csr_din;
              logic [63:0]csr_dout;
              logic csr_ce;
              logic csr_reset;
              logic csr_we;
              ////////////////////////////
              ////// WEIGHT MEMORY ///////
              ///////////////////////////
              logic [31:0]wm_address;
              logic wm_clk;
              logic [63:0]wm_din;
              logic [63:0] wm_dout;
              logic wm_ce;
              logic wm_reset;
              logic wm_we;
              ////////////////////////////////////////////
              /////////// INPUT DATA FIFO ////////////////
              ////////////////////////////////////////////
              /////////// using stream axi 
              logic infifo_is_empty;
              logic [63:0]infifo_dout;
              logic infifo_read;
              ////////////////////////////////////////////
              /////////// OUTPUT DATA FIFO ///////////////
              ////////////////////////////////////////////
              /////////// using stream axi 
              logic outfifo_is_full;
              logic [63:0]outfifo_din;
              logic outfifo_write;
                  
              ////////////////////////////////////////////
              /////////// CONTROL FROM/TO PS ////////////////
              ////////////////////////////////////////////
              logic cs_continue;
              logic cs_done;
              logic cs_idle;
              logic cs_ready;
              logic cs_start;
              logic[3:0]state;
              logic [3:0] precision;
logic [3:0]data_precision_tb;
logic [3:0]data_precision_fp_tb;
logic [3:0] state;
logic [3:0] d_out;
logic [63:0]data[0:31];
integer i;
      
   

  parameter DATA_WIDTH_MAC       = 64;
  parameter ROWS                 = 8;
  parameter COLUMNS              = 8;
  parameter SIZE_WMEMORY         = 2048;
  parameter ADDRESS_SIZE_WMEMORY = 32;
  parameter ADDRESS_SIZE_CSR     = 32;
  parameter SIZE_CSR             = 1024;
  parameter DATA_WIDTH_CSR       = 64;
  parameter DATA_WIDTH_WMEMORY   = 64;
  parameter DATA_WIDTH_FIFO_IN   = 64;
  parameter DATA_WIDTH_FIFO_OUT  = 64;
  parameter MAX_BOARD_DSP        = 220; 
  
      dtpu_core
     #(.DATA_WIDTH_MAC(DATA_WIDTH_MAC),
         .ROWS(ROWS) ,
         .COLUMNS(COLUMNS),
         .SIZE_WMEMORY(SIZE_WMEMORY),
         .SIZE_CSR(SIZE_CSR),
         .DATA_WIDTH_CSR(DATA_WIDTH_CSR),
         .DATA_WIDTH_WMEMORY(DATA_WIDTH_WMEMORY),
         .DATA_WIDTH_FIFO_IN(DATA_WIDTH_FIFO_IN),
         .DATA_WIDTH_FIFO_OUT(DATA_WIDTH_FIFO_OUT),
         .ADDRESS_SIZE_CSR(ADDRESS_SIZE_CSR),
         .ADDRESS_SIZE_WMEMORY(ADDRESS_SIZE_WMEMORY),
         .MAX_BOARD_DSP(MAX_BOARD_DSP)
         ) uut_8x8
     (
        .clk(clk),
        .aresetn(reset),
        .test_mode(test_mode),
        .enable(enable),
        ////////////////////////////
        ////// CSR INTERFACE ///////
        ////////////////////////////
        .csr_address(csr_address),
        .csr_clk(csr_clk),
        .csr_din(csr_din),
        .csr_dout(csr_dout),
        .csr_ce(csr_ce),
        .csr_reset(csr_reset),
        .csr_we(csr_we),
        ////////////////////////////
        ////// WEIGHT MEMORY ///////
        ///////////////////////////
        .wm_address(wm_address),
        .wm_clk(wm_clk),
        .wm_din(wm_din),
        .wm_dout(wm_dout),
        .wm_ce(wm_ce),
        .wm_reset(wm_reset),
        .wm_we(wm_we),
        ////////////////////////////////////////////
        /////////// INPUT DATA FIFO ////////////////
        ////////////////////////////////////////////
        /////////// using stream axi 
        .infifo_is_empty(infifo_is_empty),
        .infifo_dout(infifo_dout),
        .infifo_read(infifo_read),
        ////////////////////////////////////////////
        /////////// OUTPUT DATA FIFO ///////////////
        ////////////////////////////////////////////
        /////////// using stream axi 
        .outfifo_is_full(outfifo_is_full),
        .outfifo_din(outfifo_din),
        .outfifo_write(outfifo_write),
        ////////////////////////////////////////////
        /////////// CONTROL FROM/TO PS ////////////////
        ////////////////////////////////////////////
        .cs_continue(cs_continue),
        .cs_done(cs_done),
        .cs_idle(cs_idle),
        .cs_ready(cs_ready),
        .cs_start(cs_start),
        .state(state),
        .d_out(precision)
        
        
        );

 dtpu_core
     #(.DATA_WIDTH_MAC(DATA_WIDTH_MAC),
         .ROWS(16) ,
         .COLUMNS(16),
         .SIZE_WMEMORY(SIZE_WMEMORY),
         .SIZE_CSR(SIZE_CSR),
         .DATA_WIDTH_CSR(DATA_WIDTH_CSR),
         .DATA_WIDTH_WMEMORY(DATA_WIDTH_WMEMORY),
         .DATA_WIDTH_FIFO_IN(DATA_WIDTH_FIFO_IN),
         .DATA_WIDTH_FIFO_OUT(DATA_WIDTH_FIFO_OUT),
         .ADDRESS_SIZE_CSR(ADDRESS_SIZE_CSR),
         .ADDRESS_SIZE_WMEMORY(ADDRESS_SIZE_WMEMORY),
         .MAX_BOARD_DSP(MAX_BOARD_DSP)
         ) uut_16x16
     (
        .clk(clk),
        .aresetn(reset),
        .test_mode(test_mode),
        .enable(enable_16x16),
        ////////////////////////////
        ////// CSR INTERFACE ///////
        ////////////////////////////
        .csr_address(csr_address),
        .csr_clk(csr_clk),
        .csr_din(csr_din),
        .csr_dout(csr_dout),
        .csr_ce(csr_ce),
        .csr_reset(csr_reset),
        .csr_we(csr_we),
        ////////////////////////////
        ////// WEIGHT MEMORY ///////
        ///////////////////////////
        .wm_address(wm_address),
        .wm_clk(wm_clk),
        .wm_din(wm_din),
        .wm_dout(wm_dout),
        .wm_ce(wm_ce),
        .wm_reset(wm_reset),
        .wm_we(wm_we),
        ////////////////////////////////////////////
        /////////// INPUT DATA FIFO ////////////////
        ////////////////////////////////////////////
        /////////// using stream axi 
        .infifo_is_empty(infifo_is_empty),
        .infifo_dout(infifo_dout),
        .infifo_read(infifo_read),
        ////////////////////////////////////////////
        /////////// OUTPUT DATA FIFO ///////////////
        ////////////////////////////////////////////
        /////////// using stream axi 
        .outfifo_is_full(outfifo_is_full),
        .outfifo_din(outfifo_din_16x16),
        .outfifo_write(outfifo_write_16x16),
        ////////////////////////////////////////////
        /////////// CONTROL FROM/TO PS ////////////////
        ////////////////////////////////////////////
        .cs_continue(cs_continue),
        .cs_done(cs_done),
        .cs_idle(cs_idle),
        .cs_ready(cs_ready),
        .cs_start(cs_start),
        .state(state_16x16),
        .d_out(precision_16x16)
        
        
        );

logic [3:0]precision_16x16;
logic [3:0] state_16x16;
logic outfifo_write_16x16;
logic [63:0] outfifo_write_16x16;
logic enable_16x16;
  initial begin: clk_process
    clk = '0;
    forever #(clk_period/2) clk = ~clk;
  end // clk_process


initial begin 
// static initialization of weight memory and csr

wm_dout=0;
csr_dout=0;

for(i=1;i<32;i=i+1)begin
data[i-1]= ((i%16)<<56)|((i%16)<<48)| ((i%16)<<40)|((i%16)<<32)|((i%16)<<24)| ((i%16)<<16)|((i%16)<<8)| (i%16) ;
end
i=0;
end 



// fake in fifo
always @(infifo_read) begin 
if (infifo_read) begin
   infifo_dout<=data[i%16];
   i=i+1;
end else begin
infifo_dout<=0;
end
end


        // fake csr memory process
always @(posedge(clk) )begin 
if(csr_ce) begin 
  case(csr_address)
    `A_ARITHMETIC_PRECISION:
        csr_dout={56'b0,data_precision_tb};
    `A_FP_MODE:
        csr_dout={56'b0,data_precision_fp_tb};
    default:
      csr_dout=56'd0;
  endcase
  end else begin 
  csr_dout=56'b0;
  end 
end
// fake memory weight
always @(posedge(clk)) begin 
  if(wm_ce) begin
    case (wm_address)
        0: wm_dout= {8{8'h11}};
        1: wm_dout= {8{8'h22}};
        2:wm_dout= {8{8'h33}};
        3:wm_dout= {8{8'h44}};
        4:wm_dout= {8{8'h55}};
        5:wm_dout= {8{8'h66}};
        6:wm_dout= {8{8'h77}};
        7:wm_dout= {8{8'h88}};
      default : 
        wm_dout={8{8'hFF}};
    endcase
  end 
end
              

  // control unit states
localparam Power_up = 4'h0;
localparam idle = 4'h1;
localparam compute = 4'h2;
localparam done = 4'h3;
localparam request_data=4'h4;
localparam save_to_fifo=4'h5;
localparam start_p1=4'h6;
localparam start_p2=4'h7;
localparam start_p3=4'h8;
localparam get_data=4'h9;


          
            // stimulus 
              initial begin 

              $display("global reset");
                reset=1'b0;
                enable_16x16='0;
                #clk_period;
                `ifdef USEO_INT8
                $display("starting test for dtpu core 8 bit integer on 8x8 mxu");
                data_precision_tb=`INT8; // 8 bit integer
                `elsif USEO_INT16
                $display("starting test for dtpu core 16 bit integer on 8x8 mxu");
                data_precision_tb=`INT16; // 16 bit integer
                `elsif USEO_INT32
                $display("starting test for dtpu core 32 bit integer on 8x8 mxu");
                data_precision_tb=`INT32; // 32 bit integer
                `else // USEO_INT64 use all 64 bit
                $display("starting test for dtpu core 64 bit integer on 8x8 mxu");
                data_precision_tb=`INT64; // 64 bit integer
                `endif
              

              if(state!=Power_up ) begin 
                $display("after reset not in power up state");
                $stop();
              end 
              #clk_period;
              reset=1'b1;
              enable=1'b1; // enable the accelerator
              #clk_period;
              if(state!=idle) begin
                $display("dtpu not in idle state");
                $stop();
              end 
              $display("stimulus for dtpu mxu 8x8");
              
              data_precision_fp_tb=4'h0; // no fp
              infifo_is_empty=1'b1;
              //infifo_dout=64'hCAFECAFECAFECAFE;
              outfifo_is_full=1'b1;
              cs_continue=1'b0;
              cs_start=1'b1;
              $display("check the control signal");
              #clk_period;
              if(state!=start_p1  && csr_address!=`A_ARITHMETIC_PRECISION) begin
                $display("not phase 1");
                $stop();
              end 
              #clk_period;
              `ifdef USEO_INT8
              if(state!=start_p2  && csr_dout!=`INT8  && csr_address!=`A_FP_MODE) begin
                $display("not phase 2");
                $stop();
              end 
              #clk_period; 
              if(state!=start_p3 && cs_ready!=1'b1 && precision!=`INT8) begin
                $display("not phase 3 , check precisions no int 8");
                $stop();
              end 

              `elsif USEO_INT16 
              if(state!=start_p2  && csr_dout!=`INT16  && csr_address!=`A_FP_MODE) begin
                $display("not phase 2");
                $stop();
              end 
              #clk_period; 
              if(state!=start_p3 && cs_ready!=1'b1 && precision!=`INT16) begin
                $display("not phase 3 , check precisions no int 16");
                $stop();
              end 

              `elsif USEO_INT32
              if(state!=start_p2  && csr_dout!=`INT32  && csr_address!=`A_FP_MODE) begin
                $display("not phase 2");
                $stop();
              end 
              #clk_period; 
              if(state!=start_p3 && cs_ready!=1'b1 && precision!=`INT32) begin
                $display("not phase 3 , check precisions no int 32");
                $stop();
              end 

              `else // USEO_INT64
             if(state!=start_p2  && csr_dout!=`INT64  && csr_address!=`A_FP_MODE) begin
                $display("not phase 2");
                $stop();
              end 
              #clk_period; 
              if(state!=start_p3 && cs_ready!=1'b1 && precision!=`INT64) begin
                $display("not phase 3 , check precisions no int 64");
                $stop();
              end 

              `endif

              #clk_period;
              if(state!=request_data) begin 
                $display("accelerator is not retrieving the first chunk of data",);
                $stop();
              end
              cs_start=1'b0;
              #clk_period;
              if(state!=get_data)begin
                $display("accelerator not getting data");
                $stop();
              end
              #clk_period;
              if(state!=compute) begin
                $display("accelerator is not computing anything",);
              end   

              `ifndef PIPELINE
              for (k=0;k<3*(8+1)+8*2+1;k=k+1) begin
              #clk_period;               
              end 
              `else 

              `endif
              
              
              if(state!=save_to_fifo) begin
                $display("not saving to fifo ",);
                $stop();
              end
              
              #clk_period;
              
              if(state!=done && cs_done!=1'b0) begin 
                $display("accelerator not in continous run ");
                $stop();
              end
              `ifdef USEO_INT8
                if(!(outfifo_din=={8{8'h88}}))begin
                  $display("computation not correct!!!!");
                  $stop();
              end
              `elsif USEO_INT16
              // two output have to be checked
                if(!(outfifo_din=={4{16'h88}}))begin
                  $display("computation  1 not correct bit 16 !!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={4{16'h88}}))begin
                  $display("computation 2 not correct 16 bit!!!!");
                  $stop();
              end
              `elsif USEO_INT32
              // 4 output have to be checked
              if(!(outfifo_din=={2{32'h88}}))begin
                  $display("computation1  not correct bit 32!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={2{32'h88}}))begin
                  $display("computation2 not correct 32 bit!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={2{32'h88}}))begin
                  $display("computation 3not correct bit 32!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={2{32'h88}}))begin
                  $display("computation 4 not correct 32 bit!!!!");
                  $stop();
              end

              `else // USEO_INT64 use all 64 bit
              // 8 output have to be checked
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation1  not correct bit 64!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation2 not correct 64 bit!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation 3not correct bit 64!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation 4 not correct 64 bit!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation 5  not correct bit 64!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation6 not correct 64 bit!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation 7not correct bit 64!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation 8 not correct 64 bit!!!!");
                  $stop();
              end
              `endif
              

              #clk_period;
                if(state!=request_data && !(wm_address==32'd1)) begin 
                $display("generated wrong address and not in retrieve data state");
                $stop();
                end
            // infifo_dout=64'h11111111111111111;
              #clk_period;
              if(state!=get_data)begin
                $display("accelerator not in get data");
                $stop();
              end
              #clk_period;
              if(state!=compute) begin
                $display("accelerator is not computing anything",);
                $stop();
              end   
              `ifndef PIPELINE
              for (k=0;k<3*(8+1)+8*2+1;k=k+1) begin
              #clk_period;               
              end 
              `else 

              `endif
              
              if(state!=save_to_fifo) begin
                $display("not saving to fifo ",);
                $stop();
              end
              #clk_period;
              if(state!=done && cs_done!=1'b0) begin 
                $display("accelerator not in continous run ");
                $stop();
              end
              $display("----- data check ----");
             `ifdef USEO_INT8
                if(!(outfifo_din=={8{8'h88}}))begin
                  $display("computation not correct!!!!");
                  $stop();
              end
              `elsif USEO_INT16
              // two output have to be checked
                if(!(outfifo_din=={4{16'h88}}))begin
                  $display("computation  1 not correct bit 16 !!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={4{16'h88}}))begin
                  $display("computation 2 not correct 16 bit!!!!");
                  $stop();
              end
              `elsif USEO_INT32
              // 4 output have to be checked
              if(!(outfifo_din=={2{32'h88}}))begin
                  $display("computation1  not correct bit 32!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={2{32'h88}}))begin
                  $display("computation2 not correct 32 bit!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={2{32'h88}}))begin
                  $display("computation 3not correct bit 32!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={2{32'h88}}))begin
                  $display("computation 4 not correct 32 bit!!!!");
                  $stop();
              end

              `else // USEO_INT64 use all 64 bit
              // 8 output have to be checked
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation1  not correct bit 64!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation2 not correct 64 bit!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation 3not correct bit 64!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation 4 not correct 64 bit!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation 5  not correct bit 64!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation6 not correct 64 bit!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation 7not correct bit 64!!!!");
                  $stop();
              end
              #clk_period;
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation 8 not correct 64 bit!!!!");
                  $stop();
              end
              `endif

              if(state!=request_data && !(wm_address==32'd2)) begin 
              $display("generated wrong address and not in retrieve data state");
              $stop();
              end
              #clk_period;
              if(state!=get_data) begin
                $display("accelerator not in get data");
                $stop();
              end
              #clk_period;
              if(state!=compute) begin
                $display("accelerator is not computing anything");
              end   

              `ifndef 
              for (k=0;k<3*(8+1)+8*2+1;k=k+1) begin
              #clk_period;               
              end 
              `else 
              `endif
              

              outfifo_is_full=1'b0;
              infifo_is_empty=1'b0;
              if(state!=save_to_fifo) begin
                $display("not saving to fifo ",);
                $stop();
              end
              #clk_period;
              if(state!=done && cs_done!=1'b1) begin 
                $display("not in done state and done signal is not asserted",);
                $stop();
              end
              $display("----- data check ------");
              `ifdef USEO_INT8
              if((outfifo_din=={8{8'h00}}))begin
                  $display("computation not correct!!!!");
                  $stop();
              end
              `elsif USEO_INT16
              // two output have to be checked
              if((outfifo_din=={4{16'h00}}))begin
                  $display("computation  1 not correct bit 16 !!!!");
                  $stop();
              end
              #clk_period;
              if((outfifo_din=={4{16'h00}}))begin
                  $display("computation 2 not correct 16 bit!!!!");
                  $stop();
              end
              `elsif USEO_INT32
              // 4 output have to be checked
              if((outfifo_din=={2{32'h00}}))begin
                  $display("computation1  not correct bit 32!!!!");
                  $stop();
              end
              #clk_period;
              if((outfifo_din=={2{32'h00}}))begin
                  $display("computation2 not correct 32 bit!!!!");
                  $stop();
              end
              #clk_period;
              if((outfifo_din=={2{32'h00}}))begin
                  $display("computation 3not correct bit 32!!!!");
                  $stop();
              end
              #clk_period;
              if((outfifo_din=={2{32'h00}}))begin
                  $display("computation 4 not correct 32 bit!!!!");
                  $stop();
              end

              `else // USEO_INT64 use all 64 bit
              // 8 output have to be checked
              if((outfifo_din=={1{64'h00}}))begin
                  $display("computation1  not correct bit 64!!!!");
                  $stop();
              end
              #clk_period;
              if((outfifo_din=={1{64'h00}}))begin
                  $display("computation2 not correct 64 bit!!!!");
                  $stop();
              end
              #clk_period;
              if((outfifo_din=={1{64'h00}}))begin
                  $display("computation 3not correct bit 64!!!!");
                  $stop();
              end
              #clk_period;
              if((outfifo_din=={1{64'h00}}))begin
                  $display("computation 4 not correct 64 bit!!!!");
                  $stop();
              end
              #clk_period;
              if((outfifo_din=={1{64'h00}}))begin
                  $display("computation 5  not correct bit 64!!!!");
                  $stop();
              end
              #clk_period;
              if((outfifo_din=={1{64'h00}}))begin
                  $display("computation6 not correct 64 bit!!!!");
                  $stop();
              end
              #clk_period;
              if((outfifo_din=={1{64'h00}}))begin
                  $display("computation 7not correct bit 64!!!!");
                  $stop();
              end
              #clk_period;
              if((outfifo_din=={1{64'h00}}))begin
                  $display("computation 8 not correct 64 bit!!!!");
                  $stop();
              end
              `endif
              #clk_period;
              if(state!=idle) begin
                $display("problem fsm does not go back in idle state");
                $stop();
              end
              $display("dtpu with mxu 8x8 test ended");
              #clk_period;  #clk_period;  #clk_period;

              $display("testing dtpu 16x16 mxu matrix",);
              enable_16x16='1;
              #clk_period;
              reset='0;
              `ifdef USEO_INT8
              $display("starting test for dtpu core 8 bit integer on 16x16 mxu");
              data_precision_tb=`INT8; // 8 bit integer
              `elsif USEO_INT16
              $display("starting test for dtpu core 16 bit integer on 16x16 mxu");
              data_precision_tb=`INT16; // 16 bit integer
              `elsif USEO_INT32
              $display("starting test for dtpu core 32 bit integer on 16x16 mxu");
              data_precision_tb=`INT32; // 32 bit integer
              `else // USEO_INT64 use all 64 bit
              $display("starting test for dtpu core 64 bit integer on 16x16 mxu");
              data_precision_tb=`INT64; // 64 bit integer
              `endif
              if(state!=Power_up ) begin 
                $display("after reset not in power up state mxu16x16");
                $stop();
              end 
              #clk_period;
              reset=1'b1;
              enable=1'b1; // enable the accelerator
              #clk_period;
              if(state!=idle) begin
                $display("dtpu not in idle state mxu16x16");
                $stop();
              end 
              $display("stimulus for dtpu mxu mxu16x16");
              
              data_precision_fp_tb=4'h0; // no fp
              infifo_is_empty=1'b1;
              //infifo_dout=64'hCAFECAFECAFECAFE;
              outfifo_is_full=1'b1;
              cs_continue=1'b0;
              cs_start=1'b1;
              $display("check the control signal mxu16x16");
              #clk_period;
              if(state!=start_p1  && csr_address!=`A_ARITHMETIC_PRECISION) begin
                $display("not phase 1 mxu16x16");
                $stop();
              end 
              #clk_period;
              `ifdef USEO_INT8
              if(state!=start_p2  && csr_dout!=`INT8  && csr_address!=`A_FP_MODE) begin
                $display("not phase 2 mxu16x16" );
                $stop();
              end 
              #clk_period; 
              if(state!=start_p3 && cs_ready!=1'b1 && precision!=`INT8) begin
                $display("not phase 3 , check precisions no int 8 mxu16x16");
                $stop();
              end 

              `elsif USEO_INT16 
              if(state!=start_p2  && csr_dout!=`INT16  && csr_address!=`A_FP_MODE) begin
                $display("not phase 2 mxu16x16");
                $stop();
              end 
              #clk_period; 
              if(state!=start_p3 && cs_ready!=1'b1 && precision!=`INT16) begin
                $display("not phase 3 , check precisions no int 16 mxu16x16");
                $stop();
              end 

              `elsif USEO_INT32
              if(state!=start_p2  && csr_dout!=`INT32  && csr_address!=`A_FP_MODE) begin
                $display("not phase 2");
                $stop();
              end 
              #clk_period; 
              if(state!=start_p3 && cs_ready!=1'b1 && precision!=`INT32) begin
                $display("not phase 3 , check precisions no int 32 mxu16x16");
                $stop();
              end 

              `else // USEO_INT64
             if(state!=start_p2  && csr_dout!=`INT64  && csr_address!=`A_FP_MODE) begin
                $display("not phase 2 mxu16x16");
                $stop();
              end 
              #clk_period; 
              if(state!=start_p3 && cs_ready!=1'b1 && precision!=`INT64) begin
                $display("not phase 3 , check precisions no int 64 mxu16x16");
                $stop();
              end 

              `endif

              #clk_period;
              if(state!=request_data) begin 
                $display("accelerator is not retrieving the first chunk of data mxu16x16",);
                $stop();
              end
              cs_start=1'b0;
              #clk_period;
              if(state!=get_data)begin
                $display("accelerator not getting data mxu16x16");
                $stop();
              end
              #clk_period;
              if(state!=compute) begin
                $display("accelerator is not computing anything mxu16x16",);
              end   

              `ifndef PIPELINE
              for (k=0;k<3*(16+1)+16*2+1;k=k+1) begin
              #clk_period;               
              end 
              `else 

              `endif
              
              
              if(state!=save_to_fifo) begin
                $display("not saving to fifo mxu16x16",);
                $stop();
              end
              
              #clk_period;
              
              if(state!=done && cs_done!=1'b0) begin 
                $display("accelerator not in continous run mxu16x16");
                $stop();
              end
              `ifdef USEO_INT8
              //  number of saved output is rows/(data_width_fifo_out/8) -> 2
              for(i=0;i<16/(DATA_WIDTH_FIFO_OUT/8);i=i+1) begin
                if(!(outfifo_din=={8{8'h88}}))begin
                  $display("computation not correct %d 8 bit mxu16x16!!!!",i);
                  $stop();
              end
              #clk_period;
              end 
                
              `elsif USEO_INT16
              for(i=0;i<16/(DATA_WIDTH_FIFO_OUT/16);i=i+1) begin
                if(!(outfifo_din=={4{16'h88}}))begin
                  $display("computation  %d not correct bit 16 mxu16x16!!!!",i);
                  $stop();
              end
              #clk_period;
              end 

              `elsif USEO_INT32
              for(i=0;i<16/(DATA_WIDTH_FIFO_OUT/32);i=i+1) begin
              if(!(outfifo_din=={2{32'h88}}))begin
                  $display("computation  %d not correct bit 32 mxu16x16!!!!",i);
                  $stop();
              end
              #clk_period;
              end 
              `else // USEO_INT64 use all 64 bit
              for(i=0;i<16/(DATA_WIDTH_FIFO_OUT/64);i=i+1) begin
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation  %d not correct bit 64 mxu16x16!!!!",i);
                  $stop();
              end
              #clk_period;
              end 
              `endif
              

              #clk_period;
                if(state!=request_data && !(wm_address==32'd1)) begin 
                $display("generated wrong address and not in retrieve data state");
                $stop();
                end
            // infifo_dout=64'h11111111111111111;
              #clk_period;
              if(state!=get_data)begin
                $display("accelerator not in get data");
                $stop();
              end
              #clk_period;
              if(state!=compute) begin
                $display("accelerator is not computing anything",);
                $stop();
              end   
              `ifndef PIPELINE
              for (k=0;k<3*(8+1)+8*2+1;k=k+1) begin
              #clk_period;               
              end 
              `else 

              `endif
              
              if(state!=save_to_fifo) begin
                $display("not saving to fifo ",);
                $stop();
              end
              #clk_period;
              if(state!=done && cs_done!=1'b0) begin 
                $display("accelerator not in continous run ");
                $stop();
              end
              $display("----- data check ----");
                          `ifdef USEO_INT8
              //  number of saved output is rows/(data_width_fifo_out/8) -> 2
              for(i=0;i<16/(DATA_WIDTH_FIFO_OUT/8);i=i+1) begin
                if(!(outfifo_din=={8{8'h88}}))begin
                  $display("computation not correct %d 8 bit mxu16x16!!!!",i);
                  $stop();
              end
              #clk_period;
              end 
                
              `elsif USEO_INT16
              for(i=0;i<16/(DATA_WIDTH_FIFO_OUT/16);i=i+1) begin
                if(!(outfifo_din=={4{16'h88}}))begin
                  $display("computation  %d not correct bit 16 mxu16x16!!!!",i);
                  $stop();
              end
              #clk_period;
              end 

              `elsif USEO_INT32
              for(i=0;i<16/(DATA_WIDTH_FIFO_OUT/32);i=i+1) begin
              if(!(outfifo_din=={2{32'h88}}))begin
                  $display("computation  %d not correct bit 32 mxu16x16!!!!",i);
                  $stop();
              end
              #clk_period;
              end 
              `else // USEO_INT64 use all 64 bit
              for(i=0;i<16/(DATA_WIDTH_FIFO_OUT/64);i=i+1) begin
              if(!(outfifo_din=={1{64'h88}}))begin
                  $display("computation  %d not correct bit 64 mxu16x16!!!!",i);
                  $stop();
              end
              #clk_period;
              end 
              `endif
              
              if(state!=request_data && !(wm_address==32'd2)) begin 
              $display("generated wrong address and not in retrieve data state");
              $stop();
              end
              #clk_period;
              if(state!=get_data) begin
                $display("accelerator not in get data");
                $stop();
              end
              #clk_period;
              if(state!=compute) begin
                $display("accelerator is not computing anything");
              end   

              `ifndef 
              for (k=0;k<3*(8+1)+8*2+1;k=k+1) begin
              #clk_period;               
              end 
              `else 
              `endif
              

              outfifo_is_full=1'b0;
              infifo_is_empty=1'b0;
              if(state!=save_to_fifo) begin
                $display("not saving to fifo ",);
                $stop();
              end
              #clk_period;
              if(state!=done && cs_done!=1'b1) begin 
                $display("not in done state and done signal is not asserted",);
                $stop();
              end
              $display("----- data check ------");
              `ifdef USEO_INT8
              //  number of saved output is rows/(data_width_fifo_out/8) -> 2
              for(i=0;i<16/(DATA_WIDTH_FIFO_OUT/8);i=i+1) begin
              if((outfifo_din=={8{8'h00}}))begin
                  $display("computation not correct %d 8 bit mxu16x16!!!!",i);
                  $stop();
              end
              #clk_period;
              end 
                
              `elsif USEO_INT16
              for(i=0;i<16/(DATA_WIDTH_FIFO_OUT/16);i=i+1) begin
              if((outfifo_din=={4{16'h00}}))begin
                  $display("computation  %d not correct bit 16 mxu16x16!!!!",i);
                  $stop();
              end
              #clk_period;
              end 

              `elsif USEO_INT32
              for(i=0;i<16/(DATA_WIDTH_FIFO_OUT/32);i=i+1) begin
              if((outfifo_din=={2{32'h00}}))begin
                  $display("computation  %d not correct bit 32 mxu16x16!!!!",i);
                  $stop();
              end
              #clk_period;
              end 
              `else // USEO_INT64 use all 64 bit
              for(i=0;i<16/(DATA_WIDTH_FIFO_OUT/64);i=i+1) begin
              if((outfifo_din=={1{64'h00}}))begin
                  $display("computation  %d not correct bit 64 mxu16x16!!!!",i);
                  $stop();
              end
              #clk_period;
              end 
              `endif
              
              #clk_period;
              if(state!=idle) begin
                $display("problem fsm does not go back in idle state");
                $stop();
              end
              #clk_period;  #clk_period;  #clk_period;
              $display("dtpu with mxu 16x16 test ended");

              // floating point test




                $display("if you are seeing this message the simulation has gone well!");
                $finish();
                end     
endmodule



