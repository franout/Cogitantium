//==================================================================================================
//  Filename      : ls_array.v
//  Created On    : 2020-05-09 23:46:47
//  Last Modified : 2020-05-14 22:52:35
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology, Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com angione@student.chalmers.se s262620@studenti.polito.it  
//
//  Description   : 
//
//
//==================================================================================================

`timescale 1ns /1ps

`include "precision_def.vh"

module ls_array 
#(  parameter ROWS=4,
    COLUMNS=4,
    data_in_width=64,
    data_in_mem=64,
    address_leng_wm=32,
    size_wmemory=2048)
( 
input clk,
input reset,
input enable_load_array,
input [`LOG_ALLOWED_PRECISIONS-1:0]data_precision,

input infifo_read,
input outfifo_write,
input [ROWS*COLUMNS-1:0]read_weight_memory,

input [data_in_width-1:0] input_data_from_fifo,
output wire [data_in_width-1:0]data_to_fifo_out,

input [COLUMNS:0]enable_load_activation_data,
input [COLUMNS:0]enable_store_activation_data,

input [data_in_mem-1:0]data_from_weight_memory,
input [data_in_width*ROWS-1:0]data_from_mxu,

output wire [data_in_width*COLUMNS-1:0] data_to_mxu,
output wire [data_in_width*ROWS*COLUMNS-1:0] weight_to_mxu,


output reg [address_leng_wm-1:0]wm_address,

input enable_cnt,
input ld_max_cnt,
input ld_weight_page_cnt,
input [address_leng_wm-1:0]start_value_wm,

input [$clog2(COLUMNS):0]max_cnt_from_cu, // it depends on the current bitwidth
input enable_cnt_weight,
input ld_max_cnt_weight,
input [$clog2(ROWS*COLUMNS):0]max_cnt_weight_from_cu


);

reg [$clog2(COLUMNS):0] counter;
reg [$clog2(COLUMNS):0] max_cnt;



wire [data_in_width*COLUMNS-1:0]data_to_select_to_mxu;
wire  [data_in_width*ROWS-1:0]data_to_save_from_compacter;
wire [data_in_width*COLUMNS-1:0]data_weigth_to_select_to_mxu[0:ROWS-1];

wire [data_in_width-1:0]activation_data[0:COLUMNS-1] ;
wire [data_in_width-1:0]weight_data[0:ROWS*COLUMNS-1] ;
wire [data_in_width-1:0]data_to_save[0:COLUMNS-1];


reg [$clog2(ROWS*COLUMNS)-1:0]counter_weight;
reg [address_leng_wm-$clog2(ROWS*COLUMNS)-1:0]counter_weight_page;
reg [$clog2(ROWS*COLUMNS):0]max_cnt_weight;
reg tc_counter_weight;

reg internal_enable_ls_unit_activation_data[0:COLUMNS-1];
reg [COLUMNS-1:0]internal_enable_ls_unit_weight[0:ROWS-1];

integer i,j;

 genvar k,l;

//////////////////////////////////////////////////
///////        precision decoder           ///////
////// for avoiding non needed ff switch  ////////
//////////////////////////////////////////////////


always @(data_precision,enable_load_array)begin 
if(enable_load_array) begin
case (data_precision) 
`INT8: begin 
    // enable for activation data ls
     for(i=0;i<COLUMNS;i=i+1) begin 
        if(i<COLUMNS/(data_in_width/8)) begin 
        internal_enable_ls_unit_activation_data[i]=1'b1;
        end else begin 
        internal_enable_ls_unit_activation_data[i]=1'b0;
        end
     end
     //enable for weight ls
     for(i=0;i<ROWS;i=i+1) begin 
        for(j=0;j<COLUMNS;j=j+1)begin 
          if(j<COLUMNS/(data_in_width/8)) begin 
             internal_enable_ls_unit_weight[i][j]=1'b1;
             end else begin 
             internal_enable_ls_unit_weight[i][j]=1'b0;
             end
          end 
       end 
    end
`INT16:begin 
            // enable for activation data ls
     for(i=0;i<COLUMNS;i=i+1) begin 
        if(i<COLUMNS/(data_in_width/16)) begin 
        internal_enable_ls_unit_activation_data[i]=1'b1;
        end else begin 
        internal_enable_ls_unit_activation_data[i]=1'b0;
        end
     end
     //enable for weight ls
     for(i=0;i<ROWS;i=i+1) begin 
        for(j=0;j<COLUMNS;j=j+1)begin 
          if(j<COLUMNS/(data_in_width/16)) begin 
             internal_enable_ls_unit_weight[i][j]=1'b1;
             end else begin 
             internal_enable_ls_unit_weight[i][j]=1'b0;
             end
          end 
       end 
     end 
`INT32:begin 
  // enable for activation data ls
     for(i=0;i<COLUMNS;i=i+1) begin 
        if(i<COLUMNS/(data_in_width/32)) begin 
        internal_enable_ls_unit_activation_data[i]=1'b1;
        end else begin 
        internal_enable_ls_unit_activation_data[i]=1'b0;
        end
     end
     //enable for weight ls
for(i=0;i<ROWS;i=i+1) begin 
        for(j=0;j<COLUMNS;j=j+1)begin 
          if(j<COLUMNS/(data_in_width/32)) begin 
             internal_enable_ls_unit_weight[i][j]=1'b1;
             end else begin 
             internal_enable_ls_unit_weight[i][j]=1'b0;
             end
          end 
       end 
    end
`INT64:begin 
        // enable for activation data ls
     for(i=0;i<COLUMNS;i=i+1) begin 
        if(i<COLUMNS/(data_in_width/64)) begin 
        internal_enable_ls_unit_activation_data[i]=1'b1;
        end else begin 
        internal_enable_ls_unit_activation_data[i]=1'b0;
        end
     end
     //enable for weight ls
for(i=0;i<ROWS;i=i+1) begin 
        for(j=0;j<COLUMNS;j=j+1)begin 
          if(j<COLUMNS/(data_in_width/64)) begin 
             internal_enable_ls_unit_weight[i][j]=1'b1;
             end else begin 
             internal_enable_ls_unit_weight[i][j]=1'b0;
             end
          end 
       end 
    end 
default: begin 
        for(i=0;i<ROWS;i=i+1) begin 
          for(j=0;j<COLUMNS;j=j+1) begin 
        internal_enable_ls_unit_weight[i][j]=1'b0;          
      end
       end
       for(i=0;i<COLUMNS;i=i+1) begin 
        internal_enable_ls_unit_activation_data[i]=1'b0;         
       end
      end
endcase
end else begin 
    for(i=0;i<ROWS;i=i+1) begin 
     for(j=0;j<COLUMNS;j=j+1) begin 
        internal_enable_ls_unit_weight[i][j]=1'b0;          
      end
       end
       for(i=0;i<COLUMNS;i=i+1) begin 
        internal_enable_ls_unit_activation_data[i]=1'b0;         
       end
end 
end 


////////////////////////////
///// inv - mux ////////////
///////////////////////////
always @(posedge(clk)) begin 
if(reset) begin 
counter<=0;
end else begin 
  if(enable_load_array)begin 
    // up counter for data out 
   if(enable_cnt) begin
        counter<=counter+1;
        if(counter==max_cnt-1) begin 
        counter<=0;        
        end
    /*end else begin 
       counter<=0;  */         
    end 
    
    if (ld_max_cnt) begin 
    max_cnt<=max_cnt_from_cu;
    end
           
end 
end
end 

/////////////////////////////////////////////
/////////// DE-MUX for activation data //////
///////////////////////////////////////////// 
generate
for(l=0;l<COLUMNS;l=l+1) begin
    assign activation_data[l]= infifo_read &&  enable_load_activation_data[l] ? input_data_from_fifo : 0;
      end 
endgenerate

///////////////////////////////////////
//////// MUX FOR OUT DATA /////////////
///////////////////////////////////////

assign data_to_fifo_out= outfifo_write ?  data_to_save[counter] : 64'd0;

//////////////////////////////
//////// COLUMNS /////////////
//////////////////////////////
 generate
 for (k=0;k<COLUMNS ;k=k+1)
  begin: ls_unit_activation_data 
  ls_unit #( .data_width(data_in_width)) ls_unit (
            .clk(clk),
            .reset(reset),
            .enable(enable_load_array &  internal_enable_ls_unit_activation_data[k]),
            .load_enable(enable_load_activation_data[k]),
            .store_enable(enable_store_activation_data[k]),
            .data_load_input(activation_data[k]),
            .data_load_output(data_to_select_to_mxu[data_in_width+k*data_in_width-1 : k*data_in_width ]),
            .data_store_input(data_to_save_from_compacter[data_in_width+k*data_in_width-1 : k*data_in_width ]),
            .data_store_output(data_to_save[k])
            );
 end 
 endgenerate

//////////////////////////////
/////// FILTER AND SELECT ////
//////////////////////////////
 filter_and_select 
#( .K(COLUMNS),
   .data_width(data_in_width)        
   )filter_and_select_data_input 
(
 .data_in(data_to_select_to_mxu),
.data_out(data_to_mxu),
.data_select(data_precision)
);



//////////////////////////////
/////////  COMPACTOR   ///////
//////////////////////////////

compact_and_select #( .K(ROWS),
   .data_width(data_in_width))     
    compact_and_select_output_data(
     .data_in(data_from_mxu),
    .data_out(data_to_save_from_compacter),
    .data_select(data_precision)
    );


///////////////////////////////////////////////////////
////////// ROWS - COLUMNS weight matrix  //////////////
///////////////////////////////////////////////////////
 generate
  for(l=0;l<ROWS;l=l+1)
   begin: ls_unit_weights_l
 for (k=0;k<COLUMNS  ;k=k+1)
  begin: ls_unit_weights_k
ls_unit #( .data_width(data_in_width)) ls_unit_weights_l_k (
            .clk(clk),
            .reset(reset),
            .enable(enable_load_array & internal_enable_ls_unit_weight[l][k]),
            .load_enable(read_weight_memory[l*COLUMNS+k]),
            .store_enable(),
            .data_load_input(weight_data[l*COLUMNS+k]),
            .data_load_output(data_weigth_to_select_to_mxu[l][(k+1)*data_in_width-1:k*data_in_width]),
            .data_store_input(),
            .data_store_output()
            );
 end 


filter_and_select 
#( .K(COLUMNS),
   .data_width(data_in_width)        
   )filter_and_select_weight_l
(
 .data_in(data_weigth_to_select_to_mxu[l]),
.data_out(weight_to_mxu[(l+1)*COLUMNS*data_in_width-1:l*COLUMNS*data_in_width]),
.data_select(data_precision)
);

end 
 endgenerate
 
 
 
 /////////////////////////////////////////////
 //////////// DE-MUX for weight data /////////
 ///////////////////////////////////////////// 
generate
for(l=0;l<ROWS*COLUMNS;l=l+1) begin
    assign weight_data[l]= read_weight_memory[l] ? data_from_weight_memory : 0;
end 
endgenerate


//////////////////////////////////////////////
//// address generator for memory weigth /////
//////////////////////////////////////////////
// lower part of the address, it is also the
// switching counter of the ls internal array 
always @(posedge(clk)) begin
if(reset) begin
counter_weight<=0;
counter_weight_page<=0;
tc_counter_weight<=1'b0;
end else begin
    if(enable_load_array)begin 
      // up counter for weight memory 
         if(enable_cnt_weight) begin
            counter_weight<=counter_weight+1;
            tc_counter_weight<=1'b0;
            if(counter_weight==max_cnt_weight-1 ) begin 
            counter_weight<=0;
            tc_counter_weight<=1'b1;
            // higher part of the address 
           // through all the pages in the internal memory 
              counter_weight_page<=counter_weight_page+1;
            end

            if({counter_weight_page ,counter_weight[$clog2(ROWS*COLUMNS)-1:0]}==size_wmemory-1) begin 
              counter_weight_page<=0;
              counter_weight<=0;
            end 
    end
    if (ld_max_cnt_weight) begin 
    max_cnt_weight<=max_cnt_weight_from_cu;
    end

    if(ld_weight_page_cnt) begin
      counter_weight_page<=start_value_wm[address_leng_wm-1:$clog2(ROWS*COLUMNS)];
    end 

//// compose address request to memory 
wm_address <= enable_cnt_weight ? {counter_weight_page ,counter_weight[$clog2(ROWS*COLUMNS)-1:0]} : 32'b0 ;

end 
/* else begin 
                counter_weight<=0;
                counter_weight_page<=0;
    end*/

end 
end




endmodule