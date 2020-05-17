//==================================================================================================
//  Filename      : tb_dtpu_hiear.v
//  Created On    : 2020-05-09 23:47:05
//  Last Modified : 2020-05-18 00:13:59
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology, Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com angione@student.chalmers.se s262620@studenti.polito.it  
//
//  Description   : testbench in sv for testing also the axi protocol outcome
//
//
//==================================================================================================

`timescale 1ns / 1ps



module tb_dtpu_hiear ();

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


axi4stream_vip your_instance_name (
  .aclk(aclk),                    // input wire aclk
  .aresetn(aresetn),              // input wire aresetn
  .s_axis_tvalid(s_axis_tvalid),  // input wire [0 : 0] s_axis_tvalid
  .s_axis_tready(s_axis_tready),  // output wire [0 : 0] s_axis_tready
  .s_axis_tdata(s_axis_tdata),    // input wire [511 : 0] s_axis_tdata
  .s_axis_tkeep(s_axis_tkeep),    // input wire [63 : 0] s_axis_tkeep
  .s_axis_tlast(s_axis_tlast)    // input wire [0 : 0] s_axis_tlast
);



///////////////////////////////////////////////////////////////////////////
// How to start the verification component
///////////////////////////////////////////////////////////////////////////
//      axi4stream_vip_slv_t  axi4stream_vip_slv;
//      initial begin : START_axi4stream_vip_SLAVE
//        axi4stream_vip_slv = new("axi4stream_vip_slv", `axi4stream_vip_PATH_TO_INTERFACE);
//        axi4stream_vip_slv.start_slave();
//      end






endmodule