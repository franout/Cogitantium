

module apb_bridge_wrapper(
s_axi_aclk,        // input wire s_axi_aclk
  s_axi_aresetn,  // input wire s_axi_aresetn
  s_axi_awaddr,    // input wire [31 : 0] s_axi_awaddr
  s_axi_awvalid,  // input wire s_axi_awvalid
  s_axi_awready,  // output wire s_axi_awready
  s_axi_wdata,      // input wire [31 : 0] s_axi_wdata
  s_axi_wvalid,    // input wire s_axi_wvalid
  s_axi_wready,    // output wire s_axi_wready
  s_axi_bresp,      // output wire [1 : 0] s_axi_bresp
  s_axi_bvalid,    // output wire s_axi_bvalid
  s_axi_bready,    // input wire s_axi_bready
  s_axi_araddr,    // input wire [31 : 0] s_axi_araddr
  s_axi_arvalid,  // input wire s_axi_arvalid
  s_axi_arready,  // output wire s_axi_arready
  s_axi_rdata,      // output wire [31 : 0] s_axi_rdata
  s_axi_rresp,      // output wire [1 : 0] s_axi_rresp
  s_axi_rvalid,    // output wire s_axi_rvalid
  s_axi_rready,    // input wire s_axi_rready
  
  m_apb_paddr,      // output wire [31 : 0] m_apb_paddr
  m_apb_psel,        // output wire [0 : 0] m_apb_psel
  m_apb_penable,  // output wire m_apb_penable
  m_apb_pwrite,    // output wire m_axi_pwrite
  m_apb_pwdata,    // output wire [31 : 0] m_axi_pwdata
  m_apb_pready,    // input wire [0 : 0] m_axi_pready
  m_apb_prdata,    // input wire [31 : 0] m_axi_prdata
  m_apb_pslverr  // input wire [0 : 0] m_axi_pslverr
    );


input s_axi_aclk;        // input wire s_axi_aclk
  input s_axi_aresetn;  // input wire s_axi_aresetn
  input[31:0] s_axi_awaddr;    // input wire [31 : 0] s_axi_awaddr
  input s_axi_awvalid;  // input wire s_axi_awvalid
  output s_axi_awready;  // output wire s_axi_awready
  input[31:0] s_axi_wdata;      // input wire [31 : 0] s_axi_wdata
  input s_axi_wvalid;    // input wire s_axi_wvalid
  output s_axi_wready;    // output wire s_axi_wready
  output[1:0] s_axi_bresp;      // output wire [1 : 0] s_axi_bresp
  output s_axi_bvalid;    // output wire s_axi_bvalid
  input s_axi_bready;    // input wire s_axi_bready
   input [31:0]s_axi_araddr;    // input wire [31 : 0] s_axi_araddr
  input s_axi_arvalid;  // input wire s_axi_arvalid
  output s_axi_arready;  // output wire s_axi_arready
  output[31:0] s_axi_rdata;      // output wire [31 : 0] s_axi_rdata
  output[1:0] s_axi_rresp;      // output wire [1 : 0] s_axi_rresp
  output s_axi_rvalid;    // output wire s_axi_rvalid
  input s_axi_rready;    // input wire s_axi_rready
  
  output[31:0] m_apb_paddr;      // output wire [31 : 0] m_axi_paddr
  output[0:0] m_apb_psel;        // output wire [0 : 0] m_axi_psel
  output m_apb_penable;  // output wire m_axi_penable
output   m_apb_pwrite;    // output wire m_axi_pwrite
  output[31:0] m_apb_pwdata;    // output wire [31 : 0] m_axi_pwdata
 input[0:0] m_apb_pready;    // input wire [0 : 0] m_axi_pready
    input [31:0] m_apb_prdata;    // input wire [31 : 0] m_axi_prdata
 input[0:0] m_apb_pslverr;  // input wire [0 : 0] m_axi_pslverr
 


axi_apb_bridge_0 axi_apb_bridge (
  .s_axi_aclk(s_axi_aclk),        // input wire s_axi_aclk
  .s_axi_aresetn(s_axi_aresetn),  // input wire s_axi_aresetn
  .s_axi_awaddr(s_axi_awaddr),    // input wire [31 : 0] s_axi_awaddr
  .s_axi_awvalid(s_axi_awvalid),  // input wire s_axi_awvalid
  .s_axi_awready(s_axi_awready),  // output wire s_axi_awready
  .s_axi_wdata(s_axi_wdata),      // input wire [31 : 0] s_axi_wdata
  .s_axi_wvalid(s_axi_wvalid),    // input wire s_axi_wvalid
  .s_axi_wready(s_axi_wready),    // output wire s_axi_wready
  .s_axi_bresp(s_axi_bresp),      // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid(s_axi_bvalid),    // output wire s_axi_bvalid
  .s_axi_bready(s_axi_bready),    // input wire s_axi_bready
  .s_axi_araddr(s_axi_araddr),    // input wire [31 : 0] s_axi_araddr
  .s_axi_arvalid(s_axi_arvalid),  // input wire s_axi_arvalid
  .s_axi_arready(s_axi_arready),  // output wire s_axi_arready
  .s_axi_rdata(s_axi_rdata),      // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp(s_axi_rresp),      // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid(s_axi_rvalid),    // output wire s_axi_rvalid
  .s_axi_rready(s_axi_rready),    // input wire s_axi_rready
  .m_axi_paddr(m_apb_paddr),      // output wire [31 : 0] m_axi_paddr
  .m_axi_psel(m_apb_psel),        // output wire [0 : 0] m_axi_psel
  .m_axi_penable(m_apb_penable),  // output wire m_axi_penable
  .m_axi_pwrite(m_apb_pwrite),    // output wire m_axi_pwrite
  .m_axi_pwdata(m_apb_pwdata),    // output wire [31 : 0] m_axi_pwdata
  .m_axi_pready(m_apb_pready),    // input wire [0 : 0] m_axi_pready
  .m_axi_prdata(m_apb_prdata),    // input wire [31 : 0] m_axi_prdata
  .m_axi_pslverr(m_apb_pslverr)  // input wire [0 : 0] m_axi_pslverr
);
endmodule