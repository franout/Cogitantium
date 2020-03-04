// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Tue Mar  3 11:24:59 2020
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
    CE,
    BYPASS,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_in_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_in_intf, LAYERED_METADATA undef" *) input C_IN;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 bypass_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME bypass_intf, LAYERED_METADATA undef" *) input BYPASS;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [4:0]Q;

  wire [3:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire C_IN;
  wire [4:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
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
        .CE(CE),
        .CLK(CLK),
        .C_IN(C_IN),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_BYPASS_LOW = "1" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "1" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "1" *) 
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
  wire CE;
  wire CLK;
  wire C_IN;
  wire [4:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
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
        .CE(CE),
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
O0ymsvEVV0QpwduNF1Q3blDHDoDbykeoUSGt6t7iMFRkbIO8JYBjSInYsTtXjzw5PfFByuRHCm5U
1Etfd9Sm5bHFGHxmZVkULrbZtWPMDi1btFslhzl6ADW0Rf0hahPyvhbAco1oJ6efcKYPFvxiVjmr
3YfjXu4pHgkG8DrjDYOsRALCyALb2L7ecJOxu65GAE9S5JZ2Cw38FaEuGkswbsV7bbDZ5nahQyTL
Bd7gnJMneAaJP3aTdbC5BepU6c+R4c+akgPlz6fdDIlxtVFX7lHLOHdj7lJM71Wvs0oh7LqxBSB8
VMtPNHvexudOYvlKSxako6s5Ml3fdvgumaQ/Eg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QqQ+xt69F3ph/J2F5HpzIuHwF15i5xYGE+k6dD+wN5ZYKA0bNTc2e0mZ4AM4e0HrM5i7rm1MY2d8
sp2IlcIlODgKCZICdldX0kLqDe1xGavGP6SkEBDuktr62qHTDcH7VL1LcdHCUW2vY49cz8Gn2jIl
3UUyEqandtT9GQOe+f55cGyT6uExzKBwaB0LFqL2DUzbWYJjjhXmudY1EX7DEDffrVyvf84oVG3F
x/mTYT61NtZPCvhxnnrgzEKnPdZa69Dw4N4F8W/ia7m4EAMDCOom17eO4Kb71Cev8zORh1imuzwW
AlNQkOahuK+h10W6TC2Sa/SO1eagEVoPH6/gUg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8848)
`pragma protect data_block
cX/9kfl+q5pIIU7+ypKcyBzwJws3FpqXQ7IgRMKqKlgL5ti+sVbWzHhxdrl2NzXuDR701RQobFuD
bp4z4wfIktQVJugRmBoJKI0pPrkyQTMZshYSWPAFpH+GvqePZNEvNPnm4i0+jYmRhra2OfUzysP1
IAWww5nMsNMg2I86sgADLYq8sFgBVB0ZelEDtY0XOl7HQrmsCPyDUXNgqiKt5S3kEgIgguyPcnG/
3cLAV7UaA00Tfc4ekEq869Ivj6dvVYVEmu0M00vn1QqoAMsamvKy1dkkgluzckcJ7zusSSFvw2tP
6xUFE+U7NmqHMq+LoFT2k5LnbG4LfYfqB/j9whnrsyev/haYPeL2RHpIA5TYwYOjGHRnVOHm5zoE
QS4G1V/hg5NQdcTYLyKJrQ/gBTYireuWgXNS/dOlKzdE5Wnx0I+vnwq8+Vp8hxtwZzsF6M0jjvs5
+qPb0axNhdHgGxCDC9wIX+4TsBs7E6GnvDMFClBV6/01vH7ilcCGNA6R7mWgvzeIN5YyikfC0t6V
uOOzlyySIz7OsBp2raYSliw5UZyuxDERBBzWv96Xd7HWP7N4qSakuwhRrLwtXbkNp/ag4wD9R0ow
WrWXQxdvBvJZOS4irsw6WDqc2bgQICEsoJ7lsxrMuGa4QX0hT053uwjqhK+zSu+UlvOmUy6j2FRX
oG2U96XvhxIlW9PF592e3fl5p1slZBEj/PKgJJcMJ0K9Ii+q9SinkVSTRyBex6scOpe+o+FRhf2p
PJFfi+9pr68OoyZ4QlQlvuP/RHAC4sb81/F1xx6lasUI0/VZvqNfRH/N8ZBLlV36ZNoWxZj/zH1E
XkffYm+Jj3vlnvzUkOj9wNM9eBW5XNyZUhe1ytqaAAzAXdXo7ECZLIwGFJsdetpseoV7CBvy+UYS
zZP6blBnKEWxct5bqi7DmLxQp9+6WVmoSmJjakZcPwDjdAPo8NOT1nYzIWNjgNbo3hkZm2uyELTm
dd0Ta76MIb4aJQpAbfzwOsolHwc57IY/XChDKQI6JLL5NkBAyKT7WITHH5SlyV2yXU4scHXDJKwi
V6D4wxbkMWJEDeWLpO6ejhwbtDP4gcqvKj22PA9nhPoBFT05gt+IGZKvD8rGf/uKS4yv+B3RXEgS
HUrSTE9XRce5YPdz+q7x/yoygxMTBP9mE2u19dcvCNWa0s5W1AwB6WoJCVHuR132ODRpOxtado+7
q4w8B2Ihg48fdM2jgq75por1i+jIQbQrCrQmE/rQERhstyFmybSl0UPx0FIs9rHfK2I5ymryvSON
hh0T8QN4OsGXl+fiInqw84VsLmhESme3jG8nojp7vKlOfDyy7PAvDDp+pw/DRWZ33AOZsj6nzN+E
yINNb967HubG0HYRtbCVemJFKa9qvswn2PTS2Sg1wIT0AUjyyror3MqJm1xtUqXKvBNDMqlzVTAq
ntSU0mxPiRYgDlh4nE+32DbdHLvHZb3n3arTzCQ6mgIrxnz3pIQxnyHyp9QdyFQQp/v/1cvFJHCa
QEEKzAczZj2xZBsQ+Y3usoW9HZxZBQJoUABf7WOPtWy4O69lJu8RacSZTFwU6GVFm8MTTn5t7eVR
SuoIubaQ4czErPBhDnKKNzPQVx95y+VxnuhtQKTagOw/SBD6mmdC19TJ1TMgA2TB9w3Sxkwa8W8J
Lv1ovIH+T9LHyJbxEf+sB7Kg1hWdPglWkGnRwh2nM1m3W6aeHdvaM7sBelkue2Ot5Bwf7+dUaDur
D33/gHMIAoDig6EBQSaROTLY/Nrn1+0Xahh3GhDgGaH9ooCpzWDsRxu5n8+XvgLjG2Uylr5ORmEk
NQ6qPko2wGoGyzM2czaNgFPjRC+6SH18anEW10HgceNEkYAkyg4D3pASqkFdgNU9BeX09i+92PXg
6WdIfg/ixbTuRMgwm1WvO8mGx7NLMq4mNZk9QOhxy39z2KCSZQO3hgirPgGMnIvdnQz63mjwLxtk
StKnzD1e+g+QMDeqgbui6jMLzXRUhv6YkAQcWV3GtmepHTtDiqKMrvlDIxzr28D0fCvkThZTqsUp
CgqWd6OZ8QtwIpDXpRUjqD5uBME8g9nyshoq7oUCK/SKYNw53iy6rT+R5QMY9mw6Dl5Z/SiFjplk
yh65GzTU82qk89/tHGnojVgDnY/Soy0bWOwn3dgs0aD8fFZJZUtJ/Rou5UviJbCmiUDhwWZdQqgt
htAhd7xbTePdZvu43bQFCJ71Rat2i6rJi1KC1sjViRUZ5qf5l0LDDrccmF3Pv/6oTD/jmtvLwvMV
S2rSksDgWIXaFsIB7R0hyf/HqhB15CVuHLIq7yVkvyOlOTCbb04Ynq82PD4/WLT3fc0sgSZDQcAa
1lI3xYfWsaZrXz0Jq87CTneCiQ4irHOHTc0/Tb+MFKWqAPWypn3YwYWa2uSmk3/HSeXAj6Tjit2b
dxnpKMwwOJGpuj7lKK1AHVdGxb9/hEu+7RDXo3/lXF1sPHMWExw0Jbhj8pTjYPEUhWGC39Dfcvao
wOZo6NIKDqzyG25pKX1LVnmjlCyu0uNWXnQVcjDvqZl6t2Guz+VdTNfCDl+nVVWvwqzV59VZe3F/
e367g9z7Xq1WASH+5wgmwLmZCnpEankQS6jJE1a1dmWKeVWK+AiUdclAQ/Wjb3lt9dNf23B1Di1J
5ykcg7lSxQYWmN6T2SHxKg+CD1AMHFRu46YHnYP8Ha/IGxdI6vTTw2Ar8q6ghh1VPCEfW/ocKNA3
ISflo3vejoquU3Hif/9f89BJMAx3tWACsJUqSwCp5evY8KWZ8hLzcTXP4/0AxIH3Ogih7TKEL2JA
IuMkD9TClxnF2M78ohzh9Spfg6QSu0D2lj5eLQ/pxbOEStFlU6L8upckJY6Q1lYQr+vc3uzvNeju
UEmgB47lHupED1hdcoXasx66zsP/GQF+hh/3j0K+wk6rLlcmP5SB1zdQA8eIrSDYZmQGZ/81Fnbl
DDJxbYNDALvWchtDx+OdRTXyscbrOSxxxmVmkFyicHZAMIVleXcuNZt+KMBjUk2A6z665FiJK3Z2
IByPSZqZ1k6vM7H4m5XjMn6xeO75x6OnQxe6yigMAXGpq0EN2X0KYB0E9C41eCmFDkBSuA3HOPVn
MPy9fCTPzzppp5VGF6S68RTI3ziDZAErCDZenxb1dKZyQW/8b5TlQlMCz8aGwvaaxAfAUlgv33uP
lmDb3i9uIrqVD3O+fQ/vA71xFBPxyTGIdinFbK9mffQDjpvRvB9/PYyr7GZOpRO+yOskjbVR1JgB
idKkyOm3c8Ess1XXYxxqe1uWh9dw/4VzyfUdT/Qt422qkwAtGQR/5ZFosK11jVvmHwYk0OW89/0d
l5jx7ipK1VOBhBFTjcusTYc7rYIRg543BccghYlo+gquSU9DbmFDlZLjz/RLogzOWf+NAc9unSq9
Nf0UDGPfmDjz9itLUSk/HeMmajrjDg4HCvDNmYZLMB6tVnmVvRk8TT6afo+SMgpn4QiwiD7MuVew
ULuDAjAPp1n2qJfv6PDNNb3ZFMUaLfUyZ3Jdnll2PNXGiS3mSgHAOr7H3nLRgHa4eG4/CPD7P/Dn
uoZ43+a2fSxluC8FlWeHvQAYc0vLkr6idtQ5zzNzDjUO6/mjAWsqjBXlAoHNhWTxCuVOU6eIkpnW
67jojFms2FOKfPZQgxyRiYBWgWQnpe8Tq6X/k/ySz1jfAew6mbm4LQ9JH93IJ2xlOFug5HmtvgzC
mh2XODtZYyvmwIqRRhvOJyJfFV0F22u6ufTxj19vaSw8qP8/hqbGVOXKdWsO5xypTCg0XYT395IJ
9lGAZ71FzPl9PLUZgm/Q/96kjvnwl91YiKk01/s4kiMWztJw1k/yQQTXgKDWAvYKqVsIkhwui52p
Ya/Y7LOPMSGWIVGgyFqhU2wJRMLavqHYb3MuBHDXGcfNj8sPiFHS2EV7kGOjjGHhYfc/NXW02SPb
XDQ2xO4v5tikN4yAa49hpKrmEWFh687Iar5BZi9Q2bTd96H+qlidhwMF6Y5FUgAZTXyhL91C+wSW
rgFrKCb6bqLbdK54xhi0FSE4OB8FpeCc1+e2/lZQu9VD7pz+JOpPlvau2JbG+hCbh08FKzZzH0UM
pbjECSVCwhuJQF4yvY/Wa3zJxCO7RifbVK7iEJiBjsCNlTnuKrwmp+N0YqNxtRQdnyPeulAE8KEO
54r18JrlKfyZJl2xWrRZ8xNgdp8vDJ4Px68C/nN546p/jGeeUEBuQd5sab1Oc+3Dw1XR0znrlM32
78gSZtjsirDcKZHuJHU7tABVSASA4oxe/cIRN/90GYx5YM/3aeG/EB6Vnl1SJpE/FbPffyrWNW9Z
AEtJ64g/K1QLcUb6DYPSDMP6i6CToDN+rxC9/OlsH9Uf7JrK+eTVTFpziExX/sOLROq4zEq3Nbjx
RP7LrU2CVDS8p+VV/fwQYNz77P9m2rPZcenWKWBk1BYK5tATUMdZOQqr4QDSQtaH4SKqBNZjx3TU
Z9A2IOBQL3K34oe9AxokyCLDR/E/KsLkUPbN85gPqn5ucC5gHmE0qo8hz2OBtTVb/Vtp0kT4BSks
DyEEHIjH/dTKEg0snieuxYmqBMQ20YMgPAhGc4ahqxEibHM8u3aupU84XT3g2DrVHTXFSUuIqVaG
gBR/QVokdpY4H5mJPynomXKzrJX6Rjy9eIg+5uL/6SNqFZUChtUJ+CIPhG20u0VHko2Z0bKYmaEk
bLH1Qi641PiyBMX5UjFo2/0Xys9t25dcc3BREahmL0JW4QBFIeUbgHtJGR24WkPzP3QlwJmDIAfi
vMNwde1g2fNTPTDk9Db0uGqqkJ0eI0ohNEslQDFM7KJrQ9e8ofdmXupiwv1JL0D5n3CcznWz/isT
uT/iFhnsGHPlcj2tbhg6dDOJDiPaokFT/iNSPmoVFV8iLb/BhhglJxO5SjY8hMVDHXvEgAhJNAMV
FkyLoUco0ElmwFSYnne0UEOvFQ+omHJtILc32bmll1B79qdLqpZefD1yQVz2lUPMFBMte+b7qumH
B1wyWdJcOGIrIL2TYUBtf0ON0+TtxTgXUmbDl+3Q7f8SMwqtRKorxB9qlPH4KtdjvpNlUOVfhq3k
WHBbjKhfHuCE3+IMpVe/pZtw2CUDAMvlgQ9BKwLjj/mcKhZdP6a8cP/Crxw2RFJ4/XfyCzg1ydnp
R3hKdEZio6DQAk98jse3eykoPp3SLJok86qC1xdK9bWvYSApIQHt4qCWEOkTK+kvAP1hhLTYle4r
ZmLHM/hKF42nYVnifgreolIIDhIwYGoe5HUn/C150XOfXYjMiRMGysF2eswwhd3DzfyzdFi0b8GL
WjrG041eT5/HrCtwZUwgcFfXZuP8RXnDeHrm6ElPk2YA0pNjwW0Xs4MFVSQQpx+vpFIR01CDXUf7
xQZCdHs/i0Fv/Mm72L8HOhjbieSokTTNjxQMhjWtO8eT2q5BBuQJJUMRqpOGb1wjFVwPAO21F4DW
nKAGj2nGDJCfLU2PUA43miaf8Gf1WqdjU9DfGfGRYyB/A3N60jih+aL1h6N4FpAa26wlvC/K404L
nNK2ePhbsawEA2UVy7Gml1IsPqA7Y5upOT63SiFkpoeQymw7JGxtO3v80tiFXxgVjeaSr3mIm3FB
KQEbkXqhnE9rmV8CmEs4xvafnvSz3DndM41bY2ZyQTFsEx9skzeemqTGDwPgjN0BDrbLMPIT6KMI
sV0InEdZdRvSKQxLVdTg3EYXMTylbx6l0LtJDoU/732NWjpcfQQeQ6N3xId6Z+yZQArHwJjJBAnX
fYMkoz1BnqD6A/f1QwjBIsdapHje/JmiMTpll4T9HzHoGl1ebs6AVHG5mXL69pf8htttRgt2EuA8
Akg553M0/zpH8277//3OvDv6yceOSPbsAnn+Etf0RMbqDIBjZVeQq4UqgHJjDMIjmdFyGz8mBpGA
l7+BFu42SoRBfaUsj37UYW4ig7wwGU1AD9RbMFTunyfGovw+d6BNY470WzJqrYU3fRn5XAYk3SHE
Krc+Psl5SSodN8wGiyo9tJtghFJRt2Ft0bXLs1C1z0KINWEP8JhLSSpnX90Bpu7IvYyMtc3HgggX
XOw3eadCKuYhIFEjO4nYFKRlpFEbK45kxMqiQbbvDPWW9jSZfownQbKrU1Z2ahSpnxG2XyC2rXOm
5kPdzEqBuqFQwweHnzCCgLmJxfXnvv2ZOLWYFuaFRLeElstDvSClTGCJjSlEUOykv0WBAyWM7JHO
nuHH2Dd5v8/IQix3UVjXYaSkvGukBjgoAM6YAfVwf2cIKYdIeWDYKjYje4/d6b4tZrWZ9ipLRE9R
wkNiC7pjbX5dYjY2+zAUN3kLsV2JKWspIg6k0HL3YEiTAO/ZPFbNXANjmmKCoYDoXhC89nJc6cLI
4lxFqzbToFf1V2PWkGJQF2Xf0DRP1dej8NgVotm/dzfNIhNq3qKQ/GHK0eqWpC/Q7Bp7576W72sa
VAvvj6tYNHjEk3r60pvcar63xdvA7bZ+Tk1IJcIWNQ9mvHB3eVz8BBu8oqKGegxbwtnf0phMyLGO
6oiaw8VdNIJKsZbAN4cYgcx3DFum9QFZ15mJWHGDg0+aUhkDSOxLGl3ve44Tg8N9qXeRsZEb1S7H
Fe0gZr8dCtFA0OhKQ0Y2srCQfkqJJFF9rSw883XGl8VIbdUMQ9QlNZL5rMOTcQQAAPxY8nL6jW0e
QFvT76Yf8gRv3L1IbyTgrSuCMgXgA0AKKxra9WId+SAvxjRbC87nM8pTlMBpqU/waNE0UkezqnVI
aRahPVBN++8kryXhZ290CUzH6wGwM/+2Mnfc+3ITkSI7CDP34vsMiV3qQlkRnSQK1ATKUYkrDS8B
3Am+ZDj82SyVwcmKp1nwLERTSQ85d0Kakd6QGQc963RtIR3vQbzc6kW0U0NSk5FXY5/xxOWuNy64
W/TexWPG+LPgZ1BsXmxXU6/Pc4KOj5zY1M6OeE4RPAqt7RvojWwyCjf9fsx/gtuUB89mPh3V5F7m
UWJ1GWfuqH8f+nLKi4eQ6EwwF65Vt+F/gpIOBe6tAzXSfZwL6qgl6TLluNEZZ8RgElGnTn84euBW
W5HCjt7uecrEdg95poblJePLzZQgEfYTXJcltog8+ehj4EaUKkvQBcYocu4B1gjBA48z4CNMer10
RHg8UHosgKe9MssCkRr7K5ndfJt7uWFrf3l1pwBZva3iZWNf8miC+lTZm7nWPeboHodbjd5hmMpT
/MTIhprVCOtEY1zYEoGg+deFdC26vrASJ/Lew+0KVbvm3Rq6UMujIiTRKlDh+G6sPxaC9EoFZXuR
1fHzedbujfjj1hvzpXZ50OSAu3pHQp4jkHCL/85JVLpFPlJGOKhoHKycGiEXioZ1X2wt/jQ7+m27
bFC/4caN1CcKyanFzJuGsgqVFDH4ZoX18au+5rtUWgD5C9FBRqV90/n3iEqzy+sRgakJmuHfu5ws
2ZJsVfyU6t8JZRpHYi0yxwGJX2el+E/rnnITpnwyHI2BH3c4Q5nCA68ju0tU1mVJcadfi675pdIM
S7h/IO3sxSSrqp0208UojIHo+gc3q/mDmkWWs6djrNKU+xGIKqVGueWq7RQ0k1DkrJpQ5+dFqkxk
9Ru4AzGTu9mfZsbqlfy3lpdSUCupJDK+l/a3bZVLOIrbGXoqYqviz8vccoHav+Rtq7IF7hXII9cW
89c+Hxlbm6J7rkjQtx5Q7q7c81ojhBOCnYrBoyzg3uRWHYufDreeBjR3dzXQW1N1BAbEwWLOG/QV
qruS0ocyhvWW/rhg2VEyskTivWoPqNmCuhWN2wE0mZ8ce10y1qh1rMe5SFeWWAjBWmlIRRIgHGoi
2vvzYfF4PZMhJUaBBEL8tdsF57zoqGAS3pGG1BI4sZ0aK8R5vDMErw/We0FoH0sPyuxF/IcLNISD
082+yRpGddco3H4ZTJxvhtd/VXwLDwLfFCgDRYRzu7VC6ArU4VgifMYVhUxCgTD16H9ZOoWa8ri1
CCEyhnpDF1ez0PLE742GvJQrG8fuWm2d3tHV6Jh//Vvff/7LJQcoV6N8zWiPB4Ht7zQbqyu3kDNT
XsGTK/SDKLAJRbW2BfFsJgU7T9ybUn4MYRZ2N4E25yv+L6qeT5FG6qq2neEGZgxUK1agiZGbdMhc
GH2rUH/LFtFjQFjTMyQrBk67mhac7/gQb0uHBHPjxIq2QoVRyPugs+4bKUxHqskKetpDWv7I72YT
RLyCsq9JMXo8sLYvnZY3WCzShdfPpp0Wwm+QAv/UrHUthtFB6ch/qLTAvsxxkZ+BqnOW9Hom64KL
fJQC49oHIXdUPn2FD/kNMfMV9i3RLmZajfkLLbDUK7iN7mNV3D1hi77mAVwOFcpVeJRO2mw/J17T
Sg3DOnNgrdCi+2OzCPSI0APiOPsUl1eD/22vgKp0oA11B8uJAPL1dgeAGCFh6B4VuMV5GbZpYDEn
wcK8D5vr9y/oJCTDYdkxohSZh7XQt7p1WjIcuozgKCk+y6skSlRZP2DBC/OPv9U5dSCvpgWcjumH
zyD7vYNOpmHx4Nql+mVYt3PZccjlNN4B/aqQSLHzfihImqJJlMibM1ISwvElWnnidIZSGgmaLkR5
9pjBxDLz9+9RfwSQaN3MFEfSNhLCk2TXCvf+99klt01Up0Y78XjghTPjIQjb8NkUJEXMOz7YsAXz
cYOiQGH7Swcsd1jZ2Q7p12x+wG2TixlDc2svIvbr5OM1LKrY68XAFeF7Q5wZxJYdOkPU5T76ZHCX
jedQ9jgmgZuTq8dr1wA2uyaPldzIpEWAWsx1tHxcL6Q2T2tHhY/ofyuddgR/YZyQyEbq0GPrDJGN
YkHMRsNzBP1F8t2iJQzot5L612GsFWST5EOGgkhWnpRUN6VV9soNGQf/BqylBBW0hMpdIbS2SsGN
8uuSzX7y+b2SgPo8TJ4/lOJaxlDXr5wHS3pauOQtptPlh9d/XeOAm4knpyfuFtDzrW0FOQjZzKQT
RUXXL1af5Dt4/l+He0OCBYxERYwaZerA6Q/UFhFw6KPK1OO6yB7NweKVqadc17Yd3+8Zlf8GyvCs
XqPSvLuSfM5Z53jIpUQMO54lnWM4/B3ry2qiLGhq2A6Nb3omYAGmqqpIih353nqVpGyL3DbKd/At
Zb4/S3QdlfYw6q+n6bNg5c01R1jqMRwb8K+ig9RZBAo5/pn3y8ruDg9fyRdx8ZvzMSbN+Dmv9u/M
S8NXZDUQRL6lsLAECwFN5ERLLOoyP9afF6zcxjyx8kLStMcdfDIAMn1y4JvutH3bMFd6amHkR1NM
oXdB8CGSClIhQoNlp+F8jOQeI2mOYLtN5vHaK8EPGRr5P9/K3L0AW3DVURgssX2pPoCX7mp77ETg
rhQO+Hw32FUM0SsVaESCAHOGpjERJBbysjGTGFGX2+A+cwGmRGIDOLiYkSWwMx9RNAhOvuAqx2y3
ESKBfroLKSSBcsYybq7T6CORy0m+HxIlO0NVy9edE1WE3JnUpO5W7gnsHQ70AB4TDzaJ3qlAyQo9
q0/e+5Rk78BEJA5KCsMrRMXNcSjTSb2ZZHKIDfHtrUgkqBJyIX3eurKhVWVR/6m6iz3xp0vvCqjc
GkCjy5g1G74aGafHJzTiGEHrdhJjMxyRjFml2jIHycGyt8YTIauRtvEXtD8agdF3i6EnLkt8m8u1
/nkM1edgCL3vUu4Hcp7S90J++Gje4vp6QBnRlDhxfHYf8co2Qo7su5PCf4191XjTj+kilqwnBIdU
PYiup29zAxsFZ5ZsoxtCqAojDwtfffwz/B0XtMDdsdO8NhqaMzoD3BeE3Rr0jdo4mGBDJY56EuXZ
pLyEUQYn03T+Y06ODCncHBLiYTe/7j/0PKyVg4n5nilyuEMQFgmmxhVHk02P2rVWiwXbjzSEmMpj
c/2nyACHhq4xVI5halQMjFPFuWAFzkJ/MYyK0PFRZSOUaQW8qha+GdtjM2rw42M3jfeqy+bAhSXh
DKKesTi02o/GEhBQVaqAkmobvqfdmC2cZmQupRw0Wkn4F62OZIhmvDrGu1MVefvCazntvlpwGmQT
er6pI3/QritM32I3xcStw2NUpeG+pMPo3pcIxBR5tRLTtfiCoClPaYT3ssDAxs2cdkd1DEdDDtS0
DWWprP/5RKDtdicBTL5n0/o6XXTr6kauJgY1dbJV3OULPR/Bc64A7/hsLcUDC3erA3/cN+wg3mOc
jSwhxKuo0jaS9vkn8n1feGwHo2umAjOIWZw4scGakiX9GLnF/S37R9r34LjEJYW/CLR5r2v/M8HD
BdUemA2Zkdaugk3SXvbugSGlE36VNaY3qAbwI3J/eDVfCgOjRJBHsrr/GPcLZj0+uq49HvtC1uTF
6cy6tILd35Ub/Q6xcAyFNSKyNw8H/vNoj5Bk+KDScbkyg8N1+Pb1gfQY11KYChgdP5WQsTZmUtXS
X2V1tymRi1koRsSfQHeex7UhgtdVJ9JrXUBhqcyFKdeSdOKbCjSFRBuX/hQBs+aG+Y/Abrza9kA4
LlB1k/GQ2ALx7ot/YRB8XgYGwhYx3hLKTLFTG6DHMKk4K9vf7CvEi1nRFzB1R7btqZxu6CUKyH32
A+r6YOYRGN2dBLy5p3JUD3BfRySGpJLeibzXzZi0AuB2+9xMXUl5rtk3mif5MR8roE9Rc2GhmpAR
T3S9fc72WBFTjDnPc2f7xz7wqJYo1qNztoFyZCHcHenhJ05OCNJzDRnw3QSiu3iFST0VuI3d72cz
UPFn3nvmhfJGIwYM7MUNtfVId4Oy+ztXk/XD73IWjHFsmPDMm+xKkd5J7MHKXFLbJAJxfBEjsZI2
C8/stmUnJaL0ns4Bv66KMAuvjV6kKSSIpOXx33bKfUmuXb442qBurbFvb9AKzGldNFu2tsnXsrsv
FM5iVw3cC1xpDyU5rwbTOoe1DU4DniC/6B9keS7ghBya3IfmphvxDCvVc3GvT//Bej2da2vM8hr0
iulbyYKuLAwAlKpL/xNnlIb41OkOEgAb22Os1+78QZnWVR/+Wfw8AP8tEuW7gGmB1v8c7L8TnoAC
sxdzNOZF1PTE/WFSs1dHrfT/65o2Dz939vgAPKKkrOxaapRc+xV7rXUyRxkMKXErmiC+dzQEjewV
Aht+sINX/K+Z6VDWKrnePO/XbFe6mk5aXwalg+pLLRht8kA9Ic7aQhy4gebxNf/SZCnXQmWjGV5i
FvJkXuZr0dqIOZxtpXS1/egJB1WJW1IXRnSX/p4TyCLdetvK6DRi8u04KImtrddGvzXgV2CaH9Ah
3BiEOlM6ZSc0KhPDJK5an5WSHXi9tvnti+qlfF3kf/WJnK4bHbN/pNyCqobx3ejlzkCcrGAbhpV7
hSgqNFdVUuF/2/BI0P109K07L6cGKPVbC8TJR0BWTzmaoC2+2NiyjWqRezqvHe/pd0o+/fDdtIrB
hHbQ05OMclA2PXd4KYPImDr+ieAl8+xV7J0BVDH8Ze8RAFkxA684MuLzTUjV879uh7YYJIwWjD5P
qxkLqOcFFx8q7Xw6t66gDZ+YPLE90iicc+Elmn+YoceVCDKQxp74EuDxSD4B98yxM5cY2qdjcgEz
IhYfwZHVm5bRE0qknZMsIIAGc+BJN43tQsHEAJSWABvXQf29PgfQwRodPGGmqxW8+qT2sJ5o1RvI
8s+f4VeD40qyPWvMm+3PMS7dpgLF/b5L07ZwOVS8yYlVgSqI+8Z6zJDjzqujM2kIiaWNa74lxoWw
5pqL26t0rFkbbyIPN9Kw/3tCS13vWt9s/xSK4do4wIDmR89153GvGs+DnCowNtzbo96tyvwksi/z
dtmqx37/sz8SEn/tBA==
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
