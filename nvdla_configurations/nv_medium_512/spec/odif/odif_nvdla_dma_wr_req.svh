`ifdef INC_nvdla_dma_wr_req_structs_SVH
`else
`define INC_nvdla_dma_wr_req_structs_SVH

`ifndef SV_STRUCT_DEFINED_DMA_WR_REQ
`define SV_STRUCT_DEFINED_DMA_WR_REQ
typedef struct packed {
  bit [63:0] addr;
  bit [12:0] size;
} DMA_WR_REQ_struct;
`endif

`ifndef SV_STRUCT_DEFINED_DMA_WR_DATA
`define SV_STRUCT_DEFINED_DMA_WR_DATA
typedef struct packed {
  bit [127:0] data;
  bit [0:0] mask;
} DMA_WR_DATA_struct;
`endif

`ifndef SV_STRUCT_DEFINED_nvdla_dma_wr_req
`define SV_STRUCT_DEFINED_nvdla_dma_wr_req
typedef enum {
  nvdla_dma_wr_req_PKT_DMA_WR_REQ,
  nvdla_dma_wr_req_PKT_DMA_WR_DATA,
  nvdla_dma_wr_req_PKT_INVALID
} nvdla_dma_wr_req_packets;
typedef struct packed {
  struct packed {
    bit [0:0] tag;
    union packed {
      struct packed { bit [51:0] pad; DMA_WR_REQ_struct pkt; } DMA_WR_REQ;
      struct packed { DMA_WR_DATA_struct pkt; } DMA_WR_DATA;
    } payload;
  } pd;
} nvdla_dma_wr_req_struct;
`endif

`endif // !defined(INC_nvdla_dma_wr_req_structs_SVH)