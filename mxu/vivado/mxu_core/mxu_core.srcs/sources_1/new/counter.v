`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2020 19:02:49
// Design Name: 
// Module Name: counter
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


module counter
#(parameter MAX_CNT=10)(
clk,
enable,
reset,
tc
    );
input clk;
input enable;
input reset;
output wire tc;

reg tci;

function integer clog2;
   input integer value;
   begin
     value = value-1;
     for (clog2=0; value>0; clog2=clog2+1)
       value = value>>1;
   end
endfunction

    
 reg [ $clog2(MAX_CNT):0] cnt;   
    
 always @(posedge(clk) || reset==1'b1 ) begin
    if(reset) begin
        cnt=0;
        tci<=1'b0;
        end  else if (clk==1'b1) begin
        if ( enable) begin 
        if(cnt==MAX_CNT) begin  
        cnt<=0;
        tci<=1'b1;
        end else begin 
        cnt<=cnt+1;   
        tci<=1'b0;
 end
 end
    end 
    end 
    
    assign tc=tci;
endmodule
