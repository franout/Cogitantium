// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Wed Mar  4 14:49:49 2020
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
(* C_OUT_HIGH = "3" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
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
VpJteN10M0/toUjb7KL1ofpiOEhyHqIAKUtw1bQMynONIXIXlzTgndo5PRGA+mNkb+cH+y0P6TJD
jcJPzLbOyv5moYg5peQTsaloLXqY+5kyC50g1A2hh5mTwf06/S60Io/FBhr+PVJ9qsP6fUmeQft9
h2RR1+GnW3mIUcHKMST7CAwdJeCgBrFtyZHSnUI0fPLl5bfm8NUBbLT3pthM6r89vPUOPaC8yFFg
mqH3tP5RIgdtI082VK+CJAwlTfAAHHFomYnLwggD3YhnRLcsBj8IbjjmCUkP4UPZSKTztGjdrFHC
S5qwAzTPkWXIGveIiEL8JAAqX8J9+U+Af1v4Sw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nN4sc0Gz7sVvHHNXjgTXxy1mBczW4YgiYyTqvw1gpjlUsFnBcHfsvepTIZ1qzD/hNkWQrXvi+yQa
eCqbRl3119KnTCG0x/p6NUY/xDYBWNLYPYVpwKo6U7vrF+c6I/N06AKW3HKxpwG3zXfnE9FeQZtS
IGIV+b7KpCXnhCTJX4VTq7PYkJYsi/jrUrsoZzWhilxOsw+j7/wSQ9LiW7boRLH6pXpCMd7IiVVu
zRNMwnZMZdtDtzbN6Tu65AsWNznBjD9aYcsSEWQoNAGkFpHJ/2LGFMdy7QpsxBK8QCS9EqtMbKws
5kvPPMSB1HYH0TDoBWmFVDj5Sg4P5WUY9AJ4pA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11360)
`pragma protect data_block
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
lZpTx69SO82WxBWzNjnOjXc=
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
