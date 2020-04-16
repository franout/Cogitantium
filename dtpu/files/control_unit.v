`timescale 1ns / 1ps
`include "csr_definition.vh"
`include "precision_def.vh"

module control_unit 
#(parameter ROWS=3,
    COLUMNS=3,
    DATA_WIDTH_FIFO_IN=64,
    DATA_WIDTH_FIFO_OUT=64,
    DATA_WIDTH_WMEMORY=64,
    DATA_WIDTH_CSR=8,
    ADDRESS_SIZE_CSR=32,
    ADDRESS_SIZE_WMEMORY=32)
(
input clk,
input reset,
input test_mode,
input glb_enable,
output reg enable_mxu,
////////////////////////////
////// CSR INTERFACE ///////
////////////////////////////
output reg         csr_ce,
input wire [DATA_WIDTH_CSR-1:0]    csr_dout,
output reg         csr_we,
output reg [ADDRESS_SIZE_CSR-1:0]    csr_address,
output reg         csr_reset,
////////////////////////////
////// WEIGHT MEMORY ///////
///////////////////////////
output reg  wm_ce,
output reg              wm_we,
output reg [ADDRESS_SIZE_WMEMORY-1:0]  wm_address,
output reg           wm_reset,
////////////////////////////////////////////
/////////// INPUT DATA FIFO ////////////////
////////////////////////////////////////////
/////////// using stream axi 
output reg infifo_read,
input wire infifo_is_empty,
////////////////////////////////////////////
/////////// OUTPUT DATA FIFO ///////////////
////////////////////////////////////////////
/////////// using stream axi 
output reg outfifo_write,
input wire outfifo_is_full,
////////////////////////////////////////////
/////////// CONTROL FROM/TO PS /////////////
////////////////////////////////////////////             
input wire cs_start,
output reg cs_ready,
output reg cs_done,
input wire cs_continue,
output reg cs_idle,

////////////////////////////////////////////
////// CONTROL FLOW OF MXU /////////////////
////////////////////////////////////////////
output reg enable_deskew_ff,
output reg enable_enskew_ff,
output reg enable_chain,
output reg [`LOG_ALLOWED_PRECISIONS-1:0] data_precision,


////////////////////////////////////////////
/////// CONTROL OF LS ARRAY ////////////////
///////////////////////////////////////////
output reg enable_load_array,
output reg read_weight_memory,
output reg enable_load_activation_data,
output reg enable_store_activation_data,
output reg enable_cnt,
output reg ld_max_cnt,
output reg enable_down_cnt,
output reg ld_max_down_cnt,
output reg enable_cnt_weight,
output reg ld_max_cnt_weight,
output reg [$clog2(COLUMNS):0] max_cnt_from_cu,
output reg [$clog2(ROWS):0]max_down_cnt_from_cu,
output reg [$clog2(ROWS):0]max_cnt_weight_from_cu,

// debug 
output wire [3:0]state_out
);

 /*ap_start, ap_ready, ap_done are used to transfer the ownership of the data buffers*/


/* the axi adapter has also a csr for its own regarding buffers  control and status */
//// FSM /////
localparam Power_up = 4'h0;
localparam idle = 4'h1;
localparam compute = 4'h2;
localparam done = 4'h3;
localparam retrieve_data=4'h4;
localparam activate_enable_data_type=4'h5;
localparam stop=4'h6;
localparam flush_out_fifo=4'h7;
localparam start_p1=4'h8;
localparam start_p2=4'h9;
localparam start_p3=4'hA;
localparam save_to_fifo=4'hB;

reg [3:0]state;
reg [$clog2(COLUMNS*(3+1)):0]counter_compute;
reg [$clog2(ROWS):0]counter_res;


always @(posedge clk) begin
if(!reset) begin
state <= Power_up;
counter_compute<=0;
counter_res<=0;
end else begin

// dummy assignment
 enable_chain<=0;
 data_precision<=0;
 enable_load_array<=0;
 read_weight_memory<=0;
 enable_load_activation_data<=0;
 enable_store_activation_data<=0;
 enable_cnt<=0;
 ld_max_cnt<=0;
 enable_down_cnt<=0;
 ld_max_down_cnt<=0;
 enable_cnt_weight<=0;
 ld_max_cnt_weight<=0;
  max_cnt_from_cu<=0;
 max_down_cnt_from_cu<=0;
 max_cnt_weight_from_cu<=0;
///// standard assignment
counter_compute<=0;
counter_res<=0;
csr_address<=0;    
csr_ce<=0;
csr_reset<=0;
csr_we<=0;
wm_address<=0;
wm_ce<=0;
wm_reset<=0;
wm_we<=0;
infifo_read<=0;
outfifo_write<=0;
cs_done<=0;
cs_idle<=0;
cs_ready<=0;
enable_mxu<=0;
enable_deskew_ff<=0; // output ff
enable_enskew_ff<=0; // input ff
case(state) 
Power_up: begin
         state<=idle;
         // reset memories
         csr_reset<=1;
         wm_reset<=1;
        end
idle: begin
        cs_idle<=1;
        if(cs_start && glb_enable)begin  
        state<=start_p1;        
        end else begin 
        state<=state;
        end 
     end
     
     // transfering the ownership of data
start_p1: begin 
                 if(cs_start) begin 
                state<=start_p2; 
                end else begin
                state<=idle;
                end
                end  
start_p2:  begin
            if(cs_start) begin 
            state<=start_p3; 
            end else begin 
            state<=idle;
            end
            end
start_p3:  begin 
           cs_ready<=1;
            if(cs_start) begin 
            state<=retrieve_data; 
            end else begin 
            state<=idle;
            end
            end
retrieve_data: begin
                wm_address<=0;
                wm_ce<=1'b1;
            infifo_read<=1'b1;
             //load_data<=1'b1;
                state<=activate_enable_data_type;
               end 
activate_enable_data_type: begin
                        // load local data
                        wm_address<=0; // just for be sure
                            wm_ce<=1'b1;
                        infifo_read<=1'b1;
                        //load_data<=1'b1;
                        
                            // skip for now TODO it should read the csr
                            csr_ce<=1;
                            csr_address<=0;
                            state<=compute;
                       
                         end

compute: begin
            counter_compute<=counter_compute+1;
            enable_mxu<=1'b1;
            enable_enskew_ff<=1'b1; // input ff
            if(counter_compute==(COLUMNS*(3+1))) begin 
            state<=flush_out_fifo;
            end else begin 
            state<=state;            
            end 
             end

stop: begin end // skip for the moment 
flush_out_fifo: begin
             enable_deskew_ff<=1'b1;
             enable_mxu<=1'b1;  
             counter_res<=counter_res+1;
              // wait for the correct output
              if(counter_res==(ROWS)) begin 
              state<=save_to_fifo;
              end else begin 
              state<=state;
              end
             
              
             end
save_to_fifo: begin
                outfifo_write<=1'b1;      
                state<=done;
            end              
done: begin 
        if(!outfifo_is_full && !infifo_is_empty) begin
      state<=idle;
        cs_done<=1;
        end else begin
        state<=retrieve_data;
        end
      end          
default: begin 
    state<=Power_up;
         cs_idle<=0;
        cs_ready<=0;
    end
endcase
end

end 

// debug
assign state_out=state;

endmodule