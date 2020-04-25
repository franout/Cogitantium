//==================================================================================================
//  Filename      : control_unit.v
//  Created On    : 2020-04-22 17:06:46
//  Last Modified : 2020-04-23 10:41:16
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
   (* keep="true" *) output reg         csr_ce,
input wire [DATA_WIDTH_CSR-1:0]    csr_dout,
(* keep="true" *)output reg       csr_we,
(* keep="true" *)output reg [ADDRESS_SIZE_CSR-1:0]    csr_address,
(* keep="true" *)output reg     csr_reset,
////////////////////////////
////// WEIGHT MEMORY ///////
///////////////////////////
(* keep="true" *)output reg  wm_ce,
(* keep="true" *)output reg  wm_we,
(* keep="true" *)output reg  wm_reset,
////////////////////////////////////////////
/////////// INPUT DATA FIFO ////////////////
////////////////////////////////////////////
/////////// using stream axi 
(* keep="true" *)output reg infifo_read,
input wire infifo_is_empty,
////////////////////////////////////////////
/////////// OUTPUT DATA FIFO ///////////////
////////////////////////////////////////////
/////////// using stream axi 
(* keep="true" *)output reg outfifo_write,
input wire outfifo_is_full,
////////////////////////////////////////////
/////////// CONTROL FROM/TO PS /////////////
////////////////////////////////////////////             
input wire cs_start,
(* keep="true" *)output reg cs_ready,
(* keep="true" *)output reg cs_done,
input wire cs_continue,
(* keep="true" *)output reg cs_idle,

////////////////////////////////////////////
////// CONTROL FLOW OF MXU /////////////////
////////////////////////////////////////////
(* keep="true" *)output reg enable_deskew_ff,
(* keep="true" *)output reg enable_enskew_ff,
(* keep="true" *)output reg enable_chain,
(* keep="true" *)output reg [1:0]enable_fp_unit,
(* keep="true" *)output reg [`LOG_ALLOWED_PRECISIONS-1:0] data_precision,


////////////////////////////////////////////
/////// CONTROL OF LS ARRAY ////////////////
///////////////////////////////////////////
(* keep="true" *)output reg enable_load_array,
(* keep="true" *)output reg read_weight_memory,
(* keep="true" *)output reg enable_load_activation_data,
(* keep="true" *)output reg enable_store_activation_data,
(* keep="true" *)output reg enable_cnt,
(* keep="true" *)output reg ld_max_cnt,
(* keep="true" *)output reg enable_down_cnt,
(* keep="true" *)output reg ld_max_down_cnt,
(* keep="true" *)output reg enable_cnt_weight,
(* keep="true" *)output reg ld_max_cnt_weight,
(* keep="true" *)output reg [$clog2(COLUMNS):0] max_cnt_from_cu,
(* keep="true" *)output reg [$clog2(ROWS):0]max_down_cnt_from_cu,
(* keep="true" *)output reg [$clog2(ROWS):0]max_cnt_weight_from_cu,

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
localparam save_to_fifo=4'h5;
localparam start_p1=4'h6;
localparam start_p2=4'h7;
localparam start_p3=4'h8;

localparam [$clog2(1+3*(COLUMNS+1)+ROWS):0]MAX_COUNTER= 3*(COLUMNS+1)+ROWS*2;
reg [3:0]state;
reg [$clog2(1+3*(COLUMNS+1)+ROWS):0]counter_compute;
reg [$clog2(ROWS):0]counter_res;


always @(posedge clk) begin
if(!reset) begin
state <= Power_up;
counter_compute<=0;
counter_res<=0;
// for mxu 
data_precision<=`NO_COMPUTATION;
enable_chain<=`NO_CHAIN;
enable_fp_unit<=0;
end else begin
///// standard assignment
enable_load_array<=0;
read_weight_memory<=0;
enable_load_activation_data<=0;
enable_store_activation_data<=0;
enable_cnt<=0;
enable_cnt_weight<=0;
enable_down_cnt<=0;

ld_max_cnt<=0;
ld_max_down_cnt<=0;
ld_max_cnt_weight<=0;


counter_compute<=0;
counter_res<=0;
csr_address<=0;    
csr_ce<=0;
csr_reset<=0;
csr_we<=0;
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
        //data_precision<=`INT32;
        if(cs_start && glb_enable)begin  
        state<=start_p1;        
        end else begin 
        state<=state;

        end 
     end
     // for speeding up the csr can be checked in the below states! TODO
     // transfering the ownership of data
start_p1: begin 
            csr_ce<=1'b1;
            csr_address<=`A_ARITHMETIC_PRECISION;
                 if(cs_start) begin 
                state<=start_p2; 
                end else begin
                state<=idle;
                end
                end  
start_p2:  begin
            csr_ce<=1'b1;
            //csr_address<=`A_FP_MODE;
            if(cs_start) begin 
            state<=start_p3; 
            end else begin 
            state<=idle;
            end
            end
start_p3:  begin 
            cs_ready<=1;
            csr_ce<=1'b1;
            enable_fp_unit<=csr_dout[`LOG_ALLOWED_PRECISIONS+2:`LOG_ALLOWED_PRECISIONS+1]; // fp and bpfp bits
            enable_chain<=csr_dout[`LOG_ALLOWED_PRECISIONS];
            data_precision<=csr_dout[`LOG_ALLOWED_PRECISIONS-1:0];
            if(cs_start) begin 
            state<=retrieve_data; 
            end else begin 
            state<=idle;
            end
            end
retrieve_data: begin
            // retrieve data from input fifo and weight memory one cc before computation starts
            wm_ce<=1'b1;
            infifo_read<=1'b1;
            enable_load_array<=1'b1;
            read_weight_memory<=1'b1;
            enable_load_activation_data<=1'b1;
            enable_store_activation_data<=1'b0;
            enable_cnt<=0;
            enable_cnt_weight<=1'b1;
            enable_down_cnt<=0;

            // load counter of ls array 
            ld_max_cnt<=1'b1;

            ld_max_down_cnt<=1'b1;
            
            ld_max_cnt_weight<=1'b1;
            
            state<=compute;
            end 
/*get_weight: begin


            enable_mxu<=1'b1;
            state<=compute;
            end 
*/
compute: begin

            //wm_ce<=1'b1;
            //infifo_read<=1'b1;
            enable_load_array<=1'b1;
            read_weight_memory<=1'b0;
            enable_load_activation_data<=0;
            enable_store_activation_data<=0;
            enable_cnt<=1'b1;
            enable_cnt_weight<=1'b0;
            enable_down_cnt<=1'b1;

            counter_compute<=counter_compute+1;
            enable_mxu<=1'b1;
            enable_enskew_ff<=1'b1; // input ff
            enable_deskew_ff<=1'b1; // output ff 
            if(counter_compute==(MAX_COUNTER)) begin 
            state<=save_to_fifo;
            enable_store_activation_data<=1'b1;
            end else begin 
            state<=state;            
            end 
             end

save_to_fifo: begin
            enable_load_array<=1'b1;   
            enable_store_activation_data<=1'b1;           
            enable_cnt<=1'b1;
            enable_cnt_weight<=1'b0;
            enable_down_cnt<=1'b1;

            enable_mxu<=1'b1;
            enable_enskew_ff<=1'b1; // input ff
            enable_deskew_ff<=1'b1; // output ff 
            outfifo_write<=1'b1;      
            //state<=save_to_fifo;
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

always @(csr_ce,data_precision) begin 
 // precision dependent
            case(data_precision)
                `INT8: begin 
                    max_cnt_from_cu=COLUMNS/(DATA_WIDTH_FIFO_IN/8);
                    max_down_cnt_from_cu= COLUMNS/(DATA_WIDTH_FIFO_IN/8);
                    max_cnt_weight_from_cu= ROWS;
                    end 
                `INT16: begin 
                    max_cnt_from_cu=COLUMNS/(DATA_WIDTH_FIFO_IN/16);
                    max_down_cnt_from_cu= COLUMNS/(DATA_WIDTH_FIFO_IN/16);
                    max_cnt_weight_from_cu= ROWS;
                    end
                `INT32: begin 
                    max_cnt_from_cu=COLUMNS/(DATA_WIDTH_FIFO_IN/32);
                    max_down_cnt_from_cu= COLUMNS/(DATA_WIDTH_FIFO_IN/32);
                    max_cnt_weight_from_cu= ROWS;
                    end
                `INT64:begin 
                    max_cnt_from_cu=COLUMNS/(DATA_WIDTH_FIFO_IN/64);
                    max_down_cnt_from_cu= COLUMNS/(DATA_WIDTH_FIFO_IN/64);
                    max_cnt_weight_from_cu= ROWS;
                    end
                default: begin 
            max_cnt_from_cu=0;
            max_down_cnt_from_cu=0;
            max_cnt_weight_from_cu=0;
            end
            endcase // data_precision
  end 
// debug
assign state_out=state;

endmodule