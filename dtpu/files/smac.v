//==================================================================================================
//  Filename      : smac.v
//  Created On    : 2020-04-22 17:05:43
//  Last Modified : 2020-05-06 19:24:22
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology,Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com
//
//  Description   : 
//
//
//==================================================================================================
`timescale 1ns / 1ps

`include "precision_def.vh"
module smac
#(parameter USE_FABRIC="NO")(
    input clk,
    input  ce,
    input sclr,
        ///////////////////////////////////////////
        ///// DATA SIGNALS OF SubMAC unit /////////
        ///////////////////////////////////////////
        input [64-1:0]data_input,
        input [64-1:0]weight,
        input [64-1:0]res_mac_p, 
        output wire [64-1:0]res_mac_n,
        /////////////////////////////////////////
        ///// CONTROL SIGNALS FOR DSP CHAIN /////
        /////////////////////////////////////////
        input wire [3:0]select_precision,
        input wire [1:0]enable_fp_unit,
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
generate
  for(i=1;i<8;i=i+1)  begin
    assign pcout[i]= active_chain ? pcout[i-1] : 0;
  end
endgenerate
`endif

/////////////////////////////////////////
/////// integer unit  chain /////////////
/////////////////////////////////////////
   generate
     if(USE_FABRIC=="YES") begin 
      // generate fabric implementation of multipliers
        `ifdef USE_ALL
        dsp_smac_8_fa smac_8_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .A(data_input[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .C(res_mac_p[7:0]),
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_n[7:0])          // output wire [7 : 0] P
                      );

        dsp_smac_8_fa smac_8_1_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[1]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b1),      // input wire [0 : 0] SEL
                    .PCIN(pcout[1]<<8),    // input wire [47 : 0] PCIN
                    .A(data_input[15:8]),          // input wire [7 : 0] A
                    .B(weight[15:8]),          // input wire [7 : 0] B
                    .C(res_mac_p[15:8]),
                    .PCOUT(pcout[2]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_n[15:8])          // output wire [7 : 0] P
                    );
        dsp_smac_16_fa smac_16_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(pcout[3]),    // input wire [47 : 0] PCIN
                    .A(data_input[31:16]),          // input wire [15 : 0] A
                    .B(weight[31:16]),          // input wire [15 : 0] B
                    .C(res_mac_p[31:16]),
                    .PCOUT(pcout[4]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_n[31:16])          // output wire [47 : 0] P
                      );

        // 32 bit dsp logically 
        dsp_smac_16_fa smac_32_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[3]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(pcout[4]),    // input wire [47 : 0] PCIN
                    .A(data_input[47:32]),          // input wire [15 : 0] A
                    .B(weight[47:32]),          // input wire [15 : 0] B
                    .C(res_mac_p[47:32]),
                    .PCOUT(pcout[5]),  // output wire [47 : 0] PCOUT
                    .P(res_mac_n[47:32])          // output wire [47 : 0] P
                      );
        dsp_smac_16_fa smac_32_1_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[3]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .PCIN(pcout[6]),    // input wire [47 : 0] PCIN
                    .A(data_input[63:48]),          // input wire [15 : 0] A
                    .B(weight[63:48]),          // input wire [15 : 0] B
                    .PCOUT(pcout[7]),  // output wire [47 : 0] PCOUT
                    .C(res_mac_p[63:48]),
                    .P(res_mac_n[63:48])          // output wire [47 : 0] P
                      );
         `elsif  USEO_INT8
                  dsp_smac_8_fa smac_8_0s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .CARRYIN(0),    // input wire [47 : 0] PCIN
                    .A(data_input[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .C(res_mac_p[7:0]),
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
                assign res_mac_n=  {56'd0, pcout[1][7:0]};
       `elsif USEO_INT16
              dsp_smac_16_fa smac_16s_0_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[1]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .CARRYIN(1'b0),    // input wire [47 : 0] PCIN
                    .C(res_mac_p[15:0]),
                    .A(data_input[15:0]),          // input wire [7 : 0] A
                    .B(weight[15:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
        assign res_mac_n={48'd0,pcout[1][15:0] };
         `elsif USEO_INT32
        

        // 32 bit dsp logically 
        dsp_smac_16_fa smac_32_0s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b1),      // input wire [0 : 0] SEL
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .C(res_mac_p[15:0]),
                    .A(data_input[15:0]),          // input wire [15 : 0] A
                    .B(weight[15:0]),          // input wire [15 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [47 : 0] P
                      );
        dsp_smac_16_fa smac_32_1s_fa (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(pcout[0]),    // input wire [47 : 0] PCIN
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .C(res_mac_p[31:16]),
                    .A(data_input[31:16]),          // input wire [15 : 0] A
                    .B(weight[31:16]),          // input wire [15 : 0] B
                    .PCOUT(pcout[2]),  // output wire [47 : 0] PCOUT
                    .P(pcout[2])          // output wire [47 : 0] P
                      );
          assign res_mac_n={32'd0,pcout[2][15:0],pcout[1][15:0]};
        `endif
     end else begin 
      // generate dsp implementation of multipliers
      `ifdef USE_ALL
          dsp_smac_8 smac_8_0 (
                      .CLK(clk),      // input wire CLK
                      .CE(enable_i[0]),        // input wire CE
                      .SCLR(sclr),    // input wire SCLR
                      .SEL(1'b0),      // input wire [0 : 0] SEL
                      .CARRYIN(0),    // input wire [47 : 0] PCIN
                      .C(res_mac_p[7:0]),
                      .A(data_input[7:0]),          // input wire [7 : 0] A
                      .B(weight[7:0]),          // input wire [7 : 0] B
                      .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                      .P(res_mac_n[7:0])          // output wire [7 : 0] P
                    );
          dsp_smac_8 smac_8_1 (
                      .CLK(clk),      // input wire CLK
                      .CE(enable_i[1]),        // input wire CE
                      .SCLR(sclr),    // input wire SCLR
                      .SEL(1'b1),      // input wire [0 : 0] SEL
                      .C(res_mac_p[15:8]),
                      .PCIN(pcout[1]<<8),    // input wire [47 : 0] PCIN
                      .A(data_input[15:8]),          // input wire [7 : 0] A
                      .B(weight[15:8]),          // input wire [7 : 0] B
                      .PCOUT(pcout[2]),  // output wire [47 : 0] PCOUT
                      .P(res_mac_n[15:8])          // output wire [7 : 0] P
                    );

          dsp_smac_16 smac_16_0 (
              .CLK(clk),      // input wire CLK
              .CE(enable_i[2]),        // input wire CE
              .SCLR(sclr),    // input wire SCLR
              .PCIN(pcout[3]),    // input wire [47 : 0] PCIN
              .A(data_input[31:16]),          // input wire [15 : 0] A
              .C(res_mac_p[31:16]),
              .SEL(1'b0),      // input wire [0 : 0] SEL
              .B(weight[31:16]),          // input wire [15 : 0] B
              .PCOUT(pcout[4]),  // output wire [47 : 0] PCOUT
              .P(res_mac_n[31:16])          // output wire [15 : 0] P
                  );

          // 32 bit dsp logically 

          dsp_smac_16 smac_32_0 (
              .CLK(clk),      // input wire CLK
              .CE(enable_i[3]),        // input wire CE
              .SCLR(sclr),    // input wire SCLR
              .PCIN(pcout[5]),    // input wire [47 : 0] PCIN
              .C(res_mac_p[48:32]),
              .A(data_input[47:32]),          // input wire [15 : 0] A
              .SEL(1'b0),      // input wire [0 : 0] SEL
              .B(weight[47:32]),          // input wire [15 : 0] B
              .PCOUT(pcout[6]), // output wire [47 : 0] PCOUT
              .P(res_mac_n[47:32])          // output wire [15 : 0] P
                  );



        dsp_smac_16 smac_32_1 (
              .CLK(clk),      // input wire CLK
              .CE(enable_i[3]),        // input wire CE
              .SCLR(sclr),    // input wire SCLR
              .SEL(1'b0),      // input wire [0 : 0] SE
              .PCIN((pcout[6])),    // input wire [47 : 0] PCIN
              .A(data_input[63:48]),          // input wire [15 : 0] A
              .C(res_mac_p[63:48]),
              .B(weight[63:48]),          // input wire [15 : 0]          
              .PCOUT(pcout[7]),  // output wire [47 : 0] PCOUT
              .P(res_mac_n[63:48])          // output wire [15 : 0]              
               );
         `elsif USEO_INT8
                  dsp_smac_8 smac_8_0s (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[0]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                  //  .PCIN(0),    // input wire [47 : 0] PCIN
                  .CARRYIN(1'b0),
                    .C(res_mac_p[7:0]),
                    .A(data_input[7:0]),          // input wire [7 : 0] A
                    .B(weight[7:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
                assign res_mac_n=  {56'd0, pcout[1][7:0]};
    `elsif USEO_INT16
              dsp_smac_16 smac_16s_0 (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[1]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .CARRYIN(1'b0),    // input wire [47 : 0] PCIN
                    .C(res_mac_p[15:0]),
                    .A(data_input[15:0]),          // input wire [7 : 0] A
                    .B(weight[15:0]),          // input wire [7 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [7 : 0] P
                      );
        assign res_mac_n={48'd0,pcout[1][15:0] };
        `elsif USEO_INT32
        // 32 bit dsp logically 
        dsp_smac_16 smac_32_0s (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .PCIN(0),    // input wire [47 : 0] PCIN
                    .C(res_mac_p[15:0]),
                    .A(data_input[15:0]),          // input wire [15 : 0] A
                    .SEL(1'b0),      // input wire [0 : 0] SEL
                    .B(weight[15:0]),          // input wire [15 : 0] B
                    .PCOUT(pcout[0]),  // output wire [47 : 0] PCOUT
                    .P(pcout[1])          // output wire [47 : 0] P
                      );
        dsp_smac_16 smac_32_1s (
                    .CLK(clk),      // input wire CLK
                    .CE(enable_i[2]),        // input wire CE
                    .SCLR(sclr),    // input wire SCLR
                    .SEL(1'b1),      // input wire [0 : 0] SEL
                    .C(res_mac_p[31:16]),
                    .PCIN(pcout[0]),    // input wire [47 : 0] PCIN
                    .A(data_input[31:16]),          // input wire [15 : 0] A
                    .B(weight[31:16]),          // input wire [15 : 0] B
                    .PCOUT(pcout[2]),  // output wire [47 : 0] PCOUT
                    .P(pcout[2])          // output wire [47 : 0] P
                      );
              assign res_mac_n={32'd0,pcout[2][15:0],pcout[1][15:0]};
        assign res_mac_n[63:32]=0;
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
reg [31:0]z_mult_add;
wire [31:0] fp_out;
wire [31:0] z_add_out;
reg [31:0]a;
reg [31:0]b;
reg [31:0]c;

always @(posedge clk ) begin
  if(sclr) begin
    a <= 0;b<=0;z_sc<=0; c<=0;
  end else begin
      if(ce && enable_fp_unit[0])begin 
        a<=data_input[31:0];
        b<=weight[31:0];
        c<=res_mac_p[31:0];
        z_sc<=fp_out;
        z_mult_add<=z_add_out;
      end 
  end
end

FPmul_sc fp_mul_32(
  .FP_A(a),
  .FP_B(b),
  .FP_Z(fp_out),
  .clk(clk));
FPadd_sc fp_add_32(
  .ADD_SUB(1'b1),
  .FP_A(z_sc),
  .FP_B(c),
  .clk(clk),
  .FP_Z(z_add_out));



assign  res_mac_n= {32'd0, z_mult_add} ;
`elsif  USE0_FP16 
`elsif  USE0_BFP16 



reg[31:0]z_sc;
reg [31:0]z_mult_add;
wire [31:0] fp_out;
wire [31:0] z_add_out;
reg [31:0]a;
reg [31:0]b;
reg [31:0]c;

always @(posedge clk ) begin
  if(sclr) begin
    a <= 0;b<=0;z_sc<=0; c<=0;
  end else begin
      if(ce && enable_fp_unit[0] && enable_fp_unit[1])begin 
        a<={data_input[15:0],16'd0};
        b<={weight[15:0],16'd0};
        c<={res_mac_p[15:0],16'd0};
        z_sc<=fp_out;
        z_mult_add<=z_add_out;
      end 
  end
end

FPmul_sc fp_mul_b16(
  .FP_A(a),
  .FP_B(b),
  .FP_Z(fp_out),
  .clk(clk));
FPadd_sc fp_add_b16(
  .ADD_SUB(1'b1),
  .FP_A(z_sc),
  .FP_B(c),
  .clk(clk),
  .FP_Z(z_add_out));



assign  res_mac_n= {32'd0, z_mult_add[31:16],16'd0} ;


`endif


endmodule
