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

module tb_ls_array(    );




parameter clk_period= 10;

reg [3:0]select_precision;

reg clk,ce,sclr;
reg [3:0]data_input;
reg [3:0]res_mac_p;
reg [3:0]weight;

wire [3:0]res_mac_n;
wire [3:0]data_input_next_row;
wire enable_next_mac;



      always begin
         clk = 1'b1;
         #(clk_period/2) 
         clk = 1'b0;
         #(clk_period/2);
      end
integer k;

        initial begin
        $display("global reset");
        
        select_precision<=4'h0;
        $display("precision 8bit");    
        // apply input
        
        // wait for 3 cc
        
        
        // check output
        
             
        select_precision<=4'h1;
        $display("precision 16bit");
        $display("precision 32bit");
        
        $display("precision 64bit");
        
        
        $finish();
        end

endmodule
