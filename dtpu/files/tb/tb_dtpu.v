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


module tb_dtpu();
        parameter clk_period= 10;
              reg clk,reset;
              reg enable;
              wire test_mode;
              integer k;
  
                       ////////////////////////////
                       ////// CSR INTERFACE ///////
                       ////////////////////////////
                        wire [31:0]csr_address;
                       wire csr_clk;
                       wire [7:0]csr_din;
                       reg [7:0]csr_dout;
                       wire csr_ce;
                       wire csr_reset;
                       wire csr_we;
                       ////////////////////////////
                       ////// WEIGHT MEMORY ///////
                       ///////////////////////////
                       wire [31:0]wm_address;
                       wire wm_clk;
                       wire [63:0]wm_din;
                       reg [63:0] wm_dout;
                        wire wm_ce;
                        wire wm_reset;
                        wire wm_we;
                           ////////////////////////////////////////////
                           /////////// INPUT DATA FIFO ////////////////
                           ////////////////////////////////////////////
                           /////////// using stream axi 
                           reg infifo_is_empty;
                           reg [63:0]infifo_dout;
                           wire infifo_read;
                           ////////////////////////////////////////////
                           /////////// OUTPUT DATA FIFO ///////////////
                           ////////////////////////////////////////////
                           /////////// using stream axi 
                           reg outfifo_is_full;
                           wire [63:0]outfifo_din;
                           wire outfifo_write;
                           
                           ////////////////////////////////////////////
                           /////////// CONTROL FROM/TO PS ////////////////
                           ////////////////////////////////////////////
                           reg cs_continue;
                           wire cs_done;
                           wire cs_idle;
                           wire cs_ready;
                           reg cs_start;
                           
                           wire[3:0]state;
    
    
    /////////////////////////////////////
    `define SIMULATION 1
    `define VIVADO_MAC SIMULATION
     /////////////////////////////////////
     
      
      dtpu_core
     #(.DATA_WIDTH_MAC(4),
         .ROWS(3) ,
         .COLUMNS(3),
         .SIZE_WMEMORY(8196),
         .SIZE_CSR(1024),
         .DATA_WIDTH_CSR(8),
         .DATA_WIDTH_WMEMORY(64),
         .DATA_WIDTH_FIFO_IN(64),
         .DATA_WIDTH_FIFO_OUT(64)
         ) uut
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
             .state(state)
             
             );

                    always begin
                       clk = 1'b1;
                       #(clk_period/2) 
                       clk = 1'b0;
                       #(clk_period/2);
                    end
              

            // stimulus 
              initial begin 
              // test vector 
                 csr_dout=1'b1;
                    wm_dout=64'hFFFFFFFFFFFFFFFF;
                   infifo_is_empty=1'b0;
                   infifo_dout=64'hCAFECAFECAFECAFE;
                    outfifo_is_full=1'b0;
                    cs_continue=1'b0;
                reset=1'b0;
                #clk_period;
                #clk_period;
                reset=1'b1;
                enable=1'b1; // enable the accelerator
                $display("check the control signal");
                #clk_period; 
                #clk_period;
                #clk_period;
                #clk_period;
                #clk_period;
                #clk_period;
                #clk_period;
                $display("starting operations");
                cs_start=1'b1;
                #clk_period;
                for (k=0;k<50;k=k+1) begin
                #clk_period;
                end
                
                
                $finish;
                              
              end 

        
        
        
        
            
endmodule
