// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Wed Mar  4 10:21:22 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/uni/2019-2020/thesis/cogitantium/mxu/vivado/mxu_core/mxu_core.runs/mult_gen_0_synth_1/mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module mult_gen_0
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
  mult_gen_0_mult_gen_v12_0_16 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "mult_gen_v12_0_16" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_0_mult_gen_v12_0_16
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
  mult_gen_0_mult_gen_v12_0_16_viv i_mult
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
Ptxrfyi7CeiPU6R7OuN5/FXhoGwkdw2yFSW0gNOCzTBjKCjIdGkuhDt2n1tXCqX6sNb72fw2Nxul
yamqXgmDDNE7XVnExQCIrXvObME6Mm8SUoWfo3nLy0k+fTZMSQAgBZ9rPheJZwn1sx7FnflL2qxg
62R8LXVSSnFXZ596KLLRn7jS9MAzW6WUY1tVMDsXYONjvM6M94rmaYfeUflMOUwp5O5icutMYh4w
3VRa8cIahuRuR41O7XCHzGHLjesDRifEfdK/W7PoD9Y9Kp2B6rFx9Bb0R8Ff0Ns/nqz5d0ZSJIZQ
JzIqKU9CP/eY+JnjcPK24PVP67X4YYkWT7WHow==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
60KAarqmtklQ1gGDCpad1I+CuDf6KJ4pVWB6p4QOqISEI1BNl6mkFhI+qAqmHjSeIvi/KFIgngBW
eH7wchpB6c6S6l+mP+MCWzwsqDcs3ZK2dxyrlX7wYmehp1GruLo9zTx6nX6vEeFezKf7U8xAX8aJ
GMr8mIjIfTcaFNUmeT6pia0e/6UrAlSfOKW2VWj8pgZylw6bTNYNIuw0iZ6xmT5rkEzmkVIcD3a5
ZkK/ZZPERV/UDcvlhvf2rDAf6gBeEj7i4f80VZqqWC4UcyymuABciTPsh7q4GW7pDivEgvDowLBe
WRXhn2xRD0xKUjLdljaCQDk6nJyFFcwSc7qIDQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7792)
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
