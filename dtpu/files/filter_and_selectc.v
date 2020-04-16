`timescale 1ns/1ps

`include "precision_def.vh"


module filter_and_select 
#( parameter K=4,
   data_width=64
   )
(
input [K*data_width-1:0] data_in,
output reg [K*data_width-1:0] data_out,
input [`LOG_ALLOWED_PRECISIONS-1:0]data_select
);

wire [K*data_width-1:0]data_in_32;
wire [K*data_width-1:0]data_in_16;
wire [K*data_width-1:0]data_in_8;

/// general window of 8 
genvar i,j;

always @(data_select,data_in_8,data_in_16,data_in_32,data_in) begin 
case(data_select)
`INT8: // 8 bit
        data_out=data_in_8;
`INT16: // 16 bit
        data_out=data_in_16;
`INT32: // 32 bit
        data_out=data_in_32;
`INT64: // 64 bit 
        data_out=data_in;
default: data_out=0;
endcase
end 
      // 32 bit computation 
      generate
      for (i=0;i<K/(data_width/32);i=i+1) begin
      
               assign data_in_32[data_width+(i+i)*data_width-1:data_width*(i+i)]= data_select==`INT32 ?
                                          { 32'd0 ,data_in[32+(i)*data_width-1:data_width*(i)] } : 
                                          64'd0;
               assign data_in_32[data_width+(i+i+1)*data_width-1:data_width*(i+i+1)]= data_select==`INT32 ?
                                                    { 32'd0 ,data_in[data_width+(i)*data_width-1:32+data_width*(i)] } :
                                                         64'd0;
end
endgenerate



/// 16 bit computation 
 generate
for (i=0;i<K/(data_width/16);i=i+1) begin

assign data_in_16[data_width+((data_width/16)*i)*data_width-1:data_width*((data_width/16)*i)]=data_select==`INT16?
                                              { 48'd0 ,data_in[16+(i)*data_width-1:data_width*(i)] } : 
                                              64'd0;
assign data_in_16[data_width+((data_width/16)*i+1)*data_width-1:data_width*((data_width/16)*i+1)]=data_select==`INT16 ?
                                              { 48'd0 ,data_in[32+(i)*data_width-1:16+data_width*(i)] } :
                                               64'd0;
assign data_in_16[data_width+((data_width/16)*i+2)*data_width-1:data_width*((data_width/16)*i+2)]=data_select==`INT16?
                                              { 48'd0 ,data_in[48+(i)*data_width-1:32+data_width*(i)] } :
                                               64'd0;
assign data_in_16[data_width+((data_width/16)*i+3)*data_width-1:data_width*((data_width/16)*i+3)]=data_select==`INT16?
                                              { 48'd0 ,data_in[data_width+(i)*data_width-1:48+data_width*(i)] } :
                                               64'd0;

end
endgenerate



// 8 bit computation
 generate
for (i=0;i<K/(data_width/8);i=i+1) begin 
assign data_in_8[data_width+((data_width/8)*i)*data_width-1:data_width*((data_width/8)*i)]=data_select==`INT8 ?
                                              { 56'd0 ,data_in[8+(i)*data_width-1:0+data_width*(i)] } :
                                               64'd0;
assign data_in_8[data_width+((data_width/8)*i+1)*data_width-1:data_width*((data_width/8)*i+1)]=data_select==`INT8?
                                              { 56'd0 ,data_in[16+(i)*data_width-1:8+data_width*(i)] } :
                                               64'd0;
assign data_in_8[data_width+((data_width/8)*i+2)*data_width-1:data_width*((data_width/8)*i+2)]=data_select==`INT8 ?
                                              { 56'd0 ,data_in[24+(i)*data_width-1:16+data_width*(i)] } :
                                               64'd0;
assign data_in_8[data_width+((data_width/8)*i+3)*data_width-1:data_width*((data_width/8)*i+3)]=data_select==`INT8 ?
                                              { 56'd0 ,data_in[32+(i)*data_width-1:24+data_width*(i)] } :
                                               64'd0;
assign data_in_8[data_width+((data_width/8)*i+4)*data_width-1:data_width*((data_width/8)*i+4)]=data_select==`INT8?
                                              { 56'd0 ,data_in[40+(i)*data_width-1:32+data_width*(i)] } :
                                               64'd0;
assign data_in_8[data_width+((data_width/8)*i+5)*data_width-1:data_width*((data_width/8)*i+5)]=data_select==`INT8 ?
                                              { 56'd0 ,data_in[48+(i)*data_width-1:40+data_width*(i)] } :
                                               64'd0;                                                                                                                                                                                            
assign data_in_8[data_width+((data_width/8)*i+6)*data_width-1:data_width*((data_width/8)*i+6)]=data_select==`INT8 ?
                                              { 56'd0 ,data_in[56+(i)*data_width-1:48+data_width*(i)] } :
                                               64'd0;
assign data_in_8[data_width+((data_width/8)*i+7)*data_width-1:data_width*((data_width/8)*i+7)]=data_select==`INT8 ?
                                             { 56'd0 ,data_in[64+(i)*data_width-1:56+data_width*(i)] } :
                                               64'd0;                                               
end
endgenerate
                                             
              //////////////////////////////////////////////////////////////////////////////////////   
              //////////////// WARNING NOT PERFECT FOR MATRIX LESS THAN 8*8 CAUSE A LOOP ///////////
              //////////////SHOULD BE INSERTED HERE FOR CORRECTLY HANDLING THE CONNCECTIONS //////// 
              //////////////////////////////////////////////////////////////////////////////////////
          

endmodule