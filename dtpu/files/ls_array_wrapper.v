`timescale 1ns /1ps

`include "precision_def.vh"

module ls_array_wrapper
#(  parameter ROWS=4,
    COLUMNS=4,
    data_in_width=64,
    data_in_mem=64,
    address_leng_wm=32,
    size_wmemory=2048)
( 
input clk,
input reset_n,
input enable_load_array,
input [`LOG_ALLOWED_PRECISIONS-1:0]data_precision,

input infifo_read,
input outfifo_write,
input read_weight_memory,

input [data_in_width-1:0] input_data_from_fifo,
output wire [data_in_width-1:0]data_to_fifo_out,

input enable_load_activation_data,
input enable_store_activation_data,

input [data_in_mem-1:0]data_from_weight_memory,
input [data_in_width*ROWS-1:0]data_from_mxu,

output wire [data_in_width*COLUMNS-1:0] data_to_mxu,
output wire [data_in_width*ROWS-1:0] weight_to_mxu,


output wire [address_leng_wm-1:0]wm_address,

input enable_cnt,
input ld_max_cnt,
input enable_down_cnt,
input ld_max_down_cnt,
input [$clog2(COLUMNS):0]max_cnt_from_cu, // it depends on the current bitwidth
input [$clog2(ROWS):0]max_down_cnt_from_cu,
input enable_cnt_weight,
input ld_max_cnt_weight,
input [$clog2(ROWS):0]max_cnt_weight_from_cu


);


ls_array #(  .ROWS(ROWS),
      .COLUMNS(COLUMNS),
      .data_in_width(data_in_width),
      .data_in_mem(data_in_mem),
      .address_leng_wm(address_leng_wm),
      .size_wmemory(size_wmemory)) 
   ls_array_sv (
  .clk(clk),
  .reset_n(reset_n),
  .enable_load_array(enable_load_array),
  .data_precision(data_precision),
  .read_weight_memory(read_weight_memory),
  .infifo_read(infifo_read),
  .outfifo_write(outfifo_write),
  .input_data_from_fifo(input_data_from_fifo), //[data_in_width-1:0]
  .data_to_fifo_out(data_to_fifo_out), //[data_in_width-1:0]
  .data_from_weight_memory(data_from_weight_memory), //[data_in_mem-1:0]
  .data_from_mxu(data_from_mxu), //[data_in_width*ROWS-1:0] 
  .data_to_mxu(data_to_mxu), //[data_in_width*COLUMNS-1:0]
  .weight_to_mxu(weight_to_mxu), //[data_in_width*ROWS-1:0]
  .wm_address(wm_address), //[address_leng_wm-1:0]
  .enable_load_activation_data(enable_load_activation_data),
  .enable_store_activation_data(enable_store_activation_data),
  .enable_cnt(enable_cnt),
  .ld_max_cnt(ld_max_cnt),
  .enable_down_cnt(enable_down_cnt),
  .ld_max_down_cnt(ld_max_down_cnt),
  .enable_cnt_weight(enable_cnt_weight),
  .ld_max_cnt_weight(ld_max_cnt_weight),
  .max_cnt_from_cu(max_cnt_from_cu), // it depends on the current bitwidt [$clog2(COLUMNS):0]
  .max_down_cnt_from_cu(max_down_cnt_from_cu), //[$clog2(ROWS):0]
  .max_cnt_weight_from_cu(max_cnt_weight_from_cu) //[$clog2(ROWS):0]
);

endmodule : ls_array_wrapper