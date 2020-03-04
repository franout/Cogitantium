/*
NVDLA wrapper:
    nvdla core
    apb2csb interface
    both provided from nvdla repository
*/
`include "MY_GLOBAL_DEFINE.vh"
module nv_nvdla_wrapper(
clk,
reset_n,
test_mode,
dlaintc2ps,
APB_S_paddr,
    APB_S_penable,
    APB_S_prdata,
    APB_S_pready,
    APB_S_psel,
    APB_S_pslverr,
    APB_S_pwdata,
    APB_S_pwrite,
// data backbone interface aka AXI 
M_AXI_awvalid
  ,M_AXI_awready 
  ,M_AXI_awid
  ,M_AXI_awlen
  ,M_AXI_awaddr
  ,M_AXI_wvalid
  ,M_AXI_wready
  ,M_AXI_wdata
  ,M_AXI_wstrb
  ,M_AXI_wlast
  ,M_AXI_bvalid
  ,M_AXI_bready
  ,M_AXI_bid
  ,M_AXI_arvalid
  ,M_AXI_arready
  ,M_AXI_arid 
  ,M_AXI_arlen
  ,M_AXI_araddr
  ,M_AXI_rvalid
  ,M_AXI_rready
  ,M_AXI_rid 
  ,M_AXI_rlast
  ,M_AXI_rdata
    );
  
  input clk;
  input reset_n;
  input test_mode;
  
  // Declare the attributes above the port declaration
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 dlaintc2ps INTERRUPT" *)
// Supported parameter: SENSITIVITY { LEVEL_HIGH, LEVEL_LOW, EDGE_RISING, EDGE_FALLING }
// Normally LEVEL_HIGH is assumed.  Use this parameter to force the level
(* X_INTERFACE_PARAMETER = "SENSITIVITY LEVEL_HIGH" *)
output dlaintc2ps;

 (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PADDR" *) input [31:0]APB_S_paddr; // apb interface
   (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PENABLE" *) input APB_S_penable;
 (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PRDATA" *) output [31:0]APB_S_prdata;
   (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PREADY" *) output [0:0]APB_S_pready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PSEL" *) input [0:0]APB_S_psel;
   (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PSLVERR" *) output [0:0]APB_S_pslverr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PWDATA" *) input [31:0]APB_S_pwdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB_S PWRITE" *) input APB_S_pwrite;  
  // data backbone interface aka AXI 
  output M_AXI_awvalid;
input M_AXI_awready;
output [7:0] M_AXI_awid;
output [3:0] M_AXI_awlen;
output [32 -1:0] M_AXI_awaddr;
output M_AXI_wvalid;
input M_AXI_wready;
output [32 -1:0] M_AXI_wdata;
output [32/8-1:0] M_AXI_wstrb;
output M_AXI_wlast;
output M_AXI_arvalid;
input M_AXI_arready;
output [7:0] M_AXI_arid;
output [3:0] M_AXI_arlen;
output [32 -1:0] M_AXI_araddr;
input M_AXI_bvalid;
output M_AXI_bready;
input [7:0] M_AXI_bid;
input M_AXI_rvalid;
output M_AXI_rready;
input [7:0] M_AXI_rid;
input M_AXI_rlast;
input [32 -1:0] M_AXI_rdata;
  //defualt values
  assign s_apb_pslverr=1'b0;
  assign gnd=1'b0;
  assign gnd_v=32'b0;
//interconnections wires   
  
  wire s_axi_prstn;
  wire s_axi_aclk;
   wire csb2nvdla_valid;
  wire csb2nvdla_ready ;
  wire [15:0] csb2nvdla_addr ;
  wire [31:0]csb2nvdla_wdat;
  wire csb2nvdla_write ;
  wire csb2nvdla_nposted;
  wire nvdla2csb_valid;
  wire [31:0]nvdla2csb_data ;
  wire nvdla2csb_wr_complete;
    
    assign s_axi_prstn=reset_n;
    assign s_axi_aclk=clk;


    //////////////////////
    //////NVDLA CORE//////
    //////////////////////
  NV_nvdla nv_core(
   .dla_core_clk(clk)
  ,.dla_csb_clk(clk)
  ,.global_clk_ovr_on(gnd)
  ,.tmc2slcg_disable_clock_gating(gnd)
  ,.dla_reset_rstn(reset_n)
  ,.direct_reset_(reset_n)
  ,.test_mode(test_mode)
  ,.csb2nvdla_valid(csb2nvdla_valid)
  ,.csb2nvdla_ready(csb2vndla_ready)
  ,.csb2nvdla_addr(csb2nvdla_addr)
  ,.csb2nvdla_wdat(csb2nvdla_wdat)
  ,.csb2nvdla_write (csb2nvdla_write)
  ,.csb2nvdla_nposted(csb2nvdla_nposted)
  ,.nvdla2csb_valid(nvdla2csb_valid) 
  ,.nvdla2csb_data (nvdla2csb_data )
  ,.nvdla2csb_wr_complete(nvdla2csb_wr_complete) 
  ,.nvdla_core2dbb_aw_awvalid(M_AXI_awvalid)
  ,.nvdla_core2dbb_aw_awready(M_AXI_awready) 
  ,.nvdla_core2dbb_aw_awid(M_AXI_awid)
  ,.nvdla_core2dbb_aw_awlen(M_AXI_awlen)
  ,.nvdla_core2dbb_aw_awaddr(M_AXI_awaddr)
  ,.nvdla_core2dbb_w_wvalid(M_AXI_wvalid)
  ,.nvdla_core2dbb_w_wready(M_AXI_wready)
  ,.nvdla_core2dbb_w_wdata(M_AXI_wdata)
  ,.nvdla_core2dbb_w_wstrb(M_AXI_wstrb)
  ,.nvdla_core2dbb_w_wlast(M_AXI_wlast)
  ,.nvdla_core2dbb_b_bvalid(M_AXI_bvalid)
  ,.nvdla_core2dbb_b_bready(M_AXI_bready)
  ,.nvdla_core2dbb_b_bid(M_AXI_bid)
  ,.nvdla_core2dbb_ar_arvalid(M_AXI_arvalid)
  ,.nvdla_core2dbb_ar_arready(M_AXI_arready)
  ,.nvdla_core2dbb_ar_arid (M_AXI_arid )
  ,.nvdla_core2dbb_ar_arlen(M_AXI_arlen)
  ,.nvdla_core2dbb_ar_araddr(M_AXI_araddr)
  ,.nvdla_core2dbb_r_rvalid(M_AXI_rvalid)
  ,.nvdla_core2dbb_r_rready(M_AXI_rready)
  ,.nvdla_core2dbb_r_rid (M_AXI_rid )
  ,.nvdla_core2dbb_r_rlast(M_AXI_rlast)
  ,.nvdla_core2dbb_r_rdata(M_AXI_rdata)
  
  
  ,.dla_intr(dlaintc2ps)
  ,.nvdla_pwrbus_ram_c_pd(gnd_v)
  ,.nvdla_pwrbus_ram_ma_pd(gnd_v)
  ,.nvdla_pwrbus_ram_mb_pd(gnd_v)
  ,.nvdla_pwrbus_ram_p_pd(gnd_v)
  ,.nvdla_pwrbus_ram_o_pd(gnd_v)
  ,.nvdla_pwrbus_ram_a_pd(gnd_v)
  );
 
 
 //apb2csb provided from NVDLA
 
 NV_NVDLA_apb2csb apb2csb_interface(
   .pclk(s_axi_aclk)
  ,.prstn(s_axi_prstn)
  ,.csb2nvdla_ready(csb2nvdla_ready)
  ,.nvdla2csb_data(nvdla2csb_data)
  ,.nvdla2csb_valid(nvdla2csb_valid)
  ,.paddr(APB_S_paddr)
  ,.penable(APB_S_penable)
  ,.psel(APB_S_psel)
  ,.pwdata(APB_S_pwdata)
  ,.pwrite(APB_S_pwrite)
  ,.csb2nvdla_addr(csb2nvdla_addr)
  ,.csb2nvdla_nposted(csb2nvdla_nposted)
  ,.csb2nvdla_valid(csb2nvdla_valid)
  ,.csb2nvdla_wdat(csb2nvdla_wdat)
  ,.csb2nvdla_write(csb2nvdla_write)
  ,.prdata(APB_S_prdata)
  ,.pready(APB_S_pready)
  );

endmodule
