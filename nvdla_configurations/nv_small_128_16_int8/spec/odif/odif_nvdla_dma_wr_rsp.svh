`ifdef INC_nvdla_dma_wr_rsp_structs_SVH
`else
`define INC_nvdla_dma_wr_rsp_structs_SVH

`ifndef SV_STRUCT_DEFINED_nvdla_dma_wr_rsp
`define SV_STRUCT_DEFINED_nvdla_dma_wr_rsp
typedef struct packed {
  bit [0:0] complete;
} nvdla_dma_wr_rsp_struct;
`endif

`endif // !defined(INC_nvdla_dma_wr_rsp_structs_SVH)