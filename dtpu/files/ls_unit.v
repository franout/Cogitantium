
module ls_unit
#(parameter  max_data_width=8,
    data_in_width=64 )
 (
input [data_in_width-1:0]data_from_fifo,
output reg [data_in_width-1:0]data_to_mxu,
output reg [data_in_width-1:0]data_to_fifo,
input read_fifo,
input write_fifo,
input [3:0]data_precision
);




/// load process
always @(read_fifo,data_from_fifo)begin 
    
    if(read_fifo) begin 
    case (data_precision)
    4'b0001: data_to_mxu = { 56'd0 ,data_from_fifo[7:0] }; 
    4'b0011: data_to_mxu = { 48'd0 ,data_from_fifo[15:0] };
    4'b0111: data_to_mxu = { 32'd0 ,data_from_fifo[31:0] };
    4'b1111: data_to_mxu = data_from_fifo;
    default: data_to_mxu = 64'd0;
    endcase
    end 
end 

/// store process
always @(write_fifo,data_to_fifo)begin 
    
    if(read_fifo) begin 
    case (data_precision)
    4'b0001: data_to_mxu = { 56'd0 ,data_from_fifo[7:0] }; 
    4'b0011: data_to_mxu = { 48'd0 ,data_from_fifo[15:0] };
    4'b0111: data_to_mxu = { 32'd0 ,data_from_fifo[31:0] };
    4'b1111: data_to_mxu = data_from_fifo;
    default: data_to_mxu = 64'd0;
    endcase
    end 
end 


endmodule