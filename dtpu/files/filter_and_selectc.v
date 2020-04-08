

module filter_and_select 
#( parameter K=4,
   bit_width_so=8 // bitwidth of single operation 
   )
(
input [K*64-1:0] data_in,
output [K*64-1:0] data_out,
input [3:0]data_select
);

genvar i;

generate
for (i=0;i<K;i=i+1) begin 
        if(i==0) begin
        assign data_out[(i+1)*64-1:0]=data_in[(i+1)*64-1:0];
        end else begin 
          // window of 8 columns
          //8 lsb
          // first level
          //assign data_out[i*64-1:]= data_select[0] ?  : ;
          // second level
          /*assign = data_precision[1] ?: ;
          //third level      
          assign = data_precision[2] ?:;
          // 8 msb
           // first level
           assign = data_precision[1] ?  : ;
           //second  level
           assign = data_precision[2] ?  : ;
          // 16 
          //assign data_out [(64*i)-1:] = data_select[2] ? data_in[]: ;
          //32
         assign data_out[(64*i)-1:40*i] = data_in[(64*i)-1:40*i];        
         */
        end 
end 
endgenerate




endmodule