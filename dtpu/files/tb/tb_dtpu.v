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
              wire [63:0]csr_din;
              reg [63:0]csr_dout;
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
               wire [3:0] precision;
    

reg [3:0]data_precision_tb;
reg [3:0]data_precision_fp_tb;
     
      

      dtpu_core
     #(.DATA_WIDTH_MAC(64),
         .ROWS(8) ,
         .COLUMNS(8),
         .SIZE_WMEMORY(2048),
         .SIZE_CSR(1024),
         .DATA_WIDTH_CSR(64),
         .DATA_WIDTH_WMEMORY(64),
         .DATA_WIDTH_FIFO_IN(64),
         .DATA_WIDTH_FIFO_OUT(64),
         .ADDRESS_SIZE_CSR(32),
         .ADDRESS_SIZE_WMEMORY(32),
         .MAX_BOARD_DSP(220)
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
        .state(state),
        .d_out(precision)
        
        
        );


reg [63:0]data[0:31];
integer i;

always begin
   clk = 1'b1;
   #(clk_period/2) 
   clk = 1'b0;
   #(clk_period/2);
end

initial begin 
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
                #clk_period;
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
              $display("stimulus");
              data_precision_tb=4'h1; // 8 bit integer
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
              if(state!=start_p2  && csr_dout!=`INT8  && csr_address!=`A_FP_MODE) begin
                $display("not phase 2");
                $stop();
              end 
              #clk_period; 
              if(state!=start_p3 && cs_ready!=1'b1 && precision!=`INT8) begin
                $display("not phase 3 , check precisions");
                $stop();
              end 
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

              for (k=0;k<3*(8+1)+8*2+1;k=k+1) begin
              #clk_period;               
              end 
              
              if(state!=save_to_fifo) begin
                $display("not saving to fifo ",);
                $stop();
              end
              
              #clk_period;
              
              if(state!=done && cs_done!=1'b0) begin 
                $display("accelerator not in continous run ");
                $stop();
              end
              if(!(outfifo_din=={8{8'h88}}))begin
                  $display("computation not correct!!!!");
                  $stop();
              end

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
              for (k=0;k<3*(8+1)+8*2+1;k=k+1) begin
              #clk_period;               
              end 
              if(state!=save_to_fifo) begin
                $display("not saving to fifo ",);
                $stop();
              end
              #clk_period;

              if(state!=done && cs_done!=1'b0) begin 
                $display("accelerator not in continous run ");
                $stop();
              end
              #clk_period;
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
                $display("accelerator is not computing anything",);
              end   
              for (k=0;k<3*(8+1)+8*2+1;k=k+1) begin
              #clk_period;               
              end 

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
              if((outfifo_din=={8{8'h00}}))begin
                  $display("computation not correct!!!!");
                  $stop();
              end
              #clk_period;
              if(state!=idle) begin
                $display("problem fsm does not go back in idle state");
                $stop();
              end
              #clk_period;  #clk_period;  #clk_period;


              $display("accelerator for integer 16");
              $display("accelerator for integer 32");
              $display("accelerator for integer 64");
              $display("accelerator for fp32");

                
                
                $finish();
                end     
endmodule

