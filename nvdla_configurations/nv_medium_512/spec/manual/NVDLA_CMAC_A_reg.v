//   Ordt 171103.01 autogenerated file 
//   Input: NVDLA_CMAC_A.rdl
//   Parms: opendla.parms
//   Date: Sat Feb 01 17:43:20 CET 2020
//

//
//---------- module addrmap_NVDLA_jrdl_logic
//
module addrmap_NVDLA_jrdl_logic
(
  clk,
  reset,
  d2l_NVDLA_CMAC_A_S_STATUS_w,
  d2l_NVDLA_CMAC_A_S_STATUS_we,
  d2l_NVDLA_CMAC_A_S_STATUS_re,
  d2l_NVDLA_CMAC_A_S_POINTER_w,
  d2l_NVDLA_CMAC_A_S_POINTER_we,
  d2l_NVDLA_CMAC_A_S_POINTER_re,
  d2l_NVDLA_CMAC_A_D_OP_ENABLE_w,
  d2l_NVDLA_CMAC_A_D_OP_ENABLE_we,
  d2l_NVDLA_CMAC_A_D_OP_ENABLE_re,
  d2l_NVDLA_CMAC_A_D_MISC_CFG_w,
  d2l_NVDLA_CMAC_A_D_MISC_CFG_we,
  d2l_NVDLA_CMAC_A_D_MISC_CFG_re,
  h2l_NVDLA_CMAC_A_S_STATUS_STATUS_0_w,
  h2l_NVDLA_CMAC_A_S_STATUS_STATUS_1_w,
  h2l_NVDLA_CMAC_A_S_POINTER_CONSUMER_w,

  l2d_NVDLA_CMAC_A_S_STATUS_r,
  l2d_NVDLA_CMAC_A_S_POINTER_r,
  l2d_NVDLA_CMAC_A_D_OP_ENABLE_r,
  l2d_NVDLA_CMAC_A_D_MISC_CFG_r,
  l2h_NVDLA_CMAC_A_S_POINTER_PRODUCER_r,
  l2h_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN_r,
  l2h_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE_r,
  l2h_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION_r );

  //------- inputs
  input    clk;
  input    reset;
  input     [31:0] d2l_NVDLA_CMAC_A_S_STATUS_w;
  input    d2l_NVDLA_CMAC_A_S_STATUS_we;
  input    d2l_NVDLA_CMAC_A_S_STATUS_re;
  input     [31:0] d2l_NVDLA_CMAC_A_S_POINTER_w;
  input    d2l_NVDLA_CMAC_A_S_POINTER_we;
  input    d2l_NVDLA_CMAC_A_S_POINTER_re;
  input     [31:0] d2l_NVDLA_CMAC_A_D_OP_ENABLE_w;
  input    d2l_NVDLA_CMAC_A_D_OP_ENABLE_we;
  input    d2l_NVDLA_CMAC_A_D_OP_ENABLE_re;
  input     [31:0] d2l_NVDLA_CMAC_A_D_MISC_CFG_w;
  input    d2l_NVDLA_CMAC_A_D_MISC_CFG_we;
  input    d2l_NVDLA_CMAC_A_D_MISC_CFG_re;
  input     [1:0] h2l_NVDLA_CMAC_A_S_STATUS_STATUS_0_w;
  input     [1:0] h2l_NVDLA_CMAC_A_S_STATUS_STATUS_1_w;
  input    h2l_NVDLA_CMAC_A_S_POINTER_CONSUMER_w;

  //------- outputs
  output     [31:0] l2d_NVDLA_CMAC_A_S_STATUS_r;
  output     [31:0] l2d_NVDLA_CMAC_A_S_POINTER_r;
  output     [31:0] l2d_NVDLA_CMAC_A_D_OP_ENABLE_r;
  output     [31:0] l2d_NVDLA_CMAC_A_D_MISC_CFG_r;
  output    l2h_NVDLA_CMAC_A_S_POINTER_PRODUCER_r;
  output    l2h_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN_r;
  output    l2h_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE_r;
  output     [1:0] l2h_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION_r;


  //------- reg defines
  reg   [1:0] rg_NVDLA_CMAC_A_S_STATUS_STATUS_0;
  reg   [1:0] rg_NVDLA_CMAC_A_S_STATUS_STATUS_1;
  reg   [31:0] l2d_NVDLA_CMAC_A_S_STATUS_r;
  reg  rg_NVDLA_CMAC_A_S_POINTER_PRODUCER;
  reg  reg_NVDLA_CMAC_A_S_POINTER_PRODUCER_next;
  reg  l2h_NVDLA_CMAC_A_S_POINTER_PRODUCER_r;
  reg  rg_NVDLA_CMAC_A_S_POINTER_CONSUMER;
  reg   [31:0] l2d_NVDLA_CMAC_A_S_POINTER_r;
  reg  rg_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN;
  reg  reg_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN_next;
  reg  l2h_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN_r;
  reg   [31:0] l2d_NVDLA_CMAC_A_D_OP_ENABLE_r;
  reg  rg_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE;
  reg  reg_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE_next;
  reg  l2h_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE_r;
  reg   [1:0] rg_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION;
  reg   [1:0] reg_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION_next;
  reg   [1:0] l2h_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION_r;
  reg   [31:0] l2d_NVDLA_CMAC_A_D_MISC_CFG_r;
  
  
  //------- combinatorial assigns for NVDLA_CMAC_A_D_OP_ENABLE
  always @ (*) begin
    reg_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN_next = rg_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN;
    l2h_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN_r = rg_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN;
    if (d2l_NVDLA_CMAC_A_D_OP_ENABLE_we) reg_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN_next = d2l_NVDLA_CMAC_A_D_OP_ENABLE_w [0] ;
  end
  
  //------- reg assigns for NVDLA_CMAC_A_D_OP_ENABLE
  always @ (posedge clk) begin
    if (reset) begin
      rg_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN <= #1 1'h0;
    end
    else begin
      rg_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN <= #1  reg_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN_next;
    end
  end
  
  //------- combinatorial assigns for NVDLA_CMAC_A_D_MISC_CFG (pio read data)
  always @ (*) begin
    l2d_NVDLA_CMAC_A_D_MISC_CFG_r = 32'b0;
    l2d_NVDLA_CMAC_A_D_MISC_CFG_r [0]  = rg_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE;
    l2d_NVDLA_CMAC_A_D_MISC_CFG_r [13:12]  = rg_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION;
  end
  
  //------- combinatorial assigns for NVDLA_CMAC_A_S_POINTER
  always @ (*) begin
    reg_NVDLA_CMAC_A_S_POINTER_PRODUCER_next = rg_NVDLA_CMAC_A_S_POINTER_PRODUCER;
    l2h_NVDLA_CMAC_A_S_POINTER_PRODUCER_r = rg_NVDLA_CMAC_A_S_POINTER_PRODUCER;
    rg_NVDLA_CMAC_A_S_POINTER_CONSUMER =  h2l_NVDLA_CMAC_A_S_POINTER_CONSUMER_w;
    if (d2l_NVDLA_CMAC_A_S_POINTER_we) reg_NVDLA_CMAC_A_S_POINTER_PRODUCER_next = d2l_NVDLA_CMAC_A_S_POINTER_w [0] ;
  end
  
  //------- reg assigns for NVDLA_CMAC_A_S_POINTER
  always @ (posedge clk) begin
    if (reset) begin
      rg_NVDLA_CMAC_A_S_POINTER_PRODUCER <= #1 1'h0;
    end
    else begin
      rg_NVDLA_CMAC_A_S_POINTER_PRODUCER <= #1  reg_NVDLA_CMAC_A_S_POINTER_PRODUCER_next;
    end
  end
  
  //------- combinatorial assigns for NVDLA_CMAC_A_S_STATUS
  always @ (*) begin
    rg_NVDLA_CMAC_A_S_STATUS_STATUS_0 =  h2l_NVDLA_CMAC_A_S_STATUS_STATUS_0_w;
    rg_NVDLA_CMAC_A_S_STATUS_STATUS_1 =  h2l_NVDLA_CMAC_A_S_STATUS_STATUS_1_w;
  end
  
  //------- combinatorial assigns for NVDLA_CMAC_A_D_OP_ENABLE (pio read data)
  always @ (*) begin
    l2d_NVDLA_CMAC_A_D_OP_ENABLE_r = 32'b0;
    l2d_NVDLA_CMAC_A_D_OP_ENABLE_r [0]  = rg_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN;
  end
  
  //------- combinatorial assigns for NVDLA_CMAC_A_D_MISC_CFG
  always @ (*) begin
    reg_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE_next = rg_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE;
    l2h_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE_r = rg_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE;
    reg_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION_next = rg_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION;
    l2h_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION_r = rg_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION;
    if (d2l_NVDLA_CMAC_A_D_MISC_CFG_we) reg_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE_next = d2l_NVDLA_CMAC_A_D_MISC_CFG_w [0] ;
    if (d2l_NVDLA_CMAC_A_D_MISC_CFG_we) reg_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION_next = d2l_NVDLA_CMAC_A_D_MISC_CFG_w [13:12] ;
  end
  
  //------- reg assigns for NVDLA_CMAC_A_D_MISC_CFG
  always @ (posedge clk) begin
    if (reset) begin
      rg_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE <= #1 1'h0;
      rg_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION <= #1 2'h1;
    end
    else begin
      rg_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE <= #1  reg_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE_next;
      rg_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION <= #1  reg_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION_next;
    end
  end
  
  //------- combinatorial assigns for NVDLA_CMAC_A_S_POINTER (pio read data)
  always @ (*) begin
    l2d_NVDLA_CMAC_A_S_POINTER_r = 32'b0;
    l2d_NVDLA_CMAC_A_S_POINTER_r [0]  = rg_NVDLA_CMAC_A_S_POINTER_PRODUCER;
    l2d_NVDLA_CMAC_A_S_POINTER_r [16]  = rg_NVDLA_CMAC_A_S_POINTER_CONSUMER;
  end
  
  //------- combinatorial assigns for NVDLA_CMAC_A_S_STATUS (pio read data)
  always @ (*) begin
    l2d_NVDLA_CMAC_A_S_STATUS_r = 32'b0;
    l2d_NVDLA_CMAC_A_S_STATUS_r [1:0]  = rg_NVDLA_CMAC_A_S_STATUS_STATUS_0;
    l2d_NVDLA_CMAC_A_S_STATUS_r [17:16]  = rg_NVDLA_CMAC_A_S_STATUS_STATUS_1;
  end
  
endmodule

//
//---------- module addrmap_NVDLA_jrdl_decode
//
module addrmap_NVDLA_jrdl_decode
(
  clk,
  reset,
  leaf_dec_wr_data,
  leaf_dec_addr,
  leaf_dec_block_sel,
  leaf_dec_valid,
  leaf_dec_wr_dvld,
  leaf_dec_cycle,
  leaf_dec_wr_width,
  l2d_NVDLA_CMAC_A_S_STATUS_r,
  l2d_NVDLA_CMAC_A_S_POINTER_r,
  l2d_NVDLA_CMAC_A_D_OP_ENABLE_r,
  l2d_NVDLA_CMAC_A_D_MISC_CFG_r,

  dec_leaf_rd_data,
  dec_leaf_ack,
  dec_leaf_nack,
  dec_leaf_accept,
  dec_leaf_reject,
  dec_leaf_retry_atomic,
  dec_leaf_data_width,
  d2l_NVDLA_CMAC_A_S_STATUS_w,
  d2l_NVDLA_CMAC_A_S_STATUS_we,
  d2l_NVDLA_CMAC_A_S_STATUS_re,
  d2l_NVDLA_CMAC_A_S_POINTER_w,
  d2l_NVDLA_CMAC_A_S_POINTER_we,
  d2l_NVDLA_CMAC_A_S_POINTER_re,
  d2l_NVDLA_CMAC_A_D_OP_ENABLE_w,
  d2l_NVDLA_CMAC_A_D_OP_ENABLE_we,
  d2l_NVDLA_CMAC_A_D_OP_ENABLE_re,
  d2l_NVDLA_CMAC_A_D_MISC_CFG_w,
  d2l_NVDLA_CMAC_A_D_MISC_CFG_we,
  d2l_NVDLA_CMAC_A_D_MISC_CFG_re );

  //------- inputs
  input    clk;
  input    reset;
  input     [31:0] leaf_dec_wr_data;
  input     [39:0] leaf_dec_addr;
  input    leaf_dec_block_sel;
  input    leaf_dec_valid;
  input    leaf_dec_wr_dvld;
  input     [1:0] leaf_dec_cycle;
  input     [2:0] leaf_dec_wr_width;
  input     [31:0] l2d_NVDLA_CMAC_A_S_STATUS_r;
  input     [31:0] l2d_NVDLA_CMAC_A_S_POINTER_r;
  input     [31:0] l2d_NVDLA_CMAC_A_D_OP_ENABLE_r;
  input     [31:0] l2d_NVDLA_CMAC_A_D_MISC_CFG_r;

  //------- outputs
  output     [31:0] dec_leaf_rd_data;
  output    dec_leaf_ack;
  output    dec_leaf_nack;
  output    dec_leaf_accept;
  output    dec_leaf_reject;
  output    dec_leaf_retry_atomic;
  output     [2:0] dec_leaf_data_width;
  output     [31:0] d2l_NVDLA_CMAC_A_S_STATUS_w;
  output    d2l_NVDLA_CMAC_A_S_STATUS_we;
  output    d2l_NVDLA_CMAC_A_S_STATUS_re;
  output     [31:0] d2l_NVDLA_CMAC_A_S_POINTER_w;
  output    d2l_NVDLA_CMAC_A_S_POINTER_we;
  output    d2l_NVDLA_CMAC_A_S_POINTER_re;
  output     [31:0] d2l_NVDLA_CMAC_A_D_OP_ENABLE_w;
  output    d2l_NVDLA_CMAC_A_D_OP_ENABLE_we;
  output    d2l_NVDLA_CMAC_A_D_OP_ENABLE_re;
  output     [31:0] d2l_NVDLA_CMAC_A_D_MISC_CFG_w;
  output    d2l_NVDLA_CMAC_A_D_MISC_CFG_we;
  output    d2l_NVDLA_CMAC_A_D_MISC_CFG_re;


  //------- wire defines
  wire   [31:0] pio_dec_write_data;
  wire   [14:2] pio_dec_address;
  wire  pio_dec_read;
  wire  pio_dec_write;
  wire   [39:0] block_sel_addr;
  wire  block_sel;
  wire  leaf_dec_valid_active;
  wire  leaf_dec_wr_dvld_active;
  
  //------- reg defines
  reg   [31:0] d2l_NVDLA_CMAC_A_S_STATUS_w;
  reg  d2l_NVDLA_CMAC_A_S_STATUS_we;
  reg  d2l_NVDLA_CMAC_A_S_STATUS_re;
  reg   [31:0] d2l_NVDLA_CMAC_A_S_POINTER_w;
  reg  d2l_NVDLA_CMAC_A_S_POINTER_we;
  reg  d2l_NVDLA_CMAC_A_S_POINTER_re;
  reg   [31:0] d2l_NVDLA_CMAC_A_D_OP_ENABLE_w;
  reg  d2l_NVDLA_CMAC_A_D_OP_ENABLE_we;
  reg  d2l_NVDLA_CMAC_A_D_OP_ENABLE_re;
  reg   [31:0] d2l_NVDLA_CMAC_A_D_MISC_CFG_w;
  reg  d2l_NVDLA_CMAC_A_D_MISC_CFG_we;
  reg  d2l_NVDLA_CMAC_A_D_MISC_CFG_re;
  reg  leaf_dec_valid_hld1;
  reg  leaf_dec_valid_hld1_next;
  reg  leaf_dec_wr_dvld_hld1;
  reg  leaf_dec_wr_dvld_hld1_next;
  reg  pio_write_active;
  reg  pio_read_active;
  reg   [14:2] pio_dec_address_d1;
  reg   [31:0] pio_dec_write_data_d1;
  reg   [31:0] dec_pio_read_data;
  reg   [31:0] dec_pio_read_data_d1;
  reg  dec_pio_ack;
  reg  dec_pio_nack;
  reg  dec_pio_ack_next;
  reg  dec_pio_nack_next;
  reg  pio_internal_ack;
  reg  pio_internal_nack;
  reg  pio_external_ack;
  reg  pio_external_nack;
  reg  pio_external_ack_next;
  reg  pio_external_nack_next;
  reg  pio_no_acks;
  reg  pio_activate_write;
  reg  pio_activate_read;
  reg   [31:0] dec_pio_read_data_next;
  reg  external_transaction_active;
  
  
  //------- assigns
  assign  pio_dec_write_data = leaf_dec_wr_data;
  assign  dec_leaf_rd_data = dec_pio_read_data;
  assign  dec_leaf_ack = dec_pio_ack;
  assign  dec_leaf_nack = dec_pio_nack;
  assign  pio_dec_address = leaf_dec_addr [14:2] ;
  assign  block_sel_addr = 40'h0;
  assign  block_sel = leaf_dec_block_sel;
  assign  leaf_dec_wr_dvld_active = leaf_dec_wr_dvld | leaf_dec_wr_dvld_hld1;
  assign  leaf_dec_valid_active = leaf_dec_valid | leaf_dec_valid_hld1;
  assign  dec_leaf_accept = leaf_dec_valid & block_sel;
  assign  dec_leaf_reject = leaf_dec_valid & ~block_sel;
  assign  pio_dec_read = block_sel & leaf_dec_valid_active & (leaf_dec_cycle == 2'b10);
  assign  pio_dec_write = block_sel & leaf_dec_wr_dvld_active & (leaf_dec_cycle[1] == 1'b0);
  assign  dec_leaf_retry_atomic = 1'b0;
  assign  dec_leaf_data_width = 3'b0;
  
  //------- combinatorial assigns for pio read data
  always @ (*) begin
    dec_pio_read_data = dec_pio_read_data_d1;
  end
  
  //------- reg assigns for pio read data
  always @ (posedge clk) begin
    if (reset) begin
      dec_pio_read_data_d1 <= #1  32'b0;
    end
    else begin
      dec_pio_read_data_d1 <= #1 dec_pio_read_data_next;
    end
  end
  
  //------- reg assigns for pio i/f
  always @ (posedge clk) begin
    if (reset) begin
      pio_write_active <= #1  1'b0;
      pio_read_active <= #1  1'b0;
    end
    else begin
      pio_write_active <= #1  pio_write_active ? pio_no_acks : pio_activate_write;
      pio_read_active <= #1  pio_read_active ? pio_no_acks : pio_activate_read;
      pio_dec_address_d1 <= #1   pio_dec_address;
      pio_dec_write_data_d1 <= #1  pio_dec_write_data;
    end
  end
  
  //------- combinatorial assigns for leaf i/f
  always @ (*) begin
    leaf_dec_valid_hld1_next = leaf_dec_valid | leaf_dec_valid_hld1;
    if (dec_pio_ack_next | dec_pio_nack_next) leaf_dec_valid_hld1_next = 1'b0;
    leaf_dec_wr_dvld_hld1_next = leaf_dec_wr_dvld | leaf_dec_wr_dvld_hld1;
    if (dec_pio_ack_next | dec_pio_nack_next | leaf_dec_valid) leaf_dec_wr_dvld_hld1_next = 1'b0;
  end
  
  //------- reg assigns for leaf i/f
  always @ (posedge clk) begin
    if (reset) begin
      leaf_dec_valid_hld1 <= #1  1'b0;
      leaf_dec_wr_dvld_hld1 <= #1  1'b0;
    end
    else begin
      leaf_dec_valid_hld1 <= #1 leaf_dec_valid_hld1_next;
      leaf_dec_wr_dvld_hld1 <= #1 leaf_dec_wr_dvld_hld1_next;
    end
  end
  
  //------- combinatorial assigns for pio ack/nack
  always @ (*) begin
    pio_internal_nack = (pio_read_active | pio_write_active) & ~pio_internal_ack & ~external_transaction_active;
    dec_pio_ack_next = (pio_internal_ack | (pio_external_ack_next & external_transaction_active));
    dec_pio_nack_next = (pio_internal_nack | (pio_external_nack_next & external_transaction_active));
    pio_no_acks = ~(dec_pio_ack | dec_pio_nack | pio_external_ack | pio_external_nack);
    pio_activate_write = (pio_dec_write & ~(dec_pio_ack | dec_pio_nack));
    pio_activate_read = (pio_dec_read & ~(dec_pio_ack | dec_pio_nack));
  end
  
  //------- reg assigns for pio ack/nack
  always @ (posedge clk) begin
    if (reset) begin
      dec_pio_ack <= #1 1'b0;
      dec_pio_nack <= #1 1'b0;
      pio_external_ack <= #1  1'b0;
      pio_external_nack <= #1  1'b0;
    end
    else begin
      dec_pio_ack <= #1 dec_pio_ack ? 1'b0 : dec_pio_ack_next;
      dec_pio_nack <= #1 dec_pio_nack ? 1'b0 : dec_pio_nack_next;
      pio_external_ack <= #1 pio_external_ack_next;
      pio_external_nack <= #1 pio_external_nack_next;
    end
  end
  
  
  //------- address decode
  always @ (*) begin
    pio_internal_ack = 1'b0;
    external_transaction_active = 1'b0;
    pio_external_ack_next = 1'b0;
    pio_external_nack_next = 1'b0;
    dec_pio_read_data_next = 32'b0;
    
    d2l_NVDLA_CMAC_A_S_STATUS_w = pio_dec_write_data_d1  [31:0] ;
    d2l_NVDLA_CMAC_A_S_STATUS_we = 1'b0;
    d2l_NVDLA_CMAC_A_S_STATUS_re = 1'b0;
    d2l_NVDLA_CMAC_A_S_POINTER_w = pio_dec_write_data_d1  [31:0] ;
    d2l_NVDLA_CMAC_A_S_POINTER_we = 1'b0;
    d2l_NVDLA_CMAC_A_S_POINTER_re = 1'b0;
    d2l_NVDLA_CMAC_A_D_OP_ENABLE_w = pio_dec_write_data_d1  [31:0] ;
    d2l_NVDLA_CMAC_A_D_OP_ENABLE_we = 1'b0;
    d2l_NVDLA_CMAC_A_D_OP_ENABLE_re = 1'b0;
    d2l_NVDLA_CMAC_A_D_MISC_CFG_w = pio_dec_write_data_d1  [31:0] ;
    d2l_NVDLA_CMAC_A_D_MISC_CFG_we = 1'b0;
    d2l_NVDLA_CMAC_A_D_MISC_CFG_re = 1'b0;
    
    casez(pio_dec_address_d1)
    //  Register: NVDLA_CMAC_A.S_STATUS     Address: 0x5000     External: false
    13'b1010000000000:
      begin
        d2l_NVDLA_CMAC_A_S_STATUS_we = pio_write_active & ~dec_pio_ack;
        d2l_NVDLA_CMAC_A_S_STATUS_re = pio_read_active & ~dec_pio_ack;
        pio_internal_ack =  pio_read_active;
        dec_pio_read_data_next  [31:0]  = l2d_NVDLA_CMAC_A_S_STATUS_r;
      end
    //  Register: NVDLA_CMAC_A.S_POINTER     Address: 0x5004     External: false
    13'b1010000000001:
      begin
        d2l_NVDLA_CMAC_A_S_POINTER_we = pio_write_active & ~dec_pio_ack;
        d2l_NVDLA_CMAC_A_S_POINTER_re = pio_read_active & ~dec_pio_ack;
        pio_internal_ack =  pio_read_active | pio_write_active;
        dec_pio_read_data_next  [31:0]  = l2d_NVDLA_CMAC_A_S_POINTER_r;
      end
    //  Register: NVDLA_CMAC_A.D_OP_ENABLE     Address: 0x5008     External: false
    13'b1010000000010:
      begin
        d2l_NVDLA_CMAC_A_D_OP_ENABLE_we = pio_write_active & ~dec_pio_ack;
        d2l_NVDLA_CMAC_A_D_OP_ENABLE_re = pio_read_active & ~dec_pio_ack;
        pio_internal_ack =  pio_read_active | pio_write_active;
        dec_pio_read_data_next  [31:0]  = l2d_NVDLA_CMAC_A_D_OP_ENABLE_r;
      end
    //  Register: NVDLA_CMAC_A.D_MISC_CFG     Address: 0x500c     External: false
    13'b1010000000011:
      begin
        d2l_NVDLA_CMAC_A_D_MISC_CFG_we = pio_write_active & ~dec_pio_ack;
        d2l_NVDLA_CMAC_A_D_MISC_CFG_re = pio_read_active & ~dec_pio_ack;
        pio_internal_ack =  pio_read_active | pio_write_active;
        dec_pio_read_data_next  [31:0]  = l2d_NVDLA_CMAC_A_D_MISC_CFG_r;
      end
    endcase
  end
  
endmodule

//
//---------- module addrmap_NVDLA_pio
//
module addrmap_NVDLA_pio
(
  clk,
  reset,
  h2l_NVDLA_CMAC_A_S_STATUS_STATUS_0_w,
  h2l_NVDLA_CMAC_A_S_STATUS_STATUS_1_w,
  h2l_NVDLA_CMAC_A_S_POINTER_CONSUMER_w,
  leaf_dec_wr_data,
  leaf_dec_addr,
  leaf_dec_block_sel,
  leaf_dec_valid,
  leaf_dec_wr_dvld,
  leaf_dec_cycle,
  leaf_dec_wr_width,

  l2h_NVDLA_CMAC_A_S_POINTER_PRODUCER_r,
  l2h_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN_r,
  l2h_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE_r,
  l2h_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION_r,
  dec_leaf_rd_data,
  dec_leaf_ack,
  dec_leaf_nack,
  dec_leaf_accept,
  dec_leaf_reject,
  dec_leaf_retry_atomic,
  dec_leaf_data_width );

  //------- inputs
  input    clk;
  input    reset;
  input     [1:0] h2l_NVDLA_CMAC_A_S_STATUS_STATUS_0_w;
  input     [1:0] h2l_NVDLA_CMAC_A_S_STATUS_STATUS_1_w;
  input    h2l_NVDLA_CMAC_A_S_POINTER_CONSUMER_w;
  input     [31:0] leaf_dec_wr_data;
  input     [39:0] leaf_dec_addr;
  input    leaf_dec_block_sel;
  input    leaf_dec_valid;
  input    leaf_dec_wr_dvld;
  input     [1:0] leaf_dec_cycle;
  input     [2:0] leaf_dec_wr_width;

  //------- outputs
  output    l2h_NVDLA_CMAC_A_S_POINTER_PRODUCER_r;
  output    l2h_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN_r;
  output    l2h_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE_r;
  output     [1:0] l2h_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION_r;
  output     [31:0] dec_leaf_rd_data;
  output    dec_leaf_ack;
  output    dec_leaf_nack;
  output    dec_leaf_accept;
  output    dec_leaf_reject;
  output    dec_leaf_retry_atomic;
  output     [2:0] dec_leaf_data_width;


  //------- wire defines
  wire   [31:0] d2l_NVDLA_CMAC_A_S_STATUS_w;
  wire  d2l_NVDLA_CMAC_A_S_STATUS_we;
  wire  d2l_NVDLA_CMAC_A_S_STATUS_re;
  wire   [31:0] d2l_NVDLA_CMAC_A_S_POINTER_w;
  wire  d2l_NVDLA_CMAC_A_S_POINTER_we;
  wire  d2l_NVDLA_CMAC_A_S_POINTER_re;
  wire   [31:0] d2l_NVDLA_CMAC_A_D_OP_ENABLE_w;
  wire  d2l_NVDLA_CMAC_A_D_OP_ENABLE_we;
  wire  d2l_NVDLA_CMAC_A_D_OP_ENABLE_re;
  wire   [31:0] d2l_NVDLA_CMAC_A_D_MISC_CFG_w;
  wire  d2l_NVDLA_CMAC_A_D_MISC_CFG_we;
  wire  d2l_NVDLA_CMAC_A_D_MISC_CFG_re;
  wire   [31:0] l2d_NVDLA_CMAC_A_S_STATUS_r;
  wire   [31:0] l2d_NVDLA_CMAC_A_S_POINTER_r;
  wire   [31:0] l2d_NVDLA_CMAC_A_D_OP_ENABLE_r;
  wire   [31:0] l2d_NVDLA_CMAC_A_D_MISC_CFG_r;
  
  
  addrmap_NVDLA_jrdl_decode pio_decode (
    .clk(clk),
    .reset(reset),
    .leaf_dec_wr_data(leaf_dec_wr_data),
    .leaf_dec_addr(leaf_dec_addr),
    .leaf_dec_block_sel(leaf_dec_block_sel),
    .leaf_dec_valid(leaf_dec_valid),
    .leaf_dec_wr_dvld(leaf_dec_wr_dvld),
    .leaf_dec_cycle(leaf_dec_cycle),
    .leaf_dec_wr_width(leaf_dec_wr_width),
    .l2d_NVDLA_CMAC_A_S_STATUS_r(l2d_NVDLA_CMAC_A_S_STATUS_r),
    .l2d_NVDLA_CMAC_A_S_POINTER_r(l2d_NVDLA_CMAC_A_S_POINTER_r),
    .l2d_NVDLA_CMAC_A_D_OP_ENABLE_r(l2d_NVDLA_CMAC_A_D_OP_ENABLE_r),
    .l2d_NVDLA_CMAC_A_D_MISC_CFG_r(l2d_NVDLA_CMAC_A_D_MISC_CFG_r),
    .dec_leaf_rd_data(dec_leaf_rd_data),
    .dec_leaf_ack(dec_leaf_ack),
    .dec_leaf_nack(dec_leaf_nack),
    .dec_leaf_accept(dec_leaf_accept),
    .dec_leaf_reject(dec_leaf_reject),
    .dec_leaf_retry_atomic(dec_leaf_retry_atomic),
    .dec_leaf_data_width(dec_leaf_data_width),
    .d2l_NVDLA_CMAC_A_S_STATUS_w(d2l_NVDLA_CMAC_A_S_STATUS_w),
    .d2l_NVDLA_CMAC_A_S_STATUS_we(d2l_NVDLA_CMAC_A_S_STATUS_we),
    .d2l_NVDLA_CMAC_A_S_STATUS_re(d2l_NVDLA_CMAC_A_S_STATUS_re),
    .d2l_NVDLA_CMAC_A_S_POINTER_w(d2l_NVDLA_CMAC_A_S_POINTER_w),
    .d2l_NVDLA_CMAC_A_S_POINTER_we(d2l_NVDLA_CMAC_A_S_POINTER_we),
    .d2l_NVDLA_CMAC_A_S_POINTER_re(d2l_NVDLA_CMAC_A_S_POINTER_re),
    .d2l_NVDLA_CMAC_A_D_OP_ENABLE_w(d2l_NVDLA_CMAC_A_D_OP_ENABLE_w),
    .d2l_NVDLA_CMAC_A_D_OP_ENABLE_we(d2l_NVDLA_CMAC_A_D_OP_ENABLE_we),
    .d2l_NVDLA_CMAC_A_D_OP_ENABLE_re(d2l_NVDLA_CMAC_A_D_OP_ENABLE_re),
    .d2l_NVDLA_CMAC_A_D_MISC_CFG_w(d2l_NVDLA_CMAC_A_D_MISC_CFG_w),
    .d2l_NVDLA_CMAC_A_D_MISC_CFG_we(d2l_NVDLA_CMAC_A_D_MISC_CFG_we),
    .d2l_NVDLA_CMAC_A_D_MISC_CFG_re(d2l_NVDLA_CMAC_A_D_MISC_CFG_re) );
    
  addrmap_NVDLA_jrdl_logic pio_logic (
    .clk(clk),
    .reset(reset),
    .d2l_NVDLA_CMAC_A_S_STATUS_w(d2l_NVDLA_CMAC_A_S_STATUS_w),
    .d2l_NVDLA_CMAC_A_S_STATUS_we(d2l_NVDLA_CMAC_A_S_STATUS_we),
    .d2l_NVDLA_CMAC_A_S_STATUS_re(d2l_NVDLA_CMAC_A_S_STATUS_re),
    .d2l_NVDLA_CMAC_A_S_POINTER_w(d2l_NVDLA_CMAC_A_S_POINTER_w),
    .d2l_NVDLA_CMAC_A_S_POINTER_we(d2l_NVDLA_CMAC_A_S_POINTER_we),
    .d2l_NVDLA_CMAC_A_S_POINTER_re(d2l_NVDLA_CMAC_A_S_POINTER_re),
    .d2l_NVDLA_CMAC_A_D_OP_ENABLE_w(d2l_NVDLA_CMAC_A_D_OP_ENABLE_w),
    .d2l_NVDLA_CMAC_A_D_OP_ENABLE_we(d2l_NVDLA_CMAC_A_D_OP_ENABLE_we),
    .d2l_NVDLA_CMAC_A_D_OP_ENABLE_re(d2l_NVDLA_CMAC_A_D_OP_ENABLE_re),
    .d2l_NVDLA_CMAC_A_D_MISC_CFG_w(d2l_NVDLA_CMAC_A_D_MISC_CFG_w),
    .d2l_NVDLA_CMAC_A_D_MISC_CFG_we(d2l_NVDLA_CMAC_A_D_MISC_CFG_we),
    .d2l_NVDLA_CMAC_A_D_MISC_CFG_re(d2l_NVDLA_CMAC_A_D_MISC_CFG_re),
    .h2l_NVDLA_CMAC_A_S_STATUS_STATUS_0_w(h2l_NVDLA_CMAC_A_S_STATUS_STATUS_0_w),
    .h2l_NVDLA_CMAC_A_S_STATUS_STATUS_1_w(h2l_NVDLA_CMAC_A_S_STATUS_STATUS_1_w),
    .h2l_NVDLA_CMAC_A_S_POINTER_CONSUMER_w(h2l_NVDLA_CMAC_A_S_POINTER_CONSUMER_w),
    .l2d_NVDLA_CMAC_A_S_STATUS_r(l2d_NVDLA_CMAC_A_S_STATUS_r),
    .l2d_NVDLA_CMAC_A_S_POINTER_r(l2d_NVDLA_CMAC_A_S_POINTER_r),
    .l2d_NVDLA_CMAC_A_D_OP_ENABLE_r(l2d_NVDLA_CMAC_A_D_OP_ENABLE_r),
    .l2d_NVDLA_CMAC_A_D_MISC_CFG_r(l2d_NVDLA_CMAC_A_D_MISC_CFG_r),
    .l2h_NVDLA_CMAC_A_S_POINTER_PRODUCER_r(l2h_NVDLA_CMAC_A_S_POINTER_PRODUCER_r),
    .l2h_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN_r(l2h_NVDLA_CMAC_A_D_OP_ENABLE_OP_EN_r),
    .l2h_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE_r(l2h_NVDLA_CMAC_A_D_MISC_CFG_CONV_MODE_r),
    .l2h_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION_r(l2h_NVDLA_CMAC_A_D_MISC_CFG_PROC_PRECISION_r) );
    
endmodule

