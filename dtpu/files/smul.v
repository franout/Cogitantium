//==================================================================================================
//  Filename      : smul.v
//  Created On    : 2020-04-22 17:05:25
//  Last Modified : 2020-05-07 19:29:18
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology,Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com
//
//  Description   : 
//
//
//==================================================================================================

`timescale 1ns/1ps
`include "precision_def.vh"

module smul
#(parameter USE_FABRIC="NO") // if no -> it uses the dsp 
 (
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
  input wire [1:0] enable_fp_unit,
  input wire active_chain      
	);




   wire [3:0]enable_i;
   wire [47:0]pcout[0:7];
   
   /////////////////////////
   ///// enable network //// 
   /////////////////////////
   genvar i;
   generate 
   for(i=0;i<4;i=i+1) begin 
   assign enable_i[i]= ce & select_precision[i];
   end
   endgenerate

///////////////////////////////////
///// propagate chain network ///// 
///////////////////////////////////
`ifdef USE_ALL
wire [0:0]carry[0:7];
    assign pcout[1]= active_chain ? pcout [0] : 0;
    assign pcout[3]= active_chain ? pcout [2] : 0;
    assign pcout[5]= active_chain ? pcout [4] : 0;

    assign carry[1]= active_chain ? carry [0] : 0;
    assign carry[3]= active_chain ? carry [2] : 0;
    assign carry[5]= active_chain ? carry [4] : 0;
wire [63:0]out_dsp[0:4];
`endif

/////////////////////////////////////////
/////// integer unit  chain /////////////
/////////////////////////////////////////
   generate
     if(USE_FABRIC=="YES") begin 
      // generate fabric implementation of multipliers
        `ifdef USE_ALL

        dsp_smul_8_fa smul_8_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(input_data[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(out_dsp[0])          // output wire [7 : 0] P
                      );

        dsp_smul_8_fa smul_8_1_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[1]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(active_chain),      // input wire [0 : 0] SEL
                    .PCIN({ pcout[1][38:0], 9'b0 } ),  // SHIFT BY 9  // input wire [47 : 0] PCIN 
                    .A(input_data[15:8]),          // input wire [7 : 0] A
                    .B(weight[15:8]),          // input wire [7 : 0] B
                    .PCOUT(pcout[2]),  // output wire [47 : 0] PCOUT
                    .P(out_dsp[1])          // output wire [7 : 0] P
                    );
        dsp_smul_16_fa smul_16_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(active_chain),      // input wire [0 : 0] SEL
                    .PCIN(pcout[3]),    // input wire [47 : 0] PCIN
                    .A(input_data[31:16]),          // input wire [15 : 0] A
                    .B(weight[31:16]),          // input wire [15 : 0] B
                    .PCOUT(pcout[4]),  // output wire [47 : 0] PCOUT
                    .P(out_dsp[2])          // output wire [47 : 0] P
                      );

        // 32 bit dsp

        (*use_dsp="no"*) dsp_smul_32 smul_32s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[3]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(pcout[5]),    // input wire [47 : 0] PCIN
                    .SEL(active_chain),      // input wire [0 : 0] SEL
                    .A(input_data[63:32]),          // input wire [15 : 0] A
                    .B(weight[63:32]),          // input wire [15 : 0] B
                    .P(out_dsp[3])          // output wire [32 : 0] P
                      );

            assign res_mac_next= {  out_dsp[3][31:0] ,out_dsp[2][15:0] ,out_dsp[1][7:0] ,out_dsp[0][7:0]};
         `elsif  USEO_INT8
                  dsp_smul_8_fa smul_8_0s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(47'd0),    // input wire [47 : 0] PCIN
                    .A(input_data[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
        assign res_mac_next=  {56'd0, pcout[1][7:0]};
        `elsif USEO_INT16
              dsp_smul_16_fa smul_16s_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[1]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b1),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(input_data[15:0]),          // input wire [7 : 0] A
                    .B(weight[15:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
        assign res_mac_next= {48'd0, pcout[1][15:0]};
         `elsif USEO_INT32
      (*use_dsp="no"*) dsp_smul_32 smul_32s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .A(input_data[31:0]),          // input wire [15 : 0] A
                    .B(weight[31:0]),          // input wire [15 : 0] B
                    .P(pcout[2])          // output wire [32 : 0] P
                      );
            assign res_mac_next={  32'd0, pcout[2][31:0]};

        `endif
     end else begin 
      // generate dsp implementation of multipliers
     `ifdef USE_ALL
        /*  dsp_smul_8 smul_8_0 (
                      .CLK(clk),      // input wire CLK
                      .CE(enable_i[0]),        // input wire CE
                      .SCLR(sclr),    // input wire SCLR
                      .SEL(1'b0),      // input wire [0 : 0] SEL
                      .PCIN(0),    // input wire [47 : 0] PCIN
                      .CARRYIN(0),
                      .CARRYOUT(carry[0]),
                      .A({8'd0 ,input_data[7:0]}),          // input wire [7 : 0] A
                      .B({8'd0, weight[7:0]}),          // input wire [7 : 0] B
                      .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                      .P(out_dsp[0])          // output wire [7 : 0] P
                    );
          dsp_smul_8 smul_8_1 (
                      .CLK(clk),      // input wire CLK
                      .CE(enable_i[1]),        // input wire CE
                      .SCLR(sclr),    // input wire SCLR
                      .SEL(active_chain),      // input wire [0 : 0] SEL
                     .PCIN({ pcout[1][39:0], 9'b0 } ),  // SHIFT BY 9  // input wire [47 : 0] PCIN 
                     .CARRYIN(carry[1]),
                      .CARRYOUT(carry[3]),
                      .A({8'd0 ,input_data[15:8]}),          // input wire [7 : 0] A
                      .B({8'd0,weight[15:8]}),          // input wire [7 : 0] B
                      .PCOUT(pcout[2]),  // output wire [47 : 0] PCOUT
                      .P(out_dsp[1])          // output wire [7 : 0] P
                    );

          dsp_smul_16 smul_16_0 (
              .CLK(clk),      // input wire CLK
              .CE(enable_i[2]),        // input wire CE
              .SCLR(sclr),    // input wire SCLR
              .PCIN(pcout[3]),    // input wire [47 : 0] PCIN
              .A(input_data[31:16]),          // input wire [15 : 0] A
              .SEL(active_chain),      // input wire [0 : 0] SEL
              .B(weight[31:16]),          // input wire [15 : 0] B
              .PCOUT(pcout[4]),  // output wire [47 : 0] PCOUT
              .P(out_dsp[2])          // output wire [15 : 0] P
                  );

          // 32 bit dsp 

        (*use_dsp="yes"*) dsp_smul_32 smul_32s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[3]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(pcout[5]),    // input wire [47 : 0] PCIN
                    .SEL(active_chain),      // input wire [0 : 0] SEL
                    .A(input_data[63:32]),          // input wire [15 : 0] A
                    .B(weight[63:32]),          // input wire [15 : 0] B
                    .P(out_dsp[3])          // output wire [32 : 0] P
                      );

            assign res_mac_next= {  out_dsp[3][31:0] ,out_dsp[2][15:0] ,out_dsp[1][7:0] ,out_dsp[0][7:0]};
*/
            dsp_smul_64 dsp_smul_64_inst (
                .CLK(clk),
                .CE(enable_i),
                .SCLR(sclr),
                .active_chain(active_chain),
                .A(input_data),
                .B(weight),
                .P(res_mac_next) );

         `elsif USEO_INT8
                  dsp_smul_8 smul_8_0s (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(47'd0),    // input wire [47 : 0] PCIN
                    .A(input_data[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
        assign res_mac_next=  {56'd0, pcout[1][7:0]};
       `elsif USEO_INT16
              dsp_smul_16 smul_16s_0 (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[1]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b1),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(input_data[15:0]),          // input wire [7 : 0] A
                    .B(weight[15:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
              assign res_mac_next={48'd0,pcout[1][15:0]};
        `elsif USEO_INT32
  
        (*use_dsp="yes"*) dsp_smul_32 smul_32s (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(47'd0),    // input wire [47 : 0] PCIN
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .A(input_data[31:0]),          // input wire [15 : 0] A
                    .B(weight[31:0]),          // input wire [15 : 0] B
                    .P(pcout[2])          // output wire [32 : 0] P
                      );
                  assign res_mac_next={  32'd0, pcout[2][31:0]};

        `endif
     end
   endgenerate



//////////////////////////
//floating point unit ////
//////////////////////////


// 32 bit -> 1 sign , 8 exp , 23 mantissa
// 16 bit -> 1 sign , 5 exp , 10 mantissa
// bf16 bit -> 1 sign , 8 exp , 7 mantissa

`ifdef USE0_FP32
reg[31:0]z_sc;
wire [31:0] fp_out;
reg [31:0]a;
reg [31:0]b;


always @(posedge clk ) begin
  if(sclr) begin
    a <= 0;b<=0;z_sc<=0;
  end else begin
      if(ce && enable_fp_unit[0])begin 
        a<=input_data[31:0];
        b<=weight[31:0];
        z_sc<=fp_out;
      end 
  end
end

FPmul_sc fp_mul_32(
  .FP_A(a),
  .FP_B(b),
  .FP_Z(fp_out),
  .clk(clk));

assign  res_mac_next= {32'd0, z_sc} ;
`elsif  USE0_FP16 
`elsif  USE0_BFP16 

reg[31:0]z_sc;
wire [31:0] fp_out;
reg [31:0]a;
reg [31:0]b;


always @(posedge clk ) begin
  if(sclr) begin
    a <= 0;b<=0;z_sc<=0;
  end else begin
      if(ce && enable_fp_unit[0])begin 
        a<={input_data[15:0],16'd0};
        b<={weight[15:0],16'd0};
        z_sc<=fp_out;
      end 
  end
end

FPmul_sc fp_mul_b16(
  .FP_A(a),
  .FP_B(b),
  .FP_Z(fp_out),
  .clk(clk));

assign  res_mac_next= {32'd0, z_sc[31:16],16'd0} ;
`endif


endmodule