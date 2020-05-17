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

module tb_mac();




parameter clk_period= 10;
reg clk;
reg enable,reset,active_chain;
reg [63:0] data_input;
reg [63:0] weight;
reg [63:0] res_mac_p;
wire [63:0] res_mac_n;
reg [3:0] select_precision;

wire [7:0] P;
wire [47:0]CARRYCASCOUT;
dsp_smac_8 uutsmac (
      .CLK(clk),                    // input wire CLK
      .CE(1'b1),                      // input wire CE
      .SCLR(reset),                  // input wire SCLR
      .PCIN(48'b0),            // input wire CARRYIN
      .A(data_input[7:0]),                        // input wire [7 : 0] A
      .B(weight[7:0]),                        // input wire [7 : 0] B
      .C(8'h01),                        // input wire [7 : 0] C
      .PCOUT(CARRYCASCOUT),  // output wire CARRYCASCOUT
      .P(P)                        // output wire [7 : 0] P
    );


      always begin
         clk = 1'b1;
         #(clk_period/2) 
         clk = 1'b0;
         #(clk_period/2);
      end
      
        initial begin
        /////////////////////////////////
        /// NOTE reset is active high ///
        /////////////////////////////////
        reset=1'b1;
        enable=1'b0;
        active_chain=1'b1;
        $display("global reset");
        #clk_period;
        reset=1'b0;
        enable=1'b1;
        data_input={4{16'hCAFE}};
        weight={4{16'hFFFF}};
        res_mac_p={4{16'h0000}};
        $display("chain active");
        // stimulus
        select_precision<=4'h1;
        $display("precision 8bit");    
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;

        enable=1'b1;
        select_precision<=4'h3;
        $display("precision 16bit");
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;
        enable=1'b1;
        select_precision<=4'h7;
        $display("precision 32bit");
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;
        enable=1'b1;
        select_precision<=4'hF;
        $display("precision 64bit");
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;
        enable=1'b1;
        $display("chain not active");
        active_chain=1'b0;
        select_precision<=4'h1;
        $display("precision 8bit");    
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;
        enable=1'b1;
        select_precision<=4'h3;
        $display("precision 16bit");
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;
        enable=1'b1;
        select_precision<=4'h7;
        $display("precision 32bit");
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;
        enable=1'b1;
        select_precision<=4'hF;
        $display("precision 64bit");
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;
        #clk_period;
        $finish();
        end
endmodule
