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
    aresetn,
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
        cs_start,
        
        state
        
        );
    //////////////////////////////////////////
    ///************************************///
    ///// --------- Cogitantium -------- /////
    ///// the dumb tensor processing unit ////
    ///************************************///
    //////////////////////////////////////////
    input wire clk;
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 areset RST" *)
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
    input wire aresetn;
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
       
       
       output reg[3:0]state;
          
          
        wire [3:0]state_i;
       wire load_in_reg,enable_deskew_ff_i,enable_enskew_ff_i;
        reg [63:0] input_data_from_fifo;
        wire [63:0] input_data_to_fifo;
        reg [63:0] weight_from_memory;
       wire enable_i;     
       wire [`LOG_ALLOWED_PRECISIONS-1:0] data_type;
     ////////////////////////////////////////////
    ////// MATRIX MULTIPLICATION UNIT //////////
    ////////////////////////////////////////////
   mxu_wrapper
    #(.M(ROWS), // matrix row -> weights
        .K(COLUMNS), // matrix columsn -> input data
        .max_data_width(DATA_WIDTH_MAC)// it must be a divisor of 64
        ) engine  (   
            .data_type(data_type),
            .reset(aresetn),
            .clk(clk),
            .enable(enable_i),
            .enable_in_ff(enable_enskew_ff_i),
            .enable_out_ff(enable_deskew_ff_i),
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
                .ROWS(ROWS),
                .COLUMNS(COLUMNS),
                //.ADDRESS_SIZE_CSR($clog2(SIZE_CSR)),
                //.ADDRESS_SIZE_WMEMORY($clog2(SIZE_WMEMORY)))
                .ADDRESS_SIZE_CSR(32),
                .ADDRESS_SIZE_WMEMORY(32))
                                
                cu(
        .clk(clk),
        .reset(aresetn),
        .test_mode(test_mode),
        .glb_enable(enable),
        .enable_mxu(enable_i),
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
        .cs_continue(cs_continue),
        .cs_done(cs_done),
        .cs_idle(cs_idle),
        .cs_ready(cs_ready),
        .cs_start(cs_start),
        .load_data(load_in_reg),
        .state_out(state_i),
        .enable_deskew_ff(enable_deskew_ff_i),
        .enable_enskew_ff(enable_enskew_ff_i)
           );
  
  /////////////////////////////////////////////
  ///////// MUXES FOR DATA SELECTIONS /////////
  /////////////////////////////////////////////
  
    // DATA_WIDTH_FIFO/ DATA_WIDTH ?? 
  // TODO 
  //filter_and_select mask_values();
  
  
  
  always @(posedge(clk)) begin 
  if(!aresetn) begin
  input_data_from_fifo<=0;
  weight_from_memory<=0;
  end else begin 
            if (load_in_reg && infifo_read ) begin 
            input_data_from_fifo<=infifo_dout;
            weight_from_memory<= wm_dout;
            end
            
  end 
  end 
  // dummy assignment for 3 columns and rows 
  assign outfifo_din=( outfifo_write ? input_data_to_fifo:64'b0);

  always @(posedge(clk)) begin
  state<= state_i; 
  end 
  
  
  // same clock for bram interface
  assign csr_clk=clk;
  assign wm_clk=clk;
      
      
  
endmodule
