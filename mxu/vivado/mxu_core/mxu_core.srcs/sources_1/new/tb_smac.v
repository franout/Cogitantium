`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 14:38:54
// Design Name: 
// Module Name: tb_smac
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_smac(    );




parameter clk_period= 10;
reg clk,ce,sclr;
reg [3:0]data_input;
reg [3:0]res_mac_p;
reg [3:0]weight;

wire [3:0]res_mac_n;
wire [3:0]data_input_next_row;
wire enable_next_mac;


mxu_mac #(.bit_width(4)) uut ( .clk(clk),
    .ce(ce),
    .sclr(sclr),
    .data_input(data_input),
    .weight(weight),
    .res_mac_p(res_mac_p), 
    .res_mac_n(res_mac_n),
    .data_input_next_row(data_input_next_row),
    .enable_next_mac(enable_next_mac)
    );

      always begin
         clk = 1'b1;
         #(clk_period/2) 
         clk = 1'b0;
         #(clk_period/2);
      end
integer k;

initial begin 
ce=1'b0;
sclr=1'b1;
#clk_period;
sclr=1'b0;
#clk_period;
ce=1'b1;

data_input=4'h3;
weight=4'h2;
res_mac_p=4'h1;
#2;
for(k=0;k<3;k=k+1) begin 
#clk_period;
end

end 
endmodule
