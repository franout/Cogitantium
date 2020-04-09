`timescale 1ns /1ps
module ls_array 
#(  parameter ROWS=4,
    COLUMNS=4,
    max_data_width=8,
    data_in_width=64,
    data_in_mem=64)
( 
input clk,
input reset_n,
input load_in_reg,
input infifo_read,
input [data_in_width-1:0] input_data_from_fifo,

output [data_in_width*COLUMNS-1:0] data_to_mxu,
output [data_in_width*ROWS-1:0] weight_to_mxu,


input enable_cnt,
input ld_max_cnt,
input [0:0]max_cnt_from_cu // it depends on the current bitwidth

);

reg [$clog2(COLUMNS):0] counter;
reg [$clog2(COLUMNS):0] max_cnt;


//////////////////////////////////////
/////  precision decoder  ////////////
/////////////////////////////////////

always @(*) begin 
/*case ()

endcase*/
end 


////////////////////////////
///// inv - mux ////////////
///////////////////////////
always @(posedge(clk)) begin 
if(reset_n) begin 
counter<=0;
end else begin 

   if(enable_cnt) begin 
        counter<=counter+1;
        if(counter==max_cnt) begin 
        counter<=0;        
        end
    end else if (ld_max_cnt) begin 
    max_cnt<=max_cnt_from_cu;
    end
end 
end 

reg [data_in_width-1:0]activation_data[0:COLUMNS-1] ;
integer i;
always @(*) begin 
if(load_in_reg && infifo_read) begin 
        for(i=0;i<COLUMNS;i=i+1) begin 
        activation_data[i]=0;
        end 
       case (counter)  
       5'b00000:  activation_data[0]<=input_data_from_fifo;
       5'b00001:   activation_data[1]<=input_data_from_fifo;
       5'b00010:   activation_data[2]<=input_data_from_fifo;
       5'b00011:  activation_data[3]<=input_data_from_fifo;
       5'b00100:  activation_data[4]<=input_data_from_fifo;
       5'b00101: activation_data[5]<=input_data_from_fifo;
       5'b00110:  activation_data[6]<=input_data_from_fifo;
       5'b00111:  activation_data[7]<=input_data_from_fifo;
       5'b01000:  activation_data[8]<=input_data_from_fifo;
       5'b01001:  activation_data[9]<=input_data_from_fifo;
       5'b01010:  activation_data[10]<=input_data_from_fifo;
       5'b01011:  activation_data[11]<=input_data_from_fifo;
       5'b01100:  activation_data[12]<=input_data_from_fifo;
       5'b01101:  activation_data[13]<=input_data_from_fifo;
       5'b01110:  activation_data[14]<=input_data_from_fifo;
       5'b01111:  activation_data[15]<=input_data_from_fifo;     
       5'b10000:activation_data[16]<=input_data_from_fifo;
       5'b10001:activation_data[17]<=input_data_from_fifo;
       5'b10010:activation_data[18]<=input_data_from_fifo;
       5'b10011:activation_data[19]<=input_data_from_fifo;
       5'b10100:activation_data[20]<=input_data_from_fifo;
       5'b10101:activation_data[21]<=input_data_from_fifo;
       5'b10110:activation_data[22]<=input_data_from_fifo;
       5'b10111:activation_data[23]<=input_data_from_fifo;
       5'b11000:activation_data[24]<=input_data_from_fifo;
       5'b11001:activation_data[25]<=input_data_from_fifo;
       5'b11010:activation_data[26]<=input_data_from_fifo;
       5'b11011:activation_data[27]<=input_data_from_fifo;
       5'b11100:activation_data[28]<=input_data_from_fifo;
       5'b11101:activation_data[29]<=input_data_from_fifo;
       5'b11101:activation_data[30]<=input_data_from_fifo;
       5'b11111:activation_data[31]<=input_data_from_fifo;
       default: 
       for(i=0;i<COLUMNS;i=i+1) begin 
               activation_data[i]=0;
               end 
       endcase
     
end
end 



//////////////////////////////
//////// COLUMNS /////////////
//////////////////////////////
 genvar j;
 generate
 for (j=0;j<COLUMNS ;j=j+1) begin 
  ls_unit #() ls_unit_j ();
 end 
 endgenerate

//////////////////////////////
/////// FILTER AND SELECT ////
//////////////////////////////

filter_and_select  #(.K(COLUMNS),.bit_width_so(max_data_width)) 
filter_and_select_activation_data
 ();


//////////////////////////////
/////////  COMPACTOR   ///////
//////////////////////////////

compact_and_select #() compact_and_select_output_data();


//////////////////////////////
////////// ROWS //////////////
//////////////////////////////
 generate
 for (j=0;j<ROWS ;j=j+1) begin 
ls_unit_weight #(.data_width_mem(data_in_mem))
 ls_unit_weight_j (
    .clk(clk),
    .reset_n(reset_n),
    .load_in_reg(),
    .data_from_mem(),
    .weigth()
  
);
 end 
 endgenerate
 
 

reg [$clog2(ROWS)-1:0] counter_weight;
//////////////////////////////////////////////
//// address generator for memory weigth /////
//////////////////////////////////////////////

always @(posedge(clk)) begin
if(!reset_n) begin
counter_weight<=0;
end else begin
counter_weight<=counter_weight+1;
end 
end 

reg enable_ls_w[0:ROWS-1];
integer k;
// generate decoder for activating load of weight data in ls unit

 

//// compose address request to memory 
//assign  = { ,counter_weight};



endmodule