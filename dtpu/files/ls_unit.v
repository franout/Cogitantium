`timescale 1ns/1ps
module ls_unit
#(parameter data_width=64 )
 (
 input clk,
 input resetn,
 input enable,
 input load_enable,
 input store_enable,
 input [data_width-1:0]data_load_input,
 output reg [data_width-1:0]data_load_output,
 input [data_width-1:0]data_store_input,
 output reg [data_width-1:0] data_store_output
);

reg [data_width-1:0]data_load_i;
reg [data_width-1:0]data_store_i;

/// load process
always @(posedge(clk)) begin 
if(!resetn) begin 
data_load_i<=0;
end else begin 
    if(enable && load_enable) begin 
      data_load_i<=data_load_input;
    end else begin 
    data_load_i<=data_load_i;
    end 
end
  data_load_output=data_load_i; 
end 

/// store process
always @(posedge(clk)) begin 
if(!resetn) begin 
data_store_i<=0;
end else begin 
    if(enable && store_enable) begin 
    data_store_i<=data_store_input;
    end else begin 
    data_store_i<=data_store_i;
    end 
end 
    data_store_output=data_store_i;
end 

endmodule