// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
// Date        : Sat Mar  7 15:13:57 2020
// Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ axi_epc_0_sim_netlist.v
// Design      : axi_epc_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_access_mux
   (prh_cs_n,
    prh_rd_n,
    prh_wr_n,
    prh_data_t,
    prh_addr,
    prh_data_o,
    Asynch_chip_select,
    s_axi_aclk,
    Asynch_Rd,
    Asynch_Wr,
    async_data_oe_i0,
    D,
    \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ,
    s_axi_wdata);
  output [0:0]prh_cs_n;
  output prh_rd_n;
  output prh_wr_n;
  output [0:0]prh_data_t;
  output [0:31]prh_addr;
  output [0:31]prh_data_o;
  input Asynch_chip_select;
  input s_axi_aclk;
  input Asynch_Rd;
  input Asynch_Wr;
  input async_data_oe_i0;
  input [31:0]D;
  input \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ;
  input [31:0]s_axi_wdata;

  wire Asynch_Rd;
  wire Asynch_Wr;
  wire Asynch_chip_select;
  wire [31:0]D;
  wire \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ;
  wire async_data_oe_i0;
  wire [0:31]prh_addr;
  wire [0:0]prh_cs_n;
  wire [0:31]prh_data_o;
  wire [0:0]prh_data_t;
  wire prh_rd_n;
  wire prh_wr_n;
  wire s_axi_aclk;
  wire [31:0]s_axi_wdata;

  FDRE \ALL_DEV_ASYNC_GEN.PRH_CS_n_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Asynch_chip_select),
        .Q(prh_cs_n),
        .R(1'b0));
  FDRE \ALL_DEV_ASYNC_GEN.PRH_Rd_n_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Asynch_Rd),
        .Q(prh_rd_n),
        .R(1'b0));
  FDRE \ALL_DEV_ASYNC_GEN.PRH_Wr_n_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Asynch_Wr),
        .Q(prh_wr_n),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ALL_DEV_ASYNC_GEN.async_data_oe_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(async_data_oe_i0),
        .Q(prh_data_t),
        .R(1'b0));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[31]),
        .Q(prh_data_o[0]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[21]),
        .Q(prh_data_o[10]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[20]),
        .Q(prh_data_o[11]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[19]),
        .Q(prh_data_o[12]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[18]),
        .Q(prh_data_o[13]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[17]),
        .Q(prh_data_o[14]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[16]),
        .Q(prh_data_o[15]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[15]),
        .Q(prh_data_o[16]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[14]),
        .Q(prh_data_o[17]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[13]),
        .Q(prh_data_o[18]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[12]),
        .Q(prh_data_o[19]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[30]),
        .Q(prh_data_o[1]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[11]),
        .Q(prh_data_o[20]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[10]),
        .Q(prh_data_o[21]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[9]),
        .Q(prh_data_o[22]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[8]),
        .Q(prh_data_o[23]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[7]),
        .Q(prh_data_o[24]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[6]),
        .Q(prh_data_o[25]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[5]),
        .Q(prh_data_o[26]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[4]),
        .Q(prh_data_o[27]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[3]),
        .Q(prh_data_o[28]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[2]),
        .Q(prh_data_o[29]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[29]),
        .Q(prh_data_o[2]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[1]),
        .Q(prh_data_o[30]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[0]),
        .Q(prh_data_o[31]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[28]),
        .Q(prh_data_o[3]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[27]),
        .Q(prh_data_o[4]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[26]),
        .Q(prh_data_o[5]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[25]),
        .Q(prh_data_o[6]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[24]),
        .Q(prh_data_o[7]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[23]),
        .Q(prh_data_o[8]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(s_axi_wdata[22]),
        .Q(prh_data_o[9]),
        .R(\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 ));
  FDRE \PRH_Addr_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[31]),
        .Q(prh_addr[0]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[10] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[21]),
        .Q(prh_addr[10]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[11] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[20]),
        .Q(prh_addr[11]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[12] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[19]),
        .Q(prh_addr[12]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[13] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[18]),
        .Q(prh_addr[13]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[14] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[17]),
        .Q(prh_addr[14]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[16]),
        .Q(prh_addr[15]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[15]),
        .Q(prh_addr[16]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[14]),
        .Q(prh_addr[17]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[18] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[13]),
        .Q(prh_addr[18]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[19] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[12]),
        .Q(prh_addr[19]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[30]),
        .Q(prh_addr[1]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[20] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[11]),
        .Q(prh_addr[20]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[21] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[10]),
        .Q(prh_addr[21]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[22] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[9]),
        .Q(prh_addr[22]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[23] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[8]),
        .Q(prh_addr[23]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[24] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[7]),
        .Q(prh_addr[24]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[25] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[6]),
        .Q(prh_addr[25]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[26] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[5]),
        .Q(prh_addr[26]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[27] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[4]),
        .Q(prh_addr[27]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[28] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[3]),
        .Q(prh_addr[28]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[29] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[2]),
        .Q(prh_addr[29]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[29]),
        .Q(prh_addr[2]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[30] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[1]),
        .Q(prh_addr[30]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[31] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[0]),
        .Q(prh_addr[31]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[28]),
        .Q(prh_addr[3]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[27]),
        .Q(prh_addr[4]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[26]),
        .Q(prh_addr[5]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[6] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[25]),
        .Q(prh_addr[6]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[7] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[24]),
        .Q(prh_addr[7]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[8] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[23]),
        .Q(prh_addr[8]),
        .R(1'b0));
  FDRE \PRH_Addr_reg[9] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[22]),
        .Q(prh_addr[9]),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder
   (\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ,
    Bus_RNW_reg_reg_0,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ,
    D,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 ,
    s_axi_wready,
    s_axi_arready,
    ip_async_Wrack_d10,
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT ,
    s_axi_rready_0,
    s_axi_bready_0,
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1 ,
    s_axi_aclk,
    Q,
    ipic_async_req,
    s_axi_rvalid_i_reg,
    s_axi_aresetn,
    s_axi_rvalid_i_reg_0,
    s_axi_arvalid,
    bus2ip_rnw_i0,
    \FSM_onehot_state_reg[0] ,
    \ASYNC_REQ_GEN.ip_async_Wrack_d4_reg ,
    ip2bus_data_int,
    \s_axi_rdata_i_reg[0] ,
    Q_0,
    s_axi_rready,
    s_axi_rvalid_i_reg_1,
    s_axi_bready,
    s_axi_bvalid_i_reg,
    asynch_prh_rdy_d1,
    \s_axi_bresp_i_reg[1] ,
    tdevrdy_wdth_cnt,
    s_axi_bresp);
  output \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ;
  output Bus_RNW_reg_reg_0;
  output \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ;
  output [2:0]D;
  output \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 ;
  output s_axi_wready;
  output s_axi_arready;
  output ip_async_Wrack_d10;
  output [31:0]\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT ;
  output s_axi_rready_0;
  output s_axi_bready_0;
  output \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1 ;
  input s_axi_aclk;
  input Q;
  input ipic_async_req;
  input s_axi_rvalid_i_reg;
  input s_axi_aresetn;
  input [2:0]s_axi_rvalid_i_reg_0;
  input s_axi_arvalid;
  input bus2ip_rnw_i0;
  input \FSM_onehot_state_reg[0] ;
  input \ASYNC_REQ_GEN.ip_async_Wrack_d4_reg ;
  input [30:0]ip2bus_data_int;
  input \s_axi_rdata_i_reg[0] ;
  input Q_0;
  input s_axi_rready;
  input s_axi_rvalid_i_reg_1;
  input s_axi_bready;
  input s_axi_bvalid_i_reg;
  input asynch_prh_rdy_d1;
  input [0:0]\s_axi_bresp_i_reg[1] ;
  input tdevrdy_wdth_cnt;
  input [0:0]s_axi_bresp;

  wire \ASYNC_REQ_GEN.ip_async_Wrack_d4_reg ;
  wire Bus_RNW_reg_i_1_n_0;
  wire Bus_RNW_reg_reg_0;
  wire [2:0]D;
  wire \FSM_onehot_state_reg[0] ;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i[0]_i_1_n_0 ;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 ;
  wire \MEM_DECODE_GEN[0].cs_out_i[0]_i_1_n_0 ;
  wire \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ;
  wire \MEM_DECODE_GEN[0].cs_out_i_reg[0]_1 ;
  wire [31:0]\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT ;
  wire Q;
  wire Q_0;
  wire asynch_prh_rdy_d1;
  wire bus2ip_rnw_i0;
  wire [30:0]ip2bus_data_int;
  wire ip_async_Wrack_d10;
  wire ipic_async_req;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire s_axi_bready;
  wire s_axi_bready_0;
  wire [0:0]s_axi_bresp;
  wire [0:0]\s_axi_bresp_i_reg[1] ;
  wire s_axi_bvalid_i_reg;
  wire \s_axi_rdata_i_reg[0] ;
  wire s_axi_rready;
  wire s_axi_rready_0;
  wire s_axi_rvalid_i_reg;
  wire [2:0]s_axi_rvalid_i_reg_0;
  wire s_axi_rvalid_i_reg_1;
  wire s_axi_wready;
  wire tdevrdy_wdth_cnt;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \ASYNC_REQ_GEN.ip_async_Rdack_d1_r_i_1 
       (.I0(\ASYNC_REQ_GEN.ip_async_Wrack_d4_reg ),
        .I1(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(ip_async_Wrack_d10));
  LUT3 #(
    .INIT(8'hB8)) 
    Bus_RNW_reg_i_1
       (.I0(\s_axi_rdata_i_reg[0] ),
        .I1(Q),
        .I2(Bus_RNW_reg_reg_0),
        .O(Bus_RNW_reg_i_1_n_0));
  FDRE Bus_RNW_reg_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Bus_RNW_reg_i_1_n_0),
        .Q(Bus_RNW_reg_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hCCFCCCEECCCCCCCC)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(s_axi_rvalid_i_reg_0[1]),
        .I1(\FSM_onehot_state_reg[0] ),
        .I2(s_axi_rvalid_i_reg_0[2]),
        .I3(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 ),
        .I4(Bus_RNW_reg_reg_0),
        .I5(s_axi_rvalid_i_reg),
        .O(D[0]));
  LUT6 #(
    .INIT(64'hFD00FFFFFD00FD00)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(s_axi_rvalid_i_reg),
        .I1(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 ),
        .I2(Bus_RNW_reg_reg_0),
        .I3(s_axi_rvalid_i_reg_0[1]),
        .I4(s_axi_arvalid),
        .I5(bus2ip_rnw_i0),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hFFFF8FFF88888888)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(s_axi_arvalid),
        .I1(s_axi_rvalid_i_reg_0[0]),
        .I2(s_axi_rvalid_i_reg),
        .I3(Bus_RNW_reg_reg_0),
        .I4(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 ),
        .I5(s_axi_rvalid_i_reg_0[2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h3FAAFFAA00000000)) 
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i[0]_i_1 
       (.I0(Q),
        .I1(ipic_async_req),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I4(s_axi_rvalid_i_reg),
        .I5(s_axi_aresetn),
        .O(\GEN_BKEND_CE_REGISTERS[0].ce_out_i[0]_i_1_n_0 ));
  FDRE \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\GEN_BKEND_CE_REGISTERS[0].ce_out_i[0]_i_1_n_0 ),
        .Q(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h3AFAFAFA00000000)) 
    \MEM_DECODE_GEN[0].cs_out_i[0]_i_1 
       (.I0(Q),
        .I1(ipic_async_req),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .I3(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I4(s_axi_rvalid_i_reg),
        .I5(s_axi_aresetn),
        .O(\MEM_DECODE_GEN[0].cs_out_i[0]_i_1_n_0 ));
  FDRE \MEM_DECODE_GEN[0].cs_out_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\MEM_DECODE_GEN[0].cs_out_i[0]_i_1_n_0 ),
        .Q(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    s_axi_arready_INST_0
       (.I0(s_axi_rvalid_i_reg),
        .I1(Bus_RNW_reg_reg_0),
        .I2(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I3(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .I4(ipic_async_req),
        .O(s_axi_arready));
  LUT6 #(
    .INIT(64'h2000FFFF20000000)) 
    \s_axi_bresp_i[1]_i_1 
       (.I0(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .I1(asynch_prh_rdy_d1),
        .I2(\s_axi_bresp_i_reg[1] ),
        .I3(tdevrdy_wdth_cnt),
        .I4(s_axi_rvalid_i_reg_0[1]),
        .I5(s_axi_bresp),
        .O(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_1 ));
  LUT6 #(
    .INIT(64'h555D5555000C0000)) 
    s_axi_bvalid_i_i_1
       (.I0(s_axi_bready),
        .I1(s_axi_rvalid_i_reg),
        .I2(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 ),
        .I3(Bus_RNW_reg_reg_0),
        .I4(s_axi_rvalid_i_reg_0[1]),
        .I5(s_axi_bvalid_i_reg),
        .O(s_axi_bready_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    s_axi_bvalid_i_i_2
       (.I0(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I1(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .I2(ipic_async_req),
        .O(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[0]_i_1 
       (.I0(ip2bus_data_int[0]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[10]_i_1 
       (.I0(ip2bus_data_int[10]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [10]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[11]_i_1 
       (.I0(ip2bus_data_int[11]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [11]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[12]_i_1 
       (.I0(ip2bus_data_int[12]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [12]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[13]_i_1 
       (.I0(ip2bus_data_int[13]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [13]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[14]_i_1 
       (.I0(ip2bus_data_int[14]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [14]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[15]_i_1 
       (.I0(ip2bus_data_int[15]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [15]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[16]_i_1 
       (.I0(ip2bus_data_int[16]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [16]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[17]_i_1 
       (.I0(ip2bus_data_int[17]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [17]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[18]_i_1 
       (.I0(ip2bus_data_int[18]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [18]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[19]_i_1 
       (.I0(ip2bus_data_int[19]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [19]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[1]_i_1 
       (.I0(ip2bus_data_int[1]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [1]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[20]_i_1 
       (.I0(ip2bus_data_int[20]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [20]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[21]_i_1 
       (.I0(ip2bus_data_int[21]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [21]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[22]_i_1 
       (.I0(ip2bus_data_int[22]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [22]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[23]_i_1 
       (.I0(ip2bus_data_int[23]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [23]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[24]_i_1 
       (.I0(ip2bus_data_int[24]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [24]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[25]_i_1 
       (.I0(ip2bus_data_int[25]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [25]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[26]_i_1 
       (.I0(ip2bus_data_int[26]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [26]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[27]_i_1 
       (.I0(ip2bus_data_int[27]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [27]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[28]_i_1 
       (.I0(ip2bus_data_int[28]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [28]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[29]_i_1 
       (.I0(ip2bus_data_int[29]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [29]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[2]_i_1 
       (.I0(ip2bus_data_int[2]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[30]_i_1 
       (.I0(ip2bus_data_int[30]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [30]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[31]_i_1 
       (.I0(Q_0),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [31]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[3]_i_1 
       (.I0(ip2bus_data_int[3]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[4]_i_1 
       (.I0(ip2bus_data_int[4]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[5]_i_1 
       (.I0(ip2bus_data_int[5]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[6]_i_1 
       (.I0(ip2bus_data_int[6]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[7]_i_1 
       (.I0(ip2bus_data_int[7]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [7]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[8]_i_1 
       (.I0(ip2bus_data_int[8]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [8]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \s_axi_rdata_i[9]_i_1 
       (.I0(ip2bus_data_int[9]),
        .I1(\s_axi_rdata_i_reg[0] ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .O(\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT [9]));
  LUT6 #(
    .INIT(64'h55D5555500C00000)) 
    s_axi_rvalid_i_i_1
       (.I0(s_axi_rready),
        .I1(s_axi_rvalid_i_reg),
        .I2(Bus_RNW_reg_reg_0),
        .I3(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 ),
        .I4(s_axi_rvalid_i_reg_0[2]),
        .I5(s_axi_rvalid_i_reg_1),
        .O(s_axi_rready_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    s_axi_wready_INST_0
       (.I0(s_axi_rvalid_i_reg),
        .I1(\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .I2(\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 ),
        .I3(ipic_async_req),
        .I4(Bus_RNW_reg_reg_0),
        .O(s_axi_wready));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_cntl
   (\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ,
    \SOME_DEV_ASYNC_GEN.REG_PRH_RDY_0 ,
    Asynch_chip_select,
    Asynch_Rd,
    Asynch_Wr,
    async_data_oe_i0,
    Q,
    ip2bus_error,
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ,
    no_steer_async_ce,
    bus2ip_reset_active_high,
    s_axi_aclk,
    dev_rdy,
    bus2ip_cs,
    ce_out_i,
    \FSM_onehot_command_cs_reg[1] ,
    Bus_RNW_reg,
    Asynch_Wr_reg,
    bus2ip_rnw,
    dev_dbus_width);
  output \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ;
  output \SOME_DEV_ASYNC_GEN.REG_PRH_RDY_0 ;
  output Asynch_chip_select;
  output Asynch_Rd;
  output Asynch_Wr;
  output async_data_oe_i0;
  output [0:0]Q;
  output ip2bus_error;
  output \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ;
  output [0:0]no_steer_async_ce;
  input bus2ip_reset_active_high;
  input s_axi_aclk;
  input dev_rdy;
  input bus2ip_cs;
  input ce_out_i;
  input \FSM_onehot_command_cs_reg[1] ;
  input Bus_RNW_reg;
  input Asynch_Wr_reg;
  input bus2ip_rnw;
  input [0:0]dev_dbus_width;

  wire Asynch_Rd;
  wire Asynch_Wr;
  wire Asynch_Wr_reg;
  wire Asynch_chip_select;
  wire Bus_RNW_reg;
  wire \FSM_onehot_command_cs_reg[1] ;
  wire \LD_ARITH_REG_I_CNTR3/CE ;
  wire \LD_ARITH_REG_I_CNTR4/CE ;
  wire \LD_ARITH_REG_I_CNTR7/CE ;
  wire \LD_ARITH_REG_I_CNTR8/CE ;
  wire \LD_ARITH_REG_I_NON_MUXED_CNTR5/CE ;
  wire \LD_ARITH_REG_I_NON_MUXED_CNTR9/CE ;
  wire \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ;
  wire \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ;
  wire [0:0]Q;
  wire \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_10 ;
  wire \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_12 ;
  wire \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_6 ;
  wire \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_7 ;
  wire \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_8 ;
  wire \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_9 ;
  wire \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_11 ;
  wire \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_12 ;
  wire \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_13 ;
  wire \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_14 ;
  wire \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_16 ;
  wire \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_17 ;
  wire \SOME_DEV_ASYNC_GEN.REG_PRH_RDY_0 ;
  wire async_data_oe_i0;
  wire async_en;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire bus2ip_rnw;
  wire ce_out_i;
  wire [0:0]dev_dbus_width;
  wire dev_rdy;
  wire ip2bus_error;
  wire [0:0]no_steer_async_ce;
  wire s_axi_aclk;
  wire taddr_data_cs_hold_cnt;
  wire tads_cnt;
  wire tads_ld_ce_i;
  wire tcontrol_wdth_cnt;
  wire tdata_hold_ld_ce_i;
  wire tdev_rdy_ld_ce_i;
  wire tdev_valid_ld_ce_i;
  wire trd_non_muxed_rec_cnt;
  wire trd_non_muxed_recovery_load_ce_i;
  wire twr_non_muxed_rec_cnt;
  wire twr_non_muxed_recovery_load_ce_i;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_counters \SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I 
       (.Bus_RNW_reg(Bus_RNW_reg),
        .CE(\LD_ARITH_REG_I_CNTR3/CE ),
        .CE_0(\LD_ARITH_REG_I_CNTR4/CE ),
        .CE_1(\LD_ARITH_REG_I_CNTR7/CE ),
        .CE_2(\LD_ARITH_REG_I_CNTR8/CE ),
        .CE_3(\LD_ARITH_REG_I_NON_MUXED_CNTR5/CE ),
        .CE_4(\LD_ARITH_REG_I_NON_MUXED_CNTR9/CE ),
        .D({\SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_6 ,\SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_7 ,\SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_8 ,\SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_9 ,\SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_10 }),
        .\FSM_onehot_command_cs_reg[4] (\SOME_DEV_ASYNC_GEN.REG_PRH_RDY_0 ),
        .\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 (\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ),
        .\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 (\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ),
        .\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 (\SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_12 ),
        .Q({\SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_11 ,\SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_12 ,\SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_13 ,\SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_14 ,Q,\SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_16 ,\SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_17 }),
        .Trd_non_muxed_recovery_load_ce_reg(Asynch_Wr_reg),
        .async_en(async_en),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .ce_out_i(ce_out_i),
        .s_axi_aclk(s_axi_aclk),
        .taddr_data_cs_hold_cnt(taddr_data_cs_hold_cnt),
        .tads_cnt(tads_cnt),
        .tads_ld_ce_i(tads_ld_ce_i),
        .tcontrol_wdth_cnt(tcontrol_wdth_cnt),
        .tdata_hold_ld_ce_i(tdata_hold_ld_ce_i),
        .tdev_rdy_ld_ce_i(tdev_rdy_ld_ce_i),
        .tdev_valid_ld_ce_i(tdev_valid_ld_ce_i),
        .trd_non_muxed_rec_cnt(trd_non_muxed_rec_cnt),
        .trd_non_muxed_recovery_load_ce_i(trd_non_muxed_recovery_load_ce_i),
        .twr_non_muxed_rec_cnt(twr_non_muxed_rec_cnt),
        .twr_non_muxed_recovery_load_ce_i(twr_non_muxed_recovery_load_ce_i));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_statemachine \SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I 
       (.Asynch_Rd(Asynch_Rd),
        .Asynch_Wr(Asynch_Wr),
        .Asynch_Wr_reg_0(Asynch_Wr_reg),
        .Asynch_chip_select(Asynch_chip_select),
        .\Asynch_chip_select_reg[0]_0 (\SOME_DEV_ASYNC_GEN.REG_PRH_RDY_0 ),
        .\Asynch_chip_select_reg[0]_1 (\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ),
        .Bus_RNW_reg(Bus_RNW_reg),
        .CE(\LD_ARITH_REG_I_NON_MUXED_CNTR9/CE ),
        .CE_0(\LD_ARITH_REG_I_NON_MUXED_CNTR5/CE ),
        .CE_1(\LD_ARITH_REG_I_CNTR8/CE ),
        .CE_2(\LD_ARITH_REG_I_CNTR7/CE ),
        .CE_3(\LD_ARITH_REG_I_CNTR3/CE ),
        .CE_4(\LD_ARITH_REG_I_CNTR4/CE ),
        .D({\SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_6 ,\SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_7 ,\SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_8 ,\SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_9 ,\SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_10 }),
        .\FSM_onehot_command_cs_reg[0]_0 (\SOME_DEV_ASYNC_GEN.ASYNC_CNTR_I_n_12 ),
        .\FSM_onehot_command_cs_reg[1]_0 (\FSM_onehot_command_cs_reg[1] ),
        .Q({\SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_11 ,\SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_12 ,\SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_13 ,\SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_14 ,Q,\SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_16 ,\SOME_DEV_ASYNC_GEN.ASYNC_STATEMACHINE_I_n_17 }),
        .async_data_oe_i0(async_data_oe_i0),
        .async_en(async_en),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .bus2ip_rnw(bus2ip_rnw),
        .ce_out_i(ce_out_i),
        .dev_dbus_width(dev_dbus_width),
        .ip2bus_error(ip2bus_error),
        .no_steer_async_ce(no_steer_async_ce),
        .s_axi_aclk(s_axi_aclk),
        .taddr_data_cs_hold_cnt(taddr_data_cs_hold_cnt),
        .tads_cnt(tads_cnt),
        .tads_ld_ce_i(tads_ld_ce_i),
        .tcontrol_wdth_cnt(tcontrol_wdth_cnt),
        .tdata_hold_ld_ce_i(tdata_hold_ld_ce_i),
        .tdev_rdy_ld_ce_i(tdev_rdy_ld_ce_i),
        .tdev_valid_ld_ce_i(tdev_valid_ld_ce_i),
        .trd_non_muxed_rec_cnt(trd_non_muxed_rec_cnt),
        .trd_non_muxed_recovery_load_ce_i(trd_non_muxed_recovery_load_ce_i),
        .twr_non_muxed_rec_cnt(twr_non_muxed_rec_cnt),
        .twr_non_muxed_recovery_load_ce_i(twr_non_muxed_recovery_load_ce_i));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \SOME_DEV_ASYNC_GEN.REG_PRH_RDY 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(dev_rdy),
        .Q(\SOME_DEV_ASYNC_GEN.REG_PRH_RDY_0 ),
        .R(bus2ip_reset_active_high));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_counters
   (tcontrol_wdth_cnt,
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ,
    tads_cnt,
    taddr_data_cs_hold_cnt,
    twr_non_muxed_rec_cnt,
    trd_non_muxed_rec_cnt,
    D,
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ,
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 ,
    async_en,
    bus2ip_reset_active_high,
    CE,
    s_axi_aclk,
    tdev_rdy_ld_ce_i,
    CE_0,
    tdev_valid_ld_ce_i,
    CE_1,
    tads_ld_ce_i,
    CE_2,
    tdata_hold_ld_ce_i,
    twr_non_muxed_recovery_load_ce_i,
    CE_3,
    trd_non_muxed_recovery_load_ce_i,
    CE_4,
    bus2ip_cs,
    ce_out_i,
    Q,
    Bus_RNW_reg,
    Trd_non_muxed_recovery_load_ce_reg,
    \FSM_onehot_command_cs_reg[4] );
  output tcontrol_wdth_cnt;
  output \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ;
  output tads_cnt;
  output taddr_data_cs_hold_cnt;
  output twr_non_muxed_rec_cnt;
  output trd_non_muxed_rec_cnt;
  output [4:0]D;
  output \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ;
  output \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 ;
  input async_en;
  input bus2ip_reset_active_high;
  input CE;
  input s_axi_aclk;
  input tdev_rdy_ld_ce_i;
  input CE_0;
  input tdev_valid_ld_ce_i;
  input CE_1;
  input tads_ld_ce_i;
  input CE_2;
  input tdata_hold_ld_ce_i;
  input twr_non_muxed_recovery_load_ce_i;
  input CE_3;
  input trd_non_muxed_recovery_load_ce_i;
  input CE_4;
  input bus2ip_cs;
  input ce_out_i;
  input [6:0]Q;
  input Bus_RNW_reg;
  input Trd_non_muxed_recovery_load_ce_reg;
  input \FSM_onehot_command_cs_reg[4] ;

  wire Bus_RNW_reg;
  wire CE;
  wire CE_0;
  wire CE_1;
  wire CE_2;
  wire CE_3;
  wire CE_4;
  wire [4:0]D;
  wire \FSM_onehot_command_cs_reg[4] ;
  wire \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ;
  wire \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ;
  wire \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 ;
  wire [6:0]Q;
  wire Trd_non_muxed_recovery_load_ce_reg;
  wire async_en;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire ce_out_i;
  wire s_axi_aclk;
  wire taddr_data_cs_hold_cnt;
  wire tads_cnt;
  wire tads_ld_ce_i;
  wire tcontrol_wdth_cnt;
  wire tdata_hold_ld_ce_i;
  wire tdev_rdy_ld_ce_i;
  wire tdev_valid_cnt;
  wire tdev_valid_ld_ce_i;
  wire trd_non_muxed_rec_cnt;
  wire trd_non_muxed_recovery_load_ce_i;
  wire twr_non_muxed_rec_cnt;
  wire twr_non_muxed_recovery_load_ce_i;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg LD_ARITH_REG_I_CNTR12
       (.\ASYNC_REQ_GEN.local_async_req_reg (\FSM_onehot_command_cs_reg[4] ),
        .\ASYNC_REQ_GEN.local_async_req_reg_0 (\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ),
        .D(D[2]),
        .\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 (taddr_data_cs_hold_cnt),
        .\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 (\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ),
        .Q(Q[4:2]),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .s_axi_aclk(s_axi_aclk),
        .tcontrol_wdth_cnt(tcontrol_wdth_cnt),
        .tdata_hold_ld_ce_i(tdata_hold_ld_ce_i));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_0 LD_ARITH_REG_I_CNTR3
       (.CE(CE),
        .async_en(async_en),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .ce_out_i(ce_out_i),
        .s_axi_aclk(s_axi_aclk),
        .tcontrol_wdth_cnt(tcontrol_wdth_cnt));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_1 LD_ARITH_REG_I_CNTR4
       (.CE_0(CE_0),
        .\FSM_onehot_command_cs_reg[0] (\FSM_onehot_command_cs_reg[4] ),
        .\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 (\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ),
        .\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 (\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 ),
        .Q(Q[2]),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .s_axi_aclk(s_axi_aclk),
        .tdev_rdy_ld_ce_i(tdev_rdy_ld_ce_i));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_2 LD_ARITH_REG_I_CNTR7
       (.CE_1(CE_1),
        .D(D[1]),
        .\FSM_onehot_command_cs_reg[4] (\FSM_onehot_command_cs_reg[4] ),
        .\FSM_onehot_command_cs_reg[4]_0 (\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ),
        .Q(Q[2:1]),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .s_axi_aclk(s_axi_aclk),
        .tdev_valid_cnt(tdev_valid_cnt),
        .tdev_valid_ld_ce_i(tdev_valid_ld_ce_i));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_3 LD_ARITH_REG_I_CNTR8
       (.CE_2(CE_2),
        .D(D[0]),
        .Q(Q[1:0]),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .s_axi_aclk(s_axi_aclk),
        .tads_cnt(tads_cnt),
        .tads_ld_ce_i(tads_ld_ce_i),
        .tdev_valid_cnt(tdev_valid_cnt));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_4 LD_ARITH_REG_I_NON_MUXED_CNTR5
       (.Bus_RNW_reg(Bus_RNW_reg),
        .CE_3(CE_3),
        .D(D[3]),
        .Q(Q[5:4]),
        .Twr_non_muxed_recovery_load_ce_reg(Trd_non_muxed_recovery_load_ce_reg),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .s_axi_aclk(s_axi_aclk),
        .taddr_data_cs_hold_cnt(taddr_data_cs_hold_cnt),
        .twr_non_muxed_rec_cnt(twr_non_muxed_rec_cnt),
        .twr_non_muxed_recovery_load_ce_i(twr_non_muxed_recovery_load_ce_i));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_5 LD_ARITH_REG_I_NON_MUXED_CNTR9
       (.Bus_RNW_reg(Bus_RNW_reg),
        .CE_4(CE_4),
        .D(D[4]),
        .Q({Q[6],Q[4]}),
        .Trd_non_muxed_recovery_load_ce_reg(Trd_non_muxed_recovery_load_ce_reg),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .s_axi_aclk(s_axi_aclk),
        .taddr_data_cs_hold_cnt(taddr_data_cs_hold_cnt),
        .trd_non_muxed_rec_cnt(trd_non_muxed_rec_cnt),
        .trd_non_muxed_recovery_load_ce_i(trd_non_muxed_recovery_load_ce_i));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_statemachine
   (tdata_hold_ld_ce_i,
    async_en,
    tdev_valid_ld_ce_i,
    tdev_rdy_ld_ce_i,
    tads_ld_ce_i,
    twr_non_muxed_recovery_load_ce_i,
    trd_non_muxed_recovery_load_ce_i,
    Asynch_chip_select,
    Asynch_Rd,
    Asynch_Wr,
    async_data_oe_i0,
    Q,
    ip2bus_error,
    CE,
    CE_0,
    CE_1,
    CE_2,
    CE_3,
    CE_4,
    no_steer_async_ce,
    D,
    s_axi_aclk,
    twr_non_muxed_rec_cnt,
    trd_non_muxed_rec_cnt,
    \FSM_onehot_command_cs_reg[0]_0 ,
    \FSM_onehot_command_cs_reg[1]_0 ,
    bus2ip_cs,
    ce_out_i,
    taddr_data_cs_hold_cnt,
    Asynch_Wr_reg_0,
    Bus_RNW_reg,
    tcontrol_wdth_cnt,
    \Asynch_chip_select_reg[0]_0 ,
    \Asynch_chip_select_reg[0]_1 ,
    tads_cnt,
    bus2ip_rnw,
    dev_dbus_width,
    bus2ip_reset_active_high);
  output tdata_hold_ld_ce_i;
  output async_en;
  output tdev_valid_ld_ce_i;
  output tdev_rdy_ld_ce_i;
  output tads_ld_ce_i;
  output twr_non_muxed_recovery_load_ce_i;
  output trd_non_muxed_recovery_load_ce_i;
  output Asynch_chip_select;
  output Asynch_Rd;
  output Asynch_Wr;
  output async_data_oe_i0;
  output [6:0]Q;
  output ip2bus_error;
  output CE;
  output CE_0;
  output CE_1;
  output CE_2;
  output CE_3;
  output CE_4;
  output [0:0]no_steer_async_ce;
  input [4:0]D;
  input s_axi_aclk;
  input twr_non_muxed_rec_cnt;
  input trd_non_muxed_rec_cnt;
  input \FSM_onehot_command_cs_reg[0]_0 ;
  input \FSM_onehot_command_cs_reg[1]_0 ;
  input bus2ip_cs;
  input ce_out_i;
  input taddr_data_cs_hold_cnt;
  input Asynch_Wr_reg_0;
  input Bus_RNW_reg;
  input tcontrol_wdth_cnt;
  input \Asynch_chip_select_reg[0]_0 ;
  input \Asynch_chip_select_reg[0]_1 ;
  input tads_cnt;
  input bus2ip_rnw;
  input [0:0]dev_dbus_width;
  input bus2ip_reset_active_high;

  wire Asynch_Rd;
  wire Asynch_Rd_i_1_n_0;
  wire Asynch_Wr;
  wire Asynch_Wr_i_1_n_0;
  wire Asynch_Wr_reg_0;
  wire Asynch_chip_select;
  wire \Asynch_chip_select_reg[0]_0 ;
  wire \Asynch_chip_select_reg[0]_1 ;
  wire Asynch_data_sel_inv_i_2_n_0;
  wire Bus_RNW_reg;
  wire CE;
  wire CE_0;
  wire CE_1;
  wire CE_2;
  wire CE_3;
  wire CE_4;
  wire [4:0]D;
  wire \FSM_onehot_command_cs[0]_i_1_n_0 ;
  wire \FSM_onehot_command_cs[0]_i_2_n_0 ;
  wire \FSM_onehot_command_cs[1]_i_1_n_0 ;
  wire \FSM_onehot_command_cs[2]_i_1_n_0 ;
  wire \FSM_onehot_command_cs[5]_i_1_n_0 ;
  wire \FSM_onehot_command_cs_reg[0]_0 ;
  wire \FSM_onehot_command_cs_reg[1]_0 ;
  wire [6:0]Q;
  wire async_addr_cnt_ld;
  wire async_data_oe_i0;
  wire async_en;
  wire asynch_chip_select_n;
  wire asynch_data_sel_i;
  wire asynch_start_i;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire bus2ip_rnw;
  wire ce_out_i;
  wire [0:0]dev_dbus_width;
  wire ip2bus_error;
  wire [0:0]no_steer_async_ce;
  wire s_axi_aclk;
  wire taddr_data_cs_hold_cnt;
  wire tads_cnt;
  wire tads_ld_ce_i;
  wire tcontrol_wdth_cnt;
  wire tdata_hold_ld_ce_i;
  wire tdev_rdy_ld_ce_i;
  wire tdev_rdy_load_ce_i;
  wire tdev_valid_ld_ce_i;
  wire trd_non_muxed_rec_cnt;
  wire trd_non_muxed_recovery_load_ce_i;
  wire twr_non_muxed_rec_cnt;
  wire twr_non_muxed_recovery_load_ce_i;

  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'hDDDDFFDF)) 
    Asynch_Rd_i_1
       (.I0(Bus_RNW_reg),
        .I1(Asynch_Wr_reg_0),
        .I2(Q[3]),
        .I3(tcontrol_wdth_cnt),
        .I4(tdev_rdy_load_ce_i),
        .O(Asynch_Rd_i_1_n_0));
  FDRE Asynch_Rd_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Asynch_Rd_i_1_n_0),
        .Q(Asynch_Rd),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'hEEEEFFEF)) 
    Asynch_Wr_i_1
       (.I0(Asynch_Wr_reg_0),
        .I1(Bus_RNW_reg),
        .I2(Q[3]),
        .I3(tcontrol_wdth_cnt),
        .I4(tdev_rdy_load_ce_i),
        .O(Asynch_Wr_i_1_n_0));
  FDRE Asynch_Wr_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(Asynch_Wr_i_1_n_0),
        .Q(Asynch_Wr),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'hFFFF40FF)) 
    \Asynch_chip_select[0]_i_1 
       (.I0(\Asynch_chip_select_reg[0]_0 ),
        .I1(Q[2]),
        .I2(\Asynch_chip_select_reg[0]_1 ),
        .I3(bus2ip_cs),
        .I4(async_addr_cnt_ld),
        .O(asynch_chip_select_n));
  FDRE \Asynch_chip_select_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(asynch_chip_select_n),
        .Q(Asynch_chip_select),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000008A)) 
    Asynch_data_sel_inv_i_1
       (.I0(Asynch_data_sel_inv_i_2_n_0),
        .I1(taddr_data_cs_hold_cnt),
        .I2(Q[4]),
        .I3(Q[3]),
        .I4(Q[2]),
        .I5(bus2ip_rnw),
        .O(asynch_data_sel_i));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h15)) 
    Asynch_data_sel_inv_i_2
       (.I0(Q[1]),
        .I1(tads_cnt),
        .I2(Q[0]),
        .O(Asynch_data_sel_inv_i_2_n_0));
  FDRE #(
    .INIT(1'b1)) 
    Asynch_data_sel_reg_inv
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(asynch_data_sel_i),
        .Q(async_data_oe_i0),
        .R(1'b0));
  FDRE Asynch_en_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_command_cs[5]_i_1_n_0 ),
        .Q(async_en),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFEAEAEA)) 
    \FSM_onehot_command_cs[0]_i_1 
       (.I0(\FSM_onehot_command_cs[0]_i_2_n_0 ),
        .I1(Q[5]),
        .I2(twr_non_muxed_rec_cnt),
        .I3(Q[6]),
        .I4(trd_non_muxed_rec_cnt),
        .I5(\FSM_onehot_command_cs_reg[0]_0 ),
        .O(\FSM_onehot_command_cs[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7F7F7F7F7F000000)) 
    \FSM_onehot_command_cs[0]_i_2 
       (.I0(\FSM_onehot_command_cs_reg[1]_0 ),
        .I1(bus2ip_cs),
        .I2(ce_out_i),
        .I3(Q[4]),
        .I4(taddr_data_cs_hold_cnt),
        .I5(async_addr_cnt_ld),
        .O(\FSM_onehot_command_cs[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \FSM_onehot_command_cs[1]_i_1 
       (.I0(async_addr_cnt_ld),
        .I1(\FSM_onehot_command_cs_reg[1]_0 ),
        .I2(bus2ip_cs),
        .I3(ce_out_i),
        .O(\FSM_onehot_command_cs[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    \FSM_onehot_command_cs[2]_i_1 
       (.I0(asynch_start_i),
        .I1(tads_cnt),
        .I2(Q[0]),
        .O(\FSM_onehot_command_cs[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF444)) 
    \FSM_onehot_command_cs[5]_i_1 
       (.I0(tcontrol_wdth_cnt),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(\Asynch_chip_select_reg[0]_0 ),
        .O(\FSM_onehot_command_cs[5]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_command_cs_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_command_cs[0]_i_1_n_0 ),
        .Q(async_addr_cnt_ld),
        .S(bus2ip_reset_active_high));
  (* FSM_ENCODED_STATES = "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_command_cs_reg[15] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[2]),
        .Q(Q[4]),
        .R(bus2ip_reset_active_high));
  (* FSM_ENCODED_STATES = "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_command_cs_reg[16] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[3]),
        .Q(Q[5]),
        .R(bus2ip_reset_active_high));
  (* FSM_ENCODED_STATES = "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_command_cs_reg[17] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[4]),
        .Q(Q[6]),
        .R(bus2ip_reset_active_high));
  (* FSM_ENCODED_STATES = "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_command_cs_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_command_cs[1]_i_1_n_0 ),
        .Q(asynch_start_i),
        .R(bus2ip_reset_active_high));
  (* FSM_ENCODED_STATES = "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_command_cs_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_command_cs[2]_i_1_n_0 ),
        .Q(Q[0]),
        .R(bus2ip_reset_active_high));
  (* FSM_ENCODED_STATES = "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_command_cs_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[0]),
        .Q(Q[1]),
        .R(bus2ip_reset_active_high));
  (* FSM_ENCODED_STATES = "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_command_cs_reg[4] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[1]),
        .Q(Q[2]),
        .R(bus2ip_reset_active_high));
  (* FSM_ENCODED_STATES = "wr_muxed_recovery:000000000010000000,ack_gen_muxed:000000000001000000,ack_gen_non_muxed:001000000000000000,dummy_st:000100000000000000,rd_non_muxed_recovery:100000000000000000,start_state:000000000000000010,rd_muxed_recovery:000000000100000000,dummy_ads:000001000000000000,control_deassert:000000000000100000,idle:000000000000000001,dev_rdy_m:000000010000000000,dev_valid:000000000000001000,m_control_assert:000010000000000000,dev_valid_m:000000001000000000,dev_rdy:000000000000010000,nm_control_assert:000000000000000100,ads_assert:000000100000000000,wr_non_muxed_recovery:010000000000000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_command_cs_reg[5] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_command_cs[5]_i_1_n_0 ),
        .Q(Q[3]),
        .R(bus2ip_reset_active_high));
  LUT2 #(
    .INIT(4'h8)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT_i_1 
       (.I0(async_en),
        .I1(dev_dbus_width),
        .O(no_steer_async_ce));
  LUT3 #(
    .INIT(8'hFE)) 
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1 
       (.I0(trd_non_muxed_recovery_load_ce_i),
        .I1(async_addr_cnt_ld),
        .I2(Q[4]),
        .O(CE));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__0 
       (.I0(twr_non_muxed_recovery_load_ce_i),
        .I1(async_addr_cnt_ld),
        .I2(Q[4]),
        .O(CE_0));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__1 
       (.I0(tads_ld_ce_i),
        .I1(async_addr_cnt_ld),
        .I2(Q[4]),
        .O(CE_1));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__2 
       (.I0(tdev_valid_ld_ce_i),
        .I1(async_addr_cnt_ld),
        .I2(Q[4]),
        .O(CE_2));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__3 
       (.I0(async_en),
        .I1(async_addr_cnt_ld),
        .I2(Q[4]),
        .O(CE_3));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_i_1__4 
       (.I0(async_addr_cnt_ld),
        .I1(tdev_rdy_ld_ce_i),
        .O(CE_4));
  FDRE Tads_load_ce_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_command_cs[2]_i_1_n_0 ),
        .Q(tads_ld_ce_i),
        .R(1'b0));
  FDRE Tdata_hold_load_ce_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[2]),
        .Q(tdata_hold_ld_ce_i),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFD0D0D0)) 
    Tdev_rdy_load_ce_i_1
       (.I0(\Asynch_chip_select_reg[0]_1 ),
        .I1(\Asynch_chip_select_reg[0]_0 ),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(tads_cnt),
        .I5(Q[1]),
        .O(tdev_rdy_load_ce_i));
  FDRE Tdev_rdy_load_ce_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(tdev_rdy_load_ce_i),
        .Q(tdev_rdy_ld_ce_i),
        .R(1'b0));
  FDRE Tdev_valid_load_ce_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[0]),
        .Q(tdev_valid_ld_ce_i),
        .R(1'b0));
  FDRE Trd_non_muxed_recovery_load_ce_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[4]),
        .Q(trd_non_muxed_recovery_load_ce_i),
        .R(1'b0));
  FDRE Twr_non_muxed_recovery_load_ce_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D[3]),
        .Q(twr_non_muxed_recovery_load_ce_i),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \s_axi_rresp_i[1]_i_1 
       (.I0(bus2ip_cs),
        .I1(\Asynch_chip_select_reg[0]_0 ),
        .I2(Q[2]),
        .I3(\Asynch_chip_select_reg[0]_1 ),
        .O(ip2bus_error));
endmodule

(* C_FAMILY = "zynq" *) (* C_INSTANCE = "axi_epc_inst" *) (* C_NUM_PERIPHERALS = "1" *) 
(* C_PRH0_ADDR_TH = "0" *) (* C_PRH0_ADDR_TSU = "0" *) (* C_PRH0_ADS_WIDTH = "0" *) 
(* C_PRH0_AWIDTH = "32" *) (* C_PRH0_BASEADDR = "-1610547201" *) (* C_PRH0_BUS_MULTIPLEX = "0" *) 
(* C_PRH0_CSN_TH = "0" *) (* C_PRH0_CSN_TSU = "0" *) (* C_PRH0_DATA_TH = "0" *) 
(* C_PRH0_DATA_TINV = "0" *) (* C_PRH0_DATA_TOUT = "0" *) (* C_PRH0_DATA_TSU = "0" *) 
(* C_PRH0_DWIDTH = "32" *) (* C_PRH0_DWIDTH_MATCH = "0" *) (* C_PRH0_FIFO_ACCESS = "0" *) 
(* C_PRH0_FIFO_OFFSET = "0" *) (* C_PRH0_HIGHADDR = "-1342177281" *) (* C_PRH0_RDN_WIDTH = "0" *) 
(* C_PRH0_RDY_TOUT = "0" *) (* C_PRH0_RDY_WIDTH = "0" *) (* C_PRH0_RD_CYCLE = "0" *) 
(* C_PRH0_SYNC = "0" *) (* C_PRH0_WRN_WIDTH = "0" *) (* C_PRH0_WR_CYCLE = "0" *) 
(* C_PRH1_ADDR_TH = "0" *) (* C_PRH1_ADDR_TSU = "0" *) (* C_PRH1_ADS_WIDTH = "0" *) 
(* C_PRH1_AWIDTH = "32" *) (* C_PRH1_BASEADDR = "-1342111745" *) (* C_PRH1_BUS_MULTIPLEX = "0" *) 
(* C_PRH1_CSN_TH = "0" *) (* C_PRH1_CSN_TSU = "0" *) (* C_PRH1_DATA_TH = "0" *) 
(* C_PRH1_DATA_TINV = "0" *) (* C_PRH1_DATA_TOUT = "0" *) (* C_PRH1_DATA_TSU = "0" *) 
(* C_PRH1_DWIDTH = "32" *) (* C_PRH1_DWIDTH_MATCH = "0" *) (* C_PRH1_FIFO_ACCESS = "0" *) 
(* C_PRH1_FIFO_OFFSET = "0" *) (* C_PRH1_HIGHADDR = "-1073741825" *) (* C_PRH1_RDN_WIDTH = "0" *) 
(* C_PRH1_RDY_TOUT = "0" *) (* C_PRH1_RDY_WIDTH = "0" *) (* C_PRH1_RD_CYCLE = "0" *) 
(* C_PRH1_SYNC = "0" *) (* C_PRH1_WRN_WIDTH = "0" *) (* C_PRH1_WR_CYCLE = "0" *) 
(* C_PRH2_ADDR_TH = "0" *) (* C_PRH2_ADDR_TSU = "0" *) (* C_PRH2_ADS_WIDTH = "0" *) 
(* C_PRH2_AWIDTH = "32" *) (* C_PRH2_BASEADDR = "-1073676289" *) (* C_PRH2_BUS_MULTIPLEX = "0" *) 
(* C_PRH2_CSN_TH = "0" *) (* C_PRH2_CSN_TSU = "0" *) (* C_PRH2_DATA_TH = "0" *) 
(* C_PRH2_DATA_TINV = "0" *) (* C_PRH2_DATA_TOUT = "0" *) (* C_PRH2_DATA_TSU = "0" *) 
(* C_PRH2_DWIDTH = "32" *) (* C_PRH2_DWIDTH_MATCH = "0" *) (* C_PRH2_FIFO_ACCESS = "0" *) 
(* C_PRH2_FIFO_OFFSET = "0" *) (* C_PRH2_HIGHADDR = "-805306369" *) (* C_PRH2_RDN_WIDTH = "0" *) 
(* C_PRH2_RDY_TOUT = "0" *) (* C_PRH2_RDY_WIDTH = "0" *) (* C_PRH2_RD_CYCLE = "0" *) 
(* C_PRH2_SYNC = "0" *) (* C_PRH2_WRN_WIDTH = "0" *) (* C_PRH2_WR_CYCLE = "0" *) 
(* C_PRH3_ADDR_TH = "0" *) (* C_PRH3_ADDR_TSU = "0" *) (* C_PRH3_ADS_WIDTH = "0" *) 
(* C_PRH3_AWIDTH = "32" *) (* C_PRH3_BASEADDR = "-805240833" *) (* C_PRH3_BUS_MULTIPLEX = "0" *) 
(* C_PRH3_CSN_TH = "0" *) (* C_PRH3_CSN_TSU = "0" *) (* C_PRH3_DATA_TH = "0" *) 
(* C_PRH3_DATA_TINV = "0" *) (* C_PRH3_DATA_TOUT = "0" *) (* C_PRH3_DATA_TSU = "0" *) 
(* C_PRH3_DWIDTH = "32" *) (* C_PRH3_DWIDTH_MATCH = "0" *) (* C_PRH3_FIFO_ACCESS = "0" *) 
(* C_PRH3_FIFO_OFFSET = "0" *) (* C_PRH3_HIGHADDR = "-536870913" *) (* C_PRH3_RDN_WIDTH = "0" *) 
(* C_PRH3_RDY_TOUT = "0" *) (* C_PRH3_RDY_WIDTH = "0" *) (* C_PRH3_RD_CYCLE = "0" *) 
(* C_PRH3_SYNC = "0" *) (* C_PRH3_WRN_WIDTH = "0" *) (* C_PRH3_WR_CYCLE = "0" *) 
(* C_PRH_BURST_SUPPORT = "0" *) (* C_PRH_CLK_PERIOD_PS = "20000" *) (* C_PRH_CLK_SUPPORT = "0" *) 
(* C_PRH_MAX_ADWIDTH = "32" *) (* C_PRH_MAX_AWIDTH = "32" *) (* C_PRH_MAX_DWIDTH = "32" *) 
(* C_S_AXI_ADDR_WIDTH = "32" *) (* C_S_AXI_CLK_PERIOD_PS = "10000" *) (* C_S_AXI_DATA_WIDTH = "32" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    prh_clk,
    prh_rst,
    prh_cs_n,
    prh_addr,
    prh_ads,
    prh_be,
    prh_rnw,
    prh_rd_n,
    prh_wr_n,
    prh_burst,
    prh_rdy,
    prh_data_i,
    prh_data_o,
    prh_data_t);
  (* sigis = "Clk" *) input s_axi_aclk;
  (* sigis = "Rst" *) input s_axi_aresetn;
  input [31:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [31:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  (* sigis = "Clk" *) input prh_clk;
  (* sigis = "Rst" *) input prh_rst;
  output [0:0]prh_cs_n;
  output [0:31]prh_addr;
  output prh_ads;
  output [0:3]prh_be;
  output prh_rnw;
  output prh_rd_n;
  output prh_wr_n;
  output prh_burst;
  input [0:0]prh_rdy;
  input [0:31]prh_data_i;
  output [0:31]prh_data_o;
  output [0:31]prh_data_t;

  wire \<const0> ;
  wire \<const1> ;
  wire \ASYNC_CNTL_I/asynch_prh_rdy_d1 ;
  wire \ASYNC_CNTL_I/tdevrdy_wdth_cnt ;
  wire AXI_LITE_IPIF_I_n_13;
  wire AXI_LITE_IPIF_I_n_14;
  wire AXI_LITE_IPIF_I_n_15;
  wire AXI_LITE_IPIF_I_n_16;
  wire AXI_LITE_IPIF_I_n_9;
  wire \DATA_STEER_I/Q ;
  wire [1:31]\DATA_STEER_I/ip2bus_data_int ;
  wire EPC_CORE_I_n_39;
  wire EPC_CORE_I_n_40;
  wire \IPIC_DECODE_I/ip_async_Wrack_d10 ;
  wire \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg ;
  wire \I_SLAVE_ATTACHMENT/I_DECODER/ce_out_i ;
  wire [31:0]bus2ip_addr_i;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire bus2ip_rnw;
  wire ip2bus_error;
  wire ipic_async_req;
  wire [0:31]prh_addr;
  wire [0:3]prh_be;
  wire [0:0]prh_cs_n;
  wire [0:31]prh_data_i;
  wire [0:31]prh_data_o;
  wire [1:1]\^prh_data_t ;
  wire prh_rd_n;
  wire [0:0]prh_rdy;
  wire prh_wr_n;
  wire s_axi_aclk;
  wire [31:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:1]\^s_axi_bresp ;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [1:1]\^s_axi_rresp ;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;

  assign prh_ads = \<const0> ;
  assign prh_burst = \<const0> ;
  assign prh_data_t[0] = \^prh_data_t [1];
  assign prh_data_t[1] = \^prh_data_t [1];
  assign prh_data_t[2] = \^prh_data_t [1];
  assign prh_data_t[3] = \^prh_data_t [1];
  assign prh_data_t[4] = \^prh_data_t [1];
  assign prh_data_t[5] = \^prh_data_t [1];
  assign prh_data_t[6] = \^prh_data_t [1];
  assign prh_data_t[7] = \^prh_data_t [1];
  assign prh_data_t[8] = \^prh_data_t [1];
  assign prh_data_t[9] = \^prh_data_t [1];
  assign prh_data_t[10] = \^prh_data_t [1];
  assign prh_data_t[11] = \^prh_data_t [1];
  assign prh_data_t[12] = \^prh_data_t [1];
  assign prh_data_t[13] = \^prh_data_t [1];
  assign prh_data_t[14] = \^prh_data_t [1];
  assign prh_data_t[15] = \^prh_data_t [1];
  assign prh_data_t[16] = \^prh_data_t [1];
  assign prh_data_t[17] = \^prh_data_t [1];
  assign prh_data_t[18] = \^prh_data_t [1];
  assign prh_data_t[19] = \^prh_data_t [1];
  assign prh_data_t[20] = \^prh_data_t [1];
  assign prh_data_t[21] = \^prh_data_t [1];
  assign prh_data_t[22] = \^prh_data_t [1];
  assign prh_data_t[23] = \^prh_data_t [1];
  assign prh_data_t[24] = \^prh_data_t [1];
  assign prh_data_t[25] = \^prh_data_t [1];
  assign prh_data_t[26] = \^prh_data_t [1];
  assign prh_data_t[27] = \^prh_data_t [1];
  assign prh_data_t[28] = \^prh_data_t [1];
  assign prh_data_t[29] = \^prh_data_t [1];
  assign prh_data_t[30] = \^prh_data_t [1];
  assign prh_data_t[31] = \^prh_data_t [1];
  assign prh_rnw = \<const1> ;
  assign s_axi_awready = s_axi_wready;
  assign s_axi_bresp[1] = \^s_axi_bresp [1];
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_rresp[1] = \^s_axi_rresp [1];
  assign s_axi_rresp[0] = \<const0> ;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif AXI_LITE_IPIF_I
       (.Bus_RNW_reg(\I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg ),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] (AXI_LITE_IPIF_I_n_9),
        .Q(EPC_CORE_I_n_40),
        .Q_0(\DATA_STEER_I/Q ),
        .asynch_prh_rdy_d1(\ASYNC_CNTL_I/asynch_prh_rdy_d1 ),
        .\bus2ip_addr_i_reg[31] (bus2ip_addr_i),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .bus2ip_rnw(bus2ip_rnw),
        .bus2ip_rnw_i_reg(AXI_LITE_IPIF_I_n_13),
        .bus2ip_rnw_i_reg_0(AXI_LITE_IPIF_I_n_14),
        .bus2ip_rnw_i_reg_1(AXI_LITE_IPIF_I_n_15),
        .bus2ip_rnw_i_reg_2(AXI_LITE_IPIF_I_n_16),
        .ce_out_i(\I_SLAVE_ATTACHMENT/I_DECODER/ce_out_i ),
        .ip2bus_data_int({\DATA_STEER_I/ip2bus_data_int [1],\DATA_STEER_I/ip2bus_data_int [2],\DATA_STEER_I/ip2bus_data_int [3],\DATA_STEER_I/ip2bus_data_int [4],\DATA_STEER_I/ip2bus_data_int [5],\DATA_STEER_I/ip2bus_data_int [6],\DATA_STEER_I/ip2bus_data_int [7],\DATA_STEER_I/ip2bus_data_int [8],\DATA_STEER_I/ip2bus_data_int [9],\DATA_STEER_I/ip2bus_data_int [10],\DATA_STEER_I/ip2bus_data_int [11],\DATA_STEER_I/ip2bus_data_int [12],\DATA_STEER_I/ip2bus_data_int [13],\DATA_STEER_I/ip2bus_data_int [14],\DATA_STEER_I/ip2bus_data_int [15],\DATA_STEER_I/ip2bus_data_int [16],\DATA_STEER_I/ip2bus_data_int [17],\DATA_STEER_I/ip2bus_data_int [18],\DATA_STEER_I/ip2bus_data_int [19],\DATA_STEER_I/ip2bus_data_int [20],\DATA_STEER_I/ip2bus_data_int [21],\DATA_STEER_I/ip2bus_data_int [22],\DATA_STEER_I/ip2bus_data_int [23],\DATA_STEER_I/ip2bus_data_int [24],\DATA_STEER_I/ip2bus_data_int [25],\DATA_STEER_I/ip2bus_data_int [26],\DATA_STEER_I/ip2bus_data_int [27],\DATA_STEER_I/ip2bus_data_int [28],\DATA_STEER_I/ip2bus_data_int [29],\DATA_STEER_I/ip2bus_data_int [30],\DATA_STEER_I/ip2bus_data_int [31]}),
        .ip2bus_error(ip2bus_error),
        .ip_async_Wrack_d10(\IPIC_DECODE_I/ip_async_Wrack_d10 ),
        .ipic_async_req(ipic_async_req),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(\^s_axi_bresp ),
        .s_axi_bvalid_i_reg(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(\^s_axi_rresp ),
        .s_axi_rvalid_i_reg(s_axi_rvalid),
        .s_axi_rvalid_i_reg_0(EPC_CORE_I_n_39),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .tdevrdy_wdth_cnt(\ASYNC_CNTL_I/tdevrdy_wdth_cnt ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_epc_core EPC_CORE_I
       (.Asynch_Wr_reg(AXI_LITE_IPIF_I_n_9),
        .Bus_RNW_reg(\I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg ),
        .D(bus2ip_addr_i),
        .\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0] (AXI_LITE_IPIF_I_n_13),
        .\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1] (AXI_LITE_IPIF_I_n_14),
        .\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2] (AXI_LITE_IPIF_I_n_15),
        .\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3] (AXI_LITE_IPIF_I_n_16),
        .\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 (EPC_CORE_I_n_39),
        .Q(EPC_CORE_I_n_40),
        .Q_0(\DATA_STEER_I/Q ),
        .asynch_prh_rdy_d1(\ASYNC_CNTL_I/asynch_prh_rdy_d1 ),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .bus2ip_rnw(bus2ip_rnw),
        .ce_out_i(\I_SLAVE_ATTACHMENT/I_DECODER/ce_out_i ),
        .ip2bus_data_int({\DATA_STEER_I/ip2bus_data_int [1],\DATA_STEER_I/ip2bus_data_int [2],\DATA_STEER_I/ip2bus_data_int [3],\DATA_STEER_I/ip2bus_data_int [4],\DATA_STEER_I/ip2bus_data_int [5],\DATA_STEER_I/ip2bus_data_int [6],\DATA_STEER_I/ip2bus_data_int [7],\DATA_STEER_I/ip2bus_data_int [8],\DATA_STEER_I/ip2bus_data_int [9],\DATA_STEER_I/ip2bus_data_int [10],\DATA_STEER_I/ip2bus_data_int [11],\DATA_STEER_I/ip2bus_data_int [12],\DATA_STEER_I/ip2bus_data_int [13],\DATA_STEER_I/ip2bus_data_int [14],\DATA_STEER_I/ip2bus_data_int [15],\DATA_STEER_I/ip2bus_data_int [16],\DATA_STEER_I/ip2bus_data_int [17],\DATA_STEER_I/ip2bus_data_int [18],\DATA_STEER_I/ip2bus_data_int [19],\DATA_STEER_I/ip2bus_data_int [20],\DATA_STEER_I/ip2bus_data_int [21],\DATA_STEER_I/ip2bus_data_int [22],\DATA_STEER_I/ip2bus_data_int [23],\DATA_STEER_I/ip2bus_data_int [24],\DATA_STEER_I/ip2bus_data_int [25],\DATA_STEER_I/ip2bus_data_int [26],\DATA_STEER_I/ip2bus_data_int [27],\DATA_STEER_I/ip2bus_data_int [28],\DATA_STEER_I/ip2bus_data_int [29],\DATA_STEER_I/ip2bus_data_int [30],\DATA_STEER_I/ip2bus_data_int [31]}),
        .ip2bus_error(ip2bus_error),
        .ip_async_Wrack_d10(\IPIC_DECODE_I/ip_async_Wrack_d10 ),
        .ipic_async_req(ipic_async_req),
        .prh_addr(prh_addr),
        .prh_be(prh_be),
        .prh_cs_n(prh_cs_n),
        .prh_data_i(prh_data_i),
        .prh_data_o(prh_data_o),
        .prh_data_t(\^prh_data_t ),
        .prh_rd_n(prh_rd_n),
        .prh_rdy(prh_rdy),
        .prh_wr_n(prh_wr_n),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_arready(s_axi_arready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .tdevrdy_wdth_cnt(\ASYNC_CNTL_I/tdevrdy_wdth_cnt ));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
endmodule

(* CHECK_LICENSE_TYPE = "axi_epc_0,axi_epc,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axi_epc,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (s_axi_aclk,
    s_axi_aresetn,
    s_axi_awaddr,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_araddr,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_rready,
    prh_clk,
    prh_rst,
    prh_cs_n,
    prh_addr,
    prh_ads,
    prh_be,
    prh_rnw,
    prh_rd_n,
    prh_wr_n,
    prh_burst,
    prh_rdy,
    prh_data_i,
    prh_data_o,
    prh_data_t);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input s_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 S_AXI_RST RST" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axi_aresetn;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [31:0]s_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input s_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output s_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]s_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]s_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input s_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output s_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]s_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output s_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input s_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [31:0]s_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input s_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output s_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]s_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]s_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output s_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input s_axi_rready;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF CLK" *) input prh_clk;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF RST" *) input prh_rst;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF CS_N" *) output [0:0]prh_cs_n;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF ADDR" *) output [0:31]prh_addr;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF ADS" *) output prh_ads;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF BE" *) output [0:3]prh_be;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF RNW" *) output prh_rnw;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF RD_N" *) output prh_rd_n;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF WR_N" *) output prh_wr_n;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF BURST" *) output prh_burst;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF RDY" *) input [0:0]prh_rdy;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF DATA_I" *) input [0:31]prh_data_i;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF DATA_O" *) output [0:31]prh_data_o;
  (* x_interface_info = "xilinx.com:interface:epc:1.0 EPC_INTF DATA_T" *) output [0:31]prh_data_t;

  wire [0:31]prh_addr;
  wire prh_ads;
  wire [0:3]prh_be;
  wire prh_burst;
  wire prh_clk;
  wire [0:0]prh_cs_n;
  wire [0:31]prh_data_i;
  wire [0:31]prh_data_o;
  wire [0:31]prh_data_t;
  wire prh_rd_n;
  wire [0:0]prh_rdy;
  wire prh_rnw;
  wire prh_rst;
  wire prh_wr_n;
  wire s_axi_aclk;
  wire [31:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire s_axi_awready;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [1:0]s_axi_bresp;
  wire s_axi_bvalid;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [1:0]s_axi_rresp;
  wire s_axi_rvalid;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;

  (* C_FAMILY = "zynq" *) 
  (* C_INSTANCE = "axi_epc_inst" *) 
  (* C_NUM_PERIPHERALS = "1" *) 
  (* C_PRH0_ADDR_TH = "0" *) 
  (* C_PRH0_ADDR_TSU = "0" *) 
  (* C_PRH0_ADS_WIDTH = "0" *) 
  (* C_PRH0_AWIDTH = "32" *) 
  (* C_PRH0_BASEADDR = "-1610547201" *) 
  (* C_PRH0_BUS_MULTIPLEX = "0" *) 
  (* C_PRH0_CSN_TH = "0" *) 
  (* C_PRH0_CSN_TSU = "0" *) 
  (* C_PRH0_DATA_TH = "0" *) 
  (* C_PRH0_DATA_TINV = "0" *) 
  (* C_PRH0_DATA_TOUT = "0" *) 
  (* C_PRH0_DATA_TSU = "0" *) 
  (* C_PRH0_DWIDTH = "32" *) 
  (* C_PRH0_DWIDTH_MATCH = "0" *) 
  (* C_PRH0_FIFO_ACCESS = "0" *) 
  (* C_PRH0_FIFO_OFFSET = "0" *) 
  (* C_PRH0_HIGHADDR = "-1342177281" *) 
  (* C_PRH0_RDN_WIDTH = "0" *) 
  (* C_PRH0_RDY_TOUT = "0" *) 
  (* C_PRH0_RDY_WIDTH = "0" *) 
  (* C_PRH0_RD_CYCLE = "0" *) 
  (* C_PRH0_SYNC = "0" *) 
  (* C_PRH0_WRN_WIDTH = "0" *) 
  (* C_PRH0_WR_CYCLE = "0" *) 
  (* C_PRH1_ADDR_TH = "0" *) 
  (* C_PRH1_ADDR_TSU = "0" *) 
  (* C_PRH1_ADS_WIDTH = "0" *) 
  (* C_PRH1_AWIDTH = "32" *) 
  (* C_PRH1_BASEADDR = "-1342111745" *) 
  (* C_PRH1_BUS_MULTIPLEX = "0" *) 
  (* C_PRH1_CSN_TH = "0" *) 
  (* C_PRH1_CSN_TSU = "0" *) 
  (* C_PRH1_DATA_TH = "0" *) 
  (* C_PRH1_DATA_TINV = "0" *) 
  (* C_PRH1_DATA_TOUT = "0" *) 
  (* C_PRH1_DATA_TSU = "0" *) 
  (* C_PRH1_DWIDTH = "32" *) 
  (* C_PRH1_DWIDTH_MATCH = "0" *) 
  (* C_PRH1_FIFO_ACCESS = "0" *) 
  (* C_PRH1_FIFO_OFFSET = "0" *) 
  (* C_PRH1_HIGHADDR = "-1073741825" *) 
  (* C_PRH1_RDN_WIDTH = "0" *) 
  (* C_PRH1_RDY_TOUT = "0" *) 
  (* C_PRH1_RDY_WIDTH = "0" *) 
  (* C_PRH1_RD_CYCLE = "0" *) 
  (* C_PRH1_SYNC = "0" *) 
  (* C_PRH1_WRN_WIDTH = "0" *) 
  (* C_PRH1_WR_CYCLE = "0" *) 
  (* C_PRH2_ADDR_TH = "0" *) 
  (* C_PRH2_ADDR_TSU = "0" *) 
  (* C_PRH2_ADS_WIDTH = "0" *) 
  (* C_PRH2_AWIDTH = "32" *) 
  (* C_PRH2_BASEADDR = "-1073676289" *) 
  (* C_PRH2_BUS_MULTIPLEX = "0" *) 
  (* C_PRH2_CSN_TH = "0" *) 
  (* C_PRH2_CSN_TSU = "0" *) 
  (* C_PRH2_DATA_TH = "0" *) 
  (* C_PRH2_DATA_TINV = "0" *) 
  (* C_PRH2_DATA_TOUT = "0" *) 
  (* C_PRH2_DATA_TSU = "0" *) 
  (* C_PRH2_DWIDTH = "32" *) 
  (* C_PRH2_DWIDTH_MATCH = "0" *) 
  (* C_PRH2_FIFO_ACCESS = "0" *) 
  (* C_PRH2_FIFO_OFFSET = "0" *) 
  (* C_PRH2_HIGHADDR = "-805306369" *) 
  (* C_PRH2_RDN_WIDTH = "0" *) 
  (* C_PRH2_RDY_TOUT = "0" *) 
  (* C_PRH2_RDY_WIDTH = "0" *) 
  (* C_PRH2_RD_CYCLE = "0" *) 
  (* C_PRH2_SYNC = "0" *) 
  (* C_PRH2_WRN_WIDTH = "0" *) 
  (* C_PRH2_WR_CYCLE = "0" *) 
  (* C_PRH3_ADDR_TH = "0" *) 
  (* C_PRH3_ADDR_TSU = "0" *) 
  (* C_PRH3_ADS_WIDTH = "0" *) 
  (* C_PRH3_AWIDTH = "32" *) 
  (* C_PRH3_BASEADDR = "-805240833" *) 
  (* C_PRH3_BUS_MULTIPLEX = "0" *) 
  (* C_PRH3_CSN_TH = "0" *) 
  (* C_PRH3_CSN_TSU = "0" *) 
  (* C_PRH3_DATA_TH = "0" *) 
  (* C_PRH3_DATA_TINV = "0" *) 
  (* C_PRH3_DATA_TOUT = "0" *) 
  (* C_PRH3_DATA_TSU = "0" *) 
  (* C_PRH3_DWIDTH = "32" *) 
  (* C_PRH3_DWIDTH_MATCH = "0" *) 
  (* C_PRH3_FIFO_ACCESS = "0" *) 
  (* C_PRH3_FIFO_OFFSET = "0" *) 
  (* C_PRH3_HIGHADDR = "-536870913" *) 
  (* C_PRH3_RDN_WIDTH = "0" *) 
  (* C_PRH3_RDY_TOUT = "0" *) 
  (* C_PRH3_RDY_WIDTH = "0" *) 
  (* C_PRH3_RD_CYCLE = "0" *) 
  (* C_PRH3_SYNC = "0" *) 
  (* C_PRH3_WRN_WIDTH = "0" *) 
  (* C_PRH3_WR_CYCLE = "0" *) 
  (* C_PRH_BURST_SUPPORT = "0" *) 
  (* C_PRH_CLK_PERIOD_PS = "20000" *) 
  (* C_PRH_CLK_SUPPORT = "0" *) 
  (* C_PRH_MAX_ADWIDTH = "32" *) 
  (* C_PRH_MAX_AWIDTH = "32" *) 
  (* C_PRH_MAX_DWIDTH = "32" *) 
  (* C_S_AXI_ADDR_WIDTH = "32" *) 
  (* C_S_AXI_CLK_PERIOD_PS = "10000" *) 
  (* C_S_AXI_DATA_WIDTH = "32" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_epc U0
       (.prh_addr(prh_addr),
        .prh_ads(prh_ads),
        .prh_be(prh_be),
        .prh_burst(prh_burst),
        .prh_clk(prh_clk),
        .prh_cs_n(prh_cs_n),
        .prh_data_i(prh_data_i),
        .prh_data_o(prh_data_o),
        .prh_data_t(prh_data_t),
        .prh_rd_n(prh_rd_n),
        .prh_rdy(prh_rdy),
        .prh_rnw(prh_rnw),
        .prh_rst(prh_rst),
        .prh_wr_n(prh_wr_n),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awready(s_axi_awready),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif
   (bus2ip_reset_active_high,
    s_axi_rresp,
    bus2ip_rnw,
    bus2ip_cs,
    Bus_RNW_reg,
    ce_out_i,
    s_axi_rvalid_i_reg,
    s_axi_bvalid_i_reg,
    s_axi_bresp,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ,
    s_axi_wready,
    s_axi_arready,
    ip_async_Wrack_d10,
    bus2ip_rnw_i_reg,
    bus2ip_rnw_i_reg_0,
    bus2ip_rnw_i_reg_1,
    bus2ip_rnw_i_reg_2,
    s_axi_rdata,
    \bus2ip_addr_i_reg[31] ,
    s_axi_aclk,
    ip2bus_error,
    s_axi_arvalid,
    ipic_async_req,
    s_axi_rvalid_i_reg_0,
    s_axi_aresetn,
    s_axi_awvalid,
    s_axi_wvalid,
    s_axi_rready,
    s_axi_bready,
    ip2bus_data_int,
    Q_0,
    s_axi_araddr,
    s_axi_awaddr,
    asynch_prh_rdy_d1,
    Q,
    tdevrdy_wdth_cnt,
    s_axi_wstrb);
  output bus2ip_reset_active_high;
  output [0:0]s_axi_rresp;
  output bus2ip_rnw;
  output bus2ip_cs;
  output Bus_RNW_reg;
  output ce_out_i;
  output s_axi_rvalid_i_reg;
  output s_axi_bvalid_i_reg;
  output [0:0]s_axi_bresp;
  output \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ;
  output s_axi_wready;
  output s_axi_arready;
  output ip_async_Wrack_d10;
  output bus2ip_rnw_i_reg;
  output bus2ip_rnw_i_reg_0;
  output bus2ip_rnw_i_reg_1;
  output bus2ip_rnw_i_reg_2;
  output [31:0]s_axi_rdata;
  output [31:0]\bus2ip_addr_i_reg[31] ;
  input s_axi_aclk;
  input ip2bus_error;
  input s_axi_arvalid;
  input ipic_async_req;
  input s_axi_rvalid_i_reg_0;
  input s_axi_aresetn;
  input s_axi_awvalid;
  input s_axi_wvalid;
  input s_axi_rready;
  input s_axi_bready;
  input [30:0]ip2bus_data_int;
  input Q_0;
  input [31:0]s_axi_araddr;
  input [31:0]s_axi_awaddr;
  input asynch_prh_rdy_d1;
  input [0:0]Q;
  input tdevrdy_wdth_cnt;
  input [3:0]s_axi_wstrb;

  wire Bus_RNW_reg;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ;
  wire [0:0]Q;
  wire Q_0;
  wire asynch_prh_rdy_d1;
  wire [31:0]\bus2ip_addr_i_reg[31] ;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire bus2ip_rnw;
  wire bus2ip_rnw_i_reg;
  wire bus2ip_rnw_i_reg_0;
  wire bus2ip_rnw_i_reg_1;
  wire bus2ip_rnw_i_reg_2;
  wire ce_out_i;
  wire [30:0]ip2bus_data_int;
  wire ip2bus_error;
  wire ip_async_Wrack_d10;
  wire ipic_async_req;
  wire s_axi_aclk;
  wire [31:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [0:0]s_axi_bresp;
  wire s_axi_bvalid_i_reg;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [0:0]s_axi_rresp;
  wire s_axi_rvalid_i_reg;
  wire s_axi_rvalid_i_reg_0;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire tdevrdy_wdth_cnt;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment I_SLAVE_ATTACHMENT
       (.Bus_RNW_reg_reg(Bus_RNW_reg),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] (ce_out_i),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 (\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ),
        .\MEM_DECODE_GEN[0].cs_out_i_reg[0] (bus2ip_cs),
        .Q(Q),
        .Q_0(Q_0),
        .SR(bus2ip_reset_active_high),
        .asynch_prh_rdy_d1(asynch_prh_rdy_d1),
        .\bus2ip_addr_i_reg[31]_0 (\bus2ip_addr_i_reg[31] ),
        .bus2ip_rnw_i_reg_0(bus2ip_rnw),
        .bus2ip_rnw_i_reg_1(bus2ip_rnw_i_reg),
        .bus2ip_rnw_i_reg_2(bus2ip_rnw_i_reg_0),
        .bus2ip_rnw_i_reg_3(bus2ip_rnw_i_reg_1),
        .bus2ip_rnw_i_reg_4(bus2ip_rnw_i_reg_2),
        .ip2bus_data_int(ip2bus_data_int),
        .ip2bus_error(ip2bus_error),
        .ip_async_Wrack_d10(ip_async_Wrack_d10),
        .ipic_async_req(ipic_async_req),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid_i_reg_0(s_axi_bvalid_i_reg),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rready(s_axi_rready),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid_i_reg_0(s_axi_rvalid_i_reg),
        .s_axi_rvalid_i_reg_1(s_axi_rvalid_i_reg_0),
        .s_axi_wready(s_axi_wready),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .tdevrdy_wdth_cnt(tdevrdy_wdth_cnt));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_data_steer
   (Q_0,
    ip2bus_data_int,
    prh_be,
    \MEM_DECODE_GEN[0].cs_out_i_reg[0] ,
    bus2ip_reset_active_high,
    no_steer_async_ce,
    prh_data_i,
    s_axi_aclk,
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0]_0 ,
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1]_0 ,
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2]_0 ,
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3]_0 ,
    bus2ip_cs);
  output Q_0;
  output [30:0]ip2bus_data_int;
  output [0:3]prh_be;
  output \MEM_DECODE_GEN[0].cs_out_i_reg[0] ;
  input bus2ip_reset_active_high;
  input [0:0]no_steer_async_ce;
  input [0:31]prh_data_i;
  input s_axi_aclk;
  input \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0]_0 ;
  input \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1]_0 ;
  input \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2]_0 ;
  input \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3]_0 ;
  input bus2ip_cs;

  wire \MEM_DECODE_GEN[0].cs_out_i_reg[0] ;
  wire \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0]_0 ;
  wire \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1]_0 ;
  wire \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2]_0 ;
  wire \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3]_0 ;
  wire Q_0;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire [30:0]ip2bus_data_int;
  wire [0:0]no_steer_async_ce;
  wire [0:3]prh_be;
  wire [0:31]prh_data_i;
  wire s_axi_aclk;

  LUT1 #(
    .INIT(2'h1)) 
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[0]_i_1 
       (.I0(bus2ip_cs),
        .O(\MEM_DECODE_GEN[0].cs_out_i_reg[0] ));
  FDRE \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0]_0 ),
        .Q(prh_be[0]),
        .R(\MEM_DECODE_GEN[0].cs_out_i_reg[0] ));
  FDRE \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1]_0 ),
        .Q(prh_be[1]),
        .R(\MEM_DECODE_GEN[0].cs_out_i_reg[0] ));
  FDRE \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2]_0 ),
        .Q(prh_be[2]),
        .R(\MEM_DECODE_GEN[0].cs_out_i_reg[0] ));
  FDRE \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3]_0 ),
        .Q(prh_be[3]),
        .R(\MEM_DECODE_GEN[0].cs_out_i_reg[0] ));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[0]),
        .Q(Q_0),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[1]),
        .Q(ip2bus_data_int[30]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[2]),
        .Q(ip2bus_data_int[29]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[3]),
        .Q(ip2bus_data_int[28]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[4]),
        .Q(ip2bus_data_int[27]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[5]),
        .Q(ip2bus_data_int[26]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[6]),
        .Q(ip2bus_data_int[25]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[7]),
        .Q(ip2bus_data_int[24]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[8]),
        .Q(ip2bus_data_int[23]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[9]),
        .Q(ip2bus_data_int[22]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[10]),
        .Q(ip2bus_data_int[21]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[11]),
        .Q(ip2bus_data_int[20]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[12]),
        .Q(ip2bus_data_int[19]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[13]),
        .Q(ip2bus_data_int[18]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[14]),
        .Q(ip2bus_data_int[17]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[1].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[15]),
        .Q(ip2bus_data_int[16]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[16]),
        .Q(ip2bus_data_int[15]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[17]),
        .Q(ip2bus_data_int[14]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[18]),
        .Q(ip2bus_data_int[13]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[19]),
        .Q(ip2bus_data_int[12]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[20]),
        .Q(ip2bus_data_int[11]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[21]),
        .Q(ip2bus_data_int[10]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[22]),
        .Q(ip2bus_data_int[9]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[2].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[23]),
        .Q(ip2bus_data_int[8]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[24]),
        .Q(ip2bus_data_int[7]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[1].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[25]),
        .Q(ip2bus_data_int[6]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[2].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[26]),
        .Q(ip2bus_data_int[5]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[3].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[27]),
        .Q(ip2bus_data_int[4]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[4].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[28]),
        .Q(ip2bus_data_int[3]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[5].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[29]),
        .Q(ip2bus_data_int[2]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[6].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[30]),
        .Q(ip2bus_data_int[1]),
        .R(bus2ip_reset_active_high));
  (* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[3].ASYNC_RDREG_BYTE_GEN[7].ASYNC_RDREG_BIT 
       (.C(s_axi_aclk),
        .CE(no_steer_async_ce),
        .D(prh_data_i[31]),
        .Q(ip2bus_data_int[0]),
        .R(bus2ip_reset_active_high));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_epc_core
   (tdevrdy_wdth_cnt,
    asynch_prh_rdy_d1,
    Q_0,
    ip2bus_data_int,
    prh_cs_n,
    prh_rd_n,
    prh_wr_n,
    prh_data_t,
    ipic_async_req,
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ,
    Q,
    ip2bus_error,
    prh_be,
    prh_addr,
    prh_data_o,
    bus2ip_reset_active_high,
    s_axi_aclk,
    prh_data_i,
    bus2ip_cs,
    ip_async_Wrack_d10,
    s_axi_arready,
    s_axi_wready,
    ce_out_i,
    Bus_RNW_reg,
    Asynch_Wr_reg,
    bus2ip_rnw,
    prh_rdy,
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0] ,
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1] ,
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2] ,
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3] ,
    D,
    s_axi_wdata);
  output tdevrdy_wdth_cnt;
  output asynch_prh_rdy_d1;
  output Q_0;
  output [30:0]ip2bus_data_int;
  output [0:0]prh_cs_n;
  output prh_rd_n;
  output prh_wr_n;
  output [0:0]prh_data_t;
  output ipic_async_req;
  output \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ;
  output [0:0]Q;
  output ip2bus_error;
  output [0:3]prh_be;
  output [0:31]prh_addr;
  output [0:31]prh_data_o;
  input bus2ip_reset_active_high;
  input s_axi_aclk;
  input [0:31]prh_data_i;
  input bus2ip_cs;
  input ip_async_Wrack_d10;
  input s_axi_arready;
  input s_axi_wready;
  input ce_out_i;
  input Bus_RNW_reg;
  input Asynch_Wr_reg;
  input bus2ip_rnw;
  input [0:0]prh_rdy;
  input \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0] ;
  input \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1] ;
  input \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2] ;
  input \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3] ;
  input [31:0]D;
  input [31:0]s_axi_wdata;

  wire Asynch_Rd;
  wire Asynch_Wr;
  wire Asynch_Wr_reg;
  wire Asynch_chip_select;
  wire Bus_RNW_reg;
  wire [31:0]D;
  wire DATA_STEER_I_n_36;
  wire \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0] ;
  wire \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1] ;
  wire \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2] ;
  wire \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3] ;
  wire \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ;
  wire [0:0]Q;
  wire Q_0;
  wire async_data_oe_i0;
  wire asynch_prh_rdy_d1;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire bus2ip_rnw;
  wire ce_out_i;
  wire [0:0]dev_dbus_width;
  wire dev_rdy;
  wire [30:0]ip2bus_data_int;
  wire ip2bus_error;
  wire ip_async_Wrack_d10;
  wire ipic_async_req;
  wire [0:0]no_steer_async_ce;
  wire [0:31]prh_addr;
  wire [0:3]prh_be;
  wire [0:0]prh_cs_n;
  wire [0:31]prh_data_i;
  wire [0:31]prh_data_o;
  wire [0:0]prh_data_t;
  wire prh_rd_n;
  wire [0:0]prh_rdy;
  wire prh_wr_n;
  wire s_axi_aclk;
  wire s_axi_arready;
  wire [31:0]s_axi_wdata;
  wire s_axi_wready;
  wire tdevrdy_wdth_cnt;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_access_mux ACCESS_MUX_I
       (.Asynch_Rd(Asynch_Rd),
        .Asynch_Wr(Asynch_Wr),
        .Asynch_chip_select(Asynch_chip_select),
        .D(D),
        .\NO_PRH_BUS_MULTIPLEX_GEN.PRH_Data_O_reg[0]_0 (DATA_STEER_I_n_36),
        .async_data_oe_i0(async_data_oe_i0),
        .prh_addr(prh_addr),
        .prh_cs_n(prh_cs_n),
        .prh_data_o(prh_data_o),
        .prh_data_t(prh_data_t),
        .prh_rd_n(prh_rd_n),
        .prh_wr_n(prh_wr_n),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_wdata(s_axi_wdata));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_async_cntl ASYNC_CNTL_I
       (.Asynch_Rd(Asynch_Rd),
        .Asynch_Wr(Asynch_Wr),
        .Asynch_Wr_reg(Asynch_Wr_reg),
        .Asynch_chip_select(Asynch_chip_select),
        .Bus_RNW_reg(Bus_RNW_reg),
        .\FSM_onehot_command_cs_reg[1] (ipic_async_req),
        .\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 (tdevrdy_wdth_cnt),
        .\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 (\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ),
        .Q(Q),
        .\SOME_DEV_ASYNC_GEN.REG_PRH_RDY_0 (asynch_prh_rdy_d1),
        .async_data_oe_i0(async_data_oe_i0),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .bus2ip_rnw(bus2ip_rnw),
        .ce_out_i(ce_out_i),
        .dev_dbus_width(dev_dbus_width),
        .dev_rdy(dev_rdy),
        .ip2bus_error(ip2bus_error),
        .no_steer_async_ce(no_steer_async_ce),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_data_steer DATA_STEER_I
       (.\MEM_DECODE_GEN[0].cs_out_i_reg[0] (DATA_STEER_I_n_36),
        .\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0]_0 (\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[0] ),
        .\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1]_0 (\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[1] ),
        .\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2]_0 (\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[2] ),
        .\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3]_0 (\NO_DEV_DWIDTH_MATCH_GEN.PRH_BE_reg[3] ),
        .Q_0(Q_0),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .ip2bus_data_int(ip2bus_data_int),
        .no_steer_async_ce(no_steer_async_ce),
        .prh_be(prh_be),
        .prh_data_i(prh_data_i),
        .s_axi_aclk(s_axi_aclk));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ipic_if_decode IPIC_DECODE_I
       (.\ASYNC_REQ_GEN.local_async_req_reg_0 (ipic_async_req),
        .\ASYNC_REQ_GEN.local_async_req_reg_1 (\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 ),
        .bus2ip_cs(bus2ip_cs),
        .bus2ip_reset_active_high(bus2ip_reset_active_high),
        .ce_out_i(ce_out_i),
        .dev_dbus_width(dev_dbus_width),
        .dev_rdy(dev_rdy),
        .ip_async_Wrack_d10(ip_async_Wrack_d10),
        .prh_rdy(prh_rdy),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_arready(s_axi_arready),
        .s_axi_wready(s_axi_wready));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ipic_if_decode
   (dev_dbus_width,
    \ASYNC_REQ_GEN.local_async_req_reg_0 ,
    dev_rdy,
    bus2ip_reset_active_high,
    bus2ip_cs,
    s_axi_aclk,
    ip_async_Wrack_d10,
    s_axi_arready,
    s_axi_wready,
    \ASYNC_REQ_GEN.local_async_req_reg_1 ,
    ce_out_i,
    prh_rdy);
  output [0:0]dev_dbus_width;
  output \ASYNC_REQ_GEN.local_async_req_reg_0 ;
  output dev_rdy;
  input bus2ip_reset_active_high;
  input bus2ip_cs;
  input s_axi_aclk;
  input ip_async_Wrack_d10;
  input s_axi_arready;
  input s_axi_wready;
  input \ASYNC_REQ_GEN.local_async_req_reg_1 ;
  input ce_out_i;
  input [0:0]prh_rdy;

  wire \ASYNC_REQ_GEN.ip_async_Rdack_d1_reg_r_n_0 ;
  wire \ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0 ;
  wire \ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0 ;
  wire \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0 ;
  wire \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_gate_n_0 ;
  wire \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0 ;
  wire \ASYNC_REQ_GEN.ip_async_Wrack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0 ;
  wire \ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0 ;
  wire \ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_gate_n_0 ;
  wire \ASYNC_REQ_GEN.local_async_req_i_1_n_0 ;
  wire \ASYNC_REQ_GEN.local_async_req_i_2_n_0 ;
  wire \ASYNC_REQ_GEN.local_async_req_reg_0 ;
  wire \ASYNC_REQ_GEN.local_async_req_reg_1 ;
  wire \Dev_id[0]_i_1_n_0 ;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire ce_out_i;
  wire [0:0]dev_dbus_width;
  wire \dev_dbus_width_i[0]_i_1_n_0 ;
  wire dev_id;
  wire dev_in_access_int_d1;
  wire dev_rdy;
  wire ip_async_Rdack_d4;
  wire ip_async_Wrack_d10;
  wire ip_async_Wrack_d4;
  wire [0:0]prh_rdy;
  wire s_axi_aclk;
  wire s_axi_arready;
  wire s_axi_wready;

  FDRE \ASYNC_REQ_GEN.ip_async_Rdack_d1_reg_r 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(1'b1),
        .Q(\ASYNC_REQ_GEN.ip_async_Rdack_d1_reg_r_n_0 ),
        .R(ip_async_Wrack_d10));
  FDRE \ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ASYNC_REQ_GEN.ip_async_Rdack_d1_reg_r_n_0 ),
        .Q(\ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0 ),
        .R(ip_async_Wrack_d10));
  (* srl_name = "U0/\EPC_CORE_I/IPIC_DECODE_I/ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(s_axi_aclk),
        .D(s_axi_arready),
        .Q(\ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0 ));
  FDRE \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0 ),
        .Q(\ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0 ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_gate 
       (.I0(\ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0 ),
        .I1(\ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0 ),
        .O(\ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_gate_n_0 ));
  FDRE \ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0 ),
        .Q(\ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0 ),
        .R(ip_async_Wrack_d10));
  FDRE \ASYNC_REQ_GEN.ip_async_Rdack_d4_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_gate_n_0 ),
        .Q(ip_async_Rdack_d4),
        .R(ip_async_Wrack_d10));
  (* srl_name = "U0/\EPC_CORE_I/IPIC_DECODE_I/ASYNC_REQ_GEN.ip_async_Wrack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \ASYNC_REQ_GEN.ip_async_Wrack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(s_axi_aclk),
        .D(s_axi_wready),
        .Q(\ASYNC_REQ_GEN.ip_async_Wrack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0 ));
  FDRE \ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ASYNC_REQ_GEN.ip_async_Wrack_d2_reg_srl2___EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d2_reg_r_n_0 ),
        .Q(\ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0 ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_gate 
       (.I0(\ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_EPC_CORE_I_IPIC_DECODE_I_ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0 ),
        .I1(\ASYNC_REQ_GEN.ip_async_Rdack_d3_reg_r_n_0 ),
        .O(\ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_gate_n_0 ));
  FDRE \ASYNC_REQ_GEN.ip_async_Wrack_d4_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ASYNC_REQ_GEN.ip_async_Wrack_d3_reg_gate_n_0 ),
        .Q(ip_async_Wrack_d4),
        .R(ip_async_Wrack_d10));
  LUT5 #(
    .INIT(32'h00007FFF)) 
    \ASYNC_REQ_GEN.local_async_req_i_1 
       (.I0(\ASYNC_REQ_GEN.local_async_req_reg_1 ),
        .I1(ce_out_i),
        .I2(bus2ip_cs),
        .I3(\ASYNC_REQ_GEN.local_async_req_reg_0 ),
        .I4(\ASYNC_REQ_GEN.local_async_req_i_2_n_0 ),
        .O(\ASYNC_REQ_GEN.local_async_req_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAABAAAAFFFFFFFF)) 
    \ASYNC_REQ_GEN.local_async_req_i_2 
       (.I0(bus2ip_reset_active_high),
        .I1(\ASYNC_REQ_GEN.local_async_req_reg_0 ),
        .I2(ip_async_Wrack_d4),
        .I3(ip_async_Rdack_d4),
        .I4(dev_in_access_int_d1),
        .I5(bus2ip_cs),
        .O(\ASYNC_REQ_GEN.local_async_req_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ASYNC_REQ_GEN.local_async_req_reg 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\ASYNC_REQ_GEN.local_async_req_i_1_n_0 ),
        .Q(\ASYNC_REQ_GEN.local_async_req_reg_0 ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hF2)) 
    \Dev_id[0]_i_1 
       (.I0(bus2ip_cs),
        .I1(dev_in_access_int_d1),
        .I2(dev_id),
        .O(\Dev_id[0]_i_1_n_0 ));
  FDRE \Dev_id_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\Dev_id[0]_i_1_n_0 ),
        .Q(dev_id),
        .R(bus2ip_reset_active_high));
  LUT2 #(
    .INIT(4'h8)) 
    \SOME_DEV_ASYNC_GEN.REG_PRH_RDY_i_1 
       (.I0(dev_id),
        .I1(prh_rdy),
        .O(dev_rdy));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hF2)) 
    \dev_dbus_width_i[0]_i_1 
       (.I0(bus2ip_cs),
        .I1(dev_in_access_int_d1),
        .I2(dev_dbus_width),
        .O(\dev_dbus_width_i[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \dev_dbus_width_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\dev_dbus_width_i[0]_i_1_n_0 ),
        .Q(dev_dbus_width),
        .R(bus2ip_reset_active_high));
  FDRE #(
    .INIT(1'b0)) 
    dev_in_access_int_d1_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(bus2ip_cs),
        .Q(dev_in_access_int_d1),
        .R(bus2ip_reset_active_high));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg
   (\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ,
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 ,
    D,
    tdata_hold_ld_ce_i,
    bus2ip_reset_active_high,
    s_axi_aclk,
    Q,
    \ASYNC_REQ_GEN.local_async_req_reg ,
    \ASYNC_REQ_GEN.local_async_req_reg_0 ,
    tcontrol_wdth_cnt,
    bus2ip_cs);
  output \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ;
  output \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 ;
  output [0:0]D;
  input tdata_hold_ld_ce_i;
  input bus2ip_reset_active_high;
  input s_axi_aclk;
  input [2:0]Q;
  input \ASYNC_REQ_GEN.local_async_req_reg ;
  input \ASYNC_REQ_GEN.local_async_req_reg_0 ;
  input tcontrol_wdth_cnt;
  input bus2ip_cs;

  wire \ASYNC_REQ_GEN.local_async_req_reg ;
  wire \ASYNC_REQ_GEN.local_async_req_reg_0 ;
  wire [0:0]D;
  wire D_0;
  wire \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ;
  wire \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 ;
  wire [2:0]Q;
  wire S;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire s_axi_aclk;
  wire tcontrol_wdth_cnt;
  wire tdata_hold_ld_ce_i;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED ;

  LUT4 #(
    .INIT(16'hF444)) 
    \FSM_onehot_command_cs[15]_i_1 
       (.I0(\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ),
        .I1(Q[2]),
        .I2(tcontrol_wdth_cnt),
        .I3(Q[1]),
        .O(D));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(D_0),
        .Q(\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ),
        .R(bus2ip_reset_active_high));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \PERBIT_GEN[0].XORCY_i1_CARRY4 
       (.CI(1'b0),
        .CO(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED [3:0]),
        .CYINIT(tdata_hold_ld_ce_i),
        .DI(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED [3:0]),
        .O({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED [3:1],D_0}),
        .S({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED [3:1],S}));
  LUT3 #(
    .INIT(8'hB8)) 
    \PERBIT_GEN[0].XORCY_i1_i_1__3 
       (.I0(\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ),
        .I1(tdata_hold_ld_ce_i),
        .I2(bus2ip_cs),
        .O(S));
  LUT5 #(
    .INIT(32'h8F888888)) 
    s_axi_wready_INST_0_i_1
       (.I0(\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ),
        .I1(Q[2]),
        .I2(\ASYNC_REQ_GEN.local_async_req_reg ),
        .I3(Q[0]),
        .I4(\ASYNC_REQ_GEN.local_async_req_reg_0 ),
        .O(\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 ));
endmodule

(* ORIG_REF_NAME = "ld_arith_reg" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_0
   (tcontrol_wdth_cnt,
    async_en,
    bus2ip_reset_active_high,
    CE,
    s_axi_aclk,
    bus2ip_cs,
    ce_out_i);
  output tcontrol_wdth_cnt;
  input async_en;
  input bus2ip_reset_active_high;
  input CE;
  input s_axi_aclk;
  input bus2ip_cs;
  input ce_out_i;

  wire CE;
  wire D;
  wire S;
  wire async_en;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire ce_out_i;
  wire s_axi_aclk;
  wire tcontrol_wdth_cnt;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 
       (.C(s_axi_aclk),
        .CE(CE),
        .D(D),
        .Q(tcontrol_wdth_cnt),
        .R(bus2ip_reset_active_high));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \PERBIT_GEN[0].XORCY_i1_CARRY4 
       (.CI(1'b0),
        .CO(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED [3:0]),
        .CYINIT(async_en),
        .DI(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED [3:0]),
        .O({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED [3:1],D}),
        .S({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED [3:1],S}));
  LUT4 #(
    .INIT(16'hAAC0)) 
    \PERBIT_GEN[0].XORCY_i1_i_1 
       (.I0(tcontrol_wdth_cnt),
        .I1(bus2ip_cs),
        .I2(ce_out_i),
        .I3(async_en),
        .O(S));
endmodule

(* ORIG_REF_NAME = "ld_arith_reg" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_1
   (\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ,
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 ,
    tdev_rdy_ld_ce_i,
    bus2ip_reset_active_high,
    CE_0,
    s_axi_aclk,
    Q,
    \FSM_onehot_command_cs_reg[0] ,
    bus2ip_cs);
  output \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ;
  output \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 ;
  input tdev_rdy_ld_ce_i;
  input bus2ip_reset_active_high;
  input CE_0;
  input s_axi_aclk;
  input [0:0]Q;
  input \FSM_onehot_command_cs_reg[0] ;
  input bus2ip_cs;

  wire CE_0;
  wire D;
  wire \FSM_onehot_command_cs_reg[0] ;
  wire \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ;
  wire \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 ;
  wire [0:0]Q;
  wire S;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire s_axi_aclk;
  wire tdev_rdy_ld_ce_i;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED ;

  LUT3 #(
    .INIT(8'h08)) 
    \FSM_onehot_command_cs[0]_i_3 
       (.I0(\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ),
        .I1(Q),
        .I2(\FSM_onehot_command_cs_reg[0] ),
        .O(\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_1 ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 
       (.C(s_axi_aclk),
        .CE(CE_0),
        .D(D),
        .Q(\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ),
        .R(bus2ip_reset_active_high));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \PERBIT_GEN[0].XORCY_i1_CARRY4 
       (.CI(1'b0),
        .CO(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED [3:0]),
        .CYINIT(tdev_rdy_ld_ce_i),
        .DI(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED [3:0]),
        .O({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED [3:1],D}),
        .S({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED [3:1],S}));
  LUT3 #(
    .INIT(8'hB8)) 
    \PERBIT_GEN[0].XORCY_i1_i_1__0 
       (.I0(\PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1_0 ),
        .I1(tdev_rdy_ld_ce_i),
        .I2(bus2ip_cs),
        .O(S));
endmodule

(* ORIG_REF_NAME = "ld_arith_reg" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_2
   (tdev_valid_cnt,
    D,
    tdev_valid_ld_ce_i,
    bus2ip_reset_active_high,
    CE_1,
    s_axi_aclk,
    Q,
    \FSM_onehot_command_cs_reg[4] ,
    \FSM_onehot_command_cs_reg[4]_0 ,
    bus2ip_cs);
  output tdev_valid_cnt;
  output [0:0]D;
  input tdev_valid_ld_ce_i;
  input bus2ip_reset_active_high;
  input CE_1;
  input s_axi_aclk;
  input [1:0]Q;
  input \FSM_onehot_command_cs_reg[4] ;
  input \FSM_onehot_command_cs_reg[4]_0 ;
  input bus2ip_cs;

  wire CE_1;
  wire [0:0]D;
  wire D_0;
  wire \FSM_onehot_command_cs_reg[4] ;
  wire \FSM_onehot_command_cs_reg[4]_0 ;
  wire [1:0]Q;
  wire S;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire s_axi_aclk;
  wire tdev_valid_cnt;
  wire tdev_valid_ld_ce_i;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED ;

  LUT5 #(
    .INIT(32'h88888F88)) 
    \FSM_onehot_command_cs[4]_i_1 
       (.I0(tdev_valid_cnt),
        .I1(Q[0]),
        .I2(\FSM_onehot_command_cs_reg[4] ),
        .I3(Q[1]),
        .I4(\FSM_onehot_command_cs_reg[4]_0 ),
        .O(D));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 
       (.C(s_axi_aclk),
        .CE(CE_1),
        .D(D_0),
        .Q(tdev_valid_cnt),
        .R(bus2ip_reset_active_high));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \PERBIT_GEN[0].XORCY_i1_CARRY4 
       (.CI(1'b0),
        .CO(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED [3:0]),
        .CYINIT(tdev_valid_ld_ce_i),
        .DI(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED [3:0]),
        .O({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED [3:1],D_0}),
        .S({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED [3:1],S}));
  LUT3 #(
    .INIT(8'hB8)) 
    \PERBIT_GEN[0].XORCY_i1_i_1__1 
       (.I0(tdev_valid_cnt),
        .I1(tdev_valid_ld_ce_i),
        .I2(bus2ip_cs),
        .O(S));
endmodule

(* ORIG_REF_NAME = "ld_arith_reg" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_3
   (tads_cnt,
    D,
    tads_ld_ce_i,
    bus2ip_reset_active_high,
    CE_2,
    s_axi_aclk,
    Q,
    tdev_valid_cnt,
    bus2ip_cs);
  output tads_cnt;
  output [0:0]D;
  input tads_ld_ce_i;
  input bus2ip_reset_active_high;
  input CE_2;
  input s_axi_aclk;
  input [1:0]Q;
  input tdev_valid_cnt;
  input bus2ip_cs;

  wire CE_2;
  wire [0:0]D;
  wire D_0;
  wire [1:0]Q;
  wire S;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire s_axi_aclk;
  wire tads_cnt;
  wire tads_ld_ce_i;
  wire tdev_valid_cnt;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED ;

  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_command_cs[3]_i_1 
       (.I0(tads_cnt),
        .I1(Q[0]),
        .I2(tdev_valid_cnt),
        .I3(Q[1]),
        .O(D));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 
       (.C(s_axi_aclk),
        .CE(CE_2),
        .D(D_0),
        .Q(tads_cnt),
        .R(bus2ip_reset_active_high));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \PERBIT_GEN[0].XORCY_i1_CARRY4 
       (.CI(1'b0),
        .CO(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED [3:0]),
        .CYINIT(tads_ld_ce_i),
        .DI(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED [3:0]),
        .O({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED [3:1],D_0}),
        .S({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED [3:1],S}));
  LUT3 #(
    .INIT(8'hB8)) 
    \PERBIT_GEN[0].XORCY_i1_i_1__2 
       (.I0(tads_cnt),
        .I1(tads_ld_ce_i),
        .I2(bus2ip_cs),
        .O(S));
endmodule

(* ORIG_REF_NAME = "ld_arith_reg" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_4
   (twr_non_muxed_rec_cnt,
    D,
    twr_non_muxed_recovery_load_ce_i,
    bus2ip_reset_active_high,
    CE_3,
    s_axi_aclk,
    Q,
    Bus_RNW_reg,
    Twr_non_muxed_recovery_load_ce_reg,
    taddr_data_cs_hold_cnt,
    bus2ip_cs);
  output twr_non_muxed_rec_cnt;
  output [0:0]D;
  input twr_non_muxed_recovery_load_ce_i;
  input bus2ip_reset_active_high;
  input CE_3;
  input s_axi_aclk;
  input [1:0]Q;
  input Bus_RNW_reg;
  input Twr_non_muxed_recovery_load_ce_reg;
  input taddr_data_cs_hold_cnt;
  input bus2ip_cs;

  wire Bus_RNW_reg;
  wire CE_3;
  wire [0:0]D;
  wire D_0;
  wire [1:0]Q;
  wire S;
  wire Twr_non_muxed_recovery_load_ce_reg;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire s_axi_aclk;
  wire taddr_data_cs_hold_cnt;
  wire twr_non_muxed_rec_cnt;
  wire twr_non_muxed_recovery_load_ce_i;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h444F444444444444)) 
    \FSM_onehot_command_cs[16]_i_1 
       (.I0(twr_non_muxed_rec_cnt),
        .I1(Q[1]),
        .I2(Bus_RNW_reg),
        .I3(Twr_non_muxed_recovery_load_ce_reg),
        .I4(Q[0]),
        .I5(taddr_data_cs_hold_cnt),
        .O(D));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 
       (.C(s_axi_aclk),
        .CE(CE_3),
        .D(D_0),
        .Q(twr_non_muxed_rec_cnt),
        .R(bus2ip_reset_active_high));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \PERBIT_GEN[0].XORCY_i1_CARRY4 
       (.CI(1'b0),
        .CO(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED [3:0]),
        .CYINIT(twr_non_muxed_recovery_load_ce_i),
        .DI(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED [3:0]),
        .O({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED [3:1],D_0}),
        .S({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED [3:1],S}));
  LUT3 #(
    .INIT(8'hB8)) 
    \PERBIT_GEN[0].XORCY_i1_i_1__4 
       (.I0(twr_non_muxed_rec_cnt),
        .I1(twr_non_muxed_recovery_load_ce_i),
        .I2(bus2ip_cs),
        .O(S));
endmodule

(* ORIG_REF_NAME = "ld_arith_reg" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ld_arith_reg_5
   (trd_non_muxed_rec_cnt,
    D,
    trd_non_muxed_recovery_load_ce_i,
    bus2ip_reset_active_high,
    CE_4,
    s_axi_aclk,
    Q,
    Trd_non_muxed_recovery_load_ce_reg,
    Bus_RNW_reg,
    taddr_data_cs_hold_cnt,
    bus2ip_cs);
  output trd_non_muxed_rec_cnt;
  output [0:0]D;
  input trd_non_muxed_recovery_load_ce_i;
  input bus2ip_reset_active_high;
  input CE_4;
  input s_axi_aclk;
  input [1:0]Q;
  input Trd_non_muxed_recovery_load_ce_reg;
  input Bus_RNW_reg;
  input taddr_data_cs_hold_cnt;
  input bus2ip_cs;

  wire Bus_RNW_reg;
  wire CE_4;
  wire [0:0]D;
  wire D_0;
  wire [1:0]Q;
  wire S;
  wire Trd_non_muxed_recovery_load_ce_reg;
  wire bus2ip_cs;
  wire bus2ip_reset_active_high;
  wire s_axi_aclk;
  wire taddr_data_cs_hold_cnt;
  wire trd_non_muxed_rec_cnt;
  wire trd_non_muxed_recovery_load_ce_i;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h4F44444444444444)) 
    \FSM_onehot_command_cs[17]_i_1 
       (.I0(trd_non_muxed_rec_cnt),
        .I1(Q[1]),
        .I2(Trd_non_muxed_recovery_load_ce_reg),
        .I3(Bus_RNW_reg),
        .I4(Q[0]),
        .I5(taddr_data_cs_hold_cnt),
        .O(D));
  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \PERBIT_GEN[0].FF_RST0_GEN.FDRE_i1 
       (.C(s_axi_aclk),
        .CE(CE_4),
        .D(D_0),
        .Q(trd_non_muxed_rec_cnt),
        .R(bus2ip_reset_active_high));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  CARRY4 \PERBIT_GEN[0].XORCY_i1_CARRY4 
       (.CI(1'b0),
        .CO(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_CO_UNCONNECTED [3:0]),
        .CYINIT(trd_non_muxed_recovery_load_ce_i),
        .DI(\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_DI_UNCONNECTED [3:0]),
        .O({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_O_UNCONNECTED [3:1],D_0}),
        .S({\NLW_PERBIT_GEN[0].XORCY_i1_CARRY4_S_UNCONNECTED [3:1],S}));
  LUT3 #(
    .INIT(8'hB8)) 
    \PERBIT_GEN[0].XORCY_i1_i_1__5 
       (.I0(trd_non_muxed_rec_cnt),
        .I1(trd_non_muxed_recovery_load_ce_i),
        .I2(bus2ip_cs),
        .O(S));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment
   (SR,
    s_axi_rresp,
    bus2ip_rnw_i_reg_0,
    \MEM_DECODE_GEN[0].cs_out_i_reg[0] ,
    Bus_RNW_reg_reg,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ,
    s_axi_rvalid_i_reg_0,
    s_axi_bvalid_i_reg_0,
    s_axi_bresp,
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ,
    s_axi_wready,
    s_axi_arready,
    ip_async_Wrack_d10,
    bus2ip_rnw_i_reg_1,
    bus2ip_rnw_i_reg_2,
    bus2ip_rnw_i_reg_3,
    bus2ip_rnw_i_reg_4,
    s_axi_rdata,
    \bus2ip_addr_i_reg[31]_0 ,
    s_axi_aclk,
    ip2bus_error,
    s_axi_arvalid,
    ipic_async_req,
    s_axi_rvalid_i_reg_1,
    s_axi_aresetn,
    s_axi_awvalid,
    s_axi_wvalid,
    s_axi_rready,
    s_axi_bready,
    ip2bus_data_int,
    Q_0,
    s_axi_araddr,
    s_axi_awaddr,
    asynch_prh_rdy_d1,
    Q,
    tdevrdy_wdth_cnt,
    s_axi_wstrb);
  output [0:0]SR;
  output [0:0]s_axi_rresp;
  output bus2ip_rnw_i_reg_0;
  output \MEM_DECODE_GEN[0].cs_out_i_reg[0] ;
  output Bus_RNW_reg_reg;
  output \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ;
  output s_axi_rvalid_i_reg_0;
  output s_axi_bvalid_i_reg_0;
  output [0:0]s_axi_bresp;
  output \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ;
  output s_axi_wready;
  output s_axi_arready;
  output ip_async_Wrack_d10;
  output bus2ip_rnw_i_reg_1;
  output bus2ip_rnw_i_reg_2;
  output bus2ip_rnw_i_reg_3;
  output bus2ip_rnw_i_reg_4;
  output [31:0]s_axi_rdata;
  output [31:0]\bus2ip_addr_i_reg[31]_0 ;
  input s_axi_aclk;
  input ip2bus_error;
  input s_axi_arvalid;
  input ipic_async_req;
  input s_axi_rvalid_i_reg_1;
  input s_axi_aresetn;
  input s_axi_awvalid;
  input s_axi_wvalid;
  input s_axi_rready;
  input s_axi_bready;
  input [30:0]ip2bus_data_int;
  input Q_0;
  input [31:0]s_axi_araddr;
  input [31:0]s_axi_awaddr;
  input asynch_prh_rdy_d1;
  input [0:0]Q;
  input tdevrdy_wdth_cnt;
  input [3:0]s_axi_wstrb;

  wire Bus_RNW_reg_reg;
  wire \FSM_onehot_state[0]_i_2_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_2_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ;
  wire \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ;
  wire I_DECODER_n_3;
  wire I_DECODER_n_4;
  wire I_DECODER_n_42;
  wire I_DECODER_n_43;
  wire I_DECODER_n_44;
  wire I_DECODER_n_5;
  wire \MEM_DECODE_GEN[0].cs_out_i_reg[0] ;
  wire [0:0]Q;
  wire Q_0;
  wire [0:0]SR;
  wire asynch_prh_rdy_d1;
  wire \bus2ip_addr_i[0]_i_1_n_0 ;
  wire \bus2ip_addr_i[10]_i_1_n_0 ;
  wire \bus2ip_addr_i[11]_i_1_n_0 ;
  wire \bus2ip_addr_i[12]_i_1_n_0 ;
  wire \bus2ip_addr_i[13]_i_1_n_0 ;
  wire \bus2ip_addr_i[14]_i_1_n_0 ;
  wire \bus2ip_addr_i[15]_i_1_n_0 ;
  wire \bus2ip_addr_i[16]_i_1_n_0 ;
  wire \bus2ip_addr_i[17]_i_1_n_0 ;
  wire \bus2ip_addr_i[18]_i_1_n_0 ;
  wire \bus2ip_addr_i[19]_i_1_n_0 ;
  wire \bus2ip_addr_i[1]_i_1_n_0 ;
  wire \bus2ip_addr_i[20]_i_1_n_0 ;
  wire \bus2ip_addr_i[21]_i_1_n_0 ;
  wire \bus2ip_addr_i[22]_i_1_n_0 ;
  wire \bus2ip_addr_i[23]_i_1_n_0 ;
  wire \bus2ip_addr_i[24]_i_1_n_0 ;
  wire \bus2ip_addr_i[25]_i_1_n_0 ;
  wire \bus2ip_addr_i[26]_i_1_n_0 ;
  wire \bus2ip_addr_i[27]_i_1_n_0 ;
  wire \bus2ip_addr_i[28]_i_1_n_0 ;
  wire \bus2ip_addr_i[29]_i_1_n_0 ;
  wire \bus2ip_addr_i[2]_i_1_n_0 ;
  wire \bus2ip_addr_i[30]_i_1_n_0 ;
  wire \bus2ip_addr_i[31]_i_1_n_0 ;
  wire \bus2ip_addr_i[31]_i_2_n_0 ;
  wire \bus2ip_addr_i[3]_i_1_n_0 ;
  wire \bus2ip_addr_i[4]_i_1_n_0 ;
  wire \bus2ip_addr_i[5]_i_1_n_0 ;
  wire \bus2ip_addr_i[6]_i_1_n_0 ;
  wire \bus2ip_addr_i[7]_i_1_n_0 ;
  wire \bus2ip_addr_i[8]_i_1_n_0 ;
  wire \bus2ip_addr_i[9]_i_1_n_0 ;
  wire [31:0]\bus2ip_addr_i_reg[31]_0 ;
  wire bus2ip_rnw_i0;
  wire bus2ip_rnw_i_reg_0;
  wire bus2ip_rnw_i_reg_1;
  wire bus2ip_rnw_i_reg_2;
  wire bus2ip_rnw_i_reg_3;
  wire bus2ip_rnw_i_reg_4;
  wire [30:0]ip2bus_data_int;
  wire [31:0]ip2bus_data_int__0;
  wire ip2bus_error;
  wire ip_async_Wrack_d10;
  wire ipic_async_req;
  wire p_0_in;
  wire s_axi_aclk;
  wire [31:0]s_axi_araddr;
  wire s_axi_aresetn;
  wire s_axi_arready;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire [0:0]s_axi_bresp;
  wire s_axi_bresp_i;
  wire s_axi_bvalid_i_reg_0;
  wire [31:0]s_axi_rdata;
  wire s_axi_rready;
  wire [0:0]s_axi_rresp;
  wire s_axi_rresp_i;
  wire s_axi_rvalid_i_reg_0;
  wire s_axi_rvalid_i_reg_1;
  wire s_axi_wready;
  wire [3:0]s_axi_wstrb;
  wire s_axi_wvalid;
  wire start2;
  wire start2_i_1_n_0;
  wire tdevrdy_wdth_cnt;

  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h002A2A2A)) 
    \FSM_onehot_state[0]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(s_axi_rready),
        .I2(s_axi_rvalid_i_reg_0),
        .I3(s_axi_bready),
        .I4(s_axi_bvalid_i_reg_0),
        .O(\FSM_onehot_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88888F888F888F88)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(\FSM_onehot_state[1]_i_2_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(s_axi_arvalid),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .I4(s_axi_awvalid),
        .I5(s_axi_wvalid),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hF888)) 
    \FSM_onehot_state[1]_i_2 
       (.I0(s_axi_bvalid_i_reg_0),
        .I1(s_axi_bready),
        .I2(s_axi_rvalid_i_reg_0),
        .I3(s_axi_rready),
        .O(\FSM_onehot_state[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(s_axi_wvalid),
        .I2(s_axi_awvalid),
        .O(bus2ip_rnw_i0));
  (* FSM_ENCODED_STATES = "sm_read:1000,sm_write:0100,sm_resp:0001,sm_idle:0010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[0] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(I_DECODER_n_5),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "sm_read:1000,sm_write:0100,sm_resp:0001,sm_idle:0010" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ),
        .S(SR));
  (* FSM_ENCODED_STATES = "sm_read:1000,sm_write:0100,sm_resp:0001,sm_idle:0010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(I_DECODER_n_4),
        .Q(s_axi_bresp_i),
        .R(SR));
  (* FSM_ENCODED_STATES = "sm_read:1000,sm_write:0100,sm_resp:0001,sm_idle:0010" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(I_DECODER_n_3),
        .Q(s_axi_rresp_i),
        .R(SR));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder I_DECODER
       (.\ASYNC_REQ_GEN.ip_async_Wrack_d4_reg (SR),
        .Bus_RNW_reg_reg_0(Bus_RNW_reg_reg),
        .D({I_DECODER_n_3,I_DECODER_n_4,I_DECODER_n_5}),
        .\FSM_onehot_state_reg[0] (\FSM_onehot_state[0]_i_2_n_0 ),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 (\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0] ),
        .\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1 (\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0 ),
        .\MEM_DECODE_GEN[0].cs_out_i_reg[0]_0 (\MEM_DECODE_GEN[0].cs_out_i_reg[0] ),
        .\MEM_DECODE_GEN[0].cs_out_i_reg[0]_1 (I_DECODER_n_44),
        .\NO_DEV_DWIDTH_MATCH_GEN.SOME_DEV_ASYNC_GEN.ASYNC_RDREG_GEN[0].ASYNC_RDREG_BYTE_GEN[0].ASYNC_RDREG_BIT (ip2bus_data_int__0),
        .Q(start2),
        .Q_0(Q_0),
        .asynch_prh_rdy_d1(asynch_prh_rdy_d1),
        .bus2ip_rnw_i0(bus2ip_rnw_i0),
        .ip2bus_data_int(ip2bus_data_int),
        .ip_async_Wrack_d10(ip_async_Wrack_d10),
        .ipic_async_req(ipic_async_req),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_arready(s_axi_arready),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_bready_0(I_DECODER_n_43),
        .s_axi_bresp(s_axi_bresp),
        .\s_axi_bresp_i_reg[1] (Q),
        .s_axi_bvalid_i_reg(s_axi_bvalid_i_reg_0),
        .\s_axi_rdata_i_reg[0] (bus2ip_rnw_i_reg_0),
        .s_axi_rready(s_axi_rready),
        .s_axi_rready_0(I_DECODER_n_42),
        .s_axi_rvalid_i_reg(s_axi_rvalid_i_reg_1),
        .s_axi_rvalid_i_reg_0({s_axi_rresp_i,s_axi_bresp_i,\FSM_onehot_state_reg_n_0_[1] }),
        .s_axi_rvalid_i_reg_1(s_axi_rvalid_i_reg_0),
        .s_axi_wready(s_axi_wready),
        .tdevrdy_wdth_cnt(tdevrdy_wdth_cnt));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[0]_i_2 
       (.I0(bus2ip_rnw_i_reg_0),
        .I1(s_axi_wstrb[3]),
        .O(bus2ip_rnw_i_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[1]_i_1 
       (.I0(bus2ip_rnw_i_reg_0),
        .I1(s_axi_wstrb[2]),
        .O(bus2ip_rnw_i_reg_2));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[2]_i_1 
       (.I0(bus2ip_rnw_i_reg_0),
        .I1(s_axi_wstrb[1]),
        .O(bus2ip_rnw_i_reg_3));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \NO_DEV_DWIDTH_MATCH_GEN.PRH_BE[3]_i_1 
       (.I0(bus2ip_rnw_i_reg_0),
        .I1(s_axi_wstrb[0]),
        .O(bus2ip_rnw_i_reg_4));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[0]_i_1 
       (.I0(s_axi_araddr[0]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[0]),
        .O(\bus2ip_addr_i[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[10]_i_1 
       (.I0(s_axi_araddr[10]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[10]),
        .O(\bus2ip_addr_i[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[11]_i_1 
       (.I0(s_axi_araddr[11]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[11]),
        .O(\bus2ip_addr_i[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[12]_i_1 
       (.I0(s_axi_araddr[12]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[12]),
        .O(\bus2ip_addr_i[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[13]_i_1 
       (.I0(s_axi_araddr[13]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[13]),
        .O(\bus2ip_addr_i[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[14]_i_1 
       (.I0(s_axi_araddr[14]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[14]),
        .O(\bus2ip_addr_i[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[15]_i_1 
       (.I0(s_axi_araddr[15]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[15]),
        .O(\bus2ip_addr_i[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[16]_i_1 
       (.I0(s_axi_araddr[16]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[16]),
        .O(\bus2ip_addr_i[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[17]_i_1 
       (.I0(s_axi_araddr[17]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[17]),
        .O(\bus2ip_addr_i[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[18]_i_1 
       (.I0(s_axi_araddr[18]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[18]),
        .O(\bus2ip_addr_i[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[19]_i_1 
       (.I0(s_axi_araddr[19]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[19]),
        .O(\bus2ip_addr_i[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[1]_i_1 
       (.I0(s_axi_araddr[1]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[1]),
        .O(\bus2ip_addr_i[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[20]_i_1 
       (.I0(s_axi_araddr[20]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[20]),
        .O(\bus2ip_addr_i[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[21]_i_1 
       (.I0(s_axi_araddr[21]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[21]),
        .O(\bus2ip_addr_i[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[22]_i_1 
       (.I0(s_axi_araddr[22]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[22]),
        .O(\bus2ip_addr_i[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[23]_i_1 
       (.I0(s_axi_araddr[23]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[23]),
        .O(\bus2ip_addr_i[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[24]_i_1 
       (.I0(s_axi_araddr[24]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[24]),
        .O(\bus2ip_addr_i[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[25]_i_1 
       (.I0(s_axi_araddr[25]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[25]),
        .O(\bus2ip_addr_i[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[26]_i_1 
       (.I0(s_axi_araddr[26]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[26]),
        .O(\bus2ip_addr_i[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[27]_i_1 
       (.I0(s_axi_araddr[27]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[27]),
        .O(\bus2ip_addr_i[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[28]_i_1 
       (.I0(s_axi_araddr[28]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[28]),
        .O(\bus2ip_addr_i[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[29]_i_1 
       (.I0(s_axi_araddr[29]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[29]),
        .O(\bus2ip_addr_i[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[2]_i_1 
       (.I0(s_axi_araddr[2]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[2]),
        .O(\bus2ip_addr_i[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[30]_i_1 
       (.I0(s_axi_araddr[30]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[30]),
        .O(\bus2ip_addr_i[30]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEA00)) 
    \bus2ip_addr_i[31]_i_1 
       (.I0(s_axi_arvalid),
        .I1(s_axi_awvalid),
        .I2(s_axi_wvalid),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\bus2ip_addr_i[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[31]_i_2 
       (.I0(s_axi_araddr[31]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[31]),
        .O(\bus2ip_addr_i[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[3]_i_1 
       (.I0(s_axi_araddr[3]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[3]),
        .O(\bus2ip_addr_i[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[4]_i_1 
       (.I0(s_axi_araddr[4]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[4]),
        .O(\bus2ip_addr_i[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[5]_i_1 
       (.I0(s_axi_araddr[5]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[5]),
        .O(\bus2ip_addr_i[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[6]_i_1 
       (.I0(s_axi_araddr[6]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[6]),
        .O(\bus2ip_addr_i[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[7]_i_1 
       (.I0(s_axi_araddr[7]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[7]),
        .O(\bus2ip_addr_i[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[8]_i_1 
       (.I0(s_axi_araddr[8]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[8]),
        .O(\bus2ip_addr_i[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \bus2ip_addr_i[9]_i_1 
       (.I0(s_axi_araddr[9]),
        .I1(s_axi_arvalid),
        .I2(s_axi_awaddr[9]),
        .O(\bus2ip_addr_i[9]_i_1_n_0 ));
  FDRE \bus2ip_addr_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[0]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [0]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[10] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[10]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [10]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[11] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[11]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [11]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[12] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[12]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [12]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[13] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[13]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [13]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[14] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[14]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [14]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[15] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[15]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [15]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[16] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[16]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [16]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[17] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[17]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [17]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[18] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[18]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [18]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[19] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[19]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [19]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[1]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [1]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[20] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[20]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [20]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[21] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[21]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [21]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[22] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[22]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [22]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[23] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[23]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [23]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[24] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[24]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [24]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[25] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[25]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [25]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[26] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[26]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [26]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[27] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[27]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [27]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[28] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[28]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [28]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[29] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[29]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [29]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[2]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [2]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[30] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[30]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [30]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[31] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[31]_i_2_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [31]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[3]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [3]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[4]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [4]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[5]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [5]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[6]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [6]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[7]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [7]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[8] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[8]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [8]),
        .R(SR));
  FDRE \bus2ip_addr_i_reg[9] 
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(\bus2ip_addr_i[9]_i_1_n_0 ),
        .Q(\bus2ip_addr_i_reg[31]_0 [9]),
        .R(SR));
  FDRE bus2ip_rnw_i_reg
       (.C(s_axi_aclk),
        .CE(\bus2ip_addr_i[31]_i_1_n_0 ),
        .D(s_axi_arvalid),
        .Q(bus2ip_rnw_i_reg_0),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    rst_i_1
       (.I0(s_axi_aresetn),
        .O(p_0_in));
  FDRE rst_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(SR),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_bresp_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(I_DECODER_n_44),
        .Q(s_axi_bresp),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    s_axi_bvalid_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(I_DECODER_n_43),
        .Q(s_axi_bvalid_i_reg_0),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[0] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[0]),
        .Q(s_axi_rdata[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[10] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[10]),
        .Q(s_axi_rdata[10]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[11] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[11]),
        .Q(s_axi_rdata[11]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[12] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[12]),
        .Q(s_axi_rdata[12]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[13] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[13]),
        .Q(s_axi_rdata[13]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[14] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[14]),
        .Q(s_axi_rdata[14]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[15] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[15]),
        .Q(s_axi_rdata[15]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[16] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[16]),
        .Q(s_axi_rdata[16]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[17] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[17]),
        .Q(s_axi_rdata[17]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[18] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[18]),
        .Q(s_axi_rdata[18]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[19] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[19]),
        .Q(s_axi_rdata[19]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[1]),
        .Q(s_axi_rdata[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[20] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[20]),
        .Q(s_axi_rdata[20]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[21] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[21]),
        .Q(s_axi_rdata[21]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[22] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[22]),
        .Q(s_axi_rdata[22]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[23] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[23]),
        .Q(s_axi_rdata[23]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[24] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[24]),
        .Q(s_axi_rdata[24]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[25] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[25]),
        .Q(s_axi_rdata[25]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[26] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[26]),
        .Q(s_axi_rdata[26]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[27] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[27]),
        .Q(s_axi_rdata[27]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[28] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[28]),
        .Q(s_axi_rdata[28]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[29] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[29]),
        .Q(s_axi_rdata[29]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[2] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[2]),
        .Q(s_axi_rdata[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[30] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[30]),
        .Q(s_axi_rdata[30]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[31] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[31]),
        .Q(s_axi_rdata[31]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[3] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[3]),
        .Q(s_axi_rdata[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[4] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[4]),
        .Q(s_axi_rdata[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[5] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[5]),
        .Q(s_axi_rdata[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[6] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[6]),
        .Q(s_axi_rdata[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[7] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[7]),
        .Q(s_axi_rdata[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[8] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[8]),
        .Q(s_axi_rdata[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rdata_i_reg[9] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_data_int__0[9]),
        .Q(s_axi_rdata[9]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \s_axi_rresp_i_reg[1] 
       (.C(s_axi_aclk),
        .CE(s_axi_rresp_i),
        .D(ip2bus_error),
        .Q(s_axi_rresp),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    s_axi_rvalid_i_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(I_DECODER_n_42),
        .Q(s_axi_rvalid_i_reg_0),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hF800)) 
    start2_i_1
       (.I0(s_axi_awvalid),
        .I1(s_axi_wvalid),
        .I2(s_axi_arvalid),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .O(start2_i_1_n_0));
  FDRE start2_reg
       (.C(s_axi_aclk),
        .CE(1'b1),
        .D(start2_i_1_n_0),
        .Q(start2),
        .R(SR));
endmodule
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
