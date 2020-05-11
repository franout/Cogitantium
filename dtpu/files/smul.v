//==================================================================================================
//  Filename      : smul.v
//  Created On    : 2020-04-22 17:05:25
//  Last Modified : 2020-05-11 22:50:38
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
  output [63:0] data_input_next_row,
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


/////////////////////////////////////////
/////// integer unit  chain /////////////
/////////////////////////////////////////
   generate
     if(USE_FABRIC=="YES") begin 
      // generate fabric implementation of multipliers
        `ifdef USE_ALL

                      (*use_dsp="yes"*)  dsp_smul_64 dsp_smul_64_inst (
                .CLK(clk),
                .CE(enable_i),
                .SCLR(sclr),
                .active_chain(active_chain),
                .A(input_data),
                .B(weight),
                .P(res_mac_next) );


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
          (*use_dsp="yes"*)  dsp_smul_64 dsp_smul_64_inst (
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




wire [64-1:0]q1;
wire [64-1:0]q;
    // delay registers 
    register  #(.N(64)) delay_reg1 (
         .clk(clk),
        .reset(sclr),
        .test_mode(test_mode),
        .enable(ce),
        .d(input_data),
        .q(q1));
         
         register  #(.N(64)) delay_reg2 (
                 .clk(clk),
                .reset(sclr),
                .test_mode(test_mode),
                .enable(ce),
                .d(q1),
                .q(q));   
 assign data_input_next_row=q;


endmodule