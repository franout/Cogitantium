`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2020 18:04:30
// Design Name: 
// Module Name: register
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


module register
#(parameter N=4) (
    clk,
    reset,
    test_mode,
    enable,
    d,
    q );
   input clk;
   input reset;
      input test_mode;
      input enable;
      input [N-1:0]d;
      output wire [N-1:0]q;
      
      reg [N-1:0]q_i;
  
    always @(posedge(clk) || reset==1'b0) begin
    if(!reset)begin
    q_i<=0;
    end else if(clk==1'b1) begin 
        if(enable)begin 
        q_i<=d;
        end   
    end
    end
    
    assign q=q_i;
    
endmodule
