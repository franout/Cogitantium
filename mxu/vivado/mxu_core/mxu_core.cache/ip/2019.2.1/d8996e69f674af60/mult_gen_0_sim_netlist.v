// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Tue Mar  3 11:45:42 2020
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
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [1:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [1:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [2:0]P;

  wire [1:0]A;
  wire [1:0]B;
  wire CLK;
  wire [2:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "2" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "2" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "2" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "2" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "2" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "0" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "2" *) 
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
  input [1:0]A;
  input [1:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [2:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [1:0]A;
  wire [1:0]B;
  wire CLK;
  wire [2:0]P;
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
  (* C_A_WIDTH = "2" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "2" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "2" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
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
IlIva3P73LIm9MlZFanfB03nx9DgvISv6XhcoCKr+CCwV/QZUNEd6VwbJKldWPzkv7Vd4wx3Mlda
eFz3y1x2ilGXT55/TfrKmmESIkiG3W6bL7wx3m3SDNJiGWMAOnmjJsqMWVZc9+1sMZWFamMEujVb
cK6F/UXBaJ9lF+7OTEfxhjJg9pMRP/Mie6PB+ZHo7B1vXMGf5XRjQo3XewLk32h0KUQop8RCxKzp
dhxiNbxsOEf9+Ge9JAnNSX6BKvtLQKpdg2b3Q63SuxtuK6mP7OhpEGkpCcLExNA/hllChZIYRyuU
z1L/YDfa9U1/1n8AiEL0ISQ1v5ebQYTiXB5jTQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U6kyFj3zC3qxXhCyohswf9K9G3xHHorrOixJ2dwpMVXV8j1A7Ki99jkZ48Ct+9OlWzto65v4J4ep
lnN7ZyiMBKcvkR2LzwYZKfGFsg99GG0+p7lWr2TeDiadBk8H9oLEkG5elX2E2mbpl1piPJqQYLsa
uzFKoxUAn/jn3tC7x5+t/7rvkoqiexTapw7l9SBjXCVN3pP7daR/96Y8v8g5IDElaYdsl3oqIBH7
YOgYZiP8v6yIv2cQ4R0ZWNjrPjfj+J3n+ucuhDUOUCjQp8kDu7cKIpkZR/7MSk+jq7DewuGvgHMh
t89tnYGnyG1k0YY+MvrU5nMo9/jQHg5J0WDSSQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6464)
`pragma protect data_block
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
mKnL12HmGb5VpZoqziK5GTHZb3hUaVI=
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
