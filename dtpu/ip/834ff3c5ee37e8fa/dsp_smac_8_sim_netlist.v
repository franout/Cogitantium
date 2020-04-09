// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Wed Apr  8 17:52:34 2020
// Host        : fra running 64-bit Ubuntu 18.04.4 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dsp_smac_8_sim_netlist.v
// Design      : dsp_smac_8
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_smac_8,xbip_dsp48_macro_v3_0_17,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_dsp48_macro_v3_0_17,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    CE,
    SCLR,
    CARRYIN,
    A,
    B,
    C,
    CARRYCASCOUT,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 carryin_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME carryin_intf, LAYERED_METADATA undef" *) input CARRYIN;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [7:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [7:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [7:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 carrycascout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME carrycascout_intf, LAYERED_METADATA undef" *) output CARRYCASCOUT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [7:0]P;

  wire [7:0]A;
  wire [7:0]B;
  wire [7:0]C;
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
  (* C_C_WIDTH = "8" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "1" *) 
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
  (* C_OPMODES = "000010000011010100000000" *) 
  (* C_P_LSB = "9" *) 
  (* C_P_MSB = "16" *) 
  (* C_REG_CONFIG = "00000000000011101011110011010100" *) 
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
        .C(C),
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
(* C_CONSTANT_1 = "1" *) (* C_C_WIDTH = "8" *) (* C_D_WIDTH = "18" *) 
(* C_HAS_A = "1" *) (* C_HAS_ACIN = "0" *) (* C_HAS_ACOUT = "0" *) 
(* C_HAS_B = "1" *) (* C_HAS_BCIN = "0" *) (* C_HAS_BCOUT = "0" *) 
(* C_HAS_C = "1" *) (* C_HAS_CARRYCASCIN = "0" *) (* C_HAS_CARRYCASCOUT = "1" *) 
(* C_HAS_CARRYIN = "1" *) (* C_HAS_CARRYOUT = "0" *) (* C_HAS_CE = "1" *) 
(* C_HAS_CEA = "0" *) (* C_HAS_CEB = "0" *) (* C_HAS_CEC = "0" *) 
(* C_HAS_CECONCAT = "0" *) (* C_HAS_CED = "0" *) (* C_HAS_CEM = "0" *) 
(* C_HAS_CEP = "0" *) (* C_HAS_CESEL = "0" *) (* C_HAS_CONCAT = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_INDEP_CE = "0" *) (* C_HAS_INDEP_SCLR = "0" *) 
(* C_HAS_PCIN = "0" *) (* C_HAS_PCOUT = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SCLRA = "0" *) (* C_HAS_SCLRB = "0" *) (* C_HAS_SCLRC = "0" *) 
(* C_HAS_SCLRCONCAT = "0" *) (* C_HAS_SCLRD = "0" *) (* C_HAS_SCLRM = "0" *) 
(* C_HAS_SCLRP = "0" *) (* C_HAS_SCLRSEL = "0" *) (* C_LATENCY = "-1" *) 
(* C_MODEL_TYPE = "0" *) (* C_OPMODES = "000010000011010100000000" *) (* C_P_LSB = "9" *) 
(* C_P_MSB = "16" *) (* C_REG_CONFIG = "00000000000011101011110011010100" *) (* C_SEL_WIDTH = "0" *) 
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
  input [7:0]C;
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
  wire [7:0]C;
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
  (* C_C_WIDTH = "8" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "1" *) 
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
  (* C_OPMODES = "000010000011010100000000" *) 
  (* C_P_LSB = "9" *) 
  (* C_P_MSB = "16" *) 
  (* C_REG_CONFIG = "00000000000011101011110011010100" *) 
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
        .C(C),
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
KGPI7b1/S5CQgdY3nrjgG/rDcCyOlQpsXJ9nVlp129/pvIeYXg+VsPgHegfccc0VA2Hi0AGrB3eu
P72H1Tl2+eslMfMXb2QiN0OKzUiMDN9OXanbygw4feAqG4SycAUJsOtzq0ov/uILxhC1NbybvWOq
3lf6JYyoSR3n3HbEZb/reoZNUhvnZ/O1zcqkeXBlFogxKlDfh2viDqtDEeMs0y/MqHASgX9K149n
nIX2rK0uWpqFFYjd0I+ONty0tQOlvlMT19rnbjpY2GoJMArhqq7loBWArc9sPe8SxDkh/KlWNZ3B
x/HaCe1AUHinHNd4HwU5hVl9ohidKfKAl3tqPQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nXIvAKbcWtogrsTyTk3+U9hupDXwroo3OjmaRC7DBFPvQoMvmbiRBWKwFr5k/0DZQUtANemLmlLK
MvjTAo+PE7a1j1RVYbo+ryOysrRhevjjexA4TiIcaDxSO68Z/+f//glPyBY8YMHWgcY5bpITGhoh
JR71LedkHYw+LtUj0/+iZkSL3shJCxHHD9A5xKu442d9T5+k4z01WBvO/YqCYTJvRve7WIItKDj+
XbAfk9uBMDA+pWBd9gST4MfiwGRFpI8NnvjW+EmLtLa9HvD41etKCEiVvqx8DvfKhgz5wvmOOBI/
aYVj6qKmWj/XIXzDbaMuLO3s21CkcnZy82g9Mw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 35424)
`pragma protect data_block
GfxVikHpqaR06I7JlXrDX86DAt8dw0VC0YjRHMl9fv/Uq61LThiC87ctVca3YswA7Ay6KL+2vxHy
VScEIrc5yyhVVc1QeZbcvetx354kFOftqoPgJGUUIKoc7YpCG7UXFibh6lHr8fgAl49uLnb2Ovf7
lVpZ52PpHmdxFC/UC9mY1JttbrZ5LAWQxpKS6VRM6qp/Ge9CaZavHu5Y0XZadxE5N6cq8JP2AjFY
u3S6dF2rgIAVgkDQw2RRzyARNZYOWekGMh4tC5atlBhNcVzIIslPBk4C5Ta14FjjM2dLihPLDKUe
Zw92XtJ+8TGtzeLfQYhJzb/9lq6wPffaAv/z6T8lBY3zJoX4zHA4Uhz7IEkBG4Ii94AJhJnc6W7K
3EVGsSpPBLgvJrXfbVW3sG8Gwqax3aPtP1ST4GcivsAN4M9hjeXo1UuWu6CROx6axk/0jc/w6RlH
sMcYvpgip//Fd2k7aMJ+YCVMnFHqS+kUOdRnlFFmfYEtaggDiL/gd1uh+FYdRJIfce3r5P1t22CN
5RmCu+kSbCZyQQv8JZoYdyhTGFFhJYPJG3+zRxDw14Ggp/g+IXi3iK793nF/9FxfBHB2/K/ggbsJ
06lSVSa2Dsl4vAjzS7zNTbQPkyhU51qTJcdfYtmSNk9yO++whlgK9djFwW+QgiF/kb6Bz6Ixh/G7
SQTffhNGI0fRlUI6kK2Gb23AlWV8JI/t8kCfDKbmzS5MLHmRvcdc8JctO8xzcTYTdXg4qGgCHcg4
9U0E4QTdn9qg5bGgBt4e6RQlv60hzcIGBKyvN6sWvZ+njd+7h8I6WpFtv3teaiSkB7ssoHWWHevD
cwMwISRH4VtoVaztv3hDImdb/hs3b2I/ILevYzg/ZZPMDVIBV8dMHcoAPdCbbi7ri0l1M4pDXvDf
N/sj5QbZHMpfrJZXTyLohB5o7dOmuG4XdSqhkrdj8F6V+wQsJ9AXlmt/ZnF4iFQurc8WHxV6wsJq
idVglQg/WkJMWPBnQcLTC5Q+b+iyXgAN92Z0M8Xf9u9C3xGSw4XqlmZmlVB2ipQQpSJRtuJ0wdDQ
+fMuUOrPH62utRLowe7eCvOd7li+k4zsZdtSfaaO8930SWlKv+kSZaxKe4uST4o5iUCd/Ipz4uP8
/yXh0fasByrKyliTdUWr9ZBEtfJ9cJFUEpSuEU6sb8JyVFh2lEVJfLf+0xfkt8ZB+OClJcIsKVIN
Pf6aemeKsvuOMwJTFOB4vKfIivpY28z5/dUD2+gxCW/jNZcdAWVZhqg/26mSPjL237SD26ArRzsp
Jq9Oq2pN7tf40R2/MhTEEaSEXAGqzBHXU6OaghuNV3y4bqNibNhwCnGFYhpa/tWNbl42XRKufvG1
vT0ghM6TCEsPRV1Uw8CrCLdB8DVllNte5Hm3NMbXrF7YrNA6WZMYZUKA8l3aK718kyYYPlaKBy2/
Gq+kZ6bXDjHufd/1VYW95YkJMy2MLahaw2s6Vtj7E+Knd5REVt2w7tQsLEj5PzmpeRUTmOMXn9hd
fkUeG+aTafYPP5hMXO4KdF5BI3fdpT6PNDeGADpmnaCgyBx8mZuHULxHPayGY5/BCNEE7pU6O223
Mf0W47iWnH5oJinW+Ro5UY3Jay3KSMnhSSwH0OV2BROB544a28YW1Yviqy5iSzYsLcImnAX5Dyh6
fKJ8WK/WPHL0t/g4oNv9k9j8qSn5POEmbOeUsSHXCfA1yVZETrFwEm0HdZ/SUYElw9pCRgeh+6oI
AG7ww9v3U0KI7xpqNqNG9ofgwWyllWjZIPq2zHc+VOPEOKYNX8HMe0Oq5jBlQP33RW2Yu6bwEyGl
rD8wJVRTBSDxn6S7OvWvECURnQiOas7J749WYNz9Fw6sZBuWwO+Vc0gsKc3yFCkHKLVUHO95XOWU
InHR2vo8ZnK498MOtw9yDlyswxT2rw+e4xiCtZsE6ddaQuEc5GhQrzz+GY8v5Rm7B8dA/x4aCWsJ
qJVLYDfQQqo9BSJhtDAKTMEaVdoDQk8/azpRsrYZCQrOsuhpk7yxQIq+87q1TUOSTZH/Jl9nQgPS
kB/3MoBPiR0w9uaIgnraCUZrepX7osCS9aGzAA7ogrXt+Mu4WdB2echb96T6wagaIzaUpLjzqdzd
qw9LbPYhH6QPPC1lncVIdiD6gwjzCgSPYuxrEzBqh5mZCnWe5i7PXwBQUvSGItWn7k96ubaUx0vn
WOVTU0gzfxi3YrIzfslbbGs2nTUkYDPhb+zkhX3YJdLjjkn2XC9h09KPefhPo/88LvHk0koJ4Rsz
7Ecy4Ubxn0eHH/6BziMSqI2s4uQKbWLuXzMRj7MHJ+Ctr6TfuC4faL5t9IBMyM5LLRKK53L8U8q9
Lvv6sIy/1s1vfKph9LeznBTJKBD7/TctUepG09a0j1b0ETHM9x7h7guoSv33U+fFCZ0lYIgzSieF
VBl+y+vqeLdysEtHRCTgGr3fsnVmlfm7MviMLIHVoREEZ3W92UYZ5458/f2w08oPnYInjNNsMNEG
4ntrmCFuMXyZkI0hiy7r71uskVvzsMJiOZ15pfIzBLoAM+K54ZDb1dItdzm9BCzywlc+RAfXXhbm
1s/+9THNW63oGWwQIy5c9gg/brERIV8oAF+s3gA5HjpBSPQ4dr0mw/vcMETCEmfr0HxLX8Wv/alM
oCFX7Tu0jTZ6Rjfw/oEJ2H/V6v2gry2tM4ESG6+A2tYCJTxK9PUlvaE3y5TddXdZq4L7zgeOpRUz
2nGd+TEnPUMC/9tBg7kCvaE39DwRODOwaTV6hdMIi0knbzBP0nGe4glF9IchpwCI3clPRRxF+cP8
FRAXGjBEf40Q1y8uPDNW4uwwgEk+T9UFiix94uMMYCiIzXb0HkQIqExh0ev0IMAuf/Ows9qgPWdO
8tf5S+6Cd2TkMxWkVdwhLYlITLtruJAWyTmLzs3NqqQ904Jj81xH6H7GgGHOdtBm16ZXStikvFng
PefuLhGKec+dqsPcyY5mrgLbzu7aEC+wFpyB/hL3LNdlKuxoqWxWhUSlNC6DPCZeVMo3gcHIv428
aF4jBFGhwcz0saLwIX61Ra+U1DhCFWKVQwg/TanduH2yLmrhI24DooLSGmfR3KtHaaeqxusLwgvz
U1jFR0I0vNaGMWPb49CR1LjagWpyCl8EHURLE+Ubftl3fxWXfJXbLGtrnylGPaBfuA4umrHaqL85
rAL6ocftvLqWHoA/7yxlXS02jn3IBj2UPjauyNGxkjXiUbPuESvmlGDxSzFhOtmeKWYQ0yus2L3G
U9eQpFidAdvOhldtHnbjhzPAQE4BGXkQSFKWwXye8Ss6xOw9L54YS83UQOyag7h6OUCXaaP7K7XT
fbOE6HsYMW1lBlPRSWRFxsSI6BqRUreQgHAbQ1CcYLwvkOafBuet24c6ZG5BBCak1RrQBIU3aTVI
bMS09ERAdQb45NwMqgAxQSjzq14gu+6A2HnzTswEgG/RQD86l8VzCrj9Xp+K5/DZ8lCS6vEIMWxN
ghnDZQ2fnK3mcHTFvoZVVq7WG3u4VduIFovSAFXRezckFzIGqpYhANOo7AgKKTYF1+2KxAtNrdm6
yWMKoGQy0KLAmPbs3FXKda/WKNtsF4NwCgkpqUSGKoueKon0T1Cfrr1nEacDLkZoWxxWVaS4Zp4e
jyzxF6aW8AyEgC7VTDZymrhO30+71YRVbILVTdRU+zZEK/htQnE3M6XJdc36ui2BexreMbOY6CcH
RrfTSV7/GoF6TI8IyqjsvYuP6G5klIFxsKMH3DpejrjRJcUSbCPG+ZIYqn5qa2DnDSuy9hil///k
aXvHVMFedG70liCesDTiBqFx18T9C1SjZX0nPam9tj9JCtFv+OCeiJjH9oLQ+6v63pcm2B+4hq8o
soF5YDaEAHC3Vp+/JScD6ZW8nGOe/IM22ZotjFzxtxyld/UgZWF57PAx05KXGwE8WYkCZBr6k5yi
fYW3TqPdM3etKTF6SWPLH9Q4pkDeTsO0H1MrDOW/qFcW9xDdikDbBU/GnUQaMNVq3yRYPiaAfqnm
VlP3fFNIMHjdBy3+CiSGJwP6DaN15/Vb6xu9nHhrUolSjU32071q4r+QyDWO6l++BHbS0OL9jkJa
Ujprz3fRC5beViKvxRGf8JVMYs8h/mhXOgpKZpEoGEqEVEp6MzrC/Xz9+PQnSlAKn3yfYIBjjg4M
TUywuIFf3leaEVWgIRFge/cBSTgFZ0PydlCBomcytcsMwWhXVvz7frhHDxzL8ytV8C9/yCG30jsg
1WpNo4XaVqhRPxzbg0M69IMVQ8tKRLJ8NFOpkQQ02g0jBUiIRpJTpUhARbLh8Eo5lBjO+eahO/U3
jp9vxl2/mr2MFvAttjV56QNspe+7a8PlA6GFa43wgCNW7EtrH1uhfU1ebV/QzSnQfnwBEhfwojmQ
ix7oXnDlPBSlZIhKLmoX5Fux+9H7iKVQTXr4XmH+boNR9DPW76PqnhPQhEw6CeCF1FmxW+SOQR7b
oQCh8o2tGE8Ch8FAAcmc0BZcPfZhB8WZDVNeZdTTCtm3pCY3AEHdSPPn4KXeud8GgTEC+RzFa3QR
aS8wov0C1Qteia1bdUYjfAU5SarMy1/BR6PcfAWlKMGbU57DYwJBaLDndbaA/TSOPC2uqRFpqvF+
Lr7jzrF7SepPJYoANxnyF8fPr0yrqjfkTS4gvDoTjLSsNR10814Vvojh3XeVs8hRYYEF25sUXTPH
uVjCa0503WOTD2YRAOV7QxOzYqInOs1brIvuo/NAOFLgpmdhq4RiTRO+skch/lmL9/MkiX1MBLS/
2iIqrTMJjyTFuAbuL5FLEJPnd4C1asVhUk7DgWKux61IE1cRPbasij/khD8M7cxEZDFEiiCgFrN2
I05pj83DhrZcr1WuyGdkcKiUvCbB/UNEVS47yMt4BO2Uar797BCyBWhEVURvFYJWvKMlsDsK9MG+
DJtwGdMzI/VMnbMw3K4N4XllWXJ6XFMM140gHmutp0RkaibVmCwzKVujslk9qkql+rAJrGh2eirc
9EON4CIj6ejwioo4+jm0I1yqM3DwGJPekd+BQ9N8+OoV+625ubeWWC+8Kk7KeC6Gix/cYbkR4RCN
GHsu5cQCjm2mdwVTH6D7bgx28zFXes9n8PUNCtHmb7f24YACWCzlK/Pv1y/NQ4scSxe18bcJHMAd
WZNqAeZLFch/zlLPAd99OoFj2A4GTplSF1WE/JGmyI5PNXQ87iqiFUsaOy0gVHwBy+DDxqjJPhFp
pESi8A1jyhseQcozJVqZASHRxoLInpyt5/YDjPJUvZRhySpPBJE07PGnYC8bc0fw3pJiNGN0ilh5
nE8KPHhRv6EOJqODvmCpNq1RfNhWkuwVzwE/23X0niToTB4WopikCTBVhMMyBgUxSBWXASJjkNQt
We8o41gVBRFkZWb782WlkmRGhpyrEhlt0WNpWF8yD8vUDjGfUeR8d0oJXzVXtwarYS6yl+0vpsqP
FgbAHGzDV3YJ6nBMUEdOo7mlRwqkhGhu01lYASraWrZJJtC8YVgX90MDga7SGtwmpe2mh872GeEb
y6qdQrZF/SN7bjhNClb+UWSzAkE2JHYKOAb+WuseUs4U0tOU+MBbuxONTLZdGd/rHOK+zRPYkiC9
YxX4j2zoSwFwpzQ3gU/ZO8rpl9OqvziMoNFBCq9P57+EYqTVBXePb5HsmqZt+X8GTwMDkjH0IZd0
qo6y9zcIWhyd6Yr9hNzihJD/7Zo+iL568d8ENgMPlzPvet0P/veG1JE7fA0FDkuSnJfCek17pWuQ
cwcNuwLbTOA0XRdjjmxcc3VkYpJ96ZRHXRPXpiBsOh2z5gDBIg3U/f+g1SCkMUI9KVbx7C1cmjGE
/MZpCK+KT2yS6nL4N4tOMTLrWdzNR2hPOINzlCSJOAYd11c3uIpREYENcteZOHkRFRjPMbBeyMeT
4m4rPIICEJ7QtN3O4roy6B4MajGIUZKnnfcmfww+tMrdZlQWp8XryG3nKm2FwNLU+i/troAmIl4k
mT99Kf4zZX4UUO2CYT+x3nZouKAzeGFQkqH5Bvxmc7eqg9yvWGP9A+mtWl+gFwraBarBRwzgcdsi
8dOJM3XAX/TDSVX6b0VWQvJi3PzYk+2Jc5CxBxThj4jdGtt+829zJrDlkvc3ybvN0GrBHDSI8KeZ
SxLbR94Y5bxfRoqpWF2VKX6+ZpJtXVpY48odkwaLMVsXuXZHMGw6vT2eYyheibQY3TLdywWuRTBs
uOn8YTWtc7M32M/a9ygr/pwhtUGxEGy2yNMj1iSUnRw3/5Vciw5qLsvWZMxdgroO5FczBSsLjYlG
q51JWv6kdw8vbou2Sx06NK6qMoZgq4TmPGArIG2hHSIWFqA7yIZ3Kg0tbYd673srjLCw3628Fw4r
JiFc6/5EQEpv9HfI8Cp7pWhPj3aQADW1qrCgwcRHCvGb2gJ4QzJHdEyfsIZLnTxMXrTn8JPITWqV
vQgSYT7pJ5xm9Ze5FTk2yKWzsFPtt6A8gPhnHkDHiosY1m0iSkgfuaPkWpfwv6qfH/4sxp12YK2/
qp8+mlaF/xnRywLXpLSMBmXEeIv5lqs4UIgU6Kee5BKLjEYYohbwxJE0NPU5qzIUhNYqNNjr9m8m
PVyJPJjT9ibqQUOhzo6UeJlLX4VFI9sh3a0txg3hQD3GONTAdG9+3fO4dGGext7GzCgTYLwolL30
Z0t6R6tgMj1eFaEz72c5dUiPWEdWj1E+3IbhpL4qHL0NrKib0k9SaSBpG7qekFRl36xgZNhPeG73
Z0d2SUMYcvA77HxwTSHSHuOjtWiNP6qHGSVGe590VWCE9ShNLLVNZosgW8jogBzqo4TpuzwqblMQ
1jfpvBYnERar+StipA3pqFDO9Dr8eif+6k2cg7yRH0DK9HZ8+JU+pC6g5h2mVddCtddDANCwyP0c
gVMTt6+1bxEZz42j979rWN+4V/zylJMCUiUKOS4a0o27w+6339qvtmPRp4xyZWjtek8pB/JXG5BO
zAcNocw95bExA8YaEn6R/GU4cojcXgOjyAhv4P+CXTAuk7lR/X7oWbpAUl9ZAbYo73/c2Rta4fuU
2NsrIPs6EaZPIrRhS+NWMy4eoBwy40kRv6h92bC7QwIzv2ZC/FYQa3O+/MNETPRLF+YGmqwNlwKB
KrIQ8YUUaDYUGKnStT4kthe9VO9vYbi8gjxgE5aSc5wRi53ZlbP0TRqsB3ViHk9wJHWZe0eN1BU4
nE79RMwz532ZncwF6UwEIDjWODaKQeE791Ykkg5+Lk5rNYAp5MwQW0rMWSt70YDdPEOXaVUcxyDb
SYWYQnE1FHxNDjbOEKjoldwcqoi+/6ziFZc7If7KAwCCd4jFDqrx6wnCOQ0s0RVBkG1/8KrALV5q
1QEuvH6bycRpBMUmLvW+Ru/yBuX8AseaQO/QHh1Xj/9vNWD8S0dc5fnZIpAnKjCCclS0p1/WiHvk
W99cxlSakU/d1ZirmjZxzT5V24S12F2cyv5cNiP53mJ+VHkFqcN65tkxyOKJIcPIAw6AWtiDTW79
EjMD4NQ1I62yUraGEv7lO92Tca8xk5yn3Y0XyOT3KtLdAXnvuC2EhwpX/RpViLan7ewUVzF3Edx6
JTbI1ralNLwa6djM58TV/4OS9yJ8dRfvyne2i4NrbSMR1nWFnX+IORFCSEHFzO4ke/zrICqEzM8f
6kHK++2WjE8U9WOVFnjS237imnlSQ3b9fsEgY52P//FR2HPOmHcOqBJA10yZGP/gFI3Za+DDCuI+
0DuKRgUVT0/Q5bYyZfUJtwL6V+sxSPscdAcue9nrhwd3tBpNAsL4NgWMtbukT19mjTAzHTJlUKUG
BuLcw3Nl+H8X0uCTnJK542k6S0/MymCf+3Am4GpmFpbS+UoHB+4JWGCi9Kb/oRplpnZYGRwdo9ed
q2Naqh+vXqZPfm2Xqnb+Pyj89ksYeNlTg7HvgQPE/e4hfoqLxaIzEgwDayWTB11RhrGuOlZeaDHI
OPWpGt1T+fcI3o66Yo/bhkkX1vBTjBaSbgUYomG7DkkTF8aGikxjaWC4ztauRVNHE3QsOueoHsnG
U3lVLkx1am33yRrbRlae49kN8of/uZ+h/FrLo7xoRdjMeclIMM8VJ1RieL+6AGYgtrRcd2z+gZId
3qcUp1PbgpkdTwUMrilAdVLJJY53dj4oisvY6/yMjDuk9UqLLe4WYOqrZN1QGuh4eiKTw1Pjn7t/
6oX1bN/zgmfe6V/wkFwNc4BHyat9JgIBa5ZIMy5EIMBiNxDqh8yvNkSIjCp21I0k06AFZCyFGMUn
+moIl9vk09dyZHhti6fra6Xqfk/6UHCF0BLlESMzMofyu054oc8ly8AWikI3Q6rtqPHnPWNhY4Wm
e8W5Vf0tjDgCmafsaCgel3gtztM8YswcAWfCcAmiMdmZ2oqK1hns2MG0F48HsF2ZGiurMSiInSZG
L7ml4razoNaaribl+dmaENdVHw4CwkbjJhxknVjNrlNPUCfng/MNrnedcGm4+7SpSFkknZYvoSw5
rCh+7ikLuUSEyfyL6VsfafRoEZZi1ovWPU8k4RAylntrclmcG9TPTpbPwstsABGi5MfBY+98ROSy
fSBUGfaM4Kz2ePqNzKs6t/BSdOwkiAur4i3YYNUOuQQ1oTTUPAoNZVmbKPY7JhC4+MamVRybRb3l
n/LeUke2CHV+Tfnipv6/YtDgnnDekCBLytVcZ1y+LdOBenDhru2izybTV6VryH1LG8a7ayQtXy2Z
Y7Zaqro6kT4ICWZAHfBhjYXtRpObyZ9NGprPZFBzj1rNcDe3xPV1gk6lIw4oSMw4UeHVDx2UwW3K
lHDaap3IGIK3zbZ4LcQXTfacjDxLezQPx8sDSDMgZ6j+ixDNGY6GBm/XnPS2Zv4dU5oZhJlkd4Qw
1+k+65YGL+7MGpBkobzt/p1QBwPk2a1JOgOSvx59zjLBJje6ZUkCKe+NIAH4M4z7XwNUuq/b9B8l
YHeHed1H2b8nL3NObmJ261JwqNHISGt+dhDuMRCBDxKjhXsbWP2lCzYRqU3bIwntOZ6+Xj3dyc5U
j7E67CosjAj3olGGS3MQpBWmphDVzCFoKqiieJDGlG7a7GYXFMMOTl72wEO0HupavxUCK0ft5pcS
0TZC3+Yi+OYughWK6gGDHMNc03QAi/EPewkR7H94Lxao1T6LimB+7n/hN+9OOgziMMn5klFWdW4H
uf2ExPG600ntanW6tkGQxAaXRZINrxJMKdM4ZMHernifVhE7omrsaNCxcPrJZ+tgHqhxnlrs19U6
eB3B4oqmwO7mrxFQKNQDa4f8HSXF3pe0ie2mUSC6n2lfLkwhDoCc/csAOH45UAtsttf5qNhemr86
DE8fVdBq+pB3IRR7kr9xFnuwVhL2zLSTWIOZdAw7FpD24wAa0zfun9fGIC1rr6C32CiE5mSHG889
v1xrhTcTGgQVWEkLd8Zz1Mjr77sx5O9O4ulAV3xqNVzx5rlu2h4pYiRdDWXN0HiviiyHIXUy/s8n
KcLghftjiD36eBTAVHpfekZ+6r2eRNmlQ4w4v3Wt7x/0yWa8PccfdCI0HfO+HfYL5jLpSLt7Wr/q
Al2vSiwPFK0g5Wj0/Wle0F6AgDjsMUEwpXam+MwuC8x4R9NBYgh3gXbncW6vz975jiBnKJFgiRHn
9/Z1HxuJ0rWA4NylifnVacPPYWM8r13LnG/xBmrk0byHDM0kN/gyNMQ6Icazvpg1Eg3jTkF5wWhr
GyhNzS2A2zegt302A7ZB8GMQLN8UaDch7cJ/6cd4MV2j9lEgsDdd+OsI1osQv8PGS8+wpgZ/QHL/
YQQQPFKj82O/HAM5rMjvuu4wqvVC+N95wGFNbsKgE3CFZwWDAxIAfYTK85q+lg+Bdf7YWvHwg7ye
2ddCiMzmdp8TYp646rHiZhYkcJfIRXc28FLeG7+9+ggQKJKcydGCeS+4SzXjmlClumGz6Kh/IABc
Vw9gH8d95Q3uBIDwohI0R61VkBjxNyY3iWkHDw/A9K0a7YVvhqH3++XSHy8tiKCBpWR6W4hrF2cd
EGyDzjTk911lT+1locC0oA3EaQpuxvQBAivOumK1FAz9Im9ddDardAJp9pLYxIxjsdOsAEo1ospp
hNnQSWaceUg3NCKzDeEUH+MIpLN0fjMbUIuhgGUU9m1vX0Im6RLDECiLGg3QuvJG4oMao28Y2Is6
PW8Nn2K6HDsmSw/fyq9RU7V9XEh7krkp3cncmFtXjggBiliDhAy16M2jgOQgRHQxepwApiO0BPCQ
nmLx4RLJVLL5PxkMRi4bzX8NjhaZI6gurix1oNPQtgc/5pm7olnLD9wCrcKRdnHlMGc0gBVQvzD5
Wa/IipCjuQGpAolt56KOFs3ok+6MCSIu2WVHpYT9ZtgJQMQH84NZ14Nzgj+UtdSYRD6h4d1SIpXW
KnuNmLAw8SokHlf8esezYl/8PvdsoFTfEK4dd3iKBaTJzobgP3iWP9/9K6vwkrNk1IzUEBgE+NPr
KRyzoNK+jmr/caQuHZKlq+kAF0+tfuKveXE0gfPFJvJHtAs4kEY3pXesoEkihovuU69Fgsc2/e3p
uaFe9/A/f9y9kNsjZvQeK/3ZirU1Af1e4BLBlfWLaUzlSne4BS7yJJ5pGu7Jygu8zwrueZGy2tiJ
DdGB3QPv9+g6eCugzjHo8dlg6lYSJxuxGU41+fD5714IkdT4Op9cFIP3UsfO2n20MEY+XaFAd28u
UVRpI4T/RJyUTsJEYkzKwiVeW7z50sywj7l7aNExnKgN2czIVT3ZdAhY/+99Q7ag/oDxGrRBjxjg
SsL24c5Hnalp/wBrmTM0IsFA5sPunRnyViG2FybNw3wGw3bkWWK8P0Y8GkEo/WEHOOjddopiNqcF
QDn//dvxlyNdQJzjs53wh1LLtB2Zvv8A9S56iRNvCz28qtYzPbh3zCyVjkSVCabOjwnCSWUkp7LI
pAVCqYjWhmRcxfbUS//NJPDs/Ay1Gx0Z3OjPOyH0SFMxbXYkjfuJvYhBYr5NRqi0Tjd9e87+MD30
0hhA1Q9p/nk2bNtr81nLM0V1jXR2sEBxI2V/PYwD4OFIpmXIBGN7SSNEu5MvBks5ZGFnLuq8mDwl
1UiQyV17YI4hAVjsOgIIWOe+MIMeZp9T9UoVRFwh+MIhpS+OUuN1HrocTdjMmSgEf1m7nD/mIw/9
0Q9tq0NNj4bo95FaXFjbU6aGLIIHIWt+krfsX15FHpepXyln54DElfegMtCjEAUVt1ilFEhIEm2a
XM72i6Ipu3q8SD4zFLH0TYaV6USYsOyAm7A9YdzXBCKBMl+nv7tKcoQYlHV3VyW90CL30bT/Rmpn
TBwQ0d2CDwK1qnJ+Wk1yIj3tlKJfM+Amcn212De3y+3of834RcOC8fBalRF+L/rRj2gYW8+Nl2Hl
JNoZrNpv2WUskHqFnpjnEoWUROsPhO8ql7LujmxXPa+dzZJ8SJ/VRyOi1+2wDXMx8tQKhBu8NbGv
pqebuGtPUVFzib3h0cDKdSMit013lBZNzd8SeYC7c58E8/lhRMv50+SZpF9kiyDV+7/UlsSVf0sg
fuOanWdFG1qRZuOO5xVtN3KhY7o10SNgkXLjoVZD9O7dCYL7AIl2rkCP4ZWxVelmR3lXvqrniaRi
QcY42UpXFyXJPkuKbgo5SjJtvN4Y9mCLjM4lBeL/M2d4/iEz9iyys/w1lE/BeuOu++YiUQ2eFFaY
Z18iK6tyl95nFTqzBrhGAmQh62opq9MZXxbtroSzoCc+LtQ53ioTuKDmVBtPw+FBrBTeW//TEk80
SEDBuSj7MBy7bQezgJtvqlaiXsTIxFSdMSifhKeG6Y8VCv22ZNcX6aDsADpvYiyhJ82XmOGZSH6Y
rwhi9nVgU99mVODy+ChCBQUFIIE8CHmg/pIXdY5Ao4DAMmpkQmDox0dOlTObQ6ST47h2DjpsBDNv
I+dzxV3aN8/2VXygBkDgoxVHVjQfDdOlNFffC1AOxvGEqysbCM1vfwg04Tl855EN3LPBUFeK7+ou
TQxyFiz+0pzGobAIPqLxOLJkaDwzx/skMeKVKFsLVKo3qAFS74zDtIe3aa/Hc3fSWrfGsdxQr+Dl
JYPtK2xkK+fb3muRcBgsVtp6tyZMz50FXZ+YQHEX7Tz4ROu+WNvfZTsxVNp+TibY0+3N+ldl5gKN
NIxrCGe168DI0cia+P7RBpUHzH6OZJ1nnNNms4/z9ffLP0xHhuUSDvnBQ3qZICL+zv17t7SO3aWj
SvH5LtZ3TU3R26M4zbhrvpd+EQcymIF+EYdALB+Wawg0GpwkQnPEmRlkD9IX7WQ1PLf8L80TTOVW
4OT3AV6VkMcU+jIwofo1wBW4IWzF95f2B2Hf395+D/mL/KY4Ll31GgFzU3sIl80f/ltyCsH0X7V5
04MzDKImmPu6Tkwg9sbYRPXqMfo2G7PF1L4liJBZwGZ0S72V1iSkKat8s7hI0WyS7z5NOhfu71Oc
JsqctlNywDvvTc12HNh8+iII5tT2eAJyn/Huy/wQlRkHAyl9NjE3oS42YKb0d8BrrBixImCUgWKP
ajkiQMlwY/zTfpHKOLQbMBg+hYzFM8BxSGpyAVlg8ILblVF/No/C/vCCRPtbMxqOA4FthlhAHbMK
mcaKF/sP2amD+JPymNXNoaUzQ+iOt6V24HCh7zf1L7ubISxnLCzQSoIr/SOE+3oJu9NtlBi6QJSs
OU4h69WsYPu/VjYYmIxO1XR942AN4YOeXlNobayhCL5vmVwT0BdEpawIX6bF1jLv39t9yukocicv
MVWybJ1YB8oYwTsTlxb7q3G2pX4tE16zNwdOHjT2naxfRB5a7CdNhANii3jAFzU8bL7oBE7dmiGQ
Ru7RpagicdTdJdIkxHwyCDxmOH9dKJQe4E27qIdbWlylPHD7q3L7wfqhdvVNH7GMeTrYS8IGi7lW
P1PSmO7woSW30qhasCco17Gf+QGq0EgdLL8szwI82zJAkJNnsoSho5QWiappnOJl7BqmQ1mIj7H1
ICxHRIwMp4qTi+d65IHe94wLxdJor8DmUPcHYmCtTCcfL58kqKd6rHA+ot2TMaJSHRWIQyArnH6T
SPPS8EoCK0bzI3qhNwTFj4bJJriCR7d2NCgRJS7cujtB0k1rpeC9WQMXoBko+EaFag7Jiq6onJzj
B/V/EIDSFV16AWyJsj48R5WAykhyheQ8paZzHEQX3zzIianCB1Oma+IyzsiDVff7IV8oMq1ezOVn
oc4Ufx3Xq9+/0VXsNhkrO3I6Bf4tDIL7bSUxVzyNpQ6ZULqOjYBWJ8Uxl7c0n6b4Hhzem/CyEoWk
8AMllwMdst28sv4xvoPCQCIRoqiXZsvc0Y3t+Tz1Xo4xcPnFdt7ILwsXZZ2Hl0A/N3o9mXoZC+5B
tHua7YTVb5QFwW4ArHUaVTgSKtunBfCuouX3EP2X4xSUUo5t20PHd/D842AFZy8tnzDdzOEy+XPH
3OL3NfT+eCfhSRzIWLtfzsByRgzlqPifInRWa49h73YXr+7dVgzQla9PXX1xNpJkJoY8v/sUtpxD
xqQEbFSSzAWOo/nE6RiGYDVpIEpBK2rsJLfSjv4NV8AQPasKDdOuY77pwPqXUx/zLKPfuOazjh+Y
PGyhgSri7CTNGSvZU8pkAt7f469HPjQhWC2MbCAhSvs3MRAblnb/GkvM6y3jvAXrK7xAci+0smH4
5aWjGIdULrL22XrMqBwKXP1B3IkghCCr3ubXOO8pN1+IDtA4oWlceXsGlu/fKTdyyj53NAcglL1+
66jfmHS/4ysTFVTcP7taxdaVRuWa1jtrHts2P13kcUhI5FGIMziar0nvUrz1WX9qgK0IaQ9xFR82
qjWaHBimi1MXvXZ6loxb8Eeh2BkVgJ83TeSXll30npkLFGNRy3OT5owIYPbV5oFLyYu2J8grP11E
5PPqDmH3YIQmmr4ek0fyqpUUHjRzlkzFIvvxGjocIi4d9gJ8FZMiJ8SL3ghPodDPPS+UtNUPrvBT
b7U6sePDJ/lmBRGv+/d+DfNaPPXBT3EGe1eiDA+SmEfe6umpoWB4Kj0Hr8K702XSgw+QAbvZd8FK
yv3xO5xqRWab5spDfa1MFQZnspQHyOi0CHo5gM+8QEyiHZFUzyHsWz6J0hP3/k/mnNKA02g7+K+d
iMHbcsSd+LJB0BLvjA6cLuUtv/zJVw7qqnYhd8fcKrl2Y6hmWwnSeAzhjYxguFzQlvMjPJqHcdA2
5t1rn3ieC+Jfg71OwHjWsEg4t9KxOEdj6Qld4Rpf7vKM8086GUI/LKjvKWDNCon+hek4Vv6dlQLG
g7LJQZ5ott/akpBuVVnBR/fPmG0JijJm0XqfTW2SH0bbTeJMqpmWl0syBC7wzZCy2VDJGlj6wu9b
V8EZ0AvW5+AmgZOCtYyXw7gXuaq0qcrlXE1lsuzpXLt1Eo6Uy9Bi+kI3UE+WESJssAzXwRwc8+vh
gzZIM6qLYISwbMMAisUYhrYzkv0Mb57CuPlagufvDuwJK8AMjW3DGWuGeWLEqR//1dVgn6lackT2
ig+6bIvQPa/3vEssPy2UpnjRnCwdqi0wbMh8YXLy/d+eyQ5NfL/nO9Hny/z+3Kr6AafwBVCFWSGO
/sFftowMWYl6zg64ED3FyQkv8NpmEuYWsEVosJidOpHQIb0tbUe/eqR8zi1f6A3EKfuheGwsMSGQ
7cB/PvHX4ug2Sv5l1uKUkU530e5PgLNr+IK4gJ5X+WA2D0LrGORYBhLPx9jxWkPBYoWDfloWlD7z
b51r31sG8qvNkVwdUxLcReP8DEt9Vo4DQFmtZ1ZRYOaMkm7pDKMkWJuFGNtvBbqia1LNrE7m9CFX
V4QeseXbOWRRk6txxrc6wcQay7qymjjd2vnKvaHU7hs4pM5BncToMMb94ZR6KUZZW3bGdWeRSP9R
vStujKSrcCCCFv9bz3HTyTSiKfFEx3ryXCbfQLNTLv1UM30LKe0EV4wMgpSgRdgiQTlSSv0KZduh
Ck1dl3/EqAYlGjkr+UfmvQSZODdByYYCzRye+QwvdJse9BnmQrhb2S/1M4qhMdrIziEngaoiMi1R
Ax2dtVB0dFsIikjegw2bfFFUrJb432lBkcPLUVYlXbRzcNmALeGms+JmlbjAsqXWUVaxlrm+SNTw
LJtAWL5SaIpnBw5wj90aCpT1C+6Xs7Nn8U884TtoediWZXWC0iFcIQ2s2HXvch4V5KMhERzuYtAc
Y1jmZ4YNfrKpwBerh/SrIWkhZVGF/iSHtRLXROpeoBXScRNYI6B4wXB8iz8zV1bGrPUnpChgdKtS
yUrvUBNyUvXEZF/MKt4Kjs+eMrBPijVEQETxxTaGTKjI2hfArgTVBVxOKXzb/ZsSA8v60qa80R//
BHNwLIMn/4eAL55RJ/MchbRdwT1XNylpPy4PdcqdnndFJm/wsePlcV8w6jN3WTyY/XrSwp9IiwmF
F83g1qhocZkUaQuXIE/fKkGU13sanN7TY+C74mcB10/BVhDWKFPYrsCKF7Zv0I/tn7IoriCI1W4D
J9aFmksP++O4/4B6CWz3TD4yuX2DxeyG4u3A3F1GU2ygiULgWdmmJcqr7lYNxt+8rpCJVUvYPmf7
j9IvPIvz1Ciw1T5qhSWWwGtjOka/IHL1px+yyddxKV0FYt3bolWtm0oM516+SX5lvUq5sE1KHqNH
DXq65NPdfsP36EDyh09RO2c75cgh0g7PzdGfi7dZ1sy7OirCuN9/5heLMtoiNf4LVtbHiXwcyu+y
wEbpg9I7+/mRz+OlXKaQgCE7BtAQcAAB6UraJ+yb09AS3otFi6xpVzXjcnj582sE2XSDpClos8cR
HJUjpX4WG6uXqqtHrU+UWN4r7OxDm8W0/6+/W18yKsLSKJksLKljOO1ElVmCMrNFxISJJvy/0OBS
Oi77pAu/41stOPPftD2SzDRGlIbWG5ALHFGuQwZgUHtYaiE2abXsx1m18g0sVHD7UnQqxHR8Nl43
NzyM2czfSEQRwEMncQLVCg4qXPERKUcHsBTWa98I9uar65GGAwr/TW4G2gzWau00SEzsB5hItmm1
VYtc6FChCBWNnDsIvUCZ2m3PVPqanhvoUP2UaympXyeGExpdUy4jRKDtXCc+lBo1lTp9tK8gENSX
/UrKNYS5E8je/T2Aab6WZ4HVhFxFxakIhJdyRkfx4KsvsZ06Ncc7iYAZZnICPExq2V3tnastMNAO
WxfHxcDOiFrPrc/Ek5iBy4QnxyrMYSW5UD9hCVloe6OZCgmy/JgKpfC8na4VGEqW2ggkGXaN+STp
ASe9FonlowSqeD1wPTXy6F1JE+qXCLYf2kdqi57zGe035bf+ZFofu1b/6s/aFOgk7Z/mxDeN1A0w
Qt6XY++ADU1UzKWGStbsD1sgQjWApyitrCOM7xjeMrkdFMfcFMdEJQ36Z6p8McbnIJYVxpgN+ihw
8QMe0WWZWWAzQWuxmJQ+biX23Wdq0mt2vS5u0Q4RjJDXELtfYGPK5kShHP6S18p0swvQWmbZn0C6
71T2mVti/VI0Ge3cYpkCVrZgcV7tasbp4M3zys5ruzdOjtp79fnAGzSADMoDBAEqIpgoGAxa8SkG
cCWZZm7p/0nOT2qiiKUVCCt0eY+gvrJ/5tEKyMS2Ako7J3nbKhZ5Vmc4gMom9kb97idUS9KFTTrJ
ou03alzuUe59oeDiU/u5M0KG+3llI1ZswRN568qsGddYI7hlpYZl0st4z5nGBiZfHGzAaYtufQxf
dP6RvH62tkf2eKB2GICRS9unfOQ5Phay4Tbq0dS5MZNv5zB6mVRjLAEixOqstN+yVxXTccJQv1n4
rkyyJ7mjJNQcEYly1IWuJIvEyWzVf792qayB/BlXJTmvjm6Ja6GGXP5XprUFbxGL9FO2RO/KNrnD
qB9Hw4kM0k61x5yOl9lVQrjXJWyPD59wW1hOrcu3CchoPg4QwBG18/4gVBD9ZC/fGvYFDHb9rEKe
AhaefVLTuGjnodIhD2xoadrfmTMl4mOmGjcmLIVJ2J0e7mNlJ6REQUllJ4ETayGFq0gkhJkPGsLc
6cS8BKJDPLEDQZEoTtsfTRaD7hdsA8G7BA/0iNAEThdj1D34Vh6TQwIHHJLw/vS0GXVtUCAPJlYO
XRW7Yr8Bl9gAGuzb5NLdYoaCrjIK4yWYgkpyyMetlpSUJ3cGZGCjkJMSAjrSw4AxfglIFrIzbarb
OuvmVwazpKNl7TU4iKfwcBXbj/eHBMuG1Wg2/+iiOm0C21K83esqQxaK/TlCxPdQLO03q294942B
syBOUbnHNtHaP/X7UlIV+lHuH4V01ekDS7GDLzbawwoCIBddos1zfqizaXRlu7bEBukvNpTmqR4C
rb1pZJ7nG+bSQGwEkmLKnuTMbeti6oMl0PFAZa7K2QZDRsFdNlOMtAYyl8F+1j1kOR7l5KD6lM22
OgDmqIrctvQjU/0aa9OfDYXbFAel6d96T+qtfyfqNiomS8E8PxTsM+qcwyUSLU+HxTwfC/GoV1Rp
+4ZCdmgRtu4a3C+frHSbY4fcRIKSCNzLdaxVfgVfBerNbYYiQrr+hpKjpYVlMjULXSJD/h9btaZx
Bz2b24m30ABMSLl2cNZS6dOLYZ7KHcOvIs9k4Foq2qdhu/UZrxBil0ON2lN378wFK6qYm1fMckdJ
PsXNRH207nxmwDALDNEaGLDgo4WiLDaOhBWtQZFyJ+5pLN8nRQYMHYskD5UeD3RcK4hCEkBAaX9A
Du3KFOxp0K+kue+FprPOxlpSXqge/Rrylat455h9e64nh38TQCM7W1T599VcpziNVziKhqedQwXT
nHODUeduLpgfejtPwRAX8RU3SWI3Ihc122kzNdDuqUGbtxuz+vnd9H5IBpaIVJG6PrTwKPEVXRPa
tAZhVsibewSnoz8klL3gFX/ZrHVES6jHM1RFdfK969mCf7FL9m8iBQELgk79twh5z3jixItqfg/e
gnDmsDShWyz5I96ceN91zsZcQiSLTSY+vauB/eIoXEWFHNIWCtqDgIVimyKfVwdJ6n7UmLtltYXJ
grg0u+mhk4k3ALt4i0PGm2uvn4AdKgetYVPkzMgT26FXw/OXmYbLilmI60GSLz1KpANssrRzcik0
UNR8yiLpOItrScToepFvMVGJ/+9hAIrMQTz5piGkFXBb7ZZancLxso795H0knBlgIw3gwKEmRRZI
lv4vetDrCjw2su45LGFIbV9b08wPE3k0vUTu71fl4E2CsvySJ5xYCi8DeDoheBJFvlLWQ5EN+UMS
0beHpU1VheC7I8CL18SS3h7Gl2FyHKReXdW9R4KqMJ5e8a5+YUzsVs/Pk4OZeMwm9zp6fQEplM1o
XOPcn6H6t30MdBCqV4dvZeJHCbRq9nE8/wX0GWwhkGvPj7qBm3cbqNwC5bvyYE7RsSIrO5Jn6Kmv
iSqwMcIDQukmTbgd352J1TN4TMvkKWgUZQeF5Hp2eXqn3+rzE+a5tzzgKd0uJq2syGHfVZuhrnrS
6hKAQEGvJTOhnwHrydXnvxwve4FK/fWfXt1WVL4qkXYsxSojgHdADZAbm82JO4VaRHn2f53WlQYD
S0Y90iPejqMdGqn5EcRcHyU38qohhQvQH/KTi/zJkQTDIIEZHDVOuHUof/iVoRYO5pB5vgZjovZE
TTV3DsPTGNehtIhGLR59AUQLMCmCpqSMscmQDRjWRT/CKhocbRj4hJp5k3OhKLafmthsw5fi6Res
MubfRYZWQJGBXAtF8nK6MUZadkje70GyRr/kOdP+U0dhm+bF8To16u1moCD8SQiCWQWYi+RGh/0P
+XJH4sMO6LZr63nKz0Ez2Hmqs0e0tklpKWVrBQghN98p6c19HaBIU7WLJtODRFPxdBPnx8039Nw7
/3pAxme5+T/pXUAhZwlvsJjIqVpA/9BFt46yj+lHFVYr5p02Qm+0YtX3TND4QIrAllGpxxEIMCWL
0CuaEGfSqaZ4VoD5Q1oSIf78CtQbcfl+2cv87q8Pu+W4ZtYurnY9h3mBcJNGGd+CjToI5lFILzCm
T+zvvt+V1PBMVZJxqCYY4AuEMWo0KIT8DKgQVnhL2VmBQnvNH1qMuKgTAJ04v6uoOQRwR6Z76crr
rPsloCk0uyxt/g7c3lU/Cd8O74y97e6+C1Z6UGvcCv+iHVuWUWbno0RNXLVQNg03dRZSFKyR/Z6a
OKeqLLLfW3z0ocGM5m1NB25nEYTL6xY9cWYwbDH02RLf1zTIAO3ZZeAQ76//QWEDer+0xJqWniiP
UBx6SpTHDUWQDt/indUgbaJcymPhhIKQnv41HhRTNGWntum4uvCeBbUFEO/jBfr66WYu6goTPsI+
WZfjqCoha9sNjtR50lsAPmR2eQsjcTGhL7SpEYiXkxgoIwZ1l5z6fMmpr1qHnOQpxNnQH0ePUYC7
IRAyCLEfjVQGtJhXBprNT/XIsOQXPWi24GNsGxggyN4r/4gOBgp8xvdka7ljsJYJEaLHqXtV+Qwf
GLzu2gzEnafu1evgoTQcbdH5Yjely1rvhndM5nwVCUfPa6K28yAHrkHW79LmdfzQn8LNJLOLx4zN
3fv5EqmqZFhGgX3eujWWXq9AJMsSzwO6/2KjoRlPTSNnEYYHc55RrULEaVv7pgj60Pxi/WcrX580
mRNWiqAMROpyedmfKgBIm6RrwbtkeJdeQs1+w1pdtqVPy04ulVY7UZvBx9byxTgkaqZeN3iBcJyJ
g6qMd33KN2OvFyRPHd1QGgnUhOmqzsOvJBLKqPXqRfKFpPn+80gD31kNYKAloR1hfzc22GGWBY0/
qcZnV0TEfOnaihzYjj37r6Ft+VFhHr+bieWhW/zH1R6UkUdWlPHnPcz797ZVr/DuS6q+N1qo8YK3
hH7V+8JBhF7ISCAd2G3vG8sGA59K2N0qM1jCzYO3EWdkQNTcOT9j8KYuK+Q/YOZxSYXNp8yjVU8B
oANapvlylZjF84GlYWNJFX9GzWJolp+KriA0Hv03W5AlhyJ1YC/4PgYPyTXY4lGW2yqnu4eMmm+q
STba+clGSVSEH8Z+jl4Guc1H2AwgA/gV07PghKFww1N4UQHLBEfipzma8kwoANh46M8V/1xpd9/O
otWE/UoX30riJ54amH0ZFYy8N07EAUxBpakpovXfY4pYlp968qrpU3QBBYJSYbDBvGYDUCjgb/tC
JXC2K6zK3XjiCjMrlkCZj6A4p5dhWM+OBj7mrB36XspheATARq2LPnPidMljo6hB/zZzcDEq6qcO
M1mj7LLtIdI4+b58jj2+XwxAliD4gSmt2JFVSjgS0UiRwL3W4EUxzyWSKGkwoe9ZGPUqOSmoyEXD
2zm3Ajl8Gblzwtcg97sXFLGbx6IDTWDM3VSz1fQvyzyWOuTs2p0xATNCT5KO0LrikLOrjUCXh4E6
5htsHvhZfc/3bon3VBg6iA20h0nolqMHoKbjY5Du1vcH7p9pp5oj4npjrcGLmleRolKnBID/1ECM
GJRqL+Mah9OyvwmKytcfUP6LPhDg87Xgl1rEu2TzuVX5QkvkBOPIecqV8Z6iWPfG62B5MSWu9Co7
1hIhpVQKBQiPmlw1GpltNetz39uqQ4kFLbcYgowur45s4QQEITb4ywBJ3GzMIwKYG8mNUMyRYSbi
zdy5eN2YqPrtaWz1cBIpvFnRpWLPu/exrvDYvUdlyaOC1oMXEVbeVgV+LVXblsz8DX2xMt8ybtIO
ZSCsrhsxGRYnHZ+/zo2Z5ljaWBizbBLHDkF75Vf4lO15XhkTA3446NpbgWv31ieh9CkdHSwwCwoD
lsuLX1E0TWOAtId8O091vBl2RVB9so42+zTD3xwEF/vDXT2aExQ5eg/x9OizXbNz1rO9Xpjvej6P
mICcHBnSDZEPOZi4kQD4722cXUK4I90cytg4AXxv+0s6/+c2dG5pUCwdEdBQw7eSpd5Sx9T9fhBj
oTvC91Rwz7ZIaVcOqfJwng0z6RwlUKowdFmaJ83lrcbRV8c780Vu8+f59aRWpZMdZOOWb+MEOPAm
zCnXTw1UJzVn2xkB0G1CB5n/m9nyEXY9O91MyAf49wVr9KM4sFtzJfjRzRp90qGLLU6ckW0mHL4b
69oqfWkLvXYpXo7FquU+YubT0Vvc28U3cI0vsMDaSbUnofQBqWDslgkITEkAlMoLlsJG7R73H6Kf
ENEvb33zM4UuKVtViNWdG+E1MIA51v60ZbRZiCLGfJhoIgwpRtNLT+xCeB0GdsmknB5f+O2YKji9
fS/5XkajlU4bwWnD1cd7OwsM79GqKDrHH82FYC+u3S9VbXn3nKrVsBxn/R2AZqnRgC7SwI427LMf
PBAnc04pX1mueUBZM3r4tLLkTF6ijgfEfOSfPfPnY6Lxcmwi+YWzz5O9f32W6rWRn8X/BDG2xVpE
vfnOonclhkxnc2mIaqpOdBIrNBl49yvSZ+WT9pjCZd9zVGSCEOWxaJ1OF7gQD7avDIfl0T7BIkVv
oZGOzmwAZjDv9jD3H1ndpJOFBTyEqLPtgjNuo+DxYjL17FVo/bAvJjP1QLq+1Fqegbz7BY8TLBeP
pefiHTyx6yhpdKQ7ELVTACmZFKxaX3mOBVMaS69uCw88bUcygDymV09l4mUZuE5jTFWsFWa9eJ9T
2UgXmvH4bINKZzW6+IfCCBLu31Ptx8rEMpMzUtyRiAL9lR0ga8pF6TYCaUuzi5zN95X3hGYM51MC
qBdfshKtrBpMKqybh0XeGoBzm7jYONo/1ZCXP3a67GDjx78/Uq+3GHy8f10QJl4DT8+I64mGaLQX
1oFvjRi3n/fE1yq7mQedWJQOvFy8VRbqCsgzU2yYieKuVh8sLHH4QhMXYS7AvK2F+2BkUhymJ7WV
LislihHCzbpogsyrL4+LGKSwfURj6OVDIxr1U7nwqP1Anv9OCjxSiiExqs2LMTLt1Ybv0KL2/6uq
4UGeM5Om5TtGW23uKNVNQoHdEd+iOxwe9iIPcSJTj6G38ZfjODbDPwJSIYvbFI6l0VBBPwqy1Edo
/pRWpDkDGW7v+bTb541AHc8Q4vx5yaF/wCb/8DAReqFoCxzMA+tIiMjGgdTsiF/Ppc7YWSrxv7wp
DGTRLYmCXUTGC6sCYzz9qXov7zI380wWOoh+dA8s5RGKYd7IDrec3Fg686drGVozR9KIfn8uQBC0
i/JIsYON/8PwCK+htZs8k0qGh50SeCEq/8TKU2HGMt1xNTWRrq3/Mheq8VgQzRjasUSHzSDIe1du
CSbB4W44wLOCa28XQMVjHuNRZ2sjsiWREOQWHgf7/g6tS2HBa9UDAQXLiORARxj/Ckll6ceQzS88
jAJ06EW/G6sc0iNuotZ1Sb7UwhAY/uYmAsveXIM1linWBYqhwKUCRMGZMzHwawq0V7bNZTF2MBRn
NY7vM7lOTlTUkUT1wo05QxFWbhv5KcFGVtDKfdT+vaszH3PaPga2uN4Aex+2qKZ54A7KbVa+SZix
Iw7qQJ/l+B3C0Mszcf+NPfhMqwp/kSrllLjIO3gl7qf3u0D82Ui7UmLRuPdNYAeGXMuX7cTQW/0q
KD/fr98nlk4sCTK5JzUiYywseelvkx6LEJnFc36A40rPK6lez3wv35bI2OMiImX7J4Y1ZyiWy105
JfsBtOEDXLB5UDkhro9BVoY9a1CEtj/d3yhDBYlqyHWAUuGx6YenWUS3p+0Z7H40EWmQVcSSXYud
5EE+S7JgYem/JxUh4D3MILWquupfBdSSaPlbIwMPyHpiXOYGdeX1TBNQUOAQXaiSNlg1/NifcR0v
b87vCz4mSQ+kzdXnv37fVTqIQRwVL3QtXpw2JHc7ytJHE28moLKQZdHRgH8YXpPykRIihI7tIbfY
5cnKbRawLo+TolaqzTZ5UE11jrT3FfY54fIcrqSI+wSJj1XwjiJe+IGqxQlA6e6X1wm8d8+XUEuG
nZMcJGguPYGdkYsdxclw7V0vFyVC1dKuPTiyQsUgh7mqj9OcZlQyc5OufhgiZMELQpQWxUT/gLi2
5fV2KDnQOSBfsTyqOhWKXo4Oyug5Xh3AOsm/0rp+TDLRADZFJ8iWosufmG//BNIc1WpQ0zNFJPg/
v+Yyw4TiZlC9Bv/pLBUXJLIlWxrAWQ2fDYpS1JAwAQpl1EkHTVQq/v9Jl00pcup6TpLzRDu1h5Tb
4W+Xtuk+MDUy4dRrh2izgXDiO8Ae8FicLegl8vjWUibLHLKzqA4uLQ/A8M3AOHIWJhZMWXx8YwNs
pCS1iQAFXrGtBAg11rXdXUIFYEw35tLoaZ8F5XF0bmnXR0IUgIE6tF9Yii+uPFCYfmBBKKJAJYDz
6ChwuwI37t/zPc1i/XI4qhv0s62bwSbwcc9uX/bA4cN8nd8JKmftN18tKuIv7CZtgOInjNxUIJeL
eXWN4GazZnDbfauRxDn490aYLk54yePGMOrqbqCQFufaKNKlwLvK6pe9QGq1nkpftFJER8CjXXz3
I/F8P4CuhCv1IGHHib02OQP3QyquXl8zGAAnBsIhV/4JiJhhyEjozmkwcwKdq0F6qhSKm0nJ4IeV
+BL5XDlpbLvDlFvGXQyM9zPtFrn3Zq2wOiB4gTRQbAqNaxv8R2ShqiB7jrztw4KyT1nGNy39tvJd
ttQSeIM/8+qq29JSGyP+ewPzLXOlRPCyWq5eJYuokRJ1X6r9bTvibjl9VSgc1Tgvv8eW65Iy5Knu
Pil5e+WP2JE8vlNFoJkPJRz9zryeu+T6rIp3OJ6nG0beAN9iwCz2C4V4KfMQC9pUBgKvLxIvfiip
2UMQRK6BqYeCavt3zp45trLNKbQpndUQ++ieib5+TnC9UAKtCMD+Rbw/fkHO3rz9VeNe3YcNNWEI
bbMOHyI5ARWuaZHuYxwKTqkqBcQ86kWYi0t7lY+CG/tjDk/RsBWGdyf+QsHHJ4OdDX5Lw+Jf7E3f
UpP4vU4ho38UtNdWC1UuuNX8hYPhqpY7k1mHiFOToWUQ8zEhv66KBk9kct3l8pDwyHGlj0jicaw3
wYBZbb3vIhS8ocaj5NmNEkyA8ZvgiE48Ar6pCzYcnrrucjeIFpa8ozS/U7+JeNtU+IGVBk9yQrVY
Ll5NsmuJvNwtaTl6yQQXTQU/el5q+GC9ZJLdKSdGrBZyS363WCyvbMEz+qrKxsfeS78c3aYB/NoR
emwcqhNNGddv28QcQKBN4qK56Qy4j3Ke44BxJ79wR+JJ+Zl28zAPs3WHH6JAzJYYAtUfsXX6dCPz
T2eqvqbVHrFCtwOwCtqpj/CFqyJTbmMkukabwoBd+rAk6uaEL9PFhblyTgMiTiNOHOD9wxsxf4tf
u2Wra/vD06qjDiMeyDRD9RbGdSnncfOWDsvp/NrdjCwbsUDi7mXU0s2wSryrkGVi3dC4q/9oVFWa
dPPfOfYFd5+G7FljrKtrlHy3Rq/9yqy4nzNd1cCjW54FqfNk//nSS1GWXllznBk7pYLRPyyNhCCI
Oq2t7tgXLPdOWQdoslYMwff988R+Et3n6zTF0sesvnXnZ3iPRXjc4CshiNU57zsu0+CQAKLEkbDJ
61cLu02iIHyn0MIeBxYSM8nv0nJO0oYrqzG1y9kKrxzDcHMsdPX8QdgBpVYTinf8y1IuTPdQlKbi
OxVnRXRABpDDmm6BgDMcqXv0RZEOFuJ3pyn4Upnqjzufu7gz7shtKRKErczC5LD+nIvTrASz/MI4
7XVE43CA43igGmgcGv+4oygQsjKOgHLE14+1I9DXFwkV/NNBKNmrM2w1/bHvsHWVmH0FeyxkOcrg
SXuvaaKecASQcH2GLOiH1mInbTPWp/+kys9TU3Xf7L7myzGa6IridPaalwr5Vgx8Bc00LEgPz5E2
eqGiVGRkCIusMDxk/Eteyudhriiq02HwC4CPAtwrVhdn3N1X3wLNzd+/GNuoeWJqF3JHUzStjqT+
mK6mpUCZWfem0N7+G2w4YF1psPrQGNPdelf1sXYB0DAiYgZPPmF6NkDw5WoiTu9V3zGnM0TKaS/Q
yOlhAntSxL1Qe/lU/A+aJppPs1Cv+zZ4f5CNP4uPH97JLHzlfbsKH/bd8Z+gaKhzeF0HhxA9oiWu
fnlmivPnq+dFYuctkm3fDPSywB4sC38UwOYl95C6x7ITiXlWyjcfyDBiQfknCsaNUjh/LNpwViDM
gxVVJFsTmjXdMEicDeyl8zzHBbdCAUKrpnJjgSwMoJJ7Wp3OZEZM68tiLy3CjILIeYU2Fu2ywT6f
BNI4Yl11vqpqdy4kiRm1LnHieVF+S3iYVYOq64OSELSYhfo/8WAwmD+EPVacSG6keb06+Eq4FoW9
uqLESt8DaqW71U4KJGgvRkN60fQCcxiIVpzfceJrwToBJAkviYgh3hO46tUJY3g8SvVI5WjxsMFL
CFctD2EEjNnAOv9Xv6Ym/n62YJmHd9ONdj4pBl1XZLMV7FK+4SgN4mF1ECB9SEFeREpN6FEvU4Cq
P/wYhxG0mu4znot5/iqCttrSW2pktGy2DLCAR/79nN+D4nVXwYo4ZPvVaFiGBggxJFdiefTmMg94
ObJxxOCUcjKsfGxM2DMJofNd8s4XcE4TQsM4ioPoCOicUuxMeYC/B85ul+XSMIID8/5idpq3plaD
dXQF6o17BEz1t79rxxNHrZk6GAmHelqJFKi3luJz+zzxeztO9UzP9wUk8dHL431iIGLcykXLOKQr
OI10uGV7NrRMABmuOrwLjpnV1YxsFtnQtoA7NJg5F3NHg5p0tD4SuWLg83VLWsTsMv8kw/+90QxB
028eXa3e81V7N80D5xrNcZGb7sxNlLrE0JpgxHnxR+TTdSNKZ7+wyl+gFwbu+4HjABzd6Db21M3R
ocEOWb0Twn65i892jpkGN1hg+SP9NRj1MSAdZfjuerSdYkQogMU0QeaFTFHHcDC2VOLclSioEL57
w8Oc/5cmVsRw2bkrOWiCrPh53mN3iSMd0/6N53XCpH76uC0BGRgvkwFE9fLpKN2vx1zV+TEt+/Uv
mqifLktpPfmbqFiLAkj+6xX07yfwDRRjJcjYqyaAI9qYi8kkSkCLYl6iBMJNUIApDlroeULCwj1w
HrQQdkvpWQgxPztnTR2yYzn4MDSdsyg0A8ZYpcpwmDGGbOtT0bEiR8ga3OuOFBk+pT7qz3a/q+hE
xGHhFivXlbE5d09+DqV5bETnVWwKB5Ssf9CJtcfndENMqZ3bYgtIe1bTIwG8hf0yYCUDBbPOEhh/
8WYuWM2y8KW2wSeRpf7m7f4FpPOu6Fwm87wKfMUGQSsW/PJSw5mqPr99/z+EykenPR7hXqhW4IH8
fn8wAhTdhQeFWWsKTkKTCUwNOKuCvaY0UW6chb2x2tvB24rTLWU+9StUTMGE+1ndwGeAyMxleiME
Ym1jfeWOsg6+tBF1oj7SKNRQe5MZ2ye/269LR6SMlvfSxpG/7BlAFRIReMVPkboag6KbVLx0hewU
N/tr/Ox7RzKysRATHuAlRFjcD9328m+nbYzPRG4o8lZ4QPrqoG0Ja/PA12Vu/NHOp3PAVsk632YO
g9KfmhM6L7kh0w87jxl/ZkJdsuoo33sffftpKfFZ6jnd4v37bKUfYwei3WfobsdymZhAQoN1rkte
kKUhTH00Zg99XMo5sRrp59YvdsN/6+Sz7KFUBQ1uQLj/34JX+PXXsfVPMWMQufdWJHbD1QXMBK5m
UYn1KaMsWrgJVskM0jbUGGUmOHRSBMcGGUxrXPb+/iswMPIsTyfer2E82kBTkTHLVGLIPT2StfTM
JGwmEfyjUnvieimk00VnouxGlKbOyPur5ADdN0acqPJHfZ1AQjXaMgcliQKrbhdF9sHaqHiqAmuy
iuiyoXMrnudRvqPLWRQmF/mXMFmqvtqeiO/3/Z0LcmOS470sESF3TKqqqnC+ybs05nbkNtEp1PpI
vxfBB2dedOPw7NSqSm8Ug6+8esFckflPrPGAVxE9nzEGg214NNwA0+DK58P09f6thZP2W/kBDJtK
12I7RwymVl0vsr4mmvKzJL123xBm7yaqfTVIqCYgsU8AuZM1mbNOTiLmg92uFpUgnKPlOrnEonT4
u/+UneYKIB/yBFCd7Z3GRTS04Xl6XURm0CpbbbwYaV5XLbISkfXRJa9ARbAEIjOIPeOgt5P7mYKI
FkiJ8oo3Zj5GhcIAafoaMq8ABiDbdoPDi633fz5Z9cOCdjCn2U9MVf7TuuWD6MuRHG0DEem3YjLi
h477gfyrUAzDiA8MLw980gis2WKX9unoba5Qi1nljZvviZy99j7PFtMIER5ABBJUgJzTq+YkcdlY
y72DhBhwVIs5VDGRTCVPfEx0wWMVhYMn84DuqNrEwll+SWIwgS/HZuni401aUbbUZxlOj+WulsBj
6aWdO82dCHB1VUZaI7+FXMsZcQ5uvn8rqeibYljF2W7CQyfmpWlRadcH9Wht7gy8wMQYAQ/giC/n
WMKlf5ndo/xXqleGuKfiJWTnJbhtAzdft3vxyROjgxKG/+WnIoU/w2FZYCDlAKMTmSa8Pxq8V6/3
bW3FKE1/ue4owJOOEJdBwSWI71/PCJxymBrqyLS7zJoZ3pSNWOG0GfqDLLW7fThLItbRbKC/YBxn
gPAwj6sDQjIcOrBlaLnXAk+7jqRbffsxvSk7v2d12stXq8AfY7oFSEDSPvt8y5PdB8KMxkS1XBbE
HH4Gn6oHIatA4tqP11p9zQqJTLnJbwcetiTiq0DjUue/4scy3iimNju7ff08NOumzJiB4oCOasCi
i//FI+EtR3tQZkpj1Q3IIeOrEs1Ns8SPA1dQ7BAuzLnQZZ1i+0jdzYIaqtZr9yxyZ0EGZ+3iIY5U
iZkSfdk0xWIBs/ZZaqNFDmD7XS66WUp+3qbggwqxp9yse6QRmXWnravm+FyNsHkG+NvxLIosekzd
8nPGg6Av1ZdRwgAK+Ed3l3jJmpK5S1ffb1BBH2y0HO9RVE7ZTbaXI062QLF3Bg+HtYztBONSm/G2
Zt7wwUVLLvV9sw2lFakF+8t7oaEzNwotKMn8MSHMPLWW3J8pWkxW/bQRmgnGVOzjmzNuS7v4rYHq
ZU5rhKLy6zS+Mr/x58QXTdI05E9F3t3RAJ3cF/EfBdaGJ68HI8IkPiKf3GaqtfMiYgctQOhoxoG9
ZFEWLMNx0HSGFkbkrO5RY7UgPI8PrAC06bCRy2F4038bMxxzGTZiY74m/qWK00Q03va0ZJDrJHMS
Im852xOFMl460/yrwBQTlEljp6ltfzgcqtXu/OuRtmOojRjvOuR+x4e/kbtEdTr4tmG2uGElk1AN
Vkr0fINt1iW/xcYed/bNdbscgvjqrWvhJbHXOAHGSrldFMnv0WMwtDK5d1zMG/7sFxHTB+vCRl7l
2D3IJr44X27ZmpcZz/fZMzv3QlU+qlK3xUCe5sBXQgEyGC0GS6U0g4ZXgi/bHLfxItZDB5Iq3qfw
0ZiOIBym8H00Z1wiV1grN05d0VzKH217XSLg/DedxgLwMhctpLNXysnUk9h6l5mgQOeZQ5fK5ys6
oUNGtNV0K8mT/Zk21Hl0RFL5fqbTCQ3SRJsVuMSvURP/dufowSO7kiXsXfa9wjZeU/0qE7bRNtaA
irDqDar4T9UqiYDLY6vEk1AZZYQWJmBvlSUEUGa5Kj/zdRwvWA/gZq2jzW5HqX3KMLlGwa04u1gD
GSqrGtj+KAG8dzsHScAI7XctOf8C4aLwtiHmhUibOmUsw9SV2agS2LHtSwShh0CkCvCPkm8ICKZp
G31Fpwui1pG902Xo+YEh2+7Sh7eTPzHi/hQHc2Ed+7kPEn2JFt6ZkKwLaw3b+jz8EdVAzKn3A6d6
n3cLIO+CCVrxy+KCQiJsmsOQVBsrp3cfzonQ7909N0bQwE/F9xLOoEuMeyzYXaWe2vnzf8XQzP0R
mGExhGiLaoypXlvidJsaLxG+WnnqF8pWn0GNNf6hxA5Tb6WKTFoPW1Asa41GMVw1/pDfr+hRjQHv
k3720pLWh2dBy/DcjAFOhb1lvpLgsy2hzba8+2Op1roNS2WVTXr9V3JgEWzTT7xkFiKjJjmCErm/
SboTBvt7mc2dGIApWfN0ljovtMjP6Hr3nBhNOtQdgaglH882trrs9euVViXcxu7csd3khFWR9vmf
KRwFH9MqG76ggFuSWmYzyVqrOrpu+i+UTHIdIolvYmxUxBzC/v7PXX2nIW6+FcPh/dtNvaSGPTNh
qi23+3ECEYBnaBUbGOy8zqOXf5HhD00PpQmqQfUZOi8trbny3KzVXU5gvif2RqvAsVnUfGy15zJ0
1uvdamncBQ98liOZqI8N+o2VfgncSsJe7iLlEnSxPFB+HH/q3jSQVFCN6KYJYSY05/lRUntP/Oll
aoCMoMjiQrUPw6+OTzod8BxwkPB+/uJnhHww1wlP6GnbOJByOgqW7yeCdJpWGHOkWbD0J8wBszmi
MKuWSFG7M2PbYep8Y8IfZnO9GzBv2ogw19L3OMvSuRvTPhlUIOfVmM7ANgx+GZkeS5tSajx+Z5cN
NbD1jQfejhT+1ni8i8SYJhHv7p/PNLgxE3QobexY3kboM+q/mQbhLLUHC70HxK6jn1AGd8h3H+s1
TQFC49+XEzO3ETyy7z5dJHyTDaLxC9EqwYp9mrcMvfdsOUuR/TStL8VMuDSAIi/eq9lFsorwEsZU
enkEZ/40OA0iP3KRhsVy6ejl6CJHXib0mR1pwuRj5ly7B5lxYSjnv26H84UnUJZkeHr4fkdK2u/m
7z3QuD7A9atbcpeGNhfTR+xvmKbvCxV3vveBmCpE7F16mlRkWVG0KoBUITnl1hrvsFcsNT7Nc+Zw
Lk0EeLKU8bAIvLOqRsAYIf2vfOFe3wr9sUfZi4vkBwOq/E9yz5F50RF9Ag4BcDz2adZNvmdXKhis
+EZ5JeA9S+/L19Z9xUnbvZTd2V5b5Yzl+qnkTgRkLAAB2xykEEALWtzVm/1ZH/vlgFXWSuwiqHs2
It763LjHhkQepXzb1Ga9x6nFvH8swWWIjPRTq8gZzSbzAUdX3Ck9JnMGC5O0IO75tXdi0peQcdjR
kizTIX8TNDc0OqMjxtLVctVq5qp3+FgkSr82kvjQ8oc2cIOcy27QS0iyK6HGxfUA0zmUMTJjkvu7
EXWOuvyyHVIWQZuT2hrACQxDpA43zntDasnW45kIiO99pa2amcBx3/QxLbdbcAh64/U3GPUh0F4x
1U8ZkAdrppFrhDlF+VeTvBEPyI5bzNj7IocIgcgNRDGCCk7/YX+hgAZF6LHgd2Czb4f3K5MMMdH9
NfWcb0AGHOPitaIe6jwVc34Ajcs7DMRiRv2bjxMpPRVg3G8hWdUqmV5332CFn5eFLMXaAmZVlmmn
ILcE3guJKnKF/Ai2X/cubcPhpyE1+2gPBwuvQuQbNQzaHvsMR2oL1fU30rBgjYshJc6uqUW0KXfu
vCLQyLTa4sh0DYqDJ7SZCNahaNfJezHgepK7IbiRHxTSZqVflAUPWfjPTr6aPSt5+XjtUQx3iqxs
u6zViNsOw2Zhun2nNDyMvZnkCCfWFZvCQbfYMTvm20coSkfGAplbJx1j7C1Njp4GxYcXTYmjV8xG
4/zxCHJBtg4VLVlRYFK09AtZaDHfwmvmo5oBn5OorzNYewHu1dFiUq25pbinCBr2jtM9aAadTvb7
/1WtjvlUATPA1B9cY+MclDxzjTylhYIEONGE09MMPHFvKVTmBH/YNgxlLVtm5itrZZ2r+b/31/uk
R3kMhteNsXzVxxyAFm22OpTWFm1kygeGx3xx1uvV21NH7NUW6d0CKjhum9iAbqhWMQ4uq9LA1XeI
Up7Gm9IJzCtbAWTF9leKqz8y6Z9cP4S0IPQVz8lE0wYfDeCgHctFkDEDPOhEhGICsia3WbpGuCE/
ovxJPHS+fCMpE8DWWKRVHGgEZy2YPbqx7Tiwc/YYFXnO2To3nNH2HhxnSQVnIud5KdKRoMKn5n8J
uf3ADbHA+qAKqqezZ81sJLrZ97QirxfN2FMpo2jLIwnVCn4AGo7tOEStf9lZ4CXl3etcuZ13PG8+
doKPvvTEt3osXp5tMjWEXJOygbKxv/ULjc7pa7vwe21kW0tOHtuVqQXZcyBYhrg2PSq95HTpwOgv
YYicZmkd4B185MTLX7EcP/bYibF7p+SP8pVxeyVnknRtdRzvksN5kE23YGjnmmMfdy8KFyONmCgb
DZ4ArisxOkx11FH46G3aNfTTSvuCoCgoVxGSOf/pKsTNl+zdqHRtsfbD3xwHPwczmex3XDKjEawc
hSiyAliST1xfuMHM4xtqGDSavPsr+XKS+Rr0O5sm+LcQycLlXfxaJZ6bQAXtFaJob7JNhZvQwK75
NinbU0cE7pJzr61qvejiae96IPAUK+Pgp7f2nCFDA1iJmZ9arePf1eBU2RkTumaPpEmi4WPzk6CF
12GqmDyHxlAZx7k74vIh9NRYJnbPlrbvrF/Dy2sc2yXiApF13o3hmz7bxxcgDSVIcibHG8NxBckB
uXHqx4gNuTZOYKRVmhXDu5w8gBfartS6CJYjmxsZoH+fbhbdx2455ZlrxFVq/pEYDa4aL4YQhzRK
NdyWPBkZMVmSmxbq7Ez6dzPNlgJT2Qmp4vxrBpRA7ROCTyIs3du1BqOLSTLKowaC44SI3PkAWUYZ
MfsNVEEBE6ppn7Rh5iJadYyQSZL9hVEDB4No2egSSOTnBXBNYsje1ldpqTmqUNorHp/6pu5+CIZ3
uIuv4DbI76tKGhIpEQJk7rqf/xgw98nslsMQjh/S25WSQcI17iym3vdwia1NUCNdiOWQA2VGc8mf
Sq1c5dr5SVo9kfVkGZhZdCzGugM3iYB9fkuctBeZm9dQt2tasfRWec+Bgy1voGzJhFpb5bekbInB
e9PrpkjmrEQk3AV5R3pAC3hFN3A7gpopFyk42RQAxrvm5CAZsDOcHYbUIvrepT/33z51nt9v2cYF
TTyP8R94TT+C9dVVs+yUF2pcHPeVhNvErW0Qw6ifH0jJk569ZHZ4wB+uxRpyYhnGD2p3mCkppApG
s5RFHMUBlcQ/U+rwkuVjbbbxPMGs/fL59sE6pPBJ9wVlxl3L7fsDnCdCzF+BFrZx3/p+BnXSchdt
sZx7LEJi5m8IdEPGyneVp2rppweXaG4vwDx045yVmS1aoCcX3BCgQLo6Cw9tcBYo5JH8aDcFAQR4
MfCyTJ3ZgtEy02Vwvk1pfeh/I1lS7apqN2N+96bYlng7uMrDbm1k0K76ZqxWAviPUM5HJRg1SphL
+Gtd4OapXpxpWN8l5En9vUYHhuRP0Y+1XSF8WA2WzZ9IIyxU5fMBrJqdkW1CoisQO9rOtZRlA89P
hlNUuFOtYleCn5C10FOfwYQI4YBk+7D40WdqEG43EDjCDpOnZ3O6y4njTU9NI/krAbT82nu5TZ+1
tl33vpQx8VecpwTR+hRppbVhs3QVxXkj3tcpMnIJiiGBbh1TeK/9D/+VFfiD7gGRK0NPurbO8+nN
nbV4MqNPCl5AdgBQmhGTY1GkIFaQcWoPKEnlxDVPNBuvS0toxcgJUIgud2IQN/VJsIgneCBuyw2o
rkdM01MvzEY0Yy2B+R5Q/9oU8dOFUYj2zTNa2qfFqVSLwWEaoMLx/THqDwI1aaU38oAHP6dxC0P8
IIxwM0t63ufTnlUcvHseYydjvk4RGSuBqQhKbqzyxe+MUuOwROE8Upyi8t3nqLvLPLDpDL/2/uC+
9tD+WaytGaO01bOjnSHhjELF5m/MTchomSfMeqWvxmq/X/HNQ30AUytCipcsLvt8FOcWd2J7gVeF
P0abs1KstH38MATlR3MgN+VGRO7b+1sCgmOsa5Ue5mGiGqycty1QlYOL67pKDIPR3PrJUZmTBCFy
Ala8MwGzuz/eS9Z5mlSGRvhu2D/CggL6lqXYn2xHTTQSpl3tp6qVD17IFLm8mFLTZet4U3mPNO6R
XSw4fXHc6vnI9nxTfS0zzDUi6dM18C249/lwnlicTJNS7i9E2amWAkIxx2A7y6XVtjlRC8P270Dv
46gFAMXOWbXHLyHOx8JNIwBiTL+PLizHE+C7akG2b6IMvV0L4EyagIqrxP0IFVpcmG6j0gAGoX76
ICHTydhKfkF6nTphhxIa9owtlJDqtNAolB2aVdn7Gsx3jPwonPk/hmY8t3SJGEXDYjdIkFGLtj4n
Ncs07nXSHqLAGxSLkH7WeckIKUhFnO7VhH35yOU82qoPOIQTM6WiAX4jur8JgHFf3DSLiwbBnM8m
wOLrNvk66arbxXSgRHU9g8fEgWe22zDIhunAX8/1Ik8NzfA1vlz1AUbs3ESw2M+FyaZTnSY0dfWn
ZxhjTktC62mtWrVT0uHdjbYNzIapqhiNKgQ5P6hiWdCsZpsc6kJLBCnbQYB3YRhQ7kWud7bNToS1
LFE0I4kLhNZaEJ8a9+Jsjxd3pHWanI48z8MI5O1zZCkukbFwj4Zw97aa1zsK+rSEutAR3DFJwcnj
CzGjjviuZsFELPgcTzuOROTwSXfV+3uw4U6sgeSt8AwUxweq6MUd2wH/tX4d5UiUNoN69uM4bvBR
greGsSrPdJWi/duDAaF9ytkGiEN0XBU8y/7H8UbKPCbxn9fC8oMKYdZj7sTaZujlfkyibBjjWJ2/
T9Uk+Pm/Hk8rIFdA3tdAVmfqKRKbretEQ8wtguOcSsaxYWyYrhZFRU0INlTb6VG2bk4M7LlThyoQ
yrAVyK19szXmCJOPa77tPN7qW3dZR5rImh+0qnMWM6VnjjORvL2bYrPdYOiUqXPFvRJxH/S1k4GH
nmYkXM/gpynK5L413k5/QjQYp6C08+V23/6Mbe1jTqkv45zrjxcmJQQsIZ61+KtSbYvMvdZEfSa3
BPuvLxe81FQ25G8msKpkdlEOwoU2aDLPCbwlOIx/UkenU4TVQGnrjLfBWfPMolfMyXal0xcK84wd
BMdXKXDixDE7+fZdM+Ad/5AdtcMsKlZBS+NMUHZo8a1KZc+UdWMGQvvbzyZ5/3/HlY2eksV5iHSY
ypekdl0rApLol6Q0kzfmRgoXkK0NHOKBfZrUOfmFRDpN8ryT05MIyCQ+n/swSmSl0e8abmcGqFE6
uCWIL6OG9kp9UzMTsR21P5ITgDmOul6iYLW173s8QGHaWSYtbUCrqfc9IGb+iQICMvdTNQDbT9L4
Lq9026sEH+r4JNQ0+rUXhuIE/8XYjgWHuJ9HMcozFpQqVS5uhJ9O9TFoI659YXQp+jG7hVLgWwF6
7MrojnbDGLpWJNsWlpOpa2CXSZyTkT2Kt0cJGpjKXwFeInHKqAv/yTlxNvUar38tOE61KBue6yKC
UlfSB9eIKtkQuXwnsgDrf1QBegvk2ijb1G/JDnenOIgHzOA6KhuJ+T0ufjnZG6Ov0FPC3xNp7cOd
j10mSd/JMP8oQm23uR4dGwGawdMpWqIF5wq7y42HpUSQdSkfll9rT8aowmlx+CaYgAFHUlQbkrmh
Lh9i+63l6YPoZlj3tOjbo0zC3Rmsn3qsxYV9+cNV0cOUwWpoqV5eMxI4PALZ0HmwD9Ryq1HXWfYX
JTQkZ9nUIEyke8zIR+dXGKhonR2RWaw4TrVCySKAPC+sx1UuC8nZ2piyEY185Wnkimk46JxGB/K8
yiuQCmboP5ccn+6tYM+gEfowOMbWbvosgibzIgXT68c3a3IL6CHAb85ipHVXTH6zlxjtnlwF06YT
Qmkt9y5S7xzM4PPCiLSqcMdsD/yYJy3FsM4fft5M93+lNNJaMxWeufXOZJc6iid2dCctEBjhCQlj
iAxbI8KGYq+yjq4FlTBIjCcQgdxGYwLWLk0fgR6Sm/mjp6ywAZ/b3X8fh4VuuGfKLFrQ84wKZbuV
CZs3tuoUmVySbdPwoVsDq038xSGvbHs1PsfLpiWcyVAa1MC3zHT0mF9OS/qtyGWggJYBXklKY8TP
znO4x+2F/1dUm7rMI5jZTYLCgg4G4HvL2oBSSAIxPUh7t2qNMFjrDcvFZ9NE46FgThSjjuFr+364
Z8VPxPnCZWpUz4tRsxFiZv6dJNs95ixBepTx8Z9OMmjZEG3J69meO9jo7YL4Azjc2iqz+oJG7lF+
BDhbrwOUdi9RIPfc5pW/+PiDXAWBf5FjjyOt6xvddUiRdzLY2QS1m9EjuaalDpHP8fGvG0jxYX3p
KAtAn9EEwKfYOxXsz1OFJ8Xi5Ri7xBy/VzfXMSeIKvwR+sj7X6qmFJGg52UpSUjLvMtXCxsKBbzh
twGOlUtnscDTqagyPAWKPlFSahzmDQficI2IipjlH6vAeWLR8D3hEP20mj0+rJEfBtoIzTD7Hth5
1G3CGBbfAnENJAFAZWoj6t+WJf3v/k16WfahE1IQjz1MxGXem1+XbDwghNfk6+jlLQaJgL0mSOZb
vwUYN5bdCQK3LOJJZtrjsf2mzxhX3ASCzMvJuT4rIkGmIMFNYYpThh6/C6m+646v55Mywi07KA8M
+7OGge/gAFDGTYz5WD4b2SKYWhlldYCgPDI3TNDSSCGOgKKsr+G0ohiWjHIdSjwXNnRehpNwewER
TzQXTKYtzx/2DX4dZsXo1gk6MV/XGAScMrhdTMzvm/mRIjtoElC5s87f7jx8rvhVy2S3x3Xv+3lA
PB2mtHFDdotLAk+Jg5G56KWj8UV9jiGeoG4A41TjQr5CRaWJcaXKFWtBtsjlattITWgmUw16TwVe
AbORehcmHEwBmEnOAWwdKuhHQMRv+uaPATzaUi1UafVCGDBs+Yo+Pkh3G9tUE6yeXFdpROlsWPr5
TLeUHA4EQh5WkULpGzfdrGRAPgFEVYzAzNY6Revx0xRVGpaf+xcVG7XLMzusqFTwvMoV9ehbIvVj
1XOBfSYVu9Gg05NQlzNkCEhmlkaO99TwMiaGKZ7UzxJyxihOq+ds0MRd6oJNvR4cXbxm5UCGu/PT
zcf2gRg9BCzxqmaHceO9wlIKR1NNryXOYxYYSWVuQu+qmR7CEl2NKzOBSdmuvHKB0MFTThLS/Eby
KQEqxhFLA9CyVE/fDk35CiJmQGwxLdFUAS8tmAUhQ8Uuf0Fu5RodZ41QJQQhZKAblhE3fnGo035k
pYUEHTghzArMZMxx6LAzblhwM/HT5Y9fkojDPZ0W1hURUd55tmuGACE2izA/NqO4iJjnzqu86UlS
v8a/UC5vaohTOqpoKu5Kl0oQG0bbVKusOx4L2772K2nwAu1MLuIoeXLUfPsrJPsQ7jScIisR+Oy/
QxsrjvxVG7bLoW/x74mPwjkzfOS3wEsZcWk87XobJvEBFFQV8lUlzOcdhL8sWJoePl9mSdL8n2Cg
KRQmaILXIRuQSbeSUSvStOyYZwzJAJMAXSzvY9m3ci+K6cPhnzmD0auUU9dsnDX/K//iBq42Zxqa
aEE1hVdktGKWj3xolIpuy1zdAZVhutybR+DBgjRgJBZsT/d+Ah9rnAZ99HGFP7xLN+MPZ6HUZgYE
XVZIWkgmT502I6rL9JOguTiO8XpeCR5CwNQdQDYmy6BPoNiPnBQ6SfTGyggp59ClrTh+XaZ8pGEV
FSVFrpvv3wsEpWT5kt8Tz13jdO0RemQH/EYU0Vl2ooQ5jSeOwCuQS+MttIfroOcO0YuwMQkTzHKb
jgH/8GRfDn222QRMDCikJD0IwKgPfiY6BvScCi6GenLLy0c0lyBMzaUmOZZQ2nrSSDqtpQ+KkZ3M
RnCBHf4d1NoU0n8kqdMbnqIwpTqSCaOZQOab7pAJsGaTiMjm0sKCI7sw3f+/RxG7pY6119hN4hm7
eUp3s9lw4UOo18jeM0jvE3BN4hiIJTi4YPmZfcElUT33Y/RpZdbSu1qPUy7WqNtN8YEta4HcGBR/
LeUasxpaQ8WIf3bYokExH+S+zcPoTpavs1+Ae2JRn4Frbz2Q6WuJUzE+tJZg8AdIojioC2PdzaPk
PlmU5TNvjBlQ0clf/GrGvTl73CWxVVeOsHCCXH8+PnVo1+jd9f3fRUJ75yjSspLEMLzP9/PpL0Ph
XXosig2sCID7ItfT5L2By3t2XBAixuE/YarADf5YDuKsFt7y08RD89fhC7aIvv5qicWw1t04Saa/
LarG+89ml3b5T104lTaMg+CHC8/NEmbidOowoxNfw9/Ls4BxiJDdkFkYf6nspLp03Y4A8RXFRLzE
kXJW8m2TsHQp2KqmTFmzeS7DaRzwJP44aWC1scDQY+EGBJoDfqWqU4EB79l39Q5lXy0UW85gcQYS
vzWTTfu1d63GQVXFoTtElQ1xcwGfqCrzLRg9ZRzzS17WkC7493/g3aX5rG1ft+ABTMzlbMe3Vi/u
2RA/6Ju3QRwrgjPMDh4RYy7otQ1aaN98vueLmg96bwQny3+oFp2GKmJkg/67gMRraMpQPTPz9HPA
W5/BcglAV4iSbN58kmq83oN/7wo5MQDQVyoYETNlDXZo8jb/qLkSGlCbn8OwEMT9AjXlNzKecltd
7LtHm15rjAmZZXKF/i6sSmBi2zX1F2WNUP5e9/blZ1JKqJA5H2RCvxc1QSac90o8TTqyTEUjGdps
+757iG98OrLjrgV5m9a20UQK7tvlx3qgRHYKo+rvl2RFZ55ccH34th1sMTvpJLVr+pdDe6902Z/T
2ZOalyOF80e3z8LGcM/J6yS3fYnjtg56San96l9Nww+Dc7yp/X0yDEHPd2CCXlFWMXdH75QML/k9
Q8490AYdmj6henF7GBb15LaD+tzdQ++9jAwbFnIO2ytubXBCZVWRgRFbHUyowdbXo8yQ3BurUm0i
M4y0yu0hFAl1vOQ3j7Qu2z3Fzvs2jAP/6s8GkEitr+6Uc2EM9iQ+/Z3T6ZjkvdDHWcoE9JIVoGQ1
KmOMQoM3NkfwmqU64ojYD4o0lYi+IOybRl65XzPTeypN9tAmdpvuY3lp61RDjDzDBI/heNz7g/zz
OzrT5NUcRSXfgmi0fwM1cZQIZOa48WWHkWENnHfCaoaOeii13wkPqldVabbeR3i0d2aSVO0breJO
jZvKui/d3m+ggog88VPLkEGULhxJk7fjIcgxQU2vKgrjiFfknvQxfseS2DtbEnWvjhZTGeG7Ic/B
L7gxhWUk9VVEAAwULhrscosiQ4KQOHRjLvATcQEWj5E3v/Kw77STMzXepcEIhTWG9orxjsLX8LNV
VhPuqEvV3M8banDRiLl2DpNBla4AhUNUjvpOQl4R1XXIQjINsyy7Ze/wPVaBBpP0V/uAstA2qn3u
wMwBkTfSu2ZRy8UCDedybLPWlA6lFq1qLJeZ8IzVo7mZg8EVE6zrk8+vyPbXkcKdhf1R69ONBz1Q
3oFTqKmhqamrO7TGEmyHB+CLSyOY9Clxvc9YRhFaquxAzjAP8/1cD+RbRlhTR0mTwTUYEXqPxB6I
1UR9KMem3wYqlOTbibOrSPNMcWzr1LffDjD6MSbNcjFr+ulS/8vsOiL5cRWEUQ1+L/xYjW70SlfM
cz2Rz4LKKpLDPEj6a7uIVUHenWVryKjF89FSbHYKMV6dn4YBbTdmyJbbdhBlQaDcOsJrtqDrTqMk
fMZzmWyHeyRLoE3Wa/xVJDLcnFhAf90hAcKH8kG2YtMS70kpeVpYLeCRUkjAGTGisGcS8rTZteP+
eDtVYbKXoabMhEqfN89hj9PLMKzjkAuGanxu+nRGHlKvKouLiXKTjrCbtNMt6PnsVBdPTi5d4NW/
AMM32nfM7zRlMNXIYZvYsMeJ/jXEav/BCDjwoR3VRdLHTLqBRvj9xSifOLAnb5JsE79Z5nXK9sSv
xzzOe3q7Znfhnk5A7aWS40hwQZsQ4ExihKBOQLByQKnKeCsXjRMJALqU6TL70GYWSRdwOlSF0e4o
HO/UIPDr1DtvTDBt8/qwemReMUttUJ1pN2d6uyssWe889Kcra7AzTI/MZWuyS5OUVizQAnveVJQq
pZDbYEmAHPaQLG8A8sIFgwtCbSGHcQtnfWlrAm7ngnG+u6pi/KgntM4Ryt15dX7nDHBko5HZvVB0
Un8r54tTpQA1AwdhDwN7gEgO+3fa+wM8ww13/5Dya9C1eyzqKWKExG+jiHU9U+/EX3LGuwh8/pRR
XNo655zjNDXq4Vy0qLAlUfqRR936AwsR4FpqQmFz11SiK7LvCb9oBuaO4sKcUOIPtkMPa54gHUEr
Ui4vBx1zpptrv6SmZuc0AuF4eDjWxj+cEw2fUjMjklgh3WfQp/OL4Kayskq1K2EtmXLdEa3w19xg
PrJMRRbsZ7UoeYy7qLZ6QBEznZia3s5eypKJcNCVFk+CowSUAIBrW6Xo7EUPEZiySeKXBPHq25R7
SF5P/WqPziHCcStrsrOO4KVsAWiTTQyNT/foI45JgMmghyB5WHVIHdf/JyXcmYHXqVbWjws1OGX3
PcmGjuzE/To/eRKUaIOEq5cPy5ptRjv8g68UWCwW3DXcrKykmVPbGnVLgKW/HqD+4pDlnrqOqnQV
rxCW4tiaOuvQ357ccBG0n+UkeF1C3tHh8nvhFi6Xz9Lndm7JMB3Tp+Qw7mKNUDkhWdfTxPnBKev1
J+qJcTzSvg5QLrMG13MV9UD4dMgjww/tk9FhIwHUUmQ5nivlOK/H0S7GJ1eztVea4PfF8sGetEQR
aM5JTlMuT4WEDfa590NNnC6PKSd1kekjfhchfd3TChgB0KJzGbCVY73p3DpxE2WRqRId8WaouF+F
wXHuObD4S69YlmLo3C+KpRs65RdmNUFT4byE8Wy/qnckly7jdEJGlQChSU0eusLBjc+ruLu3rCAz
Ddbayh3n5vSihOal7JLoo5zdWVsSG1aMm3+pZ9QBoVX7o3AEwniIhO5xatNFl1DSlnxe9shjoA9K
njiPTal2m0SQGKAjqERNEPS9qipRkPkUIrUehAmhkIX3uevsEXKKkIt93a+5A3ftOV0pvJdkJzKV
EdSyMI9tJSsSHpas388XqPayQc7wmeHPlZVDm0SUYTNE5ZW8E05uliV3G6KCEJxWKgHE3o+RwnGT
SmYQZKj8uxLMGWKwcwOKzCGKDURvdgov3wMrqte5BxVISMQOdGmzHA/3/YCzTr8lKNFJHQPIEipW
lZihHq5vf+0yDgnfdB8xw0BESENIh2e54RFaQBIXOI2kxAVX52wgW0vs+0Z5uJbxYFe8UyI+sSYC
Y79XB1O4TyKC1v5VwJ1BZWkW5Ae2B/1x98xN+6LulcYQhAeX9x4E7kiBMFOp+/bMy3flc91i+xWK
pcCFbPmfJa/gJpByssyfsrT4ZSQbLlXhtVWa07x/3cXUDxA6kqlsImhiyoP+2N3h0E89WbaTTXeo
tYrdKE/+7Qbl/IoAdyuwWCmezRLens7houdRpHFFIuLqJCKXbdBOrtD2bL1xP5SQVImpjh4JH+w1
v2rm+JWB9/GiXSs/qqitl87A8elQf6CPSMxOa87H42RA4oiS08cWR7vLrtm0ZmUYk2dxL3Xk4hc9
cZxdQ0YQZboT3bQH+QqySSdSERVOYFdplGutCOa73p4OYED4NCEySFHewjJbhVcYrF0dJ2xgqMya
mGs7u5Vbr6ZMWTVeQ75Ivu2L4agpBGC06poBP4qMKGEQU5SgVWBODt1AK20Pz/oAqaOg1UGN5lmn
mzJwoonRoa31ZR+iLm6MVHE8G26wpcNZZSbvUkcA6/q0xObiEBb/it9urzkRLLa9QhsulglgeDHd
fEKLUQ/koNQ9aaHkwmDxTmlrDueiBeC+3OpmZqjKMqg45S6u6pMpB/eQ9y3Lr2KpNk7oYT9Lg2rX
nN6PhzX9nDj99F7qL2zZc8IgRZ3uHNrOx2C90AIoZlN2cPSEBDUZ1HfMT66LS2o/ychCmJCgDrgw
hUbjckOjLwEU/nsPWcN96pJgw4fIxZcLo5+3CsR9TyuaFhqRabLKxRnSQkfbs2aGse5wDlXVW2r1
/2UnOPDbw/5h0GuvhM2S6XIOiT84IIVEJwl5BgzA2B4Ck7zceDI1j4f3KDEA9wVLhSKp7u7ZSNnv
9F3Ep1KgPznNhuqn1UT0N8TV4mh5adxeNcfkkH1v0cjzQBFRWhrF/JakXeR4EXXbekTNImVejf7n
K12HU7bhw5Pwl7TR2NJghbw0Jbvq6uEW5DBYKtkhEctUxCmEv3FLsjlQiQVe5GIhczULNcvkzlOA
wX8+i5gz5DK75gvIHM0jwL6C25dZnWmKXIdOZ9FrfGOi3Y5JeW/mPrPTebAVzOmgZpr/h1rO+ozo
dglfzG2D8e2ID55QmcFofj7emCo41VvweHvSVaXKD4sjvdrx9vGgWun4sStlY/zjvzMzYFhL5iGi
BHE2ASJ+v4BLxuObZMk6+nzDOi91zm2A8+tw9rMLD9OGyUHtbaD+0BMxzoxYTPFEwFrEyKr6FRUu
n4MPgEDCYRfp7OJGrZLbVFBRKhFjBFPTlq1kTUAtsVlz7BoTIPocNb/zqNQuAD1BbY314tT7LiPW
Eodyfimlju42MhJjDQcyIAXJACPFhgmBZaBKFmd/iTAbZlAD9k1rzc7h0zOsiak/Dnui0ovbj/qK
MgmDvrnF/YkB1N6Dg5e4wfsgibQfEIfgja2ktaUAEfwUtKNOs/TckZr2LrnagkdSbSxVXQfW3G6S
XHdWo7PJ9YJ2AzCSOXY/Mqci0lOAuFia8CPFRGlFlMZy9Q6Cke5tIjN9WHpn43Le4WKEyrFP09iq
yLOhPUGyPekwJBSww+ifPjIxUGD8fSiyXo9z5uIwkdTgiSDiFCeierMQf0ycyaomNPHCIKLDlbTY
2okxth5GfWMgOdq9C5hiKO9iJkXYn3ylSLWB4xjBCNOywWW2gmiavdtsUxsSqwQIOoTNn9cJUAtF
DHfpbu0nVUpbVCOotnyboY7BXdFE7EEMWaskyCsYjhp0mHw6orR87JFDiFJyKFRGyyTT6Mh0GIrG
E2D25cg3av9/JWEVGsbiF911Nae04QtwvFQb7spozH/oVjbEg327OjcOxUuYhyCU4h+rj5tVlzES
+hrZ+5cRibKtqpU/i4LJ9zrcK50kGX+dapaQHGid1Dptezi1CRDJFBbl0XiK3CDb7dOLXJPiJTep
CQ1x6mgOgI4Qk86R7D1hKmG+72uOfAbLkYq0kNl2f6jbDuqJtZYjX3iHuKbPXDz29u5NavQNZ2ko
LvQac9N2Xfk09DMe38aZ/qAoWZxr8mXSEZ2OFWcImXdk4jS/Md12WsOaef5RJNq0eTIKV/YAIy3E
MG5/fi5RnYTWPcL1HnivscMq5RWzZCKtkAr4vH9OMamwHNCX9ceVuWQAUfHs7yFhdm8+jqkaZdVv
lS7MLGOhyYFXruz/iMOGYouiuOxsXclSTHpfMurdE4LG7eH9wKNtKXQZXGfvTUFW+MbsEyc/AnTI
VquXenVoCLzCm8FWRdzWxQRNsRfZItvp/SlOqBC1XnnhCW2yzmgBuv+E2/9WVjHejXvp4zhl8RIP
qBYbso/P5cP9nuDWwY82zlFb3iqyNvrjIiKXTAQ3xjYXr+FWA4t6r6Uw0TrCEdd3ukmFPzfyB6bH
7ouTLg1cLLRvndwrn3ijO4oB9ysMIpCdcTx3x1efjfHl+YqGnAdibDx6vgH7wZ913k9IXfM9vxD9
mnwqPVhqWRdouBc+sOPH3acvHBCf2+AWufQG1kVAuvnQzUXOUltxegYloFW/dUnICHHXXZToB52W
HufqI5ZnI8cv1Stb7bILlnQBwR8OfxQEEUuggb95glNToAo2RKxC7EaH0tjjvhAXde/Uo2KYbi8H
YbEgAnH6xmL1RAg286R8eOVZ92w8/YElTJQDn/EugiahtUPrZnwzJW43JjvsaqUc6LyhjhOT9qOG
Q0QJZnN9LnKzP0gcf+P+EmgBMeOa/PujovdIuyz1ETyaN3iJUhsAy7JTtVcs/NZPl8f+inriLw0b
NHopa50YAzcoppBGx8211noDWtL4gi9xskNaL4nzNFlkymkWDI0dBOSD6u+LpI4QGOUcUNKrmgEE
lOMPTSOauTPB0DlZNlTfLfU2Sl3IkaYkACtG1zrkiXV/1Cn5nzazMjKdJHPaL45xN6LEPOZCHHJ8
tqBIMOva28vCm5d4aCTtNYYPkImxs626wpwgjSuGvb/o/oWoiiJyn3qXGIMsCTQBoDeV1y+oA9b2
J30gZ7+a2fd9Lkm7sA93g+/LSBJbo7ICDSfKJIM1h+teoHN+tJ72r923vc8f+JasnU2CLqp7zlb0
mTwUy+n7NBIWMuxl9iABLbGnGF35MEeqFT6IAVgqhQrLnZ2sMIX4X8kD2jlq8Y+Ov3+JeoRCfFBN
KTaFB/y8JGH+M+W295XPgIrulXxqRe9TOVOfp0TdyFgUj8YtnDVD1KsQnjxFFxh9NUZUqr8LH6hK
F2VCkXx313KStftLmIPZAqCLlD6+dcUBzRtC+N5XYWLAJ9A1P7VlgpmyAGufUGdpTrUdyUk8oTeo
zs0OCu/ohUMtYkJwQyI0VPiudIiteyArT9sGZf/2EUMVF0zheF2UxwGq0x3EzfxCgd4lGG+OaMer
VcSQE0IBXWMMqjWS5gg5fa3/curQ6dchOEDWv/3/W2pz2OD7BJaRGf+fqZAc/07vW62K0xd7cA2m
5galfAn++24cv2zPHUwkdc0uMB5N61UavfRmayVme0xy6xa4RGr53ysfb6fGydi+mJuj7v/nxWeL
an+MfaCrEISCLthzS2bzFxyusx2NeBYm1YAmBdmQ1BsFjeegDaJ12xZfjubAAf85CfMFWsp0WBB7
XPJXig8DZBOI0qVkln605vgQbD+JMRyCWRZqGS7i/yDr1e7S+TfmnWJxQ1SSTxf+SeC3M1OAToXM
AhWEtLclugqkFrVCbHuAQFw+q9aNe4cXUMvlkGZ7hroa9xoItuuWh2opkfymOhl+hE7vjYNWTuAm
0TZnd5EJQ+ErdKQucOWZwSywxzKjgAxglnDdISnrxshM7Bba0cJDpZqVJbHAD9mhWeNo+k07wm+b
+J8rpAJj2ozKajSPisS/P8BLyzQQ4rscC5Jn+ciOIV0rxk+ytw7GBPYqa/7zKCfspyt9NkzCugab
fuI2VRM2tGJ4RDOJPVedhpv7ql2MdZbWrtNt4b0kaPxceyB7PYdhNLCZFkvRJJcs+zecjYwmvzUq
GN5osZwRCEv/SBCeH83zmm73NuYsSGGuwsSZ60I9sN4vepYNdjiokvdNJIduwR4DHK/JoGglsdoy
mHwiIXYWE8j0fbx3fcxgjTPnoMGUu7MC2qiDFJqswd8qLRmqHbjZJfJvgyLuEa9brb+HOptSvuE8
/5squE/f3gnFI/ZgBBgFvEcHiocPcgmCXvQLVSA8t+6jTYpuHT2Jr2T2o30sKHef4s7T9vAARsoM
DFquZQpMTGoY0709i7d9s5RfA5n3xnSA4NZAiwUqkZXGkyPbPfkX+4qPnCBlA9pebbPimafqfgBN
MQhAVUE/wdOp/zymJNcQVGy2QldmrTeTShnVQo0YO+K/HrRbrZAAwxZtYwEPoOzBwPczcMvt2oTC
OIloEx5KNoheSOQq4J5UAWapdLlKBWqbaUJv2VZ0CKrPA93aWksbIhEOc2AdGyvkRz5b8hCiKGUL
V7NVHM0NAz0VsmVmbr3xYa6uL47GhSSbbIIDgka3I0tT6KDQ4iJvo8XCfOGAKGkHosLgwiObicSx
J7ZGRovR6AfdUl5ed0a3hDrkfpTPGGdzBwvvhsX7YF+jiArjAx3m/waTsZOH+iNs+RLxX32Y5yhM
1ta+mIBye7yVRuMi/jw75Lj1+7Hl3fzZUyL21Azj7iH4u6y2A2GNywsRZTv34QVhJf+TvhXZ2oRv
UFxoN/YimHI8XBt9gxBczGA5EQdoCfLyFvdZI09Fh4sgFglbxztfEjOVlYDvPV9QWtdkOcXA8+Ey
bxwO8HNwmeNCzyOn7wyi1oktzgWLLAJeYeWk5vXpEPxIt459e/fr1r4mie+Ma8rGZXc3tViFrQWk
skFxyIay6jSzQFdA0nsf/aQwsGfT4fjVePFR1Zw0DfBeRQ+dnAa31VIaVQoK0DDxWMjRge3x5ZTp
WO6EC3O2JyvCGqBm3ClzfxIh53PiVyMe93xXGwfqiueAiE+ptwXqfrDVM3RJbtqTLF5vihtfHUQT
oPcvuuW2w3B5Zx86toprg1G7FsabNJM27SuVpbH1D8qSsSAYwxYpqz3/FJHsLXPt3YETN4UfQJAk
qO71N3WNTKc3ogn+45YiuVNyVqjmtjqUNu7aVEvQZXKd/7J1DMO8gHRVeOY3TYsdUQfQjL4QFh5G
Ngrbq1vKmu+PFzWXpuU0qN/Zw9n8kaDgGL0st/WwiV4lIRpeWBLLKaARdyIcscSbwxrCROgtOR8n
dQBXupLNjKG88l15GDjtLHIPK6iRpiATwZ4Ah5eSRyC3T110t0LQha1SROb4hJNIAQsYiWp2L8Uw
eT6+GDL58I3W/6+VNXUH8wD2rTKHiRqXWbn/8381bilfIIJTdUf8QvJ2EROC9h0HhiIR5/WfTX0a
CqK2gKcpmu6aO/f67LctpYblkX2igh6nFNuGZTbeNZQkM3HkDyQeqegOr4suoO8v9s16nEmZsllJ
LDLOFqKEIt0cInSc0Z+SyaQizTK2c+FU7LOx0hi2ZmqcQf8oxmoTPDG64akQOWBTyqGdcaqZoETQ
xmTOyk0Kt/IVHWaqqHB07OQrgTzp4QOSUjEdAE4/614vwG9XeCHJ8yfjgkSifQQs6A7Fpm6fZSJa
YQNXt1ZY9FagGik2lr+1vPjuph4UY9rfzPFEEwvrZllIfQMPj16MjbVcCIgCYa1pgFc4SvCreWP6
OJVXOrOb9XJCvQnW/iRqqAtYtS2iMtTTc8NLYZ+2kw5HUlgGEMcc++bJmlLi1kajw8Ik5ThTfE5o
AMQ2m8M9bA2NxwFmWijb+++cJ3wQnvKtpPpTCxV66AmATigWNSqZY4K8hb99EsxCmvTu0adx8ajj
W2CO42ckgPjmIfQjRS655aW6ph1aYeNVQsHFmVyY/eaa20a2uB6n6TMyMAkTF2ICcLxLxho9qX99
CSjAJE66XDL4w20BP4STjjqcB78WYYdxWpOfS6FwyoEEYrna5yjaX7kLAAsYMPrxmTqfGcN90Ieh
qSx1xPtxRdDikWhriwZrLJtcce7PWQqQQmg7GlGVzjLCaImzkaJ2Tp9ixQ65Hyaw+63pA/PMZr+3
hG14ODibL/OE7GkEivNx0XI8fGPYS3nrAUKXcRNuu3nCJ9pBgn61qKcxFEcvA1w5cSGnR4HWK1Qw
qas8MoVV29zsXhfR4tpPYIAls/iQiBG4xlDzzeylV8CBGweU6OknZLZpuM2YPaPVIknAV37LzvFo
sfCA0SPZ2RJmJVBih1BQWnr7xU82EKmd7IfX/zD6/k4hlXUHMxQVBAGDLk8jxlKDf/aabNKp60Hn
FqmjBdy1lhCXll2QG/E3nleC7sRcOVgtYIBnEmStDIXpB/N6WUHJnk84p5yVIUjy0Iux/+luuCrD
A0+avdtp00CM7UCUDQStW8B+rNkKDaNy3w9jZgVUrzbyBHSEqGc/mVBpcpukMz/DEU0L3BZGb0yl
LUg4vc5b98qe3SkQslGjEhM8DwCxO9wXlJ70HGGC7l2csbIxlN6jlpXHNvow77Rsrzwcg+jKQGbo
wmBrvM75yEqEz7mow0lSJZxnKpQ6qCp8TRpSJ+qMd962+5IqZFjve96rRJK0pWYrrS7L6BexvSMi
79YAlQGUYGw/bSH/8rtQANE9K7mJR3xsgmUtz9/3ROk2/BViABHAjh4JAmxnsq/hxrShIKhQjPiu
Vp39949J1wa3CLMpeysvP2HRyWNSg/v6jH05webwfk3sTgjO9L9jaU0DrgwYKDw19CU7Kuf8Zreu
bNimfHbHxHbZhUwQq2eSohOWJxUx4qQNhvz3eulD0yqSmGPUbFI9o/4ov8g8f7aCO/xDiRsYcFZl
6qpgzxLIhqK+MRFxTWIFvHY8SE3wETCY7UJT45wjNQEbLIwrVXvIegUbBSR0Ja3l4/j8+RO2hiI2
7ck2nETbfdJifzwM190o7U81uzasXH7GajJHe0+S7ot5En5FMKYur68p5C4NPs528VB/4clclBwD
OUf6m7jLIa4feJwBCxi/Y0LDrSWkOACNsES05NYLADY5Fx5zU5SeR2DszyEyNTHA2rGJOpUYvCUL
pD9JHuX6Bl0c+G6vm7tbDmikLX5EXckZuKKnGZI50udrBixHl9u8+J0zMyx3PeNlwUiX6N9W97ag
jns2AUwmtKIdMkM3ogirHER3tU+7eYhWQ7wl2Evc3AZ0DAC3969mCc9LOoPPa8NJVB15rcn3ZaE4
7iTGnfGw5bB9HWIpXj1QDijWfUQ9oSO8c8zyyITlJfYchlmbZo8x3OGFGLX2lmCh5Wo252uNVKHN
7w4NyDFnoxRhWp4V/it7QF+vgEBSVFv3CqrE
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
