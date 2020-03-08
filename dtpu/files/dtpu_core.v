`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2020 17:21:18
// Design Name: 
// Module Name: dtpu
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


`include "precision_def.vh"

module dtpu_core
#(parameter DATA_WIDTH_MAC=4,
    ROWS=3 ,
    COLUMNS=3,
    SIZE_WMEMORY=8196,
    SIZE_CSR=1024,
    DATA_WIDTH_CSR=8,
    DATA_WIDTH_WMEMORY=64,
    DATA_WIDTH_FIFO_IN=64,
    DATA_WIDTH_FIFO_OUT=64
    )
(
    clk,
    reset,
    test_mode,
    enable,
    ////////////////////////////
    ////// CSR INTERFACE ///////
    ////////////////////////////
    csr_address,
    csr_clk,
    csr_din,
    csr_dout,
    csr_ce,
    csr_reset,
    csr_we,
    ////////////////////////////
    ////// WEIGHT MEMORY ///////
    ///////////////////////////
    wm_address,
      wm_clk,
        wm_din,
        wm_dout,
        wm_ce,
        wm_reset,
        wm_we,
        ////////////////////////////////////////////
        /////////// INPUT DATA FIFO ////////////////
        ////////////////////////////////////////////
        /////////// using stream axi 
        infifo_is_empty,
        infifo_dout,
        infifo_read,
        
        ////////////////////////////////////////////
        /////////// OUTPUT DATA FIFO ///////////////
        ////////////////////////////////////////////
        /////////// using stream axi 
        outfifo_is_full,
        outfifo_din,
        outfifo_write,
        
        
        
        ////////////////////////////////////////////
        /////////// CONTROL FROM/TO PS ////////////////
        ////////////////////////////////////////////
        cs_continue,
        cs_done,
        cs_idle,
        cs_ready,
        cs_start
        
        );
    //////////////////////////////////////////
    ///************************************///
    ///// --------- Cogitantium -------- /////
    ///// the dumb tensor processing unit ////
    ///************************************///
    //////////////////////////////////////////
    input wire clk;
    input wire reset;
    input wire test_mode;
    input wire enable;
    
    ////////////////////////////
    ////// CSR INTERFACE ///////
    ////////////////////////////
      (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC no,MEM_WIDTH 8,MEM_SIZE 1024 " *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface EN" *)
        output wire         csr_ce;
              (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DOUT" *)
        input wire [7:0]    csr_dout;
              (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DIN" *)
        output wire [7:0]   csr_din;
              (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface WE" *)
        output wire         csr_we;
              (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *)
        output wire [31:0]    csr_address;
              (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface CLK" *)
        output wire           csr_clk;
              (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface RST" *)
        output wire         csr_reset;
        ////////////////////////////
        ////// WEIGHT MEMORY ///////
        ///////////////////////////
      (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC no,MEM_WIDTH 64,MEM_SIZE 8192 " *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface EN" *)
       output wire  wm_ce;
          (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *)
         input wire [63:0]       wm_dout;
          (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *)
        output wire [63:0]       wm_din;
          (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface WE" *)
                 output wire              wm_we;
          (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *)
        output wire [31:0]  wm_address;
          (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface CLK" *)
      output wire    wm_clk;
          (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface RST" *)
          output wire           wm_reset;
            ////////////////////////////////////////////
            /////////// INPUT DATA FIFO ////////
            ////////////////////////////////////////////
            /////////// using stream axi 
            (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *)
            input wire [63:0] infifo_dout;
              (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_EN" *)
            output wire infifo_read; 
              (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo EMPTY_N" *)
            input wire infifo_is_empty;
            
              
            ////////////////////////////////////////////
            /////////// OUTPUT DATA FIFO ///////////////
            ////////////////////////////////////////////
            /////////// using stream axi 
            (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *)
            output wire [63:0] outfifo_din;
              (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_EN" *)
            output wire outfifo_write;
              (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo FULL_N" *)
            input wire outfifo_is_full;
            
            ////////////////////////////////////////////
            /////////// CONTROL FROM/TO PS /////////////
            //////////////////////////////////////////// 
             (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_start" *)
            input wire cs_start;
             (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_ready" *)
            output wire cs_ready;
             (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_done" *)
            output wire cs_done;
             (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_continue" *)
            input wire cs_continue;
             (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_idle" *)
            output wire cs_idle;
            
     ////////////////////////////////////////////
    ////// MATRIX MULTIPLICATION UNIT //////////
    ////////////////////////////////////////////
   mxu_wrapper
    #(.M(ROWS), // matrix row -> weights
        .K(COLUMNS), // matrix columsn -> input data
        .max_data_width(DATA_WIDTH_MAC)// it must be a divisor of 64
        ) engine  (   
            .data_type(data_type),
            .reset(reset),
            .clk(clk),
            .enable(enable_i),
            .test_mode(test_mode),
            .input_data(input_data_from_fifo),
            .weight(weight_from_memory),
            .y(input_data_to_fifo)
        );
        
    //////////////////////////////////////////////
    ///////////// CONTROL UNIT ///////////////////
    ////////////////////////////////////////////// 
    control_unit #( .DATA_WIDTH_FIFO_IN(DATA_WIDTH_FIFO_IN),
                .DATA_WIDTH_FIFO_OUT(DATA_WIDTH_FIFO_OUT), 
                .DATA_WIDTH_WMEMORY(DATA_WIDTH_WMEMORY),
                .DATA_WIDTH_CSR(DATA_WIDTH_CSR),
                .ADDRESS_SIZE_CSR($cog2(SIZE_CSR)),
                .ADDRESS_SIZE_WMEMORY($clog2(SIZE_WMEMORY)))cu(
        .clk(clk),
        .reset(reset),
        .test_mode(test_mode),
       .csr_address(csr_address),               
        .csr_din(csr_din),
        .csr_dout(csr_dout),
        .csr_ce(csr_ce),
        .csr_reset(csr_reset),
        .csr_we(csr_we),
        .wm_address(wm_adress),
        .wm_din(wm_din),
        .wm_dout(wm_dout),
        .wm_ce(wm_ce),
        .wm_reset(wm_reset),
        .wm_we(wm_we),
        .infifo_is_empty(infifo_is_empty),
        .infifo_dout(infifo_dout),
        .infifo_read(infifo_read),
        .outfifo_is_full(outfifo_is_full),
        .outfifo_din(outfifo_din),
        .outfifo_write(outfifo_write),
        .cs_continue(cs_continue),
        .cs_done(cs_done),
        .cs_idle(cs_idle),
        .cs_ready(cs_ready),
        .cs_start(cs_start)
                       
           );
  
  /////////////////////////////////////////////
  ///////// MUXES FOR DATA SELECTIONS /////////
  /////////////////////////////////////////////
  
    // DATA_WIDTH_FIFO/ DATA_WIDTH ?? 
  
  // same clock for bram interface
  assign csr_clk=clk;
  assign wm_clk=clk;
      
  
endmodule
