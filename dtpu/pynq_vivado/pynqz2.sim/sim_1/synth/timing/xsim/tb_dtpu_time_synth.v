// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Tue Mar 24 18:22:52 2020
// Host        : fra running 64-bit Ubuntu 18.04.4 LTS
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /media/fra/DATA/uni/2019-2020/thesis/cogitantium/dtpu/pynq_vivado/pynqz2.sim/sim_1/synth/timing/xsim/tb_dtpu_time_synth.v
// Design      : dtpu_core
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module control_unit
   (csr_ce_OBUF,
    wm_reset_OBUF,
    cs_idle_OBUF,
    cs_ready_OBUF,
    E,
    infifo_read_OBUF,
    cs_done_OBUF,
    outfifo_din_OBUF,
    aresetn_IBUF,
    CLK,
    SR,
    D,
    Q,
    \outfifo_din[11] ,
    cs_start_IBUF,
    enable_IBUF);
  output csr_ce_OBUF;
  output wm_reset_OBUF;
  output cs_idle_OBUF;
  output cs_ready_OBUF;
  output [0:0]E;
  output infifo_read_OBUF;
  output cs_done_OBUF;
  output [11:0]outfifo_din_OBUF;
  input aresetn_IBUF;
  input CLK;
  input [0:0]SR;
  input [3:0]D;
  input [3:0]Q;
  input [3:0]\outfifo_din[11] ;
  input cs_start_IBUF;
  input enable_IBUF;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_2_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[4]_i_1_n_0 ;
  wire \FSM_onehot_state[5]_i_1_n_0 ;
  wire \FSM_onehot_state[7]_i_1_n_0 ;
  wire \FSM_onehot_state[8]_i_1_n_0 ;
  wire \FSM_onehot_state[8]_i_2_n_0 ;
  wire \FSM_onehot_state[9]_i_1_n_0 ;
  wire \FSM_onehot_state[9]_i_2_n_0 ;
  wire \FSM_onehot_state[9]_i_3_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire \FSM_onehot_state_reg_n_0_[5] ;
  wire \FSM_onehot_state_reg_n_0_[6] ;
  wire \FSM_onehot_state_reg_n_0_[7] ;
  wire \FSM_onehot_state_reg_n_0_[8] ;
  wire \FSM_onehot_state_reg_n_0_[9] ;
  wire [3:0]Q;
  wire [0:0]SR;
  wire aresetn_IBUF;
  wire [3:1]counter_compute;
  wire \counter_compute[0]_i_1_n_0 ;
  wire \counter_compute_reg_n_0_[0] ;
  wire \counter_compute_reg_n_0_[1] ;
  wire \counter_compute_reg_n_0_[2] ;
  wire \counter_compute_reg_n_0_[3] ;
  wire [1:1]counter_res;
  wire \counter_res[0]_i_1_n_0 ;
  wire \counter_res_reg_n_0_[0] ;
  wire \counter_res_reg_n_0_[1] ;
  wire cs_done_OBUF;
  wire cs_idle_OBUF;
  wire cs_ready_OBUF;
  wire cs_start_IBUF;
  wire csr_ce_OBUF;
  wire enable_IBUF;
  wire enable_mxu_i_1_n_0;
  wire infifo_read_OBUF;
  wire [3:0]\outfifo_din[11] ;
  wire [11:0]outfifo_din_OBUF;
  wire outfifo_write_i_1_n_0;
  wire wm_ce_i_1_n_0;
  wire wm_reset_OBUF;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFF54F4)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(cs_start_IBUF),
        .I1(\FSM_onehot_state[1]_i_2_n_0 ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(enable_IBUF),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \FSM_onehot_state[1]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\FSM_onehot_state[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(enable_IBUF),
        .I1(cs_start_IBUF),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(cs_start_IBUF),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_state[4]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(cs_start_IBUF),
        .O(\FSM_onehot_state[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_state[5]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .I1(cs_start_IBUF),
        .O(\FSM_onehot_state[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFA8AAAAAA)) 
    \FSM_onehot_state[7]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[7] ),
        .I1(\counter_compute_reg_n_0_[2] ),
        .I2(\counter_compute_reg_n_0_[1] ),
        .I3(\counter_compute_reg_n_0_[0] ),
        .I4(\counter_compute_reg_n_0_[3] ),
        .I5(\FSM_onehot_state_reg_n_0_[6] ),
        .O(\FSM_onehot_state[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFB0)) 
    \FSM_onehot_state[8]_i_1 
       (.I0(\counter_res_reg_n_0_[1] ),
        .I1(\counter_res_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[8] ),
        .I3(\FSM_onehot_state[8]_i_2_n_0 ),
        .O(\FSM_onehot_state[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    \FSM_onehot_state[8]_i_2 
       (.I0(\counter_compute_reg_n_0_[3] ),
        .I1(\counter_compute_reg_n_0_[1] ),
        .I2(\counter_compute_reg_n_0_[0] ),
        .I3(\counter_compute_reg_n_0_[2] ),
        .I4(\FSM_onehot_state_reg_n_0_[7] ),
        .O(\FSM_onehot_state[8]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_onehot_state[9]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[8] ),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_state[9]_i_3_n_0 ),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(\FSM_onehot_state_reg_n_0_[9] ),
        .O(\FSM_onehot_state[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFF08)) 
    \FSM_onehot_state[9]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[8] ),
        .I1(\counter_res_reg_n_0_[0] ),
        .I2(\counter_res_reg_n_0_[1] ),
        .I3(\FSM_onehot_state_reg_n_0_[9] ),
        .O(\FSM_onehot_state[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_onehot_state[9]_i_3 
       (.I0(\FSM_onehot_state_reg_n_0_[7] ),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .I4(\FSM_onehot_state_reg_n_0_[5] ),
        .I5(\FSM_onehot_state_reg_n_0_[6] ),
        .O(\FSM_onehot_state[9]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "retrieve_data:0000100000,done:1000000000,compute:0010000000,start_p3:0000010000,idle:0000000010,Power_up:0000000001,start_p2:0000001000,flush_out_fifo:0100000000,stop:0110,start_p1:0000000100,activate_enable_data_type:0001000000" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(CLK),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(1'b0),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .S(SR));
  (* FSM_ENCODED_STATES = "retrieve_data:0000100000,done:1000000000,compute:0010000000,start_p3:0000010000,idle:0000000010,Power_up:0000000001,start_p2:0000001000,flush_out_fifo:0100000000,stop:0110,start_p1:0000000100,activate_enable_data_type:0001000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(CLK),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "retrieve_data:0000100000,done:1000000000,compute:0010000000,start_p3:0000010000,idle:0000000010,Power_up:0000000001,start_p2:0000001000,flush_out_fifo:0100000000,stop:0110,start_p1:0000000100,activate_enable_data_type:0001000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(CLK),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[2] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "retrieve_data:0000100000,done:1000000000,compute:0010000000,start_p3:0000010000,idle:0000000010,Power_up:0000000001,start_p2:0000001000,flush_out_fifo:0100000000,stop:0110,start_p1:0000000100,activate_enable_data_type:0001000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(CLK),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[3] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "retrieve_data:0000100000,done:1000000000,compute:0010000000,start_p3:0000010000,idle:0000000010,Power_up:0000000001,start_p2:0000001000,flush_out_fifo:0100000000,stop:0110,start_p1:0000000100,activate_enable_data_type:0001000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(CLK),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state[4]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "retrieve_data:0000100000,done:1000000000,compute:0010000000,start_p3:0000010000,idle:0000000010,Power_up:0000000001,start_p2:0000001000,flush_out_fifo:0100000000,stop:0110,start_p1:0000000100,activate_enable_data_type:0001000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[5] 
       (.C(CLK),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state[5]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[5] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "retrieve_data:0000100000,done:1000000000,compute:0010000000,start_p3:0000010000,idle:0000000010,Power_up:0000000001,start_p2:0000001000,flush_out_fifo:0100000000,stop:0110,start_p1:0000000100,activate_enable_data_type:0001000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[6] 
       (.C(CLK),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[5] ),
        .Q(\FSM_onehot_state_reg_n_0_[6] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "retrieve_data:0000100000,done:1000000000,compute:0010000000,start_p3:0000010000,idle:0000000010,Power_up:0000000001,start_p2:0000001000,flush_out_fifo:0100000000,stop:0110,start_p1:0000000100,activate_enable_data_type:0001000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[7] 
       (.C(CLK),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state[7]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[7] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "retrieve_data:0000100000,done:1000000000,compute:0010000000,start_p3:0000010000,idle:0000000010,Power_up:0000000001,start_p2:0000001000,flush_out_fifo:0100000000,stop:0110,start_p1:0000000100,activate_enable_data_type:0001000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[8] 
       (.C(CLK),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state[8]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[8] ),
        .R(SR));
  (* FSM_ENCODED_STATES = "retrieve_data:0000100000,done:1000000000,compute:0010000000,start_p3:0000010000,idle:0000000010,Power_up:0000000001,start_p2:0000001000,flush_out_fifo:0100000000,stop:0110,start_p1:0000000100,activate_enable_data_type:0001000000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[9] 
       (.C(CLK),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state[9]_i_2_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[9] ),
        .R(SR));
  LUT2 #(
    .INIT(4'h2)) 
    \counter_compute[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[7] ),
        .I1(\counter_compute_reg_n_0_[0] ),
        .O(\counter_compute[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \counter_compute[1]_i_1 
       (.I0(\counter_compute_reg_n_0_[1] ),
        .I1(\counter_compute_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[7] ),
        .O(counter_compute[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7800)) 
    \counter_compute[2]_i_1 
       (.I0(\counter_compute_reg_n_0_[1] ),
        .I1(\counter_compute_reg_n_0_[0] ),
        .I2(\counter_compute_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[7] ),
        .O(counter_compute[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7F800000)) 
    \counter_compute[3]_i_1 
       (.I0(\counter_compute_reg_n_0_[2] ),
        .I1(\counter_compute_reg_n_0_[1] ),
        .I2(\counter_compute_reg_n_0_[0] ),
        .I3(\counter_compute_reg_n_0_[3] ),
        .I4(\FSM_onehot_state_reg_n_0_[7] ),
        .O(counter_compute[3]));
  FDRE #(
    .INIT(1'b0)) 
    \counter_compute_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_compute[0]_i_1_n_0 ),
        .Q(\counter_compute_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_compute_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(counter_compute[1]),
        .Q(\counter_compute_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_compute_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(counter_compute[2]),
        .Q(\counter_compute_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_compute_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(counter_compute[3]),
        .Q(\counter_compute_reg_n_0_[3] ),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter_res[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[8] ),
        .I1(\counter_res_reg_n_0_[0] ),
        .O(\counter_res[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \counter_res[1]_i_1 
       (.I0(\counter_res_reg_n_0_[1] ),
        .I1(\counter_res_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[8] ),
        .O(counter_res));
  FDRE #(
    .INIT(1'b0)) 
    \counter_res_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\counter_res[0]_i_1_n_0 ),
        .Q(\counter_res_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_res_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(counter_res),
        .Q(\counter_res_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    cs_idle_reg
       (.C(CLK),
        .CE(aresetn_IBUF),
        .D(\FSM_onehot_state_reg_n_0_[1] ),
        .Q(cs_idle_OBUF),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    cs_ready_reg
       (.C(CLK),
        .CE(aresetn_IBUF),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(cs_ready_OBUF),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    csr_ce_reg
       (.C(CLK),
        .CE(aresetn_IBUF),
        .D(\FSM_onehot_state_reg_n_0_[6] ),
        .Q(csr_ce_OBUF),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    csr_reset_reg
       (.C(CLK),
        .CE(aresetn_IBUF),
        .D(\FSM_onehot_state_reg_n_0_[0] ),
        .Q(wm_reset_OBUF),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hEFE0)) 
    enable_mxu_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[7] ),
        .I1(\FSM_onehot_state_reg_n_0_[8] ),
        .I2(aresetn_IBUF),
        .I3(E),
        .O(enable_mxu_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    enable_mxu_reg
       (.C(CLK),
        .CE(1'b1),
        .D(enable_mxu_i_1_n_0),
        .Q(E),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \outfifo_din_OBUF[0]_inst_i_1 
       (.I0(cs_done_OBUF),
        .I1(D[0]),
        .O(outfifo_din_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \outfifo_din_OBUF[10]_inst_i_1 
       (.I0(cs_done_OBUF),
        .I1(\outfifo_din[11] [2]),
        .O(outfifo_din_OBUF[10]));
  LUT2 #(
    .INIT(4'h8)) 
    \outfifo_din_OBUF[11]_inst_i_1 
       (.I0(cs_done_OBUF),
        .I1(\outfifo_din[11] [3]),
        .O(outfifo_din_OBUF[11]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \outfifo_din_OBUF[1]_inst_i_1 
       (.I0(cs_done_OBUF),
        .I1(D[1]),
        .O(outfifo_din_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \outfifo_din_OBUF[2]_inst_i_1 
       (.I0(cs_done_OBUF),
        .I1(D[2]),
        .O(outfifo_din_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \outfifo_din_OBUF[3]_inst_i_1 
       (.I0(cs_done_OBUF),
        .I1(D[3]),
        .O(outfifo_din_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \outfifo_din_OBUF[4]_inst_i_1 
       (.I0(cs_done_OBUF),
        .I1(Q[0]),
        .O(outfifo_din_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \outfifo_din_OBUF[5]_inst_i_1 
       (.I0(cs_done_OBUF),
        .I1(Q[1]),
        .O(outfifo_din_OBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \outfifo_din_OBUF[6]_inst_i_1 
       (.I0(cs_done_OBUF),
        .I1(Q[2]),
        .O(outfifo_din_OBUF[6]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \outfifo_din_OBUF[7]_inst_i_1 
       (.I0(cs_done_OBUF),
        .I1(Q[3]),
        .O(outfifo_din_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \outfifo_din_OBUF[8]_inst_i_1 
       (.I0(cs_done_OBUF),
        .I1(\outfifo_din[11] [0]),
        .O(outfifo_din_OBUF[8]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \outfifo_din_OBUF[9]_inst_i_1 
       (.I0(cs_done_OBUF),
        .I1(\outfifo_din[11] [1]),
        .O(outfifo_din_OBUF[9]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    outfifo_write_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[9] ),
        .I1(aresetn_IBUF),
        .I2(cs_done_OBUF),
        .O(outfifo_write_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    outfifo_write_reg
       (.C(CLK),
        .CE(1'b1),
        .D(outfifo_write_i_1_n_0),
        .Q(cs_done_OBUF),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hEFE0)) 
    wm_ce_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[5] ),
        .I1(\FSM_onehot_state_reg_n_0_[6] ),
        .I2(aresetn_IBUF),
        .I3(infifo_read_OBUF),
        .O(wm_ce_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    wm_ce_reg
       (.C(CLK),
        .CE(1'b1),
        .D(wm_ce_i_1_n_0),
        .Q(infifo_read_OBUF),
        .R(1'b0));
endmodule

(* COLUMNS = "3" *) (* DATA_WIDTH_CSR = "8" *) (* DATA_WIDTH_FIFO_IN = "64" *) 
(* DATA_WIDTH_FIFO_OUT = "64" *) (* DATA_WIDTH_MAC = "4" *) (* DATA_WIDTH_WMEMORY = "64" *) 
(* ROWS = "3" *) (* SIZE_CSR = "1024" *) (* SIZE_WMEMORY = "8196" *) 
(* NotValidForBitStream *)
module dtpu_core
   (clk,
    aresetn,
    test_mode,
    enable,
    csr_address,
    csr_clk,
    csr_din,
    csr_dout,
    csr_ce,
    csr_reset,
    csr_we,
    wm_address,
    wm_clk,
    wm_din,
    wm_dout,
    wm_ce,
    wm_reset,
    wm_we,
    infifo_is_empty,
    infifo_dout,
    infifo_read,
    outfifo_is_full,
    outfifo_din,
    outfifo_write,
    cs_continue,
    cs_done,
    cs_idle,
    cs_ready,
    cs_start,
    state);
  input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 areset RST" *) (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *) input aresetn;
  input test_mode;
  input enable;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) output [31:0]csr_address;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface CLK" *) output csr_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DIN" *) output [7:0]csr_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DOUT" *) input [7:0]csr_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface EN" *) (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC no,MEM_WIDTH 8,MEM_SIZE 1024 " *) output csr_ce;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface RST" *) output csr_reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface WE" *) output csr_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) output [31:0]wm_address;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface CLK" *) output wm_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) output [63:0]wm_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) input [63:0]wm_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface EN" *) (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC no,MEM_WIDTH 64,MEM_SIZE 8192 " *) output wm_ce;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface RST" *) output wm_reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface WE" *) output wm_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo EMPTY_N" *) input infifo_is_empty;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) input [63:0]infifo_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_EN" *) output infifo_read;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo FULL_N" *) input outfifo_is_full;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) output [63:0]outfifo_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_EN" *) output outfifo_write;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_continue" *) input cs_continue;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_done" *) output cs_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_idle" *) output cs_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_ready" *) output cs_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_start" *) input cs_start;
  output [3:0]state;

  wire aresetn;
  wire aresetn_IBUF;
  wire clk;
  wire cs_done;
  wire cs_done_OBUF;
  wire cs_idle;
  wire cs_idle_OBUF;
  wire cs_ready;
  wire cs_ready_OBUF;
  wire cs_start;
  wire cs_start_IBUF;
  wire [31:0]csr_address;
  wire csr_ce;
  wire csr_ce_OBUF;
  wire csr_clk;
  wire [7:0]csr_din;
  wire csr_reset;
  wire csr_we;
  wire enable;
  wire enable_IBUF;
  wire enable_i;
  wire engine_n_5;
  wire engine_n_6;
  wire engine_n_7;
  wire engine_n_8;
  wire [63:0]infifo_dout;
  wire [11:0]infifo_dout_IBUF;
  wire infifo_read;
  wire infifo_read_OBUF;
  wire [11:8]input_data_from_fifo;
  wire [7:0]input_data_from_fifo__0;
  wire [3:0]input_data_to_fifo;
  wire \kernel/reset_mac ;
  wire [63:0]outfifo_din;
  wire [11:0]outfifo_din_OBUF;
  wire outfifo_write;
  wire [3:0]q_i;
  wire [3:0]state;
  wire [3:0]state_OBUF;
  wire [11:0]weight_from_memory;
  wire [31:0]wm_address;
  wire wm_ce;
  wire wm_clk;
  wire wm_clk_OBUF;
  wire wm_clk_OBUF_BUFG;
  wire [63:0]wm_din;
  wire [63:0]wm_dout;
  wire [11:0]wm_dout_IBUF;
  wire wm_reset;
  wire wm_reset_OBUF;
  wire wm_we;

initial begin
 $sdf_annotate("tb_dtpu_time_synth.sdf",,,,"tool_control");
end
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 areset RST" *) 
  (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *) 
  IBUF aresetn_IBUF_inst
       (.I(aresetn),
        .O(aresetn_IBUF));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(wm_clk_OBUF));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_done" *) 
  OBUF cs_done_OBUF_inst
       (.I(cs_done_OBUF),
        .O(cs_done));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_idle" *) 
  OBUF cs_idle_OBUF_inst
       (.I(cs_idle_OBUF),
        .O(cs_idle));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_ready" *) 
  OBUF cs_ready_OBUF_inst
       (.I(cs_ready_OBUF),
        .O(cs_ready));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake_rtl:1.0 control_interface ap_start" *) 
  IBUF cs_start_IBUF_inst
       (.I(cs_start),
        .O(cs_start_IBUF));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[0]_inst 
       (.I(1'b0),
        .O(csr_address[0]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[10]_inst 
       (.I(1'b0),
        .O(csr_address[10]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[11]_inst 
       (.I(1'b0),
        .O(csr_address[11]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[12]_inst 
       (.I(1'b0),
        .O(csr_address[12]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[13]_inst 
       (.I(1'b0),
        .O(csr_address[13]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[14]_inst 
       (.I(1'b0),
        .O(csr_address[14]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[15]_inst 
       (.I(1'b0),
        .O(csr_address[15]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[16]_inst 
       (.I(1'b0),
        .O(csr_address[16]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[17]_inst 
       (.I(1'b0),
        .O(csr_address[17]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[18]_inst 
       (.I(1'b0),
        .O(csr_address[18]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[19]_inst 
       (.I(1'b0),
        .O(csr_address[19]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[1]_inst 
       (.I(1'b0),
        .O(csr_address[1]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[20]_inst 
       (.I(1'b0),
        .O(csr_address[20]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[21]_inst 
       (.I(1'b0),
        .O(csr_address[21]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[22]_inst 
       (.I(1'b0),
        .O(csr_address[22]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[23]_inst 
       (.I(1'b0),
        .O(csr_address[23]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[24]_inst 
       (.I(1'b0),
        .O(csr_address[24]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[25]_inst 
       (.I(1'b0),
        .O(csr_address[25]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[26]_inst 
       (.I(1'b0),
        .O(csr_address[26]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[27]_inst 
       (.I(1'b0),
        .O(csr_address[27]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[28]_inst 
       (.I(1'b0),
        .O(csr_address[28]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[29]_inst 
       (.I(1'b0),
        .O(csr_address[29]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[2]_inst 
       (.I(1'b0),
        .O(csr_address[2]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[30]_inst 
       (.I(1'b0),
        .O(csr_address[30]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[31]_inst 
       (.I(1'b0),
        .O(csr_address[31]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[3]_inst 
       (.I(1'b0),
        .O(csr_address[3]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[4]_inst 
       (.I(1'b0),
        .O(csr_address[4]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[5]_inst 
       (.I(1'b0),
        .O(csr_address[5]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[6]_inst 
       (.I(1'b0),
        .O(csr_address[6]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[7]_inst 
       (.I(1'b0),
        .O(csr_address[7]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[8]_inst 
       (.I(1'b0),
        .O(csr_address[8]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface ADDR" *) 
  OBUF \csr_address_OBUF[9]_inst 
       (.I(1'b0),
        .O(csr_address[9]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface EN" *) 
  (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC no,MEM_WIDTH 8,MEM_SIZE 1024 " *) 
  OBUF csr_ce_OBUF_inst
       (.I(csr_ce_OBUF),
        .O(csr_ce));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface CLK" *) 
  OBUF csr_clk_OBUF_inst
       (.I(wm_clk_OBUF_BUFG),
        .O(csr_clk));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DIN" *) 
  OBUFT \csr_din_OBUF[0]_inst 
       (.I(1'b0),
        .O(csr_din[0]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DIN" *) 
  OBUFT \csr_din_OBUF[1]_inst 
       (.I(1'b0),
        .O(csr_din[1]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DIN" *) 
  OBUFT \csr_din_OBUF[2]_inst 
       (.I(1'b0),
        .O(csr_din[2]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DIN" *) 
  OBUFT \csr_din_OBUF[3]_inst 
       (.I(1'b0),
        .O(csr_din[3]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DIN" *) 
  OBUFT \csr_din_OBUF[4]_inst 
       (.I(1'b0),
        .O(csr_din[4]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DIN" *) 
  OBUFT \csr_din_OBUF[5]_inst 
       (.I(1'b0),
        .O(csr_din[5]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DIN" *) 
  OBUFT \csr_din_OBUF[6]_inst 
       (.I(1'b0),
        .O(csr_din[6]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface DIN" *) 
  OBUFT \csr_din_OBUF[7]_inst 
       (.I(1'b0),
        .O(csr_din[7]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface RST" *) 
  OBUF csr_reset_OBUF_inst
       (.I(wm_reset_OBUF),
        .O(csr_reset));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 csr_mem_interface WE" *) 
  OBUF csr_we_OBUF_inst
       (.I(1'b0),
        .O(csr_we));
  control_unit cu
       (.CLK(wm_clk_OBUF_BUFG),
        .D(input_data_to_fifo),
        .E(enable_i),
        .Q({engine_n_5,engine_n_6,engine_n_7,engine_n_8}),
        .SR(\kernel/reset_mac ),
        .aresetn_IBUF(aresetn_IBUF),
        .cs_done_OBUF(cs_done_OBUF),
        .cs_idle_OBUF(cs_idle_OBUF),
        .cs_ready_OBUF(cs_ready_OBUF),
        .cs_start_IBUF(cs_start_IBUF),
        .csr_ce_OBUF(csr_ce_OBUF),
        .enable_IBUF(enable_IBUF),
        .infifo_read_OBUF(infifo_read_OBUF),
        .\outfifo_din[11] (q_i),
        .outfifo_din_OBUF(outfifo_din_OBUF),
        .wm_reset_OBUF(wm_reset_OBUF));
  IBUF enable_IBUF_inst
       (.I(enable),
        .O(enable_IBUF));
  mxu_wrapper engine
       (.CLK(wm_clk_OBUF_BUFG),
        .D(input_data_to_fifo),
        .E(enable_i),
        .Q(weight_from_memory),
        .SR(\kernel/reset_mac ),
        .aresetn_IBUF(aresetn_IBUF),
        .\q_i_reg[3] ({engine_n_5,engine_n_6,engine_n_7,engine_n_8}),
        .\q_i_reg[3]_0 (q_i),
        .\q_i_reg[3]_1 ({input_data_from_fifo,input_data_from_fifo__0}));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) 
  IBUF \infifo_dout_IBUF[0]_inst 
       (.I(infifo_dout[0]),
        .O(infifo_dout_IBUF[0]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) 
  IBUF \infifo_dout_IBUF[10]_inst 
       (.I(infifo_dout[10]),
        .O(infifo_dout_IBUF[10]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) 
  IBUF \infifo_dout_IBUF[11]_inst 
       (.I(infifo_dout[11]),
        .O(infifo_dout_IBUF[11]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) 
  IBUF \infifo_dout_IBUF[1]_inst 
       (.I(infifo_dout[1]),
        .O(infifo_dout_IBUF[1]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) 
  IBUF \infifo_dout_IBUF[2]_inst 
       (.I(infifo_dout[2]),
        .O(infifo_dout_IBUF[2]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) 
  IBUF \infifo_dout_IBUF[3]_inst 
       (.I(infifo_dout[3]),
        .O(infifo_dout_IBUF[3]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) 
  IBUF \infifo_dout_IBUF[4]_inst 
       (.I(infifo_dout[4]),
        .O(infifo_dout_IBUF[4]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) 
  IBUF \infifo_dout_IBUF[5]_inst 
       (.I(infifo_dout[5]),
        .O(infifo_dout_IBUF[5]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) 
  IBUF \infifo_dout_IBUF[6]_inst 
       (.I(infifo_dout[6]),
        .O(infifo_dout_IBUF[6]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) 
  IBUF \infifo_dout_IBUF[7]_inst 
       (.I(infifo_dout[7]),
        .O(infifo_dout_IBUF[7]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) 
  IBUF \infifo_dout_IBUF[8]_inst 
       (.I(infifo_dout[8]),
        .O(infifo_dout_IBUF[8]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_DATA" *) 
  IBUF \infifo_dout_IBUF[9]_inst 
       (.I(infifo_dout[9]),
        .O(infifo_dout_IBUF[9]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_read:1.0 input_fifo RD_EN" *) 
  OBUF infifo_read_OBUF_inst
       (.I(infifo_read_OBUF),
        .O(infifo_read));
  FDRE #(
    .INIT(1'b0)) 
    \input_data_from_fifo_reg[0] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(infifo_dout_IBUF[0]),
        .Q(input_data_from_fifo__0[0]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \input_data_from_fifo_reg[10] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(infifo_dout_IBUF[10]),
        .Q(input_data_from_fifo[10]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \input_data_from_fifo_reg[11] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(infifo_dout_IBUF[11]),
        .Q(input_data_from_fifo[11]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \input_data_from_fifo_reg[1] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(infifo_dout_IBUF[1]),
        .Q(input_data_from_fifo__0[1]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \input_data_from_fifo_reg[2] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(infifo_dout_IBUF[2]),
        .Q(input_data_from_fifo__0[2]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \input_data_from_fifo_reg[3] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(infifo_dout_IBUF[3]),
        .Q(input_data_from_fifo__0[3]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \input_data_from_fifo_reg[4] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(infifo_dout_IBUF[4]),
        .Q(input_data_from_fifo__0[4]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \input_data_from_fifo_reg[5] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(infifo_dout_IBUF[5]),
        .Q(input_data_from_fifo__0[5]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \input_data_from_fifo_reg[6] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(infifo_dout_IBUF[6]),
        .Q(input_data_from_fifo__0[6]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \input_data_from_fifo_reg[7] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(infifo_dout_IBUF[7]),
        .Q(input_data_from_fifo__0[7]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \input_data_from_fifo_reg[8] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(infifo_dout_IBUF[8]),
        .Q(input_data_from_fifo[8]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \input_data_from_fifo_reg[9] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(infifo_dout_IBUF[9]),
        .Q(input_data_from_fifo[9]),
        .R(\kernel/reset_mac ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[0]_inst 
       (.I(outfifo_din_OBUF[0]),
        .O(outfifo_din[0]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[10]_inst 
       (.I(outfifo_din_OBUF[10]),
        .O(outfifo_din[10]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[11]_inst 
       (.I(outfifo_din_OBUF[11]),
        .O(outfifo_din[11]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[12]_inst 
       (.I(1'b0),
        .O(outfifo_din[12]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[13]_inst 
       (.I(1'b0),
        .O(outfifo_din[13]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[14]_inst 
       (.I(1'b0),
        .O(outfifo_din[14]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[15]_inst 
       (.I(1'b0),
        .O(outfifo_din[15]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[16]_inst 
       (.I(1'b0),
        .O(outfifo_din[16]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[17]_inst 
       (.I(1'b0),
        .O(outfifo_din[17]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[18]_inst 
       (.I(1'b0),
        .O(outfifo_din[18]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[19]_inst 
       (.I(1'b0),
        .O(outfifo_din[19]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[1]_inst 
       (.I(outfifo_din_OBUF[1]),
        .O(outfifo_din[1]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[20]_inst 
       (.I(1'b0),
        .O(outfifo_din[20]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[21]_inst 
       (.I(1'b0),
        .O(outfifo_din[21]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[22]_inst 
       (.I(1'b0),
        .O(outfifo_din[22]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[23]_inst 
       (.I(1'b0),
        .O(outfifo_din[23]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[24]_inst 
       (.I(1'b0),
        .O(outfifo_din[24]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[25]_inst 
       (.I(1'b0),
        .O(outfifo_din[25]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[26]_inst 
       (.I(1'b0),
        .O(outfifo_din[26]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[27]_inst 
       (.I(1'b0),
        .O(outfifo_din[27]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[28]_inst 
       (.I(1'b0),
        .O(outfifo_din[28]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[29]_inst 
       (.I(1'b0),
        .O(outfifo_din[29]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[2]_inst 
       (.I(outfifo_din_OBUF[2]),
        .O(outfifo_din[2]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[30]_inst 
       (.I(1'b0),
        .O(outfifo_din[30]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[31]_inst 
       (.I(1'b0),
        .O(outfifo_din[31]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[32]_inst 
       (.I(1'b0),
        .O(outfifo_din[32]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[33]_inst 
       (.I(1'b0),
        .O(outfifo_din[33]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[34]_inst 
       (.I(1'b0),
        .O(outfifo_din[34]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[35]_inst 
       (.I(1'b0),
        .O(outfifo_din[35]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[36]_inst 
       (.I(1'b0),
        .O(outfifo_din[36]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[37]_inst 
       (.I(1'b0),
        .O(outfifo_din[37]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[38]_inst 
       (.I(1'b0),
        .O(outfifo_din[38]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[39]_inst 
       (.I(1'b0),
        .O(outfifo_din[39]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[3]_inst 
       (.I(outfifo_din_OBUF[3]),
        .O(outfifo_din[3]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[40]_inst 
       (.I(1'b0),
        .O(outfifo_din[40]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[41]_inst 
       (.I(1'b0),
        .O(outfifo_din[41]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[42]_inst 
       (.I(1'b0),
        .O(outfifo_din[42]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[43]_inst 
       (.I(1'b0),
        .O(outfifo_din[43]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[44]_inst 
       (.I(1'b0),
        .O(outfifo_din[44]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[45]_inst 
       (.I(1'b0),
        .O(outfifo_din[45]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[46]_inst 
       (.I(1'b0),
        .O(outfifo_din[46]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[47]_inst 
       (.I(1'b0),
        .O(outfifo_din[47]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[48]_inst 
       (.I(1'b0),
        .O(outfifo_din[48]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[49]_inst 
       (.I(1'b0),
        .O(outfifo_din[49]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[4]_inst 
       (.I(outfifo_din_OBUF[4]),
        .O(outfifo_din[4]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[50]_inst 
       (.I(1'b0),
        .O(outfifo_din[50]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[51]_inst 
       (.I(1'b0),
        .O(outfifo_din[51]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[52]_inst 
       (.I(1'b0),
        .O(outfifo_din[52]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[53]_inst 
       (.I(1'b0),
        .O(outfifo_din[53]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[54]_inst 
       (.I(1'b0),
        .O(outfifo_din[54]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[55]_inst 
       (.I(1'b0),
        .O(outfifo_din[55]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[56]_inst 
       (.I(1'b0),
        .O(outfifo_din[56]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[57]_inst 
       (.I(1'b0),
        .O(outfifo_din[57]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[58]_inst 
       (.I(1'b0),
        .O(outfifo_din[58]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[59]_inst 
       (.I(1'b0),
        .O(outfifo_din[59]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[5]_inst 
       (.I(outfifo_din_OBUF[5]),
        .O(outfifo_din[5]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[60]_inst 
       (.I(1'b0),
        .O(outfifo_din[60]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[61]_inst 
       (.I(1'b0),
        .O(outfifo_din[61]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[62]_inst 
       (.I(1'b0),
        .O(outfifo_din[62]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[63]_inst 
       (.I(1'b0),
        .O(outfifo_din[63]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[6]_inst 
       (.I(outfifo_din_OBUF[6]),
        .O(outfifo_din[6]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[7]_inst 
       (.I(outfifo_din_OBUF[7]),
        .O(outfifo_din[7]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[8]_inst 
       (.I(outfifo_din_OBUF[8]),
        .O(outfifo_din[8]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_DATA" *) 
  OBUF \outfifo_din_OBUF[9]_inst 
       (.I(outfifo_din_OBUF[9]),
        .O(outfifo_din[9]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_fifo_write:1.0 output_fifo WR_EN" *) 
  OBUF outfifo_write_OBUF_inst
       (.I(cs_done_OBUF),
        .O(outfifo_write));
  OBUF \state_OBUF[0]_inst 
       (.I(state_OBUF[0]),
        .O(state[0]));
  OBUF \state_OBUF[1]_inst 
       (.I(state_OBUF[1]),
        .O(state[1]));
  OBUF \state_OBUF[2]_inst 
       (.I(state_OBUF[2]),
        .O(state[2]));
  OBUF \state_OBUF[3]_inst 
       (.I(state_OBUF[3]),
        .O(state[3]));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(1'b1),
        .D(input_data_to_fifo[0]),
        .Q(state_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(1'b1),
        .D(input_data_to_fifo[1]),
        .Q(state_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(1'b1),
        .D(input_data_to_fifo[2]),
        .Q(state_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[3] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(1'b1),
        .D(input_data_to_fifo[3]),
        .Q(state_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \weight_from_memory_reg[0] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(wm_dout_IBUF[0]),
        .Q(weight_from_memory[0]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \weight_from_memory_reg[10] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(wm_dout_IBUF[10]),
        .Q(weight_from_memory[10]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \weight_from_memory_reg[11] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(wm_dout_IBUF[11]),
        .Q(weight_from_memory[11]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \weight_from_memory_reg[1] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(wm_dout_IBUF[1]),
        .Q(weight_from_memory[1]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \weight_from_memory_reg[2] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(wm_dout_IBUF[2]),
        .Q(weight_from_memory[2]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \weight_from_memory_reg[3] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(wm_dout_IBUF[3]),
        .Q(weight_from_memory[3]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \weight_from_memory_reg[4] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(wm_dout_IBUF[4]),
        .Q(weight_from_memory[4]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \weight_from_memory_reg[5] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(wm_dout_IBUF[5]),
        .Q(weight_from_memory[5]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \weight_from_memory_reg[6] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(wm_dout_IBUF[6]),
        .Q(weight_from_memory[6]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \weight_from_memory_reg[7] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(wm_dout_IBUF[7]),
        .Q(weight_from_memory[7]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \weight_from_memory_reg[8] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(wm_dout_IBUF[8]),
        .Q(weight_from_memory[8]),
        .R(\kernel/reset_mac ));
  FDRE #(
    .INIT(1'b0)) 
    \weight_from_memory_reg[9] 
       (.C(wm_clk_OBUF_BUFG),
        .CE(infifo_read_OBUF),
        .D(wm_dout_IBUF[9]),
        .Q(weight_from_memory[9]),
        .R(\kernel/reset_mac ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[0]_inst 
       (.I(1'b0),
        .O(wm_address[0]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[10]_inst 
       (.I(1'b0),
        .O(wm_address[10]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[11]_inst 
       (.I(1'b0),
        .O(wm_address[11]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[12]_inst 
       (.I(1'b0),
        .O(wm_address[12]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[13]_inst 
       (.I(1'b0),
        .O(wm_address[13]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[14]_inst 
       (.I(1'b0),
        .O(wm_address[14]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[15]_inst 
       (.I(1'b0),
        .O(wm_address[15]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[16]_inst 
       (.I(1'b0),
        .O(wm_address[16]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[17]_inst 
       (.I(1'b0),
        .O(wm_address[17]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[18]_inst 
       (.I(1'b0),
        .O(wm_address[18]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[19]_inst 
       (.I(1'b0),
        .O(wm_address[19]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[1]_inst 
       (.I(1'b0),
        .O(wm_address[1]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[20]_inst 
       (.I(1'b0),
        .O(wm_address[20]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[21]_inst 
       (.I(1'b0),
        .O(wm_address[21]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[22]_inst 
       (.I(1'b0),
        .O(wm_address[22]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[23]_inst 
       (.I(1'b0),
        .O(wm_address[23]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[24]_inst 
       (.I(1'b0),
        .O(wm_address[24]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[25]_inst 
       (.I(1'b0),
        .O(wm_address[25]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[26]_inst 
       (.I(1'b0),
        .O(wm_address[26]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[27]_inst 
       (.I(1'b0),
        .O(wm_address[27]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[28]_inst 
       (.I(1'b0),
        .O(wm_address[28]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[29]_inst 
       (.I(1'b0),
        .O(wm_address[29]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[2]_inst 
       (.I(1'b0),
        .O(wm_address[2]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[30]_inst 
       (.I(1'b0),
        .O(wm_address[30]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[31]_inst 
       (.I(1'b0),
        .O(wm_address[31]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[3]_inst 
       (.I(1'b0),
        .O(wm_address[3]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[4]_inst 
       (.I(1'b0),
        .O(wm_address[4]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[5]_inst 
       (.I(1'b0),
        .O(wm_address[5]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[6]_inst 
       (.I(1'b0),
        .O(wm_address[6]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[7]_inst 
       (.I(1'b0),
        .O(wm_address[7]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[8]_inst 
       (.I(1'b0),
        .O(wm_address[8]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface ADDR" *) 
  OBUF \wm_address_OBUF[9]_inst 
       (.I(1'b0),
        .O(wm_address[9]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface EN" *) 
  (* X_INTERFACE_PARAMETER = "MASTER_TYPE BRAM_CTRL,MEM_ECC no,MEM_WIDTH 64,MEM_SIZE 8192 " *) 
  OBUF wm_ce_OBUF_inst
       (.I(infifo_read_OBUF),
        .O(wm_ce));
  BUFG wm_clk_OBUF_BUFG_inst
       (.I(wm_clk_OBUF),
        .O(wm_clk_OBUF_BUFG));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface CLK" *) 
  OBUF wm_clk_OBUF_inst
       (.I(wm_clk_OBUF_BUFG),
        .O(wm_clk));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[0]_inst 
       (.I(1'b0),
        .O(wm_din[0]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[10]_inst 
       (.I(1'b0),
        .O(wm_din[10]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[11]_inst 
       (.I(1'b0),
        .O(wm_din[11]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[12]_inst 
       (.I(1'b0),
        .O(wm_din[12]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[13]_inst 
       (.I(1'b0),
        .O(wm_din[13]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[14]_inst 
       (.I(1'b0),
        .O(wm_din[14]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[15]_inst 
       (.I(1'b0),
        .O(wm_din[15]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[16]_inst 
       (.I(1'b0),
        .O(wm_din[16]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[17]_inst 
       (.I(1'b0),
        .O(wm_din[17]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[18]_inst 
       (.I(1'b0),
        .O(wm_din[18]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[19]_inst 
       (.I(1'b0),
        .O(wm_din[19]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[1]_inst 
       (.I(1'b0),
        .O(wm_din[1]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[20]_inst 
       (.I(1'b0),
        .O(wm_din[20]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[21]_inst 
       (.I(1'b0),
        .O(wm_din[21]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[22]_inst 
       (.I(1'b0),
        .O(wm_din[22]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[23]_inst 
       (.I(1'b0),
        .O(wm_din[23]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[24]_inst 
       (.I(1'b0),
        .O(wm_din[24]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[25]_inst 
       (.I(1'b0),
        .O(wm_din[25]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[26]_inst 
       (.I(1'b0),
        .O(wm_din[26]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[27]_inst 
       (.I(1'b0),
        .O(wm_din[27]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[28]_inst 
       (.I(1'b0),
        .O(wm_din[28]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[29]_inst 
       (.I(1'b0),
        .O(wm_din[29]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[2]_inst 
       (.I(1'b0),
        .O(wm_din[2]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[30]_inst 
       (.I(1'b0),
        .O(wm_din[30]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[31]_inst 
       (.I(1'b0),
        .O(wm_din[31]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[32]_inst 
       (.I(1'b0),
        .O(wm_din[32]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[33]_inst 
       (.I(1'b0),
        .O(wm_din[33]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[34]_inst 
       (.I(1'b0),
        .O(wm_din[34]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[35]_inst 
       (.I(1'b0),
        .O(wm_din[35]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[36]_inst 
       (.I(1'b0),
        .O(wm_din[36]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[37]_inst 
       (.I(1'b0),
        .O(wm_din[37]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[38]_inst 
       (.I(1'b0),
        .O(wm_din[38]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[39]_inst 
       (.I(1'b0),
        .O(wm_din[39]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[3]_inst 
       (.I(1'b0),
        .O(wm_din[3]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[40]_inst 
       (.I(1'b0),
        .O(wm_din[40]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[41]_inst 
       (.I(1'b0),
        .O(wm_din[41]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[42]_inst 
       (.I(1'b0),
        .O(wm_din[42]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[43]_inst 
       (.I(1'b0),
        .O(wm_din[43]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[44]_inst 
       (.I(1'b0),
        .O(wm_din[44]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[45]_inst 
       (.I(1'b0),
        .O(wm_din[45]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[46]_inst 
       (.I(1'b0),
        .O(wm_din[46]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[47]_inst 
       (.I(1'b0),
        .O(wm_din[47]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[48]_inst 
       (.I(1'b0),
        .O(wm_din[48]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[49]_inst 
       (.I(1'b0),
        .O(wm_din[49]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[4]_inst 
       (.I(1'b0),
        .O(wm_din[4]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[50]_inst 
       (.I(1'b0),
        .O(wm_din[50]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[51]_inst 
       (.I(1'b0),
        .O(wm_din[51]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[52]_inst 
       (.I(1'b0),
        .O(wm_din[52]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[53]_inst 
       (.I(1'b0),
        .O(wm_din[53]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[54]_inst 
       (.I(1'b0),
        .O(wm_din[54]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[55]_inst 
       (.I(1'b0),
        .O(wm_din[55]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[56]_inst 
       (.I(1'b0),
        .O(wm_din[56]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[57]_inst 
       (.I(1'b0),
        .O(wm_din[57]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[58]_inst 
       (.I(1'b0),
        .O(wm_din[58]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[59]_inst 
       (.I(1'b0),
        .O(wm_din[59]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[5]_inst 
       (.I(1'b0),
        .O(wm_din[5]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[60]_inst 
       (.I(1'b0),
        .O(wm_din[60]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[61]_inst 
       (.I(1'b0),
        .O(wm_din[61]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[62]_inst 
       (.I(1'b0),
        .O(wm_din[62]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[63]_inst 
       (.I(1'b0),
        .O(wm_din[63]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[6]_inst 
       (.I(1'b0),
        .O(wm_din[6]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[7]_inst 
       (.I(1'b0),
        .O(wm_din[7]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[8]_inst 
       (.I(1'b0),
        .O(wm_din[8]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DIN" *) 
  OBUFT \wm_din_OBUF[9]_inst 
       (.I(1'b0),
        .O(wm_din[9]),
        .T(1'b1));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) 
  IBUF \wm_dout_IBUF[0]_inst 
       (.I(wm_dout[0]),
        .O(wm_dout_IBUF[0]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) 
  IBUF \wm_dout_IBUF[10]_inst 
       (.I(wm_dout[10]),
        .O(wm_dout_IBUF[10]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) 
  IBUF \wm_dout_IBUF[11]_inst 
       (.I(wm_dout[11]),
        .O(wm_dout_IBUF[11]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) 
  IBUF \wm_dout_IBUF[1]_inst 
       (.I(wm_dout[1]),
        .O(wm_dout_IBUF[1]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) 
  IBUF \wm_dout_IBUF[2]_inst 
       (.I(wm_dout[2]),
        .O(wm_dout_IBUF[2]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) 
  IBUF \wm_dout_IBUF[3]_inst 
       (.I(wm_dout[3]),
        .O(wm_dout_IBUF[3]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) 
  IBUF \wm_dout_IBUF[4]_inst 
       (.I(wm_dout[4]),
        .O(wm_dout_IBUF[4]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) 
  IBUF \wm_dout_IBUF[5]_inst 
       (.I(wm_dout[5]),
        .O(wm_dout_IBUF[5]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) 
  IBUF \wm_dout_IBUF[6]_inst 
       (.I(wm_dout[6]),
        .O(wm_dout_IBUF[6]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) 
  IBUF \wm_dout_IBUF[7]_inst 
       (.I(wm_dout[7]),
        .O(wm_dout_IBUF[7]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) 
  IBUF \wm_dout_IBUF[8]_inst 
       (.I(wm_dout[8]),
        .O(wm_dout_IBUF[8]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface DOUT" *) 
  IBUF \wm_dout_IBUF[9]_inst 
       (.I(wm_dout[9]),
        .O(wm_dout_IBUF[9]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface RST" *) 
  OBUF wm_reset_OBUF_inst
       (.I(wm_reset_OBUF),
        .O(wm_reset));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram_rtl:1.0 weight_mem_interface WE" *) 
  OBUF wm_we_OBUF_inst
       (.I(1'b0),
        .O(wm_we));
endmodule

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
module mult_gen_0
   (CLK,
    A,
    B,
    CE,
    SCLR,
    P);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;

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
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_v12_0_16 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) (* ORIG_REF_NAME = "mult_gen_0" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
module mult_gen_0__1
   (CLK,
    A,
    B,
    CE,
    SCLR,
    P);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;

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
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_v12_0_16__1 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) (* ORIG_REF_NAME = "mult_gen_0" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
module mult_gen_0__2
   (CLK,
    A,
    B,
    CE,
    SCLR,
    P);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;

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
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_v12_0_16__2 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

module mxu_core
   (SCLR,
    D,
    y_mxu,
    CLK,
    \synch_input_data[2]_2 ,
    Q,
    E,
    \q_i_reg[3] ,
    aresetn_IBUF);
  output SCLR;
  output [3:0]D;
  output [7:0]y_mxu;
  input CLK;
  input [7:0]\synch_input_data[2]_2 ;
  input [11:0]Q;
  input [0:0]E;
  input [3:0]\q_i_reg[3] ;
  input aresetn_IBUF;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [11:0]Q;
  wire SCLR;
  wire aresetn_IBUF;
  wire [3:0]\data_in_next_row[1]_3 ;
  wire [3:0]\data_in_next_row[2]_4 ;
  wire [3:0]\data_in_next_row[5]_5 ;
  wire [3:0]p_0_out;
  wire [3:0]p_4_out;
  wire [3:0]p_5_out;
  wire [3:0]p_7_out;
  wire [3:0]p_8_out;
  wire [3:0]\q_i_reg[3] ;
  wire [3:0]\res_mac_next[3]_0 ;
  wire [3:0]\res_mac_next[7]_1 ;
  wire [7:0]\synch_input_data[2]_2 ;
  wire [7:0]y_mxu;

  (* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
  mult_gen_0__1 \rows[0].columns[0].mult_i 
       (.A(\synch_input_data[2]_2 [3:0]),
        .B(Q[3:0]),
        .CE(E),
        .CLK(CLK),
        .P(p_7_out),
        .SCLR(SCLR));
  mxu_mac__xdcDup__1 \rows[0].columns[1].mac_i_j 
       (.CLK(CLK),
        .E(E),
        .P(p_8_out),
        .Q(Q[3:0]),
        .SR(SCLR),
        .i_primitive(p_7_out),
        .\q_i_reg[3] (\data_in_next_row[1]_3 ),
        .\synch_input_data[2]_2 (\synch_input_data[2]_2 [7:4]));
  mxu_mac__xdcDup__2 \rows[0].columns[2].mac_i_j 
       (.CLK(CLK),
        .D(D),
        .E(E),
        .P(p_8_out),
        .Q(Q[3:0]),
        .SR(SCLR),
        .\q_i_reg[3] (\data_in_next_row[2]_4 ),
        .\q_i_reg[3]_0 (\q_i_reg[3] ));
  (* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
  mult_gen_0__2 \rows[1].columns[0].mult_i 
       (.A(\synch_input_data[2]_2 [3:0]),
        .B(Q[7:4]),
        .CE(E),
        .CLK(CLK),
        .P(\res_mac_next[3]_0 ),
        .SCLR(SCLR));
  mxu_mac__xdcDup__3 \rows[1].columns[1].mac_i_j 
       (.CLK(CLK),
        .D(\data_in_next_row[1]_3 ),
        .E(E),
        .P(p_4_out),
        .Q(Q[7:4]),
        .SR(SCLR),
        .i_primitive(\res_mac_next[3]_0 ),
        .\q_i_reg[3] (p_5_out));
  mxu_mac__xdcDup__4 \rows[1].columns[2].mac_i_j 
       (.CLK(CLK),
        .D(\data_in_next_row[2]_4 ),
        .E(E),
        .P(p_4_out),
        .Q(Q[7:4]),
        .SR(SCLR),
        .aresetn_IBUF(aresetn_IBUF),
        .\q_i_reg[3] (\data_in_next_row[5]_5 ),
        .y_mxu(y_mxu[3:0]));
  (* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
  mult_gen_0 \rows[2].columns[0].mult_i 
       (.A(\synch_input_data[2]_2 [3:0]),
        .B(Q[11:8]),
        .CE(E),
        .CLK(CLK),
        .P(p_0_out),
        .SCLR(SCLR));
  mxu_mac__xdcDup__5 \rows[2].columns[1].mac_i_j 
       (.CLK(CLK),
        .E(E),
        .P(\res_mac_next[7]_1 ),
        .Q(Q[11:8]),
        .SR(SCLR),
        .i_primitive(p_5_out),
        .i_primitive_0(p_0_out));
  mxu_mac \rows[2].columns[2].mac_i_j 
       (.CLK(CLK),
        .E(E),
        .P(\res_mac_next[7]_1 ),
        .Q(Q[11:8]),
        .SR(SCLR),
        .i_primitive(\data_in_next_row[5]_5 ),
        .y_mxu(y_mxu[7:4]));
endmodule

module mxu_mac
   (y_mxu,
    CLK,
    E,
    SR,
    i_primitive,
    Q,
    P);
  output [3:0]y_mxu;
  input CLK;
  input [0:0]E;
  input [0:0]SR;
  input [3:0]i_primitive;
  input [3:0]Q;
  input [3:0]P;

  wire CLK;
  wire [0:0]E;
  wire [3:0]P;
  wire [3:0]Q;
  wire [0:0]SR;
  wire [3:0]i_primitive;
  wire [3:0]y_mxu;
  wire [47:0]NLW_mac_PCOUT_UNCONNECTED;

  (* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2" *) 
  vivado_mac mac
       (.A(i_primitive),
        .B(Q),
        .C(P),
        .CE(E),
        .CLK(CLK),
        .P(y_mxu),
        .PCOUT(NLW_mac_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SR),
        .SUBTRACT(1'b0));
endmodule

(* ORIG_REF_NAME = "mxu_mac" *) 
module mxu_mac__xdcDup__1
   (P,
    \q_i_reg[3] ,
    CLK,
    E,
    SR,
    \synch_input_data[2]_2 ,
    Q,
    i_primitive);
  output [3:0]P;
  output [3:0]\q_i_reg[3] ;
  input CLK;
  input [0:0]E;
  input [0:0]SR;
  input [3:0]\synch_input_data[2]_2 ;
  input [3:0]Q;
  input [3:0]i_primitive;

  wire CLK;
  wire [0:0]E;
  wire [3:0]P;
  wire [3:0]Q;
  wire [0:0]SR;
  wire delay_reg1_n_0;
  wire delay_reg1_n_1;
  wire delay_reg1_n_2;
  wire delay_reg1_n_3;
  wire [3:0]i_primitive;
  wire [3:0]\q_i_reg[3] ;
  wire [3:0]\synch_input_data[2]_2 ;
  wire [47:0]NLW_mac_PCOUT_UNCONNECTED;

  register_27 delay_reg1
       (.CLK(CLK),
        .E(E),
        .Q({delay_reg1_n_0,delay_reg1_n_1,delay_reg1_n_2,delay_reg1_n_3}),
        .SR(SR),
        .\synch_input_data[2]_2 (\synch_input_data[2]_2 ));
  register_28 delay_reg2
       (.CLK(CLK),
        .D({delay_reg1_n_0,delay_reg1_n_1,delay_reg1_n_2,delay_reg1_n_3}),
        .E(E),
        .SR(SR),
        .\q_i_reg[3]_0 (\q_i_reg[3] ));
  (* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2" *) 
  vivado_mac__6 mac
       (.A(\synch_input_data[2]_2 ),
        .B(Q),
        .C(i_primitive),
        .CE(E),
        .CLK(CLK),
        .P(P),
        .PCOUT(NLW_mac_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SR),
        .SUBTRACT(1'b0));
endmodule

(* ORIG_REF_NAME = "mxu_mac" *) 
module mxu_mac__xdcDup__2
   (D,
    \q_i_reg[3] ,
    CLK,
    E,
    SR,
    \q_i_reg[3]_0 ,
    Q,
    P);
  output [3:0]D;
  output [3:0]\q_i_reg[3] ;
  input CLK;
  input [0:0]E;
  input [0:0]SR;
  input [3:0]\q_i_reg[3]_0 ;
  input [3:0]Q;
  input [3:0]P;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]P;
  wire [3:0]Q;
  wire [0:0]SR;
  wire delay_reg1_n_0;
  wire delay_reg1_n_1;
  wire delay_reg1_n_2;
  wire delay_reg1_n_3;
  wire [3:0]\q_i_reg[3] ;
  wire [3:0]\q_i_reg[3]_0 ;
  wire [47:0]NLW_mac_PCOUT_UNCONNECTED;

  register_21 delay_reg1
       (.CLK(CLK),
        .E(E),
        .Q({delay_reg1_n_0,delay_reg1_n_1,delay_reg1_n_2,delay_reg1_n_3}),
        .SR(SR),
        .\q_i_reg[3]_0 (\q_i_reg[3]_0 ));
  register_22 delay_reg2
       (.CLK(CLK),
        .D({delay_reg1_n_0,delay_reg1_n_1,delay_reg1_n_2,delay_reg1_n_3}),
        .E(E),
        .SR(SR),
        .\q_i_reg[3]_0 (\q_i_reg[3] ));
  (* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2" *) 
  vivado_mac__7 mac
       (.A(\q_i_reg[3]_0 ),
        .B(Q),
        .C(P),
        .CE(E),
        .CLK(CLK),
        .P(D),
        .PCOUT(NLW_mac_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SR),
        .SUBTRACT(1'b0));
endmodule

(* ORIG_REF_NAME = "mxu_mac" *) 
module mxu_mac__xdcDup__3
   (P,
    \q_i_reg[3] ,
    CLK,
    E,
    SR,
    D,
    Q,
    i_primitive);
  output [3:0]P;
  output [3:0]\q_i_reg[3] ;
  input CLK;
  input [0:0]E;
  input [0:0]SR;
  input [3:0]D;
  input [3:0]Q;
  input [3:0]i_primitive;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]P;
  wire [3:0]Q;
  wire [0:0]SR;
  wire delay_reg1_n_0;
  wire delay_reg1_n_1;
  wire delay_reg1_n_2;
  wire delay_reg1_n_3;
  wire [3:0]i_primitive;
  wire [3:0]\q_i_reg[3] ;
  wire [47:0]NLW_mac_PCOUT_UNCONNECTED;

  register_15 delay_reg1
       (.CLK(CLK),
        .D(D),
        .E(E),
        .Q({delay_reg1_n_0,delay_reg1_n_1,delay_reg1_n_2,delay_reg1_n_3}),
        .SR(SR));
  register_16 delay_reg2
       (.CLK(CLK),
        .D({delay_reg1_n_0,delay_reg1_n_1,delay_reg1_n_2,delay_reg1_n_3}),
        .E(E),
        .SR(SR),
        .\q_i_reg[3]_0 (\q_i_reg[3] ));
  (* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2" *) 
  vivado_mac__8 mac
       (.A(D),
        .B(Q),
        .C(i_primitive),
        .CE(E),
        .CLK(CLK),
        .P(P),
        .PCOUT(NLW_mac_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SR),
        .SUBTRACT(1'b0));
endmodule

(* ORIG_REF_NAME = "mxu_mac" *) 
module mxu_mac__xdcDup__4
   (y_mxu,
    SR,
    \q_i_reg[3] ,
    CLK,
    E,
    D,
    Q,
    P,
    aresetn_IBUF);
  output [3:0]y_mxu;
  output [0:0]SR;
  output [3:0]\q_i_reg[3] ;
  input CLK;
  input [0:0]E;
  input [3:0]D;
  input [3:0]Q;
  input [3:0]P;
  input aresetn_IBUF;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]P;
  wire [3:0]Q;
  wire [0:0]SR;
  wire aresetn_IBUF;
  wire delay_reg1_n_0;
  wire delay_reg1_n_1;
  wire delay_reg1_n_2;
  wire delay_reg1_n_3;
  wire [3:0]\q_i_reg[3] ;
  wire [3:0]y_mxu;
  wire [47:0]NLW_mac_PCOUT_UNCONNECTED;

  register_9 delay_reg1
       (.CLK(CLK),
        .D(D),
        .E(E),
        .Q({delay_reg1_n_0,delay_reg1_n_1,delay_reg1_n_2,delay_reg1_n_3}),
        .SR(SR));
  register_10 delay_reg2
       (.CLK(CLK),
        .D({delay_reg1_n_0,delay_reg1_n_1,delay_reg1_n_2,delay_reg1_n_3}),
        .E(E),
        .SR(SR),
        .aresetn_IBUF(aresetn_IBUF),
        .\q_i_reg[3]_0 (\q_i_reg[3] ));
  (* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2" *) 
  vivado_mac__9 mac
       (.A(D),
        .B(Q),
        .C(P),
        .CE(E),
        .CLK(CLK),
        .P(y_mxu),
        .PCOUT(NLW_mac_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SR),
        .SUBTRACT(1'b0));
endmodule

(* ORIG_REF_NAME = "mxu_mac" *) 
module mxu_mac__xdcDup__5
   (P,
    CLK,
    E,
    SR,
    i_primitive,
    Q,
    i_primitive_0);
  output [3:0]P;
  input CLK;
  input [0:0]E;
  input [0:0]SR;
  input [3:0]i_primitive;
  input [3:0]Q;
  input [3:0]i_primitive_0;

  wire CLK;
  wire [0:0]E;
  wire [3:0]P;
  wire [3:0]Q;
  wire [0:0]SR;
  wire [3:0]i_primitive;
  wire [3:0]i_primitive_0;
  wire [47:0]NLW_mac_PCOUT_UNCONNECTED;

  (* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2" *) 
  vivado_mac__10 mac
       (.A(i_primitive),
        .B(Q),
        .C(i_primitive_0),
        .CE(E),
        .CLK(CLK),
        .P(P),
        .PCOUT(NLW_mac_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SR),
        .SUBTRACT(1'b0));
endmodule

module mxu_wrapper
   (SR,
    D,
    \q_i_reg[3] ,
    \q_i_reg[3]_0 ,
    CLK,
    Q,
    E,
    \q_i_reg[3]_1 ,
    aresetn_IBUF);
  output [0:0]SR;
  output [3:0]D;
  output [3:0]\q_i_reg[3] ;
  output [3:0]\q_i_reg[3]_0 ;
  input CLK;
  input [11:0]Q;
  input [0:0]E;
  input [11:0]\q_i_reg[3]_1 ;
  input aresetn_IBUF;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [11:0]Q;
  wire [0:0]SR;
  wire aresetn_IBUF;
  wire \pipeline_reg_delayer_input_columns[2].incremental_step[0].del_input_register_j_n_0 ;
  wire \pipeline_reg_delayer_input_columns[2].incremental_step[0].del_input_register_j_n_1 ;
  wire \pipeline_reg_delayer_input_columns[2].incremental_step[0].del_input_register_j_n_2 ;
  wire \pipeline_reg_delayer_input_columns[2].incremental_step[0].del_input_register_j_n_3 ;
  wire \pipeline_reg_delayer_output[0].incrementa_step_output[0].del_output_register_i_n_0 ;
  wire \pipeline_reg_delayer_output[0].incrementa_step_output[0].del_output_register_i_n_1 ;
  wire \pipeline_reg_delayer_output[0].incrementa_step_output[0].del_output_register_i_n_2 ;
  wire \pipeline_reg_delayer_output[0].incrementa_step_output[0].del_output_register_i_n_3 ;
  wire [3:0]\q_i_reg[3] ;
  wire [3:0]\q_i_reg[3]_0 ;
  wire [11:0]\q_i_reg[3]_1 ;
  wire [7:0]\synch_input_data[2]_2 ;
  wire [11:4]y_mxu;

  mxu_core kernel
       (.CLK(CLK),
        .D(D),
        .E(E),
        .Q(Q),
        .SCLR(SR),
        .aresetn_IBUF(aresetn_IBUF),
        .\q_i_reg[3] (\q_i_reg[3]_1 [11:8]),
        .\synch_input_data[2]_2 (\synch_input_data[2]_2 ),
        .y_mxu(y_mxu));
  register \pipeline_reg_delayer_input_columns[1].incremental_step[1].del_input_register_j 
       (.CLK(CLK),
        .E(E),
        .Q(\synch_input_data[2]_2 [7:4]),
        .SR(SR),
        .\q_i_reg[3]_0 (\q_i_reg[3]_1 [7:4]));
  register_0 \pipeline_reg_delayer_input_columns[2].incremental_step[0].del_input_register_j 
       (.CLK(CLK),
        .E(E),
        .Q({\pipeline_reg_delayer_input_columns[2].incremental_step[0].del_input_register_j_n_0 ,\pipeline_reg_delayer_input_columns[2].incremental_step[0].del_input_register_j_n_1 ,\pipeline_reg_delayer_input_columns[2].incremental_step[0].del_input_register_j_n_2 ,\pipeline_reg_delayer_input_columns[2].incremental_step[0].del_input_register_j_n_3 }),
        .SR(SR),
        .\q_i_reg[3]_0 (\q_i_reg[3]_1 [3:0]));
  register_1 \pipeline_reg_delayer_input_columns[2].incremental_step[1].del_input_register_j 
       (.CLK(CLK),
        .D({\pipeline_reg_delayer_input_columns[2].incremental_step[0].del_input_register_j_n_0 ,\pipeline_reg_delayer_input_columns[2].incremental_step[0].del_input_register_j_n_1 ,\pipeline_reg_delayer_input_columns[2].incremental_step[0].del_input_register_j_n_2 ,\pipeline_reg_delayer_input_columns[2].incremental_step[0].del_input_register_j_n_3 }),
        .E(E),
        .Q(\synch_input_data[2]_2 [3:0]),
        .SR(SR));
  register_2 \pipeline_reg_delayer_output[0].incrementa_step_output[0].del_output_register_i 
       (.CLK(CLK),
        .D(y_mxu[11:8]),
        .E(E),
        .Q({\pipeline_reg_delayer_output[0].incrementa_step_output[0].del_output_register_i_n_0 ,\pipeline_reg_delayer_output[0].incrementa_step_output[0].del_output_register_i_n_1 ,\pipeline_reg_delayer_output[0].incrementa_step_output[0].del_output_register_i_n_2 ,\pipeline_reg_delayer_output[0].incrementa_step_output[0].del_output_register_i_n_3 }),
        .SCLR(SR));
  register_3 \pipeline_reg_delayer_output[0].incrementa_step_output[1].del_output_register_i 
       (.CLK(CLK),
        .D({\pipeline_reg_delayer_output[0].incrementa_step_output[0].del_output_register_i_n_0 ,\pipeline_reg_delayer_output[0].incrementa_step_output[0].del_output_register_i_n_1 ,\pipeline_reg_delayer_output[0].incrementa_step_output[0].del_output_register_i_n_2 ,\pipeline_reg_delayer_output[0].incrementa_step_output[0].del_output_register_i_n_3 }),
        .E(E),
        .SCLR(SR),
        .\q_i_reg[3]_0 (\q_i_reg[3]_0 ));
  register_4 \pipeline_reg_delayer_output[1].incrementa_step_output[0].del_output_register_i 
       (.CLK(CLK),
        .D(y_mxu[7:4]),
        .E(E),
        .SCLR(SR),
        .\q_i_reg[3]_0 (\q_i_reg[3] ));
endmodule

module register
   (Q,
    SR,
    E,
    \q_i_reg[3]_0 ,
    CLK);
  output [3:0]Q;
  input [0:0]SR;
  input [0:0]E;
  input [3:0]\q_i_reg[3]_0 ;
  input CLK;

  wire CLK;
  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;
  wire [3:0]\q_i_reg[3]_0 ;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(\q_i_reg[3]_0 [0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(\q_i_reg[3]_0 [1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(\q_i_reg[3]_0 [2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(\q_i_reg[3]_0 [3]),
        .Q(Q[3]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "register" *) 
module register_0
   (Q,
    SR,
    E,
    \q_i_reg[3]_0 ,
    CLK);
  output [3:0]Q;
  input [0:0]SR;
  input [0:0]E;
  input [3:0]\q_i_reg[3]_0 ;
  input CLK;

  wire CLK;
  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;
  wire [3:0]\q_i_reg[3]_0 ;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(\q_i_reg[3]_0 [0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(\q_i_reg[3]_0 [1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(\q_i_reg[3]_0 [2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(\q_i_reg[3]_0 [3]),
        .Q(Q[3]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "register" *) 
module register_1
   (Q,
    SR,
    E,
    D,
    CLK);
  output [3:0]Q;
  input [0:0]SR;
  input [0:0]E;
  input [3:0]D;
  input CLK;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "register" *) 
module register_10
   (SR,
    \q_i_reg[3]_0 ,
    aresetn_IBUF,
    E,
    D,
    CLK);
  output [0:0]SR;
  output [3:0]\q_i_reg[3]_0 ;
  input aresetn_IBUF;
  input [0:0]E;
  input [3:0]D;
  input CLK;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [0:0]SR;
  wire aresetn_IBUF;
  wire [3:0]\q_i_reg[3]_0 ;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(\q_i_reg[3]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(\q_i_reg[3]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(\q_i_reg[3]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(\q_i_reg[3]_0 [3]),
        .R(SR));
  LUT1 #(
    .INIT(2'h1)) 
    \rows[0].columns[0].mult_i_i_1 
       (.I0(aresetn_IBUF),
        .O(SR));
endmodule

(* ORIG_REF_NAME = "register" *) 
module register_15
   (Q,
    SR,
    E,
    D,
    CLK);
  output [3:0]Q;
  input [0:0]SR;
  input [0:0]E;
  input [3:0]D;
  input CLK;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "register" *) 
module register_16
   (\q_i_reg[3]_0 ,
    SR,
    E,
    D,
    CLK);
  output [3:0]\q_i_reg[3]_0 ;
  input [0:0]SR;
  input [0:0]E;
  input [3:0]D;
  input CLK;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [0:0]SR;
  wire [3:0]\q_i_reg[3]_0 ;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(\q_i_reg[3]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(\q_i_reg[3]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(\q_i_reg[3]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(\q_i_reg[3]_0 [3]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "register" *) 
module register_2
   (Q,
    SCLR,
    E,
    D,
    CLK);
  output [3:0]Q;
  input SCLR;
  input [0:0]E;
  input [3:0]D;
  input CLK;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire SCLR;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(SCLR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(SCLR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(SCLR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(SCLR));
endmodule

(* ORIG_REF_NAME = "register" *) 
module register_21
   (Q,
    SR,
    E,
    \q_i_reg[3]_0 ,
    CLK);
  output [3:0]Q;
  input [0:0]SR;
  input [0:0]E;
  input [3:0]\q_i_reg[3]_0 ;
  input CLK;

  wire CLK;
  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;
  wire [3:0]\q_i_reg[3]_0 ;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(\q_i_reg[3]_0 [0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(\q_i_reg[3]_0 [1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(\q_i_reg[3]_0 [2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(\q_i_reg[3]_0 [3]),
        .Q(Q[3]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "register" *) 
module register_22
   (\q_i_reg[3]_0 ,
    SR,
    E,
    D,
    CLK);
  output [3:0]\q_i_reg[3]_0 ;
  input [0:0]SR;
  input [0:0]E;
  input [3:0]D;
  input CLK;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [0:0]SR;
  wire [3:0]\q_i_reg[3]_0 ;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(\q_i_reg[3]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(\q_i_reg[3]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(\q_i_reg[3]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(\q_i_reg[3]_0 [3]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "register" *) 
module register_27
   (Q,
    SR,
    E,
    \synch_input_data[2]_2 ,
    CLK);
  output [3:0]Q;
  input [0:0]SR;
  input [0:0]E;
  input [3:0]\synch_input_data[2]_2 ;
  input CLK;

  wire CLK;
  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;
  wire [3:0]\synch_input_data[2]_2 ;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(\synch_input_data[2]_2 [0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(\synch_input_data[2]_2 [1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(\synch_input_data[2]_2 [2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(\synch_input_data[2]_2 [3]),
        .Q(Q[3]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "register" *) 
module register_28
   (\q_i_reg[3]_0 ,
    SR,
    E,
    D,
    CLK);
  output [3:0]\q_i_reg[3]_0 ;
  input [0:0]SR;
  input [0:0]E;
  input [3:0]D;
  input CLK;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [0:0]SR;
  wire [3:0]\q_i_reg[3]_0 ;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(\q_i_reg[3]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(\q_i_reg[3]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(\q_i_reg[3]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(\q_i_reg[3]_0 [3]),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "register" *) 
module register_3
   (\q_i_reg[3]_0 ,
    SCLR,
    E,
    D,
    CLK);
  output [3:0]\q_i_reg[3]_0 ;
  input SCLR;
  input [0:0]E;
  input [3:0]D;
  input CLK;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire SCLR;
  wire [3:0]\q_i_reg[3]_0 ;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(\q_i_reg[3]_0 [0]),
        .R(SCLR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(\q_i_reg[3]_0 [1]),
        .R(SCLR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(\q_i_reg[3]_0 [2]),
        .R(SCLR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(\q_i_reg[3]_0 [3]),
        .R(SCLR));
endmodule

(* ORIG_REF_NAME = "register" *) 
module register_4
   (\q_i_reg[3]_0 ,
    SCLR,
    E,
    D,
    CLK);
  output [3:0]\q_i_reg[3]_0 ;
  input SCLR;
  input [0:0]E;
  input [3:0]D;
  input CLK;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire SCLR;
  wire [3:0]\q_i_reg[3]_0 ;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(\q_i_reg[3]_0 [0]),
        .R(SCLR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(\q_i_reg[3]_0 [1]),
        .R(SCLR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(\q_i_reg[3]_0 [2]),
        .R(SCLR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(\q_i_reg[3]_0 [3]),
        .R(SCLR));
endmodule

(* ORIG_REF_NAME = "register" *) 
module register_9
   (Q,
    SR,
    E,
    D,
    CLK);
  output [3:0]Q;
  input [0:0]SR;
  input [0:0]E;
  input [3:0]D;
  input CLK;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire [0:0]SR;

  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \q_i_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(SR));
endmodule

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2" *) 
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

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
  xbip_multadd_v3_0_15 U0
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

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* ORIG_REF_NAME = "vivado_mac" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2" *) 
module vivado_mac__10
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

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
  xbip_multadd_v3_0_15__10 U0
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

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* ORIG_REF_NAME = "vivado_mac" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2" *) 
module vivado_mac__6
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

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
  xbip_multadd_v3_0_15__6 U0
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

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* ORIG_REF_NAME = "vivado_mac" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2" *) 
module vivado_mac__7
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

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
  xbip_multadd_v3_0_15__7 U0
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

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* ORIG_REF_NAME = "vivado_mac" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2" *) 
module vivado_mac__8
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

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
  xbip_multadd_v3_0_15__8 U0
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

(* CHECK_LICENSE_TYPE = "vivado_mac,xbip_multadd_v3_0_15,{}" *) (* ORIG_REF_NAME = "vivado_mac" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "xbip_multadd_v3_0_15,Vivado 2019.2" *) 
module vivado_mac__9
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [3:0]C;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [3:0]P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

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
  xbip_multadd_v3_0_15__9 U0
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

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "4" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "0" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "3" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_v12_0_16
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
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_v12_0_16_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "4" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "0" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "3" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "mult_gen_v12_0_16" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_v12_0_16__1
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
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_v12_0_16_viv__1 i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "4" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "0" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "3" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "mult_gen_v12_0_16" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_gen_v12_0_16__2
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
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "3" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_gen_v12_0_16_viv__2 i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "4" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "-1" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "4" *) 
(* C_OUT_HIGH = "3" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module xbip_multadd_v3_0_15
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
  xbip_multadd_v3_0_15_viv i_synth
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
(* ORIG_REF_NAME = "xbip_multadd_v3_0_15" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xbip_multadd_v3_0_15__10
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
  xbip_multadd_v3_0_15_viv__10 i_synth
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
(* ORIG_REF_NAME = "xbip_multadd_v3_0_15" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xbip_multadd_v3_0_15__6
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
  xbip_multadd_v3_0_15_viv__6 i_synth
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
(* ORIG_REF_NAME = "xbip_multadd_v3_0_15" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xbip_multadd_v3_0_15__7
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
  xbip_multadd_v3_0_15_viv__7 i_synth
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
(* ORIG_REF_NAME = "xbip_multadd_v3_0_15" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xbip_multadd_v3_0_15__8
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
  xbip_multadd_v3_0_15_viv__8 i_synth
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
(* ORIG_REF_NAME = "xbip_multadd_v3_0_15" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xbip_multadd_v3_0_15__9
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
  xbip_multadd_v3_0_15_viv__9 i_synth
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
HPMPLvpmoX7LOmPj78BMT9X1rCnPz6PdhVGZQ307N9haGfAdMGVirvGR3e0Glyn2ieoWqXA6qOQL
t0xn28+h0g==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Nxv/BnutRgdmHnLyK7kvDGjm7WGfFKW2mxQ6xUKF14zS4ziz5pSV0ueW4VqAzUyEPsErIAEuyV6F
m5KCqRBB197Q2NbZa7O7tdAqboX6tPAJzbB6u4U/MmNS1AQcSgtfj5srMbdBzDa5pR4V3HrI0MRj
0xhV1BWf725FYPP4av0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F5KGJgEDQsX2btdjtRUlSmNtuyodIhGXEa3/AXv1Y7qgSO8gknBfiqj5HcIaVA9b4npQpDnNcmq+
1ONAqLeLhdOm9TES+GsTAkh/lClvl89bzfqgOV33iqwQHYIHwSsWMRXT9JSUx+YWu+g6xKpT1Ycn
8BCPsq4QUJIqL6W16fheEHB/lkMgnespIWEYJJG6R6zvv2zG8GiU6cG8zHrRjdvAj8kOkhmiMvSd
YjGXJSMfjw7ojCPSUF+nb6WWhUEmoMA/6lgSVaXRm00YHSZ09k7rKTJWSXFSpTmkL2WOsQhNS0ek
jdTK2KF5K6z2YOK4zkfHgZ+fB0KJyANaLLJH/Q==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lFuQXeJ0hi7qnIKAR+37XCSOwp8bGLukonngcICceOVpL87+rxvhP5TyNJ/zXpAWDF0BaRYlGr7d
isPiUStrvUthNyOqCr4vFZyhCdY8n+Mrv3OCvLoLQSarxVXbaKbXb0tPsXJCUdXTrCt9mr5x0Nda
6DAI8FBPlFMAiqnFXnYMwlUiSlkNWUpInuNw7+1eD8kUdckEUV1PDwZ0yjpFqMokMH9oJjN6z0Yy
65D8Tqo288ZMfZQuIimjski+X6EK157XbpyuoZIuYLJ7j6oaATdintgfZpgGzVvhCZtMbx6/SJtR
efW5vLBGiGs7rPBPE2T8fosHGOvmeC9QBSj8Ww==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q8VVvHzTNgU3tZr4+8ia7ylST+kbNPWskONHDOT1dTkB7cHZIAWyzXpQZPuEgk2wJq21PoqmVlG9
t08IYzkfC8vYQ2LRf2Co3SXc7p3gF2OFMC68J9Nf9D+/PXJCJy3QO4H8oO39l6bn8c56K2ARnK0R
mMIALbCWSBDGCWGQmXWZJ+xmDGs1KgTeiSW3bZRftWJ6K8l8BhMit8BLOY2Mi3jJ0WRhN8kKd6JT
D4NU1jTZT6jEtmI7Gnj/AXG6auTqDPHsVQzf+ZzBsLTfw83CFoO70xM997L5cZXlqz8fEDmxezkr
wWxPwJbJeVkRV3tUxlo2Bs2x1uVkXQeNVMI8jg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oUeTLA0HA2uKORUHo1HidNC3lw54gxwlLUkv28qRPv1pz7AEVUbIJ7wsyu2Scju+EkC2Ivi8HbBn
jxkeqRDTAwAbAqIKnY3AdyfojN9Hb8SMLcLnpWLLCpb6E0vwA09r7uqKRZ8wYAgT9CPFvzpQ3zKt
9DTLgQ3rZtFxx2nfCug=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Fayrlym1l14Y48yZ195XboT9ZQmp/mAzUyHby3Y9qJTzDF+m6mRQ/ZbebObo8bu4VAm45JeETPx1
YI4UZNOK4IqKv0BZsAlzUfAYAmqmkmIJYbn2gWUCwXyKX5AoA4ONnlxEHxzZhqtsmEXvxwTEs25/
R7iLzeoMfmwwNHgPNQkteiR4zDlB76CYmgu6EOSUX5Nnitq1oh7qRuU8WqWN7lLfgIC6T7qNHwGD
RPze2yiP06fSG45jPrOn2fvBX9SRbUXjNtiFgmqim4anwJU46v7y3ubit/I6giZhz5PJMZfkDaFX
ag+uCMq4Q8ZEolqMBmjUjat86BdVd4Nmr0yUaA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kIpxh3qIIkWUg8aLJSPKvKhKTPFH7T8fisti5RtNaftS7xh3KDsGLYnF1lYhH2RVXgzbdaVqvtED
5QJazVo6wUFI91xgFeOR5jX+Ny5UBUX2MngsK+UZyZg5+EdtSiDtiJNtQqgjq1Rn+XQCGF3xP80n
7YvuVMbgRHCAfWrWw7ZJ7Y3raRzeIkx+koPFio7XnC+QdRJ0ItO1YtQgF4Sg1Ihr5TH8/RrNn903
kPa+anH9spo3SFCf2Ts11UXAGLdIBmOLMtEAKjjCUbtmjGSeSc0gn2q2I+xRTFcegLevlr/iuLTw
3lFndBAoW40xOiCDjWZ6Rz7J+jZhsRl3D0Bhwg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
q1GVm0Aa3+M9W3C44So+3cj+BiOzuGAZiSV1WEkr2I3A6MG+IG5qQdoXLZ5AMBUL8jYVo/107Rqa
UEruWz5PCMRoAMA8R4BXCPOfFCqnSd6KimeePyCONF46YKa9sbdkFfF92ByoLm6UKrWLWd0l+52p
6zO0glfUA26YWnzyS5u0qnOQN3c5seVn5FilvaIpKV+QJEbptjYI/eLJbjTo1ZOFA5xXho5IcrFa
UWjKGIYrcyIqFVnjY+z5vpqxkTysYZukWdEwTPF/jrbRnwXXXI2qKISxK4AG0BE5WyR/WBUnfpDH
IHI4azprrRMGR/6Ek1MsGXCpyAixms17F9KD8A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Sy4Xo41BrY/zPhRioeKXV5mhsOIrwSfah3AJswxprk/4jJcaNUUlvwKQuSOCSkASg/yTDXZXy2hp
IfAbhQK6ZgwmCDX9deAZEpkZFaUM36ujqg0JqQQZvsIbOWj6lzbbDT2tEupWfiXaryrMNQiXVIRX
qeAd2+e32tZ3JR4OT8ZjG89TEUnsRX2k7i1WcWmuFOJSCl+xoIu5M4MqAxD4A2Xlfv5CDST7wnNz
VeNh0XQ8PaaG+LGWk2oVrr4VUSYw+tZeQODvG22gzhivAwtpF/PwbD87tJ7HBms4nl9lB8Qoe6Em
y+aGukRFevzwr8Oh/2DU/xc9ZOZ+IzZn/97N2g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 98352)
`pragma protect data_block
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
9J1i2CxAbWiVg4lU7BdNZ0iOMyfaxOi25+wX
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
