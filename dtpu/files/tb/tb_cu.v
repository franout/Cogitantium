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

`include "precision_def.vh"

`include "csr_definition.vh"

module tb_cu();
        parameter clk_period= 10;

              reg clk,reset;
                  reg glb_enable;
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

                  wire [`LOG_ALLOWED_PRECISIONS-1:0] data_precision;
                  wire [$clog2(8):0] max_cnt_from_cu;
                  wire [$clog2(8):0]max_down_cnt_from_cu;
                  wire [$clog2(8):0]max_cnt_weight_from_cu;
                  wire enable_enskew_ff;
                  wire enable_deskew_ff;
                  wire enable_chain;
                  wire enable_load_array;
                  wire read_weight_memory;
                  wire enable_load_activation_data;
                  wire enable_store_activation_data;
                  wire enable_cnt;
                  wire ld_max_cnt;
                  wire enable_down_cnt;
                  wire ld_max_down_cnt;
                  wire enable_cnt_weight;
                  wire ld_max_cnt_weight;
                  wire [3:0]state_out;
                  wire [1:0]enable_fp_unit;

              integer k,OK;


     control_unit #( .ROWS(8),
    .COLUMNS(8),
    .DATA_WIDTH_FIFO_IN(64),
    .DATA_WIDTH_FIFO_OUT(64), 
    .DATA_WIDTH_WMEMORY(64),
    .DATA_WIDTH_CSR(8),
    .ADDRESS_SIZE_CSR(32),    
    .SIZE_WM_MEMORY(4096)
    ) uut (
   .glb_enable(glb_enable),
    .clk(clk),
    .reset(reset),
    .enable_mxu(enable_mxu),
    .test_mode(test_mode),
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
    .cs_done(cs_done),
    .cs_continue(cs_continue),
    .cs_idle(cs_idle),
    .cs_ready(cs_ready),
    .cs_start(cs_start),
    .enable_fp_unit(enable_fp_unit),
    .enable_deskew_ff(enable_deskew_ff),
    .enable_enskew_ff(enable_enskew_ff),
    .enable_chain(enable_chain),
    .data_precision(data_precision),
    .enable_load_array(enable_load_array),
    .read_weight_memory(read_weight_memory),
    .enable_load_activation_data(enable_load_activation_data),
    .enable_store_activation_data(enable_store_activation_data),
    .enable_cnt(enable_cnt),
    .ld_max_cnt(ld_max_cnt),
    .enable_down_cnt(enable_down_cnt),
    .ld_max_down_cnt(ld_max_down_cnt),
    .enable_cnt_weight(enable_cnt_weight),
    .ld_max_cnt_weight(ld_max_cnt_weight),
    .max_cnt_from_cu(max_cnt_from_cu),
    .max_down_cnt_from_cu(max_down_cnt_from_cu),
    .max_cnt_weight_from_cu(max_cnt_weight_from_cu),
    .state_out(state_out)
);
     
/*INTERNAL STATE OF CONTROL UNIT ONLY FOR TEST PURPOSES */
localparam Power_up = 4'h0;
localparam idle = 4'h1;
localparam compute = 4'h2;
localparam done = 4'h3;
localparam retrieve_data=4'h4;
localparam save_to_fifo=4'h5;
localparam start_p1=4'h6;
localparam start_p2=4'h7;
localparam start_p3=4'h8;

reg [3:0]data_precision_tb;
reg [3:0]data_precision_fp_tb;
          
// clock generator process
       always begin
          clk = 1'b1;
          #(clk_period/2) 
          clk = 1'b0;
          #(clk_period/2);
       end
              
              // fake csr memory process
              always @(csr_address,csr_ce)begin 
              if(csr_ce) begin 
                case(csr_address)
                  `A_ARITHMETIC_PRECISION:
                      csr_dout={4'b0,data_precision_tb};
                  `A_FP_MODE:
                      csr_dout={4'b0,data_precision_fp_tb};
                  default:
                    csr_dout=0;
                endcase
                end 
              end

              
              initial begin 
              csr_dout=0;
              OK=1;
              infifo_is_empty=1'b1;
              data_precision_tb=4'h0;
              data_precision_fp_tb=4'h8;
              outfifo_is_full=1'b1;
              cs_start=0;
              cs_continue=0;
              glb_enable=1'b0;
              reset=1'b1;
              $display("global reset");
              if(state_out!=Power_up)begin 
                  $display("cu not in Power_up state");
                OK=0;
                $finish();
              end 
              #clk_period;
              reset=1'b0;
              #clk_period;
              if(state_out!=idle) begin 
                $display("cu after reset not in idle state");
                OK=0;
                $finish();
              end
              #clk_period;
              $display("stimulus are starting -> start from the accelerator");
              $display("Integer 8 bit computation");
              data_precision_tb=4'h1;
              cs_start=1'b1;
              glb_enable=1'b1;
              #clk_period;
              if(state_out!=start_p1)begin
                $display("core not started no phase 1");
                OK=0; $finish();
              end 

              $display("check the address of csr");
              if(csr_address!=`A_ARITHMETIC_PRECISION)begin 
                $display("not retrieving data from csr -> data precision ");
              end 

              cs_start=1'b1;
              #clk_period;
              if(state_out!=start_p2)begin
                $display("core not started no phase 2");
                OK=0; $finish();
              end 
              #clk_period;
              if(data_precision!=`INT8) begin 
                $display("not the correct precision of int 8");
                OK=0; $finish();
              end 
              if(csr_address!=`A_FP_MODE) begin 
                $display("Control unit is not checking the fp csr ");
                OK=0;$finish();
              end
               
              cs_start=1'b1;
              if(state_out!=start_p3 && cs_ready!=0)begin
                $display("core not started no phase 3");
                OK=0; $finish();
              end 
                
              $display("getting the first data from weight memory");
              #clk_period;
              if(state_out!=retrieve_data) begin 
                $display("not retrieving first chunk of data");
                OK=0;$finish();
              end 


              $display("computing mxu");
              #clk_period;
              if(state_out!=compute)begin
                $display("mxu is not computing");
                OK=0;
                $finish();
              end 


              outfifo_is_full=1'b0;
              infifo_is_empty=1'b0;
                // DELAY 
               for(k=0;k< 3*9+8 +1;k=k+1) begin 
               #clk_period;
               end 
               
              if(state_out!=save_to_fifo) begin 
                $display("not saving to fifo correccly",);
                OK=0;$finish();
              end

              #clk_period;
              $display("done phase");
              if(state_out!=done && cs_done!=1'b1) begin 
                $display("error in asserting done signal");
                OK=0;
                $finish();
              end

                #clk_period;
                if(state_out!=idle) begin 
                $display("after execution cu not in idle");
                OK=0; $finish();
                end 
              $display("Integer 16 bit computation");
              
              data_precision_tb=4'h3;
              cs_start=1'b1;
              glb_enable=1'b1;
              #clk_period;
              if(state_out!=start_p1)begin
                $display("core not started no phase 1");
                OK=0; $finish();
              end 

              $display("check the address of csr");
              if(csr_address!=`A_ARITHMETIC_PRECISION)begin 
                $display("not retrieving data from csr -> data precision ");
              end 

              cs_start=1'b1;
              #clk_period;
              if(state_out!=start_p2)begin
                $display("core not started no phase 2");
                OK=0; $finish();
              end 
              #clk_period;
              if(data_precision!=`INT16) begin 
                $display("not the correct precision of int 16");
                OK=0; $finish();
              end 
              if(csr_address!=`A_FP_MODE) begin 
                $display("Control unit is not checking the fp csr ");
                OK=0;$finish();
              end
               
              cs_start=1'b1;
              if(state_out!=start_p3 && cs_ready!=0)begin
                $display("core not started no phase 3");
                OK=0; $finish();
              end 
                
              $display("getting the first data from weight memory");
              #clk_period;
              if(state_out!=retrieve_data) begin 
                $display("not retrieving first chunk of data");
                OK=0;$finish();
              end 


              $display("computing mxu");
              #clk_period;
              if(state_out!=compute)begin
                $display("mxu is not computing");
                OK=0;
                $finish();
              end 


              outfifo_is_full=1'b0;
              infifo_is_empty=1'b0;
                // DELAY 
               for(k=0;k< 3*9+8 +1;k=k+1) begin 
               #clk_period;
               end 
               
              if(state_out!=save_to_fifo) begin 
                $display("not saving to fifo correccly",);
                OK=0;$finish();
              end

              #clk_period;
              $display("done phase");
              if(state_out!=done && cs_done!=1'b1) begin 
                $display("error in asserting done signal");
                OK=0;
                $finish();
              end

              $display("Integer 32 bit computation");
                #clk_period;
                if(state_out!=idle) begin 
                $display("after execution cu not in idle");
                OK=0; $finish();
                end 
            
              
              data_precision_tb=4'h7;
              cs_start=1'b1;
              glb_enable=1'b1;
              #clk_period;
              if(state_out!=start_p1)begin
                $display("core not started no phase 1");
                OK=0; $finish();
              end 

              $display("check the address of csr");
              if(csr_address!=`A_ARITHMETIC_PRECISION)begin 
                $display("not retrieving data from csr -> data precision ");
              end 

              cs_start=1'b1;
              #clk_period;
              if(state_out!=start_p2)begin
                $display("core not started no phase 2");
                OK=0; $finish();
              end 
              #clk_period;
              if(data_precision!=`INT32) begin 
                $display("not the correct precision of int 32");
                OK=0; $finish();
              end 
              if(csr_address!=`A_FP_MODE) begin 
                $display("Control unit is not checking the fp csr ");
                OK=0;$finish();
              end
               
              cs_start=1'b1;
              if(state_out!=start_p3 && cs_ready!=0)begin
                $display("core not started no phase 3");
                OK=0; $finish();
              end 
                
              $display("getting the first data from weight memory");
              #clk_period;
              if(state_out!=retrieve_data) begin 
                $display("not retrieving first chunk of data");
                OK=0;$finish();
              end 


              $display("computing mxu");
              #clk_period;
              if(state_out!=compute)begin
                $display("mxu is not computing");
                OK=0;
                $finish();
              end 


              outfifo_is_full=1'b0;
              infifo_is_empty=1'b0;
                // DELAY 
               for(k=0;k< 3*9+8 +1;k=k+1) begin 
               #clk_period;
               end 
               
              if(state_out!=save_to_fifo) begin 
                $display("not saving to fifo correccly",);
                OK=0;$finish();
              end

              #clk_period;
              $display("done phase");
              if(state_out!=done && cs_done!=1'b1) begin 
                $display("error in asserting done signal");
                OK=0;
                $finish();
              end

              $display("Integer 64 bit computation");
                #clk_period;
                if(state_out!=idle) begin 
                $display("after execution cu not in idle");
                OK=0; $finish();
                end 
            
              
              data_precision_tb=4'hf;
              cs_start=1'b1;
              glb_enable=1'b1;
              #clk_period;
              if(state_out!=start_p1)begin
                $display("core not started no phase 1");
                OK=0; $finish();
              end 

              $display("check the address of csr");
              if(csr_address!=`A_ARITHMETIC_PRECISION)begin 
                $display("not retrieving data from csr -> data precision ");
              end 

              cs_start=1'b1;
              #clk_period;
              if(state_out!=start_p2)begin
                $display("core not started no phase 2");
                OK=0; $finish();
              end 
              #clk_period;
              if(data_precision!=`INT64) begin 
                $display("not the correct precision of int 64");
                OK=0; $finish();
              end 
              if(csr_address!=`A_FP_MODE) begin 
                $display("Control unit is not checking the fp csr ");
                OK=0;$finish();
              end
               
              cs_start=1'b1;
              if(state_out!=start_p3 && cs_ready!=0)begin
                $display("core not started no phase 3");
                OK=0; $finish();
              end 
                
              $display("getting the first data from weight memory");
              #clk_period;
              if(state_out!=retrieve_data) begin 
                $display("not retrieving first chunk of data");
                OK=0;$finish();
              end 


              $display("computing mxu");
              #clk_period;
              if(state_out!=compute)begin
                $display("mxu is not computing");
                OK=0;
                $finish();
              end 


              outfifo_is_full=1'b0;
              infifo_is_empty=1'b0;
                // DELAY 
               for(k=0;k< 3*9+8 +1;k=k+1) begin 
               #clk_period;
               end 
               
              if(state_out!=save_to_fifo) begin 
                $display("not saving to fifo correccly",);
                OK=0;$finish();
              end

              #clk_period;
              $display("done phase");
              if(state_out!=done && cs_done!=1'b1) begin 
                $display("error in asserting done signal");
                OK=0;
                $finish();
              end

              $display("Floating poitn computation");
               #clk_period;
                if(state_out!=idle) begin 
                $display("after execution cu not in idle");
                OK=0; $finish();
                end 
            
              
            data_precision_fp_tb=4'h3;
              data_precision_tb=4'h7;
              cs_start=1'b1;
              glb_enable=1'b1;
              #clk_period;
              if(state_out!=start_p1)begin
                $display("core not started no phase 1");
                OK=0; $finish();
              end 

              $display("check the address of csr");
              if(csr_address!=`A_ARITHMETIC_PRECISION)begin 
                $display("not retrieving data from csr -> data precision ");
              end 

              cs_start=1'b1;
              #clk_period;
              if(state_out!=start_p2)begin
                $display("core not started no phase 2");
                OK=0; $finish();
              end 
              #clk_period;
              if(data_precision!=`FP32) begin 
                $display("not the correct precision of int 8");
                OK=0; $finish();
              end 
              if(csr_address!=`A_FP_MODE) begin 
                $display("Control unit is not checking the fp csr ");
                OK=0;$finish();
              end
               
              cs_start=1'b1;
              if(state_out!=start_p3 && cs_ready!=0)begin
                $display("core not started no phase 3");
                OK=0; $finish();
              end 
                
              $display("getting the first data from weight memory");
              #clk_period;
              if(state_out!=retrieve_data) begin 
                $display("not retrieving first chunk of data");
                OK=0;$finish();
              end 


              $display("computing mxu");
              #clk_period;
              if(state_out!=compute)begin
                $display("mxu is not computing");
                OK=0;
                $finish();
              end 


              outfifo_is_full=1'b0;
              infifo_is_empty=1'b0;
                // DELAY 
               for(k=0;k< 3*9+8 +1;k=k+1) begin 
               #clk_period;
               end 
               
              if(state_out!=save_to_fifo) begin 
                $display("not saving to fifo correccly",);
                OK=0;$finish();
              end

              #clk_period;
              $display("done phase");
              if(state_out!=done && cs_done!=1'b1) begin 
                $display("error in asserting done signal");
                OK=0;
                $finish();
              end

              
              
              $display("TEST CONTINOUS RUN ON 8 BIT");
              
              
              #clk_period;
                if(state_out!=idle) begin 
                $display("after execution cu not in idle");
                OK=0; $finish();
                end 
            
              
              outfifo_is_full=1'b1;
              infifo_is_empty=1'b1;   
            data_precision_fp_tb=4'h0;
              data_precision_tb=4'h1;
              cs_start=1'b1;
              glb_enable=1'b1;
              #clk_period;
              if(state_out!=start_p1)begin
                $display("core not started no phase 1");
                OK=0; $finish();
              end 

              $display("check the address of csr");
              if(csr_address!=`A_ARITHMETIC_PRECISION)begin 
                $display("not retrieving data from csr -> data precision ");
              end 

              cs_start=1'b1;
              #clk_period;
              if(state_out!=start_p2)begin
                $display("core not started no phase 2");
                OK=0; $finish();
              end 
              #clk_period;
              if(data_precision!=`INT8) begin 
                $display("not the correct precision of int 8");
                OK=0; $finish();
              end 
              if(csr_address!=`A_FP_MODE) begin 
                $display("Control unit is not checking the fp csr ");
                OK=0;$finish();
              end
               
              cs_start=1'b1;
              if(state_out!=start_p3 && cs_ready!=0)begin
                $display("core not started no phase 3");
                OK=0; $finish();
              end 
                
              $display("getting the first data from weight memory");
              #clk_period;
              if(state_out!=retrieve_data) begin 
                $display("not retrieving first chunk of data");
                OK=0;$finish();
              end 


              $display("computing mxu");
              #clk_period;
              if(state_out!=compute)begin
                $display("mxu is not computing");
                OK=0;
                $finish();
              end 


                // DELAY 
               for(k=0;k< 3*9+8 +1;k=k+1) begin 
               #clk_period;
               end 
               
              if(state_out!=save_to_fifo) begin 
                $display("not saving to fifo correccly",);
                OK=0;$finish();
              end
                
              #clk_period;
              
              $display("done phase");
              if(state_out!=done && cs_done!=1'b0) begin 
                $display("error in going back done state");
                OK=0;
                $finish();
              end
                
            

                $display("computing mxu second iteration");
              #clk_period;
              if(state_out!=compute)begin
                $display("mxu is not computing second iteration ");
                OK=0;
                $finish();
              end 


              outfifo_is_full=1'b0;
              infifo_is_empty=1'b0;            
                
                // DELAY 
               for(k=0;k< 3*9+8 +1;k=k+1) begin 
               #clk_period;
               end 
               
              if(state_out!=save_to_fifo) begin 
                $display("not saving to fifo correccly for second iteration ",);
                OK=0;$finish();
              end
                
              #clk_period;
              
              $display("done phase");
              if(state_out!=done && cs_done!=1'b1) begin 
                $display("error done signal not asserted in second iteration");
                OK=0;
                $finish();
              end
            
              if(OK!=1)begin
                $display("control unit does not pass the testbench");
                
              end else begin 
                $display("test is passed");
              end
              $finish();


              end 

        
        
        
        
            
endmodule
