// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Tue Mar  3 15:35:51 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ smac_xbip_multadd_0_0_sim_netlist.v
// Design      : smac_xbip_multadd_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "smac_xbip_multadd_0_0,xbip_multadd_v3_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN smac_clk_0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 5} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 5}" *) output [4:0]P;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 48} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} DATA_WIDTH 48}" *) output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [4:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "4" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_multadd_v3_0_15 U0
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "-1" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "4" *) 
(* C_OUT_HIGH = "4" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_multadd_v3_0_15
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    PCIN,
    SUBTRACT,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input [3:0]A;
  input [3:0]B;
  input [3:0]C;
  input [47:0]PCIN;
  input SUBTRACT;
  output [4:0]P;
  output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [4:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "4" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_multadd_v3_0_15_viv i_synth
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
SzSecelD6f7LmkryJTwYZaIAS5S0sQmdCutNOKt9Q4f3TfI4nKuaylF8K8IzM3AWFQynyXEhGT1P
KoSsQnB0Ng==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Om7W5npTdDGPn5rJcTLqk2yMupu7TOhcujk5CMD/VPts5d9Si49YmFlV4oTJGGvYm3jZSe9p4VCr
FafDzyEmpR2xbtsu62M6tjVwacoAQWqOHqfrno6N1ZjOKYO432H8auoFcQZQ3xQcy7ZJsiLnYCwP
mCz9/O+odErXMBMcPw4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mwamp6rhU5u3QyE2cN2AcDE8SqH698UN0LR/AjaVZGEONr/nYNXFglQIVdSfwWUyVN7k+GrSa8NU
v0fo0LnP16qFXLxaCuVnYy4eqHlNoGlE6/Scr5L1MA0wwGVPvSb0YazgXAmhfeam1C44Mlf7uetZ
jpGb5yzUkAPqrmBdnS773Fp2bu5Y3gRPun0ohwRwHPkv1l6/g6qQNvYoL9axqDHs+P3nFjXl6VSx
6zrh1IjAosIouRbs3UbJXbj5CZM9qbuFEkiC645kWPvYWRNxbIg0nvJrtG4agKxl/cp1iwaKHr/i
dZeE56fW5PIhbBrTRWGCQjo4+l5xywPCtdYegg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L7lYzhw+r7nb7cOX28Eytd1anu4DMCUwjrhQaEgcr7/T0n8QUVaan6Fr7WQvFDedIFq4XuBDKhOA
kIo6b05GFlN3ZRc8eCYhbePHFV5c18TofK9NPm02UNIY4WgRxIy7I7TSj53SyeXWBOTow4JJoTDs
S3Q5tU7pUKEUbcs2WNR/pycss3Sny1atkHqahyu6NA/ILs9el+c2P+bvL2Q10nj9WPGELNZSPsmw
E/+XBN8oZccQuaBvbY/q0mAZE/Yw2TzvcurVJL9jZWdVFJxOYkHt1KIOKMxZuLgg+aCHO04SMmtA
70VcXPXe0VKxf7OxDsyL3k6HcooS+k/ylAjM3A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RVrM0WJjwvJPp2A1BBLI9ExIZKJlykA97DJn/U3JtmM5BcuORiNwmDgiJhwiPtKULRkW6QJmKiYs
FTFb0t6FCd9BnaPvC4gvDwFim6gHgoMcmHySSpyyy3rteYOsYnkjcs0tjEKItPV9+yzkPx1a+fAA
m5jYv0V46niHxHh8rSZSXoq2hAvOJeuWDxpr4ko3+tiz1VhWBjFIHLzEz+raaw0nMitUJIED1h7R
kPx2hSHO6jnsia46ABL1Ixuf+AQ7UXZ6f2yoDQdo6AfRmpYgIIc3mmjcRfoYRbgkiFGpwYbQCv+I
5vHKZDjhW16cG1kBH0WtHZOdNLY2Odip4l3qig==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
FoQveUWOC83S8UPpluGsTYrLvYhiSMgKuZgP6j2C8ecIT+YpF2vaka4jqh84uUOzaMRZ78SBAB/E
EWDiyAt9l7GjLJm8w89C2Ca9YfHjU00l6kMWrT8Olk5WdgsBZizeT3lY71WQJB6zYo2If5tkJRXV
VzpnE0YejFBjp7L7UTk=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F5wSzisUZZWcIyLjjZYP53S2M4XLAfxlRaBRF//m5y944mV+HeZ6kxDrZCFlneaAHH+gSpF3a9mI
RGmr4hjfhgNrXMwpdLwhKZc/rtUndjoFH6G/GpDVVrJYDpNXA4SSAQp7Bc8V4G4679yxQ2VcyDBG
xUeDpTk+jN1kNI/4MMY/7R4ZBQGuMwBDUz5udteD2m0ut8fFwFkcFVUACdVvIedzNrqcdT4ja7Uj
iCbADUyFHyaNXcoclOuDDNsG6M/tyLpRtU2mwcrg5jBrVo2sb/hE3/jcHuv8Es+pE6FAn8eW6Yrg
4vKjZYhMYVAqkToYafH+DfoDXBWvSU+VbocFJQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WmemOUSRIDoY64LsNltKtFBvehZAbjPMFuEy81UdBMy5cJ5tCuOzlztMxMJbfgw5KTyCUUVvTdWE
lo9iXn8XRcHsvG/kwF+mPOHD+f6L5A0jDMWh/FKRhw8dW3aJg3ovYsy3FrStCwgHprOt12Gw4oQe
YjvMBSSHkGNaDkeVyqtq/Y7AfXIGy2r3+HNTJzzIfKiCkb6o9ZAvQZGAdXofKIrKdRRFz39k0h2c
NlCOIVi62HjYniIq/zhvrmGfviIa+oU+FYa57/NYHbDg9zo15VZ+cViPgoUDtjNy9LmvmjN+8wyP
8bENbFnrPMct4TTPIgsH8+drT9Ylur8gODb5MA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fuFHg6csPxUtV0Hv1BodKLbxvhIvkciBOGxBkZSI2p8wwl+Pu90hBhl1BhKhFbrpzJVg29vYBmK1
9JhIYjopNZayN7K+bN9ehAbqQSPbAcdhVPa2YB7JxxLY0g8kj9B1Bs3Q9ZcUOPPpjnP0pQuF6IjY
7Ub+8j4nZtHng+43FrROx3+7XDZVZdTMCQXdmauxnlqr2jll9RaxxqjixuROCPd2X7mb6HsOIZKr
N/bg78F7SCnAK1qTmAxEXwvjD8Zzei9LD/npPSmbprZ4kVu3RXgOnLm/3DAmBEAMUDOoNXkAEcWM
7mLM9PJVAkydhXZtNHz0BxJgusNkBrg69EmWDA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
3c1774+a6ZW9eKnJa5A2gk0GbEgkITcwwlMokSxnL0dGTzzoDNcCzn0X/OSOH3B2LVX3zM1KeoqC
om7XfVtALmgNQQnuPqN1ATkNjAUXGQwwtLnxodyzXQIV/TiSOtS8r2Q3dMIE3WlmlPkpIQr/cK/R
MbnRSy9onnPHD9C7KFYoD9OmiyXRitBGB/2qHdnEheLj6dkntkA12mHzJ61W1yhyNi70lqXazXOP
9kG+2mTb5K6GiZh+5xwmZzQvVpn5oP1tp0T1Aq8PKxjYqodmsiSXToSbjFBf+f4b/sWS8hWj7TQo
IN5HNtY1t+AVh9M9vhxwDClzXDH4APgREdMmQg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11184)
`pragma protect data_block
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
7Gf1lXWYHy+rEvHc
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
