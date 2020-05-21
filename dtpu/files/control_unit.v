//==================================================================================================
//  Filename      : control_unit.v
//  Created On    : 2020-05-09 23:47:05
//  Last Modified : 2020-05-21 19:11:20
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology, Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com angione@student.chalmers.se s262620@studenti.polito.it  
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
input wire cs_continue,
output reg cs_ready,
output reg cs_done,
output reg cs_idle,

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
(* keep="true" *)output reg [ROWS*COLUMNS-1:0]read_weight_memory,
(* keep="true" *)output reg [COLUMNS:0]enable_load_activation_data,
(* keep="true" *)output reg [COLUMNS:0]enable_store_activation_data,
(* keep="true" *)output reg enable_cnt,
(* keep="true" *)output reg ld_max_cnt,
(* keep="true" *)output reg enable_cnt_weight,
(* keep="true" *)output reg ld_max_cnt_weight,
(* keep="true" *)output reg ld_weight_page_cnt,
(* keep="true" *)output reg [ADDRESS_SIZE_CSR-1:0]start_value_wm,
(* keep="true" *)output reg [$clog2(COLUMNS):0] max_cnt_from_cu,
(* keep="true" *)output reg [$clog2(ROWS*COLUMNS):0]max_cnt_weight_from_cu,

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
localparam request_data=4'h4;
localparam save_to_fifo=4'h5;
localparam start_p1=4'h6;
localparam start_p2=4'h7;
localparam start_p3=4'h8;
localparam get_data=4'h9;

localparam [$clog2(3*(COLUMNS-1)+ROWS+(ROWS/COLUMNS)):0]MAX_COUNTER= 3*(COLUMNS-1)+ROWS+ (ROWS/COLUMNS); 
reg [3:0]state;
reg [$clog2(3*(COLUMNS-1)+ROWS+ (ROWS/COLUMNS) ):0]counter_compute;
reg [$clog2(ROWS):0]counter_shift;
reg [$clog2(COLUMNS):0] counter_request;
reg [$clog2(ROWS):0]counter_save;
reg [$clog2(64):0]curr_data_width_computation; // max_bit width of computation
reg load_weight;
integer i;

always @(posedge clk) begin
if(reset) begin
state <= Power_up;
counter_compute<=0;
counter_save<=0;
load_weight<=0;
counter_request<=0;
counter_shift<=0;
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

ld_max_cnt<=0;
ld_max_cnt_weight<=0;

ld_weight_page_cnt<=0;
start_value_wm<=0;
counter_request<=0;

counter_compute<=0;
//counter_save<=0;
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
counter_save<=0;
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
        counter_shift<=0;
        //data_precision<=`INT32;
        if(cs_start && glb_enable)begin  
        state<=start_p1;
        cs_idle<=0;        
        end else begin 
        state<=state;

        end 
     end
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

            //loading the weight page counter 
            ld_weight_page_cnt<=1'b1;
            start_value_wm<=csr_dout[`A_WINDOW_WM_MSB-1:`A_WINDOW_WM_LSB];
            if(cs_start) begin 
            state<=request_data; 
            end else begin 
            state<=idle;
            end
            end
`ifdef PIPELINE
    //TODO pipeline it
    /*
            pipeline

                -> request_data
                    -> get_data
                        -> compute
                            -> save
    */
request_data: begin
            // recheck for 16x16
            infifo_read<=1'b1;
            // load counter of ls array 
            ld_max_cnt<=1'b1;
            ld_max_cnt_weight<=1'b1;
            enable_load_array<=1'b1;
            //[counter_request]

            enable_load_activation_data<=(1'b1<<(counter_request));
            enable_store_activation_data<=0;

            counter_request<=counter_request+1;
            if(counter_request<(COLUMNS/(DATA_WIDTH_FIFO_IN/curr_data_width_computation))-1) begin 
                state<=state;
            end else if(load_weight) begin 
                enable_mxu<=1'b1;
                enable_load_array<=1'b1;            
                enable_enskew_ff<=1'b1; // input ff
                enable_deskew_ff<=1'b1; // output ff 
                state<=compute;
            end else begin 
                state<=get_data;
                // anticipate first get data from memory
                wm_ce<=1'b1;
                enable_cnt_weight<=1'b1;
            end 
            end 
get_data: begin 
            enable_load_array<=1'b1;            
            enable_load_activation_data<= 0;
            enable_store_activation_data<=0;
            load_weight<=1'b1;
            wm_ce<=1'b1;
            enable_cnt_weight<=1'b1;
            //enable for ls weight
            // TODO Check does not load the weight for the upper part ( second array of ls units)
            read_weight_memory<= (1'b1<<((COLUMNS)*counter_shift+counter_save)) ;
            //if(counter_save<(ROWS*(COLUMNS/(DATA_WIDTH_WMEMORY/curr_data_width_computation))))begin 
            if(counter_shift<ROWS)begin
            state<=get_data;
                if(counter_save<(COLUMNS/(DATA_WIDTH_WMEMORY/curr_data_width_computation) -1))begin 
                    counter_save<=counter_save+1;
                end else begin 
                    counter_shift<=counter_shift+1;
                    counter_save<=0;
                end 
            end else begin 
            state<=compute;
            /*
            enable_mxu<=1'b1;
            enable_enskew_ff<=1'b1; // input ff
            enable_deskew_ff<=1'b1; // output ff */
            // counter clear
            counter_save<=0;
            end 
            end 
compute: begin
            enable_load_array<=1'b1;
            read_weight_memory<=0;
            enable_load_activation_data<=0;
            enable_store_activation_data<=0;
            //enable_cnt<=1'b1;
            enable_cnt_weight<=1'b0; // it should be active and also read weight memory and wm_ce

            counter_compute<=counter_compute+1;
            enable_mxu<=1'b1;
            enable_enskew_ff<=1'b1; // input ff
            enable_deskew_ff<=1'b1; // output ff 
            if(counter_compute==(MAX_COUNTER )) begin 
            state<=save_to_fifo;
            enable_store_activation_data<=(1'b1<<counter_save);
            end else begin 
            state<=state;            
            end 
             end

save_to_fifo: begin
            enable_load_array<=1'b1;    
            for(i=0;i<COLUMNS/(DATA_WIDTH_FIFO_OUT/curr_data_width_computation);i=i+1)begin
                enable_store_activation_data[i]<=1'b1;
            end
            //enable_store_activation_data<=(1'b1<<counter_save);
            enable_cnt_weight<=1'b0;
            // push the result in output fifo 
            outfifo_write<=1'b1;
            counter_save<=counter_save+1;
            //enable_mxu<=1'b1;
            //enable_enskew_ff<=1'b1; // input ff
            enable_deskew_ff<=1'b1; // output ff 
            if(counter_save<(ROWS/(DATA_WIDTH_FIFO_OUT/curr_data_width_computation))-1)begin 
            state<=state;
            enable_cnt<=1'b1; // onyl for sav
            end else begin 
            state<=done;
            end 
            end      



`endif
    

`ifndef PIPELINE    
request_data: begin
            // recheck for 16x16
            infifo_read<=1'b1;
            // load counter of ls array 
            ld_max_cnt<=1'b1;
            ld_max_cnt_weight<=1'b1;
            enable_load_array<=1'b1;
            //[counter_request]

            enable_load_activation_data<=(1'b1<<(counter_request));
            enable_store_activation_data<=0;

            counter_request<=counter_request+1;
            if(counter_request<(COLUMNS/(DATA_WIDTH_FIFO_IN/curr_data_width_computation))-1) begin 
                state<=state;
            end else if(load_weight) begin 
                enable_mxu<=1'b1;
                enable_load_array<=1'b1;            
                enable_enskew_ff<=1'b1; // input ff
                enable_deskew_ff<=1'b1; // output ff 
                state<=compute;
            end else begin 
                state<=get_data;
                // anticipate first get data from memory
                wm_ce<=1'b1;
                enable_cnt_weight<=1'b1;
            end 
            end 
get_data: begin 
            enable_load_array<=1'b1;            
            enable_load_activation_data<= 0;
            enable_store_activation_data<=0;
            load_weight<=1'b1;
            wm_ce<=1'b1;
            enable_cnt_weight<=1'b1;
            //enable for ls weight
            // TODO Check does not load the weight for the upper part ( second array of ls units)
            read_weight_memory<= (1'b1<<((COLUMNS)*counter_shift+counter_save)) ;
            //if(counter_save<(ROWS*(COLUMNS/(DATA_WIDTH_WMEMORY/curr_data_width_computation))))begin 
            if(counter_shift<ROWS)begin
            state<=get_data;
                if(counter_save<(COLUMNS/(DATA_WIDTH_WMEMORY/curr_data_width_computation) -1))begin 
                    counter_save<=counter_save+1;
                end else begin 
                    counter_shift<=counter_shift+1;
                    counter_save<=0;
                end 
            end else begin 
            state<=compute;
            /*
            enable_mxu<=1'b1;
            enable_enskew_ff<=1'b1; // input ff
            enable_deskew_ff<=1'b1; // output ff */
            // counter clear
            counter_save<=0;
            end 
            end 
compute: begin
            enable_load_array<=1'b1;
            read_weight_memory<=0;
            enable_load_activation_data<=0;
            enable_store_activation_data<=0;
            //enable_cnt<=1'b1;
            enable_cnt_weight<=1'b0; // it should be active and also read weight memory and wm_ce

            counter_compute<=counter_compute+1;
            enable_mxu<=1'b1;
            enable_enskew_ff<=1'b1; // input ff
            enable_deskew_ff<=1'b1; // output ff 
            if(counter_compute==(MAX_COUNTER )) begin 
            state<=save_to_fifo;
            enable_store_activation_data<=(1'b1<<counter_save);
            end else begin 
            state<=state;            
            end 
             end

save_to_fifo: begin
            enable_load_array<=1'b1;    
            for(i=0;i<COLUMNS/(DATA_WIDTH_FIFO_OUT/curr_data_width_computation);i=i+1)begin
                enable_store_activation_data[i]<=1'b1;
            end
            //enable_store_activation_data<=(1'b1<<counter_save);
            enable_cnt_weight<=1'b0;
            // push the result in output fifo 
            outfifo_write<=1'b1;
            counter_save<=counter_save+1;
            //enable_mxu<=1'b1;
            //enable_enskew_ff<=1'b1; // input ff
            enable_deskew_ff<=1'b1; // output ff 
            if(counter_save<(ROWS/(DATA_WIDTH_FIFO_OUT/curr_data_width_computation))-1)begin 
            state<=state;
            enable_cnt<=1'b1; // onyl for sav
            end else begin 
            state<=done;
            end 
            end       
`endif       
done: begin 
        /*if(!outfifo_is_full &&*/ if(!infifo_is_empty) begin
        state<=idle;
        cs_done<=1;
        end else begin
        state<=request_data;
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

always @(data_precision) begin : proc_data_width_curr
    case (data_precision)
     `INT8:  curr_data_width_computation<=8;   
     `INT16: curr_data_width_computation<=16;
     `INT32: curr_data_width_computation<=32;
     `INT64: curr_data_width_computation<=64;
    default: curr_data_width_computation<=0;
endcase // data_precision
end // proc_data_width_curr


always @(csr_ce,data_precision) begin 
 // precision dependent
            case(data_precision)
                `INT8: begin 
                    max_cnt_from_cu=COLUMNS/(DATA_WIDTH_FIFO_IN/8);
                    max_cnt_weight_from_cu= ROWS*COLUMNS;
                    end 
                `INT16: begin 
                    max_cnt_from_cu=COLUMNS/(DATA_WIDTH_FIFO_IN/16);
                    max_cnt_weight_from_cu= ROWS*COLUMNS;
                    end
                `INT32: begin 
                    max_cnt_from_cu=COLUMNS/(DATA_WIDTH_FIFO_IN/32);
                    max_cnt_weight_from_cu= ROWS*COLUMNS;
                    end
                `INT64:begin 
                    max_cnt_from_cu=COLUMNS/(DATA_WIDTH_FIFO_IN/64);
                    max_cnt_weight_from_cu=ROWS*COLUMNS;
                    end
                default: begin 
            max_cnt_from_cu=0;
            max_cnt_weight_from_cu=0;
            end
            endcase // data_precision
  end 



// debug
assign state_out=state;

endmodule