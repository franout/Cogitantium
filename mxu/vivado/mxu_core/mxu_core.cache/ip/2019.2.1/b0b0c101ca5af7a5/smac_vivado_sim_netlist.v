// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Tue Mar  3 16:41:55 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ smac_vivado_sim_netlist.v
// Design      : smac_vivado
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "smac_vivado,xbip_multadd_v3_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2.1" *) 
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [47:0]P;
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
  (* C_OUT_HIGH = "47" *) 
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
(* C_OUT_HIGH = "47" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
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
  output [47:0]P;
  output [47:0]PCOUT;

  wire [3:0]A;
  wire [3:0]B;
  wire [3:0]C;
  wire CE;
  wire CLK;
  wire [47:0]P;
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
  (* C_OUT_HIGH = "47" *) 
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
c0c3+rBIJWEMsQwRwk2nW+/0nhQ6cagPS/wvh/BtP+8Wj0NeFnlBJANQYqjiWAo+YnkhBiLjXI1L
ghvfa9nTVWoc+94nb7R7P5rOMswlVrJ9hPL4TaAy7NGTV08BlAUYJZqz+4LdH3HWppgIHMQPYahT
DHM9d4u6E7QxrkSkQCQmTno2o8YMsBW2hC2roca/FekkAqYOrXTFtMg5h2EuoRfRCWbKn+82FCIf
qRnnB9H6/EQ3oi2NJYgPqjdroyNnz3gVGYv3x9T1MvSrTr6EuVAk+HfanxlcciQF5zPtC7I5BhvU
eELRq7dHJb/Dx9+eBaF7ah0gG0msM97Y6jwO/A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
INwRlGP6YmvT348IjakOp7K3VDXIg70e+d9n936I4aLhOX9vNHLE8NAVAezzYNM4IoYWCqEOm5R2
Xi5hMx23r0+TC3LDNGejOaccXKCJBZUeDqpnxdrL36wmljtNDhpZtHoPjfhb1DFR2wrOk+Ztqo4k
EmJS7ZW+7N+6wG4dayYK83+eCsfU9mEaVCE9u4bB75fzQna7bYiE4akAMGvMo8+YECKtnAhcNOQc
mEebfSmeA5Bs6TGxoOPvDvhwcfJmltWed+3Jic/IlA2cS3KIkPj/Oq6TK3Joq7xJcdaQzzIfDdJz
qU9tTSjWHs6KqEP9l0GVuvyZ4auEPeX+xMUL1w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9392)
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
