`timescale 1ns/1ps

module smul (
	input clk,
	input ce,
	input sclr,
	

	///////////////////////////////////////////
    ///// DATA SIGNALS OF SubMAC unit /////////
    ///////////////////////////////////////////
    input [63:0]input_data,
	input [63:0]weight,
	output [63:0]res_mac_next,
    /////////////////////////////////////////
    ///// CONTROL SIGNALS FOR DSP CHAIN /////
    /////////////////////////////////////////
    input wire [3:0]select_precision,
    input wire active_chain      
	);




   wire carry_in;
   wire [3:0]enable_i;
   wire carrycascout[0:5];
   assign carry_in=1'b0;
   
   /////////////////////////
   ///// enable network //// 
   /////////////////////////
   genvar i;
   generate 
   for(i=0;i<4;i=i+1) begin 
   assign enable_i[i]= ce & select_precision[i];
   end
   endgenerate
     
   
     dsp_smac_8 smac_8_0 (
          .CLK(clk),                    // input wire CLK
          .CE(enable_i[0]),                      // input wire CE
          .SCLR(sclr),                  // input wire SCLR
          .CARRYIN(carry_in),            // input wire CARRYIN
          .A(input_data[7:0]),                        // input wire [7 : 0] A
          .B(weight[7:0]),                        // input wire [7 : 0] B
          .C(res_mac_p[7:0]),                        // input wire [7 : 0] C
          .CARRYCASCOUT(carrycascout[0]),  // output wire CARRYCASCOUT
          .P(res_mac_n[7:0])                        // output wire [7 : 0] P
        );
   
    assign carrycascout[1]= carrycascout[0] & active_chain;
       dsp_smac_8 smac_8_1 (
                  .CLK(clk),                    // input wire CLK
                  .CE(enable_i[1]),                      // input wire CE
                  .SCLR(sclr),                  // input wire SCLR
                  .CARRYIN(carrycascout[1]),            // input wire CARRYIN
                  .A(input_data[15:8]),                        // input wire [7 : 0] A
                  .B(weight[15:8]),                        // input wire [7 : 0] B
                  .C(res_mac_p[15:8]),                        // input wire [7 : 0] C
                  .CARRYCASCOUT(carrycascout[2]),  // output wire CARRYCASCOUT
                  .P(res_mac_n[15:8])                        // output wire [7 : 0] P
                );
     assign carrycascout[3]=carrycascout[2] &active_chain;       
   dsp_smac_16 smac_16 (
          .CLK(clk),                    // input wire CLK
          .CE(enable_i[2]),                      // input wire CE
          .SCLR(sclr),                  // input wire SCLR
          .CARRYIN(carrycascout[3]),            // input wire CARRYIN
          .A(data_input[31:16]),                        // input wire [15 : 0] A
          .B(weight[31:16]),                        // input wire [15 : 0] B
          .C(res_mac_p[31:16]),                        // input wire [15 : 0] C
          .CARRYCASCOUT(carrycascout[4]),  // output wire CARRYCASCOUT
          .P(res_mac_n[31:16])                        // output wire [15 : 0] P
        );
        
        wire [47:0]lastcarrycascout;
        assign lastcarrycascout[0]=carrycascout[4] &active_chain;
        assign lastcarrycascout[47:1]={46{1'b0}};
        wire subtract;
        wire [47:0]PCOUT;
        assign subtract=1'b0;
        dsp_smac_32 smac_32 (
          .CLK(clk),            // input wire CLK
          .CE(enable_i[3]),              // input wire CE
          .SCLR(sclr),          // input wire SCLR
          .A(data_input[63:32]),                // input wire [31 : 0] A
          .B(weight[63:32]),                // input wire [31 : 0] B
          .C( { {16{1'b0}} ,res_mac_p[63:32]}),                // input wire [47 : 0] C
          .PCIN(lastcarrycascout),          // input wire [47 : 0] PCIN
          .SUBTRACT(subtract),  // input wire SUBTRACT
          .P(res_mac_n[63:32]),                // output wire [32 : 0] P
          .PCOUT(PCOUT)        // output wire [47 : 0] PCOUT
        );



endmodule