`timescale 1ns/1ps

`include "precision_def.vh"

module compact_and_select #( parameter K=4,
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

genvar i;


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
    if(K<=3) begin 
      for(i=0;i<=(K/(data_width/32));i=i+1) begin 
               if(i%((data_width/32))==0) begin 
               assign data_in_32[data_width+i*data_width-1:data_width*i]= data_select==`INT32 ?
                                  { (i+1>=K ? 32'd0 :data_in[32+(i+1)*data_width-1:data_width*(i+1)] ), 
                                    (i>=K ? 32'd0 : data_in[32+(i)*data_width-1:data_width*(i)] )} :
                                                   64'd0;
               
               end else begin // ==1 
               assign data_in_32[data_width+i*data_width-1:data_width*i]= data_select==`INT32 ?
                                           {(i+2 >=K ?  32'd0 :data_in[32+(i+2)*data_width-1:data_width*(i+2)]) ,
                                            (i+1 >=K ?  32'd0 :data_in[32+(i+1)*data_width-1:data_width*(i+1)]) } :
                                                           64'd0;
                        
                end
        end



    end else begin 
      for(i=0;i<(K/(data_width/32));i=i+1) begin 
         if(i%((data_width/32))==0) begin 
         assign data_in_32[data_width+i*data_width-1:data_width*i]= data_select==`INT32 ?
                            { data_in[32+(i+1)*data_width-1:data_width*(i+1)] , data_in[32+(i)*data_width-1:data_width*(i)] } :
                                             64'd0;
         
         end else begin // ==1 
         assign data_in_32[data_width+i*data_width-1:data_width*i]= data_select==`INT32 ?
                                     { data_in[32+(i+2)*data_width-1:data_width*(i+2)] , data_in[32+(i+1)*data_width-1:data_width*(i+1)] } :
                                                     64'd0;
                  
          end
  end
    end 
  endgenerate       
         
         generate
          if(K<=3)begin 
          for(i=1+K/(data_width/32);i<K;i=i+1) begin 
         assign data_in_32[data_width+i*data_width-1:data_width*i]= 64'd0;
         end

          end else begin 
                for(i=K/(data_width/32);i<K;i=i+1) begin 
         assign data_in_32[data_width+i*data_width-1:data_width*i]= 64'd0;
         end
          end 
        endgenerate
         

         
         
         
         // 16 bit
         generate

          if(K>=8) begin
           for(i=0;i<K/(data_width/16);i=i+1) begin 
                  if(i%2==0) begin 
                  assign data_in_16[data_width+i*data_width-1:data_width*i]= data_select==`INT16 ?
                                                               { data_in[16+(i+3)*data_width-1:data_width*(i+3)],
                                                               data_in[16+(i+2)*data_width-1:data_width*(i+2)],
                                                               data_in[16+(i+1)*data_width-1:data_width*(i+1)] , 
                                                               data_in[16+(i)*data_width-1:data_width*(i)] } :
                                                                64'd0;
                  end else begin 

                  assign data_in_16[data_width+i*data_width-1:data_width*i]= data_select==`INT16?
                                                               { data_in[16+(i+6)*data_width-1:data_width*(i+6)],
                                                               data_in[16+(i+5)*data_width-1:data_width*(i+5)],
                                                               data_in[16+(i+4)*data_width-1:data_width*(i+4)] , 
                                                               data_in[16+(i+3)*data_width-1:data_width*(i+3)] } :
                                                              64'd0;
                   end
           end

         end else begin  //<8
              for(i=0;i<=K/(data_width/16);i=i+1) begin 
                  if(i%2==0) begin 
                  assign data_in_16[data_width+i*data_width-1:data_width*i]= data_select==`INT16 ?
                                                             { (i+3>=K? 8'd0 : data_in[16+(i+3)*data_width-1:data_width*(i+3)]),
                                                               (i+2>=K? 8'd0 : data_in[16+(i+2)*data_width-1:data_width*(i+2)]),
                                                               (i+1>=K? 8'd0 : data_in[16+(i+1)*data_width-1:data_width*(i+1)]),
                                                               (i>=K? 8'd0 : data_in[16+(i)*data_width-1:data_width*(i)] )} :
                                                                64'd0;
                  end else begin 

                  assign data_in_16[data_width+i*data_width-1:data_width*i]= data_select==`INT16?
                                                             { ( i+6>=K? 8'd0 :data_in[16+(i+6)*data_width-1:data_width*(i+6)]),
                                                               ( i+5>=K? 8'd0 :data_in[16+(i+5)*data_width-1:data_width*(i+5)]),
                                                               ( i+4>=K? 8'd0 :data_in[16+(i+4)*data_width-1:data_width*(i+4)]) ,
                                                               ( i+3>=K? 8'd0 :data_in[16+(i+3)*data_width-1:data_width*(i+3)])} :
                                                              64'd0;
                   end
           end

         end 
           endgenerate       
                  
                  generate
                    if(K>=8)begin 
                  for(i=K/(data_width/16);i<K;i=i+1) begin 
                  assign data_in_16[data_width+i*data_width-1:data_width*i]= data_select==`INT16 ?
                                                                                   64'd0 : 64'd0;
                  end 
                end else begin 
                  for(i=1+K/(data_width/16);i<K;i=i+1) begin 
                  assign data_in_16[data_width+i*data_width-1:data_width*i]= data_select==`INT16 ?
                                                                                   64'd0 : 64'd0;
                  end 

                end 
                  endgenerate
                  
         
                  
                  
        //8 bit
        generate

          if(K<=8) begin: particular_cases
       for(i=0;i<=K/(data_width/8) ;i=i+1) begin 
              if(i%2==0) begin 
              assign data_in_8[data_width+i*data_width-1:data_width*i]=data_select==`INT8 ?
                                                           { ( i+7>=K  ? 8'd0 :data_in[8+(i+7)*data_width-1:data_width*(i+7)]),
                                                             ( i+6>=K  ? 8'd0 :data_in[8+(i+6)*data_width-1:data_width*(i+6)]),
                                                             ( i+5>=K  ? 8'd0 :data_in[8+(i+5)*data_width-1:data_width*(i+5)]),
                                                             ( i+4>=K  ? 8'd0 :data_in[8+(i+4)*data_width-1:data_width*(i+4)]),
                                                             ( i+3>=K  ? 8'd0 :data_in[8+(i+3)*data_width-1:data_width*(i+3)]),
                                                             ( i+2>=K  ? 8'd0 :data_in[8+(i+2)*data_width-1:data_width*(i+2)]),
                                                             ( i+1>=K  ? 8'd0 :data_in[8+(i+1)*data_width-1:data_width*(i+1)]),
                                                             ( i>=K    ? 8'd0   :data_in[8+(i)*data_width-1:data_width*(i)]) } :
                                               64'd0;
              end else begin 

              assign data_in_8[data_width+i*data_width-1:data_width*i]= data_select==`INT8 ?
                                                          { ( i+14>=K  ? 8'd0 :data_in[8+(i+14)*data_width-1:data_width*(i+14)]),
                                                            ( i+13>=K  ? 8'd0 :data_in[8+(i+13)*data_width-1:data_width*(i+13)]),
                                                            ( i+12>=K  ? 8'd0 :data_in[8+(i+12)*data_width-1:data_width*(i+12)]),
                                                            ( i+11>=K  ? 8'd0 :data_in[8+(i+11)*data_width-1:data_width*(i+11)]),
                                                            ( i+10>=K  ? 8'd0 :data_in[8+(i+10)*data_width-1:data_width*(i+10)]),
                                                            ( i+9>=K  ? 8'd0 :data_in[8+(i+9)*data_width-1:data_width*(i+9)]  ),
                                                            ( i+8>=K  ? 8'd0 :data_in[8+(i+8)*data_width-1:data_width*(i+8)]   ),
                                                            ( i+7>=K  ? 8'd0 :data_in[8+(i+7)*data_width-1:data_width*(i+7)] )} :
                                                           64'd0;
               end
       end

     end else begin 
       for(i=0;i<K/(data_width/8) ;i=i+1) begin 
              assign data_in_8[data_width+i*data_width-1:data_width*i]=data_select==`INT8 ?
                                  {  data_in[8+(i*(data_width/8)+7)*data_width-1:data_width*(i*(data_width/8)+7)],
                                     data_in[8+(i*(data_width/8)+6)*data_width-1:data_width*(i*(data_width/8)+6)],
                                     data_in[8+(i*(data_width/8)+5)*data_width-1:data_width*(i*(data_width/8)+5)],
                                     data_in[8+(i*(data_width/8)+4)*data_width-1:data_width*(i*(data_width/8)+4)],
                                     data_in[8+(i*(data_width/8)+3)*data_width-1:data_width*(i*(data_width/8)+3)],
                                     data_in[8+(i*(data_width/8)+2)*data_width-1:data_width*(i*(data_width/8)+2)],
                                     data_in[8+(i*(data_width/8)+1)*data_width-1:data_width*(i*(data_width/8)+1)],
                                     data_in[8+(i*(data_width/8))*data_width-1:data_width*(i*(data_width/8))]     } :
                                               64'd0;
       end
       // if it is not a power of 2
       for(i=K/(data_width/8);i<K%(data_width/8)-1;i=i+1) begin
          assign data_in_8[data_width+i*data_width-1:data_width*i]=data_select==`INT8 ?
                                  {  ( i*(data_width/8)+7 >=K ? 8'd0 :data_in[8+(i*(data_width/8)+7)*data_width-1:data_width*(i*(data_width/8)+7)]),
                                     ( i*(data_width/8)+6 >=K ? 8'd0 :data_in[8+(i*(data_width/8)+6)*data_width-1:data_width*(i*(data_width/8)+6)]),
                                     ( i*(data_width/8)+5 >=K ? 8'd0 :data_in[8+(i*(data_width/8)+5)*data_width-1:data_width*(i*(data_width/8)+5)]),
                                     ( i*(data_width/8)+4 >=K ? 8'd0 :data_in[8+(i*(data_width/8)+4)*data_width-1:data_width*(i*(data_width/8)+4)]),
                                     ( i*(data_width/8)+3 >=K ? 8'd0 :data_in[8+(i*(data_width/8)+3)*data_width-1:data_width*(i*(data_width/8)+3)]),
                                     ( i*(data_width/8)+2 >=K ? 8'd0 :data_in[8+(i*(data_width/8)+2)*data_width-1:data_width*(i*(data_width/8)+2)]),
                                     ( i*(data_width/8)+1 >=K ? 8'd0 :data_in[8+(i*(data_width/8)+1)*data_width-1:data_width*(i*(data_width/8)+1)]),
                                     ( i*(data_width/8) >=K ? 8'd0 :data_in[8+(i*(data_width/8))*data_width-1:data_width*(i*(data_width/8))]    )} :
                                               64'd0;
       end 


     end // particular_cases

       endgenerate       
        
        generate

         if(K<=8) begin 
              for(i=K/(data_width/8)+1;i<K;i=i+1) begin 
                     
                     assign data_in_8[data_width+i*data_width-1:data_width*i]=64'd0;
                 end 
          end else begin 
                for(i=  (K%8==0? K/(data_width/8) :K%(data_width/8)-1 ) ;i<K;i=i+1) begin 
                     
                     assign data_in_8[data_width+i*data_width-1:data_width*i]=64'd0;
                 end 

          end 
         endgenerate       
                     
endmodule