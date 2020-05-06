module ls_unit_weight
#(parameter data_width_mem=64)
(
input enable,
input clk,
input reset,
input load_in_reg,
input [data_width_mem-1:0] data_from_mem,
output reg [data_width_mem-1:0]weigth

);




always @(posedege(clk)) begin 
if(reset) begin 
weigth<=0;
end else begin
        if(load_in_reg) begin
        weigth<=data_from_mem;
        end 
  end
end



endmodule