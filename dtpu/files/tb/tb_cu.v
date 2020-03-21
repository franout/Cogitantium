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


module tb_cu();
        parameter clk_period= 10;
              reg clk,reset;
                  
                   wire enable_mxu;
                   ////////////////////////////
                   ////// CSR INTERFACE ///////
                   ////////////////////////////
                    wire         csr_ce;
                     reg [8-1:0]    csr_dout;
                    wire         csr_we;
                    wire [32-1:0]    csr_address;
                    wire         csr_reset;
                   ////////////////////////////
                   ////// WEIGHT MEMORY ///////
                   ///////////////////////////
                   wire  wm_ce;
                   wire              wm_we;  
                   wire [32-1:0]  wm_address;
                   wire           wm_reset;
                   ////////////////////////////////////////////
                   /////////// INPUT DATA FIFO ////////////////
                   ////////////////////////////////////////////
                   /////////// using stream axi 
                   wire infifo_read; 
                   reg infifo_is_empty;
                   ////////////////////////////////////////////
                   /////////// OUTPUT DATA FIFO ///////////////
                   ////////////////////////////////////////////
                   /////////// using stream axi 
                   wire outfifo_write;
                   reg outfifo_is_full;
                   ////////////////////////////////////////////
                   /////////// CONTROL FROM/TO PS /////////////
                   ////////////////////////////////////////////             
                   reg cs_start;
                   wire cs_ready;
                   wire cs_done;
                   reg cs_continue;
                   wire cs_idle;

     
     
              integer k;
    
    /////////////////////////////////////
    `define SIMULATION 1
    `define VIVADO_MAC SIMULATION
     /////////////////////////////////////
     
           control_unit 
     #( .DATA_WIDTH_FIFO_IN(64),
        .DATA_WIDTH_FIFO_OUT(64), 
        .DATA_WIDTH_WMEMORY(64),
        .DATA_WIDTH_CSR(8),
        .ADDRESS_SIZE_CSR(32),
        .ROWS(3),
        .COLUMNS(3),
        .ADDRESS_SIZE_WMEMORY(32)) uut 
     (
     .glb_enable(1'b1),
     .clk(clk),
     .reset(reset),
     .enable_mxu(enable_mxu),
     .test_mode(test_mode),
     .csr_address(csr_address),               
     .csr_dout(csr_dout),
     .csr_ce(csr_ce),
     .csr_reset(csr_reset),
     .csr_we(csr_we),
     .wm_address(wm_address),
     .wm_ce(wm_ce),
     .wm_reset(wm_reset),
     .wm_we(wm_we),
     .infifo_is_empty(infifo_is_empty),
     .infifo_read(infifo_read),
     .outfifo_is_full(outfifo_is_full),
     .outfifo_write(outfifo_write),
     .cs_done(cs_done),
     .cs_continue(cs_continue),
     .cs_idle(cs_idle),
     .cs_ready(cs_ready),
     .cs_start(cs_start)
     );
     
              
                    always begin
                       clk = 1'b1;
                       #(clk_period/2) 
                       clk = 1'b0;
                       #(clk_period/2);
                    end
              

              
              initial begin 
              reset=1'b0;
              csr_dout<=8'hFE;
              cs_continue<=1;
              infifo_is_empty=1'b0;
              #clk_period;
              reset=1'b1;
              cs_start=1'b1;
              #clk_period;#clk_period;
              #clk_period;#clk_period;
              #clk_period;#clk_period;
             cs_start=1'b0;

              outfifo_is_full=1'b1;
              // check stall in retriev data
              #clk_period;
              #clk_period;
              #clk_period;
              outfifo_is_full=1'b0;
             #clk_period;
             // i n compute 
             #clk_period;
                 outfifo_is_full=1'b1;
             #clk_period;
             #clk_period;
             #clk_period;     
                 outfifo_is_full=1'b0;
                              #clk_period;
                              #clk_period;     
                       infifo_is_empty=1'b1;
                 #clk_period;
                  #clk_period;
                  // it should be in idle
              end 

        
        
        
        
            
endmodule
