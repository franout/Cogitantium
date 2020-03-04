// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Wed Mar  4 10:21:21 2020
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
ZYV0v0HbC4GNOtKqU7An1NJuAm8PAxtA8Ctc0aYcoNXm7hPLst3XSpFo+sBfROesf7hc/FQseZq6
c0RM4l2AAkpPCQuVoqbJ6Evb8GUYOtDcV/Z/zguquqhC7tqtprLqAF8e7doMthJraTulHVtg/8gp
D5S2qu3+fnapiDD/Kp9Tm8VrVIGXYTJ+BrcondbR7skzNjTXerUPMv5FLc1QjQOVn/f8egsgT88Z
2VfTts4NtUqlEy7LPpO9Y9YDYTbZbUtezuJyiiyZPfh1v7OL7oRq0pvL+SfyLOmzULSbfna8CFe4
GmtSj1LzZpdpyNeWWMvIx5NXRdulxVHmWCTYJQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KbxzL6eijSERfTUiyEJFoNWtNLHJsRYkA56DsBY8cCXEq74X6ofOS9qJsPtI3AiuFNc8c4NrYGJW
7XSb6NcAzycs+Ow3Wdo5xWLT7jYVvILZhbzih7mY6+u3GFwPjaoDao+JsaD7OMtRDUMb0vuikF9P
A2uefQ9pQ9GA99G1xY28gh5ZuLYOinMjkf4zfOjDp7rXHidCcbOyoQz1Nu8N4R2cMgjZXGz/OHZW
0riyV5u2qrR9CUxi7wHm8LhSixx44vmT7fYQkVYHztPYoBh9F7kgVxqHwbYL8QHR/4toLAhUaQst
q5KP8ugEylBgnx4QQP5PedsRi6cJam3kNiUdWg==

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
