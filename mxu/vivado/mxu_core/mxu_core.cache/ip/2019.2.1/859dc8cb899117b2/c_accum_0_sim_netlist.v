// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Tue Mar  3 10:51:32 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ c_accum_0_sim_netlist.v
// Design      : c_accum_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_accum_0,c_accum_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_accum_v12_0_14,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (B,
    CLK,
    C_IN,
    BYPASS,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_in_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_in_intf, LAYERED_METADATA undef" *) input C_IN;
  (* x_interface_info = "xilinx.com:signal:data:1.0 bypass_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME bypass_intf, LAYERED_METADATA undef" *) input BYPASS;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [4:0]Q;

  wire [3:0]B;
  wire BYPASS;
  wire CLK;
  wire C_IN;
  wire [4:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_add_mode = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_width = "4" *) 
  (* c_bypass_low = "1" *) 
  (* c_has_bypass = "1" *) 
  (* c_has_c_in = "1" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "5" *) 
  (* c_scale = "0" *) 
  (* c_verbosity = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_accum_v12_0_14 U0
       (.ADD(1'b1),
        .B(B),
        .BYPASS(BYPASS),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(C_IN),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_BYPASS_LOW = "1" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "1" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "1" *) 
(* C_HAS_SCLR = "1" *) (* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_OUT_WIDTH = "5" *) 
(* C_SCALE = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_accum_v12_0_14
   (B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [3:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output [4:0]Q;

  wire [3:0]B;
  wire BYPASS;
  wire CLK;
  wire C_IN;
  wire [4:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_add_mode = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_width = "4" *) 
  (* c_bypass_low = "1" *) 
  (* c_has_bypass = "1" *) 
  (* c_has_c_in = "1" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "5" *) 
  (* c_scale = "0" *) 
  (* c_verbosity = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_accum_v12_0_14_viv i_synth
       (.ADD(1'b0),
        .B(B),
        .BYPASS(BYPASS),
        .CE(1'b0),
        .CLK(CLK),
        .C_IN(C_IN),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
HFXM4QpzOzpK/fVpfk62dyKPaY+M2q73y7kMST3Op30ot5NvOq0U6FCld24uN3mmdEOCB27hKTuZ
pvj74DeWqw==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hxkDFNzsdQeNRsfOnWUTHNFz19Fie2E9Ww6bJtv5S8Vni8wJTCDEWn/VYPY5k60HVYU07IHi/s/w
GjOwEwynUdlKjmKERxlFZ0a2Yjq3JWwUWc12cFxPSFvHMP9QfWTysUCHYJ+8/RIfZyEk46bmujim
y/VHufEI5ZXO4q4Gyqk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ONAndknOfQIk+swhizfY1gL0lm7OhwKPDqzujw7z99+5JAeSmYF0iR1qz5EwF7eMf5o+eBBTlTY2
NjtC+ofhlJj3YLY8Lkd9hce1iIgbgxAHpNhAV4hxZNKKlcUJL0kmwJ2sBl2MaOhu9WOIXP/gyXyN
CcPlRENgwlBbU1+C+1iGMMh/9KMne0a6VUr1gNN9QtCYdyQPFjA4dIq2FMmTQiiWUgkSyYCsCyDb
DVO79Ar9lZt0fdkJ6i5QqmM36MBOVzBWCBvI2axI5+7vCpi1BqmzIplWl5EiE4AsRQfOI2TBfUtP
yEOrYnZyYIKPzWZQlhtcVDoxbaFCeUvUpCviLA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TaVTZb7cDJPqyMly4kBtJvAOCbKPx/eKng+0R1rQMo2o8SuEfVFk/6j76zwZHlOWuJpku6UpfFwE
plsdbFjrNL1PGJMg4nWHYsQ6cpSFGCrzsH8ZoOcnNJ/VlLa73SPXwczEtdZv9OKf3HFgn9MY4CrQ
2EawARLqvq3NHrhdYvp5AacISwij7ZM2qAX68EevyoorF63lRK9KOcAGhxo76mjzzoSFtfSjmWx0
JTymJkTP942KbSf5k0lqAkiaLOdR7mQvwPS0A2G0q8VAgtqOsBEluF/6E8KYxtj+LL9wx3GGpsBf
QLjO+0YsgDaQXX9OmrJm8KCaDRkoDHcwWQIAhg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jM7OeRTJZ5wFD3zH4AZkUK7T+3O5+GGAiKbBdDc7gC2sdtjbLkypvsOJC7Uh9dgB1Wdz8Gav74SF
K0wImUoQx9TOwcwEZjzl61xYSVKhdG13ztjZ8/cWPFwmBpB2uXVcFQ2gClKmWpg0qtU9W5ChP0KM
r2p9sLxxsNlP8BNDQLwU1SF98kYKf5AYdncwY86TqtAes+iWDkfIwS1+XGps/Yx0i3oh3FMEbNph
RklthnIT0OsXxkuBWmFrHLjiJeEcVHJJPKi3uVXa5Jt9ePPqy5sJzhmC/XCqNXSinsA0SATkrtbI
zz/momgxCWatRufAGv/asXlnlfymv2nMCYTe6A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NcdUkKdbmEUn+isQuriWZl51sQWsKh1eUDZxUe6WX9WqSm+N/500JA4WaaBP0pn3NXrK7n7uDwmj
4Djz2LpdFbP0Ymu7AzHFHf0IWC04c1QzeMK0yoU/mqVN4ns9sRIO4XANEka5JEiWkWlEasGDu9CS
/fpSluQMMHBSDGFNwnQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PwjOwv5uT1gLFZv4b6gD9Wm9pGXWuC0z1+Q/cLO3k0wfMfEeMgqGcX2tv/sky4agZcCf67zXdL5F
GWKwiANORqW8Y2DRguQ0Rr7qMb/sYqzlgoL3bpKQrJqAnNpP4UkUcLJoP1VW0MZiCg6waiV6ZF74
FWYgMBG+F1nsIpwvonUgsrZSP5k6Qtsl2nRB76q3WgaErOtvbTjA5zBTZW6cnlzrVEZYwHTlkg1D
9yVDXO3GLl9pvSCZxZ0iZx//96llr6FVgBj2TyO9q8hSStpn5HYqbqW5wc+JckdlJSDIu0p3GOQv
QmkXkkyQUZZyLCv64ddhIyW/PlMrl8y+9JZdxQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DuKwWtfTc2231DZXJ7uNP4cs8aKKMQWlt1Awt+a34c059ayF0P/tGnVEz4RzW5YuqwA0stPh0RjZ
eymFc08m9+qmBp3LlDBX8sRG9Q5J0SUO5eSWq5INmZFy68iNV3qfASnllH2kmhn2c+RISQyCgwTQ
DLSKPTIA8mYf1LXNvgMSAgY8XPQzVZi605rtW3jrKC0Ii1EDJBMWb/dg3a2ZCnYhsP6wXzCwnS5m
iWh8NlR1MIg7WiDMQMLw6cKqzCzSFIcr7Vf4O8zrYzdHMVtFkdj0sd0HMDC1uZoGcA0LBhSyC4z8
QEYuE77Zn3nwg7Hgd2k0aT05f1z33qTNdNlxjA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FwLJPR3HXTY7wuBt2Nt4p5xoDg9Ce38r/AlC/KAF6ox3+oSOKdDJxcJmniyLTEmpcEohz3A+mTas
bKgxogkz2yuSjdep43BeD7lxLgxgl8Hw2RYztpQgvEwEdbRLh81fCC/i1qE9+wbzyGAHXzaRJM4p
wcLkqzECdw5X4stvT3T++AKPsk5CWuUsftdOphB2ednC/og+xjoLhtr6GjbP7LCT3KripzQSx0Rb
pHo8MWu9UjmLBudWRnbeFit26naHEbKGsn+9uAtk1ciAZYCn7mmyinOl22IvZWozRxQb1h0ZEYV0
Ny1I/Sa5/KOGhxwRW+h+AAv42uGXlX99JeDi0A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MWbq01aXvo6t6TkVBprUJKP6tl6l9M9RcZ9gRgN2tRBITlHnDaeEtMIzgrJSP19OycMey2zbCsy9
HCmKhrKrPmVe+dcYu83H6RWrnvyUmTIbUJX7J6iDHLkxf26WnKN/ijctWfdhXHxhiqt9aMkOdl/A
Y+BAn4btAFRgO587RjQEz2OHGBMhllXfIeJkN3CC/1lytQLThxFOI7IdYeWvm/aKhv35+OJiNlnz
1DIdAx37NzVyXeLtN1PyI8Yt0J2fFgKCBxF6vvbrvmRJ1U+z6VC3LyeRkjNaNa90VsG7QmsFX5bh
OKbQjT98Ku3JuSkGq6OyBJFMKwRj1ascUi7Jzw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8352)
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
