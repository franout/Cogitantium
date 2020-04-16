`timescale 1ns /1ps

`include "precision_def.vh"

module ls_array 
#(  parameter ROWS=4,
    COLUMNS=4,
    data_in_width=64,
    data_in_mem=64,
    address_leng_wm=32)
( 
input clk,
input reset_n,
input enable_load_array,
input [`LOG_ALLOWED_PRECISIONS-1:0]data_precision,

input infifo_read,
input outfifo_write,
input read_weight_memory,

input [data_in_width-1:0] input_data_from_fifo,
output reg [data_in_width-1:0]data_to_fifo_out,

input enable_load_activation_data,
input enable_store_activation_data,

input [data_in_mem-1:0]data_from_weight_memory,
input [data_in_width*ROWS-1:0]data_from_mxu,

output [data_in_width*COLUMNS-1:0] data_to_mxu,
output [data_in_width*ROWS-1:0] weight_to_mxu,


output [address_leng_wm-1:0]wm_address,

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

reg [$clog2(COLUMNS)-1:0] counter;
reg [$clog2(COLUMNS):0] max_cnt;

reg [$clog2(ROWS)-1:0]counter_out;
reg [$clog2(ROWS):0] max_down_cnt;


wire [data_in_width*COLUMNS-1:0]data_to_select_to_mxu;
wire  [data_in_width*ROWS-1:0]data_to_save_from_compacter;
wire [data_in_width*ROWS-1:0]data_weigth_to_select_to_mxu;

reg [data_in_width-1:0]activation_data[0:31] ;
reg [data_in_width-1:0]weight_data[0:31] ;
wire [data_in_width-1:0]data_to_save[0:31];

reg [address_leng_wm-1:0]address_out;
reg [$clog2(ROWS)-1:0]counter_weight;
reg [address_leng_wm-$clog2(ROWS)-1:0]counter_weight_page;
reg [$clog2(ROWS):0]max_cnt_weight;
reg tc_counter_weight;

reg internal_enable_ls_unit_activation_data[0:COLUMNS-1];
reg internal_enable_ls_unit_weight[0:ROWS-1];

integer i;


// initialize only at the beginning 
initial begin 
for(i=0;i<COLUMNS;i=i+1) begin 
       activation_data[i]=0;
end 
for(i=0;i<ROWS;i=i+1) begin 
    weight_data[i]=0;
end
end 

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
          if(i<ROWS/(data_in_width/8)) begin 
             internal_enable_ls_unit_weight[i]=1'b1;
             end else begin 
             internal_enable_ls_unit_weight[i]=1'b0;
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
          if(i<ROWS/(data_in_width/16)) begin 
             internal_enable_ls_unit_weight[i]=1'b1;
             end else begin 
             internal_enable_ls_unit_weight[i]=1'b0;
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
          if(i<ROWS/(data_in_width/32)) begin 
             internal_enable_ls_unit_weight[i]=1'b1;
             end else begin 
             internal_enable_ls_unit_weight[i]=1'b0;
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
          if(i<ROWS/(data_in_width/64)) begin 
             internal_enable_ls_unit_weight[i]=1'b1;
             end else begin 
             internal_enable_ls_unit_weight[i]=1'b0;
             end
       end 
    end 
default: begin 
        for(i=0;i<ROWS;i=i+1) begin 
        internal_enable_ls_unit_weight[i]=1'b0;          
       end
       for(i=0;i<COLUMNS;i=i+1) begin 
        internal_enable_ls_unit_activation_data[i]=1'b0;         
       end
      end
endcase
end 
end 


////////////////////////////
///// inv - mux ////////////
///////////////////////////
always @(posedge(clk)) begin 
if(!reset_n) begin 
counter<=0;
counter_out<=0;
end else begin 
  if(enable_load_array)begin 
    // up counter for data out 
   if(enable_cnt) begin
        counter<=counter+1;
        if(counter==max_cnt-1) begin 
        counter<=0;        
        end
    end else begin 
       counter<=0;           
    end 
    
    if (ld_max_cnt) begin 
    max_cnt<=max_cnt_from_cu;
    end
    
    
    // downcoutner for data out
       
       if(enable_down_cnt) begin
               counter_out<=counter_out-1;
               if(counter_out==max_down_cnt-1) begin 
               counter_out<=0;        
               end
           end  else begin 
           counter_out<=0;
           end
           
           if (ld_max_down_cnt) begin 
           max_down_cnt<=max_down_cnt_from_cu;
           end
           
end 
end
end 

/// MODIFY FOR MORE THAN 32 COLUMNS
/////////////////////////////////////////////
///////// INV - MUX for activation data /////
///////////////////////////////////////////// 
always @(*) begin 
if(infifo_read) begin 
       case (counter)  
        0:activation_data[0]=input_data_from_fifo;
       1:activation_data[1]=input_data_from_fifo;
       2:activation_data[2]=input_data_from_fifo;
       3:activation_data[3]=input_data_from_fifo;
       4:activation_data[4]=input_data_from_fifo;
       5:activation_data[5]=input_data_from_fifo;
       6:activation_data[6]=input_data_from_fifo;
       7:activation_data[7]=input_data_from_fifo;
       8:activation_data[8]=input_data_from_fifo;
       9:activation_data[9]=input_data_from_fifo;
       10:activation_data[10]=input_data_from_fifo;
       11:activation_data[11]=input_data_from_fifo;
       12:activation_data[12]=input_data_from_fifo;
       13:activation_data[13]=input_data_from_fifo;
       14:activation_data[14]=input_data_from_fifo;
       15:activation_data[15]=input_data_from_fifo;     
       16:activation_data[16]=input_data_from_fifo;
       17:activation_data[17]=input_data_from_fifo;
       18:activation_data[18]=input_data_from_fifo;
       19:activation_data[19]=input_data_from_fifo;
       20:activation_data[20]=input_data_from_fifo;
       21:activation_data[21]=input_data_from_fifo;
       22:activation_data[22]=input_data_from_fifo;
       23:activation_data[23]=input_data_from_fifo;
       24:activation_data[24]=input_data_from_fifo;
       25:activation_data[25]=input_data_from_fifo;
       26:activation_data[26]=input_data_from_fifo;
       27:activation_data[27]=input_data_from_fifo;
       28:activation_data[28]=input_data_from_fifo;
       29:activation_data[29]=input_data_from_fifo;
       30:activation_data[30]=input_data_from_fifo;
       31:activation_data[31]=input_data_from_fifo;
       default: 
       for(i=0;i<COLUMNS;i=i+1) begin 
               activation_data[i]=0;
               end 
       endcase
     
end
end 

///////////////////////////////////////
//////// MUX FOR OUT DATA /////////////
///////////////////////////////////////
always @(*) begin 
if(outfifo_write) begin 
case (counter_out) 
	 	0:  data_to_fifo_out=data_to_save[0];
       1:  data_to_fifo_out=data_to_save[1];
       2:  data_to_fifo_out=data_to_save[2];
       3:  data_to_fifo_out=data_to_save[3];
       4:  data_to_fifo_out=data_to_save[4];
       5:  data_to_fifo_out=data_to_save[5];
       6:  data_to_fifo_out=data_to_save[6];
       7:  data_to_fifo_out=data_to_save[7];
       8:  data_to_fifo_out=data_to_save[8];
       9:  data_to_fifo_out=data_to_save[9];
       10: data_to_fifo_out=data_to_save[10];
       11: data_to_fifo_out=data_to_save[11];
       12: data_to_fifo_out=data_to_save[12];
       13: data_to_fifo_out=data_to_save[13];
       14: data_to_fifo_out=data_to_save[14];
       15: data_to_fifo_out=data_to_save[15];
       16: data_to_fifo_out=data_to_save[16];
       17: data_to_fifo_out=data_to_save[17];
       18: data_to_fifo_out=data_to_save[18];
       19: data_to_fifo_out=data_to_save[19];
       20: data_to_fifo_out=data_to_save[20];
       21: data_to_fifo_out=data_to_save[21];
       22: data_to_fifo_out=data_to_save[22];
       23: data_to_fifo_out=data_to_save[23];
       24: data_to_fifo_out=data_to_save[24];
       25: data_to_fifo_out=data_to_save[25];
       26: data_to_fifo_out=data_to_save[26];
       27: data_to_fifo_out=data_to_save[27];
       28: data_to_fifo_out=data_to_save[28];
       29: data_to_fifo_out=data_to_save[29];
       30: data_to_fifo_out=data_to_save[30];
       31: data_to_fifo_out=data_to_save[31];
       default: data_to_fifo_out=0;

endcase
end 
end 

//////////////////////////////
//////// COLUMNS /////////////
//////////////////////////////
 genvar j;
 generate
 for (j=0;j<COLUMNS ;j=j+1)
  begin: ls_unit_activation_data 
  ls_unit #( .data_width(data_in_width)) ls_unit (
            .clk(clk),
            .resetn(reset_n),
            .enable(enable_load_array &  internal_enable_ls_unit_activation_data[j]),
            .load_enable(enable_load_activation_data),
            .store_enable(enable_store_activation_data),
            .data_load_input(activation_data[j]),
            .data_load_output(data_to_select_to_mxu[data_in_width+j*data_in_width-1 : j*data_in_width ]),
            .data_store_input(data_to_save_from_compacter[data_in_width+j*data_in_width-1 : j*data_in_width ]),
            .data_store_output(data_to_save[j])
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


filter_and_select 
#( .K(ROWS),
   .data_width(data_in_width)        
   )filter_and_select_weight 
(
 .data_in(data_weigth_to_select_to_mxu),
.data_out(weight_to_mxu),
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


//////////////////////////////
////////// ROWS //////////////
//////////////////////////////
 generate
 for (j=0;j<ROWS ;j=j+1)
  begin: ls_unit_weights
ls_unit #( .data_width(data_in_width)) ls_unit_weights (
            .clk(clk),
            .resetn(reset_n),
            .enable(enable_load_array & internal_enable_ls_unit_weight[j]),
            .load_enable(read_weight_memory),
            .store_enable(),
            .data_load_input(weight_data[j]),
            .data_load_output(data_weigth_to_select_to_mxu[data_in_width+j*data_in_width-1 : j*data_in_width ]),
            .data_store_input(),
            .data_store_output()
            );
 end 
 endgenerate
 
 
 
  /// MODIFY FOR MORE THAN 32 COLUMNS
 /////////////////////////////////////////////
 ///////// INV - MUX for weight data /////
 ///////////////////////////////////////////// 
 always @(*) begin 
 if(read_weight_memory) begin
        case (counter)  
        0:weight_data[0]=data_from_weight_memory;
        1:weight_data[1]=data_from_weight_memory;
        2:weight_data[2]=data_from_weight_memory;
        3:weight_data[3]=data_from_weight_memory;
        4:weight_data[4]=data_from_weight_memory;
        5:weight_data[5]=data_from_weight_memory;
        6:weight_data[6]=data_from_weight_memory;
        7:weight_data[7]=data_from_weight_memory;
        8:weight_data[8]=data_from_weight_memory;
        9:weight_data[9]=data_from_weight_memory;
        10:weight_data[10]=data_from_weight_memory;
        11:weight_data[11]=data_from_weight_memory;
        12:weight_data[12]=data_from_weight_memory;
        13:weight_data[13]=data_from_weight_memory;
        14:weight_data[14]=data_from_weight_memory;
        15:weight_data[15]=data_from_weight_memory;    
        16:weight_data[16]=data_from_weight_memory;
        17:weight_data[17]=data_from_weight_memory;
        18:weight_data[18]=data_from_weight_memory;
        19:weight_data[19]=data_from_weight_memory;
        20:weight_data[20]=data_from_weight_memory;
        21:weight_data[21]=data_from_weight_memory;
        22:weight_data[22]=data_from_weight_memory;
        23:weight_data[23]=data_from_weight_memory;
        24:weight_data[24]=data_from_weight_memory;
        25:weight_data[25]=data_from_weight_memory;
        26:weight_data[26]=data_from_weight_memory;
        27:weight_data[27]=data_from_weight_memory;
        28:weight_data[28]=data_from_weight_memory;
        29:weight_data[29]=data_from_weight_memory;
        30:weight_data[30]=data_from_weight_memory;
        31:weight_data[31]=data_from_weight_memory;
        default: 
        for(i=0;i<ROWS;i=i+1) begin 
                weight_data[i]=0;
                end 
        endcase
      
 end
 end 
 
 


//////////////////////////////////////////////
//// address generator for memory weigth /////
//////////////////////////////////////////////
// lower part of the address, it is also the
// switching counter of the ls internal array 
always @(posedge(clk)) begin
if(!reset_n) begin
counter_weight<=0;
counter_weight_page<=0;
tc_counter_weight<=1'b0;
end else begin
    if(enable_load_array)begin 
      // up counter for weight memory 
         if(enable_cnt_weight) begin
            counter_weight<=counter_weight+1;
            tc_counter_weight<=1'b0;
            if(counter_weight==max_cnt_weight-1) begin 
            counter_weight<=0;
            tc_counter_weight<=1'b1;
            // higher part of the address 
           // through all the pages in the internal memory 
            if(enable_cnt_weight ) begin
                        counter_weight_page<=counter_weight_page+1;
                    end 
            end
            address_out<={counter_weight_page ,counter_weight};
    end else begin 
                counter_weight<=0;
                counter_weight_page<=0;
    end
    if (ld_max_cnt_weight) begin 
    max_cnt_weight<=max_cnt_weight_from_cu;
    end
end 
end 
end



//// compose address request to memory 
assign wm_address = enable_cnt_weight ? address_out : 32'bZ ;



endmodule