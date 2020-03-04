// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Tue Mar  3 18:39:47 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vivado_mac_sim_netlist.v
// Design      : vivado_mac
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [4:0]P;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

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
  (* C_CE_OVERRIDES_SCLR = "1" *) 
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
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "1" *) 
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
  (* C_CE_OVERRIDES_SCLR = "1" *) 
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
c+wEWAD+Mx903BpH6vYQTFgJ9ONmDwmpqeNB6jmhlFATqlDwwPs0aLsQjxScksD0uZjaP2oU2Vh1
SCVoAC5HplB525lAcND89abDpomQjlR/BSfAd3bXODEIumV21jhSE78ogpzNqgBrpLtW741AhenF
UQ6cFp54CMWNQ4o1D8qk9uKUSAyo28DDoN2d4ZnVB6xxuZm8ijgu/vigHQsHdKmmNLlx8f8QS3c9
yLiihAEArW7EmA4Sq1z7zI+D/szdtoCcKqCA6Frm7BLbg8yi8YAczhULn10ifQv3JHn4pODP3+0x
Eb52L5gQ9g3pROM0yqgxkstjyHeODW1RK0b90Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
G+KvZGko3QJsF1kd2/O/vZUgU9G6nJSbgpoD3CXl/zblR6xgl1jBGcBcqDV/yM+M3sMFRR5FlH0z
nkDWLpfp9n2pezrUIfaLwxtQWN6KZ1iCV8x/Q09BoxMLtd1QWPVXWbh2bxmM1w+thuyTBL0zJ/qs
YfF/v8xYy2xFxP98+42EG82lYN+G0svrlE1X+ydhfpANMVarUrdBsLRhcbPgjA+cmoukEyHt6fh9
Yzid9qg785Z5+N+LKoToiXm/eiRbPVtXMhRn2TYMBQWWYRnXI4R1K7XLck3VNm2vVGctFbingsQk
ci2o2SCcFg2HGWI2LwuXApC2s14eF4XLhSBEmA==

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
