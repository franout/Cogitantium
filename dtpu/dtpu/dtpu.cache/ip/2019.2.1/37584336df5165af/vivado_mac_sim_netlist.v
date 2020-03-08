// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Fri Mar  6 19:33:35 2020
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
  (* C_CE_OVERRIDES_SCLR = "0" *) 
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
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
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
  (* C_CE_OVERRIDES_SCLR = "0" *) 
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
iR/jt96kqNpMId27V+7gyar1jmC1gh4S/5MDRviNB1mkEweHSdFQlurguZBIa7/P+6oCRA/4pQ1w
bZigFATLmlniGwDZ6Tuv6qiG28SqEj74qt5hwjPm5drPvsSx3EW6CFrIkWmWhByibQIp6Icmntpb
pmPcrfUALFwcYfIaSlCshf4nJinwPf8o8hOUpKYsVWFKZtpxpY5YZEseS3j9RfJK0/BkQFI/CQe0
V3nZWJmbt201QZ7jxE7xqkOgWCVvykUtiaHm91bxd6ehI1GN1tl+W7ByDbnjp4WE9C8WHc9y1Pgd
jCdZ4tCWCFY3gUqkGG0FjMPDSksQVTwJlrvclg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BXOuo55vaeszRQGJbmk2SAG1FdLX6v+40gXiLZlt7KwMKx5LugFg65FIlrHrRy6qBO+FjFNqxTMi
4ptkkLGpLP0pl/orcqMn8HLFGZGGCX2ezAMHxCunT8Qd66r8vG1ns0V4ro7vCPVRJXwm6JFWSeXS
sWImim+UIRSxYwPsR5gkxS06z6pPjXKKSSB7ul7c2kKdGL4NjR1ne4f3ZHYeZmamlpLsrAAn7ceB
dLt2GtGKN0N0ul26Ssiq84ZVj12RFuTvl/X5F22uHOBnAqDc9VOEh5/QErANajxtjRa7Edr8AqT5
5gqf25/Eg30Fw4JbYZmQsLl39ibbJHFZhyzR1Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11232)
`pragma protect data_block
m4npSFdoLhQCaa6U1oCjxxVzfT1KwioF3A4w69oUiPxpWyV5q+uUetZmf+RNuypmxNo1Z3Rdda2g
aSLX4pVQKsNt/zqRCmcrHrq1t5L6eplE8hjJv75GdMOTWuSl3c01stGS8UfkJlYtPwvJXv2bo2Yu
abwB350LL84BR/kelKIVwtZmHtyEBpq5eiJ0tplnYKyv9uNv3xeS5NMvEaTTFvm29LNLIWo6QL7O
9jgmteT6pyvexa647FVZ+tRSfzAgl+9aBB93yTpV8ZTByvLiqi5zcY0UGlk3eVcN9QCA4kSLzJar
MlhUgBpZlVNS9pL489HlEvDh3GAcKXd6ARgcbPQLzkFX4Aenv5jZYkVwQV2sZMAcevc2Y7krO1KE
TPAnckpIf3cXYyGat3RfhFbYmK7PsB4M/HrMh3D3z0imY0wXEpp3xZW2013k6ZAme3o4Chwp/fym
Q4ts6iUTqC9fyZSytScRCimtKDJJ8Z1DxKpkJMy/K17SmmjDczl2UkeP5kBMjOtj5vSVd1QqRKlV
CXfBoR44RPyPzCMKvp5rjbOV1Zw82IcpbuynMuKJoELAfO7ayRbGFiRWAxvCPU1EbKvPhxFBYQOs
neQe0WRcnZMqgEI+B3Bol0l6xMeZVmN9qUGG4UL715pT+uiM6geUMdFqDkT0RvbESDuC8/iJKy6M
FkCTC/O/6mifWPp4LykEozZA9AV1zRbjpNe5zu40CrQ5VbdEkMdtT/TZER8V8E+P4eIp9OYAF0dA
BQ7ZnymwcyQVJsffHlZfuvF6I9R2tmrFkPA0rJy3NnulIZxPD69g8JxnjlASRUGVmCQc6bmz1myg
XAD0Uh49cXAUWbUIZa7L2vitLdhQdxX7cyHQRoT+yYCLuh5n5JMMtJxMqJDNPbCvm4Hx/NYKC7CV
XtxGAs7sO1B0goVNNIBIAvigvT+UElGpfFTa0aePjzJ0GM9+xxf+xuLIq1lfF71+OtXu4HEHAi+F
6mZ/yPkoxzLJIb5aUJ/haGofzz8RbKdW2gPbLOJla3i3sa8oEfH5NYThNHZy8pI6xkGIUT310ahD
zZUNU0+tWHj5D9YkM10E5GvaGkxOdCCiHmU+XjClRBWsl/W+5TdwK8P6qa8UmfF0JQ1ret9fWkuq
lYmdsDiaHcWXjhczbx+4u96eFwNeAXFnsBy3Kyl1X058EOHNU7raZjNG/ujhBAXtldsRxszbQO/e
RoFgJzB1yrVyzRpJMlfE9PGntH9jzOa+0To70e7FH+qdP2/3vRGuT28AOW4/M2sphlOjfC8ay3P/
sqm+Q1UPLk/V66bY2MvoLMQmfc4Kx1jhCrnGHDPSGjV+Hxe5STMTCBQPdy14rm+G8KHq7Os/UtmT
xYw7Dd3Isdn6rr1FhVxSzoDabJz3yTeM+lvl9LDpzhUEkf05vE8t4qEkDn8gMBzehVe87kqCIyAK
o4KewDAqqoDC/gniaO1D4t3HYf/gLGxmBnsHOxCmg0ManuWgo/yWTEsPey4VE04jk+kf9MEd6rd2
v7kUgCfigx0rSeSMFKZHQ49FVV9f5Pe2yXk3Ov5TUp0K25BMVvyvARQv12y6DZe1Zu0IKG55iljZ
BV4Aizwfht/seIAmnj0Xy6ZFfyllp5/Kj6rLdIPR6DA3370TSSNvt1FUU2AN5OzZqK4kCxEPtfIl
rUod1jBamMq214mmGta3mP886vevSLjxTAXCPGoTjNIDe+WVighOYIqWa80zCtUsfQnoonhBudXf
j+A166PPdqVX+aXAk8qv6StiDjLCWAbcjbyo0Pi5bcBB8nghKEAiehkrSDMMsepkfoLGJPyUS6QN
S/8CpiZKmsbEqwOTxnlIk/rGMK/Ocsr3BTmOMlX1TmIohceH7NnHFvEgrw8DLUjALpQatmoU1ysI
JAHToWuxy636apxuvH0L8xuk1a56EQ21nVa9AG8R5C+yW4lTZm98Bwp55tlp1bm1+lphzMXy8wuh
k33u6saq6MKCEfI0B4tLJfz9LiNsOW0Q8yvjNFimFHxoE/+oBoYPAHPt2+sta1FYyNslAZfvLBFC
yrKpRxUTGGQRNXiCAyXzJOtYAJk8AOcTrTe2W/EZdK3FY7EQqHNvbnHJF5VrkyfTG4j7prWmUqux
wDfvn6HFAFOEqiM00uq88OaZ//ud4kxV1h2IHYd+Ctt5gRl08ppMnvnZiU2XNlFWTYgX8kfCQDge
XkJFT3yOyVgvl+c3mNoiudVV/3SkW6HabZx93qCXUtBU/2TSdwefZ67032crzv8mfmENBJr4THPK
Ky4syXbT2cvvrmjkvCbS1TE0z7DcN16rWuvCf3sDwGEB1ve9cFQeQCBUj6vMktiGaEFDEH+SXxrk
npyLSyW+khyeoO6Mw2DVcdF8ZzTUnXq7cu7IXTrsOJEt/FZuXl8lEF3PcDg82dvj1/iHjQFwdz4t
xYQbE+nBCyDlAGudK5ZqcZpZKlW+oJwB5fctkm3hH8tdhDiVk12NMZBlOM9ebZrquJHQqMnFDS22
SLzTvLG7NlYWOUR/UbWz0sZlQdLISurewE9AZ39LiPxo6av+C6UU+9HzBnMke1lFL7Ze9A1qCLGp
XAhsq9Ov6eqpxhrVqvqS/d5A4bluHWJ8cVqAXoXYfxLvDSLX+PRcopdPM4zktWezI3MN6qvKHLr1
R90THrUcH0s4Gb7d3x3pSZrl0diXU+SzWh1xz/O1mdStWYLVJhpBjdUCh1j9Dg/c0dAtGTvOvinX
1UCLinRy49T7PCEYQ41555myimEZPrjdI0tvPDsl376XsQl4Y4LoW6XvXeYqxFSd1/Fg2qVcZR9s
CA2Xk2MwUv+MI+/EJZiHn32/CjSbpCSR4MbQlKYK6LeI8xGroGxGInCAOnXR/Pc5HkiGFXF23fHc
8wfU5CjMakKegLDedfRct4m5tBQGdC6QGg2t/KW9tlHEw6ql13t6fLEJJpZAzzPsClZUCdEY7evx
diSTfXWZ2+4V5SrCdqIe+VqdWwcmh61JojjQ+Sp6r6YQcWiaTHIy74nBQ47tGqmM9vMFcOSsQ7Up
DBeI2Z251el3yQdIalQZguQJQ2orpIkH1RpMVZhltA4JO7GXw9IkG7qqy/PIOh0c3GlohZLz14JB
4fespFrWeNzWAvYjQsYtFxnlnj6SHHIgsCehUVIKeLM5aTB0QMZiyuQOQ9s8VruV3cBICZRdNI0A
BIOm5OMS2SeXvMTxLVUEVFNIPnxUp6z47ho9ShZHSsu3b2qs7qesia8hFq1xLPjCHVf/T7NjawbP
9loyN98k2A/i2zsm2x3izulfU2dFAG6cS2ifyUrz44txS1ws0A34WI4lAarA9c7g+bSEQjkRhVWa
beB45Y7KK8sFj88yTIJKos+++xiNZI/c6KokzB+T42mPr2iy30RiO4adj0pQIbEZVLyIY+XR2/PM
1bnlElfS81lVM0ViX7qXm+H9M00JVZcm2aIibOI77Wkpvzm4CIvY6kXg4dM07G4m0Nq99D9dGzMb
HmecsFDDpEgf9+HMpH+ZPuVGP6OjfNBxX3m766eYDMIrtjeKjb2jjkdjrOwG9l+FeJiILLnAbMcs
Ldlam1uYJQz8qMNi1RaFN6RX88m8uJQ7iRKEBwe9brmZJTLFL1SQRGdB4ntwsJ7lxGNhQ+K8+Llq
5HA74LWgCQTaU39AqCw7Xq3yRgN9TocXDkYwTy7gGBQIdpQx+4l9f9afC2ijY7DRBALoXIbZ72Ec
iQpS8NZrCUyBQyj0QHv2fX1Vvx6aPJC/kZ7ZFH87Ifwm5qovWezV7i3ufUOUi5xYlYtqZQ3oH7Kq
JvamEslZQXclnjY5RHw8b+WInVEOeweE9Tmgvc5crp1P2JoTt62Y8mLJ2Lm3irbmvcwJORY8Mfir
SO+7n/Qnen0xb2exgg2w0AgUmyyruUMVmhPrmRcjMJE0L+q1Tkp8Sny7Cw3HqN4FMO1J1VCZ9D1U
wnoRaFUBHYXw9mN0IQlfoOWuRsPCxiAr22jSf9oY8C5iNDnx9sf7eI1WvGXRLHyGGQ5tnE11yuI+
jQ6NlYlstk0SzdtodKAJKAOeGIUsPjcoDB6VVUm8qJmn3DBMA8GOEI4keEqml6+oDmmEiG5gxCwb
kPYbPW1QFQMELH1eXO/ZQ8XDM04Yc3HoLwd+PaVBezTOzQEJZYBiZGNTKjrw2ExFgpFKTLMFTNlV
nv1ftfvbrE8JcyYFWhprlrEusJ2bwGnQsUHpBn7ATfPdfN8fNfyOTRN4N1pO9Up3VmTKWxI0jR15
Yzr1Lnpr/z1fNbXObTHtUxx7YjoHxneWQ9Z21I9d2xrM0DziWkg9V7OO8zuhL/UfRJRyaDx1rTlW
Fdx5o5tp/xteMdNihmrq7+Zi4QcXwXEBhUsgZ6tAL88I+53sK6trj64W6sAl5Xfu0/0i0s9Ylbqm
Wa8KlH8dpplSQEyu9dxYUH2/ElHbY0zhDQrTmGOAnRcuby8oTzuxnUNQULrn4HIyuKn3EsryVr4R
sNS6gn/M1PB1Hu4wiQSORDF+2i1v7Ucs0BGE/JpBhTkaEpE26S/WO2tSGo4uX88iQbQh/ij5gtOS
peLRTIX0Q6x1jYpGbba1LoD/sS/3zDMywF5LioGyZHe9+UUODZNjE3gzUcAxCm5yFxWmrkykR2hW
uQWZFELLbkj1kICs2xm0zrxfTqebsb95+u+MaY/BF9+D/dUB8oH0kS/hYTq9Bq4YonFfcMozJMvL
/O5+Ynctey+XZbJ6Itjxo/q0iH0yINX8mlHRtD7o0Uy3KleUrmUj7DWLvkbSSUmIVTEsCHwaCaet
GEDsKhmRNYxkOXLP8BrEIrN3V0nJmfJpU7PXVyUtiqW4aOGnofmHZt17MXQA2IXEDlHFgn7aapA3
xCNdgZlDcA33Y1F2XNOLN2U5VyIa5IdYNhWWfLhPv5h52WgYkE4tMW2KCiT+6a305VJNlEP02Jta
sCm1mLjB6bCVLNYfPPEKzzYGG8mcsbxExTWWxcw0raJAZdtJ3ghSEinlLLlyEJS5eSpOxivvZXXg
OvOmGnSjWYgmIwyMnNYyapLxEZeea6S26p6FBQL5Mt9PUsBwX12FDb59Br+fVrLBV9Sv+mcv/kQF
Wu9Z0X2QL7DCJXK2tp+unMjv8JzGtt643u2PB42ctZBXeOCcK0dDHrByKxqZP/heovLE2AprPYqZ
1HmMcSjYlvvddLBqEZu5f1L58BGbhoWTzrKVkeQOKiL0/wGCzexetUJPwwUX7j9ZfjB/X3dcbtry
HbI2hO8Hva+Nk/hRsBzE+h6f4IoPvt1AyhtfKhn1wauHSyKR5qXOf9PJt4gBqJXzbvjAnGCKnV/p
fuEs0NfC3lX0p42V54A57t//Xy/USBNfWvA8IMnDCiVe00uPbJG4E3JGuZeByAv36YO7wgrdrQpA
ICqnveVNt5BymmpsI97SPX4JdqlmpUTS6ZlFiMzDcZmcrFseEdmchhlnF+U0HBSFbjhK2c/FRAoJ
QhbuUZA6q5VhdErjjpdTTVyzonRACIW3c98Zm5jSi3XRBDT3Mdt81q+k+skFcpwXsrzRra9l60u+
1vmySTDDhjO8jL8F3sjoTwRSOkGaLo3q2WZOQ83+QOzJbH3esVvQCCYAfAlWjFF4urPPh49otGCM
ntFb9+OxbDJSrVdIknXUdgHlJBkkiW+b1Ec48rB3uO4UBkvbO+/OHxE3Y1/pXgYhbDn26Jg2IOpo
lBygZ/lzwi8m4zeDRrtanzXhyLZ3oRTNdPXYmFlpmyUsPYp0+PObgql6QOJBsHhstn1D5LSquzSW
gFm9KXCPn2YSd9kxDnAgBIAd3HIWKhPqAF7KD2JwVPVOCByb+044RhKjCf4ZU1XrvHlZjzzwCT8S
B382sipAn4tdIjwa8DYol2mVwISUit5jPlmR+iwf6ggzID0WQp+IOaVMfDYcYbfrF2Il2OR4lsm/
8pVO0RaLg4tk17TGfpJHORyB5uzkPAa2o0ujNS+FFPHSlMl7/Rw1VXsVhHHIYPtJB/EC5DT02ET4
tYBup5A4cfTY95pg40fPFC/S5GlPcTr5SfJvO6qcbIlqkqolui91XvgvZyCVY6tus1L408QTfRZK
lg5GqDzO7jvsD92YOcVJKK3BRgcWU4K0n+Mn4eWJKhtGGTRGJ1Qodiig734jHjG0Z9k0DUTI+xg5
OC72+ZKeop/sEIaz+39jRSVz32vLATMsus9cRRT+NeKIcT2gDFrDsEWBivBZpd05KgUv0YukWVJl
iu1+hUhxaKT763lGjVGQ+5PlFaWn88gz+/djWQusT4X9/Kxo8sX6rU2z2n6gYQsNlZthKkqza2ov
f2/3oW2AXDRgnlwuTBcbhI5etgdoqOA01ILs3ebpKFX5+mfu0N6pYzv7KCBLXA5+Jw0m8bM1oPv7
72Unr0Clg0ScdShSUrqbyE6pRjCYLi/ggv3meRw7LnUGa5Sddpp1r/PeVGkD5D53COZul+gU9Dmx
WUZrpJWk/1CzFlBn0y9n4Hpu3jcNMfrCNbnxiFI/vI/MaORI4UQx0ldjLnTClUmyDMusNvLTZZwv
E/Y+pnDknZ4SDht9E2ROp4We14/OboP7GkGbNC0NVorq9Tiw059Bfu8PuvjhVvJ402LlBmWt3gr7
EZBy753zjHTvm6ClSyAmd2EFoC3EvLg4QTxT0hIjoYyOUIAtS71skcicKe9xYppHma/J9Fkb9YYv
cheHXeicWiuRo0WSmWU75G5Og1S6ob+nOvDhv/bDk/vH8uLwvcYxXuUBypn1AsOnFBvECYBEeRvK
xyMN2UCHISKvW1/ruLflPeb9BPWcl18BQZDOFt+gqIThwAgFii3TfsU8OGPReXGZVuBCrUAewbUG
GaryLjQPzBww7wKki6t7y/vDCeFkwja/WWT2BWJPFsoBeJiDjaf3G1Qz7lmN9vyYFkr/vYOSw+de
a6j8/JuF0f8huMi7VhgSzu0iBIFO1phA2YJ4NvStEU19sieP7VO6QlMSe224Q5ru6VW+HMw7ea8i
VngdFPCXyJCwt/kXLLeKm9OJCSvDQ9eTzh2B1gjDRfCwi5f+ZkdyIfT74XQswe7vbaVAJLZqzq7R
oc4NWakbql8SlIGkmOXc/Ykqdf3B1hUZ3B+2Zh7xnmxI+aJRHH+3dmg7eRCX60URQxPnrUOlLH2n
oxDSVzQhUBZISLpkBLUrECFU7EuIx07eblXnDQBqzmz9MgQvs9olElawR/FYf4zJg3ZnH9RnrdLO
U0eUijkIalCt+NQM962Alj4lhr72XDiSDeea1l6WmGpBUdN1/0Tob71bpFzAMIN8ZT1Xsz7DeOCV
HtTHTPZ6KQNS3uZ3MY/KtUwjBebY84v7Nf0y8TJyXuDNp2DFalEpVFrDtG7B921ygKOGg5XDpFmc
//KPqVvgwb/HxPel68SdHhtUtAuJvtkTBY00F4WyRq1eFDhbsHMnBK+EHfkfb6ViqNF6doZO+wWg
ElYc8M15TNcQAtfz0xCjXGJ1tRsCH4DffzDNVItvpZnjKRg90cADuTKo4zVpGdyljb0X08TsmnNG
RhCCVQTrI4rv1G/Fy9whULEwqWOjF8ZcOd3iyH6FZR20slebMmUDVq4Y4JqKYWnJPQ+R0oLJCgjP
l1Rx0qUDXmSU7omU5MZtB98qCsyC/kUsWIaIxZnr8T2BahaAMMLZh8HxZs7MFYrPTgH3pIBpdqmf
mOUW9v8Wys/LDGHgyYGZ7DLesnKbr/MqFitX15fdniA7SrwqPQ+j5hYzTlTI30ux/ctWpBN2SxOK
WG9MVN2Zrydk7iGKXHVAPxbMExH8/PYc0LWhr9boqjr2psUCmUemEW+PrT2zwZyXNjyUoxlO4wbf
B5o4mYVTiP49CKVMpUdDwRG9kZFYAt51QxAyPdH4taGx19eNzD4+E6rdx6s/cTeVRp1QyEdGpMfT
Yw2Uh85tIIkG7rE9NaYAgeCOee+7nFPBvQpgIntwJHcWbY8llC0EYrJdldtHqHnTX5OZt3tL7ENx
EMsjfx3+EAqZL3SUMgNuTlcG2t108OFicO/T9iPBH6up1QDx4fv0e0MWkd76A3fYBIjr+mPRngvI
UcoXZj1zEEST7jls+f540ydQ5YXq400tDm1auFkVJoS/886Z45DiMPD9H84WHg1w0Aqycmtls8AD
OKG72/b4skXgiGHDprpJxYGmzrK4/ai+6OjgyyOMOXESDCYi7NEoUnDuTAXL2CfIxjolgeXifr0W
p0onp+My68d1hU2/ODnOIfzpKs29yffB5zIlZIKPNdoJsVFZnGokCizWVN8heTJbERx67JEtCsJq
fy2lb18JLa3Kw02dUGLKcge8EIT9ph2PDQVev0m6byXP9/++H5n99Ka/5VUHDCl+TwdbL+U4F0pa
FyDwF0IgdVv6TGWQtx1g4nnsCFwyzgTkHyaNIM7M3dQYWfIJ9AiMSLvHrlf5TBYEAF5/6wU3xBg6
ITLrQ/z4DPslZQ+lVlL4FkykqMonIfjPiKgkhfk+dLD6VYgPcAZxGA7c/OjZ/7vfUB/op5o5ON7p
NmrJdrPVPKTDd9YMtYN3GvOPIMsXFZVxsJHYhzDU8YVIp7ko+L84AWsoQFS5xTcXaJHRgn2v/Fhl
PvxZVChzrbYibr/c0aTgl1sblM5p87H8DoXoXbHtnwteshiPMfzTc9FU65/EL9R0+mZ/4h+0ROlT
x/juaxtPNULA0w8Gq7f2oH/zOTDTLDKCgSJAJnVSPFkJ3iq47464dQwBCGR6YlXqn2B+eWA1sYdr
vX9TLPSgPOPau3tdIRpgaq15foYae42NkKlZTSiI36roPErWR6zOSlpJLin6vPSjd3RGuTC5cAH7
b20usyG0AqvdXPU6A7/k1cYXZngk5AHhnibswx+o8OylYLIyo6+W88vmVgJFFyjI0T2zSasl9X3A
wShsy1+XmMLDY/YGoSnxn62WdUnjFcQ5ZXJwZQDxAc8PpwFHEFxjx/pP4SXHFyxOP9+oWhntxTfZ
bGWSCri6Ctar+9+kPKnedjFU/OMmjNz4ibZN9DcJf6fVoOnMXj3oB74O2Nmj3Qe1hkste8WYR8g+
d40aRhhrO8HXRajtb5LegeXV2GzNtztDYOzfI+KlHREKIHhp/dYb5zzLFfLd5BTlslzDT7LYhQQq
s6RPF+aUa3WMd+h2RIUrChwZj/+OFVeiAEF5cQYCCv+reZD16PZ+okaFe72qS4+DC7GpZoejymsM
lDKoJdLg6e+UfTxjvleHk0vc9+MJoTCcblPoxTQOLLlGdlgdXW0hLvoMgdN/69UvnVyrUbC7COTY
nz95SVKhWYcuGU+r2t/+JZMcOmLl5CMGVMGUzelvLizp8DnUV9XEBsQGvH6MYA4JzENZ2X/0/DRh
yowPp8nU7o4jD0OGHpzXjIpyOU2V4Mv7TCsC+JlDgdkKeDZ6fC9hh+QZ6Hk/ja0ULYJXE6ylY86I
4dHVclocT3GE76NTIaZL+elM4+pKgA1U+Dh44jSCKFxG59bT/W7pseDe8KWqVmFxJmJYYuUmbDHI
bPxv9fU0lO3Z+Jmywd891oDGruCUSoLtfnEMqprVo4ddNH3Gr9F5PTm3AGgfRyB1OtkoObvGT/eK
PAmUw1DfTKFuECwJJDBLI7U/9b1+ctehF3fDHo0ES9+/plhG7oZmfql1qfdRvS8oJiDh4rbhULe9
5HMzwwGdWyLCrBoEMjSqwP5CbXjp2ssjVPJKL0I9yo1/B1mPnAbtO9LXZm50d1qO/1X7HthtVnqw
yZS/h47cqkzyasaButQqb02C2f1qTErknvnqqD9Aptzp+lh8HLULSCV+7dVlDuD9KXypTc16FEX0
cvgXxwiQh7bz8CjAppRTHpkJvLkW9GZJiEcyBELQSZm3PizlK9ewhggKFkQKDUcxI6KkXAwUfRkh
pH1IZpGILI6j5+vJGy8OPa83bO6nhdsN0aJgBjzofNU3pXplJSXWP4QpSNt+YK67jeTOyAgNLJIL
g3QZ4X5UlEqyGyRN9vxcP3nqstMZ5GwMFN2V3GI/lmYrKAyj28Ko+uqi375c3dhVD62U3YN7mJJB
rMACwj5fzwpJ1X0lA0qfJvEiFDbnYhsmHR6+izfZ/PIUEhJpLbCF+4v/bieyjS07j0y+3OfeCERc
0750RfHkB891dKkq1+feGmuUqYDXwf1VNtnoi1L2Szsv97VnnKEXCXVcjFF98wCM621p4UgHFpNp
Cw3aEUIJKAmjp31u4ZhrVJ9dFXuIkZTN5DzXI6YSiXOjzhRwvLSAXcCbUexehwXAErjzSYeRdN2Z
V6/SGI7xO8chu/pmIWdqIATjLXF45jbm/15iGAlutqrLSVnuzb4VdfODMYS9j5bwxmb8mFcBtiZr
q9eiz+g9v+Ju52G30t718uZUyx67yxozoLIdcfSdALHUek3+hHLkA3DIT06WsOaMvy9lVHFw4p+g
9Ei0Dv8+ux3nvwrsuqhi3P2YWa679lsOiREwS/uA6uyYqOf2jNfYaAVzbVxdtuB7LDGFwktf3jgH
hbljFMUoJubX0GTeulpr9b4ePOgdhLonshzhYUXZm17Zlz+D4HyHSGBeNpDdQ78eFaeCpThHCBW+
Hk5lubu3v2zPXtOLJpMn0kFttowd2IelTVoufR9+jbSrh5WYcJ6yppKGf+7xIjaCBIh/X0B5Begs
ADxt+X5qtQzrgtxzr36EOif6hyFM3MincQu+prlmJ+OTXATSlWzXiFTztxGlf8r3vTmzLdeKCVxM
WRdHjDRWf8qXV9U/61kyxpErCTqYzTLKZMZVCIUHCWN4JljG6YEsxwfS12GFx3JlBb5goyRAEId1
rmPg5+usR6+vBK7wfI5m/FLqztiEhh8C7v19Tgnt1LLwSx4xbeXUywZW/OL7Fc3Gfgr9SsWMJDax
7gLuCKyxpbysZsvr/FO+yP7B9iYsyk6+RY3Tfu3BGgJe45S69oRjwlMQPyZbaqsRtUI87LX3Te1r
y8VwhWPb1hrtrhBJIr7YTF0RCr5kF0Xrf+70LY4YsLACSrzz8XdXS8u5jafklMW8s/h8ibbNEt7e
yH6hNf1YJ9C7EXfNbyKoKqJGvHDGEdt/ImdmYgFBkf6S0oFWlwCRYyAtYHksSU4MOIIj0TKCE4nT
Z83cB9IxKvH2qGBKmWUOcsEhO9GKNt72ZTqwPRqkzhJA5C9YVeHGRga5cHsCuznpoG8NEwBxUKo5
GskRKKQU9w1V74E82JUd3pIWKx6mwJ/TKIW1c6ctQj7r19RZFRXuLXPKSZTxC248fURQA0DQrF3R
XTN5RX9Gjq6Myc5wQDou3f+r2C1NdZvHoc7iPoR2QuL0KlCWccWE1UY8/Yq7Fhk+wkJ/6hJkBeDt
eNlZw+ujqfdqV3FyBaYWEBjqsyngqaTTvGzAoLoLw7xpEJ/qCOLIr3vvZwQgi1UAE88oEdDAxucP
8Q9f0RrueJNwAgTFOkVC8Ez2cEN9OG7sarEM8H1w+iAd9yeSXKHQmXxVfIxG2shCz01xNSCKCIze
S/IidP9EvbKqTrYKzi09pn+3yM2L5vs1cft5/VfJUy4rgNlz7LwHZsC1mHGjuE/91XPet9MLYppU
gcvSa+tDphV97Qa23LZog73FeXEkBhquRsVH8FF7Z+11AsHs4gGaB/CiEoWU8g6MTu7F+KDrQF/w
eRLZDIWEsNX3liJPu1QAEz0qLzlxDoLEfY7W5ep5Agl3gUmJpOeB8I3QRb9lGiwlvsvzVirS1wcr
J6AP6fQjn9bQfLy5PZEEboZRxJvEattXXDpSZNWmDDV+38RxwhpzTXARG319JgD+O5mJfyjRBAbd
TLyE0uriDMedjvekv2OiJDc3cNPIJGKdOo3ugFBF9lOgwxDX5OumM/28VS5BCWr6IFqV6uq4817B
+OIS/RW6h/Yo2VNsEswIlqqh7wF1xCM1nlhoR6PhWnmBB4+eUonuy98mrTpqEDdGoiy/iXD8FZXF
UNSj9wZdqZqzvu7NmHh7cNt+1e2IC9ttrM6syIIWz8LorbKCCgjGplrb6sXvtqFY3h7IFcTNAb8B
rf8savjvK3i7gIVvsNlzzJivrrGpn8yzAKcjGLYpOuXxCGmd5JjYXOYZe+5092Du7dqcdiZTebjN
RAXY7fVzu89jg2tj99dUVOcyf3yFgXiy3eFQTt1JSOK49yz6U5S/eYjHeAkZQGZAfOduCZplFRfv
LhWjvW0p7+s8tFSjNj31B3bhQvlrHJHYDrJFHbu2rWrvzEfKwHgX8jq0ESIxQfyOLLbpd0GbRh0E
Y+NsrUxaGwFbHVEXxbQZ9YSHmjwZCGAMZ44U8lu/VEZelgWVci6H4Fx1mYffkNLsZ+BSWSx4U8AE
sJVeRfG7pxU8+p9xzfn/aeEJQKdOSXynky9CaWLt+RxqGVMYG4fx5FIjw/u4psDoo1aLl/SLtg6T
ORR3H0WMxGwQ0McEQhmoTVWF44/R+4kZFJul1fS1p+REzIkuqszwXsuOZ97BYI7qZpNfpwx9yJ1P
5lEQCT6H0gp1Q3olSamkwu1qn+3ZQMqe/2gXSA7s3YlGknNLD0CuyHOKF2O+xBjtsRUJEEoaZ1os
HpX4ah7KgxMp5jdvewh69obKBw7WDEPqwAI/KQ09K0ncubb6dBAmhE8UXegItbxltHZ9EudJoXna
YCK+SA5D3Udl+cICZqIsIxXIESpSHEEpR1+qNWaJIxOXRl2rlrH9txppatJwS8tOA6xvRjMQX1Yg
7wmZKQ8xZJMebyiHGYyg4QZo7ux2DKj2X78DhS3dyyAAzTrLaNWY2YJjYX48W3UQHj8oQtgMUlBG
0gIU0v5dQl2CTJWCKGmBVZOTnbwzkVATupH4t0npyBgLXYHLzp2eS4Y4c3u+Yh+/tq56A28GC26c
VlVrowPT0K4JdDVMemvzu6IKauLBHm5oRxPu1OZFtWQRG2x8BruRNN/XVmPd/OTNXyevHxedKyhC
ffjgb7wmmbhD2/NGcjW8h2NG/mHC0M7z2Khemd1WI3SZBPlCI0rD9aJwEXrLbE805p03NsV1hex9
swgjQtr6D88StebJ+XcJRsKdxfMhToimxkyRh330QiDK7we3ugH3KGTE0R/eEv0h0YZQ1xFQa6PA
iPoGBGvRrBnAWs8XBqURZzcddEH2Sm6XlYYLPebD+JeKurLeoIdzPjnjUKXwS0kuOp4KWtJ7PcxV
nAH6Qz4XGBt/eYncd6hepwzodGfxiVf4Z78r2+X5gmsuAsz/g+bjy0jVcTGzdrTyPH++3JNCfhW9
opjj6wBUKPi3gappq3rh7n1Oy32dCYHHqraeJDyQzHyRnD1ZNBJal+zpOg0KhGxrwxnW6p00nuG2
+D38P0eHFP00pw9Bh57Lx7hcrEZ2ARZ8TaHfBdS5Oi09r1yw2BKhIDfh3lQKqD2g83rFyAojYNcy
I9aTqZ2CUA7UxIyz8UqY0jWGPd+s2rkpoFH4+HIBcjDqDpnsp4ajSCDv9HKEgPNqaQulQMWrVyiY
mf5Ty7VgGqRvQRMOLMsWfsV1pOgcTL0cdfpasXcNmePLsNbdF7QKZpBCKUfWIL6MBnM714dwThjz
XRjEhj6LePrhPZ/pSmmjbqBwE2YdXbmpHwOTY33KNGlUfwMLUVrshASpCBy5xYnZiVrD1QxMaUsY
xGFZ7rfDAINveSgD3wE0Z1vDgJotY7tUJVqusxhzVrUj76dQ//Z8y+ApyTuueHjTs2Z8WneK3I+k
YGrfmfWj+49+qFAXgT8y9PBSk09GRPBZ5T6GIm9r5yipjTMSepUffAWB9CufTWh2066UVNPdu7vT
S75szjtjZu5FV9KJjB2yHM3QYDrfABCH24+bxbMOzGKoISuNQsg7Jpdh25NGjx25ouS+Jcu9Vn1p
bliGfv+/m8VMTTm1dlkWtcpkMXNXAQzpnsk5EtwWpqCB2QxWVLnBLNfU+3es0qMG7J17R+VaSoHH
RfdluMEIFg4b6DcBnrsFQFVZwL7fThH8Y72h8TM2Q9PpYk27myKFNAa94lZusIpeEyF1mVHMEy+2
bQNarQqYTk6/az1dYXYNe/6ud9RP6O6fn1Pkgi2A5et5Dx082kZGVLQYCoDM9xtrRwAlhGPP1czj
LPF7x40bJ1kjJ7dKUVbRwemVU3IhwLCFLnmLgk7G4rhw16I5SJKpL/GIA5wrtytR81TOBBOECqkX
Xv8Qet9zBgL5sR+MCtCiwNG4TN4dRPW2C/9eAlT9HL7fs6XiemCOu7+70BG4d7SgRHr/Tb5y3vCy
CNiaqeLVewAtS7YDB3l+xQgFg1c5UEnYNEQM467jogjZjnFzlaDRZQfsgOzqjuYQsTS0xWp85Ocl
MC9RoWjkh0J0iX2y4ui/aUBgq2xX1GgReyBDMswTmdaddilGEGbX/cU917WBTtHv1TtzNfW37Wmd
E76lHrqDzwIgEEicVCKCkhpi39GA9oC9Vk4LxpLwvcqT2M8IFaIKUeZNMJIoQjqXyXbBHMlL/ePP
SJJ95YQRPxB0UJ1cQUcpFOLSno5DAnYT25EwLbZqLDB0ayOe6519M0SQQ3ru22+EKShu0tWLthRJ
bY8gC8zaB+cibSwb2Tmr0tl1FnV123Xgm7S+4WNmvjy+VON+KTCmTfB/Q9eVglxiVsWoIW7hjH3j
3vQc2tW8cgMZq8jZqUvHkBvlTurSN5hkfT5/gUBFzvqHRkgdnUyQ0q2mcPjiA6Bif3uLOlQTdzaE
IPLJxt5iZOMhawVfPN4sIXjY1Poxgs5qNg1hx8+fCfJkzPRYcf0b1rtVnwRXeXKfH0zEN7N7Xa5E
lrMimJ7ZDlR3KRpXoINM0tQGIuSFWPdxFUAfWqaD8y1SfbJYGJvxsHoSuym6R4wP4u+bmoLbEHAz
CEEmqsLSnX9WDStjcV38k4uYc9KDSELPk6I/mWLW2qm34P2Zys/AZSCOHsAgoKOO7Wd6jNAuWQ4I
3Ywu+W6DoOy8BLnytJnKYIy1FmGtmx5gpFi+Qu/zzPddrDu4rR0BFykRyVAJW1ZgjUIm8UPhWIVI
1xt7
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
