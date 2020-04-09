

module filter_and_select 
#( parameter K=4,
   bit_width_so=8 // bitwidth of single operation 
   )
(
input [K*64-1:0] data_in,
output [K*64-1:0] data_out,
input [3:0]data_select
);

wire [K*64-1:0]data_in_i;
wire [K*64-1:0]data_in_16;

/// general window of 8 
genvar i;

generate
for (i=0;i<K;i=i+1) begin 
       if (i==0) begin 
       assign {data_out[64+i*64-1:32+64*i],data_out[32+i*64-1:16+64*i],
        data_out[16+i*64-1:8+64*i],data_out[8+i*64-1:64*i]} = 
        data_in[64+i*64-1:64*i] ;
       
       
       end else begin 
       // 64 computation 
        assign {data_out[64+i*64-1:32+64*i],data_out[32+i*64-1:16+64*i],
        data_out[16+i*64-1:8+64*i],data_out[8+i*64-1:64*i]} = 
        data_select[3] &&
        data_select[2] &&
        data_select[1] &&
        data_select[0] ?
        data_in[64+i*64-1:64*i] :
         data_in_i[64+i*64-1:64*i];
      end    
end 
endgenerate

generate
for (i=1;i<K/2;i=i+1) begin 
        if(i%2== 1 ) begin 
       //32 computation
        assign {data_in_i[64+i*64-1:32+64*i],data_in_i[32+i*64-1:16+64*i],
        data_in_i[16+i*64-1:8+64*i],data_in_i[8+i*64-1:64*i]} =
        data_select[2] &&
        data_select[1] &&
        data_select[0] ? 
        { 32'd0 ,data_in[64+(i-1)*64-1:32+64*(i-1)]}: 
         data_in_16[64+i*64-1:64*i];
        end else begin 
        
        assign {data_in_i[64+i*64-1:32+64*i],data_in_i[32+i*64-1:16+64*i],
        data_in_i[16+i*64-1:8+64*i],data_in_i[8+i*64-1:64*i]} =
        data_select[2] &&
        data_select[1] &&
        data_select[0] ? 
        { 32'd0 ,data_in[32+(i-1)*64-1:64*(i-1)]}: 
         data_in_16[64+i*64-1:64*i];
        
        end 
end 
endgenerate




endmodule