// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Fri Mar  6 19:34:08 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    B,
    CE,
    SCLR,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;

  wire [3:0]A;
  wire [3:0]B;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire SCLR;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "4" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "3" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [3:0]A;
  input [3:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [3:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [3:0]A;
  wire [3:0]B;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire SCLR;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
T6NLm7q5PluSbvLo/vRV3EPZO8CWK8dMbm9VLfdzLe2xUvOGWBbzPoMbz5epEsB8c1F59+1k/nFJ
xTa+vqHnfQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
d4I/M9ck6JPxAfWj9MVD8CXXq3IOU178dw4Vy9P59mAHmZ1H5QMVK2YrsBH9Mj0fOXk/4IovpcSY
JkNhdtFGkMepsx43G6odN7ZbZlHctdl9qVYL6Rw0k3dc7yw4cKjSKywkQS1JIq6CGlkhYR7PZ25C
Bxg4ws1nXRkDT56ubLk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
AKjliawu+uMUweV1x+aDDRnXPmx0n28qR6ru12BgyvLEOvn3E+u/vhcfnbwgYG38LdF4Kb6cjUnf
tD8dgKBQrMPwCJkDD9/bLdL6pnSv9QjwY1qr9nRwWA8GlZkQXJRCySBEv2zQyJQYWxo+fyL5qofx
IAuauj45P0O3pwtwKiZ9ITiTdh7Kc1a+OeOp9SwrI5oUTyvffp52aOLPdzVkXRmuSXCZWavwMbyS
6pgsS4j8b5GgBpdCFPvxlhA7VR6hOGrdLnBMbEtMkknU3N8VGlGJ5nYfR7caMaCQrAKyx/ulixs9
Po9f5vYPsgsqSQnTUTY2UwFgUDWLRdvSLE8bXw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
OLlgboZxsWp33ysT9gGBWznaXfE45zD51JGRJ/PqXZRomwu8DnvCXSLpVCzReDLegtbRfY6N56Sj
1JgN0sg3SvM/YFw77TeOiBoP77Am6jqPJlL4n8P3qckQwnvZwPUNdBK/a+AdSNg7O0RnvYWY10gP
mo/FlnOJc79Rm7JLTWdKZxijtAuC5astZFaOyCRlUw24S1FX637DC8l9i43Cry/n+s2SqE4/oF1p
eKCPPYzgcvozR9yfQakaj/O3Z0dyrKNoOTomNpt9MCkpLl3OS/zxeLyXDx5VyIMoia2e8Yny7SAR
yL/XwWl6RB4lN1/EL7gmWNbGNoqFyvsR/8vXfQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
diXRMuapoEH9WPieuk/05uiVYLDJQb3EuM0eaIhg3E1tkBUlBX+hZRBqBLEL0N/3GY9ZOiqVpbiE
ackIC7iymOUelyxAKk0Q8rflKEZdq9CbGY5xv2Kv+lHF7JJjNSDTYUN4k4EMKcpY7xaxXDgiu4NA
BHGzgWvN2kKhPpVoifDnnoknX92UGXCZjcXCGdYZulS56iL5Cqa0+k7IB4n0vpV5M4uYV+4GAmi1
I7HKOx7mrhJkDH6uzpgzJ5chUD9UYHJnaUFaV11aLL1mmfz7Yl3yM3eJfwMfUt+DHZAJZ+tX1/Ds
7cTc0ry69I82Kpo3WhgbPC+WV66Zz+JUP/Ikwg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
iRXkYk7x/WAjhgGYwtNPN2yR3h8zFSpXbYXv00FEl7wK1myDbcd3XJEmg19xPW4qgtsiMD3hQPuR
7L+mBY0KiMkF4ckYOuAgredCMtedGcP4yaKhpsuSe+gYUQgtzPq/rBNTYteHkUtxu6PTPSapt5M0
xMeVekT53HLGyoQwjCU=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q3RfBWK/qZU9a8RspOPRerwpHj464DMbrCC1dRe0Z6shOgtGMaZ5OVqfxf6GIHMI1SysSGAMPhyk
SvIHtrnw9ExCewhQSi2FuRIIEpTQ5FVffPQphhZO+qE0t5whcm6e2SvOSLH/fDuIGbrWe7vCfxLe
hOXpaqZWmul2Fs7JlbrbizRjDPJa2cV6KHSeKhaEjkNPeKAJX8LWYU6o79H2S/UWs2NAPxdC1yAf
tY9sELbNaKPmRjjxfp6LOwIV7pexetErdZvzPnJwG7rZzBRYhupQ48w3bdmYq9NIGcgTU9SGoI8s
Am4MJth/i4oo6LgfOjdgCniw9rjPysNMVZ0isA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L5h0BM/jH8EoBw22fEWjc6BlUOfyn2+JxL4YZymLh1RE/ScH2jZFGn2RRsBftRvum8b+2b+0TZz6
hc8Z7Esj86LmXif5rwsEL/VTTRXX5tNVKt50EwOcW0jY+gDhFBGHAK/Rr7HY1P2FY7M2bDB2kwRM
Xkpo+uc9km+leX8qCb18yPFKUGWZ+rJc68NI5oaMu9O3cAMXCrVwPkw7MZXfj0VecdZ14DKtr2zZ
TrdxMcuvVHa1umCB+GLcnq/Ipg8bRJBBSjcQzRxxjgmC9tA2bsaJZa2RHYI7Fg333rh5WoD0oi9t
oHlR70eOIdjxjGwv+FUGtFENyngd2+rIcexUCQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U1bqh0CnZWiTgdssVV+Jjv37oC0bzVpPswxYl5hPN2KKB3ptpXRwe5AdcedZ/+aQ24Sl5D5cgldC
FFqYmVLMDW1alYXENs/Ew6rCUPeiM4RpSgdOFON84UpC3lCQddh7GOFcCxjt4DwEhhuxfys+5ydY
cJW/9qht7fVauQEbw68NTlD5UuN2BrqtR2cWQVdC+bWNHZ+y66mFA6LVcm9LdndmtNjsORhT2Vqi
xyZOuKTZLxCYdEot2wq2OU1jW7zmRsq8m1CGV3MnKrp4ftoAarCskxk2YqeEXST2Yv6tAbIO2wmz
bZ3uyuE4AFKPUA0CcszQlPy7UnuChpzywi8ciw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
C1wV09UBC2U3LDZg0m8fCe1bfk08cy+irzU01pRJ6o/sjJQV6ZU9jJt1pb6sbk2jMazLSwjGzfuy
UcXPWl+OnUIN/dUy4u7q85mCafACu3HYuOwEp4AW2reCDn2+WDCTJvB5cdYgjsydUELZ6wOf6VUW
HhvOIq8fX3wQ7VknG0bddYb5QfJlbLRSnO/0LmuP3QUkgJta49K1KFbD2Yc24vbsSMC4G6gER3X5
7dafOh5Kz4KSzG0qIWLWdL5xEV9XiK1cdeRTN+6cF4JwtU/4ABl7d55mYr1QZEK/862OzMj+r+6o
0awSVwEUVDN2ZE/Yqd1pgxitTO/dLVQ6AaZTeQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7808)
`pragma protect data_block
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
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
