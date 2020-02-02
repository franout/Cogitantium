`ifdef INC_nvdla_dma_rd_rsp_structs_SVH
`else
`define INC_nvdla_dma_rd_rsp_structs_SVH

`ifndef SV_STRUCT_DEFINED_DMA_READ_RSP
`define SV_STRUCT_DEFINED_DMA_READ_RSP
typedef struct packed {
  bit [255:0] data;
  bit [0:0] mask;
} DMA_READ_RSP_struct;
`endif

`ifndef SV_STRUCT_DEFINED_nvdla_dma_rd_rsp
`define SV_STRUCT_DEFINED_nvdla_dma_rd_rsp
typedef enum {
  nvdla_dma_rd_rsp_PKT_DMA_READ_RSP,
  nvdla_dma_rd_rsp_PKT_INVALID
} nvdla_dma_rd_rsp_packets;
typedef struct packed {
  struct packed {
    bit [0:0] tag;
    union packed {
      struct packed { DMA_READ_RSP_struct pkt; } DMA_READ_RSP;
    } payload;
  } pd;
} nvdla_dma_rd_rsp_struct;
`endif

`endif // !defined(INC_nvdla_dma_rd_rsp_structs_SVH)