`timescale 1ns/1ps

`include "precision_def.vh"

module compact_and_select #( parameter K=4,
   data_width=64
   )
(
input [K*data_width-1:0] data_in,
output [K*data_width-1:0] data_out,
input [`LOG_ALLOWED_PRECISIONS-1:0]data_select
);

wire [K*data_width-1:0]data_in_32;
wire [K*data_width-1:0]data_in_16;
wire [K*data_width-1:0]data_in_8;

/// general window of 8 
genvar i,j;

generate
for (i=0;i<K;i=i+1) begin 
       
       // 64 computation 
        assign {data_out[data_width+i*data_width-1:32+data_width*i],data_out[32+i*data_width-1:16+data_width*i],
        data_out[16+i*data_width-1:8+data_width*i],data_out[8+i*data_width-1:data_width*i]} = 
        data_select==`INT64 ?
        data_in[data_width+i*data_width-1:data_width*i] :
         data_in_32[data_width+i*data_width-1:data_width*i];
            
            

  end
  endgenerate
  
  
           // 32 bit computation
  generate
  for(i=0;i<K-(K/(data_width/32));i=i+1) begin 
         if(i%((data_width/32))==0) begin 
         assign data_in_32[data_width+i*data_width-1:data_width*i]= data_select==`INT32 ?
                            { data_in[32+(i+1)*data_width-1:data_width*(i+1)] , data_in[32+(i)*data_width-1:data_width*(i)] } :
                                             data_in_16[data_width+i*data_width-1:data_width*i];
         
         end else begin // ==1 
         assign data_in_32[data_width+i*data_width-1:data_width*i]= data_select==`INT32 ?
                                     { data_in[32+(i+2)*data_width-1:data_width*(i+2)] , data_in[32+(i+1)*data_width-1:data_width*(i+1)] } :
                                                      data_in_16[data_width+i*data_width-1:data_width*i];
                  
          end
  end
  endgenerate       
         
         generate
         for(i=K-K/(data_width/32);i<K;i=i+1) begin 
         assign data_in_32[data_width+i*data_width-1:data_width*i]= data_select==`INT32 ?
                                                                          64'd0 : data_in_16[data_width+i*data_width-1:data_width*i];
         end endgenerate
         

         
         
         
         // 16 bit
         generate
           for(i=0;i<K/(data_width/16);i=i+1) begin 
                  if(i%2==0) begin 
                  assign data_in_16[data_width+i*data_width-1:data_width*i]= data_select==`INT16 ?
                                                               { data_in[16+(i+3)*data_width-1:data_width*(i+3)],
                                                               data_in[16+(i+2)*data_width-1:data_width*(i+2)],
                                                               data_in[16+(i+1)*data_width-1:data_width*(i+1)] , 
                                                               data_in[16+(i)*data_width-1:data_width*(i)] } :
                                                                data_in_8[data_width+i*data_width-1:data_width*i];
                  end else begin 

                  assign data_in_16[data_width+i*data_width-1:data_width*i]= data_select==`INT16?
                                                               { data_in[16+(i+6)*data_width-1:data_width*(i+6)],
                                                               data_in[16+(i+5)*data_width-1:data_width*(i+5)],
                                                               data_in[16+(i+4)*data_width-1:data_width*(i+4)] , 
                                                               data_in[16+(i+3)*data_width-1:data_width*(i+3)] } :
                                                                data_in_8[data_width+i*data_width-1:data_width*i];
                   end
           end
           endgenerate       
                  
                  generate
                  for(i=K/(data_width/16);i<K;i=i+1) begin 
                  assign data_in_16[data_width+i*data_width-1:data_width*i]= data_select==`INT16 ?
                                                                                   64'd0 : data_in_8[data_width+i*data_width-1:data_width*i];
                  end 
                  endgenerate
                  
         
                  
                  
        //8 bit
        generate
       for(i=0;i<K/(data_width/8);i=i+1) begin 
              if(i%2==0) begin 
              assign data_in_8[data_width+i*data_width-1:data_width*i]=data_select==`INT8 ?
                                                           { data_in[8+(i+7)*data_width-1:data_width*(i+7)] ,
                                                             data_in[8+(i+6)*data_width-1:data_width*(i+6)],
                                                             data_in[8+(i+5)*data_width-1:data_width*(i+5)] , 
                                                             data_in[8+(i+4)*data_width-1:data_width*(i+4)],
                                                             data_in[8+(i+3)*data_width-1:data_width*(i+3)] ,
                                                             data_in[8+(i+2)*data_width-1:data_width*(i+2)],
                                                             data_in[8+(i+1)*data_width-1:data_width*(i+1)] , 
                                                             data_in[8+(i)*data_width-1:data_width*(i)] } :
                                               64'd0;
              end else begin 

              assign data_in_8[data_width+i*data_width-1:data_width*i]= data_select==`INT8 ?
                                                          { data_in[8+(i+14)*data_width-1:data_width*(i+14)] ,
                                                            data_in[8+(i+13)*data_width-1:data_width*(i+13)],
                                                            data_in[8+(i+12)*data_width-1:data_width*(i+12)] , 
                                                            data_in[8+(i+11)*data_width-1:data_width*(i+11)],
                                                            data_in[8+(i+10)*data_width-1:data_width*(i+10)] ,
                                                            data_in[8+(i+9)*data_width-1:data_width*(i+9)],
                                                            data_in[8+(i+8)*data_width-1:data_width*(i+8)] , 
                                                            data_in[8+(i+7)*data_width-1:data_width*(i+7)] } :
                                                           64'd0;
               end
       end
       endgenerate       
        
        generate
              for(i=K/(data_width/8);i<K;i=i+1) begin 
                     
                     assign data_in_8[data_width+i*data_width-1:data_width*i]=64'd0;
                 end 
              endgenerate       
                     
              
              //////////////////////////////////////////////////////////////////////////////////////   
              //////////////// WARNING NOT PERFECT FOR MATRIX LESS THAN 8*8 CAUSE A LOOP ///////////
              //////////////SHOULD BE INSERTED HERE FOR CORRECTLY HANDLING THE CONNCECTIONS //////// 
              //////////////////////////////////////////////////////////////////////////////////////
          
 
 

endmodule