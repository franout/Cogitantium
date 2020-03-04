// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Tue Mar  3 12:03:11 2020
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [7:0]P;

  wire [3:0]A;
  wire [3:0]B;
  wire CE;
  wire CLK;
  wire [7:0]P;
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
  (* C_OUT_HIGH = "7" *) 
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
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "7" *) 
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
  output [7:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [3:0]A;
  wire [3:0]B;
  wire CE;
  wire CLK;
  wire [7:0]P;
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
  (* C_OUT_HIGH = "7" *) 
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
jB2yMVdby7mAH0vYgYVKp5SitxhIqXcW7VU/Qml9+S2+2Yplxr+7Qn3JvuItdm4R5zlVg36SIR2H
7KGJAcsi6CAze6XY3hiNZ42qGD/tlpESOvaxagD7DKapdbDJEW84Vx+UE5QACbxluqqZtO0ndNok
EJPdLwAgqhP7JZn7NIQ4bVgZaY1W1mwulHTfFBwfChxRKp3D8FJTsyLL2XEUGw9DDt5O4brUrAug
kh/tQpNi/kGvzPj8HNJ+5pUrrqBdBy1o7fsdguoBnTRnARvcijwS43ve2r9vINfZZjQkc5QMe7iX
blPWJw745SxUmDaRklzksuFh5DxH4QP/PGDN4g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
thacOcqJm0aQDJ1B7Q2SEC3YpS0FfjTraPeEdkhTsw5KWxxjwdj86wfbbOxktACQjU3o0A7K5N0j
x1PzSr27mZzQf4KHX8URJ3d2P0C9YZNiBcR/sxFtNZ13MIfky7b/jUbjO7bv8w8U5g0FrkrtWb8d
Jyacqw9VwBPWp/P7MGncYf9p7yrR+12B503VosjoOfPka4p3I2EzlUKeMkU9jPsujZcxqH4O0Hbo
QaF0etA6jKBBfZNgz5u6pGSZBB1/mVzJNSrbNuCXRY7W+BLo6I0nY7ke9G4ReFdIKhNBZtRXaGC8
qFqTuqJfc4ENQOiMNE7sbz3rSzKEB+MBPZcX8A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7472)
`pragma protect data_block
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
yLNHFT8=
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
