`timescale 1ns / 1ps
`include "csr_definition.vh"

module control_unit 
#(parameter DATA_WIDTH_FIFO_IN=64,DATA_WIDTH_FIFO_OUT=64, DATA_WIDTH_WMEMORY=64,DATA_WIDTH_CSR=8,ADDRESS_SIZE_CSR=32,ADDRESS_SIZE_WMEMORY=32)
(
clk,
reset,
enable,
test_mode,
csr_address,               
csr_din,
csr_dout,
csr_ce,
csr_reset,
csr_we,
wm_address,
wm_din,
wm_dout,
wm_ce,
wm_reset,
wm_we,
infifo_is_empty,
infifo_dout,
infifo_read,
outfifo_is_full,
outfifo_din,
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
input enable;
////////////////////////////
////// CSR INTERFACE ///////
////////////////////////////
output wire         csr_ce;
input wire [DATA_WIDTH_CSR-1:0]    csr_dout;
output wire [DATA_WIDTH_CSR-1:0]   csr_din;
output wire         csr_we;
output wire [ADDRESS_SIZE_CSR-1:0]    csr_address;
output wire         csr_reset;
////////////////////////////
////// WEIGHT MEMORY ///////
///////////////////////////
output wire  wm_ce;
input wire [DATA_WIDTH_WMEMORY-1:0]       wm_dout;
output wire [DATA_WIDTH_WMEMORY-1:0]       wm_din;
output wire              wm_we;  
output wire [ADDRESS_SIZE_WMEMORY-1:0]  wm_address;
output wire           wm_reset;
////////////////////////////////////////////
/////////// INPUT DATA FIFO ////////////////
////////////////////////////////////////////
/////////// using stream axi 
input wire [DATA_WIDTH_FIFO_IN-1:0] infifo_dout;
output wire infifo_read; 
input wire infifo_is_empty;
////////////////////////////////////////////
/////////// OUTPUT DATA FIFO ///////////////
////////////////////////////////////////////
/////////// using stream axi 
output wire [DATA_WIDTH_FIFO_OUT-1:0] outfifo_din;
output wire outfifo_write;
input wire outfifo_is_full;
////////////////////////////////////////////
/////////// CONTROL FROM/TO PS /////////////
////////////////////////////////////////////             
input wire cs_start;
output wire cs_ready;
output wire cs_done;
input wire cs_continue;
output wire cs_idle;
            
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
reg [1:0]State;
localparam Start = 2'b00;
localparam Idle = 2'b01;
localparam Work = 2'b11;
localparam Done = 2'b10;
reg tReset;


always @(posedge clk) begin
tReset <= reset;
if(tReset) begin
State <= Start;
end else begin
case(State)
Start: begin
State <= Idle;
end
Idle: begin
State <= Work;
end
Work: begin
State <= Done;
end
Done: begin
State <= Idle;
end
default:;
endcase
end
end

endmodule