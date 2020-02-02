`ifdef INC_nvdla_dma_rd_req_structs_SVH
`else
`define INC_nvdla_dma_rd_req_structs_SVH

`ifndef SV_STRUCT_DEFINED_DMA_READ_REQ
`define SV_STRUCT_DEFINED_DMA_READ_REQ
typedef struct packed {
  bit [63:0] addr;
  bit [14:0] size;
} DMA_READ_REQ_struct;
`endif

`ifndef SV_STRUCT_DEFINED_nvdla_dma_rd_req
`define SV_STRUCT_DEFINED_nvdla_dma_rd_req
typedef enum {
  nvdla_dma_rd_req_PKT_DMA_READ_REQ,
  nvdla_dma_rd_req_PKT_INVALID
} nvdla_dma_rd_req_packets;
typedef struct packed {
  struct packed {
    bit [0:0] tag;
    union packed {
      struct packed { DMA_READ_REQ_struct pkt; } DMA_READ_REQ;
    } payload;
  } pd;
} nvdla_dma_rd_req_struct;
`endif

`endif // !defined(INC_nvdla_dma_rd_req_structs_SVH)