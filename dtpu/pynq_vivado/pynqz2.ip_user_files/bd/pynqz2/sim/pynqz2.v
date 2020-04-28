//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
//Date        : Sat Apr 25 11:54:25 2020
//Host        : fra running 64-bit Ubuntu 18.04.4 LTS
//Command     : generate_target pynqz2.bd
//Design      : pynqz2
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module dtpu_imp_WM72SM
   (M_AXIS_outfifo_tdata,
    M_AXIS_outfifo_tkeep,
    M_AXIS_outfifo_tlast,
    M_AXIS_outfifo_tready,
    M_AXIS_outfifo_tvalid,
    S_AXIS_csr_tdata,
    S_AXIS_csr_tkeep,
    S_AXIS_csr_tlast,
    S_AXIS_csr_tready,
    S_AXIS_csr_tvalid,
    S_AXIS_infifo_tdata,
    S_AXIS_infifo_tkeep,
    S_AXIS_infifo_tlast,
    S_AXIS_infifo_tready,
    S_AXIS_infifo_tvalid,
    S_AXIS_wm_tdata,
    S_AXIS_wm_tkeep,
    S_AXIS_wm_tlast,
    S_AXIS_wm_tready,
    S_AXIS_wm_tvalid,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid,
    axi_aclk,
    clk,
    d_out_0,
    enable,
    interrupt_dtpu,
    resetn,
    s_axi_aresetn,
    state_0,
    test_mode);
  output [63:0]M_AXIS_outfifo_tdata;
  output [7:0]M_AXIS_outfifo_tkeep;
  output M_AXIS_outfifo_tlast;
  input M_AXIS_outfifo_tready;
  output M_AXIS_outfifo_tvalid;
  input [63:0]S_AXIS_csr_tdata;
  input [7:0]S_AXIS_csr_tkeep;
  input S_AXIS_csr_tlast;
  output S_AXIS_csr_tready;
  input S_AXIS_csr_tvalid;
  input [63:0]S_AXIS_infifo_tdata;
  input [7:0]S_AXIS_infifo_tkeep;
  input S_AXIS_infifo_tlast;
  output S_AXIS_infifo_tready;
  input S_AXIS_infifo_tvalid;
  input [63:0]S_AXIS_wm_tdata;
  input [7:0]S_AXIS_wm_tkeep;
  input S_AXIS_wm_tlast;
  output S_AXIS_wm_tready;
  input S_AXIS_wm_tvalid;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;
  input axi_aclk;
  input clk;
  output [3:0]d_out_0;
  input enable;
  output interrupt_dtpu;
  input [0:0]resetn;
  input s_axi_aresetn;
  output [3:0]state_0;
  input test_mode;

  wire [63:0]Conn1_TDATA;
  wire [7:0]Conn1_TKEEP;
  wire Conn1_TLAST;
  wire Conn1_TREADY;
  wire Conn1_TVALID;
  wire [31:0]Conn2_ARADDR;
  wire Conn2_ARREADY;
  wire [0:0]Conn2_ARVALID;
  wire [31:0]Conn2_AWADDR;
  wire Conn2_AWREADY;
  wire [0:0]Conn2_AWVALID;
  wire [0:0]Conn2_BREADY;
  wire [1:0]Conn2_BRESP;
  wire Conn2_BVALID;
  wire [31:0]Conn2_RDATA;
  wire [0:0]Conn2_RREADY;
  wire [1:0]Conn2_RRESP;
  wire Conn2_RVALID;
  wire [31:0]Conn2_WDATA;
  wire Conn2_WREADY;
  wire [3:0]Conn2_WSTRB;
  wire [0:0]Conn2_WVALID;
  wire [63:0]Conn3_TDATA;
  wire [7:0]Conn3_TKEEP;
  wire Conn3_TLAST;
  wire Conn3_TREADY;
  wire Conn3_TVALID;
  wire [63:0]Conn4_TDATA;
  wire [7:0]Conn4_TKEEP;
  wire Conn4_TLAST;
  wire Conn4_TREADY;
  wire Conn4_TVALID;
  wire [63:0]Conn5_TDATA;
  wire [7:0]Conn5_TKEEP;
  wire Conn5_TLAST;
  wire Conn5_TREADY;
  wire Conn5_TVALID;
  wire [0:0]Op1_0_1;
  wire aclk_0_1;
  wire axis_accelerator_ada_0_AP_CTRL_ap_continue;
  wire axis_accelerator_ada_0_AP_CTRL_ap_done;
  wire axis_accelerator_ada_0_AP_CTRL_ap_idle;
  wire axis_accelerator_ada_0_AP_CTRL_ap_ready;
  wire axis_accelerator_ada_0_AP_CTRL_ap_start;
  wire axis_accelerator_ada_0_interrupt;
  wire axis_accelerator_ada_aresetn;
  wire clk_0_1;
  wire [3:0]dtpu_core_d_out;
  wire [3:0]dtpu_core_state;
  wire [31:0]dtpu_coro_csr_mem_interface_ADDR;
  wire dtpu_coro_csr_mem_interface_CLK;
  wire [63:0]dtpu_coro_csr_mem_interface_DIN;
  wire [63:0]dtpu_coro_csr_mem_interface_DOUT;
  wire dtpu_coro_csr_mem_interface_EN;
  wire dtpu_coro_csr_mem_interface_RST;
  wire dtpu_coro_csr_mem_interface_WE;
  wire dtpu_coro_input_fifo_EMPTY_N;
  wire [63:0]dtpu_coro_input_fifo_RD_DATA;
  wire dtpu_coro_input_fifo_RD_EN;
  wire dtpu_coro_output_fifo_FULL_N;
  wire [64:0]dtpu_coro_output_fifo_WR_DATA;
  wire dtpu_coro_output_fifo_WR_EN;
  wire [31:0]dtpu_coro_weight_mem_interface_ADDR;
  wire dtpu_coro_weight_mem_interface_CLK;
  wire [63:0]dtpu_coro_weight_mem_interface_DIN;
  wire [63:0]dtpu_coro_weight_mem_interface_DOUT;
  wire dtpu_coro_weight_mem_interface_EN;
  wire dtpu_coro_weight_mem_interface_RST;
  wire dtpu_coro_weight_mem_interface_WE;
  wire enable_0_1;
  wire s_axi_aresetn_0_1;
  wire test_mode_0_1;
  wire [0:0]util_vector_logic_2_Res;

  assign Conn1_TREADY = M_AXIS_outfifo_tready;
  assign Conn2_ARADDR = S_AXI_araddr[31:0];
  assign Conn2_ARVALID = S_AXI_arvalid[0];
  assign Conn2_AWADDR = S_AXI_awaddr[31:0];
  assign Conn2_AWVALID = S_AXI_awvalid[0];
  assign Conn2_BREADY = S_AXI_bready[0];
  assign Conn2_RREADY = S_AXI_rready[0];
  assign Conn2_WDATA = S_AXI_wdata[31:0];
  assign Conn2_WSTRB = S_AXI_wstrb[3:0];
  assign Conn2_WVALID = S_AXI_wvalid[0];
  assign Conn3_TDATA = S_AXIS_csr_tdata[63:0];
  assign Conn3_TKEEP = S_AXIS_csr_tkeep[7:0];
  assign Conn3_TLAST = S_AXIS_csr_tlast;
  assign Conn3_TVALID = S_AXIS_csr_tvalid;
  assign Conn4_TDATA = S_AXIS_infifo_tdata[63:0];
  assign Conn4_TKEEP = S_AXIS_infifo_tkeep[7:0];
  assign Conn4_TLAST = S_AXIS_infifo_tlast;
  assign Conn4_TVALID = S_AXIS_infifo_tvalid;
  assign Conn5_TDATA = S_AXIS_wm_tdata[63:0];
  assign Conn5_TKEEP = S_AXIS_wm_tkeep[7:0];
  assign Conn5_TLAST = S_AXIS_wm_tlast;
  assign Conn5_TVALID = S_AXIS_wm_tvalid;
  assign M_AXIS_outfifo_tdata[63:0] = Conn1_TDATA;
  assign M_AXIS_outfifo_tkeep[7:0] = Conn1_TKEEP;
  assign M_AXIS_outfifo_tlast = Conn1_TLAST;
  assign M_AXIS_outfifo_tvalid = Conn1_TVALID;
  assign Op1_0_1 = resetn[0];
  assign S_AXIS_csr_tready = Conn3_TREADY;
  assign S_AXIS_infifo_tready = Conn4_TREADY;
  assign S_AXIS_wm_tready = Conn5_TREADY;
  assign S_AXI_arready[0] = Conn2_ARREADY;
  assign S_AXI_awready[0] = Conn2_AWREADY;
  assign S_AXI_bresp[1:0] = Conn2_BRESP;
  assign S_AXI_bvalid[0] = Conn2_BVALID;
  assign S_AXI_rdata[31:0] = Conn2_RDATA;
  assign S_AXI_rresp[1:0] = Conn2_RRESP;
  assign S_AXI_rvalid[0] = Conn2_RVALID;
  assign S_AXI_wready[0] = Conn2_WREADY;
  assign aclk_0_1 = axi_aclk;
  assign clk_0_1 = clk;
  assign d_out_0[3:0] = dtpu_core_d_out;
  assign enable_0_1 = enable;
  assign interrupt_dtpu = axis_accelerator_ada_0_interrupt;
  assign s_axi_aresetn_0_1 = s_axi_aresetn;
  assign state_0[3:0] = dtpu_core_state;
  assign test_mode_0_1 = test_mode;
  pynqz2_axis_accelerator_ada_0_0 axis_accelerator_ada
       (.aclk(aclk_0_1),
        .ap_continue(axis_accelerator_ada_0_AP_CTRL_ap_continue),
        .ap_done(axis_accelerator_ada_0_AP_CTRL_ap_done),
        .ap_fifo_iarg_2_dout(dtpu_coro_input_fifo_RD_DATA),
        .ap_fifo_iarg_2_empty_n(dtpu_coro_input_fifo_EMPTY_N),
        .ap_fifo_iarg_2_read(dtpu_coro_input_fifo_RD_EN),
        .ap_fifo_oarg_0_din(dtpu_coro_output_fifo_WR_DATA[63:0]),
        .ap_fifo_oarg_0_full_n(dtpu_coro_output_fifo_FULL_N),
        .ap_fifo_oarg_0_write(dtpu_coro_output_fifo_WR_EN),
        .ap_iarg_0_addr(dtpu_coro_csr_mem_interface_ADDR),
        .ap_iarg_0_ce(dtpu_coro_csr_mem_interface_EN),
        .ap_iarg_0_clk(dtpu_coro_csr_mem_interface_CLK),
        .ap_iarg_0_din(dtpu_coro_csr_mem_interface_DIN),
        .ap_iarg_0_dout(dtpu_coro_csr_mem_interface_DOUT),
        .ap_iarg_0_rst(dtpu_coro_csr_mem_interface_RST),
        .ap_iarg_0_we({dtpu_coro_csr_mem_interface_WE,dtpu_coro_csr_mem_interface_WE,dtpu_coro_csr_mem_interface_WE,dtpu_coro_csr_mem_interface_WE,dtpu_coro_csr_mem_interface_WE,dtpu_coro_csr_mem_interface_WE,dtpu_coro_csr_mem_interface_WE,dtpu_coro_csr_mem_interface_WE}),
        .ap_iarg_1_addr(dtpu_coro_weight_mem_interface_ADDR),
        .ap_iarg_1_ce(dtpu_coro_weight_mem_interface_EN),
        .ap_iarg_1_clk(dtpu_coro_weight_mem_interface_CLK),
        .ap_iarg_1_din(dtpu_coro_weight_mem_interface_DIN),
        .ap_iarg_1_dout(dtpu_coro_weight_mem_interface_DOUT),
        .ap_iarg_1_rst(dtpu_coro_weight_mem_interface_RST),
        .ap_iarg_1_we({dtpu_coro_weight_mem_interface_WE,dtpu_coro_weight_mem_interface_WE,dtpu_coro_weight_mem_interface_WE,dtpu_coro_weight_mem_interface_WE,dtpu_coro_weight_mem_interface_WE,dtpu_coro_weight_mem_interface_WE,dtpu_coro_weight_mem_interface_WE,dtpu_coro_weight_mem_interface_WE}),
        .ap_idle(axis_accelerator_ada_0_AP_CTRL_ap_idle),
        .ap_ready(axis_accelerator_ada_0_AP_CTRL_ap_ready),
        .ap_start(axis_accelerator_ada_0_AP_CTRL_ap_start),
        .aresetn(axis_accelerator_ada_aresetn),
        .interrupt(axis_accelerator_ada_0_interrupt),
        .m_axis_0_tdata(Conn1_TDATA),
        .m_axis_0_tkeep(Conn1_TKEEP),
        .m_axis_0_tlast(Conn1_TLAST),
        .m_axis_0_tready(Conn1_TREADY),
        .m_axis_0_tvalid(Conn1_TVALID),
        .m_axis_aclk(aclk_0_1),
        .m_axis_aresetn(s_axi_aresetn_0_1),
        .s_axi_aclk(aclk_0_1),
        .s_axi_araddr(Conn2_ARADDR[12:0]),
        .s_axi_aresetn(s_axi_aresetn_0_1),
        .s_axi_arready(Conn2_ARREADY),
        .s_axi_arvalid(Conn2_ARVALID),
        .s_axi_awaddr(Conn2_AWADDR[12:0]),
        .s_axi_awready(Conn2_AWREADY),
        .s_axi_awvalid(Conn2_AWVALID),
        .s_axi_bready(Conn2_BREADY),
        .s_axi_bresp(Conn2_BRESP),
        .s_axi_bvalid(Conn2_BVALID),
        .s_axi_rdata(Conn2_RDATA),
        .s_axi_rready(Conn2_RREADY),
        .s_axi_rresp(Conn2_RRESP),
        .s_axi_rvalid(Conn2_RVALID),
        .s_axi_wdata(Conn2_WDATA),
        .s_axi_wready(Conn2_WREADY),
        .s_axi_wstrb(Conn2_WSTRB),
        .s_axi_wvalid(Conn2_WVALID),
        .s_axis_0_tdata(Conn3_TDATA),
        .s_axis_0_tkeep(Conn3_TKEEP),
        .s_axis_0_tlast(Conn3_TLAST),
        .s_axis_0_tready(Conn3_TREADY),
        .s_axis_0_tvalid(Conn3_TVALID),
        .s_axis_1_tdata(Conn5_TDATA),
        .s_axis_1_tkeep(Conn5_TKEEP),
        .s_axis_1_tlast(Conn5_TLAST),
        .s_axis_1_tready(Conn5_TREADY),
        .s_axis_1_tvalid(Conn5_TVALID),
        .s_axis_2_tdata(Conn4_TDATA),
        .s_axis_2_tkeep(Conn4_TKEEP),
        .s_axis_2_tlast(Conn4_TLAST),
        .s_axis_2_tready(Conn4_TREADY),
        .s_axis_2_tvalid(Conn4_TVALID),
        .s_axis_aclk(aclk_0_1),
        .s_axis_aresetn(s_axi_aresetn_0_1));
  pynqz2_dtpu_core_0_0 dtpu_core
       (.aresetn(util_vector_logic_2_Res),
        .clk(clk_0_1),
        .cs_continue(axis_accelerator_ada_0_AP_CTRL_ap_continue),
        .cs_done(axis_accelerator_ada_0_AP_CTRL_ap_done),
        .cs_idle(axis_accelerator_ada_0_AP_CTRL_ap_idle),
        .cs_ready(axis_accelerator_ada_0_AP_CTRL_ap_ready),
        .cs_start(axis_accelerator_ada_0_AP_CTRL_ap_start),
        .csr_address(dtpu_coro_csr_mem_interface_ADDR),
        .csr_ce(dtpu_coro_csr_mem_interface_EN),
        .csr_clk(dtpu_coro_csr_mem_interface_CLK),
        .csr_din(dtpu_coro_csr_mem_interface_DIN),
        .csr_dout(dtpu_coro_csr_mem_interface_DOUT),
        .csr_reset(dtpu_coro_csr_mem_interface_RST),
        .csr_we(dtpu_coro_csr_mem_interface_WE),
        .d_out(dtpu_core_d_out),
        .enable(enable_0_1),
        .infifo_dout({1'b0,dtpu_coro_input_fifo_RD_DATA}),
        .infifo_is_empty(dtpu_coro_input_fifo_EMPTY_N),
        .infifo_read(dtpu_coro_input_fifo_RD_EN),
        .outfifo_din(dtpu_coro_output_fifo_WR_DATA),
        .outfifo_is_full(dtpu_coro_output_fifo_FULL_N),
        .outfifo_write(dtpu_coro_output_fifo_WR_EN),
        .state(dtpu_core_state),
        .test_mode(test_mode_0_1),
        .wm_address(dtpu_coro_weight_mem_interface_ADDR),
        .wm_ce(dtpu_coro_weight_mem_interface_EN),
        .wm_clk(dtpu_coro_weight_mem_interface_CLK),
        .wm_din(dtpu_coro_weight_mem_interface_DIN),
        .wm_dout(dtpu_coro_weight_mem_interface_DOUT),
        .wm_reset(dtpu_coro_weight_mem_interface_RST),
        .wm_we(dtpu_coro_weight_mem_interface_WE));
  pynqz2_util_vector_logic_1_2 util_vector_logic_2
       (.Op1(Op1_0_1),
        .Op2(axis_accelerator_ada_aresetn),
        .Res(util_vector_logic_2_Res));
endmodule

module m00_couplers_imp_13FRLR6
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [0:0]m00_couplers_to_m00_couplers_ARREADY;
  wire [0:0]m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [0:0]m00_couplers_to_m00_couplers_AWREADY;
  wire [0:0]m00_couplers_to_m00_couplers_AWVALID;
  wire [0:0]m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire [0:0]m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire [0:0]m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire [0:0]m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire [0:0]m00_couplers_to_m00_couplers_WREADY;
  wire [0:0]m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready[0] = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready[0] = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wvalid[0] = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready[0] = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready[0] = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid[0] = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid[0] = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready[0] = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready[0];
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid[0];
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready[0];
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid[0];
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready[0];
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid[0];
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready[0];
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid[0];
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready[0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m01_couplers_imp_8YL27N
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m01_couplers_to_m01_couplers_ARADDR;
  wire [0:0]m01_couplers_to_m01_couplers_ARREADY;
  wire [0:0]m01_couplers_to_m01_couplers_ARVALID;
  wire [31:0]m01_couplers_to_m01_couplers_AWADDR;
  wire [0:0]m01_couplers_to_m01_couplers_AWREADY;
  wire [0:0]m01_couplers_to_m01_couplers_AWVALID;
  wire [0:0]m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire [0:0]m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire [0:0]m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire [0:0]m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire [0:0]m01_couplers_to_m01_couplers_WREADY;
  wire [0:0]m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready[0] = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready[0] = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wvalid[0] = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready[0] = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready[0] = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid[0] = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid[0] = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready[0] = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready[0];
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid[0];
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready[0];
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid[0];
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready[0];
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid[0];
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready[0];
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid[0];
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready[0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m02_couplers_imp_2N0N7L
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m02_couplers_to_m02_couplers_ARADDR;
  wire [0:0]m02_couplers_to_m02_couplers_ARREADY;
  wire [0:0]m02_couplers_to_m02_couplers_ARVALID;
  wire [31:0]m02_couplers_to_m02_couplers_AWADDR;
  wire [0:0]m02_couplers_to_m02_couplers_AWREADY;
  wire [0:0]m02_couplers_to_m02_couplers_AWVALID;
  wire [0:0]m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire [0:0]m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire [0:0]m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire [0:0]m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire [0:0]m02_couplers_to_m02_couplers_WREADY;
  wire [0:0]m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready[0] = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready[0] = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wvalid[0] = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready[0] = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready[0] = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid[0] = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid[0] = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready[0] = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready[0];
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid[0];
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready[0];
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid[0];
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready[0];
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid[0];
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready[0];
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid[0];
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready[0];
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m03_couplers_imp_1ALB6Z4
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m03_couplers_to_m03_couplers_ARADDR;
  wire [0:0]m03_couplers_to_m03_couplers_ARREADY;
  wire [0:0]m03_couplers_to_m03_couplers_ARVALID;
  wire [31:0]m03_couplers_to_m03_couplers_AWADDR;
  wire [0:0]m03_couplers_to_m03_couplers_AWREADY;
  wire [0:0]m03_couplers_to_m03_couplers_AWVALID;
  wire [0:0]m03_couplers_to_m03_couplers_BREADY;
  wire [1:0]m03_couplers_to_m03_couplers_BRESP;
  wire [0:0]m03_couplers_to_m03_couplers_BVALID;
  wire [31:0]m03_couplers_to_m03_couplers_RDATA;
  wire [0:0]m03_couplers_to_m03_couplers_RREADY;
  wire [1:0]m03_couplers_to_m03_couplers_RRESP;
  wire [0:0]m03_couplers_to_m03_couplers_RVALID;
  wire [31:0]m03_couplers_to_m03_couplers_WDATA;
  wire [0:0]m03_couplers_to_m03_couplers_WREADY;
  wire [3:0]m03_couplers_to_m03_couplers_WSTRB;
  wire [0:0]m03_couplers_to_m03_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m03_couplers_to_m03_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m03_couplers_to_m03_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m03_couplers_to_m03_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m03_couplers_to_m03_couplers_AWVALID;
  assign M_AXI_bready[0] = m03_couplers_to_m03_couplers_BREADY;
  assign M_AXI_rready[0] = m03_couplers_to_m03_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m03_couplers_to_m03_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m03_couplers_to_m03_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m03_couplers_to_m03_couplers_WVALID;
  assign S_AXI_arready[0] = m03_couplers_to_m03_couplers_ARREADY;
  assign S_AXI_awready[0] = m03_couplers_to_m03_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m03_couplers_to_m03_couplers_BRESP;
  assign S_AXI_bvalid[0] = m03_couplers_to_m03_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m03_couplers_to_m03_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m03_couplers_to_m03_couplers_RRESP;
  assign S_AXI_rvalid[0] = m03_couplers_to_m03_couplers_RVALID;
  assign S_AXI_wready[0] = m03_couplers_to_m03_couplers_WREADY;
  assign m03_couplers_to_m03_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m03_couplers_to_m03_couplers_ARREADY = M_AXI_arready[0];
  assign m03_couplers_to_m03_couplers_ARVALID = S_AXI_arvalid[0];
  assign m03_couplers_to_m03_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m03_couplers_to_m03_couplers_AWREADY = M_AXI_awready[0];
  assign m03_couplers_to_m03_couplers_AWVALID = S_AXI_awvalid[0];
  assign m03_couplers_to_m03_couplers_BREADY = S_AXI_bready[0];
  assign m03_couplers_to_m03_couplers_BRESP = M_AXI_bresp[1:0];
  assign m03_couplers_to_m03_couplers_BVALID = M_AXI_bvalid[0];
  assign m03_couplers_to_m03_couplers_RDATA = M_AXI_rdata[31:0];
  assign m03_couplers_to_m03_couplers_RREADY = S_AXI_rready[0];
  assign m03_couplers_to_m03_couplers_RRESP = M_AXI_rresp[1:0];
  assign m03_couplers_to_m03_couplers_RVALID = M_AXI_rvalid[0];
  assign m03_couplers_to_m03_couplers_WDATA = S_AXI_wdata[31:0];
  assign m03_couplers_to_m03_couplers_WREADY = M_AXI_wready[0];
  assign m03_couplers_to_m03_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m03_couplers_to_m03_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m04_couplers_imp_OZP945
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m04_couplers_to_m04_couplers_ARADDR;
  wire [0:0]m04_couplers_to_m04_couplers_ARREADY;
  wire [0:0]m04_couplers_to_m04_couplers_ARVALID;
  wire [31:0]m04_couplers_to_m04_couplers_AWADDR;
  wire [0:0]m04_couplers_to_m04_couplers_AWREADY;
  wire [0:0]m04_couplers_to_m04_couplers_AWVALID;
  wire [0:0]m04_couplers_to_m04_couplers_BREADY;
  wire [1:0]m04_couplers_to_m04_couplers_BRESP;
  wire [0:0]m04_couplers_to_m04_couplers_BVALID;
  wire [31:0]m04_couplers_to_m04_couplers_RDATA;
  wire [0:0]m04_couplers_to_m04_couplers_RREADY;
  wire [1:0]m04_couplers_to_m04_couplers_RRESP;
  wire [0:0]m04_couplers_to_m04_couplers_RVALID;
  wire [31:0]m04_couplers_to_m04_couplers_WDATA;
  wire [0:0]m04_couplers_to_m04_couplers_WREADY;
  wire [3:0]m04_couplers_to_m04_couplers_WSTRB;
  wire [0:0]m04_couplers_to_m04_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m04_couplers_to_m04_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m04_couplers_to_m04_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m04_couplers_to_m04_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m04_couplers_to_m04_couplers_AWVALID;
  assign M_AXI_bready[0] = m04_couplers_to_m04_couplers_BREADY;
  assign M_AXI_rready[0] = m04_couplers_to_m04_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m04_couplers_to_m04_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m04_couplers_to_m04_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m04_couplers_to_m04_couplers_WVALID;
  assign S_AXI_arready[0] = m04_couplers_to_m04_couplers_ARREADY;
  assign S_AXI_awready[0] = m04_couplers_to_m04_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m04_couplers_to_m04_couplers_BRESP;
  assign S_AXI_bvalid[0] = m04_couplers_to_m04_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m04_couplers_to_m04_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m04_couplers_to_m04_couplers_RRESP;
  assign S_AXI_rvalid[0] = m04_couplers_to_m04_couplers_RVALID;
  assign S_AXI_wready[0] = m04_couplers_to_m04_couplers_WREADY;
  assign m04_couplers_to_m04_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m04_couplers_to_m04_couplers_ARREADY = M_AXI_arready[0];
  assign m04_couplers_to_m04_couplers_ARVALID = S_AXI_arvalid[0];
  assign m04_couplers_to_m04_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m04_couplers_to_m04_couplers_AWREADY = M_AXI_awready[0];
  assign m04_couplers_to_m04_couplers_AWVALID = S_AXI_awvalid[0];
  assign m04_couplers_to_m04_couplers_BREADY = S_AXI_bready[0];
  assign m04_couplers_to_m04_couplers_BRESP = M_AXI_bresp[1:0];
  assign m04_couplers_to_m04_couplers_BVALID = M_AXI_bvalid[0];
  assign m04_couplers_to_m04_couplers_RDATA = M_AXI_rdata[31:0];
  assign m04_couplers_to_m04_couplers_RREADY = S_AXI_rready[0];
  assign m04_couplers_to_m04_couplers_RRESP = M_AXI_rresp[1:0];
  assign m04_couplers_to_m04_couplers_RVALID = M_AXI_rvalid[0];
  assign m04_couplers_to_m04_couplers_WDATA = S_AXI_wdata[31:0];
  assign m04_couplers_to_m04_couplers_WREADY = M_AXI_wready[0];
  assign m04_couplers_to_m04_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m04_couplers_to_m04_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m05_couplers_imp_1VU1F5G
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m05_couplers_to_m05_couplers_ARADDR;
  wire m05_couplers_to_m05_couplers_ARREADY;
  wire m05_couplers_to_m05_couplers_ARVALID;
  wire [31:0]m05_couplers_to_m05_couplers_AWADDR;
  wire m05_couplers_to_m05_couplers_AWREADY;
  wire m05_couplers_to_m05_couplers_AWVALID;
  wire m05_couplers_to_m05_couplers_BREADY;
  wire [1:0]m05_couplers_to_m05_couplers_BRESP;
  wire m05_couplers_to_m05_couplers_BVALID;
  wire [31:0]m05_couplers_to_m05_couplers_RDATA;
  wire m05_couplers_to_m05_couplers_RREADY;
  wire [1:0]m05_couplers_to_m05_couplers_RRESP;
  wire m05_couplers_to_m05_couplers_RVALID;
  wire [31:0]m05_couplers_to_m05_couplers_WDATA;
  wire m05_couplers_to_m05_couplers_WREADY;
  wire [3:0]m05_couplers_to_m05_couplers_WSTRB;
  wire m05_couplers_to_m05_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m05_couplers_to_m05_couplers_ARADDR;
  assign M_AXI_arvalid = m05_couplers_to_m05_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m05_couplers_to_m05_couplers_AWADDR;
  assign M_AXI_awvalid = m05_couplers_to_m05_couplers_AWVALID;
  assign M_AXI_bready = m05_couplers_to_m05_couplers_BREADY;
  assign M_AXI_rready = m05_couplers_to_m05_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m05_couplers_to_m05_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m05_couplers_to_m05_couplers_WSTRB;
  assign M_AXI_wvalid = m05_couplers_to_m05_couplers_WVALID;
  assign S_AXI_arready = m05_couplers_to_m05_couplers_ARREADY;
  assign S_AXI_awready = m05_couplers_to_m05_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m05_couplers_to_m05_couplers_BRESP;
  assign S_AXI_bvalid = m05_couplers_to_m05_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m05_couplers_to_m05_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m05_couplers_to_m05_couplers_RRESP;
  assign S_AXI_rvalid = m05_couplers_to_m05_couplers_RVALID;
  assign S_AXI_wready = m05_couplers_to_m05_couplers_WREADY;
  assign m05_couplers_to_m05_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m05_couplers_to_m05_couplers_ARREADY = M_AXI_arready;
  assign m05_couplers_to_m05_couplers_ARVALID = S_AXI_arvalid;
  assign m05_couplers_to_m05_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m05_couplers_to_m05_couplers_AWREADY = M_AXI_awready;
  assign m05_couplers_to_m05_couplers_AWVALID = S_AXI_awvalid;
  assign m05_couplers_to_m05_couplers_BREADY = S_AXI_bready;
  assign m05_couplers_to_m05_couplers_BRESP = M_AXI_bresp[1:0];
  assign m05_couplers_to_m05_couplers_BVALID = M_AXI_bvalid;
  assign m05_couplers_to_m05_couplers_RDATA = M_AXI_rdata[31:0];
  assign m05_couplers_to_m05_couplers_RREADY = S_AXI_rready;
  assign m05_couplers_to_m05_couplers_RRESP = M_AXI_rresp[1:0];
  assign m05_couplers_to_m05_couplers_RVALID = M_AXI_rvalid;
  assign m05_couplers_to_m05_couplers_WDATA = S_AXI_wdata[31:0];
  assign m05_couplers_to_m05_couplers_WREADY = M_AXI_wready;
  assign m05_couplers_to_m05_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m05_couplers_to_m05_couplers_WVALID = S_AXI_wvalid;
endmodule

module m06_couplers_imp_1PIGYDI
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input S_AXI_wvalid;

  wire [31:0]m06_couplers_to_m06_couplers_ARADDR;
  wire m06_couplers_to_m06_couplers_ARREADY;
  wire m06_couplers_to_m06_couplers_ARVALID;
  wire [31:0]m06_couplers_to_m06_couplers_AWADDR;
  wire m06_couplers_to_m06_couplers_AWREADY;
  wire m06_couplers_to_m06_couplers_AWVALID;
  wire m06_couplers_to_m06_couplers_BREADY;
  wire [1:0]m06_couplers_to_m06_couplers_BRESP;
  wire m06_couplers_to_m06_couplers_BVALID;
  wire [31:0]m06_couplers_to_m06_couplers_RDATA;
  wire m06_couplers_to_m06_couplers_RREADY;
  wire [1:0]m06_couplers_to_m06_couplers_RRESP;
  wire m06_couplers_to_m06_couplers_RVALID;
  wire [31:0]m06_couplers_to_m06_couplers_WDATA;
  wire m06_couplers_to_m06_couplers_WREADY;
  wire m06_couplers_to_m06_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m06_couplers_to_m06_couplers_ARADDR;
  assign M_AXI_arvalid = m06_couplers_to_m06_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m06_couplers_to_m06_couplers_AWADDR;
  assign M_AXI_awvalid = m06_couplers_to_m06_couplers_AWVALID;
  assign M_AXI_bready = m06_couplers_to_m06_couplers_BREADY;
  assign M_AXI_rready = m06_couplers_to_m06_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m06_couplers_to_m06_couplers_WDATA;
  assign M_AXI_wvalid = m06_couplers_to_m06_couplers_WVALID;
  assign S_AXI_arready = m06_couplers_to_m06_couplers_ARREADY;
  assign S_AXI_awready = m06_couplers_to_m06_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m06_couplers_to_m06_couplers_BRESP;
  assign S_AXI_bvalid = m06_couplers_to_m06_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m06_couplers_to_m06_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m06_couplers_to_m06_couplers_RRESP;
  assign S_AXI_rvalid = m06_couplers_to_m06_couplers_RVALID;
  assign S_AXI_wready = m06_couplers_to_m06_couplers_WREADY;
  assign m06_couplers_to_m06_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m06_couplers_to_m06_couplers_ARREADY = M_AXI_arready;
  assign m06_couplers_to_m06_couplers_ARVALID = S_AXI_arvalid;
  assign m06_couplers_to_m06_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m06_couplers_to_m06_couplers_AWREADY = M_AXI_awready;
  assign m06_couplers_to_m06_couplers_AWVALID = S_AXI_awvalid;
  assign m06_couplers_to_m06_couplers_BREADY = S_AXI_bready;
  assign m06_couplers_to_m06_couplers_BRESP = M_AXI_bresp[1:0];
  assign m06_couplers_to_m06_couplers_BVALID = M_AXI_bvalid;
  assign m06_couplers_to_m06_couplers_RDATA = M_AXI_rdata[31:0];
  assign m06_couplers_to_m06_couplers_RREADY = S_AXI_rready;
  assign m06_couplers_to_m06_couplers_RRESP = M_AXI_rresp[1:0];
  assign m06_couplers_to_m06_couplers_RVALID = M_AXI_rvalid;
  assign m06_couplers_to_m06_couplers_WDATA = S_AXI_wdata[31:0];
  assign m06_couplers_to_m06_couplers_WREADY = M_AXI_wready;
  assign m06_couplers_to_m06_couplers_WVALID = S_AXI_wvalid;
endmodule

(* CORE_GENERATION_INFO = "pynqz2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pynqz2,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=28,numReposBlks=18,numNonXlnxBlks=0,numHierBlks=10,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=86,da_axi4_s2mm_cnt=9,da_bram_cntlr_cnt=2,da_clkrst_cnt=86,da_ps7_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "pynqz2.hwdef" *) 
module pynqz2
   (DDR_0_addr,
    DDR_0_ba,
    DDR_0_cas_n,
    DDR_0_ck_n,
    DDR_0_ck_p,
    DDR_0_cke,
    DDR_0_cs_n,
    DDR_0_dm,
    DDR_0_dq,
    DDR_0_dqs_n,
    DDR_0_dqs_p,
    DDR_0_odt,
    DDR_0_ras_n,
    DDR_0_reset_n,
    DDR_0_we_n,
    FIXED_IO_0_ddr_vrn,
    FIXED_IO_0_ddr_vrp,
    FIXED_IO_0_mio,
    FIXED_IO_0_ps_clk,
    FIXED_IO_0_ps_porb,
    FIXED_IO_0_ps_srstb,
    enable,
    precision,
    reset_n,
    state_0);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR_0, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_0_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 BA" *) inout [2:0]DDR_0_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 CAS_N" *) inout DDR_0_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 CK_N" *) inout DDR_0_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 CK_P" *) inout DDR_0_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 CKE" *) inout DDR_0_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 CS_N" *) inout DDR_0_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 DM" *) inout [3:0]DDR_0_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 DQ" *) inout [31:0]DDR_0_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 DQS_N" *) inout [3:0]DDR_0_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 DQS_P" *) inout [3:0]DDR_0_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 ODT" *) inout DDR_0_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 RAS_N" *) inout DDR_0_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 RESET_N" *) inout DDR_0_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR_0 WE_N" *) inout DDR_0_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO_0, CAN_DEBUG false" *) inout FIXED_IO_0_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 DDR_VRP" *) inout FIXED_IO_0_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 MIO" *) inout [53:0]FIXED_IO_0_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 PS_CLK" *) inout FIXED_IO_0_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 PS_PORB" *) inout FIXED_IO_0_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 PS_SRSTB" *) inout FIXED_IO_0_ps_srstb;
  input enable;
  output [3:0]precision;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_n;
  output [3:0]state_0;

  wire S00_ACLK_1;
  wire [63:0]S_AXIS_csr_1_TDATA;
  wire [7:0]S_AXIS_csr_1_TKEEP;
  wire S_AXIS_csr_1_TLAST;
  wire S_AXIS_csr_1_TREADY;
  wire S_AXIS_csr_1_TVALID;
  wire [63:0]S_AXIS_infifo_1_TDATA;
  wire [7:0]S_AXIS_infifo_1_TKEEP;
  wire S_AXIS_infifo_1_TLAST;
  wire S_AXIS_infifo_1_TREADY;
  wire S_AXIS_infifo_1_TVALID;
  wire [63:0]S_AXIS_wm_1_TDATA;
  wire [7:0]S_AXIS_wm_1_TKEEP;
  wire S_AXIS_wm_1_TLAST;
  wire S_AXIS_wm_1_TREADY;
  wire S_AXIS_wm_1_TVALID;
  wire axi_dma_0_mm2s_introut;
  wire [31:0]axi_dma_csr_mem_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_dma_csr_mem_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_dma_csr_mem_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_dma_csr_mem_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_dma_csr_mem_M_AXI_MM2S_ARPROT;
  wire axi_dma_csr_mem_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_dma_csr_mem_M_AXI_MM2S_ARSIZE;
  wire axi_dma_csr_mem_M_AXI_MM2S_ARVALID;
  wire [63:0]axi_dma_csr_mem_M_AXI_MM2S_RDATA;
  wire axi_dma_csr_mem_M_AXI_MM2S_RLAST;
  wire axi_dma_csr_mem_M_AXI_MM2S_RREADY;
  wire [1:0]axi_dma_csr_mem_M_AXI_MM2S_RRESP;
  wire axi_dma_csr_mem_M_AXI_MM2S_RVALID;
  wire axi_dma_csr_mem_mm2s_introut;
  wire [31:0]axi_dma_infifo_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_dma_infifo_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_dma_infifo_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_dma_infifo_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_dma_infifo_M_AXI_MM2S_ARPROT;
  wire axi_dma_infifo_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_dma_infifo_M_AXI_MM2S_ARSIZE;
  wire axi_dma_infifo_M_AXI_MM2S_ARVALID;
  wire [63:0]axi_dma_infifo_M_AXI_MM2S_RDATA;
  wire axi_dma_infifo_M_AXI_MM2S_RLAST;
  wire axi_dma_infifo_M_AXI_MM2S_RREADY;
  wire [1:0]axi_dma_infifo_M_AXI_MM2S_RRESP;
  wire axi_dma_infifo_M_AXI_MM2S_RVALID;
  wire axi_dma_infifo_mm2s_introut;
  wire [31:0]axi_dma_outfifo_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_dma_outfifo_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_dma_outfifo_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_dma_outfifo_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_dma_outfifo_M_AXI_S2MM_AWPROT;
  wire axi_dma_outfifo_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_dma_outfifo_M_AXI_S2MM_AWSIZE;
  wire axi_dma_outfifo_M_AXI_S2MM_AWVALID;
  wire axi_dma_outfifo_M_AXI_S2MM_BREADY;
  wire [1:0]axi_dma_outfifo_M_AXI_S2MM_BRESP;
  wire axi_dma_outfifo_M_AXI_S2MM_BVALID;
  wire [63:0]axi_dma_outfifo_M_AXI_S2MM_WDATA;
  wire axi_dma_outfifo_M_AXI_S2MM_WLAST;
  wire axi_dma_outfifo_M_AXI_S2MM_WREADY;
  wire [7:0]axi_dma_outfifo_M_AXI_S2MM_WSTRB;
  wire axi_dma_outfifo_M_AXI_S2MM_WVALID;
  wire axi_dma_outfifo_s2mm_introut;
  wire [31:0]axi_dma_weight_mem_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_dma_weight_mem_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_dma_weight_mem_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_dma_weight_mem_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_dma_weight_mem_M_AXI_MM2S_ARPROT;
  wire axi_dma_weight_mem_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_dma_weight_mem_M_AXI_MM2S_ARSIZE;
  wire axi_dma_weight_mem_M_AXI_MM2S_ARVALID;
  wire [63:0]axi_dma_weight_mem_M_AXI_MM2S_RDATA;
  wire axi_dma_weight_mem_M_AXI_MM2S_RLAST;
  wire axi_dma_weight_mem_M_AXI_MM2S_RREADY;
  wire [1:0]axi_dma_weight_mem_M_AXI_MM2S_RRESP;
  wire axi_dma_weight_mem_M_AXI_MM2S_RVALID;
  wire axi_intc_irq;
  wire [63:0]dtpu_M_AXIS_outfifo_TDATA;
  wire [7:0]dtpu_M_AXIS_outfifo_TKEEP;
  wire dtpu_M_AXIS_outfifo_TLAST;
  wire dtpu_M_AXIS_outfifo_TREADY;
  wire dtpu_M_AXIS_outfifo_TVALID;
  wire [3:0]dtpu_d_out_0;
  wire dtpu_interrupt_dtpu;
  wire [3:0]dtpu_state_0;
  wire enable_1;
  wire [14:0]ps7_DDR_ADDR;
  wire [2:0]ps7_DDR_BA;
  wire ps7_DDR_CAS_N;
  wire ps7_DDR_CKE;
  wire ps7_DDR_CK_N;
  wire ps7_DDR_CK_P;
  wire ps7_DDR_CS_N;
  wire [3:0]ps7_DDR_DM;
  wire [31:0]ps7_DDR_DQ;
  wire [3:0]ps7_DDR_DQS_N;
  wire [3:0]ps7_DDR_DQS_P;
  wire ps7_DDR_ODT;
  wire ps7_DDR_RAS_N;
  wire ps7_DDR_RESET_N;
  wire ps7_DDR_WE_N;
  wire ps7_FCLK_RESET0_N;
  wire ps7_FIXED_IO_DDR_VRN;
  wire ps7_FIXED_IO_DDR_VRP;
  wire [53:0]ps7_FIXED_IO_MIO;
  wire ps7_FIXED_IO_PS_CLK;
  wire ps7_FIXED_IO_PS_PORB;
  wire ps7_FIXED_IO_PS_SRSTB;
  wire [31:0]ps7_M_AXI_GP0_ARADDR;
  wire [1:0]ps7_M_AXI_GP0_ARBURST;
  wire [3:0]ps7_M_AXI_GP0_ARCACHE;
  wire [5:0]ps7_M_AXI_GP0_ARID;
  wire [3:0]ps7_M_AXI_GP0_ARLEN;
  wire [1:0]ps7_M_AXI_GP0_ARLOCK;
  wire [2:0]ps7_M_AXI_GP0_ARPROT;
  wire [3:0]ps7_M_AXI_GP0_ARQOS;
  wire ps7_M_AXI_GP0_ARREADY;
  wire [2:0]ps7_M_AXI_GP0_ARSIZE;
  wire ps7_M_AXI_GP0_ARVALID;
  wire [31:0]ps7_M_AXI_GP0_AWADDR;
  wire [1:0]ps7_M_AXI_GP0_AWBURST;
  wire [3:0]ps7_M_AXI_GP0_AWCACHE;
  wire [5:0]ps7_M_AXI_GP0_AWID;
  wire [3:0]ps7_M_AXI_GP0_AWLEN;
  wire [1:0]ps7_M_AXI_GP0_AWLOCK;
  wire [2:0]ps7_M_AXI_GP0_AWPROT;
  wire [3:0]ps7_M_AXI_GP0_AWQOS;
  wire ps7_M_AXI_GP0_AWREADY;
  wire [2:0]ps7_M_AXI_GP0_AWSIZE;
  wire ps7_M_AXI_GP0_AWVALID;
  wire [5:0]ps7_M_AXI_GP0_BID;
  wire ps7_M_AXI_GP0_BREADY;
  wire [1:0]ps7_M_AXI_GP0_BRESP;
  wire ps7_M_AXI_GP0_BVALID;
  wire [31:0]ps7_M_AXI_GP0_RDATA;
  wire [5:0]ps7_M_AXI_GP0_RID;
  wire ps7_M_AXI_GP0_RLAST;
  wire ps7_M_AXI_GP0_RREADY;
  wire [1:0]ps7_M_AXI_GP0_RRESP;
  wire ps7_M_AXI_GP0_RVALID;
  wire [31:0]ps7_M_AXI_GP0_WDATA;
  wire [5:0]ps7_M_AXI_GP0_WID;
  wire ps7_M_AXI_GP0_WLAST;
  wire ps7_M_AXI_GP0_WREADY;
  wire [3:0]ps7_M_AXI_GP0_WSTRB;
  wire ps7_M_AXI_GP0_WVALID;
  wire [31:0]ps7_axi_periph_M00_AXI_ARADDR;
  wire ps7_axi_periph_M00_AXI_ARREADY;
  wire [0:0]ps7_axi_periph_M00_AXI_ARVALID;
  wire [31:0]ps7_axi_periph_M00_AXI_AWADDR;
  wire ps7_axi_periph_M00_AXI_AWREADY;
  wire [0:0]ps7_axi_periph_M00_AXI_AWVALID;
  wire [0:0]ps7_axi_periph_M00_AXI_BREADY;
  wire [1:0]ps7_axi_periph_M00_AXI_BRESP;
  wire ps7_axi_periph_M00_AXI_BVALID;
  wire [31:0]ps7_axi_periph_M00_AXI_RDATA;
  wire [0:0]ps7_axi_periph_M00_AXI_RREADY;
  wire [1:0]ps7_axi_periph_M00_AXI_RRESP;
  wire ps7_axi_periph_M00_AXI_RVALID;
  wire [31:0]ps7_axi_periph_M00_AXI_WDATA;
  wire ps7_axi_periph_M00_AXI_WREADY;
  wire [0:0]ps7_axi_periph_M00_AXI_WVALID;
  wire [31:0]ps7_axi_periph_M01_AXI_ARADDR;
  wire ps7_axi_periph_M01_AXI_ARREADY;
  wire [0:0]ps7_axi_periph_M01_AXI_ARVALID;
  wire [31:0]ps7_axi_periph_M01_AXI_AWADDR;
  wire ps7_axi_periph_M01_AXI_AWREADY;
  wire [0:0]ps7_axi_periph_M01_AXI_AWVALID;
  wire [0:0]ps7_axi_periph_M01_AXI_BREADY;
  wire [1:0]ps7_axi_periph_M01_AXI_BRESP;
  wire ps7_axi_periph_M01_AXI_BVALID;
  wire [31:0]ps7_axi_periph_M01_AXI_RDATA;
  wire [0:0]ps7_axi_periph_M01_AXI_RREADY;
  wire [1:0]ps7_axi_periph_M01_AXI_RRESP;
  wire ps7_axi_periph_M01_AXI_RVALID;
  wire [31:0]ps7_axi_periph_M01_AXI_WDATA;
  wire ps7_axi_periph_M01_AXI_WREADY;
  wire [0:0]ps7_axi_periph_M01_AXI_WVALID;
  wire [31:0]ps7_axi_periph_M02_AXI_ARADDR;
  wire ps7_axi_periph_M02_AXI_ARREADY;
  wire [0:0]ps7_axi_periph_M02_AXI_ARVALID;
  wire [31:0]ps7_axi_periph_M02_AXI_AWADDR;
  wire ps7_axi_periph_M02_AXI_AWREADY;
  wire [0:0]ps7_axi_periph_M02_AXI_AWVALID;
  wire [0:0]ps7_axi_periph_M02_AXI_BREADY;
  wire [1:0]ps7_axi_periph_M02_AXI_BRESP;
  wire ps7_axi_periph_M02_AXI_BVALID;
  wire [31:0]ps7_axi_periph_M02_AXI_RDATA;
  wire [0:0]ps7_axi_periph_M02_AXI_RREADY;
  wire [1:0]ps7_axi_periph_M02_AXI_RRESP;
  wire ps7_axi_periph_M02_AXI_RVALID;
  wire [31:0]ps7_axi_periph_M02_AXI_WDATA;
  wire ps7_axi_periph_M02_AXI_WREADY;
  wire [0:0]ps7_axi_periph_M02_AXI_WVALID;
  wire [31:0]ps7_axi_periph_M03_AXI_ARADDR;
  wire ps7_axi_periph_M03_AXI_ARREADY;
  wire [0:0]ps7_axi_periph_M03_AXI_ARVALID;
  wire [31:0]ps7_axi_periph_M03_AXI_AWADDR;
  wire ps7_axi_periph_M03_AXI_AWREADY;
  wire [0:0]ps7_axi_periph_M03_AXI_AWVALID;
  wire [0:0]ps7_axi_periph_M03_AXI_BREADY;
  wire [1:0]ps7_axi_periph_M03_AXI_BRESP;
  wire ps7_axi_periph_M03_AXI_BVALID;
  wire [31:0]ps7_axi_periph_M03_AXI_RDATA;
  wire [0:0]ps7_axi_periph_M03_AXI_RREADY;
  wire [1:0]ps7_axi_periph_M03_AXI_RRESP;
  wire ps7_axi_periph_M03_AXI_RVALID;
  wire [31:0]ps7_axi_periph_M03_AXI_WDATA;
  wire ps7_axi_periph_M03_AXI_WREADY;
  wire [3:0]ps7_axi_periph_M03_AXI_WSTRB;
  wire [0:0]ps7_axi_periph_M03_AXI_WVALID;
  wire [31:0]ps7_axi_periph_M04_AXI_ARADDR;
  wire [0:0]ps7_axi_periph_M04_AXI_ARREADY;
  wire [0:0]ps7_axi_periph_M04_AXI_ARVALID;
  wire [31:0]ps7_axi_periph_M04_AXI_AWADDR;
  wire [0:0]ps7_axi_periph_M04_AXI_AWREADY;
  wire [0:0]ps7_axi_periph_M04_AXI_AWVALID;
  wire [0:0]ps7_axi_periph_M04_AXI_BREADY;
  wire [1:0]ps7_axi_periph_M04_AXI_BRESP;
  wire [0:0]ps7_axi_periph_M04_AXI_BVALID;
  wire [31:0]ps7_axi_periph_M04_AXI_RDATA;
  wire [0:0]ps7_axi_periph_M04_AXI_RREADY;
  wire [1:0]ps7_axi_periph_M04_AXI_RRESP;
  wire [0:0]ps7_axi_periph_M04_AXI_RVALID;
  wire [31:0]ps7_axi_periph_M04_AXI_WDATA;
  wire [0:0]ps7_axi_periph_M04_AXI_WREADY;
  wire [3:0]ps7_axi_periph_M04_AXI_WSTRB;
  wire [0:0]ps7_axi_periph_M04_AXI_WVALID;
  wire [31:0]ps7_axi_periph_M05_AXI_ARADDR;
  wire ps7_axi_periph_M05_AXI_ARREADY;
  wire ps7_axi_periph_M05_AXI_ARVALID;
  wire [31:0]ps7_axi_periph_M05_AXI_AWADDR;
  wire ps7_axi_periph_M05_AXI_AWREADY;
  wire ps7_axi_periph_M05_AXI_AWVALID;
  wire ps7_axi_periph_M05_AXI_BREADY;
  wire [1:0]ps7_axi_periph_M05_AXI_BRESP;
  wire ps7_axi_periph_M05_AXI_BVALID;
  wire [31:0]ps7_axi_periph_M05_AXI_RDATA;
  wire ps7_axi_periph_M05_AXI_RREADY;
  wire [1:0]ps7_axi_periph_M05_AXI_RRESP;
  wire ps7_axi_periph_M05_AXI_RVALID;
  wire [31:0]ps7_axi_periph_M05_AXI_WDATA;
  wire ps7_axi_periph_M05_AXI_WREADY;
  wire [3:0]ps7_axi_periph_M05_AXI_WSTRB;
  wire ps7_axi_periph_M05_AXI_WVALID;
  wire [31:0]ps7_axi_periph_M06_AXI_ARADDR;
  wire ps7_axi_periph_M06_AXI_ARREADY;
  wire ps7_axi_periph_M06_AXI_ARVALID;
  wire [31:0]ps7_axi_periph_M06_AXI_AWADDR;
  wire ps7_axi_periph_M06_AXI_AWREADY;
  wire ps7_axi_periph_M06_AXI_AWVALID;
  wire ps7_axi_periph_M06_AXI_BREADY;
  wire [1:0]ps7_axi_periph_M06_AXI_BRESP;
  wire ps7_axi_periph_M06_AXI_BVALID;
  wire [31:0]ps7_axi_periph_M06_AXI_RDATA;
  wire ps7_axi_periph_M06_AXI_RREADY;
  wire [1:0]ps7_axi_periph_M06_AXI_RRESP;
  wire ps7_axi_periph_M06_AXI_RVALID;
  wire [31:0]ps7_axi_periph_M06_AXI_WDATA;
  wire ps7_axi_periph_M06_AXI_WREADY;
  wire ps7_axi_periph_M06_AXI_WVALID;
  wire reset_n_1;
  wire [0:0]rst_ps7_30M_interconnect_aresetn;
  wire [0:0]rst_ps7_30M_peripheral_aresetn;
  wire [31:0]smartconnect_0_M00_AXI_ARADDR;
  wire [1:0]smartconnect_0_M00_AXI_ARBURST;
  wire [3:0]smartconnect_0_M00_AXI_ARCACHE;
  wire [3:0]smartconnect_0_M00_AXI_ARLEN;
  wire [1:0]smartconnect_0_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_0_M00_AXI_ARPROT;
  wire [3:0]smartconnect_0_M00_AXI_ARQOS;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire [2:0]smartconnect_0_M00_AXI_ARSIZE;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [31:0]smartconnect_0_M00_AXI_AWADDR;
  wire [1:0]smartconnect_0_M00_AXI_AWBURST;
  wire [3:0]smartconnect_0_M00_AXI_AWCACHE;
  wire [3:0]smartconnect_0_M00_AXI_AWLEN;
  wire [1:0]smartconnect_0_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_0_M00_AXI_AWPROT;
  wire [3:0]smartconnect_0_M00_AXI_AWQOS;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire [2:0]smartconnect_0_M00_AXI_AWSIZE;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [63:0]smartconnect_0_M00_AXI_RDATA;
  wire smartconnect_0_M00_AXI_RLAST;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [63:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WLAST;
  wire smartconnect_0_M00_AXI_WREADY;
  wire [7:0]smartconnect_0_M00_AXI_WSTRB;
  wire smartconnect_0_M00_AXI_WVALID;
  wire [0:0]util_vector_logic_0_Res;
  wire [4:0]xlconcat_0_dout;
  wire [0:0]xlconstant_0_dout;
  wire [0:0]xlconstant_1_dout;

  assign enable_1 = enable;
  assign precision[3:0] = dtpu_d_out_0;
  assign reset_n_1 = reset_n;
  assign state_0[3:0] = dtpu_state_0;
  pynqz2_axi_dma_0_3 axi_dma_csr_mem
       (.axi_resetn(rst_ps7_30M_interconnect_aresetn),
        .m_axi_mm2s_aclk(S00_ACLK_1),
        .m_axi_mm2s_araddr(axi_dma_csr_mem_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_dma_csr_mem_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_dma_csr_mem_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(axi_dma_csr_mem_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_dma_csr_mem_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_dma_csr_mem_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_dma_csr_mem_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(axi_dma_csr_mem_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_dma_csr_mem_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_dma_csr_mem_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_dma_csr_mem_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_dma_csr_mem_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_dma_csr_mem_M_AXI_MM2S_RVALID),
        .m_axis_mm2s_tdata(S_AXIS_csr_1_TDATA),
        .m_axis_mm2s_tkeep(S_AXIS_csr_1_TKEEP),
        .m_axis_mm2s_tlast(S_AXIS_csr_1_TLAST),
        .m_axis_mm2s_tready(S_AXIS_csr_1_TREADY),
        .m_axis_mm2s_tvalid(S_AXIS_csr_1_TVALID),
        .mm2s_introut(axi_dma_csr_mem_mm2s_introut),
        .s_axi_lite_aclk(S00_ACLK_1),
        .s_axi_lite_araddr(ps7_axi_periph_M00_AXI_ARADDR[9:0]),
        .s_axi_lite_arready(ps7_axi_periph_M00_AXI_ARREADY),
        .s_axi_lite_arvalid(ps7_axi_periph_M00_AXI_ARVALID),
        .s_axi_lite_awaddr(ps7_axi_periph_M00_AXI_AWADDR[9:0]),
        .s_axi_lite_awready(ps7_axi_periph_M00_AXI_AWREADY),
        .s_axi_lite_awvalid(ps7_axi_periph_M00_AXI_AWVALID),
        .s_axi_lite_bready(ps7_axi_periph_M00_AXI_BREADY),
        .s_axi_lite_bresp(ps7_axi_periph_M00_AXI_BRESP),
        .s_axi_lite_bvalid(ps7_axi_periph_M00_AXI_BVALID),
        .s_axi_lite_rdata(ps7_axi_periph_M00_AXI_RDATA),
        .s_axi_lite_rready(ps7_axi_periph_M00_AXI_RREADY),
        .s_axi_lite_rresp(ps7_axi_periph_M00_AXI_RRESP),
        .s_axi_lite_rvalid(ps7_axi_periph_M00_AXI_RVALID),
        .s_axi_lite_wdata(ps7_axi_periph_M00_AXI_WDATA),
        .s_axi_lite_wready(ps7_axi_periph_M00_AXI_WREADY),
        .s_axi_lite_wvalid(ps7_axi_periph_M00_AXI_WVALID));
  pynqz2_axi_dma_0_1 axi_dma_infifo
       (.axi_resetn(rst_ps7_30M_interconnect_aresetn),
        .m_axi_mm2s_aclk(S00_ACLK_1),
        .m_axi_mm2s_araddr(axi_dma_infifo_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_dma_infifo_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_dma_infifo_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(axi_dma_infifo_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_dma_infifo_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_dma_infifo_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_dma_infifo_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(axi_dma_infifo_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_dma_infifo_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_dma_infifo_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_dma_infifo_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_dma_infifo_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_dma_infifo_M_AXI_MM2S_RVALID),
        .m_axis_mm2s_tdata(S_AXIS_infifo_1_TDATA),
        .m_axis_mm2s_tkeep(S_AXIS_infifo_1_TKEEP),
        .m_axis_mm2s_tlast(S_AXIS_infifo_1_TLAST),
        .m_axis_mm2s_tready(S_AXIS_infifo_1_TREADY),
        .m_axis_mm2s_tvalid(S_AXIS_infifo_1_TVALID),
        .mm2s_introut(axi_dma_infifo_mm2s_introut),
        .s_axi_lite_aclk(S00_ACLK_1),
        .s_axi_lite_araddr(ps7_axi_periph_M01_AXI_ARADDR[9:0]),
        .s_axi_lite_arready(ps7_axi_periph_M01_AXI_ARREADY),
        .s_axi_lite_arvalid(ps7_axi_periph_M01_AXI_ARVALID),
        .s_axi_lite_awaddr(ps7_axi_periph_M01_AXI_AWADDR[9:0]),
        .s_axi_lite_awready(ps7_axi_periph_M01_AXI_AWREADY),
        .s_axi_lite_awvalid(ps7_axi_periph_M01_AXI_AWVALID),
        .s_axi_lite_bready(ps7_axi_periph_M01_AXI_BREADY),
        .s_axi_lite_bresp(ps7_axi_periph_M01_AXI_BRESP),
        .s_axi_lite_bvalid(ps7_axi_periph_M01_AXI_BVALID),
        .s_axi_lite_rdata(ps7_axi_periph_M01_AXI_RDATA),
        .s_axi_lite_rready(ps7_axi_periph_M01_AXI_RREADY),
        .s_axi_lite_rresp(ps7_axi_periph_M01_AXI_RRESP),
        .s_axi_lite_rvalid(ps7_axi_periph_M01_AXI_RVALID),
        .s_axi_lite_wdata(ps7_axi_periph_M01_AXI_WDATA),
        .s_axi_lite_wready(ps7_axi_periph_M01_AXI_WREADY),
        .s_axi_lite_wvalid(ps7_axi_periph_M01_AXI_WVALID));
  pynqz2_axi_dma_0_4 axi_dma_outfifo
       (.axi_resetn(rst_ps7_30M_peripheral_aresetn),
        .m_axi_s2mm_aclk(S00_ACLK_1),
        .m_axi_s2mm_awaddr(axi_dma_outfifo_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_dma_outfifo_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_dma_outfifo_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_dma_outfifo_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_dma_outfifo_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_dma_outfifo_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_dma_outfifo_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(axi_dma_outfifo_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_dma_outfifo_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_dma_outfifo_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_dma_outfifo_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_dma_outfifo_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_dma_outfifo_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_dma_outfifo_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_dma_outfifo_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_dma_outfifo_M_AXI_S2MM_WVALID),
        .s2mm_introut(axi_dma_outfifo_s2mm_introut),
        .s_axi_lite_aclk(S00_ACLK_1),
        .s_axi_lite_araddr(ps7_axi_periph_M06_AXI_ARADDR[9:0]),
        .s_axi_lite_arready(ps7_axi_periph_M06_AXI_ARREADY),
        .s_axi_lite_arvalid(ps7_axi_periph_M06_AXI_ARVALID),
        .s_axi_lite_awaddr(ps7_axi_periph_M06_AXI_AWADDR[9:0]),
        .s_axi_lite_awready(ps7_axi_periph_M06_AXI_AWREADY),
        .s_axi_lite_awvalid(ps7_axi_periph_M06_AXI_AWVALID),
        .s_axi_lite_bready(ps7_axi_periph_M06_AXI_BREADY),
        .s_axi_lite_bresp(ps7_axi_periph_M06_AXI_BRESP),
        .s_axi_lite_bvalid(ps7_axi_periph_M06_AXI_BVALID),
        .s_axi_lite_rdata(ps7_axi_periph_M06_AXI_RDATA),
        .s_axi_lite_rready(ps7_axi_periph_M06_AXI_RREADY),
        .s_axi_lite_rresp(ps7_axi_periph_M06_AXI_RRESP),
        .s_axi_lite_rvalid(ps7_axi_periph_M06_AXI_RVALID),
        .s_axi_lite_wdata(ps7_axi_periph_M06_AXI_WDATA),
        .s_axi_lite_wready(ps7_axi_periph_M06_AXI_WREADY),
        .s_axi_lite_wvalid(ps7_axi_periph_M06_AXI_WVALID),
        .s_axis_s2mm_tdata(dtpu_M_AXIS_outfifo_TDATA),
        .s_axis_s2mm_tkeep(dtpu_M_AXIS_outfifo_TKEEP),
        .s_axis_s2mm_tlast(dtpu_M_AXIS_outfifo_TLAST),
        .s_axis_s2mm_tready(dtpu_M_AXIS_outfifo_TREADY),
        .s_axis_s2mm_tvalid(dtpu_M_AXIS_outfifo_TVALID));
  pynqz2_axi_dma_0_2 axi_dma_weight_mem
       (.axi_resetn(rst_ps7_30M_interconnect_aresetn),
        .m_axi_mm2s_aclk(S00_ACLK_1),
        .m_axi_mm2s_araddr(axi_dma_weight_mem_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_dma_weight_mem_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_dma_weight_mem_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(axi_dma_weight_mem_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_dma_weight_mem_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_dma_weight_mem_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_dma_weight_mem_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(axi_dma_weight_mem_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_dma_weight_mem_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_dma_weight_mem_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_dma_weight_mem_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_dma_weight_mem_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_dma_weight_mem_M_AXI_MM2S_RVALID),
        .m_axis_mm2s_tdata(S_AXIS_wm_1_TDATA),
        .m_axis_mm2s_tkeep(S_AXIS_wm_1_TKEEP),
        .m_axis_mm2s_tlast(S_AXIS_wm_1_TLAST),
        .m_axis_mm2s_tready(S_AXIS_wm_1_TREADY),
        .m_axis_mm2s_tvalid(S_AXIS_wm_1_TVALID),
        .mm2s_introut(axi_dma_0_mm2s_introut),
        .s_axi_lite_aclk(S00_ACLK_1),
        .s_axi_lite_araddr(ps7_axi_periph_M02_AXI_ARADDR[9:0]),
        .s_axi_lite_arready(ps7_axi_periph_M02_AXI_ARREADY),
        .s_axi_lite_arvalid(ps7_axi_periph_M02_AXI_ARVALID),
        .s_axi_lite_awaddr(ps7_axi_periph_M02_AXI_AWADDR[9:0]),
        .s_axi_lite_awready(ps7_axi_periph_M02_AXI_AWREADY),
        .s_axi_lite_awvalid(ps7_axi_periph_M02_AXI_AWVALID),
        .s_axi_lite_bready(ps7_axi_periph_M02_AXI_BREADY),
        .s_axi_lite_bresp(ps7_axi_periph_M02_AXI_BRESP),
        .s_axi_lite_bvalid(ps7_axi_periph_M02_AXI_BVALID),
        .s_axi_lite_rdata(ps7_axi_periph_M02_AXI_RDATA),
        .s_axi_lite_rready(ps7_axi_periph_M02_AXI_RREADY),
        .s_axi_lite_rresp(ps7_axi_periph_M02_AXI_RRESP),
        .s_axi_lite_rvalid(ps7_axi_periph_M02_AXI_RVALID),
        .s_axi_lite_wdata(ps7_axi_periph_M02_AXI_WDATA),
        .s_axi_lite_wready(ps7_axi_periph_M02_AXI_WREADY),
        .s_axi_lite_wvalid(ps7_axi_periph_M02_AXI_WVALID));
  pynqz2_axi_intc_0_0 axi_intc
       (.intr(xlconcat_0_dout),
        .irq(axi_intc_irq),
        .s_axi_aclk(S00_ACLK_1),
        .s_axi_araddr(ps7_axi_periph_M03_AXI_ARADDR[8:0]),
        .s_axi_aresetn(rst_ps7_30M_interconnect_aresetn),
        .s_axi_arready(ps7_axi_periph_M03_AXI_ARREADY),
        .s_axi_arvalid(ps7_axi_periph_M03_AXI_ARVALID),
        .s_axi_awaddr(ps7_axi_periph_M03_AXI_AWADDR[8:0]),
        .s_axi_awready(ps7_axi_periph_M03_AXI_AWREADY),
        .s_axi_awvalid(ps7_axi_periph_M03_AXI_AWVALID),
        .s_axi_bready(ps7_axi_periph_M03_AXI_BREADY),
        .s_axi_bresp(ps7_axi_periph_M03_AXI_BRESP),
        .s_axi_bvalid(ps7_axi_periph_M03_AXI_BVALID),
        .s_axi_rdata(ps7_axi_periph_M03_AXI_RDATA),
        .s_axi_rready(ps7_axi_periph_M03_AXI_RREADY),
        .s_axi_rresp(ps7_axi_periph_M03_AXI_RRESP),
        .s_axi_rvalid(ps7_axi_periph_M03_AXI_RVALID),
        .s_axi_wdata(ps7_axi_periph_M03_AXI_WDATA),
        .s_axi_wready(ps7_axi_periph_M03_AXI_WREADY),
        .s_axi_wstrb(ps7_axi_periph_M03_AXI_WSTRB),
        .s_axi_wvalid(ps7_axi_periph_M03_AXI_WVALID));
  dtpu_imp_WM72SM dtpu
       (.M_AXIS_outfifo_tdata(dtpu_M_AXIS_outfifo_TDATA),
        .M_AXIS_outfifo_tkeep(dtpu_M_AXIS_outfifo_TKEEP),
        .M_AXIS_outfifo_tlast(dtpu_M_AXIS_outfifo_TLAST),
        .M_AXIS_outfifo_tready(dtpu_M_AXIS_outfifo_TREADY),
        .M_AXIS_outfifo_tvalid(dtpu_M_AXIS_outfifo_TVALID),
        .S_AXIS_csr_tdata(S_AXIS_csr_1_TDATA),
        .S_AXIS_csr_tkeep(S_AXIS_csr_1_TKEEP),
        .S_AXIS_csr_tlast(S_AXIS_csr_1_TLAST),
        .S_AXIS_csr_tready(S_AXIS_csr_1_TREADY),
        .S_AXIS_csr_tvalid(S_AXIS_csr_1_TVALID),
        .S_AXIS_infifo_tdata(S_AXIS_infifo_1_TDATA),
        .S_AXIS_infifo_tkeep(S_AXIS_infifo_1_TKEEP),
        .S_AXIS_infifo_tlast(S_AXIS_infifo_1_TLAST),
        .S_AXIS_infifo_tready(S_AXIS_infifo_1_TREADY),
        .S_AXIS_infifo_tvalid(S_AXIS_infifo_1_TVALID),
        .S_AXIS_wm_tdata(S_AXIS_wm_1_TDATA),
        .S_AXIS_wm_tkeep(S_AXIS_wm_1_TKEEP),
        .S_AXIS_wm_tlast(S_AXIS_wm_1_TLAST),
        .S_AXIS_wm_tready(S_AXIS_wm_1_TREADY),
        .S_AXIS_wm_tvalid(S_AXIS_wm_1_TVALID),
        .S_AXI_araddr(ps7_axi_periph_M04_AXI_ARADDR),
        .S_AXI_arready(ps7_axi_periph_M04_AXI_ARREADY),
        .S_AXI_arvalid(ps7_axi_periph_M04_AXI_ARVALID),
        .S_AXI_awaddr(ps7_axi_periph_M04_AXI_AWADDR),
        .S_AXI_awready(ps7_axi_periph_M04_AXI_AWREADY),
        .S_AXI_awvalid(ps7_axi_periph_M04_AXI_AWVALID),
        .S_AXI_bready(ps7_axi_periph_M04_AXI_BREADY),
        .S_AXI_bresp(ps7_axi_periph_M04_AXI_BRESP),
        .S_AXI_bvalid(ps7_axi_periph_M04_AXI_BVALID),
        .S_AXI_rdata(ps7_axi_periph_M04_AXI_RDATA),
        .S_AXI_rready(ps7_axi_periph_M04_AXI_RREADY),
        .S_AXI_rresp(ps7_axi_periph_M04_AXI_RRESP),
        .S_AXI_rvalid(ps7_axi_periph_M04_AXI_RVALID),
        .S_AXI_wdata(ps7_axi_periph_M04_AXI_WDATA),
        .S_AXI_wready(ps7_axi_periph_M04_AXI_WREADY),
        .S_AXI_wstrb(ps7_axi_periph_M04_AXI_WSTRB),
        .S_AXI_wvalid(ps7_axi_periph_M04_AXI_WVALID),
        .axi_aclk(S00_ACLK_1),
        .clk(S00_ACLK_1),
        .d_out_0(dtpu_d_out_0),
        .enable(enable_1),
        .interrupt_dtpu(dtpu_interrupt_dtpu),
        .resetn(reset_n_1),
        .s_axi_aresetn(rst_ps7_30M_interconnect_aresetn),
        .state_0(dtpu_state_0),
        .test_mode(xlconstant_0_dout));
  pynqz2_monitor_0 monitor
       (.s_axi_aclk(S00_ACLK_1),
        .s_axi_araddr(ps7_axi_periph_M05_AXI_ARADDR[10:0]),
        .s_axi_aresetn(rst_ps7_30M_peripheral_aresetn),
        .s_axi_arready(ps7_axi_periph_M05_AXI_ARREADY),
        .s_axi_arvalid(ps7_axi_periph_M05_AXI_ARVALID),
        .s_axi_awaddr(ps7_axi_periph_M05_AXI_AWADDR[10:0]),
        .s_axi_awready(ps7_axi_periph_M05_AXI_AWREADY),
        .s_axi_awvalid(ps7_axi_periph_M05_AXI_AWVALID),
        .s_axi_bready(ps7_axi_periph_M05_AXI_BREADY),
        .s_axi_bresp(ps7_axi_periph_M05_AXI_BRESP),
        .s_axi_bvalid(ps7_axi_periph_M05_AXI_BVALID),
        .s_axi_rdata(ps7_axi_periph_M05_AXI_RDATA),
        .s_axi_rready(ps7_axi_periph_M05_AXI_RREADY),
        .s_axi_rresp(ps7_axi_periph_M05_AXI_RRESP),
        .s_axi_rvalid(ps7_axi_periph_M05_AXI_RVALID),
        .s_axi_wdata(ps7_axi_periph_M05_AXI_WDATA),
        .s_axi_wready(ps7_axi_periph_M05_AXI_WREADY),
        .s_axi_wstrb(ps7_axi_periph_M05_AXI_WSTRB),
        .s_axi_wvalid(ps7_axi_periph_M05_AXI_WVALID),
        .vn_in(xlconstant_1_dout),
        .vp_in(xlconstant_1_dout));
  pynqz2_ps7_0 ps7
       (.DDR_Addr(DDR_0_addr[14:0]),
        .DDR_BankAddr(DDR_0_ba[2:0]),
        .DDR_CAS_n(DDR_0_cas_n),
        .DDR_CKE(DDR_0_cke),
        .DDR_CS_n(DDR_0_cs_n),
        .DDR_Clk(DDR_0_ck_p),
        .DDR_Clk_n(DDR_0_ck_n),
        .DDR_DM(DDR_0_dm[3:0]),
        .DDR_DQ(DDR_0_dq[31:0]),
        .DDR_DQS(DDR_0_dqs_p[3:0]),
        .DDR_DQS_n(DDR_0_dqs_n[3:0]),
        .DDR_DRSTB(DDR_0_reset_n),
        .DDR_ODT(DDR_0_odt),
        .DDR_RAS_n(DDR_0_ras_n),
        .DDR_VRN(FIXED_IO_0_ddr_vrn),
        .DDR_VRP(FIXED_IO_0_ddr_vrp),
        .DDR_WEB(DDR_0_we_n),
        .FCLK_CLK0(S00_ACLK_1),
        .FCLK_RESET0_N(ps7_FCLK_RESET0_N),
        .IRQ_F2P(axi_intc_irq),
        .MIO(FIXED_IO_0_mio[53:0]),
        .M_AXI_GP0_ACLK(S00_ACLK_1),
        .M_AXI_GP0_ARADDR(ps7_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(ps7_M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(ps7_M_AXI_GP0_ARCACHE),
        .M_AXI_GP0_ARID(ps7_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(ps7_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(ps7_M_AXI_GP0_ARLOCK),
        .M_AXI_GP0_ARPROT(ps7_M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(ps7_M_AXI_GP0_ARQOS),
        .M_AXI_GP0_ARREADY(ps7_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE(ps7_M_AXI_GP0_ARSIZE),
        .M_AXI_GP0_ARVALID(ps7_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(ps7_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(ps7_M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(ps7_M_AXI_GP0_AWCACHE),
        .M_AXI_GP0_AWID(ps7_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(ps7_M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(ps7_M_AXI_GP0_AWLOCK),
        .M_AXI_GP0_AWPROT(ps7_M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(ps7_M_AXI_GP0_AWQOS),
        .M_AXI_GP0_AWREADY(ps7_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE(ps7_M_AXI_GP0_AWSIZE),
        .M_AXI_GP0_AWVALID(ps7_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(ps7_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(ps7_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(ps7_M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(ps7_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(ps7_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(ps7_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(ps7_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(ps7_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(ps7_M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(ps7_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(ps7_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(ps7_M_AXI_GP0_WID),
        .M_AXI_GP0_WLAST(ps7_M_AXI_GP0_WLAST),
        .M_AXI_GP0_WREADY(ps7_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(ps7_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(ps7_M_AXI_GP0_WVALID),
        .PS_CLK(FIXED_IO_0_ps_clk),
        .PS_PORB(FIXED_IO_0_ps_porb),
        .PS_SRSTB(FIXED_IO_0_ps_srstb),
        .S_AXI_HP0_ACLK(S00_ACLK_1),
        .S_AXI_HP0_ARADDR(smartconnect_0_M00_AXI_ARADDR),
        .S_AXI_HP0_ARBURST(smartconnect_0_M00_AXI_ARBURST),
        .S_AXI_HP0_ARCACHE(smartconnect_0_M00_AXI_ARCACHE),
        .S_AXI_HP0_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARLEN(smartconnect_0_M00_AXI_ARLEN),
        .S_AXI_HP0_ARLOCK(smartconnect_0_M00_AXI_ARLOCK),
        .S_AXI_HP0_ARPROT(smartconnect_0_M00_AXI_ARPROT),
        .S_AXI_HP0_ARQOS(smartconnect_0_M00_AXI_ARQOS),
        .S_AXI_HP0_ARREADY(smartconnect_0_M00_AXI_ARREADY),
        .S_AXI_HP0_ARSIZE(smartconnect_0_M00_AXI_ARSIZE),
        .S_AXI_HP0_ARVALID(smartconnect_0_M00_AXI_ARVALID),
        .S_AXI_HP0_AWADDR(smartconnect_0_M00_AXI_AWADDR),
        .S_AXI_HP0_AWBURST(smartconnect_0_M00_AXI_AWBURST),
        .S_AXI_HP0_AWCACHE(smartconnect_0_M00_AXI_AWCACHE),
        .S_AXI_HP0_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWLEN(smartconnect_0_M00_AXI_AWLEN),
        .S_AXI_HP0_AWLOCK(smartconnect_0_M00_AXI_AWLOCK),
        .S_AXI_HP0_AWPROT(smartconnect_0_M00_AXI_AWPROT),
        .S_AXI_HP0_AWQOS(smartconnect_0_M00_AXI_AWQOS),
        .S_AXI_HP0_AWREADY(smartconnect_0_M00_AXI_AWREADY),
        .S_AXI_HP0_AWSIZE(smartconnect_0_M00_AXI_AWSIZE),
        .S_AXI_HP0_AWVALID(smartconnect_0_M00_AXI_AWVALID),
        .S_AXI_HP0_BREADY(smartconnect_0_M00_AXI_BREADY),
        .S_AXI_HP0_BRESP(smartconnect_0_M00_AXI_BRESP),
        .S_AXI_HP0_BVALID(smartconnect_0_M00_AXI_BVALID),
        .S_AXI_HP0_RDATA(smartconnect_0_M00_AXI_RDATA),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RLAST(smartconnect_0_M00_AXI_RLAST),
        .S_AXI_HP0_RREADY(smartconnect_0_M00_AXI_RREADY),
        .S_AXI_HP0_RRESP(smartconnect_0_M00_AXI_RRESP),
        .S_AXI_HP0_RVALID(smartconnect_0_M00_AXI_RVALID),
        .S_AXI_HP0_WDATA(smartconnect_0_M00_AXI_WDATA),
        .S_AXI_HP0_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_WLAST(smartconnect_0_M00_AXI_WLAST),
        .S_AXI_HP0_WREADY(smartconnect_0_M00_AXI_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB(smartconnect_0_M00_AXI_WSTRB),
        .S_AXI_HP0_WVALID(smartconnect_0_M00_AXI_WVALID),
        .USB0_VBUS_PWRFAULT(1'b0));
  pynqz2_ps7_axi_periph_5 ps7_axi_periph
       (.ACLK(S00_ACLK_1),
        .ARESETN(rst_ps7_30M_interconnect_aresetn),
        .M00_ACLK(S00_ACLK_1),
        .M00_ARESETN(rst_ps7_30M_interconnect_aresetn),
        .M00_AXI_araddr(ps7_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arready(ps7_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(ps7_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(ps7_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awready(ps7_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(ps7_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(ps7_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(ps7_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(ps7_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(ps7_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(ps7_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(ps7_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(ps7_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(ps7_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(ps7_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wvalid(ps7_axi_periph_M00_AXI_WVALID),
        .M01_ACLK(S00_ACLK_1),
        .M01_ARESETN(rst_ps7_30M_interconnect_aresetn),
        .M01_AXI_araddr(ps7_axi_periph_M01_AXI_ARADDR),
        .M01_AXI_arready(ps7_axi_periph_M01_AXI_ARREADY),
        .M01_AXI_arvalid(ps7_axi_periph_M01_AXI_ARVALID),
        .M01_AXI_awaddr(ps7_axi_periph_M01_AXI_AWADDR),
        .M01_AXI_awready(ps7_axi_periph_M01_AXI_AWREADY),
        .M01_AXI_awvalid(ps7_axi_periph_M01_AXI_AWVALID),
        .M01_AXI_bready(ps7_axi_periph_M01_AXI_BREADY),
        .M01_AXI_bresp(ps7_axi_periph_M01_AXI_BRESP),
        .M01_AXI_bvalid(ps7_axi_periph_M01_AXI_BVALID),
        .M01_AXI_rdata(ps7_axi_periph_M01_AXI_RDATA),
        .M01_AXI_rready(ps7_axi_periph_M01_AXI_RREADY),
        .M01_AXI_rresp(ps7_axi_periph_M01_AXI_RRESP),
        .M01_AXI_rvalid(ps7_axi_periph_M01_AXI_RVALID),
        .M01_AXI_wdata(ps7_axi_periph_M01_AXI_WDATA),
        .M01_AXI_wready(ps7_axi_periph_M01_AXI_WREADY),
        .M01_AXI_wvalid(ps7_axi_periph_M01_AXI_WVALID),
        .M02_ACLK(S00_ACLK_1),
        .M02_ARESETN(rst_ps7_30M_interconnect_aresetn),
        .M02_AXI_araddr(ps7_axi_periph_M02_AXI_ARADDR),
        .M02_AXI_arready(ps7_axi_periph_M02_AXI_ARREADY),
        .M02_AXI_arvalid(ps7_axi_periph_M02_AXI_ARVALID),
        .M02_AXI_awaddr(ps7_axi_periph_M02_AXI_AWADDR),
        .M02_AXI_awready(ps7_axi_periph_M02_AXI_AWREADY),
        .M02_AXI_awvalid(ps7_axi_periph_M02_AXI_AWVALID),
        .M02_AXI_bready(ps7_axi_periph_M02_AXI_BREADY),
        .M02_AXI_bresp(ps7_axi_periph_M02_AXI_BRESP),
        .M02_AXI_bvalid(ps7_axi_periph_M02_AXI_BVALID),
        .M02_AXI_rdata(ps7_axi_periph_M02_AXI_RDATA),
        .M02_AXI_rready(ps7_axi_periph_M02_AXI_RREADY),
        .M02_AXI_rresp(ps7_axi_periph_M02_AXI_RRESP),
        .M02_AXI_rvalid(ps7_axi_periph_M02_AXI_RVALID),
        .M02_AXI_wdata(ps7_axi_periph_M02_AXI_WDATA),
        .M02_AXI_wready(ps7_axi_periph_M02_AXI_WREADY),
        .M02_AXI_wvalid(ps7_axi_periph_M02_AXI_WVALID),
        .M03_ACLK(S00_ACLK_1),
        .M03_ARESETN(rst_ps7_30M_interconnect_aresetn),
        .M03_AXI_araddr(ps7_axi_periph_M03_AXI_ARADDR),
        .M03_AXI_arready(ps7_axi_periph_M03_AXI_ARREADY),
        .M03_AXI_arvalid(ps7_axi_periph_M03_AXI_ARVALID),
        .M03_AXI_awaddr(ps7_axi_periph_M03_AXI_AWADDR),
        .M03_AXI_awready(ps7_axi_periph_M03_AXI_AWREADY),
        .M03_AXI_awvalid(ps7_axi_periph_M03_AXI_AWVALID),
        .M03_AXI_bready(ps7_axi_periph_M03_AXI_BREADY),
        .M03_AXI_bresp(ps7_axi_periph_M03_AXI_BRESP),
        .M03_AXI_bvalid(ps7_axi_periph_M03_AXI_BVALID),
        .M03_AXI_rdata(ps7_axi_periph_M03_AXI_RDATA),
        .M03_AXI_rready(ps7_axi_periph_M03_AXI_RREADY),
        .M03_AXI_rresp(ps7_axi_periph_M03_AXI_RRESP),
        .M03_AXI_rvalid(ps7_axi_periph_M03_AXI_RVALID),
        .M03_AXI_wdata(ps7_axi_periph_M03_AXI_WDATA),
        .M03_AXI_wready(ps7_axi_periph_M03_AXI_WREADY),
        .M03_AXI_wstrb(ps7_axi_periph_M03_AXI_WSTRB),
        .M03_AXI_wvalid(ps7_axi_periph_M03_AXI_WVALID),
        .M04_ACLK(S00_ACLK_1),
        .M04_ARESETN(rst_ps7_30M_interconnect_aresetn),
        .M04_AXI_araddr(ps7_axi_periph_M04_AXI_ARADDR),
        .M04_AXI_arready(ps7_axi_periph_M04_AXI_ARREADY),
        .M04_AXI_arvalid(ps7_axi_periph_M04_AXI_ARVALID),
        .M04_AXI_awaddr(ps7_axi_periph_M04_AXI_AWADDR),
        .M04_AXI_awready(ps7_axi_periph_M04_AXI_AWREADY),
        .M04_AXI_awvalid(ps7_axi_periph_M04_AXI_AWVALID),
        .M04_AXI_bready(ps7_axi_periph_M04_AXI_BREADY),
        .M04_AXI_bresp(ps7_axi_periph_M04_AXI_BRESP),
        .M04_AXI_bvalid(ps7_axi_periph_M04_AXI_BVALID),
        .M04_AXI_rdata(ps7_axi_periph_M04_AXI_RDATA),
        .M04_AXI_rready(ps7_axi_periph_M04_AXI_RREADY),
        .M04_AXI_rresp(ps7_axi_periph_M04_AXI_RRESP),
        .M04_AXI_rvalid(ps7_axi_periph_M04_AXI_RVALID),
        .M04_AXI_wdata(ps7_axi_periph_M04_AXI_WDATA),
        .M04_AXI_wready(ps7_axi_periph_M04_AXI_WREADY),
        .M04_AXI_wstrb(ps7_axi_periph_M04_AXI_WSTRB),
        .M04_AXI_wvalid(ps7_axi_periph_M04_AXI_WVALID),
        .M05_ACLK(S00_ACLK_1),
        .M05_ARESETN(rst_ps7_30M_peripheral_aresetn),
        .M05_AXI_araddr(ps7_axi_periph_M05_AXI_ARADDR),
        .M05_AXI_arready(ps7_axi_periph_M05_AXI_ARREADY),
        .M05_AXI_arvalid(ps7_axi_periph_M05_AXI_ARVALID),
        .M05_AXI_awaddr(ps7_axi_periph_M05_AXI_AWADDR),
        .M05_AXI_awready(ps7_axi_periph_M05_AXI_AWREADY),
        .M05_AXI_awvalid(ps7_axi_periph_M05_AXI_AWVALID),
        .M05_AXI_bready(ps7_axi_periph_M05_AXI_BREADY),
        .M05_AXI_bresp(ps7_axi_periph_M05_AXI_BRESP),
        .M05_AXI_bvalid(ps7_axi_periph_M05_AXI_BVALID),
        .M05_AXI_rdata(ps7_axi_periph_M05_AXI_RDATA),
        .M05_AXI_rready(ps7_axi_periph_M05_AXI_RREADY),
        .M05_AXI_rresp(ps7_axi_periph_M05_AXI_RRESP),
        .M05_AXI_rvalid(ps7_axi_periph_M05_AXI_RVALID),
        .M05_AXI_wdata(ps7_axi_periph_M05_AXI_WDATA),
        .M05_AXI_wready(ps7_axi_periph_M05_AXI_WREADY),
        .M05_AXI_wstrb(ps7_axi_periph_M05_AXI_WSTRB),
        .M05_AXI_wvalid(ps7_axi_periph_M05_AXI_WVALID),
        .M06_ACLK(S00_ACLK_1),
        .M06_ARESETN(rst_ps7_30M_peripheral_aresetn),
        .M06_AXI_araddr(ps7_axi_periph_M06_AXI_ARADDR),
        .M06_AXI_arready(ps7_axi_periph_M06_AXI_ARREADY),
        .M06_AXI_arvalid(ps7_axi_periph_M06_AXI_ARVALID),
        .M06_AXI_awaddr(ps7_axi_periph_M06_AXI_AWADDR),
        .M06_AXI_awready(ps7_axi_periph_M06_AXI_AWREADY),
        .M06_AXI_awvalid(ps7_axi_periph_M06_AXI_AWVALID),
        .M06_AXI_bready(ps7_axi_periph_M06_AXI_BREADY),
        .M06_AXI_bresp(ps7_axi_periph_M06_AXI_BRESP),
        .M06_AXI_bvalid(ps7_axi_periph_M06_AXI_BVALID),
        .M06_AXI_rdata(ps7_axi_periph_M06_AXI_RDATA),
        .M06_AXI_rready(ps7_axi_periph_M06_AXI_RREADY),
        .M06_AXI_rresp(ps7_axi_periph_M06_AXI_RRESP),
        .M06_AXI_rvalid(ps7_axi_periph_M06_AXI_RVALID),
        .M06_AXI_wdata(ps7_axi_periph_M06_AXI_WDATA),
        .M06_AXI_wready(ps7_axi_periph_M06_AXI_WREADY),
        .M06_AXI_wvalid(ps7_axi_periph_M06_AXI_WVALID),
        .S00_ACLK(S00_ACLK_1),
        .S00_ARESETN(rst_ps7_30M_interconnect_aresetn),
        .S00_AXI_araddr(ps7_M_AXI_GP0_ARADDR),
        .S00_AXI_arburst(ps7_M_AXI_GP0_ARBURST),
        .S00_AXI_arcache(ps7_M_AXI_GP0_ARCACHE),
        .S00_AXI_arid(ps7_M_AXI_GP0_ARID),
        .S00_AXI_arlen(ps7_M_AXI_GP0_ARLEN),
        .S00_AXI_arlock(ps7_M_AXI_GP0_ARLOCK),
        .S00_AXI_arprot(ps7_M_AXI_GP0_ARPROT),
        .S00_AXI_arqos(ps7_M_AXI_GP0_ARQOS),
        .S00_AXI_arready(ps7_M_AXI_GP0_ARREADY),
        .S00_AXI_arsize(ps7_M_AXI_GP0_ARSIZE),
        .S00_AXI_arvalid(ps7_M_AXI_GP0_ARVALID),
        .S00_AXI_awaddr(ps7_M_AXI_GP0_AWADDR),
        .S00_AXI_awburst(ps7_M_AXI_GP0_AWBURST),
        .S00_AXI_awcache(ps7_M_AXI_GP0_AWCACHE),
        .S00_AXI_awid(ps7_M_AXI_GP0_AWID),
        .S00_AXI_awlen(ps7_M_AXI_GP0_AWLEN),
        .S00_AXI_awlock(ps7_M_AXI_GP0_AWLOCK),
        .S00_AXI_awprot(ps7_M_AXI_GP0_AWPROT),
        .S00_AXI_awqos(ps7_M_AXI_GP0_AWQOS),
        .S00_AXI_awready(ps7_M_AXI_GP0_AWREADY),
        .S00_AXI_awsize(ps7_M_AXI_GP0_AWSIZE),
        .S00_AXI_awvalid(ps7_M_AXI_GP0_AWVALID),
        .S00_AXI_bid(ps7_M_AXI_GP0_BID),
        .S00_AXI_bready(ps7_M_AXI_GP0_BREADY),
        .S00_AXI_bresp(ps7_M_AXI_GP0_BRESP),
        .S00_AXI_bvalid(ps7_M_AXI_GP0_BVALID),
        .S00_AXI_rdata(ps7_M_AXI_GP0_RDATA),
        .S00_AXI_rid(ps7_M_AXI_GP0_RID),
        .S00_AXI_rlast(ps7_M_AXI_GP0_RLAST),
        .S00_AXI_rready(ps7_M_AXI_GP0_RREADY),
        .S00_AXI_rresp(ps7_M_AXI_GP0_RRESP),
        .S00_AXI_rvalid(ps7_M_AXI_GP0_RVALID),
        .S00_AXI_wdata(ps7_M_AXI_GP0_WDATA),
        .S00_AXI_wid(ps7_M_AXI_GP0_WID),
        .S00_AXI_wlast(ps7_M_AXI_GP0_WLAST),
        .S00_AXI_wready(ps7_M_AXI_GP0_WREADY),
        .S00_AXI_wstrb(ps7_M_AXI_GP0_WSTRB),
        .S00_AXI_wvalid(ps7_M_AXI_GP0_WVALID));
  pynqz2_rst_ps7_30M_0 rst_ps7_30M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(util_vector_logic_0_Res),
        .interconnect_aresetn(rst_ps7_30M_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_ps7_30M_peripheral_aresetn),
        .slowest_sync_clk(S00_ACLK_1));
  pynqz2_smartconnect_0_0 smartconnect_0
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_0_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_0_M00_AXI_ARPROT),
        .M00_AXI_arqos(smartconnect_0_M00_AXI_ARQOS),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(smartconnect_0_M00_AXI_AWCACHE),
        .M00_AXI_awlen(smartconnect_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(smartconnect_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(smartconnect_0_M00_AXI_AWPROT),
        .M00_AXI_awqos(smartconnect_0_M00_AXI_AWQOS),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_0_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_0_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .S00_AXI_araddr(axi_dma_csr_mem_M_AXI_MM2S_ARADDR),
        .S00_AXI_arburst(axi_dma_csr_mem_M_AXI_MM2S_ARBURST),
        .S00_AXI_arcache(axi_dma_csr_mem_M_AXI_MM2S_ARCACHE),
        .S00_AXI_arlen(axi_dma_csr_mem_M_AXI_MM2S_ARLEN),
        .S00_AXI_arlock(1'b0),
        .S00_AXI_arprot(axi_dma_csr_mem_M_AXI_MM2S_ARPROT),
        .S00_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arready(axi_dma_csr_mem_M_AXI_MM2S_ARREADY),
        .S00_AXI_arsize(axi_dma_csr_mem_M_AXI_MM2S_ARSIZE),
        .S00_AXI_arvalid(axi_dma_csr_mem_M_AXI_MM2S_ARVALID),
        .S00_AXI_rdata(axi_dma_csr_mem_M_AXI_MM2S_RDATA),
        .S00_AXI_rlast(axi_dma_csr_mem_M_AXI_MM2S_RLAST),
        .S00_AXI_rready(axi_dma_csr_mem_M_AXI_MM2S_RREADY),
        .S00_AXI_rresp(axi_dma_csr_mem_M_AXI_MM2S_RRESP),
        .S00_AXI_rvalid(axi_dma_csr_mem_M_AXI_MM2S_RVALID),
        .S01_AXI_araddr(axi_dma_infifo_M_AXI_MM2S_ARADDR),
        .S01_AXI_arburst(axi_dma_infifo_M_AXI_MM2S_ARBURST),
        .S01_AXI_arcache(axi_dma_infifo_M_AXI_MM2S_ARCACHE),
        .S01_AXI_arlen(axi_dma_infifo_M_AXI_MM2S_ARLEN),
        .S01_AXI_arlock(1'b0),
        .S01_AXI_arprot(axi_dma_infifo_M_AXI_MM2S_ARPROT),
        .S01_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_arready(axi_dma_infifo_M_AXI_MM2S_ARREADY),
        .S01_AXI_arsize(axi_dma_infifo_M_AXI_MM2S_ARSIZE),
        .S01_AXI_arvalid(axi_dma_infifo_M_AXI_MM2S_ARVALID),
        .S01_AXI_rdata(axi_dma_infifo_M_AXI_MM2S_RDATA),
        .S01_AXI_rlast(axi_dma_infifo_M_AXI_MM2S_RLAST),
        .S01_AXI_rready(axi_dma_infifo_M_AXI_MM2S_RREADY),
        .S01_AXI_rresp(axi_dma_infifo_M_AXI_MM2S_RRESP),
        .S01_AXI_rvalid(axi_dma_infifo_M_AXI_MM2S_RVALID),
        .S02_AXI_awaddr(axi_dma_outfifo_M_AXI_S2MM_AWADDR),
        .S02_AXI_awburst(axi_dma_outfifo_M_AXI_S2MM_AWBURST),
        .S02_AXI_awcache(axi_dma_outfifo_M_AXI_S2MM_AWCACHE),
        .S02_AXI_awlen(axi_dma_outfifo_M_AXI_S2MM_AWLEN),
        .S02_AXI_awlock(1'b0),
        .S02_AXI_awprot(axi_dma_outfifo_M_AXI_S2MM_AWPROT),
        .S02_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_awready(axi_dma_outfifo_M_AXI_S2MM_AWREADY),
        .S02_AXI_awsize(axi_dma_outfifo_M_AXI_S2MM_AWSIZE),
        .S02_AXI_awvalid(axi_dma_outfifo_M_AXI_S2MM_AWVALID),
        .S02_AXI_bready(axi_dma_outfifo_M_AXI_S2MM_BREADY),
        .S02_AXI_bresp(axi_dma_outfifo_M_AXI_S2MM_BRESP),
        .S02_AXI_bvalid(axi_dma_outfifo_M_AXI_S2MM_BVALID),
        .S02_AXI_wdata(axi_dma_outfifo_M_AXI_S2MM_WDATA),
        .S02_AXI_wlast(axi_dma_outfifo_M_AXI_S2MM_WLAST),
        .S02_AXI_wready(axi_dma_outfifo_M_AXI_S2MM_WREADY),
        .S02_AXI_wstrb(axi_dma_outfifo_M_AXI_S2MM_WSTRB),
        .S02_AXI_wvalid(axi_dma_outfifo_M_AXI_S2MM_WVALID),
        .S03_AXI_araddr(axi_dma_weight_mem_M_AXI_MM2S_ARADDR),
        .S03_AXI_arburst(axi_dma_weight_mem_M_AXI_MM2S_ARBURST),
        .S03_AXI_arcache(axi_dma_weight_mem_M_AXI_MM2S_ARCACHE),
        .S03_AXI_arlen(axi_dma_weight_mem_M_AXI_MM2S_ARLEN),
        .S03_AXI_arlock(1'b0),
        .S03_AXI_arprot(axi_dma_weight_mem_M_AXI_MM2S_ARPROT),
        .S03_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S03_AXI_arready(axi_dma_weight_mem_M_AXI_MM2S_ARREADY),
        .S03_AXI_arsize(axi_dma_weight_mem_M_AXI_MM2S_ARSIZE),
        .S03_AXI_arvalid(axi_dma_weight_mem_M_AXI_MM2S_ARVALID),
        .S03_AXI_rdata(axi_dma_weight_mem_M_AXI_MM2S_RDATA),
        .S03_AXI_rlast(axi_dma_weight_mem_M_AXI_MM2S_RLAST),
        .S03_AXI_rready(axi_dma_weight_mem_M_AXI_MM2S_RREADY),
        .S03_AXI_rresp(axi_dma_weight_mem_M_AXI_MM2S_RRESP),
        .S03_AXI_rvalid(axi_dma_weight_mem_M_AXI_MM2S_RVALID),
        .aclk(S00_ACLK_1),
        .aresetn(rst_ps7_30M_interconnect_aresetn));
  pynqz2_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(ps7_FCLK_RESET0_N),
        .Op2(reset_n_1),
        .Res(util_vector_logic_0_Res));
  pynqz2_xlconcat_0_1 xlconcat_0
       (.In0(axi_dma_infifo_mm2s_introut),
        .In1(axi_dma_outfifo_s2mm_introut),
        .In2(dtpu_interrupt_dtpu),
        .In3(axi_dma_0_mm2s_introut),
        .In4(axi_dma_csr_mem_mm2s_introut),
        .dout(xlconcat_0_dout));
  pynqz2_xlconstant_0_1 xlconstant_0
       (.dout(xlconstant_0_dout));
  pynqz2_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
endmodule

module pynqz2_ps7_axi_periph_5
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_ACLK,
    M05_ARESETN,
    M05_AXI_araddr,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    M06_ACLK,
    M06_ARESETN,
    M06_AXI_araddr,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input [0:0]M00_AXI_arready;
  output [0:0]M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input [0:0]M00_AXI_awready;
  output [0:0]M00_AXI_awvalid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input [0:0]M00_AXI_wready;
  output [0:0]M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  input [0:0]M01_AXI_arready;
  output [0:0]M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input [0:0]M01_AXI_awready;
  output [0:0]M01_AXI_awvalid;
  output [0:0]M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input [0:0]M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output [0:0]M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input [0:0]M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input [0:0]M01_AXI_wready;
  output [0:0]M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [31:0]M02_AXI_araddr;
  input [0:0]M02_AXI_arready;
  output [0:0]M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  input [0:0]M02_AXI_awready;
  output [0:0]M02_AXI_awvalid;
  output [0:0]M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input [0:0]M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output [0:0]M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input [0:0]M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input [0:0]M02_AXI_wready;
  output [0:0]M02_AXI_wvalid;
  input M03_ACLK;
  input M03_ARESETN;
  output [31:0]M03_AXI_araddr;
  input [0:0]M03_AXI_arready;
  output [0:0]M03_AXI_arvalid;
  output [31:0]M03_AXI_awaddr;
  input [0:0]M03_AXI_awready;
  output [0:0]M03_AXI_awvalid;
  output [0:0]M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input [0:0]M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output [0:0]M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input [0:0]M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input [0:0]M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output [0:0]M03_AXI_wvalid;
  input M04_ACLK;
  input M04_ARESETN;
  output [31:0]M04_AXI_araddr;
  input [0:0]M04_AXI_arready;
  output [0:0]M04_AXI_arvalid;
  output [31:0]M04_AXI_awaddr;
  input [0:0]M04_AXI_awready;
  output [0:0]M04_AXI_awvalid;
  output [0:0]M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input [0:0]M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output [0:0]M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input [0:0]M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input [0:0]M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output [0:0]M04_AXI_wvalid;
  input M05_ACLK;
  input M05_ARESETN;
  output [31:0]M05_AXI_araddr;
  input M05_AXI_arready;
  output M05_AXI_arvalid;
  output [31:0]M05_AXI_awaddr;
  input M05_AXI_awready;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output M05_AXI_wvalid;
  input M06_ACLK;
  input M06_ARESETN;
  output [31:0]M06_AXI_araddr;
  input M06_AXI_arready;
  output M06_AXI_arvalid;
  output [31:0]M06_AXI_awaddr;
  input M06_AXI_awready;
  output M06_AXI_awvalid;
  output M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  output M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  input M06_AXI_wready;
  output M06_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [5:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [5:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [5:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [5:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [5:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire M01_ACLK_1;
  wire M01_ARESETN_1;
  wire M02_ACLK_1;
  wire M02_ARESETN_1;
  wire M03_ACLK_1;
  wire M03_ARESETN_1;
  wire M04_ACLK_1;
  wire M04_ARESETN_1;
  wire M05_ACLK_1;
  wire M05_ARESETN_1;
  wire M06_ACLK_1;
  wire M06_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire [31:0]m00_couplers_to_ps7_axi_periph_ARADDR;
  wire [0:0]m00_couplers_to_ps7_axi_periph_ARREADY;
  wire [0:0]m00_couplers_to_ps7_axi_periph_ARVALID;
  wire [31:0]m00_couplers_to_ps7_axi_periph_AWADDR;
  wire [0:0]m00_couplers_to_ps7_axi_periph_AWREADY;
  wire [0:0]m00_couplers_to_ps7_axi_periph_AWVALID;
  wire [0:0]m00_couplers_to_ps7_axi_periph_BREADY;
  wire [1:0]m00_couplers_to_ps7_axi_periph_BRESP;
  wire [0:0]m00_couplers_to_ps7_axi_periph_BVALID;
  wire [31:0]m00_couplers_to_ps7_axi_periph_RDATA;
  wire [0:0]m00_couplers_to_ps7_axi_periph_RREADY;
  wire [1:0]m00_couplers_to_ps7_axi_periph_RRESP;
  wire [0:0]m00_couplers_to_ps7_axi_periph_RVALID;
  wire [31:0]m00_couplers_to_ps7_axi_periph_WDATA;
  wire [0:0]m00_couplers_to_ps7_axi_periph_WREADY;
  wire [0:0]m00_couplers_to_ps7_axi_periph_WVALID;
  wire [31:0]m01_couplers_to_ps7_axi_periph_ARADDR;
  wire [0:0]m01_couplers_to_ps7_axi_periph_ARREADY;
  wire [0:0]m01_couplers_to_ps7_axi_periph_ARVALID;
  wire [31:0]m01_couplers_to_ps7_axi_periph_AWADDR;
  wire [0:0]m01_couplers_to_ps7_axi_periph_AWREADY;
  wire [0:0]m01_couplers_to_ps7_axi_periph_AWVALID;
  wire [0:0]m01_couplers_to_ps7_axi_periph_BREADY;
  wire [1:0]m01_couplers_to_ps7_axi_periph_BRESP;
  wire [0:0]m01_couplers_to_ps7_axi_periph_BVALID;
  wire [31:0]m01_couplers_to_ps7_axi_periph_RDATA;
  wire [0:0]m01_couplers_to_ps7_axi_periph_RREADY;
  wire [1:0]m01_couplers_to_ps7_axi_periph_RRESP;
  wire [0:0]m01_couplers_to_ps7_axi_periph_RVALID;
  wire [31:0]m01_couplers_to_ps7_axi_periph_WDATA;
  wire [0:0]m01_couplers_to_ps7_axi_periph_WREADY;
  wire [0:0]m01_couplers_to_ps7_axi_periph_WVALID;
  wire [31:0]m02_couplers_to_ps7_axi_periph_ARADDR;
  wire [0:0]m02_couplers_to_ps7_axi_periph_ARREADY;
  wire [0:0]m02_couplers_to_ps7_axi_periph_ARVALID;
  wire [31:0]m02_couplers_to_ps7_axi_periph_AWADDR;
  wire [0:0]m02_couplers_to_ps7_axi_periph_AWREADY;
  wire [0:0]m02_couplers_to_ps7_axi_periph_AWVALID;
  wire [0:0]m02_couplers_to_ps7_axi_periph_BREADY;
  wire [1:0]m02_couplers_to_ps7_axi_periph_BRESP;
  wire [0:0]m02_couplers_to_ps7_axi_periph_BVALID;
  wire [31:0]m02_couplers_to_ps7_axi_periph_RDATA;
  wire [0:0]m02_couplers_to_ps7_axi_periph_RREADY;
  wire [1:0]m02_couplers_to_ps7_axi_periph_RRESP;
  wire [0:0]m02_couplers_to_ps7_axi_periph_RVALID;
  wire [31:0]m02_couplers_to_ps7_axi_periph_WDATA;
  wire [0:0]m02_couplers_to_ps7_axi_periph_WREADY;
  wire [0:0]m02_couplers_to_ps7_axi_periph_WVALID;
  wire [31:0]m03_couplers_to_ps7_axi_periph_ARADDR;
  wire [0:0]m03_couplers_to_ps7_axi_periph_ARREADY;
  wire [0:0]m03_couplers_to_ps7_axi_periph_ARVALID;
  wire [31:0]m03_couplers_to_ps7_axi_periph_AWADDR;
  wire [0:0]m03_couplers_to_ps7_axi_periph_AWREADY;
  wire [0:0]m03_couplers_to_ps7_axi_periph_AWVALID;
  wire [0:0]m03_couplers_to_ps7_axi_periph_BREADY;
  wire [1:0]m03_couplers_to_ps7_axi_periph_BRESP;
  wire [0:0]m03_couplers_to_ps7_axi_periph_BVALID;
  wire [31:0]m03_couplers_to_ps7_axi_periph_RDATA;
  wire [0:0]m03_couplers_to_ps7_axi_periph_RREADY;
  wire [1:0]m03_couplers_to_ps7_axi_periph_RRESP;
  wire [0:0]m03_couplers_to_ps7_axi_periph_RVALID;
  wire [31:0]m03_couplers_to_ps7_axi_periph_WDATA;
  wire [0:0]m03_couplers_to_ps7_axi_periph_WREADY;
  wire [3:0]m03_couplers_to_ps7_axi_periph_WSTRB;
  wire [0:0]m03_couplers_to_ps7_axi_periph_WVALID;
  wire [31:0]m04_couplers_to_ps7_axi_periph_ARADDR;
  wire [0:0]m04_couplers_to_ps7_axi_periph_ARREADY;
  wire [0:0]m04_couplers_to_ps7_axi_periph_ARVALID;
  wire [31:0]m04_couplers_to_ps7_axi_periph_AWADDR;
  wire [0:0]m04_couplers_to_ps7_axi_periph_AWREADY;
  wire [0:0]m04_couplers_to_ps7_axi_periph_AWVALID;
  wire [0:0]m04_couplers_to_ps7_axi_periph_BREADY;
  wire [1:0]m04_couplers_to_ps7_axi_periph_BRESP;
  wire [0:0]m04_couplers_to_ps7_axi_periph_BVALID;
  wire [31:0]m04_couplers_to_ps7_axi_periph_RDATA;
  wire [0:0]m04_couplers_to_ps7_axi_periph_RREADY;
  wire [1:0]m04_couplers_to_ps7_axi_periph_RRESP;
  wire [0:0]m04_couplers_to_ps7_axi_periph_RVALID;
  wire [31:0]m04_couplers_to_ps7_axi_periph_WDATA;
  wire [0:0]m04_couplers_to_ps7_axi_periph_WREADY;
  wire [3:0]m04_couplers_to_ps7_axi_periph_WSTRB;
  wire [0:0]m04_couplers_to_ps7_axi_periph_WVALID;
  wire [31:0]m05_couplers_to_ps7_axi_periph_ARADDR;
  wire m05_couplers_to_ps7_axi_periph_ARREADY;
  wire m05_couplers_to_ps7_axi_periph_ARVALID;
  wire [31:0]m05_couplers_to_ps7_axi_periph_AWADDR;
  wire m05_couplers_to_ps7_axi_periph_AWREADY;
  wire m05_couplers_to_ps7_axi_periph_AWVALID;
  wire m05_couplers_to_ps7_axi_periph_BREADY;
  wire [1:0]m05_couplers_to_ps7_axi_periph_BRESP;
  wire m05_couplers_to_ps7_axi_periph_BVALID;
  wire [31:0]m05_couplers_to_ps7_axi_periph_RDATA;
  wire m05_couplers_to_ps7_axi_periph_RREADY;
  wire [1:0]m05_couplers_to_ps7_axi_periph_RRESP;
  wire m05_couplers_to_ps7_axi_periph_RVALID;
  wire [31:0]m05_couplers_to_ps7_axi_periph_WDATA;
  wire m05_couplers_to_ps7_axi_periph_WREADY;
  wire [3:0]m05_couplers_to_ps7_axi_periph_WSTRB;
  wire m05_couplers_to_ps7_axi_periph_WVALID;
  wire [31:0]m06_couplers_to_ps7_axi_periph_ARADDR;
  wire m06_couplers_to_ps7_axi_periph_ARREADY;
  wire m06_couplers_to_ps7_axi_periph_ARVALID;
  wire [31:0]m06_couplers_to_ps7_axi_periph_AWADDR;
  wire m06_couplers_to_ps7_axi_periph_AWREADY;
  wire m06_couplers_to_ps7_axi_periph_AWVALID;
  wire m06_couplers_to_ps7_axi_periph_BREADY;
  wire [1:0]m06_couplers_to_ps7_axi_periph_BRESP;
  wire m06_couplers_to_ps7_axi_periph_BVALID;
  wire [31:0]m06_couplers_to_ps7_axi_periph_RDATA;
  wire m06_couplers_to_ps7_axi_periph_RREADY;
  wire [1:0]m06_couplers_to_ps7_axi_periph_RRESP;
  wire m06_couplers_to_ps7_axi_periph_RVALID;
  wire [31:0]m06_couplers_to_ps7_axi_periph_WDATA;
  wire m06_couplers_to_ps7_axi_periph_WREADY;
  wire m06_couplers_to_ps7_axi_periph_WVALID;
  wire ps7_axi_periph_ACLK_net;
  wire ps7_axi_periph_ARESETN_net;
  wire [31:0]ps7_axi_periph_to_s00_couplers_ARADDR;
  wire [1:0]ps7_axi_periph_to_s00_couplers_ARBURST;
  wire [3:0]ps7_axi_periph_to_s00_couplers_ARCACHE;
  wire [5:0]ps7_axi_periph_to_s00_couplers_ARID;
  wire [3:0]ps7_axi_periph_to_s00_couplers_ARLEN;
  wire [1:0]ps7_axi_periph_to_s00_couplers_ARLOCK;
  wire [2:0]ps7_axi_periph_to_s00_couplers_ARPROT;
  wire [3:0]ps7_axi_periph_to_s00_couplers_ARQOS;
  wire ps7_axi_periph_to_s00_couplers_ARREADY;
  wire [2:0]ps7_axi_periph_to_s00_couplers_ARSIZE;
  wire ps7_axi_periph_to_s00_couplers_ARVALID;
  wire [31:0]ps7_axi_periph_to_s00_couplers_AWADDR;
  wire [1:0]ps7_axi_periph_to_s00_couplers_AWBURST;
  wire [3:0]ps7_axi_periph_to_s00_couplers_AWCACHE;
  wire [5:0]ps7_axi_periph_to_s00_couplers_AWID;
  wire [3:0]ps7_axi_periph_to_s00_couplers_AWLEN;
  wire [1:0]ps7_axi_periph_to_s00_couplers_AWLOCK;
  wire [2:0]ps7_axi_periph_to_s00_couplers_AWPROT;
  wire [3:0]ps7_axi_periph_to_s00_couplers_AWQOS;
  wire ps7_axi_periph_to_s00_couplers_AWREADY;
  wire [2:0]ps7_axi_periph_to_s00_couplers_AWSIZE;
  wire ps7_axi_periph_to_s00_couplers_AWVALID;
  wire [5:0]ps7_axi_periph_to_s00_couplers_BID;
  wire ps7_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]ps7_axi_periph_to_s00_couplers_BRESP;
  wire ps7_axi_periph_to_s00_couplers_BVALID;
  wire [31:0]ps7_axi_periph_to_s00_couplers_RDATA;
  wire [5:0]ps7_axi_periph_to_s00_couplers_RID;
  wire ps7_axi_periph_to_s00_couplers_RLAST;
  wire ps7_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]ps7_axi_periph_to_s00_couplers_RRESP;
  wire ps7_axi_periph_to_s00_couplers_RVALID;
  wire [31:0]ps7_axi_periph_to_s00_couplers_WDATA;
  wire [5:0]ps7_axi_periph_to_s00_couplers_WID;
  wire ps7_axi_periph_to_s00_couplers_WLAST;
  wire ps7_axi_periph_to_s00_couplers_WREADY;
  wire [3:0]ps7_axi_periph_to_s00_couplers_WSTRB;
  wire ps7_axi_periph_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [0:0]xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [0:0]xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire [0:0]xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire [0:0]xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WREADY;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [0:0]xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [0:0]xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire [0:0]xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire [0:0]xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [0:0]xbar_to_m01_couplers_WREADY;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire [0:0]xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [0:0]xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire [0:0]xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire [0:0]xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire [0:0]xbar_to_m02_couplers_WREADY;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [127:96]xbar_to_m03_couplers_ARADDR;
  wire [0:0]xbar_to_m03_couplers_ARREADY;
  wire [3:3]xbar_to_m03_couplers_ARVALID;
  wire [127:96]xbar_to_m03_couplers_AWADDR;
  wire [0:0]xbar_to_m03_couplers_AWREADY;
  wire [3:3]xbar_to_m03_couplers_AWVALID;
  wire [3:3]xbar_to_m03_couplers_BREADY;
  wire [1:0]xbar_to_m03_couplers_BRESP;
  wire [0:0]xbar_to_m03_couplers_BVALID;
  wire [31:0]xbar_to_m03_couplers_RDATA;
  wire [3:3]xbar_to_m03_couplers_RREADY;
  wire [1:0]xbar_to_m03_couplers_RRESP;
  wire [0:0]xbar_to_m03_couplers_RVALID;
  wire [127:96]xbar_to_m03_couplers_WDATA;
  wire [0:0]xbar_to_m03_couplers_WREADY;
  wire [15:12]xbar_to_m03_couplers_WSTRB;
  wire [3:3]xbar_to_m03_couplers_WVALID;
  wire [159:128]xbar_to_m04_couplers_ARADDR;
  wire [0:0]xbar_to_m04_couplers_ARREADY;
  wire [4:4]xbar_to_m04_couplers_ARVALID;
  wire [159:128]xbar_to_m04_couplers_AWADDR;
  wire [0:0]xbar_to_m04_couplers_AWREADY;
  wire [4:4]xbar_to_m04_couplers_AWVALID;
  wire [4:4]xbar_to_m04_couplers_BREADY;
  wire [1:0]xbar_to_m04_couplers_BRESP;
  wire [0:0]xbar_to_m04_couplers_BVALID;
  wire [31:0]xbar_to_m04_couplers_RDATA;
  wire [4:4]xbar_to_m04_couplers_RREADY;
  wire [1:0]xbar_to_m04_couplers_RRESP;
  wire [0:0]xbar_to_m04_couplers_RVALID;
  wire [159:128]xbar_to_m04_couplers_WDATA;
  wire [0:0]xbar_to_m04_couplers_WREADY;
  wire [19:16]xbar_to_m04_couplers_WSTRB;
  wire [4:4]xbar_to_m04_couplers_WVALID;
  wire [191:160]xbar_to_m05_couplers_ARADDR;
  wire xbar_to_m05_couplers_ARREADY;
  wire [5:5]xbar_to_m05_couplers_ARVALID;
  wire [191:160]xbar_to_m05_couplers_AWADDR;
  wire xbar_to_m05_couplers_AWREADY;
  wire [5:5]xbar_to_m05_couplers_AWVALID;
  wire [5:5]xbar_to_m05_couplers_BREADY;
  wire [1:0]xbar_to_m05_couplers_BRESP;
  wire xbar_to_m05_couplers_BVALID;
  wire [31:0]xbar_to_m05_couplers_RDATA;
  wire [5:5]xbar_to_m05_couplers_RREADY;
  wire [1:0]xbar_to_m05_couplers_RRESP;
  wire xbar_to_m05_couplers_RVALID;
  wire [191:160]xbar_to_m05_couplers_WDATA;
  wire xbar_to_m05_couplers_WREADY;
  wire [23:20]xbar_to_m05_couplers_WSTRB;
  wire [5:5]xbar_to_m05_couplers_WVALID;
  wire [223:192]xbar_to_m06_couplers_ARADDR;
  wire xbar_to_m06_couplers_ARREADY;
  wire [6:6]xbar_to_m06_couplers_ARVALID;
  wire [223:192]xbar_to_m06_couplers_AWADDR;
  wire xbar_to_m06_couplers_AWREADY;
  wire [6:6]xbar_to_m06_couplers_AWVALID;
  wire [6:6]xbar_to_m06_couplers_BREADY;
  wire [1:0]xbar_to_m06_couplers_BRESP;
  wire xbar_to_m06_couplers_BVALID;
  wire [31:0]xbar_to_m06_couplers_RDATA;
  wire [6:6]xbar_to_m06_couplers_RREADY;
  wire [1:0]xbar_to_m06_couplers_RRESP;
  wire xbar_to_m06_couplers_RVALID;
  wire [223:192]xbar_to_m06_couplers_WDATA;
  wire xbar_to_m06_couplers_WREADY;
  wire [6:6]xbar_to_m06_couplers_WVALID;
  wire [27:0]NLW_xbar_m_axi_wstrb_UNCONNECTED;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[31:0] = m00_couplers_to_ps7_axi_periph_ARADDR;
  assign M00_AXI_arvalid[0] = m00_couplers_to_ps7_axi_periph_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_ps7_axi_periph_AWADDR;
  assign M00_AXI_awvalid[0] = m00_couplers_to_ps7_axi_periph_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_ps7_axi_periph_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_ps7_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_ps7_axi_periph_WDATA;
  assign M00_AXI_wvalid[0] = m00_couplers_to_ps7_axi_periph_WVALID;
  assign M01_ACLK_1 = M01_ACLK;
  assign M01_ARESETN_1 = M01_ARESETN;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_ps7_axi_periph_ARADDR;
  assign M01_AXI_arvalid[0] = m01_couplers_to_ps7_axi_periph_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_ps7_axi_periph_AWADDR;
  assign M01_AXI_awvalid[0] = m01_couplers_to_ps7_axi_periph_AWVALID;
  assign M01_AXI_bready[0] = m01_couplers_to_ps7_axi_periph_BREADY;
  assign M01_AXI_rready[0] = m01_couplers_to_ps7_axi_periph_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_ps7_axi_periph_WDATA;
  assign M01_AXI_wvalid[0] = m01_couplers_to_ps7_axi_periph_WVALID;
  assign M02_ACLK_1 = M02_ACLK;
  assign M02_ARESETN_1 = M02_ARESETN;
  assign M02_AXI_araddr[31:0] = m02_couplers_to_ps7_axi_periph_ARADDR;
  assign M02_AXI_arvalid[0] = m02_couplers_to_ps7_axi_periph_ARVALID;
  assign M02_AXI_awaddr[31:0] = m02_couplers_to_ps7_axi_periph_AWADDR;
  assign M02_AXI_awvalid[0] = m02_couplers_to_ps7_axi_periph_AWVALID;
  assign M02_AXI_bready[0] = m02_couplers_to_ps7_axi_periph_BREADY;
  assign M02_AXI_rready[0] = m02_couplers_to_ps7_axi_periph_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_ps7_axi_periph_WDATA;
  assign M02_AXI_wvalid[0] = m02_couplers_to_ps7_axi_periph_WVALID;
  assign M03_ACLK_1 = M03_ACLK;
  assign M03_ARESETN_1 = M03_ARESETN;
  assign M03_AXI_araddr[31:0] = m03_couplers_to_ps7_axi_periph_ARADDR;
  assign M03_AXI_arvalid[0] = m03_couplers_to_ps7_axi_periph_ARVALID;
  assign M03_AXI_awaddr[31:0] = m03_couplers_to_ps7_axi_periph_AWADDR;
  assign M03_AXI_awvalid[0] = m03_couplers_to_ps7_axi_periph_AWVALID;
  assign M03_AXI_bready[0] = m03_couplers_to_ps7_axi_periph_BREADY;
  assign M03_AXI_rready[0] = m03_couplers_to_ps7_axi_periph_RREADY;
  assign M03_AXI_wdata[31:0] = m03_couplers_to_ps7_axi_periph_WDATA;
  assign M03_AXI_wstrb[3:0] = m03_couplers_to_ps7_axi_periph_WSTRB;
  assign M03_AXI_wvalid[0] = m03_couplers_to_ps7_axi_periph_WVALID;
  assign M04_ACLK_1 = M04_ACLK;
  assign M04_ARESETN_1 = M04_ARESETN;
  assign M04_AXI_araddr[31:0] = m04_couplers_to_ps7_axi_periph_ARADDR;
  assign M04_AXI_arvalid[0] = m04_couplers_to_ps7_axi_periph_ARVALID;
  assign M04_AXI_awaddr[31:0] = m04_couplers_to_ps7_axi_periph_AWADDR;
  assign M04_AXI_awvalid[0] = m04_couplers_to_ps7_axi_periph_AWVALID;
  assign M04_AXI_bready[0] = m04_couplers_to_ps7_axi_periph_BREADY;
  assign M04_AXI_rready[0] = m04_couplers_to_ps7_axi_periph_RREADY;
  assign M04_AXI_wdata[31:0] = m04_couplers_to_ps7_axi_periph_WDATA;
  assign M04_AXI_wstrb[3:0] = m04_couplers_to_ps7_axi_periph_WSTRB;
  assign M04_AXI_wvalid[0] = m04_couplers_to_ps7_axi_periph_WVALID;
  assign M05_ACLK_1 = M05_ACLK;
  assign M05_ARESETN_1 = M05_ARESETN;
  assign M05_AXI_araddr[31:0] = m05_couplers_to_ps7_axi_periph_ARADDR;
  assign M05_AXI_arvalid = m05_couplers_to_ps7_axi_periph_ARVALID;
  assign M05_AXI_awaddr[31:0] = m05_couplers_to_ps7_axi_periph_AWADDR;
  assign M05_AXI_awvalid = m05_couplers_to_ps7_axi_periph_AWVALID;
  assign M05_AXI_bready = m05_couplers_to_ps7_axi_periph_BREADY;
  assign M05_AXI_rready = m05_couplers_to_ps7_axi_periph_RREADY;
  assign M05_AXI_wdata[31:0] = m05_couplers_to_ps7_axi_periph_WDATA;
  assign M05_AXI_wstrb[3:0] = m05_couplers_to_ps7_axi_periph_WSTRB;
  assign M05_AXI_wvalid = m05_couplers_to_ps7_axi_periph_WVALID;
  assign M06_ACLK_1 = M06_ACLK;
  assign M06_ARESETN_1 = M06_ARESETN;
  assign M06_AXI_araddr[31:0] = m06_couplers_to_ps7_axi_periph_ARADDR;
  assign M06_AXI_arvalid = m06_couplers_to_ps7_axi_periph_ARVALID;
  assign M06_AXI_awaddr[31:0] = m06_couplers_to_ps7_axi_periph_AWADDR;
  assign M06_AXI_awvalid = m06_couplers_to_ps7_axi_periph_AWVALID;
  assign M06_AXI_bready = m06_couplers_to_ps7_axi_periph_BREADY;
  assign M06_AXI_rready = m06_couplers_to_ps7_axi_periph_RREADY;
  assign M06_AXI_wdata[31:0] = m06_couplers_to_ps7_axi_periph_WDATA;
  assign M06_AXI_wvalid = m06_couplers_to_ps7_axi_periph_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = ps7_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = ps7_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[5:0] = ps7_axi_periph_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = ps7_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = ps7_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = ps7_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rid[5:0] = ps7_axi_periph_to_s00_couplers_RID;
  assign S00_AXI_rlast = ps7_axi_periph_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = ps7_axi_periph_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = ps7_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready = ps7_axi_periph_to_s00_couplers_WREADY;
  assign m00_couplers_to_ps7_axi_periph_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_ps7_axi_periph_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_ps7_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_ps7_axi_periph_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_ps7_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_ps7_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_ps7_axi_periph_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_ps7_axi_periph_WREADY = M00_AXI_wready[0];
  assign m01_couplers_to_ps7_axi_periph_ARREADY = M01_AXI_arready[0];
  assign m01_couplers_to_ps7_axi_periph_AWREADY = M01_AXI_awready[0];
  assign m01_couplers_to_ps7_axi_periph_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_ps7_axi_periph_BVALID = M01_AXI_bvalid[0];
  assign m01_couplers_to_ps7_axi_periph_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_ps7_axi_periph_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_ps7_axi_periph_RVALID = M01_AXI_rvalid[0];
  assign m01_couplers_to_ps7_axi_periph_WREADY = M01_AXI_wready[0];
  assign m02_couplers_to_ps7_axi_periph_ARREADY = M02_AXI_arready[0];
  assign m02_couplers_to_ps7_axi_periph_AWREADY = M02_AXI_awready[0];
  assign m02_couplers_to_ps7_axi_periph_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_ps7_axi_periph_BVALID = M02_AXI_bvalid[0];
  assign m02_couplers_to_ps7_axi_periph_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_ps7_axi_periph_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_ps7_axi_periph_RVALID = M02_AXI_rvalid[0];
  assign m02_couplers_to_ps7_axi_periph_WREADY = M02_AXI_wready[0];
  assign m03_couplers_to_ps7_axi_periph_ARREADY = M03_AXI_arready[0];
  assign m03_couplers_to_ps7_axi_periph_AWREADY = M03_AXI_awready[0];
  assign m03_couplers_to_ps7_axi_periph_BRESP = M03_AXI_bresp[1:0];
  assign m03_couplers_to_ps7_axi_periph_BVALID = M03_AXI_bvalid[0];
  assign m03_couplers_to_ps7_axi_periph_RDATA = M03_AXI_rdata[31:0];
  assign m03_couplers_to_ps7_axi_periph_RRESP = M03_AXI_rresp[1:0];
  assign m03_couplers_to_ps7_axi_periph_RVALID = M03_AXI_rvalid[0];
  assign m03_couplers_to_ps7_axi_periph_WREADY = M03_AXI_wready[0];
  assign m04_couplers_to_ps7_axi_periph_ARREADY = M04_AXI_arready[0];
  assign m04_couplers_to_ps7_axi_periph_AWREADY = M04_AXI_awready[0];
  assign m04_couplers_to_ps7_axi_periph_BRESP = M04_AXI_bresp[1:0];
  assign m04_couplers_to_ps7_axi_periph_BVALID = M04_AXI_bvalid[0];
  assign m04_couplers_to_ps7_axi_periph_RDATA = M04_AXI_rdata[31:0];
  assign m04_couplers_to_ps7_axi_periph_RRESP = M04_AXI_rresp[1:0];
  assign m04_couplers_to_ps7_axi_periph_RVALID = M04_AXI_rvalid[0];
  assign m04_couplers_to_ps7_axi_periph_WREADY = M04_AXI_wready[0];
  assign m05_couplers_to_ps7_axi_periph_ARREADY = M05_AXI_arready;
  assign m05_couplers_to_ps7_axi_periph_AWREADY = M05_AXI_awready;
  assign m05_couplers_to_ps7_axi_periph_BRESP = M05_AXI_bresp[1:0];
  assign m05_couplers_to_ps7_axi_periph_BVALID = M05_AXI_bvalid;
  assign m05_couplers_to_ps7_axi_periph_RDATA = M05_AXI_rdata[31:0];
  assign m05_couplers_to_ps7_axi_periph_RRESP = M05_AXI_rresp[1:0];
  assign m05_couplers_to_ps7_axi_periph_RVALID = M05_AXI_rvalid;
  assign m05_couplers_to_ps7_axi_periph_WREADY = M05_AXI_wready;
  assign m06_couplers_to_ps7_axi_periph_ARREADY = M06_AXI_arready;
  assign m06_couplers_to_ps7_axi_periph_AWREADY = M06_AXI_awready;
  assign m06_couplers_to_ps7_axi_periph_BRESP = M06_AXI_bresp[1:0];
  assign m06_couplers_to_ps7_axi_periph_BVALID = M06_AXI_bvalid;
  assign m06_couplers_to_ps7_axi_periph_RDATA = M06_AXI_rdata[31:0];
  assign m06_couplers_to_ps7_axi_periph_RRESP = M06_AXI_rresp[1:0];
  assign m06_couplers_to_ps7_axi_periph_RVALID = M06_AXI_rvalid;
  assign m06_couplers_to_ps7_axi_periph_WREADY = M06_AXI_wready;
  assign ps7_axi_periph_ACLK_net = ACLK;
  assign ps7_axi_periph_ARESETN_net = ARESETN;
  assign ps7_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign ps7_axi_periph_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign ps7_axi_periph_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign ps7_axi_periph_to_s00_couplers_ARID = S00_AXI_arid[5:0];
  assign ps7_axi_periph_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign ps7_axi_periph_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign ps7_axi_periph_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign ps7_axi_periph_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign ps7_axi_periph_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign ps7_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign ps7_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign ps7_axi_periph_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign ps7_axi_periph_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign ps7_axi_periph_to_s00_couplers_AWID = S00_AXI_awid[5:0];
  assign ps7_axi_periph_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign ps7_axi_periph_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign ps7_axi_periph_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign ps7_axi_periph_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign ps7_axi_periph_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign ps7_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign ps7_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready;
  assign ps7_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready;
  assign ps7_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign ps7_axi_periph_to_s00_couplers_WID = S00_AXI_wid[5:0];
  assign ps7_axi_periph_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign ps7_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign ps7_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid;
  m00_couplers_imp_13FRLR6 m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_ps7_axi_periph_ARADDR),
        .M_AXI_arready(m00_couplers_to_ps7_axi_periph_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_ps7_axi_periph_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_ps7_axi_periph_AWADDR),
        .M_AXI_awready(m00_couplers_to_ps7_axi_periph_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_ps7_axi_periph_AWVALID),
        .M_AXI_bready(m00_couplers_to_ps7_axi_periph_BREADY),
        .M_AXI_bresp(m00_couplers_to_ps7_axi_periph_BRESP),
        .M_AXI_bvalid(m00_couplers_to_ps7_axi_periph_BVALID),
        .M_AXI_rdata(m00_couplers_to_ps7_axi_periph_RDATA),
        .M_AXI_rready(m00_couplers_to_ps7_axi_periph_RREADY),
        .M_AXI_rresp(m00_couplers_to_ps7_axi_periph_RRESP),
        .M_AXI_rvalid(m00_couplers_to_ps7_axi_periph_RVALID),
        .M_AXI_wdata(m00_couplers_to_ps7_axi_periph_WDATA),
        .M_AXI_wready(m00_couplers_to_ps7_axi_periph_WREADY),
        .M_AXI_wvalid(m00_couplers_to_ps7_axi_periph_WVALID),
        .S_ACLK(ps7_axi_periph_ACLK_net),
        .S_ARESETN(ps7_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_8YL27N m01_couplers
       (.M_ACLK(M01_ACLK_1),
        .M_ARESETN(M01_ARESETN_1),
        .M_AXI_araddr(m01_couplers_to_ps7_axi_periph_ARADDR),
        .M_AXI_arready(m01_couplers_to_ps7_axi_periph_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_ps7_axi_periph_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_ps7_axi_periph_AWADDR),
        .M_AXI_awready(m01_couplers_to_ps7_axi_periph_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_ps7_axi_periph_AWVALID),
        .M_AXI_bready(m01_couplers_to_ps7_axi_periph_BREADY),
        .M_AXI_bresp(m01_couplers_to_ps7_axi_periph_BRESP),
        .M_AXI_bvalid(m01_couplers_to_ps7_axi_periph_BVALID),
        .M_AXI_rdata(m01_couplers_to_ps7_axi_periph_RDATA),
        .M_AXI_rready(m01_couplers_to_ps7_axi_periph_RREADY),
        .M_AXI_rresp(m01_couplers_to_ps7_axi_periph_RRESP),
        .M_AXI_rvalid(m01_couplers_to_ps7_axi_periph_RVALID),
        .M_AXI_wdata(m01_couplers_to_ps7_axi_periph_WDATA),
        .M_AXI_wready(m01_couplers_to_ps7_axi_periph_WREADY),
        .M_AXI_wvalid(m01_couplers_to_ps7_axi_periph_WVALID),
        .S_ACLK(ps7_axi_periph_ACLK_net),
        .S_ARESETN(ps7_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_2N0N7L m02_couplers
       (.M_ACLK(M02_ACLK_1),
        .M_ARESETN(M02_ARESETN_1),
        .M_AXI_araddr(m02_couplers_to_ps7_axi_periph_ARADDR),
        .M_AXI_arready(m02_couplers_to_ps7_axi_periph_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_ps7_axi_periph_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_ps7_axi_periph_AWADDR),
        .M_AXI_awready(m02_couplers_to_ps7_axi_periph_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_ps7_axi_periph_AWVALID),
        .M_AXI_bready(m02_couplers_to_ps7_axi_periph_BREADY),
        .M_AXI_bresp(m02_couplers_to_ps7_axi_periph_BRESP),
        .M_AXI_bvalid(m02_couplers_to_ps7_axi_periph_BVALID),
        .M_AXI_rdata(m02_couplers_to_ps7_axi_periph_RDATA),
        .M_AXI_rready(m02_couplers_to_ps7_axi_periph_RREADY),
        .M_AXI_rresp(m02_couplers_to_ps7_axi_periph_RRESP),
        .M_AXI_rvalid(m02_couplers_to_ps7_axi_periph_RVALID),
        .M_AXI_wdata(m02_couplers_to_ps7_axi_periph_WDATA),
        .M_AXI_wready(m02_couplers_to_ps7_axi_periph_WREADY),
        .M_AXI_wvalid(m02_couplers_to_ps7_axi_periph_WVALID),
        .S_ACLK(ps7_axi_periph_ACLK_net),
        .S_ARESETN(ps7_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  m03_couplers_imp_1ALB6Z4 m03_couplers
       (.M_ACLK(M03_ACLK_1),
        .M_ARESETN(M03_ARESETN_1),
        .M_AXI_araddr(m03_couplers_to_ps7_axi_periph_ARADDR),
        .M_AXI_arready(m03_couplers_to_ps7_axi_periph_ARREADY),
        .M_AXI_arvalid(m03_couplers_to_ps7_axi_periph_ARVALID),
        .M_AXI_awaddr(m03_couplers_to_ps7_axi_periph_AWADDR),
        .M_AXI_awready(m03_couplers_to_ps7_axi_periph_AWREADY),
        .M_AXI_awvalid(m03_couplers_to_ps7_axi_periph_AWVALID),
        .M_AXI_bready(m03_couplers_to_ps7_axi_periph_BREADY),
        .M_AXI_bresp(m03_couplers_to_ps7_axi_periph_BRESP),
        .M_AXI_bvalid(m03_couplers_to_ps7_axi_periph_BVALID),
        .M_AXI_rdata(m03_couplers_to_ps7_axi_periph_RDATA),
        .M_AXI_rready(m03_couplers_to_ps7_axi_periph_RREADY),
        .M_AXI_rresp(m03_couplers_to_ps7_axi_periph_RRESP),
        .M_AXI_rvalid(m03_couplers_to_ps7_axi_periph_RVALID),
        .M_AXI_wdata(m03_couplers_to_ps7_axi_periph_WDATA),
        .M_AXI_wready(m03_couplers_to_ps7_axi_periph_WREADY),
        .M_AXI_wstrb(m03_couplers_to_ps7_axi_periph_WSTRB),
        .M_AXI_wvalid(m03_couplers_to_ps7_axi_periph_WVALID),
        .S_ACLK(ps7_axi_periph_ACLK_net),
        .S_ARESETN(ps7_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m03_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m03_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m03_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m03_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m03_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m03_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m03_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m03_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m03_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m03_couplers_RDATA),
        .S_AXI_rready(xbar_to_m03_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m03_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m03_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m03_couplers_WDATA),
        .S_AXI_wready(xbar_to_m03_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m03_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m03_couplers_WVALID));
  m04_couplers_imp_OZP945 m04_couplers
       (.M_ACLK(M04_ACLK_1),
        .M_ARESETN(M04_ARESETN_1),
        .M_AXI_araddr(m04_couplers_to_ps7_axi_periph_ARADDR),
        .M_AXI_arready(m04_couplers_to_ps7_axi_periph_ARREADY),
        .M_AXI_arvalid(m04_couplers_to_ps7_axi_periph_ARVALID),
        .M_AXI_awaddr(m04_couplers_to_ps7_axi_periph_AWADDR),
        .M_AXI_awready(m04_couplers_to_ps7_axi_periph_AWREADY),
        .M_AXI_awvalid(m04_couplers_to_ps7_axi_periph_AWVALID),
        .M_AXI_bready(m04_couplers_to_ps7_axi_periph_BREADY),
        .M_AXI_bresp(m04_couplers_to_ps7_axi_periph_BRESP),
        .M_AXI_bvalid(m04_couplers_to_ps7_axi_periph_BVALID),
        .M_AXI_rdata(m04_couplers_to_ps7_axi_periph_RDATA),
        .M_AXI_rready(m04_couplers_to_ps7_axi_periph_RREADY),
        .M_AXI_rresp(m04_couplers_to_ps7_axi_periph_RRESP),
        .M_AXI_rvalid(m04_couplers_to_ps7_axi_periph_RVALID),
        .M_AXI_wdata(m04_couplers_to_ps7_axi_periph_WDATA),
        .M_AXI_wready(m04_couplers_to_ps7_axi_periph_WREADY),
        .M_AXI_wstrb(m04_couplers_to_ps7_axi_periph_WSTRB),
        .M_AXI_wvalid(m04_couplers_to_ps7_axi_periph_WVALID),
        .S_ACLK(ps7_axi_periph_ACLK_net),
        .S_ARESETN(ps7_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m04_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m04_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m04_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m04_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m04_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m04_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m04_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m04_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m04_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m04_couplers_RDATA),
        .S_AXI_rready(xbar_to_m04_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m04_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m04_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m04_couplers_WDATA),
        .S_AXI_wready(xbar_to_m04_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m04_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m04_couplers_WVALID));
  m05_couplers_imp_1VU1F5G m05_couplers
       (.M_ACLK(M05_ACLK_1),
        .M_ARESETN(M05_ARESETN_1),
        .M_AXI_araddr(m05_couplers_to_ps7_axi_periph_ARADDR),
        .M_AXI_arready(m05_couplers_to_ps7_axi_periph_ARREADY),
        .M_AXI_arvalid(m05_couplers_to_ps7_axi_periph_ARVALID),
        .M_AXI_awaddr(m05_couplers_to_ps7_axi_periph_AWADDR),
        .M_AXI_awready(m05_couplers_to_ps7_axi_periph_AWREADY),
        .M_AXI_awvalid(m05_couplers_to_ps7_axi_periph_AWVALID),
        .M_AXI_bready(m05_couplers_to_ps7_axi_periph_BREADY),
        .M_AXI_bresp(m05_couplers_to_ps7_axi_periph_BRESP),
        .M_AXI_bvalid(m05_couplers_to_ps7_axi_periph_BVALID),
        .M_AXI_rdata(m05_couplers_to_ps7_axi_periph_RDATA),
        .M_AXI_rready(m05_couplers_to_ps7_axi_periph_RREADY),
        .M_AXI_rresp(m05_couplers_to_ps7_axi_periph_RRESP),
        .M_AXI_rvalid(m05_couplers_to_ps7_axi_periph_RVALID),
        .M_AXI_wdata(m05_couplers_to_ps7_axi_periph_WDATA),
        .M_AXI_wready(m05_couplers_to_ps7_axi_periph_WREADY),
        .M_AXI_wstrb(m05_couplers_to_ps7_axi_periph_WSTRB),
        .M_AXI_wvalid(m05_couplers_to_ps7_axi_periph_WVALID),
        .S_ACLK(ps7_axi_periph_ACLK_net),
        .S_ARESETN(ps7_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m05_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m05_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m05_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m05_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m05_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m05_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m05_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m05_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m05_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m05_couplers_RDATA),
        .S_AXI_rready(xbar_to_m05_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m05_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m05_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m05_couplers_WDATA),
        .S_AXI_wready(xbar_to_m05_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m05_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m05_couplers_WVALID));
  m06_couplers_imp_1PIGYDI m06_couplers
       (.M_ACLK(M06_ACLK_1),
        .M_ARESETN(M06_ARESETN_1),
        .M_AXI_araddr(m06_couplers_to_ps7_axi_periph_ARADDR),
        .M_AXI_arready(m06_couplers_to_ps7_axi_periph_ARREADY),
        .M_AXI_arvalid(m06_couplers_to_ps7_axi_periph_ARVALID),
        .M_AXI_awaddr(m06_couplers_to_ps7_axi_periph_AWADDR),
        .M_AXI_awready(m06_couplers_to_ps7_axi_periph_AWREADY),
        .M_AXI_awvalid(m06_couplers_to_ps7_axi_periph_AWVALID),
        .M_AXI_bready(m06_couplers_to_ps7_axi_periph_BREADY),
        .M_AXI_bresp(m06_couplers_to_ps7_axi_periph_BRESP),
        .M_AXI_bvalid(m06_couplers_to_ps7_axi_periph_BVALID),
        .M_AXI_rdata(m06_couplers_to_ps7_axi_periph_RDATA),
        .M_AXI_rready(m06_couplers_to_ps7_axi_periph_RREADY),
        .M_AXI_rresp(m06_couplers_to_ps7_axi_periph_RRESP),
        .M_AXI_rvalid(m06_couplers_to_ps7_axi_periph_RVALID),
        .M_AXI_wdata(m06_couplers_to_ps7_axi_periph_WDATA),
        .M_AXI_wready(m06_couplers_to_ps7_axi_periph_WREADY),
        .M_AXI_wvalid(m06_couplers_to_ps7_axi_periph_WVALID),
        .S_ACLK(ps7_axi_periph_ACLK_net),
        .S_ARESETN(ps7_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m06_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m06_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m06_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m06_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m06_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m06_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m06_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m06_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m06_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m06_couplers_RDATA),
        .S_AXI_rready(xbar_to_m06_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m06_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m06_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m06_couplers_WDATA),
        .S_AXI_wready(xbar_to_m06_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m06_couplers_WVALID));
  s00_couplers_imp_1FIOEWJ s00_couplers
       (.M_ACLK(ps7_axi_periph_ACLK_net),
        .M_ARESETN(ps7_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(ps7_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arburst(ps7_axi_periph_to_s00_couplers_ARBURST),
        .S_AXI_arcache(ps7_axi_periph_to_s00_couplers_ARCACHE),
        .S_AXI_arid(ps7_axi_periph_to_s00_couplers_ARID),
        .S_AXI_arlen(ps7_axi_periph_to_s00_couplers_ARLEN),
        .S_AXI_arlock(ps7_axi_periph_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(ps7_axi_periph_to_s00_couplers_ARPROT),
        .S_AXI_arqos(ps7_axi_periph_to_s00_couplers_ARQOS),
        .S_AXI_arready(ps7_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arsize(ps7_axi_periph_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(ps7_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(ps7_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awburst(ps7_axi_periph_to_s00_couplers_AWBURST),
        .S_AXI_awcache(ps7_axi_periph_to_s00_couplers_AWCACHE),
        .S_AXI_awid(ps7_axi_periph_to_s00_couplers_AWID),
        .S_AXI_awlen(ps7_axi_periph_to_s00_couplers_AWLEN),
        .S_AXI_awlock(ps7_axi_periph_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(ps7_axi_periph_to_s00_couplers_AWPROT),
        .S_AXI_awqos(ps7_axi_periph_to_s00_couplers_AWQOS),
        .S_AXI_awready(ps7_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awsize(ps7_axi_periph_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(ps7_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bid(ps7_axi_periph_to_s00_couplers_BID),
        .S_AXI_bready(ps7_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(ps7_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(ps7_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(ps7_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rid(ps7_axi_periph_to_s00_couplers_RID),
        .S_AXI_rlast(ps7_axi_periph_to_s00_couplers_RLAST),
        .S_AXI_rready(ps7_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rresp(ps7_axi_periph_to_s00_couplers_RRESP),
        .S_AXI_rvalid(ps7_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(ps7_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wid(ps7_axi_periph_to_s00_couplers_WID),
        .S_AXI_wlast(ps7_axi_periph_to_s00_couplers_WLAST),
        .S_AXI_wready(ps7_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(ps7_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(ps7_axi_periph_to_s00_couplers_WVALID));
  pynqz2_xbar_14 xbar
       (.aclk(ps7_axi_periph_ACLK_net),
        .aresetn(ps7_axi_periph_ARESETN_net),
        .m_axi_araddr({xbar_to_m06_couplers_ARADDR,xbar_to_m05_couplers_ARADDR,xbar_to_m04_couplers_ARADDR,xbar_to_m03_couplers_ARADDR,xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arready({xbar_to_m06_couplers_ARREADY,xbar_to_m05_couplers_ARREADY,xbar_to_m04_couplers_ARREADY,xbar_to_m03_couplers_ARREADY,xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m06_couplers_ARVALID,xbar_to_m05_couplers_ARVALID,xbar_to_m04_couplers_ARVALID,xbar_to_m03_couplers_ARVALID,xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m06_couplers_AWADDR,xbar_to_m05_couplers_AWADDR,xbar_to_m04_couplers_AWADDR,xbar_to_m03_couplers_AWADDR,xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awready({xbar_to_m06_couplers_AWREADY,xbar_to_m05_couplers_AWREADY,xbar_to_m04_couplers_AWREADY,xbar_to_m03_couplers_AWREADY,xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m06_couplers_AWVALID,xbar_to_m05_couplers_AWVALID,xbar_to_m04_couplers_AWVALID,xbar_to_m03_couplers_AWVALID,xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m06_couplers_BREADY,xbar_to_m05_couplers_BREADY,xbar_to_m04_couplers_BREADY,xbar_to_m03_couplers_BREADY,xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m06_couplers_BRESP,xbar_to_m05_couplers_BRESP,xbar_to_m04_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m06_couplers_BVALID,xbar_to_m05_couplers_BVALID,xbar_to_m04_couplers_BVALID,xbar_to_m03_couplers_BVALID,xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m06_couplers_RDATA,xbar_to_m05_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m06_couplers_RREADY,xbar_to_m05_couplers_RREADY,xbar_to_m04_couplers_RREADY,xbar_to_m03_couplers_RREADY,xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m06_couplers_RRESP,xbar_to_m05_couplers_RRESP,xbar_to_m04_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m06_couplers_RVALID,xbar_to_m05_couplers_RVALID,xbar_to_m04_couplers_RVALID,xbar_to_m03_couplers_RVALID,xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m06_couplers_WDATA,xbar_to_m05_couplers_WDATA,xbar_to_m04_couplers_WDATA,xbar_to_m03_couplers_WDATA,xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m06_couplers_WREADY,xbar_to_m05_couplers_WREADY,xbar_to_m04_couplers_WREADY,xbar_to_m03_couplers_WREADY,xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m05_couplers_WSTRB,xbar_to_m04_couplers_WSTRB,xbar_to_m03_couplers_WSTRB,NLW_xbar_m_axi_wstrb_UNCONNECTED[11:0]}),
        .m_axi_wvalid({xbar_to_m06_couplers_WVALID,xbar_to_m05_couplers_WVALID,xbar_to_m04_couplers_WVALID,xbar_to_m03_couplers_WVALID,xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module s00_couplers_imp_1FIOEWJ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [5:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [5:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [5:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [5:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [5:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [5:0]s00_couplers_to_auto_pc_ARID;
  wire [3:0]s00_couplers_to_auto_pc_ARLEN;
  wire [1:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [5:0]s00_couplers_to_auto_pc_AWID;
  wire [3:0]s00_couplers_to_auto_pc_AWLEN;
  wire [1:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [5:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [5:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire [5:0]s00_couplers_to_auto_pc_WID;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[5:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[5:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[5:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[5:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WID = S_AXI_wid[5:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  pynqz2_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wid(s00_couplers_to_auto_pc_WID),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule
