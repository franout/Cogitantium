// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Wed Apr  8 17:51:40 2020
// Host        : fra running 64-bit Ubuntu 18.04.4 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ smul_8_sim_netlist.v
// Design      : smul_8
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "smul_8,xbip_dsp48_macro_v3_0_17,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_dsp48_macro_v3_0_17,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    CE,
    SCLR,
    CARRYIN,
    A,
    B,
    CARRYCASCOUT,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 carryin_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME carryin_intf, LAYERED_METADATA undef" *) input CARRYIN;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [7:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [7:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 carrycascout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME carrycascout_intf, LAYERED_METADATA undef" *) output CARRYCASCOUT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [7:0]P;

  wire [7:0]A;
  wire [7:0]B;
  wire CARRYCASCOUT;
  wire CARRYIN;
  wire CE;
  wire CLK;
  wire [7:0]P;
  wire SCLR;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "8" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "1" *) 
  (* C_HAS_CARRYIN = "1" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "-1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000010000000010100000000" *) 
  (* C_P_LSB = "8" *) 
  (* C_P_MSB = "15" *) 
  (* C_REG_CONFIG = "00000000000011001011010001010100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_dsp48_macro_v3_0_17 U0
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_U0_ACOUT_UNCONNECTED[29:0]),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_U0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(CARRYCASCOUT),
        .CARRYIN(CARRYIN),
        .CARRYOUT(NLW_U0_CARRYOUT_UNCONNECTED),
        .CE(CE),
        .CEA(1'b1),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEA3(1'b1),
        .CEA4(1'b1),
        .CEB(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEB3(1'b1),
        .CEB4(1'b1),
        .CEC(1'b1),
        .CEC1(1'b1),
        .CEC2(1'b1),
        .CEC3(1'b1),
        .CEC4(1'b1),
        .CEC5(1'b1),
        .CECONCAT(1'b1),
        .CECONCAT3(1'b1),
        .CECONCAT4(1'b1),
        .CECONCAT5(1'b1),
        .CED(1'b1),
        .CED1(1'b1),
        .CED2(1'b1),
        .CED3(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CESEL(1'b1),
        .CESEL1(1'b1),
        .CESEL2(1'b1),
        .CESEL3(1'b1),
        .CESEL4(1'b1),
        .CESEL5(1'b1),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
endmodule

(* C_A_WIDTH = "8" *) (* C_B_WIDTH = "8" *) (* C_CONCAT_WIDTH = "48" *) 
(* C_CONSTANT_1 = "1" *) (* C_C_WIDTH = "48" *) (* C_D_WIDTH = "18" *) 
(* C_HAS_A = "1" *) (* C_HAS_ACIN = "0" *) (* C_HAS_ACOUT = "0" *) 
(* C_HAS_B = "1" *) (* C_HAS_BCIN = "0" *) (* C_HAS_BCOUT = "0" *) 
(* C_HAS_C = "0" *) (* C_HAS_CARRYCASCIN = "0" *) (* C_HAS_CARRYCASCOUT = "1" *) 
(* C_HAS_CARRYIN = "1" *) (* C_HAS_CARRYOUT = "0" *) (* C_HAS_CE = "1" *) 
(* C_HAS_CEA = "0" *) (* C_HAS_CEB = "0" *) (* C_HAS_CEC = "0" *) 
(* C_HAS_CECONCAT = "0" *) (* C_HAS_CED = "0" *) (* C_HAS_CEM = "0" *) 
(* C_HAS_CEP = "0" *) (* C_HAS_CESEL = "0" *) (* C_HAS_CONCAT = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_INDEP_CE = "0" *) (* C_HAS_INDEP_SCLR = "0" *) 
(* C_HAS_PCIN = "0" *) (* C_HAS_PCOUT = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SCLRA = "0" *) (* C_HAS_SCLRB = "0" *) (* C_HAS_SCLRC = "0" *) 
(* C_HAS_SCLRCONCAT = "0" *) (* C_HAS_SCLRD = "0" *) (* C_HAS_SCLRM = "0" *) 
(* C_HAS_SCLRP = "0" *) (* C_HAS_SCLRSEL = "0" *) (* C_LATENCY = "-1" *) 
(* C_MODEL_TYPE = "0" *) (* C_OPMODES = "000010000000010100000000" *) (* C_P_LSB = "8" *) 
(* C_P_MSB = "15" *) (* C_REG_CONFIG = "00000000000011001011010001010100" *) (* C_SEL_WIDTH = "0" *) 
(* C_TEST_CORE = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_dsp48_macro_v3_0_17
   (CLK,
    CE,
    SCLR,
    SEL,
    CARRYCASCIN,
    CARRYIN,
    PCIN,
    ACIN,
    BCIN,
    A,
    B,
    C,
    D,
    CONCAT,
    ACOUT,
    BCOUT,
    CARRYOUT,
    CARRYCASCOUT,
    PCOUT,
    P,
    CED,
    CED1,
    CED2,
    CED3,
    CEA,
    CEA1,
    CEA2,
    CEA3,
    CEA4,
    CEB,
    CEB1,
    CEB2,
    CEB3,
    CEB4,
    CECONCAT,
    CECONCAT3,
    CECONCAT4,
    CECONCAT5,
    CEC,
    CEC1,
    CEC2,
    CEC3,
    CEC4,
    CEC5,
    CEM,
    CEP,
    CESEL,
    CESEL1,
    CESEL2,
    CESEL3,
    CESEL4,
    CESEL5,
    SCLRD,
    SCLRA,
    SCLRB,
    SCLRCONCAT,
    SCLRC,
    SCLRM,
    SCLRP,
    SCLRSEL);
  input CLK;
  input CE;
  input SCLR;
  input [0:0]SEL;
  input CARRYCASCIN;
  input CARRYIN;
  input [47:0]PCIN;
  input [29:0]ACIN;
  input [17:0]BCIN;
  input [7:0]A;
  input [7:0]B;
  input [47:0]C;
  input [17:0]D;
  input [47:0]CONCAT;
  output [29:0]ACOUT;
  output [17:0]BCOUT;
  output CARRYOUT;
  output CARRYCASCOUT;
  output [47:0]PCOUT;
  output [7:0]P;
  input CED;
  input CED1;
  input CED2;
  input CED3;
  input CEA;
  input CEA1;
  input CEA2;
  input CEA3;
  input CEA4;
  input CEB;
  input CEB1;
  input CEB2;
  input CEB3;
  input CEB4;
  input CECONCAT;
  input CECONCAT3;
  input CECONCAT4;
  input CECONCAT5;
  input CEC;
  input CEC1;
  input CEC2;
  input CEC3;
  input CEC4;
  input CEC5;
  input CEM;
  input CEP;
  input CESEL;
  input CESEL1;
  input CESEL2;
  input CESEL3;
  input CESEL4;
  input CESEL5;
  input SCLRD;
  input SCLRA;
  input SCLRB;
  input SCLRCONCAT;
  input SCLRC;
  input SCLRM;
  input SCLRP;
  input SCLRSEL;

  wire [7:0]A;
  wire [29:0]ACIN;
  wire [29:0]ACOUT;
  wire [7:0]B;
  wire [17:0]BCIN;
  wire [17:0]BCOUT;
  wire CARRYCASCIN;
  wire CARRYCASCOUT;
  wire CARRYIN;
  wire CARRYOUT;
  wire CE;
  wire CLK;
  wire [7:0]P;
  wire [47:0]PCIN;
  wire [47:0]PCOUT;
  wire SCLR;

  (* C_A_WIDTH = "8" *) 
  (* C_B_WIDTH = "8" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "1" *) 
  (* C_HAS_CARRYIN = "1" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "-1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000010000000010100000000" *) 
  (* C_P_LSB = "8" *) 
  (* C_P_MSB = "15" *) 
  (* C_REG_CONFIG = "00000000000011001011010001010100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_dsp48_macro_v3_0_17_viv i_synth
       (.A(A),
        .ACIN(ACIN),
        .ACOUT(ACOUT),
        .B(B),
        .BCIN(BCIN),
        .BCOUT(BCOUT),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(CARRYCASCIN),
        .CARRYCASCOUT(CARRYCASCOUT),
        .CARRYIN(CARRYIN),
        .CARRYOUT(CARRYOUT),
        .CE(CE),
        .CEA(1'b0),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEA3(1'b0),
        .CEA4(1'b0),
        .CEB(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEB3(1'b0),
        .CEB4(1'b0),
        .CEC(1'b0),
        .CEC1(1'b0),
        .CEC2(1'b0),
        .CEC3(1'b0),
        .CEC4(1'b0),
        .CEC5(1'b0),
        .CECONCAT(1'b0),
        .CECONCAT3(1'b0),
        .CECONCAT4(1'b0),
        .CECONCAT5(1'b0),
        .CED(1'b0),
        .CED1(1'b0),
        .CED2(1'b0),
        .CED3(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CESEL(1'b0),
        .CESEL1(1'b0),
        .CESEL2(1'b0),
        .CESEL3(1'b0),
        .CESEL4(1'b0),
        .CESEL5(1'b0),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .P(P),
        .PCIN(PCIN),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
o95kQsykeBnv/6RKTex/4MyOqp3EGnPFH/nv5raMenbKASm/6owCQp4giB3JGq3yU+Peuq4HmH2a
zCDpR2ue0Q==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VB9GXqz76JcxGkDIhWmf/Tvu6ktxli9qmz3kvoomNuowfSnKyyUf21nolwdhnVr1C2+5yMJGWxPZ
BLZG0iRJeqsy39qwM9osyuU+SIaK3ZNZlXHldcb5bqAcCuJ+kdyh182BY5RLREoDcjBSaH6et2y0
nHwnoYvMurbi5069L7o=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
xRZ06DbUma6Yw1PiSnZUG2PGjSadC3LNKsDhEzPo8eyEaE9nHgZw/3DDvJK29nvTv83gI0iUR83s
DsWaX9kx/1Ncn4XbmSdT8+ji+OZrf49Rig/ID8665qlNZBqow90+wIcAD4bOqRrXrA1K59qrwHvT
HjF7LoHC546/c3M96yI1UmGveOEfoOIgajP6XX7KY7mxUrsrAoYckHW83+iWbeBUCWMWQkQHuGlA
pkJa7gi2QS5qK1xo/K1KptSjNKWEcDFKsQLQ0NrqR8Wc3xWjV9RkH6EV4AAjqgx4aW1aiTi6aDCV
R//ORC0dbwb38TBnvY0dK2NwJ9AndoUpVf0ZFg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ctpu7OT3NYFV50M7g3X5OWgzfC+1lvHtpPPrHYvfD4BdZUOZtoWbRVMYSofIc3yuOpx1VVcEmRr/
TnKkV/uYIbG4TaOQ6J02lm6ilU0VHOky/Li1McDu0RZw0Ym3gBtycWQulvxZmJPkYKOdQkolKxS2
jt0O51yRobPY6/N1kQhzEZxou6hMzAUa4xc+wECnWdAy6L4Xa7QaVNQGQYFvi6pXqDdNwgODZGXV
5IthUoYOPE4oo8tmSbvgOpIx9hwhoF2s9j0YUqc9z5WDcrLuIl33wuxjH9d1akOqv6Jbd35TUycY
EQqcSWCRs1KWhT2dlakG8g64BkZHy8Jiv0tc+w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KBrCiroMzB0+0nGnzcg92RWUMI8YS6FFqefgILdK30KYEgKgP8lepDeGmJjACZ9cZn7KH7Y56rOZ
3EGE6Ha7toC7ZtEIAJyZd6DO+Tkv/f42zt5Fq4pNzMIbgRDlzMjiEiEnIYrgwku58DE8qUIJ3B9W
2jOTjFiJcu/375a6hszX+ndN4lQcDcn3FIRME2BcbfHSYXv/KeBn/ikpyK99TnHjwjYNKfVU3f1s
8U1dtN43mHPq1V/p7H2k4VgNO66O2TAxqrQLk7ET+p4au9Q8p9kGatxXPKHX45+4TZ+IvLas4jOs
5tUxRs9+HyKayPE8oEuQNe70m5jjSzYyt8AtuQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
ljpgiVbqME/DDt2YubRDsiAaUvvd0luRm1Kyn0zXi5Oi5H+daHLhjdtMKs7UXT4hOyMtBPXvIHzO
r3gvIW1qQXCE9n01v8P7aUKDZWCDsuc8k1+1gf6LDZ6q1vDWNFnrEp12ZZOMWzKLj8BUfqSDayNa
cjbp1Qs1t9jdv8TVPvI=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Df6Zc2J6DGn8PimsfKk8mQ+cpGIR1yrpcw5QseDEQJ4mE8uqo8cLRqffFGcLqTX/B1Vnkh1zy8xG
q2t9DwcdlrbPZvTj6RWyWp3oTBVBqAAriOEphkMP775Jrl1gYe/XFWYC8bce89oTVSt9VI8dqzVe
DMMbb0kX66Rabi08xQhUh9Jpf8v6we/rN6jUKKJDGvZaK3mRBx7yzs6QFFk/kzUVNg0OGyiWqITi
+ku5Dvvn4QhDeP6hu9E6Qjw0Q7i23BjvONLiQ5H9kbefLDIA8CwOsmjZ4gggEIYYgBpAIP0Fbt2j
o+kGZlTAq7P7yrZGTKNPS0BKI+JsCX8NJ0OWHg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dq7KDgd134IyGuCX1+RhFxXxAPr9vqLex10Nngq3feVDBCLFxJ/JXYEh7jTmUBXZQOdASytF08EH
SO+w1Is1cxQsti/FmNiauEPgjoRq5wsqNMWbCm4flZRONPn8J2PeWlbgolgFaQQEQVS4CCq7CsKj
/rDM/jgVtgnKCkbabtq/ivobGvVa/xOG7V3VkW7ouxzozBspI437g30tRNux4+AQ+Fn8AnBkcA2y
E06hXTFA/DYA5ZKTk1R7S5JbEOyKubRtpN0R9MTQdnZzwCLnNOO3Ew75HG+cqMmieZYwjdlN4Dwl
VUaDYFkm15DHeBfjYc+2SQhYtTsm2W/5dS4XpA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
e8rcrLCKts3/ny4QB505UKu5tYwkltZAdI9MdskEZ3u1+lUkz0KauakI9141MgVeHynFy/37FsPo
gO1C0N3R8hgDZbYfWLEqqeqCsgB2LMrdrdVxFbVQnhL8pulJLsBlACoYuRWdmX6uznUIPX1SezMj
IvF+9YwCBti91sTlPQe/8IZoWi5qbRgmNk37kP1sI2wohZE1KPZxPSHN/SslrvRW5/UokfnacXcO
DREHDL442xfDrk9V7H02C9zssYburtIxI8LzA8dKuxU5L54ss6l9wtBKZ3WX8Q10x6HUb5LKLa91
hjnm++HDLEpY5abJ/7jqgZR3EJm6Ve7enc+uhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TxJCv/POosx+jGLBgB/6ftBKVH9JVYGk4XAG5JE2LOpigZmjMHoFiMA2AZjziHpmR1RvmTDWTVEO
hM/ayO21ER6Syqz4/y1qkj1tKh/IG0Ii7jNRyWOU4aqBVYGIIN6mR5yLWUpu4IUysKjEa1QPpykg
zMug8whjSHZBFRF4arpn+EMo2rRsUeBKor7iYMXn3OM0n50XiMAKgaD459ZPXXwNuidaKh2IbSZh
G+jNXgBR1qlqlPxryqdPiX52f/0S9jOb1NbxDGm2sdQ7tniFuhAGX1zvlHMZKqg2vLBS7ZxTYa9q
eWMNIPB3XToMtTrIEA+rH6K56cSKjcjZSq/YXQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 32000)
`pragma protect data_block
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
+/MwEC27H75pl2cny2CGR6np2GB3GJs=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
