`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 16:07:45
// Design Name: 
// Module Name: tb_mul
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


module tb_mul(

    );
                parameter clk_period= 10;
                reg clk,ce,sclr;
                reg [3:0]data_input;
                reg [3:0]res_mac_p;
                reg [3:0]weight;

                

                wire [3:0]res_mac_n;
                wire [3:0]data_input_next_row;
                wire enable_next_mac;
                
                reg [63:0] data_input64;
                reg [63:0] weight64;
                reg active_chain;
                reg enable;
                reg [3:0] select_precision;
                wire [63:0]res_mac_n64;
    
                mult_gen_0 mult_i (
                              .CLK(clk),    // input wire CLK
                              .A(data_input),        // input wire [3 : 0] A
                              .B(weight),        // input wire [3 : 0] B
                              .CE(ce),      // input wire CE
                              .SCLR(sclr),  // input wire SCLR
                              .P(res_mac_n)        // output wire [3 : 0] P
                            );
                smul uut (
                              .clk(clk),    // input wire CLK
                              .data_input(data_input64),        // input wire [3 : 0] A
                              .weight(weight64),        // input wire [3 : 0] B
                              .ce(enable),      // input wire CE
                              .sclr(sclr),  // input wire SCLR
                              .res_mac_n(res_mac_n64)        // output wire [3 : 0] P
                              .active_chain(active_chain),
                              .select_precision(select_precision)

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
                weight=4'h3;
                #1;
                weight=4'h3;
                #1;
                weight=4'h4;
                #1;
                weight=4'h1;#1;
                weight=4'h2;#1;
                weight=4'h3;#1;
                weight=4'h5;#1;
                for(k=0;k<3;k=k+1) begin 
                #clk_period;
                end
                

                $display("smul TEST"); 
                enable=1'b0;
                active_chain=1'b1;
                $display("global reset");
                #clk_period;
                reset=1'b0;
                enable=1'b1;
                data_input64={4{16'hCAFE}};
                weight64={4{16'hFFFF}};
                res_mac_n64={4{16'h0000}};
                $display("chain active");
                // stimulus
                select_precision<=4'h1;
                $display("precision 8bit");    
                #clk_period;
                #clk_period;
                #clk_period;#clk_period;#clk_period;#clk_period;#clk_period;
                #clk_period;#clk_period;#clk_period;#clk_period;#clk_period;
                enable=1'b0;
                #clk_period;
                enable=1'b1;
                select_precision<=4'h3;
                $display("precision 16bit");
                #clk_period;
                #clk_period;
                #clk_period;
                enable=1'b0;
                #clk_period;
                enable=1'b1;
                select_precision<=4'h7;
                $display("precision 32bit");
                #clk_period;
                #clk_period;
                #clk_period;
                enable=1'b0;
                #clk_period;
                enable=1'b1;
                select_precision<=4'hF;
                $display("precision 64bit");
                #clk_period;
                #clk_period;
                #clk_period;
                enable=1'b0;
                #clk_period;#clk_period;
                enable=1'b1;
                $display("chain not active");
                active_chain=1'b0;
                select_precision<=4'h1;
                $display("precision 8bit");    
                #clk_period;
                #clk_period;
                #clk_period;
                enable=1'b0;
                #clk_period;
                enable=1'b1;
                select_precision<=4'h3;
                $display("precision 16bit");
                #clk_period;
                #clk_period;
                #clk_period;
                enable=1'b0;
                #clk_period;
                enable=1'b1;
                select_precision<=4'h7;
                $display("precision 32bit");
                #clk_period;
                #clk_period;
                #clk_period;
                enable=1'b0;
                #clk_period;
                enable=1'b1;
                select_precision<=4'hF;
                $display("precision 64bit");
                #clk_period;
                #clk_period;
                #clk_period;
                enable=1'b0;
        

                $finish();
                end 

endmodule
