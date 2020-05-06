
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
input ld_weight_page_cnt,
input [address_leng_wm-1:0]start_value_wm,

input [$clog2(COLUMNS):0]max_cnt_from_cu, // it depends on the current bitwidth
input [$clog2(ROWS):0]max_down_cnt_from_cu,
input enable_cnt_weight,
input ld_max_cnt_weight,
input [$clog2(ROWS):0]max_cnt_weight_from_cu


);

reg [$clog2(COLUMNS):0] counter;
reg [$clog2(COLUMNS):0] max_cnt;

reg [$clog2(ROWS):0]counter_out;
reg [$clog2(ROWS):0] max_down_cnt;


wire [data_in_width*COLUMNS-1:0]data_to_select_to_mxu;
wire  [data_in_width*ROWS-1:0]data_to_save_from_compacter;
wire [data_in_width*ROWS-1:0]data_weigth_to_select_to_mxu;

reg [data_in_width-1:0]activation_data[0:COLUMNS-1] ;
reg [data_in_width-1:0]weight_data[0:ROWS-1] ;
wire [data_in_width-1:0]data_to_save[0:COLUMNS-1];

reg [address_leng_wm-1:0]address_out;
reg [$clog2(ROWS):0]counter_weight;
reg [address_leng_wm-$clog2(ROWS)-1:0]counter_weight_page;
reg [$clog2(ROWS):0]max_cnt_weight;
reg tc_counter_weight;

reg internal_enable_ls_unit_activation_data[0:COLUMNS-1];
reg internal_enable_ls_unit_weight[0:ROWS-1];

integer i;


// initialize only at the beginning 
//synthesis_off
/*initial begin 
for(i=0;i<COLUMNS;i=i+1) begin 
       activation_data[i]=0;
end 
for(i=0;i<ROWS;i=i+1) begin 
    weight_data[i]=0;
end
end*/ 
// synthesis_on
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
end else begin 
    for(i=0;i<ROWS;i=i+1) begin 
        internal_enable_ls_unit_weight[i]=1'b0;          
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

///// CHANGE FOR MORE THAN 31 COLUMNS 
/////////////////////////////////////////////
///////// INV - MUX for activation data /////
///////////////////////////////////////////// 
//always_comb activation_data[counter]= infifo_read ? input_data_from_fifo : 0;
always @(infifo_read ,counter, input_data_from_fifo) begin 
if(infifo_read) begin 
       case (counter)  
        0: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==0)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
        1: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==1)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
        2: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==2)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
        3: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==3)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
        4: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==4)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
        5: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==5)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
        6: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==6)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
       7: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==7)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      8: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==8)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      9: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==9)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      10: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==10)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      11: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==11)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      12: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==12)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      13: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==13)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      14: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==14)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      15: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==15)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      16: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==16)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      17: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==17)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      18: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==18)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      19: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==19)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      20: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==20)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      21: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==21)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      22: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==22)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      23: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==23)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      24: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==24)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      25: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==25)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      26: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==26)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      27: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==27)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      28: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==28)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      29: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==29)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      30: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==30)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      31: begin 
          for(i=0;i<COLUMNS;i=i+1) begin 
                if(i==31)begin 
                      activation_data[i]=input_data_from_fifo;
                end else begin 
                    activation_data[i]=0;
                 end
               end
            end
      
       default: 
       for(i=0;i<COLUMNS;i=i+1) begin 
               activation_data[i]=0;
               end 
       endcase
     
end else begin 
  for(i=0;i<COLUMNS;i=i+1) begin 
               activation_data[i]=0;
               end 
end 
end
///////////////////////////////////////
//////// MUX FOR OUT DATA /////////////
///////////////////////////////////////
/*
always @(outfifo_write,counter) begin 
if(outfifo_write) begin 
case (counter) 
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
end */
assign data_to_fifo_out= outfifo_write ?  data_to_save[counter] : 64'd0;

//////////////////////////////
//////// COLUMNS /////////////
//////////////////////////////
 genvar j;
 generate
 for (j=0;j<COLUMNS ;j=j+1)
  begin: ls_unit_activation_data 
  ls_unit #( .data_width(data_in_width)) ls_unit (
            .clk(clk),
            .reset(reset),
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
            .reset(reset),
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

 //always_comb weight_data[counter]= read_weight_memory ? data_from_weight_memory : 0;
 always @(read_weight_memory ,counter, data_from_weight_memory) begin
 if(read_weight_memory) begin
        case (counter)  
          0: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==0) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 

          end 
          1: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==1) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 

          end 
          2: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==2) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 

          end 
          3: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==3) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 

          end 
          4: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==4) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 

          end 
          5: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==5) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 

          end 
          6: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==6) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 

          end 
          7: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==7) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 

          end 
          8: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==8) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 

          end 
          9: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==9) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end
          end 
          10: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==10) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end
          11: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==11) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end
          12: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==12) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 

          end
          13: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==13) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end
          14: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==14) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end
          15: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==15) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end
          16: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==16) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end
          17: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==17) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end
          18: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==18) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end
          19: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==19) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end
          20: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==20) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end
          21: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==21) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end
          end 
          22: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==22) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end
          23: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==23) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end
          24: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==24) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end
          25: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==25) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end 
        24: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==24) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end 
         26: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==26) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end 
          27: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==27) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end 
          28: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==28) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end 
          29: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==29) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end 
          30: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==30) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end 
          31: begin 
              for(i=0;i<ROWS;i=i+1) begin 
                  if(i==31) begin 
                      weight_data[i]=data_from_weight_memory;
                  end else begin 
                    weight_data[i]=0;
                  end
                end 
          end 
        default: 
        for(i=0;i<ROWS;i=i+1) begin 
                weight_data[i]=0;
                end 
        endcase
      
 end  else begin 
for(i=0;i<ROWS;i=i+1) begin 
                weight_data[i]=0;
                end 
 end 
 end 



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
address_out<=0;
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
            if(enable_cnt_weight ) begin
                        counter_weight_page<=counter_weight_page+1;
                    end 
            end

            if({counter_weight_page ,counter_weight[$clog2(ROWS)-1:0]}==size_wmemory-1) begin 
              counter_weight_page<=0;
              counter_weight<=0;
            end 
    end
    if (ld_max_cnt_weight) begin 
    max_cnt_weight<=max_cnt_weight_from_cu;
    end

    if(ld_weight_page_cnt) begin
      counter_weight_page<=start_value_wm[address_leng_wm-1:$clog2(ROWS)];
    end 
end 
/* else begin 
                counter_weight<=0;
                counter_weight_page<=0;
    end*/

end 
end


//// compose address request to memory 
assign wm_address = enable_cnt_weight ? {counter_weight_page ,counter_weight[$clog2(ROWS)-1:0]} : 32'b0 ;



endmodule