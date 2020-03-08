// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Fri Mar  6 20:09:17 2020
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
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
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
(* C_MULT_TYPE = "0" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "3" *) 
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
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
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
nNBFKideVB6YpUaMi3JFB3xndsmIjjSs91qvtkJctc2DFUsKmYjbVgitWfGIW5fVdSR+jhxmdcXi
OIlPGpBc1+P+UDUCfB68kvXkWBKY3As2IifNhnp6juUFow4RPymhAT2hBtxuqixrVIsFRLR7hsSi
1Ym7cFxZnbIqpOGU5Ufx5MnbL+LOXW/sKrQDepJfpCvUcS+H+pzejObhBfsc9TqdCdbQ0IJDOzfP
2YBEECnibLhX4ifTZzEs7JMKyn+1jVrBzqBkVZKGOj2VAlIxq4+n8HQjLUWNI2lGfaSJb/p5ZNmV
w1citCzQi5MN4IHc880mXhYlWcn7VzHJ464C7A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Wtrxl6Vd9VXRZTkITwtUmRWNzgbkV7SZRKfsUejYfBMjLGQL9rCpn8pQwApJGMZAwQGftAwT8AB+
IjDVDGzVqxfXYYuVoZ76s0kJyr0V5mE+Xz6JuGBLeoIEQ/lYN/9x5KM/Du1deuc3eH24+NDcIp5M
zovV66We9Z/cFIXcJDNvPA8GTwPjxptFmhhrQ5iKRjxy8aRC/9X+gG4ZiqMAdqKnXw8haeMIzq3a
TCIFsQE6mSNrnwdIOn/wDBgzAKjTVpmLF0jzABDSiJfubhWNDnyBD/hpp/PquBIhITdcg9ntNyVD
qm/JW42MttschOzf+JDk5qOCW3pmbIT9IRf77g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10768)
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
