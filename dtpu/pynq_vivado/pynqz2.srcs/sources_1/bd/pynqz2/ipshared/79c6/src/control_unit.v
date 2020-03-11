`timescale 1ns / 1ps
`include "csr_definition.vh"

module control_unit 
#(parameter DATA_WIDTH_FIFO_IN=64,DATA_WIDTH_FIFO_OUT=64, DATA_WIDTH_WMEMORY=64,DATA_WIDTH_CSR=8,ADDRESS_SIZE_CSR=32,ADDRESS_SIZE_WMEMORY=32)
(
clk,
reset,
enable_mxu,
test_mode,
csr_address,               
csr_dout,
csr_ce,
csr_reset,
csr_we,
wm_address,
wm_ce,
wm_reset,
wm_we,
infifo_is_empty,
infifo_read,
outfifo_is_full,
outfifo_write,
cs_done,
cs_continue,
cs_idle,
cs_ready,
cs_start
);
input clk;
input reset;
input test_mode;
output reg enable_mxu;
////////////////////////////
////// CSR INTERFACE ///////
////////////////////////////
output reg         csr_ce;
input wire [DATA_WIDTH_CSR-1:0]    csr_dout;
output reg         csr_we;
output reg [ADDRESS_SIZE_CSR-1:0]    csr_address;
output reg         csr_reset;
////////////////////////////
////// WEIGHT MEMORY ///////
///////////////////////////
output reg  wm_ce;
output reg              wm_we;  
output reg [ADDRESS_SIZE_WMEMORY-1:0]  wm_address;
output reg           wm_reset;
////////////////////////////////////////////
/////////// INPUT DATA FIFO ////////////////
////////////////////////////////////////////
/////////// using stream axi 
output reg infifo_read; 
input wire infifo_is_empty;
////////////////////////////////////////////
/////////// OUTPUT DATA FIFO ///////////////
////////////////////////////////////////////
/////////// using stream axi 
output reg outfifo_write;
input wire outfifo_is_full;
////////////////////////////////////////////
/////////// CONTROL FROM/TO PS /////////////
////////////////////////////////////////////             
input wire cs_start;
output reg cs_ready;
output reg cs_done;
input wire cs_continue;
output reg cs_idle;
            
     //// stream to memory bram                     
/*The Accelerator Adapter core ensures that the entire data packet has
 been received (as marked by tlast on the final data beat) 
before issuing a task-start signal to the accelerator over the ap_ctrl (acc_handshake) bus.*/



// stream to fifo 
/*
Unlike the S2M interface, for which the Accelerator Adapter 
core waits until tlast is asserted before issuing a task-start signal to the accelerator, 
any input packet sent over an S2F interface is not treated as part of the input barrier group. T
*/


// memory to stream 
/*
The Accelerator Adapter core does not initiate this 
data stream (by asserting TVALID) until the accelerator has issued the ap_done signal
 over the acc_handshake interface, and terminates the 
 stream by asserting tlast on the final data beat. T
*/




// fifo to stream 
/*
Unlike the M2S interface, for which the Accelerator 
Adapter core waits until ap_done is asserted before 
initiating the data stream by asserting tvalid, the 
output stream is available to the AXI4-Stream transport 
network with a single data beat latency. The AXI4-Stream 
tlast signal is only asserted with the 
final data beat when the accelerator asserts task completion by 
ap_done over the acc_handshake bus.
*/



/*
It then waits the done signal before reading any additional commands from the queue. 
Generation of the accelerator start signal is based on two main inputs:
•Status of the input and output buffers and scalars (for example, req/ack signal from each Multi-Buffer signaling if there 
is data available in the input Multi-Buffers or if there is a Multi-Buffer free at the output).
•Software Control registers, which specify the input/output Multi-Buffers to consider when triggering the accelerator 
(that is, generate the start signal
AXI4-Stream Accelerator Adapter v2.1www.xilinx.com11PG081 November 18, 2015Chapter 1:OverviewAdditionally, 
there are commands to specify the activation of a specific input/output Multi-Buffers and/or scalars. 
This mechanism supports task pipelining by the means of specific command to the command queue.
This mechanism can be used to implement slow-changing data buffers (for example, it can be used to implement
 Quasi-Static buffers, which are buffers where the data does not change in 
each call to the accelerator) or applications where the output buffer(s) is used to accumulate multiple calls to the accelerator

*/


/*ap_start, ap_ready, ap_done) are used to transfer the ownership of the data buffers*/


/* the axi adapter has also a csr for its own regarding buffers  control and status */
//// FSM /////
reg [3:0]state;
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

reg tReset;


always @(posedge clk) begin
tReset <= reset;
if(tReset) begin
state <= Power_up;

end else begin
///// standard assignment
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
case(state) 
Power_up: begin
         state<=idle;
         // reset memories
         csr_reset<=1;
         wm_reset<=1;
        end
idle: begin
        cs_idle<=1;
        if(!cs_start)begin  
        state<=state;        
        end else begin 
        state<=start_p1;
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
                // first set of fata TODO it the full implementation if should loop for all the rows and force the flush of output fifo
                
                     wm_address<=0;
                     wm_ce<=1'b1;
                if( !infifo_is_empty && !outfifo_is_full) begin 
                state<=activate_enable_data_type;
                end else begin 
                state<=state;                
                end 
                 end

activate_enable_data_type: begin
                            // skip for now TODO it should read the csr
                            csr_ce<=1;
                            enable_mxu<=1'b1;
                             wm_ce<=1'b1;
                            state<=compute;
                         end

compute: begin
            enable_mxu<=1'b1;
             wm_ce<=1'b1;
            outfifo_write<=1'b1;
            infifo_read<=1'b1;
            if(outfifo_is_full && !infifo_is_empty) begin 
            state<=flush_out_fifo;
            end else if(infifo_is_empty) begin 
             state<=flush_out_fifo;
            end else begin 
            state<=state;
            end
             end

stop: begin end // skip for the moment 
flush_out_fifo: begin
                outfifo_write<=1'b1; // force the flush
                if(infifo_is_empty) begin 
                state<=done;
                end else if (!infifo_is_empty && outfifo_is_full) begin
                // wait for the flush of out fifo 
                state<=state;
                end else begin 
                // it is not full ( outfifo ) and input fifo not empty
                state<=compute; 
                end 
    
             end
done: begin 
      state<=idle;
      cs_done<=1;
      end          
default: begin 
    state<=Power_up;
         cs_idle<=0;
        cs_ready<=0;
    end
endcase
end

end 

endmodule