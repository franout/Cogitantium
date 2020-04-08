`timescale 1ns /1ps
module ls_array 
#(  parameter ROWS=4,
    COLUMNS=4,
    max_data_width=8,
    data_in_width=64)
( 
input clk,
input reset_n,
input load_in_reg,
input infifo_read,
input [data_in_width-1:0] input_data_from_fifo



);

reg [$clog2(COLUMNS):0] counter;


////////////////////////////
///// inv - mux ////////////
///////////////////////////
always @(posedge(clk)) begin 
if(reset_n) begin 
counter<=0;
end else begin 
counter<=counter+1;
    // variable max count TODO
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
 
 end 
 endgenerate

//////////////////////////////
/////// FILTER AND SELECT ////
//////////////////////////////

filter_and_select  #(.K(COLUMNS),.bit_width_so(max_data_width)) 
filter_and_select_activation_data
 ();



//////////////////////////////
////////// ROWS //////////////
//////////////////////////////





endmodule