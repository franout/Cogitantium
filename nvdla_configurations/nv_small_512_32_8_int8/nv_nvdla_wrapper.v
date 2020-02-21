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
dla_int_request,
apb2slave_dla_paddr,
apb2slave_dla_penable,
apb2slave_dla_psel,
apb2slave_dla_pwdata,
apb2slave_dla_pwrite,
apb2slave_dla_prdata,
apb2slave_dla_pready,
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
  output dla_int_request;
// apb interface
input [31:0] apb2slave_dla_paddr;
input apb2slave_dla_penable;
input apb2slave_dla_psel;
input [31:0] apb2slave_dla_pwdata;
input apb2slave_dla_pwrite;
output [31:0]apb2slave_dla_prdata;
output apb2slave_dla_pready;  
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
  assign gnd=1'b0;
  assign gnd_v=32'b0;
//interconnections wires   
   wire csb2nvdla_valid;
  wire csb2nvdla_ready ;
  wire [15:0] csb2nvdla_addr ;
  wire [31:0]csb2nvdla_wdat;
  wire csb2nvdla_write ;
  wire csb2nvdla_nposted;
  wire nvdla2csb_valid;
  wire [31:0]nvdla2csb_data ;
  wire nvdla2csb_wr_complete;
    
    


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
  
  
  ,.dla_intr(dla_int_request)
  ,.nvdla_pwrbus_ram_c_pd(gnd_v)
  ,.nvdla_pwrbus_ram_ma_pd(gnd_v)
  ,.nvdla_pwrbus_ram_mb_pd(gnd_v)
  ,.nvdla_pwrbus_ram_p_pd(gnd_v)
  ,.nvdla_pwrbus_ram_o_pd(gnd_v)
  ,.nvdla_pwrbus_ram_a_pd(gnd_v)
  );
 
 
 //apb2csb provided from NVDLA
 
 NV_NVDLA_apb2csb apb2csb_interface(
   .pclk(clk)
  ,.prstn(reset_n)
  ,.csb2nvdla_ready(csb2nvdla_ready)
  ,.nvdla2csb_data(nvdla2csb_data)
  ,.nvdla2csb_valid(nvdla2csb_valid)
  ,.paddr(apb2slave_dla_paddr)
  ,.penable(apb2slave_dla_penable)
  ,.psel(apb2slave_dla_psel)
  ,.pwdata(apb2slave_dla_pwdata)
  ,.pwrite(apb2slave_dla_pwrite)
  ,.csb2nvdla_addr(csb2nvdla_addr)
  ,.csb2nvdla_nposted(csb2nvdla_nposted)
  ,.csb2nvdla_valid(csb2nvdla_valid)
  ,.csb2nvdla_wdat(csb2nvdla_wdat)
  ,.csb2nvdla_write(csb2nvdla_write)
  ,.prdata(apb2slave_dla_prdata)
  ,.pready(apb2slave_dla_pready)
  );

endmodule
