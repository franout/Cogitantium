//==================================================================================================
//  Filename      : dtpu_core.v
//  Created On    : 2020-04-22 17:05:56
//  Last Modified : 2020-05-20 15:03:03
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology,Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com
//
//  Description   : Cogitantium, the dumb tensor processor unit,top level enity of the accelerator
//
//
//==================================================================================================

`timescale 1ns / 1ps
`include "precision_def.vh"

//`define DUMMY 

module dtpu_core
#(parameter DATA_WIDTH_MAC=64,
    ROWS=3 ,
    COLUMNS=3,
    SIZE_WMEMORY=8196,
    ADDRESS_SIZE_WMEMORY=32,
    ADDRESS_SIZE_CSR=32,
    SIZE_CSR=1024,
    DATA_WIDTH_CSR=8,
    DATA_WIDTH_WMEMORY=64,
    DATA_WIDTH_FIFO_IN=64,
    DATA_WIDTH_FIFO_OUT=64,
    MAX_BOARD_DSP=220
    )
(
    input wire clk,
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input wire aresetn,
    input wire test_mode,
    input wire enable,
    
    ////////////////////////////
    ////// CSR INTERFACE ///////
    ////////////////////////////
    (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC no,MEM_WIDTH 8,MEM_SIZE 1024 " *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface EN" *)
    output wire         csr_ce,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DOUT" *)
    input wire [DATA_WIDTH_CSR-1:0]    csr_dout,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DIN" *)
    output wire [DATA_WIDTH_CSR-1:0]   csr_din,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface WE" *)
    output wire         csr_we,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *)
    output wire [ADDRESS_SIZE_CSR-1:0]    csr_address,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface CLK" *)
    output wire           csr_clk,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface RST" *)
    output wire         csr_reset,
    
      ////////////////////////////
      ////// WEIGHT MEMORY ///////
      ///////////////////////////
      (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC no,MEM_WIDTH 64,MEM_SIZE 8192 " *)
      (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface EN" *)
      output wire  wm_ce,
      (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *)
      input wire [DATA_WIDTH_WMEMORY-1:0]       wm_dout,
      (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *)
      output wire [DATA_WIDTH_WMEMORY-1:0]       wm_din,
      (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface WE" *)
      output wire              wm_we,
      (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *)
      output wire [ADDRESS_SIZE_WMEMORY-1:0]  wm_address,
      (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface CLK" *)
      output wire    wm_clk,
      (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface RST" *)
      output wire           wm_reset,
      
      ////////////////////////////////////////////
      /////////// INPUT DATA FIFO ////////////////
      ////////////////////////////////////////////
      /////////// using stream axi 
      (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *)
      input wire [DATA_WIDTH_FIFO_IN-1:0] infifo_dout,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_EN" *)
      output wire infifo_read,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo EMPTY_N" *)
      input wire infifo_is_empty,
            
              
      ////////////////////////////////////////////
      /////////// OUTPUT DATA FIFO ///////////////
      ////////////////////////////////////////////
      /////////// using stream axi 
      (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *)
      output wire [DATA_WIDTH_FIFO_OUT-1:0] outfifo_din,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_EN" *)
      output wire outfifo_write,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo FULL_N" *)
      input wire outfifo_is_full,
            
      ////////////////////////////////////////////
      /////////// CONTROL FROM/TO PS /////////////
      //////////////////////////////////////////// 
       (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_start" *)
      input wire cs_start,
       (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_ready" *)
      output wire cs_ready,
       (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_done" *)
      output wire cs_done,
       (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_continue" *)
      input wire cs_continue,
       (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_idle" *)
      output wire cs_idle,
       
       // debug state
      output wire[3:0]state,
      output wire[3:0]d_out
        );
    //////////////////////////////////////////
    ///************************************///
    ///// --------- Cogitantium -------- /////
    ///// the dumb tensor processing unit ////
    ///************************************///
    //////////////////////////////////////////
            
      wire [COLUMNS*ROWS*DATA_WIDTH_FIFO_OUT-1:0]weight_to_mxu;
      wire [COLUMNS*DATA_WIDTH_FIFO_IN-1:0] input_data_to_mxu;
      wire [ROWS*DATA_WIDTH_FIFO_OUT-1:0] output_data_from_mxu;
      wire enable_deskew_ff_i,enable_enskew_ff_i;
      wire [`LOG_ALLOWED_PRECISIONS-1:0] data_precision;
      wire enable_i;     
      wire enable_load_array;
      wire [ROWS*COLUMNS-1:0]read_weight_memory;
      wire [COLUMNS:0]enable_load_activation_data;
      wire [COLUMNS:0]enable_store_activation_data;
      wire enable_cnt;
      wire ld_max_cnt;
      wire enable_cnt_weight;
      wire ld_max_cnt_weight;
      wire enable_chain;
      wire ld_weight_page_cnt;
      wire [1:0]enable_fp_unit;

      wire [ADDRESS_SIZE_WMEMORY-1:0]start_value_wm;
      wire [$clog2(COLUMNS):0]max_cnt_from_cu;
      wire [$clog2(ROWS*COLUMNS):0]max_cnt_weight_from_cu;
      wire reset_i;
      
      assign d_out=data_precision;
      
      assign reset_i=~aresetn;
     ////////////////////////////////////////////
    ////// MATRIX MULTIPLICATION UNIT //////////
    ////////////////////////////////////////////
   mxu_wrapper
    #(.M(ROWS), // matrix row -> weights
        .K(COLUMNS), // matrix columsn -> input data
        .max_data_width(DATA_WIDTH_MAC),// it must be a divisor of 64
        .MAX_BOARD_DSP(MAX_BOARD_DSP)
        ) engine  (   
            .data_type(data_precision),
            .reset(reset_i),
            .clk(clk),
            .enable(enable_i),
            .enable_chain(enable_chain),
            .enable_fp_unit(enable_fp_unit),
            .enable_in_ff(enable_enskew_ff_i),
            .enable_out_ff(enable_deskew_ff_i),
            .test_mode(test_mode),
            .input_data(input_data_to_mxu),
            .weight(weight_to_mxu),
            .y(output_data_from_mxu)
        );
       
    //////////////////////////////////////////////
    ///////////// CONTROL UNIT ///////////////////
    ////////////////////////////////////////////// 
    control_unit #( .DATA_WIDTH_FIFO_IN(DATA_WIDTH_FIFO_IN),
                .DATA_WIDTH_FIFO_OUT(DATA_WIDTH_FIFO_OUT), 
                .DATA_WIDTH_WMEMORY(DATA_WIDTH_WMEMORY),
                .DATA_WIDTH_CSR(DATA_WIDTH_CSR),
                .ROWS(ROWS),
                .COLUMNS(COLUMNS),
                .ADDRESS_SIZE_CSR(ADDRESS_SIZE_CSR),
                .ADDRESS_SIZE_WMEMORY(ADDRESS_SIZE_WMEMORY))
    cu(
        .clk(clk),
        .reset(reset_i),
        .test_mode(test_mode),
        .glb_enable(enable),
        .enable_mxu(enable_i),
        .csr_address(csr_address),               
        .csr_dout(csr_dout),     
        .csr_ce(csr_ce),
        .csr_reset(csr_reset),
        .csr_we(csr_we),
        .wm_ce(wm_ce),
        .wm_reset(wm_reset),
        .wm_we(wm_we),
        .infifo_is_empty(infifo_is_empty),
        .infifo_read(infifo_read),
        .outfifo_is_full(outfifo_is_full),
        .outfifo_write(outfifo_write),
        .cs_continue(cs_continue),
        .cs_done(cs_done),
        .cs_idle(cs_idle),
        .cs_ready(cs_ready),
        .cs_start(cs_start),
        .state_out(state),
        .enable_deskew_ff(enable_deskew_ff_i),
        .enable_enskew_ff(enable_enskew_ff_i),
        .enable_fp_unit(enable_fp_unit),
        .enable_chain(enable_chain),
        .enable_load_array(enable_load_array),
        .data_precision(data_precision),
        .read_weight_memory(read_weight_memory),
        .enable_load_activation_data(enable_load_activation_data),
        .enable_store_activation_data(enable_store_activation_data),
        .enable_cnt(enable_cnt),
        .ld_max_cnt(ld_max_cnt),
        .enable_cnt_weight(enable_cnt_weight),
        .ld_max_cnt_weight(ld_max_cnt_weight),
        .ld_weight_page_cnt(ld_weight_page_cnt),
        .start_value_wm(start_value_wm),
        .max_cnt_from_cu(max_cnt_from_cu), // it depends on the current bitwidt [$clog2(COLUMNS):0]
        .max_cnt_weight_from_cu(max_cnt_weight_from_cu) //[$clog2(ROWS):0]

           );
  
  /////////////////////////////////////////////
  ///////// LOAD AND STORE ARRAY     /////////
  /////////////////////////////////////////////
  `ifndef DUMMY
  
  
  ls_array
  #(  .ROWS(ROWS),
      .COLUMNS(COLUMNS),
      .data_in_width(DATA_WIDTH_FIFO_IN),
      .data_in_mem(DATA_WIDTH_WMEMORY),
      .address_leng_wm(ADDRESS_SIZE_WMEMORY),
      .size_wmemory(SIZE_WMEMORY)) ls_array_inst
  ( 
  .clk(clk),
  .reset(reset_i),
  .enable_load_array(enable_load_array),
  .data_precision(data_precision),
  .read_weight_memory(read_weight_memory),
  .infifo_read(infifo_read),
  .outfifo_write(outfifo_write),
  .input_data_from_fifo(infifo_dout), //[data_in_width-1:0]
  .data_to_fifo_out(outfifo_din), //[data_in_width-1:0]
  .data_from_weight_memory(wm_dout), //[data_in_mem-1:0]
  .data_from_mxu(output_data_from_mxu), //[data_in_width*ROWS-1:0] 
  .data_to_mxu(input_data_to_mxu), //[data_in_width*COLUMNS-1:0]
  .weight_to_mxu(weight_to_mxu), //[data_in_width*ROWS-1:0]
  .wm_address(wm_address), //[address_leng_wm-1:0]
  .enable_load_activation_data(enable_load_activation_data),
  .enable_store_activation_data(enable_store_activation_data),
  .enable_cnt(enable_cnt),
  .ld_max_cnt(ld_max_cnt),
  .enable_cnt_weight(enable_cnt_weight),
  .ld_max_cnt_weight(ld_max_cnt_weight),
  .ld_weight_page_cnt(ld_weight_page_cnt),
  .start_value_wm(start_value_wm),
  .max_cnt_from_cu(max_cnt_from_cu), // it depends on the current bitwidt [$clog2(COLUMNS):0]
  .max_cnt_weight_from_cu(max_cnt_weight_from_cu) //[$clog2(ROWS):0]
  );


  `endif
  

  
  `ifdef DUMMY
  always @(posedge(clk)) begin 
  if(reset_i) begin
  input_data_from_fifo<=0;
  weight_from_memory<=0;
  end else begin 
            if (enable_load_array && infifo_read ) begin 
            input_data_from_fifo<=infifo_dout;
            weight_from_memory<= wm_dout;
            end
            
  end 
  end 
  // dummy assignment for 3 columns and rows 
  assign outfifo_din=( outfifo_write ? input_data_to_fifo:64'b0);

  
  `endif

  // same clock for bram interface
  assign csr_clk=clk;
  assign wm_clk=clk;
  
endmodule
