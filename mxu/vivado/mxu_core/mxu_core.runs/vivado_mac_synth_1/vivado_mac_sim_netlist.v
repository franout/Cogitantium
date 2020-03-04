// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Wed Mar  4 14:49:50 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/uni/2019-2020/thesis/cogitantium/mxu/vivado/mxu_core/mxu_core.runs/vivado_mac_synth_1/vivado_mac_sim_netlist.v
// Design      : vivado_mac
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module vivado_mac
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "1" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  vivado_mac_xbip_multadd_v3_0_15 U0
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
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "1" *) 
(* C_C_LATENCY = "-1" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "4" *) 
(* C_OUT_HIGH = "3" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* ORIG_REF_NAME = "xbip_multadd_v3_0_15" *) (* downgradeipidentifiedwarnings = "yes" *) 
module vivado_mac_xbip_multadd_v3_0_15
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
  output [3:0]P;
  output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [3:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CE_OVERRIDES_SCLR = "1" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "4" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  vivado_mac_xbip_multadd_v3_0_15_viv i_synth
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
dxjPmkwt/8j8G5yq5UJxa77oOdVYcxoBSks6FlZHySCALUW9mu0MVxRkeRYBT7Pbw14J9YV23oD6
7GVrp8Z9DWgrcEFMUDBgfIZQDHSNu+wlzON1dZM3+/w87lkYyW5cxZStatDzSXRY2qYyiZDEoVRC
FiR+odqe9L9waeFjaoNw7TCjV3Jhz9Rer6Q1jre3G4kt7Z5Abo76XWq/Kwa2BtFSEpsgBSTJnU2H
ZQsdMuYQ6K9H3uCOuwB/8aGzHDs2UvWYb8XOV7uL7cqyF2kHhTKdR0qrGwH6VdyZTO2KVAZAanRF
e/gN0dhBOZvJyQaTft23mkaKgKm7hX6DIX/Khw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YiSysNclOI3lX8mILvskdKPWdTkb8X4kbew/XgJcF0gqIY3DZKS3nZFg8Q2oL2N+XuBMVf6ASh2v
5OqKT1MT3cKSoiBlW3cura53rF4Eq1G7kX/jqPNZURzLf2mLdVRWjilhYf25/WA/heT2dnvvRPRr
eYa5ckBEM3mQOYxto9ZSbssy27QOKxsHwL2dyDbpsRNtwI1mQgoZX6d6bvjnfyjVeKlwznG+dePL
9ZyF7D9W8dnqwHwIiJ5mhHwjTfHAUNu3lEUNJAgFq3My2BLbCscp+Zi7x98frtj57rkRsUjFE5g6
D75Sr17Un9gtWcfJdsHymUGS4boKgGqkEUnoaw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11328)
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
