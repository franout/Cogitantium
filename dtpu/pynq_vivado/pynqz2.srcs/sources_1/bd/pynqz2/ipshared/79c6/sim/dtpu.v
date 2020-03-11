//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2.1 (win64) Build 2729669 Thu Dec  5 04:49:17 MST 2019
//Date        : Wed Mar 11 14:52:42 2020
//Host        : DESKTOP-9DNP7KK running 64-bit major release  (build 9200)
//Command     : generate_target dtpu.bd
//Design      : dtpu
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

/* axi stream are for input/output  fifo and bram 
 */
(* CORE_GENERATION_INFO = "dtpu,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=dtpu,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"da_bram_cntlr_cnt\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"=1,da_clkrst_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "dtpu.hwdef" *) 
module dtpu
   (M_AXIS_0_0_tdata,
    M_AXIS_0_0_tdest,
    M_AXIS_0_0_tid,
    M_AXIS_0_0_tlast,
    M_AXIS_0_0_tready,
    M_AXIS_0_0_tuser,
    M_AXIS_0_0_tvalid,
    S_AXIS_0_0_tdata,
    S_AXIS_0_0_tdest,
    S_AXIS_0_0_tid,
    S_AXIS_0_0_tlast,
    S_AXIS_0_0_tready,
    S_AXIS_0_0_tuser,
    S_AXIS_0_0_tvalid,
    S_AXIS_1_0_tdata,
    S_AXIS_1_0_tdest,
    S_AXIS_1_0_tid,
    S_AXIS_1_0_tlast,
    S_AXIS_1_0_tready,
    S_AXIS_1_0_tuser,
    S_AXIS_1_0_tvalid,
    S_AXIS_2_0_tdata,
    S_AXIS_2_0_tdest,
    S_AXIS_2_0_tid,
    S_AXIS_2_0_tlast,
    S_AXIS_2_0_tready,
    S_AXIS_2_0_tuser,
    S_AXIS_2_0_tvalid,
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
    axi_resetn,
    clk,
    enable,
    idle_signal,
    intr_dtpu,
    test_mode);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0_0, CLK_DOMAIN dtpu_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 4, TID_WIDTH 4, TUSER_WIDTH 8" *) output [63:0]M_AXIS_0_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TDEST" *) output [3:0]M_AXIS_0_0_tdest;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TID" *) output [3:0]M_AXIS_0_0_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TLAST" *) output M_AXIS_0_0_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TREADY" *) input M_AXIS_0_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TUSER" *) output [7:0]M_AXIS_0_0_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0_0 TVALID" *) output M_AXIS_0_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_0_0, CLK_DOMAIN dtpu_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 4, TID_WIDTH 4, TUSER_WIDTH 8" *) input [63:0]S_AXIS_0_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TDEST" *) input [3:0]S_AXIS_0_0_tdest;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TID" *) input [3:0]S_AXIS_0_0_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TLAST" *) input S_AXIS_0_0_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TREADY" *) output S_AXIS_0_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TUSER" *) input [7:0]S_AXIS_0_0_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0_0 TVALID" *) input S_AXIS_0_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_1_0, CLK_DOMAIN dtpu_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 4, TID_WIDTH 4, TUSER_WIDTH 8" *) input [63:0]S_AXIS_1_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TDEST" *) input [3:0]S_AXIS_1_0_tdest;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TID" *) input [3:0]S_AXIS_1_0_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TLAST" *) input S_AXIS_1_0_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TREADY" *) output S_AXIS_1_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TUSER" *) input [7:0]S_AXIS_1_0_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1_0 TVALID" *) input S_AXIS_1_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_2_0, CLK_DOMAIN dtpu_aclk_0, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 4, TID_WIDTH 4, TUSER_WIDTH 8" *) input [63:0]S_AXIS_2_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TDEST" *) input [3:0]S_AXIS_2_0_tdest;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TID" *) input [3:0]S_AXIS_2_0_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TLAST" *) input S_AXIS_2_0_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TREADY" *) output S_AXIS_2_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TUSER" *) input [7:0]S_AXIS_2_0_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2_0 TVALID" *) input S_AXIS_2_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN dtpu_aclk_0, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [12:0]S_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output S_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input S_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) input [12:0]S_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output S_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input S_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input S_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]S_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output S_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]S_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input S_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]S_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output S_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]S_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output S_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]S_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input S_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AXI_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AXI_ACLK, ASSOCIATED_BUSIF S_AXI:S_AXIS_0_0:M_AXIS_0_0:S_AXIS_1_0:S_AXIS_2_0, ASSOCIATED_RESET axi_resetn:axi_resetn, CLK_DOMAIN dtpu_aclk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AXI_RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AXI_RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input axi_resetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN dtpu_clk, FREQ_HZ 40000000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  input enable;
  output idle_signal;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTR_DTPU INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTR_DTPU, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output intr_dtpu;
  input test_mode;

  wire [63:0]S_AXIS_0_0_1_TDATA;
  wire [3:0]S_AXIS_0_0_1_TDEST;
  wire [3:0]S_AXIS_0_0_1_TID;
  wire S_AXIS_0_0_1_TLAST;
  wire S_AXIS_0_0_1_TREADY;
  wire [7:0]S_AXIS_0_0_1_TUSER;
  wire S_AXIS_0_0_1_TVALID;
  wire [63:0]S_AXIS_1_0_1_TDATA;
  wire [3:0]S_AXIS_1_0_1_TDEST;
  wire [3:0]S_AXIS_1_0_1_TID;
  wire S_AXIS_1_0_1_TLAST;
  wire S_AXIS_1_0_1_TREADY;
  wire [7:0]S_AXIS_1_0_1_TUSER;
  wire S_AXIS_1_0_1_TVALID;
  wire [63:0]S_AXIS_2_0_1_TDATA;
  wire [3:0]S_AXIS_2_0_1_TDEST;
  wire [3:0]S_AXIS_2_0_1_TID;
  wire S_AXIS_2_0_1_TLAST;
  wire S_AXIS_2_0_1_TREADY;
  wire [7:0]S_AXIS_2_0_1_TUSER;
  wire S_AXIS_2_0_1_TVALID;
  wire [12:0]S_AXI_1_ARADDR;
  wire S_AXI_1_ARREADY;
  wire S_AXI_1_ARVALID;
  wire [12:0]S_AXI_1_AWADDR;
  wire S_AXI_1_AWREADY;
  wire S_AXI_1_AWVALID;
  wire S_AXI_1_BREADY;
  wire [1:0]S_AXI_1_BRESP;
  wire S_AXI_1_BVALID;
  wire [31:0]S_AXI_1_RDATA;
  wire S_AXI_1_RREADY;
  wire [1:0]S_AXI_1_RRESP;
  wire S_AXI_1_RVALID;
  wire [31:0]S_AXI_1_WDATA;
  wire S_AXI_1_WREADY;
  wire [3:0]S_AXI_1_WSTRB;
  wire S_AXI_1_WVALID;
  wire axi_aclk_1;
  wire axi_resetn_1;
  wire axis_accelerator_ada_0_AP_CTRL_ap_continue;
  wire axis_accelerator_ada_0_AP_CTRL_ap_done;
  wire axis_accelerator_ada_0_AP_CTRL_ap_ready;
  wire axis_accelerator_ada_0_AP_CTRL_ap_start;
  wire [63:0]axis_accelerator_ada_0_M_AXIS_0_TDATA;
  wire [3:0]axis_accelerator_ada_0_M_AXIS_0_TDEST;
  wire [3:0]axis_accelerator_ada_0_M_AXIS_0_TID;
  wire axis_accelerator_ada_0_M_AXIS_0_TLAST;
  wire axis_accelerator_ada_0_M_AXIS_0_TREADY;
  wire [7:0]axis_accelerator_ada_0_M_AXIS_0_TUSER;
  wire axis_accelerator_ada_0_M_AXIS_0_TVALID;
  wire axis_accelerator_ada_0_aresetn;
  wire axis_accelerator_ada_0_interrupt;
  wire clk_1;
  wire dtpu_core_0_cs_idle;
  wire [31:0]dtpu_core_0_csr_mem_interface_ADDR;
  wire dtpu_core_0_csr_mem_interface_CLK;
  wire [7:0]dtpu_core_0_csr_mem_interface_DIN;
  wire [7:0]dtpu_core_0_csr_mem_interface_DOUT;
  wire dtpu_core_0_csr_mem_interface_EN;
  wire dtpu_core_0_csr_mem_interface_RST;
  wire dtpu_core_0_csr_mem_interface_WE;
  wire dtpu_core_0_input_fifo_EMPTY_N;
  wire [63:0]dtpu_core_0_input_fifo_RD_DATA;
  wire dtpu_core_0_input_fifo_RD_EN;
  wire dtpu_core_0_output_fifo_FULL_N;
  wire [63:0]dtpu_core_0_output_fifo_WR_DATA;
  wire dtpu_core_0_output_fifo_WR_EN;
  wire [31:0]dtpu_core_0_weight_mem_interface_ADDR;
  wire dtpu_core_0_weight_mem_interface_CLK;
  wire [63:0]dtpu_core_0_weight_mem_interface_DIN;
  wire [63:0]dtpu_core_0_weight_mem_interface_DOUT;
  wire dtpu_core_0_weight_mem_interface_EN;
  wire dtpu_core_0_weight_mem_interface_RST;
  wire dtpu_core_0_weight_mem_interface_WE;
  wire enable_1;
  wire test_mode_1;

  assign M_AXIS_0_0_tdata[63:0] = axis_accelerator_ada_0_M_AXIS_0_TDATA;
  assign M_AXIS_0_0_tdest[3:0] = axis_accelerator_ada_0_M_AXIS_0_TDEST;
  assign M_AXIS_0_0_tid[3:0] = axis_accelerator_ada_0_M_AXIS_0_TID;
  assign M_AXIS_0_0_tlast = axis_accelerator_ada_0_M_AXIS_0_TLAST;
  assign M_AXIS_0_0_tuser[7:0] = axis_accelerator_ada_0_M_AXIS_0_TUSER;
  assign M_AXIS_0_0_tvalid = axis_accelerator_ada_0_M_AXIS_0_TVALID;
  assign S_AXIS_0_0_1_TDATA = S_AXIS_0_0_tdata[63:0];
  assign S_AXIS_0_0_1_TDEST = S_AXIS_0_0_tdest[3:0];
  assign S_AXIS_0_0_1_TID = S_AXIS_0_0_tid[3:0];
  assign S_AXIS_0_0_1_TLAST = S_AXIS_0_0_tlast;
  assign S_AXIS_0_0_1_TUSER = S_AXIS_0_0_tuser[7:0];
  assign S_AXIS_0_0_1_TVALID = S_AXIS_0_0_tvalid;
  assign S_AXIS_0_0_tready = S_AXIS_0_0_1_TREADY;
  assign S_AXIS_1_0_1_TDATA = S_AXIS_1_0_tdata[63:0];
  assign S_AXIS_1_0_1_TDEST = S_AXIS_1_0_tdest[3:0];
  assign S_AXIS_1_0_1_TID = S_AXIS_1_0_tid[3:0];
  assign S_AXIS_1_0_1_TLAST = S_AXIS_1_0_tlast;
  assign S_AXIS_1_0_1_TUSER = S_AXIS_1_0_tuser[7:0];
  assign S_AXIS_1_0_1_TVALID = S_AXIS_1_0_tvalid;
  assign S_AXIS_1_0_tready = S_AXIS_1_0_1_TREADY;
  assign S_AXIS_2_0_1_TDATA = S_AXIS_2_0_tdata[63:0];
  assign S_AXIS_2_0_1_TDEST = S_AXIS_2_0_tdest[3:0];
  assign S_AXIS_2_0_1_TID = S_AXIS_2_0_tid[3:0];
  assign S_AXIS_2_0_1_TLAST = S_AXIS_2_0_tlast;
  assign S_AXIS_2_0_1_TUSER = S_AXIS_2_0_tuser[7:0];
  assign S_AXIS_2_0_1_TVALID = S_AXIS_2_0_tvalid;
  assign S_AXIS_2_0_tready = S_AXIS_2_0_1_TREADY;
  assign S_AXI_1_ARADDR = S_AXI_araddr[12:0];
  assign S_AXI_1_ARVALID = S_AXI_arvalid;
  assign S_AXI_1_AWADDR = S_AXI_awaddr[12:0];
  assign S_AXI_1_AWVALID = S_AXI_awvalid;
  assign S_AXI_1_BREADY = S_AXI_bready;
  assign S_AXI_1_RREADY = S_AXI_rready;
  assign S_AXI_1_WDATA = S_AXI_wdata[31:0];
  assign S_AXI_1_WSTRB = S_AXI_wstrb[3:0];
  assign S_AXI_1_WVALID = S_AXI_wvalid;
  assign S_AXI_arready = S_AXI_1_ARREADY;
  assign S_AXI_awready = S_AXI_1_AWREADY;
  assign S_AXI_bresp[1:0] = S_AXI_1_BRESP;
  assign S_AXI_bvalid = S_AXI_1_BVALID;
  assign S_AXI_rdata[31:0] = S_AXI_1_RDATA;
  assign S_AXI_rresp[1:0] = S_AXI_1_RRESP;
  assign S_AXI_rvalid = S_AXI_1_RVALID;
  assign S_AXI_wready = S_AXI_1_WREADY;
  assign axi_aclk_1 = axi_aclk;
  assign axi_resetn_1 = axi_resetn;
  assign axis_accelerator_ada_0_M_AXIS_0_TREADY = M_AXIS_0_0_tready;
  assign clk_1 = clk;
  assign enable_1 = enable;
  assign idle_signal = dtpu_core_0_cs_idle;
  assign intr_dtpu = axis_accelerator_ada_0_interrupt;
  assign test_mode_1 = test_mode;
  dtpu_axis_accelerator_ada_0_0 axis_accelerator_ada_0
       (.aclk(clk_1),
        .ap_continue(axis_accelerator_ada_0_AP_CTRL_ap_continue),
        .ap_done(axis_accelerator_ada_0_AP_CTRL_ap_done),
        .ap_fifo_iarg_2_dout(dtpu_core_0_input_fifo_RD_DATA),
        .ap_fifo_iarg_2_empty_n(dtpu_core_0_input_fifo_EMPTY_N),
        .ap_fifo_iarg_2_read(dtpu_core_0_input_fifo_RD_EN),
        .ap_fifo_oarg_0_din(dtpu_core_0_output_fifo_WR_DATA),
        .ap_fifo_oarg_0_full_n(dtpu_core_0_output_fifo_FULL_N),
        .ap_fifo_oarg_0_write(dtpu_core_0_output_fifo_WR_EN),
        .ap_iarg_0_addr(dtpu_core_0_csr_mem_interface_ADDR),
        .ap_iarg_0_ce(dtpu_core_0_csr_mem_interface_EN),
        .ap_iarg_0_clk(dtpu_core_0_csr_mem_interface_CLK),
        .ap_iarg_0_din(dtpu_core_0_csr_mem_interface_DIN),
        .ap_iarg_0_dout(dtpu_core_0_csr_mem_interface_DOUT),
        .ap_iarg_0_rst(dtpu_core_0_csr_mem_interface_RST),
        .ap_iarg_0_we(dtpu_core_0_csr_mem_interface_WE),
        .ap_iarg_1_addr(dtpu_core_0_weight_mem_interface_ADDR),
        .ap_iarg_1_ce(dtpu_core_0_weight_mem_interface_EN),
        .ap_iarg_1_clk(dtpu_core_0_weight_mem_interface_CLK),
        .ap_iarg_1_din(dtpu_core_0_weight_mem_interface_DIN),
        .ap_iarg_1_dout(dtpu_core_0_weight_mem_interface_DOUT),
        .ap_iarg_1_rst(dtpu_core_0_weight_mem_interface_RST),
        .ap_iarg_1_we({dtpu_core_0_weight_mem_interface_WE,dtpu_core_0_weight_mem_interface_WE,dtpu_core_0_weight_mem_interface_WE,dtpu_core_0_weight_mem_interface_WE,dtpu_core_0_weight_mem_interface_WE,dtpu_core_0_weight_mem_interface_WE,dtpu_core_0_weight_mem_interface_WE,dtpu_core_0_weight_mem_interface_WE}),
        .ap_idle(1'b0),
        .ap_ready(axis_accelerator_ada_0_AP_CTRL_ap_ready),
        .ap_start(axis_accelerator_ada_0_AP_CTRL_ap_start),
        .aresetn(axis_accelerator_ada_0_aresetn),
        .interrupt(axis_accelerator_ada_0_interrupt),
        .m_axis_0_tdata(axis_accelerator_ada_0_M_AXIS_0_TDATA),
        .m_axis_0_tdest(axis_accelerator_ada_0_M_AXIS_0_TDEST),
        .m_axis_0_tid(axis_accelerator_ada_0_M_AXIS_0_TID),
        .m_axis_0_tlast(axis_accelerator_ada_0_M_AXIS_0_TLAST),
        .m_axis_0_tready(axis_accelerator_ada_0_M_AXIS_0_TREADY),
        .m_axis_0_tuser(axis_accelerator_ada_0_M_AXIS_0_TUSER),
        .m_axis_0_tvalid(axis_accelerator_ada_0_M_AXIS_0_TVALID),
        .m_axis_aclk(axi_aclk_1),
        .m_axis_aresetn(axi_resetn_1),
        .s_axi_aclk(axi_aclk_1),
        .s_axi_araddr(S_AXI_1_ARADDR),
        .s_axi_aresetn(axi_resetn_1),
        .s_axi_arready(S_AXI_1_ARREADY),
        .s_axi_arvalid(S_AXI_1_ARVALID),
        .s_axi_awaddr(S_AXI_1_AWADDR),
        .s_axi_awready(S_AXI_1_AWREADY),
        .s_axi_awvalid(S_AXI_1_AWVALID),
        .s_axi_bready(S_AXI_1_BREADY),
        .s_axi_bresp(S_AXI_1_BRESP),
        .s_axi_bvalid(S_AXI_1_BVALID),
        .s_axi_rdata(S_AXI_1_RDATA),
        .s_axi_rready(S_AXI_1_RREADY),
        .s_axi_rresp(S_AXI_1_RRESP),
        .s_axi_rvalid(S_AXI_1_RVALID),
        .s_axi_wdata(S_AXI_1_WDATA),
        .s_axi_wready(S_AXI_1_WREADY),
        .s_axi_wstrb(S_AXI_1_WSTRB),
        .s_axi_wvalid(S_AXI_1_WVALID),
        .s_axis_0_tdata(S_AXIS_0_0_1_TDATA),
        .s_axis_0_tdest(S_AXIS_0_0_1_TDEST),
        .s_axis_0_tid(S_AXIS_0_0_1_TID),
        .s_axis_0_tlast(S_AXIS_0_0_1_TLAST),
        .s_axis_0_tready(S_AXIS_0_0_1_TREADY),
        .s_axis_0_tuser(S_AXIS_0_0_1_TUSER),
        .s_axis_0_tvalid(S_AXIS_0_0_1_TVALID),
        .s_axis_1_tdata(S_AXIS_1_0_1_TDATA),
        .s_axis_1_tdest(S_AXIS_1_0_1_TDEST),
        .s_axis_1_tid(S_AXIS_1_0_1_TID),
        .s_axis_1_tlast(S_AXIS_1_0_1_TLAST),
        .s_axis_1_tready(S_AXIS_1_0_1_TREADY),
        .s_axis_1_tuser(S_AXIS_1_0_1_TUSER),
        .s_axis_1_tvalid(S_AXIS_1_0_1_TVALID),
        .s_axis_2_tdata(S_AXIS_2_0_1_TDATA),
        .s_axis_2_tdest(S_AXIS_2_0_1_TDEST),
        .s_axis_2_tid(S_AXIS_2_0_1_TID),
        .s_axis_2_tlast(S_AXIS_2_0_1_TLAST),
        .s_axis_2_tready(S_AXIS_2_0_1_TREADY),
        .s_axis_2_tuser(S_AXIS_2_0_1_TUSER),
        .s_axis_2_tvalid(S_AXIS_2_0_1_TVALID),
        .s_axis_aclk(axi_aclk_1),
        .s_axis_aresetn(axi_resetn_1));
  dtpu_dtpu_core_0_2 dtpu_core_0
       (.clk(clk_1),
        .cs_continue(axis_accelerator_ada_0_AP_CTRL_ap_continue),
        .cs_done(axis_accelerator_ada_0_AP_CTRL_ap_done),
        .cs_idle(dtpu_core_0_cs_idle),
        .cs_ready(axis_accelerator_ada_0_AP_CTRL_ap_ready),
        .cs_start(axis_accelerator_ada_0_AP_CTRL_ap_start),
        .csr_address(dtpu_core_0_csr_mem_interface_ADDR),
        .csr_ce(dtpu_core_0_csr_mem_interface_EN),
        .csr_clk(dtpu_core_0_csr_mem_interface_CLK),
        .csr_din(dtpu_core_0_csr_mem_interface_DIN),
        .csr_dout(dtpu_core_0_csr_mem_interface_DOUT),
        .csr_reset(dtpu_core_0_csr_mem_interface_RST),
        .csr_we(dtpu_core_0_csr_mem_interface_WE),
        .enable(enable_1),
        .infifo_dout(dtpu_core_0_input_fifo_RD_DATA),
        .infifo_is_empty(dtpu_core_0_input_fifo_EMPTY_N),
        .infifo_read(dtpu_core_0_input_fifo_RD_EN),
        .outfifo_din(dtpu_core_0_output_fifo_WR_DATA),
        .outfifo_is_full(dtpu_core_0_output_fifo_FULL_N),
        .outfifo_write(dtpu_core_0_output_fifo_WR_EN),
        .reset(axis_accelerator_ada_0_aresetn),
        .test_mode(test_mode_1),
        .wm_address(dtpu_core_0_weight_mem_interface_ADDR),
        .wm_ce(dtpu_core_0_weight_mem_interface_EN),
        .wm_clk(dtpu_core_0_weight_mem_interface_CLK),
        .wm_din(dtpu_core_0_weight_mem_interface_DIN),
        .wm_dout(dtpu_core_0_weight_mem_interface_DOUT),
        .wm_reset(dtpu_core_0_weight_mem_interface_RST),
        .wm_we(dtpu_core_0_weight_mem_interface_WE));
endmodule
